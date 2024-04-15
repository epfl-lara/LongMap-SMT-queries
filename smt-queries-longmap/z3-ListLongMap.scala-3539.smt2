; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48792 () Bool)

(assert start!48792)

(declare-fun b!536887 () Bool)

(declare-fun e!311519 () Bool)

(assert (=> b!536887 (= e!311519 false)))

(declare-datatypes ((SeekEntryResult!4801 0))(
  ( (MissingZero!4801 (index!21428 (_ BitVec 32))) (Found!4801 (index!21429 (_ BitVec 32))) (Intermediate!4801 (undefined!5613 Bool) (index!21430 (_ BitVec 32)) (x!50371 (_ BitVec 32))) (Undefined!4801) (MissingVacant!4801 (index!21431 (_ BitVec 32))) )
))
(declare-fun lt!246082 () SeekEntryResult!4801)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34014 0))(
  ( (array!34015 (arr!16346 (Array (_ BitVec 32) (_ BitVec 64))) (size!16711 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34014)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246083 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34014 (_ BitVec 32)) SeekEntryResult!4801)

(assert (=> b!536887 (= lt!246082 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246083 (select (arr!16346 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536888 () Bool)

(declare-fun res!332235 () Bool)

(declare-fun e!311520 () Bool)

(assert (=> b!536888 (=> (not res!332235) (not e!311520))))

(declare-datatypes ((List!10504 0))(
  ( (Nil!10501) (Cons!10500 (h!11443 (_ BitVec 64)) (t!16723 List!10504)) )
))
(declare-fun arrayNoDuplicates!0 (array!34014 (_ BitVec 32) List!10504) Bool)

(assert (=> b!536888 (= res!332235 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10501))))

(declare-fun b!536889 () Bool)

(declare-fun res!332237 () Bool)

(declare-fun e!311517 () Bool)

(assert (=> b!536889 (=> (not res!332237) (not e!311517))))

(declare-fun lt!246084 () SeekEntryResult!4801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536889 (= res!332237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16346 a!3154) j!147) mask!3216) (select (arr!16346 a!3154) j!147) a!3154 mask!3216) lt!246084))))

(declare-fun b!536890 () Bool)

(declare-fun res!332243 () Bool)

(declare-fun e!311518 () Bool)

