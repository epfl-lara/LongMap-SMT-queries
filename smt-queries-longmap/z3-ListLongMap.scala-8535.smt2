; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104120 () Bool)

(assert start!104120)

(declare-fun res!830528 () Bool)

(declare-fun e!705797 () Bool)

(assert (=> start!104120 (=> (not res!830528) (not e!705797))))

(declare-datatypes ((array!80030 0))(
  ( (array!80031 (arr!38603 (Array (_ BitVec 32) (_ BitVec 64))) (size!39141 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80030)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104120 (= res!830528 (and (bvslt (size!39141 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39141 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39141 a!3892))))))

(assert (=> start!104120 e!705797))

(declare-fun array_inv!29586 (array!80030) Bool)

(assert (=> start!104120 (array_inv!29586 a!3892)))

(assert (=> start!104120 true))

(declare-fun b!1244967 () Bool)

(declare-fun res!830529 () Bool)

(assert (=> b!1244967 (=> (not res!830529) (not e!705797))))

(declare-datatypes ((List!27507 0))(
  ( (Nil!27504) (Cons!27503 (h!28712 (_ BitVec 64)) (t!40967 List!27507)) )
))
(declare-fun arrayNoDuplicates!0 (array!80030 (_ BitVec 32) List!27507) Bool)

(assert (=> b!1244967 (= res!830529 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27504))))

(declare-fun b!1244968 () Bool)

(assert (=> b!1244968 (= e!705797 (and (= from!3270 newFrom!287) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104120 res!830528) b!1244967))

(assert (= (and b!1244967 res!830529) b!1244968))

(declare-fun m!1146681 () Bool)

(assert (=> start!104120 m!1146681))

(declare-fun m!1146683 () Bool)

(assert (=> b!1244967 m!1146683))

(check-sat (not start!104120) (not b!1244967))
(check-sat)
