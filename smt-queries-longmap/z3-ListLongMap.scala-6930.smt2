; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87430 () Bool)

(assert start!87430)

(declare-fun b!1012184 () Bool)

(declare-fun e!569536 () Bool)

(declare-fun e!569537 () Bool)

(assert (=> b!1012184 (= e!569536 e!569537)))

(declare-fun res!679557 () Bool)

(assert (=> b!1012184 (=> (not res!679557) (not e!569537))))

(declare-datatypes ((SeekEntryResult!9529 0))(
  ( (MissingZero!9529 (index!40487 (_ BitVec 32))) (Found!9529 (index!40488 (_ BitVec 32))) (Intermediate!9529 (undefined!10341 Bool) (index!40489 (_ BitVec 32)) (x!88060 (_ BitVec 32))) (Undefined!9529) (MissingVacant!9529 (index!40490 (_ BitVec 32))) )
))
(declare-fun lt!447284 () SeekEntryResult!9529)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1012184 (= res!679557 (or (= lt!447284 (MissingVacant!9529 i!1194)) (= lt!447284 (MissingZero!9529 i!1194))))))

(declare-datatypes ((array!63702 0))(
  ( (array!63703 (arr!30661 (Array (_ BitVec 32) (_ BitVec 64))) (size!31164 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63702)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63702 (_ BitVec 32)) SeekEntryResult!9529)

(assert (=> b!1012184 (= lt!447284 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1012185 () Bool)

(declare-fun res!679555 () Bool)

(assert (=> b!1012185 (=> (not res!679555) (not e!569537))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1012185 (= res!679555 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31164 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31164 a!3219))))))

(declare-fun b!1012186 () Bool)

(declare-fun res!679562 () Bool)

(declare-fun e!569541 () Bool)

(assert (=> b!1012186 (=> (not res!679562) (not e!569541))))

(assert (=> b!1012186 (= res!679562 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1012187 () Bool)

(declare-fun e!569538 () Bool)

(assert (=> b!1012187 (= e!569538 e!569541)))

(declare-fun res!679548 () Bool)

(assert (=> b!1012187 (=> (not res!679548) (not e!569541))))

(declare-fun lt!447285 () SeekEntryResult!9529)

(declare-fun lt!447287 () (_ BitVec 64))

(declare-fun lt!447286 () array!63702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63702 (_ BitVec 32)) SeekEntryResult!9529)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1012187 (= res!679548 (not (= lt!447285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447287 mask!3464) lt!447287 lt!447286 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1012187 (= lt!447287 (select (store (arr!30661 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1012187 (= lt!447286 (array!63703 (store (arr!30661 a!3219) i!1194 k0!2224) (size!31164 a!3219)))))

(declare-fun b!1012188 () Bool)

(declare-fun res!679550 () Bool)

(assert (=> b!1012188 (=> (not res!679550) (not e!569536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1012188 (= res!679550 (validKeyInArray!0 k0!2224))))

(declare-fun b!1012189 () Bool)

(declare-fun res!679552 () Bool)

(assert (=> b!1012189 (=> (not res!679552) (not e!569536))))

(declare-fun arrayContainsKey!0 (array!63702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1012189 (= res!679552 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1012190 () Bool)

(declare-fun e!569535 () Bool)

(assert (=> b!1012190 (= e!569535 e!569538)))

(declare-fun res!679549 () Bool)

(assert (=> b!1012190 (=> (not res!679549) (not e!569538))))

(declare-fun lt!447283 () SeekEntryResult!9529)

(declare-fun lt!447282 () SeekEntryResult!9529)

(assert (=> b!1012190 (= res!679549 (= lt!447283 lt!447282))))

(assert (=> b!1012190 (= lt!447283 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30661 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012191 () Bool)

(declare-fun e!569539 () Bool)

(assert (=> b!1012191 (= e!569539 false)))

(declare-fun lt!447280 () (_ BitVec 32))

(declare-fun lt!447281 () SeekEntryResult!9529)

(assert (=> b!1012191 (= lt!447281 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447280 (select (arr!30661 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012193 () Bool)

(assert (=> b!1012193 (= e!569541 e!569539)))

(declare-fun res!679554 () Bool)

(assert (=> b!1012193 (=> (not res!679554) (not e!569539))))

(assert (=> b!1012193 (= res!679554 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447280 #b00000000000000000000000000000000) (bvslt lt!447280 (size!31164 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1012193 (= lt!447280 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1012194 () Bool)

(assert (=> b!1012194 (= e!569537 e!569535)))

(declare-fun res!679559 () Bool)

(assert (=> b!1012194 (=> (not res!679559) (not e!569535))))

(assert (=> b!1012194 (= res!679559 (= lt!447285 lt!447282))))

(assert (=> b!1012194 (= lt!447282 (Intermediate!9529 false resIndex!38 resX!38))))

(assert (=> b!1012194 (= lt!447285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30661 a!3219) j!170) mask!3464) (select (arr!30661 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012195 () Bool)

(declare-fun res!679558 () Bool)

(assert (=> b!1012195 (=> (not res!679558) (not e!569536))))

(assert (=> b!1012195 (= res!679558 (and (= (size!31164 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31164 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31164 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1012196 () Bool)

(declare-fun res!679560 () Bool)

(assert (=> b!1012196 (=> (not res!679560) (not e!569541))))

(assert (=> b!1012196 (= res!679560 (not (= lt!447283 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447287 lt!447286 mask!3464))))))

(declare-fun b!1012197 () Bool)

(declare-fun res!679551 () Bool)

(assert (=> b!1012197 (=> (not res!679551) (not e!569537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63702 (_ BitVec 32)) Bool)

(assert (=> b!1012197 (= res!679551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1012198 () Bool)

(declare-fun res!679556 () Bool)

(assert (=> b!1012198 (=> (not res!679556) (not e!569536))))

(assert (=> b!1012198 (= res!679556 (validKeyInArray!0 (select (arr!30661 a!3219) j!170)))))

(declare-fun res!679561 () Bool)

(assert (=> start!87430 (=> (not res!679561) (not e!569536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87430 (= res!679561 (validMask!0 mask!3464))))

(assert (=> start!87430 e!569536))

(declare-fun array_inv!23797 (array!63702) Bool)

(assert (=> start!87430 (array_inv!23797 a!3219)))

(assert (=> start!87430 true))

(declare-fun b!1012192 () Bool)

(declare-fun res!679553 () Bool)

(assert (=> b!1012192 (=> (not res!679553) (not e!569537))))

(declare-datatypes ((List!21308 0))(
  ( (Nil!21305) (Cons!21304 (h!22508 (_ BitVec 64)) (t!30301 List!21308)) )
))
(declare-fun arrayNoDuplicates!0 (array!63702 (_ BitVec 32) List!21308) Bool)

(assert (=> b!1012192 (= res!679553 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21305))))

(assert (= (and start!87430 res!679561) b!1012195))

(assert (= (and b!1012195 res!679558) b!1012198))

(assert (= (and b!1012198 res!679556) b!1012188))

(assert (= (and b!1012188 res!679550) b!1012189))

(assert (= (and b!1012189 res!679552) b!1012184))

(assert (= (and b!1012184 res!679557) b!1012197))

(assert (= (and b!1012197 res!679551) b!1012192))

(assert (= (and b!1012192 res!679553) b!1012185))

(assert (= (and b!1012185 res!679555) b!1012194))

(assert (= (and b!1012194 res!679559) b!1012190))

(assert (= (and b!1012190 res!679549) b!1012187))

(assert (= (and b!1012187 res!679548) b!1012196))

(assert (= (and b!1012196 res!679560) b!1012186))

(assert (= (and b!1012186 res!679562) b!1012193))

(assert (= (and b!1012193 res!679554) b!1012191))

(declare-fun m!936671 () Bool)

(assert (=> b!1012192 m!936671))

(declare-fun m!936673 () Bool)

(assert (=> b!1012191 m!936673))

(assert (=> b!1012191 m!936673))

(declare-fun m!936675 () Bool)

(assert (=> b!1012191 m!936675))

(declare-fun m!936677 () Bool)

(assert (=> start!87430 m!936677))

(declare-fun m!936679 () Bool)

(assert (=> start!87430 m!936679))

(assert (=> b!1012198 m!936673))

(assert (=> b!1012198 m!936673))

(declare-fun m!936681 () Bool)

(assert (=> b!1012198 m!936681))

(declare-fun m!936683 () Bool)

(assert (=> b!1012193 m!936683))

(declare-fun m!936685 () Bool)

(assert (=> b!1012196 m!936685))

(declare-fun m!936687 () Bool)

(assert (=> b!1012184 m!936687))

(declare-fun m!936689 () Bool)

(assert (=> b!1012197 m!936689))

(declare-fun m!936691 () Bool)

(assert (=> b!1012188 m!936691))

(declare-fun m!936693 () Bool)

(assert (=> b!1012187 m!936693))

(assert (=> b!1012187 m!936693))

(declare-fun m!936695 () Bool)

(assert (=> b!1012187 m!936695))

(declare-fun m!936697 () Bool)

(assert (=> b!1012187 m!936697))

(declare-fun m!936699 () Bool)

(assert (=> b!1012187 m!936699))

(declare-fun m!936701 () Bool)

(assert (=> b!1012189 m!936701))

(assert (=> b!1012194 m!936673))

(assert (=> b!1012194 m!936673))

(declare-fun m!936703 () Bool)

(assert (=> b!1012194 m!936703))

(assert (=> b!1012194 m!936703))

(assert (=> b!1012194 m!936673))

(declare-fun m!936705 () Bool)

(assert (=> b!1012194 m!936705))

(assert (=> b!1012190 m!936673))

(assert (=> b!1012190 m!936673))

(declare-fun m!936707 () Bool)

(assert (=> b!1012190 m!936707))

(check-sat (not b!1012184) (not b!1012198) (not b!1012196) (not b!1012192) (not b!1012191) (not b!1012187) (not b!1012197) (not b!1012194) (not b!1012188) (not b!1012189) (not start!87430) (not b!1012190) (not b!1012193))
(check-sat)
