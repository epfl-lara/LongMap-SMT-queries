; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130932 () Bool)

(assert start!130932)

(declare-fun b!1536317 () Bool)

(declare-fun e!855070 () Bool)

(declare-fun e!855071 () Bool)

(assert (=> b!1536317 (= e!855070 e!855071)))

(declare-fun res!1053590 () Bool)

(assert (=> b!1536317 (=> (not res!1053590) (not e!855071))))

(declare-datatypes ((SeekEntryResult!13388 0))(
  ( (MissingZero!13388 (index!55947 (_ BitVec 32))) (Found!13388 (index!55948 (_ BitVec 32))) (Intermediate!13388 (undefined!14200 Bool) (index!55949 (_ BitVec 32)) (x!137681 (_ BitVec 32))) (Undefined!13388) (MissingVacant!13388 (index!55950 (_ BitVec 32))) )
))
(declare-fun lt!664132 () SeekEntryResult!13388)

(declare-fun lt!664130 () SeekEntryResult!13388)

(assert (=> b!1536317 (= res!1053590 (= lt!664132 lt!664130))))

(declare-fun lt!664133 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102028 0))(
  ( (array!102029 (arr!49231 (Array (_ BitVec 32) (_ BitVec 64))) (size!49783 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102028)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102028 (_ BitVec 32)) SeekEntryResult!13388)

(assert (=> b!1536317 (= lt!664132 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664133 vacantIndex!5 (select (arr!49231 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536318 () Bool)

(declare-fun res!1053596 () Bool)

(declare-fun e!855069 () Bool)

(assert (=> b!1536318 (=> (not res!1053596) (not e!855069))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536318 (= res!1053596 (not (= (select (arr!49231 a!2792) index!463) (select (arr!49231 a!2792) j!64))))))

(declare-fun b!1536319 () Bool)

(declare-fun e!855073 () Bool)

(assert (=> b!1536319 (= e!855071 (not e!855073))))

(declare-fun res!1053591 () Bool)

(assert (=> b!1536319 (=> res!1053591 e!855073)))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536319 (= res!1053591 (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49231 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!664134 () (_ BitVec 64))

(assert (=> b!1536319 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664133 vacantIndex!5 lt!664134 (array!102029 (store (arr!49231 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49783 a!2792)) mask!2480) lt!664132)))

(assert (=> b!1536319 (= lt!664134 (select (store (arr!49231 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(declare-datatypes ((Unit!51183 0))(
  ( (Unit!51184) )
))
(declare-fun lt!664131 () Unit!51183)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51183)

(assert (=> b!1536319 (= lt!664131 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664133 vacantIndex!5 mask!2480))))

(declare-fun b!1536320 () Bool)

(assert (=> b!1536320 (= e!855069 e!855070)))

(declare-fun res!1053598 () Bool)

(assert (=> b!1536320 (=> (not res!1053598) (not e!855070))))

(assert (=> b!1536320 (= res!1053598 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664133 #b00000000000000000000000000000000) (bvslt lt!664133 (size!49783 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536320 (= lt!664133 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536321 () Bool)

(declare-fun res!1053597 () Bool)

(declare-fun e!855068 () Bool)

(assert (=> b!1536321 (=> (not res!1053597) (not e!855068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102028 (_ BitVec 32)) Bool)

(assert (=> b!1536321 (= res!1053597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536322 () Bool)

(assert (=> b!1536322 (= e!855068 e!855069)))

(declare-fun res!1053594 () Bool)

(assert (=> b!1536322 (=> (not res!1053594) (not e!855069))))

(assert (=> b!1536322 (= res!1053594 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49231 a!2792) j!64) a!2792 mask!2480) lt!664130))))

(assert (=> b!1536322 (= lt!664130 (Found!13388 j!64))))

(declare-fun b!1536323 () Bool)

(declare-fun res!1053592 () Bool)

(assert (=> b!1536323 (=> (not res!1053592) (not e!855068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536323 (= res!1053592 (validKeyInArray!0 (select (arr!49231 a!2792) j!64)))))

(declare-fun b!1536324 () Bool)

(declare-fun res!1053595 () Bool)

(assert (=> b!1536324 (=> (not res!1053595) (not e!855068))))

(declare-datatypes ((List!35783 0))(
  ( (Nil!35780) (Cons!35779 (h!37225 (_ BitVec 64)) (t!50469 List!35783)) )
))
(declare-fun arrayNoDuplicates!0 (array!102028 (_ BitVec 32) List!35783) Bool)

(assert (=> b!1536324 (= res!1053595 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35780))))

(declare-fun b!1536325 () Bool)

(declare-fun res!1053588 () Bool)

(assert (=> b!1536325 (=> (not res!1053588) (not e!855068))))

(assert (=> b!1536325 (= res!1053588 (and (= (size!49783 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49783 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49783 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536326 () Bool)

(declare-fun res!1053593 () Bool)

(assert (=> b!1536326 (=> (not res!1053593) (not e!855068))))

(assert (=> b!1536326 (= res!1053593 (validKeyInArray!0 (select (arr!49231 a!2792) i!951)))))

(declare-fun b!1536327 () Bool)

(declare-fun res!1053589 () Bool)

(assert (=> b!1536327 (=> (not res!1053589) (not e!855068))))

(assert (=> b!1536327 (= res!1053589 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49783 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49783 a!2792)) (= (select (arr!49231 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1053587 () Bool)

(assert (=> start!130932 (=> (not res!1053587) (not e!855068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130932 (= res!1053587 (validMask!0 mask!2480))))

(assert (=> start!130932 e!855068))

(assert (=> start!130932 true))

(declare-fun array_inv!38464 (array!102028) Bool)

(assert (=> start!130932 (array_inv!38464 a!2792)))

(declare-fun b!1536328 () Bool)

(assert (=> b!1536328 (= e!855073 (validKeyInArray!0 lt!664134))))

(assert (= (and start!130932 res!1053587) b!1536325))

(assert (= (and b!1536325 res!1053588) b!1536326))

(assert (= (and b!1536326 res!1053593) b!1536323))

(assert (= (and b!1536323 res!1053592) b!1536321))

(assert (= (and b!1536321 res!1053597) b!1536324))

(assert (= (and b!1536324 res!1053595) b!1536327))

(assert (= (and b!1536327 res!1053589) b!1536322))

(assert (= (and b!1536322 res!1053594) b!1536318))

(assert (= (and b!1536318 res!1053596) b!1536320))

(assert (= (and b!1536320 res!1053598) b!1536317))

(assert (= (and b!1536317 res!1053590) b!1536319))

(assert (= (and b!1536319 (not res!1053591)) b!1536328))

(declare-fun m!1418213 () Bool)

(assert (=> b!1536322 m!1418213))

(assert (=> b!1536322 m!1418213))

(declare-fun m!1418215 () Bool)

(assert (=> b!1536322 m!1418215))

(assert (=> b!1536323 m!1418213))

(assert (=> b!1536323 m!1418213))

(declare-fun m!1418217 () Bool)

(assert (=> b!1536323 m!1418217))

(declare-fun m!1418219 () Bool)

(assert (=> b!1536327 m!1418219))

(declare-fun m!1418221 () Bool)

(assert (=> b!1536318 m!1418221))

(assert (=> b!1536318 m!1418213))

(declare-fun m!1418223 () Bool)

(assert (=> b!1536326 m!1418223))

(assert (=> b!1536326 m!1418223))

(declare-fun m!1418225 () Bool)

(assert (=> b!1536326 m!1418225))

(declare-fun m!1418227 () Bool)

(assert (=> start!130932 m!1418227))

(declare-fun m!1418229 () Bool)

(assert (=> start!130932 m!1418229))

(declare-fun m!1418231 () Bool)

(assert (=> b!1536324 m!1418231))

(declare-fun m!1418233 () Bool)

(assert (=> b!1536320 m!1418233))

(declare-fun m!1418235 () Bool)

(assert (=> b!1536321 m!1418235))

(declare-fun m!1418237 () Bool)

(assert (=> b!1536319 m!1418237))

(declare-fun m!1418239 () Bool)

(assert (=> b!1536319 m!1418239))

(declare-fun m!1418241 () Bool)

(assert (=> b!1536319 m!1418241))

(declare-fun m!1418243 () Bool)

(assert (=> b!1536319 m!1418243))

(declare-fun m!1418245 () Bool)

(assert (=> b!1536319 m!1418245))

(declare-fun m!1418247 () Bool)

(assert (=> b!1536328 m!1418247))

(assert (=> b!1536317 m!1418213))

(assert (=> b!1536317 m!1418213))

(declare-fun m!1418249 () Bool)

(assert (=> b!1536317 m!1418249))

(check-sat (not b!1536320) (not b!1536319) (not b!1536324) (not b!1536323) (not b!1536322) (not start!130932) (not b!1536328) (not b!1536326) (not b!1536321) (not b!1536317))
(check-sat)
