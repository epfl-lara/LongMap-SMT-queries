; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48770 () Bool)

(assert start!48770)

(declare-fun b!536495 () Bool)

(declare-fun res!331701 () Bool)

(declare-fun e!311438 () Bool)

(assert (=> b!536495 (=> (not res!331701) (not e!311438))))

(declare-datatypes ((array!33982 0))(
  ( (array!33983 (arr!16330 (Array (_ BitVec 32) (_ BitVec 64))) (size!16694 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33982)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536495 (= res!331701 (validKeyInArray!0 (select (arr!16330 a!3154) j!147)))))

(declare-fun b!536496 () Bool)

(declare-fun res!331706 () Bool)

(assert (=> b!536496 (=> (not res!331706) (not e!311438))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536496 (= res!331706 (and (= (size!16694 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16694 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16694 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536497 () Bool)

(declare-fun res!331711 () Bool)

(declare-fun e!311439 () Bool)

(assert (=> b!536497 (=> (not res!331711) (not e!311439))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536497 (= res!331711 (and (not (= (select (arr!16330 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16330 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16330 a!3154) index!1177) (select (arr!16330 a!3154) j!147)))))))

(declare-fun b!536498 () Bool)

(declare-fun res!331705 () Bool)

(declare-fun e!311437 () Bool)

(assert (=> b!536498 (=> (not res!331705) (not e!311437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33982 (_ BitVec 32)) Bool)

(assert (=> b!536498 (= res!331705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536499 () Bool)

(declare-fun res!331710 () Bool)

(assert (=> b!536499 (=> (not res!331710) (not e!311438))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!536499 (= res!331710 (validKeyInArray!0 k0!1998))))

(declare-fun b!536500 () Bool)

(declare-fun e!311436 () Bool)

(assert (=> b!536500 (= e!311439 e!311436)))

(declare-fun res!331708 () Bool)

(assert (=> b!536500 (=> (not res!331708) (not e!311436))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246114 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536500 (= res!331708 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246114 #b00000000000000000000000000000000) (bvslt lt!246114 (size!16694 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536500 (= lt!246114 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536501 () Bool)

(declare-fun res!331704 () Bool)

(assert (=> b!536501 (=> (not res!331704) (not e!311439))))

(declare-datatypes ((SeekEntryResult!4788 0))(
  ( (MissingZero!4788 (index!21376 (_ BitVec 32))) (Found!4788 (index!21377 (_ BitVec 32))) (Intermediate!4788 (undefined!5600 Bool) (index!21378 (_ BitVec 32)) (x!50315 (_ BitVec 32))) (Undefined!4788) (MissingVacant!4788 (index!21379 (_ BitVec 32))) )
))
(declare-fun lt!246113 () SeekEntryResult!4788)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33982 (_ BitVec 32)) SeekEntryResult!4788)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536501 (= res!331704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16330 a!3154) j!147) mask!3216) (select (arr!16330 a!3154) j!147) a!3154 mask!3216) lt!246113))))

(declare-fun res!331709 () Bool)

(assert (=> start!48770 (=> (not res!331709) (not e!311438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48770 (= res!331709 (validMask!0 mask!3216))))

(assert (=> start!48770 e!311438))

(assert (=> start!48770 true))

(declare-fun array_inv!12126 (array!33982) Bool)

(assert (=> start!48770 (array_inv!12126 a!3154)))

(declare-fun b!536502 () Bool)

(assert (=> b!536502 (= e!311436 false)))

(declare-fun lt!246112 () SeekEntryResult!4788)

(assert (=> b!536502 (= lt!246112 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246114 (select (arr!16330 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536503 () Bool)

(assert (=> b!536503 (= e!311437 e!311439)))

(declare-fun res!331703 () Bool)

(assert (=> b!536503 (=> (not res!331703) (not e!311439))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536503 (= res!331703 (= lt!246113 (Intermediate!4788 false resIndex!32 resX!32)))))

(assert (=> b!536503 (= lt!246113 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16330 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536504 () Bool)

(declare-fun res!331700 () Bool)

(assert (=> b!536504 (=> (not res!331700) (not e!311437))))

(assert (=> b!536504 (= res!331700 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16694 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16694 a!3154)) (= (select (arr!16330 a!3154) resIndex!32) (select (arr!16330 a!3154) j!147))))))

(declare-fun b!536505 () Bool)

(declare-fun res!331707 () Bool)

(assert (=> b!536505 (=> (not res!331707) (not e!311437))))

(declare-datatypes ((List!10449 0))(
  ( (Nil!10446) (Cons!10445 (h!11388 (_ BitVec 64)) (t!16677 List!10449)) )
))
(declare-fun arrayNoDuplicates!0 (array!33982 (_ BitVec 32) List!10449) Bool)

(assert (=> b!536505 (= res!331707 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10446))))

(declare-fun b!536506 () Bool)

(assert (=> b!536506 (= e!311438 e!311437)))

(declare-fun res!331712 () Bool)

(assert (=> b!536506 (=> (not res!331712) (not e!311437))))

(declare-fun lt!246115 () SeekEntryResult!4788)

(assert (=> b!536506 (= res!331712 (or (= lt!246115 (MissingZero!4788 i!1153)) (= lt!246115 (MissingVacant!4788 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33982 (_ BitVec 32)) SeekEntryResult!4788)

(assert (=> b!536506 (= lt!246115 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536507 () Bool)

(declare-fun res!331702 () Bool)

(assert (=> b!536507 (=> (not res!331702) (not e!311438))))

(declare-fun arrayContainsKey!0 (array!33982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536507 (= res!331702 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48770 res!331709) b!536496))

(assert (= (and b!536496 res!331706) b!536495))

(assert (= (and b!536495 res!331701) b!536499))

(assert (= (and b!536499 res!331710) b!536507))

(assert (= (and b!536507 res!331702) b!536506))

(assert (= (and b!536506 res!331712) b!536498))

(assert (= (and b!536498 res!331705) b!536505))

(assert (= (and b!536505 res!331707) b!536504))

(assert (= (and b!536504 res!331700) b!536503))

(assert (= (and b!536503 res!331703) b!536501))

(assert (= (and b!536501 res!331704) b!536497))

(assert (= (and b!536497 res!331711) b!536500))

(assert (= (and b!536500 res!331708) b!536502))

(declare-fun m!515897 () Bool)

(assert (=> b!536495 m!515897))

(assert (=> b!536495 m!515897))

(declare-fun m!515899 () Bool)

(assert (=> b!536495 m!515899))

(declare-fun m!515901 () Bool)

(assert (=> b!536506 m!515901))

(declare-fun m!515903 () Bool)

(assert (=> b!536497 m!515903))

(assert (=> b!536497 m!515897))

(declare-fun m!515905 () Bool)

(assert (=> b!536504 m!515905))

(assert (=> b!536504 m!515897))

(declare-fun m!515907 () Bool)

(assert (=> b!536499 m!515907))

(assert (=> b!536503 m!515897))

(assert (=> b!536503 m!515897))

(declare-fun m!515909 () Bool)

(assert (=> b!536503 m!515909))

(declare-fun m!515911 () Bool)

(assert (=> b!536507 m!515911))

(declare-fun m!515913 () Bool)

(assert (=> start!48770 m!515913))

(declare-fun m!515915 () Bool)

(assert (=> start!48770 m!515915))

(assert (=> b!536502 m!515897))

(assert (=> b!536502 m!515897))

(declare-fun m!515917 () Bool)

(assert (=> b!536502 m!515917))

(declare-fun m!515919 () Bool)

(assert (=> b!536500 m!515919))

(declare-fun m!515921 () Bool)

(assert (=> b!536505 m!515921))

(assert (=> b!536501 m!515897))

(assert (=> b!536501 m!515897))

(declare-fun m!515923 () Bool)

(assert (=> b!536501 m!515923))

(assert (=> b!536501 m!515923))

(assert (=> b!536501 m!515897))

(declare-fun m!515925 () Bool)

(assert (=> b!536501 m!515925))

(declare-fun m!515927 () Bool)

(assert (=> b!536498 m!515927))

(check-sat (not b!536501) (not b!536500) (not start!48770) (not b!536499) (not b!536503) (not b!536506) (not b!536507) (not b!536498) (not b!536495) (not b!536505) (not b!536502))
(check-sat)
