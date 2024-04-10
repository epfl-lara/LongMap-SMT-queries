; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28216 () Bool)

(assert start!28216)

(declare-fun b!288949 () Bool)

(declare-fun e!182945 () Bool)

(declare-fun e!182948 () Bool)

(assert (=> b!288949 (= e!182945 e!182948)))

(declare-fun res!150574 () Bool)

(assert (=> b!288949 (=> (not res!150574) (not e!182948))))

(declare-fun lt!142468 () Bool)

(assert (=> b!288949 (= res!150574 lt!142468)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142465 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2041 0))(
  ( (MissingZero!2041 (index!10334 (_ BitVec 32))) (Found!2041 (index!10335 (_ BitVec 32))) (Intermediate!2041 (undefined!2853 Bool) (index!10336 (_ BitVec 32)) (x!28542 (_ BitVec 32))) (Undefined!2041) (MissingVacant!2041 (index!10337 (_ BitVec 32))) )
))
(declare-fun lt!142466 () SeekEntryResult!2041)

(declare-datatypes ((array!14530 0))(
  ( (array!14531 (arr!6892 (Array (_ BitVec 32) (_ BitVec 64))) (size!7244 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14530)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14530 (_ BitVec 32)) SeekEntryResult!2041)

(assert (=> b!288949 (= lt!142466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142465 k!2524 (array!14531 (store (arr!6892 a!3312) i!1256 k!2524) (size!7244 a!3312)) mask!3809))))

(declare-fun lt!142464 () SeekEntryResult!2041)

(assert (=> b!288949 (= lt!142464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142465 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288949 (= lt!142465 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288950 () Bool)

(declare-fun res!150573 () Bool)

(declare-fun e!182944 () Bool)

(assert (=> b!288950 (=> (not res!150573) (not e!182944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288950 (= res!150573 (validKeyInArray!0 k!2524))))

(declare-fun b!288951 () Bool)

(declare-fun res!150577 () Bool)

(assert (=> b!288951 (=> (not res!150577) (not e!182944))))

(declare-fun arrayContainsKey!0 (array!14530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288951 (= res!150577 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288952 () Bool)

(declare-fun res!150572 () Bool)

(assert (=> b!288952 (=> (not res!150572) (not e!182944))))

(assert (=> b!288952 (= res!150572 (and (= (size!7244 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7244 a!3312))))))

(declare-fun b!288953 () Bool)

(declare-fun res!150579 () Bool)

(assert (=> b!288953 (=> (not res!150579) (not e!182945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14530 (_ BitVec 32)) Bool)

(assert (=> b!288953 (= res!150579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288954 () Bool)

(declare-fun e!182947 () Bool)

(assert (=> b!288954 (= e!182947 (not true))))

(assert (=> b!288954 (and (= (select (arr!6892 a!3312) (index!10336 lt!142464)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10336 lt!142464) i!1256))))

(declare-fun res!150578 () Bool)

(assert (=> start!28216 (=> (not res!150578) (not e!182944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28216 (= res!150578 (validMask!0 mask!3809))))

(assert (=> start!28216 e!182944))

(assert (=> start!28216 true))

(declare-fun array_inv!4855 (array!14530) Bool)

(assert (=> start!28216 (array_inv!4855 a!3312)))

(declare-fun b!288955 () Bool)

(assert (=> b!288955 (= e!182944 e!182945)))

(declare-fun res!150576 () Bool)

(assert (=> b!288955 (=> (not res!150576) (not e!182945))))

(declare-fun lt!142467 () SeekEntryResult!2041)

(assert (=> b!288955 (= res!150576 (or lt!142468 (= lt!142467 (MissingVacant!2041 i!1256))))))

(assert (=> b!288955 (= lt!142468 (= lt!142467 (MissingZero!2041 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14530 (_ BitVec 32)) SeekEntryResult!2041)

(assert (=> b!288955 (= lt!142467 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288956 () Bool)

(assert (=> b!288956 (= e!182948 e!182947)))

(declare-fun res!150575 () Bool)

(assert (=> b!288956 (=> (not res!150575) (not e!182947))))

(declare-fun lt!142463 () Bool)

(assert (=> b!288956 (= res!150575 (and (or lt!142463 (not (undefined!2853 lt!142464))) (or lt!142463 (not (= (select (arr!6892 a!3312) (index!10336 lt!142464)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142463 (not (= (select (arr!6892 a!3312) (index!10336 lt!142464)) k!2524))) (not lt!142463)))))

(assert (=> b!288956 (= lt!142463 (not (is-Intermediate!2041 lt!142464)))))

(assert (= (and start!28216 res!150578) b!288952))

(assert (= (and b!288952 res!150572) b!288950))

(assert (= (and b!288950 res!150573) b!288951))

(assert (= (and b!288951 res!150577) b!288955))

(assert (= (and b!288955 res!150576) b!288953))

(assert (= (and b!288953 res!150579) b!288949))

(assert (= (and b!288949 res!150574) b!288956))

(assert (= (and b!288956 res!150575) b!288954))

(declare-fun m!303137 () Bool)

(assert (=> b!288949 m!303137))

(declare-fun m!303139 () Bool)

(assert (=> b!288949 m!303139))

(declare-fun m!303141 () Bool)

(assert (=> b!288949 m!303141))

(declare-fun m!303143 () Bool)

(assert (=> b!288949 m!303143))

(declare-fun m!303145 () Bool)

(assert (=> b!288953 m!303145))

(declare-fun m!303147 () Bool)

(assert (=> b!288950 m!303147))

(declare-fun m!303149 () Bool)

(assert (=> b!288951 m!303149))

(declare-fun m!303151 () Bool)

(assert (=> b!288954 m!303151))

(declare-fun m!303153 () Bool)

(assert (=> b!288955 m!303153))

(assert (=> b!288956 m!303151))

(declare-fun m!303155 () Bool)

(assert (=> start!28216 m!303155))

(declare-fun m!303157 () Bool)

(assert (=> start!28216 m!303157))

(push 1)

