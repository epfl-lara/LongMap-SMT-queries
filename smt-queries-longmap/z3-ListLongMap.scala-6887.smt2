; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86578 () Bool)

(assert start!86578)

(declare-fun b!1003821 () Bool)

(declare-fun res!673310 () Bool)

(declare-fun e!565337 () Bool)

(assert (=> b!1003821 (=> (not res!673310) (not e!565337))))

(declare-datatypes ((array!63379 0))(
  ( (array!63380 (arr!30515 (Array (_ BitVec 32) (_ BitVec 64))) (size!31017 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63379)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63379 (_ BitVec 32)) Bool)

(assert (=> b!1003821 (= res!673310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003822 () Bool)

(declare-fun e!565340 () Bool)

(assert (=> b!1003822 (= e!565340 e!565337)))

(declare-fun res!673309 () Bool)

(assert (=> b!1003822 (=> (not res!673309) (not e!565337))))

(declare-datatypes ((SeekEntryResult!9447 0))(
  ( (MissingZero!9447 (index!40159 (_ BitVec 32))) (Found!9447 (index!40160 (_ BitVec 32))) (Intermediate!9447 (undefined!10259 Bool) (index!40161 (_ BitVec 32)) (x!87563 (_ BitVec 32))) (Undefined!9447) (MissingVacant!9447 (index!40162 (_ BitVec 32))) )
))
(declare-fun lt!443869 () SeekEntryResult!9447)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003822 (= res!673309 (or (= lt!443869 (MissingVacant!9447 i!1194)) (= lt!443869 (MissingZero!9447 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63379 (_ BitVec 32)) SeekEntryResult!9447)

(assert (=> b!1003822 (= lt!443869 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003823 () Bool)

(declare-fun res!673311 () Bool)

(declare-fun e!565338 () Bool)

(assert (=> b!1003823 (=> (not res!673311) (not e!565338))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!443870 () (_ BitVec 32))

(declare-fun lt!443873 () SeekEntryResult!9447)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63379 (_ BitVec 32)) SeekEntryResult!9447)

(assert (=> b!1003823 (= res!673311 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443870 (select (arr!30515 a!3219) j!170) a!3219 mask!3464) lt!443873))))

(declare-fun b!1003824 () Bool)

(declare-fun e!565342 () Bool)

(assert (=> b!1003824 (= e!565342 e!565338)))

(declare-fun res!673299 () Bool)

(assert (=> b!1003824 (=> (not res!673299) (not e!565338))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003824 (= res!673299 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443870 #b00000000000000000000000000000000) (bvslt lt!443870 (size!31017 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003824 (= lt!443870 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003825 () Bool)

(assert (=> b!1003825 (= e!565338 false)))

(declare-fun lt!443872 () SeekEntryResult!9447)

(declare-fun lt!443868 () (_ BitVec 64))

(declare-fun lt!443867 () array!63379)

(assert (=> b!1003825 (= lt!443872 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443870 lt!443868 lt!443867 mask!3464))))

(declare-fun b!1003826 () Bool)

(declare-fun res!673308 () Bool)

(assert (=> b!1003826 (=> (not res!673308) (not e!565342))))

(declare-fun lt!443871 () SeekEntryResult!9447)

(assert (=> b!1003826 (= res!673308 (not (= lt!443871 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443868 lt!443867 mask!3464))))))

(declare-fun b!1003827 () Bool)

(declare-fun res!673302 () Bool)

(assert (=> b!1003827 (=> (not res!673302) (not e!565337))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003827 (= res!673302 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31017 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31017 a!3219))))))

(declare-fun b!1003828 () Bool)

(declare-fun res!673312 () Bool)

(assert (=> b!1003828 (=> (not res!673312) (not e!565337))))

(declare-datatypes ((List!21191 0))(
  ( (Nil!21188) (Cons!21187 (h!22364 (_ BitVec 64)) (t!30192 List!21191)) )
))
(declare-fun arrayNoDuplicates!0 (array!63379 (_ BitVec 32) List!21191) Bool)

(assert (=> b!1003828 (= res!673312 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21188))))

(declare-fun b!1003829 () Bool)

(declare-fun e!565341 () Bool)

(assert (=> b!1003829 (= e!565341 e!565342)))

(declare-fun res!673303 () Bool)

(assert (=> b!1003829 (=> (not res!673303) (not e!565342))))

(declare-fun lt!443866 () SeekEntryResult!9447)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003829 (= res!673303 (not (= lt!443866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443868 mask!3464) lt!443868 lt!443867 mask!3464))))))

