; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28210 () Bool)

(assert start!28210)

(declare-fun b!288877 () Bool)

(declare-fun res!150506 () Bool)

(declare-fun e!182899 () Bool)

(assert (=> b!288877 (=> (not res!150506) (not e!182899))))

(declare-datatypes ((array!14524 0))(
  ( (array!14525 (arr!6889 (Array (_ BitVec 32) (_ BitVec 64))) (size!7241 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14524)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14524 (_ BitVec 32)) Bool)

(assert (=> b!288877 (= res!150506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288878 () Bool)

(declare-fun e!182903 () Bool)

(assert (=> b!288878 (= e!182899 e!182903)))

(declare-fun res!150502 () Bool)

(assert (=> b!288878 (=> (not res!150502) (not e!182903))))

(declare-fun lt!142409 () Bool)

(assert (=> b!288878 (= res!150502 lt!142409)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lt!142414 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2038 0))(
  ( (MissingZero!2038 (index!10322 (_ BitVec 32))) (Found!2038 (index!10323 (_ BitVec 32))) (Intermediate!2038 (undefined!2850 Bool) (index!10324 (_ BitVec 32)) (x!28531 (_ BitVec 32))) (Undefined!2038) (MissingVacant!2038 (index!10325 (_ BitVec 32))) )
))
(declare-fun lt!142412 () SeekEntryResult!2038)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14524 (_ BitVec 32)) SeekEntryResult!2038)

(assert (=> b!288878 (= lt!142412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142414 k!2524 (array!14525 (store (arr!6889 a!3312) i!1256 k!2524) (size!7241 a!3312)) mask!3809))))

(declare-fun lt!142410 () SeekEntryResult!2038)

(assert (=> b!288878 (= lt!142410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142414 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288878 (= lt!142414 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288879 () Bool)

(declare-fun e!182902 () Bool)

(assert (=> b!288879 (= e!182902 e!182899)))

(declare-fun res!150500 () Bool)

(assert (=> b!288879 (=> (not res!150500) (not e!182899))))

(declare-fun lt!142411 () SeekEntryResult!2038)

(assert (=> b!288879 (= res!150500 (or lt!142409 (= lt!142411 (MissingVacant!2038 i!1256))))))

(assert (=> b!288879 (= lt!142409 (= lt!142411 (MissingZero!2038 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14524 (_ BitVec 32)) SeekEntryResult!2038)

(assert (=> b!288879 (= lt!142411 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288880 () Bool)

(declare-fun e!182901 () Bool)

(assert (=> b!288880 (= e!182901 (not true))))

(assert (=> b!288880 (and (= (select (arr!6889 a!3312) (index!10324 lt!142410)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10324 lt!142410) i!1256))))

(declare-fun b!288881 () Bool)

(declare-fun res!150501 () Bool)

(assert (=> b!288881 (=> (not res!150501) (not e!182902))))

(assert (=> b!288881 (= res!150501 (and (= (size!7241 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7241 a!3312))))))

(declare-fun res!150507 () Bool)

(assert (=> start!28210 (=> (not res!150507) (not e!182902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28210 (= res!150507 (validMask!0 mask!3809))))

(assert (=> start!28210 e!182902))

(assert (=> start!28210 true))

(declare-fun array_inv!4852 (array!14524) Bool)

(assert (=> start!28210 (array_inv!4852 a!3312)))

(declare-fun b!288882 () Bool)

(assert (=> b!288882 (= e!182903 e!182901)))

(declare-fun res!150505 () Bool)

(assert (=> b!288882 (=> (not res!150505) (not e!182901))))

(declare-fun lt!142413 () Bool)

(assert (=> b!288882 (= res!150505 (and (or lt!142413 (not (undefined!2850 lt!142410))) (or lt!142413 (not (= (select (arr!6889 a!3312) (index!10324 lt!142410)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142413 (not (= (select (arr!6889 a!3312) (index!10324 lt!142410)) k!2524))) (not lt!142413)))))

(assert (=> b!288882 (= lt!142413 (not (is-Intermediate!2038 lt!142410)))))

(declare-fun b!288883 () Bool)

(declare-fun res!150504 () Bool)

(assert (=> b!288883 (=> (not res!150504) (not e!182902))))

(declare-fun arrayContainsKey!0 (array!14524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288883 (= res!150504 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288884 () Bool)

(declare-fun res!150503 () Bool)

(assert (=> b!288884 (=> (not res!150503) (not e!182902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288884 (= res!150503 (validKeyInArray!0 k!2524))))

(assert (= (and start!28210 res!150507) b!288881))

(assert (= (and b!288881 res!150501) b!288884))

(assert (= (and b!288884 res!150503) b!288883))

(assert (= (and b!288883 res!150504) b!288879))

(assert (= (and b!288879 res!150500) b!288877))

(assert (= (and b!288877 res!150506) b!288878))

(assert (= (and b!288878 res!150502) b!288882))

(assert (= (and b!288882 res!150505) b!288880))

(declare-fun m!303071 () Bool)

(assert (=> b!288878 m!303071))

(declare-fun m!303073 () Bool)

(assert (=> b!288878 m!303073))

(declare-fun m!303075 () Bool)

(assert (=> b!288878 m!303075))

(declare-fun m!303077 () Bool)

(assert (=> b!288878 m!303077))

(declare-fun m!303079 () Bool)

(assert (=> b!288877 m!303079))

(declare-fun m!303081 () Bool)

(assert (=> start!28210 m!303081))

(declare-fun m!303083 () Bool)

(assert (=> start!28210 m!303083))

(declare-fun m!303085 () Bool)

(assert (=> b!288880 m!303085))

(declare-fun m!303087 () Bool)

(assert (=> b!288883 m!303087))

(declare-fun m!303089 () Bool)

(assert (=> b!288884 m!303089))

(assert (=> b!288882 m!303085))

(declare-fun m!303091 () Bool)

(assert (=> b!288879 m!303091))

(push 1)

