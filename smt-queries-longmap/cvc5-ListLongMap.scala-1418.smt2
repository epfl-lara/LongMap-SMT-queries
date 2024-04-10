; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27534 () Bool)

(assert start!27534)

(declare-fun b!284520 () Bool)

(declare-fun e!180472 () Bool)

(assert (=> b!284520 (= e!180472 false)))

(declare-fun lt!140530 () Bool)

(declare-datatypes ((array!14184 0))(
  ( (array!14185 (arr!6731 (Array (_ BitVec 32) (_ BitVec 64))) (size!7083 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14184)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14184 (_ BitVec 32)) Bool)

(assert (=> b!284520 (= lt!140530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147028 () Bool)

(declare-fun e!180473 () Bool)

(assert (=> start!27534 (=> (not res!147028) (not e!180473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27534 (= res!147028 (validMask!0 mask!3868))))

(assert (=> start!27534 e!180473))

(declare-fun array_inv!4694 (array!14184) Bool)

(assert (=> start!27534 (array_inv!4694 a!3325)))

(assert (=> start!27534 true))

(declare-fun b!284521 () Bool)

(declare-fun res!147031 () Bool)

(assert (=> b!284521 (=> (not res!147031) (not e!180473))))

(declare-datatypes ((List!4539 0))(
  ( (Nil!4536) (Cons!4535 (h!5208 (_ BitVec 64)) (t!9621 List!4539)) )
))
(declare-fun arrayNoDuplicates!0 (array!14184 (_ BitVec 32) List!4539) Bool)

(assert (=> b!284521 (= res!147031 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4536))))

(declare-fun b!284522 () Bool)

(declare-fun res!147029 () Bool)

(assert (=> b!284522 (=> (not res!147029) (not e!180473))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284522 (= res!147029 (validKeyInArray!0 k!2581))))

(declare-fun b!284523 () Bool)

(declare-fun res!147032 () Bool)

(assert (=> b!284523 (=> (not res!147032) (not e!180473))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284523 (= res!147032 (and (= (size!7083 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7083 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7083 a!3325))))))

(declare-fun b!284524 () Bool)

(declare-fun res!147033 () Bool)

(assert (=> b!284524 (=> (not res!147033) (not e!180473))))

(declare-fun arrayContainsKey!0 (array!14184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284524 (= res!147033 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284525 () Bool)

(assert (=> b!284525 (= e!180473 e!180472)))

(declare-fun res!147030 () Bool)

(assert (=> b!284525 (=> (not res!147030) (not e!180472))))

(declare-datatypes ((SeekEntryResult!1889 0))(
  ( (MissingZero!1889 (index!9726 (_ BitVec 32))) (Found!1889 (index!9727 (_ BitVec 32))) (Intermediate!1889 (undefined!2701 Bool) (index!9728 (_ BitVec 32)) (x!27936 (_ BitVec 32))) (Undefined!1889) (MissingVacant!1889 (index!9729 (_ BitVec 32))) )
))
(declare-fun lt!140529 () SeekEntryResult!1889)

(assert (=> b!284525 (= res!147030 (or (= lt!140529 (MissingZero!1889 i!1267)) (= lt!140529 (MissingVacant!1889 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14184 (_ BitVec 32)) SeekEntryResult!1889)

(assert (=> b!284525 (= lt!140529 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27534 res!147028) b!284523))

(assert (= (and b!284523 res!147032) b!284522))

(assert (= (and b!284522 res!147029) b!284521))

(assert (= (and b!284521 res!147031) b!284524))

(assert (= (and b!284524 res!147033) b!284525))

(assert (= (and b!284525 res!147030) b!284520))

(declare-fun m!299517 () Bool)

(assert (=> b!284522 m!299517))

(declare-fun m!299519 () Bool)

(assert (=> b!284520 m!299519))

(declare-fun m!299521 () Bool)

(assert (=> b!284524 m!299521))

(declare-fun m!299523 () Bool)

(assert (=> start!27534 m!299523))

(declare-fun m!299525 () Bool)

(assert (=> start!27534 m!299525))

(declare-fun m!299527 () Bool)

(assert (=> b!284521 m!299527))

(declare-fun m!299529 () Bool)

(assert (=> b!284525 m!299529))

(push 1)