(assert (=> b!1003829 (= lt!443868 (select (store (arr!30515 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003829 (= lt!443867 (array!63380 (store (arr!30515 a!3219) i!1194 k0!2224) (size!31017 a!3219)))))

(declare-fun b!1003830 () Bool)

(declare-fun e!565336 () Bool)

(assert (=> b!1003830 (= e!565337 e!565336)))

(declare-fun res!673304 () Bool)

(assert (=> b!1003830 (=> (not res!673304) (not e!565336))))

(assert (=> b!1003830 (= res!673304 (= lt!443866 lt!443873))))

(assert (=> b!1003830 (= lt!443873 (Intermediate!9447 false resIndex!38 resX!38))))

(assert (=> b!1003830 (= lt!443866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30515 a!3219) j!170) mask!3464) (select (arr!30515 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003831 () Bool)

(declare-fun res!673314 () Bool)

(assert (=> b!1003831 (=> (not res!673314) (not e!565340))))

(declare-fun arrayContainsKey!0 (array!63379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003831 (= res!673314 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003832 () Bool)

(declare-fun res!673300 () Bool)

(assert (=> b!1003832 (=> (not res!673300) (not e!565342))))

(assert (=> b!1003832 (= res!673300 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003833 () Bool)

(declare-fun res!673305 () Bool)

(assert (=> b!1003833 (=> (not res!673305) (not e!565340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003833 (= res!673305 (validKeyInArray!0 (select (arr!30515 a!3219) j!170)))))

(declare-fun res!673306 () Bool)

(assert (=> start!86578 (=> (not res!673306) (not e!565340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86578 (= res!673306 (validMask!0 mask!3464))))

(assert (=> start!86578 e!565340))

(declare-fun array_inv!23639 (array!63379) Bool)

(assert (=> start!86578 (array_inv!23639 a!3219)))

(assert (=> start!86578 true))

(declare-fun b!1003834 () Bool)

(declare-fun res!673307 () Bool)

(assert (=> b!1003834 (=> (not res!673307) (not e!565340))))

(assert (=> b!1003834 (= res!673307 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003835 () Bool)

(assert (=> b!1003835 (= e!565336 e!565341)))

(declare-fun res!673301 () Bool)

(assert (=> b!1003835 (=> (not res!673301) (not e!565341))))

(assert (=> b!1003835 (= res!673301 (= lt!443871 lt!443873))))

(assert (=> b!1003835 (= lt!443871 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30515 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003836 () Bool)

(declare-fun res!673313 () Bool)

(assert (=> b!1003836 (=> (not res!673313) (not e!565340))))

(assert (=> b!1003836 (= res!673313 (and (= (size!31017 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31017 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31017 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86578 res!673306) b!1003836))

(assert (= (and b!1003836 res!673313) b!1003833))

(assert (= (and b!1003833 res!673305) b!1003834))

(assert (= (and b!1003834 res!673307) b!1003831))

(assert (= (and b!1003831 res!673314) b!1003822))

(assert (= (and b!1003822 res!673309) b!1003821))

(assert (= (and b!1003821 res!673310) b!1003828))

(assert (= (and b!1003828 res!673312) b!1003827))

(assert (= (and b!1003827 res!673302) b!1003830))

(assert (= (and b!1003830 res!673304) b!1003835))

(assert (= (and b!1003835 res!673301) b!1003829))

(assert (= (and b!1003829 res!673303) b!1003826))

(assert (= (and b!1003826 res!673308) b!1003832))

(assert (= (and b!1003832 res!673300) b!1003824))

(assert (= (and b!1003824 res!673299) b!1003823))

(assert (= (and b!1003823 res!673311) b!1003825))

(declare-fun m!929469 () Bool)

(assert (=> b!1003824 m!929469))

(declare-fun m!929471 () Bool)

(assert (=> b!1003833 m!929471))

(assert (=> b!1003833 m!929471))

(declare-fun m!929473 () Bool)

(assert (=> b!1003833 m!929473))

(declare-fun m!929475 () Bool)

(assert (=> start!86578 m!929475))

(declare-fun m!929477 () Bool)

(assert (=> start!86578 m!929477))

(assert (=> b!1003835 m!929471))

(assert (=> b!1003835 m!929471))

(declare-fun m!929479 () Bool)

(assert (=> b!1003835 m!929479))

(declare-fun m!929481 () Bool)

(assert (=> b!1003834 m!929481))

(assert (=> b!1003823 m!929471))

(assert (=> b!1003823 m!929471))

(declare-fun m!929483 () Bool)

(assert (=> b!1003823 m!929483))

(declare-fun m!929485 () Bool)

(assert (=> b!1003825 m!929485))

(declare-fun m!929487 () Bool)

(assert (=> b!1003831 m!929487))

(declare-fun m!929489 () Bool)

(assert (=> b!1003821 m!929489))

(assert (=> b!1003830 m!929471))

(assert (=> b!1003830 m!929471))

(declare-fun m!929491 () Bool)

(assert (=> b!1003830 m!929491))

(assert (=> b!1003830 m!929491))

(assert (=> b!1003830 m!929471))

(declare-fun m!929493 () Bool)

(assert (=> b!1003830 m!929493))

(declare-fun m!929495 () Bool)

(assert (=> b!1003829 m!929495))

(assert (=> b!1003829 m!929495))

(declare-fun m!929497 () Bool)

(assert (=> b!1003829 m!929497))

(declare-fun m!929499 () Bool)

(assert (=> b!1003829 m!929499))

(declare-fun m!929501 () Bool)

(assert (=> b!1003829 m!929501))

(declare-fun m!929503 () Bool)

(assert (=> b!1003826 m!929503))

(declare-fun m!929505 () Bool)

(assert (=> b!1003828 m!929505))

(declare-fun m!929507 () Bool)

(assert (=> b!1003822 m!929507))

(check-sat (not b!1003822) (not b!1003821) (not b!1003830) (not b!1003829) (not b!1003825) (not b!1003826) (not b!1003835) (not b!1003828) (not b!1003834) (not b!1003823) (not b!1003833) (not b!1003824) (not start!86578) (not b!1003831))
(check-sat)
