; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123548 () Bool)

(assert start!123548)

(declare-fun b!1432361 () Bool)

(declare-fun res!966237 () Bool)

(declare-fun e!808567 () Bool)

(assert (=> b!1432361 (=> (not res!966237) (not e!808567))))

(declare-datatypes ((SeekEntryResult!11346 0))(
  ( (MissingZero!11346 (index!47776 (_ BitVec 32))) (Found!11346 (index!47777 (_ BitVec 32))) (Intermediate!11346 (undefined!12158 Bool) (index!47778 (_ BitVec 32)) (x!129420 (_ BitVec 32))) (Undefined!11346) (MissingVacant!11346 (index!47779 (_ BitVec 32))) )
))
(declare-fun lt!630564 () SeekEntryResult!11346)

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97520 0))(
  ( (array!97521 (arr!47067 (Array (_ BitVec 32) (_ BitVec 64))) (size!47617 (_ BitVec 32))) )
))
(declare-fun lt!630562 () array!97520)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!630560 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97520 (_ BitVec 32)) SeekEntryResult!11346)

(assert (=> b!1432361 (= res!966237 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630560 lt!630562 mask!2608) lt!630564))))

(declare-fun b!1432362 () Bool)

(declare-fun e!808571 () Bool)

(declare-fun e!808569 () Bool)

(assert (=> b!1432362 (= e!808571 e!808569)))

(declare-fun res!966238 () Bool)

(assert (=> b!1432362 (=> (not res!966238) (not e!808569))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97520)

(declare-fun lt!630563 () SeekEntryResult!11346)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432362 (= res!966238 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47067 a!2831) j!81) mask!2608) (select (arr!47067 a!2831) j!81) a!2831 mask!2608) lt!630563))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432362 (= lt!630563 (Intermediate!11346 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432363 () Bool)

(declare-fun res!966225 () Bool)

(assert (=> b!1432363 (=> (not res!966225) (not e!808571))))

(assert (=> b!1432363 (= res!966225 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47617 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47617 a!2831))))))

(declare-fun b!1432364 () Bool)

(declare-fun res!966235 () Bool)

(assert (=> b!1432364 (=> (not res!966235) (not e!808567))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1432364 (= res!966235 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!966227 () Bool)

(assert (=> start!123548 (=> (not res!966227) (not e!808571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123548 (= res!966227 (validMask!0 mask!2608))))

(assert (=> start!123548 e!808571))

(assert (=> start!123548 true))

(declare-fun array_inv!36095 (array!97520) Bool)

(assert (=> start!123548 (array_inv!36095 a!2831)))

(declare-fun b!1432365 () Bool)

(declare-fun res!966229 () Bool)

(assert (=> b!1432365 (=> (not res!966229) (not e!808571))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432365 (= res!966229 (validKeyInArray!0 (select (arr!47067 a!2831) i!982)))))

(declare-fun b!1432366 () Bool)

(declare-fun res!966226 () Bool)

(assert (=> b!1432366 (=> (not res!966226) (not e!808571))))

(assert (=> b!1432366 (= res!966226 (validKeyInArray!0 (select (arr!47067 a!2831) j!81)))))

(declare-fun b!1432367 () Bool)

(declare-fun res!966232 () Bool)

(assert (=> b!1432367 (=> (not res!966232) (not e!808567))))

(assert (=> b!1432367 (= res!966232 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47067 a!2831) j!81) a!2831 mask!2608) lt!630563))))

(declare-fun b!1432368 () Bool)

(declare-fun e!808566 () Bool)

(assert (=> b!1432368 (= e!808566 true)))

