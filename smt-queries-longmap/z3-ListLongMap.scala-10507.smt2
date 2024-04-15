; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123782 () Bool)

(assert start!123782)

(declare-fun b!1434630 () Bool)

(declare-fun res!967984 () Bool)

(declare-fun e!809694 () Bool)

(assert (=> b!1434630 (=> (not res!967984) (not e!809694))))

(declare-datatypes ((array!97548 0))(
  ( (array!97549 (arr!47077 (Array (_ BitVec 32) (_ BitVec 64))) (size!47629 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97548)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434630 (= res!967984 (validKeyInArray!0 (select (arr!47077 a!2831) j!81)))))

(declare-fun b!1434631 () Bool)

(declare-fun e!809698 () Bool)

(declare-fun e!809695 () Bool)

(assert (=> b!1434631 (= e!809698 e!809695)))

(declare-fun res!967990 () Bool)

(assert (=> b!1434631 (=> (not res!967990) (not e!809695))))

(declare-datatypes ((SeekEntryResult!11383 0))(
  ( (MissingZero!11383 (index!47924 (_ BitVec 32))) (Found!11383 (index!47925 (_ BitVec 32))) (Intermediate!11383 (undefined!12195 Bool) (index!47926 (_ BitVec 32)) (x!129575 (_ BitVec 32))) (Undefined!11383) (MissingVacant!11383 (index!47927 (_ BitVec 32))) )
))
(declare-fun lt!631398 () SeekEntryResult!11383)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!631393 () array!97548)

(declare-fun lt!631394 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97548 (_ BitVec 32)) SeekEntryResult!11383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434631 (= res!967990 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631394 mask!2608) lt!631394 lt!631393 mask!2608) lt!631398))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434631 (= lt!631398 (Intermediate!11383 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434631 (= lt!631394 (select (store (arr!47077 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434631 (= lt!631393 (array!97549 (store (arr!47077 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47629 a!2831)))))

(declare-fun b!1434632 () Bool)

(declare-fun e!809700 () Bool)

(declare-fun e!809696 () Bool)

(assert (=> b!1434632 (= e!809700 e!809696)))

(declare-fun res!967983 () Bool)

(assert (=> b!1434632 (=> res!967983 e!809696)))

(declare-fun lt!631396 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1434632 (= res!967983 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631396 #b00000000000000000000000000000000) (bvsge lt!631396 (size!47629 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434632 (= lt!631396 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434633 () Bool)

(declare-fun res!967980 () Bool)

(assert (=> b!1434633 (=> (not res!967980) (not e!809695))))

(declare-fun lt!631395 () SeekEntryResult!11383)

(assert (=> b!1434633 (= res!967980 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!631395))))

(declare-fun b!1434634 () Bool)

(assert (=> b!1434634 (= e!809694 e!809698)))

(declare-fun res!967992 () Bool)

(assert (=> b!1434634 (=> (not res!967992) (not e!809698))))

(assert (=> b!1434634 (= res!967992 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!631395))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1434634 (= lt!631395 (Intermediate!11383 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434635 () Bool)

(declare-fun res!967987 () Bool)

(assert (=> b!1434635 (=> res!967987 e!809696)))

(assert (=> b!1434635 (= res!967987 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631396 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!631395)))))

(declare-fun e!809697 () Bool)

(declare-fun b!1434636 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97548 (_ BitVec 32)) SeekEntryResult!11383)

(assert (=> b!1434636 (= e!809697 (= (seekEntryOrOpen!0 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) (Found!11383 j!81)))))

(declare-fun b!1434637 () Bool)

(assert (=> b!1434637 (= e!809696 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631396 lt!631394 lt!631393 mask!2608) lt!631398))))

(declare-fun b!1434638 () Bool)

(declare-fun res!967979 () Bool)

(assert (=> b!1434638 (=> (not res!967979) (not e!809694))))

(assert (=> b!1434638 (= res!967979 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47629 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47629 a!2831))))))

(declare-fun res!967993 () Bool)

