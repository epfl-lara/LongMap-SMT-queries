; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28654 () Bool)

(assert start!28654)

(declare-fun b!293030 () Bool)

(declare-fun res!154065 () Bool)

(declare-fun e!185319 () Bool)

(assert (=> b!293030 (=> (not res!154065) (not e!185319))))

(declare-datatypes ((array!14838 0))(
  ( (array!14839 (arr!7042 (Array (_ BitVec 32) (_ BitVec 64))) (size!7394 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14838)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14838 (_ BitVec 32)) Bool)

(assert (=> b!293030 (= res!154065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293031 () Bool)

(declare-fun res!154064 () Bool)

(declare-fun e!185320 () Bool)

(assert (=> b!293031 (=> (not res!154064) (not e!185320))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293031 (= res!154064 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293032 () Bool)

(declare-fun res!154062 () Bool)

(assert (=> b!293032 (=> (not res!154062) (not e!185320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293032 (= res!154062 (validKeyInArray!0 k0!2524))))

(declare-fun b!293033 () Bool)

(assert (=> b!293033 (= e!185320 e!185319)))

(declare-fun res!154063 () Bool)

(assert (=> b!293033 (=> (not res!154063) (not e!185319))))

(declare-datatypes ((SeekEntryResult!2156 0))(
  ( (MissingZero!2156 (index!10794 (_ BitVec 32))) (Found!2156 (index!10795 (_ BitVec 32))) (Intermediate!2156 (undefined!2968 Bool) (index!10796 (_ BitVec 32)) (x!29083 (_ BitVec 32))) (Undefined!2156) (MissingVacant!2156 (index!10797 (_ BitVec 32))) )
))
(declare-fun lt!145265 () SeekEntryResult!2156)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293033 (= res!154063 (or (= lt!145265 (MissingZero!2156 i!1256)) (= lt!145265 (MissingVacant!2156 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14838 (_ BitVec 32)) SeekEntryResult!2156)

(assert (=> b!293033 (= lt!145265 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293034 () Bool)

(declare-fun res!154060 () Bool)

(assert (=> b!293034 (=> (not res!154060) (not e!185320))))

(assert (=> b!293034 (= res!154060 (and (= (size!7394 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7394 a!3312))))))

(declare-fun res!154061 () Bool)

(assert (=> start!28654 (=> (not res!154061) (not e!185320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28654 (= res!154061 (validMask!0 mask!3809))))

(assert (=> start!28654 e!185320))

(assert (=> start!28654 true))

(declare-fun array_inv!4992 (array!14838) Bool)

(assert (=> start!28654 (array_inv!4992 a!3312)))

(declare-fun b!293035 () Bool)

(assert (=> b!293035 (= e!185319 false)))

(declare-fun lt!145264 () (_ BitVec 32))

(declare-fun lt!145263 () SeekEntryResult!2156)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14838 (_ BitVec 32)) SeekEntryResult!2156)

(assert (=> b!293035 (= lt!145263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145264 k0!2524 (array!14839 (store (arr!7042 a!3312) i!1256 k0!2524) (size!7394 a!3312)) mask!3809))))

(declare-fun lt!145266 () SeekEntryResult!2156)

(assert (=> b!293035 (= lt!145266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145264 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293035 (= lt!145264 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28654 res!154061) b!293034))

(assert (= (and b!293034 res!154060) b!293032))

(assert (= (and b!293032 res!154062) b!293031))

(assert (= (and b!293031 res!154064) b!293033))

(assert (= (and b!293033 res!154063) b!293030))

(assert (= (and b!293030 res!154065) b!293035))

(declare-fun m!306983 () Bool)

(assert (=> start!28654 m!306983))

(declare-fun m!306985 () Bool)

(assert (=> start!28654 m!306985))

(declare-fun m!306987 () Bool)

(assert (=> b!293035 m!306987))

(declare-fun m!306989 () Bool)

(assert (=> b!293035 m!306989))

(declare-fun m!306991 () Bool)

(assert (=> b!293035 m!306991))

(declare-fun m!306993 () Bool)

(assert (=> b!293035 m!306993))

(declare-fun m!306995 () Bool)

(assert (=> b!293032 m!306995))

(declare-fun m!306997 () Bool)

(assert (=> b!293030 m!306997))

(declare-fun m!306999 () Bool)

(assert (=> b!293033 m!306999))

(declare-fun m!307001 () Bool)

(assert (=> b!293031 m!307001))

(check-sat (not b!293031) (not b!293035) (not b!293032) (not b!293030) (not b!293033) (not start!28654))
(check-sat)
