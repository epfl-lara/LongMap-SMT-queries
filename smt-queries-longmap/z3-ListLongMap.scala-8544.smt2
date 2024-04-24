; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104452 () Bool)

(assert start!104452)

(declare-fun b!1246670 () Bool)

(declare-fun res!831363 () Bool)

(declare-fun e!706999 () Bool)

(assert (=> b!1246670 (=> (not res!831363) (not e!706999))))

(declare-datatypes ((array!80203 0))(
  ( (array!80204 (arr!38681 (Array (_ BitVec 32) (_ BitVec 64))) (size!39218 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80203)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1246670 (= res!831363 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39218 a!3892)) (not (= newFrom!287 (size!39218 a!3892)))))))

(declare-fun res!831366 () Bool)

(assert (=> start!104452 (=> (not res!831366) (not e!706999))))

(assert (=> start!104452 (= res!831366 (and (bvslt (size!39218 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39218 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39218 a!3892))))))

(assert (=> start!104452 e!706999))

(declare-fun array_inv!29619 (array!80203) Bool)

(assert (=> start!104452 (array_inv!29619 a!3892)))

(assert (=> start!104452 true))

(declare-fun b!1246671 () Bool)

(declare-fun res!831364 () Bool)

(assert (=> b!1246671 (=> (not res!831364) (not e!706999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246671 (= res!831364 (validKeyInArray!0 (select (arr!38681 a!3892) from!3270)))))

(declare-fun b!1246669 () Bool)

(declare-fun res!831365 () Bool)

(assert (=> b!1246669 (=> (not res!831365) (not e!706999))))

(declare-datatypes ((List!27497 0))(
  ( (Nil!27494) (Cons!27493 (h!28711 (_ BitVec 64)) (t!40958 List!27497)) )
))
(declare-fun arrayNoDuplicates!0 (array!80203 (_ BitVec 32) List!27497) Bool)

(assert (=> b!1246669 (= res!831365 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27494))))

(declare-fun b!1246672 () Bool)

(assert (=> b!1246672 (= e!706999 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (= (and start!104452 res!831366) b!1246669))

(assert (= (and b!1246669 res!831365) b!1246670))

(assert (= (and b!1246670 res!831363) b!1246671))

(assert (= (and b!1246671 res!831364) b!1246672))

(declare-fun m!1149061 () Bool)

(assert (=> start!104452 m!1149061))

(declare-fun m!1149063 () Bool)

(assert (=> b!1246671 m!1149063))

(assert (=> b!1246671 m!1149063))

(declare-fun m!1149065 () Bool)

(assert (=> b!1246671 m!1149065))

(declare-fun m!1149067 () Bool)

(assert (=> b!1246669 m!1149067))

(check-sat (not start!104452) (not b!1246669) (not b!1246671))
(check-sat)
