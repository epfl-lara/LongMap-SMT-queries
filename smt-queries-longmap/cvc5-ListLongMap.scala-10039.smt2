; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118338 () Bool)

(assert start!118338)

(declare-fun b!1384073 () Bool)

(declare-datatypes ((Unit!45978 0))(
  ( (Unit!45979) )
))
(declare-fun e!784334 () Unit!45978)

(declare-fun lt!608609 () Unit!45978)

(assert (=> b!1384073 (= e!784334 lt!608609)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94594 0))(
  ( (array!94595 (arr!45675 (Array (_ BitVec 32) (_ BitVec 64))) (size!46227 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94594)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608607 () Unit!45978)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45978)

(assert (=> b!1384073 (= lt!608607 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10092 0))(
  ( (MissingZero!10092 (index!42739 (_ BitVec 32))) (Found!10092 (index!42740 (_ BitVec 32))) (Intermediate!10092 (undefined!10904 Bool) (index!42741 (_ BitVec 32)) (x!124242 (_ BitVec 32))) (Undefined!10092) (MissingVacant!10092 (index!42742 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94594 (_ BitVec 32)) SeekEntryResult!10092)

(assert (=> b!1384073 (= (seekEntryOrOpen!0 (select (arr!45675 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45675 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94595 (store (arr!45675 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46227 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45978)

(assert (=> b!1384073 (= lt!608609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94594 (_ BitVec 32)) Bool)

(assert (=> b!1384073 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384074 () Bool)

(declare-fun e!784335 () Bool)

(assert (=> b!1384074 (= e!784335 false)))

(declare-fun lt!608608 () Unit!45978)

(assert (=> b!1384074 (= lt!608608 e!784334)))

(declare-fun c!128669 () Bool)

(declare-fun e!784336 () Bool)

(assert (=> b!1384074 (= c!128669 e!784336)))

(declare-fun res!925625 () Bool)

(assert (=> b!1384074 (=> (not res!925625) (not e!784336))))

(assert (=> b!1384074 (= res!925625 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384075 () Bool)

(declare-fun res!925624 () Bool)

(assert (=> b!1384075 (=> (not res!925624) (not e!784335))))

(declare-datatypes ((List!32281 0))(
  ( (Nil!32278) (Cons!32277 (h!33486 (_ BitVec 64)) (t!46967 List!32281)) )
))
(declare-fun arrayNoDuplicates!0 (array!94594 (_ BitVec 32) List!32281) Bool)

(assert (=> b!1384075 (= res!925624 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32278))))

(declare-fun b!1384076 () Bool)

(declare-fun res!925622 () Bool)

(assert (=> b!1384076 (=> (not res!925622) (not e!784335))))

(assert (=> b!1384076 (= res!925622 (and (not (= (select (arr!45675 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45675 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384077 () Bool)

(declare-fun res!925620 () Bool)

(assert (=> b!1384077 (=> (not res!925620) (not e!784335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384077 (= res!925620 (validKeyInArray!0 (select (arr!45675 a!2938) i!1065)))))

(declare-fun b!1384078 () Bool)

(assert (=> b!1384078 (= e!784336 (validKeyInArray!0 (select (arr!45675 a!2938) startIndex!16)))))

(declare-fun res!925619 () Bool)

(assert (=> start!118338 (=> (not res!925619) (not e!784335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118338 (= res!925619 (validMask!0 mask!2987))))

(assert (=> start!118338 e!784335))

(assert (=> start!118338 true))

(declare-fun array_inv!34908 (array!94594) Bool)

(assert (=> start!118338 (array_inv!34908 a!2938)))

(declare-fun b!1384072 () Bool)

(declare-fun res!925623 () Bool)

(assert (=> b!1384072 (=> (not res!925623) (not e!784335))))

(assert (=> b!1384072 (= res!925623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384079 () Bool)

(declare-fun Unit!45980 () Unit!45978)

(assert (=> b!1384079 (= e!784334 Unit!45980)))

(declare-fun b!1384080 () Bool)

(declare-fun res!925621 () Bool)

(assert (=> b!1384080 (=> (not res!925621) (not e!784335))))

(assert (=> b!1384080 (= res!925621 (and (= (size!46227 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46227 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46227 a!2938))))))

(assert (= (and start!118338 res!925619) b!1384080))

(assert (= (and b!1384080 res!925621) b!1384077))

(assert (= (and b!1384077 res!925620) b!1384075))

(assert (= (and b!1384075 res!925624) b!1384072))

(assert (= (and b!1384072 res!925623) b!1384076))

(assert (= (and b!1384076 res!925622) b!1384074))

(assert (= (and b!1384074 res!925625) b!1384078))

(assert (= (and b!1384074 c!128669) b!1384073))

(assert (= (and b!1384074 (not c!128669)) b!1384079))

(declare-fun m!1268847 () Bool)

(assert (=> b!1384076 m!1268847))

(declare-fun m!1268849 () Bool)

(assert (=> b!1384075 m!1268849))

(declare-fun m!1268851 () Bool)

(assert (=> b!1384072 m!1268851))

(assert (=> b!1384077 m!1268847))

(assert (=> b!1384077 m!1268847))

(declare-fun m!1268853 () Bool)

(assert (=> b!1384077 m!1268853))

(declare-fun m!1268855 () Bool)

(assert (=> b!1384078 m!1268855))

(assert (=> b!1384078 m!1268855))

(declare-fun m!1268857 () Bool)

(assert (=> b!1384078 m!1268857))

(declare-fun m!1268859 () Bool)

(assert (=> b!1384073 m!1268859))

(declare-fun m!1268861 () Bool)

(assert (=> b!1384073 m!1268861))

(assert (=> b!1384073 m!1268861))

(declare-fun m!1268863 () Bool)

(assert (=> b!1384073 m!1268863))

(declare-fun m!1268865 () Bool)

(assert (=> b!1384073 m!1268865))

(declare-fun m!1268867 () Bool)

(assert (=> b!1384073 m!1268867))

(assert (=> b!1384073 m!1268855))

(declare-fun m!1268869 () Bool)

(assert (=> b!1384073 m!1268869))

(assert (=> b!1384073 m!1268855))

(declare-fun m!1268871 () Bool)

(assert (=> b!1384073 m!1268871))

(declare-fun m!1268873 () Bool)

(assert (=> start!118338 m!1268873))

(declare-fun m!1268875 () Bool)

(assert (=> start!118338 m!1268875))

(push 1)

(assert (not b!1384078))

(assert (not b!1384072))

(assert (not b!1384077))

(assert (not start!118338))

(assert (not b!1384075))

(assert (not b!1384073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

