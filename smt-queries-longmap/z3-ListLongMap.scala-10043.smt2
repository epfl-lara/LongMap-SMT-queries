; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118364 () Bool)

(assert start!118364)

(declare-fun b!1384438 () Bool)

(declare-fun e!784497 () Bool)

(assert (=> b!1384438 (= e!784497 false)))

(declare-datatypes ((Unit!46170 0))(
  ( (Unit!46171) )
))
(declare-fun lt!608892 () Unit!46170)

(declare-fun e!784496 () Unit!46170)

(assert (=> b!1384438 (= lt!608892 e!784496)))

(declare-fun c!128721 () Bool)

(declare-fun e!784498 () Bool)

(assert (=> b!1384438 (= c!128721 e!784498)))

(declare-fun res!925876 () Bool)

(assert (=> b!1384438 (=> (not res!925876) (not e!784498))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384438 (= res!925876 (not (= startIndex!16 i!1065)))))

(declare-fun res!925880 () Bool)

(assert (=> start!118364 (=> (not res!925880) (not e!784497))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118364 (= res!925880 (validMask!0 mask!2987))))

(assert (=> start!118364 e!784497))

(assert (=> start!118364 true))

(declare-datatypes ((array!94667 0))(
  ( (array!94668 (arr!45711 (Array (_ BitVec 32) (_ BitVec 64))) (size!46261 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94667)

(declare-fun array_inv!34739 (array!94667) Bool)

(assert (=> start!118364 (array_inv!34739 a!2938)))

(declare-fun b!1384439 () Bool)

(declare-fun Unit!46172 () Unit!46170)

(assert (=> b!1384439 (= e!784496 Unit!46172)))

(declare-fun b!1384440 () Bool)

(declare-fun res!925878 () Bool)

(assert (=> b!1384440 (=> (not res!925878) (not e!784497))))

(assert (=> b!1384440 (= res!925878 (and (not (= (select (arr!45711 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45711 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384441 () Bool)

(declare-fun lt!608890 () Unit!46170)

(assert (=> b!1384441 (= e!784496 lt!608890)))

(declare-fun lt!608891 () Unit!46170)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46170)

(assert (=> b!1384441 (= lt!608891 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10104 0))(
  ( (MissingZero!10104 (index!42787 (_ BitVec 32))) (Found!10104 (index!42788 (_ BitVec 32))) (Intermediate!10104 (undefined!10916 Bool) (index!42789 (_ BitVec 32)) (x!124289 (_ BitVec 32))) (Undefined!10104) (MissingVacant!10104 (index!42790 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94667 (_ BitVec 32)) SeekEntryResult!10104)

(assert (=> b!1384441 (= (seekEntryOrOpen!0 (select (arr!45711 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45711 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94668 (store (arr!45711 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46261 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46170)

(assert (=> b!1384441 (= lt!608890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94667 (_ BitVec 32)) Bool)

(assert (=> b!1384441 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384442 () Bool)

(declare-fun res!925877 () Bool)

(assert (=> b!1384442 (=> (not res!925877) (not e!784497))))

(declare-datatypes ((List!32239 0))(
  ( (Nil!32236) (Cons!32235 (h!33444 (_ BitVec 64)) (t!46933 List!32239)) )
))
(declare-fun arrayNoDuplicates!0 (array!94667 (_ BitVec 32) List!32239) Bool)

(assert (=> b!1384442 (= res!925877 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32236))))

(declare-fun b!1384443 () Bool)

(declare-fun res!925882 () Bool)

(assert (=> b!1384443 (=> (not res!925882) (not e!784497))))

(assert (=> b!1384443 (= res!925882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384444 () Bool)

(declare-fun res!925879 () Bool)

(assert (=> b!1384444 (=> (not res!925879) (not e!784497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384444 (= res!925879 (validKeyInArray!0 (select (arr!45711 a!2938) i!1065)))))

(declare-fun b!1384445 () Bool)

(declare-fun res!925881 () Bool)

(assert (=> b!1384445 (=> (not res!925881) (not e!784497))))

(assert (=> b!1384445 (= res!925881 (and (= (size!46261 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46261 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46261 a!2938))))))

(declare-fun b!1384446 () Bool)

(assert (=> b!1384446 (= e!784498 (validKeyInArray!0 (select (arr!45711 a!2938) startIndex!16)))))

(assert (= (and start!118364 res!925880) b!1384445))

(assert (= (and b!1384445 res!925881) b!1384444))

(assert (= (and b!1384444 res!925879) b!1384442))

(assert (= (and b!1384442 res!925877) b!1384443))

(assert (= (and b!1384443 res!925882) b!1384440))

(assert (= (and b!1384440 res!925878) b!1384438))

(assert (= (and b!1384438 res!925876) b!1384446))

(assert (= (and b!1384438 c!128721) b!1384441))

(assert (= (and b!1384438 (not c!128721)) b!1384439))

(declare-fun m!1269681 () Bool)

(assert (=> b!1384444 m!1269681))

(assert (=> b!1384444 m!1269681))

(declare-fun m!1269683 () Bool)

(assert (=> b!1384444 m!1269683))

(declare-fun m!1269685 () Bool)

(assert (=> b!1384442 m!1269685))

(declare-fun m!1269687 () Bool)

(assert (=> b!1384441 m!1269687))

(declare-fun m!1269689 () Bool)

(assert (=> b!1384441 m!1269689))

(assert (=> b!1384441 m!1269689))

(declare-fun m!1269691 () Bool)

(assert (=> b!1384441 m!1269691))

(declare-fun m!1269693 () Bool)

(assert (=> b!1384441 m!1269693))

(declare-fun m!1269695 () Bool)

(assert (=> b!1384441 m!1269695))

(declare-fun m!1269697 () Bool)

(assert (=> b!1384441 m!1269697))

(declare-fun m!1269699 () Bool)

(assert (=> b!1384441 m!1269699))

(assert (=> b!1384441 m!1269697))

(declare-fun m!1269701 () Bool)

(assert (=> b!1384441 m!1269701))

(declare-fun m!1269703 () Bool)

(assert (=> b!1384443 m!1269703))

(assert (=> b!1384446 m!1269697))

(assert (=> b!1384446 m!1269697))

(declare-fun m!1269705 () Bool)

(assert (=> b!1384446 m!1269705))

(declare-fun m!1269707 () Bool)

(assert (=> start!118364 m!1269707))

(declare-fun m!1269709 () Bool)

(assert (=> start!118364 m!1269709))

(assert (=> b!1384440 m!1269681))

(check-sat (not b!1384443) (not b!1384444) (not b!1384446) (not start!118364) (not b!1384442) (not b!1384441))
