; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123652 () Bool)

(assert start!123652)

(declare-fun b!1433594 () Bool)

(declare-fun res!967268 () Bool)

(declare-fun e!809154 () Bool)

(assert (=> b!1433594 (=> (not res!967268) (not e!809154))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97567 0))(
  ( (array!97568 (arr!47089 (Array (_ BitVec 32) (_ BitVec 64))) (size!47639 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97567)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433594 (= res!967268 (and (= (size!47639 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47639 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47639 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433595 () Bool)

(declare-fun e!809156 () Bool)

(declare-fun e!809152 () Bool)

(assert (=> b!1433595 (= e!809156 (not e!809152))))

(declare-fun res!967260 () Bool)

(assert (=> b!1433595 (=> res!967260 e!809152)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1433595 (= res!967260 (or (= (select (arr!47089 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47089 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47089 a!2831) index!585) (select (arr!47089 a!2831) j!81)) (= (select (store (arr!47089 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809151 () Bool)

(assert (=> b!1433595 e!809151))

(declare-fun res!967270 () Bool)

(assert (=> b!1433595 (=> (not res!967270) (not e!809151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97567 (_ BitVec 32)) Bool)

(assert (=> b!1433595 (= res!967270 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48482 0))(
  ( (Unit!48483) )
))
(declare-fun lt!631099 () Unit!48482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48482)

(assert (=> b!1433595 (= lt!631099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!967262 () Bool)

(assert (=> start!123652 (=> (not res!967262) (not e!809154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123652 (= res!967262 (validMask!0 mask!2608))))

(assert (=> start!123652 e!809154))

(assert (=> start!123652 true))

(declare-fun array_inv!36117 (array!97567) Bool)

(assert (=> start!123652 (array_inv!36117 a!2831)))

(declare-fun b!1433596 () Bool)

(declare-fun res!967265 () Bool)

(assert (=> b!1433596 (=> (not res!967265) (not e!809154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433596 (= res!967265 (validKeyInArray!0 (select (arr!47089 a!2831) i!982)))))

(declare-fun b!1433597 () Bool)

(declare-fun e!809155 () Bool)

(assert (=> b!1433597 (= e!809155 e!809156)))

(declare-fun res!967269 () Bool)

(assert (=> b!1433597 (=> (not res!967269) (not e!809156))))

(declare-datatypes ((SeekEntryResult!11368 0))(
  ( (MissingZero!11368 (index!47864 (_ BitVec 32))) (Found!11368 (index!47865 (_ BitVec 32))) (Intermediate!11368 (undefined!12180 Bool) (index!47866 (_ BitVec 32)) (x!129507 (_ BitVec 32))) (Undefined!11368) (MissingVacant!11368 (index!47867 (_ BitVec 32))) )
))
(declare-fun lt!631098 () SeekEntryResult!11368)

(declare-fun lt!631096 () (_ BitVec 64))

(declare-fun lt!631100 () array!97567)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97567 (_ BitVec 32)) SeekEntryResult!11368)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433597 (= res!967269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631096 mask!2608) lt!631096 lt!631100 mask!2608) lt!631098))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433597 (= lt!631098 (Intermediate!11368 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433597 (= lt!631096 (select (store (arr!47089 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433597 (= lt!631100 (array!97568 (store (arr!47089 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47639 a!2831)))))

(declare-fun b!1433598 () Bool)

(declare-fun res!967266 () Bool)

(assert (=> b!1433598 (=> (not res!967266) (not e!809156))))

(declare-fun lt!631097 () SeekEntryResult!11368)

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1433598 (= res!967266 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!631097))))

(declare-fun b!1433599 () Bool)

(declare-fun res!967264 () Bool)

(assert (=> b!1433599 (=> (not res!967264) (not e!809156))))

(assert (=> b!1433599 (= res!967264 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631096 lt!631100 mask!2608) lt!631098))))

(declare-fun b!1433600 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97567 (_ BitVec 32)) SeekEntryResult!11368)

(assert (=> b!1433600 (= e!809151 (= (seekEntryOrOpen!0 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) (Found!11368 j!81)))))

(declare-fun b!1433601 () Bool)

(declare-fun res!967257 () Bool)

(assert (=> b!1433601 (=> (not res!967257) (not e!809154))))

(assert (=> b!1433601 (= res!967257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433602 () Bool)

(declare-fun res!967259 () Bool)

(assert (=> b!1433602 (=> (not res!967259) (not e!809154))))

(declare-datatypes ((List!33599 0))(
  ( (Nil!33596) (Cons!33595 (h!34921 (_ BitVec 64)) (t!48293 List!33599)) )
))
(declare-fun arrayNoDuplicates!0 (array!97567 (_ BitVec 32) List!33599) Bool)

(assert (=> b!1433602 (= res!967259 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33596))))

(declare-fun b!1433603 () Bool)

(assert (=> b!1433603 (= e!809154 e!809155)))

(declare-fun res!967267 () Bool)

(assert (=> b!1433603 (=> (not res!967267) (not e!809155))))

(assert (=> b!1433603 (= res!967267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!631097))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433603 (= lt!631097 (Intermediate!11368 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433604 () Bool)

(declare-fun res!967263 () Bool)

(assert (=> b!1433604 (=> (not res!967263) (not e!809156))))

(assert (=> b!1433604 (= res!967263 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun lt!631101 () (_ BitVec 32))

(declare-fun b!1433605 () Bool)

(assert (=> b!1433605 (= e!809152 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (and (bvsge lt!631101 #b00000000000000000000000000000000) (bvslt lt!631101 (size!47639 a!2831)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433605 (= lt!631101 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433606 () Bool)

(declare-fun res!967261 () Bool)

(assert (=> b!1433606 (=> (not res!967261) (not e!809154))))

(assert (=> b!1433606 (= res!967261 (validKeyInArray!0 (select (arr!47089 a!2831) j!81)))))

(declare-fun b!1433607 () Bool)

(declare-fun res!967258 () Bool)

(assert (=> b!1433607 (=> (not res!967258) (not e!809154))))

(assert (=> b!1433607 (= res!967258 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47639 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47639 a!2831))))))

(assert (= (and start!123652 res!967262) b!1433594))

(assert (= (and b!1433594 res!967268) b!1433596))

(assert (= (and b!1433596 res!967265) b!1433606))

(assert (= (and b!1433606 res!967261) b!1433601))

(assert (= (and b!1433601 res!967257) b!1433602))

(assert (= (and b!1433602 res!967259) b!1433607))

(assert (= (and b!1433607 res!967258) b!1433603))

(assert (= (and b!1433603 res!967267) b!1433597))

(assert (= (and b!1433597 res!967269) b!1433598))

(assert (= (and b!1433598 res!967266) b!1433599))

(assert (= (and b!1433599 res!967264) b!1433604))

(assert (= (and b!1433604 res!967263) b!1433595))

(assert (= (and b!1433595 res!967270) b!1433600))

(assert (= (and b!1433595 (not res!967260)) b!1433605))

(declare-fun m!1323319 () Bool)

(assert (=> b!1433597 m!1323319))

(assert (=> b!1433597 m!1323319))

(declare-fun m!1323321 () Bool)

(assert (=> b!1433597 m!1323321))

(declare-fun m!1323323 () Bool)

(assert (=> b!1433597 m!1323323))

(declare-fun m!1323325 () Bool)

(assert (=> b!1433597 m!1323325))

(declare-fun m!1323327 () Bool)

(assert (=> b!1433599 m!1323327))

(declare-fun m!1323329 () Bool)

(assert (=> b!1433600 m!1323329))

(assert (=> b!1433600 m!1323329))

(declare-fun m!1323331 () Bool)

(assert (=> b!1433600 m!1323331))

(declare-fun m!1323333 () Bool)

(assert (=> start!123652 m!1323333))

(declare-fun m!1323335 () Bool)

(assert (=> start!123652 m!1323335))

(declare-fun m!1323337 () Bool)

(assert (=> b!1433601 m!1323337))

(declare-fun m!1323339 () Bool)

(assert (=> b!1433605 m!1323339))

(assert (=> b!1433595 m!1323323))

(declare-fun m!1323341 () Bool)

(assert (=> b!1433595 m!1323341))

(declare-fun m!1323343 () Bool)

(assert (=> b!1433595 m!1323343))

(declare-fun m!1323345 () Bool)

(assert (=> b!1433595 m!1323345))

(assert (=> b!1433595 m!1323329))

(declare-fun m!1323347 () Bool)

(assert (=> b!1433595 m!1323347))

(assert (=> b!1433603 m!1323329))

(assert (=> b!1433603 m!1323329))

(declare-fun m!1323349 () Bool)

(assert (=> b!1433603 m!1323349))

(assert (=> b!1433603 m!1323349))

(assert (=> b!1433603 m!1323329))

(declare-fun m!1323351 () Bool)

(assert (=> b!1433603 m!1323351))

(declare-fun m!1323353 () Bool)

(assert (=> b!1433602 m!1323353))

(declare-fun m!1323355 () Bool)

(assert (=> b!1433596 m!1323355))

(assert (=> b!1433596 m!1323355))

(declare-fun m!1323357 () Bool)

(assert (=> b!1433596 m!1323357))

(assert (=> b!1433598 m!1323329))

(assert (=> b!1433598 m!1323329))

(declare-fun m!1323359 () Bool)

(assert (=> b!1433598 m!1323359))

(assert (=> b!1433606 m!1323329))

(assert (=> b!1433606 m!1323329))

(declare-fun m!1323361 () Bool)

(assert (=> b!1433606 m!1323361))

(push 1)

(assert (not start!123652))

(assert (not b!1433603))

(assert (not b!1433598))

(assert (not b!1433597))

(assert (not b!1433595))

(assert (not b!1433601))

(assert (not b!1433605))

(assert (not b!1433596))

(assert (not b!1433599))

(assert (not b!1433606))

(assert (not b!1433602))

(assert (not b!1433600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1433715 () Bool)

(declare-fun e!809226 () SeekEntryResult!11368)

(declare-fun e!809224 () SeekEntryResult!11368)

(assert (=> b!1433715 (= e!809226 e!809224)))

(declare-fun c!132702 () Bool)

(declare-fun lt!631151 () (_ BitVec 64))

(assert (=> b!1433715 (= c!132702 (or (= lt!631151 lt!631096) (= (bvadd lt!631151 lt!631151) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433716 () Bool)

(declare-fun lt!631150 () SeekEntryResult!11368)

(assert (=> b!1433716 (and (bvsge (index!47866 lt!631150) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631150) (size!47639 lt!631100)))))

(declare-fun res!967315 () Bool)

(assert (=> b!1433716 (= res!967315 (= (select (arr!47089 lt!631100) (index!47866 lt!631150)) lt!631096))))

(declare-fun e!809225 () Bool)

(assert (=> b!1433716 (=> res!967315 e!809225)))

(declare-fun e!809223 () Bool)

(assert (=> b!1433716 (= e!809223 e!809225)))

(declare-fun b!1433717 () Bool)

(assert (=> b!1433717 (= e!809226 (Intermediate!11368 true index!585 x!605))))

(declare-fun d!154093 () Bool)

(declare-fun e!809227 () Bool)

(assert (=> d!154093 e!809227))

(declare-fun c!132700 () Bool)

(assert (=> d!154093 (= c!132700 (and (is-Intermediate!11368 lt!631150) (undefined!12180 lt!631150)))))

(assert (=> d!154093 (= lt!631150 e!809226)))

(declare-fun c!132701 () Bool)

(assert (=> d!154093 (= c!132701 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154093 (= lt!631151 (select (arr!47089 lt!631100) index!585))))

(assert (=> d!154093 (validMask!0 mask!2608)))

(assert (=> d!154093 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631096 lt!631100 mask!2608) lt!631150)))

(declare-fun b!1433718 () Bool)

(assert (=> b!1433718 (= e!809227 e!809223)))

(declare-fun res!967314 () Bool)

(assert (=> b!1433718 (= res!967314 (and (is-Intermediate!11368 lt!631150) (not (undefined!12180 lt!631150)) (bvslt (x!129507 lt!631150) #b01111111111111111111111111111110) (bvsge (x!129507 lt!631150) #b00000000000000000000000000000000) (bvsge (x!129507 lt!631150) x!605)))))

(assert (=> b!1433718 (=> (not res!967314) (not e!809223))))

(declare-fun b!1433719 () Bool)

(assert (=> b!1433719 (= e!809224 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631096 lt!631100 mask!2608))))

(declare-fun b!1433720 () Bool)

(assert (=> b!1433720 (and (bvsge (index!47866 lt!631150) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631150) (size!47639 lt!631100)))))

(declare-fun res!967313 () Bool)

(assert (=> b!1433720 (= res!967313 (= (select (arr!47089 lt!631100) (index!47866 lt!631150)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433720 (=> res!967313 e!809225)))

(declare-fun b!1433721 () Bool)

(assert (=> b!1433721 (= e!809227 (bvsge (x!129507 lt!631150) #b01111111111111111111111111111110))))

(declare-fun b!1433722 () Bool)

(assert (=> b!1433722 (= e!809224 (Intermediate!11368 false index!585 x!605))))

(declare-fun b!1433723 () Bool)

(assert (=> b!1433723 (and (bvsge (index!47866 lt!631150) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631150) (size!47639 lt!631100)))))

(assert (=> b!1433723 (= e!809225 (= (select (arr!47089 lt!631100) (index!47866 lt!631150)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154093 c!132701) b!1433717))

(assert (= (and d!154093 (not c!132701)) b!1433715))

(assert (= (and b!1433715 c!132702) b!1433722))

(assert (= (and b!1433715 (not c!132702)) b!1433719))

(assert (= (and d!154093 c!132700) b!1433721))

(assert (= (and d!154093 (not c!132700)) b!1433718))

(assert (= (and b!1433718 res!967314) b!1433716))

(assert (= (and b!1433716 (not res!967315)) b!1433720))

(assert (= (and b!1433720 (not res!967313)) b!1433723))

(declare-fun m!1323415 () Bool)

(assert (=> d!154093 m!1323415))

(assert (=> d!154093 m!1323333))

(assert (=> b!1433719 m!1323339))

(assert (=> b!1433719 m!1323339))

(declare-fun m!1323417 () Bool)

(assert (=> b!1433719 m!1323417))

(declare-fun m!1323419 () Bool)

(assert (=> b!1433720 m!1323419))

(assert (=> b!1433723 m!1323419))

(assert (=> b!1433716 m!1323419))

(assert (=> b!1433599 d!154093))

(declare-fun d!154115 () Bool)

(declare-fun lt!631161 () SeekEntryResult!11368)

(assert (=> d!154115 (and (or (is-Undefined!11368 lt!631161) (not (is-Found!11368 lt!631161)) (and (bvsge (index!47865 lt!631161) #b00000000000000000000000000000000) (bvslt (index!47865 lt!631161) (size!47639 a!2831)))) (or (is-Undefined!11368 lt!631161) (is-Found!11368 lt!631161) (not (is-MissingZero!11368 lt!631161)) (and (bvsge (index!47864 lt!631161) #b00000000000000000000000000000000) (bvslt (index!47864 lt!631161) (size!47639 a!2831)))) (or (is-Undefined!11368 lt!631161) (is-Found!11368 lt!631161) (is-MissingZero!11368 lt!631161) (not (is-MissingVacant!11368 lt!631161)) (and (bvsge (index!47867 lt!631161) #b00000000000000000000000000000000) (bvslt (index!47867 lt!631161) (size!47639 a!2831)))) (or (is-Undefined!11368 lt!631161) (ite (is-Found!11368 lt!631161) (= (select (arr!47089 a!2831) (index!47865 lt!631161)) (select (arr!47089 a!2831) j!81)) (ite (is-MissingZero!11368 lt!631161) (= (select (arr!47089 a!2831) (index!47864 lt!631161)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11368 lt!631161) (= (select (arr!47089 a!2831) (index!47867 lt!631161)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!809253 () SeekEntryResult!11368)

(assert (=> d!154115 (= lt!631161 e!809253)))

(declare-fun c!132719 () Bool)

(declare-fun lt!631163 () SeekEntryResult!11368)

(assert (=> d!154115 (= c!132719 (and (is-Intermediate!11368 lt!631163) (undefined!12180 lt!631163)))))

(assert (=> d!154115 (= lt!631163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154115 (validMask!0 mask!2608)))

(assert (=> d!154115 (= (seekEntryOrOpen!0 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!631161)))

(declare-fun b!1433765 () Bool)

(declare-fun c!132720 () Bool)

(declare-fun lt!631162 () (_ BitVec 64))

(assert (=> b!1433765 (= c!132720 (= lt!631162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809255 () SeekEntryResult!11368)

(declare-fun e!809254 () SeekEntryResult!11368)

(assert (=> b!1433765 (= e!809255 e!809254)))

(declare-fun b!1433766 () Bool)

(assert (=> b!1433766 (= e!809253 Undefined!11368)))

(declare-fun b!1433767 () Bool)

(assert (=> b!1433767 (= e!809254 (MissingZero!11368 (index!47866 lt!631163)))))

(declare-fun b!1433768 () Bool)

(assert (=> b!1433768 (= e!809253 e!809255)))

(assert (=> b!1433768 (= lt!631162 (select (arr!47089 a!2831) (index!47866 lt!631163)))))

(declare-fun c!132721 () Bool)

(assert (=> b!1433768 (= c!132721 (= lt!631162 (select (arr!47089 a!2831) j!81)))))

(declare-fun b!1433769 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97567 (_ BitVec 32)) SeekEntryResult!11368)

(assert (=> b!1433769 (= e!809254 (seekKeyOrZeroReturnVacant!0 (x!129507 lt!631163) (index!47866 lt!631163) (index!47866 lt!631163) (select (arr!47089 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433770 () Bool)

(assert (=> b!1433770 (= e!809255 (Found!11368 (index!47866 lt!631163)))))

(assert (= (and d!154115 c!132719) b!1433766))

(assert (= (and d!154115 (not c!132719)) b!1433768))

(assert (= (and b!1433768 c!132721) b!1433770))

(assert (= (and b!1433768 (not c!132721)) b!1433765))

(assert (= (and b!1433765 c!132720) b!1433767))

(assert (= (and b!1433765 (not c!132720)) b!1433769))

(assert (=> d!154115 m!1323329))

(assert (=> d!154115 m!1323349))

(assert (=> d!154115 m!1323333))

(declare-fun m!1323439 () Bool)

(assert (=> d!154115 m!1323439))

(declare-fun m!1323441 () Bool)

(assert (=> d!154115 m!1323441))

(assert (=> d!154115 m!1323349))

(assert (=> d!154115 m!1323329))

(assert (=> d!154115 m!1323351))

(declare-fun m!1323443 () Bool)

(assert (=> d!154115 m!1323443))

(declare-fun m!1323445 () Bool)

(assert (=> b!1433768 m!1323445))

(assert (=> b!1433769 m!1323329))

(declare-fun m!1323447 () Bool)

(assert (=> b!1433769 m!1323447))

(assert (=> b!1433600 d!154115))

(declare-fun d!154127 () Bool)

(declare-fun res!967333 () Bool)

(declare-fun e!809274 () Bool)

(assert (=> d!154127 (=> res!967333 e!809274)))

(assert (=> d!154127 (= res!967333 (bvsge #b00000000000000000000000000000000 (size!47639 a!2831)))))

(assert (=> d!154127 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33596) e!809274)))

(declare-fun b!1433803 () Bool)

(declare-fun e!809277 () Bool)

(assert (=> b!1433803 (= e!809274 e!809277)))

(declare-fun res!967332 () Bool)

(assert (=> b!1433803 (=> (not res!967332) (not e!809277))))

(declare-fun e!809276 () Bool)

(assert (=> b!1433803 (= res!967332 (not e!809276))))

(declare-fun res!967331 () Bool)

(assert (=> b!1433803 (=> (not res!967331) (not e!809276))))

(assert (=> b!1433803 (= res!967331 (validKeyInArray!0 (select (arr!47089 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433804 () Bool)

(declare-fun e!809275 () Bool)

(assert (=> b!1433804 (= e!809277 e!809275)))

(declare-fun c!132734 () Bool)

(assert (=> b!1433804 (= c!132734 (validKeyInArray!0 (select (arr!47089 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433805 () Bool)

(declare-fun contains!9871 (List!33599 (_ BitVec 64)) Bool)

(assert (=> b!1433805 (= e!809276 (contains!9871 Nil!33596 (select (arr!47089 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67508 () Bool)

(declare-fun call!67511 () Bool)

(assert (=> bm!67508 (= call!67511 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132734 (Cons!33595 (select (arr!47089 a!2831) #b00000000000000000000000000000000) Nil!33596) Nil!33596)))))

(declare-fun b!1433806 () Bool)

(assert (=> b!1433806 (= e!809275 call!67511)))

(declare-fun b!1433807 () Bool)

(assert (=> b!1433807 (= e!809275 call!67511)))

(assert (= (and d!154127 (not res!967333)) b!1433803))

(assert (= (and b!1433803 res!967331) b!1433805))

(assert (= (and b!1433803 res!967332) b!1433804))

(assert (= (and b!1433804 c!132734) b!1433806))

(assert (= (and b!1433804 (not c!132734)) b!1433807))

(assert (= (or b!1433806 b!1433807) bm!67508))

(declare-fun m!1323449 () Bool)

(assert (=> b!1433803 m!1323449))

(assert (=> b!1433803 m!1323449))

(declare-fun m!1323451 () Bool)

(assert (=> b!1433803 m!1323451))

(assert (=> b!1433804 m!1323449))

(assert (=> b!1433804 m!1323449))

(assert (=> b!1433804 m!1323451))

(assert (=> b!1433805 m!1323449))

(assert (=> b!1433805 m!1323449))

(declare-fun m!1323453 () Bool)

(assert (=> b!1433805 m!1323453))

(assert (=> bm!67508 m!1323449))

(declare-fun m!1323455 () Bool)

(assert (=> bm!67508 m!1323455))

(assert (=> b!1433602 d!154127))

(declare-fun b!1433839 () Bool)

(declare-fun e!809300 () Bool)

(declare-fun e!809299 () Bool)

(assert (=> b!1433839 (= e!809300 e!809299)))

(declare-fun c!132745 () Bool)

(assert (=> b!1433839 (= c!132745 (validKeyInArray!0 (select (arr!47089 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433840 () Bool)

(declare-fun e!809298 () Bool)

(assert (=> b!1433840 (= e!809299 e!809298)))

(declare-fun lt!631187 () (_ BitVec 64))

(assert (=> b!1433840 (= lt!631187 (select (arr!47089 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631186 () Unit!48482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97567 (_ BitVec 64) (_ BitVec 32)) Unit!48482)

(assert (=> b!1433840 (= lt!631186 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631187 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1433840 (arrayContainsKey!0 a!2831 lt!631187 #b00000000000000000000000000000000)))

(declare-fun lt!631185 () Unit!48482)

(assert (=> b!1433840 (= lt!631185 lt!631186)))

(declare-fun res!967348 () Bool)

(assert (=> b!1433840 (= res!967348 (= (seekEntryOrOpen!0 (select (arr!47089 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11368 #b00000000000000000000000000000000)))))

(assert (=> b!1433840 (=> (not res!967348) (not e!809298))))

(declare-fun d!154129 () Bool)

(declare-fun res!967347 () Bool)

(assert (=> d!154129 (=> res!967347 e!809300)))

(assert (=> d!154129 (= res!967347 (bvsge #b00000000000000000000000000000000 (size!47639 a!2831)))))

(assert (=> d!154129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809300)))

(declare-fun bm!67511 () Bool)

(declare-fun call!67514 () Bool)

(assert (=> bm!67511 (= call!67514 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433841 () Bool)

(assert (=> b!1433841 (= e!809298 call!67514)))

(declare-fun b!1433842 () Bool)

(assert (=> b!1433842 (= e!809299 call!67514)))

(assert (= (and d!154129 (not res!967347)) b!1433839))

(assert (= (and b!1433839 c!132745) b!1433840))

(assert (= (and b!1433839 (not c!132745)) b!1433842))

(assert (= (and b!1433840 res!967348) b!1433841))

(assert (= (or b!1433841 b!1433842) bm!67511))

(assert (=> b!1433839 m!1323449))

(assert (=> b!1433839 m!1323449))

(assert (=> b!1433839 m!1323451))

(assert (=> b!1433840 m!1323449))

(declare-fun m!1323473 () Bool)

(assert (=> b!1433840 m!1323473))

(declare-fun m!1323475 () Bool)

(assert (=> b!1433840 m!1323475))

(assert (=> b!1433840 m!1323449))

(declare-fun m!1323477 () Bool)

(assert (=> b!1433840 m!1323477))

(declare-fun m!1323479 () Bool)

(assert (=> bm!67511 m!1323479))

(assert (=> b!1433601 d!154129))

(declare-fun b!1433843 () Bool)

(declare-fun e!809304 () SeekEntryResult!11368)

(declare-fun e!809302 () SeekEntryResult!11368)

(assert (=> b!1433843 (= e!809304 e!809302)))

(declare-fun c!132748 () Bool)

(declare-fun lt!631189 () (_ BitVec 64))

(assert (=> b!1433843 (= c!132748 (or (= lt!631189 (select (arr!47089 a!2831) j!81)) (= (bvadd lt!631189 lt!631189) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433844 () Bool)

(declare-fun lt!631188 () SeekEntryResult!11368)

(assert (=> b!1433844 (and (bvsge (index!47866 lt!631188) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631188) (size!47639 a!2831)))))

(declare-fun res!967351 () Bool)

(assert (=> b!1433844 (= res!967351 (= (select (arr!47089 a!2831) (index!47866 lt!631188)) (select (arr!47089 a!2831) j!81)))))

(declare-fun e!809303 () Bool)

(assert (=> b!1433844 (=> res!967351 e!809303)))

(declare-fun e!809301 () Bool)

(assert (=> b!1433844 (= e!809301 e!809303)))

(declare-fun b!1433845 () Bool)

(assert (=> b!1433845 (= e!809304 (Intermediate!11368 true (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154135 () Bool)

(declare-fun e!809305 () Bool)

(assert (=> d!154135 e!809305))

(declare-fun c!132746 () Bool)

(assert (=> d!154135 (= c!132746 (and (is-Intermediate!11368 lt!631188) (undefined!12180 lt!631188)))))

(assert (=> d!154135 (= lt!631188 e!809304)))

(declare-fun c!132747 () Bool)

(assert (=> d!154135 (= c!132747 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154135 (= lt!631189 (select (arr!47089 a!2831) (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608)))))

(assert (=> d!154135 (validMask!0 mask!2608)))

(assert (=> d!154135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!631188)))

(declare-fun b!1433846 () Bool)

(assert (=> b!1433846 (= e!809305 e!809301)))

(declare-fun res!967350 () Bool)

(assert (=> b!1433846 (= res!967350 (and (is-Intermediate!11368 lt!631188) (not (undefined!12180 lt!631188)) (bvslt (x!129507 lt!631188) #b01111111111111111111111111111110) (bvsge (x!129507 lt!631188) #b00000000000000000000000000000000) (bvsge (x!129507 lt!631188) #b00000000000000000000000000000000)))))

(assert (=> b!1433846 (=> (not res!967350) (not e!809301))))

(declare-fun b!1433847 () Bool)

(assert (=> b!1433847 (= e!809302 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433848 () Bool)

(assert (=> b!1433848 (and (bvsge (index!47866 lt!631188) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631188) (size!47639 a!2831)))))

(declare-fun res!967349 () Bool)

(assert (=> b!1433848 (= res!967349 (= (select (arr!47089 a!2831) (index!47866 lt!631188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433848 (=> res!967349 e!809303)))

(declare-fun b!1433849 () Bool)

(assert (=> b!1433849 (= e!809305 (bvsge (x!129507 lt!631188) #b01111111111111111111111111111110))))

(declare-fun b!1433850 () Bool)

(assert (=> b!1433850 (= e!809302 (Intermediate!11368 false (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433851 () Bool)

(assert (=> b!1433851 (and (bvsge (index!47866 lt!631188) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631188) (size!47639 a!2831)))))

(assert (=> b!1433851 (= e!809303 (= (select (arr!47089 a!2831) (index!47866 lt!631188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154135 c!132747) b!1433845))

(assert (= (and d!154135 (not c!132747)) b!1433843))

(assert (= (and b!1433843 c!132748) b!1433850))

(assert (= (and b!1433843 (not c!132748)) b!1433847))

(assert (= (and d!154135 c!132746) b!1433849))

(assert (= (and d!154135 (not c!132746)) b!1433846))

(assert (= (and b!1433846 res!967350) b!1433844))

(assert (= (and b!1433844 (not res!967351)) b!1433848))

(assert (= (and b!1433848 (not res!967349)) b!1433851))

(assert (=> d!154135 m!1323349))

(declare-fun m!1323481 () Bool)

(assert (=> d!154135 m!1323481))

(assert (=> d!154135 m!1323333))

(assert (=> b!1433847 m!1323349))

(declare-fun m!1323483 () Bool)

(assert (=> b!1433847 m!1323483))

(assert (=> b!1433847 m!1323483))

(assert (=> b!1433847 m!1323329))

(declare-fun m!1323485 () Bool)

(assert (=> b!1433847 m!1323485))

(declare-fun m!1323487 () Bool)

(assert (=> b!1433848 m!1323487))

(assert (=> b!1433851 m!1323487))

(assert (=> b!1433844 m!1323487))

(assert (=> b!1433603 d!154135))

(declare-fun d!154137 () Bool)

(declare-fun lt!631201 () (_ BitVec 32))

(declare-fun lt!631200 () (_ BitVec 32))

(assert (=> d!154137 (= lt!631201 (bvmul (bvxor lt!631200 (bvlshr lt!631200 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154137 (= lt!631200 ((_ extract 31 0) (bvand (bvxor (select (arr!47089 a!2831) j!81) (bvlshr (select (arr!47089 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154137 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967352 (let ((h!34923 ((_ extract 31 0) (bvand (bvxor (select (arr!47089 a!2831) j!81) (bvlshr (select (arr!47089 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129513 (bvmul (bvxor h!34923 (bvlshr h!34923 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129513 (bvlshr x!129513 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967352 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967352 #b00000000000000000000000000000000))))))

(assert (=> d!154137 (= (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (bvand (bvxor lt!631201 (bvlshr lt!631201 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1433603 d!154137))

(declare-fun d!154139 () Bool)

(assert (=> d!154139 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123652 d!154139))

(declare-fun d!154147 () Bool)

(assert (=> d!154147 (= (array_inv!36117 a!2831) (bvsge (size!47639 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123652 d!154147))

(declare-fun d!154149 () Bool)

(assert (=> d!154149 (= (validKeyInArray!0 (select (arr!47089 a!2831) j!81)) (and (not (= (select (arr!47089 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47089 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433606 d!154149))

(declare-fun b!1433882 () Bool)

(declare-fun e!809327 () Bool)

(declare-fun e!809326 () Bool)

(assert (=> b!1433882 (= e!809327 e!809326)))

(declare-fun c!132758 () Bool)

(assert (=> b!1433882 (= c!132758 (validKeyInArray!0 (select (arr!47089 a!2831) j!81)))))

(declare-fun b!1433883 () Bool)

(declare-fun e!809325 () Bool)

(assert (=> b!1433883 (= e!809326 e!809325)))

(declare-fun lt!631211 () (_ BitVec 64))

(assert (=> b!1433883 (= lt!631211 (select (arr!47089 a!2831) j!81))))

(declare-fun lt!631210 () Unit!48482)

(assert (=> b!1433883 (= lt!631210 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631211 j!81))))

(assert (=> b!1433883 (arrayContainsKey!0 a!2831 lt!631211 #b00000000000000000000000000000000)))

(declare-fun lt!631209 () Unit!48482)

(assert (=> b!1433883 (= lt!631209 lt!631210)))

(declare-fun res!967367 () Bool)

(assert (=> b!1433883 (= res!967367 (= (seekEntryOrOpen!0 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) (Found!11368 j!81)))))

(assert (=> b!1433883 (=> (not res!967367) (not e!809325))))

(declare-fun d!154151 () Bool)

(declare-fun res!967366 () Bool)

(assert (=> d!154151 (=> res!967366 e!809327)))

(assert (=> d!154151 (= res!967366 (bvsge j!81 (size!47639 a!2831)))))

(assert (=> d!154151 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809327)))

(declare-fun call!67518 () Bool)

(declare-fun bm!67515 () Bool)

(assert (=> bm!67515 (= call!67518 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433884 () Bool)

(assert (=> b!1433884 (= e!809325 call!67518)))

(declare-fun b!1433885 () Bool)

(assert (=> b!1433885 (= e!809326 call!67518)))

(assert (= (and d!154151 (not res!967366)) b!1433882))

(assert (= (and b!1433882 c!132758) b!1433883))

(assert (= (and b!1433882 (not c!132758)) b!1433885))

(assert (= (and b!1433883 res!967367) b!1433884))

(assert (= (or b!1433884 b!1433885) bm!67515))

(assert (=> b!1433882 m!1323329))

(assert (=> b!1433882 m!1323329))

(assert (=> b!1433882 m!1323361))

(assert (=> b!1433883 m!1323329))

(declare-fun m!1323509 () Bool)

(assert (=> b!1433883 m!1323509))

(declare-fun m!1323511 () Bool)

(assert (=> b!1433883 m!1323511))

(assert (=> b!1433883 m!1323329))

(assert (=> b!1433883 m!1323331))

(declare-fun m!1323513 () Bool)

(assert (=> bm!67515 m!1323513))

(assert (=> b!1433595 d!154151))

(declare-fun d!154153 () Bool)

(assert (=> d!154153 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631224 () Unit!48482)

(declare-fun choose!38 (array!97567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48482)

(assert (=> d!154153 (= lt!631224 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154153 (validMask!0 mask!2608)))

(assert (=> d!154153 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631224)))

(declare-fun bs!41746 () Bool)

(assert (= bs!41746 d!154153))

(assert (=> bs!41746 m!1323345))

(declare-fun m!1323523 () Bool)

(assert (=> bs!41746 m!1323523))

(assert (=> bs!41746 m!1323333))

(assert (=> b!1433595 d!154153))

(declare-fun d!154163 () Bool)

(declare-fun lt!631227 () (_ BitVec 32))

(assert (=> d!154163 (and (bvsge lt!631227 #b00000000000000000000000000000000) (bvslt lt!631227 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154163 (= lt!631227 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154163 (validMask!0 mask!2608)))

(assert (=> d!154163 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631227)))

(declare-fun bs!41747 () Bool)

(assert (= bs!41747 d!154163))

(declare-fun m!1323525 () Bool)

(assert (=> bs!41747 m!1323525))

(assert (=> bs!41747 m!1323333))

(assert (=> b!1433605 d!154163))

(declare-fun d!154165 () Bool)

(assert (=> d!154165 (= (validKeyInArray!0 (select (arr!47089 a!2831) i!982)) (and (not (= (select (arr!47089 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47089 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433596 d!154165))

(declare-fun b!1433895 () Bool)

(declare-fun e!809336 () SeekEntryResult!11368)

(declare-fun e!809334 () SeekEntryResult!11368)

(assert (=> b!1433895 (= e!809336 e!809334)))

(declare-fun lt!631229 () (_ BitVec 64))

(declare-fun c!132764 () Bool)

(assert (=> b!1433895 (= c!132764 (or (= lt!631229 (select (arr!47089 a!2831) j!81)) (= (bvadd lt!631229 lt!631229) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433896 () Bool)

(declare-fun lt!631228 () SeekEntryResult!11368)

(assert (=> b!1433896 (and (bvsge (index!47866 lt!631228) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631228) (size!47639 a!2831)))))

(declare-fun res!967373 () Bool)

(assert (=> b!1433896 (= res!967373 (= (select (arr!47089 a!2831) (index!47866 lt!631228)) (select (arr!47089 a!2831) j!81)))))

(declare-fun e!809335 () Bool)

(assert (=> b!1433896 (=> res!967373 e!809335)))

(declare-fun e!809333 () Bool)

(assert (=> b!1433896 (= e!809333 e!809335)))

(declare-fun b!1433897 () Bool)

(assert (=> b!1433897 (= e!809336 (Intermediate!11368 true index!585 x!605))))

(declare-fun d!154167 () Bool)

(declare-fun e!809337 () Bool)

(assert (=> d!154167 e!809337))

(declare-fun c!132762 () Bool)

(assert (=> d!154167 (= c!132762 (and (is-Intermediate!11368 lt!631228) (undefined!12180 lt!631228)))))

(assert (=> d!154167 (= lt!631228 e!809336)))

(declare-fun c!132763 () Bool)

(assert (=> d!154167 (= c!132763 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154167 (= lt!631229 (select (arr!47089 a!2831) index!585))))

(assert (=> d!154167 (validMask!0 mask!2608)))

(assert (=> d!154167 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!631228)))

(declare-fun b!1433898 () Bool)

(assert (=> b!1433898 (= e!809337 e!809333)))

(declare-fun res!967372 () Bool)

(assert (=> b!1433898 (= res!967372 (and (is-Intermediate!11368 lt!631228) (not (undefined!12180 lt!631228)) (bvslt (x!129507 lt!631228) #b01111111111111111111111111111110) (bvsge (x!129507 lt!631228) #b00000000000000000000000000000000) (bvsge (x!129507 lt!631228) x!605)))))

(assert (=> b!1433898 (=> (not res!967372) (not e!809333))))

(declare-fun b!1433899 () Bool)

(assert (=> b!1433899 (= e!809334 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433900 () Bool)

(assert (=> b!1433900 (and (bvsge (index!47866 lt!631228) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631228) (size!47639 a!2831)))))

(declare-fun res!967371 () Bool)

(assert (=> b!1433900 (= res!967371 (= (select (arr!47089 a!2831) (index!47866 lt!631228)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433900 (=> res!967371 e!809335)))

(declare-fun b!1433901 () Bool)

(assert (=> b!1433901 (= e!809337 (bvsge (x!129507 lt!631228) #b01111111111111111111111111111110))))

(declare-fun b!1433902 () Bool)

(assert (=> b!1433902 (= e!809334 (Intermediate!11368 false index!585 x!605))))

(declare-fun b!1433903 () Bool)

(assert (=> b!1433903 (and (bvsge (index!47866 lt!631228) #b00000000000000000000000000000000) (bvslt (index!47866 lt!631228) (size!47639 a!2831)))))

