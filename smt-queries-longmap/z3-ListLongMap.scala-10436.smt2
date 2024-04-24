; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123020 () Bool)

(assert start!123020)

(declare-fun b!1424760 () Bool)

(declare-fun res!959315 () Bool)

(declare-fun e!805453 () Bool)

(assert (=> b!1424760 (=> (not res!959315) (not e!805453))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97256 0))(
  ( (array!97257 (arr!46942 (Array (_ BitVec 32) (_ BitVec 64))) (size!47493 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97256)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424760 (= res!959315 (and (= (size!47493 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47493 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47493 a!2831)) (not (= i!982 j!81))))))

(declare-fun e!805448 () Bool)

(declare-fun b!1424762 () Bool)

(declare-datatypes ((SeekEntryResult!11129 0))(
  ( (MissingZero!11129 (index!46908 (_ BitVec 32))) (Found!11129 (index!46909 (_ BitVec 32))) (Intermediate!11129 (undefined!11941 Bool) (index!46910 (_ BitVec 32)) (x!128708 (_ BitVec 32))) (Undefined!11129) (MissingVacant!11129 (index!46911 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97256 (_ BitVec 32)) SeekEntryResult!11129)

(assert (=> b!1424762 (= e!805448 (= (seekEntryOrOpen!0 (select (arr!46942 a!2831) j!81) a!2831 mask!2608) (Found!11129 j!81)))))

(declare-fun b!1424763 () Bool)

(declare-fun e!805454 () Bool)

(declare-fun e!805450 () Bool)

(assert (=> b!1424763 (= e!805454 e!805450)))

(declare-fun res!959310 () Bool)

(assert (=> b!1424763 (=> res!959310 e!805450)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627593 () (_ BitVec 32))

(assert (=> b!1424763 (= res!959310 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627593 #b00000000000000000000000000000000) (bvsge lt!627593 (size!47493 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424763 (= lt!627593 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1424764 () Bool)

(declare-fun res!959322 () Bool)

(assert (=> b!1424764 (=> (not res!959322) (not e!805453))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1424764 (= res!959322 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47493 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47493 a!2831))))))

(declare-fun b!1424765 () Bool)

(assert (=> b!1424765 (= e!805450 true)))

(declare-fun lt!627592 () SeekEntryResult!11129)

(declare-fun lt!627590 () (_ BitVec 64))

(declare-fun lt!627588 () array!97256)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97256 (_ BitVec 32)) SeekEntryResult!11129)

(assert (=> b!1424765 (= lt!627592 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627593 lt!627590 lt!627588 mask!2608))))

(declare-fun b!1424766 () Bool)

(declare-fun e!805451 () Bool)

(assert (=> b!1424766 (= e!805451 (not e!805454))))

(declare-fun res!959316 () Bool)

(assert (=> b!1424766 (=> res!959316 e!805454)))

(assert (=> b!1424766 (= res!959316 (or (= (select (arr!46942 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46942 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46942 a!2831) index!585) (select (arr!46942 a!2831) j!81)) (= (select (store (arr!46942 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424766 e!805448))

(declare-fun res!959317 () Bool)

(assert (=> b!1424766 (=> (not res!959317) (not e!805448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97256 (_ BitVec 32)) Bool)

(assert (=> b!1424766 (= res!959317 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48125 0))(
  ( (Unit!48126) )
))
(declare-fun lt!627589 () Unit!48125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48125)

(assert (=> b!1424766 (= lt!627589 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424767 () Bool)

(declare-fun res!959308 () Bool)

(assert (=> b!1424767 (=> (not res!959308) (not e!805451))))

(declare-fun lt!627587 () SeekEntryResult!11129)

(assert (=> b!1424767 (= res!959308 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627590 lt!627588 mask!2608) lt!627587))))

(declare-fun b!1424768 () Bool)

(declare-fun res!959321 () Bool)

(assert (=> b!1424768 (=> (not res!959321) (not e!805453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424768 (= res!959321 (validKeyInArray!0 (select (arr!46942 a!2831) j!81)))))

(declare-fun b!1424769 () Bool)

(declare-fun res!959319 () Bool)

(assert (=> b!1424769 (=> res!959319 e!805450)))

(declare-fun lt!627591 () SeekEntryResult!11129)

(assert (=> b!1424769 (= res!959319 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627593 (select (arr!46942 a!2831) j!81) a!2831 mask!2608) lt!627591)))))

(declare-fun b!1424770 () Bool)

(declare-fun res!959320 () Bool)

(assert (=> b!1424770 (=> (not res!959320) (not e!805451))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424770 (= res!959320 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!959323 () Bool)

(assert (=> start!123020 (=> (not res!959323) (not e!805453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123020 (= res!959323 (validMask!0 mask!2608))))

(assert (=> start!123020 e!805453))

(assert (=> start!123020 true))

(declare-fun array_inv!36223 (array!97256) Bool)

(assert (=> start!123020 (array_inv!36223 a!2831)))

(declare-fun b!1424761 () Bool)

(declare-fun e!805452 () Bool)

(assert (=> b!1424761 (= e!805452 e!805451)))

(declare-fun res!959309 () Bool)

(assert (=> b!1424761 (=> (not res!959309) (not e!805451))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424761 (= res!959309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627590 mask!2608) lt!627590 lt!627588 mask!2608) lt!627587))))

(assert (=> b!1424761 (= lt!627587 (Intermediate!11129 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424761 (= lt!627590 (select (store (arr!46942 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424761 (= lt!627588 (array!97257 (store (arr!46942 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47493 a!2831)))))

(declare-fun b!1424771 () Bool)

(declare-fun res!959314 () Bool)

(assert (=> b!1424771 (=> (not res!959314) (not e!805453))))

(assert (=> b!1424771 (= res!959314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424772 () Bool)

(assert (=> b!1424772 (= e!805453 e!805452)))

(declare-fun res!959313 () Bool)

(assert (=> b!1424772 (=> (not res!959313) (not e!805452))))

(assert (=> b!1424772 (= res!959313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46942 a!2831) j!81) mask!2608) (select (arr!46942 a!2831) j!81) a!2831 mask!2608) lt!627591))))

(assert (=> b!1424772 (= lt!627591 (Intermediate!11129 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424773 () Bool)

(declare-fun res!959318 () Bool)

(assert (=> b!1424773 (=> (not res!959318) (not e!805453))))

(assert (=> b!1424773 (= res!959318 (validKeyInArray!0 (select (arr!46942 a!2831) i!982)))))

(declare-fun b!1424774 () Bool)

(declare-fun res!959311 () Bool)

(assert (=> b!1424774 (=> (not res!959311) (not e!805453))))

(declare-datatypes ((List!33439 0))(
  ( (Nil!33436) (Cons!33435 (h!34748 (_ BitVec 64)) (t!48125 List!33439)) )
))
(declare-fun arrayNoDuplicates!0 (array!97256 (_ BitVec 32) List!33439) Bool)

(assert (=> b!1424774 (= res!959311 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33436))))

(declare-fun b!1424775 () Bool)

(declare-fun res!959312 () Bool)

(assert (=> b!1424775 (=> (not res!959312) (not e!805451))))

(assert (=> b!1424775 (= res!959312 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46942 a!2831) j!81) a!2831 mask!2608) lt!627591))))

(assert (= (and start!123020 res!959323) b!1424760))

(assert (= (and b!1424760 res!959315) b!1424773))

(assert (= (and b!1424773 res!959318) b!1424768))

(assert (= (and b!1424768 res!959321) b!1424771))

(assert (= (and b!1424771 res!959314) b!1424774))

(assert (= (and b!1424774 res!959311) b!1424764))

(assert (= (and b!1424764 res!959322) b!1424772))

(assert (= (and b!1424772 res!959313) b!1424761))

(assert (= (and b!1424761 res!959309) b!1424775))

(assert (= (and b!1424775 res!959312) b!1424767))

(assert (= (and b!1424767 res!959308) b!1424770))

(assert (= (and b!1424770 res!959320) b!1424766))

(assert (= (and b!1424766 res!959317) b!1424762))

(assert (= (and b!1424766 (not res!959316)) b!1424763))

(assert (= (and b!1424763 (not res!959310)) b!1424769))

(assert (= (and b!1424769 (not res!959319)) b!1424765))

(declare-fun m!1315425 () Bool)

(assert (=> b!1424766 m!1315425))

(declare-fun m!1315427 () Bool)

(assert (=> b!1424766 m!1315427))

(declare-fun m!1315429 () Bool)

(assert (=> b!1424766 m!1315429))

(declare-fun m!1315431 () Bool)

(assert (=> b!1424766 m!1315431))

(declare-fun m!1315433 () Bool)

(assert (=> b!1424766 m!1315433))

(declare-fun m!1315435 () Bool)

(assert (=> b!1424766 m!1315435))

(declare-fun m!1315437 () Bool)

(assert (=> b!1424765 m!1315437))

(assert (=> b!1424762 m!1315433))

(assert (=> b!1424762 m!1315433))

(declare-fun m!1315439 () Bool)

(assert (=> b!1424762 m!1315439))

(assert (=> b!1424772 m!1315433))

(assert (=> b!1424772 m!1315433))

(declare-fun m!1315441 () Bool)

(assert (=> b!1424772 m!1315441))

(assert (=> b!1424772 m!1315441))

(assert (=> b!1424772 m!1315433))

(declare-fun m!1315443 () Bool)

(assert (=> b!1424772 m!1315443))

(declare-fun m!1315445 () Bool)

(assert (=> b!1424761 m!1315445))

(assert (=> b!1424761 m!1315445))

(declare-fun m!1315447 () Bool)

(assert (=> b!1424761 m!1315447))

(assert (=> b!1424761 m!1315425))

(declare-fun m!1315449 () Bool)

(assert (=> b!1424761 m!1315449))

(declare-fun m!1315451 () Bool)

(assert (=> b!1424767 m!1315451))

(assert (=> b!1424775 m!1315433))

(assert (=> b!1424775 m!1315433))

(declare-fun m!1315453 () Bool)

(assert (=> b!1424775 m!1315453))

(declare-fun m!1315455 () Bool)

(assert (=> b!1424773 m!1315455))

(assert (=> b!1424773 m!1315455))

(declare-fun m!1315457 () Bool)

(assert (=> b!1424773 m!1315457))

(assert (=> b!1424769 m!1315433))

(assert (=> b!1424769 m!1315433))

(declare-fun m!1315459 () Bool)

(assert (=> b!1424769 m!1315459))

(declare-fun m!1315461 () Bool)

(assert (=> b!1424771 m!1315461))

(assert (=> b!1424768 m!1315433))

(assert (=> b!1424768 m!1315433))

(declare-fun m!1315463 () Bool)

(assert (=> b!1424768 m!1315463))

(declare-fun m!1315465 () Bool)

(assert (=> start!123020 m!1315465))

(declare-fun m!1315467 () Bool)

(assert (=> start!123020 m!1315467))

(declare-fun m!1315469 () Bool)

(assert (=> b!1424763 m!1315469))

(declare-fun m!1315471 () Bool)

(assert (=> b!1424774 m!1315471))

(check-sat (not b!1424775) (not start!123020) (not b!1424765) (not b!1424763) (not b!1424766) (not b!1424768) (not b!1424774) (not b!1424761) (not b!1424771) (not b!1424762) (not b!1424767) (not b!1424769) (not b!1424772) (not b!1424773))
(check-sat)
