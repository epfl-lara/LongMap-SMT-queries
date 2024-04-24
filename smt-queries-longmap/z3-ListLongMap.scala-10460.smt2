; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123164 () Bool)

(assert start!123164)

(declare-fun b!1427268 () Bool)

(declare-fun res!961819 () Bool)

(declare-fun e!806405 () Bool)

(assert (=> b!1427268 (=> (not res!961819) (not e!806405))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97400 0))(
  ( (array!97401 (arr!47014 (Array (_ BitVec 32) (_ BitVec 64))) (size!47565 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97400)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427268 (= res!961819 (and (= (size!47565 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47565 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47565 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427269 () Bool)

(declare-fun res!961821 () Bool)

(assert (=> b!1427269 (=> (not res!961821) (not e!806405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427269 (= res!961821 (validKeyInArray!0 (select (arr!47014 a!2831) j!81)))))

(declare-fun b!1427270 () Bool)

(declare-fun res!961816 () Bool)

(assert (=> b!1427270 (=> (not res!961816) (not e!806405))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427270 (= res!961816 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47565 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47565 a!2831))))))

(declare-fun b!1427271 () Bool)

(declare-fun e!806406 () Bool)

(assert (=> b!1427271 (= e!806405 e!806406)))

(declare-fun res!961823 () Bool)

(assert (=> b!1427271 (=> (not res!961823) (not e!806406))))

(declare-datatypes ((SeekEntryResult!11195 0))(
  ( (MissingZero!11195 (index!47172 (_ BitVec 32))) (Found!11195 (index!47173 (_ BitVec 32))) (Intermediate!11195 (undefined!12007 Bool) (index!47174 (_ BitVec 32)) (x!128966 (_ BitVec 32))) (Undefined!11195) (MissingVacant!11195 (index!47175 (_ BitVec 32))) )
))
(declare-fun lt!628445 () SeekEntryResult!11195)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97400 (_ BitVec 32)) SeekEntryResult!11195)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427271 (= res!961823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47014 a!2831) j!81) mask!2608) (select (arr!47014 a!2831) j!81) a!2831 mask!2608) lt!628445))))

(assert (=> b!1427271 (= lt!628445 (Intermediate!11195 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427272 () Bool)

(declare-fun res!961817 () Bool)

(declare-fun e!806407 () Bool)

(assert (=> b!1427272 (=> (not res!961817) (not e!806407))))

(assert (=> b!1427272 (= res!961817 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47014 a!2831) j!81) a!2831 mask!2608) lt!628445))))

(declare-fun b!1427273 () Bool)

(declare-fun res!961820 () Bool)

(assert (=> b!1427273 (=> (not res!961820) (not e!806405))))

(declare-datatypes ((List!33511 0))(
  ( (Nil!33508) (Cons!33507 (h!34820 (_ BitVec 64)) (t!48197 List!33511)) )
))
(declare-fun arrayNoDuplicates!0 (array!97400 (_ BitVec 32) List!33511) Bool)

(assert (=> b!1427273 (= res!961820 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33508))))

(declare-fun b!1427274 () Bool)

(declare-fun res!961822 () Bool)

(assert (=> b!1427274 (=> (not res!961822) (not e!806405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97400 (_ BitVec 32)) Bool)

(assert (=> b!1427274 (= res!961822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427275 () Bool)

(declare-fun res!961824 () Bool)

(assert (=> b!1427275 (=> (not res!961824) (not e!806405))))

(assert (=> b!1427275 (= res!961824 (validKeyInArray!0 (select (arr!47014 a!2831) i!982)))))

(declare-fun res!961825 () Bool)

(assert (=> start!123164 (=> (not res!961825) (not e!806405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123164 (= res!961825 (validMask!0 mask!2608))))

(assert (=> start!123164 e!806405))

(assert (=> start!123164 true))

(declare-fun array_inv!36295 (array!97400) Bool)

(assert (=> start!123164 (array_inv!36295 a!2831)))

(declare-fun b!1427276 () Bool)

(assert (=> b!1427276 (= e!806406 e!806407)))

(declare-fun res!961818 () Bool)

(assert (=> b!1427276 (=> (not res!961818) (not e!806407))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun lt!628446 () array!97400)

(declare-fun lt!628447 () (_ BitVec 64))

(assert (=> b!1427276 (= res!961818 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628447 mask!2608) lt!628447 lt!628446 mask!2608) (Intermediate!11195 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1427276 (= lt!628447 (select (store (arr!47014 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427276 (= lt!628446 (array!97401 (store (arr!47014 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47565 a!2831)))))

(declare-fun b!1427277 () Bool)

(assert (=> b!1427277 (= e!806407 false)))

(declare-fun lt!628448 () SeekEntryResult!11195)

(assert (=> b!1427277 (= lt!628448 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628447 lt!628446 mask!2608))))

(assert (= (and start!123164 res!961825) b!1427268))

(assert (= (and b!1427268 res!961819) b!1427275))

(assert (= (and b!1427275 res!961824) b!1427269))

(assert (= (and b!1427269 res!961821) b!1427274))

(assert (= (and b!1427274 res!961822) b!1427273))

(assert (= (and b!1427273 res!961820) b!1427270))

(assert (= (and b!1427270 res!961816) b!1427271))

(assert (= (and b!1427271 res!961823) b!1427276))

(assert (= (and b!1427276 res!961818) b!1427272))

(assert (= (and b!1427272 res!961817) b!1427277))

(declare-fun m!1317993 () Bool)

(assert (=> b!1427273 m!1317993))

(declare-fun m!1317995 () Bool)

(assert (=> b!1427277 m!1317995))

(declare-fun m!1317997 () Bool)

(assert (=> b!1427272 m!1317997))

(assert (=> b!1427272 m!1317997))

(declare-fun m!1317999 () Bool)

(assert (=> b!1427272 m!1317999))

(declare-fun m!1318001 () Bool)

(assert (=> b!1427276 m!1318001))

(assert (=> b!1427276 m!1318001))

(declare-fun m!1318003 () Bool)

(assert (=> b!1427276 m!1318003))

(declare-fun m!1318005 () Bool)

(assert (=> b!1427276 m!1318005))

(declare-fun m!1318007 () Bool)

(assert (=> b!1427276 m!1318007))

(declare-fun m!1318009 () Bool)

(assert (=> b!1427275 m!1318009))

(assert (=> b!1427275 m!1318009))

(declare-fun m!1318011 () Bool)

(assert (=> b!1427275 m!1318011))

(declare-fun m!1318013 () Bool)

(assert (=> start!123164 m!1318013))

(declare-fun m!1318015 () Bool)

(assert (=> start!123164 m!1318015))

(assert (=> b!1427271 m!1317997))

(assert (=> b!1427271 m!1317997))

(declare-fun m!1318017 () Bool)

(assert (=> b!1427271 m!1318017))

(assert (=> b!1427271 m!1318017))

(assert (=> b!1427271 m!1317997))

(declare-fun m!1318019 () Bool)

(assert (=> b!1427271 m!1318019))

(assert (=> b!1427269 m!1317997))

(assert (=> b!1427269 m!1317997))

(declare-fun m!1318021 () Bool)

(assert (=> b!1427269 m!1318021))

(declare-fun m!1318023 () Bool)

(assert (=> b!1427274 m!1318023))

(check-sat (not b!1427269) (not b!1427271) (not start!123164) (not b!1427276) (not b!1427272) (not b!1427273) (not b!1427275) (not b!1427274) (not b!1427277))
(check-sat)
