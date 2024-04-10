; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131384 () Bool)

(assert start!131384)

(declare-fun b!1540505 () Bool)

(declare-fun e!856770 () Bool)

(declare-fun e!856768 () Bool)

(assert (=> b!1540505 (= e!856770 e!856768)))

(declare-fun res!1057201 () Bool)

(assert (=> b!1540505 (=> (not res!1057201) (not e!856768))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102332 0))(
  ( (array!102333 (arr!49376 (Array (_ BitVec 32) (_ BitVec 64))) (size!49926 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102332)

(declare-fun lt!665380 () (_ BitVec 32))

(assert (=> b!1540505 (= res!1057201 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665380 #b00000000000000000000000000000000) (bvslt lt!665380 (size!49926 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540505 (= lt!665380 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540506 () Bool)

(declare-fun res!1057196 () Bool)

(declare-fun e!856769 () Bool)

(assert (=> b!1540506 (=> (not res!1057196) (not e!856769))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1540506 (= res!1057196 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49926 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49926 a!2792)) (= (select (arr!49376 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1057195 () Bool)

(assert (=> start!131384 (=> (not res!1057195) (not e!856769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131384 (= res!1057195 (validMask!0 mask!2480))))

(assert (=> start!131384 e!856769))

(assert (=> start!131384 true))

(declare-fun array_inv!38404 (array!102332) Bool)

(assert (=> start!131384 (array_inv!38404 a!2792)))

(declare-fun b!1540507 () Bool)

(declare-fun res!1057199 () Bool)

(assert (=> b!1540507 (=> (not res!1057199) (not e!856769))))

(declare-datatypes ((List!35850 0))(
  ( (Nil!35847) (Cons!35846 (h!37291 (_ BitVec 64)) (t!50544 List!35850)) )
))
(declare-fun arrayNoDuplicates!0 (array!102332 (_ BitVec 32) List!35850) Bool)

(assert (=> b!1540507 (= res!1057199 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35847))))

(declare-fun b!1540508 () Bool)

(assert (=> b!1540508 (= e!856769 e!856770)))

(declare-fun res!1057197 () Bool)

(assert (=> b!1540508 (=> (not res!1057197) (not e!856770))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13502 0))(
  ( (MissingZero!13502 (index!56403 (_ BitVec 32))) (Found!13502 (index!56404 (_ BitVec 32))) (Intermediate!13502 (undefined!14314 Bool) (index!56405 (_ BitVec 32)) (x!138141 (_ BitVec 32))) (Undefined!13502) (MissingVacant!13502 (index!56406 (_ BitVec 32))) )
))
(declare-fun lt!665381 () SeekEntryResult!13502)

(declare-fun lt!665382 () SeekEntryResult!13502)

(assert (=> b!1540508 (= res!1057197 (and (= lt!665382 lt!665381) (not (= (select (arr!49376 a!2792) index!463) (select (arr!49376 a!2792) j!64)))))))

(assert (=> b!1540508 (= lt!665381 (Found!13502 j!64))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102332 (_ BitVec 32)) SeekEntryResult!13502)

(assert (=> b!1540508 (= lt!665382 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49376 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540509 () Bool)

(declare-fun res!1057203 () Bool)

(assert (=> b!1540509 (=> (not res!1057203) (not e!856769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540509 (= res!1057203 (validKeyInArray!0 (select (arr!49376 a!2792) j!64)))))

(declare-fun b!1540510 () Bool)

(declare-fun res!1057204 () Bool)

(assert (=> b!1540510 (=> (not res!1057204) (not e!856769))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540510 (= res!1057204 (validKeyInArray!0 (select (arr!49376 a!2792) i!951)))))

(declare-fun e!856771 () Bool)

(declare-fun b!1540511 () Bool)

(declare-fun lt!665383 () array!102332)

(declare-fun lt!665378 () (_ BitVec 64))

(assert (=> b!1540511 (= e!856771 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!665378 lt!665383 mask!2480) lt!665382)))))

(declare-fun lt!665379 () SeekEntryResult!13502)

(assert (=> b!1540511 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665380 vacantIndex!5 lt!665378 lt!665383 mask!2480) lt!665379)))

(assert (=> b!1540511 (= lt!665378 (select (store (arr!49376 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(assert (=> b!1540511 (= lt!665383 (array!102333 (store (arr!49376 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49926 a!2792)))))

(declare-datatypes ((Unit!51444 0))(
  ( (Unit!51445) )
))
(declare-fun lt!665377 () Unit!51444)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51444)

(assert (=> b!1540511 (= lt!665377 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665380 vacantIndex!5 mask!2480))))

(declare-fun b!1540512 () Bool)

(declare-fun res!1057200 () Bool)

(assert (=> b!1540512 (=> (not res!1057200) (not e!856769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102332 (_ BitVec 32)) Bool)

(assert (=> b!1540512 (= res!1057200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540513 () Bool)

(assert (=> b!1540513 (= e!856768 e!856771)))

(declare-fun res!1057202 () Bool)

(assert (=> b!1540513 (=> (not res!1057202) (not e!856771))))

(assert (=> b!1540513 (= res!1057202 (= lt!665379 lt!665381))))

(assert (=> b!1540513 (= lt!665379 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665380 vacantIndex!5 (select (arr!49376 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540514 () Bool)

(declare-fun res!1057198 () Bool)

(assert (=> b!1540514 (=> (not res!1057198) (not e!856769))))

(assert (=> b!1540514 (= res!1057198 (and (= (size!49926 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49926 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49926 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131384 res!1057195) b!1540514))

(assert (= (and b!1540514 res!1057198) b!1540510))

(assert (= (and b!1540510 res!1057204) b!1540509))

(assert (= (and b!1540509 res!1057203) b!1540512))

(assert (= (and b!1540512 res!1057200) b!1540507))

(assert (= (and b!1540507 res!1057199) b!1540506))

(assert (= (and b!1540506 res!1057196) b!1540508))

(assert (= (and b!1540508 res!1057197) b!1540505))

(assert (= (and b!1540505 res!1057201) b!1540513))

(assert (= (and b!1540513 res!1057202) b!1540511))

(declare-fun m!1422621 () Bool)

(assert (=> b!1540511 m!1422621))

(declare-fun m!1422623 () Bool)

(assert (=> b!1540511 m!1422623))

(declare-fun m!1422625 () Bool)

(assert (=> b!1540511 m!1422625))

(declare-fun m!1422627 () Bool)

(assert (=> b!1540511 m!1422627))

(declare-fun m!1422629 () Bool)

(assert (=> b!1540511 m!1422629))

(declare-fun m!1422631 () Bool)

(assert (=> start!131384 m!1422631))

(declare-fun m!1422633 () Bool)

(assert (=> start!131384 m!1422633))

(declare-fun m!1422635 () Bool)

(assert (=> b!1540507 m!1422635))

(declare-fun m!1422637 () Bool)

(assert (=> b!1540509 m!1422637))

(assert (=> b!1540509 m!1422637))

(declare-fun m!1422639 () Bool)

(assert (=> b!1540509 m!1422639))

(declare-fun m!1422641 () Bool)

(assert (=> b!1540506 m!1422641))

(declare-fun m!1422643 () Bool)

(assert (=> b!1540512 m!1422643))

(declare-fun m!1422645 () Bool)

(assert (=> b!1540505 m!1422645))

(declare-fun m!1422647 () Bool)

(assert (=> b!1540510 m!1422647))

(assert (=> b!1540510 m!1422647))

(declare-fun m!1422649 () Bool)

(assert (=> b!1540510 m!1422649))

(declare-fun m!1422651 () Bool)

(assert (=> b!1540508 m!1422651))

(assert (=> b!1540508 m!1422637))

(assert (=> b!1540508 m!1422637))

(declare-fun m!1422653 () Bool)

(assert (=> b!1540508 m!1422653))

(assert (=> b!1540513 m!1422637))

(assert (=> b!1540513 m!1422637))

(declare-fun m!1422655 () Bool)

(assert (=> b!1540513 m!1422655))

(push 1)

(assert (not b!1540513))

(assert (not start!131384))

(assert (not b!1540508))

(assert (not b!1540505))

(assert (not b!1540509))

(assert (not b!1540507))

(assert (not b!1540510))

(assert (not b!1540511))

(assert (not b!1540512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1540665 () Bool)

(declare-fun e!856859 () SeekEntryResult!13502)

(declare-fun e!856861 () SeekEntryResult!13502)

(assert (=> b!1540665 (= e!856859 e!856861)))

(declare-fun c!141248 () Bool)

(declare-fun lt!665467 () (_ BitVec 64))

(assert (=> b!1540665 (= c!141248 (= lt!665467 (select (arr!49376 a!2792) j!64)))))

(declare-fun d!160553 () Bool)

(declare-fun lt!665466 () SeekEntryResult!13502)

(assert (=> d!160553 (and (or (is-Undefined!13502 lt!665466) (not (is-Found!13502 lt!665466)) (and (bvsge (index!56404 lt!665466) #b00000000000000000000000000000000) (bvslt (index!56404 lt!665466) (size!49926 a!2792)))) (or (is-Undefined!13502 lt!665466) (is-Found!13502 lt!665466) (not (is-MissingVacant!13502 lt!665466)) (not (= (index!56406 lt!665466) vacantIndex!5)) (and (bvsge (index!56406 lt!665466) #b00000000000000000000000000000000) (bvslt (index!56406 lt!665466) (size!49926 a!2792)))) (or (is-Undefined!13502 lt!665466) (ite (is-Found!13502 lt!665466) (= (select (arr!49376 a!2792) (index!56404 lt!665466)) (select (arr!49376 a!2792) j!64)) (and (is-MissingVacant!13502 lt!665466) (= (index!56406 lt!665466) vacantIndex!5) (= (select (arr!49376 a!2792) (index!56406 lt!665466)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160553 (= lt!665466 e!856859)))

(declare-fun c!141247 () Bool)

(assert (=> d!160553 (= c!141247 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160553 (= lt!665467 (select (arr!49376 a!2792) index!463))))

(assert (=> d!160553 (validMask!0 mask!2480)))

(assert (=> d!160553 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49376 a!2792) j!64) a!2792 mask!2480) lt!665466)))

(declare-fun e!856860 () SeekEntryResult!13502)

(declare-fun b!1540666 () Bool)

(assert (=> b!1540666 (= e!856860 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49376 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540667 () Bool)

(assert (=> b!1540667 (= e!856860 (MissingVacant!13502 vacantIndex!5))))

(declare-fun b!1540668 () Bool)

(assert (=> b!1540668 (= e!856859 Undefined!13502)))

(declare-fun b!1540669 () Bool)

(assert (=> b!1540669 (= e!856861 (Found!13502 index!463))))

(declare-fun b!1540670 () Bool)

(declare-fun c!141246 () Bool)

(assert (=> b!1540670 (= c!141246 (= lt!665467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540670 (= e!856861 e!856860)))

(assert (= (and d!160553 c!141247) b!1540668))

(assert (= (and d!160553 (not c!141247)) b!1540665))

(assert (= (and b!1540665 c!141248) b!1540669))

(assert (= (and b!1540665 (not c!141248)) b!1540670))

(assert (= (and b!1540670 c!141246) b!1540667))

(assert (= (and b!1540670 (not c!141246)) b!1540666))

(declare-fun m!1422795 () Bool)

(assert (=> d!160553 m!1422795))

(declare-fun m!1422797 () Bool)

(assert (=> d!160553 m!1422797))

(assert (=> d!160553 m!1422651))

(assert (=> d!160553 m!1422631))

(assert (=> b!1540666 m!1422645))

(assert (=> b!1540666 m!1422645))

(assert (=> b!1540666 m!1422637))

(declare-fun m!1422799 () Bool)

(assert (=> b!1540666 m!1422799))

(assert (=> b!1540508 d!160553))

(declare-fun b!1540671 () Bool)

(declare-fun e!856862 () SeekEntryResult!13502)

(declare-fun e!856864 () SeekEntryResult!13502)

(assert (=> b!1540671 (= e!856862 e!856864)))

(declare-fun lt!665469 () (_ BitVec 64))

(declare-fun c!141251 () Bool)

(assert (=> b!1540671 (= c!141251 (= lt!665469 (select (arr!49376 a!2792) j!64)))))

(declare-fun lt!665468 () SeekEntryResult!13502)

(declare-fun d!160571 () Bool)

(assert (=> d!160571 (and (or (is-Undefined!13502 lt!665468) (not (is-Found!13502 lt!665468)) (and (bvsge (index!56404 lt!665468) #b00000000000000000000000000000000) (bvslt (index!56404 lt!665468) (size!49926 a!2792)))) (or (is-Undefined!13502 lt!665468) (is-Found!13502 lt!665468) (not (is-MissingVacant!13502 lt!665468)) (not (= (index!56406 lt!665468) vacantIndex!5)) (and (bvsge (index!56406 lt!665468) #b00000000000000000000000000000000) (bvslt (index!56406 lt!665468) (size!49926 a!2792)))) (or (is-Undefined!13502 lt!665468) (ite (is-Found!13502 lt!665468) (= (select (arr!49376 a!2792) (index!56404 lt!665468)) (select (arr!49376 a!2792) j!64)) (and (is-MissingVacant!13502 lt!665468) (= (index!56406 lt!665468) vacantIndex!5) (= (select (arr!49376 a!2792) (index!56406 lt!665468)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160571 (= lt!665468 e!856862)))

(declare-fun c!141250 () Bool)

(assert (=> d!160571 (= c!141250 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!160571 (= lt!665469 (select (arr!49376 a!2792) lt!665380))))

(assert (=> d!160571 (validMask!0 mask!2480)))

(assert (=> d!160571 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665380 vacantIndex!5 (select (arr!49376 a!2792) j!64) a!2792 mask!2480) lt!665468)))

(declare-fun b!1540672 () Bool)

(declare-fun e!856863 () SeekEntryResult!13502)

(assert (=> b!1540672 (= e!856863 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!665380 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 (select (arr!49376 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540673 () Bool)

(assert (=> b!1540673 (= e!856863 (MissingVacant!13502 vacantIndex!5))))

(declare-fun b!1540674 () Bool)

(assert (=> b!1540674 (= e!856862 Undefined!13502)))

(declare-fun b!1540675 () Bool)

(assert (=> b!1540675 (= e!856864 (Found!13502 lt!665380))))

(declare-fun b!1540676 () Bool)

(declare-fun c!141249 () Bool)

(assert (=> b!1540676 (= c!141249 (= lt!665469 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540676 (= e!856864 e!856863)))

(assert (= (and d!160571 c!141250) b!1540674))

(assert (= (and d!160571 (not c!141250)) b!1540671))

(assert (= (and b!1540671 c!141251) b!1540675))

(assert (= (and b!1540671 (not c!141251)) b!1540676))

(assert (= (and b!1540676 c!141249) b!1540673))

(assert (= (and b!1540676 (not c!141249)) b!1540672))

(declare-fun m!1422801 () Bool)

(assert (=> d!160571 m!1422801))

(declare-fun m!1422803 () Bool)

(assert (=> d!160571 m!1422803))

(declare-fun m!1422805 () Bool)

(assert (=> d!160571 m!1422805))

(assert (=> d!160571 m!1422631))

(declare-fun m!1422807 () Bool)

(assert (=> b!1540672 m!1422807))

(assert (=> b!1540672 m!1422807))

(assert (=> b!1540672 m!1422637))

(declare-fun m!1422809 () Bool)

(assert (=> b!1540672 m!1422809))

(assert (=> b!1540513 d!160571))

(declare-fun b!1540687 () Bool)

(declare-fun e!856875 () Bool)

(declare-fun e!856876 () Bool)

(assert (=> b!1540687 (= e!856875 e!856876)))

(declare-fun c!141254 () Bool)

(assert (=> b!1540687 (= c!141254 (validKeyInArray!0 (select (arr!49376 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540688 () Bool)

(declare-fun e!856874 () Bool)

(assert (=> b!1540688 (= e!856874 e!856875)))

(declare-fun res!1057295 () Bool)

(assert (=> b!1540688 (=> (not res!1057295) (not e!856875))))

(declare-fun e!856873 () Bool)

(assert (=> b!1540688 (= res!1057295 (not e!856873))))

(declare-fun res!1057296 () Bool)

(assert (=> b!1540688 (=> (not res!1057296) (not e!856873))))

(assert (=> b!1540688 (= res!1057296 (validKeyInArray!0 (select (arr!49376 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540689 () Bool)

(declare-fun call!68664 () Bool)

(assert (=> b!1540689 (= e!856876 call!68664)))

(declare-fun b!1540690 () Bool)

(declare-fun contains!10020 (List!35850 (_ BitVec 64)) Bool)

(assert (=> b!1540690 (= e!856873 (contains!10020 Nil!35847 (select (arr!49376 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540691 () Bool)

(assert (=> b!1540691 (= e!856876 call!68664)))

(declare-fun bm!68661 () Bool)

(assert (=> bm!68661 (= call!68664 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141254 (Cons!35846 (select (arr!49376 a!2792) #b00000000000000000000000000000000) Nil!35847) Nil!35847)))))

(declare-fun d!160573 () Bool)

(declare-fun res!1057297 () Bool)

(assert (=> d!160573 (=> res!1057297 e!856874)))

(assert (=> d!160573 (= res!1057297 (bvsge #b00000000000000000000000000000000 (size!49926 a!2792)))))

(assert (=> d!160573 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35847) e!856874)))

(assert (= (and d!160573 (not res!1057297)) b!1540688))

(assert (= (and b!1540688 res!1057296) b!1540690))

(assert (= (and b!1540688 res!1057295) b!1540687))

(assert (= (and b!1540687 c!141254) b!1540689))

(assert (= (and b!1540687 (not c!141254)) b!1540691))

(assert (= (or b!1540689 b!1540691) bm!68661))

(declare-fun m!1422811 () Bool)

(assert (=> b!1540687 m!1422811))

(assert (=> b!1540687 m!1422811))

(declare-fun m!1422813 () Bool)

(assert (=> b!1540687 m!1422813))

(assert (=> b!1540688 m!1422811))

(assert (=> b!1540688 m!1422811))

(assert (=> b!1540688 m!1422813))

(assert (=> b!1540690 m!1422811))

(assert (=> b!1540690 m!1422811))

(declare-fun m!1422815 () Bool)

(assert (=> b!1540690 m!1422815))

(assert (=> bm!68661 m!1422811))

(declare-fun m!1422817 () Bool)

(assert (=> bm!68661 m!1422817))

(assert (=> b!1540507 d!160573))

(declare-fun d!160575 () Bool)

(assert (=> d!160575 (= (validKeyInArray!0 (select (arr!49376 a!2792) j!64)) (and (not (= (select (arr!49376 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49376 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540509 d!160575))

(declare-fun d!160579 () Bool)

(assert (=> d!160579 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131384 d!160579))

(declare-fun d!160587 () Bool)

(assert (=> d!160587 (= (array_inv!38404 a!2792) (bvsge (size!49926 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131384 d!160587))

(declare-fun d!160589 () Bool)

(declare-fun lt!665481 () (_ BitVec 32))

(assert (=> d!160589 (and (bvsge lt!665481 #b00000000000000000000000000000000) (bvslt lt!665481 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160589 (= lt!665481 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160589 (validMask!0 mask!2480)))

(assert (=> d!160589 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665481)))

(declare-fun bs!44229 () Bool)

(assert (= bs!44229 d!160589))

(declare-fun m!1422827 () Bool)

(assert (=> bs!44229 m!1422827))

(assert (=> bs!44229 m!1422631))

(assert (=> b!1540505 d!160589))

(declare-fun d!160591 () Bool)

(assert (=> d!160591 (= (validKeyInArray!0 (select (arr!49376 a!2792) i!951)) (and (not (= (select (arr!49376 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49376 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540510 d!160591))

(declare-fun d!160593 () Bool)

(declare-fun res!1057311 () Bool)

(declare-fun e!856906 () Bool)

(assert (=> d!160593 (=> res!1057311 e!856906)))

(assert (=> d!160593 (= res!1057311 (bvsge #b00000000000000000000000000000000 (size!49926 a!2792)))))

(assert (=> d!160593 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856906)))

(declare-fun b!1540733 () Bool)

(declare-fun e!856904 () Bool)

(declare-fun call!68670 () Bool)

(assert (=> b!1540733 (= e!856904 call!68670)))

(declare-fun bm!68667 () Bool)

(assert (=> bm!68667 (= call!68670 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1540734 () Bool)

(declare-fun e!856905 () Bool)

(assert (=> b!1540734 (= e!856905 e!856904)))

(declare-fun lt!665489 () (_ BitVec 64))

(assert (=> b!1540734 (= lt!665489 (select (arr!49376 a!2792) #b00000000000000000000000000000000))))

(declare-fun lt!665490 () Unit!51444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102332 (_ BitVec 64) (_ BitVec 32)) Unit!51444)

(assert (=> b!1540734 (= lt!665490 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665489 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1540734 (arrayContainsKey!0 a!2792 lt!665489 #b00000000000000000000000000000000)))

(declare-fun lt!665488 () Unit!51444)

(assert (=> b!1540734 (= lt!665488 lt!665490)))

(declare-fun res!1057312 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102332 (_ BitVec 32)) SeekEntryResult!13502)

(assert (=> b!1540734 (= res!1057312 (= (seekEntryOrOpen!0 (select (arr!49376 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13502 #b00000000000000000000000000000000)))))

(assert (=> b!1540734 (=> (not res!1057312) (not e!856904))))

(declare-fun b!1540735 () Bool)

(assert (=> b!1540735 (= e!856905 call!68670)))

(declare-fun b!1540736 () Bool)

(assert (=> b!1540736 (= e!856906 e!856905)))

(declare-fun c!141269 () Bool)

(assert (=> b!1540736 (= c!141269 (validKeyInArray!0 (select (arr!49376 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160593 (not res!1057311)) b!1540736))

(assert (= (and b!1540736 c!141269) b!1540734))

(assert (= (and b!1540736 (not c!141269)) b!1540735))

(assert (= (and b!1540734 res!1057312) b!1540733))

(assert (= (or b!1540733 b!1540735) bm!68667))

(declare-fun m!1422833 () Bool)

(assert (=> bm!68667 m!1422833))

(assert (=> b!1540734 m!1422811))

(declare-fun m!1422835 () Bool)

(assert (=> b!1540734 m!1422835))

(declare-fun m!1422837 () Bool)

(assert (=> b!1540734 m!1422837))

(assert (=> b!1540734 m!1422811))

(declare-fun m!1422839 () Bool)

(assert (=> b!1540734 m!1422839))

(assert (=> b!1540736 m!1422811))

(assert (=> b!1540736 m!1422811))

(assert (=> b!1540736 m!1422813))

(assert (=> b!1540512 d!160593))

(declare-fun b!1540737 () Bool)

(declare-fun e!856907 () SeekEntryResult!13502)

(declare-fun e!856909 () SeekEntryResult!13502)

(assert (=> b!1540737 (= e!856907 e!856909)))

(declare-fun c!141272 () Bool)

(declare-fun lt!665492 () (_ BitVec 64))

(assert (=> b!1540737 (= c!141272 (= lt!665492 lt!665378))))

(declare-fun d!160597 () Bool)

(declare-fun lt!665491 () SeekEntryResult!13502)

(assert (=> d!160597 (and (or (is-Undefined!13502 lt!665491) (not (is-Found!13502 lt!665491)) (and (bvsge (index!56404 lt!665491) #b00000000000000000000000000000000) (bvslt (index!56404 lt!665491) (size!49926 lt!665383)))) (or (is-Undefined!13502 lt!665491) (is-Found!13502 lt!665491) (not (is-MissingVacant!13502 lt!665491)) (not (= (index!56406 lt!665491) vacantIndex!5)) (and (bvsge (index!56406 lt!665491) #b00000000000000000000000000000000) (bvslt (index!56406 lt!665491) (size!49926 lt!665383)))) (or (is-Undefined!13502 lt!665491) (ite (is-Found!13502 lt!665491) (= (select (arr!49376 lt!665383) (index!56404 lt!665491)) lt!665378) (and (is-MissingVacant!13502 lt!665491) (= (index!56406 lt!665491) vacantIndex!5) (= (select (arr!49376 lt!665383) (index!56406 lt!665491)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160597 (= lt!665491 e!856907)))

(declare-fun c!141271 () Bool)

(assert (=> d!160597 (= c!141271 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160597 (= lt!665492 (select (arr!49376 lt!665383) index!463))))

(assert (=> d!160597 (validMask!0 mask!2480)))

(assert (=> d!160597 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!665378 lt!665383 mask!2480) lt!665491)))

(declare-fun e!856908 () SeekEntryResult!13502)

(declare-fun b!1540738 () Bool)

(assert (=> b!1540738 (= e!856908 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 lt!665378 lt!665383 mask!2480))))

(declare-fun b!1540739 () Bool)

(assert (=> b!1540739 (= e!856908 (MissingVacant!13502 vacantIndex!5))))

(declare-fun b!1540740 () Bool)

(assert (=> b!1540740 (= e!856907 Undefined!13502)))

(declare-fun b!1540741 () Bool)

(assert (=> b!1540741 (= e!856909 (Found!13502 index!463))))

(declare-fun b!1540742 () Bool)

(declare-fun c!141270 () Bool)

(assert (=> b!1540742 (= c!141270 (= lt!665492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540742 (= e!856909 e!856908)))

(assert (= (and d!160597 c!141271) b!1540740))

(assert (= (and d!160597 (not c!141271)) b!1540737))

(assert (= (and b!1540737 c!141272) b!1540741))

(assert (= (and b!1540737 (not c!141272)) b!1540742))

(assert (= (and b!1540742 c!141270) b!1540739))

(assert (= (and b!1540742 (not c!141270)) b!1540738))

(declare-fun m!1422841 () Bool)

(assert (=> d!160597 m!1422841))

(declare-fun m!1422843 () Bool)

(assert (=> d!160597 m!1422843))

(declare-fun m!1422845 () Bool)

(assert (=> d!160597 m!1422845))

(assert (=> d!160597 m!1422631))

(assert (=> b!1540738 m!1422645))

(assert (=> b!1540738 m!1422645))

(declare-fun m!1422847 () Bool)

(assert (=> b!1540738 m!1422847))

(assert (=> b!1540511 d!160597))

(declare-fun b!1540743 () Bool)

(declare-fun e!856910 () SeekEntryResult!13502)

(declare-fun e!856912 () SeekEntryResult!13502)

(assert (=> b!1540743 (= e!856910 e!856912)))

(declare-fun c!141275 () Bool)

(declare-fun lt!665494 () (_ BitVec 64))

(assert (=> b!1540743 (= c!141275 (= lt!665494 lt!665378))))

(declare-fun d!160599 () Bool)

(declare-fun lt!665493 () SeekEntryResult!13502)

(assert (=> d!160599 (and (or (is-Undefined!13502 lt!665493) (not (is-Found!13502 lt!665493)) (and (bvsge (index!56404 lt!665493) #b00000000000000000000000000000000) (bvslt (index!56404 lt!665493) (size!49926 lt!665383)))) (or (is-Undefined!13502 lt!665493) (is-Found!13502 lt!665493) (not (is-MissingVacant!13502 lt!665493)) (not (= (index!56406 lt!665493) vacantIndex!5)) (and (bvsge (index!56406 lt!665493) #b00000000000000000000000000000000) (bvslt (index!56406 lt!665493) (size!49926 lt!665383)))) (or (is-Undefined!13502 lt!665493) (ite (is-Found!13502 lt!665493) (= (select (arr!49376 lt!665383) (index!56404 lt!665493)) lt!665378) (and (is-MissingVacant!13502 lt!665493) (= (index!56406 lt!665493) vacantIndex!5) (= (select (arr!49376 lt!665383) (index!56406 lt!665493)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160599 (= lt!665493 e!856910)))

(declare-fun c!141274 () Bool)

(assert (=> d!160599 (= c!141274 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!160599 (= lt!665494 (select (arr!49376 lt!665383) lt!665380))))

(assert (=> d!160599 (validMask!0 mask!2480)))

(assert (=> d!160599 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665380 vacantIndex!5 lt!665378 lt!665383 mask!2480) lt!665493)))

(declare-fun b!1540744 () Bool)

(declare-fun e!856911 () SeekEntryResult!13502)

(assert (=> b!1540744 (= e!856911 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!665380 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 lt!665378 lt!665383 mask!2480))))

(declare-fun b!1540745 () Bool)

(assert (=> b!1540745 (= e!856911 (MissingVacant!13502 vacantIndex!5))))

(declare-fun b!1540746 () Bool)

(assert (=> b!1540746 (= e!856910 Undefined!13502)))

(declare-fun b!1540747 () Bool)

(assert (=> b!1540747 (= e!856912 (Found!13502 lt!665380))))

(declare-fun b!1540748 () Bool)

(declare-fun c!141273 () Bool)

(assert (=> b!1540748 (= c!141273 (= lt!665494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540748 (= e!856912 e!856911)))

(assert (= (and d!160599 c!141274) b!1540746))

(assert (= (and d!160599 (not c!141274)) b!1540743))

(assert (= (and b!1540743 c!141275) b!1540747))

(assert (= (and b!1540743 (not c!141275)) b!1540748))

(assert (= (and b!1540748 c!141273) b!1540745))

(assert (= (and b!1540748 (not c!141273)) b!1540744))

(declare-fun m!1422849 () Bool)

(assert (=> d!160599 m!1422849))

(declare-fun m!1422851 () Bool)

(assert (=> d!160599 m!1422851))

(declare-fun m!1422853 () Bool)

(assert (=> d!160599 m!1422853))

(assert (=> d!160599 m!1422631))

(assert (=> b!1540744 m!1422807))

(assert (=> b!1540744 m!1422807))

(declare-fun m!1422855 () Bool)

(assert (=> b!1540744 m!1422855))

(assert (=> b!1540511 d!160599))

(declare-fun d!160601 () Bool)

(declare-fun e!856921 () Bool)

(assert (=> d!160601 e!856921))

(declare-fun res!1057315 () Bool)

(assert (=> d!160601 (=> (not res!1057315) (not e!856921))))

