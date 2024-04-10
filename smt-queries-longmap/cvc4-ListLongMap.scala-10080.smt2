; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118618 () Bool)

(assert start!118618)

(declare-fun b!1386769 () Bool)

(declare-fun e!785545 () Bool)

(declare-datatypes ((array!94894 0))(
  ( (array!94895 (arr!45823 (Array (_ BitVec 32) (_ BitVec 64))) (size!46373 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94894)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386769 (= e!785545 (validKeyInArray!0 (select (arr!45823 a!2938) startIndex!16)))))

(declare-fun b!1386770 () Bool)

(declare-datatypes ((Unit!46340 0))(
  ( (Unit!46341) )
))
(declare-fun e!785543 () Unit!46340)

(declare-fun lt!609574 () Unit!46340)

(assert (=> b!1386770 (= e!785543 lt!609574)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609575 () Unit!46340)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46340)

(assert (=> b!1386770 (= lt!609575 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10166 0))(
  ( (MissingZero!10166 (index!43035 (_ BitVec 32))) (Found!10166 (index!43036 (_ BitVec 32))) (Intermediate!10166 (undefined!10978 Bool) (index!43037 (_ BitVec 32)) (x!124647 (_ BitVec 32))) (Undefined!10166) (MissingVacant!10166 (index!43038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94894 (_ BitVec 32)) SeekEntryResult!10166)

(assert (=> b!1386770 (= (seekEntryOrOpen!0 (select (arr!45823 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45823 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94895 (store (arr!45823 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46373 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46340)

(assert (=> b!1386770 (= lt!609574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94894 (_ BitVec 32)) Bool)

(assert (=> b!1386770 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386771 () Bool)

(declare-fun res!927898 () Bool)

(declare-fun e!785544 () Bool)

(assert (=> b!1386771 (=> (not res!927898) (not e!785544))))

(assert (=> b!1386771 (= res!927898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386772 () Bool)

(declare-fun res!927901 () Bool)

(assert (=> b!1386772 (=> (not res!927901) (not e!785544))))

(assert (=> b!1386772 (= res!927901 (validKeyInArray!0 (select (arr!45823 a!2938) i!1065)))))

(declare-fun b!1386773 () Bool)

(declare-fun res!927900 () Bool)

(assert (=> b!1386773 (=> (not res!927900) (not e!785544))))

(assert (=> b!1386773 (= res!927900 (and (not (= (select (arr!45823 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45823 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386774 () Bool)

(declare-fun res!927897 () Bool)

(assert (=> b!1386774 (=> (not res!927897) (not e!785544))))

(declare-datatypes ((List!32351 0))(
  ( (Nil!32348) (Cons!32347 (h!33556 (_ BitVec 64)) (t!47045 List!32351)) )
))
(declare-fun arrayNoDuplicates!0 (array!94894 (_ BitVec 32) List!32351) Bool)

(assert (=> b!1386774 (= res!927897 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32348))))

(declare-fun b!1386775 () Bool)

(declare-fun res!927895 () Bool)

(assert (=> b!1386775 (=> (not res!927895) (not e!785544))))

(assert (=> b!1386775 (= res!927895 (and (= (size!46373 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46373 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46373 a!2938))))))

(declare-fun b!1386776 () Bool)

(assert (=> b!1386776 (= e!785544 false)))

(declare-fun lt!609576 () Unit!46340)

(assert (=> b!1386776 (= lt!609576 e!785543)))

(declare-fun c!128877 () Bool)

(assert (=> b!1386776 (= c!128877 e!785545)))

(declare-fun res!927896 () Bool)

(assert (=> b!1386776 (=> (not res!927896) (not e!785545))))

(assert (=> b!1386776 (= res!927896 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386777 () Bool)

(declare-fun Unit!46342 () Unit!46340)

(assert (=> b!1386777 (= e!785543 Unit!46342)))

(declare-fun res!927899 () Bool)

(assert (=> start!118618 (=> (not res!927899) (not e!785544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118618 (= res!927899 (validMask!0 mask!2987))))

(assert (=> start!118618 e!785544))

(assert (=> start!118618 true))

(declare-fun array_inv!34851 (array!94894) Bool)

(assert (=> start!118618 (array_inv!34851 a!2938)))

(assert (= (and start!118618 res!927899) b!1386775))

(assert (= (and b!1386775 res!927895) b!1386772))

(assert (= (and b!1386772 res!927901) b!1386774))

(assert (= (and b!1386774 res!927897) b!1386771))

(assert (= (and b!1386771 res!927898) b!1386773))

(assert (= (and b!1386773 res!927900) b!1386776))

(assert (= (and b!1386776 res!927896) b!1386769))

(assert (= (and b!1386776 c!128877) b!1386770))

(assert (= (and b!1386776 (not c!128877)) b!1386777))

(declare-fun m!1272171 () Bool)

(assert (=> b!1386773 m!1272171))

(declare-fun m!1272173 () Bool)

(assert (=> b!1386770 m!1272173))

(declare-fun m!1272175 () Bool)

(assert (=> b!1386770 m!1272175))

(assert (=> b!1386770 m!1272175))

(declare-fun m!1272177 () Bool)

(assert (=> b!1386770 m!1272177))

(declare-fun m!1272179 () Bool)

(assert (=> b!1386770 m!1272179))

(declare-fun m!1272181 () Bool)

(assert (=> b!1386770 m!1272181))

(declare-fun m!1272183 () Bool)

(assert (=> b!1386770 m!1272183))

(declare-fun m!1272185 () Bool)

(assert (=> b!1386770 m!1272185))

(assert (=> b!1386770 m!1272183))

(declare-fun m!1272187 () Bool)

(assert (=> b!1386770 m!1272187))

(assert (=> b!1386769 m!1272183))

(assert (=> b!1386769 m!1272183))

(declare-fun m!1272189 () Bool)

(assert (=> b!1386769 m!1272189))

(assert (=> b!1386772 m!1272171))

(assert (=> b!1386772 m!1272171))

(declare-fun m!1272191 () Bool)

(assert (=> b!1386772 m!1272191))

(declare-fun m!1272193 () Bool)

(assert (=> start!118618 m!1272193))

(declare-fun m!1272195 () Bool)

(assert (=> start!118618 m!1272195))

(declare-fun m!1272197 () Bool)

(assert (=> b!1386774 m!1272197))

(declare-fun m!1272199 () Bool)

(assert (=> b!1386771 m!1272199))

(push 1)

(assert (not start!118618))

(assert (not b!1386769))

(assert (not b!1386774))

(assert (not b!1386772))

(assert (not b!1386770))

(assert (not b!1386771))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

