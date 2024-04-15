; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86796 () Bool)

(assert start!86796)

(declare-fun b!1006299 () Bool)

(declare-fun res!675511 () Bool)

(declare-fun e!566393 () Bool)

(assert (=> b!1006299 (=> (not res!675511) (not e!566393))))

(declare-datatypes ((array!63442 0))(
  ( (array!63443 (arr!30543 (Array (_ BitVec 32) (_ BitVec 64))) (size!31047 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63442)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006299 (= res!675511 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31047 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31047 a!3219))))))

(declare-fun b!1006300 () Bool)

(declare-fun res!675518 () Bool)

(declare-fun e!566395 () Bool)

(assert (=> b!1006300 (=> (not res!675518) (not e!566395))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006300 (= res!675518 (and (= (size!31047 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31047 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31047 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006301 () Bool)

(declare-fun res!675517 () Bool)

(assert (=> b!1006301 (=> (not res!675517) (not e!566395))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006301 (= res!675517 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006302 () Bool)

(declare-fun res!675513 () Bool)

(assert (=> b!1006302 (=> (not res!675513) (not e!566395))))

(assert (=> b!1006302 (= res!675513 (validKeyInArray!0 (select (arr!30543 a!3219) j!170)))))

(declare-fun b!1006303 () Bool)

(declare-fun res!675516 () Bool)

(assert (=> b!1006303 (=> (not res!675516) (not e!566393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63442 (_ BitVec 32)) Bool)

(assert (=> b!1006303 (= res!675516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006304 () Bool)

(declare-fun res!675521 () Bool)

(assert (=> b!1006304 (=> (not res!675521) (not e!566395))))

(declare-fun arrayContainsKey!0 (array!63442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006304 (= res!675521 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006305 () Bool)

(declare-fun e!566396 () Bool)

(assert (=> b!1006305 (= e!566396 false)))

(declare-datatypes ((SeekEntryResult!9500 0))(
  ( (MissingZero!9500 (index!40371 (_ BitVec 32))) (Found!9500 (index!40372 (_ BitVec 32))) (Intermediate!9500 (undefined!10312 Bool) (index!40373 (_ BitVec 32)) (x!87783 (_ BitVec 32))) (Undefined!9500) (MissingVacant!9500 (index!40374 (_ BitVec 32))) )
))
(declare-fun lt!444576 () SeekEntryResult!9500)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63442 (_ BitVec 32)) SeekEntryResult!9500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006305 (= lt!444576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30543 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30543 a!3219) i!1194 k0!2224) j!170) (array!63443 (store (arr!30543 a!3219) i!1194 k0!2224) (size!31047 a!3219)) mask!3464))))

(declare-fun b!1006306 () Bool)

(declare-fun res!675519 () Bool)

(assert (=> b!1006306 (=> (not res!675519) (not e!566393))))

(declare-datatypes ((List!21285 0))(
  ( (Nil!21282) (Cons!21281 (h!22464 (_ BitVec 64)) (t!30277 List!21285)) )
))
(declare-fun arrayNoDuplicates!0 (array!63442 (_ BitVec 32) List!21285) Bool)

(assert (=> b!1006306 (= res!675519 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21282))))

(declare-fun b!1006307 () Bool)

(declare-fun res!675514 () Bool)

(assert (=> b!1006307 (=> (not res!675514) (not e!566396))))

(declare-fun lt!444577 () SeekEntryResult!9500)

(assert (=> b!1006307 (= res!675514 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30543 a!3219) j!170) a!3219 mask!3464) lt!444577))))

(declare-fun b!1006308 () Bool)

(assert (=> b!1006308 (= e!566393 e!566396)))

(declare-fun res!675520 () Bool)

(assert (=> b!1006308 (=> (not res!675520) (not e!566396))))

(assert (=> b!1006308 (= res!675520 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30543 a!3219) j!170) mask!3464) (select (arr!30543 a!3219) j!170) a!3219 mask!3464) lt!444577))))

