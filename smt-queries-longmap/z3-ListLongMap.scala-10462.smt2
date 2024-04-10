; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122936 () Bool)

(assert start!122936)

(declare-fun b!1426043 () Bool)

(declare-fun res!961479 () Bool)

(declare-fun e!805562 () Bool)

(assert (=> b!1426043 (=> (not res!961479) (not e!805562))))

(declare-datatypes ((array!97301 0))(
  ( (array!97302 (arr!46968 (Array (_ BitVec 32) (_ BitVec 64))) (size!47518 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97301)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426043 (= res!961479 (validKeyInArray!0 (select (arr!46968 a!2831) i!982)))))

(declare-fun res!961483 () Bool)

(assert (=> start!122936 (=> (not res!961483) (not e!805562))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122936 (= res!961483 (validMask!0 mask!2608))))

(assert (=> start!122936 e!805562))

(assert (=> start!122936 true))

(declare-fun array_inv!35996 (array!97301) Bool)

(assert (=> start!122936 (array_inv!35996 a!2831)))

(declare-fun b!1426044 () Bool)

(declare-fun res!961484 () Bool)

(assert (=> b!1426044 (=> (not res!961484) (not e!805562))))

(declare-datatypes ((List!33478 0))(
  ( (Nil!33475) (Cons!33474 (h!34776 (_ BitVec 64)) (t!48172 List!33478)) )
))
(declare-fun arrayNoDuplicates!0 (array!97301 (_ BitVec 32) List!33478) Bool)

(assert (=> b!1426044 (= res!961484 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33475))))

(declare-fun b!1426045 () Bool)

(declare-fun res!961482 () Bool)

(declare-fun e!805563 () Bool)

(assert (=> b!1426045 (=> (not res!961482) (not e!805563))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11247 0))(
  ( (MissingZero!11247 (index!47380 (_ BitVec 32))) (Found!11247 (index!47381 (_ BitVec 32))) (Intermediate!11247 (undefined!12059 Bool) (index!47382 (_ BitVec 32)) (x!129009 (_ BitVec 32))) (Undefined!11247) (MissingVacant!11247 (index!47383 (_ BitVec 32))) )
))
(declare-fun lt!628000 () SeekEntryResult!11247)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97301 (_ BitVec 32)) SeekEntryResult!11247)

(assert (=> b!1426045 (= res!961482 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46968 a!2831) j!81) a!2831 mask!2608) lt!628000))))

(declare-fun b!1426046 () Bool)

(declare-fun res!961486 () Bool)

(assert (=> b!1426046 (=> (not res!961486) (not e!805562))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1426046 (= res!961486 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47518 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47518 a!2831))))))

(declare-fun b!1426047 () Bool)

(declare-fun e!805565 () Bool)

(assert (=> b!1426047 (= e!805562 e!805565)))

(declare-fun res!961481 () Bool)

(assert (=> b!1426047 (=> (not res!961481) (not e!805565))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426047 (= res!961481 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46968 a!2831) j!81) mask!2608) (select (arr!46968 a!2831) j!81) a!2831 mask!2608) lt!628000))))