(assert (=> b!536890 (=> (not res!332243) (not e!311518))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536890 (= res!332243 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536891 () Bool)

(declare-fun res!332245 () Bool)

(assert (=> b!536891 (=> (not res!332245) (not e!311518))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536891 (= res!332245 (and (= (size!16711 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16711 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16711 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536892 () Bool)

(assert (=> b!536892 (= e!311520 e!311517)))

(declare-fun res!332240 () Bool)

(assert (=> b!536892 (=> (not res!332240) (not e!311517))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536892 (= res!332240 (= lt!246084 (Intermediate!4801 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536892 (= lt!246084 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16346 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536893 () Bool)

(declare-fun res!332246 () Bool)

(assert (=> b!536893 (=> (not res!332246) (not e!311518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536893 (= res!332246 (validKeyInArray!0 (select (arr!16346 a!3154) j!147)))))

(declare-fun b!536894 () Bool)

(declare-fun res!332236 () Bool)

(assert (=> b!536894 (=> (not res!332236) (not e!311517))))

(assert (=> b!536894 (= res!332236 (and (not (= (select (arr!16346 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16346 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16346 a!3154) index!1177) (select (arr!16346 a!3154) j!147)))))))

(declare-fun b!536895 () Bool)

(assert (=> b!536895 (= e!311517 e!311519)))

(declare-fun res!332241 () Bool)

(assert (=> b!536895 (=> (not res!332241) (not e!311519))))

(assert (=> b!536895 (= res!332241 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246083 #b00000000000000000000000000000000) (bvslt lt!246083 (size!16711 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536895 (= lt!246083 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536896 () Bool)

(declare-fun res!332239 () Bool)

(assert (=> b!536896 (=> (not res!332239) (not e!311520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34014 (_ BitVec 32)) Bool)

(assert (=> b!536896 (= res!332239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536897 () Bool)

(assert (=> b!536897 (= e!311518 e!311520)))

(declare-fun res!332238 () Bool)

(assert (=> b!536897 (=> (not res!332238) (not e!311520))))

(declare-fun lt!246085 () SeekEntryResult!4801)

(assert (=> b!536897 (= res!332238 (or (= lt!246085 (MissingZero!4801 i!1153)) (= lt!246085 (MissingVacant!4801 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34014 (_ BitVec 32)) SeekEntryResult!4801)

(assert (=> b!536897 (= lt!246085 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536898 () Bool)

(declare-fun res!332244 () Bool)

(assert (=> b!536898 (=> (not res!332244) (not e!311520))))

(assert (=> b!536898 (= res!332244 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16711 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16711 a!3154)) (= (select (arr!16346 a!3154) resIndex!32) (select (arr!16346 a!3154) j!147))))))

(declare-fun b!536899 () Bool)

(declare-fun res!332242 () Bool)

(assert (=> b!536899 (=> (not res!332242) (not e!311518))))

(assert (=> b!536899 (= res!332242 (validKeyInArray!0 k0!1998))))

(declare-fun res!332234 () Bool)

(assert (=> start!48792 (=> (not res!332234) (not e!311518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48792 (= res!332234 (validMask!0 mask!3216))))

(assert (=> start!48792 e!311518))

(assert (=> start!48792 true))

(declare-fun array_inv!12229 (array!34014) Bool)

(assert (=> start!48792 (array_inv!12229 a!3154)))

(assert (= (and start!48792 res!332234) b!536891))

(assert (= (and b!536891 res!332245) b!536893))

(assert (= (and b!536893 res!332246) b!536899))

(assert (= (and b!536899 res!332242) b!536890))

(assert (= (and b!536890 res!332243) b!536897))

(assert (= (and b!536897 res!332238) b!536896))

(assert (= (and b!536896 res!332239) b!536888))

(assert (= (and b!536888 res!332235) b!536898))

(assert (= (and b!536898 res!332244) b!536892))

(assert (= (and b!536892 res!332240) b!536889))

(assert (= (and b!536889 res!332237) b!536894))

(assert (= (and b!536894 res!332236) b!536895))

(assert (= (and b!536895 res!332241) b!536887))

(declare-fun m!515689 () Bool)

(assert (=> b!536887 m!515689))

(assert (=> b!536887 m!515689))

(declare-fun m!515691 () Bool)

(assert (=> b!536887 m!515691))

(declare-fun m!515693 () Bool)

(assert (=> b!536899 m!515693))

(declare-fun m!515695 () Bool)

(assert (=> b!536898 m!515695))

(assert (=> b!536898 m!515689))

(declare-fun m!515697 () Bool)

(assert (=> start!48792 m!515697))

(declare-fun m!515699 () Bool)

(assert (=> start!48792 m!515699))

(assert (=> b!536889 m!515689))

(assert (=> b!536889 m!515689))

(declare-fun m!515701 () Bool)

(assert (=> b!536889 m!515701))

(assert (=> b!536889 m!515701))

(assert (=> b!536889 m!515689))

(declare-fun m!515703 () Bool)

(assert (=> b!536889 m!515703))

(declare-fun m!515705 () Bool)

(assert (=> b!536888 m!515705))

(declare-fun m!515707 () Bool)

(assert (=> b!536897 m!515707))

(declare-fun m!515709 () Bool)

(assert (=> b!536895 m!515709))

(declare-fun m!515711 () Bool)

(assert (=> b!536896 m!515711))

(declare-fun m!515713 () Bool)

(assert (=> b!536894 m!515713))

(assert (=> b!536894 m!515689))

(assert (=> b!536892 m!515689))

(assert (=> b!536892 m!515689))

(declare-fun m!515715 () Bool)

(assert (=> b!536892 m!515715))

(assert (=> b!536893 m!515689))

(assert (=> b!536893 m!515689))

(declare-fun m!515717 () Bool)

(assert (=> b!536893 m!515717))

(declare-fun m!515719 () Bool)

(assert (=> b!536890 m!515719))

(check-sat (not b!536899) (not b!536896) (not b!536893) (not b!536888) (not start!48792) (not b!536887) (not b!536889) (not b!536892) (not b!536895) (not b!536897) (not b!536890))
(check-sat)
