; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118344 () Bool)

(assert start!118344)

(declare-fun b!1384153 () Bool)

(declare-datatypes ((Unit!45987 0))(
  ( (Unit!45988) )
))
(declare-fun e!784370 () Unit!45987)

(declare-fun Unit!45989 () Unit!45987)

(assert (=> b!1384153 (= e!784370 Unit!45989)))

(declare-fun b!1384154 () Bool)

(declare-fun e!784371 () Bool)

(assert (=> b!1384154 (= e!784371 false)))

(declare-fun lt!608634 () Unit!45987)

(assert (=> b!1384154 (= lt!608634 e!784370)))

(declare-fun c!128678 () Bool)

(declare-fun e!784372 () Bool)

(assert (=> b!1384154 (= c!128678 e!784372)))

(declare-fun res!925682 () Bool)

(assert (=> b!1384154 (=> (not res!925682) (not e!784372))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384154 (= res!925682 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384155 () Bool)

(declare-fun res!925687 () Bool)

(assert (=> b!1384155 (=> (not res!925687) (not e!784371))))

(declare-datatypes ((array!94600 0))(
  ( (array!94601 (arr!45678 (Array (_ BitVec 32) (_ BitVec 64))) (size!46230 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94600)

(declare-datatypes ((List!32284 0))(
  ( (Nil!32281) (Cons!32280 (h!33489 (_ BitVec 64)) (t!46970 List!32284)) )
))
(declare-fun arrayNoDuplicates!0 (array!94600 (_ BitVec 32) List!32284) Bool)

(assert (=> b!1384155 (= res!925687 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32281))))

(declare-fun b!1384156 () Bool)

(declare-fun res!925684 () Bool)

(assert (=> b!1384156 (=> (not res!925684) (not e!784371))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94600 (_ BitVec 32)) Bool)

(assert (=> b!1384156 (= res!925684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384157 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384157 (= e!784372 (validKeyInArray!0 (select (arr!45678 a!2938) startIndex!16)))))

(declare-fun b!1384158 () Bool)

(declare-fun res!925683 () Bool)

(assert (=> b!1384158 (=> (not res!925683) (not e!784371))))

(assert (=> b!1384158 (= res!925683 (and (= (size!46230 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46230 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46230 a!2938))))))

(declare-fun b!1384159 () Bool)

(declare-fun lt!608636 () Unit!45987)

(assert (=> b!1384159 (= e!784370 lt!608636)))

(declare-fun lt!608635 () Unit!45987)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45987)

(assert (=> b!1384159 (= lt!608635 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10095 0))(
  ( (MissingZero!10095 (index!42751 (_ BitVec 32))) (Found!10095 (index!42752 (_ BitVec 32))) (Intermediate!10095 (undefined!10907 Bool) (index!42753 (_ BitVec 32)) (x!124253 (_ BitVec 32))) (Undefined!10095) (MissingVacant!10095 (index!42754 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94600 (_ BitVec 32)) SeekEntryResult!10095)

(assert (=> b!1384159 (= (seekEntryOrOpen!0 (select (arr!45678 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45678 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94601 (store (arr!45678 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46230 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45987)

(assert (=> b!1384159 (= lt!608636 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384159 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925685 () Bool)

(assert (=> start!118344 (=> (not res!925685) (not e!784371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118344 (= res!925685 (validMask!0 mask!2987))))

(assert (=> start!118344 e!784371))

(assert (=> start!118344 true))

(declare-fun array_inv!34911 (array!94600) Bool)

(assert (=> start!118344 (array_inv!34911 a!2938)))

(declare-fun b!1384160 () Bool)

(declare-fun res!925688 () Bool)

(assert (=> b!1384160 (=> (not res!925688) (not e!784371))))

(assert (=> b!1384160 (= res!925688 (and (not (= (select (arr!45678 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45678 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384161 () Bool)

(declare-fun res!925686 () Bool)

(assert (=> b!1384161 (=> (not res!925686) (not e!784371))))

(assert (=> b!1384161 (= res!925686 (validKeyInArray!0 (select (arr!45678 a!2938) i!1065)))))

(assert (= (and start!118344 res!925685) b!1384158))

(assert (= (and b!1384158 res!925683) b!1384161))

(assert (= (and b!1384161 res!925686) b!1384155))

(assert (= (and b!1384155 res!925687) b!1384156))

(assert (= (and b!1384156 res!925684) b!1384160))

(assert (= (and b!1384160 res!925688) b!1384154))

(assert (= (and b!1384154 res!925682) b!1384157))

(assert (= (and b!1384154 c!128678) b!1384159))

(assert (= (and b!1384154 (not c!128678)) b!1384153))

(declare-fun m!1268937 () Bool)

(assert (=> b!1384155 m!1268937))

(declare-fun m!1268939 () Bool)

(assert (=> b!1384156 m!1268939))

(declare-fun m!1268941 () Bool)

(assert (=> b!1384159 m!1268941))

(declare-fun m!1268943 () Bool)

(assert (=> b!1384159 m!1268943))

(assert (=> b!1384159 m!1268943))

(declare-fun m!1268945 () Bool)

(assert (=> b!1384159 m!1268945))

(declare-fun m!1268947 () Bool)

(assert (=> b!1384159 m!1268947))

(declare-fun m!1268949 () Bool)

(assert (=> b!1384159 m!1268949))

(declare-fun m!1268951 () Bool)

(assert (=> b!1384159 m!1268951))

(declare-fun m!1268953 () Bool)

(assert (=> b!1384159 m!1268953))

(assert (=> b!1384159 m!1268951))

(declare-fun m!1268955 () Bool)

(assert (=> b!1384159 m!1268955))

(declare-fun m!1268957 () Bool)

(assert (=> b!1384161 m!1268957))

(assert (=> b!1384161 m!1268957))

(declare-fun m!1268959 () Bool)

(assert (=> b!1384161 m!1268959))

(assert (=> b!1384157 m!1268951))

(assert (=> b!1384157 m!1268951))

(declare-fun m!1268961 () Bool)

(assert (=> b!1384157 m!1268961))

(assert (=> b!1384160 m!1268957))

(declare-fun m!1268963 () Bool)

(assert (=> start!118344 m!1268963))

(declare-fun m!1268965 () Bool)

(assert (=> start!118344 m!1268965))

(push 1)

(assert (not b!1384156))

(assert (not b!1384159))

(assert (not b!1384157))

(assert (not b!1384161))

(assert (not b!1384155))

(assert (not start!118344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

