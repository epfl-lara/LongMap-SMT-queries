; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104718 () Bool)

(assert start!104718)

(declare-fun b!1248075 () Bool)

(declare-fun res!832519 () Bool)

(declare-fun e!707976 () Bool)

(assert (=> b!1248075 (=> (not res!832519) (not e!707976))))

(declare-datatypes ((array!80298 0))(
  ( (array!80299 (arr!38720 (Array (_ BitVec 32) (_ BitVec 64))) (size!39257 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80298)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27536 0))(
  ( (Nil!27533) (Cons!27532 (h!28750 (_ BitVec 64)) (t!40997 List!27536)) )
))
(declare-fun arrayNoDuplicates!0 (array!80298 (_ BitVec 32) List!27536) Bool)

(assert (=> b!1248075 (= res!832519 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27533))))

(declare-fun b!1248076 () Bool)

(declare-datatypes ((Unit!41429 0))(
  ( (Unit!41430) )
))
(declare-fun e!707975 () Unit!41429)

(declare-fun lt!563672 () Unit!41429)

(assert (=> b!1248076 (= e!707975 lt!563672)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80298 List!27536 List!27536 (_ BitVec 32)) Unit!41429)

(assert (=> b!1248076 (= lt!563672 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27532 (select (arr!38720 a!3892) from!3270) Nil!27533) Nil!27533 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1248076 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27533)))

(declare-fun res!832521 () Bool)

(declare-fun e!707973 () Bool)

(assert (=> start!104718 (=> (not res!832521) (not e!707973))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104718 (= res!832521 (and (bvslt (size!39257 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39257 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39257 a!3892))))))

(assert (=> start!104718 e!707973))

(declare-fun array_inv!29658 (array!80298) Bool)

(assert (=> start!104718 (array_inv!29658 a!3892)))

(assert (=> start!104718 true))

(declare-fun b!1248077 () Bool)

(assert (=> b!1248077 (= e!707976 (not true))))

(assert (=> b!1248077 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27533)))

(declare-fun lt!563674 () Unit!41429)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80298 (_ BitVec 32) (_ BitVec 32)) Unit!41429)

(assert (=> b!1248077 (= lt!563674 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1248078 () Bool)

(declare-fun res!832522 () Bool)

(assert (=> b!1248078 (=> (not res!832522) (not e!707973))))

(assert (=> b!1248078 (= res!832522 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27533))))

(declare-fun b!1248079 () Bool)

(declare-fun res!832520 () Bool)

(assert (=> b!1248079 (=> (not res!832520) (not e!707973))))

(assert (=> b!1248079 (= res!832520 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39257 a!3892)) (not (= newFrom!287 (size!39257 a!3892)))))))

(declare-fun b!1248080 () Bool)

(declare-fun Unit!41431 () Unit!41429)

(assert (=> b!1248080 (= e!707975 Unit!41431)))

(declare-fun b!1248081 () Bool)

(assert (=> b!1248081 (= e!707973 e!707976)))

(declare-fun res!832523 () Bool)

(assert (=> b!1248081 (=> (not res!832523) (not e!707976))))

(assert (=> b!1248081 (= res!832523 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563673 () Unit!41429)

(assert (=> b!1248081 (= lt!563673 e!707975)))

(declare-fun c!122470 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248081 (= c!122470 (validKeyInArray!0 (select (arr!38720 a!3892) from!3270)))))

(assert (= (and start!104718 res!832521) b!1248078))

(assert (= (and b!1248078 res!832522) b!1248079))

(assert (= (and b!1248079 res!832520) b!1248081))

(assert (= (and b!1248081 c!122470) b!1248076))

(assert (= (and b!1248081 (not c!122470)) b!1248080))

(assert (= (and b!1248081 res!832523) b!1248075))

(assert (= (and b!1248075 res!832519) b!1248077))

(declare-fun m!1150119 () Bool)

(assert (=> b!1248075 m!1150119))

(declare-fun m!1150121 () Bool)

(assert (=> b!1248081 m!1150121))

(assert (=> b!1248081 m!1150121))

(declare-fun m!1150123 () Bool)

(assert (=> b!1248081 m!1150123))

(declare-fun m!1150125 () Bool)

(assert (=> start!104718 m!1150125))

(assert (=> b!1248076 m!1150121))

(declare-fun m!1150127 () Bool)

(assert (=> b!1248076 m!1150127))

(assert (=> b!1248076 m!1150119))

(declare-fun m!1150129 () Bool)

(assert (=> b!1248077 m!1150129))

(declare-fun m!1150131 () Bool)

(assert (=> b!1248077 m!1150131))

(declare-fun m!1150133 () Bool)

(assert (=> b!1248078 m!1150133))

(check-sat (not b!1248076) (not b!1248078) (not b!1248081) (not start!104718) (not b!1248077) (not b!1248075))
(check-sat)
