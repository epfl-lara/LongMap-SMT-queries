; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115030 () Bool)

(assert start!115030)

(declare-fun b!1362443 () Bool)

(declare-fun e!773082 () Bool)

(declare-fun e!773086 () Bool)

(assert (=> b!1362443 (= e!773082 e!773086)))

(declare-fun res!905842 () Bool)

(assert (=> b!1362443 (=> (not res!905842) (not e!773086))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!600558 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362443 (= res!905842 (and (not (= from!3120 i!1404)) lt!600558))))

(declare-datatypes ((Unit!44795 0))(
  ( (Unit!44796) )
))
(declare-fun lt!600553 () Unit!44795)

(declare-fun e!773085 () Unit!44795)

(assert (=> b!1362443 (= lt!600553 e!773085)))

(declare-fun c!127750 () Bool)

(assert (=> b!1362443 (= c!127750 lt!600558)))

(declare-datatypes ((array!92707 0))(
  ( (array!92708 (arr!44785 (Array (_ BitVec 32) (_ BitVec 64))) (size!45336 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92707)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362443 (= lt!600558 (validKeyInArray!0 (select (arr!44785 a!3742) from!3120)))))

(declare-fun b!1362444 () Bool)

(declare-fun res!905841 () Bool)

(declare-fun e!773083 () Bool)

(assert (=> b!1362444 (=> (not res!905841) (not e!773083))))

(declare-datatypes ((List!31813 0))(
  ( (Nil!31810) (Cons!31809 (h!33027 (_ BitVec 64)) (t!46487 List!31813)) )
))
(declare-fun lt!600554 () List!31813)

(declare-fun contains!9525 (List!31813 (_ BitVec 64)) Bool)

(assert (=> b!1362444 (= res!905841 (not (contains!9525 lt!600554 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362445 () Bool)

(declare-fun res!905838 () Bool)

(assert (=> b!1362445 (=> (not res!905838) (not e!773082))))

(assert (=> b!1362445 (= res!905838 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45336 a!3742)))))

(declare-fun b!1362446 () Bool)

(assert (=> b!1362446 (= e!773083 false)))

(declare-fun lt!600557 () Bool)

(assert (=> b!1362446 (= lt!600557 (contains!9525 lt!600554 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362447 () Bool)

(declare-fun lt!600555 () Unit!44795)

(assert (=> b!1362447 (= e!773085 lt!600555)))

(declare-fun lt!600556 () Unit!44795)

(declare-fun acc!759 () List!31813)

(declare-fun lemmaListSubSeqRefl!0 (List!31813) Unit!44795)

(assert (=> b!1362447 (= lt!600556 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!884 (List!31813 List!31813) Bool)

(assert (=> b!1362447 (subseq!884 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92707 List!31813 List!31813 (_ BitVec 32)) Unit!44795)

(declare-fun $colon$colon!886 (List!31813 (_ BitVec 64)) List!31813)

(assert (=> b!1362447 (= lt!600555 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!886 acc!759 (select (arr!44785 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92707 (_ BitVec 32) List!31813) Bool)

(assert (=> b!1362447 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!905840 () Bool)

(assert (=> start!115030 (=> (not res!905840) (not e!773082))))

(assert (=> start!115030 (= res!905840 (and (bvslt (size!45336 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45336 a!3742))))))

(assert (=> start!115030 e!773082))

(assert (=> start!115030 true))

(declare-fun array_inv!34066 (array!92707) Bool)

(assert (=> start!115030 (array_inv!34066 a!3742)))

(declare-fun b!1362448 () Bool)

(declare-fun res!905849 () Bool)

(assert (=> b!1362448 (=> (not res!905849) (not e!773082))))

(assert (=> b!1362448 (= res!905849 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31810))))

(declare-fun b!1362449 () Bool)

(declare-fun res!905844 () Bool)

(assert (=> b!1362449 (=> (not res!905844) (not e!773082))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362449 (= res!905844 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362450 () Bool)

(declare-fun res!905848 () Bool)

(assert (=> b!1362450 (=> (not res!905848) (not e!773083))))

(declare-fun noDuplicate!2356 (List!31813) Bool)

(assert (=> b!1362450 (= res!905848 (noDuplicate!2356 lt!600554))))

(declare-fun b!1362451 () Bool)

(declare-fun res!905843 () Bool)

(assert (=> b!1362451 (=> (not res!905843) (not e!773082))))

(assert (=> b!1362451 (= res!905843 (noDuplicate!2356 acc!759))))

(declare-fun b!1362452 () Bool)

(declare-fun Unit!44797 () Unit!44795)

(assert (=> b!1362452 (= e!773085 Unit!44797)))

(declare-fun b!1362453 () Bool)

(declare-fun res!905850 () Bool)

(assert (=> b!1362453 (=> (not res!905850) (not e!773082))))

(assert (=> b!1362453 (= res!905850 (not (contains!9525 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362454 () Bool)

(assert (=> b!1362454 (= e!773086 e!773083)))

(declare-fun res!905845 () Bool)

(assert (=> b!1362454 (=> (not res!905845) (not e!773083))))

(assert (=> b!1362454 (= res!905845 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1362454 (= lt!600554 ($colon$colon!886 acc!759 (select (arr!44785 a!3742) from!3120)))))

(declare-fun b!1362455 () Bool)

(declare-fun res!905846 () Bool)

(assert (=> b!1362455 (=> (not res!905846) (not e!773082))))

(assert (=> b!1362455 (= res!905846 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362456 () Bool)

(declare-fun res!905839 () Bool)

(assert (=> b!1362456 (=> (not res!905839) (not e!773082))))

(assert (=> b!1362456 (= res!905839 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45336 a!3742))))))

(declare-fun b!1362457 () Bool)

(declare-fun res!905847 () Bool)

(assert (=> b!1362457 (=> (not res!905847) (not e!773082))))

(assert (=> b!1362457 (= res!905847 (not (contains!9525 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115030 res!905840) b!1362451))

(assert (= (and b!1362451 res!905843) b!1362457))

(assert (= (and b!1362457 res!905847) b!1362453))

(assert (= (and b!1362453 res!905850) b!1362448))

(assert (= (and b!1362448 res!905849) b!1362455))

(assert (= (and b!1362455 res!905846) b!1362456))

(assert (= (and b!1362456 res!905839) b!1362449))

(assert (= (and b!1362449 res!905844) b!1362445))

(assert (= (and b!1362445 res!905838) b!1362443))

(assert (= (and b!1362443 c!127750) b!1362447))

(assert (= (and b!1362443 (not c!127750)) b!1362452))

(assert (= (and b!1362443 res!905842) b!1362454))

(assert (= (and b!1362454 res!905845) b!1362450))

(assert (= (and b!1362450 res!905848) b!1362444))

(assert (= (and b!1362444 res!905841) b!1362446))

(declare-fun m!1247911 () Bool)

(assert (=> b!1362457 m!1247911))

(declare-fun m!1247913 () Bool)

(assert (=> b!1362453 m!1247913))

(declare-fun m!1247915 () Bool)

(assert (=> b!1362454 m!1247915))

(assert (=> b!1362454 m!1247915))

(declare-fun m!1247917 () Bool)

(assert (=> b!1362454 m!1247917))

(declare-fun m!1247919 () Bool)

(assert (=> start!115030 m!1247919))

(declare-fun m!1247921 () Bool)

(assert (=> b!1362455 m!1247921))

(declare-fun m!1247923 () Bool)

(assert (=> b!1362447 m!1247923))

(assert (=> b!1362447 m!1247915))

(assert (=> b!1362447 m!1247917))

(declare-fun m!1247925 () Bool)

(assert (=> b!1362447 m!1247925))

(declare-fun m!1247927 () Bool)

(assert (=> b!1362447 m!1247927))

(assert (=> b!1362447 m!1247915))

(assert (=> b!1362447 m!1247917))

(declare-fun m!1247929 () Bool)

(assert (=> b!1362447 m!1247929))

(declare-fun m!1247931 () Bool)

(assert (=> b!1362449 m!1247931))

(declare-fun m!1247933 () Bool)

(assert (=> b!1362444 m!1247933))

(declare-fun m!1247935 () Bool)

(assert (=> b!1362448 m!1247935))

(declare-fun m!1247937 () Bool)

(assert (=> b!1362446 m!1247937))

(declare-fun m!1247939 () Bool)

(assert (=> b!1362450 m!1247939))

(declare-fun m!1247941 () Bool)

(assert (=> b!1362451 m!1247941))

(assert (=> b!1362443 m!1247915))

(assert (=> b!1362443 m!1247915))

(declare-fun m!1247943 () Bool)

(assert (=> b!1362443 m!1247943))

(check-sat (not b!1362450) (not b!1362451) (not b!1362448) (not b!1362455) (not b!1362449) (not b!1362446) (not start!115030) (not b!1362443) (not b!1362457) (not b!1362453) (not b!1362454) (not b!1362447) (not b!1362444))
(check-sat)
