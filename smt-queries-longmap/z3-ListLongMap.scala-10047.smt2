; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118382 () Bool)

(assert start!118382)

(declare-fun b!1384695 () Bool)

(declare-fun e!784627 () Bool)

(declare-datatypes ((array!94638 0))(
  ( (array!94639 (arr!45697 (Array (_ BitVec 32) (_ BitVec 64))) (size!46249 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94638)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384695 (= e!784627 (validKeyInArray!0 (select (arr!45697 a!2938) startIndex!16)))))

(declare-fun b!1384696 () Bool)

(declare-fun res!926117 () Bool)

(declare-fun e!784630 () Bool)

(assert (=> b!1384696 (=> (not res!926117) (not e!784630))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94638 (_ BitVec 32)) Bool)

(assert (=> b!1384696 (= res!926117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384697 () Bool)

(declare-fun e!784626 () Bool)

(assert (=> b!1384697 (= e!784626 (not (bvsle startIndex!16 (size!46249 a!2938))))))

(declare-fun lt!608863 () array!94638)

(assert (=> b!1384697 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608863 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((Unit!46044 0))(
  ( (Unit!46045) )
))
(declare-fun lt!608864 () Unit!46044)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46044)

(assert (=> b!1384697 (= lt!608864 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384698 () Bool)

(declare-fun res!926114 () Bool)

(assert (=> b!1384698 (=> (not res!926114) (not e!784630))))

(declare-datatypes ((List!32303 0))(
  ( (Nil!32300) (Cons!32299 (h!33508 (_ BitVec 64)) (t!46989 List!32303)) )
))
(declare-fun arrayNoDuplicates!0 (array!94638 (_ BitVec 32) List!32303) Bool)

(assert (=> b!1384698 (= res!926114 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32300))))

(declare-fun res!926110 () Bool)

(assert (=> start!118382 (=> (not res!926110) (not e!784630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118382 (= res!926110 (validMask!0 mask!2987))))

(assert (=> start!118382 e!784630))

(assert (=> start!118382 true))

(declare-fun array_inv!34930 (array!94638) Bool)

(assert (=> start!118382 (array_inv!34930 a!2938)))

(declare-fun b!1384699 () Bool)

(declare-fun res!926116 () Bool)

(assert (=> b!1384699 (=> (not res!926116) (not e!784630))))

(assert (=> b!1384699 (= res!926116 (and (= (size!46249 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46249 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46249 a!2938))))))

(declare-fun b!1384700 () Bool)

(declare-fun e!784629 () Unit!46044)

(declare-fun lt!608866 () Unit!46044)

(assert (=> b!1384700 (= e!784629 lt!608866)))

(declare-fun lt!608865 () Unit!46044)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46044)

(assert (=> b!1384700 (= lt!608865 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10114 0))(
  ( (MissingZero!10114 (index!42827 (_ BitVec 32))) (Found!10114 (index!42828 (_ BitVec 32))) (Intermediate!10114 (undefined!10926 Bool) (index!42829 (_ BitVec 32)) (x!124328 (_ BitVec 32))) (Undefined!10114) (MissingVacant!10114 (index!42830 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94638 (_ BitVec 32)) SeekEntryResult!10114)

(assert (=> b!1384700 (= (seekEntryOrOpen!0 (select (arr!45697 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45697 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608863 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46044)

(assert (=> b!1384700 (= lt!608866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384700 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384701 () Bool)

(declare-fun Unit!46046 () Unit!46044)

(assert (=> b!1384701 (= e!784629 Unit!46046)))

(declare-fun b!1384702 () Bool)

(declare-fun res!926112 () Bool)

(assert (=> b!1384702 (=> (not res!926112) (not e!784630))))

(assert (=> b!1384702 (= res!926112 (validKeyInArray!0 (select (arr!45697 a!2938) i!1065)))))

(declare-fun b!1384703 () Bool)

(assert (=> b!1384703 (= e!784630 e!784626)))

(declare-fun res!926115 () Bool)

(assert (=> b!1384703 (=> (not res!926115) (not e!784626))))

(assert (=> b!1384703 (= res!926115 (and (bvslt startIndex!16 (bvsub (size!46249 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608867 () Unit!46044)

(assert (=> b!1384703 (= lt!608867 e!784629)))

(declare-fun c!128735 () Bool)

(assert (=> b!1384703 (= c!128735 e!784627)))

(declare-fun res!926111 () Bool)

(assert (=> b!1384703 (=> (not res!926111) (not e!784627))))

(assert (=> b!1384703 (= res!926111 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384703 (= lt!608863 (array!94639 (store (arr!45697 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46249 a!2938)))))

(declare-fun b!1384704 () Bool)

(declare-fun res!926113 () Bool)

(assert (=> b!1384704 (=> (not res!926113) (not e!784630))))

(assert (=> b!1384704 (= res!926113 (and (not (= (select (arr!45697 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45697 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118382 res!926110) b!1384699))

(assert (= (and b!1384699 res!926116) b!1384702))

(assert (= (and b!1384702 res!926112) b!1384698))

(assert (= (and b!1384698 res!926114) b!1384696))

(assert (= (and b!1384696 res!926117) b!1384704))

(assert (= (and b!1384704 res!926113) b!1384703))

(assert (= (and b!1384703 res!926111) b!1384695))

(assert (= (and b!1384703 c!128735) b!1384700))

(assert (= (and b!1384703 (not c!128735)) b!1384701))

(assert (= (and b!1384703 res!926115) b!1384697))

(declare-fun m!1269543 () Bool)

(assert (=> b!1384696 m!1269543))

(declare-fun m!1269545 () Bool)

(assert (=> b!1384703 m!1269545))

(declare-fun m!1269547 () Bool)

(assert (=> b!1384695 m!1269547))

(assert (=> b!1384695 m!1269547))

(declare-fun m!1269549 () Bool)

(assert (=> b!1384695 m!1269549))

(declare-fun m!1269551 () Bool)

(assert (=> b!1384704 m!1269551))

(declare-fun m!1269553 () Bool)

(assert (=> b!1384697 m!1269553))

(declare-fun m!1269555 () Bool)

(assert (=> b!1384697 m!1269555))

(declare-fun m!1269557 () Bool)

(assert (=> start!118382 m!1269557))

(declare-fun m!1269559 () Bool)

(assert (=> start!118382 m!1269559))

(assert (=> b!1384702 m!1269551))

(assert (=> b!1384702 m!1269551))

(declare-fun m!1269561 () Bool)

(assert (=> b!1384702 m!1269561))

(declare-fun m!1269563 () Bool)

(assert (=> b!1384698 m!1269563))

(declare-fun m!1269565 () Bool)

(assert (=> b!1384700 m!1269565))

(assert (=> b!1384700 m!1269545))

(declare-fun m!1269567 () Bool)

(assert (=> b!1384700 m!1269567))

(assert (=> b!1384700 m!1269547))

(declare-fun m!1269569 () Bool)

(assert (=> b!1384700 m!1269569))

(declare-fun m!1269571 () Bool)

(assert (=> b!1384700 m!1269571))

(assert (=> b!1384700 m!1269565))

(declare-fun m!1269573 () Bool)

(assert (=> b!1384700 m!1269573))

(assert (=> b!1384700 m!1269547))

(declare-fun m!1269575 () Bool)

(assert (=> b!1384700 m!1269575))

(check-sat (not b!1384702) (not b!1384700) (not b!1384697) (not b!1384695) (not b!1384698) (not b!1384696) (not start!118382))
(check-sat)
