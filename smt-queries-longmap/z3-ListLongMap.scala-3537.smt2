; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48780 () Bool)

(assert start!48780)

(declare-fun b!536653 () Bool)

(declare-fun res!332010 () Bool)

(declare-fun e!311427 () Bool)

(assert (=> b!536653 (=> (not res!332010) (not e!311427))))

(declare-datatypes ((array!34002 0))(
  ( (array!34003 (arr!16340 (Array (_ BitVec 32) (_ BitVec 64))) (size!16705 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34002)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34002 (_ BitVec 32)) Bool)

(assert (=> b!536653 (= res!332010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!332003 () Bool)

(declare-fun e!311426 () Bool)

(assert (=> start!48780 (=> (not res!332003) (not e!311426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48780 (= res!332003 (validMask!0 mask!3216))))

(assert (=> start!48780 e!311426))

(assert (=> start!48780 true))

(declare-fun array_inv!12223 (array!34002) Bool)

(assert (=> start!48780 (array_inv!12223 a!3154)))

(declare-fun b!536654 () Bool)

(declare-fun e!311428 () Bool)

(declare-fun e!311429 () Bool)

(assert (=> b!536654 (= e!311428 e!311429)))

(declare-fun res!332000 () Bool)

(assert (=> b!536654 (=> (not res!332000) (not e!311429))))

(declare-fun lt!246011 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536654 (= res!332000 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246011 #b00000000000000000000000000000000) (bvslt lt!246011 (size!16705 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536654 (= lt!246011 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536655 () Bool)

(declare-fun res!332009 () Bool)

(assert (=> b!536655 (=> (not res!332009) (not e!311426))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536655 (= res!332009 (and (= (size!16705 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16705 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16705 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536656 () Bool)

(assert (=> b!536656 (= e!311429 false)))

(declare-datatypes ((SeekEntryResult!4795 0))(
  ( (MissingZero!4795 (index!21404 (_ BitVec 32))) (Found!4795 (index!21405 (_ BitVec 32))) (Intermediate!4795 (undefined!5607 Bool) (index!21406 (_ BitVec 32)) (x!50349 (_ BitVec 32))) (Undefined!4795) (MissingVacant!4795 (index!21407 (_ BitVec 32))) )
))
(declare-fun lt!246012 () SeekEntryResult!4795)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34002 (_ BitVec 32)) SeekEntryResult!4795)

(assert (=> b!536656 (= lt!246012 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246011 (select (arr!16340 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536657 () Bool)

(declare-fun res!332004 () Bool)

(assert (=> b!536657 (=> (not res!332004) (not e!311426))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536657 (= res!332004 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536658 () Bool)

(assert (=> b!536658 (= e!311426 e!311427)))

(declare-fun res!332007 () Bool)

(assert (=> b!536658 (=> (not res!332007) (not e!311427))))

(declare-fun lt!246010 () SeekEntryResult!4795)

(assert (=> b!536658 (= res!332007 (or (= lt!246010 (MissingZero!4795 i!1153)) (= lt!246010 (MissingVacant!4795 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34002 (_ BitVec 32)) SeekEntryResult!4795)

(assert (=> b!536658 (= lt!246010 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536659 () Bool)

(declare-fun res!332005 () Bool)

(assert (=> b!536659 (=> (not res!332005) (not e!311427))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536659 (= res!332005 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16705 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16705 a!3154)) (= (select (arr!16340 a!3154) resIndex!32) (select (arr!16340 a!3154) j!147))))))

(declare-fun b!536660 () Bool)

(declare-fun res!332006 () Bool)

(assert (=> b!536660 (=> (not res!332006) (not e!311426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536660 (= res!332006 (validKeyInArray!0 k0!1998))))

(declare-fun b!536661 () Bool)

(declare-fun res!332002 () Bool)

(assert (=> b!536661 (=> (not res!332002) (not e!311426))))

(assert (=> b!536661 (= res!332002 (validKeyInArray!0 (select (arr!16340 a!3154) j!147)))))

(declare-fun b!536662 () Bool)

(declare-fun res!332001 () Bool)

(assert (=> b!536662 (=> (not res!332001) (not e!311427))))

(declare-datatypes ((List!10498 0))(
  ( (Nil!10495) (Cons!10494 (h!11437 (_ BitVec 64)) (t!16717 List!10498)) )
))
(declare-fun arrayNoDuplicates!0 (array!34002 (_ BitVec 32) List!10498) Bool)

(assert (=> b!536662 (= res!332001 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10495))))

(declare-fun b!536663 () Bool)

(assert (=> b!536663 (= e!311427 e!311428)))

(declare-fun res!332012 () Bool)

(assert (=> b!536663 (=> (not res!332012) (not e!311428))))

(declare-fun lt!246013 () SeekEntryResult!4795)

(assert (=> b!536663 (= res!332012 (= lt!246013 (Intermediate!4795 false resIndex!32 resX!32)))))

(assert (=> b!536663 (= lt!246013 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16340 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536664 () Bool)

(declare-fun res!332011 () Bool)

(assert (=> b!536664 (=> (not res!332011) (not e!311428))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536664 (= res!332011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16340 a!3154) j!147) mask!3216) (select (arr!16340 a!3154) j!147) a!3154 mask!3216) lt!246013))))

(declare-fun b!536665 () Bool)

(declare-fun res!332008 () Bool)

(assert (=> b!536665 (=> (not res!332008) (not e!311428))))

(assert (=> b!536665 (= res!332008 (and (not (= (select (arr!16340 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16340 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16340 a!3154) index!1177) (select (arr!16340 a!3154) j!147)))))))

(assert (= (and start!48780 res!332003) b!536655))

(assert (= (and b!536655 res!332009) b!536661))

(assert (= (and b!536661 res!332002) b!536660))

(assert (= (and b!536660 res!332006) b!536657))

(assert (= (and b!536657 res!332004) b!536658))

(assert (= (and b!536658 res!332007) b!536653))

(assert (= (and b!536653 res!332010) b!536662))

(assert (= (and b!536662 res!332001) b!536659))

(assert (= (and b!536659 res!332005) b!536663))

(assert (= (and b!536663 res!332012) b!536664))

(assert (= (and b!536664 res!332011) b!536665))

(assert (= (and b!536665 res!332008) b!536654))

(assert (= (and b!536654 res!332000) b!536656))

(declare-fun m!515497 () Bool)

(assert (=> b!536660 m!515497))

(declare-fun m!515499 () Bool)

(assert (=> b!536659 m!515499))

(declare-fun m!515501 () Bool)

(assert (=> b!536659 m!515501))

(declare-fun m!515503 () Bool)

(assert (=> b!536654 m!515503))

(assert (=> b!536661 m!515501))

(assert (=> b!536661 m!515501))

(declare-fun m!515505 () Bool)

(assert (=> b!536661 m!515505))

(declare-fun m!515507 () Bool)

(assert (=> b!536658 m!515507))

(declare-fun m!515509 () Bool)

(assert (=> b!536662 m!515509))

(declare-fun m!515511 () Bool)

(assert (=> b!536657 m!515511))

(assert (=> b!536656 m!515501))

(assert (=> b!536656 m!515501))

(declare-fun m!515513 () Bool)

(assert (=> b!536656 m!515513))

(assert (=> b!536663 m!515501))

(assert (=> b!536663 m!515501))

(declare-fun m!515515 () Bool)

(assert (=> b!536663 m!515515))

(declare-fun m!515517 () Bool)

(assert (=> start!48780 m!515517))

(declare-fun m!515519 () Bool)

(assert (=> start!48780 m!515519))

(declare-fun m!515521 () Bool)

(assert (=> b!536653 m!515521))

(assert (=> b!536664 m!515501))

(assert (=> b!536664 m!515501))

(declare-fun m!515523 () Bool)

(assert (=> b!536664 m!515523))

(assert (=> b!536664 m!515523))

(assert (=> b!536664 m!515501))

(declare-fun m!515525 () Bool)

(assert (=> b!536664 m!515525))

(declare-fun m!515527 () Bool)

(assert (=> b!536665 m!515527))

(assert (=> b!536665 m!515501))

(check-sat (not b!536662) (not b!536658) (not b!536660) (not b!536664) (not b!536656) (not b!536661) (not b!536653) (not b!536657) (not b!536663) (not start!48780) (not b!536654))
(check-sat)
