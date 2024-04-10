; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28588 () Bool)

(assert start!28588)

(declare-fun b!292297 () Bool)

(declare-fun e!184942 () Bool)

(declare-fun e!184946 () Bool)

(assert (=> b!292297 (= e!184942 e!184946)))

(declare-fun res!153355 () Bool)

(assert (=> b!292297 (=> (not res!153355) (not e!184946))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144736 () Bool)

(declare-datatypes ((SeekEntryResult!2155 0))(
  ( (MissingZero!2155 (index!10790 (_ BitVec 32))) (Found!2155 (index!10791 (_ BitVec 32))) (Intermediate!2155 (undefined!2967 Bool) (index!10792 (_ BitVec 32)) (x!28978 (_ BitVec 32))) (Undefined!2155) (MissingVacant!2155 (index!10793 (_ BitVec 32))) )
))
(declare-fun lt!144733 () SeekEntryResult!2155)

(assert (=> b!292297 (= res!153355 (or lt!144736 (= lt!144733 (MissingVacant!2155 i!1256))))))

(assert (=> b!292297 (= lt!144736 (= lt!144733 (MissingZero!2155 i!1256)))))

(declare-datatypes ((array!14767 0))(
  ( (array!14768 (arr!7006 (Array (_ BitVec 32) (_ BitVec 64))) (size!7358 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14767)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14767 (_ BitVec 32)) SeekEntryResult!2155)

(assert (=> b!292297 (= lt!144733 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292298 () Bool)

(declare-fun res!153359 () Bool)

(assert (=> b!292298 (=> (not res!153359) (not e!184942))))

(declare-fun arrayContainsKey!0 (array!14767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292298 (= res!153359 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292299 () Bool)

(declare-fun e!184944 () Bool)

(assert (=> b!292299 (= e!184944 (not true))))

(declare-datatypes ((Unit!9172 0))(
  ( (Unit!9173) )
))
(declare-fun lt!144732 () Unit!9172)

(declare-fun lt!144731 () (_ BitVec 32))

(declare-fun lt!144735 () SeekEntryResult!2155)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14767 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9172)

(assert (=> b!292299 (= lt!144732 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!144731 (index!10792 lt!144735) (x!28978 lt!144735) mask!3809))))

(assert (=> b!292299 (= (index!10792 lt!144735) i!1256)))

(declare-fun b!292300 () Bool)

(declare-fun res!153353 () Bool)

(assert (=> b!292300 (=> (not res!153353) (not e!184942))))

(assert (=> b!292300 (= res!153353 (and (= (size!7358 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7358 a!3312))))))

(declare-fun res!153360 () Bool)

(assert (=> start!28588 (=> (not res!153360) (not e!184942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28588 (= res!153360 (validMask!0 mask!3809))))

(assert (=> start!28588 e!184942))

(assert (=> start!28588 true))

(declare-fun array_inv!4969 (array!14767) Bool)

(assert (=> start!28588 (array_inv!4969 a!3312)))

(declare-fun b!292301 () Bool)

(declare-fun e!184943 () Bool)

(assert (=> b!292301 (= e!184943 e!184944)))

(declare-fun res!153354 () Bool)

(assert (=> b!292301 (=> (not res!153354) (not e!184944))))

(declare-fun lt!144734 () Bool)

(assert (=> b!292301 (= res!153354 (and (or lt!144734 (not (undefined!2967 lt!144735))) (not lt!144734) (= (select (arr!7006 a!3312) (index!10792 lt!144735)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292301 (= lt!144734 (not (is-Intermediate!2155 lt!144735)))))

(declare-fun b!292302 () Bool)

(declare-fun res!153356 () Bool)

(assert (=> b!292302 (=> (not res!153356) (not e!184946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14767 (_ BitVec 32)) Bool)

(assert (=> b!292302 (= res!153356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292303 () Bool)

(declare-fun res!153357 () Bool)

(assert (=> b!292303 (=> (not res!153357) (not e!184942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292303 (= res!153357 (validKeyInArray!0 k!2524))))

(declare-fun b!292304 () Bool)

(assert (=> b!292304 (= e!184946 e!184943)))

(declare-fun res!153358 () Bool)

(assert (=> b!292304 (=> (not res!153358) (not e!184943))))

(assert (=> b!292304 (= res!153358 (and (not lt!144736) (= lt!144733 (MissingVacant!2155 i!1256))))))

(declare-fun lt!144730 () SeekEntryResult!2155)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14767 (_ BitVec 32)) SeekEntryResult!2155)

(assert (=> b!292304 (= lt!144730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144731 k!2524 (array!14768 (store (arr!7006 a!3312) i!1256 k!2524) (size!7358 a!3312)) mask!3809))))

(assert (=> b!292304 (= lt!144735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144731 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292304 (= lt!144731 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28588 res!153360) b!292300))

(assert (= (and b!292300 res!153353) b!292303))

(assert (= (and b!292303 res!153357) b!292298))

(assert (= (and b!292298 res!153359) b!292297))

(assert (= (and b!292297 res!153355) b!292302))

(assert (= (and b!292302 res!153356) b!292304))

(assert (= (and b!292304 res!153358) b!292301))

(assert (= (and b!292301 res!153354) b!292299))

(declare-fun m!306021 () Bool)

(assert (=> b!292304 m!306021))

(declare-fun m!306023 () Bool)

(assert (=> b!292304 m!306023))

(declare-fun m!306025 () Bool)

(assert (=> b!292304 m!306025))

(declare-fun m!306027 () Bool)

(assert (=> b!292304 m!306027))

(declare-fun m!306029 () Bool)

(assert (=> b!292299 m!306029))

(declare-fun m!306031 () Bool)

(assert (=> b!292303 m!306031))

(declare-fun m!306033 () Bool)

(assert (=> b!292298 m!306033))

(declare-fun m!306035 () Bool)

(assert (=> b!292301 m!306035))

(declare-fun m!306037 () Bool)

(assert (=> start!28588 m!306037))

(declare-fun m!306039 () Bool)

(assert (=> start!28588 m!306039))

(declare-fun m!306041 () Bool)

(assert (=> b!292297 m!306041))

(declare-fun m!306043 () Bool)

(assert (=> b!292302 m!306043))

(push 1)

