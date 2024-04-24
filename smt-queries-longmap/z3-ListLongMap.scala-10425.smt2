; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122900 () Bool)

(assert start!122900)

(declare-fun b!1422915 () Bool)

(declare-fun e!804602 () Bool)

(declare-fun e!804599 () Bool)

(assert (=> b!1422915 (= e!804602 e!804599)))

(declare-fun res!957675 () Bool)

(assert (=> b!1422915 (=> (not res!957675) (not e!804599))))

(declare-fun lt!626796 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11096 0))(
  ( (MissingZero!11096 (index!46776 (_ BitVec 32))) (Found!11096 (index!46777 (_ BitVec 32))) (Intermediate!11096 (undefined!11908 Bool) (index!46778 (_ BitVec 32)) (x!128581 (_ BitVec 32))) (Undefined!11096) (MissingVacant!11096 (index!46779 (_ BitVec 32))) )
))
(declare-fun lt!626795 () SeekEntryResult!11096)

(declare-datatypes ((array!97187 0))(
  ( (array!97188 (arr!46909 (Array (_ BitVec 32) (_ BitVec 64))) (size!47460 (_ BitVec 32))) )
))
(declare-fun lt!626798 () array!97187)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97187 (_ BitVec 32)) SeekEntryResult!11096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422915 (= res!957675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626796 mask!2608) lt!626796 lt!626798 mask!2608) lt!626795))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1422915 (= lt!626795 (Intermediate!11096 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97187)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422915 (= lt!626796 (select (store (arr!46909 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422915 (= lt!626798 (array!97188 (store (arr!46909 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47460 a!2831)))))

(declare-fun b!1422916 () Bool)

(declare-fun e!804600 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97187 (_ BitVec 32)) SeekEntryResult!11096)

(assert (=> b!1422916 (= e!804600 (= (seekEntryOrOpen!0 (select (arr!46909 a!2831) j!81) a!2831 mask!2608) (Found!11096 j!81)))))

(declare-fun res!957674 () Bool)

(declare-fun e!804601 () Bool)

(assert (=> start!122900 (=> (not res!957674) (not e!804601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122900 (= res!957674 (validMask!0 mask!2608))))

(assert (=> start!122900 e!804601))

(assert (=> start!122900 true))

(declare-fun array_inv!36190 (array!97187) Bool)

(assert (=> start!122900 (array_inv!36190 a!2831)))

(declare-fun b!1422917 () Bool)

(declare-fun res!957676 () Bool)

(assert (=> b!1422917 (=> (not res!957676) (not e!804601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97187 (_ BitVec 32)) Bool)

(assert (=> b!1422917 (= res!957676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422918 () Bool)

(declare-fun res!957671 () Bool)

(assert (=> b!1422918 (=> (not res!957671) (not e!804601))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422918 (= res!957671 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47460 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47460 a!2831))))))

(declare-fun b!1422919 () Bool)

(assert (=> b!1422919 (= e!804601 e!804602)))

(declare-fun res!957667 () Bool)

(assert (=> b!1422919 (=> (not res!957667) (not e!804602))))

(declare-fun lt!626794 () SeekEntryResult!11096)

(assert (=> b!1422919 (= res!957667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46909 a!2831) j!81) mask!2608) (select (arr!46909 a!2831) j!81) a!2831 mask!2608) lt!626794))))

(assert (=> b!1422919 (= lt!626794 (Intermediate!11096 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422920 () Bool)

(declare-fun res!957664 () Bool)

(assert (=> b!1422920 (=> (not res!957664) (not e!804599))))

(assert (=> b!1422920 (= res!957664 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626796 lt!626798 mask!2608) lt!626795))))

(declare-fun b!1422921 () Bool)

(declare-fun res!957670 () Bool)

(assert (=> b!1422921 (=> (not res!957670) (not e!804599))))

(assert (=> b!1422921 (= res!957670 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46909 a!2831) j!81) a!2831 mask!2608) lt!626794))))

(declare-fun b!1422922 () Bool)

(declare-fun res!957665 () Bool)

(assert (=> b!1422922 (=> (not res!957665) (not e!804601))))

