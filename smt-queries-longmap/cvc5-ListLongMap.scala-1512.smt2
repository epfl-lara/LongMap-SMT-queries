; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28602 () Bool)

(assert start!28602)

(declare-fun b!292444 () Bool)

(declare-fun res!153504 () Bool)

(declare-fun e!185025 () Bool)

(assert (=> b!292444 (=> (not res!153504) (not e!185025))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292444 (= res!153504 (validKeyInArray!0 k!2524))))

(declare-fun b!292445 () Bool)

(declare-fun res!153503 () Bool)

(declare-fun e!185027 () Bool)

(assert (=> b!292445 (=> (not res!153503) (not e!185027))))

(declare-datatypes ((array!14781 0))(
  ( (array!14782 (arr!7013 (Array (_ BitVec 32) (_ BitVec 64))) (size!7365 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14781)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14781 (_ BitVec 32)) Bool)

(assert (=> b!292445 (= res!153503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292446 () Bool)

(declare-fun res!153499 () Bool)

(assert (=> b!292446 (=> (not res!153499) (not e!185025))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292446 (= res!153499 (and (= (size!7365 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7365 a!3312))))))

(declare-fun b!292447 () Bool)

(assert (=> b!292447 (= e!185027 false)))

(declare-fun lt!144844 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2162 0))(
  ( (MissingZero!2162 (index!10818 (_ BitVec 32))) (Found!2162 (index!10819 (_ BitVec 32))) (Intermediate!2162 (undefined!2974 Bool) (index!10820 (_ BitVec 32)) (x!29009 (_ BitVec 32))) (Undefined!2162) (MissingVacant!2162 (index!10821 (_ BitVec 32))) )
))
(declare-fun lt!144846 () SeekEntryResult!2162)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14781 (_ BitVec 32)) SeekEntryResult!2162)

(assert (=> b!292447 (= lt!144846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144844 k!2524 (array!14782 (store (arr!7013 a!3312) i!1256 k!2524) (size!7365 a!3312)) mask!3809))))

(declare-fun lt!144847 () SeekEntryResult!2162)

(assert (=> b!292447 (= lt!144847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144844 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292447 (= lt!144844 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292448 () Bool)

(assert (=> b!292448 (= e!185025 e!185027)))

(declare-fun res!153501 () Bool)

(assert (=> b!292448 (=> (not res!153501) (not e!185027))))

(declare-fun lt!144845 () SeekEntryResult!2162)

(assert (=> b!292448 (= res!153501 (or (= lt!144845 (MissingZero!2162 i!1256)) (= lt!144845 (MissingVacant!2162 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14781 (_ BitVec 32)) SeekEntryResult!2162)

(assert (=> b!292448 (= lt!144845 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292443 () Bool)

(declare-fun res!153500 () Bool)

(assert (=> b!292443 (=> (not res!153500) (not e!185025))))

(declare-fun arrayContainsKey!0 (array!14781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292443 (= res!153500 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153502 () Bool)

(assert (=> start!28602 (=> (not res!153502) (not e!185025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28602 (= res!153502 (validMask!0 mask!3809))))

(assert (=> start!28602 e!185025))

(assert (=> start!28602 true))

(declare-fun array_inv!4976 (array!14781) Bool)

(assert (=> start!28602 (array_inv!4976 a!3312)))

(assert (= (and start!28602 res!153502) b!292446))

(assert (= (and b!292446 res!153499) b!292444))

(assert (= (and b!292444 res!153504) b!292443))

(assert (= (and b!292443 res!153500) b!292448))

(assert (= (and b!292448 res!153501) b!292445))

(assert (= (and b!292445 res!153503) b!292447))

(declare-fun m!306177 () Bool)

(assert (=> b!292447 m!306177))

(declare-fun m!306179 () Bool)

(assert (=> b!292447 m!306179))

(declare-fun m!306181 () Bool)

(assert (=> b!292447 m!306181))

(declare-fun m!306183 () Bool)

(assert (=> b!292447 m!306183))

(declare-fun m!306185 () Bool)

(assert (=> b!292445 m!306185))

(declare-fun m!306187 () Bool)

(assert (=> b!292448 m!306187))

(declare-fun m!306189 () Bool)

(assert (=> start!28602 m!306189))

(declare-fun m!306191 () Bool)

(assert (=> start!28602 m!306191))

(declare-fun m!306193 () Bool)

(assert (=> b!292444 m!306193))

(declare-fun m!306195 () Bool)

(assert (=> b!292443 m!306195))

(push 1)

