; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118404 () Bool)

(assert start!118404)

(declare-fun b!1384999 () Bool)

(declare-datatypes ((Unit!46077 0))(
  ( (Unit!46078) )
))
(declare-fun e!784765 () Unit!46077)

(declare-fun lt!608977 () Unit!46077)

(assert (=> b!1384999 (= e!784765 lt!608977)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!608976 () Unit!46077)

(declare-datatypes ((array!94660 0))(
  ( (array!94661 (arr!45708 (Array (_ BitVec 32) (_ BitVec 64))) (size!46260 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94660)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46077)

(assert (=> b!1384999 (= lt!608976 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10125 0))(
  ( (MissingZero!10125 (index!42871 (_ BitVec 32))) (Found!10125 (index!42872 (_ BitVec 32))) (Intermediate!10125 (undefined!10937 Bool) (index!42873 (_ BitVec 32)) (x!124363 (_ BitVec 32))) (Undefined!10125) (MissingVacant!10125 (index!42874 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94660 (_ BitVec 32)) SeekEntryResult!10125)

(assert (=> b!1384999 (= (seekEntryOrOpen!0 (select (arr!45708 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45708 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94661 (store (arr!45708 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46260 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46077)

(assert (=> b!1384999 (= lt!608977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94660 (_ BitVec 32)) Bool)

(assert (=> b!1384999 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385000 () Bool)

(declare-fun res!926348 () Bool)

(declare-fun e!784767 () Bool)

(assert (=> b!1385000 (=> (not res!926348) (not e!784767))))

(assert (=> b!1385000 (= res!926348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385001 () Bool)

(declare-fun res!926349 () Bool)

(assert (=> b!1385001 (=> (not res!926349) (not e!784767))))

(declare-datatypes ((List!32314 0))(
  ( (Nil!32311) (Cons!32310 (h!33519 (_ BitVec 64)) (t!47000 List!32314)) )
))
(declare-fun arrayNoDuplicates!0 (array!94660 (_ BitVec 32) List!32314) Bool)

(assert (=> b!1385001 (= res!926349 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32311))))

(declare-fun b!1385003 () Bool)

(declare-fun res!926351 () Bool)

(assert (=> b!1385003 (=> (not res!926351) (not e!784767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385003 (= res!926351 (validKeyInArray!0 (select (arr!45708 a!2938) i!1065)))))

(declare-fun b!1385004 () Bool)

(declare-fun e!784768 () Bool)

(assert (=> b!1385004 (= e!784768 (validKeyInArray!0 (select (arr!45708 a!2938) startIndex!16)))))

(declare-fun b!1385005 () Bool)

(declare-fun res!926350 () Bool)

(assert (=> b!1385005 (=> (not res!926350) (not e!784767))))

(assert (=> b!1385005 (= res!926350 (and (not (= (select (arr!45708 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45708 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!926354 () Bool)

(assert (=> start!118404 (=> (not res!926354) (not e!784767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118404 (= res!926354 (validMask!0 mask!2987))))

(assert (=> start!118404 e!784767))

(assert (=> start!118404 true))

(declare-fun array_inv!34941 (array!94660) Bool)

(assert (=> start!118404 (array_inv!34941 a!2938)))

(declare-fun b!1385002 () Bool)

(declare-fun res!926353 () Bool)

(assert (=> b!1385002 (=> (not res!926353) (not e!784767))))

(assert (=> b!1385002 (= res!926353 (and (= (size!46260 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46260 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46260 a!2938))))))

(declare-fun b!1385006 () Bool)

(declare-fun Unit!46079 () Unit!46077)

(assert (=> b!1385006 (= e!784765 Unit!46079)))

(declare-fun b!1385007 () Bool)

(assert (=> b!1385007 (= e!784767 false)))

(declare-fun lt!608978 () Unit!46077)

(assert (=> b!1385007 (= lt!608978 e!784765)))

(declare-fun c!128768 () Bool)

(assert (=> b!1385007 (= c!128768 e!784768)))

(declare-fun res!926352 () Bool)

(assert (=> b!1385007 (=> (not res!926352) (not e!784768))))

(assert (=> b!1385007 (= res!926352 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118404 res!926354) b!1385002))

(assert (= (and b!1385002 res!926353) b!1385003))

(assert (= (and b!1385003 res!926351) b!1385001))

(assert (= (and b!1385001 res!926349) b!1385000))

(assert (= (and b!1385000 res!926348) b!1385005))

(assert (= (and b!1385005 res!926350) b!1385007))

(assert (= (and b!1385007 res!926352) b!1385004))

(assert (= (and b!1385007 c!128768) b!1384999))

(assert (= (and b!1385007 (not c!128768)) b!1385006))

(declare-fun m!1269885 () Bool)

(assert (=> b!1384999 m!1269885))

(declare-fun m!1269887 () Bool)

(assert (=> b!1384999 m!1269887))

(assert (=> b!1384999 m!1269887))

(declare-fun m!1269889 () Bool)

(assert (=> b!1384999 m!1269889))

(declare-fun m!1269891 () Bool)

(assert (=> b!1384999 m!1269891))

(declare-fun m!1269893 () Bool)

(assert (=> b!1384999 m!1269893))

(declare-fun m!1269895 () Bool)

(assert (=> b!1384999 m!1269895))

(declare-fun m!1269897 () Bool)

(assert (=> b!1384999 m!1269897))

(assert (=> b!1384999 m!1269895))

(declare-fun m!1269899 () Bool)

(assert (=> b!1384999 m!1269899))

(assert (=> b!1385004 m!1269895))

(assert (=> b!1385004 m!1269895))

(declare-fun m!1269901 () Bool)

(assert (=> b!1385004 m!1269901))

(declare-fun m!1269903 () Bool)

(assert (=> b!1385001 m!1269903))

(declare-fun m!1269905 () Bool)

(assert (=> b!1385003 m!1269905))

(assert (=> b!1385003 m!1269905))

(declare-fun m!1269907 () Bool)

(assert (=> b!1385003 m!1269907))

(declare-fun m!1269909 () Bool)

(assert (=> b!1385000 m!1269909))

(assert (=> b!1385005 m!1269905))

(declare-fun m!1269911 () Bool)

(assert (=> start!118404 m!1269911))

(declare-fun m!1269913 () Bool)

(assert (=> start!118404 m!1269913))

(push 1)

(assert (not b!1385000))

(assert (not b!1385001))

(assert (not b!1385003))

(assert (not b!1385004))

(assert (not b!1384999))

(assert (not start!118404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

