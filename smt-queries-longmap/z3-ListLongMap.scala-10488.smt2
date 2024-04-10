; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123452 () Bool)

(assert start!123452)

(declare-fun b!1431170 () Bool)

(declare-fun res!965240 () Bool)

(declare-fun e!808006 () Bool)

(assert (=> b!1431170 (=> (not res!965240) (not e!808006))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97475 0))(
  ( (array!97476 (arr!47046 (Array (_ BitVec 32) (_ BitVec 64))) (size!47596 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97475)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431170 (= res!965240 (and (= (size!47596 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47596 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47596 a!2831)) (not (= i!982 j!81))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun e!808003 () Bool)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun b!1431171 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1431171 (= e!808003 (not (or (= (select (arr!47046 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47046 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47046 a!2831) index!585) (select (arr!47046 a!2831) j!81)) (not (= (select (store (arr!47046 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge intermediateAfterX!13 intermediateBeforeX!13) (not undefinedAfter!5))))))

(declare-fun e!808007 () Bool)

(assert (=> b!1431171 e!808007))

(declare-fun res!965237 () Bool)

(assert (=> b!1431171 (=> (not res!965237) (not e!808007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97475 (_ BitVec 32)) Bool)

(assert (=> b!1431171 (= res!965237 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48396 0))(
  ( (Unit!48397) )
))
(declare-fun lt!630054 () Unit!48396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48396)

(assert (=> b!1431171 (= lt!630054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431172 () Bool)

(declare-fun res!965235 () Bool)

(assert (=> b!1431172 (=> (not res!965235) (not e!808006))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1431172 (= res!965235 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47596 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47596 a!2831))))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun b!1431173 () Bool)

(assert (=> b!1431173 (= e!808007 (or (= (select (arr!47046 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47046 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47046 a!2831) index!585) (select (arr!47046 a!2831) j!81)) (not (= (select (store (arr!47046 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun b!1431174 () Bool)

(declare-fun res!965241 () Bool)

(assert (=> b!1431174 (=> (not res!965241) (not e!808006))))

(declare-datatypes ((List!33556 0))(
  ( (Nil!33553) (Cons!33552 (h!34872 (_ BitVec 64)) (t!48250 List!33556)) )
))
(declare-fun arrayNoDuplicates!0 (array!97475 (_ BitVec 32) List!33556) Bool)

(assert (=> b!1431174 (= res!965241 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33553))))

(declare-fun b!1431175 () Bool)

(declare-fun res!965247 () Bool)

(assert (=> b!1431175 (=> (not res!965247) (not e!808003))))

(declare-datatypes ((SeekEntryResult!11325 0))(
  ( (MissingZero!11325 (index!47692 (_ BitVec 32))) (Found!11325 (index!47693 (_ BitVec 32))) (Intermediate!11325 (undefined!12137 Bool) (index!47694 (_ BitVec 32)) (x!129337 (_ BitVec 32))) (Undefined!11325) (MissingVacant!11325 (index!47695 (_ BitVec 32))) )
))
(declare-fun lt!630055 () SeekEntryResult!11325)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97475 (_ BitVec 32)) SeekEntryResult!11325)

(assert (=> b!1431175 (= res!965247 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47046 a!2831) j!81) a!2831 mask!2608) lt!630055))))

(declare-fun b!1431176 () Bool)

(declare-fun res!965248 () Bool)

(assert (=> b!1431176 (=> (not res!965248) (not e!808006))))

(assert (=> b!1431176 (= res!965248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431177 () Bool)

(declare-fun res!965238 () Bool)

(assert (=> b!1431177 (=> (not res!965238) (not e!808007))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97475 (_ BitVec 32)) SeekEntryResult!11325)

(assert (=> b!1431177 (= res!965238 (= (seekEntryOrOpen!0 (select (arr!47046 a!2831) j!81) a!2831 mask!2608) (Found!11325 j!81)))))

(declare-fun b!1431178 () Bool)

(declare-fun e!808004 () Bool)

(assert (=> b!1431178 (= e!808006 e!808004)))

(declare-fun res!965242 () Bool)

(assert (=> b!1431178 (=> (not res!965242) (not e!808004))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431178 (= res!965242 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47046 a!2831) j!81) mask!2608) (select (arr!47046 a!2831) j!81) a!2831 mask!2608) lt!630055))))

(assert (=> b!1431178 (= lt!630055 (Intermediate!11325 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!965236 () Bool)

(assert (=> start!123452 (=> (not res!965236) (not e!808006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123452 (= res!965236 (validMask!0 mask!2608))))

(assert (=> start!123452 e!808006))

(assert (=> start!123452 true))

(declare-fun array_inv!36074 (array!97475) Bool)

(assert (=> start!123452 (array_inv!36074 a!2831)))

(declare-fun b!1431179 () Bool)

(declare-fun res!965245 () Bool)

(assert (=> b!1431179 (=> (not res!965245) (not e!808003))))

(declare-fun lt!630053 () array!97475)

(declare-fun lt!630057 () (_ BitVec 64))

(declare-fun lt!630056 () SeekEntryResult!11325)

(assert (=> b!1431179 (= res!965245 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630057 lt!630053 mask!2608) lt!630056))))

(declare-fun b!1431180 () Bool)

(assert (=> b!1431180 (= e!808004 e!808003)))

(declare-fun res!965239 () Bool)

(assert (=> b!1431180 (=> (not res!965239) (not e!808003))))

(assert (=> b!1431180 (= res!965239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630057 mask!2608) lt!630057 lt!630053 mask!2608) lt!630056))))

(assert (=> b!1431180 (= lt!630056 (Intermediate!11325 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431180 (= lt!630057 (select (store (arr!47046 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431180 (= lt!630053 (array!97476 (store (arr!47046 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47596 a!2831)))))

(declare-fun b!1431181 () Bool)

(declare-fun res!965243 () Bool)

(assert (=> b!1431181 (=> (not res!965243) (not e!808003))))

(assert (=> b!1431181 (= res!965243 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431182 () Bool)

(declare-fun res!965246 () Bool)

(assert (=> b!1431182 (=> (not res!965246) (not e!808006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431182 (= res!965246 (validKeyInArray!0 (select (arr!47046 a!2831) i!982)))))

(declare-fun b!1431183 () Bool)

(declare-fun res!965244 () Bool)

(assert (=> b!1431183 (=> (not res!965244) (not e!808006))))

(assert (=> b!1431183 (= res!965244 (validKeyInArray!0 (select (arr!47046 a!2831) j!81)))))

(assert (= (and start!123452 res!965236) b!1431170))

(assert (= (and b!1431170 res!965240) b!1431182))

(assert (= (and b!1431182 res!965246) b!1431183))

(assert (= (and b!1431183 res!965244) b!1431176))

(assert (= (and b!1431176 res!965248) b!1431174))

(assert (= (and b!1431174 res!965241) b!1431172))

(assert (= (and b!1431172 res!965235) b!1431178))

(assert (= (and b!1431178 res!965242) b!1431180))

(assert (= (and b!1431180 res!965239) b!1431175))

(assert (= (and b!1431175 res!965247) b!1431179))

(assert (= (and b!1431179 res!965245) b!1431181))

(assert (= (and b!1431181 res!965243) b!1431171))

(assert (= (and b!1431171 res!965237) b!1431177))

(assert (= (and b!1431177 res!965238) b!1431173))

(declare-fun m!1321059 () Bool)

(assert (=> b!1431178 m!1321059))

(assert (=> b!1431178 m!1321059))

(declare-fun m!1321061 () Bool)

(assert (=> b!1431178 m!1321061))

(assert (=> b!1431178 m!1321061))

(assert (=> b!1431178 m!1321059))

(declare-fun m!1321063 () Bool)

(assert (=> b!1431178 m!1321063))

(declare-fun m!1321065 () Bool)

(assert (=> b!1431176 m!1321065))

(declare-fun m!1321067 () Bool)

(assert (=> b!1431180 m!1321067))

(assert (=> b!1431180 m!1321067))

(declare-fun m!1321069 () Bool)

(assert (=> b!1431180 m!1321069))

(declare-fun m!1321071 () Bool)

(assert (=> b!1431180 m!1321071))

(declare-fun m!1321073 () Bool)

(assert (=> b!1431180 m!1321073))

(declare-fun m!1321075 () Bool)

(assert (=> b!1431182 m!1321075))

(assert (=> b!1431182 m!1321075))

(declare-fun m!1321077 () Bool)

(assert (=> b!1431182 m!1321077))

(declare-fun m!1321079 () Bool)

(assert (=> b!1431174 m!1321079))

(assert (=> b!1431171 m!1321071))

(declare-fun m!1321081 () Bool)

(assert (=> b!1431171 m!1321081))

(declare-fun m!1321083 () Bool)

(assert (=> b!1431171 m!1321083))

(declare-fun m!1321085 () Bool)

(assert (=> b!1431171 m!1321085))

(assert (=> b!1431171 m!1321059))

(declare-fun m!1321087 () Bool)

(assert (=> b!1431171 m!1321087))

(assert (=> b!1431173 m!1321083))

(assert (=> b!1431173 m!1321059))

(assert (=> b!1431173 m!1321071))

(assert (=> b!1431173 m!1321081))

(assert (=> b!1431183 m!1321059))

(assert (=> b!1431183 m!1321059))

(declare-fun m!1321089 () Bool)

(assert (=> b!1431183 m!1321089))

(declare-fun m!1321091 () Bool)

(assert (=> b!1431179 m!1321091))

(assert (=> b!1431175 m!1321059))

(assert (=> b!1431175 m!1321059))

(declare-fun m!1321093 () Bool)

(assert (=> b!1431175 m!1321093))

(declare-fun m!1321095 () Bool)

(assert (=> start!123452 m!1321095))

(declare-fun m!1321097 () Bool)

(assert (=> start!123452 m!1321097))

(assert (=> b!1431177 m!1321059))

(assert (=> b!1431177 m!1321059))

(declare-fun m!1321099 () Bool)

(assert (=> b!1431177 m!1321099))

(check-sat (not b!1431182) (not start!123452) (not b!1431180) (not b!1431177) (not b!1431176) (not b!1431171) (not b!1431183) (not b!1431174) (not b!1431175) (not b!1431179) (not b!1431178))
(check-sat)
(get-model)

(declare-fun b!1431244 () Bool)

(declare-fun e!808035 () Bool)

(declare-fun lt!630077 () SeekEntryResult!11325)

(assert (=> b!1431244 (= e!808035 (bvsge (x!129337 lt!630077) #b01111111111111111111111111111110))))

(declare-fun e!808036 () SeekEntryResult!11325)

(declare-fun b!1431245 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431245 (= e!808036 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47046 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431246 () Bool)

(assert (=> b!1431246 (and (bvsge (index!47694 lt!630077) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630077) (size!47596 a!2831)))))

(declare-fun res!965298 () Bool)

(assert (=> b!1431246 (= res!965298 (= (select (arr!47046 a!2831) (index!47694 lt!630077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808034 () Bool)

(assert (=> b!1431246 (=> res!965298 e!808034)))

(declare-fun b!1431247 () Bool)

(declare-fun e!808033 () Bool)

(assert (=> b!1431247 (= e!808035 e!808033)))

(declare-fun res!965297 () Bool)

(get-info :version)

(assert (=> b!1431247 (= res!965297 (and ((_ is Intermediate!11325) lt!630077) (not (undefined!12137 lt!630077)) (bvslt (x!129337 lt!630077) #b01111111111111111111111111111110) (bvsge (x!129337 lt!630077) #b00000000000000000000000000000000) (bvsge (x!129337 lt!630077) x!605)))))

(assert (=> b!1431247 (=> (not res!965297) (not e!808033))))

(declare-fun b!1431248 () Bool)

(declare-fun e!808037 () SeekEntryResult!11325)

(assert (=> b!1431248 (= e!808037 (Intermediate!11325 true index!585 x!605))))

(declare-fun b!1431249 () Bool)

(assert (=> b!1431249 (and (bvsge (index!47694 lt!630077) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630077) (size!47596 a!2831)))))

(declare-fun res!965299 () Bool)

(assert (=> b!1431249 (= res!965299 (= (select (arr!47046 a!2831) (index!47694 lt!630077)) (select (arr!47046 a!2831) j!81)))))

(assert (=> b!1431249 (=> res!965299 e!808034)))

(assert (=> b!1431249 (= e!808033 e!808034)))

(declare-fun b!1431250 () Bool)

(assert (=> b!1431250 (= e!808036 (Intermediate!11325 false index!585 x!605))))

(declare-fun b!1431251 () Bool)

(assert (=> b!1431251 (= e!808037 e!808036)))

(declare-fun lt!630078 () (_ BitVec 64))

(declare-fun c!132470 () Bool)

(assert (=> b!1431251 (= c!132470 (or (= lt!630078 (select (arr!47046 a!2831) j!81)) (= (bvadd lt!630078 lt!630078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153871 () Bool)

(assert (=> d!153871 e!808035))

(declare-fun c!132471 () Bool)

(assert (=> d!153871 (= c!132471 (and ((_ is Intermediate!11325) lt!630077) (undefined!12137 lt!630077)))))

(assert (=> d!153871 (= lt!630077 e!808037)))

(declare-fun c!132469 () Bool)

(assert (=> d!153871 (= c!132469 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153871 (= lt!630078 (select (arr!47046 a!2831) index!585))))

(assert (=> d!153871 (validMask!0 mask!2608)))

(assert (=> d!153871 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47046 a!2831) j!81) a!2831 mask!2608) lt!630077)))

(declare-fun b!1431252 () Bool)

(assert (=> b!1431252 (and (bvsge (index!47694 lt!630077) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630077) (size!47596 a!2831)))))

(assert (=> b!1431252 (= e!808034 (= (select (arr!47046 a!2831) (index!47694 lt!630077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153871 c!132469) b!1431248))

(assert (= (and d!153871 (not c!132469)) b!1431251))

(assert (= (and b!1431251 c!132470) b!1431250))

(assert (= (and b!1431251 (not c!132470)) b!1431245))

(assert (= (and d!153871 c!132471) b!1431244))

(assert (= (and d!153871 (not c!132471)) b!1431247))

(assert (= (and b!1431247 res!965297) b!1431249))

(assert (= (and b!1431249 (not res!965299)) b!1431246))

(assert (= (and b!1431246 (not res!965298)) b!1431252))

(declare-fun m!1321143 () Bool)

(assert (=> b!1431249 m!1321143))

(assert (=> b!1431246 m!1321143))

(assert (=> b!1431252 m!1321143))

(declare-fun m!1321145 () Bool)

(assert (=> b!1431245 m!1321145))

(assert (=> b!1431245 m!1321145))

(assert (=> b!1431245 m!1321059))

(declare-fun m!1321147 () Bool)

(assert (=> b!1431245 m!1321147))

(assert (=> d!153871 m!1321083))

(assert (=> d!153871 m!1321095))

(assert (=> b!1431175 d!153871))

(declare-fun b!1431253 () Bool)

(declare-fun e!808040 () Bool)

(declare-fun lt!630079 () SeekEntryResult!11325)

(assert (=> b!1431253 (= e!808040 (bvsge (x!129337 lt!630079) #b01111111111111111111111111111110))))

(declare-fun b!1431254 () Bool)

(declare-fun e!808041 () SeekEntryResult!11325)

(assert (=> b!1431254 (= e!808041 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630057 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630057 lt!630053 mask!2608))))

(declare-fun b!1431255 () Bool)

(assert (=> b!1431255 (and (bvsge (index!47694 lt!630079) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630079) (size!47596 lt!630053)))))

(declare-fun res!965301 () Bool)

(assert (=> b!1431255 (= res!965301 (= (select (arr!47046 lt!630053) (index!47694 lt!630079)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808039 () Bool)

(assert (=> b!1431255 (=> res!965301 e!808039)))

(declare-fun b!1431256 () Bool)

(declare-fun e!808038 () Bool)

(assert (=> b!1431256 (= e!808040 e!808038)))

(declare-fun res!965300 () Bool)

(assert (=> b!1431256 (= res!965300 (and ((_ is Intermediate!11325) lt!630079) (not (undefined!12137 lt!630079)) (bvslt (x!129337 lt!630079) #b01111111111111111111111111111110) (bvsge (x!129337 lt!630079) #b00000000000000000000000000000000) (bvsge (x!129337 lt!630079) #b00000000000000000000000000000000)))))

(assert (=> b!1431256 (=> (not res!965300) (not e!808038))))

(declare-fun b!1431257 () Bool)

(declare-fun e!808042 () SeekEntryResult!11325)

(assert (=> b!1431257 (= e!808042 (Intermediate!11325 true (toIndex!0 lt!630057 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431258 () Bool)

(assert (=> b!1431258 (and (bvsge (index!47694 lt!630079) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630079) (size!47596 lt!630053)))))

(declare-fun res!965302 () Bool)

(assert (=> b!1431258 (= res!965302 (= (select (arr!47046 lt!630053) (index!47694 lt!630079)) lt!630057))))

(assert (=> b!1431258 (=> res!965302 e!808039)))

(assert (=> b!1431258 (= e!808038 e!808039)))

(declare-fun b!1431259 () Bool)

(assert (=> b!1431259 (= e!808041 (Intermediate!11325 false (toIndex!0 lt!630057 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431260 () Bool)

(assert (=> b!1431260 (= e!808042 e!808041)))

(declare-fun c!132473 () Bool)

(declare-fun lt!630080 () (_ BitVec 64))

(assert (=> b!1431260 (= c!132473 (or (= lt!630080 lt!630057) (= (bvadd lt!630080 lt!630080) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153873 () Bool)

(assert (=> d!153873 e!808040))

(declare-fun c!132474 () Bool)

(assert (=> d!153873 (= c!132474 (and ((_ is Intermediate!11325) lt!630079) (undefined!12137 lt!630079)))))

(assert (=> d!153873 (= lt!630079 e!808042)))

(declare-fun c!132472 () Bool)

(assert (=> d!153873 (= c!132472 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153873 (= lt!630080 (select (arr!47046 lt!630053) (toIndex!0 lt!630057 mask!2608)))))

(assert (=> d!153873 (validMask!0 mask!2608)))

(assert (=> d!153873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630057 mask!2608) lt!630057 lt!630053 mask!2608) lt!630079)))

(declare-fun b!1431261 () Bool)

(assert (=> b!1431261 (and (bvsge (index!47694 lt!630079) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630079) (size!47596 lt!630053)))))

(assert (=> b!1431261 (= e!808039 (= (select (arr!47046 lt!630053) (index!47694 lt!630079)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153873 c!132472) b!1431257))

(assert (= (and d!153873 (not c!132472)) b!1431260))

(assert (= (and b!1431260 c!132473) b!1431259))

(assert (= (and b!1431260 (not c!132473)) b!1431254))

(assert (= (and d!153873 c!132474) b!1431253))

(assert (= (and d!153873 (not c!132474)) b!1431256))

(assert (= (and b!1431256 res!965300) b!1431258))

(assert (= (and b!1431258 (not res!965302)) b!1431255))

(assert (= (and b!1431255 (not res!965301)) b!1431261))

(declare-fun m!1321149 () Bool)

(assert (=> b!1431258 m!1321149))

(assert (=> b!1431255 m!1321149))

(assert (=> b!1431261 m!1321149))

(assert (=> b!1431254 m!1321067))

(declare-fun m!1321151 () Bool)

(assert (=> b!1431254 m!1321151))

(assert (=> b!1431254 m!1321151))

(declare-fun m!1321153 () Bool)

(assert (=> b!1431254 m!1321153))

(assert (=> d!153873 m!1321067))

(declare-fun m!1321155 () Bool)

(assert (=> d!153873 m!1321155))

(assert (=> d!153873 m!1321095))

(assert (=> b!1431180 d!153873))

(declare-fun d!153875 () Bool)

(declare-fun lt!630086 () (_ BitVec 32))

(declare-fun lt!630085 () (_ BitVec 32))

(assert (=> d!153875 (= lt!630086 (bvmul (bvxor lt!630085 (bvlshr lt!630085 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153875 (= lt!630085 ((_ extract 31 0) (bvand (bvxor lt!630057 (bvlshr lt!630057 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153875 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965303 (let ((h!34874 ((_ extract 31 0) (bvand (bvxor lt!630057 (bvlshr lt!630057 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129340 (bvmul (bvxor h!34874 (bvlshr h!34874 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129340 (bvlshr x!129340 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965303 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965303 #b00000000000000000000000000000000))))))

(assert (=> d!153875 (= (toIndex!0 lt!630057 mask!2608) (bvand (bvxor lt!630086 (bvlshr lt!630086 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431180 d!153875))

(declare-fun b!1431272 () Bool)

(declare-fun e!808054 () Bool)

(declare-fun e!808053 () Bool)

(assert (=> b!1431272 (= e!808054 e!808053)))

(declare-fun c!132477 () Bool)

(assert (=> b!1431272 (= c!132477 (validKeyInArray!0 (select (arr!47046 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67456 () Bool)

(declare-fun call!67459 () Bool)

(assert (=> bm!67456 (= call!67459 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132477 (Cons!33552 (select (arr!47046 a!2831) #b00000000000000000000000000000000) Nil!33553) Nil!33553)))))

(declare-fun b!1431273 () Bool)

(assert (=> b!1431273 (= e!808053 call!67459)))

(declare-fun b!1431274 () Bool)

(declare-fun e!808051 () Bool)

(declare-fun contains!9864 (List!33556 (_ BitVec 64)) Bool)

(assert (=> b!1431274 (= e!808051 (contains!9864 Nil!33553 (select (arr!47046 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431276 () Bool)

(declare-fun e!808052 () Bool)

(assert (=> b!1431276 (= e!808052 e!808054)))

(declare-fun res!965312 () Bool)

(assert (=> b!1431276 (=> (not res!965312) (not e!808054))))

(assert (=> b!1431276 (= res!965312 (not e!808051))))

(declare-fun res!965311 () Bool)

(assert (=> b!1431276 (=> (not res!965311) (not e!808051))))

(assert (=> b!1431276 (= res!965311 (validKeyInArray!0 (select (arr!47046 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153881 () Bool)

(declare-fun res!965310 () Bool)

(assert (=> d!153881 (=> res!965310 e!808052)))

(assert (=> d!153881 (= res!965310 (bvsge #b00000000000000000000000000000000 (size!47596 a!2831)))))

(assert (=> d!153881 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33553) e!808052)))

(declare-fun b!1431275 () Bool)

(assert (=> b!1431275 (= e!808053 call!67459)))

(assert (= (and d!153881 (not res!965310)) b!1431276))

(assert (= (and b!1431276 res!965311) b!1431274))

(assert (= (and b!1431276 res!965312) b!1431272))

(assert (= (and b!1431272 c!132477) b!1431275))

(assert (= (and b!1431272 (not c!132477)) b!1431273))

(assert (= (or b!1431275 b!1431273) bm!67456))

(declare-fun m!1321157 () Bool)

(assert (=> b!1431272 m!1321157))

(assert (=> b!1431272 m!1321157))

(declare-fun m!1321159 () Bool)

(assert (=> b!1431272 m!1321159))

(assert (=> bm!67456 m!1321157))

(declare-fun m!1321161 () Bool)

(assert (=> bm!67456 m!1321161))

(assert (=> b!1431274 m!1321157))

(assert (=> b!1431274 m!1321157))

(declare-fun m!1321163 () Bool)

(assert (=> b!1431274 m!1321163))

(assert (=> b!1431276 m!1321157))

(assert (=> b!1431276 m!1321157))

(assert (=> b!1431276 m!1321159))

(assert (=> b!1431174 d!153881))

(declare-fun b!1431277 () Bool)

(declare-fun e!808057 () Bool)

(declare-fun lt!630087 () SeekEntryResult!11325)

(assert (=> b!1431277 (= e!808057 (bvsge (x!129337 lt!630087) #b01111111111111111111111111111110))))

(declare-fun b!1431278 () Bool)

(declare-fun e!808058 () SeekEntryResult!11325)

(assert (=> b!1431278 (= e!808058 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!630057 lt!630053 mask!2608))))

(declare-fun b!1431279 () Bool)

(assert (=> b!1431279 (and (bvsge (index!47694 lt!630087) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630087) (size!47596 lt!630053)))))

(declare-fun res!965314 () Bool)

(assert (=> b!1431279 (= res!965314 (= (select (arr!47046 lt!630053) (index!47694 lt!630087)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808056 () Bool)

(assert (=> b!1431279 (=> res!965314 e!808056)))

(declare-fun b!1431280 () Bool)

(declare-fun e!808055 () Bool)

(assert (=> b!1431280 (= e!808057 e!808055)))

(declare-fun res!965313 () Bool)

(assert (=> b!1431280 (= res!965313 (and ((_ is Intermediate!11325) lt!630087) (not (undefined!12137 lt!630087)) (bvslt (x!129337 lt!630087) #b01111111111111111111111111111110) (bvsge (x!129337 lt!630087) #b00000000000000000000000000000000) (bvsge (x!129337 lt!630087) x!605)))))

(assert (=> b!1431280 (=> (not res!965313) (not e!808055))))

(declare-fun b!1431281 () Bool)

(declare-fun e!808059 () SeekEntryResult!11325)

(assert (=> b!1431281 (= e!808059 (Intermediate!11325 true index!585 x!605))))

(declare-fun b!1431282 () Bool)

(assert (=> b!1431282 (and (bvsge (index!47694 lt!630087) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630087) (size!47596 lt!630053)))))

(declare-fun res!965315 () Bool)

(assert (=> b!1431282 (= res!965315 (= (select (arr!47046 lt!630053) (index!47694 lt!630087)) lt!630057))))

(assert (=> b!1431282 (=> res!965315 e!808056)))

(assert (=> b!1431282 (= e!808055 e!808056)))

(declare-fun b!1431283 () Bool)

(assert (=> b!1431283 (= e!808058 (Intermediate!11325 false index!585 x!605))))

(declare-fun b!1431284 () Bool)

(assert (=> b!1431284 (= e!808059 e!808058)))

(declare-fun c!132479 () Bool)

(declare-fun lt!630088 () (_ BitVec 64))

(assert (=> b!1431284 (= c!132479 (or (= lt!630088 lt!630057) (= (bvadd lt!630088 lt!630088) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153885 () Bool)

(assert (=> d!153885 e!808057))

(declare-fun c!132480 () Bool)

(assert (=> d!153885 (= c!132480 (and ((_ is Intermediate!11325) lt!630087) (undefined!12137 lt!630087)))))

(assert (=> d!153885 (= lt!630087 e!808059)))

(declare-fun c!132478 () Bool)

(assert (=> d!153885 (= c!132478 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153885 (= lt!630088 (select (arr!47046 lt!630053) index!585))))

(assert (=> d!153885 (validMask!0 mask!2608)))

(assert (=> d!153885 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630057 lt!630053 mask!2608) lt!630087)))

(declare-fun b!1431285 () Bool)

(assert (=> b!1431285 (and (bvsge (index!47694 lt!630087) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630087) (size!47596 lt!630053)))))

(assert (=> b!1431285 (= e!808056 (= (select (arr!47046 lt!630053) (index!47694 lt!630087)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153885 c!132478) b!1431281))

(assert (= (and d!153885 (not c!132478)) b!1431284))

(assert (= (and b!1431284 c!132479) b!1431283))

(assert (= (and b!1431284 (not c!132479)) b!1431278))

(assert (= (and d!153885 c!132480) b!1431277))

(assert (= (and d!153885 (not c!132480)) b!1431280))

(assert (= (and b!1431280 res!965313) b!1431282))

(assert (= (and b!1431282 (not res!965315)) b!1431279))

(assert (= (and b!1431279 (not res!965314)) b!1431285))

(declare-fun m!1321165 () Bool)

(assert (=> b!1431282 m!1321165))

(assert (=> b!1431279 m!1321165))

(assert (=> b!1431285 m!1321165))

(assert (=> b!1431278 m!1321145))

(assert (=> b!1431278 m!1321145))

(declare-fun m!1321167 () Bool)

(assert (=> b!1431278 m!1321167))

(declare-fun m!1321169 () Bool)

(assert (=> d!153885 m!1321169))

(assert (=> d!153885 m!1321095))

(assert (=> b!1431179 d!153885))

(declare-fun b!1431286 () Bool)

(declare-fun e!808062 () Bool)

(declare-fun lt!630089 () SeekEntryResult!11325)

(assert (=> b!1431286 (= e!808062 (bvsge (x!129337 lt!630089) #b01111111111111111111111111111110))))

(declare-fun e!808063 () SeekEntryResult!11325)

(declare-fun b!1431287 () Bool)

(assert (=> b!1431287 (= e!808063 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47046 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47046 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431288 () Bool)

(assert (=> b!1431288 (and (bvsge (index!47694 lt!630089) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630089) (size!47596 a!2831)))))

(declare-fun res!965317 () Bool)

(assert (=> b!1431288 (= res!965317 (= (select (arr!47046 a!2831) (index!47694 lt!630089)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808061 () Bool)

(assert (=> b!1431288 (=> res!965317 e!808061)))

(declare-fun b!1431289 () Bool)

(declare-fun e!808060 () Bool)

(assert (=> b!1431289 (= e!808062 e!808060)))

(declare-fun res!965316 () Bool)

(assert (=> b!1431289 (= res!965316 (and ((_ is Intermediate!11325) lt!630089) (not (undefined!12137 lt!630089)) (bvslt (x!129337 lt!630089) #b01111111111111111111111111111110) (bvsge (x!129337 lt!630089) #b00000000000000000000000000000000) (bvsge (x!129337 lt!630089) #b00000000000000000000000000000000)))))

(assert (=> b!1431289 (=> (not res!965316) (not e!808060))))

(declare-fun e!808064 () SeekEntryResult!11325)

(declare-fun b!1431290 () Bool)

(assert (=> b!1431290 (= e!808064 (Intermediate!11325 true (toIndex!0 (select (arr!47046 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431291 () Bool)

(assert (=> b!1431291 (and (bvsge (index!47694 lt!630089) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630089) (size!47596 a!2831)))))

(declare-fun res!965318 () Bool)

(assert (=> b!1431291 (= res!965318 (= (select (arr!47046 a!2831) (index!47694 lt!630089)) (select (arr!47046 a!2831) j!81)))))

(assert (=> b!1431291 (=> res!965318 e!808061)))

(assert (=> b!1431291 (= e!808060 e!808061)))

(declare-fun b!1431292 () Bool)

(assert (=> b!1431292 (= e!808063 (Intermediate!11325 false (toIndex!0 (select (arr!47046 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431293 () Bool)

(assert (=> b!1431293 (= e!808064 e!808063)))

(declare-fun lt!630090 () (_ BitVec 64))

(declare-fun c!132482 () Bool)

(assert (=> b!1431293 (= c!132482 (or (= lt!630090 (select (arr!47046 a!2831) j!81)) (= (bvadd lt!630090 lt!630090) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153887 () Bool)

(assert (=> d!153887 e!808062))

(declare-fun c!132483 () Bool)

(assert (=> d!153887 (= c!132483 (and ((_ is Intermediate!11325) lt!630089) (undefined!12137 lt!630089)))))

(assert (=> d!153887 (= lt!630089 e!808064)))

(declare-fun c!132481 () Bool)

(assert (=> d!153887 (= c!132481 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153887 (= lt!630090 (select (arr!47046 a!2831) (toIndex!0 (select (arr!47046 a!2831) j!81) mask!2608)))))

(assert (=> d!153887 (validMask!0 mask!2608)))

(assert (=> d!153887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47046 a!2831) j!81) mask!2608) (select (arr!47046 a!2831) j!81) a!2831 mask!2608) lt!630089)))

(declare-fun b!1431294 () Bool)

(assert (=> b!1431294 (and (bvsge (index!47694 lt!630089) #b00000000000000000000000000000000) (bvslt (index!47694 lt!630089) (size!47596 a!2831)))))

(assert (=> b!1431294 (= e!808061 (= (select (arr!47046 a!2831) (index!47694 lt!630089)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153887 c!132481) b!1431290))

(assert (= (and d!153887 (not c!132481)) b!1431293))

(assert (= (and b!1431293 c!132482) b!1431292))

(assert (= (and b!1431293 (not c!132482)) b!1431287))

(assert (= (and d!153887 c!132483) b!1431286))

(assert (= (and d!153887 (not c!132483)) b!1431289))

(assert (= (and b!1431289 res!965316) b!1431291))

(assert (= (and b!1431291 (not res!965318)) b!1431288))

(assert (= (and b!1431288 (not res!965317)) b!1431294))

(declare-fun m!1321171 () Bool)

(assert (=> b!1431291 m!1321171))

(assert (=> b!1431288 m!1321171))

(assert (=> b!1431294 m!1321171))

(assert (=> b!1431287 m!1321061))

(declare-fun m!1321173 () Bool)

(assert (=> b!1431287 m!1321173))

(assert (=> b!1431287 m!1321173))

(assert (=> b!1431287 m!1321059))

(declare-fun m!1321175 () Bool)

(assert (=> b!1431287 m!1321175))

(assert (=> d!153887 m!1321061))

(declare-fun m!1321177 () Bool)

(assert (=> d!153887 m!1321177))

(assert (=> d!153887 m!1321095))

(assert (=> b!1431178 d!153887))

(declare-fun d!153889 () Bool)

(declare-fun lt!630092 () (_ BitVec 32))

(declare-fun lt!630091 () (_ BitVec 32))

(assert (=> d!153889 (= lt!630092 (bvmul (bvxor lt!630091 (bvlshr lt!630091 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153889 (= lt!630091 ((_ extract 31 0) (bvand (bvxor (select (arr!47046 a!2831) j!81) (bvlshr (select (arr!47046 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153889 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965303 (let ((h!34874 ((_ extract 31 0) (bvand (bvxor (select (arr!47046 a!2831) j!81) (bvlshr (select (arr!47046 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129340 (bvmul (bvxor h!34874 (bvlshr h!34874 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129340 (bvlshr x!129340 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965303 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965303 #b00000000000000000000000000000000))))))

(assert (=> d!153889 (= (toIndex!0 (select (arr!47046 a!2831) j!81) mask!2608) (bvand (bvxor lt!630092 (bvlshr lt!630092 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431178 d!153889))

(declare-fun d!153891 () Bool)

(assert (=> d!153891 (= (validKeyInArray!0 (select (arr!47046 a!2831) j!81)) (and (not (= (select (arr!47046 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47046 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431183 d!153891))

(declare-fun d!153893 () Bool)

(declare-fun lt!630117 () SeekEntryResult!11325)

(assert (=> d!153893 (and (or ((_ is Undefined!11325) lt!630117) (not ((_ is Found!11325) lt!630117)) (and (bvsge (index!47693 lt!630117) #b00000000000000000000000000000000) (bvslt (index!47693 lt!630117) (size!47596 a!2831)))) (or ((_ is Undefined!11325) lt!630117) ((_ is Found!11325) lt!630117) (not ((_ is MissingZero!11325) lt!630117)) (and (bvsge (index!47692 lt!630117) #b00000000000000000000000000000000) (bvslt (index!47692 lt!630117) (size!47596 a!2831)))) (or ((_ is Undefined!11325) lt!630117) ((_ is Found!11325) lt!630117) ((_ is MissingZero!11325) lt!630117) (not ((_ is MissingVacant!11325) lt!630117)) (and (bvsge (index!47695 lt!630117) #b00000000000000000000000000000000) (bvslt (index!47695 lt!630117) (size!47596 a!2831)))) (or ((_ is Undefined!11325) lt!630117) (ite ((_ is Found!11325) lt!630117) (= (select (arr!47046 a!2831) (index!47693 lt!630117)) (select (arr!47046 a!2831) j!81)) (ite ((_ is MissingZero!11325) lt!630117) (= (select (arr!47046 a!2831) (index!47692 lt!630117)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11325) lt!630117) (= (select (arr!47046 a!2831) (index!47695 lt!630117)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!808103 () SeekEntryResult!11325)

(assert (=> d!153893 (= lt!630117 e!808103)))

(declare-fun c!132508 () Bool)

(declare-fun lt!630118 () SeekEntryResult!11325)

(assert (=> d!153893 (= c!132508 (and ((_ is Intermediate!11325) lt!630118) (undefined!12137 lt!630118)))))

(assert (=> d!153893 (= lt!630118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47046 a!2831) j!81) mask!2608) (select (arr!47046 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153893 (validMask!0 mask!2608)))

(assert (=> d!153893 (= (seekEntryOrOpen!0 (select (arr!47046 a!2831) j!81) a!2831 mask!2608) lt!630117)))

(declare-fun b!1431361 () Bool)

(declare-fun e!808102 () SeekEntryResult!11325)

(assert (=> b!1431361 (= e!808102 (Found!11325 (index!47694 lt!630118)))))

(declare-fun e!808101 () SeekEntryResult!11325)

(declare-fun b!1431362 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97475 (_ BitVec 32)) SeekEntryResult!11325)

(assert (=> b!1431362 (= e!808101 (seekKeyOrZeroReturnVacant!0 (x!129337 lt!630118) (index!47694 lt!630118) (index!47694 lt!630118) (select (arr!47046 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431363 () Bool)

(assert (=> b!1431363 (= e!808103 Undefined!11325)))

(declare-fun b!1431364 () Bool)

(assert (=> b!1431364 (= e!808101 (MissingZero!11325 (index!47694 lt!630118)))))

(declare-fun b!1431365 () Bool)

(assert (=> b!1431365 (= e!808103 e!808102)))

(declare-fun lt!630119 () (_ BitVec 64))

(assert (=> b!1431365 (= lt!630119 (select (arr!47046 a!2831) (index!47694 lt!630118)))))

(declare-fun c!132509 () Bool)

(assert (=> b!1431365 (= c!132509 (= lt!630119 (select (arr!47046 a!2831) j!81)))))

(declare-fun b!1431366 () Bool)

(declare-fun c!132510 () Bool)

(assert (=> b!1431366 (= c!132510 (= lt!630119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431366 (= e!808102 e!808101)))

(assert (= (and d!153893 c!132508) b!1431363))

(assert (= (and d!153893 (not c!132508)) b!1431365))

(assert (= (and b!1431365 c!132509) b!1431361))

(assert (= (and b!1431365 (not c!132509)) b!1431366))

(assert (= (and b!1431366 c!132510) b!1431364))

(assert (= (and b!1431366 (not c!132510)) b!1431362))

(assert (=> d!153893 m!1321059))

(assert (=> d!153893 m!1321061))

(assert (=> d!153893 m!1321061))

(assert (=> d!153893 m!1321059))

(assert (=> d!153893 m!1321063))

(declare-fun m!1321195 () Bool)

(assert (=> d!153893 m!1321195))

(declare-fun m!1321197 () Bool)

(assert (=> d!153893 m!1321197))

(assert (=> d!153893 m!1321095))

(declare-fun m!1321199 () Bool)

(assert (=> d!153893 m!1321199))

(assert (=> b!1431362 m!1321059))

(declare-fun m!1321201 () Bool)

(assert (=> b!1431362 m!1321201))

(declare-fun m!1321203 () Bool)

(assert (=> b!1431365 m!1321203))

(assert (=> b!1431177 d!153893))

(declare-fun d!153901 () Bool)

(assert (=> d!153901 (= (validKeyInArray!0 (select (arr!47046 a!2831) i!982)) (and (not (= (select (arr!47046 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47046 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431182 d!153901))

(declare-fun b!1431404 () Bool)

(declare-fun e!808130 () Bool)

(declare-fun call!67467 () Bool)

(assert (=> b!1431404 (= e!808130 call!67467)))

(declare-fun b!1431405 () Bool)

(declare-fun e!808131 () Bool)

(assert (=> b!1431405 (= e!808131 e!808130)))

(declare-fun c!132521 () Bool)

(assert (=> b!1431405 (= c!132521 (validKeyInArray!0 (select (arr!47046 a!2831) j!81)))))

(declare-fun b!1431406 () Bool)

(declare-fun e!808132 () Bool)

(assert (=> b!1431406 (= e!808130 e!808132)))

(declare-fun lt!630154 () (_ BitVec 64))

(assert (=> b!1431406 (= lt!630154 (select (arr!47046 a!2831) j!81))))

(declare-fun lt!630153 () Unit!48396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97475 (_ BitVec 64) (_ BitVec 32)) Unit!48396)

(assert (=> b!1431406 (= lt!630153 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630154 j!81))))

(declare-fun arrayContainsKey!0 (array!97475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1431406 (arrayContainsKey!0 a!2831 lt!630154 #b00000000000000000000000000000000)))

(declare-fun lt!630152 () Unit!48396)

(assert (=> b!1431406 (= lt!630152 lt!630153)))

(declare-fun res!965357 () Bool)

(assert (=> b!1431406 (= res!965357 (= (seekEntryOrOpen!0 (select (arr!47046 a!2831) j!81) a!2831 mask!2608) (Found!11325 j!81)))))

(assert (=> b!1431406 (=> (not res!965357) (not e!808132))))

(declare-fun bm!67464 () Bool)

(assert (=> bm!67464 (= call!67467 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1431407 () Bool)

(assert (=> b!1431407 (= e!808132 call!67467)))

(declare-fun d!153903 () Bool)

(declare-fun res!965356 () Bool)

(assert (=> d!153903 (=> res!965356 e!808131)))

(assert (=> d!153903 (= res!965356 (bvsge j!81 (size!47596 a!2831)))))

(assert (=> d!153903 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808131)))

(assert (= (and d!153903 (not res!965356)) b!1431405))

(assert (= (and b!1431405 c!132521) b!1431406))

(assert (= (and b!1431405 (not c!132521)) b!1431404))

(assert (= (and b!1431406 res!965357) b!1431407))

(assert (= (or b!1431407 b!1431404) bm!67464))

(assert (=> b!1431405 m!1321059))

(assert (=> b!1431405 m!1321059))

(assert (=> b!1431405 m!1321089))

(assert (=> b!1431406 m!1321059))

(declare-fun m!1321221 () Bool)

(assert (=> b!1431406 m!1321221))

(declare-fun m!1321223 () Bool)

(assert (=> b!1431406 m!1321223))

(assert (=> b!1431406 m!1321059))

(assert (=> b!1431406 m!1321099))

(declare-fun m!1321225 () Bool)

(assert (=> bm!67464 m!1321225))

(assert (=> b!1431171 d!153903))

(declare-fun d!153913 () Bool)

(assert (=> d!153913 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630162 () Unit!48396)

(declare-fun choose!38 (array!97475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48396)

(assert (=> d!153913 (= lt!630162 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153913 (validMask!0 mask!2608)))

(assert (=> d!153913 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630162)))

(declare-fun bs!41694 () Bool)

(assert (= bs!41694 d!153913))

(assert (=> bs!41694 m!1321085))

(declare-fun m!1321233 () Bool)

(assert (=> bs!41694 m!1321233))

(assert (=> bs!41694 m!1321095))

(assert (=> b!1431171 d!153913))

(declare-fun b!1431412 () Bool)

(declare-fun e!808136 () Bool)

(declare-fun call!67469 () Bool)

(assert (=> b!1431412 (= e!808136 call!67469)))

(declare-fun b!1431413 () Bool)

(declare-fun e!808137 () Bool)

(assert (=> b!1431413 (= e!808137 e!808136)))

(declare-fun c!132523 () Bool)

(assert (=> b!1431413 (= c!132523 (validKeyInArray!0 (select (arr!47046 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431414 () Bool)

(declare-fun e!808138 () Bool)

(assert (=> b!1431414 (= e!808136 e!808138)))

(declare-fun lt!630166 () (_ BitVec 64))

(assert (=> b!1431414 (= lt!630166 (select (arr!47046 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630165 () Unit!48396)

(assert (=> b!1431414 (= lt!630165 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630166 #b00000000000000000000000000000000))))

(assert (=> b!1431414 (arrayContainsKey!0 a!2831 lt!630166 #b00000000000000000000000000000000)))

(declare-fun lt!630164 () Unit!48396)

(assert (=> b!1431414 (= lt!630164 lt!630165)))

(declare-fun res!965361 () Bool)

(assert (=> b!1431414 (= res!965361 (= (seekEntryOrOpen!0 (select (arr!47046 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11325 #b00000000000000000000000000000000)))))

(assert (=> b!1431414 (=> (not res!965361) (not e!808138))))

(declare-fun bm!67466 () Bool)

(assert (=> bm!67466 (= call!67469 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1431415 () Bool)

(assert (=> b!1431415 (= e!808138 call!67469)))

(declare-fun d!153917 () Bool)

(declare-fun res!965360 () Bool)

(assert (=> d!153917 (=> res!965360 e!808137)))

(assert (=> d!153917 (= res!965360 (bvsge #b00000000000000000000000000000000 (size!47596 a!2831)))))

(assert (=> d!153917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808137)))

(assert (= (and d!153917 (not res!965360)) b!1431413))

(assert (= (and b!1431413 c!132523) b!1431414))

(assert (= (and b!1431413 (not c!132523)) b!1431412))

(assert (= (and b!1431414 res!965361) b!1431415))

(assert (= (or b!1431415 b!1431412) bm!67466))

(assert (=> b!1431413 m!1321157))

(assert (=> b!1431413 m!1321157))

(assert (=> b!1431413 m!1321159))

(assert (=> b!1431414 m!1321157))

(declare-fun m!1321237 () Bool)

(assert (=> b!1431414 m!1321237))

(declare-fun m!1321239 () Bool)

(assert (=> b!1431414 m!1321239))

(assert (=> b!1431414 m!1321157))

(declare-fun m!1321241 () Bool)

(assert (=> b!1431414 m!1321241))

(declare-fun m!1321243 () Bool)

(assert (=> bm!67466 m!1321243))

(assert (=> b!1431176 d!153917))

(declare-fun d!153921 () Bool)

(assert (=> d!153921 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123452 d!153921))

(declare-fun d!153935 () Bool)

(assert (=> d!153935 (= (array_inv!36074 a!2831) (bvsge (size!47596 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123452 d!153935))

(check-sat (not b!1431413) (not b!1431276) (not b!1431272) (not b!1431254) (not b!1431274) (not d!153873) (not d!153885) (not d!153871) (not bm!67456) (not d!153887) (not b!1431287) (not b!1431414) (not d!153893) (not d!153913) (not b!1431245) (not b!1431405) (not b!1431406) (not bm!67464) (not b!1431278) (not bm!67466) (not b!1431362))
(check-sat)
