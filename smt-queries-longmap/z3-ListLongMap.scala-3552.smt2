; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48884 () Bool)

(assert start!48884)

(declare-fun b!538718 () Bool)

(declare-fun e!312378 () Bool)

(declare-fun e!312374 () Bool)

(assert (=> b!538718 (= e!312378 e!312374)))

(declare-fun res!333923 () Bool)

(assert (=> b!538718 (=> (not res!333923) (not e!312374))))

(declare-datatypes ((SeekEntryResult!4845 0))(
  ( (MissingZero!4845 (index!21604 (_ BitVec 32))) (Found!4845 (index!21605 (_ BitVec 32))) (Intermediate!4845 (undefined!5657 Bool) (index!21606 (_ BitVec 32)) (x!50524 (_ BitVec 32))) (Undefined!4845) (MissingVacant!4845 (index!21607 (_ BitVec 32))) )
))
(declare-fun lt!246923 () SeekEntryResult!4845)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538718 (= res!333923 (or (= lt!246923 (MissingZero!4845 i!1153)) (= lt!246923 (MissingVacant!4845 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34096 0))(
  ( (array!34097 (arr!16387 (Array (_ BitVec 32) (_ BitVec 64))) (size!16751 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34096)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34096 (_ BitVec 32)) SeekEntryResult!4845)

(assert (=> b!538718 (= lt!246923 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538719 () Bool)

(declare-fun e!312376 () Bool)

(declare-fun e!312372 () Bool)

(assert (=> b!538719 (= e!312376 e!312372)))

(declare-fun res!333925 () Bool)

(assert (=> b!538719 (=> (not res!333925) (not e!312372))))

(declare-fun lt!246920 () SeekEntryResult!4845)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!246922 () SeekEntryResult!4845)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538719 (= res!333925 (and (= lt!246922 lt!246920) (not (= (select (arr!16387 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16387 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16387 a!3154) index!1177) (select (arr!16387 a!3154) j!147)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34096 (_ BitVec 32)) SeekEntryResult!4845)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538719 (= lt!246922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16387 a!3154) j!147) mask!3216) (select (arr!16387 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538720 () Bool)

(declare-fun res!333935 () Bool)

(assert (=> b!538720 (=> (not res!333935) (not e!312378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538720 (= res!333935 (validKeyInArray!0 (select (arr!16387 a!3154) j!147)))))

(declare-fun res!333924 () Bool)

(assert (=> start!48884 (=> (not res!333924) (not e!312378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48884 (= res!333924 (validMask!0 mask!3216))))

(assert (=> start!48884 e!312378))

(assert (=> start!48884 true))

(declare-fun array_inv!12183 (array!34096) Bool)

(assert (=> start!48884 (array_inv!12183 a!3154)))

(declare-fun b!538721 () Bool)

(declare-fun res!333932 () Bool)

(assert (=> b!538721 (=> (not res!333932) (not e!312378))))

(assert (=> b!538721 (= res!333932 (and (= (size!16751 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16751 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16751 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538722 () Bool)

(assert (=> b!538722 (= e!312374 e!312376)))

(declare-fun res!333926 () Bool)

(assert (=> b!538722 (=> (not res!333926) (not e!312376))))

(declare-fun lt!246921 () SeekEntryResult!4845)

(assert (=> b!538722 (= res!333926 (= lt!246920 lt!246921))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538722 (= lt!246921 (Intermediate!4845 false resIndex!32 resX!32))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!538722 (= lt!246920 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16387 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538723 () Bool)

(declare-fun e!312375 () Bool)

(declare-fun e!312373 () Bool)

(assert (=> b!538723 (= e!312375 e!312373)))

(declare-fun res!333928 () Bool)

(assert (=> b!538723 (=> (not res!333928) (not e!312373))))

(declare-fun lt!246924 () SeekEntryResult!4845)

(assert (=> b!538723 (= res!333928 (and (= lt!246924 lt!246921) (= lt!246922 lt!246924)))))

(declare-fun lt!246925 () (_ BitVec 32))

(assert (=> b!538723 (= lt!246924 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246925 (select (arr!16387 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538724 () Bool)

(assert (=> b!538724 (= e!312373 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110))))))

(assert (=> b!538724 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246925 (select (store (arr!16387 a!3154) i!1153 k0!1998) j!147) (array!34097 (store (arr!16387 a!3154) i!1153 k0!1998) (size!16751 a!3154)) mask!3216) lt!246921)))

(declare-datatypes ((Unit!16874 0))(
  ( (Unit!16875) )
))
(declare-fun lt!246919 () Unit!16874)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34096 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16874)

(assert (=> b!538724 (= lt!246919 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246925 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538725 () Bool)

(declare-fun res!333931 () Bool)

(assert (=> b!538725 (=> (not res!333931) (not e!312374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34096 (_ BitVec 32)) Bool)

(assert (=> b!538725 (= res!333931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538726 () Bool)

(assert (=> b!538726 (= e!312372 e!312375)))

(declare-fun res!333927 () Bool)

(assert (=> b!538726 (=> (not res!333927) (not e!312375))))

(assert (=> b!538726 (= res!333927 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246925 #b00000000000000000000000000000000) (bvslt lt!246925 (size!16751 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538726 (= lt!246925 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538727 () Bool)

(declare-fun res!333929 () Bool)

(assert (=> b!538727 (=> (not res!333929) (not e!312374))))

(assert (=> b!538727 (= res!333929 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16751 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16751 a!3154)) (= (select (arr!16387 a!3154) resIndex!32) (select (arr!16387 a!3154) j!147))))))

(declare-fun b!538728 () Bool)

(declare-fun res!333930 () Bool)

(assert (=> b!538728 (=> (not res!333930) (not e!312378))))

(declare-fun arrayContainsKey!0 (array!34096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538728 (= res!333930 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538729 () Bool)

(declare-fun res!333934 () Bool)

(assert (=> b!538729 (=> (not res!333934) (not e!312374))))

(declare-datatypes ((List!10506 0))(
  ( (Nil!10503) (Cons!10502 (h!11445 (_ BitVec 64)) (t!16734 List!10506)) )
))
(declare-fun arrayNoDuplicates!0 (array!34096 (_ BitVec 32) List!10506) Bool)

(assert (=> b!538729 (= res!333934 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10503))))

(declare-fun b!538730 () Bool)

(declare-fun res!333933 () Bool)

(assert (=> b!538730 (=> (not res!333933) (not e!312378))))

(assert (=> b!538730 (= res!333933 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48884 res!333924) b!538721))

(assert (= (and b!538721 res!333932) b!538720))

(assert (= (and b!538720 res!333935) b!538730))

(assert (= (and b!538730 res!333933) b!538728))

(assert (= (and b!538728 res!333930) b!538718))

(assert (= (and b!538718 res!333923) b!538725))

(assert (= (and b!538725 res!333931) b!538729))

(assert (= (and b!538729 res!333934) b!538727))

(assert (= (and b!538727 res!333929) b!538722))

(assert (= (and b!538722 res!333926) b!538719))

(assert (= (and b!538719 res!333925) b!538726))

(assert (= (and b!538726 res!333927) b!538723))

(assert (= (and b!538723 res!333928) b!538724))

(declare-fun m!517825 () Bool)

(assert (=> b!538726 m!517825))

(declare-fun m!517827 () Bool)

(assert (=> b!538723 m!517827))

(assert (=> b!538723 m!517827))

(declare-fun m!517829 () Bool)

(assert (=> b!538723 m!517829))

(declare-fun m!517831 () Bool)

(assert (=> b!538724 m!517831))

(declare-fun m!517833 () Bool)

(assert (=> b!538724 m!517833))

(assert (=> b!538724 m!517833))

(declare-fun m!517835 () Bool)

(assert (=> b!538724 m!517835))

(declare-fun m!517837 () Bool)

(assert (=> b!538724 m!517837))

(declare-fun m!517839 () Bool)

(assert (=> b!538728 m!517839))

(assert (=> b!538720 m!517827))

(assert (=> b!538720 m!517827))

(declare-fun m!517841 () Bool)

(assert (=> b!538720 m!517841))

(declare-fun m!517843 () Bool)

(assert (=> b!538727 m!517843))

(assert (=> b!538727 m!517827))

(assert (=> b!538722 m!517827))

(assert (=> b!538722 m!517827))

(declare-fun m!517845 () Bool)

(assert (=> b!538722 m!517845))

(declare-fun m!517847 () Bool)

(assert (=> b!538719 m!517847))

(assert (=> b!538719 m!517827))

(assert (=> b!538719 m!517827))

(declare-fun m!517849 () Bool)

(assert (=> b!538719 m!517849))

(assert (=> b!538719 m!517849))

(assert (=> b!538719 m!517827))

(declare-fun m!517851 () Bool)

(assert (=> b!538719 m!517851))

(declare-fun m!517853 () Bool)

(assert (=> b!538729 m!517853))

(declare-fun m!517855 () Bool)

(assert (=> b!538718 m!517855))

(declare-fun m!517857 () Bool)

(assert (=> b!538730 m!517857))

(declare-fun m!517859 () Bool)

(assert (=> b!538725 m!517859))

(declare-fun m!517861 () Bool)

(assert (=> start!48884 m!517861))

(declare-fun m!517863 () Bool)

(assert (=> start!48884 m!517863))

(check-sat (not b!538722) (not b!538719) (not b!538729) (not b!538726) (not b!538730) (not b!538728) (not b!538718) (not b!538725) (not b!538720) (not b!538724) (not b!538723) (not start!48884))
(check-sat)