(assert (=> b!1422922 (= res!957665 (and (= (size!47460 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47460 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47460 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422923 () Bool)

(assert (=> b!1422923 (= e!804599 (not (or (= (select (arr!46909 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46909 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46909 a!2831) index!585) (select (arr!46909 a!2831) j!81)) (= (select (store (arr!46909 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(assert (=> b!1422923 e!804600))

(declare-fun res!957669 () Bool)

(assert (=> b!1422923 (=> (not res!957669) (not e!804600))))

(assert (=> b!1422923 (= res!957669 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48059 0))(
  ( (Unit!48060) )
))
(declare-fun lt!626797 () Unit!48059)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48059)

(assert (=> b!1422923 (= lt!626797 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422924 () Bool)

(declare-fun res!957666 () Bool)

(assert (=> b!1422924 (=> (not res!957666) (not e!804601))))

(declare-datatypes ((List!33406 0))(
  ( (Nil!33403) (Cons!33402 (h!34712 (_ BitVec 64)) (t!48092 List!33406)) )
))
(declare-fun arrayNoDuplicates!0 (array!97187 (_ BitVec 32) List!33406) Bool)

(assert (=> b!1422924 (= res!957666 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33403))))

(declare-fun b!1422925 () Bool)

(declare-fun res!957673 () Bool)

(assert (=> b!1422925 (=> (not res!957673) (not e!804599))))

(assert (=> b!1422925 (= res!957673 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422926 () Bool)

(declare-fun res!957668 () Bool)

(assert (=> b!1422926 (=> (not res!957668) (not e!804601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422926 (= res!957668 (validKeyInArray!0 (select (arr!46909 a!2831) i!982)))))

(declare-fun b!1422927 () Bool)

(declare-fun res!957672 () Bool)

(assert (=> b!1422927 (=> (not res!957672) (not e!804601))))

(assert (=> b!1422927 (= res!957672 (validKeyInArray!0 (select (arr!46909 a!2831) j!81)))))

(assert (= (and start!122900 res!957674) b!1422922))

(assert (= (and b!1422922 res!957665) b!1422926))

(assert (= (and b!1422926 res!957668) b!1422927))

(assert (= (and b!1422927 res!957672) b!1422917))

(assert (= (and b!1422917 res!957676) b!1422924))

(assert (= (and b!1422924 res!957666) b!1422918))

(assert (= (and b!1422918 res!957671) b!1422919))

(assert (= (and b!1422919 res!957667) b!1422915))

(assert (= (and b!1422915 res!957675) b!1422921))

(assert (= (and b!1422921 res!957670) b!1422920))

(assert (= (and b!1422920 res!957664) b!1422925))

(assert (= (and b!1422925 res!957673) b!1422923))

(assert (= (and b!1422923 res!957669) b!1422916))

(declare-fun m!1313691 () Bool)

(assert (=> b!1422927 m!1313691))

(assert (=> b!1422927 m!1313691))

(declare-fun m!1313693 () Bool)

(assert (=> b!1422927 m!1313693))

(declare-fun m!1313695 () Bool)

(assert (=> b!1422926 m!1313695))

(assert (=> b!1422926 m!1313695))

(declare-fun m!1313697 () Bool)

(assert (=> b!1422926 m!1313697))

(assert (=> b!1422916 m!1313691))

(assert (=> b!1422916 m!1313691))

(declare-fun m!1313699 () Bool)

(assert (=> b!1422916 m!1313699))

(declare-fun m!1313701 () Bool)

(assert (=> b!1422915 m!1313701))

(assert (=> b!1422915 m!1313701))

(declare-fun m!1313703 () Bool)

(assert (=> b!1422915 m!1313703))

(declare-fun m!1313705 () Bool)

(assert (=> b!1422915 m!1313705))

(declare-fun m!1313707 () Bool)

(assert (=> b!1422915 m!1313707))

(assert (=> b!1422919 m!1313691))

(assert (=> b!1422919 m!1313691))

(declare-fun m!1313709 () Bool)

(assert (=> b!1422919 m!1313709))

(assert (=> b!1422919 m!1313709))

(assert (=> b!1422919 m!1313691))

(declare-fun m!1313711 () Bool)

(assert (=> b!1422919 m!1313711))

(assert (=> b!1422921 m!1313691))

(assert (=> b!1422921 m!1313691))

(declare-fun m!1313713 () Bool)

(assert (=> b!1422921 m!1313713))

(declare-fun m!1313715 () Bool)

(assert (=> b!1422920 m!1313715))

(assert (=> b!1422923 m!1313705))

(declare-fun m!1313717 () Bool)

(assert (=> b!1422923 m!1313717))

(declare-fun m!1313719 () Bool)

(assert (=> b!1422923 m!1313719))

(declare-fun m!1313721 () Bool)

(assert (=> b!1422923 m!1313721))

(assert (=> b!1422923 m!1313691))

(declare-fun m!1313723 () Bool)

(assert (=> b!1422923 m!1313723))

(declare-fun m!1313725 () Bool)

(assert (=> b!1422917 m!1313725))

(declare-fun m!1313727 () Bool)

(assert (=> b!1422924 m!1313727))

(declare-fun m!1313729 () Bool)

(assert (=> start!122900 m!1313729))

(declare-fun m!1313731 () Bool)

(assert (=> start!122900 m!1313731))

(check-sat (not b!1422920) (not b!1422924) (not b!1422915) (not start!122900) (not b!1422919) (not b!1422916) (not b!1422921) (not b!1422917) (not b!1422923) (not b!1422926) (not b!1422927))
(check-sat)
