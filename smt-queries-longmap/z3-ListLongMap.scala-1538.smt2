; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29160 () Bool)

(assert start!29160)

(declare-fun b!295870 () Bool)

(declare-fun res!155682 () Bool)

(declare-fun e!187002 () Bool)

(assert (=> b!295870 (=> (not res!155682) (not e!187002))))

(declare-datatypes ((array!14963 0))(
  ( (array!14964 (arr!7092 (Array (_ BitVec 32) (_ BitVec 64))) (size!7444 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14963)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295870 (= res!155682 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295871 () Bool)

(declare-fun res!155678 () Bool)

(assert (=> b!295871 (=> (not res!155678) (not e!187002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295871 (= res!155678 (validKeyInArray!0 k0!2524))))

(declare-fun b!295872 () Bool)

(declare-fun e!187003 () Bool)

(assert (=> b!295872 (= e!187003 (not true))))

(declare-datatypes ((SeekEntryResult!2241 0))(
  ( (MissingZero!2241 (index!11134 (_ BitVec 32))) (Found!2241 (index!11135 (_ BitVec 32))) (Intermediate!2241 (undefined!3053 Bool) (index!11136 (_ BitVec 32)) (x!29349 (_ BitVec 32))) (Undefined!2241) (MissingVacant!2241 (index!11137 (_ BitVec 32))) )
))
(declare-fun lt!146789 () SeekEntryResult!2241)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295872 (and (= (select (arr!7092 a!3312) (index!11136 lt!146789)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11136 lt!146789) i!1256))))

(declare-fun b!295873 () Bool)

(declare-fun res!155684 () Bool)

(assert (=> b!295873 (=> (not res!155684) (not e!187002))))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!295873 (= res!155684 (and (= (size!7444 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7444 a!3312))))))

(declare-fun b!295874 () Bool)

(declare-fun e!187006 () Bool)

(declare-fun e!187005 () Bool)

(assert (=> b!295874 (= e!187006 e!187005)))

(declare-fun res!155679 () Bool)

(assert (=> b!295874 (=> (not res!155679) (not e!187005))))

(declare-fun lt!146788 () Bool)

(assert (=> b!295874 (= res!155679 lt!146788)))

(declare-fun lt!146792 () (_ BitVec 32))

(declare-fun lt!146793 () SeekEntryResult!2241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14963 (_ BitVec 32)) SeekEntryResult!2241)

(assert (=> b!295874 (= lt!146793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146792 k0!2524 (array!14964 (store (arr!7092 a!3312) i!1256 k0!2524) (size!7444 a!3312)) mask!3809))))

(assert (=> b!295874 (= lt!146789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146792 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295874 (= lt!146792 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295875 () Bool)

(declare-fun res!155683 () Bool)

(assert (=> b!295875 (=> (not res!155683) (not e!187006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14963 (_ BitVec 32)) Bool)

(assert (=> b!295875 (= res!155683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155685 () Bool)

(assert (=> start!29160 (=> (not res!155685) (not e!187002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29160 (= res!155685 (validMask!0 mask!3809))))

(assert (=> start!29160 e!187002))

(assert (=> start!29160 true))

(declare-fun array_inv!5055 (array!14963) Bool)

(assert (=> start!29160 (array_inv!5055 a!3312)))

(declare-fun b!295876 () Bool)

(assert (=> b!295876 (= e!187002 e!187006)))

(declare-fun res!155681 () Bool)

(assert (=> b!295876 (=> (not res!155681) (not e!187006))))

(declare-fun lt!146791 () SeekEntryResult!2241)

(assert (=> b!295876 (= res!155681 (or lt!146788 (= lt!146791 (MissingVacant!2241 i!1256))))))

(assert (=> b!295876 (= lt!146788 (= lt!146791 (MissingZero!2241 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14963 (_ BitVec 32)) SeekEntryResult!2241)

(assert (=> b!295876 (= lt!146791 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295877 () Bool)

(assert (=> b!295877 (= e!187005 e!187003)))

(declare-fun res!155680 () Bool)

(assert (=> b!295877 (=> (not res!155680) (not e!187003))))

(declare-fun lt!146790 () Bool)

(assert (=> b!295877 (= res!155680 (and (or lt!146790 (not (undefined!3053 lt!146789))) (or lt!146790 (not (= (select (arr!7092 a!3312) (index!11136 lt!146789)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146790 (not (= (select (arr!7092 a!3312) (index!11136 lt!146789)) k0!2524))) (not lt!146790)))))

(get-info :version)

(assert (=> b!295877 (= lt!146790 (not ((_ is Intermediate!2241) lt!146789)))))

(assert (= (and start!29160 res!155685) b!295873))

(assert (= (and b!295873 res!155684) b!295871))

(assert (= (and b!295871 res!155678) b!295870))

(assert (= (and b!295870 res!155682) b!295876))

(assert (= (and b!295876 res!155681) b!295875))

(assert (= (and b!295875 res!155683) b!295874))

(assert (= (and b!295874 res!155679) b!295877))

(assert (= (and b!295877 res!155680) b!295872))

(declare-fun m!308941 () Bool)

(assert (=> b!295870 m!308941))

(declare-fun m!308943 () Bool)

(assert (=> b!295874 m!308943))

(declare-fun m!308945 () Bool)

(assert (=> b!295874 m!308945))

(declare-fun m!308947 () Bool)

(assert (=> b!295874 m!308947))

(declare-fun m!308949 () Bool)

(assert (=> b!295874 m!308949))

(declare-fun m!308951 () Bool)

(assert (=> b!295872 m!308951))

(declare-fun m!308953 () Bool)

(assert (=> b!295871 m!308953))

(declare-fun m!308955 () Bool)

(assert (=> b!295875 m!308955))

(declare-fun m!308957 () Bool)

(assert (=> b!295876 m!308957))

(assert (=> b!295877 m!308951))

(declare-fun m!308959 () Bool)

(assert (=> start!29160 m!308959))

(declare-fun m!308961 () Bool)

(assert (=> start!29160 m!308961))

(check-sat (not b!295871) (not b!295874) (not b!295876) (not b!295870) (not start!29160) (not b!295875))
(check-sat)
