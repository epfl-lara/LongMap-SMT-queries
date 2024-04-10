; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118610 () Bool)

(assert start!118610)

(declare-fun b!1386661 () Bool)

(declare-fun e!785497 () Bool)

(declare-datatypes ((array!94886 0))(
  ( (array!94887 (arr!45819 (Array (_ BitVec 32) (_ BitVec 64))) (size!46369 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94886)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386661 (= e!785497 (validKeyInArray!0 (select (arr!45819 a!2938) startIndex!16)))))

(declare-fun b!1386662 () Bool)

(declare-fun res!927813 () Bool)

(declare-fun e!785495 () Bool)

(assert (=> b!1386662 (=> (not res!927813) (not e!785495))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386662 (= res!927813 (and (= (size!46369 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46369 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46369 a!2938))))))

(declare-fun b!1386664 () Bool)

(declare-fun res!927814 () Bool)

(assert (=> b!1386664 (=> (not res!927814) (not e!785495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94886 (_ BitVec 32)) Bool)

(assert (=> b!1386664 (= res!927814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386665 () Bool)

(declare-datatypes ((Unit!46328 0))(
  ( (Unit!46329) )
))
(declare-fun e!785496 () Unit!46328)

(declare-fun Unit!46330 () Unit!46328)

(assert (=> b!1386665 (= e!785496 Unit!46330)))

(declare-fun b!1386666 () Bool)

(declare-fun res!927812 () Bool)

(assert (=> b!1386666 (=> (not res!927812) (not e!785495))))

(assert (=> b!1386666 (= res!927812 (and (not (= (select (arr!45819 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45819 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386667 () Bool)

(assert (=> b!1386667 (= e!785495 false)))

(declare-fun lt!609539 () Unit!46328)

(assert (=> b!1386667 (= lt!609539 e!785496)))

(declare-fun c!128865 () Bool)

(assert (=> b!1386667 (= c!128865 e!785497)))

(declare-fun res!927816 () Bool)

(assert (=> b!1386667 (=> (not res!927816) (not e!785497))))

(assert (=> b!1386667 (= res!927816 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386668 () Bool)

(declare-fun res!927815 () Bool)

(assert (=> b!1386668 (=> (not res!927815) (not e!785495))))

(declare-datatypes ((List!32347 0))(
  ( (Nil!32344) (Cons!32343 (h!33552 (_ BitVec 64)) (t!47041 List!32347)) )
))
(declare-fun arrayNoDuplicates!0 (array!94886 (_ BitVec 32) List!32347) Bool)

(assert (=> b!1386668 (= res!927815 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32344))))

(declare-fun b!1386669 () Bool)

(declare-fun res!927817 () Bool)

(assert (=> b!1386669 (=> (not res!927817) (not e!785495))))

(assert (=> b!1386669 (= res!927817 (validKeyInArray!0 (select (arr!45819 a!2938) i!1065)))))

(declare-fun res!927811 () Bool)

(assert (=> start!118610 (=> (not res!927811) (not e!785495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118610 (= res!927811 (validMask!0 mask!2987))))

(assert (=> start!118610 e!785495))

(assert (=> start!118610 true))

(declare-fun array_inv!34847 (array!94886) Bool)

(assert (=> start!118610 (array_inv!34847 a!2938)))

(declare-fun b!1386663 () Bool)

(declare-fun lt!609540 () Unit!46328)

(assert (=> b!1386663 (= e!785496 lt!609540)))

(declare-fun lt!609538 () Unit!46328)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46328)

(assert (=> b!1386663 (= lt!609538 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10162 0))(
  ( (MissingZero!10162 (index!43019 (_ BitVec 32))) (Found!10162 (index!43020 (_ BitVec 32))) (Intermediate!10162 (undefined!10974 Bool) (index!43021 (_ BitVec 32)) (x!124635 (_ BitVec 32))) (Undefined!10162) (MissingVacant!10162 (index!43022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94886 (_ BitVec 32)) SeekEntryResult!10162)

(assert (=> b!1386663 (= (seekEntryOrOpen!0 (select (arr!45819 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45819 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94887 (store (arr!45819 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46328)

(assert (=> b!1386663 (= lt!609540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386663 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118610 res!927811) b!1386662))

(assert (= (and b!1386662 res!927813) b!1386669))

(assert (= (and b!1386669 res!927817) b!1386668))

(assert (= (and b!1386668 res!927815) b!1386664))

(assert (= (and b!1386664 res!927814) b!1386666))

(assert (= (and b!1386666 res!927812) b!1386667))

(assert (= (and b!1386667 res!927816) b!1386661))

(assert (= (and b!1386667 c!128865) b!1386663))

(assert (= (and b!1386667 (not c!128865)) b!1386665))

(declare-fun m!1272051 () Bool)

(assert (=> b!1386663 m!1272051))

(declare-fun m!1272053 () Bool)

(assert (=> b!1386663 m!1272053))

(assert (=> b!1386663 m!1272053))

(declare-fun m!1272055 () Bool)

(assert (=> b!1386663 m!1272055))

(declare-fun m!1272057 () Bool)

(assert (=> b!1386663 m!1272057))

(declare-fun m!1272059 () Bool)

(assert (=> b!1386663 m!1272059))

(declare-fun m!1272061 () Bool)

(assert (=> b!1386663 m!1272061))

(declare-fun m!1272063 () Bool)

(assert (=> b!1386663 m!1272063))

(assert (=> b!1386663 m!1272061))

(declare-fun m!1272065 () Bool)

(assert (=> b!1386663 m!1272065))

(assert (=> b!1386661 m!1272061))

(assert (=> b!1386661 m!1272061))

(declare-fun m!1272067 () Bool)

(assert (=> b!1386661 m!1272067))

(declare-fun m!1272069 () Bool)

(assert (=> b!1386669 m!1272069))

(assert (=> b!1386669 m!1272069))

(declare-fun m!1272071 () Bool)

(assert (=> b!1386669 m!1272071))

(declare-fun m!1272073 () Bool)

(assert (=> b!1386664 m!1272073))

(assert (=> b!1386666 m!1272069))

(declare-fun m!1272075 () Bool)

(assert (=> start!118610 m!1272075))

(declare-fun m!1272077 () Bool)

(assert (=> start!118610 m!1272077))

(declare-fun m!1272079 () Bool)

(assert (=> b!1386668 m!1272079))

(check-sat (not b!1386661) (not b!1386663) (not b!1386669) (not start!118610) (not b!1386668) (not b!1386664))
