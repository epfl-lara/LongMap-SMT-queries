; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124096 () Bool)

(assert start!124096)

(declare-fun b!1436676 () Bool)

(declare-fun res!968845 () Bool)

(declare-fun e!810953 () Bool)

(assert (=> b!1436676 (=> (not res!968845) (not e!810953))))

(declare-datatypes ((array!97721 0))(
  ( (array!97722 (arr!47158 (Array (_ BitVec 32) (_ BitVec 64))) (size!47709 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97721)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436676 (= res!968845 (validKeyInArray!0 (select (arr!47158 a!2831) j!81)))))

(declare-fun b!1436677 () Bool)

(declare-fun e!810950 () Bool)

(declare-fun e!810951 () Bool)

(assert (=> b!1436677 (= e!810950 e!810951)))

(declare-fun res!968860 () Bool)

(assert (=> b!1436677 (=> res!968860 e!810951)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!632329 () (_ BitVec 32))

(assert (=> b!1436677 (= res!968860 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!632329 #b00000000000000000000000000000000) (bvsge lt!632329 (size!47709 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436677 (= lt!632329 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1436678 () Bool)

(declare-fun res!968854 () Bool)

(assert (=> b!1436678 (=> (not res!968854) (not e!810953))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1436678 (= res!968854 (validKeyInArray!0 (select (arr!47158 a!2831) i!982)))))

(declare-fun b!1436679 () Bool)

(assert (=> b!1436679 (= e!810951 true)))

(declare-datatypes ((SeekEntryResult!11339 0))(
  ( (MissingZero!11339 (index!47748 (_ BitVec 32))) (Found!11339 (index!47749 (_ BitVec 32))) (Intermediate!11339 (undefined!12151 Bool) (index!47750 (_ BitVec 32)) (x!129577 (_ BitVec 32))) (Undefined!11339) (MissingVacant!11339 (index!47751 (_ BitVec 32))) )
))
(declare-fun lt!632331 () SeekEntryResult!11339)

(declare-fun lt!632328 () array!97721)

(declare-fun lt!632330 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97721 (_ BitVec 32)) SeekEntryResult!11339)

(assert (=> b!1436679 (= lt!632331 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!632329 lt!632330 lt!632328 mask!2608))))

(declare-fun b!1436680 () Bool)

(declare-fun res!968857 () Bool)

(declare-fun e!810947 () Bool)

(assert (=> b!1436680 (=> (not res!968857) (not e!810947))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1436680 (= res!968857 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1436681 () Bool)

(declare-fun res!968852 () Bool)

(assert (=> b!1436681 (=> (not res!968852) (not e!810953))))

(assert (=> b!1436681 (= res!968852 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47709 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47709 a!2831))))))

(declare-fun b!1436682 () Bool)

(declare-fun e!810948 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97721 (_ BitVec 32)) SeekEntryResult!11339)

(assert (=> b!1436682 (= e!810948 (= (seekEntryOrOpen!0 (select (arr!47158 a!2831) j!81) a!2831 mask!2608) (Found!11339 j!81)))))

(declare-fun b!1436684 () Bool)

(assert (=> b!1436684 (= e!810947 (not e!810950))))

(declare-fun res!968850 () Bool)

(assert (=> b!1436684 (=> res!968850 e!810950)))

(assert (=> b!1436684 (= res!968850 (or (= (select (arr!47158 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47158 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47158 a!2831) index!585) (select (arr!47158 a!2831) j!81)) (= (select (store (arr!47158 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1436684 e!810948))

(declare-fun res!968848 () Bool)

(assert (=> b!1436684 (=> (not res!968848) (not e!810948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97721 (_ BitVec 32)) Bool)

(assert (=> b!1436684 (= res!968848 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48455 0))(
  ( (Unit!48456) )
))
(declare-fun lt!632327 () Unit!48455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48455)

(assert (=> b!1436684 (= lt!632327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1436685 () Bool)

(declare-fun e!810952 () Bool)

(assert (=> b!1436685 (= e!810953 e!810952)))

(declare-fun res!968853 () Bool)

(assert (=> b!1436685 (=> (not res!968853) (not e!810952))))

(declare-fun lt!632333 () SeekEntryResult!11339)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436685 (= res!968853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47158 a!2831) j!81) mask!2608) (select (arr!47158 a!2831) j!81) a!2831 mask!2608) lt!632333))))

(assert (=> b!1436685 (= lt!632333 (Intermediate!11339 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1436686 () Bool)

(declare-fun res!968859 () Bool)

(assert (=> b!1436686 (=> (not res!968859) (not e!810953))))

(assert (=> b!1436686 (= res!968859 (and (= (size!47709 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47709 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47709 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1436687 () Bool)

(declare-fun res!968847 () Bool)

(assert (=> b!1436687 (=> (not res!968847) (not e!810953))))

(assert (=> b!1436687 (= res!968847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1436688 () Bool)

(declare-fun res!968846 () Bool)

(assert (=> b!1436688 (=> (not res!968846) (not e!810947))))

(declare-fun lt!632332 () SeekEntryResult!11339)

(assert (=> b!1436688 (= res!968846 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!632330 lt!632328 mask!2608) lt!632332))))

(declare-fun b!1436689 () Bool)

(assert (=> b!1436689 (= e!810952 e!810947)))

(declare-fun res!968858 () Bool)

(assert (=> b!1436689 (=> (not res!968858) (not e!810947))))

(assert (=> b!1436689 (= res!968858 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!632330 mask!2608) lt!632330 lt!632328 mask!2608) lt!632332))))

(assert (=> b!1436689 (= lt!632332 (Intermediate!11339 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1436689 (= lt!632330 (select (store (arr!47158 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1436689 (= lt!632328 (array!97722 (store (arr!47158 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47709 a!2831)))))

(declare-fun res!968856 () Bool)

(assert (=> start!124096 (=> (not res!968856) (not e!810953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124096 (= res!968856 (validMask!0 mask!2608))))

(assert (=> start!124096 e!810953))

(assert (=> start!124096 true))

(declare-fun array_inv!36439 (array!97721) Bool)

(assert (=> start!124096 (array_inv!36439 a!2831)))

(declare-fun b!1436683 () Bool)

(declare-fun res!968855 () Bool)

(assert (=> b!1436683 (=> res!968855 e!810951)))

(assert (=> b!1436683 (= res!968855 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!632329 (select (arr!47158 a!2831) j!81) a!2831 mask!2608) lt!632333)))))

(declare-fun b!1436690 () Bool)

(declare-fun res!968851 () Bool)

(assert (=> b!1436690 (=> (not res!968851) (not e!810947))))

(assert (=> b!1436690 (= res!968851 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47158 a!2831) j!81) a!2831 mask!2608) lt!632333))))

(declare-fun b!1436691 () Bool)

(declare-fun res!968849 () Bool)

(assert (=> b!1436691 (=> (not res!968849) (not e!810953))))

(declare-datatypes ((List!33655 0))(
  ( (Nil!33652) (Cons!33651 (h!34997 (_ BitVec 64)) (t!48341 List!33655)) )
))
(declare-fun arrayNoDuplicates!0 (array!97721 (_ BitVec 32) List!33655) Bool)

(assert (=> b!1436691 (= res!968849 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33652))))

(assert (= (and start!124096 res!968856) b!1436686))

(assert (= (and b!1436686 res!968859) b!1436678))

(assert (= (and b!1436678 res!968854) b!1436676))

(assert (= (and b!1436676 res!968845) b!1436687))

(assert (= (and b!1436687 res!968847) b!1436691))

(assert (= (and b!1436691 res!968849) b!1436681))

(assert (= (and b!1436681 res!968852) b!1436685))

(assert (= (and b!1436685 res!968853) b!1436689))

(assert (= (and b!1436689 res!968858) b!1436690))

(assert (= (and b!1436690 res!968851) b!1436688))

(assert (= (and b!1436688 res!968846) b!1436680))

(assert (= (and b!1436680 res!968857) b!1436684))

(assert (= (and b!1436684 res!968848) b!1436682))

(assert (= (and b!1436684 (not res!968850)) b!1436677))

(assert (= (and b!1436677 (not res!968860)) b!1436683))

(assert (= (and b!1436683 (not res!968855)) b!1436679))

(declare-fun m!1326163 () Bool)

(assert (=> b!1436684 m!1326163))

(declare-fun m!1326165 () Bool)

(assert (=> b!1436684 m!1326165))

(declare-fun m!1326167 () Bool)

(assert (=> b!1436684 m!1326167))

(declare-fun m!1326169 () Bool)

(assert (=> b!1436684 m!1326169))

(declare-fun m!1326171 () Bool)

(assert (=> b!1436684 m!1326171))

(declare-fun m!1326173 () Bool)

(assert (=> b!1436684 m!1326173))

(assert (=> b!1436682 m!1326171))

(assert (=> b!1436682 m!1326171))

(declare-fun m!1326175 () Bool)

(assert (=> b!1436682 m!1326175))

(declare-fun m!1326177 () Bool)

(assert (=> b!1436687 m!1326177))

(assert (=> b!1436685 m!1326171))

(assert (=> b!1436685 m!1326171))

(declare-fun m!1326179 () Bool)

(assert (=> b!1436685 m!1326179))

(assert (=> b!1436685 m!1326179))

(assert (=> b!1436685 m!1326171))

(declare-fun m!1326181 () Bool)

(assert (=> b!1436685 m!1326181))

(declare-fun m!1326183 () Bool)

(assert (=> b!1436679 m!1326183))

(declare-fun m!1326185 () Bool)

(assert (=> b!1436691 m!1326185))

(declare-fun m!1326187 () Bool)

(assert (=> start!124096 m!1326187))

(declare-fun m!1326189 () Bool)

(assert (=> start!124096 m!1326189))

(declare-fun m!1326191 () Bool)

(assert (=> b!1436688 m!1326191))

(assert (=> b!1436683 m!1326171))

(assert (=> b!1436683 m!1326171))

(declare-fun m!1326193 () Bool)

(assert (=> b!1436683 m!1326193))

(declare-fun m!1326195 () Bool)

(assert (=> b!1436677 m!1326195))

(assert (=> b!1436690 m!1326171))

(assert (=> b!1436690 m!1326171))

(declare-fun m!1326197 () Bool)

(assert (=> b!1436690 m!1326197))

(declare-fun m!1326199 () Bool)

(assert (=> b!1436689 m!1326199))

(assert (=> b!1436689 m!1326199))

(declare-fun m!1326201 () Bool)

(assert (=> b!1436689 m!1326201))

(assert (=> b!1436689 m!1326163))

(declare-fun m!1326203 () Bool)

(assert (=> b!1436689 m!1326203))

(declare-fun m!1326205 () Bool)

(assert (=> b!1436678 m!1326205))

(assert (=> b!1436678 m!1326205))

(declare-fun m!1326207 () Bool)

(assert (=> b!1436678 m!1326207))

(assert (=> b!1436676 m!1326171))

(assert (=> b!1436676 m!1326171))

(declare-fun m!1326209 () Bool)

(assert (=> b!1436676 m!1326209))

(check-sat (not b!1436688) (not start!124096) (not b!1436690) (not b!1436689) (not b!1436678) (not b!1436683) (not b!1436679) (not b!1436691) (not b!1436676) (not b!1436685) (not b!1436682) (not b!1436677) (not b!1436687) (not b!1436684))
(check-sat)
