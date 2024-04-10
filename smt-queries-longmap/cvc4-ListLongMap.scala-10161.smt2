; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119734 () Bool)

(assert start!119734)

(declare-fun b!1394826 () Bool)

(declare-fun e!789683 () Bool)

(declare-fun lt!612768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394826 (= e!789683 (validKeyInArray!0 lt!612768))))

(declare-fun b!1394827 () Bool)

(declare-fun res!934238 () Bool)

(declare-fun e!789679 () Bool)

(assert (=> b!1394827 (=> (not res!934238) (not e!789679))))

(declare-datatypes ((array!95416 0))(
  ( (array!95417 (arr!46066 (Array (_ BitVec 32) (_ BitVec 64))) (size!46616 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95416)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394827 (= res!934238 (validKeyInArray!0 (select (arr!46066 a!2901) j!112)))))

(declare-fun b!1394828 () Bool)

(declare-fun res!934243 () Bool)

(assert (=> b!1394828 (=> (not res!934243) (not e!789679))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95416 (_ BitVec 32)) Bool)

(assert (=> b!1394828 (= res!934243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394829 () Bool)

(declare-fun e!789682 () Bool)

(declare-fun e!789680 () Bool)

(assert (=> b!1394829 (= e!789682 e!789680)))

(declare-fun res!934236 () Bool)

(assert (=> b!1394829 (=> res!934236 e!789680)))

(declare-datatypes ((SeekEntryResult!10383 0))(
  ( (MissingZero!10383 (index!43903 (_ BitVec 32))) (Found!10383 (index!43904 (_ BitVec 32))) (Intermediate!10383 (undefined!11195 Bool) (index!43905 (_ BitVec 32)) (x!125563 (_ BitVec 32))) (Undefined!10383) (MissingVacant!10383 (index!43906 (_ BitVec 32))) )
))
(declare-fun lt!612766 () SeekEntryResult!10383)

(declare-fun lt!612769 () array!95416)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95416 (_ BitVec 32)) SeekEntryResult!10383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394829 (= res!934236 (not (= lt!612766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612768 mask!2840) lt!612768 lt!612769 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394829 (= lt!612768 (select (store (arr!46066 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394829 (= lt!612769 (array!95417 (store (arr!46066 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46616 a!2901)))))

(declare-fun b!1394830 () Bool)

(declare-fun res!934241 () Bool)

(assert (=> b!1394830 (=> (not res!934241) (not e!789679))))

(assert (=> b!1394830 (= res!934241 (and (= (size!46616 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46616 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46616 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!934237 () Bool)

(assert (=> start!119734 (=> (not res!934237) (not e!789679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119734 (= res!934237 (validMask!0 mask!2840))))

(assert (=> start!119734 e!789679))

(assert (=> start!119734 true))

(declare-fun array_inv!35094 (array!95416) Bool)

(assert (=> start!119734 (array_inv!35094 a!2901)))

(declare-fun b!1394831 () Bool)

(declare-fun res!934235 () Bool)

(assert (=> b!1394831 (=> (not res!934235) (not e!789679))))

(declare-datatypes ((List!32585 0))(
  ( (Nil!32582) (Cons!32581 (h!33814 (_ BitVec 64)) (t!47279 List!32585)) )
))
(declare-fun arrayNoDuplicates!0 (array!95416 (_ BitVec 32) List!32585) Bool)

(assert (=> b!1394831 (= res!934235 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32582))))

(declare-fun b!1394832 () Bool)

(declare-fun res!934242 () Bool)

(assert (=> b!1394832 (=> (not res!934242) (not e!789679))))

(assert (=> b!1394832 (= res!934242 (validKeyInArray!0 (select (arr!46066 a!2901) i!1037)))))

(declare-fun b!1394833 () Bool)

(assert (=> b!1394833 (= e!789680 e!789683)))

(declare-fun res!934239 () Bool)

(assert (=> b!1394833 (=> res!934239 e!789683)))

(assert (=> b!1394833 (= res!934239 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!612767 () SeekEntryResult!10383)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95416 (_ BitVec 32)) SeekEntryResult!10383)

(assert (=> b!1394833 (= lt!612767 (seekEntryOrOpen!0 lt!612768 lt!612769 mask!2840))))

(declare-fun lt!612765 () (_ BitVec 32))

(declare-datatypes ((Unit!46770 0))(
  ( (Unit!46771) )
))
(declare-fun lt!612771 () Unit!46770)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46770)

(assert (=> b!1394833 (= lt!612771 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612765 (x!125563 lt!612766) (index!43905 lt!612766) mask!2840))))

(declare-fun b!1394834 () Bool)

(declare-fun res!934240 () Bool)

(assert (=> b!1394834 (=> res!934240 e!789680)))

(assert (=> b!1394834 (= res!934240 (or (bvslt (x!125563 lt!612766) #b00000000000000000000000000000000) (bvsgt (x!125563 lt!612766) #b01111111111111111111111111111110) (bvslt lt!612765 #b00000000000000000000000000000000) (bvsge lt!612765 (size!46616 a!2901)) (bvslt (index!43905 lt!612766) #b00000000000000000000000000000000) (bvsge (index!43905 lt!612766) (size!46616 a!2901)) (not (= lt!612766 (Intermediate!10383 false (index!43905 lt!612766) (x!125563 lt!612766))))))))

(declare-fun b!1394835 () Bool)

(assert (=> b!1394835 (= e!789679 (not e!789682))))

(declare-fun res!934234 () Bool)

(assert (=> b!1394835 (=> res!934234 e!789682)))

(assert (=> b!1394835 (= res!934234 (or (not (is-Intermediate!10383 lt!612766)) (undefined!11195 lt!612766)))))

(assert (=> b!1394835 (= lt!612767 (Found!10383 j!112))))

(assert (=> b!1394835 (= lt!612767 (seekEntryOrOpen!0 (select (arr!46066 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394835 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612770 () Unit!46770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46770)

(assert (=> b!1394835 (= lt!612770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394835 (= lt!612766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612765 (select (arr!46066 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394835 (= lt!612765 (toIndex!0 (select (arr!46066 a!2901) j!112) mask!2840))))

(assert (= (and start!119734 res!934237) b!1394830))

(assert (= (and b!1394830 res!934241) b!1394832))

(assert (= (and b!1394832 res!934242) b!1394827))

(assert (= (and b!1394827 res!934238) b!1394828))

(assert (= (and b!1394828 res!934243) b!1394831))

(assert (= (and b!1394831 res!934235) b!1394835))

(assert (= (and b!1394835 (not res!934234)) b!1394829))

(assert (= (and b!1394829 (not res!934236)) b!1394834))

(assert (= (and b!1394834 (not res!934240)) b!1394833))

(assert (= (and b!1394833 (not res!934239)) b!1394826))

(declare-fun m!1281299 () Bool)

(assert (=> b!1394831 m!1281299))

(declare-fun m!1281301 () Bool)

(assert (=> b!1394829 m!1281301))

(assert (=> b!1394829 m!1281301))

(declare-fun m!1281303 () Bool)

(assert (=> b!1394829 m!1281303))

(declare-fun m!1281305 () Bool)

(assert (=> b!1394829 m!1281305))

(declare-fun m!1281307 () Bool)

(assert (=> b!1394829 m!1281307))

(declare-fun m!1281309 () Bool)

(assert (=> b!1394827 m!1281309))

(assert (=> b!1394827 m!1281309))

(declare-fun m!1281311 () Bool)

(assert (=> b!1394827 m!1281311))

(assert (=> b!1394835 m!1281309))

(declare-fun m!1281313 () Bool)

(assert (=> b!1394835 m!1281313))

(assert (=> b!1394835 m!1281309))

(declare-fun m!1281315 () Bool)

(assert (=> b!1394835 m!1281315))

(assert (=> b!1394835 m!1281309))

(declare-fun m!1281317 () Bool)

(assert (=> b!1394835 m!1281317))

(assert (=> b!1394835 m!1281309))

(declare-fun m!1281319 () Bool)

(assert (=> b!1394835 m!1281319))

(declare-fun m!1281321 () Bool)

(assert (=> b!1394835 m!1281321))

(declare-fun m!1281323 () Bool)

(assert (=> b!1394828 m!1281323))

(declare-fun m!1281325 () Bool)

(assert (=> b!1394832 m!1281325))

(assert (=> b!1394832 m!1281325))

(declare-fun m!1281327 () Bool)

(assert (=> b!1394832 m!1281327))

(declare-fun m!1281329 () Bool)

(assert (=> b!1394826 m!1281329))

(declare-fun m!1281331 () Bool)

(assert (=> b!1394833 m!1281331))

(declare-fun m!1281333 () Bool)

(assert (=> b!1394833 m!1281333))

(declare-fun m!1281335 () Bool)

(assert (=> start!119734 m!1281335))

(declare-fun m!1281337 () Bool)

(assert (=> start!119734 m!1281337))

(push 1)

