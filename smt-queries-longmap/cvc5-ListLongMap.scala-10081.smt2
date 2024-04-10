; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118620 () Bool)

(assert start!118620)

(declare-fun b!1386796 () Bool)

(declare-fun res!927921 () Bool)

(declare-fun e!785558 () Bool)

(assert (=> b!1386796 (=> (not res!927921) (not e!785558))))

(declare-datatypes ((array!94896 0))(
  ( (array!94897 (arr!45824 (Array (_ BitVec 32) (_ BitVec 64))) (size!46374 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94896)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94896 (_ BitVec 32)) Bool)

(assert (=> b!1386796 (= res!927921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386797 () Bool)

(assert (=> b!1386797 (= e!785558 false)))

(declare-datatypes ((Unit!46343 0))(
  ( (Unit!46344) )
))
(declare-fun lt!609583 () Unit!46343)

(declare-fun e!785556 () Unit!46343)

(assert (=> b!1386797 (= lt!609583 e!785556)))

(declare-fun c!128880 () Bool)

(declare-fun e!785555 () Bool)

(assert (=> b!1386797 (= c!128880 e!785555)))

(declare-fun res!927918 () Bool)

(assert (=> b!1386797 (=> (not res!927918) (not e!785555))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386797 (= res!927918 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386798 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386798 (= e!785555 (validKeyInArray!0 (select (arr!45824 a!2938) startIndex!16)))))

(declare-fun b!1386799 () Bool)

(declare-fun res!927922 () Bool)

(assert (=> b!1386799 (=> (not res!927922) (not e!785558))))

(declare-datatypes ((List!32352 0))(
  ( (Nil!32349) (Cons!32348 (h!33557 (_ BitVec 64)) (t!47046 List!32352)) )
))
(declare-fun arrayNoDuplicates!0 (array!94896 (_ BitVec 32) List!32352) Bool)

(assert (=> b!1386799 (= res!927922 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32349))))

(declare-fun res!927919 () Bool)

(assert (=> start!118620 (=> (not res!927919) (not e!785558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118620 (= res!927919 (validMask!0 mask!2987))))

(assert (=> start!118620 e!785558))

(assert (=> start!118620 true))

(declare-fun array_inv!34852 (array!94896) Bool)

(assert (=> start!118620 (array_inv!34852 a!2938)))

(declare-fun b!1386800 () Bool)

(declare-fun Unit!46345 () Unit!46343)

(assert (=> b!1386800 (= e!785556 Unit!46345)))

(declare-fun b!1386801 () Bool)

(declare-fun res!927917 () Bool)

(assert (=> b!1386801 (=> (not res!927917) (not e!785558))))

(assert (=> b!1386801 (= res!927917 (and (not (= (select (arr!45824 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45824 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386802 () Bool)

(declare-fun res!927916 () Bool)

(assert (=> b!1386802 (=> (not res!927916) (not e!785558))))

(assert (=> b!1386802 (= res!927916 (and (= (size!46374 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46374 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46374 a!2938))))))

(declare-fun b!1386803 () Bool)

(declare-fun res!927920 () Bool)

(assert (=> b!1386803 (=> (not res!927920) (not e!785558))))

(assert (=> b!1386803 (= res!927920 (validKeyInArray!0 (select (arr!45824 a!2938) i!1065)))))

(declare-fun b!1386804 () Bool)

(declare-fun lt!609585 () Unit!46343)

(assert (=> b!1386804 (= e!785556 lt!609585)))

(declare-fun lt!609584 () Unit!46343)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46343)

(assert (=> b!1386804 (= lt!609584 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10167 0))(
  ( (MissingZero!10167 (index!43039 (_ BitVec 32))) (Found!10167 (index!43040 (_ BitVec 32))) (Intermediate!10167 (undefined!10979 Bool) (index!43041 (_ BitVec 32)) (x!124656 (_ BitVec 32))) (Undefined!10167) (MissingVacant!10167 (index!43042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94896 (_ BitVec 32)) SeekEntryResult!10167)

(assert (=> b!1386804 (= (seekEntryOrOpen!0 (select (arr!45824 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45824 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94897 (store (arr!45824 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46374 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46343)

(assert (=> b!1386804 (= lt!609585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386804 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118620 res!927919) b!1386802))

(assert (= (and b!1386802 res!927916) b!1386803))

(assert (= (and b!1386803 res!927920) b!1386799))

(assert (= (and b!1386799 res!927922) b!1386796))

(assert (= (and b!1386796 res!927921) b!1386801))

(assert (= (and b!1386801 res!927917) b!1386797))

(assert (= (and b!1386797 res!927918) b!1386798))

(assert (= (and b!1386797 c!128880) b!1386804))

(assert (= (and b!1386797 (not c!128880)) b!1386800))

(declare-fun m!1272201 () Bool)

(assert (=> b!1386804 m!1272201))

(declare-fun m!1272203 () Bool)

(assert (=> b!1386804 m!1272203))

(assert (=> b!1386804 m!1272203))

(declare-fun m!1272205 () Bool)

(assert (=> b!1386804 m!1272205))

(declare-fun m!1272207 () Bool)

(assert (=> b!1386804 m!1272207))

(declare-fun m!1272209 () Bool)

(assert (=> b!1386804 m!1272209))

(declare-fun m!1272211 () Bool)

(assert (=> b!1386804 m!1272211))

(declare-fun m!1272213 () Bool)

(assert (=> b!1386804 m!1272213))

(assert (=> b!1386804 m!1272211))

(declare-fun m!1272215 () Bool)

(assert (=> b!1386804 m!1272215))

(declare-fun m!1272217 () Bool)

(assert (=> b!1386796 m!1272217))

(declare-fun m!1272219 () Bool)

(assert (=> b!1386801 m!1272219))

(declare-fun m!1272221 () Bool)

(assert (=> start!118620 m!1272221))

(declare-fun m!1272223 () Bool)

(assert (=> start!118620 m!1272223))

(assert (=> b!1386803 m!1272219))

(assert (=> b!1386803 m!1272219))

(declare-fun m!1272225 () Bool)

(assert (=> b!1386803 m!1272225))

(declare-fun m!1272227 () Bool)

(assert (=> b!1386799 m!1272227))

(assert (=> b!1386798 m!1272211))

(assert (=> b!1386798 m!1272211))

(declare-fun m!1272229 () Bool)

(assert (=> b!1386798 m!1272229))

(push 1)

(assert (not b!1386803))

(assert (not b!1386796))

(assert (not start!118620))

(assert (not b!1386799))

(assert (not b!1386798))

(assert (not b!1386804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

