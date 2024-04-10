; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28428 () Bool)

(assert start!28428)

(declare-fun b!291097 () Bool)

(declare-fun res!152441 () Bool)

(declare-fun e!184202 () Bool)

(assert (=> b!291097 (=> (not res!152441) (not e!184202))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291097 (= res!152441 (validKeyInArray!0 k!2524))))

(declare-fun b!291098 () Bool)

(declare-fun e!184198 () Bool)

(declare-fun e!184201 () Bool)

(assert (=> b!291098 (= e!184198 e!184201)))

(declare-fun res!152438 () Bool)

(assert (=> b!291098 (=> (not res!152438) (not e!184201))))

(declare-fun lt!143938 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2123 0))(
  ( (MissingZero!2123 (index!10662 (_ BitVec 32))) (Found!2123 (index!10663 (_ BitVec 32))) (Intermediate!2123 (undefined!2935 Bool) (index!10664 (_ BitVec 32)) (x!28854 (_ BitVec 32))) (Undefined!2123) (MissingVacant!2123 (index!10665 (_ BitVec 32))) )
))
(declare-fun lt!143939 () SeekEntryResult!2123)

(assert (=> b!291098 (= res!152438 (and (not lt!143938) (= lt!143939 (MissingVacant!2123 i!1256))))))

(declare-datatypes ((array!14697 0))(
  ( (array!14698 (arr!6974 (Array (_ BitVec 32) (_ BitVec 64))) (size!7326 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14697)

(declare-fun lt!143937 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!143936 () SeekEntryResult!2123)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14697 (_ BitVec 32)) SeekEntryResult!2123)

(assert (=> b!291098 (= lt!143936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143937 k!2524 (array!14698 (store (arr!6974 a!3312) i!1256 k!2524) (size!7326 a!3312)) mask!3809))))

(declare-fun lt!143941 () SeekEntryResult!2123)

(assert (=> b!291098 (= lt!143941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143937 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291098 (= lt!143937 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291099 () Bool)

(declare-fun e!184199 () Bool)

(assert (=> b!291099 (= e!184199 (not true))))

(assert (=> b!291099 (= (index!10664 lt!143941) i!1256)))

(declare-fun b!291100 () Bool)

(declare-fun res!152437 () Bool)

(assert (=> b!291100 (=> (not res!152437) (not e!184202))))

(declare-fun arrayContainsKey!0 (array!14697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291100 (= res!152437 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291101 () Bool)

(declare-fun res!152440 () Bool)

(assert (=> b!291101 (=> (not res!152440) (not e!184198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14697 (_ BitVec 32)) Bool)

(assert (=> b!291101 (= res!152440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152436 () Bool)

(assert (=> start!28428 (=> (not res!152436) (not e!184202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28428 (= res!152436 (validMask!0 mask!3809))))

(assert (=> start!28428 e!184202))

(assert (=> start!28428 true))

(declare-fun array_inv!4937 (array!14697) Bool)

(assert (=> start!28428 (array_inv!4937 a!3312)))

(declare-fun b!291102 () Bool)

(assert (=> b!291102 (= e!184201 e!184199)))

(declare-fun res!152442 () Bool)

(assert (=> b!291102 (=> (not res!152442) (not e!184199))))

(declare-fun lt!143940 () Bool)

(assert (=> b!291102 (= res!152442 (and (or lt!143940 (not (undefined!2935 lt!143941))) (not lt!143940) (= (select (arr!6974 a!3312) (index!10664 lt!143941)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291102 (= lt!143940 (not (is-Intermediate!2123 lt!143941)))))

(declare-fun b!291103 () Bool)

(assert (=> b!291103 (= e!184202 e!184198)))

(declare-fun res!152435 () Bool)

(assert (=> b!291103 (=> (not res!152435) (not e!184198))))

(assert (=> b!291103 (= res!152435 (or lt!143938 (= lt!143939 (MissingVacant!2123 i!1256))))))

(assert (=> b!291103 (= lt!143938 (= lt!143939 (MissingZero!2123 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14697 (_ BitVec 32)) SeekEntryResult!2123)

(assert (=> b!291103 (= lt!143939 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291104 () Bool)

(declare-fun res!152439 () Bool)

(assert (=> b!291104 (=> (not res!152439) (not e!184202))))

(assert (=> b!291104 (= res!152439 (and (= (size!7326 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7326 a!3312))))))

(assert (= (and start!28428 res!152436) b!291104))

(assert (= (and b!291104 res!152439) b!291097))

(assert (= (and b!291097 res!152441) b!291100))

(assert (= (and b!291100 res!152437) b!291103))

(assert (= (and b!291103 res!152435) b!291101))

(assert (= (and b!291101 res!152440) b!291098))

(assert (= (and b!291098 res!152438) b!291102))

(assert (= (and b!291102 res!152442) b!291099))

(declare-fun m!305061 () Bool)

(assert (=> b!291102 m!305061))

(declare-fun m!305063 () Bool)

(assert (=> b!291100 m!305063))

(declare-fun m!305065 () Bool)

(assert (=> b!291101 m!305065))

(declare-fun m!305067 () Bool)

(assert (=> b!291103 m!305067))

(declare-fun m!305069 () Bool)

(assert (=> start!28428 m!305069))

(declare-fun m!305071 () Bool)

(assert (=> start!28428 m!305071))

(declare-fun m!305073 () Bool)

(assert (=> b!291098 m!305073))

(declare-fun m!305075 () Bool)

(assert (=> b!291098 m!305075))

(declare-fun m!305077 () Bool)

(assert (=> b!291098 m!305077))

(declare-fun m!305079 () Bool)

(assert (=> b!291098 m!305079))

(declare-fun m!305081 () Bool)

(assert (=> b!291097 m!305081))

(push 1)

