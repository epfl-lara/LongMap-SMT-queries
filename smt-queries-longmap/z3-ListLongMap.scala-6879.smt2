; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86520 () Bool)

(assert start!86520)

(declare-fun b!1002403 () Bool)

(declare-fun e!564686 () Bool)

(declare-fun e!564682 () Bool)

(assert (=> b!1002403 (= e!564686 e!564682)))

(declare-fun res!672017 () Bool)

(assert (=> b!1002403 (=> (not res!672017) (not e!564682))))

(declare-datatypes ((SeekEntryResult!9416 0))(
  ( (MissingZero!9416 (index!40035 (_ BitVec 32))) (Found!9416 (index!40036 (_ BitVec 32))) (Intermediate!9416 (undefined!10228 Bool) (index!40037 (_ BitVec 32)) (x!87463 (_ BitVec 32))) (Undefined!9416) (MissingVacant!9416 (index!40038 (_ BitVec 32))) )
))
(declare-fun lt!443038 () SeekEntryResult!9416)

(declare-fun lt!443039 () SeekEntryResult!9416)

(assert (=> b!1002403 (= res!672017 (= lt!443038 lt!443039))))

(declare-datatypes ((array!63268 0))(
  ( (array!63269 (arr!30459 (Array (_ BitVec 32) (_ BitVec 64))) (size!30963 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63268)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63268 (_ BitVec 32)) SeekEntryResult!9416)

(assert (=> b!1002403 (= lt!443038 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30459 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002404 () Bool)

(declare-fun res!672016 () Bool)

(declare-fun e!564680 () Bool)

(assert (=> b!1002404 (=> (not res!672016) (not e!564680))))

(declare-fun lt!443041 () array!63268)

(declare-fun lt!443040 () (_ BitVec 64))

(assert (=> b!1002404 (= res!672016 (not (= lt!443038 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443040 lt!443041 mask!3464))))))

(declare-fun b!1002405 () Bool)

(declare-fun res!672019 () Bool)

(declare-fun e!564684 () Bool)

(assert (=> b!1002405 (=> (not res!672019) (not e!564684))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002405 (= res!672019 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30963 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30963 a!3219))))))

(declare-fun res!672011 () Bool)

(declare-fun e!564685 () Bool)

