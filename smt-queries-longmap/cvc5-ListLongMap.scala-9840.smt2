; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116726 () Bool)

(assert start!116726)

(declare-fun b!1375689 () Bool)

(declare-fun e!779332 () Bool)

(declare-fun e!779330 () Bool)

(assert (=> b!1375689 (= e!779332 e!779330)))

(declare-fun res!918700 () Bool)

(assert (=> b!1375689 (=> (not res!918700) (not e!779330))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93395 0))(
  ( (array!93396 (arr!45101 (Array (_ BitVec 32) (_ BitVec 64))) (size!45651 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93395)

(declare-fun lt!604679 () (_ BitVec 32))

(declare-fun lt!604683 () (_ BitVec 32))

(assert (=> b!1375689 (= res!918700 (and (= lt!604683 lt!604679) (not (= to!206 (size!45651 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93395 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375689 (= lt!604679 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604680 () array!93395)

(assert (=> b!1375689 (= lt!604683 (arrayCountValidKeys!0 lt!604680 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375689 (= lt!604680 (array!93396 (store (arr!45101 a!4032) i!1445 k!2947) (size!45651 a!4032)))))

(declare-fun b!1375690 () Bool)

(declare-fun res!918697 () Bool)

(assert (=> b!1375690 (=> (not res!918697) (not e!779332))))

(assert (=> b!1375690 (= res!918697 (and (bvslt (size!45651 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45651 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375691 () Bool)

(declare-fun e!779329 () Bool)

(assert (=> b!1375691 (= e!779329 false)))

(declare-fun lt!604681 () (_ BitVec 32))

(assert (=> b!1375691 (= lt!604681 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604678 () (_ BitVec 32))

(assert (=> b!1375691 (= lt!604678 (arrayCountValidKeys!0 lt!604680 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375692 () Bool)

(declare-datatypes ((Unit!45567 0))(
  ( (Unit!45568) )
))
(declare-fun e!779331 () Unit!45567)

(declare-fun lt!604675 () Unit!45567)

(assert (=> b!1375692 (= e!779331 lt!604675)))

(declare-fun lt!604676 () Unit!45567)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93395 (_ BitVec 32) (_ BitVec 32)) Unit!45567)

(assert (=> b!1375692 (= lt!604676 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65731 () (_ BitVec 32))

(assert (=> b!1375692 (= call!65731 lt!604679)))

(assert (=> b!1375692 (= lt!604675 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604680 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65732 () (_ BitVec 32))

(assert (=> b!1375692 (= call!65732 lt!604683)))

(declare-fun res!918698 () Bool)

(assert (=> start!116726 (=> (not res!918698) (not e!779332))))

(assert (=> start!116726 (= res!918698 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45651 a!4032))))))

(assert (=> start!116726 e!779332))

(assert (=> start!116726 true))

(declare-fun array_inv!34129 (array!93395) Bool)

(assert (=> start!116726 (array_inv!34129 a!4032)))

(declare-fun b!1375693 () Bool)

(declare-fun lt!604682 () Unit!45567)

(assert (=> b!1375693 (= e!779331 lt!604682)))

(declare-fun lt!604684 () Unit!45567)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93395 (_ BitVec 32) (_ BitVec 32)) Unit!45567)

(assert (=> b!1375693 (= lt!604684 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375693 (= call!65731 (bvadd #b00000000000000000000000000000001 lt!604679))))

(assert (=> b!1375693 (= lt!604682 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604680 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375693 (= call!65732 (bvadd #b00000000000000000000000000000001 lt!604683))))

(declare-fun b!1375694 () Bool)

(assert (=> b!1375694 (= e!779330 e!779329)))

(declare-fun res!918695 () Bool)

(assert (=> b!1375694 (=> (not res!918695) (not e!779329))))

(assert (=> b!1375694 (= res!918695 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45651 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604677 () Unit!45567)

(assert (=> b!1375694 (= lt!604677 e!779331)))

(declare-fun c!127937 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375694 (= c!127937 (validKeyInArray!0 (select (arr!45101 a!4032) to!206)))))

(declare-fun bm!65728 () Bool)

(assert (=> bm!65728 (= call!65731 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375695 () Bool)

(declare-fun res!918699 () Bool)

(assert (=> b!1375695 (=> (not res!918699) (not e!779332))))

(assert (=> b!1375695 (= res!918699 (validKeyInArray!0 (select (arr!45101 a!4032) i!1445)))))

(declare-fun b!1375696 () Bool)

(declare-fun res!918696 () Bool)

(assert (=> b!1375696 (=> (not res!918696) (not e!779332))))

(assert (=> b!1375696 (= res!918696 (not (validKeyInArray!0 k!2947)))))

(declare-fun bm!65729 () Bool)

(assert (=> bm!65729 (= call!65732 (arrayCountValidKeys!0 lt!604680 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116726 res!918698) b!1375695))

(assert (= (and b!1375695 res!918699) b!1375696))

(assert (= (and b!1375696 res!918696) b!1375690))

(assert (= (and b!1375690 res!918697) b!1375689))

(assert (= (and b!1375689 res!918700) b!1375694))

(assert (= (and b!1375694 c!127937) b!1375693))

(assert (= (and b!1375694 (not c!127937)) b!1375692))

(assert (= (or b!1375693 b!1375692) bm!65729))

(assert (= (or b!1375693 b!1375692) bm!65728))

(assert (= (and b!1375694 res!918695) b!1375691))

(declare-fun m!1259581 () Bool)

(assert (=> bm!65728 m!1259581))

(assert (=> b!1375691 m!1259581))

(declare-fun m!1259583 () Bool)

(assert (=> b!1375691 m!1259583))

(declare-fun m!1259585 () Bool)

(assert (=> start!116726 m!1259585))

(declare-fun m!1259587 () Bool)

(assert (=> b!1375689 m!1259587))

(declare-fun m!1259589 () Bool)

(assert (=> b!1375689 m!1259589))

(declare-fun m!1259591 () Bool)

(assert (=> b!1375689 m!1259591))

(declare-fun m!1259593 () Bool)

(assert (=> b!1375696 m!1259593))

(declare-fun m!1259595 () Bool)

(assert (=> b!1375694 m!1259595))

(assert (=> b!1375694 m!1259595))

(declare-fun m!1259597 () Bool)

(assert (=> b!1375694 m!1259597))

(assert (=> bm!65729 m!1259583))

(declare-fun m!1259599 () Bool)

(assert (=> b!1375692 m!1259599))

(declare-fun m!1259601 () Bool)

(assert (=> b!1375692 m!1259601))

(declare-fun m!1259603 () Bool)

(assert (=> b!1375693 m!1259603))

(declare-fun m!1259605 () Bool)

(assert (=> b!1375693 m!1259605))

(declare-fun m!1259607 () Bool)

(assert (=> b!1375695 m!1259607))

(assert (=> b!1375695 m!1259607))

(declare-fun m!1259609 () Bool)

(assert (=> b!1375695 m!1259609))

(push 1)

(assert (not b!1375693))

(assert (not bm!65729))

(assert (not b!1375696))

(assert (not start!116726))