(declare-fun lt!630559 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432368 (= lt!630559 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432369 () Bool)

(declare-fun res!966233 () Bool)

(assert (=> b!1432369 (=> (not res!966233) (not e!808571))))

(assert (=> b!1432369 (= res!966233 (and (= (size!47617 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47617 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47617 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432370 () Bool)

(assert (=> b!1432370 (= e!808569 e!808567)))

(declare-fun res!966236 () Bool)

(assert (=> b!1432370 (=> (not res!966236) (not e!808567))))

(assert (=> b!1432370 (= res!966236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630560 mask!2608) lt!630560 lt!630562 mask!2608) lt!630564))))

(assert (=> b!1432370 (= lt!630564 (Intermediate!11346 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432370 (= lt!630560 (select (store (arr!47067 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432370 (= lt!630562 (array!97521 (store (arr!47067 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47617 a!2831)))))

(declare-fun b!1432371 () Bool)

(declare-fun res!966234 () Bool)

(assert (=> b!1432371 (=> (not res!966234) (not e!808571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97520 (_ BitVec 32)) Bool)

(assert (=> b!1432371 (= res!966234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432372 () Bool)

(declare-fun res!966228 () Bool)

(assert (=> b!1432372 (=> (not res!966228) (not e!808571))))

(declare-datatypes ((List!33577 0))(
  ( (Nil!33574) (Cons!33573 (h!34896 (_ BitVec 64)) (t!48271 List!33577)) )
))
(declare-fun arrayNoDuplicates!0 (array!97520 (_ BitVec 32) List!33577) Bool)

(assert (=> b!1432372 (= res!966228 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33574))))

(declare-fun b!1432373 () Bool)

(declare-fun e!808570 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97520 (_ BitVec 32)) SeekEntryResult!11346)

(assert (=> b!1432373 (= e!808570 (= (seekEntryOrOpen!0 (select (arr!47067 a!2831) j!81) a!2831 mask!2608) (Found!11346 j!81)))))

(declare-fun b!1432374 () Bool)

(assert (=> b!1432374 (= e!808567 (not e!808566))))

(declare-fun res!966231 () Bool)

(assert (=> b!1432374 (=> res!966231 e!808566)))

(assert (=> b!1432374 (= res!966231 (or (= (select (arr!47067 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47067 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47067 a!2831) index!585) (select (arr!47067 a!2831) j!81)) (= (select (store (arr!47067 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432374 e!808570))

(declare-fun res!966230 () Bool)

(assert (=> b!1432374 (=> (not res!966230) (not e!808570))))

(assert (=> b!1432374 (= res!966230 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48438 0))(
  ( (Unit!48439) )
))
(declare-fun lt!630561 () Unit!48438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48438)

(assert (=> b!1432374 (= lt!630561 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123548 res!966227) b!1432369))

(assert (= (and b!1432369 res!966233) b!1432365))

(assert (= (and b!1432365 res!966229) b!1432366))

(assert (= (and b!1432366 res!966226) b!1432371))

(assert (= (and b!1432371 res!966234) b!1432372))

(assert (= (and b!1432372 res!966228) b!1432363))

(assert (= (and b!1432363 res!966225) b!1432362))

(assert (= (and b!1432362 res!966238) b!1432370))

(assert (= (and b!1432370 res!966236) b!1432367))

(assert (= (and b!1432367 res!966232) b!1432361))

(assert (= (and b!1432361 res!966237) b!1432364))

(assert (= (and b!1432364 res!966235) b!1432374))

(assert (= (and b!1432374 res!966230) b!1432373))

(assert (= (and b!1432374 (not res!966231)) b!1432368))

(declare-fun m!1322165 () Bool)

(assert (=> b!1432368 m!1322165))

(declare-fun m!1322167 () Bool)

(assert (=> b!1432362 m!1322167))

(assert (=> b!1432362 m!1322167))

(declare-fun m!1322169 () Bool)

(assert (=> b!1432362 m!1322169))

(assert (=> b!1432362 m!1322169))

(assert (=> b!1432362 m!1322167))

(declare-fun m!1322171 () Bool)

(assert (=> b!1432362 m!1322171))

(declare-fun m!1322173 () Bool)

(assert (=> b!1432370 m!1322173))

(assert (=> b!1432370 m!1322173))

(declare-fun m!1322175 () Bool)

(assert (=> b!1432370 m!1322175))

(declare-fun m!1322177 () Bool)

(assert (=> b!1432370 m!1322177))

(declare-fun m!1322179 () Bool)

(assert (=> b!1432370 m!1322179))

(declare-fun m!1322181 () Bool)

(assert (=> b!1432372 m!1322181))

(assert (=> b!1432367 m!1322167))

(assert (=> b!1432367 m!1322167))

(declare-fun m!1322183 () Bool)

(assert (=> b!1432367 m!1322183))

(declare-fun m!1322185 () Bool)

(assert (=> start!123548 m!1322185))

(declare-fun m!1322187 () Bool)

(assert (=> start!123548 m!1322187))

(assert (=> b!1432366 m!1322167))

(assert (=> b!1432366 m!1322167))

(declare-fun m!1322189 () Bool)

(assert (=> b!1432366 m!1322189))

(declare-fun m!1322191 () Bool)

(assert (=> b!1432361 m!1322191))

(assert (=> b!1432374 m!1322177))

(declare-fun m!1322193 () Bool)

(assert (=> b!1432374 m!1322193))

(declare-fun m!1322195 () Bool)

(assert (=> b!1432374 m!1322195))

(declare-fun m!1322197 () Bool)

(assert (=> b!1432374 m!1322197))

(assert (=> b!1432374 m!1322167))

(declare-fun m!1322199 () Bool)

(assert (=> b!1432374 m!1322199))

(declare-fun m!1322201 () Bool)

(assert (=> b!1432371 m!1322201))

(assert (=> b!1432373 m!1322167))

(assert (=> b!1432373 m!1322167))

(declare-fun m!1322203 () Bool)

(assert (=> b!1432373 m!1322203))

(declare-fun m!1322205 () Bool)

(assert (=> b!1432365 m!1322205))

(assert (=> b!1432365 m!1322205))

(declare-fun m!1322207 () Bool)

(assert (=> b!1432365 m!1322207))

(check-sat (not b!1432370) (not b!1432361) (not b!1432372) (not b!1432368) (not b!1432374) (not b!1432373) (not b!1432371) (not b!1432367) (not b!1432362) (not b!1432365) (not b!1432366) (not start!123548))
(check-sat)
