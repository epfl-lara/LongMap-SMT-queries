; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128592 () Bool)

(assert start!128592)

(declare-fun b!1507466 () Bool)

(declare-fun res!1026721 () Bool)

(declare-fun e!842645 () Bool)

(assert (=> b!1507466 (=> (not res!1026721) (not e!842645))))

(declare-datatypes ((array!100538 0))(
  ( (array!100539 (arr!48513 (Array (_ BitVec 32) (_ BitVec 64))) (size!49064 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100538)

(assert (=> b!1507466 (= res!1026721 (and (bvsle #b00000000000000000000000000000000 (size!49064 a!2804)) (bvslt (size!49064 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1507467 () Bool)

(declare-datatypes ((List!34983 0))(
  ( (Nil!34980) (Cons!34979 (h!36391 (_ BitVec 64)) (t!49669 List!34983)) )
))
(declare-fun noDuplicate!2643 (List!34983) Bool)

(assert (=> b!1507467 (= e!842645 (not (noDuplicate!2643 Nil!34980)))))

(declare-fun b!1507468 () Bool)

(declare-fun res!1026720 () Bool)

(assert (=> b!1507468 (=> (not res!1026720) (not e!842645))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100538 (_ BitVec 32)) Bool)

(assert (=> b!1507468 (= res!1026720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1026719 () Bool)

(assert (=> start!128592 (=> (not res!1026719) (not e!842645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128592 (= res!1026719 (validMask!0 mask!2512))))

(assert (=> start!128592 e!842645))

(assert (=> start!128592 true))

(declare-fun array_inv!37794 (array!100538) Bool)

(assert (=> start!128592 (array_inv!37794 a!2804)))

(declare-fun b!1507469 () Bool)

(declare-fun res!1026718 () Bool)

(assert (=> b!1507469 (=> (not res!1026718) (not e!842645))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507469 (= res!1026718 (validKeyInArray!0 (select (arr!48513 a!2804) i!961)))))

(declare-fun b!1507470 () Bool)

(declare-fun res!1026722 () Bool)

(assert (=> b!1507470 (=> (not res!1026722) (not e!842645))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1507470 (= res!1026722 (and (= (size!49064 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49064 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49064 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507471 () Bool)

(declare-fun res!1026717 () Bool)

(assert (=> b!1507471 (=> (not res!1026717) (not e!842645))))

(assert (=> b!1507471 (= res!1026717 (validKeyInArray!0 (select (arr!48513 a!2804) j!70)))))

(assert (= (and start!128592 res!1026719) b!1507470))

(assert (= (and b!1507470 res!1026722) b!1507469))

(assert (= (and b!1507469 res!1026718) b!1507471))

(assert (= (and b!1507471 res!1026717) b!1507468))

(assert (= (and b!1507468 res!1026720) b!1507466))

(assert (= (and b!1507466 res!1026721) b!1507467))

(declare-fun m!1390517 () Bool)

(assert (=> b!1507471 m!1390517))

(assert (=> b!1507471 m!1390517))

(declare-fun m!1390519 () Bool)

(assert (=> b!1507471 m!1390519))

(declare-fun m!1390521 () Bool)

(assert (=> b!1507468 m!1390521))

(declare-fun m!1390523 () Bool)

(assert (=> start!128592 m!1390523))

(declare-fun m!1390525 () Bool)

(assert (=> start!128592 m!1390525))

(declare-fun m!1390527 () Bool)

(assert (=> b!1507469 m!1390527))

(assert (=> b!1507469 m!1390527))

(declare-fun m!1390529 () Bool)

(assert (=> b!1507469 m!1390529))

(declare-fun m!1390531 () Bool)

(assert (=> b!1507467 m!1390531))

(push 1)

(assert (not b!1507467))

(assert (not b!1507468))

(assert (not start!128592))

(assert (not b!1507469))

(assert (not b!1507471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158579 () Bool)

(assert (=> d!158579 (= (validKeyInArray!0 (select (arr!48513 a!2804) i!961)) (and (not (= (select (arr!48513 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48513 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507469 d!158579))

(declare-fun b!1507492 () Bool)

(declare-fun e!842667 () Bool)

(declare-fun e!842666 () Bool)

(assert (=> b!1507492 (= e!842667 e!842666)))

(declare-fun lt!654720 () (_ BitVec 64))

(assert (=> b!1507492 (= lt!654720 (select (arr!48513 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50233 0))(
  ( (Unit!50234) )
))
(declare-fun lt!654719 () Unit!50233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100538 (_ BitVec 64) (_ BitVec 32)) Unit!50233)

(assert (=> b!1507492 (= lt!654719 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654720 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507492 (arrayContainsKey!0 a!2804 lt!654720 #b00000000000000000000000000000000)))

(declare-fun lt!654721 () Unit!50233)

(assert (=> b!1507492 (= lt!654721 lt!654719)))

(declare-fun res!1026739 () Bool)

(declare-datatypes ((SeekEntryResult!12596 0))(
  ( (MissingZero!12596 (index!52779 (_ BitVec 32))) (Found!12596 (index!52780 (_ BitVec 32))) (Intermediate!12596 (undefined!13408 Bool) (index!52781 (_ BitVec 32)) (x!134684 (_ BitVec 32))) (Undefined!12596) (MissingVacant!12596 (index!52782 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100538 (_ BitVec 32)) SeekEntryResult!12596)

(assert (=> b!1507492 (= res!1026739 (= (seekEntryOrOpen!0 (select (arr!48513 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12596 #b00000000000000000000000000000000)))))

(assert (=> b!1507492 (=> (not res!1026739) (not e!842666))))

(declare-fun b!1507493 () Bool)

(declare-fun call!68292 () Bool)

(assert (=> b!1507493 (= e!842667 call!68292)))

(declare-fun b!1507494 () Bool)

(assert (=> b!1507494 (= e!842666 call!68292)))

(declare-fun d!158581 () Bool)

(declare-fun res!1026740 () Bool)

(declare-fun e!842665 () Bool)

(assert (=> d!158581 (=> res!1026740 e!842665)))

(assert (=> d!158581 (= res!1026740 (bvsge #b00000000000000000000000000000000 (size!49064 a!2804)))))

(assert (=> d!158581 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842665)))

(declare-fun bm!68289 () Bool)

(assert (=> bm!68289 (= call!68292 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1507495 () Bool)

(assert (=> b!1507495 (= e!842665 e!842667)))

(declare-fun c!139921 () Bool)

(assert (=> b!1507495 (= c!139921 (validKeyInArray!0 (select (arr!48513 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158581 (not res!1026740)) b!1507495))

(assert (= (and b!1507495 c!139921) b!1507492))

(assert (= (and b!1507495 (not c!139921)) b!1507493))

(assert (= (and b!1507492 res!1026739) b!1507494))

(assert (= (or b!1507494 b!1507493) bm!68289))

(declare-fun m!1390541 () Bool)

(assert (=> b!1507492 m!1390541))

(declare-fun m!1390543 () Bool)

(assert (=> b!1507492 m!1390543))

(declare-fun m!1390545 () Bool)

(assert (=> b!1507492 m!1390545))

(assert (=> b!1507492 m!1390541))

(declare-fun m!1390547 () Bool)

(assert (=> b!1507492 m!1390547))

(declare-fun m!1390549 () Bool)

(assert (=> bm!68289 m!1390549))

(assert (=> b!1507495 m!1390541))

(assert (=> b!1507495 m!1390541))

(declare-fun m!1390551 () Bool)

(assert (=> b!1507495 m!1390551))

(assert (=> b!1507468 d!158581))

(declare-fun d!158593 () Bool)

(declare-fun res!1026745 () Bool)

(declare-fun e!842672 () Bool)

(assert (=> d!158593 (=> res!1026745 e!842672)))

(assert (=> d!158593 (= res!1026745 (is-Nil!34980 Nil!34980))))

(assert (=> d!158593 (= (noDuplicate!2643 Nil!34980) e!842672)))

(declare-fun b!1507500 () Bool)

(declare-fun e!842673 () Bool)

(assert (=> b!1507500 (= e!842672 e!842673)))

(declare-fun res!1026746 () Bool)

(assert (=> b!1507500 (=> (not res!1026746) (not e!842673))))

(declare-fun contains!9999 (List!34983 (_ BitVec 64)) Bool)

(assert (=> b!1507500 (= res!1026746 (not (contains!9999 (t!49669 Nil!34980) (h!36391 Nil!34980))))))

(declare-fun b!1507501 () Bool)

(assert (=> b!1507501 (= e!842673 (noDuplicate!2643 (t!49669 Nil!34980)))))

(assert (= (and d!158593 (not res!1026745)) b!1507500))

(assert (= (and b!1507500 res!1026746) b!1507501))

(declare-fun m!1390553 () Bool)

(assert (=> b!1507500 m!1390553))

(declare-fun m!1390555 () Bool)

(assert (=> b!1507501 m!1390555))

(assert (=> b!1507467 d!158593))

(declare-fun d!158595 () Bool)

(assert (=> d!158595 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128592 d!158595))

(declare-fun d!158607 () Bool)

(assert (=> d!158607 (= (array_inv!37794 a!2804) (bvsge (size!49064 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128592 d!158607))

(declare-fun d!158609 () Bool)

(assert (=> d!158609 (= (validKeyInArray!0 (select (arr!48513 a!2804) j!70)) (and (not (= (select (arr!48513 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48513 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507471 d!158609))

(push 1)

(assert (not bm!68289))

(assert (not b!1507492))

(assert (not b!1507501))

(assert (not b!1507495))

(assert (not b!1507500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

