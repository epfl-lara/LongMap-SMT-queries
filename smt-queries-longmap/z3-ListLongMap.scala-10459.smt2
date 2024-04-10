; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122918 () Bool)

(assert start!122918)

(declare-fun b!1425759 () Bool)

(declare-fun e!805457 () Bool)

(declare-fun e!805456 () Bool)

(assert (=> b!1425759 (= e!805457 e!805456)))

(declare-fun res!961194 () Bool)

(assert (=> b!1425759 (=> (not res!961194) (not e!805456))))

(declare-datatypes ((SeekEntryResult!11238 0))(
  ( (MissingZero!11238 (index!47344 (_ BitVec 32))) (Found!11238 (index!47345 (_ BitVec 32))) (Intermediate!11238 (undefined!12050 Bool) (index!47346 (_ BitVec 32)) (x!128976 (_ BitVec 32))) (Undefined!11238) (MissingVacant!11238 (index!47347 (_ BitVec 32))) )
))
(declare-fun lt!627891 () SeekEntryResult!11238)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97283 0))(
  ( (array!97284 (arr!46959 (Array (_ BitVec 32) (_ BitVec 64))) (size!47509 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97283)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97283 (_ BitVec 32)) SeekEntryResult!11238)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425759 (= res!961194 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608) (select (arr!46959 a!2831) j!81) a!2831 mask!2608) lt!627891))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425759 (= lt!627891 (Intermediate!11238 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425760 () Bool)

(declare-fun e!805455 () Bool)

(assert (=> b!1425760 (= e!805455 false)))

(declare-fun lt!627893 () array!97283)

(declare-fun lt!627892 () SeekEntryResult!11238)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!627894 () (_ BitVec 64))

(assert (=> b!1425760 (= lt!627892 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627894 lt!627893 mask!2608))))

(declare-fun b!1425761 () Bool)

(assert (=> b!1425761 (= e!805456 e!805455)))

(declare-fun res!961192 () Bool)

(assert (=> b!1425761 (=> (not res!961192) (not e!805455))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425761 (= res!961192 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627894 mask!2608) lt!627894 lt!627893 mask!2608) (Intermediate!11238 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425761 (= lt!627894 (select (store (arr!46959 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425761 (= lt!627893 (array!97284 (store (arr!46959 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47509 a!2831)))))

(declare-fun b!1425762 () Bool)

(declare-fun res!961200 () Bool)

(assert (=> b!1425762 (=> (not res!961200) (not e!805457))))

(assert (=> b!1425762 (= res!961200 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47509 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47509 a!2831))))))

(declare-fun res!961201 () Bool)

(assert (=> start!122918 (=> (not res!961201) (not e!805457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122918 (= res!961201 (validMask!0 mask!2608))))

(assert (=> start!122918 e!805457))

(assert (=> start!122918 true))

(declare-fun array_inv!35987 (array!97283) Bool)

(assert (=> start!122918 (array_inv!35987 a!2831)))

(declare-fun b!1425763 () Bool)

(declare-fun res!961195 () Bool)

(assert (=> b!1425763 (=> (not res!961195) (not e!805455))))

(assert (=> b!1425763 (= res!961195 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46959 a!2831) j!81) a!2831 mask!2608) lt!627891))))

(declare-fun b!1425764 () Bool)

(declare-fun res!961197 () Bool)

(assert (=> b!1425764 (=> (not res!961197) (not e!805457))))

(declare-datatypes ((List!33469 0))(
  ( (Nil!33466) (Cons!33465 (h!34767 (_ BitVec 64)) (t!48163 List!33469)) )
))
(declare-fun arrayNoDuplicates!0 (array!97283 (_ BitVec 32) List!33469) Bool)

(assert (=> b!1425764 (= res!961197 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33466))))

(declare-fun b!1425765 () Bool)

(declare-fun res!961196 () Bool)

(assert (=> b!1425765 (=> (not res!961196) (not e!805457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425765 (= res!961196 (validKeyInArray!0 (select (arr!46959 a!2831) i!982)))))

(declare-fun b!1425766 () Bool)

(declare-fun res!961199 () Bool)

(assert (=> b!1425766 (=> (not res!961199) (not e!805457))))

(assert (=> b!1425766 (= res!961199 (and (= (size!47509 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47509 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47509 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425767 () Bool)

(declare-fun res!961198 () Bool)

(assert (=> b!1425767 (=> (not res!961198) (not e!805457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97283 (_ BitVec 32)) Bool)

(assert (=> b!1425767 (= res!961198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425768 () Bool)

(declare-fun res!961193 () Bool)

(assert (=> b!1425768 (=> (not res!961193) (not e!805457))))

(assert (=> b!1425768 (= res!961193 (validKeyInArray!0 (select (arr!46959 a!2831) j!81)))))

(assert (= (and start!122918 res!961201) b!1425766))

(assert (= (and b!1425766 res!961199) b!1425765))

(assert (= (and b!1425765 res!961196) b!1425768))

(assert (= (and b!1425768 res!961193) b!1425767))

(assert (= (and b!1425767 res!961198) b!1425764))

(assert (= (and b!1425764 res!961197) b!1425762))

(assert (= (and b!1425762 res!961200) b!1425759))

(assert (= (and b!1425759 res!961194) b!1425761))

(assert (= (and b!1425761 res!961192) b!1425763))

(assert (= (and b!1425763 res!961195) b!1425760))

(declare-fun m!1316363 () Bool)

(assert (=> b!1425767 m!1316363))

(declare-fun m!1316365 () Bool)

(assert (=> b!1425760 m!1316365))

(declare-fun m!1316367 () Bool)

(assert (=> b!1425763 m!1316367))

(assert (=> b!1425763 m!1316367))

(declare-fun m!1316369 () Bool)

(assert (=> b!1425763 m!1316369))

(declare-fun m!1316371 () Bool)

(assert (=> b!1425764 m!1316371))

(declare-fun m!1316373 () Bool)

(assert (=> start!122918 m!1316373))

(declare-fun m!1316375 () Bool)

(assert (=> start!122918 m!1316375))

(declare-fun m!1316377 () Bool)

(assert (=> b!1425765 m!1316377))

(assert (=> b!1425765 m!1316377))

(declare-fun m!1316379 () Bool)

(assert (=> b!1425765 m!1316379))

(assert (=> b!1425759 m!1316367))

(assert (=> b!1425759 m!1316367))

(declare-fun m!1316381 () Bool)

(assert (=> b!1425759 m!1316381))

(assert (=> b!1425759 m!1316381))

(assert (=> b!1425759 m!1316367))

(declare-fun m!1316383 () Bool)

(assert (=> b!1425759 m!1316383))

(assert (=> b!1425768 m!1316367))

(assert (=> b!1425768 m!1316367))

(declare-fun m!1316385 () Bool)

(assert (=> b!1425768 m!1316385))

(declare-fun m!1316387 () Bool)

(assert (=> b!1425761 m!1316387))

(assert (=> b!1425761 m!1316387))

(declare-fun m!1316389 () Bool)

(assert (=> b!1425761 m!1316389))

(declare-fun m!1316391 () Bool)

(assert (=> b!1425761 m!1316391))

(declare-fun m!1316393 () Bool)

(assert (=> b!1425761 m!1316393))

(check-sat (not b!1425761) (not b!1425765) (not b!1425764) (not b!1425759) (not b!1425763) (not b!1425760) (not b!1425767) (not b!1425768) (not start!122918))
(check-sat)
