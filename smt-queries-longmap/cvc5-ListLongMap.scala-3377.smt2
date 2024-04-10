; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46614 () Bool)

(assert start!46614)

(declare-fun b!514693 () Bool)

(declare-fun res!314444 () Bool)

(declare-fun e!300555 () Bool)

(assert (=> b!514693 (=> (not res!314444) (not e!300555))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514693 (= res!314444 (validKeyInArray!0 k!2280))))

(declare-fun b!514694 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32983 0))(
  ( (array!32984 (arr!15861 (Array (_ BitVec 32) (_ BitVec 64))) (size!16225 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32983)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!300556 () Bool)

(declare-datatypes ((SeekEntryResult!4328 0))(
  ( (MissingZero!4328 (index!19500 (_ BitVec 32))) (Found!4328 (index!19501 (_ BitVec 32))) (Intermediate!4328 (undefined!5140 Bool) (index!19502 (_ BitVec 32)) (x!48469 (_ BitVec 32))) (Undefined!4328) (MissingVacant!4328 (index!19503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32983 (_ BitVec 32)) SeekEntryResult!4328)

(assert (=> b!514694 (= e!300556 (= (seekEntryOrOpen!0 (select (arr!15861 a!3235) j!176) a!3235 mask!3524) (Found!4328 j!176)))))

(declare-fun b!514695 () Bool)

(declare-fun e!300558 () Bool)

(declare-fun lt!235629 () SeekEntryResult!4328)

(assert (=> b!514695 (= e!300558 (and (bvsge (index!19502 lt!235629) #b00000000000000000000000000000000) (bvslt (index!19502 lt!235629) (size!16225 a!3235))))))

(assert (=> b!514695 (and (bvslt (x!48469 lt!235629) #b01111111111111111111111111111110) (or (= (select (arr!15861 a!3235) (index!19502 lt!235629)) (select (arr!15861 a!3235) j!176)) (= (select (arr!15861 a!3235) (index!19502 lt!235629)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15861 a!3235) (index!19502 lt!235629)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514696 () Bool)

(declare-fun res!314445 () Bool)

(assert (=> b!514696 (=> (not res!314445) (not e!300555))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!514696 (= res!314445 (and (= (size!16225 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16225 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16225 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514697 () Bool)

(declare-fun e!300557 () Bool)

(assert (=> b!514697 (= e!300557 (not e!300558))))

(declare-fun res!314443 () Bool)

(assert (=> b!514697 (=> res!314443 e!300558)))

(declare-fun lt!235626 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32983 (_ BitVec 32)) SeekEntryResult!4328)

(assert (=> b!514697 (= res!314443 (= lt!235629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235626 (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235)) mask!3524)))))

(declare-fun lt!235628 () (_ BitVec 32))

(assert (=> b!514697 (= lt!235629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235628 (select (arr!15861 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514697 (= lt!235626 (toIndex!0 (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!514697 (= lt!235628 (toIndex!0 (select (arr!15861 a!3235) j!176) mask!3524))))

(assert (=> b!514697 e!300556))

(declare-fun res!314446 () Bool)

(assert (=> b!514697 (=> (not res!314446) (not e!300556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32983 (_ BitVec 32)) Bool)

(assert (=> b!514697 (= res!314446 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15914 0))(
  ( (Unit!15915) )
))
(declare-fun lt!235630 () Unit!15914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15914)

(assert (=> b!514697 (= lt!235630 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!314442 () Bool)

(assert (=> start!46614 (=> (not res!314442) (not e!300555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46614 (= res!314442 (validMask!0 mask!3524))))

(assert (=> start!46614 e!300555))

(assert (=> start!46614 true))

(declare-fun array_inv!11657 (array!32983) Bool)

(assert (=> start!46614 (array_inv!11657 a!3235)))

(declare-fun b!514698 () Bool)

(declare-fun res!314441 () Bool)

(assert (=> b!514698 (=> (not res!314441) (not e!300557))))

(declare-datatypes ((List!10019 0))(
  ( (Nil!10016) (Cons!10015 (h!10910 (_ BitVec 64)) (t!16247 List!10019)) )
))
(declare-fun arrayNoDuplicates!0 (array!32983 (_ BitVec 32) List!10019) Bool)

(assert (=> b!514698 (= res!314441 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10016))))

(declare-fun b!514699 () Bool)

(assert (=> b!514699 (= e!300555 e!300557)))

(declare-fun res!314447 () Bool)

(assert (=> b!514699 (=> (not res!314447) (not e!300557))))

(declare-fun lt!235627 () SeekEntryResult!4328)

(assert (=> b!514699 (= res!314447 (or (= lt!235627 (MissingZero!4328 i!1204)) (= lt!235627 (MissingVacant!4328 i!1204))))))

(assert (=> b!514699 (= lt!235627 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!514700 () Bool)

(declare-fun res!314440 () Bool)

(assert (=> b!514700 (=> res!314440 e!300558)))

(assert (=> b!514700 (= res!314440 (or (undefined!5140 lt!235629) (not (is-Intermediate!4328 lt!235629))))))

(declare-fun b!514701 () Bool)

(declare-fun res!314448 () Bool)

(assert (=> b!514701 (=> (not res!314448) (not e!300557))))

(assert (=> b!514701 (= res!314448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!514702 () Bool)

(declare-fun res!314450 () Bool)

(assert (=> b!514702 (=> (not res!314450) (not e!300555))))

(assert (=> b!514702 (= res!314450 (validKeyInArray!0 (select (arr!15861 a!3235) j!176)))))

(declare-fun b!514703 () Bool)

(declare-fun res!314449 () Bool)

(assert (=> b!514703 (=> (not res!314449) (not e!300555))))

(declare-fun arrayContainsKey!0 (array!32983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514703 (= res!314449 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46614 res!314442) b!514696))

(assert (= (and b!514696 res!314445) b!514702))

(assert (= (and b!514702 res!314450) b!514693))

(assert (= (and b!514693 res!314444) b!514703))

(assert (= (and b!514703 res!314449) b!514699))

(assert (= (and b!514699 res!314447) b!514701))

(assert (= (and b!514701 res!314448) b!514698))

(assert (= (and b!514698 res!314441) b!514697))

(assert (= (and b!514697 res!314446) b!514694))

(assert (= (and b!514697 (not res!314443)) b!514700))

(assert (= (and b!514700 (not res!314440)) b!514695))

(declare-fun m!496047 () Bool)

(assert (=> b!514703 m!496047))

(declare-fun m!496049 () Bool)

(assert (=> b!514695 m!496049))

(declare-fun m!496051 () Bool)

(assert (=> b!514695 m!496051))

(declare-fun m!496053 () Bool)

(assert (=> b!514698 m!496053))

(assert (=> b!514702 m!496051))

(assert (=> b!514702 m!496051))

(declare-fun m!496055 () Bool)

(assert (=> b!514702 m!496055))

(declare-fun m!496057 () Bool)

(assert (=> b!514699 m!496057))

(declare-fun m!496059 () Bool)

(assert (=> b!514701 m!496059))

(declare-fun m!496061 () Bool)

(assert (=> b!514693 m!496061))

(declare-fun m!496063 () Bool)

(assert (=> start!46614 m!496063))

(declare-fun m!496065 () Bool)

(assert (=> start!46614 m!496065))

(assert (=> b!514694 m!496051))

(assert (=> b!514694 m!496051))

(declare-fun m!496067 () Bool)

(assert (=> b!514694 m!496067))

(declare-fun m!496069 () Bool)

(assert (=> b!514697 m!496069))

(declare-fun m!496071 () Bool)

(assert (=> b!514697 m!496071))

(declare-fun m!496073 () Bool)

(assert (=> b!514697 m!496073))

(assert (=> b!514697 m!496051))

(declare-fun m!496075 () Bool)

(assert (=> b!514697 m!496075))

(assert (=> b!514697 m!496073))

(declare-fun m!496077 () Bool)

(assert (=> b!514697 m!496077))

(assert (=> b!514697 m!496073))

(declare-fun m!496079 () Bool)

(assert (=> b!514697 m!496079))

(assert (=> b!514697 m!496051))

(declare-fun m!496081 () Bool)

(assert (=> b!514697 m!496081))

(assert (=> b!514697 m!496051))

(declare-fun m!496083 () Bool)

(assert (=> b!514697 m!496083))

(push 1)

(assert (not b!514699))

(assert (not b!514697))

(assert (not b!514693))

(assert (not b!514702))

(assert (not start!46614))

(assert (not b!514703))

(assert (not b!514698))

(assert (not b!514694))

(assert (not b!514701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!514845 () Bool)

(declare-fun e!300641 () Bool)

(declare-fun e!300639 () Bool)

(assert (=> b!514845 (= e!300641 e!300639)))

(declare-fun lt!235682 () (_ BitVec 64))

(assert (=> b!514845 (= lt!235682 (select (arr!15861 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235683 () Unit!15914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32983 (_ BitVec 64) (_ BitVec 32)) Unit!15914)

(assert (=> b!514845 (= lt!235683 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235682 #b00000000000000000000000000000000))))

(assert (=> b!514845 (arrayContainsKey!0 a!3235 lt!235682 #b00000000000000000000000000000000)))

(declare-fun lt!235684 () Unit!15914)

(assert (=> b!514845 (= lt!235684 lt!235683)))

(declare-fun res!314548 () Bool)

(assert (=> b!514845 (= res!314548 (= (seekEntryOrOpen!0 (select (arr!15861 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4328 #b00000000000000000000000000000000)))))

(assert (=> b!514845 (=> (not res!314548) (not e!300639))))

(declare-fun d!79457 () Bool)

(declare-fun res!314549 () Bool)

(declare-fun e!300640 () Bool)

(assert (=> d!79457 (=> res!314549 e!300640)))

(assert (=> d!79457 (= res!314549 (bvsge #b00000000000000000000000000000000 (size!16225 a!3235)))))

(assert (=> d!79457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300640)))

(declare-fun b!514846 () Bool)

(declare-fun call!31624 () Bool)

(assert (=> b!514846 (= e!300641 call!31624)))

(declare-fun bm!31621 () Bool)

(assert (=> bm!31621 (= call!31624 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514847 () Bool)

(assert (=> b!514847 (= e!300639 call!31624)))

(declare-fun b!514848 () Bool)

(assert (=> b!514848 (= e!300640 e!300641)))

(declare-fun c!60436 () Bool)

(assert (=> b!514848 (= c!60436 (validKeyInArray!0 (select (arr!15861 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79457 (not res!314549)) b!514848))

(assert (= (and b!514848 c!60436) b!514845))

(assert (= (and b!514848 (not c!60436)) b!514846))

(assert (= (and b!514845 res!314548) b!514847))

(assert (= (or b!514847 b!514846) bm!31621))

(declare-fun m!496191 () Bool)

(assert (=> b!514845 m!496191))

(declare-fun m!496193 () Bool)

(assert (=> b!514845 m!496193))

(declare-fun m!496195 () Bool)

(assert (=> b!514845 m!496195))

(assert (=> b!514845 m!496191))

(declare-fun m!496197 () Bool)

(assert (=> b!514845 m!496197))

(declare-fun m!496199 () Bool)

(assert (=> bm!31621 m!496199))

(assert (=> b!514848 m!496191))

(assert (=> b!514848 m!496191))

(declare-fun m!496201 () Bool)

(assert (=> b!514848 m!496201))

(assert (=> b!514701 d!79457))

(declare-fun b!514887 () Bool)

(declare-fun e!300668 () SeekEntryResult!4328)

(assert (=> b!514887 (= e!300668 Undefined!4328)))

(declare-fun lt!235720 () SeekEntryResult!4328)

(declare-fun b!514888 () Bool)

(declare-fun e!300667 () SeekEntryResult!4328)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32983 (_ BitVec 32)) SeekEntryResult!4328)

(assert (=> b!514888 (= e!300667 (seekKeyOrZeroReturnVacant!0 (x!48469 lt!235720) (index!19502 lt!235720) (index!19502 lt!235720) (select (arr!15861 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514889 () Bool)

(declare-fun c!60450 () Bool)

(declare-fun lt!235721 () (_ BitVec 64))

(assert (=> b!514889 (= c!60450 (= lt!235721 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300666 () SeekEntryResult!4328)

(assert (=> b!514889 (= e!300666 e!300667)))

(declare-fun d!79465 () Bool)

(declare-fun lt!235719 () SeekEntryResult!4328)

(assert (=> d!79465 (and (or (is-Undefined!4328 lt!235719) (not (is-Found!4328 lt!235719)) (and (bvsge (index!19501 lt!235719) #b00000000000000000000000000000000) (bvslt (index!19501 lt!235719) (size!16225 a!3235)))) (or (is-Undefined!4328 lt!235719) (is-Found!4328 lt!235719) (not (is-MissingZero!4328 lt!235719)) (and (bvsge (index!19500 lt!235719) #b00000000000000000000000000000000) (bvslt (index!19500 lt!235719) (size!16225 a!3235)))) (or (is-Undefined!4328 lt!235719) (is-Found!4328 lt!235719) (is-MissingZero!4328 lt!235719) (not (is-MissingVacant!4328 lt!235719)) (and (bvsge (index!19503 lt!235719) #b00000000000000000000000000000000) (bvslt (index!19503 lt!235719) (size!16225 a!3235)))) (or (is-Undefined!4328 lt!235719) (ite (is-Found!4328 lt!235719) (= (select (arr!15861 a!3235) (index!19501 lt!235719)) (select (arr!15861 a!3235) j!176)) (ite (is-MissingZero!4328 lt!235719) (= (select (arr!15861 a!3235) (index!19500 lt!235719)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4328 lt!235719) (= (select (arr!15861 a!3235) (index!19503 lt!235719)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79465 (= lt!235719 e!300668)))

(declare-fun c!60451 () Bool)

(assert (=> d!79465 (= c!60451 (and (is-Intermediate!4328 lt!235720) (undefined!5140 lt!235720)))))

(assert (=> d!79465 (= lt!235720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15861 a!3235) j!176) mask!3524) (select (arr!15861 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79465 (validMask!0 mask!3524)))

(assert (=> d!79465 (= (seekEntryOrOpen!0 (select (arr!15861 a!3235) j!176) a!3235 mask!3524) lt!235719)))

(declare-fun b!514890 () Bool)

(assert (=> b!514890 (= e!300668 e!300666)))

(assert (=> b!514890 (= lt!235721 (select (arr!15861 a!3235) (index!19502 lt!235720)))))

(declare-fun c!60452 () Bool)

(assert (=> b!514890 (= c!60452 (= lt!235721 (select (arr!15861 a!3235) j!176)))))

(declare-fun b!514891 () Bool)

(assert (=> b!514891 (= e!300666 (Found!4328 (index!19502 lt!235720)))))

(declare-fun b!514892 () Bool)

(assert (=> b!514892 (= e!300667 (MissingZero!4328 (index!19502 lt!235720)))))

(assert (= (and d!79465 c!60451) b!514887))

(assert (= (and d!79465 (not c!60451)) b!514890))

(assert (= (and b!514890 c!60452) b!514891))

(assert (= (and b!514890 (not c!60452)) b!514889))

(assert (= (and b!514889 c!60450) b!514892))

(assert (= (and b!514889 (not c!60450)) b!514888))

(assert (=> b!514888 m!496051))

(declare-fun m!496225 () Bool)

(assert (=> b!514888 m!496225))

(declare-fun m!496227 () Bool)

(assert (=> d!79465 m!496227))

(assert (=> d!79465 m!496081))

(assert (=> d!79465 m!496051))

(declare-fun m!496229 () Bool)

(assert (=> d!79465 m!496229))

(declare-fun m!496231 () Bool)

(assert (=> d!79465 m!496231))

(assert (=> d!79465 m!496051))

(assert (=> d!79465 m!496081))

(assert (=> d!79465 m!496063))

(declare-fun m!496233 () Bool)

(assert (=> d!79465 m!496233))

(declare-fun m!496235 () Bool)

(assert (=> b!514890 m!496235))

(assert (=> b!514694 d!79465))

(declare-fun b!514895 () Bool)

(declare-fun e!300671 () SeekEntryResult!4328)

(assert (=> b!514895 (= e!300671 Undefined!4328)))

(declare-fun lt!235727 () SeekEntryResult!4328)

(declare-fun b!514896 () Bool)

(declare-fun e!300670 () SeekEntryResult!4328)

(assert (=> b!514896 (= e!300670 (seekKeyOrZeroReturnVacant!0 (x!48469 lt!235727) (index!19502 lt!235727) (index!19502 lt!235727) k!2280 a!3235 mask!3524))))

(declare-fun b!514897 () Bool)

(declare-fun c!60453 () Bool)

(declare-fun lt!235728 () (_ BitVec 64))

(assert (=> b!514897 (= c!60453 (= lt!235728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300669 () SeekEntryResult!4328)

(assert (=> b!514897 (= e!300669 e!300670)))

(declare-fun d!79481 () Bool)

(declare-fun lt!235726 () SeekEntryResult!4328)

(assert (=> d!79481 (and (or (is-Undefined!4328 lt!235726) (not (is-Found!4328 lt!235726)) (and (bvsge (index!19501 lt!235726) #b00000000000000000000000000000000) (bvslt (index!19501 lt!235726) (size!16225 a!3235)))) (or (is-Undefined!4328 lt!235726) (is-Found!4328 lt!235726) (not (is-MissingZero!4328 lt!235726)) (and (bvsge (index!19500 lt!235726) #b00000000000000000000000000000000) (bvslt (index!19500 lt!235726) (size!16225 a!3235)))) (or (is-Undefined!4328 lt!235726) (is-Found!4328 lt!235726) (is-MissingZero!4328 lt!235726) (not (is-MissingVacant!4328 lt!235726)) (and (bvsge (index!19503 lt!235726) #b00000000000000000000000000000000) (bvslt (index!19503 lt!235726) (size!16225 a!3235)))) (or (is-Undefined!4328 lt!235726) (ite (is-Found!4328 lt!235726) (= (select (arr!15861 a!3235) (index!19501 lt!235726)) k!2280) (ite (is-MissingZero!4328 lt!235726) (= (select (arr!15861 a!3235) (index!19500 lt!235726)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4328 lt!235726) (= (select (arr!15861 a!3235) (index!19503 lt!235726)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79481 (= lt!235726 e!300671)))

(declare-fun c!60454 () Bool)

(assert (=> d!79481 (= c!60454 (and (is-Intermediate!4328 lt!235727) (undefined!5140 lt!235727)))))

(assert (=> d!79481 (= lt!235727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79481 (validMask!0 mask!3524)))

(assert (=> d!79481 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!235726)))

(declare-fun b!514898 () Bool)

(assert (=> b!514898 (= e!300671 e!300669)))

(assert (=> b!514898 (= lt!235728 (select (arr!15861 a!3235) (index!19502 lt!235727)))))

(declare-fun c!60455 () Bool)

(assert (=> b!514898 (= c!60455 (= lt!235728 k!2280))))

(declare-fun b!514899 () Bool)

(assert (=> b!514899 (= e!300669 (Found!4328 (index!19502 lt!235727)))))

(declare-fun b!514900 () Bool)

(assert (=> b!514900 (= e!300670 (MissingZero!4328 (index!19502 lt!235727)))))

(assert (= (and d!79481 c!60454) b!514895))

(assert (= (and d!79481 (not c!60454)) b!514898))

(assert (= (and b!514898 c!60455) b!514899))

(assert (= (and b!514898 (not c!60455)) b!514897))

(assert (= (and b!514897 c!60453) b!514900))

(assert (= (and b!514897 (not c!60453)) b!514896))

(declare-fun m!496237 () Bool)

(assert (=> b!514896 m!496237))

(declare-fun m!496239 () Bool)

(assert (=> d!79481 m!496239))

(declare-fun m!496241 () Bool)

(assert (=> d!79481 m!496241))

(declare-fun m!496243 () Bool)

(assert (=> d!79481 m!496243))

(declare-fun m!496245 () Bool)

(assert (=> d!79481 m!496245))

(assert (=> d!79481 m!496241))

(assert (=> d!79481 m!496063))

(declare-fun m!496247 () Bool)

(assert (=> d!79481 m!496247))

(declare-fun m!496249 () Bool)

(assert (=> b!514898 m!496249))

(assert (=> b!514699 d!79481))

(declare-fun d!79483 () Bool)

(assert (=> d!79483 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514693 d!79483))

(declare-fun b!514951 () Bool)

(declare-fun e!300708 () Bool)

(declare-fun contains!2739 (List!10019 (_ BitVec 64)) Bool)

(assert (=> b!514951 (= e!300708 (contains!2739 Nil!10016 (select (arr!15861 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79485 () Bool)

(declare-fun res!314589 () Bool)

(declare-fun e!300710 () Bool)

(assert (=> d!79485 (=> res!314589 e!300710)))

(assert (=> d!79485 (= res!314589 (bvsge #b00000000000000000000000000000000 (size!16225 a!3235)))))

(assert (=> d!79485 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10016) e!300710)))

(declare-fun bm!31631 () Bool)

(declare-fun call!31634 () Bool)

(declare-fun c!60470 () Bool)

(assert (=> bm!31631 (= call!31634 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60470 (Cons!10015 (select (arr!15861 a!3235) #b00000000000000000000000000000000) Nil!10016) Nil!10016)))))

(declare-fun b!514952 () Bool)

(declare-fun e!300707 () Bool)

(assert (=> b!514952 (= e!300707 call!31634)))

(declare-fun b!514953 () Bool)

(assert (=> b!514953 (= e!300707 call!31634)))

(declare-fun b!514954 () Bool)

(declare-fun e!300709 () Bool)

(assert (=> b!514954 (= e!300710 e!300709)))

(declare-fun res!314588 () Bool)

(assert (=> b!514954 (=> (not res!314588) (not e!300709))))

(assert (=> b!514954 (= res!314588 (not e!300708))))

(declare-fun res!314590 () Bool)

(assert (=> b!514954 (=> (not res!314590) (not e!300708))))

(assert (=> b!514954 (= res!314590 (validKeyInArray!0 (select (arr!15861 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514955 () Bool)

(assert (=> b!514955 (= e!300709 e!300707)))

(assert (=> b!514955 (= c!60470 (validKeyInArray!0 (select (arr!15861 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79485 (not res!314589)) b!514954))

(assert (= (and b!514954 res!314590) b!514951))

(assert (= (and b!514954 res!314588) b!514955))

(assert (= (and b!514955 c!60470) b!514953))

(assert (= (and b!514955 (not c!60470)) b!514952))

(assert (= (or b!514953 b!514952) bm!31631))

(assert (=> b!514951 m!496191))

(assert (=> b!514951 m!496191))

(declare-fun m!496265 () Bool)

(assert (=> b!514951 m!496265))

(assert (=> bm!31631 m!496191))

(declare-fun m!496267 () Bool)

(assert (=> bm!31631 m!496267))

(assert (=> b!514954 m!496191))

(assert (=> b!514954 m!496191))

(assert (=> b!514954 m!496201))

(assert (=> b!514955 m!496191))

(assert (=> b!514955 m!496191))

(assert (=> b!514955 m!496201))

(assert (=> b!514698 d!79485))

(declare-fun d!79493 () Bool)

(declare-fun res!314595 () Bool)

(declare-fun e!300715 () Bool)

(assert (=> d!79493 (=> res!314595 e!300715)))

(assert (=> d!79493 (= res!314595 (= (select (arr!15861 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79493 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!300715)))

(declare-fun b!514960 () Bool)

(declare-fun e!300716 () Bool)

(assert (=> b!514960 (= e!300715 e!300716)))

(declare-fun res!314596 () Bool)

(assert (=> b!514960 (=> (not res!314596) (not e!300716))))

(assert (=> b!514960 (= res!314596 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16225 a!3235)))))

(declare-fun b!514961 () Bool)

(assert (=> b!514961 (= e!300716 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79493 (not res!314595)) b!514960))

(assert (= (and b!514960 res!314596) b!514961))

(assert (=> d!79493 m!496191))

(declare-fun m!496269 () Bool)

(assert (=> b!514961 m!496269))

(assert (=> b!514703 d!79493))

(declare-fun d!79495 () Bool)

(assert (=> d!79495 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46614 d!79495))

(declare-fun d!79511 () Bool)

(assert (=> d!79511 (= (array_inv!11657 a!3235) (bvsge (size!16225 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46614 d!79511))

(declare-fun d!79513 () Bool)

(declare-fun lt!235761 () (_ BitVec 32))

(declare-fun lt!235760 () (_ BitVec 32))

(assert (=> d!79513 (= lt!235761 (bvmul (bvxor lt!235760 (bvlshr lt!235760 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79513 (= lt!235760 ((_ extract 31 0) (bvand (bvxor (select (arr!15861 a!3235) j!176) (bvlshr (select (arr!15861 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79513 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314608 (let ((h!10915 ((_ extract 31 0) (bvand (bvxor (select (arr!15861 a!3235) j!176) (bvlshr (select (arr!15861 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48476 (bvmul (bvxor h!10915 (bvlshr h!10915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48476 (bvlshr x!48476 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314608 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314608 #b00000000000000000000000000000000))))))

(assert (=> d!79513 (= (toIndex!0 (select (arr!15861 a!3235) j!176) mask!3524) (bvand (bvxor lt!235761 (bvlshr lt!235761 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514697 d!79513))

(declare-fun b!514997 () Bool)

(declare-fun e!300742 () Bool)

(declare-fun e!300740 () Bool)

(assert (=> b!514997 (= e!300742 e!300740)))

(declare-fun lt!235762 () (_ BitVec 64))

(assert (=> b!514997 (= lt!235762 (select (arr!15861 a!3235) j!176))))

(declare-fun lt!235763 () Unit!15914)

(assert (=> b!514997 (= lt!235763 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235762 j!176))))

(assert (=> b!514997 (arrayContainsKey!0 a!3235 lt!235762 #b00000000000000000000000000000000)))

(declare-fun lt!235764 () Unit!15914)

(assert (=> b!514997 (= lt!235764 lt!235763)))

(declare-fun res!314611 () Bool)

(assert (=> b!514997 (= res!314611 (= (seekEntryOrOpen!0 (select (arr!15861 a!3235) j!176) a!3235 mask!3524) (Found!4328 j!176)))))

(assert (=> b!514997 (=> (not res!314611) (not e!300740))))

(declare-fun d!79521 () Bool)

(declare-fun res!314612 () Bool)

(declare-fun e!300741 () Bool)

(assert (=> d!79521 (=> res!314612 e!300741)))

(assert (=> d!79521 (= res!314612 (bvsge j!176 (size!16225 a!3235)))))

(assert (=> d!79521 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300741)))

(declare-fun b!514998 () Bool)

(declare-fun call!31640 () Bool)

(assert (=> b!514998 (= e!300742 call!31640)))

(declare-fun bm!31637 () Bool)

(assert (=> bm!31637 (= call!31640 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514999 () Bool)

(assert (=> b!514999 (= e!300740 call!31640)))

(declare-fun b!515000 () Bool)

(assert (=> b!515000 (= e!300741 e!300742)))

(declare-fun c!60482 () Bool)

(assert (=> b!515000 (= c!60482 (validKeyInArray!0 (select (arr!15861 a!3235) j!176)))))

(assert (= (and d!79521 (not res!314612)) b!515000))

(assert (= (and b!515000 c!60482) b!514997))

(assert (= (and b!515000 (not c!60482)) b!514998))

(assert (= (and b!514997 res!314611) b!514999))

(assert (= (or b!514999 b!514998) bm!31637))

(assert (=> b!514997 m!496051))

(declare-fun m!496315 () Bool)

(assert (=> b!514997 m!496315))

(declare-fun m!496317 () Bool)

(assert (=> b!514997 m!496317))

(assert (=> b!514997 m!496051))

(assert (=> b!514997 m!496067))

(declare-fun m!496319 () Bool)

(assert (=> bm!31637 m!496319))

(assert (=> b!515000 m!496051))

(assert (=> b!515000 m!496051))

(assert (=> b!515000 m!496055))

(assert (=> b!514697 d!79521))

(declare-fun d!79523 () Bool)

(assert (=> d!79523 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235767 () Unit!15914)

(declare-fun choose!38 (array!32983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15914)

(assert (=> d!79523 (= lt!235767 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79523 (validMask!0 mask!3524)))

(assert (=> d!79523 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235767)))

(declare-fun bs!16275 () Bool)

(assert (= bs!16275 d!79523))

(assert (=> bs!16275 m!496075))

(declare-fun m!496321 () Bool)

(assert (=> bs!16275 m!496321))

(assert (=> bs!16275 m!496063))

(assert (=> b!514697 d!79523))

(declare-fun d!79525 () Bool)

(declare-fun lt!235769 () (_ BitVec 32))

(declare-fun lt!235768 () (_ BitVec 32))

(assert (=> d!79525 (= lt!235769 (bvmul (bvxor lt!235768 (bvlshr lt!235768 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79525 (= lt!235768 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79525 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314608 (let ((h!10915 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48476 (bvmul (bvxor h!10915 (bvlshr h!10915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48476 (bvlshr x!48476 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314608 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314608 #b00000000000000000000000000000000))))))

(assert (=> d!79525 (= (toIndex!0 (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235769 (bvlshr lt!235769 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514697 d!79525))

(declare-fun d!79527 () Bool)

(declare-fun e!300765 () Bool)

(assert (=> d!79527 e!300765))

(declare-fun c!60498 () Bool)

(declare-fun lt!235784 () SeekEntryResult!4328)

(assert (=> d!79527 (= c!60498 (and (is-Intermediate!4328 lt!235784) (undefined!5140 lt!235784)))))

(declare-fun e!300763 () SeekEntryResult!4328)

(assert (=> d!79527 (= lt!235784 e!300763)))

(declare-fun c!60499 () Bool)

(assert (=> d!79527 (= c!60499 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235783 () (_ BitVec 64))

(assert (=> d!79527 (= lt!235783 (select (arr!15861 (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235))) lt!235626))))

(assert (=> d!79527 (validMask!0 mask!3524)))

(assert (=> d!79527 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235626 (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235)) mask!3524) lt!235784)))

(declare-fun b!515037 () Bool)

(assert (=> b!515037 (= e!300763 (Intermediate!4328 true lt!235626 #b00000000000000000000000000000000))))

(declare-fun b!515038 () Bool)

(assert (=> b!515038 (and (bvsge (index!19502 lt!235784) #b00000000000000000000000000000000) (bvslt (index!19502 lt!235784) (size!16225 (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235)))))))

(declare-fun res!314619 () Bool)

(assert (=> b!515038 (= res!314619 (= (select (arr!15861 (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235))) (index!19502 lt!235784)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300762 () Bool)

(assert (=> b!515038 (=> res!314619 e!300762)))

(declare-fun b!515039 () Bool)

(declare-fun e!300766 () Bool)

(assert (=> b!515039 (= e!300765 e!300766)))

(declare-fun res!314620 () Bool)

(assert (=> b!515039 (= res!314620 (and (is-Intermediate!4328 lt!235784) (not (undefined!5140 lt!235784)) (bvslt (x!48469 lt!235784) #b01111111111111111111111111111110) (bvsge (x!48469 lt!235784) #b00000000000000000000000000000000) (bvsge (x!48469 lt!235784) #b00000000000000000000000000000000)))))

(assert (=> b!515039 (=> (not res!314620) (not e!300766))))

(declare-fun b!515040 () Bool)

(assert (=> b!515040 (and (bvsge (index!19502 lt!235784) #b00000000000000000000000000000000) (bvslt (index!19502 lt!235784) (size!16225 (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235)))))))

(assert (=> b!515040 (= e!300762 (= (select (arr!15861 (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235))) (index!19502 lt!235784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!515041 () Bool)

(assert (=> b!515041 (and (bvsge (index!19502 lt!235784) #b00000000000000000000000000000000) (bvslt (index!19502 lt!235784) (size!16225 (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235)))))))

(declare-fun res!314621 () Bool)

(assert (=> b!515041 (= res!314621 (= (select (arr!15861 (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235))) (index!19502 lt!235784)) (select (store (arr!15861 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!515041 (=> res!314621 e!300762)))

(assert (=> b!515041 (= e!300766 e!300762)))

(declare-fun b!515042 () Bool)

(declare-fun e!300764 () SeekEntryResult!4328)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515042 (= e!300764 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235626 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15861 a!3235) i!1204 k!2280) j!176) (array!32984 (store (arr!15861 a!3235) i!1204 k!2280) (size!16225 a!3235)) mask!3524))))

(declare-fun b!515043 () Bool)

(assert (=> b!515043 (= e!300765 (bvsge (x!48469 lt!235784) #b01111111111111111111111111111110))))

(declare-fun b!515044 () Bool)

(assert (=> b!515044 (= e!300764 (Intermediate!4328 false lt!235626 #b00000000000000000000000000000000))))

(declare-fun b!515045 () Bool)

(assert (=> b!515045 (= e!300763 e!300764)))

(declare-fun c!60500 () Bool)

(assert (=> b!515045 (= c!60500 (or (= lt!235783 (select (store (arr!15861 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235783 lt!235783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79527 c!60499) b!515037))

(assert (= (and d!79527 (not c!60499)) b!515045))

(assert (= (and b!515045 c!60500) b!515044))

(assert (= (and b!515045 (not c!60500)) b!515042))

(assert (= (and d!79527 c!60498) b!515043))

(assert (= (and d!79527 (not c!60498)) b!515039))

(assert (= (and b!515039 res!314620) b!515041))

(assert (= (and b!515041 (not res!314621)) b!515038))

(assert (= (and b!515038 (not res!314619)) b!515040))

(declare-fun m!496335 () Bool)

(assert (=> d!79527 m!496335))

(assert (=> d!79527 m!496063))

(declare-fun m!496337 () Bool)

(assert (=> b!515041 m!496337))

(assert (=> b!515038 m!496337))

(declare-fun m!496339 () Bool)

(assert (=> b!515042 m!496339))

(assert (=> b!515042 m!496339))

(assert (=> b!515042 m!496073))

(declare-fun m!496341 () Bool)

(assert (=> b!515042 m!496341))

(assert (=> b!515040 m!496337))

(assert (=> b!514697 d!79527))

(declare-fun d!79533 () Bool)

(declare-fun e!300770 () Bool)

(assert (=> d!79533 e!300770))

(declare-fun c!60501 () Bool)

(declare-fun lt!235786 () SeekEntryResult!4328)

(assert (=> d!79533 (= c!60501 (and (is-Intermediate!4328 lt!235786) (undefined!5140 lt!235786)))))

(declare-fun e!300768 () SeekEntryResult!4328)

(assert (=> d!79533 (= lt!235786 e!300768)))

(declare-fun c!60502 () Bool)

(assert (=> d!79533 (= c!60502 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235785 () (_ BitVec 64))

(assert (=> d!79533 (= lt!235785 (select (arr!15861 a!3235) lt!235628))))

(assert (=> d!79533 (validMask!0 mask!3524)))

(assert (=> d!79533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235628 (select (arr!15861 a!3235) j!176) a!3235 mask!3524) lt!235786)))

(declare-fun b!515046 () Bool)

(assert (=> b!515046 (= e!300768 (Intermediate!4328 true lt!235628 #b00000000000000000000000000000000))))

(declare-fun b!515047 () Bool)

(assert (=> b!515047 (and (bvsge (index!19502 lt!235786) #b00000000000000000000000000000000) (bvslt (index!19502 lt!235786) (size!16225 a!3235)))))

(declare-fun res!314622 () Bool)

(assert (=> b!515047 (= res!314622 (= (select (arr!15861 a!3235) (index!19502 lt!235786)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300767 () Bool)

(assert (=> b!515047 (=> res!314622 e!300767)))

(declare-fun b!515048 () Bool)

(declare-fun e!300771 () Bool)

(assert (=> b!515048 (= e!300770 e!300771)))

(declare-fun res!314623 () Bool)

(assert (=> b!515048 (= res!314623 (and (is-Intermediate!4328 lt!235786) (not (undefined!5140 lt!235786)) (bvslt (x!48469 lt!235786) #b01111111111111111111111111111110) (bvsge (x!48469 lt!235786) #b00000000000000000000000000000000) (bvsge (x!48469 lt!235786) #b00000000000000000000000000000000)))))

(assert (=> b!515048 (=> (not res!314623) (not e!300771))))

(declare-fun b!515049 () Bool)

(assert (=> b!515049 (and (bvsge (index!19502 lt!235786) #b00000000000000000000000000000000) (bvslt (index!19502 lt!235786) (size!16225 a!3235)))))

(assert (=> b!515049 (= e!300767 (= (select (arr!15861 a!3235) (index!19502 lt!235786)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!515050 () Bool)

(assert (=> b!515050 (and (bvsge (index!19502 lt!235786) #b00000000000000000000000000000000) (bvslt (index!19502 lt!235786) (size!16225 a!3235)))))

(declare-fun res!314624 () Bool)

(assert (=> b!515050 (= res!314624 (= (select (arr!15861 a!3235) (index!19502 lt!235786)) (select (arr!15861 a!3235) j!176)))))

(assert (=> b!515050 (=> res!314624 e!300767)))

(assert (=> b!515050 (= e!300771 e!300767)))

(declare-fun b!515051 () Bool)

(declare-fun e!300769 () SeekEntryResult!4328)

(assert (=> b!515051 (= e!300769 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235628 #b00000000000000000000000000000000 mask!3524) (select (arr!15861 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!515052 () Bool)

(assert (=> b!515052 (= e!300770 (bvsge (x!48469 lt!235786) #b01111111111111111111111111111110))))

(declare-fun b!515053 () Bool)

(assert (=> b!515053 (= e!300769 (Intermediate!4328 false lt!235628 #b00000000000000000000000000000000))))

(declare-fun b!515054 () Bool)

(assert (=> b!515054 (= e!300768 e!300769)))

(declare-fun c!60503 () Bool)

(assert (=> b!515054 (= c!60503 (or (= lt!235785 (select (arr!15861 a!3235) j!176)) (= (bvadd lt!235785 lt!235785) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79533 c!60502) b!515046))

(assert (= (and d!79533 (not c!60502)) b!515054))

(assert (= (and b!515054 c!60503) b!515053))

(assert (= (and b!515054 (not c!60503)) b!515051))

(assert (= (and d!79533 c!60501) b!515052))

(assert (= (and d!79533 (not c!60501)) b!515048))

(assert (= (and b!515048 res!314623) b!515050))

(assert (= (and b!515050 (not res!314624)) b!515047))

(assert (= (and b!515047 (not res!314622)) b!515049))

(declare-fun m!496343 () Bool)

(assert (=> d!79533 m!496343))

(assert (=> d!79533 m!496063))

(declare-fun m!496345 () Bool)

(assert (=> b!515050 m!496345))

(assert (=> b!515047 m!496345))

(declare-fun m!496347 () Bool)

(assert (=> b!515051 m!496347))

(assert (=> b!515051 m!496347))

(assert (=> b!515051 m!496051))

(declare-fun m!496349 () Bool)

(assert (=> b!515051 m!496349))

(assert (=> b!515049 m!496345))

(assert (=> b!514697 d!79533))

(declare-fun d!79537 () Bool)

(assert (=> d!79537 (= (validKeyInArray!0 (select (arr!15861 a!3235) j!176)) (and (not (= (select (arr!15861 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15861 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514702 d!79537))

(push 1)

(assert (not d!79481))

(assert (not b!514845))

(assert (not b!514954))

(assert (not d!79533))

(assert (not b!515051))

(assert (not bm!31637))

(assert (not b!514997))

(assert (not d!79465))

(assert (not b!514888))

(assert (not b!514961))

(assert (not b!514896))

(assert (not b!514848))

(assert (not bm!31621))

(assert (not bm!31631))

(assert (not d!79527))

(assert (not b!514955))

(assert (not d!79523))

(assert (not b!514951))

(assert (not b!515000))

(assert (not b!515042))

(check-sat)

