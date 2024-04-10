; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136490 () Bool)

(assert start!136490)

(declare-fun b!1577667 () Bool)

(declare-fun e!879980 () Bool)

(declare-fun k!768 () (_ BitVec 64))

(declare-datatypes ((array!105627 0))(
  ( (array!105628 (arr!50931 (Array (_ BitVec 32) (_ BitVec 64))) (size!51481 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105627)

(declare-fun x!458 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13760 0))(
  ( (MissingZero!13760 (index!57438 (_ BitVec 32))) (Found!13760 (index!57439 (_ BitVec 32))) (Intermediate!13760 (undefined!14572 Bool) (index!57440 (_ BitVec 32)) (x!142569 (_ BitVec 32))) (Undefined!13760) (MissingVacant!13760 (index!57441 (_ BitVec 32))) )
))
(declare-fun lt!676063 () SeekEntryResult!13760)

(assert (=> b!1577667 (= e!879980 (and (is-Intermediate!13760 lt!676063) (not (undefined!14572 lt!676063)) (bvslt (x!142569 lt!676063) #b01111111111111111111111111111110) (bvsge (x!142569 lt!676063) #b00000000000000000000000000000000) (bvsge (x!142569 lt!676063) x!458) (not (= (select (arr!50931 _keys!610) (index!57440 lt!676063)) k!768)) (not (= (select (arr!50931 _keys!610) (index!57440 lt!676063)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57440 lt!676063) #b00000000000000000000000000000000) (bvsge (index!57440 lt!676063) (size!51481 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105627 (_ BitVec 32)) SeekEntryResult!13760)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577667 (= lt!676063 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910))))

(declare-fun res!1077819 () Bool)

(assert (=> start!136490 (=> (not res!1077819) (not e!879980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136490 (= res!1077819 (validMask!0 mask!910))))

(assert (=> start!136490 e!879980))

(assert (=> start!136490 true))

(declare-fun array_inv!39658 (array!105627) Bool)

(assert (=> start!136490 (array_inv!39658 _keys!610)))

(declare-fun b!1577665 () Bool)

(declare-fun res!1077820 () Bool)

(assert (=> b!1577665 (=> (not res!1077820) (not e!879980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577665 (= res!1077820 (validKeyInArray!0 k!768))))

(declare-fun b!1577664 () Bool)

(declare-fun res!1077821 () Bool)

(assert (=> b!1577664 (=> (not res!1077821) (not e!879980))))

(assert (=> b!1577664 (= res!1077821 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51481 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577666 () Bool)

(declare-fun res!1077822 () Bool)

(assert (=> b!1577666 (=> (not res!1077822) (not e!879980))))

(assert (=> b!1577666 (= res!1077822 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50931 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50931 _keys!610) ee!12) (select (arr!50931 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136490 res!1077819) b!1577664))

(assert (= (and b!1577664 res!1077821) b!1577665))

(assert (= (and b!1577665 res!1077820) b!1577666))

(assert (= (and b!1577666 res!1077822) b!1577667))

(declare-fun m!1449851 () Bool)

(assert (=> b!1577667 m!1449851))

(declare-fun m!1449853 () Bool)

(assert (=> b!1577667 m!1449853))

(assert (=> b!1577667 m!1449853))

(declare-fun m!1449855 () Bool)

(assert (=> b!1577667 m!1449855))

(declare-fun m!1449857 () Bool)

(assert (=> start!136490 m!1449857))

(declare-fun m!1449859 () Bool)

(assert (=> start!136490 m!1449859))

(declare-fun m!1449861 () Bool)

(assert (=> b!1577665 m!1449861))

(declare-fun m!1449863 () Bool)

(assert (=> b!1577666 m!1449863))

(push 1)

(assert (not b!1577667))

(assert (not b!1577665))

(assert (not start!136490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!880023 () SeekEntryResult!13760)

(declare-fun b!1577740 () Bool)

(assert (=> b!1577740 (= e!880023 (Intermediate!13760 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577741 () Bool)

(declare-fun lt!676083 () SeekEntryResult!13760)

(assert (=> b!1577741 (and (bvsge (index!57440 lt!676083) #b00000000000000000000000000000000) (bvslt (index!57440 lt!676083) (size!51481 _keys!610)))))

(declare-fun e!880025 () Bool)

(assert (=> b!1577741 (= e!880025 (= (select (arr!50931 _keys!610) (index!57440 lt!676083)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!165937 () Bool)

(declare-fun e!880021 () Bool)

(assert (=> d!165937 e!880021))

(declare-fun c!146232 () Bool)

(assert (=> d!165937 (= c!146232 (and (is-Intermediate!13760 lt!676083) (undefined!14572 lt!676083)))))

(declare-fun e!880022 () SeekEntryResult!13760)

(assert (=> d!165937 (= lt!676083 e!880022)))

(declare-fun c!146230 () Bool)

(assert (=> d!165937 (= c!146230 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676084 () (_ BitVec 64))

(assert (=> d!165937 (= lt!676084 (select (arr!50931 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165937 (validMask!0 mask!910)))

(assert (=> d!165937 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910) lt!676083)))

(declare-fun b!1577742 () Bool)

(assert (=> b!1577742 (= e!880022 e!880023)))

(declare-fun c!146231 () Bool)

(assert (=> b!1577742 (= c!146231 (or (= lt!676084 k!768) (= (bvadd lt!676084 lt!676084) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577743 () Bool)

(assert (=> b!1577743 (= e!880023 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577744 () Bool)

(assert (=> b!1577744 (and (bvsge (index!57440 lt!676083) #b00000000000000000000000000000000) (bvslt (index!57440 lt!676083) (size!51481 _keys!610)))))

(declare-fun res!1077848 () Bool)

(assert (=> b!1577744 (= res!1077848 (= (select (arr!50931 _keys!610) (index!57440 lt!676083)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577744 (=> res!1077848 e!880025)))

(declare-fun b!1577745 () Bool)

(declare-fun e!880024 () Bool)

(assert (=> b!1577745 (= e!880021 e!880024)))

(declare-fun res!1077849 () Bool)

(assert (=> b!1577745 (= res!1077849 (and (is-Intermediate!13760 lt!676083) (not (undefined!14572 lt!676083)) (bvslt (x!142569 lt!676083) #b01111111111111111111111111111110) (bvsge (x!142569 lt!676083) #b00000000000000000000000000000000) (bvsge (x!142569 lt!676083) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577745 (=> (not res!1077849) (not e!880024))))

(declare-fun b!1577746 () Bool)

(assert (=> b!1577746 (= e!880022 (Intermediate!13760 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577747 () Bool)

(assert (=> b!1577747 (= e!880021 (bvsge (x!142569 lt!676083) #b01111111111111111111111111111110))))

(declare-fun b!1577748 () Bool)

(assert (=> b!1577748 (and (bvsge (index!57440 lt!676083) #b00000000000000000000000000000000) (bvslt (index!57440 lt!676083) (size!51481 _keys!610)))))

(declare-fun res!1077847 () Bool)

(assert (=> b!1577748 (= res!1077847 (= (select (arr!50931 _keys!610) (index!57440 lt!676083)) k!768))))

(assert (=> b!1577748 (=> res!1077847 e!880025)))

(assert (=> b!1577748 (= e!880024 e!880025)))

(assert (= (and d!165937 c!146230) b!1577746))

(assert (= (and d!165937 (not c!146230)) b!1577742))

(assert (= (and b!1577742 c!146231) b!1577740))

(assert (= (and b!1577742 (not c!146231)) b!1577743))

(assert (= (and d!165937 c!146232) b!1577747))

(assert (= (and d!165937 (not c!146232)) b!1577745))

(assert (= (and b!1577745 res!1077849) b!1577748))

(assert (= (and b!1577748 (not res!1077847)) b!1577744))

(assert (= (and b!1577744 (not res!1077848)) b!1577741))

(declare-fun m!1449883 () Bool)

(assert (=> b!1577748 m!1449883))

(assert (=> b!1577743 m!1449853))

(declare-fun m!1449885 () Bool)

