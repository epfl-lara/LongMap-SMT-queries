; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118290 () Bool)

(assert start!118290)

(declare-fun b!1383480 () Bool)

(declare-fun res!925117 () Bool)

(declare-fun e!784101 () Bool)

(assert (=> b!1383480 (=> (not res!925117) (not e!784101))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94546 0))(
  ( (array!94547 (arr!45651 (Array (_ BitVec 32) (_ BitVec 64))) (size!46203 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94546)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383480 (= res!925117 (and (= (size!46203 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46203 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46203 a!2938))))))

(declare-fun b!1383481 () Bool)

(declare-fun res!925120 () Bool)

(assert (=> b!1383481 (=> (not res!925120) (not e!784101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94546 (_ BitVec 32)) Bool)

(assert (=> b!1383481 (= res!925120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383482 () Bool)

(assert (=> b!1383482 (= e!784101 (not true))))

(declare-datatypes ((SeekEntryResult!10068 0))(
  ( (MissingZero!10068 (index!42643 (_ BitVec 32))) (Found!10068 (index!42644 (_ BitVec 32))) (Intermediate!10068 (undefined!10880 Bool) (index!42645 (_ BitVec 32)) (x!124154 (_ BitVec 32))) (Undefined!10068) (MissingVacant!10068 (index!42646 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94546 (_ BitVec 32)) SeekEntryResult!10068)

(assert (=> b!1383482 (= (seekEntryOrOpen!0 (select (arr!45651 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45651 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94547 (store (arr!45651 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46203 a!2938)) mask!2987))))

(declare-datatypes ((Unit!45916 0))(
  ( (Unit!45917) )
))
(declare-fun lt!608447 () Unit!45916)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45916)

(assert (=> b!1383482 (= lt!608447 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383483 () Bool)

(declare-fun res!925115 () Bool)

(assert (=> b!1383483 (=> (not res!925115) (not e!784101))))

(declare-datatypes ((List!32257 0))(
  ( (Nil!32254) (Cons!32253 (h!33462 (_ BitVec 64)) (t!46943 List!32257)) )
))
(declare-fun arrayNoDuplicates!0 (array!94546 (_ BitVec 32) List!32257) Bool)

(assert (=> b!1383483 (= res!925115 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32254))))

(declare-fun b!1383484 () Bool)

(declare-fun res!925116 () Bool)

(assert (=> b!1383484 (=> (not res!925116) (not e!784101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383484 (= res!925116 (validKeyInArray!0 (select (arr!45651 a!2938) i!1065)))))

(declare-fun b!1383485 () Bool)

(declare-fun res!925118 () Bool)

(assert (=> b!1383485 (=> (not res!925118) (not e!784101))))

(assert (=> b!1383485 (= res!925118 (validKeyInArray!0 (select (arr!45651 a!2938) startIndex!16)))))

(declare-fun res!925119 () Bool)

(assert (=> start!118290 (=> (not res!925119) (not e!784101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118290 (= res!925119 (validMask!0 mask!2987))))

(assert (=> start!118290 e!784101))

(assert (=> start!118290 true))

(declare-fun array_inv!34884 (array!94546) Bool)

(assert (=> start!118290 (array_inv!34884 a!2938)))

(declare-fun b!1383486 () Bool)

(declare-fun res!925121 () Bool)

(assert (=> b!1383486 (=> (not res!925121) (not e!784101))))

(assert (=> b!1383486 (= res!925121 (and (not (= (select (arr!45651 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45651 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(assert (= (and start!118290 res!925119) b!1383480))

(assert (= (and b!1383480 res!925117) b!1383484))

(assert (= (and b!1383484 res!925116) b!1383483))

(assert (= (and b!1383483 res!925115) b!1383481))

(assert (= (and b!1383481 res!925120) b!1383486))

(assert (= (and b!1383486 res!925121) b!1383485))

(assert (= (and b!1383485 res!925118) b!1383482))

(declare-fun m!1268167 () Bool)

(assert (=> b!1383481 m!1268167))

(declare-fun m!1268169 () Bool)

(assert (=> b!1383484 m!1268169))

(assert (=> b!1383484 m!1268169))

(declare-fun m!1268171 () Bool)

(assert (=> b!1383484 m!1268171))

(declare-fun m!1268173 () Bool)

(assert (=> b!1383485 m!1268173))

(assert (=> b!1383485 m!1268173))

(declare-fun m!1268175 () Bool)

(assert (=> b!1383485 m!1268175))

(declare-fun m!1268177 () Bool)

(assert (=> b!1383482 m!1268177))

(assert (=> b!1383482 m!1268177))

(declare-fun m!1268179 () Bool)

(assert (=> b!1383482 m!1268179))

(declare-fun m!1268181 () Bool)

(assert (=> b!1383482 m!1268181))

(declare-fun m!1268183 () Bool)

(assert (=> b!1383482 m!1268183))

(assert (=> b!1383482 m!1268173))

(assert (=> b!1383482 m!1268173))

(declare-fun m!1268185 () Bool)

(assert (=> b!1383482 m!1268185))

(assert (=> b!1383486 m!1268169))

(declare-fun m!1268187 () Bool)

(assert (=> b!1383483 m!1268187))

(declare-fun m!1268189 () Bool)

(assert (=> start!118290 m!1268189))

(declare-fun m!1268191 () Bool)

(assert (=> start!118290 m!1268191))

(push 1)

(assert (not start!118290))

(assert (not b!1383484))

(assert (not b!1383481))

(assert (not b!1383483))

(assert (not b!1383482))

(assert (not b!1383485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

