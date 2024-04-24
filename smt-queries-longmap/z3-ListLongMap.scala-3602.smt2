; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49648 () Bool)

(assert start!49648)

(declare-fun b!545893 () Bool)

(declare-fun e!315543 () Bool)

(declare-fun e!315537 () Bool)

(assert (=> b!545893 (= e!315543 e!315537)))

(declare-fun res!339717 () Bool)

(assert (=> b!545893 (=> (not res!339717) (not e!315537))))

(declare-datatypes ((SeekEntryResult!4945 0))(
  ( (MissingZero!4945 (index!22004 (_ BitVec 32))) (Found!4945 (index!22005 (_ BitVec 32))) (Intermediate!4945 (undefined!5757 Bool) (index!22006 (_ BitVec 32)) (x!51084 (_ BitVec 32))) (Undefined!4945) (MissingVacant!4945 (index!22007 (_ BitVec 32))) )
))
(declare-fun lt!249061 () SeekEntryResult!4945)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545893 (= res!339717 (or (= lt!249061 (MissingZero!4945 i!1153)) (= lt!249061 (MissingVacant!4945 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34409 0))(
  ( (array!34410 (arr!16531 (Array (_ BitVec 32) (_ BitVec 64))) (size!16895 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34409)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34409 (_ BitVec 32)) SeekEntryResult!4945)

(assert (=> b!545893 (= lt!249061 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!339715 () Bool)

(assert (=> start!49648 (=> (not res!339715) (not e!315543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49648 (= res!339715 (validMask!0 mask!3216))))

(assert (=> start!49648 e!315543))

(assert (=> start!49648 true))

(declare-fun array_inv!12390 (array!34409) Bool)

(assert (=> start!49648 (array_inv!12390 a!3154)))

(declare-fun b!545894 () Bool)

(declare-fun res!339720 () Bool)

(assert (=> b!545894 (=> (not res!339720) (not e!315537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34409 (_ BitVec 32)) Bool)

(assert (=> b!545894 (= res!339720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545895 () Bool)

(declare-fun e!315540 () Bool)

(declare-fun e!315541 () Bool)

(assert (=> b!545895 (= e!315540 e!315541)))

(declare-fun res!339718 () Bool)

(assert (=> b!545895 (=> (not res!339718) (not e!315541))))

(declare-fun lt!249067 () SeekEntryResult!4945)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!249066 () SeekEntryResult!4945)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!545895 (= res!339718 (and (= lt!249066 lt!249067) (not (= (select (arr!16531 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16531 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16531 a!3154) index!1177) (select (arr!16531 a!3154) j!147)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34409 (_ BitVec 32)) SeekEntryResult!4945)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545895 (= lt!249066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16531 a!3154) j!147) mask!3216) (select (arr!16531 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545896 () Bool)

(declare-fun e!315542 () Bool)

(declare-fun e!315539 () Bool)

(assert (=> b!545896 (= e!315542 e!315539)))

(declare-fun res!339723 () Bool)

(assert (=> b!545896 (=> (not res!339723) (not e!315539))))

(declare-fun lt!249062 () SeekEntryResult!4945)

(declare-fun lt!249063 () SeekEntryResult!4945)

(assert (=> b!545896 (= res!339723 (and (= lt!249062 lt!249063) (= lt!249066 lt!249062)))))

(declare-fun lt!249064 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!545896 (= lt!249062 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249064 (select (arr!16531 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545897 () Bool)

(declare-fun res!339726 () Bool)

(assert (=> b!545897 (=> (not res!339726) (not e!315543))))

(assert (=> b!545897 (= res!339726 (and (= (size!16895 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16895 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16895 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545898 () Bool)

(declare-fun res!339724 () Bool)

(assert (=> b!545898 (=> (not res!339724) (not e!315543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545898 (= res!339724 (validKeyInArray!0 (select (arr!16531 a!3154) j!147)))))

(declare-fun b!545899 () Bool)

(declare-fun res!339727 () Bool)

(assert (=> b!545899 (=> (not res!339727) (not e!315543))))

(assert (=> b!545899 (= res!339727 (validKeyInArray!0 k0!1998))))

(declare-fun b!545900 () Bool)

(declare-fun res!339725 () Bool)

(assert (=> b!545900 (=> (not res!339725) (not e!315537))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545900 (= res!339725 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16895 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16895 a!3154)) (= (select (arr!16531 a!3154) resIndex!32) (select (arr!16531 a!3154) j!147))))))

(declare-fun b!545901 () Bool)

(declare-fun res!339716 () Bool)

(assert (=> b!545901 (=> (not res!339716) (not e!315543))))

(declare-fun arrayContainsKey!0 (array!34409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545901 (= res!339716 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545902 () Bool)

(assert (=> b!545902 (= e!315539 (not true))))

(assert (=> b!545902 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249064 (select (store (arr!16531 a!3154) i!1153 k0!1998) j!147) (array!34410 (store (arr!16531 a!3154) i!1153 k0!1998) (size!16895 a!3154)) mask!3216) lt!249063)))

(declare-datatypes ((Unit!16899 0))(
  ( (Unit!16900) )
))
(declare-fun lt!249065 () Unit!16899)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16899)

(assert (=> b!545902 (= lt!249065 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249064 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545903 () Bool)

(assert (=> b!545903 (= e!315541 e!315542)))

(declare-fun res!339722 () Bool)

(assert (=> b!545903 (=> (not res!339722) (not e!315542))))

(assert (=> b!545903 (= res!339722 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249064 #b00000000000000000000000000000000) (bvslt lt!249064 (size!16895 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545903 (= lt!249064 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!545904 () Bool)

(declare-fun res!339719 () Bool)

(assert (=> b!545904 (=> (not res!339719) (not e!315537))))

(declare-datatypes ((List!10557 0))(
  ( (Nil!10554) (Cons!10553 (h!11520 (_ BitVec 64)) (t!16777 List!10557)) )
))
(declare-fun arrayNoDuplicates!0 (array!34409 (_ BitVec 32) List!10557) Bool)

(assert (=> b!545904 (= res!339719 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10554))))

(declare-fun b!545905 () Bool)

(assert (=> b!545905 (= e!315537 e!315540)))

(declare-fun res!339721 () Bool)

(assert (=> b!545905 (=> (not res!339721) (not e!315540))))

(assert (=> b!545905 (= res!339721 (= lt!249067 lt!249063))))

(assert (=> b!545905 (= lt!249063 (Intermediate!4945 false resIndex!32 resX!32))))

(assert (=> b!545905 (= lt!249067 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16531 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49648 res!339715) b!545897))

(assert (= (and b!545897 res!339726) b!545898))

(assert (= (and b!545898 res!339724) b!545899))

(assert (= (and b!545899 res!339727) b!545901))

(assert (= (and b!545901 res!339716) b!545893))

(assert (= (and b!545893 res!339717) b!545894))

(assert (= (and b!545894 res!339720) b!545904))

(assert (= (and b!545904 res!339719) b!545900))

(assert (= (and b!545900 res!339725) b!545905))

(assert (= (and b!545905 res!339721) b!545895))

(assert (= (and b!545895 res!339718) b!545903))

(assert (= (and b!545903 res!339722) b!545896))

(assert (= (and b!545896 res!339723) b!545902))

(declare-fun m!523579 () Bool)

(assert (=> b!545905 m!523579))

(assert (=> b!545905 m!523579))

(declare-fun m!523581 () Bool)

(assert (=> b!545905 m!523581))

(declare-fun m!523583 () Bool)

(assert (=> start!49648 m!523583))

(declare-fun m!523585 () Bool)

(assert (=> start!49648 m!523585))

(assert (=> b!545898 m!523579))

(assert (=> b!545898 m!523579))

(declare-fun m!523587 () Bool)

(assert (=> b!545898 m!523587))

(declare-fun m!523589 () Bool)

(assert (=> b!545902 m!523589))

(declare-fun m!523591 () Bool)

(assert (=> b!545902 m!523591))

(assert (=> b!545902 m!523591))

(declare-fun m!523593 () Bool)

(assert (=> b!545902 m!523593))

(declare-fun m!523595 () Bool)

(assert (=> b!545902 m!523595))

(declare-fun m!523597 () Bool)

(assert (=> b!545893 m!523597))

(declare-fun m!523599 () Bool)

(assert (=> b!545904 m!523599))

(declare-fun m!523601 () Bool)

(assert (=> b!545894 m!523601))

(declare-fun m!523603 () Bool)

(assert (=> b!545903 m!523603))

(declare-fun m!523605 () Bool)

(assert (=> b!545899 m!523605))

(declare-fun m!523607 () Bool)

(assert (=> b!545901 m!523607))

(declare-fun m!523609 () Bool)

(assert (=> b!545900 m!523609))

(assert (=> b!545900 m!523579))

(assert (=> b!545896 m!523579))

(assert (=> b!545896 m!523579))

(declare-fun m!523611 () Bool)

(assert (=> b!545896 m!523611))

(declare-fun m!523613 () Bool)

(assert (=> b!545895 m!523613))

(assert (=> b!545895 m!523579))

(assert (=> b!545895 m!523579))

(declare-fun m!523615 () Bool)

(assert (=> b!545895 m!523615))

(assert (=> b!545895 m!523615))

(assert (=> b!545895 m!523579))

(declare-fun m!523617 () Bool)

(assert (=> b!545895 m!523617))

(check-sat (not b!545893) (not b!545903) (not b!545905) (not b!545898) (not b!545899) (not b!545895) (not b!545894) (not b!545896) (not b!545902) (not b!545904) (not start!49648) (not b!545901))
(check-sat)
