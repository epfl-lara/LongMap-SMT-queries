; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44604 () Bool)

(assert start!44604)

(declare-fun b!489239 () Bool)

(declare-fun e!287772 () Bool)

(declare-fun e!287769 () Bool)

(assert (=> b!489239 (= e!287772 (not e!287769))))

(declare-fun res!292182 () Bool)

(assert (=> b!489239 (=> res!292182 e!287769)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!220719 () (_ BitVec 32))

(assert (=> b!489239 (= res!292182 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvslt lt!220719 #b00000000000000000000000000000000) (bvsge lt!220719 (bvadd #b00000000000000000000000000000001 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31663 0))(
  ( (array!31664 (arr!15219 (Array (_ BitVec 32) (_ BitVec 64))) (size!15583 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31663)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489239 (= lt!220719 (toIndex!0 (select (store (arr!15219 a!3235) i!1204 k!2280) j!176) mask!3524))))

(declare-fun e!287770 () Bool)

(assert (=> b!489239 e!287770))

(declare-fun res!292175 () Bool)

(assert (=> b!489239 (=> (not res!292175) (not e!287770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31663 (_ BitVec 32)) Bool)

(assert (=> b!489239 (= res!292175 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14318 0))(
  ( (Unit!14319) )
))
(declare-fun lt!220718 () Unit!14318)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14318)

(assert (=> b!489239 (= lt!220718 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489240 () Bool)

(declare-fun res!292180 () Bool)

(declare-fun e!287771 () Bool)

(assert (=> b!489240 (=> (not res!292180) (not e!287771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489240 (= res!292180 (validKeyInArray!0 k!2280))))

(declare-fun b!489241 () Bool)

(assert (=> b!489241 (= e!287769 (validKeyInArray!0 (select (store (arr!15219 a!3235) i!1204 k!2280) j!176)))))

(declare-fun b!489242 () Bool)

(declare-fun res!292179 () Bool)

(assert (=> b!489242 (=> (not res!292179) (not e!287771))))

(assert (=> b!489242 (= res!292179 (validKeyInArray!0 (select (arr!15219 a!3235) j!176)))))

(declare-fun b!489243 () Bool)

(declare-fun res!292176 () Bool)

(assert (=> b!489243 (=> (not res!292176) (not e!287771))))

(assert (=> b!489243 (= res!292176 (and (= (size!15583 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15583 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15583 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489244 () Bool)

(declare-fun res!292183 () Bool)

(assert (=> b!489244 (=> (not res!292183) (not e!287772))))

(assert (=> b!489244 (= res!292183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489245 () Bool)

(declare-fun res!292177 () Bool)

(assert (=> b!489245 (=> (not res!292177) (not e!287771))))

(declare-fun arrayContainsKey!0 (array!31663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489245 (= res!292177 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489246 () Bool)

(declare-datatypes ((SeekEntryResult!3686 0))(
  ( (MissingZero!3686 (index!16923 (_ BitVec 32))) (Found!3686 (index!16924 (_ BitVec 32))) (Intermediate!3686 (undefined!4498 Bool) (index!16925 (_ BitVec 32)) (x!46040 (_ BitVec 32))) (Undefined!3686) (MissingVacant!3686 (index!16926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31663 (_ BitVec 32)) SeekEntryResult!3686)

(assert (=> b!489246 (= e!287770 (= (seekEntryOrOpen!0 (select (arr!15219 a!3235) j!176) a!3235 mask!3524) (Found!3686 j!176)))))

(declare-fun b!489247 () Bool)

(declare-fun res!292181 () Bool)

(assert (=> b!489247 (=> (not res!292181) (not e!287772))))

(declare-datatypes ((List!9377 0))(
  ( (Nil!9374) (Cons!9373 (h!10235 (_ BitVec 64)) (t!15605 List!9377)) )
))
(declare-fun arrayNoDuplicates!0 (array!31663 (_ BitVec 32) List!9377) Bool)

(assert (=> b!489247 (= res!292181 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9374))))

(declare-fun res!292184 () Bool)

(assert (=> start!44604 (=> (not res!292184) (not e!287771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44604 (= res!292184 (validMask!0 mask!3524))))

(assert (=> start!44604 e!287771))

(assert (=> start!44604 true))

(declare-fun array_inv!11015 (array!31663) Bool)

(assert (=> start!44604 (array_inv!11015 a!3235)))

(declare-fun b!489248 () Bool)

(assert (=> b!489248 (= e!287771 e!287772)))

(declare-fun res!292178 () Bool)

(assert (=> b!489248 (=> (not res!292178) (not e!287772))))

(declare-fun lt!220720 () SeekEntryResult!3686)

(assert (=> b!489248 (= res!292178 (or (= lt!220720 (MissingZero!3686 i!1204)) (= lt!220720 (MissingVacant!3686 i!1204))))))

(assert (=> b!489248 (= lt!220720 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44604 res!292184) b!489243))

(assert (= (and b!489243 res!292176) b!489242))

(assert (= (and b!489242 res!292179) b!489240))

(assert (= (and b!489240 res!292180) b!489245))

(assert (= (and b!489245 res!292177) b!489248))

(assert (= (and b!489248 res!292178) b!489244))

(assert (= (and b!489244 res!292183) b!489247))

(assert (= (and b!489247 res!292181) b!489239))

(assert (= (and b!489239 res!292175) b!489246))

(assert (= (and b!489239 (not res!292182)) b!489241))

(declare-fun m!468969 () Bool)

(assert (=> b!489244 m!468969))

(declare-fun m!468971 () Bool)

(assert (=> b!489248 m!468971))

(declare-fun m!468973 () Bool)

(assert (=> b!489247 m!468973))

(declare-fun m!468975 () Bool)

(assert (=> b!489241 m!468975))

(declare-fun m!468977 () Bool)

(assert (=> b!489241 m!468977))

(assert (=> b!489241 m!468977))

(declare-fun m!468979 () Bool)

(assert (=> b!489241 m!468979))

(declare-fun m!468981 () Bool)

(assert (=> b!489242 m!468981))

(assert (=> b!489242 m!468981))

(declare-fun m!468983 () Bool)

(assert (=> b!489242 m!468983))

(assert (=> b!489246 m!468981))

(assert (=> b!489246 m!468981))

(declare-fun m!468985 () Bool)

(assert (=> b!489246 m!468985))

(declare-fun m!468987 () Bool)

(assert (=> b!489240 m!468987))

(declare-fun m!468989 () Bool)

(assert (=> start!44604 m!468989))

(declare-fun m!468991 () Bool)

(assert (=> start!44604 m!468991))

(assert (=> b!489239 m!468975))

(declare-fun m!468993 () Bool)

(assert (=> b!489239 m!468993))

(assert (=> b!489239 m!468977))

(declare-fun m!468995 () Bool)

(assert (=> b!489239 m!468995))

(assert (=> b!489239 m!468977))

(declare-fun m!468997 () Bool)

(assert (=> b!489239 m!468997))

(declare-fun m!468999 () Bool)

(assert (=> b!489245 m!468999))

(push 1)

(assert (not b!489241))

(assert (not start!44604))

(assert (not b!489242))

(assert (not b!489246))

(assert (not b!489244))

(assert (not b!489239))

(assert (not b!489240))

(assert (not b!489245))

(assert (not b!489248))

(assert (not b!489247))

(check-sat)

