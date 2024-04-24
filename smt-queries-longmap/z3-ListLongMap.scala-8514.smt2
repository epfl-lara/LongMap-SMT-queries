; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104116 () Bool)

(assert start!104116)

(declare-fun res!829568 () Bool)

(declare-fun e!705749 () Bool)

(assert (=> start!104116 (=> (not res!829568) (not e!705749))))

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((array!80007 0))(
  ( (array!80008 (arr!38591 (Array (_ BitVec 32) (_ BitVec 64))) (size!39128 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80007)

(assert (=> start!104116 (= res!829568 (and (bvslt (size!39128 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39128 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39128 a!3892))))))

(assert (=> start!104116 e!705749))

(declare-fun array_inv!29529 (array!80007) Bool)

(assert (=> start!104116 (array_inv!29529 a!3892)))

(assert (=> start!104116 true))

(declare-fun b!1244582 () Bool)

(declare-fun res!829574 () Bool)

(declare-fun e!705748 () Bool)

(assert (=> b!1244582 (=> (not res!829574) (not e!705748))))

(declare-datatypes ((List!27407 0))(
  ( (Nil!27404) (Cons!27403 (h!28621 (_ BitVec 64)) (t!40868 List!27407)) )
))
(declare-fun lt!562825 () List!27407)

(declare-fun contains!7437 (List!27407 (_ BitVec 64)) Bool)

(assert (=> b!1244582 (= res!829574 (not (contains!7437 lt!562825 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244583 () Bool)

(declare-fun res!829571 () Bool)

(assert (=> b!1244583 (=> (not res!829571) (not e!705748))))

(declare-fun noDuplicate!1999 (List!27407) Bool)

(assert (=> b!1244583 (= res!829571 (noDuplicate!1999 lt!562825))))

(declare-fun b!1244584 () Bool)

(declare-fun res!829572 () Bool)

(assert (=> b!1244584 (=> (not res!829572) (not e!705748))))

(assert (=> b!1244584 (= res!829572 (not (contains!7437 Nil!27404 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244585 () Bool)

(declare-fun res!829575 () Bool)

(assert (=> b!1244585 (=> (not res!829575) (not e!705748))))

(assert (=> b!1244585 (= res!829575 (not (contains!7437 Nil!27404 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244586 () Bool)

(assert (=> b!1244586 (= e!705749 e!705748)))

(declare-fun res!829569 () Bool)

(assert (=> b!1244586 (=> (not res!829569) (not e!705748))))

(assert (=> b!1244586 (= res!829569 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1244586 (= lt!562825 (Cons!27403 (select (arr!38591 a!3892) from!3270) Nil!27404))))

(declare-fun b!1244587 () Bool)

(declare-fun res!829576 () Bool)

(assert (=> b!1244587 (=> (not res!829576) (not e!705748))))

(declare-fun subseq!629 (List!27407 List!27407) Bool)

(assert (=> b!1244587 (= res!829576 (subseq!629 Nil!27404 lt!562825))))

(declare-fun b!1244588 () Bool)

(declare-fun res!829578 () Bool)

(assert (=> b!1244588 (=> (not res!829578) (not e!705749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244588 (= res!829578 (validKeyInArray!0 (select (arr!38591 a!3892) from!3270)))))

(declare-fun b!1244589 () Bool)

(declare-fun res!829577 () Bool)

(assert (=> b!1244589 (=> (not res!829577) (not e!705748))))

(assert (=> b!1244589 (= res!829577 (not (contains!7437 lt!562825 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244590 () Bool)

(assert (=> b!1244590 (= e!705748 false)))

(declare-fun lt!562826 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80007 (_ BitVec 32) List!27407) Bool)

(assert (=> b!1244590 (= lt!562826 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562825))))

(declare-datatypes ((Unit!41240 0))(
  ( (Unit!41241) )
))
(declare-fun lt!562824 () Unit!41240)

(declare-fun noDuplicateSubseq!83 (List!27407 List!27407) Unit!41240)

(assert (=> b!1244590 (= lt!562824 (noDuplicateSubseq!83 Nil!27404 lt!562825))))

(declare-fun b!1244591 () Bool)

(declare-fun res!829570 () Bool)

(assert (=> b!1244591 (=> (not res!829570) (not e!705749))))

(assert (=> b!1244591 (= res!829570 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39128 a!3892)) (not (= newFrom!287 (size!39128 a!3892)))))))

(declare-fun b!1244592 () Bool)

(declare-fun res!829573 () Bool)

(assert (=> b!1244592 (=> (not res!829573) (not e!705749))))

(assert (=> b!1244592 (= res!829573 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27404))))

(assert (= (and start!104116 res!829568) b!1244592))

(assert (= (and b!1244592 res!829573) b!1244591))

(assert (= (and b!1244591 res!829570) b!1244588))

(assert (= (and b!1244588 res!829578) b!1244586))

(assert (= (and b!1244586 res!829569) b!1244583))

(assert (= (and b!1244583 res!829571) b!1244582))

(assert (= (and b!1244582 res!829574) b!1244589))

(assert (= (and b!1244589 res!829577) b!1244585))

(assert (= (and b!1244585 res!829575) b!1244584))

(assert (= (and b!1244584 res!829572) b!1244587))

(assert (= (and b!1244587 res!829576) b!1244590))

(declare-fun m!1147507 () Bool)

(assert (=> b!1244588 m!1147507))

(assert (=> b!1244588 m!1147507))

(declare-fun m!1147509 () Bool)

(assert (=> b!1244588 m!1147509))

(declare-fun m!1147511 () Bool)

(assert (=> b!1244590 m!1147511))

(declare-fun m!1147513 () Bool)

(assert (=> b!1244590 m!1147513))

(declare-fun m!1147515 () Bool)

(assert (=> start!104116 m!1147515))

(declare-fun m!1147517 () Bool)

(assert (=> b!1244585 m!1147517))

(declare-fun m!1147519 () Bool)

(assert (=> b!1244582 m!1147519))

(declare-fun m!1147521 () Bool)

(assert (=> b!1244583 m!1147521))

(declare-fun m!1147523 () Bool)

(assert (=> b!1244592 m!1147523))

(declare-fun m!1147525 () Bool)

(assert (=> b!1244589 m!1147525))

(assert (=> b!1244586 m!1147507))

(declare-fun m!1147527 () Bool)

(assert (=> b!1244584 m!1147527))

(declare-fun m!1147529 () Bool)

(assert (=> b!1244587 m!1147529))

(check-sat (not b!1244584) (not b!1244588) (not b!1244590) (not b!1244583) (not b!1244587) (not b!1244582) (not b!1244589) (not start!104116) (not b!1244585) (not b!1244592))
(check-sat)
