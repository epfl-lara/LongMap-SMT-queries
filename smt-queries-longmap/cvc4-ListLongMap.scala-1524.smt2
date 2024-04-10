; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28678 () Bool)

(assert start!28678)

(declare-fun b!293127 () Bool)

(declare-fun res!154186 () Bool)

(declare-fun e!185368 () Bool)

(assert (=> b!293127 (=> (not res!154186) (not e!185368))))

(declare-datatypes ((array!14857 0))(
  ( (array!14858 (arr!7051 (Array (_ BitVec 32) (_ BitVec 64))) (size!7403 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14857)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14857 (_ BitVec 32)) Bool)

(assert (=> b!293127 (= res!154186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293128 () Bool)

(declare-fun e!185369 () Bool)

(assert (=> b!293128 (= e!185369 e!185368)))

(declare-fun res!154183 () Bool)

(assert (=> b!293128 (=> (not res!154183) (not e!185368))))

(declare-datatypes ((SeekEntryResult!2200 0))(
  ( (MissingZero!2200 (index!10970 (_ BitVec 32))) (Found!2200 (index!10971 (_ BitVec 32))) (Intermediate!2200 (undefined!3012 Bool) (index!10972 (_ BitVec 32)) (x!29143 (_ BitVec 32))) (Undefined!2200) (MissingVacant!2200 (index!10973 (_ BitVec 32))) )
))
(declare-fun lt!145285 () SeekEntryResult!2200)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293128 (= res!154183 (or (= lt!145285 (MissingZero!2200 i!1256)) (= lt!145285 (MissingVacant!2200 i!1256))))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14857 (_ BitVec 32)) SeekEntryResult!2200)

(assert (=> b!293128 (= lt!145285 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!293129 () Bool)

(declare-fun res!154185 () Bool)

(assert (=> b!293129 (=> (not res!154185) (not e!185369))))

(declare-fun arrayContainsKey!0 (array!14857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293129 (= res!154185 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293130 () Bool)

(declare-fun res!154188 () Bool)

(assert (=> b!293130 (=> (not res!154188) (not e!185369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293130 (= res!154188 (validKeyInArray!0 k!2524))))

(declare-fun b!293131 () Bool)

(assert (=> b!293131 (= e!185368 false)))

(declare-fun lt!145284 () SeekEntryResult!2200)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14857 (_ BitVec 32)) SeekEntryResult!2200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293131 (= lt!145284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun res!154187 () Bool)

(assert (=> start!28678 (=> (not res!154187) (not e!185369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28678 (= res!154187 (validMask!0 mask!3809))))

(assert (=> start!28678 e!185369))

(assert (=> start!28678 true))

(declare-fun array_inv!5014 (array!14857) Bool)

(assert (=> start!28678 (array_inv!5014 a!3312)))

(declare-fun b!293132 () Bool)

(declare-fun res!154184 () Bool)

(assert (=> b!293132 (=> (not res!154184) (not e!185369))))

(assert (=> b!293132 (= res!154184 (and (= (size!7403 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7403 a!3312))))))

(assert (= (and start!28678 res!154187) b!293132))

(assert (= (and b!293132 res!154184) b!293130))

(assert (= (and b!293130 res!154188) b!293129))

(assert (= (and b!293129 res!154185) b!293128))

(assert (= (and b!293128 res!154183) b!293127))

(assert (= (and b!293127 res!154186) b!293131))

(declare-fun m!306929 () Bool)

(assert (=> b!293128 m!306929))

(declare-fun m!306931 () Bool)

(assert (=> b!293129 m!306931))

(declare-fun m!306933 () Bool)

(assert (=> b!293127 m!306933))

(declare-fun m!306935 () Bool)

(assert (=> start!28678 m!306935))

(declare-fun m!306937 () Bool)

(assert (=> start!28678 m!306937))

(declare-fun m!306939 () Bool)

(assert (=> b!293130 m!306939))

(declare-fun m!306941 () Bool)

(assert (=> b!293131 m!306941))

(assert (=> b!293131 m!306941))

(declare-fun m!306943 () Bool)

(assert (=> b!293131 m!306943))

(push 1)

(assert (not start!28678))

(assert (not b!293127))

(assert (not b!293131))

(assert (not b!293130))

(assert (not b!293128))

(assert (not b!293129))

