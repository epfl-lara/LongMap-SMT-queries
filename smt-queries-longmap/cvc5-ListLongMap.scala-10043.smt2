; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118362 () Bool)

(assert start!118362)

(declare-fun b!1384396 () Bool)

(declare-fun e!784477 () Bool)

(assert (=> b!1384396 (= e!784477 false)))

(declare-datatypes ((Unit!46014 0))(
  ( (Unit!46015) )
))
(declare-fun lt!608716 () Unit!46014)

(declare-fun e!784479 () Unit!46014)

(assert (=> b!1384396 (= lt!608716 e!784479)))

(declare-fun c!128705 () Bool)

(declare-fun e!784478 () Bool)

(assert (=> b!1384396 (= c!128705 e!784478)))

(declare-fun res!925874 () Bool)

(assert (=> b!1384396 (=> (not res!925874) (not e!784478))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384396 (= res!925874 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384397 () Bool)

(declare-fun Unit!46016 () Unit!46014)

(assert (=> b!1384397 (= e!784479 Unit!46016)))

(declare-fun b!1384398 () Bool)

(declare-fun res!925872 () Bool)

(assert (=> b!1384398 (=> (not res!925872) (not e!784477))))

(declare-datatypes ((array!94618 0))(
  ( (array!94619 (arr!45687 (Array (_ BitVec 32) (_ BitVec 64))) (size!46239 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94618)

(assert (=> b!1384398 (= res!925872 (and (not (= (select (arr!45687 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45687 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384399 () Bool)

(declare-fun res!925871 () Bool)

(assert (=> b!1384399 (=> (not res!925871) (not e!784477))))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384399 (= res!925871 (and (= (size!46239 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46239 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46239 a!2938))))))

(declare-fun b!1384400 () Bool)

(declare-fun res!925875 () Bool)

(assert (=> b!1384400 (=> (not res!925875) (not e!784477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384400 (= res!925875 (validKeyInArray!0 (select (arr!45687 a!2938) i!1065)))))

(declare-fun b!1384401 () Bool)

(declare-fun res!925876 () Bool)

(assert (=> b!1384401 (=> (not res!925876) (not e!784477))))

(declare-datatypes ((List!32293 0))(
  ( (Nil!32290) (Cons!32289 (h!33498 (_ BitVec 64)) (t!46979 List!32293)) )
))
(declare-fun arrayNoDuplicates!0 (array!94618 (_ BitVec 32) List!32293) Bool)

(assert (=> b!1384401 (= res!925876 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32290))))

(declare-fun b!1384402 () Bool)

(assert (=> b!1384402 (= e!784478 (validKeyInArray!0 (select (arr!45687 a!2938) startIndex!16)))))

(declare-fun res!925877 () Bool)

(assert (=> start!118362 (=> (not res!925877) (not e!784477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118362 (= res!925877 (validMask!0 mask!2987))))

(assert (=> start!118362 e!784477))

(assert (=> start!118362 true))

(declare-fun array_inv!34920 (array!94618) Bool)

(assert (=> start!118362 (array_inv!34920 a!2938)))

(declare-fun b!1384403 () Bool)

(declare-fun lt!608717 () Unit!46014)

(assert (=> b!1384403 (= e!784479 lt!608717)))

(declare-fun lt!608715 () Unit!46014)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46014)

(assert (=> b!1384403 (= lt!608715 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10104 0))(
  ( (MissingZero!10104 (index!42787 (_ BitVec 32))) (Found!10104 (index!42788 (_ BitVec 32))) (Intermediate!10104 (undefined!10916 Bool) (index!42789 (_ BitVec 32)) (x!124286 (_ BitVec 32))) (Undefined!10104) (MissingVacant!10104 (index!42790 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94618 (_ BitVec 32)) SeekEntryResult!10104)

(assert (=> b!1384403 (= (seekEntryOrOpen!0 (select (arr!45687 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45687 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94619 (store (arr!45687 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46239 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46014)

(assert (=> b!1384403 (= lt!608717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94618 (_ BitVec 32)) Bool)

(assert (=> b!1384403 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384404 () Bool)

(declare-fun res!925873 () Bool)

(assert (=> b!1384404 (=> (not res!925873) (not e!784477))))

(assert (=> b!1384404 (= res!925873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118362 res!925877) b!1384399))

(assert (= (and b!1384399 res!925871) b!1384400))

(assert (= (and b!1384400 res!925875) b!1384401))

(assert (= (and b!1384401 res!925876) b!1384404))

(assert (= (and b!1384404 res!925873) b!1384398))

(assert (= (and b!1384398 res!925872) b!1384396))

(assert (= (and b!1384396 res!925874) b!1384402))

(assert (= (and b!1384396 c!128705) b!1384403))

(assert (= (and b!1384396 (not c!128705)) b!1384397))

(declare-fun m!1269207 () Bool)

(assert (=> b!1384404 m!1269207))

(declare-fun m!1269209 () Bool)

(assert (=> start!118362 m!1269209))

(declare-fun m!1269211 () Bool)

(assert (=> start!118362 m!1269211))

(declare-fun m!1269213 () Bool)

(assert (=> b!1384402 m!1269213))

(assert (=> b!1384402 m!1269213))

(declare-fun m!1269215 () Bool)

(assert (=> b!1384402 m!1269215))

(declare-fun m!1269217 () Bool)

(assert (=> b!1384400 m!1269217))

(assert (=> b!1384400 m!1269217))

(declare-fun m!1269219 () Bool)

(assert (=> b!1384400 m!1269219))

(declare-fun m!1269221 () Bool)

(assert (=> b!1384403 m!1269221))

(declare-fun m!1269223 () Bool)

(assert (=> b!1384403 m!1269223))

(assert (=> b!1384403 m!1269223))

(declare-fun m!1269225 () Bool)

(assert (=> b!1384403 m!1269225))

(declare-fun m!1269227 () Bool)

(assert (=> b!1384403 m!1269227))

(declare-fun m!1269229 () Bool)

(assert (=> b!1384403 m!1269229))

(assert (=> b!1384403 m!1269213))

(declare-fun m!1269231 () Bool)

(assert (=> b!1384403 m!1269231))

(assert (=> b!1384403 m!1269213))

(declare-fun m!1269233 () Bool)

(assert (=> b!1384403 m!1269233))

(assert (=> b!1384398 m!1269217))

(declare-fun m!1269235 () Bool)

(assert (=> b!1384401 m!1269235))

(push 1)

(assert (not b!1384402))

(assert (not b!1384400))

(assert (not b!1384403))

(assert (not start!118362))

(assert (not b!1384401))

(assert (not b!1384404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

