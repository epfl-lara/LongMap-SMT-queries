; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118596 () Bool)

(assert start!118596)

(declare-fun b!1386472 () Bool)

(declare-fun e!785414 () Bool)

(assert (=> b!1386472 (= e!785414 false)))

(declare-datatypes ((Unit!46307 0))(
  ( (Unit!46308) )
))
(declare-fun lt!609477 () Unit!46307)

(declare-fun e!785413 () Unit!46307)

(assert (=> b!1386472 (= lt!609477 e!785413)))

(declare-fun c!128844 () Bool)

(declare-fun e!785411 () Bool)

(assert (=> b!1386472 (= c!128844 e!785411)))

(declare-fun res!927668 () Bool)

(assert (=> b!1386472 (=> (not res!927668) (not e!785411))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386472 (= res!927668 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386473 () Bool)

(declare-fun res!927669 () Bool)

(assert (=> b!1386473 (=> (not res!927669) (not e!785414))))

(declare-datatypes ((array!94872 0))(
  ( (array!94873 (arr!45812 (Array (_ BitVec 32) (_ BitVec 64))) (size!46362 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94872)

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386473 (= res!927669 (and (= (size!46362 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46362 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46362 a!2938))))))

(declare-fun b!1386474 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386474 (= e!785411 (validKeyInArray!0 (select (arr!45812 a!2938) startIndex!16)))))

(declare-fun b!1386475 () Bool)

(declare-fun res!927665 () Bool)

(assert (=> b!1386475 (=> (not res!927665) (not e!785414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94872 (_ BitVec 32)) Bool)

(assert (=> b!1386475 (= res!927665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386476 () Bool)

(declare-fun res!927664 () Bool)

(assert (=> b!1386476 (=> (not res!927664) (not e!785414))))

(declare-datatypes ((List!32340 0))(
  ( (Nil!32337) (Cons!32336 (h!33545 (_ BitVec 64)) (t!47034 List!32340)) )
))
(declare-fun arrayNoDuplicates!0 (array!94872 (_ BitVec 32) List!32340) Bool)

(assert (=> b!1386476 (= res!927664 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32337))))

(declare-fun b!1386477 () Bool)

(declare-fun Unit!46309 () Unit!46307)

(assert (=> b!1386477 (= e!785413 Unit!46309)))

(declare-fun b!1386478 () Bool)

(declare-fun res!927667 () Bool)

(assert (=> b!1386478 (=> (not res!927667) (not e!785414))))

(assert (=> b!1386478 (= res!927667 (validKeyInArray!0 (select (arr!45812 a!2938) i!1065)))))

(declare-fun res!927670 () Bool)

(assert (=> start!118596 (=> (not res!927670) (not e!785414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118596 (= res!927670 (validMask!0 mask!2987))))

(assert (=> start!118596 e!785414))

(assert (=> start!118596 true))

(declare-fun array_inv!34840 (array!94872) Bool)

(assert (=> start!118596 (array_inv!34840 a!2938)))

(declare-fun b!1386479 () Bool)

(declare-fun res!927666 () Bool)

(assert (=> b!1386479 (=> (not res!927666) (not e!785414))))

(assert (=> b!1386479 (= res!927666 (and (not (= (select (arr!45812 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45812 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386480 () Bool)

(declare-fun lt!609476 () Unit!46307)

(assert (=> b!1386480 (= e!785413 lt!609476)))

(declare-fun lt!609475 () Unit!46307)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46307)

(assert (=> b!1386480 (= lt!609475 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10155 0))(
  ( (MissingZero!10155 (index!42991 (_ BitVec 32))) (Found!10155 (index!42992 (_ BitVec 32))) (Intermediate!10155 (undefined!10967 Bool) (index!42993 (_ BitVec 32)) (x!124612 (_ BitVec 32))) (Undefined!10155) (MissingVacant!10155 (index!42994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94872 (_ BitVec 32)) SeekEntryResult!10155)

(assert (=> b!1386480 (= (seekEntryOrOpen!0 (select (arr!45812 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45812 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94873 (store (arr!45812 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46362 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46307)

(assert (=> b!1386480 (= lt!609476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386480 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118596 res!927670) b!1386473))

(assert (= (and b!1386473 res!927669) b!1386478))

(assert (= (and b!1386478 res!927667) b!1386476))

(assert (= (and b!1386476 res!927664) b!1386475))

(assert (= (and b!1386475 res!927665) b!1386479))

(assert (= (and b!1386479 res!927666) b!1386472))

(assert (= (and b!1386472 res!927668) b!1386474))

(assert (= (and b!1386472 c!128844) b!1386480))

(assert (= (and b!1386472 (not c!128844)) b!1386477))

(declare-fun m!1271841 () Bool)

(assert (=> b!1386476 m!1271841))

(declare-fun m!1271843 () Bool)

(assert (=> b!1386479 m!1271843))

(assert (=> b!1386478 m!1271843))

(assert (=> b!1386478 m!1271843))

(declare-fun m!1271845 () Bool)

(assert (=> b!1386478 m!1271845))

(declare-fun m!1271847 () Bool)

(assert (=> b!1386474 m!1271847))

(assert (=> b!1386474 m!1271847))

(declare-fun m!1271849 () Bool)

(assert (=> b!1386474 m!1271849))

(declare-fun m!1271851 () Bool)

(assert (=> b!1386480 m!1271851))

(declare-fun m!1271853 () Bool)

(assert (=> b!1386480 m!1271853))

(assert (=> b!1386480 m!1271853))

(declare-fun m!1271855 () Bool)

(assert (=> b!1386480 m!1271855))

(declare-fun m!1271857 () Bool)

(assert (=> b!1386480 m!1271857))

(declare-fun m!1271859 () Bool)

(assert (=> b!1386480 m!1271859))

(assert (=> b!1386480 m!1271847))

(declare-fun m!1271861 () Bool)

(assert (=> b!1386480 m!1271861))

(assert (=> b!1386480 m!1271847))

(declare-fun m!1271863 () Bool)

(assert (=> b!1386480 m!1271863))

(declare-fun m!1271865 () Bool)

(assert (=> start!118596 m!1271865))

(declare-fun m!1271867 () Bool)

(assert (=> start!118596 m!1271867))

(declare-fun m!1271869 () Bool)

(assert (=> b!1386475 m!1271869))

(push 1)

(assert (not b!1386478))

(assert (not b!1386474))

(assert (not start!118596))

(assert (not b!1386475))

(assert (not b!1386480))

(assert (not b!1386476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

