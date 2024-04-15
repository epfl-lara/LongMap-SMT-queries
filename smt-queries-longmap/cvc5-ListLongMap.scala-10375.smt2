; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122118 () Bool)

(assert start!122118)

(declare-fun b!1417053 () Bool)

(declare-fun res!952982 () Bool)

(declare-fun e!801993 () Bool)

(assert (=> b!1417053 (=> (not res!952982) (not e!801993))))

(declare-datatypes ((array!96706 0))(
  ( (array!96707 (arr!46683 (Array (_ BitVec 32) (_ BitVec 64))) (size!47235 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96706)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417053 (= res!952982 (validKeyInArray!0 (select (arr!46683 a!2901) j!112)))))

(declare-fun b!1417054 () Bool)

(declare-fun res!952985 () Bool)

(assert (=> b!1417054 (=> (not res!952985) (not e!801993))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417054 (= res!952985 (validKeyInArray!0 (select (arr!46683 a!2901) i!1037)))))

(declare-fun b!1417055 () Bool)

(declare-fun res!952983 () Bool)

(assert (=> b!1417055 (=> (not res!952983) (not e!801993))))

(declare-datatypes ((List!33280 0))(
  ( (Nil!33277) (Cons!33276 (h!34566 (_ BitVec 64)) (t!47966 List!33280)) )
))
(declare-fun arrayNoDuplicates!0 (array!96706 (_ BitVec 32) List!33280) Bool)

(assert (=> b!1417055 (= res!952983 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33277))))

(declare-fun b!1417056 () Bool)

(declare-fun res!952987 () Bool)

(assert (=> b!1417056 (=> (not res!952987) (not e!801993))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96706 (_ BitVec 32)) Bool)

(assert (=> b!1417056 (= res!952987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!952986 () Bool)

(assert (=> start!122118 (=> (not res!952986) (not e!801993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122118 (= res!952986 (validMask!0 mask!2840))))

(assert (=> start!122118 e!801993))

(assert (=> start!122118 true))

(declare-fun array_inv!35916 (array!96706) Bool)

(assert (=> start!122118 (array_inv!35916 a!2901)))

(declare-fun e!801994 () Bool)

(declare-fun b!1417057 () Bool)

(declare-datatypes ((SeekEntryResult!11020 0))(
  ( (MissingZero!11020 (index!46472 (_ BitVec 32))) (Found!11020 (index!46473 (_ BitVec 32))) (Intermediate!11020 (undefined!11832 Bool) (index!46474 (_ BitVec 32)) (x!128062 (_ BitVec 32))) (Undefined!11020) (MissingVacant!11020 (index!46475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96706 (_ BitVec 32)) SeekEntryResult!11020)

(assert (=> b!1417057 (= e!801994 (= (seekEntryOrOpen!0 (select (arr!46683 a!2901) j!112) a!2901 mask!2840) (Found!11020 j!112)))))

(declare-fun b!1417058 () Bool)

(declare-fun res!952981 () Bool)

(assert (=> b!1417058 (=> (not res!952981) (not e!801993))))

(assert (=> b!1417058 (= res!952981 (and (= (size!47235 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47235 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47235 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417059 () Bool)

(declare-fun lt!625051 () SeekEntryResult!11020)

(assert (=> b!1417059 (= e!801993 (not (is-Intermediate!11020 lt!625051)))))

(assert (=> b!1417059 e!801994))

(declare-fun res!952984 () Bool)

(assert (=> b!1417059 (=> (not res!952984) (not e!801994))))

(assert (=> b!1417059 (= res!952984 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47857 0))(
  ( (Unit!47858) )
))
(declare-fun lt!625052 () Unit!47857)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47857)

(assert (=> b!1417059 (= lt!625052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96706 (_ BitVec 32)) SeekEntryResult!11020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417059 (= lt!625051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840) (select (arr!46683 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!122118 res!952986) b!1417058))

(assert (= (and b!1417058 res!952981) b!1417054))

(assert (= (and b!1417054 res!952985) b!1417053))

(assert (= (and b!1417053 res!952982) b!1417056))

(assert (= (and b!1417056 res!952987) b!1417055))

(assert (= (and b!1417055 res!952983) b!1417059))

(assert (= (and b!1417059 res!952984) b!1417057))

(declare-fun m!1307399 () Bool)

(assert (=> b!1417057 m!1307399))

(assert (=> b!1417057 m!1307399))

(declare-fun m!1307401 () Bool)

(assert (=> b!1417057 m!1307401))

(declare-fun m!1307403 () Bool)

(assert (=> b!1417054 m!1307403))

(assert (=> b!1417054 m!1307403))

(declare-fun m!1307405 () Bool)

(assert (=> b!1417054 m!1307405))

(assert (=> b!1417053 m!1307399))

(assert (=> b!1417053 m!1307399))

(declare-fun m!1307407 () Bool)

(assert (=> b!1417053 m!1307407))

(assert (=> b!1417059 m!1307399))

(declare-fun m!1307409 () Bool)

(assert (=> b!1417059 m!1307409))

(assert (=> b!1417059 m!1307399))

(declare-fun m!1307411 () Bool)

(assert (=> b!1417059 m!1307411))

(assert (=> b!1417059 m!1307409))

(assert (=> b!1417059 m!1307399))

(declare-fun m!1307413 () Bool)

(assert (=> b!1417059 m!1307413))

(declare-fun m!1307415 () Bool)

(assert (=> b!1417059 m!1307415))

(declare-fun m!1307417 () Bool)

(assert (=> start!122118 m!1307417))

(declare-fun m!1307419 () Bool)

(assert (=> start!122118 m!1307419))

(declare-fun m!1307421 () Bool)

(assert (=> b!1417055 m!1307421))

(declare-fun m!1307423 () Bool)

(assert (=> b!1417056 m!1307423))

(push 1)

(assert (not b!1417056))

(assert (not b!1417059))

(assert (not b!1417054))

(assert (not b!1417053))

(assert (not b!1417057))

(assert (not b!1417055))

(assert (not start!122118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!802031 () SeekEntryResult!11020)

(declare-fun b!1417108 () Bool)

(declare-fun lt!625065 () SeekEntryResult!11020)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96706 (_ BitVec 32)) SeekEntryResult!11020)

(assert (=> b!1417108 (= e!802031 (seekKeyOrZeroReturnVacant!0 (x!128062 lt!625065) (index!46474 lt!625065) (index!46474 lt!625065) (select (arr!46683 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417109 () Bool)

(declare-fun e!802032 () SeekEntryResult!11020)

(assert (=> b!1417109 (= e!802032 Undefined!11020)))

(declare-fun b!1417110 () Bool)

(declare-fun e!802030 () SeekEntryResult!11020)

(assert (=> b!1417110 (= e!802032 e!802030)))

(declare-fun lt!625067 () (_ BitVec 64))

(assert (=> b!1417110 (= lt!625067 (select (arr!46683 a!2901) (index!46474 lt!625065)))))

(declare-fun c!131533 () Bool)

(assert (=> b!1417110 (= c!131533 (= lt!625067 (select (arr!46683 a!2901) j!112)))))

(declare-fun d!152509 () Bool)

(declare-fun lt!625066 () SeekEntryResult!11020)

(assert (=> d!152509 (and (or (is-Undefined!11020 lt!625066) (not (is-Found!11020 lt!625066)) (and (bvsge (index!46473 lt!625066) #b00000000000000000000000000000000) (bvslt (index!46473 lt!625066) (size!47235 a!2901)))) (or (is-Undefined!11020 lt!625066) (is-Found!11020 lt!625066) (not (is-MissingZero!11020 lt!625066)) (and (bvsge (index!46472 lt!625066) #b00000000000000000000000000000000) (bvslt (index!46472 lt!625066) (size!47235 a!2901)))) (or (is-Undefined!11020 lt!625066) (is-Found!11020 lt!625066) (is-MissingZero!11020 lt!625066) (not (is-MissingVacant!11020 lt!625066)) (and (bvsge (index!46475 lt!625066) #b00000000000000000000000000000000) (bvslt (index!46475 lt!625066) (size!47235 a!2901)))) (or (is-Undefined!11020 lt!625066) (ite (is-Found!11020 lt!625066) (= (select (arr!46683 a!2901) (index!46473 lt!625066)) (select (arr!46683 a!2901) j!112)) (ite (is-MissingZero!11020 lt!625066) (= (select (arr!46683 a!2901) (index!46472 lt!625066)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11020 lt!625066) (= (select (arr!46683 a!2901) (index!46475 lt!625066)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152509 (= lt!625066 e!802032)))

(declare-fun c!131535 () Bool)

(assert (=> d!152509 (= c!131535 (and (is-Intermediate!11020 lt!625065) (undefined!11832 lt!625065)))))

(assert (=> d!152509 (= lt!625065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840) (select (arr!46683 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152509 (validMask!0 mask!2840)))

(assert (=> d!152509 (= (seekEntryOrOpen!0 (select (arr!46683 a!2901) j!112) a!2901 mask!2840) lt!625066)))

(declare-fun b!1417111 () Bool)

(assert (=> b!1417111 (= e!802031 (MissingZero!11020 (index!46474 lt!625065)))))

(declare-fun b!1417112 () Bool)

(declare-fun c!131534 () Bool)

(assert (=> b!1417112 (= c!131534 (= lt!625067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1417112 (= e!802030 e!802031)))

(declare-fun b!1417113 () Bool)

(assert (=> b!1417113 (= e!802030 (Found!11020 (index!46474 lt!625065)))))

(assert (= (and d!152509 c!131535) b!1417109))

(assert (= (and d!152509 (not c!131535)) b!1417110))

(assert (= (and b!1417110 c!131533) b!1417113))

(assert (= (and b!1417110 (not c!131533)) b!1417112))

(assert (= (and b!1417112 c!131534) b!1417111))

(assert (= (and b!1417112 (not c!131534)) b!1417108))

(assert (=> b!1417108 m!1307399))

(declare-fun m!1307441 () Bool)

(assert (=> b!1417108 m!1307441))

(declare-fun m!1307443 () Bool)

(assert (=> b!1417110 m!1307443))

(assert (=> d!152509 m!1307409))

(assert (=> d!152509 m!1307399))

(assert (=> d!152509 m!1307413))

(declare-fun m!1307445 () Bool)

(assert (=> d!152509 m!1307445))

(assert (=> d!152509 m!1307399))

(assert (=> d!152509 m!1307409))

(declare-fun m!1307447 () Bool)

(assert (=> d!152509 m!1307447))

(declare-fun m!1307449 () Bool)

(assert (=> d!152509 m!1307449))

(assert (=> d!152509 m!1307417))

(assert (=> b!1417057 d!152509))

(declare-fun d!152519 () Bool)

(assert (=> d!152519 (= (validKeyInArray!0 (select (arr!46683 a!2901) j!112)) (and (not (= (select (arr!46683 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46683 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417053 d!152519))

(declare-fun d!152521 () Bool)

(declare-fun res!953016 () Bool)

(declare-fun e!802044 () Bool)

(assert (=> d!152521 (=> res!953016 e!802044)))

(assert (=> d!152521 (= res!953016 (bvsge j!112 (size!47235 a!2901)))))

(assert (=> d!152521 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!802044)))

(declare-fun b!1417128 () Bool)

(declare-fun e!802045 () Bool)

(assert (=> b!1417128 (= e!802044 e!802045)))

(declare-fun c!131539 () Bool)

(assert (=> b!1417128 (= c!131539 (validKeyInArray!0 (select (arr!46683 a!2901) j!112)))))

(declare-fun b!1417129 () Bool)

(declare-fun call!67193 () Bool)

(assert (=> b!1417129 (= e!802045 call!67193)))

(declare-fun b!1417130 () Bool)

(declare-fun e!802046 () Bool)

(assert (=> b!1417130 (= e!802046 call!67193)))

(declare-fun b!1417131 () Bool)

(assert (=> b!1417131 (= e!802045 e!802046)))

(declare-fun lt!625079 () (_ BitVec 64))

(assert (=> b!1417131 (= lt!625079 (select (arr!46683 a!2901) j!112))))

(declare-fun lt!625078 () Unit!47857)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96706 (_ BitVec 64) (_ BitVec 32)) Unit!47857)

(assert (=> b!1417131 (= lt!625078 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625079 j!112))))

(declare-fun arrayContainsKey!0 (array!96706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417131 (arrayContainsKey!0 a!2901 lt!625079 #b00000000000000000000000000000000)))

(declare-fun lt!625077 () Unit!47857)

(assert (=> b!1417131 (= lt!625077 lt!625078)))

(declare-fun res!953017 () Bool)

(assert (=> b!1417131 (= res!953017 (= (seekEntryOrOpen!0 (select (arr!46683 a!2901) j!112) a!2901 mask!2840) (Found!11020 j!112)))))

(assert (=> b!1417131 (=> (not res!953017) (not e!802046))))

(declare-fun bm!67190 () Bool)

(assert (=> bm!67190 (= call!67193 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152521 (not res!953016)) b!1417128))

(assert (= (and b!1417128 c!131539) b!1417131))

(assert (= (and b!1417128 (not c!131539)) b!1417129))

(assert (= (and b!1417131 res!953017) b!1417130))

(assert (= (or b!1417130 b!1417129) bm!67190))

(assert (=> b!1417128 m!1307399))

(assert (=> b!1417128 m!1307399))

(assert (=> b!1417128 m!1307407))

(assert (=> b!1417131 m!1307399))

(declare-fun m!1307457 () Bool)

(assert (=> b!1417131 m!1307457))

(declare-fun m!1307459 () Bool)

(assert (=> b!1417131 m!1307459))

(assert (=> b!1417131 m!1307399))

(assert (=> b!1417131 m!1307401))

(declare-fun m!1307461 () Bool)

(assert (=> bm!67190 m!1307461))

(assert (=> b!1417059 d!152521))

(declare-fun d!152529 () Bool)

(assert (=> d!152529 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625085 () Unit!47857)

(declare-fun choose!38 (array!96706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47857)

(assert (=> d!152529 (= lt!625085 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152529 (validMask!0 mask!2840)))

(assert (=> d!152529 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625085)))

(declare-fun bs!41288 () Bool)

(assert (= bs!41288 d!152529))

(assert (=> bs!41288 m!1307415))

(declare-fun m!1307465 () Bool)

(assert (=> bs!41288 m!1307465))

(assert (=> bs!41288 m!1307417))

(assert (=> b!1417059 d!152529))

(declare-fun b!1417195 () Bool)

(declare-fun e!802081 () SeekEntryResult!11020)

(assert (=> b!1417195 (= e!802081 (Intermediate!11020 true (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!802085 () SeekEntryResult!11020)

(declare-fun b!1417196 () Bool)

(assert (=> b!1417196 (= e!802085 (Intermediate!11020 false (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417197 () Bool)

(assert (=> b!1417197 (= e!802081 e!802085)))

(declare-fun lt!625106 () (_ BitVec 64))

(declare-fun c!131564 () Bool)

(assert (=> b!1417197 (= c!131564 (or (= lt!625106 (select (arr!46683 a!2901) j!112)) (= (bvadd lt!625106 lt!625106) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1417199 () Bool)

(declare-fun lt!625105 () SeekEntryResult!11020)

(assert (=> b!1417199 (and (bvsge (index!46474 lt!625105) #b00000000000000000000000000000000) (bvslt (index!46474 lt!625105) (size!47235 a!2901)))))

(declare-fun res!953036 () Bool)

(assert (=> b!1417199 (= res!953036 (= (select (arr!46683 a!2901) (index!46474 lt!625105)) (select (arr!46683 a!2901) j!112)))))

(declare-fun e!802083 () Bool)

(assert (=> b!1417199 (=> res!953036 e!802083)))

(declare-fun e!802082 () Bool)

(assert (=> b!1417199 (= e!802082 e!802083)))

(declare-fun b!1417200 () Bool)

(assert (=> b!1417200 (and (bvsge (index!46474 lt!625105) #b00000000000000000000000000000000) (bvslt (index!46474 lt!625105) (size!47235 a!2901)))))

(assert (=> b!1417200 (= e!802083 (= (select (arr!46683 a!2901) (index!46474 lt!625105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1417201 () Bool)

(assert (=> b!1417201 (and (bvsge (index!46474 lt!625105) #b00000000000000000000000000000000) (bvslt (index!46474 lt!625105) (size!47235 a!2901)))))

(declare-fun res!953034 () Bool)

(assert (=> b!1417201 (= res!953034 (= (select (arr!46683 a!2901) (index!46474 lt!625105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1417201 (=> res!953034 e!802083)))

(declare-fun b!1417198 () Bool)

(declare-fun e!802084 () Bool)

(assert (=> b!1417198 (= e!802084 (bvsge (x!128062 lt!625105) #b01111111111111111111111111111110))))

(declare-fun d!152533 () Bool)

(assert (=> d!152533 e!802084))

(declare-fun c!131565 () Bool)

(assert (=> d!152533 (= c!131565 (and (is-Intermediate!11020 lt!625105) (undefined!11832 lt!625105)))))

(assert (=> d!152533 (= lt!625105 e!802081)))

(declare-fun c!131566 () Bool)

(assert (=> d!152533 (= c!131566 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152533 (= lt!625106 (select (arr!46683 a!2901) (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840)))))

(assert (=> d!152533 (validMask!0 mask!2840)))

(assert (=> d!152533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840) (select (arr!46683 a!2901) j!112) a!2901 mask!2840) lt!625105)))

(declare-fun b!1417202 () Bool)

(assert (=> b!1417202 (= e!802084 e!802082)))

(declare-fun res!953035 () Bool)

(assert (=> b!1417202 (= res!953035 (and (is-Intermediate!11020 lt!625105) (not (undefined!11832 lt!625105)) (bvslt (x!128062 lt!625105) #b01111111111111111111111111111110) (bvsge (x!128062 lt!625105) #b00000000000000000000000000000000) (bvsge (x!128062 lt!625105) #b00000000000000000000000000000000)))))

(assert (=> b!1417202 (=> (not res!953035) (not e!802082))))

(declare-fun b!1417203 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417203 (= e!802085 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46683 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152533 c!131566) b!1417195))

(assert (= (and d!152533 (not c!131566)) b!1417197))

(assert (= (and b!1417197 c!131564) b!1417196))

(assert (= (and b!1417197 (not c!131564)) b!1417203))

(assert (= (and d!152533 c!131565) b!1417198))

(assert (= (and d!152533 (not c!131565)) b!1417202))

(assert (= (and b!1417202 res!953035) b!1417199))

(assert (= (and b!1417199 (not res!953036)) b!1417201))

(assert (= (and b!1417201 (not res!953034)) b!1417200))

(declare-fun m!1307485 () Bool)

(assert (=> b!1417200 m!1307485))

(assert (=> b!1417201 m!1307485))

(assert (=> b!1417203 m!1307409))

(declare-fun m!1307487 () Bool)

(assert (=> b!1417203 m!1307487))

(assert (=> b!1417203 m!1307487))

(assert (=> b!1417203 m!1307399))

(declare-fun m!1307489 () Bool)

(assert (=> b!1417203 m!1307489))

(assert (=> b!1417199 m!1307485))

(assert (=> d!152533 m!1307409))

(declare-fun m!1307491 () Bool)

(assert (=> d!152533 m!1307491))

(assert (=> d!152533 m!1307417))

(assert (=> b!1417059 d!152533))

(declare-fun d!152541 () Bool)

(declare-fun lt!625121 () (_ BitVec 32))

(declare-fun lt!625120 () (_ BitVec 32))

(assert (=> d!152541 (= lt!625121 (bvmul (bvxor lt!625120 (bvlshr lt!625120 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152541 (= lt!625120 ((_ extract 31 0) (bvand (bvxor (select (arr!46683 a!2901) j!112) (bvlshr (select (arr!46683 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152541 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!953037 (let ((h!34568 ((_ extract 31 0) (bvand (bvxor (select (arr!46683 a!2901) j!112) (bvlshr (select (arr!46683 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128066 (bvmul (bvxor h!34568 (bvlshr h!34568 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128066 (bvlshr x!128066 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!953037 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!953037 #b00000000000000000000000000000000))))))

(assert (=> d!152541 (= (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840) (bvand (bvxor lt!625121 (bvlshr lt!625121 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1417059 d!152541))

(declare-fun d!152549 () Bool)

(assert (=> d!152549 (= (validKeyInArray!0 (select (arr!46683 a!2901) i!1037)) (and (not (= (select (arr!46683 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46683 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417054 d!152549))

(declare-fun b!1417230 () Bool)

(declare-fun e!802109 () Bool)

(declare-fun call!67200 () Bool)

(assert (=> b!1417230 (= e!802109 call!67200)))

(declare-fun b!1417231 () Bool)

(declare-fun e!802108 () Bool)

(declare-fun contains!9794 (List!33280 (_ BitVec 64)) Bool)

(assert (=> b!1417231 (= e!802108 (contains!9794 Nil!33277 (select (arr!46683 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417232 () Bool)

(declare-fun e!802106 () Bool)

(assert (=> b!1417232 (= e!802106 e!802109)))

(declare-fun c!131573 () Bool)

(assert (=> b!1417232 (= c!131573 (validKeyInArray!0 (select (arr!46683 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417233 () Bool)

(assert (=> b!1417233 (= e!802109 call!67200)))

(declare-fun b!1417234 () Bool)

(declare-fun e!802107 () Bool)

(assert (=> b!1417234 (= e!802107 e!802106)))

(declare-fun res!953054 () Bool)

(assert (=> b!1417234 (=> (not res!953054) (not e!802106))))

(assert (=> b!1417234 (= res!953054 (not e!802108))))

(declare-fun res!953053 () Bool)

(assert (=> b!1417234 (=> (not res!953053) (not e!802108))))

(assert (=> b!1417234 (= res!953053 (validKeyInArray!0 (select (arr!46683 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152551 () Bool)

(declare-fun res!953052 () Bool)

(assert (=> d!152551 (=> res!953052 e!802107)))

(assert (=> d!152551 (= res!953052 (bvsge #b00000000000000000000000000000000 (size!47235 a!2901)))))

(assert (=> d!152551 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33277) e!802107)))

(declare-fun bm!67197 () Bool)

(assert (=> bm!67197 (= call!67200 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131573 (Cons!33276 (select (arr!46683 a!2901) #b00000000000000000000000000000000) Nil!33277) Nil!33277)))))

(assert (= (and d!152551 (not res!953052)) b!1417234))

(assert (= (and b!1417234 res!953053) b!1417231))

(assert (= (and b!1417234 res!953054) b!1417232))

(assert (= (and b!1417232 c!131573) b!1417230))

(assert (= (and b!1417232 (not c!131573)) b!1417233))

(assert (= (or b!1417230 b!1417233) bm!67197))

(declare-fun m!1307507 () Bool)

(assert (=> b!1417231 m!1307507))

(assert (=> b!1417231 m!1307507))

(declare-fun m!1307509 () Bool)

(assert (=> b!1417231 m!1307509))

(assert (=> b!1417232 m!1307507))

(assert (=> b!1417232 m!1307507))

(declare-fun m!1307511 () Bool)

(assert (=> b!1417232 m!1307511))

(assert (=> b!1417234 m!1307507))

(assert (=> b!1417234 m!1307507))

(assert (=> b!1417234 m!1307511))

(assert (=> bm!67197 m!1307507))

(declare-fun m!1307513 () Bool)

(assert (=> bm!67197 m!1307513))

(assert (=> b!1417055 d!152551))

(declare-fun d!152555 () Bool)

(assert (=> d!152555 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122118 d!152555))

(declare-fun d!152559 () Bool)

(assert (=> d!152559 (= (array_inv!35916 a!2901) (bvsge (size!47235 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122118 d!152559))

(declare-fun d!152561 () Bool)

(declare-fun res!953055 () Bool)

(declare-fun e!802116 () Bool)

(assert (=> d!152561 (=> res!953055 e!802116)))

(assert (=> d!152561 (= res!953055 (bvsge #b00000000000000000000000000000000 (size!47235 a!2901)))))

(assert (=> d!152561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!802116)))

(declare-fun b!1417247 () Bool)

(declare-fun e!802117 () Bool)

(assert (=> b!1417247 (= e!802116 e!802117)))

(declare-fun c!131580 () Bool)

(assert (=> b!1417247 (= c!131580 (validKeyInArray!0 (select (arr!46683 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417248 () Bool)

(declare-fun call!67201 () Bool)

(assert (=> b!1417248 (= e!802117 call!67201)))

(declare-fun b!1417249 () Bool)

(declare-fun e!802118 () Bool)

(assert (=> b!1417249 (= e!802118 call!67201)))

(declare-fun b!1417250 () Bool)

(assert (=> b!1417250 (= e!802117 e!802118)))

(declare-fun lt!625142 () (_ BitVec 64))

(assert (=> b!1417250 (= lt!625142 (select (arr!46683 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625141 () Unit!47857)

(assert (=> b!1417250 (= lt!625141 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625142 #b00000000000000000000000000000000))))

(assert (=> b!1417250 (arrayContainsKey!0 a!2901 lt!625142 #b00000000000000000000000000000000)))

(declare-fun lt!625140 () Unit!47857)

(assert (=> b!1417250 (= lt!625140 lt!625141)))

(declare-fun res!953056 () Bool)

(assert (=> b!1417250 (= res!953056 (= (seekEntryOrOpen!0 (select (arr!46683 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!11020 #b00000000000000000000000000000000)))))

(assert (=> b!1417250 (=> (not res!953056) (not e!802118))))

(declare-fun bm!67198 () Bool)

(assert (=> bm!67198 (= call!67201 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152561 (not res!953055)) b!1417247))

(assert (= (and b!1417247 c!131580) b!1417250))

(assert (= (and b!1417247 (not c!131580)) b!1417248))

(assert (= (and b!1417250 res!953056) b!1417249))

(assert (= (or b!1417249 b!1417248) bm!67198))

(assert (=> b!1417247 m!1307507))

(assert (=> b!1417247 m!1307507))

(assert (=> b!1417247 m!1307511))

(assert (=> b!1417250 m!1307507))

(declare-fun m!1307517 () Bool)

(assert (=> b!1417250 m!1307517))

(declare-fun m!1307519 () Bool)

(assert (=> b!1417250 m!1307519))

(assert (=> b!1417250 m!1307507))

(declare-fun m!1307521 () Bool)

(assert (=> b!1417250 m!1307521))

(declare-fun m!1307523 () Bool)

(assert (=> bm!67198 m!1307523))

(assert (=> b!1417056 d!152561))

(push 1)

(assert (not b!1417108))

(assert (not b!1417231))

(assert (not bm!67198))

(assert (not b!1417203))

(assert (not d!152533))

(assert (not b!1417234))

(assert (not d!152509))

(assert (not b!1417128))

(assert (not d!152529))

(assert (not b!1417131))

(assert (not bm!67197))

(assert (not bm!67190))

(assert (not b!1417232))

(assert (not b!1417250))

(assert (not b!1417247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

