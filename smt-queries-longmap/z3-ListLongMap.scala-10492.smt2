; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123512 () Bool)

(assert start!123512)

(declare-fun b!1431773 () Bool)

(declare-fun e!808293 () Bool)

(declare-fun e!808294 () Bool)

(assert (=> b!1431773 (= e!808293 (not e!808294))))

(declare-fun res!965746 () Bool)

(assert (=> b!1431773 (=> res!965746 e!808294)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97449 0))(
  ( (array!97450 (arr!47032 (Array (_ BitVec 32) (_ BitVec 64))) (size!47584 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97449)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431773 (= res!965746 (or (= (select (arr!47032 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47032 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47032 a!2831) index!585) (select (arr!47032 a!2831) j!81)) (= (select (store (arr!47032 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808295 () Bool)

(assert (=> b!1431773 e!808295))

(declare-fun res!965747 () Bool)

(assert (=> b!1431773 (=> (not res!965747) (not e!808295))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97449 (_ BitVec 32)) Bool)

(assert (=> b!1431773 (= res!965747 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48261 0))(
  ( (Unit!48262) )
))
(declare-fun lt!630159 () Unit!48261)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48261)

(assert (=> b!1431773 (= lt!630159 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431774 () Bool)

(declare-fun res!965752 () Bool)

(assert (=> b!1431774 (=> (not res!965752) (not e!808293))))

(declare-fun lt!630157 () (_ BitVec 64))

(declare-fun lt!630158 () array!97449)

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11338 0))(
  ( (MissingZero!11338 (index!47744 (_ BitVec 32))) (Found!11338 (index!47745 (_ BitVec 32))) (Intermediate!11338 (undefined!12150 Bool) (index!47746 (_ BitVec 32)) (x!129383 (_ BitVec 32))) (Undefined!11338) (MissingVacant!11338 (index!47747 (_ BitVec 32))) )
))
(declare-fun lt!630154 () SeekEntryResult!11338)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97449 (_ BitVec 32)) SeekEntryResult!11338)

(assert (=> b!1431774 (= res!965752 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630157 lt!630158 mask!2608) lt!630154))))

(declare-fun b!1431775 () Bool)

(declare-fun res!965754 () Bool)

(declare-fun e!808291 () Bool)

(assert (=> b!1431775 (=> (not res!965754) (not e!808291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431775 (= res!965754 (validKeyInArray!0 (select (arr!47032 a!2831) i!982)))))

(declare-fun b!1431776 () Bool)

(assert (=> b!1431776 (= e!808294 true)))

(declare-fun lt!630156 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431776 (= lt!630156 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431777 () Bool)

(declare-fun res!965751 () Bool)

(assert (=> b!1431777 (=> (not res!965751) (not e!808291))))

(assert (=> b!1431777 (= res!965751 (validKeyInArray!0 (select (arr!47032 a!2831) j!81)))))

(declare-fun b!1431778 () Bool)

(declare-fun res!965755 () Bool)

(assert (=> b!1431778 (=> (not res!965755) (not e!808291))))

(declare-datatypes ((List!33620 0))(
  ( (Nil!33617) (Cons!33616 (h!34939 (_ BitVec 64)) (t!48306 List!33620)) )
))
(declare-fun arrayNoDuplicates!0 (array!97449 (_ BitVec 32) List!33620) Bool)

(assert (=> b!1431778 (= res!965755 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33617))))

(declare-fun res!965749 () Bool)

(assert (=> start!123512 (=> (not res!965749) (not e!808291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123512 (= res!965749 (validMask!0 mask!2608))))

(assert (=> start!123512 e!808291))

(assert (=> start!123512 true))

(declare-fun array_inv!36265 (array!97449) Bool)

(assert (=> start!123512 (array_inv!36265 a!2831)))

(declare-fun b!1431779 () Bool)

(declare-fun res!965750 () Bool)

(assert (=> b!1431779 (=> (not res!965750) (not e!808291))))

(assert (=> b!1431779 (= res!965750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431780 () Bool)

(declare-fun res!965742 () Bool)

(assert (=> b!1431780 (=> (not res!965742) (not e!808293))))

(declare-fun lt!630155 () SeekEntryResult!11338)

(assert (=> b!1431780 (= res!965742 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47032 a!2831) j!81) a!2831 mask!2608) lt!630155))))

(declare-fun b!1431781 () Bool)

(declare-fun e!808296 () Bool)

(assert (=> b!1431781 (= e!808296 e!808293)))

(declare-fun res!965753 () Bool)

(assert (=> b!1431781 (=> (not res!965753) (not e!808293))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431781 (= res!965753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630157 mask!2608) lt!630157 lt!630158 mask!2608) lt!630154))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431781 (= lt!630154 (Intermediate!11338 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431781 (= lt!630157 (select (store (arr!47032 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431781 (= lt!630158 (array!97450 (store (arr!47032 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47584 a!2831)))))

(declare-fun b!1431782 () Bool)

(declare-fun res!965748 () Bool)

(assert (=> b!1431782 (=> (not res!965748) (not e!808293))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1431782 (= res!965748 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431783 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97449 (_ BitVec 32)) SeekEntryResult!11338)

(assert (=> b!1431783 (= e!808295 (= (seekEntryOrOpen!0 (select (arr!47032 a!2831) j!81) a!2831 mask!2608) (Found!11338 j!81)))))

(declare-fun b!1431784 () Bool)

(declare-fun res!965744 () Bool)

(assert (=> b!1431784 (=> (not res!965744) (not e!808291))))

(assert (=> b!1431784 (= res!965744 (and (= (size!47584 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47584 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47584 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431785 () Bool)

(declare-fun res!965745 () Bool)

(assert (=> b!1431785 (=> (not res!965745) (not e!808291))))

(assert (=> b!1431785 (= res!965745 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47584 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47584 a!2831))))))

(declare-fun b!1431786 () Bool)

(assert (=> b!1431786 (= e!808291 e!808296)))

(declare-fun res!965743 () Bool)

(assert (=> b!1431786 (=> (not res!965743) (not e!808296))))

(assert (=> b!1431786 (= res!965743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47032 a!2831) j!81) mask!2608) (select (arr!47032 a!2831) j!81) a!2831 mask!2608) lt!630155))))

(assert (=> b!1431786 (= lt!630155 (Intermediate!11338 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123512 res!965749) b!1431784))

(assert (= (and b!1431784 res!965744) b!1431775))

(assert (= (and b!1431775 res!965754) b!1431777))

(assert (= (and b!1431777 res!965751) b!1431779))

(assert (= (and b!1431779 res!965750) b!1431778))

(assert (= (and b!1431778 res!965755) b!1431785))

(assert (= (and b!1431785 res!965745) b!1431786))

(assert (= (and b!1431786 res!965743) b!1431781))

(assert (= (and b!1431781 res!965753) b!1431780))

(assert (= (and b!1431780 res!965742) b!1431774))

(assert (= (and b!1431774 res!965752) b!1431782))

(assert (= (and b!1431782 res!965748) b!1431773))

(assert (= (and b!1431773 res!965747) b!1431783))

(assert (= (and b!1431773 (not res!965746)) b!1431776))

(declare-fun m!1321073 () Bool)

(assert (=> b!1431778 m!1321073))

(declare-fun m!1321075 () Bool)

(assert (=> b!1431781 m!1321075))

(assert (=> b!1431781 m!1321075))

(declare-fun m!1321077 () Bool)

(assert (=> b!1431781 m!1321077))

(declare-fun m!1321079 () Bool)

(assert (=> b!1431781 m!1321079))

(declare-fun m!1321081 () Bool)

(assert (=> b!1431781 m!1321081))

(declare-fun m!1321083 () Bool)

(assert (=> b!1431780 m!1321083))

(assert (=> b!1431780 m!1321083))

(declare-fun m!1321085 () Bool)

(assert (=> b!1431780 m!1321085))

(declare-fun m!1321087 () Bool)

(assert (=> b!1431779 m!1321087))

(declare-fun m!1321089 () Bool)

(assert (=> b!1431774 m!1321089))

(assert (=> b!1431777 m!1321083))

(assert (=> b!1431777 m!1321083))

(declare-fun m!1321091 () Bool)

(assert (=> b!1431777 m!1321091))

(assert (=> b!1431783 m!1321083))

(assert (=> b!1431783 m!1321083))

(declare-fun m!1321093 () Bool)

(assert (=> b!1431783 m!1321093))

(assert (=> b!1431773 m!1321079))

(declare-fun m!1321095 () Bool)

(assert (=> b!1431773 m!1321095))

(declare-fun m!1321097 () Bool)

(assert (=> b!1431773 m!1321097))

(declare-fun m!1321099 () Bool)

(assert (=> b!1431773 m!1321099))

(assert (=> b!1431773 m!1321083))

(declare-fun m!1321101 () Bool)

(assert (=> b!1431773 m!1321101))

(declare-fun m!1321103 () Bool)

(assert (=> b!1431775 m!1321103))

(assert (=> b!1431775 m!1321103))

(declare-fun m!1321105 () Bool)

(assert (=> b!1431775 m!1321105))

(assert (=> b!1431786 m!1321083))

(assert (=> b!1431786 m!1321083))

(declare-fun m!1321107 () Bool)

(assert (=> b!1431786 m!1321107))

(assert (=> b!1431786 m!1321107))

(assert (=> b!1431786 m!1321083))

(declare-fun m!1321109 () Bool)

(assert (=> b!1431786 m!1321109))

(declare-fun m!1321111 () Bool)

(assert (=> b!1431776 m!1321111))

(declare-fun m!1321113 () Bool)

(assert (=> start!123512 m!1321113))

(declare-fun m!1321115 () Bool)

(assert (=> start!123512 m!1321115))

(check-sat (not b!1431773) (not b!1431780) (not b!1431783) (not b!1431778) (not start!123512) (not b!1431786) (not b!1431774) (not b!1431781) (not b!1431777) (not b!1431775) (not b!1431776) (not b!1431779))
(check-sat)
