; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29176 () Bool)

(assert start!29176)

(declare-fun b!296062 () Bool)

(declare-fun res!155875 () Bool)

(declare-fun e!187122 () Bool)

(assert (=> b!296062 (=> (not res!155875) (not e!187122))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14979 0))(
  ( (array!14980 (arr!7100 (Array (_ BitVec 32) (_ BitVec 64))) (size!7452 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14979)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!296062 (= res!155875 (and (= (size!7452 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7452 a!3312))))))

(declare-fun b!296063 () Bool)

(declare-fun e!187125 () Bool)

(assert (=> b!296063 (= e!187122 e!187125)))

(declare-fun res!155874 () Bool)

(assert (=> b!296063 (=> (not res!155874) (not e!187125))))

(declare-datatypes ((SeekEntryResult!2249 0))(
  ( (MissingZero!2249 (index!11166 (_ BitVec 32))) (Found!2249 (index!11167 (_ BitVec 32))) (Intermediate!2249 (undefined!3061 Bool) (index!11168 (_ BitVec 32)) (x!29381 (_ BitVec 32))) (Undefined!2249) (MissingVacant!2249 (index!11169 (_ BitVec 32))) )
))
(declare-fun lt!146933 () SeekEntryResult!2249)

(declare-fun lt!146934 () Bool)

(assert (=> b!296063 (= res!155874 (or lt!146934 (= lt!146933 (MissingVacant!2249 i!1256))))))

(assert (=> b!296063 (= lt!146934 (= lt!146933 (MissingZero!2249 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14979 (_ BitVec 32)) SeekEntryResult!2249)

(assert (=> b!296063 (= lt!146933 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296064 () Bool)

(declare-fun res!155876 () Bool)

(assert (=> b!296064 (=> (not res!155876) (not e!187122))))

(declare-fun arrayContainsKey!0 (array!14979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296064 (= res!155876 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296065 () Bool)

(declare-fun res!155870 () Bool)

(assert (=> b!296065 (=> (not res!155870) (not e!187122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296065 (= res!155870 (validKeyInArray!0 k!2524))))

(declare-fun b!296066 () Bool)

(declare-fun e!187126 () Bool)

(assert (=> b!296066 (= e!187125 e!187126)))

(declare-fun res!155877 () Bool)

(assert (=> b!296066 (=> (not res!155877) (not e!187126))))

(assert (=> b!296066 (= res!155877 lt!146934)))

(declare-fun lt!146937 () (_ BitVec 32))

(declare-fun lt!146932 () SeekEntryResult!2249)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14979 (_ BitVec 32)) SeekEntryResult!2249)

(assert (=> b!296066 (= lt!146932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146937 k!2524 (array!14980 (store (arr!7100 a!3312) i!1256 k!2524) (size!7452 a!3312)) mask!3809))))

(declare-fun lt!146935 () SeekEntryResult!2249)

(assert (=> b!296066 (= lt!146935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146937 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296066 (= lt!146937 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296067 () Bool)

(declare-fun e!187123 () Bool)

(assert (=> b!296067 (= e!187126 e!187123)))

(declare-fun res!155871 () Bool)

(assert (=> b!296067 (=> (not res!155871) (not e!187123))))

(declare-fun lt!146936 () Bool)

(assert (=> b!296067 (= res!155871 (and (or lt!146936 (not (undefined!3061 lt!146935))) (or lt!146936 (not (= (select (arr!7100 a!3312) (index!11168 lt!146935)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146936 (not (= (select (arr!7100 a!3312) (index!11168 lt!146935)) k!2524))) (not lt!146936)))))

(assert (=> b!296067 (= lt!146936 (not (is-Intermediate!2249 lt!146935)))))

(declare-fun res!155872 () Bool)

(assert (=> start!29176 (=> (not res!155872) (not e!187122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29176 (= res!155872 (validMask!0 mask!3809))))

(assert (=> start!29176 e!187122))

(assert (=> start!29176 true))

(declare-fun array_inv!5063 (array!14979) Bool)

(assert (=> start!29176 (array_inv!5063 a!3312)))

(declare-fun b!296068 () Bool)

(declare-fun res!155873 () Bool)

(assert (=> b!296068 (=> (not res!155873) (not e!187125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14979 (_ BitVec 32)) Bool)

(assert (=> b!296068 (= res!155873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296069 () Bool)

(assert (=> b!296069 (= e!187123 (not (= lt!146935 (Intermediate!2249 false (index!11168 lt!146935) (x!29381 lt!146935)))))))

(assert (=> b!296069 (and (= (select (arr!7100 a!3312) (index!11168 lt!146935)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11168 lt!146935) i!1256))))

(assert (= (and start!29176 res!155872) b!296062))

(assert (= (and b!296062 res!155875) b!296065))

(assert (= (and b!296065 res!155870) b!296064))

(assert (= (and b!296064 res!155876) b!296063))

(assert (= (and b!296063 res!155874) b!296068))

(assert (= (and b!296068 res!155873) b!296066))

(assert (= (and b!296066 res!155877) b!296067))

(assert (= (and b!296067 res!155871) b!296069))

(declare-fun m!309117 () Bool)

(assert (=> b!296068 m!309117))

(declare-fun m!309119 () Bool)

(assert (=> b!296067 m!309119))

(declare-fun m!309121 () Bool)

(assert (=> start!29176 m!309121))

(declare-fun m!309123 () Bool)

(assert (=> start!29176 m!309123))

(declare-fun m!309125 () Bool)

(assert (=> b!296066 m!309125))

(declare-fun m!309127 () Bool)

(assert (=> b!296066 m!309127))

(declare-fun m!309129 () Bool)

(assert (=> b!296066 m!309129))

(declare-fun m!309131 () Bool)

(assert (=> b!296066 m!309131))

(declare-fun m!309133 () Bool)

(assert (=> b!296065 m!309133))

(assert (=> b!296069 m!309119))

(declare-fun m!309135 () Bool)

(assert (=> b!296063 m!309135))

(declare-fun m!309137 () Bool)

(assert (=> b!296064 m!309137))

(push 1)

