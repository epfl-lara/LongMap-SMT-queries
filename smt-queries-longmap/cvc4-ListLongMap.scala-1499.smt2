; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28432 () Bool)

(assert start!28432)

(declare-fun b!291145 () Bool)

(declare-fun e!184228 () Bool)

(declare-fun e!184231 () Bool)

(assert (=> b!291145 (= e!184228 e!184231)))

(declare-fun res!152489 () Bool)

(assert (=> b!291145 (=> (not res!152489) (not e!184231))))

(declare-datatypes ((SeekEntryResult!2125 0))(
  ( (MissingZero!2125 (index!10670 (_ BitVec 32))) (Found!2125 (index!10671 (_ BitVec 32))) (Intermediate!2125 (undefined!2937 Bool) (index!10672 (_ BitVec 32)) (x!28856 (_ BitVec 32))) (Undefined!2125) (MissingVacant!2125 (index!10673 (_ BitVec 32))) )
))
(declare-fun lt!143973 () SeekEntryResult!2125)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143977 () Bool)

(assert (=> b!291145 (= res!152489 (and (not lt!143977) (= lt!143973 (MissingVacant!2125 i!1256))))))

(declare-fun lt!143972 () (_ BitVec 32))

(declare-fun lt!143976 () SeekEntryResult!2125)

(declare-datatypes ((array!14701 0))(
  ( (array!14702 (arr!6976 (Array (_ BitVec 32) (_ BitVec 64))) (size!7328 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14701)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14701 (_ BitVec 32)) SeekEntryResult!2125)

(assert (=> b!291145 (= lt!143976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143972 k!2524 (array!14702 (store (arr!6976 a!3312) i!1256 k!2524) (size!7328 a!3312)) mask!3809))))

(declare-fun lt!143975 () SeekEntryResult!2125)

(assert (=> b!291145 (= lt!143975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143972 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291145 (= lt!143972 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291146 () Bool)

(declare-fun e!184229 () Bool)

(assert (=> b!291146 (= e!184231 e!184229)))

(declare-fun res!152484 () Bool)

(assert (=> b!291146 (=> (not res!152484) (not e!184229))))

(declare-fun lt!143974 () Bool)

(assert (=> b!291146 (= res!152484 (and (or lt!143974 (not (undefined!2937 lt!143975))) (not lt!143974) (= (select (arr!6976 a!3312) (index!10672 lt!143975)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291146 (= lt!143974 (not (is-Intermediate!2125 lt!143975)))))

(declare-fun b!291147 () Bool)

(declare-fun res!152487 () Bool)

(declare-fun e!184230 () Bool)

(assert (=> b!291147 (=> (not res!152487) (not e!184230))))

(assert (=> b!291147 (= res!152487 (and (= (size!7328 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7328 a!3312))))))

(declare-fun b!291148 () Bool)

(declare-fun res!152485 () Bool)

(assert (=> b!291148 (=> (not res!152485) (not e!184230))))

(declare-fun arrayContainsKey!0 (array!14701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291148 (= res!152485 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152483 () Bool)

(assert (=> start!28432 (=> (not res!152483) (not e!184230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28432 (= res!152483 (validMask!0 mask!3809))))

(assert (=> start!28432 e!184230))

(assert (=> start!28432 true))

(declare-fun array_inv!4939 (array!14701) Bool)

(assert (=> start!28432 (array_inv!4939 a!3312)))

(declare-fun b!291149 () Bool)

(assert (=> b!291149 (= e!184230 e!184228)))

(declare-fun res!152488 () Bool)

(assert (=> b!291149 (=> (not res!152488) (not e!184228))))

(assert (=> b!291149 (= res!152488 (or lt!143977 (= lt!143973 (MissingVacant!2125 i!1256))))))

(assert (=> b!291149 (= lt!143977 (= lt!143973 (MissingZero!2125 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14701 (_ BitVec 32)) SeekEntryResult!2125)

(assert (=> b!291149 (= lt!143973 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291150 () Bool)

(assert (=> b!291150 (= e!184229 (not true))))

(assert (=> b!291150 (= (index!10672 lt!143975) i!1256)))

(declare-fun b!291151 () Bool)

(declare-fun res!152490 () Bool)

(assert (=> b!291151 (=> (not res!152490) (not e!184230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291151 (= res!152490 (validKeyInArray!0 k!2524))))

(declare-fun b!291152 () Bool)

(declare-fun res!152486 () Bool)

(assert (=> b!291152 (=> (not res!152486) (not e!184228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14701 (_ BitVec 32)) Bool)

(assert (=> b!291152 (= res!152486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28432 res!152483) b!291147))

(assert (= (and b!291147 res!152487) b!291151))

(assert (= (and b!291151 res!152490) b!291148))

(assert (= (and b!291148 res!152485) b!291149))

(assert (= (and b!291149 res!152488) b!291152))

(assert (= (and b!291152 res!152486) b!291145))

(assert (= (and b!291145 res!152489) b!291146))

(assert (= (and b!291146 res!152484) b!291150))

(declare-fun m!305105 () Bool)

(assert (=> start!28432 m!305105))

(declare-fun m!305107 () Bool)

(assert (=> start!28432 m!305107))

(declare-fun m!305109 () Bool)

(assert (=> b!291148 m!305109))

(declare-fun m!305111 () Bool)

(assert (=> b!291145 m!305111))

(declare-fun m!305113 () Bool)

(assert (=> b!291145 m!305113))

(declare-fun m!305115 () Bool)

(assert (=> b!291145 m!305115))

(declare-fun m!305117 () Bool)

(assert (=> b!291145 m!305117))

(declare-fun m!305119 () Bool)

(assert (=> b!291146 m!305119))

(declare-fun m!305121 () Bool)

(assert (=> b!291149 m!305121))

(declare-fun m!305123 () Bool)

(assert (=> b!291151 m!305123))

(declare-fun m!305125 () Bool)

(assert (=> b!291152 m!305125))

(push 1)

