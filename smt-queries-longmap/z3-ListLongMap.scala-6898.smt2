; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86980 () Bool)

(assert start!86980)

(declare-fun b!1006906 () Bool)

(declare-fun e!567038 () Bool)

(declare-fun e!567039 () Bool)

(assert (=> b!1006906 (= e!567038 e!567039)))

(declare-fun res!675242 () Bool)

(assert (=> b!1006906 (=> (not res!675242) (not e!567039))))

(declare-datatypes ((SeekEntryResult!9433 0))(
  ( (MissingZero!9433 (index!40103 (_ BitVec 32))) (Found!9433 (index!40104 (_ BitVec 32))) (Intermediate!9433 (undefined!10245 Bool) (index!40105 (_ BitVec 32)) (x!87669 (_ BitVec 32))) (Undefined!9433) (MissingVacant!9433 (index!40106 (_ BitVec 32))) )
))
(declare-fun lt!445078 () SeekEntryResult!9433)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006906 (= res!675242 (or (= lt!445078 (MissingVacant!9433 i!1194)) (= lt!445078 (MissingZero!9433 i!1194))))))

(declare-datatypes ((array!63498 0))(
  ( (array!63499 (arr!30565 (Array (_ BitVec 32) (_ BitVec 64))) (size!31068 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63498)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63498 (_ BitVec 32)) SeekEntryResult!9433)

(assert (=> b!1006906 (= lt!445078 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!675237 () Bool)

(assert (=> start!86980 (=> (not res!675237) (not e!567038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86980 (= res!675237 (validMask!0 mask!3464))))

(assert (=> start!86980 e!567038))

(declare-fun array_inv!23701 (array!63498) Bool)

(assert (=> start!86980 (array_inv!23701 a!3219)))

(assert (=> start!86980 true))

(declare-fun b!1006907 () Bool)

(declare-fun res!675239 () Bool)

(assert (=> b!1006907 (=> (not res!675239) (not e!567038))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1006907 (= res!675239 (and (= (size!31068 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31068 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31068 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006908 () Bool)

(declare-fun res!675234 () Bool)

(assert (=> b!1006908 (=> (not res!675234) (not e!567038))))

(declare-fun arrayContainsKey!0 (array!63498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006908 (= res!675234 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006909 () Bool)

(assert (=> b!1006909 (= e!567039 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445079 () SeekEntryResult!9433)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63498 (_ BitVec 32)) SeekEntryResult!9433)

(assert (=> b!1006909 (= lt!445079 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30565 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006910 () Bool)

(declare-fun res!675235 () Bool)

(assert (=> b!1006910 (=> (not res!675235) (not e!567039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63498 (_ BitVec 32)) Bool)

(assert (=> b!1006910 (= res!675235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006911 () Bool)

(declare-fun res!675240 () Bool)

(assert (=> b!1006911 (=> (not res!675240) (not e!567038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006911 (= res!675240 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006912 () Bool)

(declare-fun res!675238 () Bool)

(assert (=> b!1006912 (=> (not res!675238) (not e!567039))))

(declare-datatypes ((List!21212 0))(
  ( (Nil!21209) (Cons!21208 (h!22400 (_ BitVec 64)) (t!30205 List!21212)) )
))
(declare-fun arrayNoDuplicates!0 (array!63498 (_ BitVec 32) List!21212) Bool)

(assert (=> b!1006912 (= res!675238 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21209))))

(declare-fun b!1006913 () Bool)

(declare-fun res!675233 () Bool)

(assert (=> b!1006913 (=> (not res!675233) (not e!567038))))

(assert (=> b!1006913 (= res!675233 (validKeyInArray!0 (select (arr!30565 a!3219) j!170)))))

(declare-fun b!1006914 () Bool)

(declare-fun res!675241 () Bool)

(assert (=> b!1006914 (=> (not res!675241) (not e!567039))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006914 (= res!675241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30565 a!3219) j!170) mask!3464) (select (arr!30565 a!3219) j!170) a!3219 mask!3464) (Intermediate!9433 false resIndex!38 resX!38)))))

(declare-fun b!1006915 () Bool)

(declare-fun res!675236 () Bool)

(assert (=> b!1006915 (=> (not res!675236) (not e!567039))))

(assert (=> b!1006915 (= res!675236 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31068 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31068 a!3219))))))

(assert (= (and start!86980 res!675237) b!1006907))

(assert (= (and b!1006907 res!675239) b!1006913))

(assert (= (and b!1006913 res!675233) b!1006911))

(assert (= (and b!1006911 res!675240) b!1006908))

(assert (= (and b!1006908 res!675234) b!1006906))

(assert (= (and b!1006906 res!675242) b!1006910))

(assert (= (and b!1006910 res!675235) b!1006912))

(assert (= (and b!1006912 res!675238) b!1006915))

(assert (= (and b!1006915 res!675236) b!1006914))

(assert (= (and b!1006914 res!675241) b!1006909))

(declare-fun m!932381 () Bool)

(assert (=> b!1006906 m!932381))

(declare-fun m!932383 () Bool)

(assert (=> b!1006913 m!932383))

(assert (=> b!1006913 m!932383))

(declare-fun m!932385 () Bool)

(assert (=> b!1006913 m!932385))

(declare-fun m!932387 () Bool)

(assert (=> b!1006908 m!932387))

(assert (=> b!1006909 m!932383))

(assert (=> b!1006909 m!932383))

(declare-fun m!932389 () Bool)

(assert (=> b!1006909 m!932389))

(assert (=> b!1006914 m!932383))

(assert (=> b!1006914 m!932383))

(declare-fun m!932391 () Bool)

(assert (=> b!1006914 m!932391))

(assert (=> b!1006914 m!932391))

(assert (=> b!1006914 m!932383))

(declare-fun m!932393 () Bool)

(assert (=> b!1006914 m!932393))

(declare-fun m!932395 () Bool)

(assert (=> b!1006910 m!932395))

(declare-fun m!932397 () Bool)

(assert (=> start!86980 m!932397))

(declare-fun m!932399 () Bool)

(assert (=> start!86980 m!932399))

(declare-fun m!932401 () Bool)

(assert (=> b!1006912 m!932401))

(declare-fun m!932403 () Bool)

(assert (=> b!1006911 m!932403))

(check-sat (not b!1006911) (not b!1006906) (not b!1006913) (not b!1006910) (not b!1006909) (not b!1006908) (not b!1006914) (not start!86980) (not b!1006912))
(check-sat)
