; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104490 () Bool)

(assert start!104490)

(declare-fun b!1246688 () Bool)

(declare-datatypes ((Unit!41301 0))(
  ( (Unit!41302) )
))
(declare-fun e!707083 () Unit!41301)

(declare-fun Unit!41303 () Unit!41301)

(assert (=> b!1246688 (= e!707083 Unit!41303)))

(declare-fun b!1246689 () Bool)

(declare-fun e!707082 () Bool)

(assert (=> b!1246689 (= e!707082 (not true))))

(declare-datatypes ((array!80186 0))(
  ( (array!80187 (arr!38669 (Array (_ BitVec 32) (_ BitVec 64))) (size!39207 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80186)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-datatypes ((List!27573 0))(
  ( (Nil!27570) (Cons!27569 (h!28778 (_ BitVec 64)) (t!41033 List!27573)) )
))
(declare-fun arrayNoDuplicates!0 (array!80186 (_ BitVec 32) List!27573) Bool)

(assert (=> b!1246689 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27570)))

(declare-fun lt!563011 () Unit!41301)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80186 (_ BitVec 32) (_ BitVec 32)) Unit!41301)

(assert (=> b!1246689 (= lt!563011 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1246690 () Bool)

(declare-fun res!831961 () Bool)

(declare-fun e!707084 () Bool)

(assert (=> b!1246690 (=> (not res!831961) (not e!707084))))

(assert (=> b!1246690 (= res!831961 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39207 a!3892)) (not (= newFrom!287 (size!39207 a!3892)))))))

(declare-fun b!1246691 () Bool)

(declare-fun res!831960 () Bool)

(assert (=> b!1246691 (=> (not res!831960) (not e!707082))))

(assert (=> b!1246691 (= res!831960 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27570))))

(declare-fun b!1246692 () Bool)

(declare-fun res!831963 () Bool)

(assert (=> b!1246692 (=> (not res!831963) (not e!707084))))

(assert (=> b!1246692 (= res!831963 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27570))))

(declare-fun b!1246694 () Bool)

(declare-fun lt!563010 () Unit!41301)

(assert (=> b!1246694 (= e!707083 lt!563010)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80186 List!27573 List!27573 (_ BitVec 32)) Unit!41301)

(assert (=> b!1246694 (= lt!563010 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27569 (select (arr!38669 a!3892) from!3270) Nil!27570) Nil!27570 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246694 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27570)))

(declare-fun res!831962 () Bool)

(assert (=> start!104490 (=> (not res!831962) (not e!707084))))

(assert (=> start!104490 (= res!831962 (and (bvslt (size!39207 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39207 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39207 a!3892))))))

(assert (=> start!104490 e!707084))

(declare-fun array_inv!29652 (array!80186) Bool)

(assert (=> start!104490 (array_inv!29652 a!3892)))

(assert (=> start!104490 true))

(declare-fun b!1246693 () Bool)

(assert (=> b!1246693 (= e!707084 e!707082)))

(declare-fun res!831959 () Bool)

(assert (=> b!1246693 (=> (not res!831959) (not e!707082))))

(assert (=> b!1246693 (= res!831959 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563009 () Unit!41301)

(assert (=> b!1246693 (= lt!563009 e!707083)))

(declare-fun c!122052 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246693 (= c!122052 (validKeyInArray!0 (select (arr!38669 a!3892) from!3270)))))

(assert (= (and start!104490 res!831962) b!1246692))

(assert (= (and b!1246692 res!831963) b!1246690))

(assert (= (and b!1246690 res!831961) b!1246693))

(assert (= (and b!1246693 c!122052) b!1246694))

(assert (= (and b!1246693 (not c!122052)) b!1246688))

(assert (= (and b!1246693 res!831959) b!1246691))

(assert (= (and b!1246691 res!831960) b!1246689))

(declare-fun m!1147987 () Bool)

(assert (=> b!1246693 m!1147987))

(assert (=> b!1246693 m!1147987))

(declare-fun m!1147989 () Bool)

(assert (=> b!1246693 m!1147989))

(declare-fun m!1147991 () Bool)

(assert (=> b!1246692 m!1147991))

(declare-fun m!1147993 () Bool)

(assert (=> b!1246691 m!1147993))

(assert (=> b!1246694 m!1147987))

(declare-fun m!1147995 () Bool)

(assert (=> b!1246694 m!1147995))

(assert (=> b!1246694 m!1147993))

(declare-fun m!1147997 () Bool)

(assert (=> b!1246689 m!1147997))

(declare-fun m!1147999 () Bool)

(assert (=> b!1246689 m!1147999))

(declare-fun m!1148001 () Bool)

(assert (=> start!104490 m!1148001))

(check-sat (not b!1246692) (not start!104490) (not b!1246694) (not b!1246693) (not b!1246689) (not b!1246691))
(check-sat)
