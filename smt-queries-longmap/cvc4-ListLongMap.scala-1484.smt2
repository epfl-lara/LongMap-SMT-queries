; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28294 () Bool)

(assert start!28294)

(declare-fun b!289941 () Bool)

(declare-fun e!183515 () Bool)

(assert (=> b!289941 (= e!183515 false)))

(declare-fun lt!143158 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14608 0))(
  ( (array!14609 (arr!6931 (Array (_ BitVec 32) (_ BitVec 64))) (size!7283 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14608)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2080 0))(
  ( (MissingZero!2080 (index!10490 (_ BitVec 32))) (Found!2080 (index!10491 (_ BitVec 32))) (Intermediate!2080 (undefined!2892 Bool) (index!10492 (_ BitVec 32)) (x!28685 (_ BitVec 32))) (Undefined!2080) (MissingVacant!2080 (index!10493 (_ BitVec 32))) )
))
(declare-fun lt!143161 () SeekEntryResult!2080)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14608 (_ BitVec 32)) SeekEntryResult!2080)

(assert (=> b!289941 (= lt!143161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143158 k!2524 (array!14609 (store (arr!6931 a!3312) i!1256 k!2524) (size!7283 a!3312)) mask!3809))))

(declare-fun lt!143160 () SeekEntryResult!2080)

(assert (=> b!289941 (= lt!143160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143158 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289941 (= lt!143158 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289942 () Bool)

(declare-fun res!151424 () Bool)

(declare-fun e!183514 () Bool)

(assert (=> b!289942 (=> (not res!151424) (not e!183514))))

(assert (=> b!289942 (= res!151424 (and (= (size!7283 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7283 a!3312))))))

(declare-fun b!289943 () Bool)

(declare-fun res!151423 () Bool)

(assert (=> b!289943 (=> (not res!151423) (not e!183515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14608 (_ BitVec 32)) Bool)

(assert (=> b!289943 (= res!151423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!151422 () Bool)

(assert (=> start!28294 (=> (not res!151422) (not e!183514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28294 (= res!151422 (validMask!0 mask!3809))))

(assert (=> start!28294 e!183514))

(assert (=> start!28294 true))

(declare-fun array_inv!4894 (array!14608) Bool)

(assert (=> start!28294 (array_inv!4894 a!3312)))

(declare-fun b!289944 () Bool)

(declare-fun res!151425 () Bool)

(assert (=> b!289944 (=> (not res!151425) (not e!183514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289944 (= res!151425 (validKeyInArray!0 k!2524))))

(declare-fun b!289945 () Bool)

(assert (=> b!289945 (= e!183514 e!183515)))

(declare-fun res!151421 () Bool)

(assert (=> b!289945 (=> (not res!151421) (not e!183515))))

(declare-fun lt!143159 () SeekEntryResult!2080)

(assert (=> b!289945 (= res!151421 (or (= lt!143159 (MissingZero!2080 i!1256)) (= lt!143159 (MissingVacant!2080 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14608 (_ BitVec 32)) SeekEntryResult!2080)

(assert (=> b!289945 (= lt!143159 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289946 () Bool)

(declare-fun res!151420 () Bool)

(assert (=> b!289946 (=> (not res!151420) (not e!183514))))

(declare-fun arrayContainsKey!0 (array!14608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289946 (= res!151420 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28294 res!151422) b!289942))

(assert (= (and b!289942 res!151424) b!289944))

(assert (= (and b!289944 res!151425) b!289946))

(assert (= (and b!289946 res!151420) b!289945))

(assert (= (and b!289945 res!151421) b!289943))

(assert (= (and b!289943 res!151423) b!289941))

(declare-fun m!304027 () Bool)

(assert (=> b!289946 m!304027))

(declare-fun m!304029 () Bool)

(assert (=> start!28294 m!304029))

(declare-fun m!304031 () Bool)

(assert (=> start!28294 m!304031))

(declare-fun m!304033 () Bool)

(assert (=> b!289945 m!304033))

(declare-fun m!304035 () Bool)

(assert (=> b!289944 m!304035))

(declare-fun m!304037 () Bool)

(assert (=> b!289943 m!304037))

(declare-fun m!304039 () Bool)

(assert (=> b!289941 m!304039))

(declare-fun m!304041 () Bool)

(assert (=> b!289941 m!304041))

(declare-fun m!304043 () Bool)

(assert (=> b!289941 m!304043))

(declare-fun m!304045 () Bool)

(assert (=> b!289941 m!304045))

(push 1)

(assert (not b!289946))

(assert (not start!28294))

