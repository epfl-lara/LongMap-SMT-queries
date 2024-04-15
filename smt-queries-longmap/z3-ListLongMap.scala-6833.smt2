; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86028 () Bool)

(assert start!86028)

(declare-fun b!996343 () Bool)

(declare-fun e!562111 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!996343 (= e!562111 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!996344 () Bool)

(declare-fun res!666589 () Bool)

(declare-fun e!562110 () Bool)

(assert (=> b!996344 (=> (not res!666589) (not e!562110))))

(declare-datatypes ((array!62980 0))(
  ( (array!62981 (arr!30321 (Array (_ BitVec 32) (_ BitVec 64))) (size!30825 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62980)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996344 (= res!666589 (and (= (size!30825 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30825 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30825 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996345 () Bool)

(declare-fun res!666583 () Bool)

(assert (=> b!996345 (=> (not res!666583) (not e!562110))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996345 (= res!666583 (validKeyInArray!0 k0!2224))))

(declare-fun res!666587 () Bool)

(assert (=> start!86028 (=> (not res!666587) (not e!562110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86028 (= res!666587 (validMask!0 mask!3464))))

(assert (=> start!86028 e!562110))

(declare-fun array_inv!23464 (array!62980) Bool)

(assert (=> start!86028 (array_inv!23464 a!3219)))

(assert (=> start!86028 true))

(declare-fun b!996346 () Bool)

(declare-fun res!666584 () Bool)

(assert (=> b!996346 (=> (not res!666584) (not e!562111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62980 (_ BitVec 32)) Bool)

(assert (=> b!996346 (= res!666584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996347 () Bool)

(declare-fun res!666590 () Bool)

(assert (=> b!996347 (=> (not res!666590) (not e!562111))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9278 0))(
  ( (MissingZero!9278 (index!39483 (_ BitVec 32))) (Found!9278 (index!39484 (_ BitVec 32))) (Intermediate!9278 (undefined!10090 Bool) (index!39485 (_ BitVec 32)) (x!86933 (_ BitVec 32))) (Undefined!9278) (MissingVacant!9278 (index!39486 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62980 (_ BitVec 32)) SeekEntryResult!9278)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996347 (= res!666590 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30321 a!3219) j!170) mask!3464) (select (arr!30321 a!3219) j!170) a!3219 mask!3464) (Intermediate!9278 false resIndex!38 resX!38)))))

(declare-fun b!996348 () Bool)

(declare-fun res!666586 () Bool)

(assert (=> b!996348 (=> (not res!666586) (not e!562111))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!996348 (= res!666586 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30825 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30825 a!3219))))))

(declare-fun b!996349 () Bool)

(declare-fun res!666585 () Bool)

(assert (=> b!996349 (=> (not res!666585) (not e!562110))))

(assert (=> b!996349 (= res!666585 (validKeyInArray!0 (select (arr!30321 a!3219) j!170)))))

(declare-fun b!996350 () Bool)

(declare-fun res!666588 () Bool)

(assert (=> b!996350 (=> (not res!666588) (not e!562111))))

(declare-datatypes ((List!21063 0))(
  ( (Nil!21060) (Cons!21059 (h!22224 (_ BitVec 64)) (t!30055 List!21063)) )
))
(declare-fun arrayNoDuplicates!0 (array!62980 (_ BitVec 32) List!21063) Bool)

(assert (=> b!996350 (= res!666588 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21060))))

(declare-fun b!996351 () Bool)

(declare-fun res!666581 () Bool)

(assert (=> b!996351 (=> (not res!666581) (not e!562110))))

(declare-fun arrayContainsKey!0 (array!62980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996351 (= res!666581 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996352 () Bool)

(assert (=> b!996352 (= e!562110 e!562111)))

(declare-fun res!666582 () Bool)

(assert (=> b!996352 (=> (not res!666582) (not e!562111))))

(declare-fun lt!441028 () SeekEntryResult!9278)

(assert (=> b!996352 (= res!666582 (or (= lt!441028 (MissingVacant!9278 i!1194)) (= lt!441028 (MissingZero!9278 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62980 (_ BitVec 32)) SeekEntryResult!9278)

(assert (=> b!996352 (= lt!441028 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86028 res!666587) b!996344))

(assert (= (and b!996344 res!666589) b!996349))

(assert (= (and b!996349 res!666585) b!996345))

(assert (= (and b!996345 res!666583) b!996351))

(assert (= (and b!996351 res!666581) b!996352))

(assert (= (and b!996352 res!666582) b!996346))

(assert (= (and b!996346 res!666584) b!996350))

(assert (= (and b!996350 res!666588) b!996348))

(assert (= (and b!996348 res!666586) b!996347))

(assert (= (and b!996347 res!666590) b!996343))

(declare-fun m!922921 () Bool)

(assert (=> b!996351 m!922921))

(declare-fun m!922923 () Bool)

(assert (=> b!996349 m!922923))

(assert (=> b!996349 m!922923))

(declare-fun m!922925 () Bool)

(assert (=> b!996349 m!922925))

(declare-fun m!922927 () Bool)

(assert (=> b!996345 m!922927))

(declare-fun m!922929 () Bool)

(assert (=> b!996346 m!922929))

(declare-fun m!922931 () Bool)

(assert (=> start!86028 m!922931))

(declare-fun m!922933 () Bool)

(assert (=> start!86028 m!922933))

(declare-fun m!922935 () Bool)

(assert (=> b!996350 m!922935))

(declare-fun m!922937 () Bool)

(assert (=> b!996352 m!922937))

(assert (=> b!996347 m!922923))

(assert (=> b!996347 m!922923))

(declare-fun m!922939 () Bool)

(assert (=> b!996347 m!922939))

(assert (=> b!996347 m!922939))

(assert (=> b!996347 m!922923))

(declare-fun m!922941 () Bool)

(assert (=> b!996347 m!922941))

(check-sat (not start!86028) (not b!996347) (not b!996346) (not b!996349) (not b!996345) (not b!996351) (not b!996352) (not b!996350))
(check-sat)