(assert (=> b!1006308 (= lt!444577 (Intermediate!9500 false resIndex!38 resX!38))))

(declare-fun res!675512 () Bool)

(assert (=> start!86796 (=> (not res!675512) (not e!566395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86796 (= res!675512 (validMask!0 mask!3464))))

(assert (=> start!86796 e!566395))

(declare-fun array_inv!23686 (array!63442) Bool)

(assert (=> start!86796 (array_inv!23686 a!3219)))

(assert (=> start!86796 true))

(declare-fun b!1006309 () Bool)

(assert (=> b!1006309 (= e!566395 e!566393)))

(declare-fun res!675515 () Bool)

(assert (=> b!1006309 (=> (not res!675515) (not e!566393))))

(declare-fun lt!444575 () SeekEntryResult!9500)

(assert (=> b!1006309 (= res!675515 (or (= lt!444575 (MissingVacant!9500 i!1194)) (= lt!444575 (MissingZero!9500 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63442 (_ BitVec 32)) SeekEntryResult!9500)

(assert (=> b!1006309 (= lt!444575 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86796 res!675512) b!1006300))

(assert (= (and b!1006300 res!675518) b!1006302))

(assert (= (and b!1006302 res!675513) b!1006301))

(assert (= (and b!1006301 res!675517) b!1006304))

(assert (= (and b!1006304 res!675521) b!1006309))

(assert (= (and b!1006309 res!675515) b!1006303))

(assert (= (and b!1006303 res!675516) b!1006306))

(assert (= (and b!1006306 res!675519) b!1006299))

(assert (= (and b!1006299 res!675511) b!1006308))

(assert (= (and b!1006308 res!675520) b!1006307))

(assert (= (and b!1006307 res!675514) b!1006305))

(declare-fun m!930883 () Bool)

(assert (=> b!1006301 m!930883))

(declare-fun m!930885 () Bool)

(assert (=> b!1006305 m!930885))

(declare-fun m!930887 () Bool)

(assert (=> b!1006305 m!930887))

(assert (=> b!1006305 m!930887))

(declare-fun m!930889 () Bool)

(assert (=> b!1006305 m!930889))

(assert (=> b!1006305 m!930889))

(assert (=> b!1006305 m!930887))

(declare-fun m!930891 () Bool)

(assert (=> b!1006305 m!930891))

(declare-fun m!930893 () Bool)

(assert (=> b!1006304 m!930893))

(declare-fun m!930895 () Bool)

(assert (=> start!86796 m!930895))

(declare-fun m!930897 () Bool)

(assert (=> start!86796 m!930897))

(declare-fun m!930899 () Bool)

(assert (=> b!1006307 m!930899))

(assert (=> b!1006307 m!930899))

(declare-fun m!930901 () Bool)

(assert (=> b!1006307 m!930901))

(assert (=> b!1006302 m!930899))

(assert (=> b!1006302 m!930899))

(declare-fun m!930903 () Bool)

(assert (=> b!1006302 m!930903))

(declare-fun m!930905 () Bool)

(assert (=> b!1006303 m!930905))

(declare-fun m!930907 () Bool)

(assert (=> b!1006306 m!930907))

(declare-fun m!930909 () Bool)

(assert (=> b!1006309 m!930909))

(assert (=> b!1006308 m!930899))

(assert (=> b!1006308 m!930899))

(declare-fun m!930911 () Bool)

(assert (=> b!1006308 m!930911))

(assert (=> b!1006308 m!930911))

(assert (=> b!1006308 m!930899))

(declare-fun m!930913 () Bool)

(assert (=> b!1006308 m!930913))

(check-sat (not b!1006301) (not b!1006309) (not b!1006306) (not b!1006303) (not b!1006305) (not b!1006304) (not b!1006308) (not b!1006302) (not start!86796) (not b!1006307))
(check-sat)
