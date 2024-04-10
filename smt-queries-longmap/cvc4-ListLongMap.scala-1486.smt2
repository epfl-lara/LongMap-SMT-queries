; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28306 () Bool)

(assert start!28306)

(declare-fun b!290049 () Bool)

(declare-fun e!183569 () Bool)

(declare-fun e!183568 () Bool)

(assert (=> b!290049 (= e!183569 e!183568)))

(declare-fun res!151530 () Bool)

(assert (=> b!290049 (=> (not res!151530) (not e!183568))))

(declare-datatypes ((SeekEntryResult!2086 0))(
  ( (MissingZero!2086 (index!10514 (_ BitVec 32))) (Found!2086 (index!10515 (_ BitVec 32))) (Intermediate!2086 (undefined!2898 Bool) (index!10516 (_ BitVec 32)) (x!28707 (_ BitVec 32))) (Undefined!2086) (MissingVacant!2086 (index!10517 (_ BitVec 32))) )
))
(declare-fun lt!143232 () SeekEntryResult!2086)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290049 (= res!151530 (or (= lt!143232 (MissingZero!2086 i!1256)) (= lt!143232 (MissingVacant!2086 i!1256))))))

(declare-datatypes ((array!14620 0))(
  ( (array!14621 (arr!6937 (Array (_ BitVec 32) (_ BitVec 64))) (size!7289 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14620)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14620 (_ BitVec 32)) SeekEntryResult!2086)

(assert (=> b!290049 (= lt!143232 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!151529 () Bool)

(assert (=> start!28306 (=> (not res!151529) (not e!183569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28306 (= res!151529 (validMask!0 mask!3809))))

(assert (=> start!28306 e!183569))

(assert (=> start!28306 true))

(declare-fun array_inv!4900 (array!14620) Bool)

(assert (=> start!28306 (array_inv!4900 a!3312)))

(declare-fun b!290050 () Bool)

(declare-fun res!151528 () Bool)

(assert (=> b!290050 (=> (not res!151528) (not e!183569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290050 (= res!151528 (validKeyInArray!0 k!2524))))

(declare-fun b!290051 () Bool)

(declare-fun res!151531 () Bool)

(assert (=> b!290051 (=> (not res!151531) (not e!183569))))

(declare-fun arrayContainsKey!0 (array!14620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290051 (= res!151531 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290052 () Bool)

(declare-fun res!151533 () Bool)

(assert (=> b!290052 (=> (not res!151533) (not e!183568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14620 (_ BitVec 32)) Bool)

(assert (=> b!290052 (= res!151533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290053 () Bool)

(declare-fun res!151532 () Bool)

(assert (=> b!290053 (=> (not res!151532) (not e!183569))))

(assert (=> b!290053 (= res!151532 (and (= (size!7289 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7289 a!3312))))))

(declare-fun b!290054 () Bool)

(assert (=> b!290054 (= e!183568 false)))

(declare-fun lt!143231 () SeekEntryResult!2086)

(declare-fun lt!143230 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14620 (_ BitVec 32)) SeekEntryResult!2086)

(assert (=> b!290054 (= lt!143231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143230 k!2524 (array!14621 (store (arr!6937 a!3312) i!1256 k!2524) (size!7289 a!3312)) mask!3809))))

(declare-fun lt!143233 () SeekEntryResult!2086)

(assert (=> b!290054 (= lt!143233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143230 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290054 (= lt!143230 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28306 res!151529) b!290053))

(assert (= (and b!290053 res!151532) b!290050))

(assert (= (and b!290050 res!151528) b!290051))

(assert (= (and b!290051 res!151531) b!290049))

(assert (= (and b!290049 res!151530) b!290052))

(assert (= (and b!290052 res!151533) b!290054))

(declare-fun m!304147 () Bool)

(assert (=> start!28306 m!304147))

(declare-fun m!304149 () Bool)

(assert (=> start!28306 m!304149))

(declare-fun m!304151 () Bool)

(assert (=> b!290054 m!304151))

(declare-fun m!304153 () Bool)

(assert (=> b!290054 m!304153))

(declare-fun m!304155 () Bool)

(assert (=> b!290054 m!304155))

(declare-fun m!304157 () Bool)

(assert (=> b!290054 m!304157))

(declare-fun m!304159 () Bool)

(assert (=> b!290052 m!304159))

(declare-fun m!304161 () Bool)

(assert (=> b!290050 m!304161))

(declare-fun m!304163 () Bool)

(assert (=> b!290051 m!304163))

(declare-fun m!304165 () Bool)

(assert (=> b!290049 m!304165))

(push 1)

(assert (not start!28306))

(assert (not b!290054))

(assert (not b!290050))

(assert (not b!290052))

