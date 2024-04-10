; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122938 () Bool)

(assert start!122938)

(declare-fun res!961511 () Bool)

(declare-fun e!805576 () Bool)

(assert (=> start!122938 (=> (not res!961511) (not e!805576))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122938 (= res!961511 (validMask!0 mask!2608))))

(assert (=> start!122938 e!805576))

(assert (=> start!122938 true))

(declare-datatypes ((array!97303 0))(
  ( (array!97304 (arr!46969 (Array (_ BitVec 32) (_ BitVec 64))) (size!47519 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97303)

(declare-fun array_inv!35997 (array!97303) Bool)

(assert (=> start!122938 (array_inv!35997 a!2831)))

(declare-fun b!1426076 () Bool)

(declare-fun res!961515 () Bool)

(assert (=> b!1426076 (=> (not res!961515) (not e!805576))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426076 (= res!961515 (and (= (size!47519 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47519 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47519 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426077 () Bool)

(declare-fun res!961519 () Bool)

(declare-fun e!805574 () Bool)

(assert (=> b!1426077 (=> (not res!961519) (not e!805574))))

(declare-fun lt!628011 () (_ BitVec 64))

(declare-fun lt!628014 () array!97303)

(declare-datatypes ((SeekEntryResult!11248 0))(
  ( (MissingZero!11248 (index!47384 (_ BitVec 32))) (Found!11248 (index!47385 (_ BitVec 32))) (Intermediate!11248 (undefined!12060 Bool) (index!47386 (_ BitVec 32)) (x!129010 (_ BitVec 32))) (Undefined!11248) (MissingVacant!11248 (index!47387 (_ BitVec 32))) )
))
(declare-fun lt!628012 () SeekEntryResult!11248)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97303 (_ BitVec 32)) SeekEntryResult!11248)

(assert (=> b!1426077 (= res!961519 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628011 lt!628014 mask!2608) lt!628012))))

(declare-fun b!1426078 () Bool)

(declare-fun e!805575 () Bool)

(assert (=> b!1426078 (= e!805575 e!805574)))

(declare-fun res!961510 () Bool)

(assert (=> b!1426078 (=> (not res!961510) (not e!805574))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426078 (= res!961510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628011 mask!2608) lt!628011 lt!628014 mask!2608) lt!628012))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426078 (= lt!628012 (Intermediate!11248 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426078 (= lt!628011 (select (store (arr!46969 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426078 (= lt!628014 (array!97304 (store (arr!46969 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47519 a!2831)))))

(declare-fun b!1426079 () Bool)

(declare-fun res!961509 () Bool)

(assert (=> b!1426079 (=> (not res!961509) (not e!805576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97303 (_ BitVec 32)) Bool)

(assert (=> b!1426079 (= res!961509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426080 () Bool)

(declare-fun res!961517 () Bool)

(assert (=> b!1426080 (=> (not res!961517) (not e!805576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426080 (= res!961517 (validKeyInArray!0 (select (arr!46969 a!2831) j!81)))))

(declare-fun b!1426081 () Bool)

(declare-fun res!961512 () Bool)

(assert (=> b!1426081 (=> (not res!961512) (not e!805574))))

(declare-fun lt!628013 () SeekEntryResult!11248)

(assert (=> b!1426081 (= res!961512 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46969 a!2831) j!81) a!2831 mask!2608) lt!628013))))

(declare-fun b!1426082 () Bool)

(declare-fun res!961513 () Bool)

(assert (=> b!1426082 (=> (not res!961513) (not e!805576))))

(assert (=> b!1426082 (= res!961513 (validKeyInArray!0 (select (arr!46969 a!2831) i!982)))))

(declare-fun b!1426083 () Bool)

(assert (=> b!1426083 (= e!805576 e!805575)))

(declare-fun res!961516 () Bool)

(assert (=> b!1426083 (=> (not res!961516) (not e!805575))))

(assert (=> b!1426083 (= res!961516 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46969 a!2831) j!81) mask!2608) (select (arr!46969 a!2831) j!81) a!2831 mask!2608) lt!628013))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426083 (= lt!628013 (Intermediate!11248 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426084 () Bool)

(declare-fun res!961518 () Bool)

(assert (=> b!1426084 (=> (not res!961518) (not e!805576))))

(declare-datatypes ((List!33479 0))(
  ( (Nil!33476) (Cons!33475 (h!34777 (_ BitVec 64)) (t!48173 List!33479)) )
))
(declare-fun arrayNoDuplicates!0 (array!97303 (_ BitVec 32) List!33479) Bool)

(assert (=> b!1426084 (= res!961518 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33476))))

(declare-fun b!1426085 () Bool)

(assert (=> b!1426085 (= e!805574 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsle #b00000000000000000000000000000000 (size!47519 a!2831)) (bvsgt j!81 (size!47519 a!2831))))))

(declare-fun b!1426086 () Bool)

(declare-fun res!961514 () Bool)

(assert (=> b!1426086 (=> (not res!961514) (not e!805576))))

(assert (=> b!1426086 (= res!961514 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47519 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47519 a!2831))))))

(assert (= (and start!122938 res!961511) b!1426076))

(assert (= (and b!1426076 res!961515) b!1426082))

(assert (= (and b!1426082 res!961513) b!1426080))

(assert (= (and b!1426080 res!961517) b!1426079))

(assert (= (and b!1426079 res!961509) b!1426084))

(assert (= (and b!1426084 res!961518) b!1426086))

(assert (= (and b!1426086 res!961514) b!1426083))

(assert (= (and b!1426083 res!961516) b!1426078))

(assert (= (and b!1426078 res!961510) b!1426081))

(assert (= (and b!1426081 res!961512) b!1426077))

(assert (= (and b!1426077 res!961519) b!1426085))

(declare-fun m!1316683 () Bool)

(assert (=> b!1426084 m!1316683))

(declare-fun m!1316685 () Bool)

(assert (=> b!1426078 m!1316685))

(assert (=> b!1426078 m!1316685))

(declare-fun m!1316687 () Bool)

(assert (=> b!1426078 m!1316687))

(declare-fun m!1316689 () Bool)

(assert (=> b!1426078 m!1316689))

(declare-fun m!1316691 () Bool)

(assert (=> b!1426078 m!1316691))

(declare-fun m!1316693 () Bool)

(assert (=> b!1426077 m!1316693))

(declare-fun m!1316695 () Bool)

(assert (=> b!1426079 m!1316695))

(declare-fun m!1316697 () Bool)

(assert (=> b!1426082 m!1316697))

(assert (=> b!1426082 m!1316697))

(declare-fun m!1316699 () Bool)

(assert (=> b!1426082 m!1316699))

(declare-fun m!1316701 () Bool)

(assert (=> b!1426081 m!1316701))

(assert (=> b!1426081 m!1316701))

(declare-fun m!1316703 () Bool)

(assert (=> b!1426081 m!1316703))

(declare-fun m!1316705 () Bool)

(assert (=> start!122938 m!1316705))

(declare-fun m!1316707 () Bool)

(assert (=> start!122938 m!1316707))

(assert (=> b!1426083 m!1316701))

(assert (=> b!1426083 m!1316701))

(declare-fun m!1316709 () Bool)

(assert (=> b!1426083 m!1316709))

(assert (=> b!1426083 m!1316709))

(assert (=> b!1426083 m!1316701))

(declare-fun m!1316711 () Bool)

(assert (=> b!1426083 m!1316711))

(assert (=> b!1426080 m!1316701))

(assert (=> b!1426080 m!1316701))

(declare-fun m!1316713 () Bool)

(assert (=> b!1426080 m!1316713))

(push 1)

(assert (not b!1426078))

(assert (not b!1426082))

(assert (not b!1426081))

(assert (not start!122938))

(assert (not b!1426083))

(assert (not b!1426080))

(assert (not b!1426084))

(assert (not b!1426079))

(assert (not b!1426077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

