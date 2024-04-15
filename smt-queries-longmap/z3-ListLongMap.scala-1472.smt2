; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28214 () Bool)

(assert start!28214)

(declare-fun b!288826 () Bool)

(declare-fun e!182860 () Bool)

(declare-fun e!182862 () Bool)

(assert (=> b!288826 (= e!182860 e!182862)))

(declare-fun res!150505 () Bool)

(assert (=> b!288826 (=> (not res!150505) (not e!182862))))

(declare-fun lt!142300 () Bool)

(declare-datatypes ((array!14521 0))(
  ( (array!14522 (arr!6888 (Array (_ BitVec 32) (_ BitVec 64))) (size!7241 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14521)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2036 0))(
  ( (MissingZero!2036 (index!10314 (_ BitVec 32))) (Found!2036 (index!10315 (_ BitVec 32))) (Intermediate!2036 (undefined!2848 Bool) (index!10316 (_ BitVec 32)) (x!28544 (_ BitVec 32))) (Undefined!2036) (MissingVacant!2036 (index!10317 (_ BitVec 32))) )
))
(declare-fun lt!142303 () SeekEntryResult!2036)

(assert (=> b!288826 (= res!150505 (and (or lt!142300 (not (undefined!2848 lt!142303))) (or lt!142300 (not (= (select (arr!6888 a!3312) (index!10316 lt!142303)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142300 (not (= (select (arr!6888 a!3312) (index!10316 lt!142303)) k0!2524))) (not lt!142300)))))

(get-info :version)

(assert (=> b!288826 (= lt!142300 (not ((_ is Intermediate!2036) lt!142303)))))

(declare-fun b!288827 () Bool)

(declare-fun res!150501 () Bool)

(declare-fun e!182858 () Bool)

(assert (=> b!288827 (=> (not res!150501) (not e!182858))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!288827 (= res!150501 (and (= (size!7241 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7241 a!3312))))))

(declare-fun b!288828 () Bool)

(declare-fun res!150507 () Bool)

(assert (=> b!288828 (=> (not res!150507) (not e!182858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288828 (= res!150507 (validKeyInArray!0 k0!2524))))

(declare-fun b!288829 () Bool)

(declare-fun res!150508 () Bool)

(declare-fun e!182861 () Bool)

(assert (=> b!288829 (=> (not res!150508) (not e!182861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14521 (_ BitVec 32)) Bool)

(assert (=> b!288829 (= res!150508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288830 () Bool)

(assert (=> b!288830 (= e!182858 e!182861)))

(declare-fun res!150504 () Bool)

(assert (=> b!288830 (=> (not res!150504) (not e!182861))))

(declare-fun lt!142304 () Bool)

(declare-fun lt!142302 () SeekEntryResult!2036)

(assert (=> b!288830 (= res!150504 (or lt!142304 (= lt!142302 (MissingVacant!2036 i!1256))))))

(assert (=> b!288830 (= lt!142304 (= lt!142302 (MissingZero!2036 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14521 (_ BitVec 32)) SeekEntryResult!2036)

(assert (=> b!288830 (= lt!142302 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!150503 () Bool)

(assert (=> start!28214 (=> (not res!150503) (not e!182858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28214 (= res!150503 (validMask!0 mask!3809))))

(assert (=> start!28214 e!182858))

(assert (=> start!28214 true))

(declare-fun array_inv!4860 (array!14521) Bool)

(assert (=> start!28214 (array_inv!4860 a!3312)))

(declare-fun b!288831 () Bool)

(assert (=> b!288831 (= e!182862 (not true))))

(assert (=> b!288831 (and (= (select (arr!6888 a!3312) (index!10316 lt!142303)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10316 lt!142303) i!1256))))

(declare-fun b!288832 () Bool)

(assert (=> b!288832 (= e!182861 e!182860)))

(declare-fun res!150506 () Bool)

(assert (=> b!288832 (=> (not res!150506) (not e!182860))))

(assert (=> b!288832 (= res!150506 lt!142304)))

(declare-fun lt!142301 () (_ BitVec 32))

(declare-fun lt!142305 () SeekEntryResult!2036)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14521 (_ BitVec 32)) SeekEntryResult!2036)

(assert (=> b!288832 (= lt!142305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142301 k0!2524 (array!14522 (store (arr!6888 a!3312) i!1256 k0!2524) (size!7241 a!3312)) mask!3809))))

(assert (=> b!288832 (= lt!142303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142301 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288832 (= lt!142301 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288833 () Bool)

(declare-fun res!150502 () Bool)

(assert (=> b!288833 (=> (not res!150502) (not e!182858))))

(declare-fun arrayContainsKey!0 (array!14521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288833 (= res!150502 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28214 res!150503) b!288827))

(assert (= (and b!288827 res!150501) b!288828))

(assert (= (and b!288828 res!150507) b!288833))

(assert (= (and b!288833 res!150502) b!288830))

(assert (= (and b!288830 res!150504) b!288829))

(assert (= (and b!288829 res!150508) b!288832))

(assert (= (and b!288832 res!150506) b!288826))

(assert (= (and b!288826 res!150505) b!288831))

(declare-fun m!302567 () Bool)

(assert (=> b!288833 m!302567))

(declare-fun m!302569 () Bool)

(assert (=> b!288831 m!302569))

(declare-fun m!302571 () Bool)

(assert (=> b!288829 m!302571))

(assert (=> b!288826 m!302569))

(declare-fun m!302573 () Bool)

(assert (=> b!288832 m!302573))

(declare-fun m!302575 () Bool)

(assert (=> b!288832 m!302575))

(declare-fun m!302577 () Bool)

(assert (=> b!288832 m!302577))

(declare-fun m!302579 () Bool)

(assert (=> b!288832 m!302579))

(declare-fun m!302581 () Bool)

(assert (=> b!288828 m!302581))

(declare-fun m!302583 () Bool)

(assert (=> b!288830 m!302583))

(declare-fun m!302585 () Bool)

(assert (=> start!28214 m!302585))

(declare-fun m!302587 () Bool)

(assert (=> start!28214 m!302587))

(check-sat (not b!288828) (not b!288832) (not b!288830) (not b!288829) (not b!288833) (not start!28214))
(check-sat)
