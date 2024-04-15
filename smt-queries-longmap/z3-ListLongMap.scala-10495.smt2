; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123530 () Bool)

(assert start!123530)

(declare-fun b!1432151 () Bool)

(declare-fun e!808456 () Bool)

(assert (=> b!1432151 (= e!808456 true)))

(declare-fun lt!630321 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432151 (= lt!630321 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!966128 () Bool)

(declare-fun e!808453 () Bool)

(assert (=> start!123530 (=> (not res!966128) (not e!808453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123530 (= res!966128 (validMask!0 mask!2608))))

(assert (=> start!123530 e!808453))

(assert (=> start!123530 true))

(declare-datatypes ((array!97467 0))(
  ( (array!97468 (arr!47041 (Array (_ BitVec 32) (_ BitVec 64))) (size!47593 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97467)

(declare-fun array_inv!36274 (array!97467) Bool)

(assert (=> start!123530 (array_inv!36274 a!2831)))

(declare-fun b!1432152 () Bool)

(declare-fun res!966127 () Bool)

(assert (=> b!1432152 (=> (not res!966127) (not e!808453))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432152 (= res!966127 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47593 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47593 a!2831))))))

(declare-fun b!1432153 () Bool)

(declare-fun res!966133 () Bool)

(assert (=> b!1432153 (=> (not res!966133) (not e!808453))))

(declare-datatypes ((List!33629 0))(
  ( (Nil!33626) (Cons!33625 (h!34948 (_ BitVec 64)) (t!48315 List!33629)) )
))
(declare-fun arrayNoDuplicates!0 (array!97467 (_ BitVec 32) List!33629) Bool)

(assert (=> b!1432153 (= res!966133 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33626))))

(declare-fun b!1432154 () Bool)

(declare-fun e!808454 () Bool)

(assert (=> b!1432154 (= e!808453 e!808454)))

(declare-fun res!966132 () Bool)

(assert (=> b!1432154 (=> (not res!966132) (not e!808454))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11347 0))(
  ( (MissingZero!11347 (index!47780 (_ BitVec 32))) (Found!11347 (index!47781 (_ BitVec 32))) (Intermediate!11347 (undefined!12159 Bool) (index!47782 (_ BitVec 32)) (x!129416 (_ BitVec 32))) (Undefined!11347) (MissingVacant!11347 (index!47783 (_ BitVec 32))) )
))
(declare-fun lt!630317 () SeekEntryResult!11347)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97467 (_ BitVec 32)) SeekEntryResult!11347)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432154 (= res!966132 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47041 a!2831) j!81) mask!2608) (select (arr!47041 a!2831) j!81) a!2831 mask!2608) lt!630317))))

