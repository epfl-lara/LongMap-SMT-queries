; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28296 () Bool)

(assert start!28296)

(declare-fun res!151443 () Bool)

(declare-fun e!183523 () Bool)

(assert (=> start!28296 (=> (not res!151443) (not e!183523))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28296 (= res!151443 (validMask!0 mask!3809))))

(assert (=> start!28296 e!183523))

(assert (=> start!28296 true))

(declare-datatypes ((array!14610 0))(
  ( (array!14611 (arr!6932 (Array (_ BitVec 32) (_ BitVec 64))) (size!7284 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14610)

(declare-fun array_inv!4895 (array!14610) Bool)

(assert (=> start!28296 (array_inv!4895 a!3312)))

(declare-fun b!289959 () Bool)

(declare-fun res!151441 () Bool)

(declare-fun e!183522 () Bool)

(assert (=> b!289959 (=> (not res!151441) (not e!183522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14610 (_ BitVec 32)) Bool)

(assert (=> b!289959 (= res!151441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289960 () Bool)

(declare-fun res!151438 () Bool)

(assert (=> b!289960 (=> (not res!151438) (not e!183523))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289960 (= res!151438 (validKeyInArray!0 k!2524))))

(declare-fun b!289961 () Bool)

(declare-fun res!151442 () Bool)

(assert (=> b!289961 (=> (not res!151442) (not e!183523))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289961 (= res!151442 (and (= (size!7284 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7284 a!3312))))))

(declare-fun b!289962 () Bool)

(declare-fun res!151439 () Bool)

(assert (=> b!289962 (=> (not res!151439) (not e!183523))))

(declare-fun arrayContainsKey!0 (array!14610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289962 (= res!151439 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289963 () Bool)

(assert (=> b!289963 (= e!183523 e!183522)))

(declare-fun res!151440 () Bool)

(assert (=> b!289963 (=> (not res!151440) (not e!183522))))

(declare-datatypes ((SeekEntryResult!2081 0))(
  ( (MissingZero!2081 (index!10494 (_ BitVec 32))) (Found!2081 (index!10495 (_ BitVec 32))) (Intermediate!2081 (undefined!2893 Bool) (index!10496 (_ BitVec 32)) (x!28694 (_ BitVec 32))) (Undefined!2081) (MissingVacant!2081 (index!10497 (_ BitVec 32))) )
))
(declare-fun lt!143173 () SeekEntryResult!2081)

(assert (=> b!289963 (= res!151440 (or (= lt!143173 (MissingZero!2081 i!1256)) (= lt!143173 (MissingVacant!2081 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14610 (_ BitVec 32)) SeekEntryResult!2081)

(assert (=> b!289963 (= lt!143173 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289964 () Bool)

(assert (=> b!289964 (= e!183522 false)))

(declare-fun lt!143171 () SeekEntryResult!2081)

(declare-fun lt!143170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14610 (_ BitVec 32)) SeekEntryResult!2081)

(assert (=> b!289964 (= lt!143171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143170 k!2524 (array!14611 (store (arr!6932 a!3312) i!1256 k!2524) (size!7284 a!3312)) mask!3809))))

(declare-fun lt!143172 () SeekEntryResult!2081)

(assert (=> b!289964 (= lt!143172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143170 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289964 (= lt!143170 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28296 res!151443) b!289961))

(assert (= (and b!289961 res!151442) b!289960))

(assert (= (and b!289960 res!151438) b!289962))

(assert (= (and b!289962 res!151439) b!289963))

(assert (= (and b!289963 res!151440) b!289959))

(assert (= (and b!289959 res!151441) b!289964))

(declare-fun m!304047 () Bool)

(assert (=> b!289959 m!304047))

(declare-fun m!304049 () Bool)

(assert (=> start!28296 m!304049))

(declare-fun m!304051 () Bool)

(assert (=> start!28296 m!304051))

(declare-fun m!304053 () Bool)

(assert (=> b!289963 m!304053))

(declare-fun m!304055 () Bool)

(assert (=> b!289962 m!304055))

(declare-fun m!304057 () Bool)

(assert (=> b!289964 m!304057))

(declare-fun m!304059 () Bool)

(assert (=> b!289964 m!304059))

(declare-fun m!304061 () Bool)

(assert (=> b!289964 m!304061))

(declare-fun m!304063 () Bool)

(assert (=> b!289964 m!304063))

(declare-fun m!304065 () Bool)

(assert (=> b!289960 m!304065))

(push 1)

