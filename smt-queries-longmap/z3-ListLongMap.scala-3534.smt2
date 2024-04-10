; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48776 () Bool)

(assert start!48776)

(declare-fun b!536612 () Bool)

(declare-fun res!331826 () Bool)

(declare-fun e!311481 () Bool)

(assert (=> b!536612 (=> (not res!331826) (not e!311481))))

(declare-datatypes ((array!33988 0))(
  ( (array!33989 (arr!16333 (Array (_ BitVec 32) (_ BitVec 64))) (size!16697 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33988)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33988 (_ BitVec 32)) Bool)

(assert (=> b!536612 (= res!331826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536613 () Bool)

(declare-fun res!331822 () Bool)

(assert (=> b!536613 (=> (not res!331822) (not e!311481))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536613 (= res!331822 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16697 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16697 a!3154)) (= (select (arr!16333 a!3154) resIndex!32) (select (arr!16333 a!3154) j!147))))))

(declare-fun b!536614 () Bool)

(declare-fun res!331820 () Bool)

(declare-fun e!311484 () Bool)

(assert (=> b!536614 (=> (not res!331820) (not e!311484))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536614 (= res!331820 (validKeyInArray!0 k0!1998))))

(declare-fun b!536615 () Bool)

(declare-fun res!331827 () Bool)

(assert (=> b!536615 (=> (not res!331827) (not e!311484))))

(declare-fun arrayContainsKey!0 (array!33988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536615 (= res!331827 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!331829 () Bool)

(assert (=> start!48776 (=> (not res!331829) (not e!311484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48776 (= res!331829 (validMask!0 mask!3216))))

(assert (=> start!48776 e!311484))

(assert (=> start!48776 true))

(declare-fun array_inv!12129 (array!33988) Bool)

(assert (=> start!48776 (array_inv!12129 a!3154)))

(declare-fun b!536616 () Bool)

(assert (=> b!536616 (= e!311484 e!311481)))

(declare-fun res!331823 () Bool)

(assert (=> b!536616 (=> (not res!331823) (not e!311481))))

(declare-datatypes ((SeekEntryResult!4791 0))(
  ( (MissingZero!4791 (index!21388 (_ BitVec 32))) (Found!4791 (index!21389 (_ BitVec 32))) (Intermediate!4791 (undefined!5603 Bool) (index!21390 (_ BitVec 32)) (x!50326 (_ BitVec 32))) (Undefined!4791) (MissingVacant!4791 (index!21391 (_ BitVec 32))) )
))
(declare-fun lt!246151 () SeekEntryResult!4791)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536616 (= res!331823 (or (= lt!246151 (MissingZero!4791 i!1153)) (= lt!246151 (MissingVacant!4791 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33988 (_ BitVec 32)) SeekEntryResult!4791)

(assert (=> b!536616 (= lt!246151 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536617 () Bool)

(declare-fun res!331825 () Bool)

(assert (=> b!536617 (=> (not res!331825) (not e!311484))))

(assert (=> b!536617 (= res!331825 (validKeyInArray!0 (select (arr!16333 a!3154) j!147)))))

(declare-fun b!536618 () Bool)

(declare-fun res!331828 () Bool)

(declare-fun e!311483 () Bool)

(assert (=> b!536618 (=> (not res!331828) (not e!311483))))

(assert (=> b!536618 (= res!331828 (and (not (= (select (arr!16333 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16333 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16333 a!3154) index!1177) (select (arr!16333 a!3154) j!147)))))))

(declare-fun b!536619 () Bool)

(declare-fun res!331824 () Bool)

(assert (=> b!536619 (=> (not res!331824) (not e!311481))))

(declare-datatypes ((List!10452 0))(
  ( (Nil!10449) (Cons!10448 (h!11391 (_ BitVec 64)) (t!16680 List!10452)) )
))
(declare-fun arrayNoDuplicates!0 (array!33988 (_ BitVec 32) List!10452) Bool)

(assert (=> b!536619 (= res!331824 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10449))))

(declare-fun b!536620 () Bool)

(declare-fun res!331817 () Bool)

(assert (=> b!536620 (=> (not res!331817) (not e!311484))))

(assert (=> b!536620 (= res!331817 (and (= (size!16697 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16697 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16697 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536621 () Bool)

(declare-fun res!331819 () Bool)

(assert (=> b!536621 (=> (not res!331819) (not e!311483))))

(declare-fun lt!246149 () SeekEntryResult!4791)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33988 (_ BitVec 32)) SeekEntryResult!4791)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536621 (= res!331819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16333 a!3154) j!147) mask!3216) (select (arr!16333 a!3154) j!147) a!3154 mask!3216) lt!246149))))

(declare-fun b!536622 () Bool)

(declare-fun e!311482 () Bool)

(assert (=> b!536622 (= e!311483 e!311482)))

(declare-fun res!331818 () Bool)

(assert (=> b!536622 (=> (not res!331818) (not e!311482))))

(declare-fun lt!246150 () (_ BitVec 32))

(assert (=> b!536622 (= res!331818 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246150 #b00000000000000000000000000000000) (bvslt lt!246150 (size!16697 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536622 (= lt!246150 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536623 () Bool)

(assert (=> b!536623 (= e!311481 e!311483)))

(declare-fun res!331821 () Bool)

(assert (=> b!536623 (=> (not res!331821) (not e!311483))))

(assert (=> b!536623 (= res!331821 (= lt!246149 (Intermediate!4791 false resIndex!32 resX!32)))))

(assert (=> b!536623 (= lt!246149 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16333 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536624 () Bool)

(assert (=> b!536624 (= e!311482 false)))

(declare-fun lt!246148 () SeekEntryResult!4791)

(assert (=> b!536624 (= lt!246148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246150 (select (arr!16333 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48776 res!331829) b!536620))

(assert (= (and b!536620 res!331817) b!536617))

(assert (= (and b!536617 res!331825) b!536614))

(assert (= (and b!536614 res!331820) b!536615))

(assert (= (and b!536615 res!331827) b!536616))

(assert (= (and b!536616 res!331823) b!536612))

(assert (= (and b!536612 res!331826) b!536619))

(assert (= (and b!536619 res!331824) b!536613))

(assert (= (and b!536613 res!331822) b!536623))

(assert (= (and b!536623 res!331821) b!536621))

(assert (= (and b!536621 res!331819) b!536618))

(assert (= (and b!536618 res!331828) b!536622))

(assert (= (and b!536622 res!331818) b!536624))

(declare-fun m!515993 () Bool)

(assert (=> b!536618 m!515993))

(declare-fun m!515995 () Bool)

(assert (=> b!536618 m!515995))

(declare-fun m!515997 () Bool)

(assert (=> b!536613 m!515997))

(assert (=> b!536613 m!515995))

(declare-fun m!515999 () Bool)

(assert (=> b!536619 m!515999))

(declare-fun m!516001 () Bool)

(assert (=> b!536615 m!516001))

(assert (=> b!536617 m!515995))

(assert (=> b!536617 m!515995))

(declare-fun m!516003 () Bool)

(assert (=> b!536617 m!516003))

(declare-fun m!516005 () Bool)

(assert (=> b!536622 m!516005))

(declare-fun m!516007 () Bool)

(assert (=> start!48776 m!516007))

(declare-fun m!516009 () Bool)

(assert (=> start!48776 m!516009))

(assert (=> b!536623 m!515995))

(assert (=> b!536623 m!515995))

(declare-fun m!516011 () Bool)

(assert (=> b!536623 m!516011))

(declare-fun m!516013 () Bool)

(assert (=> b!536612 m!516013))

(assert (=> b!536624 m!515995))

(assert (=> b!536624 m!515995))

(declare-fun m!516015 () Bool)

(assert (=> b!536624 m!516015))

(declare-fun m!516017 () Bool)

(assert (=> b!536616 m!516017))

(declare-fun m!516019 () Bool)

(assert (=> b!536614 m!516019))

(assert (=> b!536621 m!515995))

(assert (=> b!536621 m!515995))

(declare-fun m!516021 () Bool)

(assert (=> b!536621 m!516021))

(assert (=> b!536621 m!516021))

(assert (=> b!536621 m!515995))

(declare-fun m!516023 () Bool)

(assert (=> b!536621 m!516023))

(check-sat (not b!536615) (not b!536621) (not b!536624) (not b!536622) (not b!536616) (not b!536612) (not b!536619) (not start!48776) (not b!536614) (not b!536623) (not b!536617))
(check-sat)