(assert (=> b!1432154 (= lt!630317 (Intermediate!11347 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432155 () Bool)

(declare-fun res!966121 () Bool)

(assert (=> b!1432155 (=> (not res!966121) (not e!808453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97467 (_ BitVec 32)) Bool)

(assert (=> b!1432155 (= res!966121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun e!808455 () Bool)

(declare-fun b!1432156 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97467 (_ BitVec 32)) SeekEntryResult!11347)

(assert (=> b!1432156 (= e!808455 (= (seekEntryOrOpen!0 (select (arr!47041 a!2831) j!81) a!2831 mask!2608) (Found!11347 j!81)))))

(declare-fun b!1432157 () Bool)

(declare-fun res!966126 () Bool)

(assert (=> b!1432157 (=> (not res!966126) (not e!808453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432157 (= res!966126 (validKeyInArray!0 (select (arr!47041 a!2831) j!81)))))

(declare-fun b!1432158 () Bool)

(declare-fun res!966129 () Bool)

(declare-fun e!808457 () Bool)

(assert (=> b!1432158 (=> (not res!966129) (not e!808457))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432158 (= res!966129 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432159 () Bool)

(declare-fun res!966130 () Bool)

(assert (=> b!1432159 (=> (not res!966130) (not e!808457))))

(assert (=> b!1432159 (= res!966130 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47041 a!2831) j!81) a!2831 mask!2608) lt!630317))))

(declare-fun b!1432160 () Bool)

(assert (=> b!1432160 (= e!808454 e!808457)))

(declare-fun res!966131 () Bool)

(assert (=> b!1432160 (=> (not res!966131) (not e!808457))))

(declare-fun lt!630319 () SeekEntryResult!11347)

(declare-fun lt!630320 () array!97467)

(declare-fun lt!630316 () (_ BitVec 64))

(assert (=> b!1432160 (= res!966131 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630316 mask!2608) lt!630316 lt!630320 mask!2608) lt!630319))))

(assert (=> b!1432160 (= lt!630319 (Intermediate!11347 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432160 (= lt!630316 (select (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432160 (= lt!630320 (array!97468 (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47593 a!2831)))))

(declare-fun b!1432161 () Bool)

(declare-fun res!966120 () Bool)

(assert (=> b!1432161 (=> (not res!966120) (not e!808453))))

(assert (=> b!1432161 (= res!966120 (and (= (size!47593 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47593 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47593 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432162 () Bool)

(assert (=> b!1432162 (= e!808457 (not e!808456))))

(declare-fun res!966122 () Bool)

(assert (=> b!1432162 (=> res!966122 e!808456)))

(assert (=> b!1432162 (= res!966122 (or (= (select (arr!47041 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47041 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47041 a!2831) index!585) (select (arr!47041 a!2831) j!81)) (= (select (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432162 e!808455))

(declare-fun res!966123 () Bool)

(assert (=> b!1432162 (=> (not res!966123) (not e!808455))))

(assert (=> b!1432162 (= res!966123 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48279 0))(
  ( (Unit!48280) )
))
(declare-fun lt!630318 () Unit!48279)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48279)

(assert (=> b!1432162 (= lt!630318 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432163 () Bool)

(declare-fun res!966125 () Bool)

(assert (=> b!1432163 (=> (not res!966125) (not e!808453))))

(assert (=> b!1432163 (= res!966125 (validKeyInArray!0 (select (arr!47041 a!2831) i!982)))))

(declare-fun b!1432164 () Bool)

(declare-fun res!966124 () Bool)

(assert (=> b!1432164 (=> (not res!966124) (not e!808457))))

(assert (=> b!1432164 (= res!966124 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630316 lt!630320 mask!2608) lt!630319))))

(assert (= (and start!123530 res!966128) b!1432161))

(assert (= (and b!1432161 res!966120) b!1432163))

(assert (= (and b!1432163 res!966125) b!1432157))

(assert (= (and b!1432157 res!966126) b!1432155))

(assert (= (and b!1432155 res!966121) b!1432153))

(assert (= (and b!1432153 res!966133) b!1432152))

(assert (= (and b!1432152 res!966127) b!1432154))

(assert (= (and b!1432154 res!966132) b!1432160))

(assert (= (and b!1432160 res!966131) b!1432159))

(assert (= (and b!1432159 res!966130) b!1432164))

(assert (= (and b!1432164 res!966124) b!1432158))

(assert (= (and b!1432158 res!966129) b!1432162))

(assert (= (and b!1432162 res!966123) b!1432156))

(assert (= (and b!1432162 (not res!966122)) b!1432151))

(declare-fun m!1321469 () Bool)

(assert (=> b!1432157 m!1321469))

(assert (=> b!1432157 m!1321469))

(declare-fun m!1321471 () Bool)

(assert (=> b!1432157 m!1321471))

(declare-fun m!1321473 () Bool)

(assert (=> b!1432164 m!1321473))

(declare-fun m!1321475 () Bool)

(assert (=> b!1432155 m!1321475))

(assert (=> b!1432156 m!1321469))

(assert (=> b!1432156 m!1321469))

(declare-fun m!1321477 () Bool)

(assert (=> b!1432156 m!1321477))

(assert (=> b!1432159 m!1321469))

(assert (=> b!1432159 m!1321469))

(declare-fun m!1321479 () Bool)

(assert (=> b!1432159 m!1321479))

(declare-fun m!1321481 () Bool)

(assert (=> b!1432162 m!1321481))

(declare-fun m!1321483 () Bool)

(assert (=> b!1432162 m!1321483))

(declare-fun m!1321485 () Bool)

(assert (=> b!1432162 m!1321485))

(declare-fun m!1321487 () Bool)

(assert (=> b!1432162 m!1321487))

(assert (=> b!1432162 m!1321469))

(declare-fun m!1321489 () Bool)

(assert (=> b!1432162 m!1321489))

(declare-fun m!1321491 () Bool)

(assert (=> b!1432151 m!1321491))

(assert (=> b!1432154 m!1321469))

(assert (=> b!1432154 m!1321469))

(declare-fun m!1321493 () Bool)

(assert (=> b!1432154 m!1321493))

(assert (=> b!1432154 m!1321493))

(assert (=> b!1432154 m!1321469))

(declare-fun m!1321495 () Bool)

(assert (=> b!1432154 m!1321495))

(declare-fun m!1321497 () Bool)

(assert (=> b!1432153 m!1321497))

(declare-fun m!1321499 () Bool)

(assert (=> b!1432163 m!1321499))

(assert (=> b!1432163 m!1321499))

(declare-fun m!1321501 () Bool)

(assert (=> b!1432163 m!1321501))

(declare-fun m!1321503 () Bool)

(assert (=> b!1432160 m!1321503))

(assert (=> b!1432160 m!1321503))

(declare-fun m!1321505 () Bool)

(assert (=> b!1432160 m!1321505))

(assert (=> b!1432160 m!1321481))

(declare-fun m!1321507 () Bool)

(assert (=> b!1432160 m!1321507))

(declare-fun m!1321509 () Bool)

(assert (=> start!123530 m!1321509))

(declare-fun m!1321511 () Bool)

(assert (=> start!123530 m!1321511))

(check-sat (not b!1432154) (not b!1432151) (not b!1432163) (not b!1432155) (not b!1432157) (not b!1432159) (not b!1432164) (not b!1432156) (not b!1432160) (not b!1432153) (not b!1432162) (not start!123530))
(check-sat)
