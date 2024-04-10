; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131194 () Bool)

(assert start!131194)

(declare-fun b!1539117 () Bool)

(declare-fun res!1056101 () Bool)

(declare-fun e!856147 () Bool)

(assert (=> b!1539117 (=> (not res!1056101) (not e!856147))))

(declare-datatypes ((array!102259 0))(
  ( (array!102260 (arr!49344 (Array (_ BitVec 32) (_ BitVec 64))) (size!49894 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102259)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539117 (= res!1056101 (not (= (select (arr!49344 a!2792) index!463) (select (arr!49344 a!2792) j!64))))))

(declare-fun b!1539118 () Bool)

(declare-fun res!1056099 () Bool)

(assert (=> b!1539118 (=> (not res!1056099) (not e!856147))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13470 0))(
  ( (MissingZero!13470 (index!56275 (_ BitVec 32))) (Found!13470 (index!56276 (_ BitVec 32))) (Intermediate!13470 (undefined!14282 Bool) (index!56277 (_ BitVec 32)) (x!138003 (_ BitVec 32))) (Undefined!13470) (MissingVacant!13470 (index!56278 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102259 (_ BitVec 32)) SeekEntryResult!13470)

(assert (=> b!1539118 (= res!1056099 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49344 a!2792) j!64) a!2792 mask!2480) (Found!13470 j!64)))))

(declare-fun b!1539119 () Bool)

(declare-fun res!1056096 () Bool)

(assert (=> b!1539119 (=> (not res!1056096) (not e!856147))))

(declare-datatypes ((List!35818 0))(
  ( (Nil!35815) (Cons!35814 (h!37259 (_ BitVec 64)) (t!50512 List!35818)) )
))
(declare-fun arrayNoDuplicates!0 (array!102259 (_ BitVec 32) List!35818) Bool)

(assert (=> b!1539119 (= res!1056096 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35815))))

(declare-fun b!1539120 () Bool)

(declare-fun res!1056098 () Bool)

(assert (=> b!1539120 (=> (not res!1056098) (not e!856147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539120 (= res!1056098 (validKeyInArray!0 (select (arr!49344 a!2792) j!64)))))

(declare-fun b!1539121 () Bool)

(declare-fun res!1056102 () Bool)

(assert (=> b!1539121 (=> (not res!1056102) (not e!856147))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539121 (= res!1056102 (and (= (size!49894 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49894 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49894 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539122 () Bool)

(assert (=> b!1539122 (= e!856147 false)))

(declare-fun lt!664975 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539122 (= lt!664975 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539123 () Bool)

(declare-fun res!1056100 () Bool)

(assert (=> b!1539123 (=> (not res!1056100) (not e!856147))))

(assert (=> b!1539123 (= res!1056100 (validKeyInArray!0 (select (arr!49344 a!2792) i!951)))))

(declare-fun b!1539124 () Bool)

(declare-fun res!1056103 () Bool)

(assert (=> b!1539124 (=> (not res!1056103) (not e!856147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102259 (_ BitVec 32)) Bool)

(assert (=> b!1539124 (= res!1056103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539125 () Bool)

(declare-fun res!1056097 () Bool)

(assert (=> b!1539125 (=> (not res!1056097) (not e!856147))))

(assert (=> b!1539125 (= res!1056097 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49894 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49894 a!2792)) (= (select (arr!49344 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056095 () Bool)

(assert (=> start!131194 (=> (not res!1056095) (not e!856147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131194 (= res!1056095 (validMask!0 mask!2480))))

(assert (=> start!131194 e!856147))

(assert (=> start!131194 true))

(declare-fun array_inv!38372 (array!102259) Bool)

(assert (=> start!131194 (array_inv!38372 a!2792)))

(assert (= (and start!131194 res!1056095) b!1539121))

(assert (= (and b!1539121 res!1056102) b!1539123))

(assert (= (and b!1539123 res!1056100) b!1539120))

(assert (= (and b!1539120 res!1056098) b!1539124))

(assert (= (and b!1539124 res!1056103) b!1539119))

(assert (= (and b!1539119 res!1056096) b!1539125))

(assert (= (and b!1539125 res!1056097) b!1539118))

(assert (= (and b!1539118 res!1056099) b!1539117))

(assert (= (and b!1539117 res!1056101) b!1539122))

(declare-fun m!1421475 () Bool)

(assert (=> start!131194 m!1421475))

(declare-fun m!1421477 () Bool)

(assert (=> start!131194 m!1421477))

(declare-fun m!1421479 () Bool)

(assert (=> b!1539123 m!1421479))

(assert (=> b!1539123 m!1421479))

(declare-fun m!1421481 () Bool)

(assert (=> b!1539123 m!1421481))

(declare-fun m!1421483 () Bool)

(assert (=> b!1539122 m!1421483))

(declare-fun m!1421485 () Bool)

(assert (=> b!1539120 m!1421485))

(assert (=> b!1539120 m!1421485))

(declare-fun m!1421487 () Bool)

(assert (=> b!1539120 m!1421487))

(declare-fun m!1421489 () Bool)

(assert (=> b!1539119 m!1421489))

(declare-fun m!1421491 () Bool)

(assert (=> b!1539117 m!1421491))

(assert (=> b!1539117 m!1421485))

(declare-fun m!1421493 () Bool)

(assert (=> b!1539124 m!1421493))

(assert (=> b!1539118 m!1421485))

(assert (=> b!1539118 m!1421485))

(declare-fun m!1421495 () Bool)

(assert (=> b!1539118 m!1421495))

(declare-fun m!1421497 () Bool)

(assert (=> b!1539125 m!1421497))

(check-sat (not b!1539119) (not b!1539120) (not b!1539124) (not b!1539122) (not b!1539123) (not start!131194) (not b!1539118))
