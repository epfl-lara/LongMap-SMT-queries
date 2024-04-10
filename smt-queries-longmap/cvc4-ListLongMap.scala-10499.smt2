; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123574 () Bool)

(assert start!123574)

(declare-fun b!1432907 () Bool)

(declare-fun e!808801 () Bool)

(assert (=> b!1432907 (= e!808801 true)))

(declare-fun lt!630798 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432907 (= lt!630798 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432908 () Bool)

(declare-fun res!966777 () Bool)

(declare-fun e!808805 () Bool)

(assert (=> b!1432908 (=> (not res!966777) (not e!808805))))

(declare-datatypes ((array!97546 0))(
  ( (array!97547 (arr!47080 (Array (_ BitVec 32) (_ BitVec 64))) (size!47630 (_ BitVec 32))) )
))
(declare-fun lt!630793 () array!97546)

(declare-fun lt!630795 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11359 0))(
  ( (MissingZero!11359 (index!47828 (_ BitVec 32))) (Found!11359 (index!47829 (_ BitVec 32))) (Intermediate!11359 (undefined!12171 Bool) (index!47830 (_ BitVec 32)) (x!129465 (_ BitVec 32))) (Undefined!11359) (MissingVacant!11359 (index!47831 (_ BitVec 32))) )
))
(declare-fun lt!630794 () SeekEntryResult!11359)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97546 (_ BitVec 32)) SeekEntryResult!11359)

(assert (=> b!1432908 (= res!966777 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630795 lt!630793 mask!2608) lt!630794))))

(declare-fun b!1432909 () Bool)

(declare-fun res!966784 () Bool)