(assert (=> start!123782 (=> (not res!967993) (not e!809694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123782 (= res!967993 (validMask!0 mask!2608))))

(assert (=> start!123782 e!809694))

(assert (=> start!123782 true))

(declare-fun array_inv!36310 (array!97548) Bool)

(assert (=> start!123782 (array_inv!36310 a!2831)))

(declare-fun b!1434639 () Bool)

(declare-fun res!967978 () Bool)

(assert (=> b!1434639 (=> (not res!967978) (not e!809695))))

(assert (=> b!1434639 (= res!967978 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434640 () Bool)

(declare-fun res!967985 () Bool)

(assert (=> b!1434640 (=> (not res!967985) (not e!809694))))

(assert (=> b!1434640 (= res!967985 (and (= (size!47629 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47629 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47629 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434641 () Bool)

(declare-fun res!967988 () Bool)

(assert (=> b!1434641 (=> (not res!967988) (not e!809694))))

(assert (=> b!1434641 (= res!967988 (validKeyInArray!0 (select (arr!47077 a!2831) i!982)))))

(declare-fun b!1434642 () Bool)

(declare-fun res!967982 () Bool)

(assert (=> b!1434642 (=> (not res!967982) (not e!809694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97548 (_ BitVec 32)) Bool)

(assert (=> b!1434642 (= res!967982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434643 () Bool)

(declare-fun res!967989 () Bool)

(assert (=> b!1434643 (=> (not res!967989) (not e!809694))))

(declare-datatypes ((List!33665 0))(
  ( (Nil!33662) (Cons!33661 (h!34993 (_ BitVec 64)) (t!48351 List!33665)) )
))
(declare-fun arrayNoDuplicates!0 (array!97548 (_ BitVec 32) List!33665) Bool)

(assert (=> b!1434643 (= res!967989 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33662))))

(declare-fun b!1434644 () Bool)

(assert (=> b!1434644 (= e!809695 (not e!809700))))

(declare-fun res!967981 () Bool)

(assert (=> b!1434644 (=> res!967981 e!809700)))

(assert (=> b!1434644 (= res!967981 (or (= (select (arr!47077 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47077 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47077 a!2831) index!585) (select (arr!47077 a!2831) j!81)) (= (select (store (arr!47077 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434644 e!809697))

(declare-fun res!967991 () Bool)

(assert (=> b!1434644 (=> (not res!967991) (not e!809697))))

(assert (=> b!1434644 (= res!967991 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48351 0))(
  ( (Unit!48352) )
))
(declare-fun lt!631397 () Unit!48351)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48351)

(assert (=> b!1434644 (= lt!631397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434645 () Bool)

(declare-fun res!967986 () Bool)

(assert (=> b!1434645 (=> (not res!967986) (not e!809695))))

(assert (=> b!1434645 (= res!967986 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631394 lt!631393 mask!2608) lt!631398))))

(assert (= (and start!123782 res!967993) b!1434640))

(assert (= (and b!1434640 res!967985) b!1434641))

(assert (= (and b!1434641 res!967988) b!1434630))

(assert (= (and b!1434630 res!967984) b!1434642))

(assert (= (and b!1434642 res!967982) b!1434643))

(assert (= (and b!1434643 res!967989) b!1434638))

(assert (= (and b!1434638 res!967979) b!1434634))

(assert (= (and b!1434634 res!967992) b!1434631))

(assert (= (and b!1434631 res!967990) b!1434633))

(assert (= (and b!1434633 res!967980) b!1434645))

(assert (= (and b!1434645 res!967986) b!1434639))

(assert (= (and b!1434639 res!967978) b!1434644))

(assert (= (and b!1434644 res!967991) b!1434636))

(assert (= (and b!1434644 (not res!967981)) b!1434632))

(assert (= (and b!1434632 (not res!967983)) b!1434635))

(assert (= (and b!1434635 (not res!967987)) b!1434637))

(declare-fun m!1323641 () Bool)

(assert (=> b!1434645 m!1323641))

(declare-fun m!1323643 () Bool)

(assert (=> b!1434636 m!1323643))

(assert (=> b!1434636 m!1323643))

(declare-fun m!1323645 () Bool)

(assert (=> b!1434636 m!1323645))

(declare-fun m!1323647 () Bool)

(assert (=> b!1434641 m!1323647))

(assert (=> b!1434641 m!1323647))

(declare-fun m!1323649 () Bool)

(assert (=> b!1434641 m!1323649))

(declare-fun m!1323651 () Bool)

(assert (=> start!123782 m!1323651))

(declare-fun m!1323653 () Bool)

(assert (=> start!123782 m!1323653))

(assert (=> b!1434633 m!1323643))

(assert (=> b!1434633 m!1323643))

(declare-fun m!1323655 () Bool)

(assert (=> b!1434633 m!1323655))

(declare-fun m!1323657 () Bool)

(assert (=> b!1434632 m!1323657))

(declare-fun m!1323659 () Bool)

(assert (=> b!1434637 m!1323659))

(assert (=> b!1434635 m!1323643))

(assert (=> b!1434635 m!1323643))

(declare-fun m!1323661 () Bool)

(assert (=> b!1434635 m!1323661))

(assert (=> b!1434630 m!1323643))

(assert (=> b!1434630 m!1323643))

(declare-fun m!1323663 () Bool)

(assert (=> b!1434630 m!1323663))

(assert (=> b!1434634 m!1323643))

(assert (=> b!1434634 m!1323643))

(declare-fun m!1323665 () Bool)

(assert (=> b!1434634 m!1323665))

(assert (=> b!1434634 m!1323665))

(assert (=> b!1434634 m!1323643))

(declare-fun m!1323667 () Bool)

(assert (=> b!1434634 m!1323667))

(declare-fun m!1323669 () Bool)

(assert (=> b!1434631 m!1323669))

(assert (=> b!1434631 m!1323669))

(declare-fun m!1323671 () Bool)

(assert (=> b!1434631 m!1323671))

(declare-fun m!1323673 () Bool)

(assert (=> b!1434631 m!1323673))

(declare-fun m!1323675 () Bool)

(assert (=> b!1434631 m!1323675))

(declare-fun m!1323677 () Bool)

(assert (=> b!1434643 m!1323677))

(assert (=> b!1434644 m!1323673))

(declare-fun m!1323679 () Bool)

(assert (=> b!1434644 m!1323679))

(declare-fun m!1323681 () Bool)

(assert (=> b!1434644 m!1323681))

(declare-fun m!1323683 () Bool)

(assert (=> b!1434644 m!1323683))

(assert (=> b!1434644 m!1323643))

(declare-fun m!1323685 () Bool)

(assert (=> b!1434644 m!1323685))

(declare-fun m!1323687 () Bool)

(assert (=> b!1434642 m!1323687))

(check-sat (not b!1434643) (not b!1434642) (not b!1434634) (not b!1434631) (not b!1434633) (not b!1434641) (not b!1434636) (not b!1434630) (not start!123782) (not b!1434644) (not b!1434645) (not b!1434637) (not b!1434635) (not b!1434632))
(check-sat)
(get-model)

(declare-fun d!154127 () Bool)

(assert (=> d!154127 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123782 d!154127))

(declare-fun d!154129 () Bool)

(assert (=> d!154129 (= (array_inv!36310 a!2831) (bvsge (size!47629 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123782 d!154129))

(declare-fun d!154131 () Bool)

(declare-fun e!809755 () Bool)

(assert (=> d!154131 e!809755))

(declare-fun c!132837 () Bool)

(declare-fun lt!631440 () SeekEntryResult!11383)

(get-info :version)

(assert (=> d!154131 (= c!132837 (and ((_ is Intermediate!11383) lt!631440) (undefined!12195 lt!631440)))))

(declare-fun e!809757 () SeekEntryResult!11383)

(assert (=> d!154131 (= lt!631440 e!809757)))

(declare-fun c!132838 () Bool)

(assert (=> d!154131 (= c!132838 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(declare-fun lt!631439 () (_ BitVec 64))

(assert (=> d!154131 (= lt!631439 (select (arr!47077 lt!631393) lt!631396))))

(assert (=> d!154131 (validMask!0 mask!2608)))

(assert (=> d!154131 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631396 lt!631394 lt!631393 mask!2608) lt!631440)))

(declare-fun b!1434760 () Bool)

(declare-fun e!809756 () SeekEntryResult!11383)

(assert (=> b!1434760 (= e!809757 e!809756)))

(declare-fun c!132836 () Bool)

(assert (=> b!1434760 (= c!132836 (or (= lt!631439 lt!631394) (= (bvadd lt!631439 lt!631439) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434761 () Bool)

(declare-fun e!809753 () Bool)

(assert (=> b!1434761 (= e!809755 e!809753)))

(declare-fun res!968096 () Bool)

(assert (=> b!1434761 (= res!968096 (and ((_ is Intermediate!11383) lt!631440) (not (undefined!12195 lt!631440)) (bvslt (x!129575 lt!631440) #b01111111111111111111111111111110) (bvsge (x!129575 lt!631440) #b00000000000000000000000000000000) (bvsge (x!129575 lt!631440) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1434761 (=> (not res!968096) (not e!809753))))

(declare-fun b!1434762 () Bool)

(assert (=> b!1434762 (and (bvsge (index!47926 lt!631440) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631440) (size!47629 lt!631393)))))

(declare-fun e!809754 () Bool)

(assert (=> b!1434762 (= e!809754 (= (select (arr!47077 lt!631393) (index!47926 lt!631440)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434763 () Bool)

(assert (=> b!1434763 (= e!809756 (Intermediate!11383 false lt!631396 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434764 () Bool)

(assert (=> b!1434764 (and (bvsge (index!47926 lt!631440) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631440) (size!47629 lt!631393)))))

(declare-fun res!968098 () Bool)

(assert (=> b!1434764 (= res!968098 (= (select (arr!47077 lt!631393) (index!47926 lt!631440)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434764 (=> res!968098 e!809754)))

(declare-fun b!1434765 () Bool)

(assert (=> b!1434765 (= e!809755 (bvsge (x!129575 lt!631440) #b01111111111111111111111111111110))))

(declare-fun b!1434766 () Bool)

(assert (=> b!1434766 (= e!809757 (Intermediate!11383 true lt!631396 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434767 () Bool)

(assert (=> b!1434767 (= e!809756 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631396 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) lt!631394 lt!631393 mask!2608))))

(declare-fun b!1434768 () Bool)

(assert (=> b!1434768 (and (bvsge (index!47926 lt!631440) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631440) (size!47629 lt!631393)))))

(declare-fun res!968097 () Bool)

(assert (=> b!1434768 (= res!968097 (= (select (arr!47077 lt!631393) (index!47926 lt!631440)) lt!631394))))

(assert (=> b!1434768 (=> res!968097 e!809754)))

(assert (=> b!1434768 (= e!809753 e!809754)))

(assert (= (and d!154131 c!132838) b!1434766))

(assert (= (and d!154131 (not c!132838)) b!1434760))

(assert (= (and b!1434760 c!132836) b!1434763))

(assert (= (and b!1434760 (not c!132836)) b!1434767))

(assert (= (and d!154131 c!132837) b!1434765))

(assert (= (and d!154131 (not c!132837)) b!1434761))

(assert (= (and b!1434761 res!968096) b!1434768))

(assert (= (and b!1434768 (not res!968097)) b!1434764))

(assert (= (and b!1434764 (not res!968098)) b!1434762))

(declare-fun m!1323785 () Bool)

(assert (=> b!1434764 m!1323785))

(assert (=> b!1434768 m!1323785))

(declare-fun m!1323787 () Bool)

(assert (=> d!154131 m!1323787))

(assert (=> d!154131 m!1323651))

(declare-fun m!1323789 () Bool)

(assert (=> b!1434767 m!1323789))

(assert (=> b!1434767 m!1323789))

(declare-fun m!1323791 () Bool)

(assert (=> b!1434767 m!1323791))

(assert (=> b!1434762 m!1323785))

(assert (=> b!1434637 d!154131))

(declare-fun b!1434781 () Bool)

(declare-fun e!809764 () SeekEntryResult!11383)

(declare-fun lt!631449 () SeekEntryResult!11383)

(assert (=> b!1434781 (= e!809764 (Found!11383 (index!47926 lt!631449)))))

(declare-fun b!1434783 () Bool)

(declare-fun c!132847 () Bool)

(declare-fun lt!631448 () (_ BitVec 64))

(assert (=> b!1434783 (= c!132847 (= lt!631448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809765 () SeekEntryResult!11383)

(assert (=> b!1434783 (= e!809764 e!809765)))

(declare-fun b!1434784 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97548 (_ BitVec 32)) SeekEntryResult!11383)

(assert (=> b!1434784 (= e!809765 (seekKeyOrZeroReturnVacant!0 (x!129575 lt!631449) (index!47926 lt!631449) (index!47926 lt!631449) (select (arr!47077 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!154133 () Bool)

(declare-fun lt!631447 () SeekEntryResult!11383)

(assert (=> d!154133 (and (or ((_ is Undefined!11383) lt!631447) (not ((_ is Found!11383) lt!631447)) (and (bvsge (index!47925 lt!631447) #b00000000000000000000000000000000) (bvslt (index!47925 lt!631447) (size!47629 a!2831)))) (or ((_ is Undefined!11383) lt!631447) ((_ is Found!11383) lt!631447) (not ((_ is MissingZero!11383) lt!631447)) (and (bvsge (index!47924 lt!631447) #b00000000000000000000000000000000) (bvslt (index!47924 lt!631447) (size!47629 a!2831)))) (or ((_ is Undefined!11383) lt!631447) ((_ is Found!11383) lt!631447) ((_ is MissingZero!11383) lt!631447) (not ((_ is MissingVacant!11383) lt!631447)) (and (bvsge (index!47927 lt!631447) #b00000000000000000000000000000000) (bvslt (index!47927 lt!631447) (size!47629 a!2831)))) (or ((_ is Undefined!11383) lt!631447) (ite ((_ is Found!11383) lt!631447) (= (select (arr!47077 a!2831) (index!47925 lt!631447)) (select (arr!47077 a!2831) j!81)) (ite ((_ is MissingZero!11383) lt!631447) (= (select (arr!47077 a!2831) (index!47924 lt!631447)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11383) lt!631447) (= (select (arr!47077 a!2831) (index!47927 lt!631447)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!809766 () SeekEntryResult!11383)

(assert (=> d!154133 (= lt!631447 e!809766)))

(declare-fun c!132845 () Bool)

(assert (=> d!154133 (= c!132845 (and ((_ is Intermediate!11383) lt!631449) (undefined!12195 lt!631449)))))

(assert (=> d!154133 (= lt!631449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) (select (arr!47077 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154133 (validMask!0 mask!2608)))

(assert (=> d!154133 (= (seekEntryOrOpen!0 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!631447)))

(declare-fun b!1434782 () Bool)

(assert (=> b!1434782 (= e!809766 Undefined!11383)))

(declare-fun b!1434785 () Bool)

(assert (=> b!1434785 (= e!809765 (MissingZero!11383 (index!47926 lt!631449)))))

(declare-fun b!1434786 () Bool)

(assert (=> b!1434786 (= e!809766 e!809764)))

(assert (=> b!1434786 (= lt!631448 (select (arr!47077 a!2831) (index!47926 lt!631449)))))

(declare-fun c!132846 () Bool)

(assert (=> b!1434786 (= c!132846 (= lt!631448 (select (arr!47077 a!2831) j!81)))))

(assert (= (and d!154133 c!132845) b!1434782))

(assert (= (and d!154133 (not c!132845)) b!1434786))

(assert (= (and b!1434786 c!132846) b!1434781))

(assert (= (and b!1434786 (not c!132846)) b!1434783))

(assert (= (and b!1434783 c!132847) b!1434785))

(assert (= (and b!1434783 (not c!132847)) b!1434784))

(assert (=> b!1434784 m!1323643))

(declare-fun m!1323793 () Bool)

(assert (=> b!1434784 m!1323793))

(declare-fun m!1323795 () Bool)

(assert (=> d!154133 m!1323795))

(declare-fun m!1323797 () Bool)

(assert (=> d!154133 m!1323797))

(assert (=> d!154133 m!1323643))

(assert (=> d!154133 m!1323665))

(assert (=> d!154133 m!1323651))

(declare-fun m!1323799 () Bool)

(assert (=> d!154133 m!1323799))

(assert (=> d!154133 m!1323665))

(assert (=> d!154133 m!1323643))

(assert (=> d!154133 m!1323667))

(declare-fun m!1323801 () Bool)

(assert (=> b!1434786 m!1323801))

(assert (=> b!1434636 d!154133))

(declare-fun d!154143 () Bool)

(declare-fun e!809769 () Bool)

(assert (=> d!154143 e!809769))

(declare-fun c!132849 () Bool)

(declare-fun lt!631451 () SeekEntryResult!11383)

(assert (=> d!154143 (= c!132849 (and ((_ is Intermediate!11383) lt!631451) (undefined!12195 lt!631451)))))

(declare-fun e!809771 () SeekEntryResult!11383)

(assert (=> d!154143 (= lt!631451 e!809771)))

(declare-fun c!132850 () Bool)

(assert (=> d!154143 (= c!132850 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(declare-fun lt!631450 () (_ BitVec 64))

(assert (=> d!154143 (= lt!631450 (select (arr!47077 a!2831) lt!631396))))

(assert (=> d!154143 (validMask!0 mask!2608)))

(assert (=> d!154143 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631396 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!631451)))

(declare-fun b!1434787 () Bool)

(declare-fun e!809770 () SeekEntryResult!11383)

(assert (=> b!1434787 (= e!809771 e!809770)))

(declare-fun c!132848 () Bool)

(assert (=> b!1434787 (= c!132848 (or (= lt!631450 (select (arr!47077 a!2831) j!81)) (= (bvadd lt!631450 lt!631450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434788 () Bool)

(declare-fun e!809767 () Bool)

(assert (=> b!1434788 (= e!809769 e!809767)))

(declare-fun res!968099 () Bool)

(assert (=> b!1434788 (= res!968099 (and ((_ is Intermediate!11383) lt!631451) (not (undefined!12195 lt!631451)) (bvslt (x!129575 lt!631451) #b01111111111111111111111111111110) (bvsge (x!129575 lt!631451) #b00000000000000000000000000000000) (bvsge (x!129575 lt!631451) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1434788 (=> (not res!968099) (not e!809767))))

(declare-fun b!1434789 () Bool)

(assert (=> b!1434789 (and (bvsge (index!47926 lt!631451) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631451) (size!47629 a!2831)))))

(declare-fun e!809768 () Bool)

(assert (=> b!1434789 (= e!809768 (= (select (arr!47077 a!2831) (index!47926 lt!631451)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434790 () Bool)

(assert (=> b!1434790 (= e!809770 (Intermediate!11383 false lt!631396 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434791 () Bool)

(assert (=> b!1434791 (and (bvsge (index!47926 lt!631451) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631451) (size!47629 a!2831)))))

(declare-fun res!968101 () Bool)

(assert (=> b!1434791 (= res!968101 (= (select (arr!47077 a!2831) (index!47926 lt!631451)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434791 (=> res!968101 e!809768)))

(declare-fun b!1434792 () Bool)

(assert (=> b!1434792 (= e!809769 (bvsge (x!129575 lt!631451) #b01111111111111111111111111111110))))

(declare-fun b!1434793 () Bool)

(assert (=> b!1434793 (= e!809771 (Intermediate!11383 true lt!631396 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434794 () Bool)

(assert (=> b!1434794 (= e!809770 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631396 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) (select (arr!47077 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434795 () Bool)

(assert (=> b!1434795 (and (bvsge (index!47926 lt!631451) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631451) (size!47629 a!2831)))))

(declare-fun res!968100 () Bool)

(assert (=> b!1434795 (= res!968100 (= (select (arr!47077 a!2831) (index!47926 lt!631451)) (select (arr!47077 a!2831) j!81)))))

(assert (=> b!1434795 (=> res!968100 e!809768)))

(assert (=> b!1434795 (= e!809767 e!809768)))

(assert (= (and d!154143 c!132850) b!1434793))

(assert (= (and d!154143 (not c!132850)) b!1434787))

(assert (= (and b!1434787 c!132848) b!1434790))

(assert (= (and b!1434787 (not c!132848)) b!1434794))

(assert (= (and d!154143 c!132849) b!1434792))

(assert (= (and d!154143 (not c!132849)) b!1434788))

(assert (= (and b!1434788 res!968099) b!1434795))

(assert (= (and b!1434795 (not res!968100)) b!1434791))

(assert (= (and b!1434791 (not res!968101)) b!1434789))

(declare-fun m!1323803 () Bool)

(assert (=> b!1434791 m!1323803))

(assert (=> b!1434795 m!1323803))

(declare-fun m!1323805 () Bool)

(assert (=> d!154143 m!1323805))

(assert (=> d!154143 m!1323651))

(assert (=> b!1434794 m!1323789))

(assert (=> b!1434794 m!1323789))

(assert (=> b!1434794 m!1323643))

(declare-fun m!1323807 () Bool)

(assert (=> b!1434794 m!1323807))

(assert (=> b!1434789 m!1323803))

(assert (=> b!1434635 d!154143))

(declare-fun d!154147 () Bool)

(declare-fun e!809774 () Bool)

(assert (=> d!154147 e!809774))

(declare-fun c!132852 () Bool)

(declare-fun lt!631457 () SeekEntryResult!11383)

(assert (=> d!154147 (= c!132852 (and ((_ is Intermediate!11383) lt!631457) (undefined!12195 lt!631457)))))

(declare-fun e!809776 () SeekEntryResult!11383)

(assert (=> d!154147 (= lt!631457 e!809776)))

(declare-fun c!132853 () Bool)

(assert (=> d!154147 (= c!132853 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631456 () (_ BitVec 64))

(assert (=> d!154147 (= lt!631456 (select (arr!47077 lt!631393) index!585))))

(assert (=> d!154147 (validMask!0 mask!2608)))

(assert (=> d!154147 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631394 lt!631393 mask!2608) lt!631457)))

(declare-fun b!1434798 () Bool)

(declare-fun e!809775 () SeekEntryResult!11383)

(assert (=> b!1434798 (= e!809776 e!809775)))

(declare-fun c!132851 () Bool)

(assert (=> b!1434798 (= c!132851 (or (= lt!631456 lt!631394) (= (bvadd lt!631456 lt!631456) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434799 () Bool)

(declare-fun e!809772 () Bool)

(assert (=> b!1434799 (= e!809774 e!809772)))

(declare-fun res!968102 () Bool)

(assert (=> b!1434799 (= res!968102 (and ((_ is Intermediate!11383) lt!631457) (not (undefined!12195 lt!631457)) (bvslt (x!129575 lt!631457) #b01111111111111111111111111111110) (bvsge (x!129575 lt!631457) #b00000000000000000000000000000000) (bvsge (x!129575 lt!631457) x!605)))))

(assert (=> b!1434799 (=> (not res!968102) (not e!809772))))

(declare-fun b!1434800 () Bool)

(assert (=> b!1434800 (and (bvsge (index!47926 lt!631457) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631457) (size!47629 lt!631393)))))

(declare-fun e!809773 () Bool)

(assert (=> b!1434800 (= e!809773 (= (select (arr!47077 lt!631393) (index!47926 lt!631457)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434801 () Bool)

(assert (=> b!1434801 (= e!809775 (Intermediate!11383 false index!585 x!605))))

(declare-fun b!1434802 () Bool)

(assert (=> b!1434802 (and (bvsge (index!47926 lt!631457) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631457) (size!47629 lt!631393)))))

(declare-fun res!968104 () Bool)

(assert (=> b!1434802 (= res!968104 (= (select (arr!47077 lt!631393) (index!47926 lt!631457)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434802 (=> res!968104 e!809773)))

(declare-fun b!1434803 () Bool)

(assert (=> b!1434803 (= e!809774 (bvsge (x!129575 lt!631457) #b01111111111111111111111111111110))))

(declare-fun b!1434804 () Bool)

(assert (=> b!1434804 (= e!809776 (Intermediate!11383 true index!585 x!605))))

(declare-fun b!1434805 () Bool)

(assert (=> b!1434805 (= e!809775 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631394 lt!631393 mask!2608))))

(declare-fun b!1434806 () Bool)

(assert (=> b!1434806 (and (bvsge (index!47926 lt!631457) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631457) (size!47629 lt!631393)))))

(declare-fun res!968103 () Bool)

(assert (=> b!1434806 (= res!968103 (= (select (arr!47077 lt!631393) (index!47926 lt!631457)) lt!631394))))

(assert (=> b!1434806 (=> res!968103 e!809773)))

(assert (=> b!1434806 (= e!809772 e!809773)))

(assert (= (and d!154147 c!132853) b!1434804))

(assert (= (and d!154147 (not c!132853)) b!1434798))

(assert (= (and b!1434798 c!132851) b!1434801))

(assert (= (and b!1434798 (not c!132851)) b!1434805))

(assert (= (and d!154147 c!132852) b!1434803))

(assert (= (and d!154147 (not c!132852)) b!1434799))

(assert (= (and b!1434799 res!968102) b!1434806))

(assert (= (and b!1434806 (not res!968103)) b!1434802))

(assert (= (and b!1434802 (not res!968104)) b!1434800))

(declare-fun m!1323809 () Bool)

(assert (=> b!1434802 m!1323809))

(assert (=> b!1434806 m!1323809))

(declare-fun m!1323811 () Bool)

(assert (=> d!154147 m!1323811))

(assert (=> d!154147 m!1323651))

(assert (=> b!1434805 m!1323657))

(assert (=> b!1434805 m!1323657))

(declare-fun m!1323813 () Bool)

(assert (=> b!1434805 m!1323813))

(assert (=> b!1434800 m!1323809))

(assert (=> b!1434645 d!154147))

(declare-fun d!154149 () Bool)

(declare-fun e!809783 () Bool)

(assert (=> d!154149 e!809783))

(declare-fun c!132859 () Bool)

(declare-fun lt!631459 () SeekEntryResult!11383)

(assert (=> d!154149 (= c!132859 (and ((_ is Intermediate!11383) lt!631459) (undefined!12195 lt!631459)))))

(declare-fun e!809785 () SeekEntryResult!11383)

(assert (=> d!154149 (= lt!631459 e!809785)))

(declare-fun c!132860 () Bool)

(assert (=> d!154149 (= c!132860 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631458 () (_ BitVec 64))

(assert (=> d!154149 (= lt!631458 (select (arr!47077 a!2831) (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608)))))

(assert (=> d!154149 (validMask!0 mask!2608)))

(assert (=> d!154149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!631459)))

(declare-fun b!1434815 () Bool)

(declare-fun e!809784 () SeekEntryResult!11383)

(assert (=> b!1434815 (= e!809785 e!809784)))

(declare-fun c!132858 () Bool)

(assert (=> b!1434815 (= c!132858 (or (= lt!631458 (select (arr!47077 a!2831) j!81)) (= (bvadd lt!631458 lt!631458) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434816 () Bool)

(declare-fun e!809781 () Bool)

(assert (=> b!1434816 (= e!809783 e!809781)))

(declare-fun res!968105 () Bool)

(assert (=> b!1434816 (= res!968105 (and ((_ is Intermediate!11383) lt!631459) (not (undefined!12195 lt!631459)) (bvslt (x!129575 lt!631459) #b01111111111111111111111111111110) (bvsge (x!129575 lt!631459) #b00000000000000000000000000000000) (bvsge (x!129575 lt!631459) #b00000000000000000000000000000000)))))

(assert (=> b!1434816 (=> (not res!968105) (not e!809781))))

(declare-fun b!1434817 () Bool)

(assert (=> b!1434817 (and (bvsge (index!47926 lt!631459) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631459) (size!47629 a!2831)))))

(declare-fun e!809782 () Bool)

(assert (=> b!1434817 (= e!809782 (= (select (arr!47077 a!2831) (index!47926 lt!631459)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434818 () Bool)

(assert (=> b!1434818 (= e!809784 (Intermediate!11383 false (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434819 () Bool)

(assert (=> b!1434819 (and (bvsge (index!47926 lt!631459) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631459) (size!47629 a!2831)))))

(declare-fun res!968107 () Bool)

(assert (=> b!1434819 (= res!968107 (= (select (arr!47077 a!2831) (index!47926 lt!631459)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434819 (=> res!968107 e!809782)))

(declare-fun b!1434820 () Bool)

(assert (=> b!1434820 (= e!809783 (bvsge (x!129575 lt!631459) #b01111111111111111111111111111110))))

(declare-fun b!1434821 () Bool)

(assert (=> b!1434821 (= e!809785 (Intermediate!11383 true (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434822 () Bool)

(assert (=> b!1434822 (= e!809784 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47077 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434823 () Bool)

(assert (=> b!1434823 (and (bvsge (index!47926 lt!631459) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631459) (size!47629 a!2831)))))

(declare-fun res!968106 () Bool)

(assert (=> b!1434823 (= res!968106 (= (select (arr!47077 a!2831) (index!47926 lt!631459)) (select (arr!47077 a!2831) j!81)))))

(assert (=> b!1434823 (=> res!968106 e!809782)))

(assert (=> b!1434823 (= e!809781 e!809782)))

(assert (= (and d!154149 c!132860) b!1434821))

(assert (= (and d!154149 (not c!132860)) b!1434815))

(assert (= (and b!1434815 c!132858) b!1434818))

(assert (= (and b!1434815 (not c!132858)) b!1434822))

(assert (= (and d!154149 c!132859) b!1434820))

(assert (= (and d!154149 (not c!132859)) b!1434816))

(assert (= (and b!1434816 res!968105) b!1434823))

(assert (= (and b!1434823 (not res!968106)) b!1434819))

(assert (= (and b!1434819 (not res!968107)) b!1434817))

(declare-fun m!1323815 () Bool)

(assert (=> b!1434819 m!1323815))

(assert (=> b!1434823 m!1323815))

(assert (=> d!154149 m!1323665))

(declare-fun m!1323817 () Bool)

(assert (=> d!154149 m!1323817))

(assert (=> d!154149 m!1323651))

(assert (=> b!1434822 m!1323665))

(declare-fun m!1323819 () Bool)

(assert (=> b!1434822 m!1323819))

(assert (=> b!1434822 m!1323819))

(assert (=> b!1434822 m!1323643))

(declare-fun m!1323821 () Bool)

(assert (=> b!1434822 m!1323821))

(assert (=> b!1434817 m!1323815))

(assert (=> b!1434634 d!154149))

(declare-fun d!154151 () Bool)

(declare-fun lt!631467 () (_ BitVec 32))

(declare-fun lt!631466 () (_ BitVec 32))

(assert (=> d!154151 (= lt!631467 (bvmul (bvxor lt!631466 (bvlshr lt!631466 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154151 (= lt!631466 ((_ extract 31 0) (bvand (bvxor (select (arr!47077 a!2831) j!81) (bvlshr (select (arr!47077 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154151 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968114 (let ((h!34996 ((_ extract 31 0) (bvand (bvxor (select (arr!47077 a!2831) j!81) (bvlshr (select (arr!47077 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129580 (bvmul (bvxor h!34996 (bvlshr h!34996 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129580 (bvlshr x!129580 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968114 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968114 #b00000000000000000000000000000000))))))

(assert (=> d!154151 (= (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) (bvand (bvxor lt!631467 (bvlshr lt!631467 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434634 d!154151))

(declare-fun b!1434867 () Bool)

(declare-fun e!809814 () Bool)

(declare-fun call!67520 () Bool)

(assert (=> b!1434867 (= e!809814 call!67520)))

(declare-fun bm!67517 () Bool)

(assert (=> bm!67517 (= call!67520 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434868 () Bool)

(declare-fun e!809813 () Bool)

(assert (=> b!1434868 (= e!809813 e!809814)))

(declare-fun lt!631479 () (_ BitVec 64))

(assert (=> b!1434868 (= lt!631479 (select (arr!47077 a!2831) j!81))))

(declare-fun lt!631480 () Unit!48351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97548 (_ BitVec 64) (_ BitVec 32)) Unit!48351)

(assert (=> b!1434868 (= lt!631480 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631479 j!81))))

(declare-fun arrayContainsKey!0 (array!97548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1434868 (arrayContainsKey!0 a!2831 lt!631479 #b00000000000000000000000000000000)))

(declare-fun lt!631478 () Unit!48351)

(assert (=> b!1434868 (= lt!631478 lt!631480)))

(declare-fun res!968128 () Bool)

(assert (=> b!1434868 (= res!968128 (= (seekEntryOrOpen!0 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) (Found!11383 j!81)))))

(assert (=> b!1434868 (=> (not res!968128) (not e!809814))))

(declare-fun b!1434869 () Bool)

(assert (=> b!1434869 (= e!809813 call!67520)))

(declare-fun d!154155 () Bool)

(declare-fun res!968129 () Bool)

(declare-fun e!809815 () Bool)

(assert (=> d!154155 (=> res!968129 e!809815)))

(assert (=> d!154155 (= res!968129 (bvsge j!81 (size!47629 a!2831)))))

(assert (=> d!154155 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809815)))

(declare-fun b!1434870 () Bool)

(assert (=> b!1434870 (= e!809815 e!809813)))

(declare-fun c!132874 () Bool)

(assert (=> b!1434870 (= c!132874 (validKeyInArray!0 (select (arr!47077 a!2831) j!81)))))

(assert (= (and d!154155 (not res!968129)) b!1434870))

(assert (= (and b!1434870 c!132874) b!1434868))

(assert (= (and b!1434870 (not c!132874)) b!1434869))

(assert (= (and b!1434868 res!968128) b!1434867))

(assert (= (or b!1434867 b!1434869) bm!67517))

(declare-fun m!1323827 () Bool)

(assert (=> bm!67517 m!1323827))

(assert (=> b!1434868 m!1323643))

(declare-fun m!1323829 () Bool)

(assert (=> b!1434868 m!1323829))

(declare-fun m!1323831 () Bool)

(assert (=> b!1434868 m!1323831))

(assert (=> b!1434868 m!1323643))

(assert (=> b!1434868 m!1323645))

(assert (=> b!1434870 m!1323643))

(assert (=> b!1434870 m!1323643))

(assert (=> b!1434870 m!1323663))

(assert (=> b!1434644 d!154155))

(declare-fun d!154157 () Bool)

(assert (=> d!154157 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631487 () Unit!48351)

(declare-fun choose!38 (array!97548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48351)

(assert (=> d!154157 (= lt!631487 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154157 (validMask!0 mask!2608)))

(assert (=> d!154157 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631487)))

(declare-fun bs!41737 () Bool)

(assert (= bs!41737 d!154157))

(assert (=> bs!41737 m!1323683))

(declare-fun m!1323847 () Bool)

(assert (=> bs!41737 m!1323847))

(assert (=> bs!41737 m!1323651))

(assert (=> b!1434644 d!154157))

(declare-fun d!154163 () Bool)

(declare-fun e!809833 () Bool)

(assert (=> d!154163 e!809833))

(declare-fun c!132885 () Bool)

(declare-fun lt!631491 () SeekEntryResult!11383)

(assert (=> d!154163 (= c!132885 (and ((_ is Intermediate!11383) lt!631491) (undefined!12195 lt!631491)))))

(declare-fun e!809835 () SeekEntryResult!11383)

(assert (=> d!154163 (= lt!631491 e!809835)))

(declare-fun c!132886 () Bool)

(assert (=> d!154163 (= c!132886 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631490 () (_ BitVec 64))

(assert (=> d!154163 (= lt!631490 (select (arr!47077 a!2831) index!585))))

(assert (=> d!154163 (validMask!0 mask!2608)))

(assert (=> d!154163 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!631491)))

(declare-fun b!1434898 () Bool)

(declare-fun e!809834 () SeekEntryResult!11383)

(assert (=> b!1434898 (= e!809835 e!809834)))

(declare-fun c!132884 () Bool)

(assert (=> b!1434898 (= c!132884 (or (= lt!631490 (select (arr!47077 a!2831) j!81)) (= (bvadd lt!631490 lt!631490) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434899 () Bool)

(declare-fun e!809831 () Bool)

(assert (=> b!1434899 (= e!809833 e!809831)))

(declare-fun res!968139 () Bool)

(assert (=> b!1434899 (= res!968139 (and ((_ is Intermediate!11383) lt!631491) (not (undefined!12195 lt!631491)) (bvslt (x!129575 lt!631491) #b01111111111111111111111111111110) (bvsge (x!129575 lt!631491) #b00000000000000000000000000000000) (bvsge (x!129575 lt!631491) x!605)))))

(assert (=> b!1434899 (=> (not res!968139) (not e!809831))))

(declare-fun b!1434900 () Bool)

(assert (=> b!1434900 (and (bvsge (index!47926 lt!631491) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631491) (size!47629 a!2831)))))

(declare-fun e!809832 () Bool)

(assert (=> b!1434900 (= e!809832 (= (select (arr!47077 a!2831) (index!47926 lt!631491)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434901 () Bool)

(assert (=> b!1434901 (= e!809834 (Intermediate!11383 false index!585 x!605))))

(declare-fun b!1434902 () Bool)

(assert (=> b!1434902 (and (bvsge (index!47926 lt!631491) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631491) (size!47629 a!2831)))))

(declare-fun res!968141 () Bool)

(assert (=> b!1434902 (= res!968141 (= (select (arr!47077 a!2831) (index!47926 lt!631491)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434902 (=> res!968141 e!809832)))

(declare-fun b!1434903 () Bool)

(assert (=> b!1434903 (= e!809833 (bvsge (x!129575 lt!631491) #b01111111111111111111111111111110))))

(declare-fun b!1434904 () Bool)

(assert (=> b!1434904 (= e!809835 (Intermediate!11383 true index!585 x!605))))

(declare-fun b!1434905 () Bool)

(assert (=> b!1434905 (= e!809834 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47077 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434906 () Bool)

(assert (=> b!1434906 (and (bvsge (index!47926 lt!631491) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631491) (size!47629 a!2831)))))

(declare-fun res!968140 () Bool)

(assert (=> b!1434906 (= res!968140 (= (select (arr!47077 a!2831) (index!47926 lt!631491)) (select (arr!47077 a!2831) j!81)))))

(assert (=> b!1434906 (=> res!968140 e!809832)))

(assert (=> b!1434906 (= e!809831 e!809832)))

(assert (= (and d!154163 c!132886) b!1434904))

(assert (= (and d!154163 (not c!132886)) b!1434898))

(assert (= (and b!1434898 c!132884) b!1434901))

(assert (= (and b!1434898 (not c!132884)) b!1434905))

(assert (= (and d!154163 c!132885) b!1434903))

(assert (= (and d!154163 (not c!132885)) b!1434899))

(assert (= (and b!1434899 res!968139) b!1434906))

(assert (= (and b!1434906 (not res!968140)) b!1434902))

(assert (= (and b!1434902 (not res!968141)) b!1434900))

(declare-fun m!1323855 () Bool)

(assert (=> b!1434902 m!1323855))

(assert (=> b!1434906 m!1323855))

(assert (=> d!154163 m!1323681))

(assert (=> d!154163 m!1323651))

(assert (=> b!1434905 m!1323657))

(assert (=> b!1434905 m!1323657))

(assert (=> b!1434905 m!1323643))

(declare-fun m!1323859 () Bool)

(assert (=> b!1434905 m!1323859))

(assert (=> b!1434900 m!1323855))

(assert (=> b!1434633 d!154163))

(declare-fun b!1434944 () Bool)

(declare-fun e!809858 () Bool)

(declare-fun e!809861 () Bool)

(assert (=> b!1434944 (= e!809858 e!809861)))

(declare-fun c!132901 () Bool)

(assert (=> b!1434944 (= c!132901 (validKeyInArray!0 (select (arr!47077 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434945 () Bool)

(declare-fun e!809859 () Bool)

(declare-fun contains!9836 (List!33665 (_ BitVec 64)) Bool)

(assert (=> b!1434945 (= e!809859 (contains!9836 Nil!33662 (select (arr!47077 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434946 () Bool)

(declare-fun call!67523 () Bool)

(assert (=> b!1434946 (= e!809861 call!67523)))

(declare-fun d!154167 () Bool)

(declare-fun res!968152 () Bool)

(declare-fun e!809860 () Bool)

(assert (=> d!154167 (=> res!968152 e!809860)))

(assert (=> d!154167 (= res!968152 (bvsge #b00000000000000000000000000000000 (size!47629 a!2831)))))

(assert (=> d!154167 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33662) e!809860)))

(declare-fun bm!67520 () Bool)

(assert (=> bm!67520 (= call!67523 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132901 (Cons!33661 (select (arr!47077 a!2831) #b00000000000000000000000000000000) Nil!33662) Nil!33662)))))

(declare-fun b!1434947 () Bool)

(assert (=> b!1434947 (= e!809861 call!67523)))

(declare-fun b!1434948 () Bool)

(assert (=> b!1434948 (= e!809860 e!809858)))

(declare-fun res!968153 () Bool)

(assert (=> b!1434948 (=> (not res!968153) (not e!809858))))

(assert (=> b!1434948 (= res!968153 (not e!809859))))

(declare-fun res!968154 () Bool)

(assert (=> b!1434948 (=> (not res!968154) (not e!809859))))

(assert (=> b!1434948 (= res!968154 (validKeyInArray!0 (select (arr!47077 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154167 (not res!968152)) b!1434948))

(assert (= (and b!1434948 res!968154) b!1434945))

(assert (= (and b!1434948 res!968153) b!1434944))

(assert (= (and b!1434944 c!132901) b!1434947))

(assert (= (and b!1434944 (not c!132901)) b!1434946))

(assert (= (or b!1434947 b!1434946) bm!67520))

(declare-fun m!1323879 () Bool)

(assert (=> b!1434944 m!1323879))

(assert (=> b!1434944 m!1323879))

(declare-fun m!1323881 () Bool)

(assert (=> b!1434944 m!1323881))

(assert (=> b!1434945 m!1323879))

(assert (=> b!1434945 m!1323879))

(declare-fun m!1323883 () Bool)

(assert (=> b!1434945 m!1323883))

(assert (=> bm!67520 m!1323879))

(declare-fun m!1323885 () Bool)

(assert (=> bm!67520 m!1323885))

(assert (=> b!1434948 m!1323879))

(assert (=> b!1434948 m!1323879))

(assert (=> b!1434948 m!1323881))

(assert (=> b!1434643 d!154167))

(declare-fun d!154175 () Bool)

(declare-fun lt!631511 () (_ BitVec 32))

(assert (=> d!154175 (and (bvsge lt!631511 #b00000000000000000000000000000000) (bvslt lt!631511 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154175 (= lt!631511 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154175 (validMask!0 mask!2608)))

(assert (=> d!154175 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631511)))

(declare-fun bs!41738 () Bool)

(assert (= bs!41738 d!154175))

(declare-fun m!1323887 () Bool)

(assert (=> bs!41738 m!1323887))

(assert (=> bs!41738 m!1323651))

(assert (=> b!1434632 d!154175))

(declare-fun b!1434949 () Bool)

(declare-fun e!809863 () Bool)

(declare-fun call!67524 () Bool)

(assert (=> b!1434949 (= e!809863 call!67524)))

(declare-fun bm!67521 () Bool)

(assert (=> bm!67521 (= call!67524 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434950 () Bool)

(declare-fun e!809862 () Bool)

(assert (=> b!1434950 (= e!809862 e!809863)))

(declare-fun lt!631515 () (_ BitVec 64))

(assert (=> b!1434950 (= lt!631515 (select (arr!47077 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631516 () Unit!48351)

(assert (=> b!1434950 (= lt!631516 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631515 #b00000000000000000000000000000000))))

(assert (=> b!1434950 (arrayContainsKey!0 a!2831 lt!631515 #b00000000000000000000000000000000)))

(declare-fun lt!631514 () Unit!48351)

(assert (=> b!1434950 (= lt!631514 lt!631516)))

(declare-fun res!968156 () Bool)

(assert (=> b!1434950 (= res!968156 (= (seekEntryOrOpen!0 (select (arr!47077 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11383 #b00000000000000000000000000000000)))))

(assert (=> b!1434950 (=> (not res!968156) (not e!809863))))

(declare-fun b!1434951 () Bool)

(assert (=> b!1434951 (= e!809862 call!67524)))

(declare-fun d!154177 () Bool)

(declare-fun res!968157 () Bool)

(declare-fun e!809864 () Bool)

(assert (=> d!154177 (=> res!968157 e!809864)))

(assert (=> d!154177 (= res!968157 (bvsge #b00000000000000000000000000000000 (size!47629 a!2831)))))

(assert (=> d!154177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809864)))

(declare-fun b!1434952 () Bool)

(assert (=> b!1434952 (= e!809864 e!809862)))

(declare-fun c!132902 () Bool)

(assert (=> b!1434952 (= c!132902 (validKeyInArray!0 (select (arr!47077 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154177 (not res!968157)) b!1434952))

(assert (= (and b!1434952 c!132902) b!1434950))

(assert (= (and b!1434952 (not c!132902)) b!1434951))

(assert (= (and b!1434950 res!968156) b!1434949))

(assert (= (or b!1434949 b!1434951) bm!67521))

(declare-fun m!1323889 () Bool)

(assert (=> bm!67521 m!1323889))

(assert (=> b!1434950 m!1323879))

(declare-fun m!1323891 () Bool)

(assert (=> b!1434950 m!1323891))

(declare-fun m!1323893 () Bool)

(assert (=> b!1434950 m!1323893))

(assert (=> b!1434950 m!1323879))

(declare-fun m!1323895 () Bool)

(assert (=> b!1434950 m!1323895))

(assert (=> b!1434952 m!1323879))

(assert (=> b!1434952 m!1323879))

(assert (=> b!1434952 m!1323881))

(assert (=> b!1434642 d!154177))

(declare-fun d!154179 () Bool)

(declare-fun e!809871 () Bool)

(assert (=> d!154179 e!809871))

(declare-fun c!132906 () Bool)

(declare-fun lt!631522 () SeekEntryResult!11383)

(assert (=> d!154179 (= c!132906 (and ((_ is Intermediate!11383) lt!631522) (undefined!12195 lt!631522)))))

(declare-fun e!809873 () SeekEntryResult!11383)

(assert (=> d!154179 (= lt!631522 e!809873)))

(declare-fun c!132907 () Bool)

(assert (=> d!154179 (= c!132907 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631521 () (_ BitVec 64))

(assert (=> d!154179 (= lt!631521 (select (arr!47077 lt!631393) (toIndex!0 lt!631394 mask!2608)))))

(assert (=> d!154179 (validMask!0 mask!2608)))

(assert (=> d!154179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631394 mask!2608) lt!631394 lt!631393 mask!2608) lt!631522)))

(declare-fun b!1434959 () Bool)

(declare-fun e!809872 () SeekEntryResult!11383)

(assert (=> b!1434959 (= e!809873 e!809872)))

(declare-fun c!132905 () Bool)

(assert (=> b!1434959 (= c!132905 (or (= lt!631521 lt!631394) (= (bvadd lt!631521 lt!631521) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434960 () Bool)

(declare-fun e!809868 () Bool)

(assert (=> b!1434960 (= e!809871 e!809868)))

(declare-fun res!968160 () Bool)

(assert (=> b!1434960 (= res!968160 (and ((_ is Intermediate!11383) lt!631522) (not (undefined!12195 lt!631522)) (bvslt (x!129575 lt!631522) #b01111111111111111111111111111110) (bvsge (x!129575 lt!631522) #b00000000000000000000000000000000) (bvsge (x!129575 lt!631522) #b00000000000000000000000000000000)))))

(assert (=> b!1434960 (=> (not res!968160) (not e!809868))))

(declare-fun b!1434961 () Bool)

(assert (=> b!1434961 (and (bvsge (index!47926 lt!631522) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631522) (size!47629 lt!631393)))))

(declare-fun e!809869 () Bool)

(assert (=> b!1434961 (= e!809869 (= (select (arr!47077 lt!631393) (index!47926 lt!631522)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434962 () Bool)

(assert (=> b!1434962 (= e!809872 (Intermediate!11383 false (toIndex!0 lt!631394 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434963 () Bool)

(assert (=> b!1434963 (and (bvsge (index!47926 lt!631522) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631522) (size!47629 lt!631393)))))

(declare-fun res!968162 () Bool)

(assert (=> b!1434963 (= res!968162 (= (select (arr!47077 lt!631393) (index!47926 lt!631522)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434963 (=> res!968162 e!809869)))

(declare-fun b!1434964 () Bool)

(assert (=> b!1434964 (= e!809871 (bvsge (x!129575 lt!631522) #b01111111111111111111111111111110))))

(declare-fun b!1434965 () Bool)

(assert (=> b!1434965 (= e!809873 (Intermediate!11383 true (toIndex!0 lt!631394 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434966 () Bool)

(assert (=> b!1434966 (= e!809872 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631394 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631394 lt!631393 mask!2608))))

(declare-fun b!1434967 () Bool)

(assert (=> b!1434967 (and (bvsge (index!47926 lt!631522) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631522) (size!47629 lt!631393)))))

(declare-fun res!968161 () Bool)

(assert (=> b!1434967 (= res!968161 (= (select (arr!47077 lt!631393) (index!47926 lt!631522)) lt!631394))))

(assert (=> b!1434967 (=> res!968161 e!809869)))

(assert (=> b!1434967 (= e!809868 e!809869)))

(assert (= (and d!154179 c!132907) b!1434965))

(assert (= (and d!154179 (not c!132907)) b!1434959))

(assert (= (and b!1434959 c!132905) b!1434962))

(assert (= (and b!1434959 (not c!132905)) b!1434966))

(assert (= (and d!154179 c!132906) b!1434964))

(assert (= (and d!154179 (not c!132906)) b!1434960))

(assert (= (and b!1434960 res!968160) b!1434967))

(assert (= (and b!1434967 (not res!968161)) b!1434963))

(assert (= (and b!1434963 (not res!968162)) b!1434961))

(declare-fun m!1323897 () Bool)

(assert (=> b!1434963 m!1323897))

(assert (=> b!1434967 m!1323897))

(assert (=> d!154179 m!1323669))

(declare-fun m!1323899 () Bool)

(assert (=> d!154179 m!1323899))

(assert (=> d!154179 m!1323651))

(assert (=> b!1434966 m!1323669))

(declare-fun m!1323901 () Bool)

(assert (=> b!1434966 m!1323901))

(assert (=> b!1434966 m!1323901))

(declare-fun m!1323903 () Bool)

(assert (=> b!1434966 m!1323903))

(assert (=> b!1434961 m!1323897))

(assert (=> b!1434631 d!154179))

(declare-fun d!154183 () Bool)

(declare-fun lt!631530 () (_ BitVec 32))

(declare-fun lt!631529 () (_ BitVec 32))

(assert (=> d!154183 (= lt!631530 (bvmul (bvxor lt!631529 (bvlshr lt!631529 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154183 (= lt!631529 ((_ extract 31 0) (bvand (bvxor lt!631394 (bvlshr lt!631394 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154183 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968114 (let ((h!34996 ((_ extract 31 0) (bvand (bvxor lt!631394 (bvlshr lt!631394 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129580 (bvmul (bvxor h!34996 (bvlshr h!34996 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129580 (bvlshr x!129580 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968114 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968114 #b00000000000000000000000000000000))))))

(assert (=> d!154183 (= (toIndex!0 lt!631394 mask!2608) (bvand (bvxor lt!631530 (bvlshr lt!631530 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434631 d!154183))

(declare-fun d!154185 () Bool)

(assert (=> d!154185 (= (validKeyInArray!0 (select (arr!47077 a!2831) i!982)) (and (not (= (select (arr!47077 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47077 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434641 d!154185))

(declare-fun d!154187 () Bool)

(assert (=> d!154187 (= (validKeyInArray!0 (select (arr!47077 a!2831) j!81)) (and (not (= (select (arr!47077 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47077 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434630 d!154187))

(check-sat (not d!154163) (not d!154147) (not b!1434870) (not b!1434945) (not b!1434966) (not bm!67520) (not b!1434868) (not d!154175) (not d!154157) (not b!1434794) (not b!1434905) (not d!154131) (not b!1434952) (not d!154133) (not b!1434784) (not bm!67517) (not d!154143) (not b!1434948) (not d!154149) (not b!1434767) (not bm!67521) (not b!1434950) (not b!1434944) (not d!154179) (not b!1434822) (not b!1434805))
(check-sat)
