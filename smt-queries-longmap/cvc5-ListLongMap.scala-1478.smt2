; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28254 () Bool)

(assert start!28254)

(declare-fun b!289411 () Bool)

(declare-fun e!183231 () Bool)

(declare-fun e!183235 () Bool)

(assert (=> b!289411 (= e!183231 e!183235)))

(declare-fun res!151031 () Bool)

(assert (=> b!289411 (=> (not res!151031) (not e!183235))))

(declare-fun lt!142811 () Bool)

(assert (=> b!289411 (= res!151031 lt!142811)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2060 0))(
  ( (MissingZero!2060 (index!10410 (_ BitVec 32))) (Found!2060 (index!10411 (_ BitVec 32))) (Intermediate!2060 (undefined!2872 Bool) (index!10412 (_ BitVec 32)) (x!28617 (_ BitVec 32))) (Undefined!2060) (MissingVacant!2060 (index!10413 (_ BitVec 32))) )
))
(declare-fun lt!142813 () SeekEntryResult!2060)

(declare-datatypes ((array!14568 0))(
  ( (array!14569 (arr!6911 (Array (_ BitVec 32) (_ BitVec 64))) (size!7263 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14568)

(declare-fun lt!142807 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14568 (_ BitVec 32)) SeekEntryResult!2060)

(assert (=> b!289411 (= lt!142813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142807 k!2524 (array!14569 (store (arr!6911 a!3312) i!1256 k!2524) (size!7263 a!3312)) mask!3809))))

(declare-fun lt!142812 () SeekEntryResult!2060)

(assert (=> b!289411 (= lt!142812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142807 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289411 (= lt!142807 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289412 () Bool)

(declare-fun res!151028 () Bool)

(declare-fun e!183234 () Bool)

(assert (=> b!289412 (=> (not res!151028) (not e!183234))))

(declare-fun arrayContainsKey!0 (array!14568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289412 (= res!151028 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151026 () Bool)

(assert (=> start!28254 (=> (not res!151026) (not e!183234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28254 (= res!151026 (validMask!0 mask!3809))))

(assert (=> start!28254 e!183234))

(assert (=> start!28254 true))

(declare-fun array_inv!4874 (array!14568) Bool)

(assert (=> start!28254 (array_inv!4874 a!3312)))

(declare-fun b!289413 () Bool)

(declare-fun res!151029 () Bool)

(assert (=> b!289413 (=> (not res!151029) (not e!183234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289413 (= res!151029 (validKeyInArray!0 k!2524))))

(declare-fun b!289414 () Bool)

(assert (=> b!289414 false))

(declare-datatypes ((Unit!9080 0))(
  ( (Unit!9081) )
))
(declare-fun e!183232 () Unit!9080)

(declare-fun Unit!9082 () Unit!9080)

(assert (=> b!289414 (= e!183232 Unit!9082)))

(declare-fun b!289415 () Bool)

(declare-fun res!151027 () Bool)

(assert (=> b!289415 (=> (not res!151027) (not e!183234))))

(assert (=> b!289415 (= res!151027 (and (= (size!7263 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7263 a!3312))))))

(declare-fun b!289416 () Bool)

(declare-fun e!183236 () Unit!9080)

(assert (=> b!289416 (= e!183236 e!183232)))

(declare-fun c!46755 () Bool)

(assert (=> b!289416 (= c!46755 (is-Intermediate!2060 lt!142812))))

(declare-fun b!289417 () Bool)

(declare-fun res!151032 () Bool)

(assert (=> b!289417 (=> (not res!151032) (not e!183231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14568 (_ BitVec 32)) Bool)

(assert (=> b!289417 (= res!151032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289418 () Bool)

(assert (=> b!289418 (= e!183234 e!183231)))

(declare-fun res!151030 () Bool)

(assert (=> b!289418 (=> (not res!151030) (not e!183231))))

(declare-fun lt!142808 () SeekEntryResult!2060)

(assert (=> b!289418 (= res!151030 (or lt!142811 (= lt!142808 (MissingVacant!2060 i!1256))))))

(assert (=> b!289418 (= lt!142811 (= lt!142808 (MissingZero!2060 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14568 (_ BitVec 32)) SeekEntryResult!2060)

(assert (=> b!289418 (= lt!142808 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289419 () Bool)

(assert (=> b!289419 (= e!183235 false)))

(declare-fun lt!142809 () Unit!9080)

(assert (=> b!289419 (= lt!142809 e!183236)))

(declare-fun c!46754 () Bool)

(assert (=> b!289419 (= c!46754 (or (and (is-Intermediate!2060 lt!142812) (undefined!2872 lt!142812)) (and (is-Intermediate!2060 lt!142812) (= (select (arr!6911 a!3312) (index!10412 lt!142812)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2060 lt!142812) (= (select (arr!6911 a!3312) (index!10412 lt!142812)) k!2524))))))

(declare-fun b!289420 () Bool)

(assert (=> b!289420 (and (= lt!142813 lt!142812) (= (select (store (arr!6911 a!3312) i!1256 k!2524) (index!10412 lt!142812)) k!2524))))

(declare-fun lt!142810 () Unit!9080)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14568 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9080)

(assert (=> b!289420 (= lt!142810 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!142807 (index!10412 lt!142812) (x!28617 lt!142812) mask!3809))))

(assert (=> b!289420 (and (= (select (arr!6911 a!3312) (index!10412 lt!142812)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10412 lt!142812) i!1256))))

(declare-fun Unit!9083 () Unit!9080)

(assert (=> b!289420 (= e!183232 Unit!9083)))

(declare-fun b!289421 () Bool)

(declare-fun Unit!9084 () Unit!9080)

(assert (=> b!289421 (= e!183236 Unit!9084)))

(assert (=> b!289421 false))

(assert (= (and start!28254 res!151026) b!289415))

(assert (= (and b!289415 res!151027) b!289413))

(assert (= (and b!289413 res!151029) b!289412))

(assert (= (and b!289412 res!151028) b!289418))

(assert (= (and b!289418 res!151030) b!289417))

(assert (= (and b!289417 res!151032) b!289411))

(assert (= (and b!289411 res!151031) b!289419))

(assert (= (and b!289419 c!46754) b!289421))

(assert (= (and b!289419 (not c!46754)) b!289416))

(assert (= (and b!289416 c!46755) b!289420))

(assert (= (and b!289416 (not c!46755)) b!289414))

(declare-fun m!303555 () Bool)

(assert (=> b!289419 m!303555))

(declare-fun m!303557 () Bool)

(assert (=> b!289413 m!303557))

(declare-fun m!303559 () Bool)

(assert (=> b!289417 m!303559))

(declare-fun m!303561 () Bool)

(assert (=> b!289418 m!303561))

(declare-fun m!303563 () Bool)

(assert (=> start!28254 m!303563))

(declare-fun m!303565 () Bool)

(assert (=> start!28254 m!303565))

(declare-fun m!303567 () Bool)

(assert (=> b!289411 m!303567))

(declare-fun m!303569 () Bool)

(assert (=> b!289411 m!303569))

(declare-fun m!303571 () Bool)

(assert (=> b!289411 m!303571))

(declare-fun m!303573 () Bool)

(assert (=> b!289411 m!303573))

(assert (=> b!289420 m!303567))

(declare-fun m!303575 () Bool)

(assert (=> b!289420 m!303575))

(declare-fun m!303577 () Bool)

(assert (=> b!289420 m!303577))

(assert (=> b!289420 m!303555))

(declare-fun m!303579 () Bool)

(assert (=> b!289412 m!303579))

(push 1)

