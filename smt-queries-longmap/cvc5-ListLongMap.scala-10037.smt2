; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118326 () Bool)

(assert start!118326)

(declare-fun b!1383910 () Bool)

(declare-fun res!925493 () Bool)

(declare-fun e!784264 () Bool)

(assert (=> b!1383910 (=> (not res!925493) (not e!784264))))

(declare-datatypes ((array!94582 0))(
  ( (array!94583 (arr!45669 (Array (_ BitVec 32) (_ BitVec 64))) (size!46221 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94582)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383910 (= res!925493 (and (not (= (select (arr!45669 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45669 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383911 () Bool)

(declare-datatypes ((Unit!45960 0))(
  ( (Unit!45961) )
))
(declare-fun e!784261 () Unit!45960)

(declare-fun lt!608553 () Unit!45960)

(assert (=> b!1383911 (= e!784261 lt!608553)))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608554 () Unit!45960)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45960)

(assert (=> b!1383911 (= lt!608554 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10086 0))(
  ( (MissingZero!10086 (index!42715 (_ BitVec 32))) (Found!10086 (index!42716 (_ BitVec 32))) (Intermediate!10086 (undefined!10898 Bool) (index!42717 (_ BitVec 32)) (x!124220 (_ BitVec 32))) (Undefined!10086) (MissingVacant!10086 (index!42718 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94582 (_ BitVec 32)) SeekEntryResult!10086)

(assert (=> b!1383911 (= (seekEntryOrOpen!0 (select (arr!45669 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45669 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94583 (store (arr!45669 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46221 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45960)

(assert (=> b!1383911 (= lt!608553 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94582 (_ BitVec 32)) Bool)

(assert (=> b!1383911 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383912 () Bool)

(declare-fun res!925495 () Bool)

(assert (=> b!1383912 (=> (not res!925495) (not e!784264))))

(declare-datatypes ((List!32275 0))(
  ( (Nil!32272) (Cons!32271 (h!33480 (_ BitVec 64)) (t!46961 List!32275)) )
))
(declare-fun arrayNoDuplicates!0 (array!94582 (_ BitVec 32) List!32275) Bool)

(assert (=> b!1383912 (= res!925495 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32272))))

(declare-fun b!1383913 () Bool)

(assert (=> b!1383913 (= e!784264 false)))

(declare-fun lt!608555 () Unit!45960)

(assert (=> b!1383913 (= lt!608555 e!784261)))

(declare-fun c!128651 () Bool)

(declare-fun e!784263 () Bool)

(assert (=> b!1383913 (= c!128651 e!784263)))

(declare-fun res!925499 () Bool)

(assert (=> b!1383913 (=> (not res!925499) (not e!784263))))

(assert (=> b!1383913 (= res!925499 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383914 () Bool)

(declare-fun Unit!45962 () Unit!45960)

(assert (=> b!1383914 (= e!784261 Unit!45962)))

(declare-fun res!925496 () Bool)

(assert (=> start!118326 (=> (not res!925496) (not e!784264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118326 (= res!925496 (validMask!0 mask!2987))))

(assert (=> start!118326 e!784264))

(assert (=> start!118326 true))

(declare-fun array_inv!34902 (array!94582) Bool)

(assert (=> start!118326 (array_inv!34902 a!2938)))

(declare-fun b!1383915 () Bool)

(declare-fun res!925497 () Bool)

(assert (=> b!1383915 (=> (not res!925497) (not e!784264))))

(assert (=> b!1383915 (= res!925497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383916 () Bool)

(declare-fun res!925494 () Bool)

(assert (=> b!1383916 (=> (not res!925494) (not e!784264))))

(assert (=> b!1383916 (= res!925494 (and (= (size!46221 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46221 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46221 a!2938))))))

(declare-fun b!1383917 () Bool)

(declare-fun res!925498 () Bool)

(assert (=> b!1383917 (=> (not res!925498) (not e!784264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383917 (= res!925498 (validKeyInArray!0 (select (arr!45669 a!2938) i!1065)))))

(declare-fun b!1383918 () Bool)

(assert (=> b!1383918 (= e!784263 (validKeyInArray!0 (select (arr!45669 a!2938) startIndex!16)))))

(assert (= (and start!118326 res!925496) b!1383916))

(assert (= (and b!1383916 res!925494) b!1383917))

(assert (= (and b!1383917 res!925498) b!1383912))

(assert (= (and b!1383912 res!925495) b!1383915))

(assert (= (and b!1383915 res!925497) b!1383910))

(assert (= (and b!1383910 res!925493) b!1383913))

(assert (= (and b!1383913 res!925499) b!1383918))

(assert (= (and b!1383913 c!128651) b!1383911))

(assert (= (and b!1383913 (not c!128651)) b!1383914))

(declare-fun m!1268667 () Bool)

(assert (=> start!118326 m!1268667))

(declare-fun m!1268669 () Bool)

(assert (=> start!118326 m!1268669))

(declare-fun m!1268671 () Bool)

(assert (=> b!1383918 m!1268671))

(assert (=> b!1383918 m!1268671))

(declare-fun m!1268673 () Bool)

(assert (=> b!1383918 m!1268673))

(declare-fun m!1268675 () Bool)

(assert (=> b!1383911 m!1268675))

(declare-fun m!1268677 () Bool)

(assert (=> b!1383911 m!1268677))

(assert (=> b!1383911 m!1268677))

(declare-fun m!1268679 () Bool)

(assert (=> b!1383911 m!1268679))

(declare-fun m!1268681 () Bool)

(assert (=> b!1383911 m!1268681))

(declare-fun m!1268683 () Bool)

(assert (=> b!1383911 m!1268683))

(assert (=> b!1383911 m!1268671))

(declare-fun m!1268685 () Bool)

(assert (=> b!1383911 m!1268685))

(assert (=> b!1383911 m!1268671))

(declare-fun m!1268687 () Bool)

(assert (=> b!1383911 m!1268687))

(declare-fun m!1268689 () Bool)

(assert (=> b!1383917 m!1268689))

(assert (=> b!1383917 m!1268689))

(declare-fun m!1268691 () Bool)

(assert (=> b!1383917 m!1268691))

(declare-fun m!1268693 () Bool)

(assert (=> b!1383915 m!1268693))

(assert (=> b!1383910 m!1268689))

(declare-fun m!1268695 () Bool)

(assert (=> b!1383912 m!1268695))

(push 1)

(assert (not b!1383911))

(assert (not b!1383918))

(assert (not b!1383915))

(assert (not b!1383917))

(assert (not start!118326))

(assert (not b!1383912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

