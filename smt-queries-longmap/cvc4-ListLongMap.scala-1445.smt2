; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27874 () Bool)

(assert start!27874)

(declare-fun b!286647 () Bool)

(declare-fun e!181608 () Bool)

(assert (=> b!286647 (= e!181608 false)))

(declare-fun lt!141174 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286647 (= lt!141174 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!286649 () Bool)

(declare-fun e!181609 () Bool)

(assert (=> b!286649 (= e!181609 e!181608)))

(declare-fun res!148728 () Bool)

(assert (=> b!286649 (=> (not res!148728) (not e!181608))))

(declare-datatypes ((SeekEntryResult!1963 0))(
  ( (MissingZero!1963 (index!10022 (_ BitVec 32))) (Found!1963 (index!10023 (_ BitVec 32))) (Intermediate!1963 (undefined!2775 Bool) (index!10024 (_ BitVec 32)) (x!28235 (_ BitVec 32))) (Undefined!1963) (MissingVacant!1963 (index!10025 (_ BitVec 32))) )
))
(declare-fun lt!141175 () SeekEntryResult!1963)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286649 (= res!148728 (or (= lt!141175 (MissingZero!1963 i!1256)) (= lt!141175 (MissingVacant!1963 i!1256))))))

(declare-datatypes ((array!14362 0))(
  ( (array!14363 (arr!6814 (Array (_ BitVec 32) (_ BitVec 64))) (size!7166 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14362)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14362 (_ BitVec 32)) SeekEntryResult!1963)

(assert (=> b!286649 (= lt!141175 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286650 () Bool)

(declare-fun res!148729 () Bool)

(assert (=> b!286650 (=> (not res!148729) (not e!181609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286650 (= res!148729 (validKeyInArray!0 k!2524))))

(declare-fun b!286651 () Bool)

(declare-fun res!148727 () Bool)

(assert (=> b!286651 (=> (not res!148727) (not e!181608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14362 (_ BitVec 32)) Bool)

(assert (=> b!286651 (= res!148727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286652 () Bool)

(declare-fun res!148731 () Bool)

(assert (=> b!286652 (=> (not res!148731) (not e!181609))))

(assert (=> b!286652 (= res!148731 (and (= (size!7166 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7166 a!3312))))))

(declare-fun res!148730 () Bool)

(assert (=> start!27874 (=> (not res!148730) (not e!181609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27874 (= res!148730 (validMask!0 mask!3809))))

(assert (=> start!27874 e!181609))

(assert (=> start!27874 true))

(declare-fun array_inv!4777 (array!14362) Bool)

(assert (=> start!27874 (array_inv!4777 a!3312)))

(declare-fun b!286648 () Bool)

(declare-fun res!148726 () Bool)

(assert (=> b!286648 (=> (not res!148726) (not e!181609))))

(declare-fun arrayContainsKey!0 (array!14362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286648 (= res!148726 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27874 res!148730) b!286652))

(assert (= (and b!286652 res!148731) b!286650))

(assert (= (and b!286650 res!148729) b!286648))

(assert (= (and b!286648 res!148726) b!286649))

(assert (= (and b!286649 res!148728) b!286651))

(assert (= (and b!286651 res!148727) b!286647))

(declare-fun m!301273 () Bool)

(assert (=> b!286650 m!301273))

(declare-fun m!301275 () Bool)

(assert (=> b!286648 m!301275))

(declare-fun m!301277 () Bool)

(assert (=> b!286647 m!301277))

(declare-fun m!301279 () Bool)

(assert (=> b!286651 m!301279))

(declare-fun m!301281 () Bool)

(assert (=> start!27874 m!301281))

(declare-fun m!301283 () Bool)

(assert (=> start!27874 m!301283))

(declare-fun m!301285 () Bool)

(assert (=> b!286649 m!301285))

(push 1)

(assert (not b!286648))

(assert (not b!286649))

(assert (not start!27874))

(assert (not b!286650))

(assert (not b!286647))

(assert (not b!286651))

(check-sat)

