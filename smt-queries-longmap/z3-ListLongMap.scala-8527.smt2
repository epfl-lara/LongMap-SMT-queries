; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104194 () Bool)

(assert start!104194)

(declare-fun b!1245636 () Bool)

(declare-fun res!830528 () Bool)

(declare-fun e!706147 () Bool)

(assert (=> b!1245636 (=> (not res!830528) (not e!706147))))

(declare-datatypes ((array!80085 0))(
  ( (array!80086 (arr!38630 (Array (_ BitVec 32) (_ BitVec 64))) (size!39167 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80085)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27446 0))(
  ( (Nil!27443) (Cons!27442 (h!28660 (_ BitVec 64)) (t!40907 List!27446)) )
))
(declare-fun arrayNoDuplicates!0 (array!80085 (_ BitVec 32) List!27446) Bool)

(assert (=> b!1245636 (= res!830528 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27443))))

(declare-fun b!1245637 () Bool)

(declare-datatypes ((Unit!41333 0))(
  ( (Unit!41334) )
))
(declare-fun e!706145 () Unit!41333)

(declare-fun lt!563176 () Unit!41333)

(assert (=> b!1245637 (= e!706145 lt!563176)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80085 List!27446 List!27446 (_ BitVec 32)) Unit!41333)

(assert (=> b!1245637 (= lt!563176 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27442 (select (arr!38630 a!3892) from!3270) Nil!27443) Nil!27443 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1245637 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27443)))

(declare-fun b!1245638 () Bool)

(declare-fun res!830529 () Bool)

(assert (=> b!1245638 (=> (not res!830529) (not e!706147))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245638 (= res!830529 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39167 a!3892)) (not (= newFrom!287 (size!39167 a!3892)))))))

(declare-fun b!1245639 () Bool)

(declare-fun e!706148 () Bool)

(assert (=> b!1245639 (= e!706148 (not (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(assert (=> b!1245639 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27443)))

(declare-fun lt!563175 () Unit!41333)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80085 (_ BitVec 32) (_ BitVec 32)) Unit!41333)

(assert (=> b!1245639 (= lt!563175 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1245640 () Bool)

(declare-fun res!830531 () Bool)

(assert (=> b!1245640 (=> (not res!830531) (not e!706148))))

(assert (=> b!1245640 (= res!830531 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27443))))

(declare-fun b!1245641 () Bool)

(declare-fun Unit!41335 () Unit!41333)

(assert (=> b!1245641 (= e!706145 Unit!41335)))

(declare-fun res!830530 () Bool)

(assert (=> start!104194 (=> (not res!830530) (not e!706147))))

(assert (=> start!104194 (= res!830530 (and (bvslt (size!39167 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39167 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39167 a!3892))))))

(assert (=> start!104194 e!706147))

(declare-fun array_inv!29568 (array!80085) Bool)

(assert (=> start!104194 (array_inv!29568 a!3892)))

(assert (=> start!104194 true))

(declare-fun b!1245642 () Bool)

(assert (=> b!1245642 (= e!706147 e!706148)))

(declare-fun res!830532 () Bool)

(assert (=> b!1245642 (=> (not res!830532) (not e!706148))))

(assert (=> b!1245642 (= res!830532 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563177 () Unit!41333)

(assert (=> b!1245642 (= lt!563177 e!706145)))

(declare-fun c!122246 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245642 (= c!122246 (validKeyInArray!0 (select (arr!38630 a!3892) from!3270)))))

(assert (= (and start!104194 res!830530) b!1245636))

(assert (= (and b!1245636 res!830528) b!1245638))

(assert (= (and b!1245638 res!830529) b!1245642))

(assert (= (and b!1245642 c!122246) b!1245637))

(assert (= (and b!1245642 (not c!122246)) b!1245641))

(assert (= (and b!1245642 res!830532) b!1245640))

(assert (= (and b!1245640 res!830531) b!1245639))

(declare-fun m!1148263 () Bool)

(assert (=> b!1245637 m!1148263))

(declare-fun m!1148265 () Bool)

(assert (=> b!1245637 m!1148265))

(declare-fun m!1148267 () Bool)

(assert (=> b!1245637 m!1148267))

(declare-fun m!1148269 () Bool)

(assert (=> b!1245639 m!1148269))

(declare-fun m!1148271 () Bool)

(assert (=> b!1245639 m!1148271))

(declare-fun m!1148273 () Bool)

(assert (=> b!1245636 m!1148273))

(assert (=> b!1245642 m!1148263))

(assert (=> b!1245642 m!1148263))

(declare-fun m!1148275 () Bool)

(assert (=> b!1245642 m!1148275))

(declare-fun m!1148277 () Bool)

(assert (=> start!104194 m!1148277))

(assert (=> b!1245640 m!1148267))

(check-sat (not b!1245640) (not b!1245636) (not start!104194) (not b!1245637) (not b!1245642) (not b!1245639))
(check-sat)
