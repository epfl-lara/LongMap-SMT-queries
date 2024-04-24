; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123784 () Bool)

(assert start!123784)

(declare-fun b!1433816 () Bool)

(declare-fun res!966846 () Bool)

(declare-fun e!809480 () Bool)

(assert (=> b!1433816 (=> (not res!966846) (not e!809480))))

(declare-datatypes ((array!97637 0))(
  ( (array!97638 (arr!47122 (Array (_ BitVec 32) (_ BitVec 64))) (size!47673 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97637)

(declare-datatypes ((List!33619 0))(
  ( (Nil!33616) (Cons!33615 (h!34949 (_ BitVec 64)) (t!48305 List!33619)) )
))
(declare-fun arrayNoDuplicates!0 (array!97637 (_ BitVec 32) List!33619) Bool)

(assert (=> b!1433816 (= res!966846 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33616))))

(declare-fun b!1433817 () Bool)

(declare-fun res!966850 () Bool)

(assert (=> b!1433817 (=> (not res!966850) (not e!809480))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97637 (_ BitVec 32)) Bool)

(assert (=> b!1433817 (= res!966850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433818 () Bool)

(declare-fun e!809483 () Bool)

(declare-fun e!809482 () Bool)

(assert (=> b!1433818 (= e!809483 (not e!809482))))

(declare-fun res!966845 () Bool)

(assert (=> b!1433818 (=> res!966845 e!809482)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433818 (= res!966845 (or (= (select (arr!47122 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47122 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47122 a!2831) index!585) (select (arr!47122 a!2831) j!81)) (= (select (store (arr!47122 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809481 () Bool)

(assert (=> b!1433818 e!809481))

(declare-fun res!966847 () Bool)

(assert (=> b!1433818 (=> (not res!966847) (not e!809481))))

(assert (=> b!1433818 (= res!966847 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48383 0))(
  ( (Unit!48384) )
))
(declare-fun lt!631097 () Unit!48383)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48383)

(assert (=> b!1433818 (= lt!631097 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433819 () Bool)

(declare-fun res!966849 () Bool)

(assert (=> b!1433819 (=> (not res!966849) (not e!809483))))

(declare-datatypes ((SeekEntryResult!11303 0))(
  ( (MissingZero!11303 (index!47604 (_ BitVec 32))) (Found!11303 (index!47605 (_ BitVec 32))) (Intermediate!11303 (undefined!12115 Bool) (index!47606 (_ BitVec 32)) (x!129409 (_ BitVec 32))) (Undefined!11303) (MissingVacant!11303 (index!47607 (_ BitVec 32))) )
))
(declare-fun lt!631099 () SeekEntryResult!11303)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97637 (_ BitVec 32)) SeekEntryResult!11303)

(assert (=> b!1433819 (= res!966849 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47122 a!2831) j!81) a!2831 mask!2608) lt!631099))))

(declare-fun b!1433820 () Bool)

(declare-fun res!966851 () Bool)

(assert (=> b!1433820 (=> (not res!966851) (not e!809480))))

(assert (=> b!1433820 (= res!966851 (and (= (size!47673 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47673 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47673 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433822 () Bool)

(declare-fun res!966848 () Bool)

(assert (=> b!1433822 (=> (not res!966848) (not e!809480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433822 (= res!966848 (validKeyInArray!0 (select (arr!47122 a!2831) i!982)))))

(declare-fun b!1433823 () Bool)

(declare-fun e!809478 () Bool)

(assert (=> b!1433823 (= e!809480 e!809478)))

(declare-fun res!966853 () Bool)

(assert (=> b!1433823 (=> (not res!966853) (not e!809478))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433823 (= res!966853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47122 a!2831) j!81) mask!2608) (select (arr!47122 a!2831) j!81) a!2831 mask!2608) lt!631099))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433823 (= lt!631099 (Intermediate!11303 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433824 () Bool)

(declare-fun res!966852 () Bool)

(assert (=> b!1433824 (=> (not res!966852) (not e!809483))))

(declare-fun lt!631100 () (_ BitVec 64))

(declare-fun lt!631095 () SeekEntryResult!11303)

(declare-fun lt!631096 () array!97637)

(assert (=> b!1433824 (= res!966852 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631100 lt!631096 mask!2608) lt!631095))))

(declare-fun b!1433825 () Bool)

(declare-fun res!966854 () Bool)

(assert (=> b!1433825 (=> (not res!966854) (not e!809480))))

(assert (=> b!1433825 (= res!966854 (validKeyInArray!0 (select (arr!47122 a!2831) j!81)))))

(declare-fun b!1433826 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97637 (_ BitVec 32)) SeekEntryResult!11303)

(assert (=> b!1433826 (= e!809481 (= (seekEntryOrOpen!0 (select (arr!47122 a!2831) j!81) a!2831 mask!2608) (Found!11303 j!81)))))

(declare-fun res!966843 () Bool)

(assert (=> start!123784 (=> (not res!966843) (not e!809480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123784 (= res!966843 (validMask!0 mask!2608))))

(assert (=> start!123784 e!809480))

(assert (=> start!123784 true))

(declare-fun array_inv!36403 (array!97637) Bool)

(assert (=> start!123784 (array_inv!36403 a!2831)))

(declare-fun b!1433821 () Bool)

(assert (=> b!1433821 (= e!809478 e!809483)))

(declare-fun res!966844 () Bool)

(assert (=> b!1433821 (=> (not res!966844) (not e!809483))))

(assert (=> b!1433821 (= res!966844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631100 mask!2608) lt!631100 lt!631096 mask!2608) lt!631095))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433821 (= lt!631095 (Intermediate!11303 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433821 (= lt!631100 (select (store (arr!47122 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433821 (= lt!631096 (array!97638 (store (arr!47122 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47673 a!2831)))))

(declare-fun b!1433827 () Bool)

(declare-fun res!966856 () Bool)

(assert (=> b!1433827 (=> (not res!966856) (not e!809480))))

(assert (=> b!1433827 (= res!966856 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47673 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47673 a!2831))))))

(declare-fun b!1433828 () Bool)

(declare-fun res!966855 () Bool)

(assert (=> b!1433828 (=> (not res!966855) (not e!809483))))

(assert (=> b!1433828 (= res!966855 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433829 () Bool)

(assert (=> b!1433829 (= e!809482 true)))

(declare-fun lt!631098 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433829 (= lt!631098 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(assert (= (and start!123784 res!966843) b!1433820))

(assert (= (and b!1433820 res!966851) b!1433822))

(assert (= (and b!1433822 res!966848) b!1433825))

(assert (= (and b!1433825 res!966854) b!1433817))

(assert (= (and b!1433817 res!966850) b!1433816))

(assert (= (and b!1433816 res!966846) b!1433827))

(assert (= (and b!1433827 res!966856) b!1433823))

(assert (= (and b!1433823 res!966853) b!1433821))

(assert (= (and b!1433821 res!966844) b!1433819))

(assert (= (and b!1433819 res!966849) b!1433824))

(assert (= (and b!1433824 res!966852) b!1433828))

(assert (= (and b!1433828 res!966855) b!1433818))

(assert (= (and b!1433818 res!966847) b!1433826))

(assert (= (and b!1433818 (not res!966845)) b!1433829))

(declare-fun m!1323727 () Bool)

(assert (=> b!1433824 m!1323727))

(declare-fun m!1323729 () Bool)

(assert (=> b!1433821 m!1323729))

(assert (=> b!1433821 m!1323729))

(declare-fun m!1323731 () Bool)

(assert (=> b!1433821 m!1323731))

(declare-fun m!1323733 () Bool)

(assert (=> b!1433821 m!1323733))

(declare-fun m!1323735 () Bool)

(assert (=> b!1433821 m!1323735))

(declare-fun m!1323737 () Bool)

(assert (=> b!1433825 m!1323737))

(assert (=> b!1433825 m!1323737))

(declare-fun m!1323739 () Bool)

(assert (=> b!1433825 m!1323739))

(declare-fun m!1323741 () Bool)

(assert (=> b!1433816 m!1323741))

(assert (=> b!1433819 m!1323737))

(assert (=> b!1433819 m!1323737))

(declare-fun m!1323743 () Bool)

(assert (=> b!1433819 m!1323743))

(declare-fun m!1323745 () Bool)

(assert (=> start!123784 m!1323745))

(declare-fun m!1323747 () Bool)

(assert (=> start!123784 m!1323747))

(declare-fun m!1323749 () Bool)

(assert (=> b!1433822 m!1323749))

(assert (=> b!1433822 m!1323749))

(declare-fun m!1323751 () Bool)

(assert (=> b!1433822 m!1323751))

(declare-fun m!1323753 () Bool)

(assert (=> b!1433829 m!1323753))

(assert (=> b!1433818 m!1323733))

(declare-fun m!1323755 () Bool)

(assert (=> b!1433818 m!1323755))

(declare-fun m!1323757 () Bool)

(assert (=> b!1433818 m!1323757))

(declare-fun m!1323759 () Bool)

(assert (=> b!1433818 m!1323759))

(assert (=> b!1433818 m!1323737))

(declare-fun m!1323761 () Bool)

(assert (=> b!1433818 m!1323761))

(declare-fun m!1323763 () Bool)

(assert (=> b!1433817 m!1323763))

(assert (=> b!1433823 m!1323737))

(assert (=> b!1433823 m!1323737))

(declare-fun m!1323765 () Bool)

(assert (=> b!1433823 m!1323765))

(assert (=> b!1433823 m!1323765))

(assert (=> b!1433823 m!1323737))

(declare-fun m!1323767 () Bool)

(assert (=> b!1433823 m!1323767))

(assert (=> b!1433826 m!1323737))

(assert (=> b!1433826 m!1323737))

(declare-fun m!1323769 () Bool)

(assert (=> b!1433826 m!1323769))

(check-sat (not b!1433816) (not b!1433824) (not b!1433821) (not b!1433819) (not b!1433817) (not b!1433822) (not b!1433825) (not start!123784) (not b!1433823) (not b!1433826) (not b!1433818) (not b!1433829))
(check-sat)
