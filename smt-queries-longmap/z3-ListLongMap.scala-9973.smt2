; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117734 () Bool)

(assert start!117734)

(declare-fun res!922766 () Bool)

(declare-fun e!782808 () Bool)

(assert (=> start!117734 (=> (not res!922766) (not e!782808))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94170 0))(
  ( (array!94171 (arr!45475 (Array (_ BitVec 32) (_ BitVec 64))) (size!46027 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94170)

(assert (=> start!117734 (= res!922766 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46027 a!3464)) (bvslt (size!46027 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117734 e!782808))

(assert (=> start!117734 true))

(declare-fun array_inv!34708 (array!94170) Bool)

(assert (=> start!117734 (array_inv!34708 a!3464)))

(declare-fun b!1381022 () Bool)

(declare-fun res!922765 () Bool)

(assert (=> b!1381022 (=> (not res!922765) (not e!782808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381022 (= res!922765 (validKeyInArray!0 (select (arr!45475 a!3464) from!2839)))))

(declare-fun b!1381023 () Bool)

(declare-fun lt!607967 () (_ BitVec 32))

(assert (=> b!1381023 (= e!782808 (or (bvslt lt!607967 #b00000000000000000000000000000000) (bvsgt lt!607967 (bvsub (size!46027 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94170 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381023 (= lt!607967 (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94)))))

(assert (= (and start!117734 res!922766) b!1381022))

(assert (= (and b!1381022 res!922765) b!1381023))

(declare-fun m!1265823 () Bool)

(assert (=> start!117734 m!1265823))

(declare-fun m!1265825 () Bool)

(assert (=> b!1381022 m!1265825))

(assert (=> b!1381022 m!1265825))

(declare-fun m!1265827 () Bool)

(assert (=> b!1381022 m!1265827))

(declare-fun m!1265829 () Bool)

(assert (=> b!1381023 m!1265829))

(check-sat (not b!1381022) (not b!1381023) (not start!117734))
(check-sat)
(get-model)

(declare-fun d!148863 () Bool)

(assert (=> d!148863 (= (validKeyInArray!0 (select (arr!45475 a!3464) from!2839)) (and (not (= (select (arr!45475 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45475 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381022 d!148863))

(declare-fun b!1381044 () Bool)

(declare-fun e!782826 () (_ BitVec 32))

(declare-fun call!66483 () (_ BitVec 32))

(assert (=> b!1381044 (= e!782826 call!66483)))

(declare-fun b!1381045 () Bool)

(declare-fun e!782827 () (_ BitVec 32))

(assert (=> b!1381045 (= e!782827 #b00000000000000000000000000000000)))

(declare-fun b!1381046 () Bool)

(assert (=> b!1381046 (= e!782826 (bvadd #b00000000000000000000000000000001 call!66483))))

(declare-fun bm!66480 () Bool)

(assert (=> bm!66480 (= call!66483 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(declare-fun d!148865 () Bool)

(declare-fun lt!607976 () (_ BitVec 32))

(assert (=> d!148865 (and (bvsge lt!607976 #b00000000000000000000000000000000) (bvsle lt!607976 (bvsub (size!46027 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(assert (=> d!148865 (= lt!607976 e!782827)))

(declare-fun c!128576 () Bool)

(assert (=> d!148865 (= c!128576 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!148865 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46027 a!3464)))))

(assert (=> d!148865 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!607976)))

(declare-fun b!1381047 () Bool)

(assert (=> b!1381047 (= e!782827 e!782826)))

(declare-fun c!128575 () Bool)

(assert (=> b!1381047 (= c!128575 (validKeyInArray!0 (select (arr!45475 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(assert (= (and d!148865 c!128576) b!1381045))

(assert (= (and d!148865 (not c!128576)) b!1381047))

(assert (= (and b!1381047 c!128575) b!1381046))

(assert (= (and b!1381047 (not c!128575)) b!1381044))

(assert (= (or b!1381046 b!1381044) bm!66480))

(declare-fun m!1265847 () Bool)

(assert (=> bm!66480 m!1265847))

(declare-fun m!1265849 () Bool)

(assert (=> b!1381047 m!1265849))

(assert (=> b!1381047 m!1265849))

(declare-fun m!1265851 () Bool)

(assert (=> b!1381047 m!1265851))

(assert (=> b!1381023 d!148865))

(declare-fun d!148871 () Bool)

(assert (=> d!148871 (= (array_inv!34708 a!3464) (bvsge (size!46027 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117734 d!148871))

(check-sat (not b!1381047) (not bm!66480))
(check-sat)
