; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26408 () Bool)

(assert start!26408)

(declare-fun b!273927 () Bool)

(declare-fun res!137919 () Bool)

(declare-fun e!175473 () Bool)

(assert (=> b!273927 (=> (not res!137919) (not e!175473))))

(declare-datatypes ((array!13505 0))(
  ( (array!13506 (arr!6402 (Array (_ BitVec 32) (_ BitVec 64))) (size!6754 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13505)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13505 (_ BitVec 32)) Bool)

(assert (=> b!273927 (= res!137919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273928 () Bool)

(declare-fun e!175475 () Bool)

(assert (=> b!273928 (= e!175473 e!175475)))

(declare-fun res!137924 () Bool)

(assert (=> b!273928 (=> (not res!137924) (not e!175475))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273928 (= res!137924 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136653 () array!13505)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!273928 (= lt!136653 (array!13506 (store (arr!6402 a!3325) i!1267 k0!2581) (size!6754 a!3325)))))

(declare-fun b!273929 () Bool)

(assert (=> b!273929 (= e!175475 (not true))))

(assert (=> b!273929 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8607 0))(
  ( (Unit!8608) )
))
(declare-fun lt!136656 () Unit!8607)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> b!273929 (= lt!136656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1560 0))(
  ( (MissingZero!1560 (index!8410 (_ BitVec 32))) (Found!1560 (index!8411 (_ BitVec 32))) (Intermediate!1560 (undefined!2372 Bool) (index!8412 (_ BitVec 32)) (x!26709 (_ BitVec 32))) (Undefined!1560) (MissingVacant!1560 (index!8413 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13505 (_ BitVec 32)) SeekEntryResult!1560)

(assert (=> b!273929 (= (seekEntryOrOpen!0 (select (arr!6402 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6402 a!3325) i!1267 k0!2581) startIndex!26) lt!136653 mask!3868))))

(declare-fun lt!136654 () Unit!8607)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> b!273929 (= lt!136654 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4210 0))(
  ( (Nil!4207) (Cons!4206 (h!4873 (_ BitVec 64)) (t!9292 List!4210)) )
))
(declare-fun arrayNoDuplicates!0 (array!13505 (_ BitVec 32) List!4210) Bool)

(assert (=> b!273929 (arrayNoDuplicates!0 lt!136653 #b00000000000000000000000000000000 Nil!4207)))

(declare-fun lt!136657 () Unit!8607)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13505 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4210) Unit!8607)

(assert (=> b!273929 (= lt!136657 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4207))))

(declare-fun b!273930 () Bool)

(declare-fun res!137925 () Bool)

(declare-fun e!175472 () Bool)

(assert (=> b!273930 (=> (not res!137925) (not e!175472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273930 (= res!137925 (validKeyInArray!0 k0!2581))))

(declare-fun res!137923 () Bool)

(assert (=> start!26408 (=> (not res!137923) (not e!175472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26408 (= res!137923 (validMask!0 mask!3868))))

(assert (=> start!26408 e!175472))

(declare-fun array_inv!4365 (array!13505) Bool)

(assert (=> start!26408 (array_inv!4365 a!3325)))

(assert (=> start!26408 true))

(declare-fun b!273931 () Bool)

(assert (=> b!273931 (= e!175472 e!175473)))

(declare-fun res!137920 () Bool)

(assert (=> b!273931 (=> (not res!137920) (not e!175473))))

(declare-fun lt!136655 () SeekEntryResult!1560)

(assert (=> b!273931 (= res!137920 (or (= lt!136655 (MissingZero!1560 i!1267)) (= lt!136655 (MissingVacant!1560 i!1267))))))

(assert (=> b!273931 (= lt!136655 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273932 () Bool)

(declare-fun res!137918 () Bool)

(assert (=> b!273932 (=> (not res!137918) (not e!175475))))

(assert (=> b!273932 (= res!137918 (validKeyInArray!0 (select (arr!6402 a!3325) startIndex!26)))))

(declare-fun b!273933 () Bool)

(declare-fun res!137921 () Bool)

(assert (=> b!273933 (=> (not res!137921) (not e!175472))))

(assert (=> b!273933 (= res!137921 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4207))))

(declare-fun b!273934 () Bool)

(declare-fun res!137922 () Bool)

(assert (=> b!273934 (=> (not res!137922) (not e!175472))))

(declare-fun arrayContainsKey!0 (array!13505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273934 (= res!137922 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273935 () Bool)

(declare-fun res!137917 () Bool)

(assert (=> b!273935 (=> (not res!137917) (not e!175472))))

(assert (=> b!273935 (= res!137917 (and (= (size!6754 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6754 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6754 a!3325))))))

(assert (= (and start!26408 res!137923) b!273935))

(assert (= (and b!273935 res!137917) b!273930))

(assert (= (and b!273930 res!137925) b!273933))

(assert (= (and b!273933 res!137921) b!273934))

(assert (= (and b!273934 res!137922) b!273931))

(assert (= (and b!273931 res!137920) b!273927))

(assert (= (and b!273927 res!137919) b!273928))

(assert (= (and b!273928 res!137924) b!273932))

(assert (= (and b!273932 res!137918) b!273929))

(declare-fun m!289281 () Bool)

(assert (=> b!273932 m!289281))

(assert (=> b!273932 m!289281))

(declare-fun m!289283 () Bool)

(assert (=> b!273932 m!289283))

(declare-fun m!289285 () Bool)

(assert (=> b!273928 m!289285))

(declare-fun m!289287 () Bool)

(assert (=> b!273931 m!289287))

(declare-fun m!289289 () Bool)

(assert (=> b!273929 m!289289))

(declare-fun m!289291 () Bool)

(assert (=> b!273929 m!289291))

(assert (=> b!273929 m!289285))

(declare-fun m!289293 () Bool)

(assert (=> b!273929 m!289293))

(assert (=> b!273929 m!289291))

(declare-fun m!289295 () Bool)

(assert (=> b!273929 m!289295))

(assert (=> b!273929 m!289281))

(declare-fun m!289297 () Bool)

(assert (=> b!273929 m!289297))

(assert (=> b!273929 m!289281))

(declare-fun m!289299 () Bool)

(assert (=> b!273929 m!289299))

(declare-fun m!289301 () Bool)

(assert (=> b!273929 m!289301))

(declare-fun m!289303 () Bool)

(assert (=> b!273929 m!289303))

(declare-fun m!289305 () Bool)

(assert (=> start!26408 m!289305))

(declare-fun m!289307 () Bool)

(assert (=> start!26408 m!289307))

(declare-fun m!289309 () Bool)

(assert (=> b!273927 m!289309))

(declare-fun m!289311 () Bool)

(assert (=> b!273934 m!289311))

(declare-fun m!289313 () Bool)

(assert (=> b!273933 m!289313))

(declare-fun m!289315 () Bool)

(assert (=> b!273930 m!289315))

(check-sat (not b!273932) (not b!273933) (not start!26408) (not b!273934) (not b!273930) (not b!273931) (not b!273927) (not b!273929))
(check-sat)
