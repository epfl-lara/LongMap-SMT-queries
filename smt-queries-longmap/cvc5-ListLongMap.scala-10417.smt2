; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122664 () Bool)

(assert start!122664)

(declare-fun b!1420923 () Bool)

(declare-fun res!956363 () Bool)

(declare-fun e!803553 () Bool)

(assert (=> b!1420923 (=> (not res!956363) (not e!803553))))

(declare-datatypes ((array!97029 0))(
  ( (array!97030 (arr!46832 (Array (_ BitVec 32) (_ BitVec 64))) (size!47382 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97029)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420923 (= res!956363 (validKeyInArray!0 (select (arr!46832 a!2831) i!982)))))

(declare-fun b!1420924 () Bool)

(declare-fun e!803552 () Bool)

(assert (=> b!1420924 (= e!803552 false)))

(declare-datatypes ((SeekEntryResult!11117 0))(
  ( (MissingZero!11117 (index!46860 (_ BitVec 32))) (Found!11117 (index!46861 (_ BitVec 32))) (Intermediate!11117 (undefined!11929 Bool) (index!46862 (_ BitVec 32)) (x!128519 (_ BitVec 32))) (Undefined!11117) (MissingVacant!11117 (index!46863 (_ BitVec 32))) )
))
(declare-fun lt!626055 () SeekEntryResult!11117)

(declare-fun lt!626052 () array!97029)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626053 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97029 (_ BitVec 32)) SeekEntryResult!11117)

(assert (=> b!1420924 (= lt!626055 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626053 lt!626052 mask!2608))))

(declare-fun b!1420925 () Bool)

(declare-fun res!956364 () Bool)

(assert (=> b!1420925 (=> (not res!956364) (not e!803553))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1420925 (= res!956364 (and (= (size!47382 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47382 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47382 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420926 () Bool)

(declare-fun res!956365 () Bool)

(assert (=> b!1420926 (=> (not res!956365) (not e!803552))))

(declare-fun lt!626054 () SeekEntryResult!11117)

(assert (=> b!1420926 (= res!956365 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46832 a!2831) j!81) a!2831 mask!2608) lt!626054))))

(declare-fun b!1420927 () Bool)

(declare-fun res!956358 () Bool)

(assert (=> b!1420927 (=> (not res!956358) (not e!803553))))

(declare-datatypes ((List!33342 0))(
  ( (Nil!33339) (Cons!33338 (h!34640 (_ BitVec 64)) (t!48036 List!33342)) )
))
(declare-fun arrayNoDuplicates!0 (array!97029 (_ BitVec 32) List!33342) Bool)

(assert (=> b!1420927 (= res!956358 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33339))))

(declare-fun res!956360 () Bool)

(assert (=> start!122664 (=> (not res!956360) (not e!803553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122664 (= res!956360 (validMask!0 mask!2608))))

(assert (=> start!122664 e!803553))

(assert (=> start!122664 true))

(declare-fun array_inv!35860 (array!97029) Bool)

(assert (=> start!122664 (array_inv!35860 a!2831)))

(declare-fun b!1420928 () Bool)

(declare-fun res!956356 () Bool)

(assert (=> b!1420928 (=> (not res!956356) (not e!803553))))

(assert (=> b!1420928 (= res!956356 (validKeyInArray!0 (select (arr!46832 a!2831) j!81)))))

(declare-fun b!1420929 () Bool)

(declare-fun res!956362 () Bool)

(assert (=> b!1420929 (=> (not res!956362) (not e!803553))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420929 (= res!956362 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47382 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47382 a!2831))))))

(declare-fun b!1420930 () Bool)

(declare-fun res!956357 () Bool)

(assert (=> b!1420930 (=> (not res!956357) (not e!803553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97029 (_ BitVec 32)) Bool)

(assert (=> b!1420930 (= res!956357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420931 () Bool)

(declare-fun e!803555 () Bool)

(assert (=> b!1420931 (= e!803555 e!803552)))

(declare-fun res!956361 () Bool)

(assert (=> b!1420931 (=> (not res!956361) (not e!803552))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420931 (= res!956361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626053 mask!2608) lt!626053 lt!626052 mask!2608) (Intermediate!11117 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420931 (= lt!626053 (select (store (arr!46832 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420931 (= lt!626052 (array!97030 (store (arr!46832 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47382 a!2831)))))

(declare-fun b!1420932 () Bool)

(assert (=> b!1420932 (= e!803553 e!803555)))

(declare-fun res!956359 () Bool)

(assert (=> b!1420932 (=> (not res!956359) (not e!803555))))

(assert (=> b!1420932 (= res!956359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46832 a!2831) j!81) mask!2608) (select (arr!46832 a!2831) j!81) a!2831 mask!2608) lt!626054))))

(assert (=> b!1420932 (= lt!626054 (Intermediate!11117 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122664 res!956360) b!1420925))

(assert (= (and b!1420925 res!956364) b!1420923))

(assert (= (and b!1420923 res!956363) b!1420928))

(assert (= (and b!1420928 res!956356) b!1420930))

(assert (= (and b!1420930 res!956357) b!1420927))

(assert (= (and b!1420927 res!956358) b!1420929))

(assert (= (and b!1420929 res!956362) b!1420932))

(assert (= (and b!1420932 res!956359) b!1420931))

(assert (= (and b!1420931 res!956361) b!1420926))

(assert (= (and b!1420926 res!956365) b!1420924))

(declare-fun m!1311459 () Bool)

(assert (=> b!1420923 m!1311459))

(assert (=> b!1420923 m!1311459))

(declare-fun m!1311461 () Bool)

(assert (=> b!1420923 m!1311461))

(declare-fun m!1311463 () Bool)

(assert (=> b!1420928 m!1311463))

(assert (=> b!1420928 m!1311463))

(declare-fun m!1311465 () Bool)

(assert (=> b!1420928 m!1311465))

(declare-fun m!1311467 () Bool)

(assert (=> b!1420924 m!1311467))

(declare-fun m!1311469 () Bool)

(assert (=> b!1420927 m!1311469))

(declare-fun m!1311471 () Bool)

(assert (=> b!1420931 m!1311471))

(assert (=> b!1420931 m!1311471))

(declare-fun m!1311473 () Bool)

(assert (=> b!1420931 m!1311473))

(declare-fun m!1311475 () Bool)

(assert (=> b!1420931 m!1311475))

(declare-fun m!1311477 () Bool)

(assert (=> b!1420931 m!1311477))

(declare-fun m!1311479 () Bool)

(assert (=> start!122664 m!1311479))

(declare-fun m!1311481 () Bool)

(assert (=> start!122664 m!1311481))

(declare-fun m!1311483 () Bool)

(assert (=> b!1420930 m!1311483))

(assert (=> b!1420932 m!1311463))

(assert (=> b!1420932 m!1311463))

(declare-fun m!1311485 () Bool)

(assert (=> b!1420932 m!1311485))

(assert (=> b!1420932 m!1311485))

(assert (=> b!1420932 m!1311463))

(declare-fun m!1311487 () Bool)

(assert (=> b!1420932 m!1311487))

(assert (=> b!1420926 m!1311463))

(assert (=> b!1420926 m!1311463))

(declare-fun m!1311489 () Bool)

(assert (=> b!1420926 m!1311489))

(push 1)

