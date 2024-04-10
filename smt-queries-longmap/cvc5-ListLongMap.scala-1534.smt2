; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29134 () Bool)

(assert start!29134)

(declare-fun b!295558 () Bool)

(declare-fun e!186807 () Bool)

(declare-fun e!186811 () Bool)

(assert (=> b!295558 (= e!186807 e!186811)))

(declare-fun res!155368 () Bool)

(assert (=> b!295558 (=> (not res!155368) (not e!186811))))

(declare-datatypes ((SeekEntryResult!2228 0))(
  ( (MissingZero!2228 (index!11082 (_ BitVec 32))) (Found!2228 (index!11083 (_ BitVec 32))) (Intermediate!2228 (undefined!3040 Bool) (index!11084 (_ BitVec 32)) (x!29304 (_ BitVec 32))) (Undefined!2228) (MissingVacant!2228 (index!11085 (_ BitVec 32))) )
))
(declare-fun lt!146555 () SeekEntryResult!2228)

(declare-fun lt!146556 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295558 (= res!155368 (or lt!146556 (= lt!146555 (MissingVacant!2228 i!1256))))))

(assert (=> b!295558 (= lt!146556 (= lt!146555 (MissingZero!2228 i!1256)))))

(declare-datatypes ((array!14937 0))(
  ( (array!14938 (arr!7079 (Array (_ BitVec 32) (_ BitVec 64))) (size!7431 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14937)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14937 (_ BitVec 32)) SeekEntryResult!2228)

(assert (=> b!295558 (= lt!146555 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!155369 () Bool)

(assert (=> start!29134 (=> (not res!155369) (not e!186807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29134 (= res!155369 (validMask!0 mask!3809))))

(assert (=> start!29134 e!186807))

(assert (=> start!29134 true))

(declare-fun array_inv!5042 (array!14937) Bool)

(assert (=> start!29134 (array_inv!5042 a!3312)))

(declare-fun b!295559 () Bool)

(declare-fun res!155367 () Bool)

(assert (=> b!295559 (=> (not res!155367) (not e!186807))))

(declare-fun arrayContainsKey!0 (array!14937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295559 (= res!155367 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295560 () Bool)

(declare-fun res!155371 () Bool)

(assert (=> b!295560 (=> (not res!155371) (not e!186811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14937 (_ BitVec 32)) Bool)

(assert (=> b!295560 (= res!155371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295561 () Bool)

(declare-fun e!186808 () Bool)

(assert (=> b!295561 (= e!186811 e!186808)))

(declare-fun res!155370 () Bool)

(assert (=> b!295561 (=> (not res!155370) (not e!186808))))

(assert (=> b!295561 (= res!155370 lt!146556)))

(declare-fun lt!146558 () SeekEntryResult!2228)

(declare-fun lt!146554 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14937 (_ BitVec 32)) SeekEntryResult!2228)

(assert (=> b!295561 (= lt!146558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146554 k!2524 (array!14938 (store (arr!7079 a!3312) i!1256 k!2524) (size!7431 a!3312)) mask!3809))))

(declare-fun lt!146557 () SeekEntryResult!2228)

(assert (=> b!295561 (= lt!146557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146554 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295561 (= lt!146554 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295562 () Bool)

(declare-fun e!186809 () Bool)

(assert (=> b!295562 (= e!186808 e!186809)))

(declare-fun res!155366 () Bool)

(assert (=> b!295562 (=> (not res!155366) (not e!186809))))

(declare-fun lt!146559 () Bool)

(assert (=> b!295562 (= res!155366 (and (or lt!146559 (not (undefined!3040 lt!146557))) (or lt!146559 (not (= (select (arr!7079 a!3312) (index!11084 lt!146557)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146559 (not (= (select (arr!7079 a!3312) (index!11084 lt!146557)) k!2524))) (not lt!146559)))))

(assert (=> b!295562 (= lt!146559 (not (is-Intermediate!2228 lt!146557)))))

(declare-fun b!295563 () Bool)

(declare-fun res!155372 () Bool)

(assert (=> b!295563 (=> (not res!155372) (not e!186807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295563 (= res!155372 (validKeyInArray!0 k!2524))))

(declare-fun b!295564 () Bool)

(assert (=> b!295564 (= e!186809 (not true))))

(assert (=> b!295564 (and (= (select (arr!7079 a!3312) (index!11084 lt!146557)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11084 lt!146557) i!1256))))

(declare-fun b!295565 () Bool)

(declare-fun res!155373 () Bool)

(assert (=> b!295565 (=> (not res!155373) (not e!186807))))

(assert (=> b!295565 (= res!155373 (and (= (size!7431 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7431 a!3312))))))

(assert (= (and start!29134 res!155369) b!295565))

(assert (= (and b!295565 res!155373) b!295563))

(assert (= (and b!295563 res!155372) b!295559))

(assert (= (and b!295559 res!155367) b!295558))

(assert (= (and b!295558 res!155368) b!295560))

(assert (= (and b!295560 res!155371) b!295561))

(assert (= (and b!295561 res!155370) b!295562))

(assert (= (and b!295562 res!155366) b!295564))

(declare-fun m!308655 () Bool)

(assert (=> b!295560 m!308655))

(declare-fun m!308657 () Bool)

(assert (=> b!295562 m!308657))

(declare-fun m!308659 () Bool)

(assert (=> b!295563 m!308659))

(declare-fun m!308661 () Bool)

(assert (=> start!29134 m!308661))

(declare-fun m!308663 () Bool)

(assert (=> start!29134 m!308663))

(assert (=> b!295564 m!308657))

(declare-fun m!308665 () Bool)

(assert (=> b!295559 m!308665))

(declare-fun m!308667 () Bool)

(assert (=> b!295558 m!308667))

(declare-fun m!308669 () Bool)

(assert (=> b!295561 m!308669))

(declare-fun m!308671 () Bool)

(assert (=> b!295561 m!308671))

(declare-fun m!308673 () Bool)

(assert (=> b!295561 m!308673))

(declare-fun m!308675 () Bool)

(assert (=> b!295561 m!308675))

(push 1)

