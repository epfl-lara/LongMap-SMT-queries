; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28582 () Bool)

(assert start!28582)

(declare-fun b!292225 () Bool)

(declare-fun res!153282 () Bool)

(declare-fun e!184901 () Bool)

(assert (=> b!292225 (=> (not res!153282) (not e!184901))))

(declare-datatypes ((array!14761 0))(
  ( (array!14762 (arr!7003 (Array (_ BitVec 32) (_ BitVec 64))) (size!7355 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14761)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14761 (_ BitVec 32)) Bool)

(assert (=> b!292225 (= res!153282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153284 () Bool)

(declare-fun e!184900 () Bool)

(assert (=> start!28582 (=> (not res!153284) (not e!184900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28582 (= res!153284 (validMask!0 mask!3809))))

(assert (=> start!28582 e!184900))

(assert (=> start!28582 true))

(declare-fun array_inv!4966 (array!14761) Bool)

(assert (=> start!28582 (array_inv!4966 a!3312)))

(declare-fun b!292226 () Bool)

(declare-fun e!184899 () Bool)

(declare-fun e!184897 () Bool)

(assert (=> b!292226 (= e!184899 e!184897)))

(declare-fun res!153285 () Bool)

(assert (=> b!292226 (=> (not res!153285) (not e!184897))))

(declare-datatypes ((SeekEntryResult!2152 0))(
  ( (MissingZero!2152 (index!10778 (_ BitVec 32))) (Found!2152 (index!10779 (_ BitVec 32))) (Intermediate!2152 (undefined!2964 Bool) (index!10780 (_ BitVec 32)) (x!28967 (_ BitVec 32))) (Undefined!2152) (MissingVacant!2152 (index!10781 (_ BitVec 32))) )
))
(declare-fun lt!144671 () SeekEntryResult!2152)

(declare-fun lt!144670 () Bool)

(assert (=> b!292226 (= res!153285 (and (or lt!144670 (not (undefined!2964 lt!144671))) (not lt!144670) (= (select (arr!7003 a!3312) (index!10780 lt!144671)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292226 (= lt!144670 (not (is-Intermediate!2152 lt!144671)))))

(declare-fun b!292227 () Bool)

(assert (=> b!292227 (= e!184900 e!184901)))

(declare-fun res!153286 () Bool)

(assert (=> b!292227 (=> (not res!153286) (not e!184901))))

(declare-fun lt!144667 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144673 () SeekEntryResult!2152)

(assert (=> b!292227 (= res!153286 (or lt!144667 (= lt!144673 (MissingVacant!2152 i!1256))))))

(assert (=> b!292227 (= lt!144667 (= lt!144673 (MissingZero!2152 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14761 (_ BitVec 32)) SeekEntryResult!2152)

(assert (=> b!292227 (= lt!144673 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292228 () Bool)

(declare-fun res!153281 () Bool)

(assert (=> b!292228 (=> (not res!153281) (not e!184900))))

(assert (=> b!292228 (= res!153281 (and (= (size!7355 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7355 a!3312))))))

(declare-fun b!292229 () Bool)

(declare-fun res!153287 () Bool)

(assert (=> b!292229 (=> (not res!153287) (not e!184900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292229 (= res!153287 (validKeyInArray!0 k!2524))))

(declare-fun b!292230 () Bool)

(assert (=> b!292230 (= e!184897 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!9166 0))(
  ( (Unit!9167) )
))
(declare-fun lt!144669 () Unit!9166)

(declare-fun lt!144668 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9166)

(assert (=> b!292230 (= lt!144669 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!144668 (index!10780 lt!144671) (x!28967 lt!144671) mask!3809))))

(assert (=> b!292230 (= (index!10780 lt!144671) i!1256)))

(declare-fun b!292231 () Bool)

(declare-fun res!153283 () Bool)

(assert (=> b!292231 (=> (not res!153283) (not e!184900))))

(declare-fun arrayContainsKey!0 (array!14761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292231 (= res!153283 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292232 () Bool)

(assert (=> b!292232 (= e!184901 e!184899)))

(declare-fun res!153288 () Bool)

(assert (=> b!292232 (=> (not res!153288) (not e!184899))))

(assert (=> b!292232 (= res!153288 (and (not lt!144667) (= lt!144673 (MissingVacant!2152 i!1256))))))

(declare-fun lt!144672 () SeekEntryResult!2152)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14761 (_ BitVec 32)) SeekEntryResult!2152)

(assert (=> b!292232 (= lt!144672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144668 k!2524 (array!14762 (store (arr!7003 a!3312) i!1256 k!2524) (size!7355 a!3312)) mask!3809))))

(assert (=> b!292232 (= lt!144671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144668 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292232 (= lt!144668 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28582 res!153284) b!292228))

(assert (= (and b!292228 res!153281) b!292229))

(assert (= (and b!292229 res!153287) b!292231))

(assert (= (and b!292231 res!153283) b!292227))

(assert (= (and b!292227 res!153286) b!292225))

(assert (= (and b!292225 res!153282) b!292232))

(assert (= (and b!292232 res!153288) b!292226))

(assert (= (and b!292226 res!153285) b!292230))

(declare-fun m!305949 () Bool)

(assert (=> b!292232 m!305949))

(declare-fun m!305951 () Bool)

(assert (=> b!292232 m!305951))

(declare-fun m!305953 () Bool)

(assert (=> b!292232 m!305953))

(declare-fun m!305955 () Bool)

(assert (=> b!292232 m!305955))

(declare-fun m!305957 () Bool)

(assert (=> b!292230 m!305957))

(declare-fun m!305959 () Bool)

(assert (=> b!292227 m!305959))

(declare-fun m!305961 () Bool)

(assert (=> b!292231 m!305961))

(declare-fun m!305963 () Bool)

(assert (=> b!292225 m!305963))

(declare-fun m!305965 () Bool)

(assert (=> b!292226 m!305965))

(declare-fun m!305967 () Bool)

(assert (=> b!292229 m!305967))

(declare-fun m!305969 () Bool)

(assert (=> start!28582 m!305969))

(declare-fun m!305971 () Bool)

(assert (=> start!28582 m!305971))

(push 1)

