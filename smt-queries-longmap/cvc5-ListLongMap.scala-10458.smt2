; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122910 () Bool)

(assert start!122910)

(declare-fun b!1425639 () Bool)

(declare-fun res!961080 () Bool)

(declare-fun e!805407 () Bool)

(assert (=> b!1425639 (=> (not res!961080) (not e!805407))))

(declare-datatypes ((array!97275 0))(
  ( (array!97276 (arr!46955 (Array (_ BitVec 32) (_ BitVec 64))) (size!47505 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97275)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425639 (= res!961080 (validKeyInArray!0 (select (arr!46955 a!2831) j!81)))))

(declare-fun b!1425640 () Bool)

(declare-fun res!961076 () Bool)

(declare-fun e!805409 () Bool)

(assert (=> b!1425640 (=> (not res!961076) (not e!805409))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11234 0))(
  ( (MissingZero!11234 (index!47328 (_ BitVec 32))) (Found!11234 (index!47329 (_ BitVec 32))) (Intermediate!11234 (undefined!12046 Bool) (index!47330 (_ BitVec 32)) (x!128964 (_ BitVec 32))) (Undefined!11234) (MissingVacant!11234 (index!47331 (_ BitVec 32))) )
))
(declare-fun lt!627844 () SeekEntryResult!11234)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97275 (_ BitVec 32)) SeekEntryResult!11234)

(assert (=> b!1425640 (= res!961076 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46955 a!2831) j!81) a!2831 mask!2608) lt!627844))))

(declare-fun b!1425641 () Bool)

(declare-fun res!961073 () Bool)

(assert (=> b!1425641 (=> (not res!961073) (not e!805407))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425641 (= res!961073 (and (= (size!47505 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47505 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47505 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425642 () Bool)

(declare-fun res!961078 () Bool)

(assert (=> b!1425642 (=> (not res!961078) (not e!805407))))

(assert (=> b!1425642 (= res!961078 (validKeyInArray!0 (select (arr!46955 a!2831) i!982)))))

(declare-fun b!1425643 () Bool)

(declare-fun e!805408 () Bool)

(assert (=> b!1425643 (= e!805408 e!805409)))

(declare-fun res!961077 () Bool)

(assert (=> b!1425643 (=> (not res!961077) (not e!805409))))

(declare-fun lt!627846 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun lt!627843 () array!97275)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425643 (= res!961077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627846 mask!2608) lt!627846 lt!627843 mask!2608) (Intermediate!11234 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425643 (= lt!627846 (select (store (arr!46955 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425643 (= lt!627843 (array!97276 (store (arr!46955 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47505 a!2831)))))

(declare-fun b!1425644 () Bool)

(declare-fun res!961072 () Bool)

(assert (=> b!1425644 (=> (not res!961072) (not e!805407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97275 (_ BitVec 32)) Bool)

(assert (=> b!1425644 (= res!961072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!961081 () Bool)

(assert (=> start!122910 (=> (not res!961081) (not e!805407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122910 (= res!961081 (validMask!0 mask!2608))))

(assert (=> start!122910 e!805407))

(assert (=> start!122910 true))

(declare-fun array_inv!35983 (array!97275) Bool)

(assert (=> start!122910 (array_inv!35983 a!2831)))

(declare-fun b!1425645 () Bool)

(assert (=> b!1425645 (= e!805407 e!805408)))

(declare-fun res!961079 () Bool)

(assert (=> b!1425645 (=> (not res!961079) (not e!805408))))

(assert (=> b!1425645 (= res!961079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46955 a!2831) j!81) mask!2608) (select (arr!46955 a!2831) j!81) a!2831 mask!2608) lt!627844))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425645 (= lt!627844 (Intermediate!11234 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425646 () Bool)

(assert (=> b!1425646 (= e!805409 false)))

(declare-fun lt!627845 () SeekEntryResult!11234)

(assert (=> b!1425646 (= lt!627845 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627846 lt!627843 mask!2608))))

(declare-fun b!1425647 () Bool)

(declare-fun res!961074 () Bool)

(assert (=> b!1425647 (=> (not res!961074) (not e!805407))))

(declare-datatypes ((List!33465 0))(
  ( (Nil!33462) (Cons!33461 (h!34763 (_ BitVec 64)) (t!48159 List!33465)) )
))
(declare-fun arrayNoDuplicates!0 (array!97275 (_ BitVec 32) List!33465) Bool)

(assert (=> b!1425647 (= res!961074 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33462))))

(declare-fun b!1425648 () Bool)

(declare-fun res!961075 () Bool)

(assert (=> b!1425648 (=> (not res!961075) (not e!805407))))

(assert (=> b!1425648 (= res!961075 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47505 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47505 a!2831))))))

(assert (= (and start!122910 res!961081) b!1425641))

(assert (= (and b!1425641 res!961073) b!1425642))

(assert (= (and b!1425642 res!961078) b!1425639))

(assert (= (and b!1425639 res!961080) b!1425644))

(assert (= (and b!1425644 res!961072) b!1425647))

(assert (= (and b!1425647 res!961074) b!1425648))

(assert (= (and b!1425648 res!961075) b!1425645))

(assert (= (and b!1425645 res!961079) b!1425643))

(assert (= (and b!1425643 res!961077) b!1425640))

(assert (= (and b!1425640 res!961076) b!1425646))

(declare-fun m!1316235 () Bool)

(assert (=> start!122910 m!1316235))

(declare-fun m!1316237 () Bool)

(assert (=> start!122910 m!1316237))

(declare-fun m!1316239 () Bool)

(assert (=> b!1425640 m!1316239))

(assert (=> b!1425640 m!1316239))

(declare-fun m!1316241 () Bool)

(assert (=> b!1425640 m!1316241))

(declare-fun m!1316243 () Bool)

(assert (=> b!1425643 m!1316243))

(assert (=> b!1425643 m!1316243))

(declare-fun m!1316245 () Bool)

(assert (=> b!1425643 m!1316245))

(declare-fun m!1316247 () Bool)

(assert (=> b!1425643 m!1316247))

(declare-fun m!1316249 () Bool)

(assert (=> b!1425643 m!1316249))

(declare-fun m!1316251 () Bool)

(assert (=> b!1425642 m!1316251))

(assert (=> b!1425642 m!1316251))

(declare-fun m!1316253 () Bool)

(assert (=> b!1425642 m!1316253))

(declare-fun m!1316255 () Bool)

(assert (=> b!1425647 m!1316255))

(declare-fun m!1316257 () Bool)

(assert (=> b!1425646 m!1316257))

(declare-fun m!1316259 () Bool)

(assert (=> b!1425644 m!1316259))

(assert (=> b!1425639 m!1316239))

(assert (=> b!1425639 m!1316239))

(declare-fun m!1316261 () Bool)

(assert (=> b!1425639 m!1316261))

(assert (=> b!1425645 m!1316239))

(assert (=> b!1425645 m!1316239))

(declare-fun m!1316263 () Bool)

(assert (=> b!1425645 m!1316263))

(assert (=> b!1425645 m!1316263))

(assert (=> b!1425645 m!1316239))

(declare-fun m!1316265 () Bool)

(assert (=> b!1425645 m!1316265))

(push 1)

