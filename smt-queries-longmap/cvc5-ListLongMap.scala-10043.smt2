; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118362 () Bool)

(assert start!118362)

(declare-fun b!1384411 () Bool)

(declare-fun res!925856 () Bool)

(declare-fun e!784487 () Bool)

(assert (=> b!1384411 (=> (not res!925856) (not e!784487))))

(declare-datatypes ((array!94665 0))(
  ( (array!94666 (arr!45710 (Array (_ BitVec 32) (_ BitVec 64))) (size!46260 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94665)

(declare-datatypes ((List!32238 0))(
  ( (Nil!32235) (Cons!32234 (h!33443 (_ BitVec 64)) (t!46932 List!32238)) )
))
(declare-fun arrayNoDuplicates!0 (array!94665 (_ BitVec 32) List!32238) Bool)

(assert (=> b!1384411 (= res!925856 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32235))))

(declare-fun b!1384412 () Bool)

(declare-fun res!925858 () Bool)

(assert (=> b!1384412 (=> (not res!925858) (not e!784487))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94665 (_ BitVec 32)) Bool)

(assert (=> b!1384412 (= res!925858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384413 () Bool)

(declare-datatypes ((Unit!46167 0))(
  ( (Unit!46168) )
))
(declare-fun e!784485 () Unit!46167)

(declare-fun lt!608882 () Unit!46167)

(assert (=> b!1384413 (= e!784485 lt!608882)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608881 () Unit!46167)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46167)

(assert (=> b!1384413 (= lt!608881 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10103 0))(
  ( (MissingZero!10103 (index!42783 (_ BitVec 32))) (Found!10103 (index!42784 (_ BitVec 32))) (Intermediate!10103 (undefined!10915 Bool) (index!42785 (_ BitVec 32)) (x!124288 (_ BitVec 32))) (Undefined!10103) (MissingVacant!10103 (index!42786 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94665 (_ BitVec 32)) SeekEntryResult!10103)

(assert (=> b!1384413 (= (seekEntryOrOpen!0 (select (arr!45710 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45710 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94666 (store (arr!45710 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46260 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46167)

(assert (=> b!1384413 (= lt!608882 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384413 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925857 () Bool)

(assert (=> start!118362 (=> (not res!925857) (not e!784487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118362 (= res!925857 (validMask!0 mask!2987))))

(assert (=> start!118362 e!784487))

(assert (=> start!118362 true))

(declare-fun array_inv!34738 (array!94665) Bool)

(assert (=> start!118362 (array_inv!34738 a!2938)))

(declare-fun b!1384414 () Bool)

(declare-fun res!925861 () Bool)

(assert (=> b!1384414 (=> (not res!925861) (not e!784487))))

(assert (=> b!1384414 (= res!925861 (and (not (= (select (arr!45710 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45710 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384415 () Bool)

(assert (=> b!1384415 (= e!784487 false)))

(declare-fun lt!608883 () Unit!46167)

(assert (=> b!1384415 (= lt!608883 e!784485)))

(declare-fun c!128718 () Bool)

(declare-fun e!784486 () Bool)

(assert (=> b!1384415 (= c!128718 e!784486)))

(declare-fun res!925859 () Bool)

(assert (=> b!1384415 (=> (not res!925859) (not e!784486))))

(assert (=> b!1384415 (= res!925859 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384416 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384416 (= e!784486 (validKeyInArray!0 (select (arr!45710 a!2938) startIndex!16)))))

(declare-fun b!1384417 () Bool)

(declare-fun res!925860 () Bool)

(assert (=> b!1384417 (=> (not res!925860) (not e!784487))))

(assert (=> b!1384417 (= res!925860 (validKeyInArray!0 (select (arr!45710 a!2938) i!1065)))))

(declare-fun b!1384418 () Bool)

(declare-fun Unit!46169 () Unit!46167)

(assert (=> b!1384418 (= e!784485 Unit!46169)))

(declare-fun b!1384419 () Bool)

(declare-fun res!925855 () Bool)

(assert (=> b!1384419 (=> (not res!925855) (not e!784487))))

(assert (=> b!1384419 (= res!925855 (and (= (size!46260 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46260 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46260 a!2938))))))

(assert (= (and start!118362 res!925857) b!1384419))

(assert (= (and b!1384419 res!925855) b!1384417))

(assert (= (and b!1384417 res!925860) b!1384411))

(assert (= (and b!1384411 res!925856) b!1384412))

(assert (= (and b!1384412 res!925858) b!1384414))

(assert (= (and b!1384414 res!925861) b!1384415))

(assert (= (and b!1384415 res!925859) b!1384416))

(assert (= (and b!1384415 c!128718) b!1384413))

(assert (= (and b!1384415 (not c!128718)) b!1384418))

(declare-fun m!1269651 () Bool)

(assert (=> b!1384414 m!1269651))

(declare-fun m!1269653 () Bool)

(assert (=> b!1384411 m!1269653))

(declare-fun m!1269655 () Bool)

(assert (=> b!1384416 m!1269655))

(assert (=> b!1384416 m!1269655))

(declare-fun m!1269657 () Bool)

(assert (=> b!1384416 m!1269657))

(declare-fun m!1269659 () Bool)

(assert (=> b!1384413 m!1269659))

(declare-fun m!1269661 () Bool)

(assert (=> b!1384413 m!1269661))

(assert (=> b!1384413 m!1269661))

(declare-fun m!1269663 () Bool)

(assert (=> b!1384413 m!1269663))

(declare-fun m!1269665 () Bool)

(assert (=> b!1384413 m!1269665))

(declare-fun m!1269667 () Bool)

(assert (=> b!1384413 m!1269667))

(assert (=> b!1384413 m!1269655))

(declare-fun m!1269669 () Bool)

(assert (=> b!1384413 m!1269669))

(assert (=> b!1384413 m!1269655))

(declare-fun m!1269671 () Bool)

(assert (=> b!1384413 m!1269671))

(declare-fun m!1269673 () Bool)

(assert (=> b!1384412 m!1269673))

(assert (=> b!1384417 m!1269651))

(assert (=> b!1384417 m!1269651))

(declare-fun m!1269675 () Bool)

(assert (=> b!1384417 m!1269675))

(declare-fun m!1269677 () Bool)

(assert (=> start!118362 m!1269677))

(declare-fun m!1269679 () Bool)

(assert (=> start!118362 m!1269679))

(push 1)

(assert (not start!118362))

(assert (not b!1384412))

(assert (not b!1384416))

(assert (not b!1384411))

(assert (not b!1384413))

(assert (not b!1384417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

