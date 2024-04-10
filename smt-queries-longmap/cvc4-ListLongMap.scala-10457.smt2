; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122908 () Bool)

(assert start!122908)

(declare-fun b!1425610 () Bool)

(declare-fun res!961046 () Bool)

(declare-fun e!805396 () Bool)

(assert (=> b!1425610 (=> (not res!961046) (not e!805396))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97273 0))(
  ( (array!97274 (arr!46954 (Array (_ BitVec 32) (_ BitVec 64))) (size!47504 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97273)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11233 0))(
  ( (MissingZero!11233 (index!47324 (_ BitVec 32))) (Found!11233 (index!47325 (_ BitVec 32))) (Intermediate!11233 (undefined!12045 Bool) (index!47326 (_ BitVec 32)) (x!128955 (_ BitVec 32))) (Undefined!11233) (MissingVacant!11233 (index!47327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97273 (_ BitVec 32)) SeekEntryResult!11233)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425610 (= res!961046 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46954 a!2831) j!81) mask!2608) (select (arr!46954 a!2831) j!81) a!2831 mask!2608) (Intermediate!11233 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425611 () Bool)

(declare-fun res!961050 () Bool)

(assert (=> b!1425611 (=> (not res!961050) (not e!805396))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425611 (= res!961050 (and (= (size!47504 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47504 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47504 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425612 () Bool)

(declare-fun res!961047 () Bool)

(assert (=> b!1425612 (=> (not res!961047) (not e!805396))))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1425612 (= res!961047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46954 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46954 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97274 (store (arr!46954 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47504 a!2831)) mask!2608) (Intermediate!11233 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425613 () Bool)

(declare-fun res!961051 () Bool)

(assert (=> b!1425613 (=> (not res!961051) (not e!805396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97273 (_ BitVec 32)) Bool)

(assert (=> b!1425613 (= res!961051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425614 () Bool)

(assert (=> b!1425614 (= e!805396 false)))

(declare-fun lt!627834 () SeekEntryResult!11233)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425614 (= lt!627834 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46954 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425615 () Bool)

(declare-fun res!961044 () Bool)

(assert (=> b!1425615 (=> (not res!961044) (not e!805396))))

(assert (=> b!1425615 (= res!961044 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47504 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47504 a!2831))))))

(declare-fun b!1425616 () Bool)

(declare-fun res!961045 () Bool)

(assert (=> b!1425616 (=> (not res!961045) (not e!805396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425616 (= res!961045 (validKeyInArray!0 (select (arr!46954 a!2831) j!81)))))

(declare-fun b!1425617 () Bool)

(declare-fun res!961048 () Bool)

(assert (=> b!1425617 (=> (not res!961048) (not e!805396))))

(assert (=> b!1425617 (= res!961048 (validKeyInArray!0 (select (arr!46954 a!2831) i!982)))))

(declare-fun res!961049 () Bool)

(assert (=> start!122908 (=> (not res!961049) (not e!805396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122908 (= res!961049 (validMask!0 mask!2608))))

(assert (=> start!122908 e!805396))

(assert (=> start!122908 true))

(declare-fun array_inv!35982 (array!97273) Bool)

(assert (=> start!122908 (array_inv!35982 a!2831)))

(declare-fun b!1425618 () Bool)

(declare-fun res!961043 () Bool)

(assert (=> b!1425618 (=> (not res!961043) (not e!805396))))

(declare-datatypes ((List!33464 0))(
  ( (Nil!33461) (Cons!33460 (h!34762 (_ BitVec 64)) (t!48158 List!33464)) )
))
(declare-fun arrayNoDuplicates!0 (array!97273 (_ BitVec 32) List!33464) Bool)

(assert (=> b!1425618 (= res!961043 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33461))))

(assert (= (and start!122908 res!961049) b!1425611))

(assert (= (and b!1425611 res!961050) b!1425617))

(assert (= (and b!1425617 res!961048) b!1425616))

(assert (= (and b!1425616 res!961045) b!1425613))

(assert (= (and b!1425613 res!961051) b!1425618))

(assert (= (and b!1425618 res!961043) b!1425615))

(assert (= (and b!1425615 res!961044) b!1425610))

(assert (= (and b!1425610 res!961046) b!1425612))

(assert (= (and b!1425612 res!961047) b!1425614))

(declare-fun m!1316205 () Bool)

(assert (=> b!1425614 m!1316205))

(assert (=> b!1425614 m!1316205))

(declare-fun m!1316207 () Bool)

(assert (=> b!1425614 m!1316207))

(declare-fun m!1316209 () Bool)

(assert (=> b!1425613 m!1316209))

(declare-fun m!1316211 () Bool)

(assert (=> b!1425612 m!1316211))

(declare-fun m!1316213 () Bool)

(assert (=> b!1425612 m!1316213))

(assert (=> b!1425612 m!1316213))

(declare-fun m!1316215 () Bool)

(assert (=> b!1425612 m!1316215))

(assert (=> b!1425612 m!1316215))

(assert (=> b!1425612 m!1316213))

(declare-fun m!1316217 () Bool)

(assert (=> b!1425612 m!1316217))

(declare-fun m!1316219 () Bool)

(assert (=> b!1425617 m!1316219))

(assert (=> b!1425617 m!1316219))

(declare-fun m!1316221 () Bool)

(assert (=> b!1425617 m!1316221))

(declare-fun m!1316223 () Bool)

(assert (=> start!122908 m!1316223))

(declare-fun m!1316225 () Bool)

(assert (=> start!122908 m!1316225))

(assert (=> b!1425610 m!1316205))

(assert (=> b!1425610 m!1316205))

(declare-fun m!1316227 () Bool)

(assert (=> b!1425610 m!1316227))

(assert (=> b!1425610 m!1316227))

(assert (=> b!1425610 m!1316205))

(declare-fun m!1316229 () Bool)

(assert (=> b!1425610 m!1316229))

(assert (=> b!1425616 m!1316205))

(assert (=> b!1425616 m!1316205))

(declare-fun m!1316231 () Bool)

(assert (=> b!1425616 m!1316231))

(declare-fun m!1316233 () Bool)

(assert (=> b!1425618 m!1316233))

(push 1)

(assert (not b!1425617))

(assert (not b!1425614))

(assert (not b!1425610))

(assert (not b!1425612))

(assert (not b!1425618))

(assert (not start!122908))

(assert (not b!1425616))

(assert (not b!1425613))

(check-sat)

