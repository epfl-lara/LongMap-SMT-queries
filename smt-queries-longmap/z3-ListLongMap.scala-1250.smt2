; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26058 () Bool)

(assert start!26058)

(declare-fun b!268838 () Bool)

(declare-fun res!133094 () Bool)

(declare-fun e!173583 () Bool)

(assert (=> b!268838 (=> (not res!133094) (not e!173583))))

(declare-datatypes ((array!13154 0))(
  ( (array!13155 (arr!6226 (Array (_ BitVec 32) (_ BitVec 64))) (size!6578 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13154)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268838 (= res!133094 (and (= (size!6578 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6578 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6578 a!3325))))))

(declare-fun b!268839 () Bool)

(declare-fun res!133091 () Bool)

(assert (=> b!268839 (=> (not res!133091) (not e!173583))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268839 (= res!133091 (validKeyInArray!0 k0!2581))))

(declare-fun res!133090 () Bool)

(assert (=> start!26058 (=> (not res!133090) (not e!173583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26058 (= res!133090 (validMask!0 mask!3868))))

(assert (=> start!26058 e!173583))

(declare-fun array_inv!4176 (array!13154) Bool)

(assert (=> start!26058 (array_inv!4176 a!3325)))

(assert (=> start!26058 true))

(declare-fun b!268840 () Bool)

(declare-fun res!133092 () Bool)

(assert (=> b!268840 (=> (not res!133092) (not e!173583))))

(declare-datatypes ((List!3947 0))(
  ( (Nil!3944) (Cons!3943 (h!4610 (_ BitVec 64)) (t!9021 List!3947)) )
))
(declare-fun arrayNoDuplicates!0 (array!13154 (_ BitVec 32) List!3947) Bool)

(assert (=> b!268840 (= res!133092 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3944))))

(declare-fun b!268841 () Bool)

(declare-fun e!173584 () Bool)

(assert (=> b!268841 (= e!173583 e!173584)))

(declare-fun res!133093 () Bool)

(assert (=> b!268841 (=> (not res!133093) (not e!173584))))

(declare-datatypes ((SeekEntryResult!1349 0))(
  ( (MissingZero!1349 (index!7566 (_ BitVec 32))) (Found!1349 (index!7567 (_ BitVec 32))) (Intermediate!1349 (undefined!2161 Bool) (index!7568 (_ BitVec 32)) (x!26034 (_ BitVec 32))) (Undefined!1349) (MissingVacant!1349 (index!7569 (_ BitVec 32))) )
))
(declare-fun lt!135053 () SeekEntryResult!1349)

(assert (=> b!268841 (= res!133093 (or (= lt!135053 (MissingZero!1349 i!1267)) (= lt!135053 (MissingVacant!1349 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13154 (_ BitVec 32)) SeekEntryResult!1349)

(assert (=> b!268841 (= lt!135053 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268842 () Bool)

(declare-fun res!133095 () Bool)

(assert (=> b!268842 (=> (not res!133095) (not e!173583))))

(declare-fun arrayContainsKey!0 (array!13154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268842 (= res!133095 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268843 () Bool)

(assert (=> b!268843 (= e!173584 false)))

(declare-fun lt!135054 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13154 (_ BitVec 32)) Bool)

(assert (=> b!268843 (= lt!135054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26058 res!133090) b!268838))

(assert (= (and b!268838 res!133094) b!268839))

(assert (= (and b!268839 res!133091) b!268840))

(assert (= (and b!268840 res!133092) b!268842))

(assert (= (and b!268842 res!133095) b!268841))

(assert (= (and b!268841 res!133093) b!268843))

(declare-fun m!285047 () Bool)

(assert (=> b!268840 m!285047))

(declare-fun m!285049 () Bool)

(assert (=> b!268841 m!285049))

(declare-fun m!285051 () Bool)

(assert (=> start!26058 m!285051))

(declare-fun m!285053 () Bool)

(assert (=> start!26058 m!285053))

(declare-fun m!285055 () Bool)

(assert (=> b!268839 m!285055))

(declare-fun m!285057 () Bool)

(assert (=> b!268842 m!285057))

(declare-fun m!285059 () Bool)

(assert (=> b!268843 m!285059))

(check-sat (not b!268839) (not b!268843) (not b!268841) (not b!268842) (not b!268840) (not start!26058))
(check-sat)
