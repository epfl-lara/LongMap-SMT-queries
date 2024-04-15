; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123284 () Bool)

(assert start!123284)

(declare-fun b!1429797 () Bool)

(declare-fun res!964479 () Bool)

(declare-fun e!807271 () Bool)

(assert (=> b!1429797 (=> (not res!964479) (not e!807271))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97398 0))(
  ( (array!97399 (arr!47011 (Array (_ BitVec 32) (_ BitVec 64))) (size!47563 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97398)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429797 (= res!964479 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47563 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47563 a!2831))))))

(declare-fun b!1429798 () Bool)

(declare-fun res!964485 () Bool)

(assert (=> b!1429798 (=> (not res!964485) (not e!807271))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97398 (_ BitVec 32)) Bool)

(assert (=> b!1429798 (= res!964485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429799 () Bool)

(declare-fun res!964482 () Bool)

(declare-fun e!807268 () Bool)

(assert (=> b!1429799 (=> (not res!964482) (not e!807268))))

(declare-datatypes ((SeekEntryResult!11317 0))(
  ( (MissingZero!11317 (index!47660 (_ BitVec 32))) (Found!11317 (index!47661 (_ BitVec 32))) (Intermediate!11317 (undefined!12129 Bool) (index!47662 (_ BitVec 32)) (x!129284 (_ BitVec 32))) (Undefined!11317) (MissingVacant!11317 (index!47663 (_ BitVec 32))) )
))
(declare-fun lt!629347 () SeekEntryResult!11317)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97398 (_ BitVec 32)) SeekEntryResult!11317)

(assert (=> b!1429799 (= res!964482 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!629347))))

(declare-fun b!1429800 () Bool)

(declare-fun e!807272 () Bool)

(assert (=> b!1429800 (= e!807271 e!807272)))

(declare-fun res!964480 () Bool)

(assert (=> b!1429800 (=> (not res!964480) (not e!807272))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429800 (= res!964480 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!629347))))

