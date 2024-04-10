; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28660 () Bool)

(assert start!28660)

(declare-fun b!292966 () Bool)

(declare-fun res!154023 () Bool)

(declare-fun e!185288 () Bool)

(assert (=> b!292966 (=> (not res!154023) (not e!185288))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14839 0))(
  ( (array!14840 (arr!7042 (Array (_ BitVec 32) (_ BitVec 64))) (size!7394 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14839)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292966 (= res!154023 (and (= (size!7394 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7394 a!3312))))))

(declare-fun b!292967 () Bool)

(declare-fun e!185286 () Bool)

(assert (=> b!292967 (= e!185286 false)))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lt!145194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2191 0))(
  ( (MissingZero!2191 (index!10934 (_ BitVec 32))) (Found!2191 (index!10935 (_ BitVec 32))) (Intermediate!2191 (undefined!3003 Bool) (index!10936 (_ BitVec 32)) (x!29110 (_ BitVec 32))) (Undefined!2191) (MissingVacant!2191 (index!10937 (_ BitVec 32))) )
))
(declare-fun lt!145195 () SeekEntryResult!2191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14839 (_ BitVec 32)) SeekEntryResult!2191)

(assert (=> b!292967 (= lt!145195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145194 k!2524 (array!14840 (store (arr!7042 a!3312) i!1256 k!2524) (size!7394 a!3312)) mask!3809))))

(declare-fun lt!145193 () SeekEntryResult!2191)

(assert (=> b!292967 (= lt!145193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145194 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292967 (= lt!145194 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292968 () Bool)

(declare-fun res!154022 () Bool)

(assert (=> b!292968 (=> (not res!154022) (not e!185286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14839 (_ BitVec 32)) Bool)

(assert (=> b!292968 (= res!154022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292969 () Bool)

(declare-fun res!154026 () Bool)

(assert (=> b!292969 (=> (not res!154026) (not e!185288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292969 (= res!154026 (validKeyInArray!0 k!2524))))

(declare-fun b!292970 () Bool)

(assert (=> b!292970 (= e!185288 e!185286)))

(declare-fun res!154024 () Bool)

(assert (=> b!292970 (=> (not res!154024) (not e!185286))))

(declare-fun lt!145192 () SeekEntryResult!2191)

(assert (=> b!292970 (= res!154024 (or (= lt!145192 (MissingZero!2191 i!1256)) (= lt!145192 (MissingVacant!2191 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14839 (_ BitVec 32)) SeekEntryResult!2191)

(assert (=> b!292970 (= lt!145192 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292965 () Bool)

(declare-fun res!154025 () Bool)

(assert (=> b!292965 (=> (not res!154025) (not e!185288))))

(declare-fun arrayContainsKey!0 (array!14839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292965 (= res!154025 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154021 () Bool)

(assert (=> start!28660 (=> (not res!154021) (not e!185288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28660 (= res!154021 (validMask!0 mask!3809))))

(assert (=> start!28660 e!185288))

(assert (=> start!28660 true))

(declare-fun array_inv!5005 (array!14839) Bool)

(assert (=> start!28660 (array_inv!5005 a!3312)))

(assert (= (and start!28660 res!154021) b!292966))

(assert (= (and b!292966 res!154023) b!292969))

(assert (= (and b!292969 res!154026) b!292965))

(assert (= (and b!292965 res!154025) b!292970))

(assert (= (and b!292970 res!154024) b!292968))

(assert (= (and b!292968 res!154022) b!292967))

(declare-fun m!306757 () Bool)

(assert (=> b!292969 m!306757))

(declare-fun m!306759 () Bool)

(assert (=> b!292968 m!306759))

(declare-fun m!306761 () Bool)

(assert (=> b!292967 m!306761))

(declare-fun m!306763 () Bool)

(assert (=> b!292967 m!306763))

(declare-fun m!306765 () Bool)

(assert (=> b!292967 m!306765))

(declare-fun m!306767 () Bool)

(assert (=> b!292967 m!306767))

(declare-fun m!306769 () Bool)

(assert (=> b!292970 m!306769))

(declare-fun m!306771 () Bool)

(assert (=> start!28660 m!306771))

(declare-fun m!306773 () Bool)

(assert (=> start!28660 m!306773))

(declare-fun m!306775 () Bool)

(assert (=> b!292965 m!306775))

(push 1)

(assert (not b!292968))

(assert (not start!28660))

(assert (not b!292969))

(assert (not b!292967))

(assert (not b!292970))

(assert (not b!292965))

(check-sat)

