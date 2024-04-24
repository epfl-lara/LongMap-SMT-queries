; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122894 () Bool)

(assert start!122894)

(declare-fun b!1422799 () Bool)

(declare-fun res!957552 () Bool)

(declare-fun e!804557 () Bool)

(assert (=> b!1422799 (=> (not res!957552) (not e!804557))))

(declare-fun lt!626750 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11093 0))(
  ( (MissingZero!11093 (index!46764 (_ BitVec 32))) (Found!11093 (index!46765 (_ BitVec 32))) (Intermediate!11093 (undefined!11905 Bool) (index!46766 (_ BitVec 32)) (x!128570 (_ BitVec 32))) (Undefined!11093) (MissingVacant!11093 (index!46767 (_ BitVec 32))) )
))
(declare-fun lt!626749 () SeekEntryResult!11093)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97181 0))(
  ( (array!97182 (arr!46906 (Array (_ BitVec 32) (_ BitVec 64))) (size!47457 (_ BitVec 32))) )
))
(declare-fun lt!626753 () array!97181)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97181 (_ BitVec 32)) SeekEntryResult!11093)

(assert (=> b!1422799 (= res!957552 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626750 lt!626753 mask!2608) lt!626749))))

(declare-fun b!1422800 () Bool)

(declare-fun res!957555 () Bool)

(assert (=> b!1422800 (=> (not res!957555) (not e!804557))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1422800 (= res!957555 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422801 () Bool)

(declare-fun res!957548 () Bool)

(declare-fun e!804554 () Bool)

(assert (=> b!1422801 (=> (not res!957548) (not e!804554))))

(declare-fun a!2831 () array!97181)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422801 (= res!957548 (validKeyInArray!0 (select (arr!46906 a!2831) j!81)))))

