; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25964 () Bool)

(assert start!25964)

(declare-fun res!132256 () Bool)

(declare-fun e!173176 () Bool)

(assert (=> start!25964 (=> (not res!132256) (not e!173176))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25964 (= res!132256 (validMask!0 mask!3868))))

(assert (=> start!25964 e!173176))

(declare-datatypes ((array!13061 0))(
  ( (array!13062 (arr!6180 (Array (_ BitVec 32) (_ BitVec 64))) (size!6532 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13061)

(declare-fun array_inv!4143 (array!13061) Bool)

(assert (=> start!25964 (array_inv!4143 a!3325)))

(assert (=> start!25964 true))

(declare-fun b!267976 () Bool)

(declare-fun res!132255 () Bool)

(assert (=> b!267976 (=> (not res!132255) (not e!173176))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267976 (= res!132255 (validKeyInArray!0 k0!2581))))

(declare-fun b!267977 () Bool)

(declare-fun res!132254 () Bool)

(assert (=> b!267977 (=> (not res!132254) (not e!173176))))

(declare-fun arrayContainsKey!0 (array!13061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267977 (= res!132254 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267978 () Bool)

(declare-fun res!132257 () Bool)

(assert (=> b!267978 (=> (not res!132257) (not e!173176))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267978 (= res!132257 (and (= (size!6532 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6532 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6532 a!3325))))))

(declare-fun b!267979 () Bool)

(assert (=> b!267979 (= e!173176 false)))

(declare-datatypes ((SeekEntryResult!1338 0))(
  ( (MissingZero!1338 (index!7522 (_ BitVec 32))) (Found!1338 (index!7523 (_ BitVec 32))) (Intermediate!1338 (undefined!2150 Bool) (index!7524 (_ BitVec 32)) (x!25895 (_ BitVec 32))) (Undefined!1338) (MissingVacant!1338 (index!7525 (_ BitVec 32))) )
))
(declare-fun lt!134761 () SeekEntryResult!1338)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13061 (_ BitVec 32)) SeekEntryResult!1338)

(assert (=> b!267979 (= lt!134761 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!267980 () Bool)

(declare-fun res!132258 () Bool)

(assert (=> b!267980 (=> (not res!132258) (not e!173176))))

(declare-datatypes ((List!3988 0))(
  ( (Nil!3985) (Cons!3984 (h!4651 (_ BitVec 64)) (t!9070 List!3988)) )
))
(declare-fun arrayNoDuplicates!0 (array!13061 (_ BitVec 32) List!3988) Bool)

(assert (=> b!267980 (= res!132258 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3985))))

(assert (= (and start!25964 res!132256) b!267978))

(assert (= (and b!267978 res!132257) b!267976))

(assert (= (and b!267976 res!132255) b!267980))

(assert (= (and b!267980 res!132258) b!267977))

(assert (= (and b!267977 res!132254) b!267979))

(declare-fun m!284211 () Bool)

(assert (=> b!267979 m!284211))

(declare-fun m!284213 () Bool)

(assert (=> b!267976 m!284213))

(declare-fun m!284215 () Bool)

(assert (=> start!25964 m!284215))

(declare-fun m!284217 () Bool)

(assert (=> start!25964 m!284217))

(declare-fun m!284219 () Bool)

(assert (=> b!267980 m!284219))

(declare-fun m!284221 () Bool)

(assert (=> b!267977 m!284221))

(check-sat (not b!267979) (not b!267977) (not start!25964) (not b!267980) (not b!267976))
