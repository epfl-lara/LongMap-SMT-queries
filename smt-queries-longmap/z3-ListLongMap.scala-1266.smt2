; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26156 () Bool)

(assert start!26156)

(declare-fun b!270089 () Bool)

(declare-fun res!134165 () Bool)

(declare-fun e!174138 () Bool)

(assert (=> b!270089 (=> (not res!134165) (not e!174138))))

(declare-datatypes ((array!13253 0))(
  ( (array!13254 (arr!6276 (Array (_ BitVec 32) (_ BitVec 64))) (size!6628 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13253)

(declare-datatypes ((List!4084 0))(
  ( (Nil!4081) (Cons!4080 (h!4747 (_ BitVec 64)) (t!9166 List!4084)) )
))
(declare-fun arrayNoDuplicates!0 (array!13253 (_ BitVec 32) List!4084) Bool)

(assert (=> b!270089 (= res!134165 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4081))))

(declare-fun b!270090 () Bool)

(declare-datatypes ((Unit!8407 0))(
  ( (Unit!8408) )
))
(declare-fun e!174139 () Unit!8407)

(declare-fun Unit!8409 () Unit!8407)

(assert (=> b!270090 (= e!174139 Unit!8409)))

(declare-fun b!270091 () Bool)

(declare-fun lt!135457 () Unit!8407)

(assert (=> b!270091 (= e!174139 lt!135457)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8407)

(assert (=> b!270091 (= lt!135457 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135459 () array!13253)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13253 (_ BitVec 32)) Bool)

(assert (=> b!270091 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135459 mask!3868)))

(declare-fun b!270092 () Bool)

(declare-fun res!134164 () Bool)

(assert (=> b!270092 (=> (not res!134164) (not e!174138))))

(assert (=> b!270092 (= res!134164 (and (= (size!6628 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6628 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6628 a!3325))))))

(declare-fun b!270093 () Bool)

(declare-fun res!134161 () Bool)

(assert (=> b!270093 (=> (not res!134161) (not e!174138))))

(declare-fun arrayContainsKey!0 (array!13253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270093 (= res!134161 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270094 () Bool)

(declare-fun res!134159 () Bool)

(assert (=> b!270094 (=> (not res!134159) (not e!174138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270094 (= res!134159 (validKeyInArray!0 k0!2581))))

(declare-fun b!270095 () Bool)

(declare-fun res!134166 () Bool)

(declare-fun e!174140 () Bool)

(assert (=> b!270095 (=> (not res!134166) (not e!174140))))

(assert (=> b!270095 (= res!134166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270096 () Bool)

(declare-fun e!174136 () Bool)

(assert (=> b!270096 (= e!174140 e!174136)))

(declare-fun res!134160 () Bool)

(assert (=> b!270096 (=> (not res!134160) (not e!174136))))

(assert (=> b!270096 (= res!134160 (= startIndex!26 i!1267))))

(assert (=> b!270096 (= lt!135459 (array!13254 (store (arr!6276 a!3325) i!1267 k0!2581) (size!6628 a!3325)))))

(declare-fun b!270097 () Bool)

(assert (=> b!270097 (= e!174138 e!174140)))

(declare-fun res!134162 () Bool)

(assert (=> b!270097 (=> (not res!134162) (not e!174140))))

(declare-datatypes ((SeekEntryResult!1434 0))(
  ( (MissingZero!1434 (index!7906 (_ BitVec 32))) (Found!1434 (index!7907 (_ BitVec 32))) (Intermediate!1434 (undefined!2246 Bool) (index!7908 (_ BitVec 32)) (x!26247 (_ BitVec 32))) (Undefined!1434) (MissingVacant!1434 (index!7909 (_ BitVec 32))) )
))
(declare-fun lt!135458 () SeekEntryResult!1434)

(assert (=> b!270097 (= res!134162 (or (= lt!135458 (MissingZero!1434 i!1267)) (= lt!135458 (MissingVacant!1434 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13253 (_ BitVec 32)) SeekEntryResult!1434)

(assert (=> b!270097 (= lt!135458 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270098 () Bool)

(assert (=> b!270098 (= e!174136 (not true))))

(assert (=> b!270098 (= (seekEntryOrOpen!0 k0!2581 lt!135459 mask!3868) (Found!1434 i!1267))))

(declare-fun lt!135460 () Unit!8407)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8407)

(assert (=> b!270098 (= lt!135460 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135456 () Unit!8407)

(assert (=> b!270098 (= lt!135456 e!174139)))

(declare-fun c!45516 () Bool)

(assert (=> b!270098 (= c!45516 (bvslt startIndex!26 (bvsub (size!6628 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!134163 () Bool)

(assert (=> start!26156 (=> (not res!134163) (not e!174138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26156 (= res!134163 (validMask!0 mask!3868))))

(assert (=> start!26156 e!174138))

(declare-fun array_inv!4239 (array!13253) Bool)

(assert (=> start!26156 (array_inv!4239 a!3325)))

(assert (=> start!26156 true))

(assert (= (and start!26156 res!134163) b!270092))

(assert (= (and b!270092 res!134164) b!270094))

(assert (= (and b!270094 res!134159) b!270089))

(assert (= (and b!270089 res!134165) b!270093))

(assert (= (and b!270093 res!134161) b!270097))

(assert (= (and b!270097 res!134162) b!270095))

(assert (= (and b!270095 res!134166) b!270096))

(assert (= (and b!270096 res!134160) b!270098))

(assert (= (and b!270098 c!45516) b!270091))

(assert (= (and b!270098 (not c!45516)) b!270090))

(declare-fun m!285771 () Bool)

(assert (=> b!270096 m!285771))

(declare-fun m!285773 () Bool)

(assert (=> b!270098 m!285773))

(declare-fun m!285775 () Bool)

(assert (=> b!270098 m!285775))

(declare-fun m!285777 () Bool)

(assert (=> start!26156 m!285777))

(declare-fun m!285779 () Bool)

(assert (=> start!26156 m!285779))

(declare-fun m!285781 () Bool)

(assert (=> b!270091 m!285781))

(declare-fun m!285783 () Bool)

(assert (=> b!270091 m!285783))

(declare-fun m!285785 () Bool)

(assert (=> b!270095 m!285785))

(declare-fun m!285787 () Bool)

(assert (=> b!270093 m!285787))

(declare-fun m!285789 () Bool)

(assert (=> b!270094 m!285789))

(declare-fun m!285791 () Bool)

(assert (=> b!270089 m!285791))

(declare-fun m!285793 () Bool)

(assert (=> b!270097 m!285793))

(check-sat (not b!270094) (not b!270097) (not start!26156) (not b!270091) (not b!270093) (not b!270095) (not b!270098) (not b!270089))
(check-sat)
