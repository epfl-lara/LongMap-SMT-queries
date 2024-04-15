; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118208 () Bool)

(assert start!118208)

(declare-fun b!1382940 () Bool)

(declare-fun e!783855 () Bool)

(declare-datatypes ((array!94464 0))(
  ( (array!94465 (arr!45610 (Array (_ BitVec 32) (_ BitVec 64))) (size!46162 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94464)

(assert (=> b!1382940 (= e!783855 (bvsgt #b00000000000000000000000000000000 (size!46162 a!2938)))))

(declare-fun res!924574 () Bool)

(assert (=> start!118208 (=> (not res!924574) (not e!783855))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118208 (= res!924574 (validMask!0 mask!2987))))

(assert (=> start!118208 e!783855))

(assert (=> start!118208 true))

(declare-fun array_inv!34843 (array!94464) Bool)

(assert (=> start!118208 (array_inv!34843 a!2938)))

(declare-fun b!1382937 () Bool)

(declare-fun res!924572 () Bool)

(assert (=> b!1382937 (=> (not res!924572) (not e!783855))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382937 (= res!924572 (and (= (size!46162 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46162 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46162 a!2938))))))

(declare-fun b!1382938 () Bool)

(declare-fun res!924575 () Bool)

(assert (=> b!1382938 (=> (not res!924575) (not e!783855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382938 (= res!924575 (validKeyInArray!0 (select (arr!45610 a!2938) i!1065)))))

(declare-fun b!1382939 () Bool)

(declare-fun res!924573 () Bool)

(assert (=> b!1382939 (=> (not res!924573) (not e!783855))))

(declare-datatypes ((List!32216 0))(
  ( (Nil!32213) (Cons!32212 (h!33421 (_ BitVec 64)) (t!46902 List!32216)) )
))
(declare-fun arrayNoDuplicates!0 (array!94464 (_ BitVec 32) List!32216) Bool)

(assert (=> b!1382939 (= res!924573 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32213))))

(assert (= (and start!118208 res!924574) b!1382937))

(assert (= (and b!1382937 res!924572) b!1382938))

(assert (= (and b!1382938 res!924575) b!1382939))

(assert (= (and b!1382939 res!924573) b!1382940))

(declare-fun m!1267611 () Bool)

(assert (=> start!118208 m!1267611))

(declare-fun m!1267613 () Bool)

(assert (=> start!118208 m!1267613))

(declare-fun m!1267615 () Bool)

(assert (=> b!1382938 m!1267615))

(assert (=> b!1382938 m!1267615))

(declare-fun m!1267617 () Bool)

(assert (=> b!1382938 m!1267617))

(declare-fun m!1267619 () Bool)

(assert (=> b!1382939 m!1267619))

(check-sat (not b!1382938) (not start!118208) (not b!1382939))
(check-sat)
