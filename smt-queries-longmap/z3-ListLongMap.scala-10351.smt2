; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121652 () Bool)

(assert start!121652)

(declare-fun b!1413375 () Bool)

(declare-fun e!799874 () Bool)

(declare-datatypes ((SeekEntryResult!10946 0))(
  ( (MissingZero!10946 (index!46164 (_ BitVec 32))) (Found!10946 (index!46165 (_ BitVec 32))) (Intermediate!10946 (undefined!11758 Bool) (index!46166 (_ BitVec 32)) (x!127742 (_ BitVec 32))) (Undefined!10946) (MissingVacant!10946 (index!46167 (_ BitVec 32))) )
))
(declare-fun lt!622860 () SeekEntryResult!10946)

(assert (=> b!1413375 (= e!799874 (and (bvsge (x!127742 lt!622860) #b00000000000000000000000000000000) (bvsle (x!127742 lt!622860) #b01111111111111111111111111111110)))))

(declare-fun e!799877 () Bool)

(assert (=> b!1413375 e!799877))

(declare-fun res!950425 () Bool)

(assert (=> b!1413375 (=> (not res!950425) (not e!799877))))

(declare-fun lt!622856 () SeekEntryResult!10946)

(declare-datatypes ((array!96543 0))(
  ( (array!96544 (arr!46609 (Array (_ BitVec 32) (_ BitVec 64))) (size!47161 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96543)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413375 (= res!950425 (and (not (undefined!11758 lt!622856)) (= (index!46166 lt!622856) i!1037) (bvslt (x!127742 lt!622856) (x!127742 lt!622860)) (= (select (store (arr!46609 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46166 lt!622856)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622861 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47709 0))(
  ( (Unit!47710) )
))
(declare-fun lt!622859 () Unit!47709)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47709)

(assert (=> b!1413375 (= lt!622859 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622861 (x!127742 lt!622860) (index!46166 lt!622860) (x!127742 lt!622856) (index!46166 lt!622856) (undefined!11758 lt!622856) mask!2840))))

(declare-fun b!1413376 () Bool)

(declare-fun e!799876 () Bool)

(declare-fun e!799873 () Bool)

(assert (=> b!1413376 (= e!799876 (not e!799873))))

(declare-fun res!950418 () Bool)

(assert (=> b!1413376 (=> res!950418 e!799873)))

(get-info :version)

(assert (=> b!1413376 (= res!950418 (or (not ((_ is Intermediate!10946) lt!622860)) (undefined!11758 lt!622860)))))

(declare-fun e!799875 () Bool)

(assert (=> b!1413376 e!799875))

(declare-fun res!950420 () Bool)

(assert (=> b!1413376 (=> (not res!950420) (not e!799875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96543 (_ BitVec 32)) Bool)

(assert (=> b!1413376 (= res!950420 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622857 () Unit!47709)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47709)

(assert (=> b!1413376 (= lt!622857 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96543 (_ BitVec 32)) SeekEntryResult!10946)

(assert (=> b!1413376 (= lt!622860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622861 (select (arr!46609 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413376 (= lt!622861 (toIndex!0 (select (arr!46609 a!2901) j!112) mask!2840))))

(declare-fun b!1413377 () Bool)

(declare-fun res!950421 () Bool)

(assert (=> b!1413377 (=> (not res!950421) (not e!799876))))

(assert (=> b!1413377 (= res!950421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413378 () Bool)

(declare-fun res!950424 () Bool)

(assert (=> b!1413378 (=> (not res!950424) (not e!799876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413378 (= res!950424 (validKeyInArray!0 (select (arr!46609 a!2901) j!112)))))

(declare-fun b!1413379 () Bool)

(declare-fun res!950417 () Bool)

(assert (=> b!1413379 (=> (not res!950417) (not e!799876))))

(assert (=> b!1413379 (= res!950417 (validKeyInArray!0 (select (arr!46609 a!2901) i!1037)))))

(declare-fun lt!622858 () (_ BitVec 64))

(declare-fun lt!622862 () array!96543)

(declare-fun b!1413380 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96543 (_ BitVec 32)) SeekEntryResult!10946)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96543 (_ BitVec 32)) SeekEntryResult!10946)

(assert (=> b!1413380 (= e!799877 (= (seekEntryOrOpen!0 lt!622858 lt!622862 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127742 lt!622856) (index!46166 lt!622856) (index!46166 lt!622856) (select (arr!46609 a!2901) j!112) lt!622862 mask!2840)))))

(declare-fun res!950419 () Bool)

(assert (=> start!121652 (=> (not res!950419) (not e!799876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121652 (= res!950419 (validMask!0 mask!2840))))

(assert (=> start!121652 e!799876))

(assert (=> start!121652 true))

(declare-fun array_inv!35842 (array!96543) Bool)

(assert (=> start!121652 (array_inv!35842 a!2901)))

(declare-fun b!1413381 () Bool)

(assert (=> b!1413381 (= e!799873 e!799874)))

(declare-fun res!950423 () Bool)

(assert (=> b!1413381 (=> res!950423 e!799874)))

(assert (=> b!1413381 (= res!950423 (or (= lt!622860 lt!622856) (not ((_ is Intermediate!10946) lt!622856))))))

(assert (=> b!1413381 (= lt!622856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622858 mask!2840) lt!622858 lt!622862 mask!2840))))

(assert (=> b!1413381 (= lt!622858 (select (store (arr!46609 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413381 (= lt!622862 (array!96544 (store (arr!46609 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47161 a!2901)))))

(declare-fun b!1413382 () Bool)

(declare-fun res!950416 () Bool)

(assert (=> b!1413382 (=> (not res!950416) (not e!799876))))

(declare-datatypes ((List!33206 0))(
  ( (Nil!33203) (Cons!33202 (h!34477 (_ BitVec 64)) (t!47892 List!33206)) )
))
(declare-fun arrayNoDuplicates!0 (array!96543 (_ BitVec 32) List!33206) Bool)

(assert (=> b!1413382 (= res!950416 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33203))))

(declare-fun b!1413383 () Bool)

(assert (=> b!1413383 (= e!799875 (= (seekEntryOrOpen!0 (select (arr!46609 a!2901) j!112) a!2901 mask!2840) (Found!10946 j!112)))))

(declare-fun b!1413384 () Bool)

(declare-fun res!950422 () Bool)

(assert (=> b!1413384 (=> (not res!950422) (not e!799876))))

(assert (=> b!1413384 (= res!950422 (and (= (size!47161 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47161 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47161 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121652 res!950419) b!1413384))

(assert (= (and b!1413384 res!950422) b!1413379))

(assert (= (and b!1413379 res!950417) b!1413378))

(assert (= (and b!1413378 res!950424) b!1413377))

(assert (= (and b!1413377 res!950421) b!1413382))

(assert (= (and b!1413382 res!950416) b!1413376))

(assert (= (and b!1413376 res!950420) b!1413383))

(assert (= (and b!1413376 (not res!950418)) b!1413381))

(assert (= (and b!1413381 (not res!950423)) b!1413375))

(assert (= (and b!1413375 res!950425) b!1413380))

(declare-fun m!1303351 () Bool)

(assert (=> b!1413382 m!1303351))

(declare-fun m!1303353 () Bool)

(assert (=> b!1413377 m!1303353))

(declare-fun m!1303355 () Bool)

(assert (=> b!1413379 m!1303355))

(assert (=> b!1413379 m!1303355))

(declare-fun m!1303357 () Bool)

(assert (=> b!1413379 m!1303357))

(declare-fun m!1303359 () Bool)

(assert (=> start!121652 m!1303359))

(declare-fun m!1303361 () Bool)

(assert (=> start!121652 m!1303361))

(declare-fun m!1303363 () Bool)

(assert (=> b!1413378 m!1303363))

(assert (=> b!1413378 m!1303363))

(declare-fun m!1303365 () Bool)

(assert (=> b!1413378 m!1303365))

(declare-fun m!1303367 () Bool)

(assert (=> b!1413375 m!1303367))

(declare-fun m!1303369 () Bool)

(assert (=> b!1413375 m!1303369))

(declare-fun m!1303371 () Bool)

(assert (=> b!1413375 m!1303371))

(declare-fun m!1303373 () Bool)

(assert (=> b!1413381 m!1303373))

(assert (=> b!1413381 m!1303373))

(declare-fun m!1303375 () Bool)

(assert (=> b!1413381 m!1303375))

(assert (=> b!1413381 m!1303367))

(declare-fun m!1303377 () Bool)

(assert (=> b!1413381 m!1303377))

(assert (=> b!1413383 m!1303363))

(assert (=> b!1413383 m!1303363))

(declare-fun m!1303379 () Bool)

(assert (=> b!1413383 m!1303379))

(assert (=> b!1413376 m!1303363))

(declare-fun m!1303381 () Bool)

(assert (=> b!1413376 m!1303381))

(assert (=> b!1413376 m!1303363))

(declare-fun m!1303383 () Bool)

(assert (=> b!1413376 m!1303383))

(declare-fun m!1303385 () Bool)

(assert (=> b!1413376 m!1303385))

(assert (=> b!1413376 m!1303363))

(declare-fun m!1303387 () Bool)

(assert (=> b!1413376 m!1303387))

(declare-fun m!1303389 () Bool)

(assert (=> b!1413380 m!1303389))

(assert (=> b!1413380 m!1303363))

(assert (=> b!1413380 m!1303363))

(declare-fun m!1303391 () Bool)

(assert (=> b!1413380 m!1303391))

(check-sat (not b!1413378) (not b!1413379) (not b!1413377) (not b!1413380) (not b!1413381) (not b!1413383) (not start!121652) (not b!1413376) (not b!1413382) (not b!1413375))
(check-sat)
(get-model)

(declare-fun b!1413457 () Bool)

(declare-fun e!799922 () SeekEntryResult!10946)

(assert (=> b!1413457 (= e!799922 Undefined!10946)))

(declare-fun b!1413458 () Bool)

(declare-fun e!799921 () SeekEntryResult!10946)

(declare-fun lt!622913 () SeekEntryResult!10946)

(assert (=> b!1413458 (= e!799921 (MissingZero!10946 (index!46166 lt!622913)))))

(declare-fun b!1413459 () Bool)

(declare-fun e!799920 () SeekEntryResult!10946)

(assert (=> b!1413459 (= e!799922 e!799920)))

(declare-fun lt!622912 () (_ BitVec 64))

(assert (=> b!1413459 (= lt!622912 (select (arr!46609 a!2901) (index!46166 lt!622913)))))

(declare-fun c!130962 () Bool)

(assert (=> b!1413459 (= c!130962 (= lt!622912 (select (arr!46609 a!2901) j!112)))))

(declare-fun d!151995 () Bool)

(declare-fun lt!622911 () SeekEntryResult!10946)

(assert (=> d!151995 (and (or ((_ is Undefined!10946) lt!622911) (not ((_ is Found!10946) lt!622911)) (and (bvsge (index!46165 lt!622911) #b00000000000000000000000000000000) (bvslt (index!46165 lt!622911) (size!47161 a!2901)))) (or ((_ is Undefined!10946) lt!622911) ((_ is Found!10946) lt!622911) (not ((_ is MissingZero!10946) lt!622911)) (and (bvsge (index!46164 lt!622911) #b00000000000000000000000000000000) (bvslt (index!46164 lt!622911) (size!47161 a!2901)))) (or ((_ is Undefined!10946) lt!622911) ((_ is Found!10946) lt!622911) ((_ is MissingZero!10946) lt!622911) (not ((_ is MissingVacant!10946) lt!622911)) (and (bvsge (index!46167 lt!622911) #b00000000000000000000000000000000) (bvslt (index!46167 lt!622911) (size!47161 a!2901)))) (or ((_ is Undefined!10946) lt!622911) (ite ((_ is Found!10946) lt!622911) (= (select (arr!46609 a!2901) (index!46165 lt!622911)) (select (arr!46609 a!2901) j!112)) (ite ((_ is MissingZero!10946) lt!622911) (= (select (arr!46609 a!2901) (index!46164 lt!622911)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10946) lt!622911) (= (select (arr!46609 a!2901) (index!46167 lt!622911)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151995 (= lt!622911 e!799922)))

(declare-fun c!130963 () Bool)

(assert (=> d!151995 (= c!130963 (and ((_ is Intermediate!10946) lt!622913) (undefined!11758 lt!622913)))))

(assert (=> d!151995 (= lt!622913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46609 a!2901) j!112) mask!2840) (select (arr!46609 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151995 (validMask!0 mask!2840)))

(assert (=> d!151995 (= (seekEntryOrOpen!0 (select (arr!46609 a!2901) j!112) a!2901 mask!2840) lt!622911)))

(declare-fun b!1413460 () Bool)

(declare-fun c!130961 () Bool)

(assert (=> b!1413460 (= c!130961 (= lt!622912 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413460 (= e!799920 e!799921)))

(declare-fun b!1413461 () Bool)

(assert (=> b!1413461 (= e!799921 (seekKeyOrZeroReturnVacant!0 (x!127742 lt!622913) (index!46166 lt!622913) (index!46166 lt!622913) (select (arr!46609 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1413462 () Bool)

(assert (=> b!1413462 (= e!799920 (Found!10946 (index!46166 lt!622913)))))

(assert (= (and d!151995 c!130963) b!1413457))

(assert (= (and d!151995 (not c!130963)) b!1413459))

(assert (= (and b!1413459 c!130962) b!1413462))

(assert (= (and b!1413459 (not c!130962)) b!1413460))

(assert (= (and b!1413460 c!130961) b!1413458))

(assert (= (and b!1413460 (not c!130961)) b!1413461))

(declare-fun m!1303477 () Bool)

(assert (=> b!1413459 m!1303477))

(declare-fun m!1303479 () Bool)

(assert (=> d!151995 m!1303479))

(assert (=> d!151995 m!1303359))

(assert (=> d!151995 m!1303363))

(assert (=> d!151995 m!1303381))

(declare-fun m!1303481 () Bool)

(assert (=> d!151995 m!1303481))

(declare-fun m!1303483 () Bool)

(assert (=> d!151995 m!1303483))

(assert (=> d!151995 m!1303381))

(assert (=> d!151995 m!1303363))

(declare-fun m!1303485 () Bool)

(assert (=> d!151995 m!1303485))

(assert (=> b!1413461 m!1303363))

(declare-fun m!1303487 () Bool)

(assert (=> b!1413461 m!1303487))

(assert (=> b!1413383 d!151995))

(declare-fun b!1413473 () Bool)

(declare-fun e!799931 () Bool)

(declare-fun e!799932 () Bool)

(assert (=> b!1413473 (= e!799931 e!799932)))

(declare-fun c!130966 () Bool)

(assert (=> b!1413473 (= c!130966 (validKeyInArray!0 (select (arr!46609 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413474 () Bool)

(declare-fun e!799934 () Bool)

(assert (=> b!1413474 (= e!799934 e!799931)))

(declare-fun res!950493 () Bool)

(assert (=> b!1413474 (=> (not res!950493) (not e!799931))))

(declare-fun e!799933 () Bool)

(assert (=> b!1413474 (= res!950493 (not e!799933))))

(declare-fun res!950494 () Bool)

(assert (=> b!1413474 (=> (not res!950494) (not e!799933))))

(assert (=> b!1413474 (= res!950494 (validKeyInArray!0 (select (arr!46609 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67076 () Bool)

(declare-fun call!67079 () Bool)

(assert (=> bm!67076 (= call!67079 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130966 (Cons!33202 (select (arr!46609 a!2901) #b00000000000000000000000000000000) Nil!33203) Nil!33203)))))

(declare-fun d!151999 () Bool)

(declare-fun res!950492 () Bool)

(assert (=> d!151999 (=> res!950492 e!799934)))

(assert (=> d!151999 (= res!950492 (bvsge #b00000000000000000000000000000000 (size!47161 a!2901)))))

(assert (=> d!151999 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33203) e!799934)))

(declare-fun b!1413475 () Bool)

(assert (=> b!1413475 (= e!799932 call!67079)))

(declare-fun b!1413476 () Bool)

(declare-fun contains!9777 (List!33206 (_ BitVec 64)) Bool)

(assert (=> b!1413476 (= e!799933 (contains!9777 Nil!33203 (select (arr!46609 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413477 () Bool)

(assert (=> b!1413477 (= e!799932 call!67079)))

(assert (= (and d!151999 (not res!950492)) b!1413474))

(assert (= (and b!1413474 res!950494) b!1413476))

(assert (= (and b!1413474 res!950493) b!1413473))

(assert (= (and b!1413473 c!130966) b!1413477))

(assert (= (and b!1413473 (not c!130966)) b!1413475))

(assert (= (or b!1413477 b!1413475) bm!67076))

(declare-fun m!1303489 () Bool)

(assert (=> b!1413473 m!1303489))

(assert (=> b!1413473 m!1303489))

(declare-fun m!1303491 () Bool)

(assert (=> b!1413473 m!1303491))

(assert (=> b!1413474 m!1303489))

(assert (=> b!1413474 m!1303489))

(assert (=> b!1413474 m!1303491))

(assert (=> bm!67076 m!1303489))

(declare-fun m!1303493 () Bool)

(assert (=> bm!67076 m!1303493))

(assert (=> b!1413476 m!1303489))

(assert (=> b!1413476 m!1303489))

(declare-fun m!1303495 () Bool)

(assert (=> b!1413476 m!1303495))

(assert (=> b!1413382 d!151999))

(declare-fun b!1413513 () Bool)

(declare-fun e!799957 () Bool)

(declare-fun call!67082 () Bool)

(assert (=> b!1413513 (= e!799957 call!67082)))

(declare-fun b!1413514 () Bool)

(declare-fun e!799956 () Bool)

(assert (=> b!1413514 (= e!799957 e!799956)))

(declare-fun lt!622926 () (_ BitVec 64))

(assert (=> b!1413514 (= lt!622926 (select (arr!46609 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!622928 () Unit!47709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96543 (_ BitVec 64) (_ BitVec 32)) Unit!47709)

(assert (=> b!1413514 (= lt!622928 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622926 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1413514 (arrayContainsKey!0 a!2901 lt!622926 #b00000000000000000000000000000000)))

(declare-fun lt!622927 () Unit!47709)

(assert (=> b!1413514 (= lt!622927 lt!622928)))

(declare-fun res!950509 () Bool)

(assert (=> b!1413514 (= res!950509 (= (seekEntryOrOpen!0 (select (arr!46609 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10946 #b00000000000000000000000000000000)))))

(assert (=> b!1413514 (=> (not res!950509) (not e!799956))))

(declare-fun bm!67079 () Bool)

(assert (=> bm!67079 (= call!67082 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152003 () Bool)

(declare-fun res!950510 () Bool)

(declare-fun e!799958 () Bool)

(assert (=> d!152003 (=> res!950510 e!799958)))

(assert (=> d!152003 (= res!950510 (bvsge #b00000000000000000000000000000000 (size!47161 a!2901)))))

(assert (=> d!152003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!799958)))

(declare-fun b!1413515 () Bool)

(assert (=> b!1413515 (= e!799958 e!799957)))

(declare-fun c!130978 () Bool)

(assert (=> b!1413515 (= c!130978 (validKeyInArray!0 (select (arr!46609 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413516 () Bool)

(assert (=> b!1413516 (= e!799956 call!67082)))

(assert (= (and d!152003 (not res!950510)) b!1413515))

(assert (= (and b!1413515 c!130978) b!1413514))

(assert (= (and b!1413515 (not c!130978)) b!1413513))

(assert (= (and b!1413514 res!950509) b!1413516))

(assert (= (or b!1413516 b!1413513) bm!67079))

(assert (=> b!1413514 m!1303489))

(declare-fun m!1303505 () Bool)

(assert (=> b!1413514 m!1303505))

(declare-fun m!1303507 () Bool)

(assert (=> b!1413514 m!1303507))

(assert (=> b!1413514 m!1303489))

(declare-fun m!1303509 () Bool)

(assert (=> b!1413514 m!1303509))

(declare-fun m!1303511 () Bool)

(assert (=> bm!67079 m!1303511))

(assert (=> b!1413515 m!1303489))

(assert (=> b!1413515 m!1303489))

(assert (=> b!1413515 m!1303491))

(assert (=> b!1413377 d!152003))

(declare-fun b!1413517 () Bool)

(declare-fun e!799960 () Bool)

(declare-fun call!67083 () Bool)

(assert (=> b!1413517 (= e!799960 call!67083)))

(declare-fun b!1413518 () Bool)

(declare-fun e!799959 () Bool)

(assert (=> b!1413518 (= e!799960 e!799959)))

(declare-fun lt!622933 () (_ BitVec 64))

(assert (=> b!1413518 (= lt!622933 (select (arr!46609 a!2901) j!112))))

(declare-fun lt!622935 () Unit!47709)

(assert (=> b!1413518 (= lt!622935 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622933 j!112))))

(assert (=> b!1413518 (arrayContainsKey!0 a!2901 lt!622933 #b00000000000000000000000000000000)))

(declare-fun lt!622934 () Unit!47709)

(assert (=> b!1413518 (= lt!622934 lt!622935)))

(declare-fun res!950511 () Bool)

(assert (=> b!1413518 (= res!950511 (= (seekEntryOrOpen!0 (select (arr!46609 a!2901) j!112) a!2901 mask!2840) (Found!10946 j!112)))))

(assert (=> b!1413518 (=> (not res!950511) (not e!799959))))

(declare-fun bm!67080 () Bool)

(assert (=> bm!67080 (= call!67083 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152007 () Bool)

(declare-fun res!950512 () Bool)

(declare-fun e!799961 () Bool)

(assert (=> d!152007 (=> res!950512 e!799961)))

(assert (=> d!152007 (= res!950512 (bvsge j!112 (size!47161 a!2901)))))

(assert (=> d!152007 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!799961)))

(declare-fun b!1413519 () Bool)

(assert (=> b!1413519 (= e!799961 e!799960)))

(declare-fun c!130979 () Bool)

(assert (=> b!1413519 (= c!130979 (validKeyInArray!0 (select (arr!46609 a!2901) j!112)))))

(declare-fun b!1413520 () Bool)

(assert (=> b!1413520 (= e!799959 call!67083)))

(assert (= (and d!152007 (not res!950512)) b!1413519))

(assert (= (and b!1413519 c!130979) b!1413518))

(assert (= (and b!1413519 (not c!130979)) b!1413517))

(assert (= (and b!1413518 res!950511) b!1413520))

(assert (= (or b!1413520 b!1413517) bm!67080))

(assert (=> b!1413518 m!1303363))

(declare-fun m!1303513 () Bool)

(assert (=> b!1413518 m!1303513))

(declare-fun m!1303515 () Bool)

(assert (=> b!1413518 m!1303515))

(assert (=> b!1413518 m!1303363))

(assert (=> b!1413518 m!1303379))

(declare-fun m!1303517 () Bool)

(assert (=> bm!67080 m!1303517))

(assert (=> b!1413519 m!1303363))

(assert (=> b!1413519 m!1303363))

(assert (=> b!1413519 m!1303365))

(assert (=> b!1413376 d!152007))

(declare-fun d!152009 () Bool)

(assert (=> d!152009 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!622949 () Unit!47709)

(declare-fun choose!38 (array!96543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47709)

(assert (=> d!152009 (= lt!622949 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152009 (validMask!0 mask!2840)))

(assert (=> d!152009 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!622949)))

(declare-fun bs!41188 () Bool)

(assert (= bs!41188 d!152009))

(assert (=> bs!41188 m!1303385))

(declare-fun m!1303519 () Bool)

(assert (=> bs!41188 m!1303519))

(assert (=> bs!41188 m!1303359))

(assert (=> b!1413376 d!152009))

(declare-fun b!1413572 () Bool)

(declare-fun e!799997 () SeekEntryResult!10946)

(assert (=> b!1413572 (= e!799997 (Intermediate!10946 true lt!622861 #b00000000000000000000000000000000))))

(declare-fun b!1413573 () Bool)

(declare-fun lt!622954 () SeekEntryResult!10946)

(assert (=> b!1413573 (and (bvsge (index!46166 lt!622954) #b00000000000000000000000000000000) (bvslt (index!46166 lt!622954) (size!47161 a!2901)))))

(declare-fun e!799993 () Bool)

(assert (=> b!1413573 (= e!799993 (= (select (arr!46609 a!2901) (index!46166 lt!622954)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1413574 () Bool)

(declare-fun e!799994 () Bool)

(declare-fun e!799995 () Bool)

(assert (=> b!1413574 (= e!799994 e!799995)))

(declare-fun res!950530 () Bool)

(assert (=> b!1413574 (= res!950530 (and ((_ is Intermediate!10946) lt!622954) (not (undefined!11758 lt!622954)) (bvslt (x!127742 lt!622954) #b01111111111111111111111111111110) (bvsge (x!127742 lt!622954) #b00000000000000000000000000000000) (bvsge (x!127742 lt!622954) #b00000000000000000000000000000000)))))

(assert (=> b!1413574 (=> (not res!950530) (not e!799995))))

(declare-fun b!1413575 () Bool)

(assert (=> b!1413575 (= e!799994 (bvsge (x!127742 lt!622954) #b01111111111111111111111111111110))))

(declare-fun b!1413577 () Bool)

(declare-fun e!799996 () SeekEntryResult!10946)

(assert (=> b!1413577 (= e!799996 (Intermediate!10946 false lt!622861 #b00000000000000000000000000000000))))

(declare-fun b!1413578 () Bool)

(assert (=> b!1413578 (and (bvsge (index!46166 lt!622954) #b00000000000000000000000000000000) (bvslt (index!46166 lt!622954) (size!47161 a!2901)))))

(declare-fun res!950528 () Bool)

(assert (=> b!1413578 (= res!950528 (= (select (arr!46609 a!2901) (index!46166 lt!622954)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413578 (=> res!950528 e!799993)))

(declare-fun b!1413579 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413579 (= e!799996 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!622861 #b00000000000000000000000000000000 mask!2840) (select (arr!46609 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1413580 () Bool)

(assert (=> b!1413580 (= e!799997 e!799996)))

(declare-fun c!131000 () Bool)

(declare-fun lt!622955 () (_ BitVec 64))

(assert (=> b!1413580 (= c!131000 (or (= lt!622955 (select (arr!46609 a!2901) j!112)) (= (bvadd lt!622955 lt!622955) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152013 () Bool)

(assert (=> d!152013 e!799994))

(declare-fun c!130998 () Bool)

(assert (=> d!152013 (= c!130998 (and ((_ is Intermediate!10946) lt!622954) (undefined!11758 lt!622954)))))

(assert (=> d!152013 (= lt!622954 e!799997)))

(declare-fun c!130999 () Bool)

(assert (=> d!152013 (= c!130999 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152013 (= lt!622955 (select (arr!46609 a!2901) lt!622861))))

(assert (=> d!152013 (validMask!0 mask!2840)))

(assert (=> d!152013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622861 (select (arr!46609 a!2901) j!112) a!2901 mask!2840) lt!622954)))

(declare-fun b!1413576 () Bool)

(assert (=> b!1413576 (and (bvsge (index!46166 lt!622954) #b00000000000000000000000000000000) (bvslt (index!46166 lt!622954) (size!47161 a!2901)))))

(declare-fun res!950529 () Bool)

(assert (=> b!1413576 (= res!950529 (= (select (arr!46609 a!2901) (index!46166 lt!622954)) (select (arr!46609 a!2901) j!112)))))

(assert (=> b!1413576 (=> res!950529 e!799993)))

(assert (=> b!1413576 (= e!799995 e!799993)))

(assert (= (and d!152013 c!130999) b!1413572))

(assert (= (and d!152013 (not c!130999)) b!1413580))

(assert (= (and b!1413580 c!131000) b!1413577))

(assert (= (and b!1413580 (not c!131000)) b!1413579))

(assert (= (and d!152013 c!130998) b!1413575))

(assert (= (and d!152013 (not c!130998)) b!1413574))

(assert (= (and b!1413574 res!950530) b!1413576))

(assert (= (and b!1413576 (not res!950529)) b!1413578))

(assert (= (and b!1413578 (not res!950528)) b!1413573))

(declare-fun m!1303541 () Bool)

(assert (=> b!1413573 m!1303541))

(assert (=> b!1413578 m!1303541))

(declare-fun m!1303543 () Bool)

(assert (=> b!1413579 m!1303543))

(assert (=> b!1413579 m!1303543))

(assert (=> b!1413579 m!1303363))

(declare-fun m!1303545 () Bool)

(assert (=> b!1413579 m!1303545))

(assert (=> b!1413576 m!1303541))

(declare-fun m!1303547 () Bool)

(assert (=> d!152013 m!1303547))

(assert (=> d!152013 m!1303359))

(assert (=> b!1413376 d!152013))

(declare-fun d!152025 () Bool)

(declare-fun lt!622971 () (_ BitVec 32))

(declare-fun lt!622970 () (_ BitVec 32))

(assert (=> d!152025 (= lt!622971 (bvmul (bvxor lt!622970 (bvlshr lt!622970 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152025 (= lt!622970 ((_ extract 31 0) (bvand (bvxor (select (arr!46609 a!2901) j!112) (bvlshr (select (arr!46609 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152025 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950531 (let ((h!34481 ((_ extract 31 0) (bvand (bvxor (select (arr!46609 a!2901) j!112) (bvlshr (select (arr!46609 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127748 (bvmul (bvxor h!34481 (bvlshr h!34481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127748 (bvlshr x!127748 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950531 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950531 #b00000000000000000000000000000000))))))

(assert (=> d!152025 (= (toIndex!0 (select (arr!46609 a!2901) j!112) mask!2840) (bvand (bvxor lt!622971 (bvlshr lt!622971 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413376 d!152025))

(declare-fun d!152027 () Bool)

(assert (=> d!152027 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121652 d!152027))

(declare-fun d!152037 () Bool)

(assert (=> d!152037 (= (array_inv!35842 a!2901) (bvsge (size!47161 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121652 d!152037))

(declare-fun b!1413626 () Bool)

(declare-fun e!800026 () SeekEntryResult!10946)

(assert (=> b!1413626 (= e!800026 (Intermediate!10946 true (toIndex!0 lt!622858 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413627 () Bool)

(declare-fun lt!622983 () SeekEntryResult!10946)

(assert (=> b!1413627 (and (bvsge (index!46166 lt!622983) #b00000000000000000000000000000000) (bvslt (index!46166 lt!622983) (size!47161 lt!622862)))))

(declare-fun e!800022 () Bool)

(assert (=> b!1413627 (= e!800022 (= (select (arr!46609 lt!622862) (index!46166 lt!622983)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1413628 () Bool)

(declare-fun e!800023 () Bool)

(declare-fun e!800024 () Bool)

(assert (=> b!1413628 (= e!800023 e!800024)))

(declare-fun res!950544 () Bool)

(assert (=> b!1413628 (= res!950544 (and ((_ is Intermediate!10946) lt!622983) (not (undefined!11758 lt!622983)) (bvslt (x!127742 lt!622983) #b01111111111111111111111111111110) (bvsge (x!127742 lt!622983) #b00000000000000000000000000000000) (bvsge (x!127742 lt!622983) #b00000000000000000000000000000000)))))

(assert (=> b!1413628 (=> (not res!950544) (not e!800024))))

(declare-fun b!1413629 () Bool)

(assert (=> b!1413629 (= e!800023 (bvsge (x!127742 lt!622983) #b01111111111111111111111111111110))))

(declare-fun b!1413631 () Bool)

(declare-fun e!800025 () SeekEntryResult!10946)

(assert (=> b!1413631 (= e!800025 (Intermediate!10946 false (toIndex!0 lt!622858 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413632 () Bool)

(assert (=> b!1413632 (and (bvsge (index!46166 lt!622983) #b00000000000000000000000000000000) (bvslt (index!46166 lt!622983) (size!47161 lt!622862)))))

(declare-fun res!950542 () Bool)

(assert (=> b!1413632 (= res!950542 (= (select (arr!46609 lt!622862) (index!46166 lt!622983)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413632 (=> res!950542 e!800022)))

(declare-fun b!1413633 () Bool)

(assert (=> b!1413633 (= e!800025 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!622858 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!622858 lt!622862 mask!2840))))

(declare-fun b!1413634 () Bool)

(assert (=> b!1413634 (= e!800026 e!800025)))

(declare-fun c!131021 () Bool)

(declare-fun lt!622984 () (_ BitVec 64))

(assert (=> b!1413634 (= c!131021 (or (= lt!622984 lt!622858) (= (bvadd lt!622984 lt!622984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152039 () Bool)

(assert (=> d!152039 e!800023))

(declare-fun c!131019 () Bool)

(assert (=> d!152039 (= c!131019 (and ((_ is Intermediate!10946) lt!622983) (undefined!11758 lt!622983)))))

(assert (=> d!152039 (= lt!622983 e!800026)))

(declare-fun c!131020 () Bool)

(assert (=> d!152039 (= c!131020 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152039 (= lt!622984 (select (arr!46609 lt!622862) (toIndex!0 lt!622858 mask!2840)))))

(assert (=> d!152039 (validMask!0 mask!2840)))

(assert (=> d!152039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622858 mask!2840) lt!622858 lt!622862 mask!2840) lt!622983)))

(declare-fun b!1413630 () Bool)

(assert (=> b!1413630 (and (bvsge (index!46166 lt!622983) #b00000000000000000000000000000000) (bvslt (index!46166 lt!622983) (size!47161 lt!622862)))))

(declare-fun res!950543 () Bool)

(assert (=> b!1413630 (= res!950543 (= (select (arr!46609 lt!622862) (index!46166 lt!622983)) lt!622858))))

(assert (=> b!1413630 (=> res!950543 e!800022)))

(assert (=> b!1413630 (= e!800024 e!800022)))

(assert (= (and d!152039 c!131020) b!1413626))

(assert (= (and d!152039 (not c!131020)) b!1413634))

(assert (= (and b!1413634 c!131021) b!1413631))

(assert (= (and b!1413634 (not c!131021)) b!1413633))

(assert (= (and d!152039 c!131019) b!1413629))

(assert (= (and d!152039 (not c!131019)) b!1413628))

(assert (= (and b!1413628 res!950544) b!1413630))

(assert (= (and b!1413630 (not res!950543)) b!1413632))

(assert (= (and b!1413632 (not res!950542)) b!1413627))

(declare-fun m!1303567 () Bool)

(assert (=> b!1413627 m!1303567))

(assert (=> b!1413632 m!1303567))

(assert (=> b!1413633 m!1303373))

(declare-fun m!1303569 () Bool)

(assert (=> b!1413633 m!1303569))

(assert (=> b!1413633 m!1303569))

(declare-fun m!1303571 () Bool)

(assert (=> b!1413633 m!1303571))

(assert (=> b!1413630 m!1303567))

(assert (=> d!152039 m!1303373))

(declare-fun m!1303573 () Bool)

(assert (=> d!152039 m!1303573))

(assert (=> d!152039 m!1303359))

(assert (=> b!1413381 d!152039))

(declare-fun d!152041 () Bool)

(declare-fun lt!622986 () (_ BitVec 32))

(declare-fun lt!622985 () (_ BitVec 32))

(assert (=> d!152041 (= lt!622986 (bvmul (bvxor lt!622985 (bvlshr lt!622985 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152041 (= lt!622985 ((_ extract 31 0) (bvand (bvxor lt!622858 (bvlshr lt!622858 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152041 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950531 (let ((h!34481 ((_ extract 31 0) (bvand (bvxor lt!622858 (bvlshr lt!622858 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127748 (bvmul (bvxor h!34481 (bvlshr h!34481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127748 (bvlshr x!127748 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950531 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950531 #b00000000000000000000000000000000))))))

(assert (=> d!152041 (= (toIndex!0 lt!622858 mask!2840) (bvand (bvxor lt!622986 (bvlshr lt!622986 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413381 d!152041))

(declare-fun b!1413635 () Bool)

(declare-fun e!800029 () SeekEntryResult!10946)

(assert (=> b!1413635 (= e!800029 Undefined!10946)))

(declare-fun b!1413636 () Bool)

(declare-fun e!800028 () SeekEntryResult!10946)

(declare-fun lt!622989 () SeekEntryResult!10946)

(assert (=> b!1413636 (= e!800028 (MissingZero!10946 (index!46166 lt!622989)))))

(declare-fun b!1413637 () Bool)

(declare-fun e!800027 () SeekEntryResult!10946)

(assert (=> b!1413637 (= e!800029 e!800027)))

(declare-fun lt!622988 () (_ BitVec 64))

(assert (=> b!1413637 (= lt!622988 (select (arr!46609 lt!622862) (index!46166 lt!622989)))))

(declare-fun c!131023 () Bool)

(assert (=> b!1413637 (= c!131023 (= lt!622988 lt!622858))))

(declare-fun d!152043 () Bool)

(declare-fun lt!622987 () SeekEntryResult!10946)

(assert (=> d!152043 (and (or ((_ is Undefined!10946) lt!622987) (not ((_ is Found!10946) lt!622987)) (and (bvsge (index!46165 lt!622987) #b00000000000000000000000000000000) (bvslt (index!46165 lt!622987) (size!47161 lt!622862)))) (or ((_ is Undefined!10946) lt!622987) ((_ is Found!10946) lt!622987) (not ((_ is MissingZero!10946) lt!622987)) (and (bvsge (index!46164 lt!622987) #b00000000000000000000000000000000) (bvslt (index!46164 lt!622987) (size!47161 lt!622862)))) (or ((_ is Undefined!10946) lt!622987) ((_ is Found!10946) lt!622987) ((_ is MissingZero!10946) lt!622987) (not ((_ is MissingVacant!10946) lt!622987)) (and (bvsge (index!46167 lt!622987) #b00000000000000000000000000000000) (bvslt (index!46167 lt!622987) (size!47161 lt!622862)))) (or ((_ is Undefined!10946) lt!622987) (ite ((_ is Found!10946) lt!622987) (= (select (arr!46609 lt!622862) (index!46165 lt!622987)) lt!622858) (ite ((_ is MissingZero!10946) lt!622987) (= (select (arr!46609 lt!622862) (index!46164 lt!622987)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10946) lt!622987) (= (select (arr!46609 lt!622862) (index!46167 lt!622987)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152043 (= lt!622987 e!800029)))

(declare-fun c!131024 () Bool)

(assert (=> d!152043 (= c!131024 (and ((_ is Intermediate!10946) lt!622989) (undefined!11758 lt!622989)))))

(assert (=> d!152043 (= lt!622989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622858 mask!2840) lt!622858 lt!622862 mask!2840))))

(assert (=> d!152043 (validMask!0 mask!2840)))

(assert (=> d!152043 (= (seekEntryOrOpen!0 lt!622858 lt!622862 mask!2840) lt!622987)))

(declare-fun b!1413638 () Bool)

(declare-fun c!131022 () Bool)

(assert (=> b!1413638 (= c!131022 (= lt!622988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413638 (= e!800027 e!800028)))

(declare-fun b!1413639 () Bool)

(assert (=> b!1413639 (= e!800028 (seekKeyOrZeroReturnVacant!0 (x!127742 lt!622989) (index!46166 lt!622989) (index!46166 lt!622989) lt!622858 lt!622862 mask!2840))))

(declare-fun b!1413640 () Bool)

(assert (=> b!1413640 (= e!800027 (Found!10946 (index!46166 lt!622989)))))

(assert (= (and d!152043 c!131024) b!1413635))

(assert (= (and d!152043 (not c!131024)) b!1413637))

(assert (= (and b!1413637 c!131023) b!1413640))

(assert (= (and b!1413637 (not c!131023)) b!1413638))

(assert (= (and b!1413638 c!131022) b!1413636))

(assert (= (and b!1413638 (not c!131022)) b!1413639))

(declare-fun m!1303575 () Bool)

(assert (=> b!1413637 m!1303575))

(declare-fun m!1303577 () Bool)

(assert (=> d!152043 m!1303577))

(assert (=> d!152043 m!1303359))

(assert (=> d!152043 m!1303373))

(declare-fun m!1303579 () Bool)

(assert (=> d!152043 m!1303579))

(declare-fun m!1303581 () Bool)

(assert (=> d!152043 m!1303581))

(assert (=> d!152043 m!1303373))

(assert (=> d!152043 m!1303375))

(declare-fun m!1303583 () Bool)

(assert (=> b!1413639 m!1303583))

(assert (=> b!1413380 d!152043))

(declare-fun b!1413708 () Bool)

(declare-fun c!131050 () Bool)

(declare-fun lt!623031 () (_ BitVec 64))

(assert (=> b!1413708 (= c!131050 (= lt!623031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800073 () SeekEntryResult!10946)

(declare-fun e!800072 () SeekEntryResult!10946)

(assert (=> b!1413708 (= e!800073 e!800072)))

(declare-fun d!152045 () Bool)

(declare-fun lt!623032 () SeekEntryResult!10946)

(assert (=> d!152045 (and (or ((_ is Undefined!10946) lt!623032) (not ((_ is Found!10946) lt!623032)) (and (bvsge (index!46165 lt!623032) #b00000000000000000000000000000000) (bvslt (index!46165 lt!623032) (size!47161 lt!622862)))) (or ((_ is Undefined!10946) lt!623032) ((_ is Found!10946) lt!623032) (not ((_ is MissingVacant!10946) lt!623032)) (not (= (index!46167 lt!623032) (index!46166 lt!622856))) (and (bvsge (index!46167 lt!623032) #b00000000000000000000000000000000) (bvslt (index!46167 lt!623032) (size!47161 lt!622862)))) (or ((_ is Undefined!10946) lt!623032) (ite ((_ is Found!10946) lt!623032) (= (select (arr!46609 lt!622862) (index!46165 lt!623032)) (select (arr!46609 a!2901) j!112)) (and ((_ is MissingVacant!10946) lt!623032) (= (index!46167 lt!623032) (index!46166 lt!622856)) (= (select (arr!46609 lt!622862) (index!46167 lt!623032)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!800071 () SeekEntryResult!10946)

(assert (=> d!152045 (= lt!623032 e!800071)))

(declare-fun c!131052 () Bool)

(assert (=> d!152045 (= c!131052 (bvsge (x!127742 lt!622856) #b01111111111111111111111111111110))))

(assert (=> d!152045 (= lt!623031 (select (arr!46609 lt!622862) (index!46166 lt!622856)))))

(assert (=> d!152045 (validMask!0 mask!2840)))

(assert (=> d!152045 (= (seekKeyOrZeroReturnVacant!0 (x!127742 lt!622856) (index!46166 lt!622856) (index!46166 lt!622856) (select (arr!46609 a!2901) j!112) lt!622862 mask!2840) lt!623032)))

(declare-fun b!1413709 () Bool)

(assert (=> b!1413709 (= e!800073 (Found!10946 (index!46166 lt!622856)))))

(declare-fun b!1413710 () Bool)

(assert (=> b!1413710 (= e!800071 e!800073)))

(declare-fun c!131051 () Bool)

(assert (=> b!1413710 (= c!131051 (= lt!623031 (select (arr!46609 a!2901) j!112)))))

(declare-fun b!1413711 () Bool)

(assert (=> b!1413711 (= e!800072 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127742 lt!622856) #b00000000000000000000000000000001) (nextIndex!0 (index!46166 lt!622856) (x!127742 lt!622856) mask!2840) (index!46166 lt!622856) (select (arr!46609 a!2901) j!112) lt!622862 mask!2840))))

(declare-fun b!1413712 () Bool)

(assert (=> b!1413712 (= e!800072 (MissingVacant!10946 (index!46166 lt!622856)))))

(declare-fun b!1413713 () Bool)

(assert (=> b!1413713 (= e!800071 Undefined!10946)))

(assert (= (and d!152045 c!131052) b!1413713))

(assert (= (and d!152045 (not c!131052)) b!1413710))

(assert (= (and b!1413710 c!131051) b!1413709))

(assert (= (and b!1413710 (not c!131051)) b!1413708))

(assert (= (and b!1413708 c!131050) b!1413712))

(assert (= (and b!1413708 (not c!131050)) b!1413711))

(declare-fun m!1303633 () Bool)

(assert (=> d!152045 m!1303633))

(declare-fun m!1303635 () Bool)

(assert (=> d!152045 m!1303635))

(declare-fun m!1303637 () Bool)

(assert (=> d!152045 m!1303637))

(assert (=> d!152045 m!1303359))

(declare-fun m!1303639 () Bool)

(assert (=> b!1413711 m!1303639))

(assert (=> b!1413711 m!1303639))

(assert (=> b!1413711 m!1303363))

(declare-fun m!1303641 () Bool)

(assert (=> b!1413711 m!1303641))

(assert (=> b!1413380 d!152045))

(declare-fun d!152065 () Bool)

(assert (=> d!152065 (and (not (undefined!11758 lt!622856)) (= (index!46166 lt!622856) i!1037) (bvslt (x!127742 lt!622856) (x!127742 lt!622860)))))

(declare-fun lt!623041 () Unit!47709)

(declare-fun choose!62 (array!96543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47709)

(assert (=> d!152065 (= lt!623041 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622861 (x!127742 lt!622860) (index!46166 lt!622860) (x!127742 lt!622856) (index!46166 lt!622856) (undefined!11758 lt!622856) mask!2840))))

(assert (=> d!152065 (validMask!0 mask!2840)))

(assert (=> d!152065 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622861 (x!127742 lt!622860) (index!46166 lt!622860) (x!127742 lt!622856) (index!46166 lt!622856) (undefined!11758 lt!622856) mask!2840) lt!623041)))

(declare-fun bs!41192 () Bool)

(assert (= bs!41192 d!152065))

(declare-fun m!1303651 () Bool)

(assert (=> bs!41192 m!1303651))

(assert (=> bs!41192 m!1303359))

(assert (=> b!1413375 d!152065))

(declare-fun d!152071 () Bool)

(assert (=> d!152071 (= (validKeyInArray!0 (select (arr!46609 a!2901) i!1037)) (and (not (= (select (arr!46609 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46609 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413379 d!152071))

(declare-fun d!152073 () Bool)

(assert (=> d!152073 (= (validKeyInArray!0 (select (arr!46609 a!2901) j!112)) (and (not (= (select (arr!46609 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46609 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413378 d!152073))

(check-sat (not bm!67079) (not d!152039) (not bm!67080) (not b!1413473) (not b!1413579) (not b!1413461) (not b!1413711) (not b!1413519) (not d!152013) (not b!1413515) (not d!152065) (not d!152043) (not d!152045) (not b!1413518) (not b!1413639) (not b!1413474) (not d!152009) (not b!1413633) (not d!151995) (not b!1413514) (not bm!67076) (not b!1413476))
(check-sat)
