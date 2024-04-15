; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86406 () Bool)

(assert start!86406)

(declare-fun res!669609 () Bool)

(declare-fun e!563686 () Bool)

(assert (=> start!86406 (=> (not res!669609) (not e!563686))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86406 (= res!669609 (validMask!0 mask!3464))))

(assert (=> start!86406 e!563686))

(declare-datatypes ((array!63154 0))(
  ( (array!63155 (arr!30402 (Array (_ BitVec 32) (_ BitVec 64))) (size!30906 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63154)

(declare-fun array_inv!23545 (array!63154) Bool)

(assert (=> start!86406 (array_inv!23545 a!3219)))

(assert (=> start!86406 true))

(declare-fun b!999999 () Bool)

(declare-fun e!563684 () Bool)

(declare-fun e!563685 () Bool)

(assert (=> b!999999 (= e!563684 e!563685)))

(declare-fun res!669604 () Bool)

(assert (=> b!999999 (=> (not res!669604) (not e!563685))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9359 0))(
  ( (MissingZero!9359 (index!39807 (_ BitVec 32))) (Found!9359 (index!39808 (_ BitVec 32))) (Intermediate!9359 (undefined!10171 Bool) (index!39809 (_ BitVec 32)) (x!87254 (_ BitVec 32))) (Undefined!9359) (MissingVacant!9359 (index!39810 (_ BitVec 32))) )
))
(declare-fun lt!442000 () SeekEntryResult!9359)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63154 (_ BitVec 32)) SeekEntryResult!9359)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999999 (= res!669604 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30402 a!3219) j!170) mask!3464) (select (arr!30402 a!3219) j!170) a!3219 mask!3464) lt!442000))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999999 (= lt!442000 (Intermediate!9359 false resIndex!38 resX!38))))

(declare-fun b!1000000 () Bool)

(declare-fun res!669611 () Bool)

(assert (=> b!1000000 (=> (not res!669611) (not e!563684))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000000 (= res!669611 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30906 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30906 a!3219))))))

(declare-fun b!1000001 () Bool)

(declare-fun res!669601 () Bool)

(assert (=> b!1000001 (=> (not res!669601) (not e!563684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63154 (_ BitVec 32)) Bool)

(assert (=> b!1000001 (= res!669601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000002 () Bool)

(assert (=> b!1000002 (= e!563685 false)))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun lt!441998 () SeekEntryResult!9359)

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1000002 (= lt!441998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30402 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30402 a!3219) i!1194 k0!2224) j!170) (array!63155 (store (arr!30402 a!3219) i!1194 k0!2224) (size!30906 a!3219)) mask!3464))))

(declare-fun b!1000003 () Bool)

(declare-fun res!669605 () Bool)

(assert (=> b!1000003 (=> (not res!669605) (not e!563685))))

(assert (=> b!1000003 (= res!669605 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30402 a!3219) j!170) a!3219 mask!3464) lt!442000))))

(declare-fun b!1000004 () Bool)

(declare-fun res!669610 () Bool)

(assert (=> b!1000004 (=> (not res!669610) (not e!563686))))

(assert (=> b!1000004 (= res!669610 (and (= (size!30906 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30906 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30906 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000005 () Bool)

(declare-fun res!669602 () Bool)

(assert (=> b!1000005 (=> (not res!669602) (not e!563686))))

(declare-fun arrayContainsKey!0 (array!63154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000005 (= res!669602 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000006 () Bool)

(declare-fun res!669606 () Bool)

(assert (=> b!1000006 (=> (not res!669606) (not e!563686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000006 (= res!669606 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000007 () Bool)

(declare-fun res!669608 () Bool)

(assert (=> b!1000007 (=> (not res!669608) (not e!563686))))

(assert (=> b!1000007 (= res!669608 (validKeyInArray!0 (select (arr!30402 a!3219) j!170)))))

(declare-fun b!1000008 () Bool)

(declare-fun res!669603 () Bool)

(assert (=> b!1000008 (=> (not res!669603) (not e!563684))))

(declare-datatypes ((List!21144 0))(
  ( (Nil!21141) (Cons!21140 (h!22317 (_ BitVec 64)) (t!30136 List!21144)) )
))
(declare-fun arrayNoDuplicates!0 (array!63154 (_ BitVec 32) List!21144) Bool)

(assert (=> b!1000008 (= res!669603 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21141))))

(declare-fun b!1000009 () Bool)

(assert (=> b!1000009 (= e!563686 e!563684)))

(declare-fun res!669607 () Bool)

(assert (=> b!1000009 (=> (not res!669607) (not e!563684))))

(declare-fun lt!441999 () SeekEntryResult!9359)

(assert (=> b!1000009 (= res!669607 (or (= lt!441999 (MissingVacant!9359 i!1194)) (= lt!441999 (MissingZero!9359 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63154 (_ BitVec 32)) SeekEntryResult!9359)

(assert (=> b!1000009 (= lt!441999 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86406 res!669609) b!1000004))

(assert (= (and b!1000004 res!669610) b!1000007))

(assert (= (and b!1000007 res!669608) b!1000006))

(assert (= (and b!1000006 res!669606) b!1000005))

(assert (= (and b!1000005 res!669602) b!1000009))

(assert (= (and b!1000009 res!669607) b!1000001))

(assert (= (and b!1000001 res!669601) b!1000008))

(assert (= (and b!1000008 res!669603) b!1000000))

(assert (= (and b!1000000 res!669611) b!999999))

(assert (= (and b!999999 res!669604) b!1000003))

(assert (= (and b!1000003 res!669605) b!1000002))

(declare-fun m!925669 () Bool)

(assert (=> b!999999 m!925669))

(assert (=> b!999999 m!925669))

(declare-fun m!925671 () Bool)

(assert (=> b!999999 m!925671))

(assert (=> b!999999 m!925671))

(assert (=> b!999999 m!925669))

(declare-fun m!925673 () Bool)

(assert (=> b!999999 m!925673))

(assert (=> b!1000003 m!925669))

(assert (=> b!1000003 m!925669))

(declare-fun m!925675 () Bool)

(assert (=> b!1000003 m!925675))

(declare-fun m!925677 () Bool)

(assert (=> b!1000008 m!925677))

(declare-fun m!925679 () Bool)

(assert (=> b!1000005 m!925679))

(declare-fun m!925681 () Bool)

(assert (=> b!1000001 m!925681))

(declare-fun m!925683 () Bool)

(assert (=> b!1000009 m!925683))

(declare-fun m!925685 () Bool)

(assert (=> start!86406 m!925685))

(declare-fun m!925687 () Bool)

(assert (=> start!86406 m!925687))

(assert (=> b!1000007 m!925669))

(assert (=> b!1000007 m!925669))

(declare-fun m!925689 () Bool)

(assert (=> b!1000007 m!925689))

(declare-fun m!925691 () Bool)

(assert (=> b!1000002 m!925691))

(declare-fun m!925693 () Bool)

(assert (=> b!1000002 m!925693))

(assert (=> b!1000002 m!925693))

(declare-fun m!925695 () Bool)

(assert (=> b!1000002 m!925695))

(assert (=> b!1000002 m!925695))

(assert (=> b!1000002 m!925693))

(declare-fun m!925697 () Bool)

(assert (=> b!1000002 m!925697))

(declare-fun m!925699 () Bool)

(assert (=> b!1000006 m!925699))

(check-sat (not b!1000006) (not b!1000002) (not b!1000001) (not b!1000005) (not b!1000008) (not start!86406) (not b!1000003) (not b!999999) (not b!1000007) (not b!1000009))
(check-sat)
