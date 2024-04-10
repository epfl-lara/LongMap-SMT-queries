; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57606 () Bool)

(assert start!57606)

(declare-fun b!636991 () Bool)

(declare-fun res!412111 () Bool)

(declare-fun e!364452 () Bool)

(assert (=> b!636991 (=> res!412111 e!364452)))

(declare-datatypes ((List!12391 0))(
  ( (Nil!12388) (Cons!12387 (h!13432 (_ BitVec 64)) (t!18619 List!12391)) )
))
(declare-fun noDuplicate!383 (List!12391) Bool)

(assert (=> b!636991 (= res!412111 (not (noDuplicate!383 Nil!12388)))))

(declare-fun b!636992 () Bool)

(declare-fun e!364450 () Bool)

(declare-fun e!364447 () Bool)

(assert (=> b!636992 (= e!364450 e!364447)))

(declare-fun res!412113 () Bool)

(assert (=> b!636992 (=> res!412113 e!364447)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!294535 () (_ BitVec 64))

(declare-fun lt!294540 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38252 0))(
  ( (array!38253 (arr!18350 (Array (_ BitVec 32) (_ BitVec 64))) (size!18714 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38252)

(assert (=> b!636992 (= res!412113 (or (not (= (select (arr!18350 a!2986) j!136) lt!294540)) (not (= (select (arr!18350 a!2986) j!136) lt!294535)) (bvsge j!136 index!984)))))

(declare-fun b!636993 () Bool)

(declare-fun res!412114 () Bool)

(declare-fun e!364456 () Bool)

(assert (=> b!636993 (=> (not res!412114) (not e!364456))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636993 (= res!412114 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!412121 () Bool)

(assert (=> start!57606 (=> (not res!412121) (not e!364456))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57606 (= res!412121 (validMask!0 mask!3053))))

(assert (=> start!57606 e!364456))

(assert (=> start!57606 true))

(declare-fun array_inv!14146 (array!38252) Bool)

(assert (=> start!57606 (array_inv!14146 a!2986)))

(declare-fun b!636994 () Bool)

(declare-fun res!412108 () Bool)

(declare-fun e!364458 () Bool)

(assert (=> b!636994 (=> (not res!412108) (not e!364458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38252 (_ BitVec 32)) Bool)

(assert (=> b!636994 (= res!412108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!636995 () Bool)

(declare-fun e!364448 () Bool)

(declare-fun e!364455 () Bool)

(assert (=> b!636995 (= e!364448 e!364455)))

(declare-fun res!412124 () Bool)

(assert (=> b!636995 (=> res!412124 e!364455)))

(assert (=> b!636995 (= res!412124 (or (not (= (select (arr!18350 a!2986) j!136) lt!294540)) (not (= (select (arr!18350 a!2986) j!136) lt!294535)) (bvsge j!136 index!984)))))

(assert (=> b!636995 e!364450))

(declare-fun res!412125 () Bool)

(assert (=> b!636995 (=> (not res!412125) (not e!364450))))

(assert (=> b!636995 (= res!412125 (= lt!294535 (select (arr!18350 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!636995 (= lt!294535 (select (store (arr!18350 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!636996 () Bool)

(declare-fun e!364451 () Bool)

(assert (=> b!636996 (= e!364451 (not e!364448))))

(declare-fun res!412110 () Bool)

(assert (=> b!636996 (=> res!412110 e!364448)))

(declare-datatypes ((SeekEntryResult!6790 0))(
  ( (MissingZero!6790 (index!29471 (_ BitVec 32))) (Found!6790 (index!29472 (_ BitVec 32))) (Intermediate!6790 (undefined!7602 Bool) (index!29473 (_ BitVec 32)) (x!58223 (_ BitVec 32))) (Undefined!6790) (MissingVacant!6790 (index!29474 (_ BitVec 32))) )
))
(declare-fun lt!294543 () SeekEntryResult!6790)

(assert (=> b!636996 (= res!412110 (not (= lt!294543 (Found!6790 index!984))))))

(declare-datatypes ((Unit!21494 0))(
  ( (Unit!21495) )
))
(declare-fun lt!294544 () Unit!21494)

(declare-fun e!364454 () Unit!21494)

(assert (=> b!636996 (= lt!294544 e!364454)))

(declare-fun c!72809 () Bool)

(assert (=> b!636996 (= c!72809 (= lt!294543 Undefined!6790))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!294539 () array!38252)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38252 (_ BitVec 32)) SeekEntryResult!6790)

(assert (=> b!636996 (= lt!294543 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294540 lt!294539 mask!3053))))

(declare-fun e!364449 () Bool)

(assert (=> b!636996 e!364449))

(declare-fun res!412123 () Bool)

(assert (=> b!636996 (=> (not res!412123) (not e!364449))))

(declare-fun lt!294542 () SeekEntryResult!6790)

(declare-fun lt!294537 () (_ BitVec 32))

(assert (=> b!636996 (= res!412123 (= lt!294542 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294537 vacantSpotIndex!68 lt!294540 lt!294539 mask!3053)))))

(assert (=> b!636996 (= lt!294542 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294537 vacantSpotIndex!68 (select (arr!18350 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636996 (= lt!294540 (select (store (arr!18350 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294538 () Unit!21494)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38252 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21494)

(assert (=> b!636996 (= lt!294538 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294537 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636996 (= lt!294537 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!636997 () Bool)

(declare-fun res!412126 () Bool)

(assert (=> b!636997 (=> res!412126 e!364452)))

(declare-fun contains!3105 (List!12391 (_ BitVec 64)) Bool)

(assert (=> b!636997 (= res!412126 (contains!3105 Nil!12388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636998 () Bool)

(declare-fun res!412119 () Bool)

(assert (=> b!636998 (=> (not res!412119) (not e!364458))))

(assert (=> b!636998 (= res!412119 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18350 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636999 () Bool)

(declare-fun Unit!21496 () Unit!21494)

(assert (=> b!636999 (= e!364454 Unit!21496)))

(assert (=> b!636999 false))

(declare-fun b!637000 () Bool)

(assert (=> b!637000 (= e!364452 (not (contains!3105 Nil!12388 k!1786)))))

(declare-fun e!364457 () Bool)

(declare-fun b!637001 () Bool)

(assert (=> b!637001 (= e!364457 (arrayContainsKey!0 lt!294539 (select (arr!18350 a!2986) j!136) index!984))))

(declare-fun b!637002 () Bool)

(declare-fun res!412120 () Bool)

(assert (=> b!637002 (=> (not res!412120) (not e!364456))))

(assert (=> b!637002 (= res!412120 (and (= (size!18714 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18714 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18714 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637003 () Bool)

(declare-fun res!412122 () Bool)

(assert (=> b!637003 (=> (not res!412122) (not e!364456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637003 (= res!412122 (validKeyInArray!0 k!1786))))

(declare-fun b!637004 () Bool)

(declare-fun e!364453 () Bool)

(assert (=> b!637004 (= e!364458 e!364453)))

(declare-fun res!412112 () Bool)

(assert (=> b!637004 (=> (not res!412112) (not e!364453))))

(assert (=> b!637004 (= res!412112 (= (select (store (arr!18350 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637004 (= lt!294539 (array!38253 (store (arr!18350 a!2986) i!1108 k!1786) (size!18714 a!2986)))))

(declare-fun b!637005 () Bool)

(declare-fun Unit!21497 () Unit!21494)

(assert (=> b!637005 (= e!364454 Unit!21497)))

(declare-fun b!637006 () Bool)

(declare-fun res!412118 () Bool)

(assert (=> b!637006 (=> (not res!412118) (not e!364458))))

(declare-fun arrayNoDuplicates!0 (array!38252 (_ BitVec 32) List!12391) Bool)

(assert (=> b!637006 (= res!412118 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12388))))

(declare-fun b!637007 () Bool)

(assert (=> b!637007 (= e!364447 e!364457)))

(declare-fun res!412109 () Bool)

(assert (=> b!637007 (=> (not res!412109) (not e!364457))))

(assert (=> b!637007 (= res!412109 (arrayContainsKey!0 lt!294539 (select (arr!18350 a!2986) j!136) j!136))))

(declare-fun b!637008 () Bool)

(declare-fun lt!294534 () SeekEntryResult!6790)

(assert (=> b!637008 (= e!364449 (= lt!294534 lt!294542))))

(declare-fun b!637009 () Bool)

(assert (=> b!637009 (= e!364456 e!364458)))

(declare-fun res!412107 () Bool)

(assert (=> b!637009 (=> (not res!412107) (not e!364458))))

(declare-fun lt!294541 () SeekEntryResult!6790)

(assert (=> b!637009 (= res!412107 (or (= lt!294541 (MissingZero!6790 i!1108)) (= lt!294541 (MissingVacant!6790 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38252 (_ BitVec 32)) SeekEntryResult!6790)

(assert (=> b!637009 (= lt!294541 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!637010 () Bool)

(declare-fun res!412116 () Bool)

(assert (=> b!637010 (=> (not res!412116) (not e!364456))))

(assert (=> b!637010 (= res!412116 (validKeyInArray!0 (select (arr!18350 a!2986) j!136)))))

(declare-fun b!637011 () Bool)

(declare-fun res!412117 () Bool)

(assert (=> b!637011 (=> res!412117 e!364452)))

(assert (=> b!637011 (= res!412117 (contains!3105 Nil!12388 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637012 () Bool)

(assert (=> b!637012 (= e!364455 e!364452)))

(declare-fun res!412115 () Bool)

(assert (=> b!637012 (=> res!412115 e!364452)))

(assert (=> b!637012 (= res!412115 (or (bvsge (size!18714 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18714 a!2986))))))

(assert (=> b!637012 (arrayContainsKey!0 lt!294539 (select (arr!18350 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294536 () Unit!21494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38252 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21494)

(assert (=> b!637012 (= lt!294536 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294539 (select (arr!18350 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637013 () Bool)

(assert (=> b!637013 (= e!364453 e!364451)))

(declare-fun res!412127 () Bool)

(assert (=> b!637013 (=> (not res!412127) (not e!364451))))

(assert (=> b!637013 (= res!412127 (and (= lt!294534 (Found!6790 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18350 a!2986) index!984) (select (arr!18350 a!2986) j!136))) (not (= (select (arr!18350 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!637013 (= lt!294534 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18350 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57606 res!412121) b!637002))

(assert (= (and b!637002 res!412120) b!637010))

(assert (= (and b!637010 res!412116) b!637003))

(assert (= (and b!637003 res!412122) b!636993))

(assert (= (and b!636993 res!412114) b!637009))

(assert (= (and b!637009 res!412107) b!636994))

(assert (= (and b!636994 res!412108) b!637006))

(assert (= (and b!637006 res!412118) b!636998))

(assert (= (and b!636998 res!412119) b!637004))

(assert (= (and b!637004 res!412112) b!637013))

(assert (= (and b!637013 res!412127) b!636996))

(assert (= (and b!636996 res!412123) b!637008))

(assert (= (and b!636996 c!72809) b!636999))

(assert (= (and b!636996 (not c!72809)) b!637005))

(assert (= (and b!636996 (not res!412110)) b!636995))

(assert (= (and b!636995 res!412125) b!636992))

(assert (= (and b!636992 (not res!412113)) b!637007))

(assert (= (and b!637007 res!412109) b!637001))

(assert (= (and b!636995 (not res!412124)) b!637012))

(assert (= (and b!637012 (not res!412115)) b!636991))

(assert (= (and b!636991 (not res!412111)) b!636997))

(assert (= (and b!636997 (not res!412126)) b!637011))

(assert (= (and b!637011 (not res!412117)) b!637000))

(declare-fun m!611125 () Bool)

(assert (=> b!637006 m!611125))

(declare-fun m!611127 () Bool)

(assert (=> b!636996 m!611127))

(declare-fun m!611129 () Bool)

(assert (=> b!636996 m!611129))

(declare-fun m!611131 () Bool)

(assert (=> b!636996 m!611131))

(declare-fun m!611133 () Bool)

(assert (=> b!636996 m!611133))

(declare-fun m!611135 () Bool)

(assert (=> b!636996 m!611135))

(declare-fun m!611137 () Bool)

(assert (=> b!636996 m!611137))

(assert (=> b!636996 m!611131))

(declare-fun m!611139 () Bool)

(assert (=> b!636996 m!611139))

(declare-fun m!611141 () Bool)

(assert (=> b!636996 m!611141))

(assert (=> b!637001 m!611131))

(assert (=> b!637001 m!611131))

(declare-fun m!611143 () Bool)

(assert (=> b!637001 m!611143))

(declare-fun m!611145 () Bool)

(assert (=> b!636997 m!611145))

(declare-fun m!611147 () Bool)

(assert (=> start!57606 m!611147))

(declare-fun m!611149 () Bool)

(assert (=> start!57606 m!611149))

(declare-fun m!611151 () Bool)

(assert (=> b!636991 m!611151))

(declare-fun m!611153 () Bool)

(assert (=> b!636998 m!611153))

(assert (=> b!637012 m!611131))

(assert (=> b!637012 m!611131))

(declare-fun m!611155 () Bool)

(assert (=> b!637012 m!611155))

(assert (=> b!637012 m!611131))

(declare-fun m!611157 () Bool)

(assert (=> b!637012 m!611157))

(declare-fun m!611159 () Bool)

(assert (=> b!636994 m!611159))

(assert (=> b!636992 m!611131))

(assert (=> b!637010 m!611131))

(assert (=> b!637010 m!611131))

(declare-fun m!611161 () Bool)

(assert (=> b!637010 m!611161))

(assert (=> b!636995 m!611131))

(assert (=> b!636995 m!611135))

(declare-fun m!611163 () Bool)

(assert (=> b!636995 m!611163))

(declare-fun m!611165 () Bool)

(assert (=> b!637000 m!611165))

(assert (=> b!637007 m!611131))

(assert (=> b!637007 m!611131))

(declare-fun m!611167 () Bool)

(assert (=> b!637007 m!611167))

(declare-fun m!611169 () Bool)

(assert (=> b!637013 m!611169))

(assert (=> b!637013 m!611131))

(assert (=> b!637013 m!611131))

(declare-fun m!611171 () Bool)

(assert (=> b!637013 m!611171))

(assert (=> b!637004 m!611135))

(declare-fun m!611173 () Bool)

(assert (=> b!637004 m!611173))

(declare-fun m!611175 () Bool)

(assert (=> b!637009 m!611175))

(declare-fun m!611177 () Bool)

(assert (=> b!637011 m!611177))

(declare-fun m!611179 () Bool)

(assert (=> b!637003 m!611179))

(declare-fun m!611181 () Bool)

(assert (=> b!636993 m!611181))

(push 1)

(assert (not b!637007))

(assert (not b!637012))

(assert (not b!636991))

(assert (not b!637013))

(assert (not b!636996))

(assert (not b!637006))

(assert (not b!637009))

(assert (not b!637000))

(assert (not b!636993))

(assert (not b!636997))

(assert (not b!637011))

(assert (not b!637003))

(assert (not b!636994))

(assert (not b!637010))

(assert (not start!57606))

(assert (not b!637001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90091 () Bool)

(declare-fun res!412149 () Bool)

(declare-fun e!364495 () Bool)

(assert (=> d!90091 (=> res!412149 e!364495)))

(assert (=> d!90091 (= res!412149 (= (select (arr!18350 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!90091 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!364495)))

(declare-fun b!637065 () Bool)

(declare-fun e!364496 () Bool)

(assert (=> b!637065 (= e!364495 e!364496)))

(declare-fun res!412150 () Bool)

(assert (=> b!637065 (=> (not res!412150) (not e!364496))))

(assert (=> b!637065 (= res!412150 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18714 a!2986)))))

(declare-fun b!637066 () Bool)

(assert (=> b!637066 (= e!364496 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90091 (not res!412149)) b!637065))

(assert (= (and b!637065 res!412150) b!637066))

(declare-fun m!611231 () Bool)

(assert (=> d!90091 m!611231))

(declare-fun m!611233 () Bool)

(assert (=> b!637066 m!611233))

(assert (=> b!636993 d!90091))

(declare-fun b!637111 () Bool)

(declare-fun e!364534 () Bool)

(declare-fun call!33458 () Bool)

(assert (=> b!637111 (= e!364534 call!33458)))

(declare-fun b!637112 () Bool)

(declare-fun e!364535 () Bool)

(assert (=> b!637112 (= e!364535 call!33458)))

(declare-fun bm!33455 () Bool)

(assert (=> bm!33455 (= call!33458 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!90095 () Bool)

(declare-fun res!412180 () Bool)

(declare-fun e!364533 () Bool)

(assert (=> d!90095 (=> res!412180 e!364533)))

(assert (=> d!90095 (= res!412180 (bvsge #b00000000000000000000000000000000 (size!18714 a!2986)))))

(assert (=> d!90095 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!364533)))

(declare-fun b!637113 () Bool)

(assert (=> b!637113 (= e!364533 e!364534)))

(declare-fun c!72833 () Bool)

(assert (=> b!637113 (= c!72833 (validKeyInArray!0 (select (arr!18350 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!637114 () Bool)

(assert (=> b!637114 (= e!364534 e!364535)))

(declare-fun lt!294577 () (_ BitVec 64))

(assert (=> b!637114 (= lt!294577 (select (arr!18350 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294576 () Unit!21494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38252 (_ BitVec 64) (_ BitVec 32)) Unit!21494)

(assert (=> b!637114 (= lt!294576 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294577 #b00000000000000000000000000000000))))

(assert (=> b!637114 (arrayContainsKey!0 a!2986 lt!294577 #b00000000000000000000000000000000)))

(declare-fun lt!294578 () Unit!21494)

(assert (=> b!637114 (= lt!294578 lt!294576)))

(declare-fun res!412179 () Bool)

(assert (=> b!637114 (= res!412179 (= (seekEntryOrOpen!0 (select (arr!18350 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6790 #b00000000000000000000000000000000)))))

(assert (=> b!637114 (=> (not res!412179) (not e!364535))))

(assert (= (and d!90095 (not res!412180)) b!637113))

(assert (= (and b!637113 c!72833) b!637114))

(assert (= (and b!637113 (not c!72833)) b!637111))

(assert (= (and b!637114 res!412179) b!637112))

(assert (= (or b!637112 b!637111) bm!33455))

(declare-fun m!611257 () Bool)

(assert (=> bm!33455 m!611257))

(assert (=> b!637113 m!611231))

(assert (=> b!637113 m!611231))

(declare-fun m!611259 () Bool)

(assert (=> b!637113 m!611259))

(assert (=> b!637114 m!611231))

(declare-fun m!611261 () Bool)

(assert (=> b!637114 m!611261))

(declare-fun m!611263 () Bool)

(assert (=> b!637114 m!611263))

(assert (=> b!637114 m!611231))

(declare-fun m!611265 () Bool)

(assert (=> b!637114 m!611265))

(assert (=> b!636994 d!90095))

(declare-fun d!90105 () Bool)

(declare-fun res!412181 () Bool)

(declare-fun e!364536 () Bool)

(assert (=> d!90105 (=> res!412181 e!364536)))

(assert (=> d!90105 (= res!412181 (= (select (arr!18350 lt!294539) index!984) (select (arr!18350 a!2986) j!136)))))

(assert (=> d!90105 (= (arrayContainsKey!0 lt!294539 (select (arr!18350 a!2986) j!136) index!984) e!364536)))

(declare-fun b!637115 () Bool)

(declare-fun e!364537 () Bool)

(assert (=> b!637115 (= e!364536 e!364537)))

(declare-fun res!412182 () Bool)

(assert (=> b!637115 (=> (not res!412182) (not e!364537))))

(assert (=> b!637115 (= res!412182 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18714 lt!294539)))))

(declare-fun b!637116 () Bool)

(assert (=> b!637116 (= e!364537 (arrayContainsKey!0 lt!294539 (select (arr!18350 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90105 (not res!412181)) b!637115))

(assert (= (and b!637115 res!412182) b!637116))

(declare-fun m!611267 () Bool)

(assert (=> d!90105 m!611267))

(assert (=> b!637116 m!611131))

(declare-fun m!611269 () Bool)

(assert (=> b!637116 m!611269))

(assert (=> b!637001 d!90105))

(declare-fun d!90107 () Bool)

(declare-fun res!412187 () Bool)

(declare-fun e!364542 () Bool)

(assert (=> d!90107 (=> res!412187 e!364542)))

(assert (=> d!90107 (= res!412187 (is-Nil!12388 Nil!12388))))

(assert (=> d!90107 (= (noDuplicate!383 Nil!12388) e!364542)))

(declare-fun b!637121 () Bool)

(declare-fun e!364543 () Bool)

(assert (=> b!637121 (= e!364542 e!364543)))

(declare-fun res!412188 () Bool)

(assert (=> b!637121 (=> (not res!412188) (not e!364543))))

(assert (=> b!637121 (= res!412188 (not (contains!3105 (t!18619 Nil!12388) (h!13432 Nil!12388))))))

(declare-fun b!637122 () Bool)

(assert (=> b!637122 (= e!364543 (noDuplicate!383 (t!18619 Nil!12388)))))

(assert (= (and d!90107 (not res!412187)) b!637121))

(assert (= (and b!637121 res!412188) b!637122))

(declare-fun m!611271 () Bool)

(assert (=> b!637121 m!611271))

(declare-fun m!611273 () Bool)

(assert (=> b!637122 m!611273))

(assert (=> b!636991 d!90107))

(declare-fun d!90109 () Bool)

(declare-fun res!412189 () Bool)

(declare-fun e!364544 () Bool)

(assert (=> d!90109 (=> res!412189 e!364544)))

(assert (=> d!90109 (= res!412189 (= (select (arr!18350 lt!294539) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18350 a!2986) j!136)))))

(assert (=> d!90109 (= (arrayContainsKey!0 lt!294539 (select (arr!18350 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364544)))

(declare-fun b!637123 () Bool)

(declare-fun e!364545 () Bool)

(assert (=> b!637123 (= e!364544 e!364545)))

(declare-fun res!412190 () Bool)

(assert (=> b!637123 (=> (not res!412190) (not e!364545))))

(assert (=> b!637123 (= res!412190 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18714 lt!294539)))))

(declare-fun b!637124 () Bool)

(assert (=> b!637124 (= e!364545 (arrayContainsKey!0 lt!294539 (select (arr!18350 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90109 (not res!412189)) b!637123))

(assert (= (and b!637123 res!412190) b!637124))

(declare-fun m!611275 () Bool)

(assert (=> d!90109 m!611275))

(assert (=> b!637124 m!611131))

(declare-fun m!611277 () Bool)

(assert (=> b!637124 m!611277))

(assert (=> b!637012 d!90109))

(declare-fun d!90111 () Bool)

(assert (=> d!90111 (arrayContainsKey!0 lt!294539 (select (arr!18350 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294581 () Unit!21494)

(declare-fun choose!114 (array!38252 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21494)

(assert (=> d!90111 (= lt!294581 (choose!114 lt!294539 (select (arr!18350 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90111 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90111 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294539 (select (arr!18350 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294581)))

(declare-fun bs!19125 () Bool)

(assert (= bs!19125 d!90111))

(assert (=> bs!19125 m!611131))

(assert (=> bs!19125 m!611155))

(assert (=> bs!19125 m!611131))

(declare-fun m!611279 () Bool)

(assert (=> bs!19125 m!611279))

(assert (=> b!637012 d!90111))

(declare-fun b!637169 () Bool)

(declare-fun e!364576 () SeekEntryResult!6790)

(assert (=> b!637169 (= e!364576 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18350 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!294600 () SeekEntryResult!6790)

(declare-fun d!90113 () Bool)

(assert (=> d!90113 (and (or (is-Undefined!6790 lt!294600) (not (is-Found!6790 lt!294600)) (and (bvsge (index!29472 lt!294600) #b00000000000000000000000000000000) (bvslt (index!29472 lt!294600) (size!18714 a!2986)))) (or (is-Undefined!6790 lt!294600) (is-Found!6790 lt!294600) (not (is-MissingVacant!6790 lt!294600)) (not (= (index!29474 lt!294600) vacantSpotIndex!68)) (and (bvsge (index!29474 lt!294600) #b00000000000000000000000000000000) (bvslt (index!29474 lt!294600) (size!18714 a!2986)))) (or (is-Undefined!6790 lt!294600) (ite (is-Found!6790 lt!294600) (= (select (arr!18350 a!2986) (index!29472 lt!294600)) (select (arr!18350 a!2986) j!136)) (and (is-MissingVacant!6790 lt!294600) (= (index!29474 lt!294600) vacantSpotIndex!68) (= (select (arr!18350 a!2986) (index!29474 lt!294600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!364575 () SeekEntryResult!6790)

(assert (=> d!90113 (= lt!294600 e!364575)))

(declare-fun c!72849 () Bool)

(assert (=> d!90113 (= c!72849 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!294601 () (_ BitVec 64))

(assert (=> d!90113 (= lt!294601 (select (arr!18350 a!2986) index!984))))

(assert (=> d!90113 (validMask!0 mask!3053)))

(assert (=> d!90113 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18350 a!2986) j!136) a!2986 mask!3053) lt!294600)))

(declare-fun b!637170 () Bool)

(declare-fun e!364577 () SeekEntryResult!6790)

(assert (=> b!637170 (= e!364575 e!364577)))

(declare-fun c!72851 () Bool)

(assert (=> b!637170 (= c!72851 (= lt!294601 (select (arr!18350 a!2986) j!136)))))

(declare-fun b!637171 () Bool)

(assert (=> b!637171 (= e!364576 (MissingVacant!6790 vacantSpotIndex!68))))

(declare-fun b!637172 () Bool)

(assert (=> b!637172 (= e!364577 (Found!6790 index!984))))

(declare-fun b!637173 () Bool)

(assert (=> b!637173 (= e!364575 Undefined!6790)))

(declare-fun b!637174 () Bool)

(declare-fun c!72850 () Bool)

(assert (=> b!637174 (= c!72850 (= lt!294601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637174 (= e!364577 e!364576)))

(assert (= (and d!90113 c!72849) b!637173))

(assert (= (and d!90113 (not c!72849)) b!637170))

(assert (= (and b!637170 c!72851) b!637172))

(assert (= (and b!637170 (not c!72851)) b!637174))

(assert (= (and b!637174 c!72850) b!637171))

(assert (= (and b!637174 (not c!72850)) b!637169))

(assert (=> b!637169 m!611127))

(assert (=> b!637169 m!611127))

(assert (=> b!637169 m!611131))

(declare-fun m!611313 () Bool)

(assert (=> b!637169 m!611313))

(declare-fun m!611315 () Bool)

(assert (=> d!90113 m!611315))

(declare-fun m!611317 () Bool)

(assert (=> d!90113 m!611317))

(assert (=> d!90113 m!611169))

(assert (=> d!90113 m!611147))

(assert (=> b!637013 d!90113))

(declare-fun d!90135 () Bool)

(assert (=> d!90135 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!637003 d!90135))

(declare-fun b!637235 () Bool)

(declare-fun e!364618 () SeekEntryResult!6790)

(declare-fun lt!294630 () SeekEntryResult!6790)

(assert (=> b!637235 (= e!364618 (MissingZero!6790 (index!29473 lt!294630)))))

(declare-fun b!637236 () Bool)

(declare-fun e!364619 () SeekEntryResult!6790)

(assert (=> b!637236 (= e!364619 Undefined!6790)))

(declare-fun d!90137 () Bool)

(declare-fun lt!294632 () SeekEntryResult!6790)

(assert (=> d!90137 (and (or (is-Undefined!6790 lt!294632) (not (is-Found!6790 lt!294632)) (and (bvsge (index!29472 lt!294632) #b00000000000000000000000000000000) (bvslt (index!29472 lt!294632) (size!18714 a!2986)))) (or (is-Undefined!6790 lt!294632) (is-Found!6790 lt!294632) (not (is-MissingZero!6790 lt!294632)) (and (bvsge (index!29471 lt!294632) #b00000000000000000000000000000000) (bvslt (index!29471 lt!294632) (size!18714 a!2986)))) (or (is-Undefined!6790 lt!294632) (is-Found!6790 lt!294632) (is-MissingZero!6790 lt!294632) (not (is-MissingVacant!6790 lt!294632)) (and (bvsge (index!29474 lt!294632) #b00000000000000000000000000000000) (bvslt (index!29474 lt!294632) (size!18714 a!2986)))) (or (is-Undefined!6790 lt!294632) (ite (is-Found!6790 lt!294632) (= (select (arr!18350 a!2986) (index!29472 lt!294632)) k!1786) (ite (is-MissingZero!6790 lt!294632) (= (select (arr!18350 a!2986) (index!29471 lt!294632)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6790 lt!294632) (= (select (arr!18350 a!2986) (index!29474 lt!294632)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90137 (= lt!294632 e!364619)))

(declare-fun c!72875 () Bool)

(assert (=> d!90137 (= c!72875 (and (is-Intermediate!6790 lt!294630) (undefined!7602 lt!294630)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38252 (_ BitVec 32)) SeekEntryResult!6790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90137 (= lt!294630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90137 (validMask!0 mask!3053)))

(assert (=> d!90137 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!294632)))

(declare-fun b!637237 () Bool)

(declare-fun c!72874 () Bool)

(declare-fun lt!294631 () (_ BitVec 64))

(assert (=> b!637237 (= c!72874 (= lt!294631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364617 () SeekEntryResult!6790)

(assert (=> b!637237 (= e!364617 e!364618)))

(declare-fun b!637238 () Bool)

(assert (=> b!637238 (= e!364618 (seekKeyOrZeroReturnVacant!0 (x!58223 lt!294630) (index!29473 lt!294630) (index!29473 lt!294630) k!1786 a!2986 mask!3053))))

(declare-fun b!637239 () Bool)

(assert (=> b!637239 (= e!364619 e!364617)))

(assert (=> b!637239 (= lt!294631 (select (arr!18350 a!2986) (index!29473 lt!294630)))))

(declare-fun c!72873 () Bool)

(assert (=> b!637239 (= c!72873 (= lt!294631 k!1786))))

(declare-fun b!637240 () Bool)

