; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120634 () Bool)

(assert start!120634)

(declare-fun b!1404493 () Bool)

(declare-fun res!943006 () Bool)

(declare-fun e!795059 () Bool)

(assert (=> b!1404493 (=> (not res!943006) (not e!795059))))

(declare-datatypes ((array!96043 0))(
  ( (array!96044 (arr!46372 (Array (_ BitVec 32) (_ BitVec 64))) (size!46922 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96043)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96043 (_ BitVec 32)) Bool)

(assert (=> b!1404493 (= res!943006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404494 () Bool)

(declare-fun res!943009 () Bool)

(assert (=> b!1404494 (=> (not res!943009) (not e!795059))))

(declare-datatypes ((List!32891 0))(
  ( (Nil!32888) (Cons!32887 (h!34135 (_ BitVec 64)) (t!47585 List!32891)) )
))
(declare-fun arrayNoDuplicates!0 (array!96043 (_ BitVec 32) List!32891) Bool)

(assert (=> b!1404494 (= res!943009 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32888))))

(declare-fun b!1404495 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10683 0))(
  ( (MissingZero!10683 (index!45109 (_ BitVec 32))) (Found!10683 (index!45110 (_ BitVec 32))) (Intermediate!10683 (undefined!11495 Bool) (index!45111 (_ BitVec 32)) (x!126718 (_ BitVec 32))) (Undefined!10683) (MissingVacant!10683 (index!45112 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96043 (_ BitVec 32)) SeekEntryResult!10683)

(assert (=> b!1404495 (= e!795059 (not (= (seekEntryOrOpen!0 (select (arr!46372 a!2901) j!112) a!2901 mask!2840) (Found!10683 j!112))))))

(assert (=> b!1404495 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47340 0))(
  ( (Unit!47341) )
))
(declare-fun lt!618672 () Unit!47340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47340)

(assert (=> b!1404495 (= lt!618672 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618671 () SeekEntryResult!10683)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96043 (_ BitVec 32)) SeekEntryResult!10683)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404495 (= lt!618671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46372 a!2901) j!112) mask!2840) (select (arr!46372 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404496 () Bool)

(declare-fun res!943004 () Bool)

(assert (=> b!1404496 (=> (not res!943004) (not e!795059))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404496 (= res!943004 (and (= (size!46922 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46922 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46922 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!943008 () Bool)

(assert (=> start!120634 (=> (not res!943008) (not e!795059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120634 (= res!943008 (validMask!0 mask!2840))))

(assert (=> start!120634 e!795059))

(assert (=> start!120634 true))

(declare-fun array_inv!35400 (array!96043) Bool)

(assert (=> start!120634 (array_inv!35400 a!2901)))

(declare-fun b!1404497 () Bool)

(declare-fun res!943007 () Bool)

(assert (=> b!1404497 (=> (not res!943007) (not e!795059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404497 (= res!943007 (validKeyInArray!0 (select (arr!46372 a!2901) i!1037)))))

(declare-fun b!1404498 () Bool)

(declare-fun res!943005 () Bool)

(assert (=> b!1404498 (=> (not res!943005) (not e!795059))))

(assert (=> b!1404498 (= res!943005 (validKeyInArray!0 (select (arr!46372 a!2901) j!112)))))

(assert (= (and start!120634 res!943008) b!1404496))

(assert (= (and b!1404496 res!943004) b!1404497))

(assert (= (and b!1404497 res!943007) b!1404498))

(assert (= (and b!1404498 res!943005) b!1404493))

(assert (= (and b!1404493 res!943006) b!1404494))

(assert (= (and b!1404494 res!943009) b!1404495))

(declare-fun m!1293361 () Bool)

(assert (=> b!1404494 m!1293361))

(declare-fun m!1293363 () Bool)

(assert (=> b!1404493 m!1293363))

(declare-fun m!1293365 () Bool)

(assert (=> b!1404498 m!1293365))

(assert (=> b!1404498 m!1293365))

(declare-fun m!1293367 () Bool)

(assert (=> b!1404498 m!1293367))

(assert (=> b!1404495 m!1293365))

(declare-fun m!1293369 () Bool)

(assert (=> b!1404495 m!1293369))

(assert (=> b!1404495 m!1293365))

(declare-fun m!1293371 () Bool)

(assert (=> b!1404495 m!1293371))

(assert (=> b!1404495 m!1293365))

(declare-fun m!1293373 () Bool)

(assert (=> b!1404495 m!1293373))

(assert (=> b!1404495 m!1293369))

(assert (=> b!1404495 m!1293365))

(declare-fun m!1293375 () Bool)

(assert (=> b!1404495 m!1293375))

(declare-fun m!1293377 () Bool)

(assert (=> b!1404495 m!1293377))

(declare-fun m!1293379 () Bool)

(assert (=> b!1404497 m!1293379))

(assert (=> b!1404497 m!1293379))

(declare-fun m!1293381 () Bool)

(assert (=> b!1404497 m!1293381))

(declare-fun m!1293383 () Bool)

(assert (=> start!120634 m!1293383))

(declare-fun m!1293385 () Bool)

(assert (=> start!120634 m!1293385))

(push 1)

(assert (not b!1404495))

(assert (not b!1404494))

(assert (not b!1404497))

(assert (not b!1404498))

(assert (not b!1404493))

(assert (not start!120634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!66910 () Bool)

(declare-fun call!66913 () Bool)

(assert (=> bm!66910 (= call!66913 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1404519 () Bool)

(declare-fun e!795075 () Bool)

(assert (=> b!1404519 (= e!795075 call!66913)))

(declare-fun b!1404520 () Bool)

(declare-fun e!795077 () Bool)

(assert (=> b!1404520 (= e!795077 e!795075)))

(declare-fun lt!618688 () (_ BitVec 64))

(assert (=> b!1404520 (= lt!618688 (select (arr!46372 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!618689 () Unit!47340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96043 (_ BitVec 64) (_ BitVec 32)) Unit!47340)

(assert (=> b!1404520 (= lt!618689 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618688 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1404520 (arrayContainsKey!0 a!2901 lt!618688 #b00000000000000000000000000000000)))

(declare-fun lt!618690 () Unit!47340)

(assert (=> b!1404520 (= lt!618690 lt!618689)))

(declare-fun res!943021 () Bool)

(assert (=> b!1404520 (= res!943021 (= (seekEntryOrOpen!0 (select (arr!46372 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10683 #b00000000000000000000000000000000)))))

(assert (=> b!1404520 (=> (not res!943021) (not e!795075))))

(declare-fun b!1404521 () Bool)

(declare-fun e!795076 () Bool)

(assert (=> b!1404521 (= e!795076 e!795077)))

(declare-fun c!130209 () Bool)

(assert (=> b!1404521 (= c!130209 (validKeyInArray!0 (select (arr!46372 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151253 () Bool)

(declare-fun res!943020 () Bool)

(assert (=> d!151253 (=> res!943020 e!795076)))

(assert (=> d!151253 (= res!943020 (bvsge #b00000000000000000000000000000000 (size!46922 a!2901)))))

(assert (=> d!151253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795076)))

(declare-fun b!1404522 () Bool)

(assert (=> b!1404522 (= e!795077 call!66913)))

(assert (= (and d!151253 (not res!943020)) b!1404521))

(assert (= (and b!1404521 c!130209) b!1404520))

(assert (= (and b!1404521 (not c!130209)) b!1404522))

(assert (= (and b!1404520 res!943021) b!1404519))

(assert (= (or b!1404519 b!1404522) bm!66910))

(declare-fun m!1293399 () Bool)

(assert (=> bm!66910 m!1293399))

(declare-fun m!1293401 () Bool)

(assert (=> b!1404520 m!1293401))

(declare-fun m!1293403 () Bool)

(assert (=> b!1404520 m!1293403))

(declare-fun m!1293405 () Bool)

(assert (=> b!1404520 m!1293405))

(assert (=> b!1404520 m!1293401))

(declare-fun m!1293407 () Bool)

(assert (=> b!1404520 m!1293407))

(assert (=> b!1404521 m!1293401))

(assert (=> b!1404521 m!1293401))

(declare-fun m!1293409 () Bool)

(assert (=> b!1404521 m!1293409))

(assert (=> b!1404493 d!151253))

(declare-fun d!151263 () Bool)

(assert (=> d!151263 (= (validKeyInArray!0 (select (arr!46372 a!2901) j!112)) (and (not (= (select (arr!46372 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46372 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404498 d!151263))

(declare-fun b!1404533 () Bool)

(declare-fun e!795087 () Bool)

(declare-fun call!66916 () Bool)

(assert (=> b!1404533 (= e!795087 call!66916)))

(declare-fun b!1404534 () Bool)

(declare-fun e!795086 () Bool)

(declare-fun e!795089 () Bool)

(assert (=> b!1404534 (= e!795086 e!795089)))

(declare-fun res!943029 () Bool)

(assert (=> b!1404534 (=> (not res!943029) (not e!795089))))

(declare-fun e!795088 () Bool)

(assert (=> b!1404534 (= res!943029 (not e!795088))))

(declare-fun res!943028 () Bool)

(assert (=> b!1404534 (=> (not res!943028) (not e!795088))))

(assert (=> b!1404534 (= res!943028 (validKeyInArray!0 (select (arr!46372 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404535 () Bool)

(assert (=> b!1404535 (= e!795087 call!66916)))

(declare-fun b!1404536 () Bool)

(declare-fun contains!9788 (List!32891 (_ BitVec 64)) Bool)

(assert (=> b!1404536 (= e!795088 (contains!9788 Nil!32888 (select (arr!46372 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404537 () Bool)

(assert (=> b!1404537 (= e!795089 e!795087)))

(declare-fun c!130212 () Bool)

(assert (=> b!1404537 (= c!130212 (validKeyInArray!0 (select (arr!46372 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66913 () Bool)

(assert (=> bm!66913 (= call!66916 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130212 (Cons!32887 (select (arr!46372 a!2901) #b00000000000000000000000000000000) Nil!32888) Nil!32888)))))

(declare-fun d!151265 () Bool)

(declare-fun res!943030 () Bool)

(assert (=> d!151265 (=> res!943030 e!795086)))

(assert (=> d!151265 (= res!943030 (bvsge #b00000000000000000000000000000000 (size!46922 a!2901)))))

(assert (=> d!151265 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32888) e!795086)))

(assert (= (and d!151265 (not res!943030)) b!1404534))

(assert (= (and b!1404534 res!943028) b!1404536))

(assert (= (and b!1404534 res!943029) b!1404537))

(assert (= (and b!1404537 c!130212) b!1404533))

(assert (= (and b!1404537 (not c!130212)) b!1404535))

(assert (= (or b!1404533 b!1404535) bm!66913))

(assert (=> b!1404534 m!1293401))

(assert (=> b!1404534 m!1293401))

(assert (=> b!1404534 m!1293409))

(assert (=> b!1404536 m!1293401))

(assert (=> b!1404536 m!1293401))

(declare-fun m!1293411 () Bool)

(assert (=> b!1404536 m!1293411))

(assert (=> b!1404537 m!1293401))

(assert (=> b!1404537 m!1293401))

(assert (=> b!1404537 m!1293409))

(assert (=> bm!66913 m!1293401))

(declare-fun m!1293413 () Bool)

(assert (=> bm!66913 m!1293413))

(assert (=> b!1404494 d!151265))

(declare-fun d!151267 () Bool)

(assert (=> d!151267 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120634 d!151267))

(declare-fun d!151273 () Bool)

(assert (=> d!151273 (= (array_inv!35400 a!2901) (bvsge (size!46922 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120634 d!151273))

(declare-fun b!1404646 () Bool)

(declare-fun lt!618726 () SeekEntryResult!10683)

(assert (=> b!1404646 (and (bvsge (index!45111 lt!618726) #b00000000000000000000000000000000) (bvslt (index!45111 lt!618726) (size!46922 a!2901)))))

(declare-fun e!795152 () Bool)

(assert (=> b!1404646 (= e!795152 (= (select (arr!46372 a!2901) (index!45111 lt!618726)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1404647 () Bool)

(declare-fun e!795149 () SeekEntryResult!10683)

(assert (=> b!1404647 (= e!795149 (Intermediate!10683 true (toIndex!0 (select (arr!46372 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404648 () Bool)

(assert (=> b!1404648 (and (bvsge (index!45111 lt!618726) #b00000000000000000000000000000000) (bvslt (index!45111 lt!618726) (size!46922 a!2901)))))

(declare-fun res!943055 () Bool)

(assert (=> b!1404648 (= res!943055 (= (select (arr!46372 a!2901) (index!45111 lt!618726)) (select (arr!46372 a!2901) j!112)))))

(assert (=> b!1404648 (=> res!943055 e!795152)))

(declare-fun e!795150 () Bool)

(assert (=> b!1404648 (= e!795150 e!795152)))

(declare-fun b!1404649 () Bool)

(declare-fun e!795151 () Bool)

(assert (=> b!1404649 (= e!795151 (bvsge (x!126718 lt!618726) #b01111111111111111111111111111110))))

(declare-fun b!1404650 () Bool)

(declare-fun e!795148 () SeekEntryResult!10683)

(assert (=> b!1404650 (= e!795149 e!795148)))

(declare-fun c!130255 () Bool)

(declare-fun lt!618725 () (_ BitVec 64))

(assert (=> b!1404650 (= c!130255 (or (= lt!618725 (select (arr!46372 a!2901) j!112)) (= (bvadd lt!618725 lt!618725) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1404651 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404651 (= e!795148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46372 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46372 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404652 () Bool)

(assert (=> b!1404652 (= e!795148 (Intermediate!10683 false (toIndex!0 (select (arr!46372 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404653 () Bool)

(assert (=> b!1404653 (= e!795151 e!795150)))

(declare-fun res!943057 () Bool)

(assert (=> b!1404653 (= res!943057 (and (is-Intermediate!10683 lt!618726) (not (undefined!11495 lt!618726)) (bvslt (x!126718 lt!618726) #b01111111111111111111111111111110) (bvsge (x!126718 lt!618726) #b00000000000000000000000000000000) (bvsge (x!126718 lt!618726) #b00000000000000000000000000000000)))))

(assert (=> b!1404653 (=> (not res!943057) (not e!795150))))

(declare-fun b!1404654 () Bool)

(assert (=> b!1404654 (and (bvsge (index!45111 lt!618726) #b00000000000000000000000000000000) (bvslt (index!45111 lt!618726) (size!46922 a!2901)))))

(declare-fun res!943056 () Bool)

(assert (=> b!1404654 (= res!943056 (= (select (arr!46372 a!2901) (index!45111 lt!618726)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404654 (=> res!943056 e!795152)))

(declare-fun d!151275 () Bool)

(assert (=> d!151275 e!795151))

(declare-fun c!130257 () Bool)

(assert (=> d!151275 (= c!130257 (and (is-Intermediate!10683 lt!618726) (undefined!11495 lt!618726)))))

(assert (=> d!151275 (= lt!618726 e!795149)))

(declare-fun c!130256 () Bool)

(assert (=> d!151275 (= c!130256 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151275 (= lt!618725 (select (arr!46372 a!2901) (toIndex!0 (select (arr!46372 a!2901) j!112) mask!2840)))))

(assert (=> d!151275 (validMask!0 mask!2840)))

(assert (=> d!151275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46372 a!2901) j!112) mask!2840) (select (arr!46372 a!2901) j!112) a!2901 mask!2840) lt!618726)))

(assert (= (and d!151275 c!130256) b!1404647))

(assert (= (and d!151275 (not c!130256)) b!1404650))

(assert (= (and b!1404650 c!130255) b!1404652))

(assert (= (and b!1404650 (not c!130255)) b!1404651))

(assert (= (and d!151275 c!130257) b!1404649))

(assert (= (and d!151275 (not c!130257)) b!1404653))

(assert (= (and b!1404653 res!943057) b!1404648))

(assert (= (and b!1404648 (not res!943055)) b!1404654))

(assert (= (and b!1404654 (not res!943056)) b!1404646))

(declare-fun m!1293451 () Bool)

(assert (=> b!1404646 m!1293451))

(assert (=> b!1404651 m!1293369))

(declare-fun m!1293453 () Bool)

(assert (=> b!1404651 m!1293453))

(assert (=> b!1404651 m!1293453))

(assert (=> b!1404651 m!1293365))

(declare-fun m!1293455 () Bool)

(assert (=> b!1404651 m!1293455))

(assert (=> b!1404654 m!1293451))

(assert (=> d!151275 m!1293369))

(declare-fun m!1293457 () Bool)

(assert (=> d!151275 m!1293457))

(assert (=> d!151275 m!1293383))

(assert (=> b!1404648 m!1293451))

(assert (=> b!1404495 d!151275))

(declare-fun b!1404683 () Bool)

(declare-fun e!795171 () SeekEntryResult!10683)

(declare-fun lt!618764 () SeekEntryResult!10683)

(assert (=> b!1404683 (= e!795171 (MissingZero!10683 (index!45111 lt!618764)))))

(declare-fun b!1404684 () Bool)

(declare-fun c!130270 () Bool)

(declare-fun lt!618765 () (_ BitVec 64))

(assert (=> b!1404684 (= c!130270 (= lt!618765 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!795173 () SeekEntryResult!10683)

(assert (=> b!1404684 (= e!795173 e!795171)))

(declare-fun b!1404685 () Bool)

(declare-fun e!795172 () SeekEntryResult!10683)

(assert (=> b!1404685 (= e!795172 Undefined!10683)))

(declare-fun d!151281 () Bool)

(declare-fun lt!618763 () SeekEntryResult!10683)

(assert (=> d!151281 (and (or (is-Undefined!10683 lt!618763) (not (is-Found!10683 lt!618763)) (and (bvsge (index!45110 lt!618763) #b00000000000000000000000000000000) (bvslt (index!45110 lt!618763) (size!46922 a!2901)))) (or (is-Undefined!10683 lt!618763) (is-Found!10683 lt!618763) (not (is-MissingZero!10683 lt!618763)) (and (bvsge (index!45109 lt!618763) #b00000000000000000000000000000000) (bvslt (index!45109 lt!618763) (size!46922 a!2901)))) (or (is-Undefined!10683 lt!618763) (is-Found!10683 lt!618763) (is-MissingZero!10683 lt!618763) (not (is-MissingVacant!10683 lt!618763)) (and (bvsge (index!45112 lt!618763) #b00000000000000000000000000000000) (bvslt (index!45112 lt!618763) (size!46922 a!2901)))) (or (is-Undefined!10683 lt!618763) (ite (is-Found!10683 lt!618763) (= (select (arr!46372 a!2901) (index!45110 lt!618763)) (select (arr!46372 a!2901) j!112)) (ite (is-MissingZero!10683 lt!618763) (= (select (arr!46372 a!2901) (index!45109 lt!618763)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10683 lt!618763) (= (select (arr!46372 a!2901) (index!45112 lt!618763)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151281 (= lt!618763 e!795172)))

(declare-fun c!130268 () Bool)

(assert (=> d!151281 (= c!130268 (and (is-Intermediate!10683 lt!618764) (undefined!11495 lt!618764)))))

(assert (=> d!151281 (= lt!618764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46372 a!2901) j!112) mask!2840) (select (arr!46372 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151281 (validMask!0 mask!2840)))

(assert (=> d!151281 (= (seekEntryOrOpen!0 (select (arr!46372 a!2901) j!112) a!2901 mask!2840) lt!618763)))

(declare-fun b!1404686 () Bool)

(assert (=> b!1404686 (= e!795172 e!795173)))

(assert (=> b!1404686 (= lt!618765 (select (arr!46372 a!2901) (index!45111 lt!618764)))))

(declare-fun c!130269 () Bool)

(assert (=> b!1404686 (= c!130269 (= lt!618765 (select (arr!46372 a!2901) j!112)))))

(declare-fun b!1404687 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96043 (_ BitVec 32)) SeekEntryResult!10683)

(assert (=> b!1404687 (= e!795171 (seekKeyOrZeroReturnVacant!0 (x!126718 lt!618764) (index!45111 lt!618764) (index!45111 lt!618764) (select (arr!46372 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404688 () Bool)

(assert (=> b!1404688 (= e!795173 (Found!10683 (index!45111 lt!618764)))))

(assert (= (and d!151281 c!130268) b!1404685))

(assert (= (and d!151281 (not c!130268)) b!1404686))

(assert (= (and b!1404686 c!130269) b!1404688))

(assert (= (and b!1404686 (not c!130269)) b!1404684))

(assert (= (and b!1404684 c!130270) b!1404683))

(assert (= (and b!1404684 (not c!130270)) b!1404687))

(assert (=> d!151281 m!1293369))

(assert (=> d!151281 m!1293365))

(assert (=> d!151281 m!1293375))

(declare-fun m!1293475 () Bool)

(assert (=> d!151281 m!1293475))

(assert (=> d!151281 m!1293383))

(assert (=> d!151281 m!1293365))

(assert (=> d!151281 m!1293369))

(declare-fun m!1293477 () Bool)

(assert (=> d!151281 m!1293477))

(declare-fun m!1293479 () Bool)

(assert (=> d!151281 m!1293479))

(declare-fun m!1293481 () Bool)

(assert (=> b!1404686 m!1293481))

(assert (=> b!1404687 m!1293365))

(declare-fun m!1293483 () Bool)

(assert (=> b!1404687 m!1293483))

(assert (=> b!1404495 d!151281))

(declare-fun d!151303 () Bool)

(assert (=> d!151303 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618771 () Unit!47340)

(declare-fun choose!38 (array!96043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47340)

(assert (=> d!151303 (= lt!618771 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151303 (validMask!0 mask!2840)))

(assert (=> d!151303 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!618771)))

(declare-fun bs!40924 () Bool)

(assert (= bs!40924 d!151303))

(assert (=> bs!40924 m!1293377))

(declare-fun m!1293503 () Bool)

(assert (=> bs!40924 m!1293503))

(assert (=> bs!40924 m!1293383))

(assert (=> b!1404495 d!151303))

(declare-fun d!151309 () Bool)

(declare-fun lt!618777 () (_ BitVec 32))

(declare-fun lt!618776 () (_ BitVec 32))

(assert (=> d!151309 (= lt!618777 (bvmul (bvxor lt!618776 (bvlshr lt!618776 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151309 (= lt!618776 ((_ extract 31 0) (bvand (bvxor (select (arr!46372 a!2901) j!112) (bvlshr (select (arr!46372 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151309 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943088 (let ((h!34138 ((_ extract 31 0) (bvand (bvxor (select (arr!46372 a!2901) j!112) (bvlshr (select (arr!46372 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126724 (bvmul (bvxor h!34138 (bvlshr h!34138 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126724 (bvlshr x!126724 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943088 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943088 #b00000000000000000000000000000000))))))

(assert (=> d!151309 (= (toIndex!0 (select (arr!46372 a!2901) j!112) mask!2840) (bvand (bvxor lt!618777 (bvlshr lt!618777 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1404495 d!151309))

(declare-fun bm!66925 () Bool)

(declare-fun call!66928 () Bool)

(assert (=> bm!66925 (= call!66928 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1404723 () Bool)

(declare-fun e!795201 () Bool)

(assert (=> b!1404723 (= e!795201 call!66928)))

(declare-fun b!1404724 () Bool)

(declare-fun e!795203 () Bool)

(assert (=> b!1404724 (= e!795203 e!795201)))

(declare-fun lt!618778 () (_ BitVec 64))

(assert (=> b!1404724 (= lt!618778 (select (arr!46372 a!2901) j!112))))

(declare-fun lt!618779 () Unit!47340)

(assert (=> b!1404724 (= lt!618779 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618778 j!112))))

(assert (=> b!1404724 (arrayContainsKey!0 a!2901 lt!618778 #b00000000000000000000000000000000)))

(declare-fun lt!618780 () Unit!47340)

(assert (=> b!1404724 (= lt!618780 lt!618779)))

(declare-fun res!943090 () Bool)

(assert (=> b!1404724 (= res!943090 (= (seekEntryOrOpen!0 (select (arr!46372 a!2901) j!112) a!2901 mask!2840) (Found!10683 j!112)))))

(assert (=> b!1404724 (=> (not res!943090) (not e!795201))))

(declare-fun b!1404725 () Bool)

(declare-fun e!795202 () Bool)

(assert (=> b!1404725 (= e!795202 e!795203)))

(declare-fun c!130278 () Bool)

(assert (=> b!1404725 (= c!130278 (validKeyInArray!0 (select (arr!46372 a!2901) j!112)))))

(declare-fun d!151311 () Bool)

