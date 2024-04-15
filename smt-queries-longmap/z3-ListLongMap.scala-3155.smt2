; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44442 () Bool)

(assert start!44442)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31607 0))(
  ( (array!31608 (arr!15194 (Array (_ BitVec 32) (_ BitVec 64))) (size!15559 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31607)

(declare-fun b!487952 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!287054 () Bool)

(declare-datatypes ((SeekEntryResult!3658 0))(
  ( (MissingZero!3658 (index!16811 (_ BitVec 32))) (Found!3658 (index!16812 (_ BitVec 32))) (Intermediate!3658 (undefined!4470 Bool) (index!16813 (_ BitVec 32)) (x!45940 (_ BitVec 32))) (Undefined!3658) (MissingVacant!3658 (index!16814 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31607 (_ BitVec 32)) SeekEntryResult!3658)

(assert (=> b!487952 (= e!287054 (= (seekEntryOrOpen!0 (select (arr!15194 a!3235) j!176) a!3235 mask!3524) (Found!3658 j!176)))))

(declare-fun b!487954 () Bool)

(declare-fun res!291263 () Bool)

(declare-fun e!287052 () Bool)

(assert (=> b!487954 (=> (not res!291263) (not e!287052))))

(declare-datatypes ((List!9391 0))(
  ( (Nil!9388) (Cons!9387 (h!10246 (_ BitVec 64)) (t!15610 List!9391)) )
))
(declare-fun arrayNoDuplicates!0 (array!31607 (_ BitVec 32) List!9391) Bool)

(assert (=> b!487954 (= res!291263 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9388))))

(declare-fun b!487955 () Bool)

(declare-fun e!287055 () Bool)

(assert (=> b!487955 (= e!287055 e!287052)))

(declare-fun res!291261 () Bool)

(assert (=> b!487955 (=> (not res!291261) (not e!287052))))

(declare-fun lt!220108 () SeekEntryResult!3658)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487955 (= res!291261 (or (= lt!220108 (MissingZero!3658 i!1204)) (= lt!220108 (MissingVacant!3658 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!487955 (= lt!220108 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487956 () Bool)

(assert (=> b!487956 (= e!287052 (not true))))

(declare-fun lt!220106 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487956 (= lt!220106 (toIndex!0 (select (arr!15194 a!3235) j!176) mask!3524))))

(assert (=> b!487956 e!287054))

(declare-fun res!291260 () Bool)

(assert (=> b!487956 (=> (not res!291260) (not e!287054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31607 (_ BitVec 32)) Bool)

(assert (=> b!487956 (= res!291260 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14248 0))(
  ( (Unit!14249) )
))
(declare-fun lt!220107 () Unit!14248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14248)

(assert (=> b!487956 (= lt!220107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487953 () Bool)

(declare-fun res!291259 () Bool)

(assert (=> b!487953 (=> (not res!291259) (not e!287055))))

(declare-fun arrayContainsKey!0 (array!31607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487953 (= res!291259 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!291256 () Bool)

(assert (=> start!44442 (=> (not res!291256) (not e!287055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44442 (= res!291256 (validMask!0 mask!3524))))

(assert (=> start!44442 e!287055))

(assert (=> start!44442 true))

(declare-fun array_inv!11077 (array!31607) Bool)

(assert (=> start!44442 (array_inv!11077 a!3235)))

(declare-fun b!487957 () Bool)

(declare-fun res!291257 () Bool)

(assert (=> b!487957 (=> (not res!291257) (not e!287055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487957 (= res!291257 (validKeyInArray!0 k0!2280))))

(declare-fun b!487958 () Bool)

(declare-fun res!291255 () Bool)

(assert (=> b!487958 (=> (not res!291255) (not e!287055))))

(assert (=> b!487958 (= res!291255 (validKeyInArray!0 (select (arr!15194 a!3235) j!176)))))

(declare-fun b!487959 () Bool)

(declare-fun res!291258 () Bool)

(assert (=> b!487959 (=> (not res!291258) (not e!287052))))

(assert (=> b!487959 (= res!291258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487960 () Bool)

(declare-fun res!291262 () Bool)

(assert (=> b!487960 (=> (not res!291262) (not e!287055))))

(assert (=> b!487960 (= res!291262 (and (= (size!15559 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15559 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15559 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44442 res!291256) b!487960))

(assert (= (and b!487960 res!291262) b!487958))

(assert (= (and b!487958 res!291255) b!487957))

(assert (= (and b!487957 res!291257) b!487953))

(assert (= (and b!487953 res!291259) b!487955))

(assert (= (and b!487955 res!291261) b!487959))

(assert (= (and b!487959 res!291258) b!487954))

(assert (= (and b!487954 res!291263) b!487956))

(assert (= (and b!487956 res!291260) b!487952))

(declare-fun m!467221 () Bool)

(assert (=> b!487958 m!467221))

(assert (=> b!487958 m!467221))

(declare-fun m!467223 () Bool)

(assert (=> b!487958 m!467223))

(assert (=> b!487956 m!467221))

(assert (=> b!487956 m!467221))

(declare-fun m!467225 () Bool)

(assert (=> b!487956 m!467225))

(declare-fun m!467227 () Bool)

(assert (=> b!487956 m!467227))

(declare-fun m!467229 () Bool)

(assert (=> b!487956 m!467229))

(declare-fun m!467231 () Bool)

(assert (=> b!487955 m!467231))

(assert (=> b!487952 m!467221))

(assert (=> b!487952 m!467221))

(declare-fun m!467233 () Bool)

(assert (=> b!487952 m!467233))

(declare-fun m!467235 () Bool)

(assert (=> b!487959 m!467235))

(declare-fun m!467237 () Bool)

(assert (=> start!44442 m!467237))

(declare-fun m!467239 () Bool)

(assert (=> start!44442 m!467239))

(declare-fun m!467241 () Bool)

(assert (=> b!487953 m!467241))

(declare-fun m!467243 () Bool)

(assert (=> b!487957 m!467243))

(declare-fun m!467245 () Bool)

(assert (=> b!487954 m!467245))

(check-sat (not b!487957) (not b!487953) (not b!487958) (not b!487959) (not b!487956) (not b!487955) (not b!487954) (not b!487952) (not start!44442))
(check-sat)
