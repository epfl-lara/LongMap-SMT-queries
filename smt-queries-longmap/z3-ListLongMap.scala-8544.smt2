; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104216 () Bool)

(assert start!104216)

(declare-fun res!830802 () Bool)

(declare-fun e!706100 () Bool)

(assert (=> start!104216 (=> (not res!830802) (not e!706100))))

(declare-datatypes ((array!80090 0))(
  ( (array!80091 (arr!38630 (Array (_ BitVec 32) (_ BitVec 64))) (size!39168 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80090)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104216 (= res!830802 (and (bvslt (size!39168 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39168 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39168 a!3892))))))

(assert (=> start!104216 e!706100))

(declare-fun array_inv!29613 (array!80090) Bool)

(assert (=> start!104216 (array_inv!29613 a!3892)))

(assert (=> start!104216 true))

(declare-fun b!1245274 () Bool)

(declare-fun res!830800 () Bool)

(assert (=> b!1245274 (=> (not res!830800) (not e!706100))))

(declare-datatypes ((List!27534 0))(
  ( (Nil!27531) (Cons!27530 (h!28739 (_ BitVec 64)) (t!40994 List!27534)) )
))
(declare-fun arrayNoDuplicates!0 (array!80090 (_ BitVec 32) List!27534) Bool)

(assert (=> b!1245274 (= res!830800 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27531))))

(declare-fun b!1245275 () Bool)

(declare-fun res!830799 () Bool)

(assert (=> b!1245275 (=> (not res!830799) (not e!706100))))

(assert (=> b!1245275 (= res!830799 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39168 a!3892)) (not (= newFrom!287 (size!39168 a!3892)))))))

(declare-fun b!1245276 () Bool)

(declare-fun res!830801 () Bool)

(assert (=> b!1245276 (=> (not res!830801) (not e!706100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245276 (= res!830801 (validKeyInArray!0 (select (arr!38630 a!3892) from!3270)))))

(declare-fun b!1245277 () Bool)

(assert (=> b!1245277 (= e!706100 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (= (and start!104216 res!830802) b!1245274))

(assert (= (and b!1245274 res!830800) b!1245275))

(assert (= (and b!1245275 res!830799) b!1245276))

(assert (= (and b!1245276 res!830801) b!1245277))

(declare-fun m!1146915 () Bool)

(assert (=> start!104216 m!1146915))

(declare-fun m!1146917 () Bool)

(assert (=> b!1245274 m!1146917))

(declare-fun m!1146919 () Bool)

(assert (=> b!1245276 m!1146919))

(assert (=> b!1245276 m!1146919))

(declare-fun m!1146921 () Bool)

(assert (=> b!1245276 m!1146921))

(check-sat (not b!1245274) (not start!104216) (not b!1245276))
(check-sat)
