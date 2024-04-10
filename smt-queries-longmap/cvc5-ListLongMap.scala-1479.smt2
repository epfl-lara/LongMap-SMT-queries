; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28260 () Bool)

(assert start!28260)

(declare-fun b!289510 () Bool)

(declare-datatypes ((Unit!9095 0))(
  ( (Unit!9096) )
))
(declare-fun e!183285 () Unit!9095)

(declare-fun Unit!9097 () Unit!9095)

(assert (=> b!289510 (= e!183285 Unit!9097)))

(assert (=> b!289510 false))

(declare-datatypes ((SeekEntryResult!2063 0))(
  ( (MissingZero!2063 (index!10422 (_ BitVec 32))) (Found!2063 (index!10423 (_ BitVec 32))) (Intermediate!2063 (undefined!2875 Bool) (index!10424 (_ BitVec 32)) (x!28628 (_ BitVec 32))) (Undefined!2063) (MissingVacant!2063 (index!10425 (_ BitVec 32))) )
))
(declare-fun lt!142871 () SeekEntryResult!2063)

(declare-datatypes ((array!14574 0))(
  ( (array!14575 (arr!6914 (Array (_ BitVec 32) (_ BitVec 64))) (size!7266 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14574)

(declare-fun lt!142872 () SeekEntryResult!2063)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun b!289511 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289511 (and (= lt!142871 lt!142872) (= (select (store (arr!6914 a!3312) i!1256 k!2524) (index!10424 lt!142872)) k!2524))))

(declare-fun lt!142875 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!142876 () Unit!9095)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14574 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9095)

(assert (=> b!289511 (= lt!142876 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!142875 (index!10424 lt!142872) (x!28628 lt!142872) mask!3809))))

(assert (=> b!289511 (and (= (select (arr!6914 a!3312) (index!10424 lt!142872)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10424 lt!142872) i!1256))))

(declare-fun e!183289 () Unit!9095)

(declare-fun Unit!9098 () Unit!9095)

(assert (=> b!289511 (= e!183289 Unit!9098)))

(declare-fun res!151093 () Bool)

(declare-fun e!183287 () Bool)

