; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48660 () Bool)

(assert start!48660)

(declare-fun b!534505 () Bool)

(declare-fun res!329860 () Bool)

(declare-fun e!310641 () Bool)

(assert (=> b!534505 (=> (not res!329860) (not e!310641))))

(declare-datatypes ((array!33882 0))(
  ( (array!33883 (arr!16280 (Array (_ BitVec 32) (_ BitVec 64))) (size!16645 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33882)

(declare-datatypes ((List!10438 0))(
  ( (Nil!10435) (Cons!10434 (h!11377 (_ BitVec 64)) (t!16657 List!10438)) )
))
(declare-fun arrayNoDuplicates!0 (array!33882 (_ BitVec 32) List!10438) Bool)

(assert (=> b!534505 (= res!329860 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10435))))

(declare-fun b!534506 () Bool)

(declare-fun res!329857 () Bool)

(declare-fun e!310640 () Bool)

(assert (=> b!534506 (=> (not res!329857) (not e!310640))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534506 (= res!329857 (and (= (size!16645 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16645 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16645 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534507 () Bool)

(declare-fun res!329854 () Bool)

(assert (=> b!534507 (=> (not res!329854) (not e!310640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534507 (= res!329854 (validKeyInArray!0 (select (arr!16280 a!3154) j!147)))))

(declare-fun b!534508 () Bool)

(declare-fun res!329858 () Bool)

(assert (=> b!534508 (=> (not res!329858) (not e!310641))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4735 0))(
  ( (MissingZero!4735 (index!21164 (_ BitVec 32))) (Found!4735 (index!21165 (_ BitVec 32))) (Intermediate!4735 (undefined!5547 Bool) (index!21166 (_ BitVec 32)) (x!50129 (_ BitVec 32))) (Undefined!4735) (MissingVacant!4735 (index!21167 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33882 (_ BitVec 32)) SeekEntryResult!4735)

(assert (=> b!534508 (= res!329858 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16280 a!3154) j!147) a!3154 mask!3216) (Intermediate!4735 false resIndex!32 resX!32)))))

(declare-fun b!534509 () Bool)

(declare-fun res!329853 () Bool)

(assert (=> b!534509 (=> (not res!329853) (not e!310640))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534509 (= res!329853 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!329859 () Bool)

(assert (=> start!48660 (=> (not res!329859) (not e!310640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48660 (= res!329859 (validMask!0 mask!3216))))

(assert (=> start!48660 e!310640))

(assert (=> start!48660 true))

(declare-fun array_inv!12163 (array!33882) Bool)

(assert (=> start!48660 (array_inv!12163 a!3154)))

(declare-fun b!534510 () Bool)

(declare-fun res!329856 () Bool)

(assert (=> b!534510 (=> (not res!329856) (not e!310641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33882 (_ BitVec 32)) Bool)

(assert (=> b!534510 (= res!329856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534511 () Bool)

(assert (=> b!534511 (= e!310640 e!310641)))

(declare-fun res!329852 () Bool)

(assert (=> b!534511 (=> (not res!329852) (not e!310641))))

(declare-fun lt!245466 () SeekEntryResult!4735)

(assert (=> b!534511 (= res!329852 (or (= lt!245466 (MissingZero!4735 i!1153)) (= lt!245466 (MissingVacant!4735 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33882 (_ BitVec 32)) SeekEntryResult!4735)

(assert (=> b!534511 (= lt!245466 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534512 () Bool)

(declare-fun res!329855 () Bool)

(assert (=> b!534512 (=> (not res!329855) (not e!310640))))

(assert (=> b!534512 (= res!329855 (validKeyInArray!0 k0!1998))))

(declare-fun b!534513 () Bool)

(declare-fun res!329861 () Bool)

(assert (=> b!534513 (=> (not res!329861) (not e!310641))))

(assert (=> b!534513 (= res!329861 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16645 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16645 a!3154)) (= (select (arr!16280 a!3154) resIndex!32) (select (arr!16280 a!3154) j!147))))))

(declare-fun b!534514 () Bool)

(assert (=> b!534514 (= e!310641 false)))

(declare-fun lt!245467 () SeekEntryResult!4735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534514 (= lt!245467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16280 a!3154) j!147) mask!3216) (select (arr!16280 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48660 res!329859) b!534506))

(assert (= (and b!534506 res!329857) b!534507))

(assert (= (and b!534507 res!329854) b!534512))

(assert (= (and b!534512 res!329855) b!534509))

(assert (= (and b!534509 res!329853) b!534511))

(assert (= (and b!534511 res!329852) b!534510))

(assert (= (and b!534510 res!329856) b!534505))

(assert (= (and b!534505 res!329860) b!534513))

(assert (= (and b!534513 res!329861) b!534508))

(assert (= (and b!534508 res!329858) b!534514))

(declare-fun m!513697 () Bool)

(assert (=> start!48660 m!513697))

(declare-fun m!513699 () Bool)

(assert (=> start!48660 m!513699))

(declare-fun m!513701 () Bool)

(assert (=> b!534507 m!513701))

(assert (=> b!534507 m!513701))

(declare-fun m!513703 () Bool)

(assert (=> b!534507 m!513703))

(declare-fun m!513705 () Bool)

(assert (=> b!534512 m!513705))

(declare-fun m!513707 () Bool)

(assert (=> b!534509 m!513707))

(declare-fun m!513709 () Bool)

(assert (=> b!534505 m!513709))

(assert (=> b!534508 m!513701))

(assert (=> b!534508 m!513701))

(declare-fun m!513711 () Bool)

(assert (=> b!534508 m!513711))

(declare-fun m!513713 () Bool)

(assert (=> b!534510 m!513713))

(declare-fun m!513715 () Bool)

(assert (=> b!534511 m!513715))

(assert (=> b!534514 m!513701))

(assert (=> b!534514 m!513701))

(declare-fun m!513717 () Bool)

(assert (=> b!534514 m!513717))

(assert (=> b!534514 m!513717))

(assert (=> b!534514 m!513701))

(declare-fun m!513719 () Bool)

(assert (=> b!534514 m!513719))

(declare-fun m!513721 () Bool)

(assert (=> b!534513 m!513721))

(assert (=> b!534513 m!513701))

(check-sat (not b!534514) (not b!534508) (not b!534511) (not b!534509) (not b!534512) (not b!534510) (not start!48660) (not b!534505) (not b!534507))
(check-sat)
