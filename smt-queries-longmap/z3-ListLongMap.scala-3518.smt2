; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48680 () Bool)

(assert start!48680)

(declare-fun b!534901 () Bool)

(declare-fun res!330110 () Bool)

(declare-fun e!310855 () Bool)

(assert (=> b!534901 (=> (not res!330110) (not e!310855))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534901 (= res!330110 (validKeyInArray!0 k0!1998))))

(declare-fun b!534902 () Bool)

(declare-fun res!330115 () Bool)

(declare-fun e!310857 () Bool)

(assert (=> b!534902 (=> (not res!330115) (not e!310857))))

(declare-datatypes ((array!33892 0))(
  ( (array!33893 (arr!16285 (Array (_ BitVec 32) (_ BitVec 64))) (size!16649 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33892)

(declare-datatypes ((List!10404 0))(
  ( (Nil!10401) (Cons!10400 (h!11343 (_ BitVec 64)) (t!16632 List!10404)) )
))
(declare-fun arrayNoDuplicates!0 (array!33892 (_ BitVec 32) List!10404) Bool)

(assert (=> b!534902 (= res!330115 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10401))))

(declare-fun b!534903 () Bool)

(declare-fun res!330111 () Bool)

(assert (=> b!534903 (=> (not res!330111) (not e!310857))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33892 (_ BitVec 32)) Bool)

(assert (=> b!534903 (= res!330111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!330116 () Bool)

(assert (=> start!48680 (=> (not res!330116) (not e!310855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48680 (= res!330116 (validMask!0 mask!3216))))

(assert (=> start!48680 e!310855))

(assert (=> start!48680 true))

(declare-fun array_inv!12081 (array!33892) Bool)

(assert (=> start!48680 (array_inv!12081 a!3154)))

(declare-fun b!534904 () Bool)

(assert (=> b!534904 (= e!310855 e!310857)))

(declare-fun res!330106 () Bool)

(assert (=> b!534904 (=> (not res!330106) (not e!310857))))

(declare-datatypes ((SeekEntryResult!4743 0))(
  ( (MissingZero!4743 (index!21196 (_ BitVec 32))) (Found!4743 (index!21197 (_ BitVec 32))) (Intermediate!4743 (undefined!5555 Bool) (index!21198 (_ BitVec 32)) (x!50150 (_ BitVec 32))) (Undefined!4743) (MissingVacant!4743 (index!21199 (_ BitVec 32))) )
))
(declare-fun lt!245724 () SeekEntryResult!4743)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534904 (= res!330106 (or (= lt!245724 (MissingZero!4743 i!1153)) (= lt!245724 (MissingVacant!4743 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33892 (_ BitVec 32)) SeekEntryResult!4743)

(assert (=> b!534904 (= lt!245724 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun e!310854 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun b!534905 () Bool)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!534905 (= e!310854 (and (not (= (select (arr!16285 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16285 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16285 a!3154) index!1177) (select (arr!16285 a!3154) j!147)) (= index!1177 resIndex!32) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!534906 () Bool)

(declare-fun res!330107 () Bool)

(assert (=> b!534906 (=> (not res!330107) (not e!310855))))

(declare-fun arrayContainsKey!0 (array!33892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534906 (= res!330107 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534907 () Bool)

(declare-fun res!330112 () Bool)

(assert (=> b!534907 (=> (not res!330112) (not e!310857))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534907 (= res!330112 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16649 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16649 a!3154)) (= (select (arr!16285 a!3154) resIndex!32) (select (arr!16285 a!3154) j!147))))))

(declare-fun b!534908 () Bool)

(declare-fun res!330109 () Bool)

(assert (=> b!534908 (=> (not res!330109) (not e!310855))))

(assert (=> b!534908 (= res!330109 (and (= (size!16649 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16649 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16649 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534909 () Bool)

(declare-fun res!330108 () Bool)

(assert (=> b!534909 (=> (not res!330108) (not e!310854))))

(declare-fun lt!245725 () SeekEntryResult!4743)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33892 (_ BitVec 32)) SeekEntryResult!4743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534909 (= res!330108 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16285 a!3154) j!147) mask!3216) (select (arr!16285 a!3154) j!147) a!3154 mask!3216) lt!245725))))

(declare-fun b!534910 () Bool)

(declare-fun res!330113 () Bool)

(assert (=> b!534910 (=> (not res!330113) (not e!310855))))

(assert (=> b!534910 (= res!330113 (validKeyInArray!0 (select (arr!16285 a!3154) j!147)))))

(declare-fun b!534911 () Bool)

(assert (=> b!534911 (= e!310857 e!310854)))

(declare-fun res!330114 () Bool)

(assert (=> b!534911 (=> (not res!330114) (not e!310854))))

(assert (=> b!534911 (= res!330114 (= lt!245725 (Intermediate!4743 false resIndex!32 resX!32)))))

(assert (=> b!534911 (= lt!245725 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16285 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48680 res!330116) b!534908))

(assert (= (and b!534908 res!330109) b!534910))

(assert (= (and b!534910 res!330113) b!534901))

(assert (= (and b!534901 res!330110) b!534906))

(assert (= (and b!534906 res!330107) b!534904))

(assert (= (and b!534904 res!330106) b!534903))

(assert (= (and b!534903 res!330111) b!534902))

(assert (= (and b!534902 res!330115) b!534907))

(assert (= (and b!534907 res!330112) b!534911))

(assert (= (and b!534911 res!330114) b!534909))

(assert (= (and b!534909 res!330108) b!534905))

(declare-fun m!514555 () Bool)

(assert (=> b!534909 m!514555))

(assert (=> b!534909 m!514555))

(declare-fun m!514557 () Bool)

(assert (=> b!534909 m!514557))

(assert (=> b!534909 m!514557))

(assert (=> b!534909 m!514555))

(declare-fun m!514559 () Bool)

(assert (=> b!534909 m!514559))

(declare-fun m!514561 () Bool)

(assert (=> b!534907 m!514561))

(assert (=> b!534907 m!514555))

(declare-fun m!514563 () Bool)

(assert (=> b!534903 m!514563))

(assert (=> b!534910 m!514555))

(assert (=> b!534910 m!514555))

(declare-fun m!514565 () Bool)

(assert (=> b!534910 m!514565))

(declare-fun m!514567 () Bool)

(assert (=> b!534902 m!514567))

(assert (=> b!534911 m!514555))

(assert (=> b!534911 m!514555))

(declare-fun m!514569 () Bool)

(assert (=> b!534911 m!514569))

(declare-fun m!514571 () Bool)

(assert (=> b!534901 m!514571))

(declare-fun m!514573 () Bool)

(assert (=> b!534906 m!514573))

(declare-fun m!514575 () Bool)

(assert (=> b!534905 m!514575))

(assert (=> b!534905 m!514555))

(declare-fun m!514577 () Bool)

(assert (=> b!534904 m!514577))

(declare-fun m!514579 () Bool)

(assert (=> start!48680 m!514579))

(declare-fun m!514581 () Bool)

(assert (=> start!48680 m!514581))

(check-sat (not b!534901) (not b!534910) (not b!534911) (not b!534903) (not b!534902) (not start!48680) (not b!534906) (not b!534909) (not b!534904))
(check-sat)
