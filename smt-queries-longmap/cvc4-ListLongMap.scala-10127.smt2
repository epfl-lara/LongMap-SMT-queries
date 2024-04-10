; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119368 () Bool)

(assert start!119368)

(declare-fun b!1391562 () Bool)

(declare-fun res!931430 () Bool)

(declare-fun e!787992 () Bool)

(assert (=> b!1391562 (=> (not res!931430) (not e!787992))))

(declare-datatypes ((array!95203 0))(
  ( (array!95204 (arr!45964 (Array (_ BitVec 32) (_ BitVec 64))) (size!46514 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95203)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95203 (_ BitVec 32)) Bool)

(assert (=> b!1391562 (= res!931430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!787994 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1391563 () Bool)

(declare-datatypes ((SeekEntryResult!10281 0))(
  ( (MissingZero!10281 (index!43495 (_ BitVec 32))) (Found!10281 (index!43496 (_ BitVec 32))) (Intermediate!10281 (undefined!11093 Bool) (index!43497 (_ BitVec 32)) (x!125171 (_ BitVec 32))) (Undefined!10281) (MissingVacant!10281 (index!43498 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95203 (_ BitVec 32)) SeekEntryResult!10281)

(assert (=> b!1391563 (= e!787994 (= (seekEntryOrOpen!0 (select (arr!45964 a!2901) j!112) a!2901 mask!2840) (Found!10281 j!112)))))

(declare-fun b!1391564 () Bool)

(declare-fun res!931435 () Bool)

(assert (=> b!1391564 (=> (not res!931435) (not e!787992))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391564 (= res!931435 (and (= (size!46514 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46514 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46514 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391565 () Bool)

(declare-fun res!931432 () Bool)

(assert (=> b!1391565 (=> (not res!931432) (not e!787992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391565 (= res!931432 (validKeyInArray!0 (select (arr!45964 a!2901) j!112)))))

(declare-fun b!1391566 () Bool)

(declare-fun res!931433 () Bool)

(assert (=> b!1391566 (=> (not res!931433) (not e!787992))))

(assert (=> b!1391566 (= res!931433 (validKeyInArray!0 (select (arr!45964 a!2901) i!1037)))))

(declare-fun b!1391567 () Bool)

(declare-fun lt!611240 () SeekEntryResult!10281)

(assert (=> b!1391567 (= e!787992 (not (or (not (is-Intermediate!10281 lt!611240)) (undefined!11093 lt!611240) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(assert (=> b!1391567 e!787994))

(declare-fun res!931431 () Bool)

(assert (=> b!1391567 (=> (not res!931431) (not e!787994))))

(assert (=> b!1391567 (= res!931431 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46566 0))(
  ( (Unit!46567) )
))
(declare-fun lt!611241 () Unit!46566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46566)

(assert (=> b!1391567 (= lt!611241 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95203 (_ BitVec 32)) SeekEntryResult!10281)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391567 (= lt!611240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45964 a!2901) j!112) mask!2840) (select (arr!45964 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!931429 () Bool)

(assert (=> start!119368 (=> (not res!931429) (not e!787992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119368 (= res!931429 (validMask!0 mask!2840))))

(assert (=> start!119368 e!787992))

(assert (=> start!119368 true))

(declare-fun array_inv!34992 (array!95203) Bool)

(assert (=> start!119368 (array_inv!34992 a!2901)))

(declare-fun b!1391568 () Bool)

(declare-fun res!931434 () Bool)

(assert (=> b!1391568 (=> (not res!931434) (not e!787992))))

(declare-datatypes ((List!32483 0))(
  ( (Nil!32480) (Cons!32479 (h!33703 (_ BitVec 64)) (t!47177 List!32483)) )
))
(declare-fun arrayNoDuplicates!0 (array!95203 (_ BitVec 32) List!32483) Bool)

(assert (=> b!1391568 (= res!931434 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32480))))

(assert (= (and start!119368 res!931429) b!1391564))

(assert (= (and b!1391564 res!931435) b!1391566))

(assert (= (and b!1391566 res!931433) b!1391565))

(assert (= (and b!1391565 res!931432) b!1391562))

(assert (= (and b!1391562 res!931430) b!1391568))

(assert (= (and b!1391568 res!931434) b!1391567))

(assert (= (and b!1391567 res!931431) b!1391563))

(declare-fun m!1277371 () Bool)

(assert (=> b!1391567 m!1277371))

(declare-fun m!1277373 () Bool)

(assert (=> b!1391567 m!1277373))

(assert (=> b!1391567 m!1277371))

(declare-fun m!1277375 () Bool)

(assert (=> b!1391567 m!1277375))

(assert (=> b!1391567 m!1277373))

(assert (=> b!1391567 m!1277371))

(declare-fun m!1277377 () Bool)

(assert (=> b!1391567 m!1277377))

(declare-fun m!1277379 () Bool)

(assert (=> b!1391567 m!1277379))

(declare-fun m!1277381 () Bool)

(assert (=> b!1391568 m!1277381))

(declare-fun m!1277383 () Bool)

(assert (=> b!1391562 m!1277383))

(assert (=> b!1391565 m!1277371))

(assert (=> b!1391565 m!1277371))

(declare-fun m!1277385 () Bool)

(assert (=> b!1391565 m!1277385))

(declare-fun m!1277387 () Bool)

(assert (=> start!119368 m!1277387))

(declare-fun m!1277389 () Bool)

(assert (=> start!119368 m!1277389))

(declare-fun m!1277391 () Bool)

(assert (=> b!1391566 m!1277391))

(assert (=> b!1391566 m!1277391))

(declare-fun m!1277393 () Bool)

(assert (=> b!1391566 m!1277393))

(assert (=> b!1391563 m!1277371))

(assert (=> b!1391563 m!1277371))

(declare-fun m!1277395 () Bool)

(assert (=> b!1391563 m!1277395))

(push 1)

(assert (not b!1391562))

(assert (not start!119368))

(assert (not b!1391567))

(assert (not b!1391565))

(assert (not b!1391568))

(assert (not b!1391563))

(assert (not b!1391566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150355 () Bool)

(declare-fun lt!611268 () SeekEntryResult!10281)

(assert (=> d!150355 (and (or (is-Undefined!10281 lt!611268) (not (is-Found!10281 lt!611268)) (and (bvsge (index!43496 lt!611268) #b00000000000000000000000000000000) (bvslt (index!43496 lt!611268) (size!46514 a!2901)))) (or (is-Undefined!10281 lt!611268) (is-Found!10281 lt!611268) (not (is-MissingZero!10281 lt!611268)) (and (bvsge (index!43495 lt!611268) #b00000000000000000000000000000000) (bvslt (index!43495 lt!611268) (size!46514 a!2901)))) (or (is-Undefined!10281 lt!611268) (is-Found!10281 lt!611268) (is-MissingZero!10281 lt!611268) (not (is-MissingVacant!10281 lt!611268)) (and (bvsge (index!43498 lt!611268) #b00000000000000000000000000000000) (bvslt (index!43498 lt!611268) (size!46514 a!2901)))) (or (is-Undefined!10281 lt!611268) (ite (is-Found!10281 lt!611268) (= (select (arr!45964 a!2901) (index!43496 lt!611268)) (select (arr!45964 a!2901) j!112)) (ite (is-MissingZero!10281 lt!611268) (= (select (arr!45964 a!2901) (index!43495 lt!611268)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10281 lt!611268) (= (select (arr!45964 a!2901) (index!43498 lt!611268)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!788031 () SeekEntryResult!10281)

(assert (=> d!150355 (= lt!611268 e!788031)))

(declare-fun c!129536 () Bool)

(declare-fun lt!611267 () SeekEntryResult!10281)

(assert (=> d!150355 (= c!129536 (and (is-Intermediate!10281 lt!611267) (undefined!11093 lt!611267)))))

(assert (=> d!150355 (= lt!611267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45964 a!2901) j!112) mask!2840) (select (arr!45964 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150355 (validMask!0 mask!2840)))

(assert (=> d!150355 (= (seekEntryOrOpen!0 (select (arr!45964 a!2901) j!112) a!2901 mask!2840) lt!611268)))

(declare-fun e!788033 () SeekEntryResult!10281)

(declare-fun b!1391626 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95203 (_ BitVec 32)) SeekEntryResult!10281)

(assert (=> b!1391626 (= e!788033 (seekKeyOrZeroReturnVacant!0 (x!125171 lt!611267) (index!43497 lt!611267) (index!43497 lt!611267) (select (arr!45964 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391627 () Bool)

(assert (=> b!1391627 (= e!788031 Undefined!10281)))

(declare-fun b!1391628 () Bool)

(declare-fun c!129537 () Bool)

(declare-fun lt!611266 () (_ BitVec 64))

(assert (=> b!1391628 (= c!129537 (= lt!611266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788032 () SeekEntryResult!10281)

(assert (=> b!1391628 (= e!788032 e!788033)))

(declare-fun b!1391629 () Bool)

(assert (=> b!1391629 (= e!788033 (MissingZero!10281 (index!43497 lt!611267)))))

(declare-fun b!1391630 () Bool)

(assert (=> b!1391630 (= e!788031 e!788032)))

(assert (=> b!1391630 (= lt!611266 (select (arr!45964 a!2901) (index!43497 lt!611267)))))

(declare-fun c!129535 () Bool)

(assert (=> b!1391630 (= c!129535 (= lt!611266 (select (arr!45964 a!2901) j!112)))))

(declare-fun b!1391631 () Bool)

(assert (=> b!1391631 (= e!788032 (Found!10281 (index!43497 lt!611267)))))

(assert (= (and d!150355 c!129536) b!1391627))

(assert (= (and d!150355 (not c!129536)) b!1391630))

(assert (= (and b!1391630 c!129535) b!1391631))

(assert (= (and b!1391630 (not c!129535)) b!1391628))

(assert (= (and b!1391628 c!129537) b!1391629))

