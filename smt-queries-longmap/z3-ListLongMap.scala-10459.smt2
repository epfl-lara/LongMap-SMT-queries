; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123158 () Bool)

(assert start!123158)

(declare-fun b!1427178 () Bool)

(declare-fun res!961726 () Bool)

(declare-fun e!806371 () Bool)

(assert (=> b!1427178 (=> (not res!961726) (not e!806371))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97394 0))(
  ( (array!97395 (arr!47011 (Array (_ BitVec 32) (_ BitVec 64))) (size!47562 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97394)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11192 0))(
  ( (MissingZero!11192 (index!47160 (_ BitVec 32))) (Found!11192 (index!47161 (_ BitVec 32))) (Intermediate!11192 (undefined!12004 Bool) (index!47162 (_ BitVec 32)) (x!128955 (_ BitVec 32))) (Undefined!11192) (MissingVacant!11192 (index!47163 (_ BitVec 32))) )
))
(declare-fun lt!628411 () SeekEntryResult!11192)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97394 (_ BitVec 32)) SeekEntryResult!11192)

(assert (=> b!1427178 (= res!961726 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!628411))))

(declare-fun b!1427179 () Bool)

(declare-fun res!961735 () Bool)

(declare-fun e!806372 () Bool)

(assert (=> b!1427179 (=> (not res!961735) (not e!806372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427179 (= res!961735 (validKeyInArray!0 (select (arr!47011 a!2831) j!81)))))

(declare-fun b!1427180 () Bool)

(declare-fun res!961730 () Bool)

(assert (=> b!1427180 (=> (not res!961730) (not e!806372))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1427180 (= res!961730 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47562 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47562 a!2831))))))

(declare-fun b!1427182 () Bool)

(assert (=> b!1427182 (= e!806371 false)))

(declare-fun lt!628409 () SeekEntryResult!11192)

(declare-fun lt!628412 () (_ BitVec 64))

(declare-fun lt!628410 () array!97394)

(assert (=> b!1427182 (= lt!628409 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628412 lt!628410 mask!2608))))

(declare-fun b!1427183 () Bool)

(declare-fun e!806370 () Bool)

(assert (=> b!1427183 (= e!806370 e!806371)))

(declare-fun res!961728 () Bool)

(assert (=> b!1427183 (=> (not res!961728) (not e!806371))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427183 (= res!961728 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628412 mask!2608) lt!628412 lt!628410 mask!2608) (Intermediate!11192 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427183 (= lt!628412 (select (store (arr!47011 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427183 (= lt!628410 (array!97395 (store (arr!47011 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47562 a!2831)))))

(declare-fun b!1427184 () Bool)

(assert (=> b!1427184 (= e!806372 e!806370)))

(declare-fun res!961732 () Bool)

(assert (=> b!1427184 (=> (not res!961732) (not e!806370))))

(assert (=> b!1427184 (= res!961732 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!628411))))

(assert (=> b!1427184 (= lt!628411 (Intermediate!11192 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427185 () Bool)

(declare-fun res!961731 () Bool)

(assert (=> b!1427185 (=> (not res!961731) (not e!806372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97394 (_ BitVec 32)) Bool)

(assert (=> b!1427185 (= res!961731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427181 () Bool)

(declare-fun res!961729 () Bool)

(assert (=> b!1427181 (=> (not res!961729) (not e!806372))))

(assert (=> b!1427181 (= res!961729 (validKeyInArray!0 (select (arr!47011 a!2831) i!982)))))

(declare-fun res!961734 () Bool)

(assert (=> start!123158 (=> (not res!961734) (not e!806372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123158 (= res!961734 (validMask!0 mask!2608))))

(assert (=> start!123158 e!806372))

(assert (=> start!123158 true))

(declare-fun array_inv!36292 (array!97394) Bool)

(assert (=> start!123158 (array_inv!36292 a!2831)))

(declare-fun b!1427186 () Bool)

(declare-fun res!961727 () Bool)

(assert (=> b!1427186 (=> (not res!961727) (not e!806372))))

(declare-datatypes ((List!33508 0))(
  ( (Nil!33505) (Cons!33504 (h!34817 (_ BitVec 64)) (t!48194 List!33508)) )
))
(declare-fun arrayNoDuplicates!0 (array!97394 (_ BitVec 32) List!33508) Bool)

(assert (=> b!1427186 (= res!961727 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33505))))

(declare-fun b!1427187 () Bool)

(declare-fun res!961733 () Bool)

(assert (=> b!1427187 (=> (not res!961733) (not e!806372))))

(assert (=> b!1427187 (= res!961733 (and (= (size!47562 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47562 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47562 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123158 res!961734) b!1427187))

(assert (= (and b!1427187 res!961733) b!1427181))

(assert (= (and b!1427181 res!961729) b!1427179))

(assert (= (and b!1427179 res!961735) b!1427185))

(assert (= (and b!1427185 res!961731) b!1427186))

(assert (= (and b!1427186 res!961727) b!1427180))

(assert (= (and b!1427180 res!961730) b!1427184))

(assert (= (and b!1427184 res!961732) b!1427183))

(assert (= (and b!1427183 res!961728) b!1427178))

(assert (= (and b!1427178 res!961726) b!1427182))

(declare-fun m!1317897 () Bool)

(assert (=> b!1427178 m!1317897))

(assert (=> b!1427178 m!1317897))

(declare-fun m!1317899 () Bool)

(assert (=> b!1427178 m!1317899))

(assert (=> b!1427179 m!1317897))

(assert (=> b!1427179 m!1317897))

(declare-fun m!1317901 () Bool)

(assert (=> b!1427179 m!1317901))

(declare-fun m!1317903 () Bool)

(assert (=> b!1427182 m!1317903))

(declare-fun m!1317905 () Bool)

(assert (=> start!123158 m!1317905))

(declare-fun m!1317907 () Bool)

(assert (=> start!123158 m!1317907))

(declare-fun m!1317909 () Bool)

(assert (=> b!1427183 m!1317909))

(assert (=> b!1427183 m!1317909))

(declare-fun m!1317911 () Bool)

(assert (=> b!1427183 m!1317911))

(declare-fun m!1317913 () Bool)

(assert (=> b!1427183 m!1317913))

(declare-fun m!1317915 () Bool)

(assert (=> b!1427183 m!1317915))

(declare-fun m!1317917 () Bool)

(assert (=> b!1427185 m!1317917))

(declare-fun m!1317919 () Bool)

(assert (=> b!1427181 m!1317919))

(assert (=> b!1427181 m!1317919))

(declare-fun m!1317921 () Bool)

(assert (=> b!1427181 m!1317921))

(assert (=> b!1427184 m!1317897))

(assert (=> b!1427184 m!1317897))

(declare-fun m!1317923 () Bool)

(assert (=> b!1427184 m!1317923))

(assert (=> b!1427184 m!1317923))

(assert (=> b!1427184 m!1317897))

(declare-fun m!1317925 () Bool)

(assert (=> b!1427184 m!1317925))

(declare-fun m!1317927 () Bool)

(assert (=> b!1427186 m!1317927))

(check-sat (not start!123158) (not b!1427186) (not b!1427179) (not b!1427185) (not b!1427184) (not b!1427183) (not b!1427181) (not b!1427178) (not b!1427182))
(check-sat)
