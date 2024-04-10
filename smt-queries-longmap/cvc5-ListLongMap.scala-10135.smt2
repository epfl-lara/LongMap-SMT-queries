; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119520 () Bool)

(assert start!119520)

(declare-fun res!932145 () Bool)

(declare-fun e!788555 () Bool)

(assert (=> start!119520 (=> (not res!932145) (not e!788555))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119520 (= res!932145 (validMask!0 mask!2840))))

(assert (=> start!119520 e!788555))

(assert (=> start!119520 true))

(declare-datatypes ((array!95253 0))(
  ( (array!95254 (arr!45986 (Array (_ BitVec 32) (_ BitVec 64))) (size!46536 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95253)

(declare-fun array_inv!35014 (array!95253) Bool)

(assert (=> start!119520 (array_inv!35014 a!2901)))

(declare-fun b!1392565 () Bool)

(declare-fun res!932146 () Bool)

(assert (=> b!1392565 (=> (not res!932146) (not e!788555))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392565 (= res!932146 (validKeyInArray!0 (select (arr!45986 a!2901) i!1037)))))

(declare-fun b!1392566 () Bool)

(declare-fun res!932140 () Bool)

(assert (=> b!1392566 (=> (not res!932140) (not e!788555))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1392566 (= res!932140 (and (= (size!46536 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46536 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46536 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392567 () Bool)

(declare-fun res!932142 () Bool)

(declare-fun e!788552 () Bool)

(assert (=> b!1392567 (=> res!932142 e!788552)))

(declare-datatypes ((SeekEntryResult!10303 0))(
  ( (MissingZero!10303 (index!43583 (_ BitVec 32))) (Found!10303 (index!43584 (_ BitVec 32))) (Intermediate!10303 (undefined!11115 Bool) (index!43585 (_ BitVec 32)) (x!125269 (_ BitVec 32))) (Undefined!10303) (MissingVacant!10303 (index!43586 (_ BitVec 32))) )
))
(declare-fun lt!611648 () SeekEntryResult!10303)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95253 (_ BitVec 32)) SeekEntryResult!10303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392567 (= res!932142 (not (= lt!611648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901)) mask!2840))))))

(declare-fun b!1392568 () Bool)

(declare-fun res!932141 () Bool)

(assert (=> b!1392568 (=> (not res!932141) (not e!788555))))

(assert (=> b!1392568 (= res!932141 (validKeyInArray!0 (select (arr!45986 a!2901) j!112)))))

(declare-fun b!1392569 () Bool)

(assert (=> b!1392569 (= e!788555 (not e!788552))))

(declare-fun res!932138 () Bool)

(assert (=> b!1392569 (=> res!932138 e!788552)))

(assert (=> b!1392569 (= res!932138 (or (not (is-Intermediate!10303 lt!611648)) (undefined!11115 lt!611648)))))

(declare-fun e!788554 () Bool)

(assert (=> b!1392569 e!788554))

(declare-fun res!932139 () Bool)

(assert (=> b!1392569 (=> (not res!932139) (not e!788554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95253 (_ BitVec 32)) Bool)

(assert (=> b!1392569 (= res!932139 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46610 0))(
  ( (Unit!46611) )
))
(declare-fun lt!611649 () Unit!46610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46610)

(assert (=> b!1392569 (= lt!611649 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1392569 (= lt!611648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840) (select (arr!45986 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392570 () Bool)

(declare-fun res!932143 () Bool)

(assert (=> b!1392570 (=> (not res!932143) (not e!788555))))

(declare-datatypes ((List!32505 0))(
  ( (Nil!32502) (Cons!32501 (h!33731 (_ BitVec 64)) (t!47199 List!32505)) )
))
(declare-fun arrayNoDuplicates!0 (array!95253 (_ BitVec 32) List!32505) Bool)

(assert (=> b!1392570 (= res!932143 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32502))))

(declare-fun b!1392571 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95253 (_ BitVec 32)) SeekEntryResult!10303)

(assert (=> b!1392571 (= e!788554 (= (seekEntryOrOpen!0 (select (arr!45986 a!2901) j!112) a!2901 mask!2840) (Found!10303 j!112)))))

(declare-fun b!1392572 () Bool)

(declare-fun res!932144 () Bool)

(assert (=> b!1392572 (=> (not res!932144) (not e!788555))))

(assert (=> b!1392572 (= res!932144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392573 () Bool)

(assert (=> b!1392573 (= e!788552 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (= (and start!119520 res!932145) b!1392566))

(assert (= (and b!1392566 res!932140) b!1392565))

(assert (= (and b!1392565 res!932146) b!1392568))

(assert (= (and b!1392568 res!932141) b!1392572))

(assert (= (and b!1392572 res!932144) b!1392570))

(assert (= (and b!1392570 res!932143) b!1392569))

(assert (= (and b!1392569 res!932139) b!1392571))

(assert (= (and b!1392569 (not res!932138)) b!1392567))

(assert (= (and b!1392567 (not res!932142)) b!1392573))

(declare-fun m!1278333 () Bool)

(assert (=> start!119520 m!1278333))

(declare-fun m!1278335 () Bool)

(assert (=> start!119520 m!1278335))

(declare-fun m!1278337 () Bool)

(assert (=> b!1392568 m!1278337))

(assert (=> b!1392568 m!1278337))

(declare-fun m!1278339 () Bool)

(assert (=> b!1392568 m!1278339))

(declare-fun m!1278341 () Bool)

(assert (=> b!1392567 m!1278341))

(declare-fun m!1278343 () Bool)

(assert (=> b!1392567 m!1278343))

(assert (=> b!1392567 m!1278343))

(declare-fun m!1278345 () Bool)

(assert (=> b!1392567 m!1278345))

(assert (=> b!1392567 m!1278345))

(assert (=> b!1392567 m!1278343))

(declare-fun m!1278347 () Bool)

(assert (=> b!1392567 m!1278347))

(declare-fun m!1278349 () Bool)

(assert (=> b!1392570 m!1278349))

(assert (=> b!1392569 m!1278337))

(declare-fun m!1278351 () Bool)

(assert (=> b!1392569 m!1278351))

(assert (=> b!1392569 m!1278337))

(declare-fun m!1278353 () Bool)

(assert (=> b!1392569 m!1278353))

(assert (=> b!1392569 m!1278351))

(assert (=> b!1392569 m!1278337))

(declare-fun m!1278355 () Bool)

(assert (=> b!1392569 m!1278355))

(declare-fun m!1278357 () Bool)

(assert (=> b!1392569 m!1278357))

(declare-fun m!1278359 () Bool)

(assert (=> b!1392572 m!1278359))

(declare-fun m!1278361 () Bool)

(assert (=> b!1392565 m!1278361))

(assert (=> b!1392565 m!1278361))

(declare-fun m!1278363 () Bool)

(assert (=> b!1392565 m!1278363))

(assert (=> b!1392571 m!1278337))

(assert (=> b!1392571 m!1278337))

(declare-fun m!1278365 () Bool)

(assert (=> b!1392571 m!1278365))

(push 1)

(assert (not b!1392571))

(assert (not b!1392565))

(assert (not b!1392572))

(assert (not b!1392569))

(assert (not b!1392567))

(assert (not start!119520))

(assert (not b!1392570))

(assert (not b!1392568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1392648 () Bool)

(declare-fun e!788597 () Bool)

(declare-fun call!66787 () Bool)

(assert (=> b!1392648 (= e!788597 call!66787)))

(declare-fun b!1392649 () Bool)

(declare-fun e!788596 () Bool)

(assert (=> b!1392649 (= e!788596 call!66787)))

(declare-fun b!1392650 () Bool)

(declare-fun e!788595 () Bool)

(assert (=> b!1392650 (= e!788595 e!788597)))

(declare-fun c!129669 () Bool)

(assert (=> b!1392650 (= c!129669 (validKeyInArray!0 (select (arr!45986 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392651 () Bool)

(assert (=> b!1392651 (= e!788597 e!788596)))

(declare-fun lt!611679 () (_ BitVec 64))

(assert (=> b!1392651 (= lt!611679 (select (arr!45986 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611678 () Unit!46610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95253 (_ BitVec 64) (_ BitVec 32)) Unit!46610)

(assert (=> b!1392651 (= lt!611678 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611679 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392651 (arrayContainsKey!0 a!2901 lt!611679 #b00000000000000000000000000000000)))

(declare-fun lt!611677 () Unit!46610)

(assert (=> b!1392651 (= lt!611677 lt!611678)))

(declare-fun res!932212 () Bool)

(assert (=> b!1392651 (= res!932212 (= (seekEntryOrOpen!0 (select (arr!45986 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10303 #b00000000000000000000000000000000)))))

(assert (=> b!1392651 (=> (not res!932212) (not e!788596))))

(declare-fun bm!66784 () Bool)

(assert (=> bm!66784 (= call!66787 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150503 () Bool)

(declare-fun res!932211 () Bool)

(assert (=> d!150503 (=> res!932211 e!788595)))

(assert (=> d!150503 (= res!932211 (bvsge #b00000000000000000000000000000000 (size!46536 a!2901)))))

(assert (=> d!150503 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788595)))

(assert (= (and d!150503 (not res!932211)) b!1392650))

(assert (= (and b!1392650 c!129669) b!1392651))

(assert (= (and b!1392650 (not c!129669)) b!1392648))

(assert (= (and b!1392651 res!932212) b!1392649))

(assert (= (or b!1392649 b!1392648) bm!66784))

(declare-fun m!1278437 () Bool)

(assert (=> b!1392650 m!1278437))

(assert (=> b!1392650 m!1278437))

(declare-fun m!1278443 () Bool)

(assert (=> b!1392650 m!1278443))

(assert (=> b!1392651 m!1278437))

(declare-fun m!1278445 () Bool)

(assert (=> b!1392651 m!1278445))

(declare-fun m!1278447 () Bool)

(assert (=> b!1392651 m!1278447))

(assert (=> b!1392651 m!1278437))

(declare-fun m!1278449 () Bool)

(assert (=> b!1392651 m!1278449))

(declare-fun m!1278451 () Bool)

(assert (=> bm!66784 m!1278451))

(assert (=> b!1392572 d!150503))

(declare-fun b!1392693 () Bool)

(declare-fun e!788622 () Bool)

(declare-fun lt!611701 () SeekEntryResult!10303)

(assert (=> b!1392693 (= e!788622 (bvsge (x!125269 lt!611701) #b01111111111111111111111111111110))))

(declare-fun e!788621 () SeekEntryResult!10303)

(declare-fun b!1392694 () Bool)

(assert (=> b!1392694 (= e!788621 (Intermediate!10303 false (toIndex!0 (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392695 () Bool)

(assert (=> b!1392695 (and (bvsge (index!43585 lt!611701) #b00000000000000000000000000000000) (bvslt (index!43585 lt!611701) (size!46536 (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901)))))))

(declare-fun res!932227 () Bool)

(assert (=> b!1392695 (= res!932227 (= (select (arr!45986 (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901))) (index!43585 lt!611701)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788623 () Bool)

(assert (=> b!1392695 (=> res!932227 e!788623)))

(declare-fun b!1392696 () Bool)

(assert (=> b!1392696 (and (bvsge (index!43585 lt!611701) #b00000000000000000000000000000000) (bvslt (index!43585 lt!611701) (size!46536 (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901)))))))

(declare-fun res!932226 () Bool)

(assert (=> b!1392696 (= res!932226 (= (select (arr!45986 (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901))) (index!43585 lt!611701)) (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1392696 (=> res!932226 e!788623)))

(declare-fun e!788625 () Bool)

(assert (=> b!1392696 (= e!788625 e!788623)))

(declare-fun e!788624 () SeekEntryResult!10303)

(declare-fun b!1392697 () Bool)

(assert (=> b!1392697 (= e!788624 (Intermediate!10303 true (toIndex!0 (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392698 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392698 (= e!788621 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901)) mask!2840))))

(declare-fun b!1392692 () Bool)

(assert (=> b!1392692 (= e!788624 e!788621)))

(declare-fun lt!611700 () (_ BitVec 64))

(declare-fun c!129684 () Bool)

(assert (=> b!1392692 (= c!129684 (or (= lt!611700 (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!611700 lt!611700) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!150507 () Bool)

(assert (=> d!150507 e!788622))

(declare-fun c!129685 () Bool)

(assert (=> d!150507 (= c!129685 (and (is-Intermediate!10303 lt!611701) (undefined!11115 lt!611701)))))

(assert (=> d!150507 (= lt!611701 e!788624)))

(declare-fun c!129683 () Bool)

(assert (=> d!150507 (= c!129683 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150507 (= lt!611700 (select (arr!45986 (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901))) (toIndex!0 (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150507 (validMask!0 mask!2840)))

(assert (=> d!150507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901)) mask!2840) lt!611701)))

(declare-fun b!1392699 () Bool)

(assert (=> b!1392699 (= e!788622 e!788625)))

(declare-fun res!932225 () Bool)

(assert (=> b!1392699 (= res!932225 (and (is-Intermediate!10303 lt!611701) (not (undefined!11115 lt!611701)) (bvslt (x!125269 lt!611701) #b01111111111111111111111111111110) (bvsge (x!125269 lt!611701) #b00000000000000000000000000000000) (bvsge (x!125269 lt!611701) #b00000000000000000000000000000000)))))

(assert (=> b!1392699 (=> (not res!932225) (not e!788625))))

(declare-fun b!1392700 () Bool)

(assert (=> b!1392700 (and (bvsge (index!43585 lt!611701) #b00000000000000000000000000000000) (bvslt (index!43585 lt!611701) (size!46536 (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901)))))))

(assert (=> b!1392700 (= e!788623 (= (select (arr!45986 (array!95254 (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901))) (index!43585 lt!611701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150507 c!129683) b!1392697))

(assert (= (and d!150507 (not c!129683)) b!1392692))

(assert (= (and b!1392692 c!129684) b!1392694))

(assert (= (and b!1392692 (not c!129684)) b!1392698))

(assert (= (and d!150507 c!129685) b!1392693))

(assert (= (and d!150507 (not c!129685)) b!1392699))

(assert (= (and b!1392699 res!932225) b!1392696))

(assert (= (and b!1392696 (not res!932226)) b!1392695))

(assert (= (and b!1392695 (not res!932227)) b!1392700))

(declare-fun m!1278467 () Bool)

(assert (=> b!1392696 m!1278467))

(assert (=> b!1392700 m!1278467))

(assert (=> d!150507 m!1278345))

(declare-fun m!1278469 () Bool)

(assert (=> d!150507 m!1278469))

(assert (=> d!150507 m!1278333))

(assert (=> b!1392695 m!1278467))

(assert (=> b!1392698 m!1278345))

(declare-fun m!1278471 () Bool)

(assert (=> b!1392698 m!1278471))

(assert (=> b!1392698 m!1278471))

(assert (=> b!1392698 m!1278343))

(declare-fun m!1278473 () Bool)

(assert (=> b!1392698 m!1278473))

(assert (=> b!1392567 d!150507))

(declare-fun d!150521 () Bool)

(declare-fun lt!611709 () (_ BitVec 32))

(declare-fun lt!611708 () (_ BitVec 32))

(assert (=> d!150521 (= lt!611709 (bvmul (bvxor lt!611708 (bvlshr lt!611708 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150521 (= lt!611708 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150521 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932234 (let ((h!33734 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125274 (bvmul (bvxor h!33734 (bvlshr h!33734 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125274 (bvlshr x!125274 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932234 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932234 #b00000000000000000000000000000000))))))

(assert (=> d!150521 (= (toIndex!0 (select (store (arr!45986 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611709 (bvlshr lt!611709 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392567 d!150521))

(declare-fun d!150525 () Bool)

(assert (=> d!150525 (= (validKeyInArray!0 (select (arr!45986 a!2901) j!112)) (and (not (= (select (arr!45986 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45986 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392568 d!150525))

(declare-fun b!1392728 () Bool)

(declare-fun e!788647 () Bool)

(declare-fun call!66793 () Bool)

(assert (=> b!1392728 (= e!788647 call!66793)))

(declare-fun b!1392729 () Bool)

(declare-fun e!788646 () Bool)

(assert (=> b!1392729 (= e!788646 call!66793)))

(declare-fun b!1392730 () Bool)

(declare-fun e!788645 () Bool)

(assert (=> b!1392730 (= e!788645 e!788647)))

(declare-fun c!129693 () Bool)

(assert (=> b!1392730 (= c!129693 (validKeyInArray!0 (select (arr!45986 a!2901) j!112)))))

(declare-fun b!1392731 () Bool)

(assert (=> b!1392731 (= e!788647 e!788646)))

(declare-fun lt!611712 () (_ BitVec 64))

(assert (=> b!1392731 (= lt!611712 (select (arr!45986 a!2901) j!112))))

(declare-fun lt!611711 () Unit!46610)

(assert (=> b!1392731 (= lt!611711 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611712 j!112))))

(assert (=> b!1392731 (arrayContainsKey!0 a!2901 lt!611712 #b00000000000000000000000000000000)))

(declare-fun lt!611710 () Unit!46610)

(assert (=> b!1392731 (= lt!611710 lt!611711)))

(declare-fun res!932246 () Bool)

(assert (=> b!1392731 (= res!932246 (= (seekEntryOrOpen!0 (select (arr!45986 a!2901) j!112) a!2901 mask!2840) (Found!10303 j!112)))))

(assert (=> b!1392731 (=> (not res!932246) (not e!788646))))

(declare-fun bm!66790 () Bool)

(assert (=> bm!66790 (= call!66793 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150527 () Bool)

(declare-fun res!932245 () Bool)

(assert (=> d!150527 (=> res!932245 e!788645)))

(assert (=> d!150527 (= res!932245 (bvsge j!112 (size!46536 a!2901)))))

(assert (=> d!150527 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788645)))

(assert (= (and d!150527 (not res!932245)) b!1392730))

(assert (= (and b!1392730 c!129693) b!1392731))

(assert (= (and b!1392730 (not c!129693)) b!1392728))

(assert (= (and b!1392731 res!932246) b!1392729))

(assert (= (or b!1392729 b!1392728) bm!66790))

(assert (=> b!1392730 m!1278337))

(assert (=> b!1392730 m!1278337))

(assert (=> b!1392730 m!1278339))

(assert (=> b!1392731 m!1278337))

(declare-fun m!1278483 () Bool)

(assert (=> b!1392731 m!1278483))

(declare-fun m!1278485 () Bool)

(assert (=> b!1392731 m!1278485))

(assert (=> b!1392731 m!1278337))

(assert (=> b!1392731 m!1278365))

(declare-fun m!1278487 () Bool)

(assert (=> bm!66790 m!1278487))

(assert (=> b!1392569 d!150527))

(declare-fun d!150529 () Bool)

(assert (=> d!150529 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611725 () Unit!46610)

(declare-fun choose!38 (array!95253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46610)

(assert (=> d!150529 (= lt!611725 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150529 (validMask!0 mask!2840)))

(assert (=> d!150529 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611725)))

(declare-fun bs!40515 () Bool)

(assert (= bs!40515 d!150529))

(assert (=> bs!40515 m!1278357))

(declare-fun m!1278501 () Bool)

(assert (=> bs!40515 m!1278501))

(assert (=> bs!40515 m!1278333))

(assert (=> b!1392569 d!150529))

(declare-fun b!1392747 () Bool)

(declare-fun e!788658 () Bool)

(declare-fun lt!611727 () SeekEntryResult!10303)

(assert (=> b!1392747 (= e!788658 (bvsge (x!125269 lt!611727) #b01111111111111111111111111111110))))

(declare-fun b!1392748 () Bool)

(declare-fun e!788657 () SeekEntryResult!10303)

(assert (=> b!1392748 (= e!788657 (Intermediate!10303 false (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392749 () Bool)

(assert (=> b!1392749 (and (bvsge (index!43585 lt!611727) #b00000000000000000000000000000000) (bvslt (index!43585 lt!611727) (size!46536 a!2901)))))

(declare-fun res!932255 () Bool)

(assert (=> b!1392749 (= res!932255 (= (select (arr!45986 a!2901) (index!43585 lt!611727)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788659 () Bool)

(assert (=> b!1392749 (=> res!932255 e!788659)))

(declare-fun b!1392750 () Bool)

(assert (=> b!1392750 (and (bvsge (index!43585 lt!611727) #b00000000000000000000000000000000) (bvslt (index!43585 lt!611727) (size!46536 a!2901)))))

(declare-fun res!932254 () Bool)

(assert (=> b!1392750 (= res!932254 (= (select (arr!45986 a!2901) (index!43585 lt!611727)) (select (arr!45986 a!2901) j!112)))))

(assert (=> b!1392750 (=> res!932254 e!788659)))

(declare-fun e!788661 () Bool)

(assert (=> b!1392750 (= e!788661 e!788659)))

(declare-fun b!1392751 () Bool)

(declare-fun e!788660 () SeekEntryResult!10303)

(assert (=> b!1392751 (= e!788660 (Intermediate!10303 true (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392752 () Bool)

(assert (=> b!1392752 (= e!788657 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45986 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392746 () Bool)

(assert (=> b!1392746 (= e!788660 e!788657)))

(declare-fun lt!611726 () (_ BitVec 64))

(declare-fun c!129699 () Bool)

(assert (=> b!1392746 (= c!129699 (or (= lt!611726 (select (arr!45986 a!2901) j!112)) (= (bvadd lt!611726 lt!611726) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!150541 () Bool)

(assert (=> d!150541 e!788658))

(declare-fun c!129700 () Bool)

(assert (=> d!150541 (= c!129700 (and (is-Intermediate!10303 lt!611727) (undefined!11115 lt!611727)))))

(assert (=> d!150541 (= lt!611727 e!788660)))

(declare-fun c!129698 () Bool)

(assert (=> d!150541 (= c!129698 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150541 (= lt!611726 (select (arr!45986 a!2901) (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840)))))

(assert (=> d!150541 (validMask!0 mask!2840)))

(assert (=> d!150541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840) (select (arr!45986 a!2901) j!112) a!2901 mask!2840) lt!611727)))

(declare-fun b!1392753 () Bool)

(assert (=> b!1392753 (= e!788658 e!788661)))

(declare-fun res!932253 () Bool)

(assert (=> b!1392753 (= res!932253 (and (is-Intermediate!10303 lt!611727) (not (undefined!11115 lt!611727)) (bvslt (x!125269 lt!611727) #b01111111111111111111111111111110) (bvsge (x!125269 lt!611727) #b00000000000000000000000000000000) (bvsge (x!125269 lt!611727) #b00000000000000000000000000000000)))))

(assert (=> b!1392753 (=> (not res!932253) (not e!788661))))

(declare-fun b!1392754 () Bool)

(assert (=> b!1392754 (and (bvsge (index!43585 lt!611727) #b00000000000000000000000000000000) (bvslt (index!43585 lt!611727) (size!46536 a!2901)))))

(assert (=> b!1392754 (= e!788659 (= (select (arr!45986 a!2901) (index!43585 lt!611727)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150541 c!129698) b!1392751))

(assert (= (and d!150541 (not c!129698)) b!1392746))

(assert (= (and b!1392746 c!129699) b!1392748))

(assert (= (and b!1392746 (not c!129699)) b!1392752))

(assert (= (and d!150541 c!129700) b!1392747))

(assert (= (and d!150541 (not c!129700)) b!1392753))

(assert (= (and b!1392753 res!932253) b!1392750))

(assert (= (and b!1392750 (not res!932254)) b!1392749))

(assert (= (and b!1392749 (not res!932255)) b!1392754))

(declare-fun m!1278503 () Bool)

(assert (=> b!1392750 m!1278503))

(assert (=> b!1392754 m!1278503))

(assert (=> d!150541 m!1278351))

(declare-fun m!1278505 () Bool)

(assert (=> d!150541 m!1278505))

(assert (=> d!150541 m!1278333))

(assert (=> b!1392749 m!1278503))

(assert (=> b!1392752 m!1278351))

(declare-fun m!1278507 () Bool)

(assert (=> b!1392752 m!1278507))

(assert (=> b!1392752 m!1278507))

(assert (=> b!1392752 m!1278337))

(declare-fun m!1278509 () Bool)

(assert (=> b!1392752 m!1278509))

(assert (=> b!1392569 d!150541))

(declare-fun d!150543 () Bool)

(declare-fun lt!611729 () (_ BitVec 32))

(declare-fun lt!611728 () (_ BitVec 32))

(assert (=> d!150543 (= lt!611729 (bvmul (bvxor lt!611728 (bvlshr lt!611728 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150543 (= lt!611728 ((_ extract 31 0) (bvand (bvxor (select (arr!45986 a!2901) j!112) (bvlshr (select (arr!45986 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150543 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932234 (let ((h!33734 ((_ extract 31 0) (bvand (bvxor (select (arr!45986 a!2901) j!112) (bvlshr (select (arr!45986 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125274 (bvmul (bvxor h!33734 (bvlshr h!33734 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125274 (bvlshr x!125274 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932234 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932234 #b00000000000000000000000000000000))))))

(assert (=> d!150543 (= (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840) (bvand (bvxor lt!611729 (bvlshr lt!611729 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392569 d!150543))

(declare-fun b!1392784 () Bool)

(declare-fun e!788687 () Bool)

(declare-fun e!788686 () Bool)

(assert (=> b!1392784 (= e!788687 e!788686)))

(declare-fun c!129707 () Bool)

(assert (=> b!1392784 (= c!129707 (validKeyInArray!0 (select (arr!45986 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392785 () Bool)

(declare-fun call!66801 () Bool)

(assert (=> b!1392785 (= e!788686 call!66801)))

(declare-fun b!1392786 () Bool)

(assert (=> b!1392786 (= e!788686 call!66801)))

(declare-fun b!1392787 () Bool)

(declare-fun e!788688 () Bool)

(declare-fun contains!9773 (List!32505 (_ BitVec 64)) Bool)

(assert (=> b!1392787 (= e!788688 (contains!9773 Nil!32502 (select (arr!45986 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392788 () Bool)

(declare-fun e!788685 () Bool)

(assert (=> b!1392788 (= e!788685 e!788687)))

(declare-fun res!932275 () Bool)

(assert (=> b!1392788 (=> (not res!932275) (not e!788687))))

(assert (=> b!1392788 (= res!932275 (not e!788688))))

(declare-fun res!932273 () Bool)

(assert (=> b!1392788 (=> (not res!932273) (not e!788688))))

(assert (=> b!1392788 (= res!932273 (validKeyInArray!0 (select (arr!45986 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66798 () Bool)

(assert (=> bm!66798 (= call!66801 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129707 (Cons!32501 (select (arr!45986 a!2901) #b00000000000000000000000000000000) Nil!32502) Nil!32502)))))

(declare-fun d!150545 () Bool)

(declare-fun res!932274 () Bool)

(assert (=> d!150545 (=> res!932274 e!788685)))

(assert (=> d!150545 (= res!932274 (bvsge #b00000000000000000000000000000000 (size!46536 a!2901)))))

(assert (=> d!150545 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32502) e!788685)))

(assert (= (and d!150545 (not res!932274)) b!1392788))

(assert (= (and b!1392788 res!932273) b!1392787))

(assert (= (and b!1392788 res!932275) b!1392784))

(assert (= (and b!1392784 c!129707) b!1392785))

(assert (= (and b!1392784 (not c!129707)) b!1392786))

(assert (= (or b!1392785 b!1392786) bm!66798))

(assert (=> b!1392784 m!1278437))

(assert (=> b!1392784 m!1278437))

(assert (=> b!1392784 m!1278443))

(assert (=> b!1392787 m!1278437))

(assert (=> b!1392787 m!1278437))

(declare-fun m!1278527 () Bool)

(assert (=> b!1392787 m!1278527))

(assert (=> b!1392788 m!1278437))

(assert (=> b!1392788 m!1278437))

(assert (=> b!1392788 m!1278443))

(assert (=> bm!66798 m!1278437))

(declare-fun m!1278529 () Bool)

(assert (=> bm!66798 m!1278529))

(assert (=> b!1392570 d!150545))

(declare-fun d!150551 () Bool)

(assert (=> d!150551 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119520 d!150551))

(declare-fun d!150557 () Bool)

(assert (=> d!150557 (= (array_inv!35014 a!2901) (bvsge (size!46536 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119520 d!150557))

(declare-fun d!150561 () Bool)

(assert (=> d!150561 (= (validKeyInArray!0 (select (arr!45986 a!2901) i!1037)) (and (not (= (select (arr!45986 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45986 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392565 d!150561))

(declare-fun b!1392858 () Bool)

(declare-fun e!788726 () SeekEntryResult!10303)

(declare-fun e!788727 () SeekEntryResult!10303)

(assert (=> b!1392858 (= e!788726 e!788727)))

(declare-fun lt!611761 () (_ BitVec 64))

(declare-fun lt!611760 () SeekEntryResult!10303)

(assert (=> b!1392858 (= lt!611761 (select (arr!45986 a!2901) (index!43585 lt!611760)))))

(declare-fun c!129740 () Bool)

(assert (=> b!1392858 (= c!129740 (= lt!611761 (select (arr!45986 a!2901) j!112)))))

(declare-fun b!1392859 () Bool)

(declare-fun e!788725 () SeekEntryResult!10303)

(assert (=> b!1392859 (= e!788725 (MissingZero!10303 (index!43585 lt!611760)))))

(declare-fun b!1392860 () Bool)

(declare-fun c!129739 () Bool)

(assert (=> b!1392860 (= c!129739 (= lt!611761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392860 (= e!788727 e!788725)))

(declare-fun b!1392861 () Bool)

(assert (=> b!1392861 (= e!788726 Undefined!10303)))

(declare-fun b!1392862 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95253 (_ BitVec 32)) SeekEntryResult!10303)

(assert (=> b!1392862 (= e!788725 (seekKeyOrZeroReturnVacant!0 (x!125269 lt!611760) (index!43585 lt!611760) (index!43585 lt!611760) (select (arr!45986 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150563 () Bool)

(declare-fun lt!611762 () SeekEntryResult!10303)

(assert (=> d!150563 (and (or (is-Undefined!10303 lt!611762) (not (is-Found!10303 lt!611762)) (and (bvsge (index!43584 lt!611762) #b00000000000000000000000000000000) (bvslt (index!43584 lt!611762) (size!46536 a!2901)))) (or (is-Undefined!10303 lt!611762) (is-Found!10303 lt!611762) (not (is-MissingZero!10303 lt!611762)) (and (bvsge (index!43583 lt!611762) #b00000000000000000000000000000000) (bvslt (index!43583 lt!611762) (size!46536 a!2901)))) (or (is-Undefined!10303 lt!611762) (is-Found!10303 lt!611762) (is-MissingZero!10303 lt!611762) (not (is-MissingVacant!10303 lt!611762)) (and (bvsge (index!43586 lt!611762) #b00000000000000000000000000000000) (bvslt (index!43586 lt!611762) (size!46536 a!2901)))) (or (is-Undefined!10303 lt!611762) (ite (is-Found!10303 lt!611762) (= (select (arr!45986 a!2901) (index!43584 lt!611762)) (select (arr!45986 a!2901) j!112)) (ite (is-MissingZero!10303 lt!611762) (= (select (arr!45986 a!2901) (index!43583 lt!611762)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10303 lt!611762) (= (select (arr!45986 a!2901) (index!43586 lt!611762)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150563 (= lt!611762 e!788726)))

(declare-fun c!129738 () Bool)

(assert (=> d!150563 (= c!129738 (and (is-Intermediate!10303 lt!611760) (undefined!11115 lt!611760)))))

(assert (=> d!150563 (= lt!611760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840) (select (arr!45986 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150563 (validMask!0 mask!2840)))

(assert (=> d!150563 (= (seekEntryOrOpen!0 (select (arr!45986 a!2901) j!112) a!2901 mask!2840) lt!611762)))

(declare-fun b!1392863 () Bool)

(assert (=> b!1392863 (= e!788727 (Found!10303 (index!43585 lt!611760)))))

(assert (= (and d!150563 c!129738) b!1392861))

(assert (= (and d!150563 (not c!129738)) b!1392858))

(assert (= (and b!1392858 c!129740) b!1392863))

(assert (= (and b!1392858 (not c!129740)) b!1392860))

(assert (= (and b!1392860 c!129739) b!1392859))

(assert (= (and b!1392860 (not c!129739)) b!1392862))

(declare-fun m!1278549 () Bool)

(assert (=> b!1392858 m!1278549))

(assert (=> b!1392862 m!1278337))

(declare-fun m!1278551 () Bool)

(assert (=> b!1392862 m!1278551))

(assert (=> d!150563 m!1278351))

(assert (=> d!150563 m!1278337))

(assert (=> d!150563 m!1278355))

(assert (=> d!150563 m!1278337))

(assert (=> d!150563 m!1278351))

(declare-fun m!1278553 () Bool)

(assert (=> d!150563 m!1278553))

(assert (=> d!150563 m!1278333))

(declare-fun m!1278555 () Bool)

(assert (=> d!150563 m!1278555))

(declare-fun m!1278557 () Bool)

(assert (=> d!150563 m!1278557))

(assert (=> b!1392571 d!150563))

(push 1)

(assert (not b!1392752))

(assert (not bm!66790))

(assert (not b!1392862))

(assert (not b!1392784))

(assert (not d!150541))

(assert (not b!1392788))

(assert (not b!1392698))

(assert (not d!150563))

(assert (not d!150529))

(assert (not d!150507))

(assert (not b!1392731))

(assert (not b!1392730))

(assert (not bm!66784))

(assert (not b!1392651))

(assert (not b!1392787))

(assert (not bm!66798))

(assert (not b!1392650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

