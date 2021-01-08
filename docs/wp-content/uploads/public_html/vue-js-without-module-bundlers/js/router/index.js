// const pageEx = { template: '<div>Ex</div>' }

const routes = [
    { path: '/', component: httpVueLoader('./js/views/Home.vue') },
    { path: '/foo1', component: httpVueLoader('./js/views/Foo.vue') },
    { path: '/bar1', component: httpVueLoader('./js/views/Bar.vue') },
    { path: '*', component: httpVueLoader('./js/views/404.vue') }
]

const router = new VueRouter({
    // mode: 'history',
    routes: routes
})

export default router