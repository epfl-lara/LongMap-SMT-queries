; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29164 () Bool)

(assert start!29164)

(declare-fun b!295918 () Bool)

(declare-fun res!155729 () Bool)

(declare-fun e!187033 () Bool)

(assert (=> b!295918 (=> (not res!155729) (not e!187033))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14967 0))(
  ( (array!14968 (arr!7094 (Array (_ BitVec 32) (_ BitVec 64))) (size!7446 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14967)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!295918 (= res!155729 (and (= (size!7446 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7446 a!3312))))))

(declare-fun b!295919 () Bool)

(declare-fun e!187034 () Bool)

(assert (=> b!295919 (= e!187033 e!187034)))

(declare-fun res!155730 () Bool)

(assert (=> b!295919 (=> (not res!155730) (not e!187034))))

(declare-fun lt!146828 () Bool)

(declare-datatypes ((SeekEntryResult!2243 0))(
  ( (MissingZero!2243 (index!11142 (_ BitVec 32))) (Found!2243 (index!11143 (_ BitVec 32))) (Intermediate!2243 (undefined!3055 Bool) (index!11144 (_ BitVec 32)) (x!29359 (_ BitVec 32))) (Undefined!2243) (MissingVacant!2243 (index!11145 (_ BitVec 32))) )
))
(declare-fun lt!146825 () SeekEntryResult!2243)

(assert (=> b!295919 (= res!155730 (or lt!146828 (= lt!146825 (MissingVacant!2243 i!1256))))))

(assert (=> b!295919 (= lt!146828 (= lt!146825 (MissingZero!2243 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14967 (_ BitVec 32)) SeekEntryResult!2243)

(assert (=> b!295919 (= lt!146825 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295920 () Bool)

(declare-fun res!155727 () Bool)

(assert (=> b!295920 (=> (not res!155727) (not e!187033))))

(declare-fun arrayContainsKey!0 (array!14967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295920 (= res!155727 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295921 () Bool)

(declare-fun e!187032 () Bool)

(assert (=> b!295921 (= e!187032 (not true))))

(declare-fun lt!146829 () SeekEntryResult!2243)

(assert (=> b!295921 (and (= (select (arr!7094 a!3312) (index!11144 lt!146829)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11144 lt!146829) i!1256))))

(declare-fun res!155731 () Bool)

(assert (=> start!29164 (=> (not res!155731) (not e!187033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29164 (= res!155731 (validMask!0 mask!3809))))

(assert (=> start!29164 e!187033))

(assert (=> start!29164 true))

(declare-fun array_inv!5057 (array!14967) Bool)

(assert (=> start!29164 (array_inv!5057 a!3312)))

(declare-fun b!295922 () Bool)

(declare-fun e!187036 () Bool)

(assert (=> b!295922 (= e!187034 e!187036)))

(declare-fun res!155728 () Bool)

(assert (=> b!295922 (=> (not res!155728) (not e!187036))))

(assert (=> b!295922 (= res!155728 lt!146828)))

(declare-fun lt!146827 () (_ BitVec 32))

(declare-fun lt!146824 () SeekEntryResult!2243)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14967 (_ BitVec 32)) SeekEntryResult!2243)

(assert (=> b!295922 (= lt!146824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146827 k!2524 (array!14968 (store (arr!7094 a!3312) i!1256 k!2524) (size!7446 a!3312)) mask!3809))))

(assert (=> b!295922 (= lt!146829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146827 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295922 (= lt!146827 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295923 () Bool)

(declare-fun res!155726 () Bool)

(assert (=> b!295923 (=> (not res!155726) (not e!187034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14967 (_ BitVec 32)) Bool)

(assert (=> b!295923 (= res!155726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295924 () Bool)

(assert (=> b!295924 (= e!187036 e!187032)))

(declare-fun res!155732 () Bool)

(assert (=> b!295924 (=> (not res!155732) (not e!187032))))

(declare-fun lt!146826 () Bool)

(assert (=> b!295924 (= res!155732 (and (or lt!146826 (not (undefined!3055 lt!146829))) (or lt!146826 (not (= (select (arr!7094 a!3312) (index!11144 lt!146829)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146826 (not (= (select (arr!7094 a!3312) (index!11144 lt!146829)) k!2524))) (not lt!146826)))))

(assert (=> b!295924 (= lt!146826 (not (is-Intermediate!2243 lt!146829)))))

(declare-fun b!295925 () Bool)

(declare-fun res!155733 () Bool)

(assert (=> b!295925 (=> (not res!155733) (not e!187033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295925 (= res!155733 (validKeyInArray!0 k!2524))))

(assert (= (and start!29164 res!155731) b!295918))

(assert (= (and b!295918 res!155729) b!295925))

(assert (= (and b!295925 res!155733) b!295920))

(assert (= (and b!295920 res!155727) b!295919))

(assert (= (and b!295919 res!155730) b!295923))

(assert (= (and b!295923 res!155726) b!295922))

(assert (= (and b!295922 res!155728) b!295924))

(assert (= (and b!295924 res!155732) b!295921))

(declare-fun m!308985 () Bool)

(assert (=> b!295923 m!308985))

(declare-fun m!308987 () Bool)

(assert (=> b!295924 m!308987))

(assert (=> b!295921 m!308987))

(declare-fun m!308989 () Bool)

(assert (=> b!295922 m!308989))

(declare-fun m!308991 () Bool)

(assert (=> b!295922 m!308991))

(declare-fun m!308993 () Bool)

(assert (=> b!295922 m!308993))

(declare-fun m!308995 () Bool)

(assert (=> b!295922 m!308995))

(declare-fun m!308997 () Bool)

(assert (=> b!295925 m!308997))

(declare-fun m!308999 () Bool)

(assert (=> b!295920 m!308999))

(declare-fun m!309001 () Bool)

(assert (=> b!295919 m!309001))

(declare-fun m!309003 () Bool)

(assert (=> start!29164 m!309003))

(declare-fun m!309005 () Bool)

(assert (=> start!29164 m!309005))

(push 1)

