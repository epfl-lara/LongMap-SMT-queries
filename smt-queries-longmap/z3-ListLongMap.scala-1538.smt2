; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29152 () Bool)

(assert start!29152)

(declare-fun b!295911 () Bool)

(declare-fun e!187022 () Bool)

(declare-fun e!187024 () Bool)

(assert (=> b!295911 (= e!187022 e!187024)))

(declare-fun res!155687 () Bool)

(assert (=> b!295911 (=> (not res!155687) (not e!187024))))

(declare-datatypes ((SeekEntryResult!2204 0))(
  ( (MissingZero!2204 (index!10986 (_ BitVec 32))) (Found!2204 (index!10987 (_ BitVec 32))) (Intermediate!2204 (undefined!3016 Bool) (index!10988 (_ BitVec 32)) (x!29313 (_ BitVec 32))) (Undefined!2204) (MissingVacant!2204 (index!10989 (_ BitVec 32))) )
))
(declare-fun lt!146837 () SeekEntryResult!2204)

(declare-fun lt!146841 () Bool)

(declare-datatypes ((array!14958 0))(
  ( (array!14959 (arr!7090 (Array (_ BitVec 32) (_ BitVec 64))) (size!7442 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14958)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!295911 (= res!155687 (and (or lt!146841 (not (undefined!3016 lt!146837))) (or lt!146841 (not (= (select (arr!7090 a!3312) (index!10988 lt!146837)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146841 (not (= (select (arr!7090 a!3312) (index!10988 lt!146837)) k0!2524))) (not lt!146841)))))

(get-info :version)

(assert (=> b!295911 (= lt!146841 (not ((_ is Intermediate!2204) lt!146837)))))

(declare-fun b!295912 () Bool)

(assert (=> b!295912 (= e!187024 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295912 (and (= (select (arr!7090 a!3312) (index!10988 lt!146837)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10988 lt!146837) i!1256))))

(declare-fun b!295913 () Bool)

(declare-fun res!155684 () Bool)

(declare-fun e!187021 () Bool)

(assert (=> b!295913 (=> (not res!155684) (not e!187021))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14958 (_ BitVec 32)) Bool)

(assert (=> b!295913 (= res!155684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155681 () Bool)

(declare-fun e!187025 () Bool)

(assert (=> start!29152 (=> (not res!155681) (not e!187025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29152 (= res!155681 (validMask!0 mask!3809))))

(assert (=> start!29152 e!187025))

(assert (=> start!29152 true))

(declare-fun array_inv!5040 (array!14958) Bool)

(assert (=> start!29152 (array_inv!5040 a!3312)))

(declare-fun b!295914 () Bool)

(declare-fun res!155688 () Bool)

(assert (=> b!295914 (=> (not res!155688) (not e!187025))))

(declare-fun arrayContainsKey!0 (array!14958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295914 (= res!155688 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295915 () Bool)

(assert (=> b!295915 (= e!187021 e!187022)))

(declare-fun res!155685 () Bool)

(assert (=> b!295915 (=> (not res!155685) (not e!187022))))

(declare-fun lt!146838 () Bool)

(assert (=> b!295915 (= res!155685 lt!146838)))

(declare-fun lt!146840 () SeekEntryResult!2204)

(declare-fun lt!146839 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14958 (_ BitVec 32)) SeekEntryResult!2204)

(assert (=> b!295915 (= lt!146840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146839 k0!2524 (array!14959 (store (arr!7090 a!3312) i!1256 k0!2524) (size!7442 a!3312)) mask!3809))))

(assert (=> b!295915 (= lt!146837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146839 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295915 (= lt!146839 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295916 () Bool)

(assert (=> b!295916 (= e!187025 e!187021)))

(declare-fun res!155683 () Bool)

(assert (=> b!295916 (=> (not res!155683) (not e!187021))))

(declare-fun lt!146836 () SeekEntryResult!2204)

(assert (=> b!295916 (= res!155683 (or lt!146838 (= lt!146836 (MissingVacant!2204 i!1256))))))

(assert (=> b!295916 (= lt!146838 (= lt!146836 (MissingZero!2204 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14958 (_ BitVec 32)) SeekEntryResult!2204)

(assert (=> b!295916 (= lt!146836 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295917 () Bool)

(declare-fun res!155682 () Bool)

(assert (=> b!295917 (=> (not res!155682) (not e!187025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295917 (= res!155682 (validKeyInArray!0 k0!2524))))

(declare-fun b!295918 () Bool)

(declare-fun res!155686 () Bool)

(assert (=> b!295918 (=> (not res!155686) (not e!187025))))

(assert (=> b!295918 (= res!155686 (and (= (size!7442 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7442 a!3312))))))

(assert (= (and start!29152 res!155681) b!295918))

(assert (= (and b!295918 res!155686) b!295917))

(assert (= (and b!295917 res!155682) b!295914))

(assert (= (and b!295914 res!155688) b!295916))

(assert (= (and b!295916 res!155683) b!295913))

(assert (= (and b!295913 res!155684) b!295915))

(assert (= (and b!295915 res!155685) b!295911))

(assert (= (and b!295911 res!155687) b!295912))

(declare-fun m!309149 () Bool)

(assert (=> b!295912 m!309149))

(declare-fun m!309151 () Bool)

(assert (=> b!295915 m!309151))

(declare-fun m!309153 () Bool)

(assert (=> b!295915 m!309153))

(declare-fun m!309155 () Bool)

(assert (=> b!295915 m!309155))

(declare-fun m!309157 () Bool)

(assert (=> b!295915 m!309157))

(declare-fun m!309159 () Bool)

(assert (=> b!295916 m!309159))

(assert (=> b!295911 m!309149))

(declare-fun m!309161 () Bool)

(assert (=> b!295914 m!309161))

(declare-fun m!309163 () Bool)

(assert (=> b!295913 m!309163))

(declare-fun m!309165 () Bool)

(assert (=> start!29152 m!309165))

(declare-fun m!309167 () Bool)

(assert (=> start!29152 m!309167))

(declare-fun m!309169 () Bool)

(assert (=> b!295917 m!309169))

(check-sat (not b!295915) (not start!29152) (not b!295916) (not b!295917) (not b!295913) (not b!295914))
(check-sat)
