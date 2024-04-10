; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122816 () Bool)

(assert start!122816)

(declare-fun b!1424223 () Bool)

(declare-fun res!959665 () Bool)

(declare-fun e!804921 () Bool)

(assert (=> b!1424223 (=> (not res!959665) (not e!804921))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97181 0))(
  ( (array!97182 (arr!46908 (Array (_ BitVec 32) (_ BitVec 64))) (size!47458 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97181)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424223 (= res!959665 (and (= (size!47458 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47458 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47458 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!959660 () Bool)

(assert (=> start!122816 (=> (not res!959660) (not e!804921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122816 (= res!959660 (validMask!0 mask!2608))))

(assert (=> start!122816 e!804921))

(assert (=> start!122816 true))

(declare-fun array_inv!35936 (array!97181) Bool)

(assert (=> start!122816 (array_inv!35936 a!2831)))

(declare-fun b!1424224 () Bool)

(declare-fun res!959670 () Bool)

(declare-fun e!804923 () Bool)

(assert (=> b!1424224 (=> res!959670 e!804923)))

(declare-datatypes ((SeekEntryResult!11193 0))(
  ( (MissingZero!11193 (index!47164 (_ BitVec 32))) (Found!11193 (index!47165 (_ BitVec 32))) (Intermediate!11193 (undefined!12005 Bool) (index!47166 (_ BitVec 32)) (x!128795 (_ BitVec 32))) (Undefined!11193) (MissingVacant!11193 (index!47167 (_ BitVec 32))) )
))
(declare-fun lt!627458 () SeekEntryResult!11193)

(declare-fun lt!627456 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97181 (_ BitVec 32)) SeekEntryResult!11193)

(assert (=> b!1424224 (= res!959670 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627456 (select (arr!46908 a!2831) j!81) a!2831 mask!2608) lt!627458)))))

(declare-fun b!1424225 () Bool)

(declare-fun res!959663 () Bool)

(assert (=> b!1424225 (=> (not res!959663) (not e!804921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97181 (_ BitVec 32)) Bool)

(assert (=> b!1424225 (= res!959663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424226 () Bool)

(declare-fun e!804922 () Bool)

(assert (=> b!1424226 (= e!804922 e!804923)))

(declare-fun res!959664 () Bool)

(assert (=> b!1424226 (=> res!959664 e!804923)))

(assert (=> b!1424226 (= res!959664 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627456 #b00000000000000000000000000000000) (bvsge lt!627456 (size!47458 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424226 (= lt!627456 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424227 () Bool)

(declare-fun e!804924 () Bool)

(assert (=> b!1424227 (= e!804921 e!804924)))

(declare-fun res!959662 () Bool)

(assert (=> b!1424227 (=> (not res!959662) (not e!804924))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424227 (= res!959662 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46908 a!2831) j!81) mask!2608) (select (arr!46908 a!2831) j!81) a!2831 mask!2608) lt!627458))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424227 (= lt!627458 (Intermediate!11193 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424228 () Bool)

(assert (=> b!1424228 (= e!804923 true)))

(declare-fun lt!627459 () array!97181)

(declare-fun lt!627460 () (_ BitVec 64))

(declare-fun lt!627457 () SeekEntryResult!11193)

(assert (=> b!1424228 (= lt!627457 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627456 lt!627460 lt!627459 mask!2608))))

(declare-fun b!1424229 () Bool)

(declare-fun res!959659 () Bool)

(assert (=> b!1424229 (=> (not res!959659) (not e!804921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424229 (= res!959659 (validKeyInArray!0 (select (arr!46908 a!2831) j!81)))))

(declare-fun b!1424230 () Bool)

(declare-fun e!804920 () Bool)

(assert (=> b!1424230 (= e!804924 e!804920)))

(declare-fun res!959661 () Bool)

(assert (=> b!1424230 (=> (not res!959661) (not e!804920))))

(declare-fun lt!627461 () SeekEntryResult!11193)

(assert (=> b!1424230 (= res!959661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627460 mask!2608) lt!627460 lt!627459 mask!2608) lt!627461))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424230 (= lt!627461 (Intermediate!11193 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424230 (= lt!627460 (select (store (arr!46908 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424230 (= lt!627459 (array!97182 (store (arr!46908 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47458 a!2831)))))

(declare-fun b!1424231 () Bool)

(assert (=> b!1424231 (= e!804920 (not e!804922))))

(declare-fun res!959671 () Bool)

(assert (=> b!1424231 (=> res!959671 e!804922)))

(assert (=> b!1424231 (= res!959671 (or (= (select (arr!46908 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46908 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46908 a!2831) index!585) (select (arr!46908 a!2831) j!81)) (= (select (store (arr!46908 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804925 () Bool)

(assert (=> b!1424231 e!804925))

(declare-fun res!959668 () Bool)

(assert (=> b!1424231 (=> (not res!959668) (not e!804925))))

(assert (=> b!1424231 (= res!959668 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48222 0))(
  ( (Unit!48223) )
))
(declare-fun lt!627462 () Unit!48222)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48222)

(assert (=> b!1424231 (= lt!627462 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424232 () Bool)

(declare-fun res!959667 () Bool)

(assert (=> b!1424232 (=> (not res!959667) (not e!804920))))

(assert (=> b!1424232 (= res!959667 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627460 lt!627459 mask!2608) lt!627461))))

(declare-fun b!1424233 () Bool)

(declare-fun res!959669 () Bool)

(assert (=> b!1424233 (=> (not res!959669) (not e!804921))))

(assert (=> b!1424233 (= res!959669 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47458 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47458 a!2831))))))

(declare-fun b!1424234 () Bool)

(declare-fun res!959656 () Bool)

(assert (=> b!1424234 (=> (not res!959656) (not e!804921))))

(assert (=> b!1424234 (= res!959656 (validKeyInArray!0 (select (arr!46908 a!2831) i!982)))))

(declare-fun b!1424235 () Bool)

(declare-fun res!959666 () Bool)

(assert (=> b!1424235 (=> (not res!959666) (not e!804920))))

(assert (=> b!1424235 (= res!959666 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46908 a!2831) j!81) a!2831 mask!2608) lt!627458))))

(declare-fun b!1424236 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97181 (_ BitVec 32)) SeekEntryResult!11193)

(assert (=> b!1424236 (= e!804925 (= (seekEntryOrOpen!0 (select (arr!46908 a!2831) j!81) a!2831 mask!2608) (Found!11193 j!81)))))

(declare-fun b!1424237 () Bool)

(declare-fun res!959657 () Bool)

(assert (=> b!1424237 (=> (not res!959657) (not e!804921))))

(declare-datatypes ((List!33418 0))(
  ( (Nil!33415) (Cons!33414 (h!34716 (_ BitVec 64)) (t!48112 List!33418)) )
))
(declare-fun arrayNoDuplicates!0 (array!97181 (_ BitVec 32) List!33418) Bool)

(assert (=> b!1424237 (= res!959657 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33415))))

(declare-fun b!1424238 () Bool)

(declare-fun res!959658 () Bool)

(assert (=> b!1424238 (=> (not res!959658) (not e!804920))))

(assert (=> b!1424238 (= res!959658 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122816 res!959660) b!1424223))

(assert (= (and b!1424223 res!959665) b!1424234))

(assert (= (and b!1424234 res!959656) b!1424229))

(assert (= (and b!1424229 res!959659) b!1424225))

(assert (= (and b!1424225 res!959663) b!1424237))

(assert (= (and b!1424237 res!959657) b!1424233))

(assert (= (and b!1424233 res!959669) b!1424227))

(assert (= (and b!1424227 res!959662) b!1424230))

(assert (= (and b!1424230 res!959661) b!1424235))

(assert (= (and b!1424235 res!959666) b!1424232))

(assert (= (and b!1424232 res!959667) b!1424238))

(assert (= (and b!1424238 res!959658) b!1424231))

(assert (= (and b!1424231 res!959668) b!1424236))

(assert (= (and b!1424231 (not res!959671)) b!1424226))

(assert (= (and b!1424226 (not res!959664)) b!1424224))

(assert (= (and b!1424224 (not res!959670)) b!1424228))

(declare-fun m!1314771 () Bool)

(assert (=> b!1424234 m!1314771))

(assert (=> b!1424234 m!1314771))

(declare-fun m!1314773 () Bool)

(assert (=> b!1424234 m!1314773))

(declare-fun m!1314775 () Bool)

(assert (=> b!1424229 m!1314775))

(assert (=> b!1424229 m!1314775))

(declare-fun m!1314777 () Bool)

(assert (=> b!1424229 m!1314777))

(assert (=> b!1424224 m!1314775))

(assert (=> b!1424224 m!1314775))

(declare-fun m!1314779 () Bool)

(assert (=> b!1424224 m!1314779))

(assert (=> b!1424236 m!1314775))

(assert (=> b!1424236 m!1314775))

(declare-fun m!1314781 () Bool)

(assert (=> b!1424236 m!1314781))

(assert (=> b!1424235 m!1314775))

(assert (=> b!1424235 m!1314775))

(declare-fun m!1314783 () Bool)

(assert (=> b!1424235 m!1314783))

(declare-fun m!1314785 () Bool)

(assert (=> b!1424230 m!1314785))

(assert (=> b!1424230 m!1314785))

(declare-fun m!1314787 () Bool)

(assert (=> b!1424230 m!1314787))

(declare-fun m!1314789 () Bool)

(assert (=> b!1424230 m!1314789))

(declare-fun m!1314791 () Bool)

(assert (=> b!1424230 m!1314791))

(declare-fun m!1314793 () Bool)

(assert (=> b!1424228 m!1314793))

(assert (=> b!1424231 m!1314789))

(declare-fun m!1314795 () Bool)

(assert (=> b!1424231 m!1314795))

(declare-fun m!1314797 () Bool)

(assert (=> b!1424231 m!1314797))

(declare-fun m!1314799 () Bool)

(assert (=> b!1424231 m!1314799))

(assert (=> b!1424231 m!1314775))

(declare-fun m!1314801 () Bool)

(assert (=> b!1424231 m!1314801))

(declare-fun m!1314803 () Bool)

(assert (=> b!1424225 m!1314803))

(declare-fun m!1314805 () Bool)

(assert (=> start!122816 m!1314805))

(declare-fun m!1314807 () Bool)

(assert (=> start!122816 m!1314807))

(declare-fun m!1314809 () Bool)

(assert (=> b!1424237 m!1314809))

(assert (=> b!1424227 m!1314775))

(assert (=> b!1424227 m!1314775))

(declare-fun m!1314811 () Bool)

(assert (=> b!1424227 m!1314811))

(assert (=> b!1424227 m!1314811))

(assert (=> b!1424227 m!1314775))

(declare-fun m!1314813 () Bool)

(assert (=> b!1424227 m!1314813))

(declare-fun m!1314815 () Bool)

(assert (=> b!1424226 m!1314815))

(declare-fun m!1314817 () Bool)

(assert (=> b!1424232 m!1314817))

(check-sat (not b!1424227) (not b!1424229) (not b!1424235) (not b!1424224) (not b!1424236) (not start!122816) (not b!1424225) (not b!1424230) (not b!1424228) (not b!1424237) (not b!1424231) (not b!1424226) (not b!1424234) (not b!1424232))
(check-sat)