(assert (=> start!28260 (=> (not res!151093) (not e!183287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28260 (= res!151093 (validMask!0 mask!3809))))

(assert (=> start!28260 e!183287))

(assert (=> start!28260 true))

(declare-fun array_inv!4877 (array!14574) Bool)

(assert (=> start!28260 (array_inv!4877 a!3312)))

(declare-fun b!289512 () Bool)

(assert (=> b!289512 (= e!183285 e!183289)))

(declare-fun c!46773 () Bool)

(assert (=> b!289512 (= c!46773 (is-Intermediate!2063 lt!142872))))

(declare-fun b!289513 () Bool)

(declare-fun res!151089 () Bool)

(assert (=> b!289513 (=> (not res!151089) (not e!183287))))

(assert (=> b!289513 (= res!151089 (and (= (size!7266 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7266 a!3312))))))

(declare-fun b!289514 () Bool)

(assert (=> b!289514 false))

(declare-fun Unit!9099 () Unit!9095)

(assert (=> b!289514 (= e!183289 Unit!9099)))

(declare-fun b!289515 () Bool)

(declare-fun res!151091 () Bool)

(assert (=> b!289515 (=> (not res!151091) (not e!183287))))

(declare-fun arrayContainsKey!0 (array!14574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289515 (= res!151091 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289516 () Bool)

(declare-fun res!151094 () Bool)

(declare-fun e!183290 () Bool)

(assert (=> b!289516 (=> (not res!151094) (not e!183290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14574 (_ BitVec 32)) Bool)

(assert (=> b!289516 (= res!151094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289517 () Bool)

(declare-fun e!183288 () Bool)

(assert (=> b!289517 (= e!183288 (and (= lt!142871 lt!142872) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun lt!142873 () Unit!9095)

(assert (=> b!289517 (= lt!142873 e!183285)))

(declare-fun c!46772 () Bool)

(assert (=> b!289517 (= c!46772 (or (and (is-Intermediate!2063 lt!142872) (undefined!2875 lt!142872)) (and (is-Intermediate!2063 lt!142872) (= (select (arr!6914 a!3312) (index!10424 lt!142872)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2063 lt!142872) (= (select (arr!6914 a!3312) (index!10424 lt!142872)) k!2524))))))

(declare-fun b!289518 () Bool)

(assert (=> b!289518 (= e!183290 e!183288)))

(declare-fun res!151090 () Bool)

(assert (=> b!289518 (=> (not res!151090) (not e!183288))))

(declare-fun lt!142870 () Bool)

(assert (=> b!289518 (= res!151090 lt!142870)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14574 (_ BitVec 32)) SeekEntryResult!2063)

(assert (=> b!289518 (= lt!142871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142875 k!2524 (array!14575 (store (arr!6914 a!3312) i!1256 k!2524) (size!7266 a!3312)) mask!3809))))

(assert (=> b!289518 (= lt!142872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142875 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289518 (= lt!142875 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289519 () Bool)

(declare-fun res!151092 () Bool)

(assert (=> b!289519 (=> (not res!151092) (not e!183287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289519 (= res!151092 (validKeyInArray!0 k!2524))))

(declare-fun b!289520 () Bool)

(assert (=> b!289520 (= e!183287 e!183290)))

(declare-fun res!151095 () Bool)

(assert (=> b!289520 (=> (not res!151095) (not e!183290))))

(declare-fun lt!142874 () SeekEntryResult!2063)

(assert (=> b!289520 (= res!151095 (or lt!142870 (= lt!142874 (MissingVacant!2063 i!1256))))))

(assert (=> b!289520 (= lt!142870 (= lt!142874 (MissingZero!2063 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14574 (_ BitVec 32)) SeekEntryResult!2063)

(assert (=> b!289520 (= lt!142874 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28260 res!151093) b!289513))

(assert (= (and b!289513 res!151089) b!289519))

(assert (= (and b!289519 res!151092) b!289515))

(assert (= (and b!289515 res!151091) b!289520))

(assert (= (and b!289520 res!151095) b!289516))

(assert (= (and b!289516 res!151094) b!289518))

(assert (= (and b!289518 res!151090) b!289517))

(assert (= (and b!289517 c!46772) b!289510))

(assert (= (and b!289517 (not c!46772)) b!289512))

(assert (= (and b!289512 c!46773) b!289511))

(assert (= (and b!289512 (not c!46773)) b!289514))

(declare-fun m!303633 () Bool)

(assert (=> start!28260 m!303633))

(declare-fun m!303635 () Bool)

(assert (=> start!28260 m!303635))

(declare-fun m!303637 () Bool)

(assert (=> b!289511 m!303637))

(declare-fun m!303639 () Bool)

(assert (=> b!289511 m!303639))

(declare-fun m!303641 () Bool)

(assert (=> b!289511 m!303641))

(declare-fun m!303643 () Bool)

(assert (=> b!289511 m!303643))

(declare-fun m!303645 () Bool)

(assert (=> b!289519 m!303645))

(declare-fun m!303647 () Bool)

(assert (=> b!289515 m!303647))

(declare-fun m!303649 () Bool)

(assert (=> b!289516 m!303649))

(assert (=> b!289518 m!303637))

(declare-fun m!303651 () Bool)

(assert (=> b!289518 m!303651))

(declare-fun m!303653 () Bool)

(assert (=> b!289518 m!303653))

(declare-fun m!303655 () Bool)

(assert (=> b!289518 m!303655))

(declare-fun m!303657 () Bool)

(assert (=> b!289520 m!303657))

(assert (=> b!289517 m!303643))

(push 1)

