; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104188 () Bool)

(assert start!104188)

(declare-fun b!1245580 () Bool)

(declare-datatypes ((Unit!41324 0))(
  ( (Unit!41325) )
))
(declare-fun e!706111 () Unit!41324)

(declare-fun Unit!41326 () Unit!41324)

(assert (=> b!1245580 (= e!706111 Unit!41326)))

(declare-fun b!1245581 () Bool)

(declare-fun res!830492 () Bool)

(declare-fun e!706110 () Bool)

(assert (=> b!1245581 (=> (not res!830492) (not e!706110))))

(declare-datatypes ((array!80079 0))(
  ( (array!80080 (arr!38627 (Array (_ BitVec 32) (_ BitVec 64))) (size!39164 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80079)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245581 (= res!830492 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39164 a!3892)) (not (= newFrom!287 (size!39164 a!3892)))))))

(declare-fun res!830491 () Bool)

(assert (=> start!104188 (=> (not res!830491) (not e!706110))))

(assert (=> start!104188 (= res!830491 (and (bvslt (size!39164 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39164 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39164 a!3892))))))

(assert (=> start!104188 e!706110))

(declare-fun array_inv!29565 (array!80079) Bool)

(assert (=> start!104188 (array_inv!29565 a!3892)))

(assert (=> start!104188 true))

(declare-fun b!1245582 () Bool)

(declare-fun lt!563150 () Unit!41324)

(assert (=> b!1245582 (= e!706111 lt!563150)))

(declare-datatypes ((List!27443 0))(
  ( (Nil!27440) (Cons!27439 (h!28657 (_ BitVec 64)) (t!40904 List!27443)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80079 List!27443 List!27443 (_ BitVec 32)) Unit!41324)

(assert (=> b!1245582 (= lt!563150 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27439 (select (arr!38627 a!3892) from!3270) Nil!27440) Nil!27440 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80079 (_ BitVec 32) List!27443) Bool)

(assert (=> b!1245582 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27440)))

(declare-fun b!1245583 () Bool)

(declare-fun e!706109 () Bool)

(assert (=> b!1245583 (= e!706110 e!706109)))

(declare-fun res!830493 () Bool)

(assert (=> b!1245583 (=> (not res!830493) (not e!706109))))

(assert (=> b!1245583 (= res!830493 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563148 () Unit!41324)

(assert (=> b!1245583 (= lt!563148 e!706111)))

(declare-fun c!122237 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245583 (= c!122237 (validKeyInArray!0 (select (arr!38627 a!3892) from!3270)))))

(declare-fun b!1245584 () Bool)

(assert (=> b!1245584 (= e!706109 false)))

(declare-fun lt!563149 () Bool)

(assert (=> b!1245584 (= lt!563149 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27440))))

(declare-fun b!1245585 () Bool)

(declare-fun res!830490 () Bool)

(assert (=> b!1245585 (=> (not res!830490) (not e!706110))))

(assert (=> b!1245585 (= res!830490 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27440))))

(assert (= (and start!104188 res!830491) b!1245585))

(assert (= (and b!1245585 res!830490) b!1245581))

(assert (= (and b!1245581 res!830492) b!1245583))

(assert (= (and b!1245583 c!122237) b!1245582))

(assert (= (and b!1245583 (not c!122237)) b!1245580))

(assert (= (and b!1245583 res!830493) b!1245584))

(declare-fun m!1148227 () Bool)

(assert (=> b!1245583 m!1148227))

(assert (=> b!1245583 m!1148227))

(declare-fun m!1148229 () Bool)

(assert (=> b!1245583 m!1148229))

(declare-fun m!1148231 () Bool)

(assert (=> b!1245584 m!1148231))

(declare-fun m!1148233 () Bool)

(assert (=> b!1245585 m!1148233))

(declare-fun m!1148235 () Bool)

(assert (=> start!104188 m!1148235))

(assert (=> b!1245582 m!1148227))

(declare-fun m!1148237 () Bool)

(assert (=> b!1245582 m!1148237))

(assert (=> b!1245582 m!1148231))

(check-sat (not start!104188) (not b!1245582) (not b!1245584) (not b!1245585) (not b!1245583))
(check-sat)
