; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86022 () Bool)

(assert start!86022)

(declare-fun b!996261 () Bool)

(declare-fun res!666499 () Bool)

(declare-fun e!562083 () Bool)

(assert (=> b!996261 (=> (not res!666499) (not e!562083))))

(declare-datatypes ((array!62974 0))(
  ( (array!62975 (arr!30318 (Array (_ BitVec 32) (_ BitVec 64))) (size!30822 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62974)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996261 (= res!666499 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996262 () Bool)

(declare-fun res!666503 () Bool)

(declare-fun e!562084 () Bool)

(assert (=> b!996262 (=> (not res!666503) (not e!562084))))

(declare-datatypes ((List!21060 0))(
  ( (Nil!21057) (Cons!21056 (h!22221 (_ BitVec 64)) (t!30052 List!21060)) )
))
(declare-fun arrayNoDuplicates!0 (array!62974 (_ BitVec 32) List!21060) Bool)

(assert (=> b!996262 (= res!666503 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21057))))

(declare-fun b!996263 () Bool)

(declare-fun res!666505 () Bool)

(assert (=> b!996263 (=> (not res!666505) (not e!562084))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62974 (_ BitVec 32)) Bool)

(assert (=> b!996263 (= res!666505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996264 () Bool)

(declare-fun res!666500 () Bool)

(assert (=> b!996264 (=> (not res!666500) (not e!562083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996264 (= res!666500 (validKeyInArray!0 k0!2224))))

(declare-fun b!996265 () Bool)

(assert (=> b!996265 (= e!562083 e!562084)))

(declare-fun res!666502 () Bool)

(assert (=> b!996265 (=> (not res!666502) (not e!562084))))

(declare-datatypes ((SeekEntryResult!9275 0))(
  ( (MissingZero!9275 (index!39471 (_ BitVec 32))) (Found!9275 (index!39472 (_ BitVec 32))) (Intermediate!9275 (undefined!10087 Bool) (index!39473 (_ BitVec 32)) (x!86922 (_ BitVec 32))) (Undefined!9275) (MissingVacant!9275 (index!39474 (_ BitVec 32))) )
))
(declare-fun lt!441013 () SeekEntryResult!9275)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996265 (= res!666502 (or (= lt!441013 (MissingVacant!9275 i!1194)) (= lt!441013 (MissingZero!9275 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62974 (_ BitVec 32)) SeekEntryResult!9275)

(assert (=> b!996265 (= lt!441013 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996266 () Bool)

(declare-fun res!666501 () Bool)

(assert (=> b!996266 (=> (not res!666501) (not e!562083))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996266 (= res!666501 (and (= (size!30822 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30822 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30822 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996267 () Bool)

(declare-fun res!666506 () Bool)

(assert (=> b!996267 (=> (not res!666506) (not e!562083))))

(assert (=> b!996267 (= res!666506 (validKeyInArray!0 (select (arr!30318 a!3219) j!170)))))

(declare-fun b!996268 () Bool)

(declare-fun res!666498 () Bool)

(assert (=> b!996268 (=> (not res!666498) (not e!562084))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996268 (= res!666498 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30822 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30822 a!3219))))))

(declare-fun res!666504 () Bool)

(assert (=> start!86022 (=> (not res!666504) (not e!562083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86022 (= res!666504 (validMask!0 mask!3464))))

(assert (=> start!86022 e!562083))

(declare-fun array_inv!23461 (array!62974) Bool)

(assert (=> start!86022 (array_inv!23461 a!3219)))

(assert (=> start!86022 true))

(declare-fun b!996260 () Bool)

(assert (=> b!996260 (= e!562084 false)))

(declare-fun lt!441012 () SeekEntryResult!9275)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62974 (_ BitVec 32)) SeekEntryResult!9275)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996260 (= lt!441012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30318 a!3219) j!170) mask!3464) (select (arr!30318 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86022 res!666504) b!996266))

(assert (= (and b!996266 res!666501) b!996267))

(assert (= (and b!996267 res!666506) b!996264))

(assert (= (and b!996264 res!666500) b!996261))

(assert (= (and b!996261 res!666499) b!996265))

(assert (= (and b!996265 res!666502) b!996263))

(assert (= (and b!996263 res!666505) b!996262))

(assert (= (and b!996262 res!666503) b!996268))

(assert (= (and b!996268 res!666498) b!996260))

(declare-fun m!922855 () Bool)

(assert (=> b!996261 m!922855))

(declare-fun m!922857 () Bool)

(assert (=> b!996260 m!922857))

(assert (=> b!996260 m!922857))

(declare-fun m!922859 () Bool)

(assert (=> b!996260 m!922859))

(assert (=> b!996260 m!922859))

(assert (=> b!996260 m!922857))

(declare-fun m!922861 () Bool)

(assert (=> b!996260 m!922861))

(declare-fun m!922863 () Bool)

(assert (=> b!996264 m!922863))

(declare-fun m!922865 () Bool)

(assert (=> b!996265 m!922865))

(declare-fun m!922867 () Bool)

(assert (=> start!86022 m!922867))

(declare-fun m!922869 () Bool)

(assert (=> start!86022 m!922869))

(declare-fun m!922871 () Bool)

(assert (=> b!996263 m!922871))

(declare-fun m!922873 () Bool)

(assert (=> b!996262 m!922873))

(assert (=> b!996267 m!922857))

(assert (=> b!996267 m!922857))

(declare-fun m!922875 () Bool)

(assert (=> b!996267 m!922875))

(check-sat (not start!86022) (not b!996260) (not b!996262) (not b!996267) (not b!996261) (not b!996264) (not b!996265) (not b!996263))
(check-sat)