(assert (=> b!1426047 (= lt!628000 (Intermediate!11247 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426048 () Bool)

(declare-fun res!961480 () Bool)

(assert (=> b!1426048 (=> (not res!961480) (not e!805562))))

(assert (=> b!1426048 (= res!961480 (and (= (size!47518 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47518 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47518 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426049 () Bool)

(declare-fun res!961476 () Bool)

(assert (=> b!1426049 (=> (not res!961476) (not e!805562))))

(assert (=> b!1426049 (= res!961476 (validKeyInArray!0 (select (arr!46968 a!2831) j!81)))))

(declare-fun b!1426050 () Bool)

(assert (=> b!1426050 (= e!805565 e!805563)))

(declare-fun res!961478 () Bool)

(assert (=> b!1426050 (=> (not res!961478) (not e!805563))))

(declare-fun lt!628002 () SeekEntryResult!11247)

(declare-fun lt!627999 () (_ BitVec 64))

(declare-fun lt!628001 () array!97301)

(assert (=> b!1426050 (= res!961478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627999 mask!2608) lt!627999 lt!628001 mask!2608) lt!628002))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426050 (= lt!628002 (Intermediate!11247 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426050 (= lt!627999 (select (store (arr!46968 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426050 (= lt!628001 (array!97302 (store (arr!46968 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47518 a!2831)))))

(declare-fun b!1426051 () Bool)

(declare-fun res!961477 () Bool)

(assert (=> b!1426051 (=> (not res!961477) (not e!805563))))

(assert (=> b!1426051 (= res!961477 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627999 lt!628001 mask!2608) lt!628002))))

(declare-fun b!1426052 () Bool)

(declare-fun res!961485 () Bool)

(assert (=> b!1426052 (=> (not res!961485) (not e!805562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97301 (_ BitVec 32)) Bool)

(assert (=> b!1426052 (= res!961485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426053 () Bool)

(assert (=> b!1426053 (= e!805563 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsle #b00000000000000000000000000000000 (size!47518 a!2831)) (bvsgt j!81 (size!47518 a!2831))))))

(assert (= (and start!122936 res!961483) b!1426048))

(assert (= (and b!1426048 res!961480) b!1426043))

(assert (= (and b!1426043 res!961479) b!1426049))

(assert (= (and b!1426049 res!961476) b!1426052))

(assert (= (and b!1426052 res!961485) b!1426044))

(assert (= (and b!1426044 res!961484) b!1426046))

(assert (= (and b!1426046 res!961486) b!1426047))

(assert (= (and b!1426047 res!961481) b!1426050))

(assert (= (and b!1426050 res!961478) b!1426045))

(assert (= (and b!1426045 res!961482) b!1426051))

(assert (= (and b!1426051 res!961477) b!1426053))

(declare-fun m!1316651 () Bool)

(assert (=> b!1426049 m!1316651))

(assert (=> b!1426049 m!1316651))

(declare-fun m!1316653 () Bool)

(assert (=> b!1426049 m!1316653))

(declare-fun m!1316655 () Bool)

(assert (=> b!1426044 m!1316655))

(assert (=> b!1426045 m!1316651))

(assert (=> b!1426045 m!1316651))

(declare-fun m!1316657 () Bool)

(assert (=> b!1426045 m!1316657))

(declare-fun m!1316659 () Bool)

(assert (=> start!122936 m!1316659))

(declare-fun m!1316661 () Bool)

(assert (=> start!122936 m!1316661))

(declare-fun m!1316663 () Bool)

(assert (=> b!1426051 m!1316663))

(declare-fun m!1316665 () Bool)

(assert (=> b!1426052 m!1316665))

(declare-fun m!1316667 () Bool)

(assert (=> b!1426050 m!1316667))

(assert (=> b!1426050 m!1316667))

(declare-fun m!1316669 () Bool)

(assert (=> b!1426050 m!1316669))

(declare-fun m!1316671 () Bool)

(assert (=> b!1426050 m!1316671))

(declare-fun m!1316673 () Bool)

(assert (=> b!1426050 m!1316673))

(assert (=> b!1426047 m!1316651))

(assert (=> b!1426047 m!1316651))

(declare-fun m!1316675 () Bool)

(assert (=> b!1426047 m!1316675))

(assert (=> b!1426047 m!1316675))

(assert (=> b!1426047 m!1316651))

(declare-fun m!1316677 () Bool)

(assert (=> b!1426047 m!1316677))

(declare-fun m!1316679 () Bool)

(assert (=> b!1426043 m!1316679))

(assert (=> b!1426043 m!1316679))

(declare-fun m!1316681 () Bool)

(assert (=> b!1426043 m!1316681))

(check-sat (not b!1426045) (not b!1426051) (not b!1426044) (not b!1426050) (not b!1426052) (not start!122936) (not b!1426043) (not b!1426049) (not b!1426047))
(check-sat)
