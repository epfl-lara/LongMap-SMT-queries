; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48786 () Bool)

(assert start!48786)

(declare-fun b!536770 () Bool)

(declare-fun res!332124 () Bool)

(declare-fun e!311471 () Bool)

(assert (=> b!536770 (=> (not res!332124) (not e!311471))))

(declare-datatypes ((array!34008 0))(
  ( (array!34009 (arr!16343 (Array (_ BitVec 32) (_ BitVec 64))) (size!16708 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34008)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536770 (= res!332124 (validKeyInArray!0 (select (arr!16343 a!3154) j!147)))))

(declare-fun b!536771 () Bool)

(declare-fun res!332125 () Bool)

(assert (=> b!536771 (=> (not res!332125) (not e!311471))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536771 (= res!332125 (and (= (size!16708 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16708 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16708 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536772 () Bool)

(declare-fun res!332129 () Bool)

(assert (=> b!536772 (=> (not res!332129) (not e!311471))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!536772 (= res!332129 (validKeyInArray!0 k0!1998))))

(declare-fun res!332119 () Bool)

(assert (=> start!48786 (=> (not res!332119) (not e!311471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48786 (= res!332119 (validMask!0 mask!3216))))

(assert (=> start!48786 e!311471))

(assert (=> start!48786 true))

(declare-fun array_inv!12226 (array!34008) Bool)

(assert (=> start!48786 (array_inv!12226 a!3154)))

(declare-fun b!536773 () Bool)

(declare-fun e!311475 () Bool)

(assert (=> b!536773 (= e!311471 e!311475)))

(declare-fun res!332123 () Bool)

(assert (=> b!536773 (=> (not res!332123) (not e!311475))))

(declare-datatypes ((SeekEntryResult!4798 0))(
  ( (MissingZero!4798 (index!21416 (_ BitVec 32))) (Found!4798 (index!21417 (_ BitVec 32))) (Intermediate!4798 (undefined!5610 Bool) (index!21418 (_ BitVec 32)) (x!50360 (_ BitVec 32))) (Undefined!4798) (MissingVacant!4798 (index!21419 (_ BitVec 32))) )
))
(declare-fun lt!246049 () SeekEntryResult!4798)

(assert (=> b!536773 (= res!332123 (or (= lt!246049 (MissingZero!4798 i!1153)) (= lt!246049 (MissingVacant!4798 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34008 (_ BitVec 32)) SeekEntryResult!4798)

(assert (=> b!536773 (= lt!246049 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536774 () Bool)

(declare-fun e!311473 () Bool)

(assert (=> b!536774 (= e!311475 e!311473)))

(declare-fun res!332117 () Bool)

(assert (=> b!536774 (=> (not res!332117) (not e!311473))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!246048 () SeekEntryResult!4798)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536774 (= res!332117 (= lt!246048 (Intermediate!4798 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34008 (_ BitVec 32)) SeekEntryResult!4798)

(assert (=> b!536774 (= lt!246048 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16343 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536775 () Bool)

(declare-fun res!332121 () Bool)

(assert (=> b!536775 (=> (not res!332121) (not e!311471))))

(declare-fun arrayContainsKey!0 (array!34008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536775 (= res!332121 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536776 () Bool)

(declare-fun e!311474 () Bool)

(assert (=> b!536776 (= e!311474 false)))

(declare-fun lt!246046 () SeekEntryResult!4798)

(declare-fun lt!246047 () (_ BitVec 32))

(assert (=> b!536776 (= lt!246046 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246047 (select (arr!16343 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536777 () Bool)

(assert (=> b!536777 (= e!311473 e!311474)))

(declare-fun res!332120 () Bool)

(assert (=> b!536777 (=> (not res!332120) (not e!311474))))

(assert (=> b!536777 (= res!332120 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246047 #b00000000000000000000000000000000) (bvslt lt!246047 (size!16708 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536777 (= lt!246047 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536778 () Bool)

(declare-fun res!332126 () Bool)

(assert (=> b!536778 (=> (not res!332126) (not e!311473))))

(assert (=> b!536778 (= res!332126 (and (not (= (select (arr!16343 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16343 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16343 a!3154) index!1177) (select (arr!16343 a!3154) j!147)))))))

(declare-fun b!536779 () Bool)

(declare-fun res!332118 () Bool)

(assert (=> b!536779 (=> (not res!332118) (not e!311475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34008 (_ BitVec 32)) Bool)

(assert (=> b!536779 (= res!332118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536780 () Bool)

(declare-fun res!332127 () Bool)

(assert (=> b!536780 (=> (not res!332127) (not e!311475))))

(assert (=> b!536780 (= res!332127 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16708 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16708 a!3154)) (= (select (arr!16343 a!3154) resIndex!32) (select (arr!16343 a!3154) j!147))))))

(declare-fun b!536781 () Bool)

(declare-fun res!332122 () Bool)

(assert (=> b!536781 (=> (not res!332122) (not e!311473))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536781 (= res!332122 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16343 a!3154) j!147) mask!3216) (select (arr!16343 a!3154) j!147) a!3154 mask!3216) lt!246048))))

(declare-fun b!536782 () Bool)

(declare-fun res!332128 () Bool)

(assert (=> b!536782 (=> (not res!332128) (not e!311475))))

(declare-datatypes ((List!10501 0))(
  ( (Nil!10498) (Cons!10497 (h!11440 (_ BitVec 64)) (t!16720 List!10501)) )
))
(declare-fun arrayNoDuplicates!0 (array!34008 (_ BitVec 32) List!10501) Bool)

(assert (=> b!536782 (= res!332128 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10498))))

(assert (= (and start!48786 res!332119) b!536771))

(assert (= (and b!536771 res!332125) b!536770))

(assert (= (and b!536770 res!332124) b!536772))

(assert (= (and b!536772 res!332129) b!536775))

(assert (= (and b!536775 res!332121) b!536773))

(assert (= (and b!536773 res!332123) b!536779))

(assert (= (and b!536779 res!332118) b!536782))

(assert (= (and b!536782 res!332128) b!536780))

(assert (= (and b!536780 res!332127) b!536774))

(assert (= (and b!536774 res!332117) b!536781))

(assert (= (and b!536781 res!332122) b!536778))

(assert (= (and b!536778 res!332126) b!536777))

(assert (= (and b!536777 res!332120) b!536776))

(declare-fun m!515593 () Bool)

(assert (=> b!536778 m!515593))

(declare-fun m!515595 () Bool)

(assert (=> b!536778 m!515595))

(assert (=> b!536774 m!515595))

(assert (=> b!536774 m!515595))

(declare-fun m!515597 () Bool)

(assert (=> b!536774 m!515597))

(assert (=> b!536781 m!515595))

(assert (=> b!536781 m!515595))

(declare-fun m!515599 () Bool)

(assert (=> b!536781 m!515599))

(assert (=> b!536781 m!515599))

(assert (=> b!536781 m!515595))

(declare-fun m!515601 () Bool)

(assert (=> b!536781 m!515601))

(declare-fun m!515603 () Bool)

(assert (=> b!536772 m!515603))

(assert (=> b!536770 m!515595))

(assert (=> b!536770 m!515595))

(declare-fun m!515605 () Bool)

(assert (=> b!536770 m!515605))

(declare-fun m!515607 () Bool)

(assert (=> b!536775 m!515607))

(declare-fun m!515609 () Bool)

(assert (=> start!48786 m!515609))

(declare-fun m!515611 () Bool)

(assert (=> start!48786 m!515611))

(declare-fun m!515613 () Bool)

(assert (=> b!536773 m!515613))

(declare-fun m!515615 () Bool)

(assert (=> b!536780 m!515615))

(assert (=> b!536780 m!515595))

(declare-fun m!515617 () Bool)

(assert (=> b!536779 m!515617))

(declare-fun m!515619 () Bool)

(assert (=> b!536782 m!515619))

(declare-fun m!515621 () Bool)

(assert (=> b!536777 m!515621))

(assert (=> b!536776 m!515595))

(assert (=> b!536776 m!515595))

(declare-fun m!515623 () Bool)

(assert (=> b!536776 m!515623))

(check-sat (not b!536779) (not b!536782) (not b!536775) (not b!536781) (not b!536777) (not b!536774) (not b!536773) (not b!536770) (not b!536776) (not start!48786) (not b!536772))
(check-sat)
