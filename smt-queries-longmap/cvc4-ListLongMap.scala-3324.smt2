; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45892 () Bool)

(assert start!45892)

(declare-fun b!508316 () Bool)

(declare-fun res!309277 () Bool)

(declare-fun e!297383 () Bool)

(assert (=> b!508316 (=> (not res!309277) (not e!297383))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508316 (= res!309277 (validKeyInArray!0 k!2280))))

(declare-fun b!508317 () Bool)

(declare-fun res!309278 () Bool)

(assert (=> b!508317 (=> (not res!309278) (not e!297383))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32648 0))(
  ( (array!32649 (arr!15704 (Array (_ BitVec 32) (_ BitVec 64))) (size!16068 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32648)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508317 (= res!309278 (and (= (size!16068 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16068 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16068 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508318 () Bool)

(declare-fun e!297384 () Bool)

(assert (=> b!508318 (= e!297383 e!297384)))

(declare-fun res!309280 () Bool)

(assert (=> b!508318 (=> (not res!309280) (not e!297384))))

(declare-datatypes ((SeekEntryResult!4171 0))(
  ( (MissingZero!4171 (index!18872 (_ BitVec 32))) (Found!4171 (index!18873 (_ BitVec 32))) (Intermediate!4171 (undefined!4983 Bool) (index!18874 (_ BitVec 32)) (x!47852 (_ BitVec 32))) (Undefined!4171) (MissingVacant!4171 (index!18875 (_ BitVec 32))) )
))
(declare-fun lt!232203 () SeekEntryResult!4171)

(assert (=> b!508318 (= res!309280 (or (= lt!232203 (MissingZero!4171 i!1204)) (= lt!232203 (MissingVacant!4171 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32648 (_ BitVec 32)) SeekEntryResult!4171)

(assert (=> b!508318 (= lt!232203 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508319 () Bool)

(assert (=> b!508319 (= e!297384 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32648 (_ BitVec 32)) Bool)

(assert (=> b!508319 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15600 0))(
  ( (Unit!15601) )
))
(declare-fun lt!232204 () Unit!15600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15600)

(assert (=> b!508319 (= lt!232204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508320 () Bool)

(declare-fun res!309276 () Bool)

(assert (=> b!508320 (=> (not res!309276) (not e!297384))))

(assert (=> b!508320 (= res!309276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508315 () Bool)

(declare-fun res!309274 () Bool)

(assert (=> b!508315 (=> (not res!309274) (not e!297383))))

(declare-fun arrayContainsKey!0 (array!32648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508315 (= res!309274 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!309279 () Bool)

(assert (=> start!45892 (=> (not res!309279) (not e!297383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45892 (= res!309279 (validMask!0 mask!3524))))

(assert (=> start!45892 e!297383))

(assert (=> start!45892 true))

(declare-fun array_inv!11500 (array!32648) Bool)

(assert (=> start!45892 (array_inv!11500 a!3235)))

(declare-fun b!508321 () Bool)

(declare-fun res!309275 () Bool)

(assert (=> b!508321 (=> (not res!309275) (not e!297384))))

(declare-datatypes ((List!9862 0))(
  ( (Nil!9859) (Cons!9858 (h!10735 (_ BitVec 64)) (t!16090 List!9862)) )
))
(declare-fun arrayNoDuplicates!0 (array!32648 (_ BitVec 32) List!9862) Bool)

(assert (=> b!508321 (= res!309275 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9859))))

(declare-fun b!508322 () Bool)

(declare-fun res!309281 () Bool)

(assert (=> b!508322 (=> (not res!309281) (not e!297383))))

(assert (=> b!508322 (= res!309281 (validKeyInArray!0 (select (arr!15704 a!3235) j!176)))))

(assert (= (and start!45892 res!309279) b!508317))

(assert (= (and b!508317 res!309278) b!508322))

(assert (= (and b!508322 res!309281) b!508316))

(assert (= (and b!508316 res!309277) b!508315))

(assert (= (and b!508315 res!309274) b!508318))

(assert (= (and b!508318 res!309280) b!508320))

(assert (= (and b!508320 res!309276) b!508321))

(assert (= (and b!508321 res!309275) b!508319))

(declare-fun m!489101 () Bool)

(assert (=> b!508320 m!489101))

(declare-fun m!489103 () Bool)

(assert (=> start!45892 m!489103))

(declare-fun m!489105 () Bool)

(assert (=> start!45892 m!489105))

(declare-fun m!489107 () Bool)

(assert (=> b!508316 m!489107))

(declare-fun m!489109 () Bool)

(assert (=> b!508322 m!489109))

(assert (=> b!508322 m!489109))

(declare-fun m!489111 () Bool)

(assert (=> b!508322 m!489111))

(declare-fun m!489113 () Bool)

(assert (=> b!508321 m!489113))

(declare-fun m!489115 () Bool)

(assert (=> b!508315 m!489115))

(declare-fun m!489117 () Bool)

(assert (=> b!508319 m!489117))

(declare-fun m!489119 () Bool)

(assert (=> b!508319 m!489119))

(declare-fun m!489121 () Bool)

(assert (=> b!508318 m!489121))

(push 1)

(assert (not b!508321))

