; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118812 () Bool)

(assert start!118812)

(declare-fun b!1387834 () Bool)

(declare-fun e!786284 () Bool)

(declare-datatypes ((array!94986 0))(
  ( (array!94987 (arr!45867 (Array (_ BitVec 32) (_ BitVec 64))) (size!46418 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94986)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387834 (= e!786284 (validKeyInArray!0 (select (arr!45867 a!2938) startIndex!16)))))

(declare-fun b!1387835 () Bool)

(declare-fun res!928231 () Bool)

(declare-fun e!786286 () Bool)

(assert (=> b!1387835 (=> (not res!928231) (not e!786286))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1387835 (= res!928231 (validKeyInArray!0 (select (arr!45867 a!2938) i!1065)))))

(declare-fun b!1387836 () Bool)

(declare-fun res!928230 () Bool)

(assert (=> b!1387836 (=> (not res!928230) (not e!786286))))

(declare-datatypes ((List!32382 0))(
  ( (Nil!32379) (Cons!32378 (h!33596 (_ BitVec 64)) (t!47068 List!32382)) )
))
(declare-fun arrayNoDuplicates!0 (array!94986 (_ BitVec 32) List!32382) Bool)

(assert (=> b!1387836 (= res!928230 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32379))))

(declare-fun b!1387837 () Bool)

(declare-fun res!928228 () Bool)

(assert (=> b!1387837 (=> (not res!928228) (not e!786286))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94986 (_ BitVec 32)) Bool)

(assert (=> b!1387837 (= res!928228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387838 () Bool)

(declare-datatypes ((Unit!46254 0))(
  ( (Unit!46255) )
))
(declare-fun e!786285 () Unit!46254)

(declare-fun lt!609974 () Unit!46254)

(assert (=> b!1387838 (= e!786285 lt!609974)))

(declare-fun lt!609975 () Unit!46254)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46254)

(assert (=> b!1387838 (= lt!609975 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10114 0))(
  ( (MissingZero!10114 (index!42827 (_ BitVec 32))) (Found!10114 (index!42828 (_ BitVec 32))) (Intermediate!10114 (undefined!10926 Bool) (index!42829 (_ BitVec 32)) (x!124593 (_ BitVec 32))) (Undefined!10114) (MissingVacant!10114 (index!42830 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94986 (_ BitVec 32)) SeekEntryResult!10114)

(assert (=> b!1387838 (= (seekEntryOrOpen!0 (select (arr!45867 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45867 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94987 (store (arr!45867 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46418 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46254)

(assert (=> b!1387838 (= lt!609974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387838 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387839 () Bool)

(declare-fun Unit!46256 () Unit!46254)

(assert (=> b!1387839 (= e!786285 Unit!46256)))

(declare-fun res!928229 () Bool)

(assert (=> start!118812 (=> (not res!928229) (not e!786286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118812 (= res!928229 (validMask!0 mask!2987))))

(assert (=> start!118812 e!786286))

(assert (=> start!118812 true))

(declare-fun array_inv!35148 (array!94986) Bool)

(assert (=> start!118812 (array_inv!35148 a!2938)))

(declare-fun b!1387840 () Bool)

(declare-fun res!928227 () Bool)

(assert (=> b!1387840 (=> (not res!928227) (not e!786286))))

(assert (=> b!1387840 (= res!928227 (and (= (size!46418 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46418 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46418 a!2938))))))

(declare-fun b!1387841 () Bool)

(declare-fun res!928225 () Bool)

(assert (=> b!1387841 (=> (not res!928225) (not e!786286))))

(assert (=> b!1387841 (= res!928225 (and (not (= (select (arr!45867 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45867 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387842 () Bool)

(assert (=> b!1387842 (= e!786286 false)))

(declare-fun lt!609973 () Unit!46254)

(assert (=> b!1387842 (= lt!609973 e!786285)))

(declare-fun c!129252 () Bool)

(assert (=> b!1387842 (= c!129252 e!786284)))

(declare-fun res!928226 () Bool)

(assert (=> b!1387842 (=> (not res!928226) (not e!786284))))

(assert (=> b!1387842 (= res!928226 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118812 res!928229) b!1387840))

(assert (= (and b!1387840 res!928227) b!1387835))

(assert (= (and b!1387835 res!928231) b!1387836))

(assert (= (and b!1387836 res!928230) b!1387837))

(assert (= (and b!1387837 res!928228) b!1387841))

(assert (= (and b!1387841 res!928225) b!1387842))

(assert (= (and b!1387842 res!928226) b!1387834))

(assert (= (and b!1387842 c!129252) b!1387838))

(assert (= (and b!1387842 (not c!129252)) b!1387839))

(declare-fun m!1273533 () Bool)

(assert (=> start!118812 m!1273533))

(declare-fun m!1273535 () Bool)

(assert (=> start!118812 m!1273535))

(declare-fun m!1273537 () Bool)

(assert (=> b!1387835 m!1273537))

(assert (=> b!1387835 m!1273537))

(declare-fun m!1273539 () Bool)

(assert (=> b!1387835 m!1273539))

(assert (=> b!1387841 m!1273537))

(declare-fun m!1273541 () Bool)

(assert (=> b!1387838 m!1273541))

(declare-fun m!1273543 () Bool)

(assert (=> b!1387838 m!1273543))

(assert (=> b!1387838 m!1273543))

(declare-fun m!1273545 () Bool)

(assert (=> b!1387838 m!1273545))

(declare-fun m!1273547 () Bool)

(assert (=> b!1387838 m!1273547))

(declare-fun m!1273549 () Bool)

(assert (=> b!1387838 m!1273549))

(declare-fun m!1273551 () Bool)

(assert (=> b!1387838 m!1273551))

(declare-fun m!1273553 () Bool)

(assert (=> b!1387838 m!1273553))

(assert (=> b!1387838 m!1273551))

(declare-fun m!1273555 () Bool)

(assert (=> b!1387838 m!1273555))

(declare-fun m!1273557 () Bool)

(assert (=> b!1387837 m!1273557))

(declare-fun m!1273559 () Bool)

(assert (=> b!1387836 m!1273559))

(assert (=> b!1387834 m!1273551))

(assert (=> b!1387834 m!1273551))

(declare-fun m!1273561 () Bool)

(assert (=> b!1387834 m!1273561))

(push 1)

(assert (not start!118812))

(assert (not b!1387834))

(assert (not b!1387836))

(assert (not b!1387835))

(assert (not b!1387837))

(assert (not b!1387838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