(assert (=> start!86520 (=> (not res!672011) (not e!564685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86520 (= res!672011 (validMask!0 mask!3464))))

(assert (=> start!86520 e!564685))

(declare-fun array_inv!23602 (array!63268) Bool)

(assert (=> start!86520 (array_inv!23602 a!3219)))

(assert (=> start!86520 true))

(declare-fun b!1002406 () Bool)

(declare-fun res!672007 () Bool)

(assert (=> b!1002406 (=> (not res!672007) (not e!564685))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002406 (= res!672007 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002407 () Bool)

(declare-fun res!672014 () Bool)

(assert (=> b!1002407 (=> (not res!672014) (not e!564684))))

(declare-datatypes ((List!21201 0))(
  ( (Nil!21198) (Cons!21197 (h!22374 (_ BitVec 64)) (t!30193 List!21201)) )
))
(declare-fun arrayNoDuplicates!0 (array!63268 (_ BitVec 32) List!21201) Bool)

(assert (=> b!1002407 (= res!672014 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21198))))

(declare-fun b!1002408 () Bool)

(declare-fun e!564683 () Bool)

(assert (=> b!1002408 (= e!564683 false)))

(declare-fun lt!443035 () (_ BitVec 32))

(declare-fun lt!443037 () SeekEntryResult!9416)

(assert (=> b!1002408 (= lt!443037 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443035 lt!443040 lt!443041 mask!3464))))

(declare-fun b!1002409 () Bool)

(declare-fun res!672018 () Bool)

(assert (=> b!1002409 (=> (not res!672018) (not e!564685))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002409 (= res!672018 (and (= (size!30963 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30963 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30963 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002410 () Bool)

(declare-fun res!672008 () Bool)

(assert (=> b!1002410 (=> (not res!672008) (not e!564685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002410 (= res!672008 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002411 () Bool)

(assert (=> b!1002411 (= e!564682 e!564680)))

(declare-fun res!672012 () Bool)

(assert (=> b!1002411 (=> (not res!672012) (not e!564680))))

(declare-fun lt!443036 () SeekEntryResult!9416)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002411 (= res!672012 (not (= lt!443036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443040 mask!3464) lt!443040 lt!443041 mask!3464))))))

(assert (=> b!1002411 (= lt!443040 (select (store (arr!30459 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002411 (= lt!443041 (array!63269 (store (arr!30459 a!3219) i!1194 k0!2224) (size!30963 a!3219)))))

(declare-fun b!1002412 () Bool)

(assert (=> b!1002412 (= e!564685 e!564684)))

(declare-fun res!672020 () Bool)

(assert (=> b!1002412 (=> (not res!672020) (not e!564684))))

(declare-fun lt!443034 () SeekEntryResult!9416)

(assert (=> b!1002412 (= res!672020 (or (= lt!443034 (MissingVacant!9416 i!1194)) (= lt!443034 (MissingZero!9416 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63268 (_ BitVec 32)) SeekEntryResult!9416)

(assert (=> b!1002412 (= lt!443034 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002413 () Bool)

(assert (=> b!1002413 (= e!564680 e!564683)))

(declare-fun res!672015 () Bool)

(assert (=> b!1002413 (=> (not res!672015) (not e!564683))))

(assert (=> b!1002413 (= res!672015 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443035 #b00000000000000000000000000000000) (bvslt lt!443035 (size!30963 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002413 (= lt!443035 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002414 () Bool)

(declare-fun res!672009 () Bool)

(assert (=> b!1002414 (=> (not res!672009) (not e!564683))))

(assert (=> b!1002414 (= res!672009 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443035 (select (arr!30459 a!3219) j!170) a!3219 mask!3464) lt!443039))))

(declare-fun b!1002415 () Bool)

(declare-fun res!672005 () Bool)

(assert (=> b!1002415 (=> (not res!672005) (not e!564685))))

(assert (=> b!1002415 (= res!672005 (validKeyInArray!0 (select (arr!30459 a!3219) j!170)))))

(declare-fun b!1002416 () Bool)

(declare-fun res!672013 () Bool)

(assert (=> b!1002416 (=> (not res!672013) (not e!564680))))

(assert (=> b!1002416 (= res!672013 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002417 () Bool)

(assert (=> b!1002417 (= e!564684 e!564686)))

(declare-fun res!672006 () Bool)

(assert (=> b!1002417 (=> (not res!672006) (not e!564686))))

(assert (=> b!1002417 (= res!672006 (= lt!443036 lt!443039))))

(assert (=> b!1002417 (= lt!443039 (Intermediate!9416 false resIndex!38 resX!38))))

(assert (=> b!1002417 (= lt!443036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30459 a!3219) j!170) mask!3464) (select (arr!30459 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002418 () Bool)

(declare-fun res!672010 () Bool)

(assert (=> b!1002418 (=> (not res!672010) (not e!564684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63268 (_ BitVec 32)) Bool)

(assert (=> b!1002418 (= res!672010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86520 res!672011) b!1002409))

(assert (= (and b!1002409 res!672018) b!1002415))

(assert (= (and b!1002415 res!672005) b!1002410))

(assert (= (and b!1002410 res!672008) b!1002406))

(assert (= (and b!1002406 res!672007) b!1002412))

(assert (= (and b!1002412 res!672020) b!1002418))

(assert (= (and b!1002418 res!672010) b!1002407))

(assert (= (and b!1002407 res!672014) b!1002405))

(assert (= (and b!1002405 res!672019) b!1002417))

(assert (= (and b!1002417 res!672006) b!1002403))

(assert (= (and b!1002403 res!672017) b!1002411))

(assert (= (and b!1002411 res!672012) b!1002404))

(assert (= (and b!1002404 res!672016) b!1002416))

(assert (= (and b!1002416 res!672013) b!1002413))

(assert (= (and b!1002413 res!672015) b!1002414))

(assert (= (and b!1002414 res!672009) b!1002408))

(declare-fun m!927739 () Bool)

(assert (=> b!1002414 m!927739))

(assert (=> b!1002414 m!927739))

(declare-fun m!927741 () Bool)

(assert (=> b!1002414 m!927741))

(declare-fun m!927743 () Bool)

(assert (=> b!1002410 m!927743))

(assert (=> b!1002403 m!927739))

(assert (=> b!1002403 m!927739))

(declare-fun m!927745 () Bool)

(assert (=> b!1002403 m!927745))

(declare-fun m!927747 () Bool)

(assert (=> b!1002408 m!927747))

(declare-fun m!927749 () Bool)

(assert (=> b!1002413 m!927749))

(declare-fun m!927751 () Bool)

(assert (=> b!1002411 m!927751))

(assert (=> b!1002411 m!927751))

(declare-fun m!927753 () Bool)

(assert (=> b!1002411 m!927753))

(declare-fun m!927755 () Bool)

(assert (=> b!1002411 m!927755))

(declare-fun m!927757 () Bool)

(assert (=> b!1002411 m!927757))

(declare-fun m!927759 () Bool)

(assert (=> b!1002406 m!927759))

(declare-fun m!927761 () Bool)

(assert (=> b!1002407 m!927761))

(declare-fun m!927763 () Bool)

(assert (=> b!1002418 m!927763))

(assert (=> b!1002417 m!927739))

(assert (=> b!1002417 m!927739))

(declare-fun m!927765 () Bool)

(assert (=> b!1002417 m!927765))

(assert (=> b!1002417 m!927765))

(assert (=> b!1002417 m!927739))

(declare-fun m!927767 () Bool)

(assert (=> b!1002417 m!927767))

(assert (=> b!1002415 m!927739))

(assert (=> b!1002415 m!927739))

(declare-fun m!927769 () Bool)

(assert (=> b!1002415 m!927769))

(declare-fun m!927771 () Bool)

(assert (=> b!1002404 m!927771))

(declare-fun m!927773 () Bool)

(assert (=> b!1002412 m!927773))

(declare-fun m!927775 () Bool)

(assert (=> start!86520 m!927775))

(declare-fun m!927777 () Bool)

(assert (=> start!86520 m!927777))

(check-sat (not b!1002418) (not b!1002403) (not b!1002410) (not b!1002406) (not b!1002415) (not b!1002404) (not b!1002417) (not b!1002411) (not b!1002407) (not start!86520) (not b!1002408) (not b!1002413) (not b!1002414) (not b!1002412))
(check-sat)
