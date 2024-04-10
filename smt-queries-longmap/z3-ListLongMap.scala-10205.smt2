; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120218 () Bool)

(assert start!120218)

(declare-fun b!1399371 () Bool)

(declare-fun e!792234 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1399371 (= e!792234 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun e!792231 () Bool)

(assert (=> b!1399371 e!792231))

(declare-fun res!938120 () Bool)

(assert (=> b!1399371 (=> (not res!938120) (not e!792231))))

(declare-datatypes ((array!95690 0))(
  ( (array!95691 (arr!46197 (Array (_ BitVec 32) (_ BitVec 64))) (size!46747 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95690)

(declare-datatypes ((SeekEntryResult!10514 0))(
  ( (MissingZero!10514 (index!44430 (_ BitVec 32))) (Found!10514 (index!44431 (_ BitVec 32))) (Intermediate!10514 (undefined!11326 Bool) (index!44432 (_ BitVec 32)) (x!126073 (_ BitVec 32))) (Undefined!10514) (MissingVacant!10514 (index!44433 (_ BitVec 32))) )
))
(declare-fun lt!615511 () SeekEntryResult!10514)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615512 () SeekEntryResult!10514)

(assert (=> b!1399371 (= res!938120 (and (not (undefined!11326 lt!615512)) (= (index!44432 lt!615512) i!1037) (bvslt (x!126073 lt!615512) (x!126073 lt!615511)) (= (select (store (arr!46197 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44432 lt!615512)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47032 0))(
  ( (Unit!47033) )
))
(declare-fun lt!615514 () Unit!47032)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!615510 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47032)

(assert (=> b!1399371 (= lt!615514 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615510 (x!126073 lt!615511) (index!44432 lt!615511) (x!126073 lt!615512) (index!44432 lt!615512) (undefined!11326 lt!615512) mask!2840))))

(declare-fun b!1399372 () Bool)

(declare-fun e!792232 () Bool)

(assert (=> b!1399372 (= e!792232 e!792234)))

(declare-fun res!938125 () Bool)

(assert (=> b!1399372 (=> res!938125 e!792234)))

(get-info :version)

(assert (=> b!1399372 (= res!938125 (or (= lt!615511 lt!615512) (not ((_ is Intermediate!10514) lt!615512))))))

(declare-fun lt!615516 () array!95690)

(declare-fun lt!615513 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95690 (_ BitVec 32)) SeekEntryResult!10514)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399372 (= lt!615512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615513 mask!2840) lt!615513 lt!615516 mask!2840))))

(assert (=> b!1399372 (= lt!615513 (select (store (arr!46197 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399372 (= lt!615516 (array!95691 (store (arr!46197 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46747 a!2901)))))

(declare-fun b!1399373 () Bool)

(declare-fun e!792233 () Bool)

(assert (=> b!1399373 (= e!792233 (not e!792232))))

(declare-fun res!938127 () Bool)

(assert (=> b!1399373 (=> res!938127 e!792232)))

(assert (=> b!1399373 (= res!938127 (or (not ((_ is Intermediate!10514) lt!615511)) (undefined!11326 lt!615511)))))

(declare-fun e!792236 () Bool)

(assert (=> b!1399373 e!792236))

(declare-fun res!938128 () Bool)

(assert (=> b!1399373 (=> (not res!938128) (not e!792236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95690 (_ BitVec 32)) Bool)

(assert (=> b!1399373 (= res!938128 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615515 () Unit!47032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47032)

(assert (=> b!1399373 (= lt!615515 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399373 (= lt!615511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615510 (select (arr!46197 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399373 (= lt!615510 (toIndex!0 (select (arr!46197 a!2901) j!112) mask!2840))))

(declare-fun b!1399374 () Bool)

(declare-fun res!938123 () Bool)

(assert (=> b!1399374 (=> (not res!938123) (not e!792233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399374 (= res!938123 (validKeyInArray!0 (select (arr!46197 a!2901) i!1037)))))

(declare-fun b!1399375 () Bool)

(declare-fun res!938126 () Bool)

(assert (=> b!1399375 (=> (not res!938126) (not e!792233))))

(declare-datatypes ((List!32716 0))(
  ( (Nil!32713) (Cons!32712 (h!33957 (_ BitVec 64)) (t!47410 List!32716)) )
))
(declare-fun arrayNoDuplicates!0 (array!95690 (_ BitVec 32) List!32716) Bool)

(assert (=> b!1399375 (= res!938126 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32713))))

(declare-fun b!1399377 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95690 (_ BitVec 32)) SeekEntryResult!10514)

(assert (=> b!1399377 (= e!792236 (= (seekEntryOrOpen!0 (select (arr!46197 a!2901) j!112) a!2901 mask!2840) (Found!10514 j!112)))))

(declare-fun b!1399378 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95690 (_ BitVec 32)) SeekEntryResult!10514)

(assert (=> b!1399378 (= e!792231 (= (seekEntryOrOpen!0 lt!615513 lt!615516 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126073 lt!615512) (index!44432 lt!615512) (index!44432 lt!615512) (select (arr!46197 a!2901) j!112) lt!615516 mask!2840)))))

(declare-fun b!1399379 () Bool)

(declare-fun res!938119 () Bool)

(assert (=> b!1399379 (=> (not res!938119) (not e!792233))))

(assert (=> b!1399379 (= res!938119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399380 () Bool)

(declare-fun res!938124 () Bool)

(assert (=> b!1399380 (=> (not res!938124) (not e!792233))))

(assert (=> b!1399380 (= res!938124 (and (= (size!46747 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46747 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46747 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!938121 () Bool)

(assert (=> start!120218 (=> (not res!938121) (not e!792233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120218 (= res!938121 (validMask!0 mask!2840))))

(assert (=> start!120218 e!792233))

(assert (=> start!120218 true))

(declare-fun array_inv!35225 (array!95690) Bool)

(assert (=> start!120218 (array_inv!35225 a!2901)))

(declare-fun b!1399376 () Bool)

(declare-fun res!938122 () Bool)

(assert (=> b!1399376 (=> (not res!938122) (not e!792233))))

(assert (=> b!1399376 (= res!938122 (validKeyInArray!0 (select (arr!46197 a!2901) j!112)))))

(assert (= (and start!120218 res!938121) b!1399380))

(assert (= (and b!1399380 res!938124) b!1399374))

(assert (= (and b!1399374 res!938123) b!1399376))

(assert (= (and b!1399376 res!938122) b!1399379))

(assert (= (and b!1399379 res!938119) b!1399375))

(assert (= (and b!1399375 res!938126) b!1399373))

(assert (= (and b!1399373 res!938128) b!1399377))

(assert (= (and b!1399373 (not res!938127)) b!1399372))

(assert (= (and b!1399372 (not res!938125)) b!1399371))

(assert (= (and b!1399371 res!938120) b!1399378))

(declare-fun m!1286679 () Bool)

(assert (=> b!1399373 m!1286679))

(declare-fun m!1286681 () Bool)

(assert (=> b!1399373 m!1286681))

(assert (=> b!1399373 m!1286679))

(assert (=> b!1399373 m!1286679))

(declare-fun m!1286683 () Bool)

(assert (=> b!1399373 m!1286683))

(declare-fun m!1286685 () Bool)

(assert (=> b!1399373 m!1286685))

(declare-fun m!1286687 () Bool)

(assert (=> b!1399373 m!1286687))

(declare-fun m!1286689 () Bool)

(assert (=> b!1399379 m!1286689))

(assert (=> b!1399376 m!1286679))

(assert (=> b!1399376 m!1286679))

(declare-fun m!1286691 () Bool)

(assert (=> b!1399376 m!1286691))

(declare-fun m!1286693 () Bool)

(assert (=> start!120218 m!1286693))

(declare-fun m!1286695 () Bool)

(assert (=> start!120218 m!1286695))

(declare-fun m!1286697 () Bool)

(assert (=> b!1399372 m!1286697))

(assert (=> b!1399372 m!1286697))

(declare-fun m!1286699 () Bool)

(assert (=> b!1399372 m!1286699))

(declare-fun m!1286701 () Bool)

(assert (=> b!1399372 m!1286701))

(declare-fun m!1286703 () Bool)

(assert (=> b!1399372 m!1286703))

(declare-fun m!1286705 () Bool)

(assert (=> b!1399375 m!1286705))

(assert (=> b!1399371 m!1286701))

(declare-fun m!1286707 () Bool)

(assert (=> b!1399371 m!1286707))

(declare-fun m!1286709 () Bool)

(assert (=> b!1399371 m!1286709))

(declare-fun m!1286711 () Bool)

(assert (=> b!1399378 m!1286711))

(assert (=> b!1399378 m!1286679))

(assert (=> b!1399378 m!1286679))

(declare-fun m!1286713 () Bool)

(assert (=> b!1399378 m!1286713))

(declare-fun m!1286715 () Bool)

(assert (=> b!1399374 m!1286715))

(assert (=> b!1399374 m!1286715))

(declare-fun m!1286717 () Bool)

(assert (=> b!1399374 m!1286717))

(assert (=> b!1399377 m!1286679))

(assert (=> b!1399377 m!1286679))

(declare-fun m!1286719 () Bool)

(assert (=> b!1399377 m!1286719))

(check-sat (not b!1399373) (not b!1399377) (not b!1399379) (not b!1399372) (not b!1399376) (not b!1399371) (not start!120218) (not b!1399378) (not b!1399375) (not b!1399374))
(check-sat)
(get-model)

(declare-fun d!151037 () Bool)

(declare-fun res!938164 () Bool)

(declare-fun e!792263 () Bool)

(assert (=> d!151037 (=> res!938164 e!792263)))

(assert (=> d!151037 (= res!938164 (bvsge j!112 (size!46747 a!2901)))))

(assert (=> d!151037 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!792263)))

(declare-fun b!1399419 () Bool)

(declare-fun e!792261 () Bool)

(assert (=> b!1399419 (= e!792263 e!792261)))

(declare-fun c!130086 () Bool)

(assert (=> b!1399419 (= c!130086 (validKeyInArray!0 (select (arr!46197 a!2901) j!112)))))

(declare-fun bm!66886 () Bool)

(declare-fun call!66889 () Bool)

(assert (=> bm!66886 (= call!66889 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1399420 () Bool)

(assert (=> b!1399420 (= e!792261 call!66889)))

(declare-fun b!1399421 () Bool)

(declare-fun e!792262 () Bool)

(assert (=> b!1399421 (= e!792262 call!66889)))

(declare-fun b!1399422 () Bool)

(assert (=> b!1399422 (= e!792261 e!792262)))

(declare-fun lt!615546 () (_ BitVec 64))

(assert (=> b!1399422 (= lt!615546 (select (arr!46197 a!2901) j!112))))

(declare-fun lt!615545 () Unit!47032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95690 (_ BitVec 64) (_ BitVec 32)) Unit!47032)

(assert (=> b!1399422 (= lt!615545 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615546 j!112))))

(declare-fun arrayContainsKey!0 (array!95690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1399422 (arrayContainsKey!0 a!2901 lt!615546 #b00000000000000000000000000000000)))

(declare-fun lt!615544 () Unit!47032)

(assert (=> b!1399422 (= lt!615544 lt!615545)))

(declare-fun res!938163 () Bool)

(assert (=> b!1399422 (= res!938163 (= (seekEntryOrOpen!0 (select (arr!46197 a!2901) j!112) a!2901 mask!2840) (Found!10514 j!112)))))

(assert (=> b!1399422 (=> (not res!938163) (not e!792262))))

(assert (= (and d!151037 (not res!938164)) b!1399419))

(assert (= (and b!1399419 c!130086) b!1399422))

(assert (= (and b!1399419 (not c!130086)) b!1399420))

(assert (= (and b!1399422 res!938163) b!1399421))

(assert (= (or b!1399421 b!1399420) bm!66886))

(assert (=> b!1399419 m!1286679))

(assert (=> b!1399419 m!1286679))

(assert (=> b!1399419 m!1286691))

(declare-fun m!1286763 () Bool)

(assert (=> bm!66886 m!1286763))

(assert (=> b!1399422 m!1286679))

(declare-fun m!1286765 () Bool)

(assert (=> b!1399422 m!1286765))

(declare-fun m!1286767 () Bool)

(assert (=> b!1399422 m!1286767))

(assert (=> b!1399422 m!1286679))

(assert (=> b!1399422 m!1286719))

(assert (=> b!1399373 d!151037))

(declare-fun d!151041 () Bool)

(assert (=> d!151041 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!615549 () Unit!47032)

(declare-fun choose!38 (array!95690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47032)

(assert (=> d!151041 (= lt!615549 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151041 (validMask!0 mask!2840)))

(assert (=> d!151041 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!615549)))

(declare-fun bs!40742 () Bool)

(assert (= bs!40742 d!151041))

(assert (=> bs!40742 m!1286687))

(declare-fun m!1286769 () Bool)

(assert (=> bs!40742 m!1286769))

(assert (=> bs!40742 m!1286693))

(assert (=> b!1399373 d!151041))

(declare-fun b!1399468 () Bool)

(declare-fun e!792291 () SeekEntryResult!10514)

(assert (=> b!1399468 (= e!792291 (Intermediate!10514 true lt!615510 #b00000000000000000000000000000000))))

(declare-fun b!1399469 () Bool)

(declare-fun lt!615567 () SeekEntryResult!10514)

(assert (=> b!1399469 (and (bvsge (index!44432 lt!615567) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615567) (size!46747 a!2901)))))

(declare-fun res!938182 () Bool)

(assert (=> b!1399469 (= res!938182 (= (select (arr!46197 a!2901) (index!44432 lt!615567)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!792289 () Bool)

(assert (=> b!1399469 (=> res!938182 e!792289)))

(declare-fun b!1399470 () Bool)

(assert (=> b!1399470 (and (bvsge (index!44432 lt!615567) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615567) (size!46747 a!2901)))))

(declare-fun res!938183 () Bool)

(assert (=> b!1399470 (= res!938183 (= (select (arr!46197 a!2901) (index!44432 lt!615567)) (select (arr!46197 a!2901) j!112)))))

(assert (=> b!1399470 (=> res!938183 e!792289)))

(declare-fun e!792290 () Bool)

(assert (=> b!1399470 (= e!792290 e!792289)))

(declare-fun b!1399471 () Bool)

(declare-fun e!792292 () Bool)

(assert (=> b!1399471 (= e!792292 e!792290)))

(declare-fun res!938181 () Bool)

(assert (=> b!1399471 (= res!938181 (and ((_ is Intermediate!10514) lt!615567) (not (undefined!11326 lt!615567)) (bvslt (x!126073 lt!615567) #b01111111111111111111111111111110) (bvsge (x!126073 lt!615567) #b00000000000000000000000000000000) (bvsge (x!126073 lt!615567) #b00000000000000000000000000000000)))))

(assert (=> b!1399471 (=> (not res!938181) (not e!792290))))

(declare-fun e!792293 () SeekEntryResult!10514)

(declare-fun b!1399473 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399473 (= e!792293 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!615510 #b00000000000000000000000000000000 mask!2840) (select (arr!46197 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1399474 () Bool)

(assert (=> b!1399474 (and (bvsge (index!44432 lt!615567) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615567) (size!46747 a!2901)))))

(assert (=> b!1399474 (= e!792289 (= (select (arr!46197 a!2901) (index!44432 lt!615567)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1399475 () Bool)

(assert (=> b!1399475 (= e!792291 e!792293)))

(declare-fun c!130103 () Bool)

(declare-fun lt!615566 () (_ BitVec 64))

(assert (=> b!1399475 (= c!130103 (or (= lt!615566 (select (arr!46197 a!2901) j!112)) (= (bvadd lt!615566 lt!615566) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1399476 () Bool)

(assert (=> b!1399476 (= e!792293 (Intermediate!10514 false lt!615510 #b00000000000000000000000000000000))))

(declare-fun d!151043 () Bool)

(assert (=> d!151043 e!792292))

(declare-fun c!130104 () Bool)

(assert (=> d!151043 (= c!130104 (and ((_ is Intermediate!10514) lt!615567) (undefined!11326 lt!615567)))))

(assert (=> d!151043 (= lt!615567 e!792291)))

(declare-fun c!130102 () Bool)

(assert (=> d!151043 (= c!130102 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151043 (= lt!615566 (select (arr!46197 a!2901) lt!615510))))

(assert (=> d!151043 (validMask!0 mask!2840)))

(assert (=> d!151043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615510 (select (arr!46197 a!2901) j!112) a!2901 mask!2840) lt!615567)))

(declare-fun b!1399472 () Bool)

(assert (=> b!1399472 (= e!792292 (bvsge (x!126073 lt!615567) #b01111111111111111111111111111110))))

(assert (= (and d!151043 c!130102) b!1399468))

(assert (= (and d!151043 (not c!130102)) b!1399475))

(assert (= (and b!1399475 c!130103) b!1399476))

(assert (= (and b!1399475 (not c!130103)) b!1399473))

(assert (= (and d!151043 c!130104) b!1399472))

(assert (= (and d!151043 (not c!130104)) b!1399471))

(assert (= (and b!1399471 res!938181) b!1399470))

(assert (= (and b!1399470 (not res!938183)) b!1399469))

(assert (= (and b!1399469 (not res!938182)) b!1399474))

(declare-fun m!1286779 () Bool)

(assert (=> b!1399470 m!1286779))

(declare-fun m!1286781 () Bool)

(assert (=> b!1399473 m!1286781))

(assert (=> b!1399473 m!1286781))

(assert (=> b!1399473 m!1286679))

(declare-fun m!1286783 () Bool)

(assert (=> b!1399473 m!1286783))

(declare-fun m!1286785 () Bool)

(assert (=> d!151043 m!1286785))

(assert (=> d!151043 m!1286693))

(assert (=> b!1399474 m!1286779))

(assert (=> b!1399469 m!1286779))

(assert (=> b!1399373 d!151043))

(declare-fun d!151051 () Bool)

(declare-fun lt!615573 () (_ BitVec 32))

(declare-fun lt!615572 () (_ BitVec 32))

(assert (=> d!151051 (= lt!615573 (bvmul (bvxor lt!615572 (bvlshr lt!615572 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151051 (= lt!615572 ((_ extract 31 0) (bvand (bvxor (select (arr!46197 a!2901) j!112) (bvlshr (select (arr!46197 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151051 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!938184 (let ((h!33960 ((_ extract 31 0) (bvand (bvxor (select (arr!46197 a!2901) j!112) (bvlshr (select (arr!46197 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126078 (bvmul (bvxor h!33960 (bvlshr h!33960 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126078 (bvlshr x!126078 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!938184 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!938184 #b00000000000000000000000000000000))))))

(assert (=> d!151051 (= (toIndex!0 (select (arr!46197 a!2901) j!112) mask!2840) (bvand (bvxor lt!615573 (bvlshr lt!615573 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1399373 d!151051))

(declare-fun d!151053 () Bool)

(assert (=> d!151053 (= (validKeyInArray!0 (select (arr!46197 a!2901) i!1037)) (and (not (= (select (arr!46197 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46197 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1399374 d!151053))

(declare-fun d!151055 () Bool)

(declare-fun res!938186 () Bool)

(declare-fun e!792296 () Bool)

(assert (=> d!151055 (=> res!938186 e!792296)))

(assert (=> d!151055 (= res!938186 (bvsge #b00000000000000000000000000000000 (size!46747 a!2901)))))

(assert (=> d!151055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!792296)))

(declare-fun b!1399477 () Bool)

(declare-fun e!792294 () Bool)

(assert (=> b!1399477 (= e!792296 e!792294)))

(declare-fun c!130105 () Bool)

(assert (=> b!1399477 (= c!130105 (validKeyInArray!0 (select (arr!46197 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66887 () Bool)

(declare-fun call!66890 () Bool)

(assert (=> bm!66887 (= call!66890 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1399478 () Bool)

(assert (=> b!1399478 (= e!792294 call!66890)))

(declare-fun b!1399479 () Bool)

(declare-fun e!792295 () Bool)

(assert (=> b!1399479 (= e!792295 call!66890)))

(declare-fun b!1399480 () Bool)

(assert (=> b!1399480 (= e!792294 e!792295)))

(declare-fun lt!615576 () (_ BitVec 64))

(assert (=> b!1399480 (= lt!615576 (select (arr!46197 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!615575 () Unit!47032)

(assert (=> b!1399480 (= lt!615575 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615576 #b00000000000000000000000000000000))))

(assert (=> b!1399480 (arrayContainsKey!0 a!2901 lt!615576 #b00000000000000000000000000000000)))

(declare-fun lt!615574 () Unit!47032)

(assert (=> b!1399480 (= lt!615574 lt!615575)))

(declare-fun res!938185 () Bool)

(assert (=> b!1399480 (= res!938185 (= (seekEntryOrOpen!0 (select (arr!46197 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10514 #b00000000000000000000000000000000)))))

(assert (=> b!1399480 (=> (not res!938185) (not e!792295))))

(assert (= (and d!151055 (not res!938186)) b!1399477))

(assert (= (and b!1399477 c!130105) b!1399480))

(assert (= (and b!1399477 (not c!130105)) b!1399478))

(assert (= (and b!1399480 res!938185) b!1399479))

(assert (= (or b!1399479 b!1399478) bm!66887))

(declare-fun m!1286787 () Bool)

(assert (=> b!1399477 m!1286787))

(assert (=> b!1399477 m!1286787))

(declare-fun m!1286789 () Bool)

(assert (=> b!1399477 m!1286789))

(declare-fun m!1286791 () Bool)

(assert (=> bm!66887 m!1286791))

(assert (=> b!1399480 m!1286787))

(declare-fun m!1286793 () Bool)

(assert (=> b!1399480 m!1286793))

(declare-fun m!1286795 () Bool)

(assert (=> b!1399480 m!1286795))

(assert (=> b!1399480 m!1286787))

(declare-fun m!1286797 () Bool)

(assert (=> b!1399480 m!1286797))

(assert (=> b!1399379 d!151055))

(declare-fun b!1399481 () Bool)

(declare-fun e!792299 () SeekEntryResult!10514)

(assert (=> b!1399481 (= e!792299 (Intermediate!10514 true (toIndex!0 lt!615513 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1399482 () Bool)

(declare-fun lt!615578 () SeekEntryResult!10514)

(assert (=> b!1399482 (and (bvsge (index!44432 lt!615578) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615578) (size!46747 lt!615516)))))

(declare-fun res!938188 () Bool)

(assert (=> b!1399482 (= res!938188 (= (select (arr!46197 lt!615516) (index!44432 lt!615578)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!792297 () Bool)

(assert (=> b!1399482 (=> res!938188 e!792297)))

(declare-fun b!1399483 () Bool)

(assert (=> b!1399483 (and (bvsge (index!44432 lt!615578) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615578) (size!46747 lt!615516)))))

(declare-fun res!938189 () Bool)

(assert (=> b!1399483 (= res!938189 (= (select (arr!46197 lt!615516) (index!44432 lt!615578)) lt!615513))))

(assert (=> b!1399483 (=> res!938189 e!792297)))

(declare-fun e!792298 () Bool)

(assert (=> b!1399483 (= e!792298 e!792297)))

(declare-fun b!1399484 () Bool)

(declare-fun e!792300 () Bool)

(assert (=> b!1399484 (= e!792300 e!792298)))

(declare-fun res!938187 () Bool)

(assert (=> b!1399484 (= res!938187 (and ((_ is Intermediate!10514) lt!615578) (not (undefined!11326 lt!615578)) (bvslt (x!126073 lt!615578) #b01111111111111111111111111111110) (bvsge (x!126073 lt!615578) #b00000000000000000000000000000000) (bvsge (x!126073 lt!615578) #b00000000000000000000000000000000)))))

(assert (=> b!1399484 (=> (not res!938187) (not e!792298))))

(declare-fun e!792301 () SeekEntryResult!10514)

(declare-fun b!1399486 () Bool)

(assert (=> b!1399486 (= e!792301 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!615513 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!615513 lt!615516 mask!2840))))

(declare-fun b!1399487 () Bool)

(assert (=> b!1399487 (and (bvsge (index!44432 lt!615578) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615578) (size!46747 lt!615516)))))

(assert (=> b!1399487 (= e!792297 (= (select (arr!46197 lt!615516) (index!44432 lt!615578)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1399488 () Bool)

(assert (=> b!1399488 (= e!792299 e!792301)))

(declare-fun c!130107 () Bool)

(declare-fun lt!615577 () (_ BitVec 64))

(assert (=> b!1399488 (= c!130107 (or (= lt!615577 lt!615513) (= (bvadd lt!615577 lt!615577) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1399489 () Bool)

(assert (=> b!1399489 (= e!792301 (Intermediate!10514 false (toIndex!0 lt!615513 mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151057 () Bool)

(assert (=> d!151057 e!792300))

(declare-fun c!130108 () Bool)

(assert (=> d!151057 (= c!130108 (and ((_ is Intermediate!10514) lt!615578) (undefined!11326 lt!615578)))))

(assert (=> d!151057 (= lt!615578 e!792299)))

(declare-fun c!130106 () Bool)

(assert (=> d!151057 (= c!130106 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151057 (= lt!615577 (select (arr!46197 lt!615516) (toIndex!0 lt!615513 mask!2840)))))

(assert (=> d!151057 (validMask!0 mask!2840)))

(assert (=> d!151057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615513 mask!2840) lt!615513 lt!615516 mask!2840) lt!615578)))

(declare-fun b!1399485 () Bool)

(assert (=> b!1399485 (= e!792300 (bvsge (x!126073 lt!615578) #b01111111111111111111111111111110))))

(assert (= (and d!151057 c!130106) b!1399481))

(assert (= (and d!151057 (not c!130106)) b!1399488))

(assert (= (and b!1399488 c!130107) b!1399489))

(assert (= (and b!1399488 (not c!130107)) b!1399486))

(assert (= (and d!151057 c!130108) b!1399485))

(assert (= (and d!151057 (not c!130108)) b!1399484))

(assert (= (and b!1399484 res!938187) b!1399483))

(assert (= (and b!1399483 (not res!938189)) b!1399482))

(assert (= (and b!1399482 (not res!938188)) b!1399487))

(declare-fun m!1286799 () Bool)

(assert (=> b!1399483 m!1286799))

(assert (=> b!1399486 m!1286697))

(declare-fun m!1286801 () Bool)

(assert (=> b!1399486 m!1286801))

(assert (=> b!1399486 m!1286801))

(declare-fun m!1286803 () Bool)

(assert (=> b!1399486 m!1286803))

(assert (=> d!151057 m!1286697))

(declare-fun m!1286805 () Bool)

(assert (=> d!151057 m!1286805))

(assert (=> d!151057 m!1286693))

(assert (=> b!1399487 m!1286799))

(assert (=> b!1399482 m!1286799))

(assert (=> b!1399372 d!151057))

(declare-fun d!151059 () Bool)

(declare-fun lt!615580 () (_ BitVec 32))

(declare-fun lt!615579 () (_ BitVec 32))

(assert (=> d!151059 (= lt!615580 (bvmul (bvxor lt!615579 (bvlshr lt!615579 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151059 (= lt!615579 ((_ extract 31 0) (bvand (bvxor lt!615513 (bvlshr lt!615513 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151059 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!938184 (let ((h!33960 ((_ extract 31 0) (bvand (bvxor lt!615513 (bvlshr lt!615513 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126078 (bvmul (bvxor h!33960 (bvlshr h!33960 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126078 (bvlshr x!126078 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!938184 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!938184 #b00000000000000000000000000000000))))))

(assert (=> d!151059 (= (toIndex!0 lt!615513 mask!2840) (bvand (bvxor lt!615580 (bvlshr lt!615580 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1399372 d!151059))

(declare-fun d!151063 () Bool)

(assert (=> d!151063 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120218 d!151063))

(declare-fun d!151067 () Bool)

(assert (=> d!151067 (= (array_inv!35225 a!2901) (bvsge (size!46747 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120218 d!151067))

(declare-fun b!1399544 () Bool)

(declare-fun e!792332 () SeekEntryResult!10514)

(declare-fun e!792334 () SeekEntryResult!10514)

(assert (=> b!1399544 (= e!792332 e!792334)))

(declare-fun lt!615611 () (_ BitVec 64))

(declare-fun lt!615612 () SeekEntryResult!10514)

(assert (=> b!1399544 (= lt!615611 (select (arr!46197 a!2901) (index!44432 lt!615612)))))

(declare-fun c!130133 () Bool)

(assert (=> b!1399544 (= c!130133 (= lt!615611 (select (arr!46197 a!2901) j!112)))))

(declare-fun b!1399545 () Bool)

(declare-fun e!792333 () SeekEntryResult!10514)

(assert (=> b!1399545 (= e!792333 (MissingZero!10514 (index!44432 lt!615612)))))

(declare-fun d!151069 () Bool)

(declare-fun lt!615613 () SeekEntryResult!10514)

(assert (=> d!151069 (and (or ((_ is Undefined!10514) lt!615613) (not ((_ is Found!10514) lt!615613)) (and (bvsge (index!44431 lt!615613) #b00000000000000000000000000000000) (bvslt (index!44431 lt!615613) (size!46747 a!2901)))) (or ((_ is Undefined!10514) lt!615613) ((_ is Found!10514) lt!615613) (not ((_ is MissingZero!10514) lt!615613)) (and (bvsge (index!44430 lt!615613) #b00000000000000000000000000000000) (bvslt (index!44430 lt!615613) (size!46747 a!2901)))) (or ((_ is Undefined!10514) lt!615613) ((_ is Found!10514) lt!615613) ((_ is MissingZero!10514) lt!615613) (not ((_ is MissingVacant!10514) lt!615613)) (and (bvsge (index!44433 lt!615613) #b00000000000000000000000000000000) (bvslt (index!44433 lt!615613) (size!46747 a!2901)))) (or ((_ is Undefined!10514) lt!615613) (ite ((_ is Found!10514) lt!615613) (= (select (arr!46197 a!2901) (index!44431 lt!615613)) (select (arr!46197 a!2901) j!112)) (ite ((_ is MissingZero!10514) lt!615613) (= (select (arr!46197 a!2901) (index!44430 lt!615613)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10514) lt!615613) (= (select (arr!46197 a!2901) (index!44433 lt!615613)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151069 (= lt!615613 e!792332)))

(declare-fun c!130134 () Bool)

(assert (=> d!151069 (= c!130134 (and ((_ is Intermediate!10514) lt!615612) (undefined!11326 lt!615612)))))

(assert (=> d!151069 (= lt!615612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46197 a!2901) j!112) mask!2840) (select (arr!46197 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151069 (validMask!0 mask!2840)))

(assert (=> d!151069 (= (seekEntryOrOpen!0 (select (arr!46197 a!2901) j!112) a!2901 mask!2840) lt!615613)))

(declare-fun b!1399546 () Bool)

(assert (=> b!1399546 (= e!792334 (Found!10514 (index!44432 lt!615612)))))

(declare-fun b!1399547 () Bool)

(assert (=> b!1399547 (= e!792332 Undefined!10514)))

(declare-fun b!1399548 () Bool)

(declare-fun c!130135 () Bool)

(assert (=> b!1399548 (= c!130135 (= lt!615611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399548 (= e!792334 e!792333)))

(declare-fun b!1399549 () Bool)

(assert (=> b!1399549 (= e!792333 (seekKeyOrZeroReturnVacant!0 (x!126073 lt!615612) (index!44432 lt!615612) (index!44432 lt!615612) (select (arr!46197 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151069 c!130134) b!1399547))

(assert (= (and d!151069 (not c!130134)) b!1399544))

(assert (= (and b!1399544 c!130133) b!1399546))

(assert (= (and b!1399544 (not c!130133)) b!1399548))

(assert (= (and b!1399548 c!130135) b!1399545))

(assert (= (and b!1399548 (not c!130135)) b!1399549))

(declare-fun m!1286825 () Bool)

(assert (=> b!1399544 m!1286825))

(assert (=> d!151069 m!1286681))

(assert (=> d!151069 m!1286679))

(declare-fun m!1286827 () Bool)

(assert (=> d!151069 m!1286827))

(declare-fun m!1286829 () Bool)

(assert (=> d!151069 m!1286829))

(declare-fun m!1286831 () Bool)

(assert (=> d!151069 m!1286831))

(declare-fun m!1286833 () Bool)

(assert (=> d!151069 m!1286833))

(assert (=> d!151069 m!1286679))

(assert (=> d!151069 m!1286681))

(assert (=> d!151069 m!1286693))

(assert (=> b!1399549 m!1286679))

(declare-fun m!1286835 () Bool)

(assert (=> b!1399549 m!1286835))

(assert (=> b!1399377 d!151069))

(declare-fun b!1399550 () Bool)

(declare-fun e!792335 () SeekEntryResult!10514)

(declare-fun e!792337 () SeekEntryResult!10514)

(assert (=> b!1399550 (= e!792335 e!792337)))

(declare-fun lt!615614 () (_ BitVec 64))

(declare-fun lt!615615 () SeekEntryResult!10514)

(assert (=> b!1399550 (= lt!615614 (select (arr!46197 lt!615516) (index!44432 lt!615615)))))

(declare-fun c!130136 () Bool)

(assert (=> b!1399550 (= c!130136 (= lt!615614 lt!615513))))

(declare-fun b!1399551 () Bool)

(declare-fun e!792336 () SeekEntryResult!10514)

(assert (=> b!1399551 (= e!792336 (MissingZero!10514 (index!44432 lt!615615)))))

(declare-fun d!151077 () Bool)

(declare-fun lt!615616 () SeekEntryResult!10514)

(assert (=> d!151077 (and (or ((_ is Undefined!10514) lt!615616) (not ((_ is Found!10514) lt!615616)) (and (bvsge (index!44431 lt!615616) #b00000000000000000000000000000000) (bvslt (index!44431 lt!615616) (size!46747 lt!615516)))) (or ((_ is Undefined!10514) lt!615616) ((_ is Found!10514) lt!615616) (not ((_ is MissingZero!10514) lt!615616)) (and (bvsge (index!44430 lt!615616) #b00000000000000000000000000000000) (bvslt (index!44430 lt!615616) (size!46747 lt!615516)))) (or ((_ is Undefined!10514) lt!615616) ((_ is Found!10514) lt!615616) ((_ is MissingZero!10514) lt!615616) (not ((_ is MissingVacant!10514) lt!615616)) (and (bvsge (index!44433 lt!615616) #b00000000000000000000000000000000) (bvslt (index!44433 lt!615616) (size!46747 lt!615516)))) (or ((_ is Undefined!10514) lt!615616) (ite ((_ is Found!10514) lt!615616) (= (select (arr!46197 lt!615516) (index!44431 lt!615616)) lt!615513) (ite ((_ is MissingZero!10514) lt!615616) (= (select (arr!46197 lt!615516) (index!44430 lt!615616)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10514) lt!615616) (= (select (arr!46197 lt!615516) (index!44433 lt!615616)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151077 (= lt!615616 e!792335)))

(declare-fun c!130137 () Bool)

(assert (=> d!151077 (= c!130137 (and ((_ is Intermediate!10514) lt!615615) (undefined!11326 lt!615615)))))

(assert (=> d!151077 (= lt!615615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615513 mask!2840) lt!615513 lt!615516 mask!2840))))

(assert (=> d!151077 (validMask!0 mask!2840)))

(assert (=> d!151077 (= (seekEntryOrOpen!0 lt!615513 lt!615516 mask!2840) lt!615616)))

(declare-fun b!1399552 () Bool)

(assert (=> b!1399552 (= e!792337 (Found!10514 (index!44432 lt!615615)))))

(declare-fun b!1399553 () Bool)

(assert (=> b!1399553 (= e!792335 Undefined!10514)))

(declare-fun b!1399554 () Bool)

(declare-fun c!130138 () Bool)

(assert (=> b!1399554 (= c!130138 (= lt!615614 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399554 (= e!792337 e!792336)))

(declare-fun b!1399555 () Bool)

(assert (=> b!1399555 (= e!792336 (seekKeyOrZeroReturnVacant!0 (x!126073 lt!615615) (index!44432 lt!615615) (index!44432 lt!615615) lt!615513 lt!615516 mask!2840))))

(assert (= (and d!151077 c!130137) b!1399553))

(assert (= (and d!151077 (not c!130137)) b!1399550))

(assert (= (and b!1399550 c!130136) b!1399552))

(assert (= (and b!1399550 (not c!130136)) b!1399554))

(assert (= (and b!1399554 c!130138) b!1399551))

(assert (= (and b!1399554 (not c!130138)) b!1399555))

(declare-fun m!1286837 () Bool)

(assert (=> b!1399550 m!1286837))

(assert (=> d!151077 m!1286697))

(assert (=> d!151077 m!1286699))

(declare-fun m!1286839 () Bool)

(assert (=> d!151077 m!1286839))

(declare-fun m!1286841 () Bool)

(assert (=> d!151077 m!1286841))

(declare-fun m!1286843 () Bool)

(assert (=> d!151077 m!1286843))

(assert (=> d!151077 m!1286697))

(assert (=> d!151077 m!1286693))

(declare-fun m!1286845 () Bool)

(assert (=> b!1399555 m!1286845))

(assert (=> b!1399378 d!151077))

(declare-fun b!1399597 () Bool)

(declare-fun e!792363 () SeekEntryResult!10514)

(assert (=> b!1399597 (= e!792363 (seekKeyOrZeroReturnVacant!0 (bvadd (x!126073 lt!615512) #b00000000000000000000000000000001) (nextIndex!0 (index!44432 lt!615512) (x!126073 lt!615512) mask!2840) (index!44432 lt!615512) (select (arr!46197 a!2901) j!112) lt!615516 mask!2840))))

(declare-fun b!1399598 () Bool)

(declare-fun e!792364 () SeekEntryResult!10514)

(assert (=> b!1399598 (= e!792364 (Found!10514 (index!44432 lt!615512)))))

(declare-fun b!1399599 () Bool)

(declare-fun e!792365 () SeekEntryResult!10514)

(assert (=> b!1399599 (= e!792365 e!792364)))

(declare-fun c!130156 () Bool)

(declare-fun lt!615634 () (_ BitVec 64))

(assert (=> b!1399599 (= c!130156 (= lt!615634 (select (arr!46197 a!2901) j!112)))))

(declare-fun lt!615635 () SeekEntryResult!10514)

(declare-fun d!151079 () Bool)

(assert (=> d!151079 (and (or ((_ is Undefined!10514) lt!615635) (not ((_ is Found!10514) lt!615635)) (and (bvsge (index!44431 lt!615635) #b00000000000000000000000000000000) (bvslt (index!44431 lt!615635) (size!46747 lt!615516)))) (or ((_ is Undefined!10514) lt!615635) ((_ is Found!10514) lt!615635) (not ((_ is MissingVacant!10514) lt!615635)) (not (= (index!44433 lt!615635) (index!44432 lt!615512))) (and (bvsge (index!44433 lt!615635) #b00000000000000000000000000000000) (bvslt (index!44433 lt!615635) (size!46747 lt!615516)))) (or ((_ is Undefined!10514) lt!615635) (ite ((_ is Found!10514) lt!615635) (= (select (arr!46197 lt!615516) (index!44431 lt!615635)) (select (arr!46197 a!2901) j!112)) (and ((_ is MissingVacant!10514) lt!615635) (= (index!44433 lt!615635) (index!44432 lt!615512)) (= (select (arr!46197 lt!615516) (index!44433 lt!615635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!151079 (= lt!615635 e!792365)))

(declare-fun c!130155 () Bool)

(assert (=> d!151079 (= c!130155 (bvsge (x!126073 lt!615512) #b01111111111111111111111111111110))))

(assert (=> d!151079 (= lt!615634 (select (arr!46197 lt!615516) (index!44432 lt!615512)))))

(assert (=> d!151079 (validMask!0 mask!2840)))

(assert (=> d!151079 (= (seekKeyOrZeroReturnVacant!0 (x!126073 lt!615512) (index!44432 lt!615512) (index!44432 lt!615512) (select (arr!46197 a!2901) j!112) lt!615516 mask!2840) lt!615635)))

(declare-fun b!1399600 () Bool)

(assert (=> b!1399600 (= e!792365 Undefined!10514)))

(declare-fun b!1399601 () Bool)

(declare-fun c!130154 () Bool)

(assert (=> b!1399601 (= c!130154 (= lt!615634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399601 (= e!792364 e!792363)))

(declare-fun b!1399602 () Bool)

(assert (=> b!1399602 (= e!792363 (MissingVacant!10514 (index!44432 lt!615512)))))

(assert (= (and d!151079 c!130155) b!1399600))

(assert (= (and d!151079 (not c!130155)) b!1399599))

(assert (= (and b!1399599 c!130156) b!1399598))

(assert (= (and b!1399599 (not c!130156)) b!1399601))

(assert (= (and b!1399601 c!130154) b!1399602))

(assert (= (and b!1399601 (not c!130154)) b!1399597))

(declare-fun m!1286879 () Bool)

(assert (=> b!1399597 m!1286879))

(assert (=> b!1399597 m!1286879))

(assert (=> b!1399597 m!1286679))

(declare-fun m!1286881 () Bool)

(assert (=> b!1399597 m!1286881))

(declare-fun m!1286883 () Bool)

(assert (=> d!151079 m!1286883))

(declare-fun m!1286885 () Bool)

(assert (=> d!151079 m!1286885))

(declare-fun m!1286887 () Bool)

(assert (=> d!151079 m!1286887))

(assert (=> d!151079 m!1286693))

(assert (=> b!1399378 d!151079))

(declare-fun d!151091 () Bool)

(assert (=> d!151091 (= (validKeyInArray!0 (select (arr!46197 a!2901) j!112)) (and (not (= (select (arr!46197 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46197 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1399376 d!151091))

(declare-fun d!151093 () Bool)

(assert (=> d!151093 (and (not (undefined!11326 lt!615512)) (= (index!44432 lt!615512) i!1037) (bvslt (x!126073 lt!615512) (x!126073 lt!615511)))))

(declare-fun lt!615641 () Unit!47032)

(declare-fun choose!62 (array!95690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47032)

(assert (=> d!151093 (= lt!615641 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615510 (x!126073 lt!615511) (index!44432 lt!615511) (x!126073 lt!615512) (index!44432 lt!615512) (undefined!11326 lt!615512) mask!2840))))

(assert (=> d!151093 (validMask!0 mask!2840)))

(assert (=> d!151093 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615510 (x!126073 lt!615511) (index!44432 lt!615511) (x!126073 lt!615512) (index!44432 lt!615512) (undefined!11326 lt!615512) mask!2840) lt!615641)))

(declare-fun bs!40744 () Bool)

(assert (= bs!40744 d!151093))

(declare-fun m!1286897 () Bool)

(assert (=> bs!40744 m!1286897))

(assert (=> bs!40744 m!1286693))

(assert (=> b!1399371 d!151093))

(declare-fun b!1399636 () Bool)

(declare-fun e!792390 () Bool)

(declare-fun call!66900 () Bool)

(assert (=> b!1399636 (= e!792390 call!66900)))

(declare-fun b!1399637 () Bool)

(declare-fun e!792389 () Bool)

(declare-fun contains!9786 (List!32716 (_ BitVec 64)) Bool)

(assert (=> b!1399637 (= e!792389 (contains!9786 Nil!32713 (select (arr!46197 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66897 () Bool)

(declare-fun c!130169 () Bool)

(assert (=> bm!66897 (= call!66900 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130169 (Cons!32712 (select (arr!46197 a!2901) #b00000000000000000000000000000000) Nil!32713) Nil!32713)))))

(declare-fun b!1399638 () Bool)

(declare-fun e!792388 () Bool)

(declare-fun e!792387 () Bool)

(assert (=> b!1399638 (= e!792388 e!792387)))

(declare-fun res!938216 () Bool)

(assert (=> b!1399638 (=> (not res!938216) (not e!792387))))

(assert (=> b!1399638 (= res!938216 (not e!792389))))

(declare-fun res!938218 () Bool)

(assert (=> b!1399638 (=> (not res!938218) (not e!792389))))

(assert (=> b!1399638 (= res!938218 (validKeyInArray!0 (select (arr!46197 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1399639 () Bool)

(assert (=> b!1399639 (= e!792390 call!66900)))

(declare-fun d!151097 () Bool)

(declare-fun res!938217 () Bool)

(assert (=> d!151097 (=> res!938217 e!792388)))

(assert (=> d!151097 (= res!938217 (bvsge #b00000000000000000000000000000000 (size!46747 a!2901)))))

(assert (=> d!151097 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32713) e!792388)))

(declare-fun b!1399640 () Bool)

(assert (=> b!1399640 (= e!792387 e!792390)))

(assert (=> b!1399640 (= c!130169 (validKeyInArray!0 (select (arr!46197 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151097 (not res!938217)) b!1399638))

(assert (= (and b!1399638 res!938218) b!1399637))

(assert (= (and b!1399638 res!938216) b!1399640))

(assert (= (and b!1399640 c!130169) b!1399636))

(assert (= (and b!1399640 (not c!130169)) b!1399639))

(assert (= (or b!1399636 b!1399639) bm!66897))

(assert (=> b!1399637 m!1286787))

(assert (=> b!1399637 m!1286787))

(declare-fun m!1286905 () Bool)

(assert (=> b!1399637 m!1286905))

(assert (=> bm!66897 m!1286787))

(declare-fun m!1286907 () Bool)

(assert (=> bm!66897 m!1286907))

(assert (=> b!1399638 m!1286787))

(assert (=> b!1399638 m!1286787))

(assert (=> b!1399638 m!1286789))

(assert (=> b!1399640 m!1286787))

(assert (=> b!1399640 m!1286787))

(assert (=> b!1399640 m!1286789))

(assert (=> b!1399375 d!151097))

(check-sat (not d!151057) (not b!1399422) (not b!1399473) (not b!1399477) (not b!1399480) (not bm!66897) (not bm!66886) (not d!151079) (not b!1399555) (not b!1399419) (not b!1399597) (not b!1399638) (not b!1399637) (not d!151041) (not d!151069) (not b!1399486) (not b!1399549) (not d!151077) (not d!151093) (not b!1399640) (not d!151043) (not bm!66887))
(check-sat)
