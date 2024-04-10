; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118350 () Bool)

(assert start!118350)

(declare-fun b!1384249 () Bool)

(declare-fun e!784414 () Bool)

(assert (=> b!1384249 (= e!784414 false)))

(declare-datatypes ((Unit!46149 0))(
  ( (Unit!46150) )
))
(declare-fun lt!608827 () Unit!46149)

(declare-fun e!784415 () Unit!46149)

(assert (=> b!1384249 (= lt!608827 e!784415)))

(declare-fun c!128700 () Bool)

(declare-fun e!784413 () Bool)

(assert (=> b!1384249 (= c!128700 e!784413)))

(declare-fun res!925732 () Bool)

(assert (=> b!1384249 (=> (not res!925732) (not e!784413))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384249 (= res!925732 (not (= startIndex!16 i!1065)))))

(declare-fun res!925729 () Bool)

(assert (=> start!118350 (=> (not res!925729) (not e!784414))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118350 (= res!925729 (validMask!0 mask!2987))))

(assert (=> start!118350 e!784414))

(assert (=> start!118350 true))

(declare-datatypes ((array!94653 0))(
  ( (array!94654 (arr!45704 (Array (_ BitVec 32) (_ BitVec 64))) (size!46254 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94653)

(declare-fun array_inv!34732 (array!94653) Bool)

(assert (=> start!118350 (array_inv!34732 a!2938)))

(declare-fun b!1384250 () Bool)

(declare-fun res!925735 () Bool)

(assert (=> b!1384250 (=> (not res!925735) (not e!784414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94653 (_ BitVec 32)) Bool)

(assert (=> b!1384250 (= res!925735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384251 () Bool)

(declare-fun res!925734 () Bool)

(assert (=> b!1384251 (=> (not res!925734) (not e!784414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384251 (= res!925734 (validKeyInArray!0 (select (arr!45704 a!2938) i!1065)))))

(declare-fun b!1384252 () Bool)

(declare-fun lt!608828 () Unit!46149)

(assert (=> b!1384252 (= e!784415 lt!608828)))

(declare-fun lt!608829 () Unit!46149)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46149)

(assert (=> b!1384252 (= lt!608829 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10097 0))(
  ( (MissingZero!10097 (index!42759 (_ BitVec 32))) (Found!10097 (index!42760 (_ BitVec 32))) (Intermediate!10097 (undefined!10909 Bool) (index!42761 (_ BitVec 32)) (x!124266 (_ BitVec 32))) (Undefined!10097) (MissingVacant!10097 (index!42762 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94653 (_ BitVec 32)) SeekEntryResult!10097)

(assert (=> b!1384252 (= (seekEntryOrOpen!0 (select (arr!45704 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45704 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94654 (store (arr!45704 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46254 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46149)

(assert (=> b!1384252 (= lt!608828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384252 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384253 () Bool)

(declare-fun res!925731 () Bool)

(assert (=> b!1384253 (=> (not res!925731) (not e!784414))))

(declare-datatypes ((List!32232 0))(
  ( (Nil!32229) (Cons!32228 (h!33437 (_ BitVec 64)) (t!46926 List!32232)) )
))
(declare-fun arrayNoDuplicates!0 (array!94653 (_ BitVec 32) List!32232) Bool)

(assert (=> b!1384253 (= res!925731 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32229))))

(declare-fun b!1384254 () Bool)

(declare-fun Unit!46151 () Unit!46149)

(assert (=> b!1384254 (= e!784415 Unit!46151)))

(declare-fun b!1384255 () Bool)

(assert (=> b!1384255 (= e!784413 (validKeyInArray!0 (select (arr!45704 a!2938) startIndex!16)))))

(declare-fun b!1384256 () Bool)

(declare-fun res!925730 () Bool)

(assert (=> b!1384256 (=> (not res!925730) (not e!784414))))

(assert (=> b!1384256 (= res!925730 (and (= (size!46254 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46254 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46254 a!2938))))))

(declare-fun b!1384257 () Bool)

(declare-fun res!925733 () Bool)

(assert (=> b!1384257 (=> (not res!925733) (not e!784414))))

(assert (=> b!1384257 (= res!925733 (and (not (= (select (arr!45704 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45704 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118350 res!925729) b!1384256))

(assert (= (and b!1384256 res!925730) b!1384251))

(assert (= (and b!1384251 res!925734) b!1384253))

(assert (= (and b!1384253 res!925731) b!1384250))

(assert (= (and b!1384250 res!925735) b!1384257))

(assert (= (and b!1384257 res!925733) b!1384249))

(assert (= (and b!1384249 res!925732) b!1384255))

(assert (= (and b!1384249 c!128700) b!1384252))

(assert (= (and b!1384249 (not c!128700)) b!1384254))

(declare-fun m!1269471 () Bool)

(assert (=> b!1384255 m!1269471))

(assert (=> b!1384255 m!1269471))

(declare-fun m!1269473 () Bool)

(assert (=> b!1384255 m!1269473))

(declare-fun m!1269475 () Bool)

(assert (=> b!1384253 m!1269475))

(declare-fun m!1269477 () Bool)

(assert (=> b!1384257 m!1269477))

(declare-fun m!1269479 () Bool)

(assert (=> b!1384250 m!1269479))

(declare-fun m!1269481 () Bool)

(assert (=> b!1384252 m!1269481))

(declare-fun m!1269483 () Bool)

(assert (=> b!1384252 m!1269483))

(assert (=> b!1384252 m!1269483))

(declare-fun m!1269485 () Bool)

(assert (=> b!1384252 m!1269485))

(declare-fun m!1269487 () Bool)

(assert (=> b!1384252 m!1269487))

(declare-fun m!1269489 () Bool)

(assert (=> b!1384252 m!1269489))

(assert (=> b!1384252 m!1269471))

(declare-fun m!1269491 () Bool)

(assert (=> b!1384252 m!1269491))

(assert (=> b!1384252 m!1269471))

(declare-fun m!1269493 () Bool)

(assert (=> b!1384252 m!1269493))

(assert (=> b!1384251 m!1269477))

(assert (=> b!1384251 m!1269477))

(declare-fun m!1269495 () Bool)

(assert (=> b!1384251 m!1269495))

(declare-fun m!1269497 () Bool)

(assert (=> start!118350 m!1269497))

(declare-fun m!1269499 () Bool)

(assert (=> start!118350 m!1269499))

(push 1)

(assert (not b!1384252))

(assert (not b!1384250))

(assert (not start!118350))

(assert (not b!1384255))

(assert (not b!1384253))

(assert (not b!1384251))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

