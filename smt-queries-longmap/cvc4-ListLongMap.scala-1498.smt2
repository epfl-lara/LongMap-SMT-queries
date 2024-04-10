; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28426 () Bool)

(assert start!28426)

(declare-fun b!291073 () Bool)

(declare-fun res!152415 () Bool)

(declare-fun e!184184 () Bool)

(assert (=> b!291073 (=> (not res!152415) (not e!184184))))

(declare-datatypes ((array!14695 0))(
  ( (array!14696 (arr!6973 (Array (_ BitVec 32) (_ BitVec 64))) (size!7325 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14695)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14695 (_ BitVec 32)) Bool)

(assert (=> b!291073 (= res!152415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291074 () Bool)

(declare-fun e!184187 () Bool)

(declare-fun e!184186 () Bool)

(assert (=> b!291074 (= e!184187 e!184186)))

(declare-fun res!152413 () Bool)

(assert (=> b!291074 (=> (not res!152413) (not e!184186))))

(declare-datatypes ((SeekEntryResult!2122 0))(
  ( (MissingZero!2122 (index!10658 (_ BitVec 32))) (Found!2122 (index!10659 (_ BitVec 32))) (Intermediate!2122 (undefined!2934 Bool) (index!10660 (_ BitVec 32)) (x!28845 (_ BitVec 32))) (Undefined!2122) (MissingVacant!2122 (index!10661 (_ BitVec 32))) )
))
(declare-fun lt!143918 () SeekEntryResult!2122)

(declare-fun lt!143921 () Bool)

(assert (=> b!291074 (= res!152413 (and (or lt!143921 (not (undefined!2934 lt!143918))) (not lt!143921) (= (select (arr!6973 a!3312) (index!10660 lt!143918)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291074 (= lt!143921 (not (is-Intermediate!2122 lt!143918)))))

(declare-fun b!291075 () Bool)

(declare-fun res!152417 () Bool)

(declare-fun e!184185 () Bool)

(assert (=> b!291075 (=> (not res!152417) (not e!184185))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291075 (= res!152417 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291076 () Bool)

(assert (=> b!291076 (= e!184184 e!184187)))

(declare-fun res!152418 () Bool)

(assert (=> b!291076 (=> (not res!152418) (not e!184187))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143919 () Bool)

(declare-fun lt!143920 () SeekEntryResult!2122)

(assert (=> b!291076 (= res!152418 (and (not lt!143919) (= lt!143920 (MissingVacant!2122 i!1256))))))

(declare-fun lt!143923 () SeekEntryResult!2122)

(declare-fun lt!143922 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14695 (_ BitVec 32)) SeekEntryResult!2122)

(assert (=> b!291076 (= lt!143923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143922 k!2524 (array!14696 (store (arr!6973 a!3312) i!1256 k!2524) (size!7325 a!3312)) mask!3809))))

(assert (=> b!291076 (= lt!143918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143922 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291076 (= lt!143922 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!152416 () Bool)

(assert (=> start!28426 (=> (not res!152416) (not e!184185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28426 (= res!152416 (validMask!0 mask!3809))))

(assert (=> start!28426 e!184185))

(assert (=> start!28426 true))

(declare-fun array_inv!4936 (array!14695) Bool)

(assert (=> start!28426 (array_inv!4936 a!3312)))

(declare-fun b!291077 () Bool)

(declare-fun res!152411 () Bool)

(assert (=> b!291077 (=> (not res!152411) (not e!184185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291077 (= res!152411 (validKeyInArray!0 k!2524))))

(declare-fun b!291078 () Bool)

(assert (=> b!291078 (= e!184185 e!184184)))

(declare-fun res!152412 () Bool)

(assert (=> b!291078 (=> (not res!152412) (not e!184184))))

(assert (=> b!291078 (= res!152412 (or lt!143919 (= lt!143920 (MissingVacant!2122 i!1256))))))

(assert (=> b!291078 (= lt!143919 (= lt!143920 (MissingZero!2122 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14695 (_ BitVec 32)) SeekEntryResult!2122)

(assert (=> b!291078 (= lt!143920 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291079 () Bool)

(assert (=> b!291079 (= e!184186 (not true))))

(assert (=> b!291079 (= (index!10660 lt!143918) i!1256)))

(declare-fun b!291080 () Bool)

(declare-fun res!152414 () Bool)

(assert (=> b!291080 (=> (not res!152414) (not e!184185))))

(assert (=> b!291080 (= res!152414 (and (= (size!7325 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7325 a!3312))))))

(assert (= (and start!28426 res!152416) b!291080))

(assert (= (and b!291080 res!152414) b!291077))

(assert (= (and b!291077 res!152411) b!291075))

(assert (= (and b!291075 res!152417) b!291078))

(assert (= (and b!291078 res!152412) b!291073))

(assert (= (and b!291073 res!152415) b!291076))

(assert (= (and b!291076 res!152418) b!291074))

(assert (= (and b!291074 res!152413) b!291079))

(declare-fun m!305039 () Bool)

(assert (=> b!291073 m!305039))

(declare-fun m!305041 () Bool)

(assert (=> b!291074 m!305041))

(declare-fun m!305043 () Bool)

(assert (=> start!28426 m!305043))

(declare-fun m!305045 () Bool)

(assert (=> start!28426 m!305045))

(declare-fun m!305047 () Bool)

(assert (=> b!291077 m!305047))

(declare-fun m!305049 () Bool)

(assert (=> b!291078 m!305049))

(declare-fun m!305051 () Bool)

(assert (=> b!291075 m!305051))

(declare-fun m!305053 () Bool)

(assert (=> b!291076 m!305053))

(declare-fun m!305055 () Bool)

(assert (=> b!291076 m!305055))

(declare-fun m!305057 () Bool)

(assert (=> b!291076 m!305057))

(declare-fun m!305059 () Bool)

(assert (=> b!291076 m!305059))

(push 1)

