; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27174 () Bool)

(assert start!27174)

(declare-fun b!281222 () Bool)

(declare-fun e!178811 () Bool)

(declare-fun e!178809 () Bool)

(assert (=> b!281222 (= e!178811 e!178809)))

(declare-fun res!144268 () Bool)

(assert (=> b!281222 (=> (not res!144268) (not e!178809))))

(declare-datatypes ((SeekEntryResult!1760 0))(
  ( (MissingZero!1760 (index!9210 (_ BitVec 32))) (Found!1760 (index!9211 (_ BitVec 32))) (Intermediate!1760 (undefined!2572 Bool) (index!9212 (_ BitVec 32)) (x!27550 (_ BitVec 32))) (Undefined!1760) (MissingVacant!1760 (index!9213 (_ BitVec 32))) )
))
(declare-fun lt!139050 () SeekEntryResult!1760)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281222 (= res!144268 (or (= lt!139050 (MissingZero!1760 i!1267)) (= lt!139050 (MissingVacant!1760 i!1267))))))

(declare-datatypes ((array!13991 0))(
  ( (array!13992 (arr!6637 (Array (_ BitVec 32) (_ BitVec 64))) (size!6989 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13991)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13991 (_ BitVec 32)) SeekEntryResult!1760)

(assert (=> b!281222 (= lt!139050 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281223 () Bool)

(assert (=> b!281223 (= e!178809 (not true))))

(declare-datatypes ((List!4358 0))(
  ( (Nil!4355) (Cons!4354 (h!5024 (_ BitVec 64)) (t!9432 List!4358)) )
))
(declare-fun arrayNoDuplicates!0 (array!13991 (_ BitVec 32) List!4358) Bool)

(assert (=> b!281223 (arrayNoDuplicates!0 (array!13992 (store (arr!6637 a!3325) i!1267 k0!2581) (size!6989 a!3325)) #b00000000000000000000000000000000 Nil!4355)))

(declare-datatypes ((Unit!8850 0))(
  ( (Unit!8851) )
))
(declare-fun lt!139049 () Unit!8850)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13991 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4358) Unit!8850)

(assert (=> b!281223 (= lt!139049 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4355))))

(declare-fun b!281225 () Bool)

(declare-fun res!144273 () Bool)

(assert (=> b!281225 (=> (not res!144273) (not e!178809))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281225 (= res!144273 (validKeyInArray!0 (select (arr!6637 a!3325) startIndex!26)))))

(declare-fun b!281226 () Bool)

(declare-fun res!144267 () Bool)

(assert (=> b!281226 (=> (not res!144267) (not e!178809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13991 (_ BitVec 32)) Bool)

(assert (=> b!281226 (= res!144267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281227 () Bool)

(declare-fun res!144272 () Bool)

(assert (=> b!281227 (=> (not res!144272) (not e!178811))))

(declare-fun arrayContainsKey!0 (array!13991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281227 (= res!144272 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281228 () Bool)

(declare-fun res!144269 () Bool)

(assert (=> b!281228 (=> (not res!144269) (not e!178811))))

(assert (=> b!281228 (= res!144269 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4355))))

(declare-fun b!281224 () Bool)

(declare-fun res!144270 () Bool)

(assert (=> b!281224 (=> (not res!144270) (not e!178809))))

(assert (=> b!281224 (= res!144270 (not (= startIndex!26 i!1267)))))

(declare-fun res!144266 () Bool)

(assert (=> start!27174 (=> (not res!144266) (not e!178811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27174 (= res!144266 (validMask!0 mask!3868))))

(assert (=> start!27174 e!178811))

(declare-fun array_inv!4587 (array!13991) Bool)

(assert (=> start!27174 (array_inv!4587 a!3325)))

(assert (=> start!27174 true))

(declare-fun b!281229 () Bool)

(declare-fun res!144271 () Bool)

(assert (=> b!281229 (=> (not res!144271) (not e!178811))))

(assert (=> b!281229 (= res!144271 (validKeyInArray!0 k0!2581))))

(declare-fun b!281230 () Bool)

(declare-fun res!144265 () Bool)

(assert (=> b!281230 (=> (not res!144265) (not e!178811))))

(assert (=> b!281230 (= res!144265 (and (= (size!6989 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6989 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6989 a!3325))))))

(assert (= (and start!27174 res!144266) b!281230))

(assert (= (and b!281230 res!144265) b!281229))

(assert (= (and b!281229 res!144271) b!281228))

(assert (= (and b!281228 res!144269) b!281227))

(assert (= (and b!281227 res!144272) b!281222))

(assert (= (and b!281222 res!144268) b!281226))

(assert (= (and b!281226 res!144267) b!281224))

(assert (= (and b!281224 res!144270) b!281225))

(assert (= (and b!281225 res!144273) b!281223))

(declare-fun m!295733 () Bool)

(assert (=> b!281226 m!295733))

(declare-fun m!295735 () Bool)

(assert (=> b!281222 m!295735))

(declare-fun m!295737 () Bool)

(assert (=> b!281225 m!295737))

(assert (=> b!281225 m!295737))

(declare-fun m!295739 () Bool)

(assert (=> b!281225 m!295739))

(declare-fun m!295741 () Bool)

(assert (=> b!281227 m!295741))

(declare-fun m!295743 () Bool)

(assert (=> b!281229 m!295743))

(declare-fun m!295745 () Bool)

(assert (=> b!281228 m!295745))

(declare-fun m!295747 () Bool)

(assert (=> b!281223 m!295747))

(declare-fun m!295749 () Bool)

(assert (=> b!281223 m!295749))

(declare-fun m!295751 () Bool)

(assert (=> b!281223 m!295751))

(declare-fun m!295753 () Bool)

(assert (=> start!27174 m!295753))

(declare-fun m!295755 () Bool)

(assert (=> start!27174 m!295755))

(check-sat (not start!27174) (not b!281226) (not b!281223) (not b!281227) (not b!281229) (not b!281228) (not b!281222) (not b!281225))
(check-sat)