(declare-fun b!1422802 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422802 (= e!804557 (not (or (= (select (arr!46906 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46906 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46906 a!2831) index!585) (select (arr!46906 a!2831) j!81)) (= (select (store (arr!46906 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2608 #b00000000000000000000000000000000))))))

(declare-fun e!804555 () Bool)

(assert (=> b!1422802 e!804555))

(declare-fun res!957551 () Bool)

(assert (=> b!1422802 (=> (not res!957551) (not e!804555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97181 (_ BitVec 32)) Bool)

(assert (=> b!1422802 (= res!957551 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48053 0))(
  ( (Unit!48054) )
))
(declare-fun lt!626752 () Unit!48053)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48053)

(assert (=> b!1422802 (= lt!626752 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422803 () Bool)

(declare-fun e!804553 () Bool)

(assert (=> b!1422803 (= e!804554 e!804553)))

(declare-fun res!957559 () Bool)

(assert (=> b!1422803 (=> (not res!957559) (not e!804553))))

(declare-fun lt!626751 () SeekEntryResult!11093)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422803 (= res!957559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46906 a!2831) j!81) mask!2608) (select (arr!46906 a!2831) j!81) a!2831 mask!2608) lt!626751))))

(assert (=> b!1422803 (= lt!626751 (Intermediate!11093 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422804 () Bool)

(assert (=> b!1422804 (= e!804553 e!804557)))

(declare-fun res!957549 () Bool)

(assert (=> b!1422804 (=> (not res!957549) (not e!804557))))

(assert (=> b!1422804 (= res!957549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626750 mask!2608) lt!626750 lt!626753 mask!2608) lt!626749))))

(assert (=> b!1422804 (= lt!626749 (Intermediate!11093 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422804 (= lt!626750 (select (store (arr!46906 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422804 (= lt!626753 (array!97182 (store (arr!46906 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47457 a!2831)))))

(declare-fun b!1422805 () Bool)

(declare-fun res!957558 () Bool)

(assert (=> b!1422805 (=> (not res!957558) (not e!804554))))

(assert (=> b!1422805 (= res!957558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422798 () Bool)

(declare-fun res!957550 () Bool)

(assert (=> b!1422798 (=> (not res!957550) (not e!804554))))

(assert (=> b!1422798 (= res!957550 (and (= (size!47457 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47457 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47457 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!957554 () Bool)

(assert (=> start!122894 (=> (not res!957554) (not e!804554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122894 (= res!957554 (validMask!0 mask!2608))))

(assert (=> start!122894 e!804554))

(assert (=> start!122894 true))

(declare-fun array_inv!36187 (array!97181) Bool)

(assert (=> start!122894 (array_inv!36187 a!2831)))

(declare-fun b!1422806 () Bool)

(declare-fun res!957547 () Bool)

(assert (=> b!1422806 (=> (not res!957547) (not e!804557))))

(assert (=> b!1422806 (= res!957547 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46906 a!2831) j!81) a!2831 mask!2608) lt!626751))))

(declare-fun b!1422807 () Bool)

(declare-fun res!957553 () Bool)

(assert (=> b!1422807 (=> (not res!957553) (not e!804554))))

(declare-datatypes ((List!33403 0))(
  ( (Nil!33400) (Cons!33399 (h!34709 (_ BitVec 64)) (t!48089 List!33403)) )
))
(declare-fun arrayNoDuplicates!0 (array!97181 (_ BitVec 32) List!33403) Bool)

(assert (=> b!1422807 (= res!957553 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33400))))

(declare-fun b!1422808 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97181 (_ BitVec 32)) SeekEntryResult!11093)

(assert (=> b!1422808 (= e!804555 (= (seekEntryOrOpen!0 (select (arr!46906 a!2831) j!81) a!2831 mask!2608) (Found!11093 j!81)))))

(declare-fun b!1422809 () Bool)

(declare-fun res!957556 () Bool)

(assert (=> b!1422809 (=> (not res!957556) (not e!804554))))

(assert (=> b!1422809 (= res!957556 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47457 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47457 a!2831))))))

(declare-fun b!1422810 () Bool)

(declare-fun res!957557 () Bool)

(assert (=> b!1422810 (=> (not res!957557) (not e!804554))))

(assert (=> b!1422810 (= res!957557 (validKeyInArray!0 (select (arr!46906 a!2831) i!982)))))

(assert (= (and start!122894 res!957554) b!1422798))

(assert (= (and b!1422798 res!957550) b!1422810))

(assert (= (and b!1422810 res!957557) b!1422801))

(assert (= (and b!1422801 res!957548) b!1422805))

(assert (= (and b!1422805 res!957558) b!1422807))

(assert (= (and b!1422807 res!957553) b!1422809))

(assert (= (and b!1422809 res!957556) b!1422803))

(assert (= (and b!1422803 res!957559) b!1422804))

(assert (= (and b!1422804 res!957549) b!1422806))

(assert (= (and b!1422806 res!957547) b!1422799))

(assert (= (and b!1422799 res!957552) b!1422800))

(assert (= (and b!1422800 res!957555) b!1422802))

(assert (= (and b!1422802 res!957551) b!1422808))

(declare-fun m!1313565 () Bool)

(assert (=> b!1422805 m!1313565))

(declare-fun m!1313567 () Bool)

(assert (=> b!1422808 m!1313567))

(assert (=> b!1422808 m!1313567))

(declare-fun m!1313569 () Bool)

(assert (=> b!1422808 m!1313569))

(assert (=> b!1422803 m!1313567))

(assert (=> b!1422803 m!1313567))

(declare-fun m!1313571 () Bool)

(assert (=> b!1422803 m!1313571))

(assert (=> b!1422803 m!1313571))

(assert (=> b!1422803 m!1313567))

(declare-fun m!1313573 () Bool)

(assert (=> b!1422803 m!1313573))

(declare-fun m!1313575 () Bool)

(assert (=> b!1422810 m!1313575))

(assert (=> b!1422810 m!1313575))

(declare-fun m!1313577 () Bool)

(assert (=> b!1422810 m!1313577))

(declare-fun m!1313579 () Bool)

(assert (=> b!1422799 m!1313579))

(declare-fun m!1313581 () Bool)

(assert (=> start!122894 m!1313581))

(declare-fun m!1313583 () Bool)

(assert (=> start!122894 m!1313583))

(declare-fun m!1313585 () Bool)

(assert (=> b!1422804 m!1313585))

(assert (=> b!1422804 m!1313585))

(declare-fun m!1313587 () Bool)

(assert (=> b!1422804 m!1313587))

(declare-fun m!1313589 () Bool)

(assert (=> b!1422804 m!1313589))

(declare-fun m!1313591 () Bool)

(assert (=> b!1422804 m!1313591))

(assert (=> b!1422806 m!1313567))

(assert (=> b!1422806 m!1313567))

(declare-fun m!1313593 () Bool)

(assert (=> b!1422806 m!1313593))

(assert (=> b!1422801 m!1313567))

(assert (=> b!1422801 m!1313567))

(declare-fun m!1313595 () Bool)

(assert (=> b!1422801 m!1313595))

(declare-fun m!1313597 () Bool)

(assert (=> b!1422807 m!1313597))

(assert (=> b!1422802 m!1313589))

(declare-fun m!1313599 () Bool)

(assert (=> b!1422802 m!1313599))

(declare-fun m!1313601 () Bool)

(assert (=> b!1422802 m!1313601))

(declare-fun m!1313603 () Bool)

(assert (=> b!1422802 m!1313603))

(assert (=> b!1422802 m!1313567))

(declare-fun m!1313605 () Bool)

(assert (=> b!1422802 m!1313605))

(check-sat (not b!1422807) (not b!1422805) (not b!1422803) (not b!1422810) (not b!1422802) (not b!1422804) (not b!1422801) (not b!1422808) (not b!1422806) (not b!1422799) (not start!122894))
(check-sat)
