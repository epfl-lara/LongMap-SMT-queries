; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28240 () Bool)

(assert start!28240)

(declare-fun b!289380 () Bool)

(declare-fun res!150979 () Bool)

(declare-fun e!183209 () Bool)

(assert (=> b!289380 (=> (not res!150979) (not e!183209))))

(declare-datatypes ((array!14559 0))(
  ( (array!14560 (arr!6907 (Array (_ BitVec 32) (_ BitVec 64))) (size!7259 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14559)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14559 (_ BitVec 32)) Bool)

(assert (=> b!289380 (= res!150979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289381 () Bool)

(declare-fun e!183212 () Bool)

(declare-fun e!183211 () Bool)

(assert (=> b!289381 (= e!183212 e!183211)))

(declare-fun res!150984 () Bool)

(assert (=> b!289381 (=> (not res!150984) (not e!183211))))

(declare-fun lt!142813 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2021 0))(
  ( (MissingZero!2021 (index!10254 (_ BitVec 32))) (Found!2021 (index!10255 (_ BitVec 32))) (Intermediate!2021 (undefined!2833 Bool) (index!10256 (_ BitVec 32)) (x!28570 (_ BitVec 32))) (Undefined!2021) (MissingVacant!2021 (index!10257 (_ BitVec 32))) )
))
(declare-fun lt!142811 () SeekEntryResult!2021)

(assert (=> b!289381 (= res!150984 (and (or lt!142813 (not (undefined!2833 lt!142811))) (or lt!142813 (not (= (select (arr!6907 a!3312) (index!10256 lt!142811)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142813 (not (= (select (arr!6907 a!3312) (index!10256 lt!142811)) k0!2524))) (not lt!142813)))))

(get-info :version)

(assert (=> b!289381 (= lt!142813 (not ((_ is Intermediate!2021) lt!142811)))))

(declare-fun b!289382 () Bool)

(assert (=> b!289382 (= e!183211 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289382 (and (= (select (arr!6907 a!3312) (index!10256 lt!142811)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10256 lt!142811) i!1256))))

(declare-fun b!289383 () Bool)

(declare-fun res!150977 () Bool)

(declare-fun e!183210 () Bool)

(assert (=> b!289383 (=> (not res!150977) (not e!183210))))

(declare-fun arrayContainsKey!0 (array!14559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289383 (= res!150977 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289384 () Bool)

(declare-fun res!150982 () Bool)

(assert (=> b!289384 (=> (not res!150982) (not e!183210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289384 (= res!150982 (validKeyInArray!0 k0!2524))))

(declare-fun b!289385 () Bool)

(declare-fun res!150978 () Bool)

(assert (=> b!289385 (=> (not res!150978) (not e!183210))))

(assert (=> b!289385 (= res!150978 (and (= (size!7259 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7259 a!3312))))))

(declare-fun b!289386 () Bool)

(assert (=> b!289386 (= e!183210 e!183209)))

(declare-fun res!150981 () Bool)

(assert (=> b!289386 (=> (not res!150981) (not e!183209))))

(declare-fun lt!142814 () Bool)

(declare-fun lt!142810 () SeekEntryResult!2021)

(assert (=> b!289386 (= res!150981 (or lt!142814 (= lt!142810 (MissingVacant!2021 i!1256))))))

(assert (=> b!289386 (= lt!142814 (= lt!142810 (MissingZero!2021 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14559 (_ BitVec 32)) SeekEntryResult!2021)

(assert (=> b!289386 (= lt!142810 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289387 () Bool)

(assert (=> b!289387 (= e!183209 e!183212)))

(declare-fun res!150980 () Bool)

(assert (=> b!289387 (=> (not res!150980) (not e!183212))))

(assert (=> b!289387 (= res!150980 lt!142814)))

(declare-fun lt!142815 () (_ BitVec 32))

(declare-fun lt!142812 () SeekEntryResult!2021)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14559 (_ BitVec 32)) SeekEntryResult!2021)

(assert (=> b!289387 (= lt!142812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142815 k0!2524 (array!14560 (store (arr!6907 a!3312) i!1256 k0!2524) (size!7259 a!3312)) mask!3809))))

(assert (=> b!289387 (= lt!142811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142815 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289387 (= lt!142815 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!150983 () Bool)

(assert (=> start!28240 (=> (not res!150983) (not e!183210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28240 (= res!150983 (validMask!0 mask!3809))))

(assert (=> start!28240 e!183210))

(assert (=> start!28240 true))

(declare-fun array_inv!4857 (array!14559) Bool)

(assert (=> start!28240 (array_inv!4857 a!3312)))

(assert (= (and start!28240 res!150983) b!289385))

(assert (= (and b!289385 res!150978) b!289384))

(assert (= (and b!289384 res!150982) b!289383))

(assert (= (and b!289383 res!150977) b!289386))

(assert (= (and b!289386 res!150981) b!289380))

(assert (= (and b!289380 res!150979) b!289387))

(assert (= (and b!289387 res!150980) b!289381))

(assert (= (and b!289381 res!150984) b!289382))

(declare-fun m!303695 () Bool)

(assert (=> b!289383 m!303695))

(declare-fun m!303697 () Bool)

(assert (=> b!289387 m!303697))

(declare-fun m!303699 () Bool)

(assert (=> b!289387 m!303699))

(declare-fun m!303701 () Bool)

(assert (=> b!289387 m!303701))

(declare-fun m!303703 () Bool)

(assert (=> b!289387 m!303703))

(declare-fun m!303705 () Bool)

(assert (=> b!289381 m!303705))

(declare-fun m!303707 () Bool)

(assert (=> b!289386 m!303707))

(declare-fun m!303709 () Bool)

(assert (=> b!289384 m!303709))

(declare-fun m!303711 () Bool)

(assert (=> start!28240 m!303711))

(declare-fun m!303713 () Bool)

(assert (=> start!28240 m!303713))

(assert (=> b!289382 m!303705))

(declare-fun m!303715 () Bool)

(assert (=> b!289380 m!303715))

(check-sat (not b!289380) (not b!289387) (not b!289386) (not start!28240) (not b!289384) (not b!289383))
(check-sat)
