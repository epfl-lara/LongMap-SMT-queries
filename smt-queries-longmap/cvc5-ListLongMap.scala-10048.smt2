; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118608 () Bool)

(assert start!118608)

(declare-fun b!1386214 () Bool)

(declare-fun res!926772 () Bool)

(declare-fun e!785573 () Bool)

(assert (=> b!1386214 (=> (not res!926772) (not e!785573))))

(declare-datatypes ((array!94809 0))(
  ( (array!94810 (arr!45780 (Array (_ BitVec 32) (_ BitVec 64))) (size!46331 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94809)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386214 (= res!926772 (and (not (= (select (arr!45780 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45780 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!926770 () Bool)

(assert (=> start!118608 (=> (not res!926770) (not e!785573))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118608 (= res!926770 (validMask!0 mask!2987))))

(assert (=> start!118608 e!785573))

(assert (=> start!118608 true))

(declare-fun array_inv!35061 (array!94809) Bool)

(assert (=> start!118608 (array_inv!35061 a!2938)))

(declare-fun b!1386215 () Bool)

(declare-fun res!926768 () Bool)

(assert (=> b!1386215 (=> (not res!926768) (not e!785573))))

(declare-datatypes ((List!32295 0))(
  ( (Nil!32292) (Cons!32291 (h!33509 (_ BitVec 64)) (t!46981 List!32295)) )
))
(declare-fun arrayNoDuplicates!0 (array!94809 (_ BitVec 32) List!32295) Bool)

(assert (=> b!1386215 (= res!926768 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32292))))

(declare-fun b!1386216 () Bool)

(declare-fun e!785575 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386216 (= e!785575 (validKeyInArray!0 (select (arr!45780 a!2938) startIndex!16)))))

(declare-fun b!1386217 () Bool)

(declare-datatypes ((Unit!46157 0))(
  ( (Unit!46158) )
))
(declare-fun e!785574 () Unit!46157)

(declare-fun lt!609588 () Unit!46157)

(assert (=> b!1386217 (= e!785574 lt!609588)))

(declare-fun lt!609587 () Unit!46157)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46157)

(assert (=> b!1386217 (= lt!609587 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10076 0))(
  ( (MissingZero!10076 (index!42675 (_ BitVec 32))) (Found!10076 (index!42676 (_ BitVec 32))) (Intermediate!10076 (undefined!10888 Bool) (index!42677 (_ BitVec 32)) (x!124323 (_ BitVec 32))) (Undefined!10076) (MissingVacant!10076 (index!42678 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94809 (_ BitVec 32)) SeekEntryResult!10076)

(assert (=> b!1386217 (= (seekEntryOrOpen!0 (select (arr!45780 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45780 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94810 (store (arr!45780 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46331 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46157)

(assert (=> b!1386217 (= lt!609588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94809 (_ BitVec 32)) Bool)

(assert (=> b!1386217 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386218 () Bool)

(declare-fun res!926773 () Bool)

(assert (=> b!1386218 (=> (not res!926773) (not e!785573))))

(assert (=> b!1386218 (= res!926773 (validKeyInArray!0 (select (arr!45780 a!2938) i!1065)))))

(declare-fun b!1386219 () Bool)

(declare-fun res!926771 () Bool)

(assert (=> b!1386219 (=> (not res!926771) (not e!785573))))

(assert (=> b!1386219 (= res!926771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386220 () Bool)

(declare-fun Unit!46159 () Unit!46157)

(assert (=> b!1386220 (= e!785574 Unit!46159)))

(declare-fun b!1386221 () Bool)

(assert (=> b!1386221 (= e!785573 false)))

(declare-fun lt!609586 () Unit!46157)

(assert (=> b!1386221 (= lt!609586 e!785574)))

(declare-fun c!129171 () Bool)

(assert (=> b!1386221 (= c!129171 e!785575)))

(declare-fun res!926767 () Bool)

(assert (=> b!1386221 (=> (not res!926767) (not e!785575))))

(assert (=> b!1386221 (= res!926767 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386222 () Bool)

(declare-fun res!926769 () Bool)

(assert (=> b!1386222 (=> (not res!926769) (not e!785573))))

(assert (=> b!1386222 (= res!926769 (and (= (size!46331 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46331 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46331 a!2938))))))

(assert (= (and start!118608 res!926770) b!1386222))

(assert (= (and b!1386222 res!926769) b!1386218))

(assert (= (and b!1386218 res!926773) b!1386215))

(assert (= (and b!1386215 res!926768) b!1386219))

(assert (= (and b!1386219 res!926771) b!1386214))

(assert (= (and b!1386214 res!926772) b!1386221))

(assert (= (and b!1386221 res!926767) b!1386216))

(assert (= (and b!1386221 c!129171) b!1386217))

(assert (= (and b!1386221 (not c!129171)) b!1386220))

(declare-fun m!1271841 () Bool)

(assert (=> b!1386215 m!1271841))

(declare-fun m!1271843 () Bool)

(assert (=> b!1386218 m!1271843))

(assert (=> b!1386218 m!1271843))

(declare-fun m!1271845 () Bool)

(assert (=> b!1386218 m!1271845))

(declare-fun m!1271847 () Bool)

(assert (=> b!1386217 m!1271847))

(declare-fun m!1271849 () Bool)

(assert (=> b!1386217 m!1271849))

(assert (=> b!1386217 m!1271849))

(declare-fun m!1271851 () Bool)

(assert (=> b!1386217 m!1271851))

(declare-fun m!1271853 () Bool)

(assert (=> b!1386217 m!1271853))

(declare-fun m!1271855 () Bool)

(assert (=> b!1386217 m!1271855))

(declare-fun m!1271857 () Bool)

(assert (=> b!1386217 m!1271857))

(declare-fun m!1271859 () Bool)

(assert (=> b!1386217 m!1271859))

(assert (=> b!1386217 m!1271857))

(declare-fun m!1271861 () Bool)

(assert (=> b!1386217 m!1271861))

(assert (=> b!1386216 m!1271857))

(assert (=> b!1386216 m!1271857))

(declare-fun m!1271863 () Bool)

(assert (=> b!1386216 m!1271863))

(declare-fun m!1271865 () Bool)

(assert (=> b!1386219 m!1271865))

(declare-fun m!1271867 () Bool)

(assert (=> start!118608 m!1271867))

(declare-fun m!1271869 () Bool)

(assert (=> start!118608 m!1271869))

(assert (=> b!1386214 m!1271843))

(push 1)

(assert (not b!1386219))

(assert (not start!118608))

(assert (not b!1386216))

(assert (not b!1386218))

(assert (not b!1386217))

(assert (not b!1386215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