(assert (=> b!1432909 (=> (not res!966784) (not e!808805))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432909 (= res!966784 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432910 () Bool)

(declare-fun res!966771 () Bool)

(declare-fun e!808802 () Bool)

(assert (=> b!1432910 (=> (not res!966771) (not e!808802))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97546)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432910 (= res!966771 (and (= (size!47630 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47630 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47630 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432912 () Bool)

(declare-fun res!966773 () Bool)

(assert (=> b!1432912 (=> (not res!966773) (not e!808802))))

(declare-datatypes ((List!33590 0))(
  ( (Nil!33587) (Cons!33586 (h!34909 (_ BitVec 64)) (t!48284 List!33590)) )
))
(declare-fun arrayNoDuplicates!0 (array!97546 (_ BitVec 32) List!33590) Bool)

(assert (=> b!1432912 (= res!966773 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33587))))

(declare-fun b!1432913 () Bool)

(declare-fun res!966775 () Bool)

(assert (=> b!1432913 (=> (not res!966775) (not e!808805))))

(declare-fun lt!630797 () SeekEntryResult!11359)

(assert (=> b!1432913 (= res!966775 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47080 a!2831) j!81) a!2831 mask!2608) lt!630797))))

(declare-fun b!1432914 () Bool)

(declare-fun res!966774 () Bool)

(assert (=> b!1432914 (=> (not res!966774) (not e!808802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432914 (= res!966774 (validKeyInArray!0 (select (arr!47080 a!2831) j!81)))))

(declare-fun b!1432915 () Bool)

(declare-fun res!966782 () Bool)

(assert (=> b!1432915 (=> (not res!966782) (not e!808802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97546 (_ BitVec 32)) Bool)

(assert (=> b!1432915 (= res!966782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432916 () Bool)

(assert (=> b!1432916 (= e!808805 (not e!808801))))

(declare-fun res!966783 () Bool)

(assert (=> b!1432916 (=> res!966783 e!808801)))

(assert (=> b!1432916 (= res!966783 (or (= (select (arr!47080 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47080 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47080 a!2831) index!585) (select (arr!47080 a!2831) j!81)) (= (select (store (arr!47080 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808800 () Bool)

(assert (=> b!1432916 e!808800))

(declare-fun res!966772 () Bool)

(assert (=> b!1432916 (=> (not res!966772) (not e!808800))))

(assert (=> b!1432916 (= res!966772 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48464 0))(
  ( (Unit!48465) )
))
(declare-fun lt!630796 () Unit!48464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48464)

(assert (=> b!1432916 (= lt!630796 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432917 () Bool)

(declare-fun res!966778 () Bool)

(assert (=> b!1432917 (=> (not res!966778) (not e!808802))))

(assert (=> b!1432917 (= res!966778 (validKeyInArray!0 (select (arr!47080 a!2831) i!982)))))

(declare-fun b!1432918 () Bool)

(declare-fun e!808804 () Bool)

(assert (=> b!1432918 (= e!808802 e!808804)))

(declare-fun res!966779 () Bool)

(assert (=> b!1432918 (=> (not res!966779) (not e!808804))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432918 (= res!966779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47080 a!2831) j!81) mask!2608) (select (arr!47080 a!2831) j!81) a!2831 mask!2608) lt!630797))))

(assert (=> b!1432918 (= lt!630797 (Intermediate!11359 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432911 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97546 (_ BitVec 32)) SeekEntryResult!11359)

(assert (=> b!1432911 (= e!808800 (= (seekEntryOrOpen!0 (select (arr!47080 a!2831) j!81) a!2831 mask!2608) (Found!11359 j!81)))))

(declare-fun res!966776 () Bool)

(assert (=> start!123574 (=> (not res!966776) (not e!808802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123574 (= res!966776 (validMask!0 mask!2608))))

(assert (=> start!123574 e!808802))

(assert (=> start!123574 true))

(declare-fun array_inv!36108 (array!97546) Bool)

(assert (=> start!123574 (array_inv!36108 a!2831)))

(declare-fun b!1432919 () Bool)

(assert (=> b!1432919 (= e!808804 e!808805)))

(declare-fun res!966781 () Bool)

(assert (=> b!1432919 (=> (not res!966781) (not e!808805))))

(assert (=> b!1432919 (= res!966781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630795 mask!2608) lt!630795 lt!630793 mask!2608) lt!630794))))

(assert (=> b!1432919 (= lt!630794 (Intermediate!11359 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432919 (= lt!630795 (select (store (arr!47080 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432919 (= lt!630793 (array!97547 (store (arr!47080 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47630 a!2831)))))

(declare-fun b!1432920 () Bool)

(declare-fun res!966780 () Bool)

(assert (=> b!1432920 (=> (not res!966780) (not e!808802))))

(assert (=> b!1432920 (= res!966780 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47630 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47630 a!2831))))))

(assert (= (and start!123574 res!966776) b!1432910))

(assert (= (and b!1432910 res!966771) b!1432917))

(assert (= (and b!1432917 res!966778) b!1432914))

(assert (= (and b!1432914 res!966774) b!1432915))

(assert (= (and b!1432915 res!966782) b!1432912))

(assert (= (and b!1432912 res!966773) b!1432920))

(assert (= (and b!1432920 res!966780) b!1432918))

(assert (= (and b!1432918 res!966779) b!1432919))

(assert (= (and b!1432919 res!966781) b!1432913))

(assert (= (and b!1432913 res!966775) b!1432908))

(assert (= (and b!1432908 res!966777) b!1432909))

(assert (= (and b!1432909 res!966784) b!1432916))

(assert (= (and b!1432916 res!966772) b!1432911))

(assert (= (and b!1432916 (not res!966783)) b!1432907))

(declare-fun m!1322737 () Bool)

(assert (=> b!1432919 m!1322737))

(assert (=> b!1432919 m!1322737))

(declare-fun m!1322739 () Bool)

(assert (=> b!1432919 m!1322739))

(declare-fun m!1322741 () Bool)

(assert (=> b!1432919 m!1322741))

(declare-fun m!1322743 () Bool)

(assert (=> b!1432919 m!1322743))

(declare-fun m!1322745 () Bool)

(assert (=> start!123574 m!1322745))

(declare-fun m!1322747 () Bool)

(assert (=> start!123574 m!1322747))

(declare-fun m!1322749 () Bool)

(assert (=> b!1432908 m!1322749))

(declare-fun m!1322751 () Bool)

(assert (=> b!1432911 m!1322751))

(assert (=> b!1432911 m!1322751))

(declare-fun m!1322753 () Bool)

(assert (=> b!1432911 m!1322753))

(declare-fun m!1322755 () Bool)

(assert (=> b!1432912 m!1322755))

(declare-fun m!1322757 () Bool)

(assert (=> b!1432907 m!1322757))

(assert (=> b!1432918 m!1322751))

(assert (=> b!1432918 m!1322751))

(declare-fun m!1322759 () Bool)

(assert (=> b!1432918 m!1322759))

(assert (=> b!1432918 m!1322759))

(assert (=> b!1432918 m!1322751))

(declare-fun m!1322761 () Bool)

(assert (=> b!1432918 m!1322761))

(declare-fun m!1322763 () Bool)

(assert (=> b!1432915 m!1322763))

(declare-fun m!1322765 () Bool)

(assert (=> b!1432917 m!1322765))

(assert (=> b!1432917 m!1322765))

(declare-fun m!1322767 () Bool)

(assert (=> b!1432917 m!1322767))

(assert (=> b!1432913 m!1322751))

(assert (=> b!1432913 m!1322751))

(declare-fun m!1322769 () Bool)

(assert (=> b!1432913 m!1322769))

(assert (=> b!1432914 m!1322751))

(assert (=> b!1432914 m!1322751))

(declare-fun m!1322771 () Bool)

(assert (=> b!1432914 m!1322771))

(assert (=> b!1432916 m!1322741))

(declare-fun m!1322773 () Bool)

(assert (=> b!1432916 m!1322773))

(declare-fun m!1322775 () Bool)

(assert (=> b!1432916 m!1322775))

(declare-fun m!1322777 () Bool)

(assert (=> b!1432916 m!1322777))

(assert (=> b!1432916 m!1322751))

(declare-fun m!1322779 () Bool)

(assert (=> b!1432916 m!1322779))

(push 1)