(assert (=> b!1429800 (= lt!629347 (Intermediate!11317 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429801 () Bool)

(declare-fun res!964484 () Bool)

(assert (=> b!1429801 (=> (not res!964484) (not e!807268))))

(declare-fun lt!629348 () array!97398)

(declare-fun lt!629344 () (_ BitVec 64))

(declare-fun lt!629346 () SeekEntryResult!11317)

(assert (=> b!1429801 (= res!964484 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629344 lt!629348 mask!2608) lt!629346))))

(declare-fun b!1429802 () Bool)

(declare-fun res!964488 () Bool)

(assert (=> b!1429802 (=> (not res!964488) (not e!807271))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429802 (= res!964488 (and (= (size!47563 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47563 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47563 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!964478 () Bool)

(assert (=> start!123284 (=> (not res!964478) (not e!807271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123284 (= res!964478 (validMask!0 mask!2608))))

(assert (=> start!123284 e!807271))

(assert (=> start!123284 true))

(declare-fun array_inv!36244 (array!97398) Bool)

(assert (=> start!123284 (array_inv!36244 a!2831)))

(declare-fun b!1429803 () Bool)

(declare-fun res!964483 () Bool)

(assert (=> b!1429803 (=> (not res!964483) (not e!807268))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429803 (= res!964483 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429804 () Bool)

(declare-fun res!964486 () Bool)

(assert (=> b!1429804 (=> (not res!964486) (not e!807271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429804 (= res!964486 (validKeyInArray!0 (select (arr!47011 a!2831) i!982)))))

(declare-fun b!1429805 () Bool)

(assert (=> b!1429805 (= e!807268 (not (or (= (select (arr!47011 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47011 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47011 a!2831) index!585) (select (arr!47011 a!2831) j!81)) (not (= (select (store (arr!47011 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13))))))

(declare-fun e!807269 () Bool)

(assert (=> b!1429805 e!807269))

(declare-fun res!964477 () Bool)

(assert (=> b!1429805 (=> (not res!964477) (not e!807269))))

(assert (=> b!1429805 (= res!964477 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48219 0))(
  ( (Unit!48220) )
))
(declare-fun lt!629345 () Unit!48219)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48219)

(assert (=> b!1429805 (= lt!629345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429806 () Bool)

(assert (=> b!1429806 (= e!807272 e!807268)))

(declare-fun res!964487 () Bool)

(assert (=> b!1429806 (=> (not res!964487) (not e!807268))))

(assert (=> b!1429806 (= res!964487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629344 mask!2608) lt!629344 lt!629348 mask!2608) lt!629346))))

(assert (=> b!1429806 (= lt!629346 (Intermediate!11317 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429806 (= lt!629344 (select (store (arr!47011 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429806 (= lt!629348 (array!97399 (store (arr!47011 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47563 a!2831)))))

(declare-fun b!1429807 () Bool)

(declare-fun res!964481 () Bool)

(assert (=> b!1429807 (=> (not res!964481) (not e!807271))))

(assert (=> b!1429807 (= res!964481 (validKeyInArray!0 (select (arr!47011 a!2831) j!81)))))

(declare-fun b!1429808 () Bool)

(declare-fun res!964489 () Bool)

(assert (=> b!1429808 (=> (not res!964489) (not e!807271))))

(declare-datatypes ((List!33599 0))(
  ( (Nil!33596) (Cons!33595 (h!34909 (_ BitVec 64)) (t!48285 List!33599)) )
))
(declare-fun arrayNoDuplicates!0 (array!97398 (_ BitVec 32) List!33599) Bool)

(assert (=> b!1429808 (= res!964489 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33596))))

(declare-fun b!1429809 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97398 (_ BitVec 32)) SeekEntryResult!11317)

(assert (=> b!1429809 (= e!807269 (= (seekEntryOrOpen!0 (select (arr!47011 a!2831) j!81) a!2831 mask!2608) (Found!11317 j!81)))))

(assert (= (and start!123284 res!964478) b!1429802))

(assert (= (and b!1429802 res!964488) b!1429804))

(assert (= (and b!1429804 res!964486) b!1429807))

(assert (= (and b!1429807 res!964481) b!1429798))

(assert (= (and b!1429798 res!964485) b!1429808))

(assert (= (and b!1429808 res!964489) b!1429797))

(assert (= (and b!1429797 res!964479) b!1429800))

(assert (= (and b!1429800 res!964480) b!1429806))

(assert (= (and b!1429806 res!964487) b!1429799))

(assert (= (and b!1429799 res!964482) b!1429801))

(assert (= (and b!1429801 res!964484) b!1429803))

(assert (= (and b!1429803 res!964483) b!1429805))

(assert (= (and b!1429805 res!964477) b!1429809))

(declare-fun m!1319415 () Bool)

(assert (=> b!1429809 m!1319415))

(assert (=> b!1429809 m!1319415))

(declare-fun m!1319417 () Bool)

(assert (=> b!1429809 m!1319417))

(declare-fun m!1319419 () Bool)

(assert (=> b!1429806 m!1319419))

(assert (=> b!1429806 m!1319419))

(declare-fun m!1319421 () Bool)

(assert (=> b!1429806 m!1319421))

(declare-fun m!1319423 () Bool)

(assert (=> b!1429806 m!1319423))

(declare-fun m!1319425 () Bool)

(assert (=> b!1429806 m!1319425))

(assert (=> b!1429800 m!1319415))

(assert (=> b!1429800 m!1319415))

(declare-fun m!1319427 () Bool)

(assert (=> b!1429800 m!1319427))

(assert (=> b!1429800 m!1319427))

(assert (=> b!1429800 m!1319415))

(declare-fun m!1319429 () Bool)

(assert (=> b!1429800 m!1319429))

(assert (=> b!1429799 m!1319415))

(assert (=> b!1429799 m!1319415))

(declare-fun m!1319431 () Bool)

(assert (=> b!1429799 m!1319431))

(declare-fun m!1319433 () Bool)

(assert (=> b!1429804 m!1319433))

(assert (=> b!1429804 m!1319433))

(declare-fun m!1319435 () Bool)

(assert (=> b!1429804 m!1319435))

(declare-fun m!1319437 () Bool)

(assert (=> b!1429801 m!1319437))

(declare-fun m!1319439 () Bool)

(assert (=> b!1429798 m!1319439))

(assert (=> b!1429807 m!1319415))

(assert (=> b!1429807 m!1319415))

(declare-fun m!1319441 () Bool)

(assert (=> b!1429807 m!1319441))

(assert (=> b!1429805 m!1319423))

(declare-fun m!1319443 () Bool)

(assert (=> b!1429805 m!1319443))

(declare-fun m!1319445 () Bool)

(assert (=> b!1429805 m!1319445))

(declare-fun m!1319447 () Bool)

(assert (=> b!1429805 m!1319447))

(assert (=> b!1429805 m!1319415))

(declare-fun m!1319449 () Bool)

(assert (=> b!1429805 m!1319449))

(declare-fun m!1319451 () Bool)

(assert (=> start!123284 m!1319451))

(declare-fun m!1319453 () Bool)

(assert (=> start!123284 m!1319453))

(declare-fun m!1319455 () Bool)

(assert (=> b!1429808 m!1319455))

(check-sat (not start!123284) (not b!1429808) (not b!1429809) (not b!1429799) (not b!1429805) (not b!1429804) (not b!1429801) (not b!1429806) (not b!1429798) (not b!1429807) (not b!1429800))
(check-sat)
(get-model)

(declare-fun b!1429906 () Bool)

(declare-fun e!807315 () SeekEntryResult!11317)

(declare-fun e!807317 () SeekEntryResult!11317)

(assert (=> b!1429906 (= e!807315 e!807317)))

(declare-fun c!132163 () Bool)

(declare-fun lt!629384 () (_ BitVec 64))

(assert (=> b!1429906 (= c!132163 (or (= lt!629384 lt!629344) (= (bvadd lt!629384 lt!629384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429907 () Bool)

(declare-fun e!807314 () Bool)

(declare-fun lt!629383 () SeekEntryResult!11317)

(assert (=> b!1429907 (= e!807314 (bvsge (x!129284 lt!629383) #b01111111111111111111111111111110))))

(declare-fun b!1429908 () Bool)

(assert (=> b!1429908 (= e!807317 (Intermediate!11317 false index!585 x!605))))

(declare-fun b!1429909 () Bool)

(assert (=> b!1429909 (and (bvsge (index!47662 lt!629383) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629383) (size!47563 lt!629348)))))

(declare-fun res!964575 () Bool)

(assert (=> b!1429909 (= res!964575 (= (select (arr!47011 lt!629348) (index!47662 lt!629383)) lt!629344))))

(declare-fun e!807316 () Bool)

(assert (=> b!1429909 (=> res!964575 e!807316)))

(declare-fun e!807313 () Bool)

(assert (=> b!1429909 (= e!807313 e!807316)))

(declare-fun b!1429910 () Bool)

(assert (=> b!1429910 (and (bvsge (index!47662 lt!629383) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629383) (size!47563 lt!629348)))))

(assert (=> b!1429910 (= e!807316 (= (select (arr!47011 lt!629348) (index!47662 lt!629383)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153443 () Bool)

(assert (=> d!153443 e!807314))

(declare-fun c!132162 () Bool)

(get-info :version)

(assert (=> d!153443 (= c!132162 (and ((_ is Intermediate!11317) lt!629383) (undefined!12129 lt!629383)))))

(assert (=> d!153443 (= lt!629383 e!807315)))

(declare-fun c!132161 () Bool)

(assert (=> d!153443 (= c!132161 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153443 (= lt!629384 (select (arr!47011 lt!629348) index!585))))

(assert (=> d!153443 (validMask!0 mask!2608)))

(assert (=> d!153443 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629344 lt!629348 mask!2608) lt!629383)))

(declare-fun b!1429911 () Bool)

(assert (=> b!1429911 (= e!807314 e!807313)))

(declare-fun res!964574 () Bool)

(assert (=> b!1429911 (= res!964574 (and ((_ is Intermediate!11317) lt!629383) (not (undefined!12129 lt!629383)) (bvslt (x!129284 lt!629383) #b01111111111111111111111111111110) (bvsge (x!129284 lt!629383) #b00000000000000000000000000000000) (bvsge (x!129284 lt!629383) x!605)))))

(assert (=> b!1429911 (=> (not res!964574) (not e!807313))))

(declare-fun b!1429912 () Bool)

(assert (=> b!1429912 (= e!807315 (Intermediate!11317 true index!585 x!605))))

(declare-fun b!1429913 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429913 (= e!807317 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629344 lt!629348 mask!2608))))

(declare-fun b!1429914 () Bool)

(assert (=> b!1429914 (and (bvsge (index!47662 lt!629383) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629383) (size!47563 lt!629348)))))

(declare-fun res!964576 () Bool)

(assert (=> b!1429914 (= res!964576 (= (select (arr!47011 lt!629348) (index!47662 lt!629383)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429914 (=> res!964576 e!807316)))

(assert (= (and d!153443 c!132161) b!1429912))

(assert (= (and d!153443 (not c!132161)) b!1429906))

(assert (= (and b!1429906 c!132163) b!1429908))

(assert (= (and b!1429906 (not c!132163)) b!1429913))

(assert (= (and d!153443 c!132162) b!1429907))

(assert (= (and d!153443 (not c!132162)) b!1429911))

(assert (= (and b!1429911 res!964574) b!1429909))

(assert (= (and b!1429909 (not res!964575)) b!1429914))

(assert (= (and b!1429914 (not res!964576)) b!1429910))

(declare-fun m!1319541 () Bool)

(assert (=> b!1429914 m!1319541))

(declare-fun m!1319543 () Bool)

(assert (=> b!1429913 m!1319543))

(assert (=> b!1429913 m!1319543))

(declare-fun m!1319545 () Bool)

(assert (=> b!1429913 m!1319545))

(declare-fun m!1319547 () Bool)

(assert (=> d!153443 m!1319547))

(assert (=> d!153443 m!1319451))

(assert (=> b!1429910 m!1319541))

(assert (=> b!1429909 m!1319541))

(assert (=> b!1429801 d!153443))

(declare-fun b!1429915 () Bool)

(declare-fun e!807320 () SeekEntryResult!11317)

(declare-fun e!807322 () SeekEntryResult!11317)

(assert (=> b!1429915 (= e!807320 e!807322)))

(declare-fun c!132166 () Bool)

(declare-fun lt!629386 () (_ BitVec 64))

(assert (=> b!1429915 (= c!132166 (or (= lt!629386 lt!629344) (= (bvadd lt!629386 lt!629386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429916 () Bool)

(declare-fun e!807319 () Bool)

(declare-fun lt!629385 () SeekEntryResult!11317)

(assert (=> b!1429916 (= e!807319 (bvsge (x!129284 lt!629385) #b01111111111111111111111111111110))))

(declare-fun b!1429917 () Bool)

(assert (=> b!1429917 (= e!807322 (Intermediate!11317 false (toIndex!0 lt!629344 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1429918 () Bool)

(assert (=> b!1429918 (and (bvsge (index!47662 lt!629385) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629385) (size!47563 lt!629348)))))

(declare-fun res!964578 () Bool)

(assert (=> b!1429918 (= res!964578 (= (select (arr!47011 lt!629348) (index!47662 lt!629385)) lt!629344))))

(declare-fun e!807321 () Bool)

(assert (=> b!1429918 (=> res!964578 e!807321)))

(declare-fun e!807318 () Bool)

(assert (=> b!1429918 (= e!807318 e!807321)))

(declare-fun b!1429919 () Bool)

(assert (=> b!1429919 (and (bvsge (index!47662 lt!629385) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629385) (size!47563 lt!629348)))))

(assert (=> b!1429919 (= e!807321 (= (select (arr!47011 lt!629348) (index!47662 lt!629385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153445 () Bool)

(assert (=> d!153445 e!807319))

(declare-fun c!132165 () Bool)

(assert (=> d!153445 (= c!132165 (and ((_ is Intermediate!11317) lt!629385) (undefined!12129 lt!629385)))))

(assert (=> d!153445 (= lt!629385 e!807320)))

(declare-fun c!132164 () Bool)

(assert (=> d!153445 (= c!132164 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153445 (= lt!629386 (select (arr!47011 lt!629348) (toIndex!0 lt!629344 mask!2608)))))

(assert (=> d!153445 (validMask!0 mask!2608)))

(assert (=> d!153445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629344 mask!2608) lt!629344 lt!629348 mask!2608) lt!629385)))

(declare-fun b!1429920 () Bool)

(assert (=> b!1429920 (= e!807319 e!807318)))

(declare-fun res!964577 () Bool)

(assert (=> b!1429920 (= res!964577 (and ((_ is Intermediate!11317) lt!629385) (not (undefined!12129 lt!629385)) (bvslt (x!129284 lt!629385) #b01111111111111111111111111111110) (bvsge (x!129284 lt!629385) #b00000000000000000000000000000000) (bvsge (x!129284 lt!629385) #b00000000000000000000000000000000)))))

(assert (=> b!1429920 (=> (not res!964577) (not e!807318))))

(declare-fun b!1429921 () Bool)

(assert (=> b!1429921 (= e!807320 (Intermediate!11317 true (toIndex!0 lt!629344 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1429922 () Bool)

(assert (=> b!1429922 (= e!807322 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629344 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629344 lt!629348 mask!2608))))

(declare-fun b!1429923 () Bool)

(assert (=> b!1429923 (and (bvsge (index!47662 lt!629385) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629385) (size!47563 lt!629348)))))

(declare-fun res!964579 () Bool)

(assert (=> b!1429923 (= res!964579 (= (select (arr!47011 lt!629348) (index!47662 lt!629385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429923 (=> res!964579 e!807321)))

(assert (= (and d!153445 c!132164) b!1429921))

(assert (= (and d!153445 (not c!132164)) b!1429915))

(assert (= (and b!1429915 c!132166) b!1429917))

(assert (= (and b!1429915 (not c!132166)) b!1429922))

(assert (= (and d!153445 c!132165) b!1429916))

(assert (= (and d!153445 (not c!132165)) b!1429920))

(assert (= (and b!1429920 res!964577) b!1429918))

(assert (= (and b!1429918 (not res!964578)) b!1429923))

(assert (= (and b!1429923 (not res!964579)) b!1429919))

(declare-fun m!1319549 () Bool)

(assert (=> b!1429923 m!1319549))

(assert (=> b!1429922 m!1319419))

(declare-fun m!1319551 () Bool)

(assert (=> b!1429922 m!1319551))

(assert (=> b!1429922 m!1319551))

(declare-fun m!1319553 () Bool)

(assert (=> b!1429922 m!1319553))

(assert (=> d!153445 m!1319419))

(declare-fun m!1319555 () Bool)

(assert (=> d!153445 m!1319555))

(assert (=> d!153445 m!1319451))

(assert (=> b!1429919 m!1319549))

(assert (=> b!1429918 m!1319549))

(assert (=> b!1429806 d!153445))

(declare-fun d!153447 () Bool)

(declare-fun lt!629392 () (_ BitVec 32))

(declare-fun lt!629391 () (_ BitVec 32))

(assert (=> d!153447 (= lt!629392 (bvmul (bvxor lt!629391 (bvlshr lt!629391 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153447 (= lt!629391 ((_ extract 31 0) (bvand (bvxor lt!629344 (bvlshr lt!629344 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153447 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964580 (let ((h!34912 ((_ extract 31 0) (bvand (bvxor lt!629344 (bvlshr lt!629344 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129288 (bvmul (bvxor h!34912 (bvlshr h!34912 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129288 (bvlshr x!129288 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964580 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964580 #b00000000000000000000000000000000))))))

(assert (=> d!153447 (= (toIndex!0 lt!629344 mask!2608) (bvand (bvxor lt!629392 (bvlshr lt!629392 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429806 d!153447))

(declare-fun b!1429932 () Bool)

(declare-fun e!807329 () Bool)

(declare-fun call!67388 () Bool)

(assert (=> b!1429932 (= e!807329 call!67388)))

(declare-fun b!1429933 () Bool)

(declare-fun e!807330 () Bool)

(assert (=> b!1429933 (= e!807330 e!807329)))

(declare-fun lt!629400 () (_ BitVec 64))

(assert (=> b!1429933 (= lt!629400 (select (arr!47011 a!2831) j!81))))

(declare-fun lt!629401 () Unit!48219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97398 (_ BitVec 64) (_ BitVec 32)) Unit!48219)

(assert (=> b!1429933 (= lt!629401 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629400 j!81))))

(declare-fun arrayContainsKey!0 (array!97398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1429933 (arrayContainsKey!0 a!2831 lt!629400 #b00000000000000000000000000000000)))

(declare-fun lt!629399 () Unit!48219)

(assert (=> b!1429933 (= lt!629399 lt!629401)))

(declare-fun res!964586 () Bool)

(assert (=> b!1429933 (= res!964586 (= (seekEntryOrOpen!0 (select (arr!47011 a!2831) j!81) a!2831 mask!2608) (Found!11317 j!81)))))

(assert (=> b!1429933 (=> (not res!964586) (not e!807329))))

(declare-fun bm!67385 () Bool)

(assert (=> bm!67385 (= call!67388 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153451 () Bool)

(declare-fun res!964585 () Bool)

(declare-fun e!807331 () Bool)

(assert (=> d!153451 (=> res!964585 e!807331)))

(assert (=> d!153451 (= res!964585 (bvsge j!81 (size!47563 a!2831)))))

(assert (=> d!153451 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807331)))

(declare-fun b!1429934 () Bool)

(assert (=> b!1429934 (= e!807331 e!807330)))

(declare-fun c!132169 () Bool)

(assert (=> b!1429934 (= c!132169 (validKeyInArray!0 (select (arr!47011 a!2831) j!81)))))

(declare-fun b!1429935 () Bool)

(assert (=> b!1429935 (= e!807330 call!67388)))

(assert (= (and d!153451 (not res!964585)) b!1429934))

(assert (= (and b!1429934 c!132169) b!1429933))

(assert (= (and b!1429934 (not c!132169)) b!1429935))

(assert (= (and b!1429933 res!964586) b!1429932))

(assert (= (or b!1429932 b!1429935) bm!67385))

(assert (=> b!1429933 m!1319415))

(declare-fun m!1319557 () Bool)

(assert (=> b!1429933 m!1319557))

(declare-fun m!1319559 () Bool)

(assert (=> b!1429933 m!1319559))

(assert (=> b!1429933 m!1319415))

(assert (=> b!1429933 m!1319417))

(declare-fun m!1319561 () Bool)

(assert (=> bm!67385 m!1319561))

(assert (=> b!1429934 m!1319415))

(assert (=> b!1429934 m!1319415))

(assert (=> b!1429934 m!1319441))

(assert (=> b!1429805 d!153451))

(declare-fun d!153457 () Bool)

(assert (=> d!153457 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629408 () Unit!48219)

(declare-fun choose!38 (array!97398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48219)

(assert (=> d!153457 (= lt!629408 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153457 (validMask!0 mask!2608)))

(assert (=> d!153457 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629408)))

(declare-fun bs!41632 () Bool)

(assert (= bs!41632 d!153457))

(assert (=> bs!41632 m!1319447))

(declare-fun m!1319563 () Bool)

(assert (=> bs!41632 m!1319563))

(assert (=> bs!41632 m!1319451))

(assert (=> b!1429805 d!153457))

(declare-fun b!1429946 () Bool)

(declare-fun e!807338 () SeekEntryResult!11317)

(declare-fun e!807340 () SeekEntryResult!11317)

(assert (=> b!1429946 (= e!807338 e!807340)))

(declare-fun c!132176 () Bool)

(declare-fun lt!629410 () (_ BitVec 64))

(assert (=> b!1429946 (= c!132176 (or (= lt!629410 (select (arr!47011 a!2831) j!81)) (= (bvadd lt!629410 lt!629410) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429947 () Bool)

(declare-fun e!807337 () Bool)

(declare-fun lt!629409 () SeekEntryResult!11317)

(assert (=> b!1429947 (= e!807337 (bvsge (x!129284 lt!629409) #b01111111111111111111111111111110))))

(declare-fun b!1429948 () Bool)

(assert (=> b!1429948 (= e!807340 (Intermediate!11317 false (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1429949 () Bool)

(assert (=> b!1429949 (and (bvsge (index!47662 lt!629409) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629409) (size!47563 a!2831)))))

(declare-fun res!964588 () Bool)

(assert (=> b!1429949 (= res!964588 (= (select (arr!47011 a!2831) (index!47662 lt!629409)) (select (arr!47011 a!2831) j!81)))))

(declare-fun e!807339 () Bool)

(assert (=> b!1429949 (=> res!964588 e!807339)))

(declare-fun e!807336 () Bool)

(assert (=> b!1429949 (= e!807336 e!807339)))

(declare-fun b!1429950 () Bool)

(assert (=> b!1429950 (and (bvsge (index!47662 lt!629409) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629409) (size!47563 a!2831)))))

(assert (=> b!1429950 (= e!807339 (= (select (arr!47011 a!2831) (index!47662 lt!629409)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153459 () Bool)

(assert (=> d!153459 e!807337))

(declare-fun c!132175 () Bool)

(assert (=> d!153459 (= c!132175 (and ((_ is Intermediate!11317) lt!629409) (undefined!12129 lt!629409)))))

(assert (=> d!153459 (= lt!629409 e!807338)))

(declare-fun c!132174 () Bool)

(assert (=> d!153459 (= c!132174 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153459 (= lt!629410 (select (arr!47011 a!2831) (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608)))))

(assert (=> d!153459 (validMask!0 mask!2608)))

(assert (=> d!153459 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!629409)))

(declare-fun b!1429951 () Bool)

(assert (=> b!1429951 (= e!807337 e!807336)))

(declare-fun res!964587 () Bool)

(assert (=> b!1429951 (= res!964587 (and ((_ is Intermediate!11317) lt!629409) (not (undefined!12129 lt!629409)) (bvslt (x!129284 lt!629409) #b01111111111111111111111111111110) (bvsge (x!129284 lt!629409) #b00000000000000000000000000000000) (bvsge (x!129284 lt!629409) #b00000000000000000000000000000000)))))

(assert (=> b!1429951 (=> (not res!964587) (not e!807336))))

(declare-fun b!1429952 () Bool)

(assert (=> b!1429952 (= e!807338 (Intermediate!11317 true (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1429953 () Bool)

(assert (=> b!1429953 (= e!807340 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47011 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1429954 () Bool)

(assert (=> b!1429954 (and (bvsge (index!47662 lt!629409) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629409) (size!47563 a!2831)))))

(declare-fun res!964589 () Bool)

(assert (=> b!1429954 (= res!964589 (= (select (arr!47011 a!2831) (index!47662 lt!629409)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429954 (=> res!964589 e!807339)))

(assert (= (and d!153459 c!132174) b!1429952))

(assert (= (and d!153459 (not c!132174)) b!1429946))

(assert (= (and b!1429946 c!132176) b!1429948))

(assert (= (and b!1429946 (not c!132176)) b!1429953))

(assert (= (and d!153459 c!132175) b!1429947))

(assert (= (and d!153459 (not c!132175)) b!1429951))

(assert (= (and b!1429951 res!964587) b!1429949))

(assert (= (and b!1429949 (not res!964588)) b!1429954))

(assert (= (and b!1429954 (not res!964589)) b!1429950))

(declare-fun m!1319565 () Bool)

(assert (=> b!1429954 m!1319565))

(assert (=> b!1429953 m!1319427))

(declare-fun m!1319567 () Bool)

(assert (=> b!1429953 m!1319567))

(assert (=> b!1429953 m!1319567))

(assert (=> b!1429953 m!1319415))

(declare-fun m!1319569 () Bool)

(assert (=> b!1429953 m!1319569))

(assert (=> d!153459 m!1319427))

(declare-fun m!1319571 () Bool)

(assert (=> d!153459 m!1319571))

(assert (=> d!153459 m!1319451))

(assert (=> b!1429950 m!1319565))

(assert (=> b!1429949 m!1319565))

(assert (=> b!1429800 d!153459))

(declare-fun d!153461 () Bool)

(declare-fun lt!629412 () (_ BitVec 32))

(declare-fun lt!629411 () (_ BitVec 32))

(assert (=> d!153461 (= lt!629412 (bvmul (bvxor lt!629411 (bvlshr lt!629411 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153461 (= lt!629411 ((_ extract 31 0) (bvand (bvxor (select (arr!47011 a!2831) j!81) (bvlshr (select (arr!47011 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153461 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964580 (let ((h!34912 ((_ extract 31 0) (bvand (bvxor (select (arr!47011 a!2831) j!81) (bvlshr (select (arr!47011 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129288 (bvmul (bvxor h!34912 (bvlshr h!34912 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129288 (bvlshr x!129288 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964580 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964580 #b00000000000000000000000000000000))))))

(assert (=> d!153461 (= (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) (bvand (bvxor lt!629412 (bvlshr lt!629412 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429800 d!153461))

(declare-fun b!1429967 () Bool)

(declare-fun e!807351 () SeekEntryResult!11317)

(declare-fun e!807353 () SeekEntryResult!11317)

(assert (=> b!1429967 (= e!807351 e!807353)))

(declare-fun c!132183 () Bool)

(declare-fun lt!629418 () (_ BitVec 64))

(assert (=> b!1429967 (= c!132183 (or (= lt!629418 (select (arr!47011 a!2831) j!81)) (= (bvadd lt!629418 lt!629418) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429968 () Bool)

(declare-fun e!807350 () Bool)

(declare-fun lt!629417 () SeekEntryResult!11317)

(assert (=> b!1429968 (= e!807350 (bvsge (x!129284 lt!629417) #b01111111111111111111111111111110))))

(declare-fun b!1429969 () Bool)

(assert (=> b!1429969 (= e!807353 (Intermediate!11317 false index!585 x!605))))

(declare-fun b!1429970 () Bool)

(assert (=> b!1429970 (and (bvsge (index!47662 lt!629417) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629417) (size!47563 a!2831)))))

(declare-fun res!964597 () Bool)

(assert (=> b!1429970 (= res!964597 (= (select (arr!47011 a!2831) (index!47662 lt!629417)) (select (arr!47011 a!2831) j!81)))))

(declare-fun e!807352 () Bool)

(assert (=> b!1429970 (=> res!964597 e!807352)))

(declare-fun e!807349 () Bool)

(assert (=> b!1429970 (= e!807349 e!807352)))

(declare-fun b!1429971 () Bool)

(assert (=> b!1429971 (and (bvsge (index!47662 lt!629417) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629417) (size!47563 a!2831)))))

(assert (=> b!1429971 (= e!807352 (= (select (arr!47011 a!2831) (index!47662 lt!629417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153463 () Bool)

(assert (=> d!153463 e!807350))

(declare-fun c!132182 () Bool)

(assert (=> d!153463 (= c!132182 (and ((_ is Intermediate!11317) lt!629417) (undefined!12129 lt!629417)))))

(assert (=> d!153463 (= lt!629417 e!807351)))

(declare-fun c!132181 () Bool)

(assert (=> d!153463 (= c!132181 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153463 (= lt!629418 (select (arr!47011 a!2831) index!585))))

(assert (=> d!153463 (validMask!0 mask!2608)))

(assert (=> d!153463 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!629417)))

(declare-fun b!1429972 () Bool)

(assert (=> b!1429972 (= e!807350 e!807349)))

(declare-fun res!964596 () Bool)

(assert (=> b!1429972 (= res!964596 (and ((_ is Intermediate!11317) lt!629417) (not (undefined!12129 lt!629417)) (bvslt (x!129284 lt!629417) #b01111111111111111111111111111110) (bvsge (x!129284 lt!629417) #b00000000000000000000000000000000) (bvsge (x!129284 lt!629417) x!605)))))

(assert (=> b!1429972 (=> (not res!964596) (not e!807349))))

(declare-fun b!1429973 () Bool)

(assert (=> b!1429973 (= e!807351 (Intermediate!11317 true index!585 x!605))))

(declare-fun b!1429974 () Bool)

(assert (=> b!1429974 (= e!807353 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47011 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1429975 () Bool)

(assert (=> b!1429975 (and (bvsge (index!47662 lt!629417) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629417) (size!47563 a!2831)))))

(declare-fun res!964598 () Bool)

(assert (=> b!1429975 (= res!964598 (= (select (arr!47011 a!2831) (index!47662 lt!629417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429975 (=> res!964598 e!807352)))

(assert (= (and d!153463 c!132181) b!1429973))

(assert (= (and d!153463 (not c!132181)) b!1429967))

(assert (= (and b!1429967 c!132183) b!1429969))

(assert (= (and b!1429967 (not c!132183)) b!1429974))

(assert (= (and d!153463 c!132182) b!1429968))

(assert (= (and d!153463 (not c!132182)) b!1429972))

(assert (= (and b!1429972 res!964596) b!1429970))

(assert (= (and b!1429970 (not res!964597)) b!1429975))

(assert (= (and b!1429975 (not res!964598)) b!1429971))

(declare-fun m!1319573 () Bool)

(assert (=> b!1429975 m!1319573))

(assert (=> b!1429974 m!1319543))

(assert (=> b!1429974 m!1319543))

(assert (=> b!1429974 m!1319415))

(declare-fun m!1319575 () Bool)

(assert (=> b!1429974 m!1319575))

(assert (=> d!153463 m!1319445))

(assert (=> d!153463 m!1319451))

(assert (=> b!1429971 m!1319573))

(assert (=> b!1429970 m!1319573))

(assert (=> b!1429799 d!153463))

(declare-fun b!1430037 () Bool)

(declare-fun e!807389 () SeekEntryResult!11317)

(declare-fun e!807390 () SeekEntryResult!11317)

(assert (=> b!1430037 (= e!807389 e!807390)))

(declare-fun lt!629449 () (_ BitVec 64))

(declare-fun lt!629450 () SeekEntryResult!11317)

(assert (=> b!1430037 (= lt!629449 (select (arr!47011 a!2831) (index!47662 lt!629450)))))

(declare-fun c!132205 () Bool)

(assert (=> b!1430037 (= c!132205 (= lt!629449 (select (arr!47011 a!2831) j!81)))))

(declare-fun b!1430038 () Bool)

(assert (=> b!1430038 (= e!807389 Undefined!11317)))

(declare-fun d!153465 () Bool)

(declare-fun lt!629451 () SeekEntryResult!11317)

(assert (=> d!153465 (and (or ((_ is Undefined!11317) lt!629451) (not ((_ is Found!11317) lt!629451)) (and (bvsge (index!47661 lt!629451) #b00000000000000000000000000000000) (bvslt (index!47661 lt!629451) (size!47563 a!2831)))) (or ((_ is Undefined!11317) lt!629451) ((_ is Found!11317) lt!629451) (not ((_ is MissingZero!11317) lt!629451)) (and (bvsge (index!47660 lt!629451) #b00000000000000000000000000000000) (bvslt (index!47660 lt!629451) (size!47563 a!2831)))) (or ((_ is Undefined!11317) lt!629451) ((_ is Found!11317) lt!629451) ((_ is MissingZero!11317) lt!629451) (not ((_ is MissingVacant!11317) lt!629451)) (and (bvsge (index!47663 lt!629451) #b00000000000000000000000000000000) (bvslt (index!47663 lt!629451) (size!47563 a!2831)))) (or ((_ is Undefined!11317) lt!629451) (ite ((_ is Found!11317) lt!629451) (= (select (arr!47011 a!2831) (index!47661 lt!629451)) (select (arr!47011 a!2831) j!81)) (ite ((_ is MissingZero!11317) lt!629451) (= (select (arr!47011 a!2831) (index!47660 lt!629451)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11317) lt!629451) (= (select (arr!47011 a!2831) (index!47663 lt!629451)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153465 (= lt!629451 e!807389)))

(declare-fun c!132207 () Bool)

(assert (=> d!153465 (= c!132207 (and ((_ is Intermediate!11317) lt!629450) (undefined!12129 lt!629450)))))

(assert (=> d!153465 (= lt!629450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) (select (arr!47011 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153465 (validMask!0 mask!2608)))

(assert (=> d!153465 (= (seekEntryOrOpen!0 (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!629451)))

(declare-fun b!1430039 () Bool)

(declare-fun c!132206 () Bool)

(assert (=> b!1430039 (= c!132206 (= lt!629449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807391 () SeekEntryResult!11317)

(assert (=> b!1430039 (= e!807390 e!807391)))

(declare-fun b!1430040 () Bool)

(assert (=> b!1430040 (= e!807391 (MissingZero!11317 (index!47662 lt!629450)))))

(declare-fun b!1430041 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97398 (_ BitVec 32)) SeekEntryResult!11317)

(assert (=> b!1430041 (= e!807391 (seekKeyOrZeroReturnVacant!0 (x!129284 lt!629450) (index!47662 lt!629450) (index!47662 lt!629450) (select (arr!47011 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430042 () Bool)

(assert (=> b!1430042 (= e!807390 (Found!11317 (index!47662 lt!629450)))))

(assert (= (and d!153465 c!132207) b!1430038))

(assert (= (and d!153465 (not c!132207)) b!1430037))

(assert (= (and b!1430037 c!132205) b!1430042))

(assert (= (and b!1430037 (not c!132205)) b!1430039))

(assert (= (and b!1430039 c!132206) b!1430040))

(assert (= (and b!1430039 (not c!132206)) b!1430041))

(declare-fun m!1319599 () Bool)

(assert (=> b!1430037 m!1319599))

(assert (=> d!153465 m!1319451))

(assert (=> d!153465 m!1319415))

(assert (=> d!153465 m!1319427))

(declare-fun m!1319601 () Bool)

(assert (=> d!153465 m!1319601))

(declare-fun m!1319603 () Bool)

(assert (=> d!153465 m!1319603))

(assert (=> d!153465 m!1319427))

(assert (=> d!153465 m!1319415))

(assert (=> d!153465 m!1319429))

(declare-fun m!1319605 () Bool)

(assert (=> d!153465 m!1319605))

(assert (=> b!1430041 m!1319415))

(declare-fun m!1319607 () Bool)

(assert (=> b!1430041 m!1319607))

(assert (=> b!1429809 d!153465))

(declare-fun d!153479 () Bool)

(assert (=> d!153479 (= (validKeyInArray!0 (select (arr!47011 a!2831) i!982)) (and (not (= (select (arr!47011 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47011 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429804 d!153479))

(declare-fun b!1430047 () Bool)

(declare-fun e!807395 () Bool)

(declare-fun call!67392 () Bool)

(assert (=> b!1430047 (= e!807395 call!67392)))

(declare-fun b!1430048 () Bool)

(declare-fun e!807396 () Bool)

(assert (=> b!1430048 (= e!807396 e!807395)))

(declare-fun lt!629456 () (_ BitVec 64))

(assert (=> b!1430048 (= lt!629456 (select (arr!47011 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629457 () Unit!48219)

(assert (=> b!1430048 (= lt!629457 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629456 #b00000000000000000000000000000000))))

(assert (=> b!1430048 (arrayContainsKey!0 a!2831 lt!629456 #b00000000000000000000000000000000)))

(declare-fun lt!629455 () Unit!48219)

(assert (=> b!1430048 (= lt!629455 lt!629457)))

(declare-fun res!964623 () Bool)

(assert (=> b!1430048 (= res!964623 (= (seekEntryOrOpen!0 (select (arr!47011 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11317 #b00000000000000000000000000000000)))))

(assert (=> b!1430048 (=> (not res!964623) (not e!807395))))

(declare-fun bm!67389 () Bool)

(assert (=> bm!67389 (= call!67392 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153481 () Bool)

(declare-fun res!964622 () Bool)

(declare-fun e!807397 () Bool)

(assert (=> d!153481 (=> res!964622 e!807397)))

(assert (=> d!153481 (= res!964622 (bvsge #b00000000000000000000000000000000 (size!47563 a!2831)))))

(assert (=> d!153481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807397)))

(declare-fun b!1430049 () Bool)

(assert (=> b!1430049 (= e!807397 e!807396)))

(declare-fun c!132209 () Bool)

(assert (=> b!1430049 (= c!132209 (validKeyInArray!0 (select (arr!47011 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430050 () Bool)

(assert (=> b!1430050 (= e!807396 call!67392)))

(assert (= (and d!153481 (not res!964622)) b!1430049))

(assert (= (and b!1430049 c!132209) b!1430048))

(assert (= (and b!1430049 (not c!132209)) b!1430050))

(assert (= (and b!1430048 res!964623) b!1430047))

(assert (= (or b!1430047 b!1430050) bm!67389))

(declare-fun m!1319615 () Bool)

(assert (=> b!1430048 m!1319615))

(declare-fun m!1319617 () Bool)

(assert (=> b!1430048 m!1319617))

(declare-fun m!1319619 () Bool)

(assert (=> b!1430048 m!1319619))

(assert (=> b!1430048 m!1319615))

(declare-fun m!1319621 () Bool)

(assert (=> b!1430048 m!1319621))

(declare-fun m!1319623 () Bool)

(assert (=> bm!67389 m!1319623))

(assert (=> b!1430049 m!1319615))

(assert (=> b!1430049 m!1319615))

(declare-fun m!1319625 () Bool)

(assert (=> b!1430049 m!1319625))

(assert (=> b!1429798 d!153481))

(declare-fun d!153485 () Bool)

(assert (=> d!153485 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123284 d!153485))

(declare-fun d!153499 () Bool)

(assert (=> d!153499 (= (array_inv!36244 a!2831) (bvsge (size!47563 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123284 d!153499))

(declare-fun b!1430140 () Bool)

(declare-fun e!807459 () Bool)

(declare-fun e!807457 () Bool)

(assert (=> b!1430140 (= e!807459 e!807457)))

(declare-fun c!132237 () Bool)

(assert (=> b!1430140 (= c!132237 (validKeyInArray!0 (select (arr!47011 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430141 () Bool)

(declare-fun call!67402 () Bool)

(assert (=> b!1430141 (= e!807457 call!67402)))

(declare-fun b!1430142 () Bool)

(assert (=> b!1430142 (= e!807457 call!67402)))

(declare-fun b!1430143 () Bool)

(declare-fun e!807458 () Bool)

(assert (=> b!1430143 (= e!807458 e!807459)))

(declare-fun res!964661 () Bool)

(assert (=> b!1430143 (=> (not res!964661) (not e!807459))))

(declare-fun e!807460 () Bool)

(assert (=> b!1430143 (= res!964661 (not e!807460))))

(declare-fun res!964659 () Bool)

(assert (=> b!1430143 (=> (not res!964659) (not e!807460))))

(assert (=> b!1430143 (= res!964659 (validKeyInArray!0 (select (arr!47011 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430144 () Bool)

(declare-fun contains!9819 (List!33599 (_ BitVec 64)) Bool)

(assert (=> b!1430144 (= e!807460 (contains!9819 Nil!33596 (select (arr!47011 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67399 () Bool)

(assert (=> bm!67399 (= call!67402 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132237 (Cons!33595 (select (arr!47011 a!2831) #b00000000000000000000000000000000) Nil!33596) Nil!33596)))))

(declare-fun d!153501 () Bool)

(declare-fun res!964660 () Bool)

(assert (=> d!153501 (=> res!964660 e!807458)))

(assert (=> d!153501 (= res!964660 (bvsge #b00000000000000000000000000000000 (size!47563 a!2831)))))

(assert (=> d!153501 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33596) e!807458)))

(assert (= (and d!153501 (not res!964660)) b!1430143))

(assert (= (and b!1430143 res!964659) b!1430144))

(assert (= (and b!1430143 res!964661) b!1430140))

(assert (= (and b!1430140 c!132237) b!1430141))

(assert (= (and b!1430140 (not c!132237)) b!1430142))

(assert (= (or b!1430141 b!1430142) bm!67399))

(assert (=> b!1430140 m!1319615))

(assert (=> b!1430140 m!1319615))

(assert (=> b!1430140 m!1319625))

(assert (=> b!1430143 m!1319615))

(assert (=> b!1430143 m!1319615))

(assert (=> b!1430143 m!1319625))

(assert (=> b!1430144 m!1319615))

(assert (=> b!1430144 m!1319615))

(declare-fun m!1319683 () Bool)

(assert (=> b!1430144 m!1319683))

(assert (=> bm!67399 m!1319615))

(declare-fun m!1319685 () Bool)

(assert (=> bm!67399 m!1319685))

(assert (=> b!1429808 d!153501))

(declare-fun d!153511 () Bool)

(assert (=> d!153511 (= (validKeyInArray!0 (select (arr!47011 a!2831) j!81)) (and (not (= (select (arr!47011 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47011 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429807 d!153511))

(check-sat (not b!1429933) (not b!1430143) (not b!1430049) (not b!1430144) (not b!1429974) (not d!153465) (not bm!67385) (not b!1429922) (not d!153443) (not b!1430048) (not b!1430041) (not d!153463) (not b!1429913) (not b!1429953) (not d!153459) (not d!153457) (not d!153445) (not bm!67389) (not b!1430140) (not b!1429934) (not bm!67399))
(check-sat)
