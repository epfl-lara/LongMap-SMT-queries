; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29158 () Bool)

(assert start!29158)

(declare-fun b!295983 () Bool)

(declare-fun e!187068 () Bool)

(assert (=> b!295983 (= e!187068 (not true))))

(declare-datatypes ((array!14964 0))(
  ( (array!14965 (arr!7093 (Array (_ BitVec 32) (_ BitVec 64))) (size!7445 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14964)

(declare-datatypes ((SeekEntryResult!2207 0))(
  ( (MissingZero!2207 (index!10998 (_ BitVec 32))) (Found!2207 (index!10999 (_ BitVec 32))) (Intermediate!2207 (undefined!3019 Bool) (index!11000 (_ BitVec 32)) (x!29324 (_ BitVec 32))) (Undefined!2207) (MissingVacant!2207 (index!11001 (_ BitVec 32))) )
))
(declare-fun lt!146890 () SeekEntryResult!2207)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295983 (and (= (select (arr!7093 a!3312) (index!11000 lt!146890)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11000 lt!146890) i!1256))))

(declare-fun b!295984 () Bool)

(declare-fun e!187067 () Bool)

(declare-fun e!187066 () Bool)

(assert (=> b!295984 (= e!187067 e!187066)))

(declare-fun res!155759 () Bool)

(assert (=> b!295984 (=> (not res!155759) (not e!187066))))

(declare-fun lt!146891 () Bool)

(assert (=> b!295984 (= res!155759 lt!146891)))

(declare-fun lt!146893 () SeekEntryResult!2207)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!146894 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14964 (_ BitVec 32)) SeekEntryResult!2207)

(assert (=> b!295984 (= lt!146893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146894 k0!2524 (array!14965 (store (arr!7093 a!3312) i!1256 k0!2524) (size!7445 a!3312)) mask!3809))))

(assert (=> b!295984 (= lt!146890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146894 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295984 (= lt!146894 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295985 () Bool)

(declare-fun res!155756 () Bool)

(declare-fun e!187069 () Bool)

(assert (=> b!295985 (=> (not res!155756) (not e!187069))))

(declare-fun arrayContainsKey!0 (array!14964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295985 (= res!155756 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155753 () Bool)

(assert (=> start!29158 (=> (not res!155753) (not e!187069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29158 (= res!155753 (validMask!0 mask!3809))))

(assert (=> start!29158 e!187069))

(assert (=> start!29158 true))

(declare-fun array_inv!5043 (array!14964) Bool)

(assert (=> start!29158 (array_inv!5043 a!3312)))

(declare-fun b!295986 () Bool)

(declare-fun res!155760 () Bool)

(assert (=> b!295986 (=> (not res!155760) (not e!187069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295986 (= res!155760 (validKeyInArray!0 k0!2524))))

(declare-fun b!295987 () Bool)

(declare-fun res!155758 () Bool)

(assert (=> b!295987 (=> (not res!155758) (not e!187067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14964 (_ BitVec 32)) Bool)

(assert (=> b!295987 (= res!155758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295988 () Bool)

(declare-fun res!155754 () Bool)

(assert (=> b!295988 (=> (not res!155754) (not e!187069))))

(assert (=> b!295988 (= res!155754 (and (= (size!7445 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7445 a!3312))))))

(declare-fun b!295989 () Bool)

(assert (=> b!295989 (= e!187069 e!187067)))

(declare-fun res!155757 () Bool)

(assert (=> b!295989 (=> (not res!155757) (not e!187067))))

(declare-fun lt!146895 () SeekEntryResult!2207)

(assert (=> b!295989 (= res!155757 (or lt!146891 (= lt!146895 (MissingVacant!2207 i!1256))))))

(assert (=> b!295989 (= lt!146891 (= lt!146895 (MissingZero!2207 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14964 (_ BitVec 32)) SeekEntryResult!2207)

(assert (=> b!295989 (= lt!146895 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295990 () Bool)

(assert (=> b!295990 (= e!187066 e!187068)))

(declare-fun res!155755 () Bool)

(assert (=> b!295990 (=> (not res!155755) (not e!187068))))

(declare-fun lt!146892 () Bool)

(assert (=> b!295990 (= res!155755 (and (or lt!146892 (not (undefined!3019 lt!146890))) (or lt!146892 (not (= (select (arr!7093 a!3312) (index!11000 lt!146890)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146892 (not (= (select (arr!7093 a!3312) (index!11000 lt!146890)) k0!2524))) (not lt!146892)))))

(get-info :version)

(assert (=> b!295990 (= lt!146892 (not ((_ is Intermediate!2207) lt!146890)))))

(assert (= (and start!29158 res!155753) b!295988))

(assert (= (and b!295988 res!155754) b!295986))

(assert (= (and b!295986 res!155760) b!295985))

(assert (= (and b!295985 res!155756) b!295989))

(assert (= (and b!295989 res!155757) b!295987))

(assert (= (and b!295987 res!155758) b!295984))

(assert (= (and b!295984 res!155759) b!295990))

(assert (= (and b!295990 res!155755) b!295983))

(declare-fun m!309215 () Bool)

(assert (=> b!295987 m!309215))

(declare-fun m!309217 () Bool)

(assert (=> start!29158 m!309217))

(declare-fun m!309219 () Bool)

(assert (=> start!29158 m!309219))

(declare-fun m!309221 () Bool)

(assert (=> b!295990 m!309221))

(declare-fun m!309223 () Bool)

(assert (=> b!295986 m!309223))

(declare-fun m!309225 () Bool)

(assert (=> b!295989 m!309225))

(declare-fun m!309227 () Bool)

(assert (=> b!295985 m!309227))

(declare-fun m!309229 () Bool)

(assert (=> b!295984 m!309229))

(declare-fun m!309231 () Bool)

(assert (=> b!295984 m!309231))

(declare-fun m!309233 () Bool)

(assert (=> b!295984 m!309233))

(declare-fun m!309235 () Bool)

(assert (=> b!295984 m!309235))

(assert (=> b!295983 m!309221))

(check-sat (not b!295985) (not b!295984) (not start!29158) (not b!295989) (not b!295986) (not b!295987))
(check-sat)
