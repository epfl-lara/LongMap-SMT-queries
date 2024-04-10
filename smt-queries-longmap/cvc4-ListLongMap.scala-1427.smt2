; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27592 () Bool)

(assert start!27592)

(declare-fun b!285137 () Bool)

(declare-fun e!180740 () Bool)

(declare-fun e!180741 () Bool)

(assert (=> b!285137 (= e!180740 e!180741)))

(declare-fun res!147653 () Bool)

(assert (=> b!285137 (=> (not res!147653) (not e!180741))))

(declare-datatypes ((SeekEntryResult!1918 0))(
  ( (MissingZero!1918 (index!9842 (_ BitVec 32))) (Found!1918 (index!9843 (_ BitVec 32))) (Intermediate!1918 (undefined!2730 Bool) (index!9844 (_ BitVec 32)) (x!28037 (_ BitVec 32))) (Undefined!1918) (MissingVacant!1918 (index!9845 (_ BitVec 32))) )
))
(declare-fun lt!140702 () SeekEntryResult!1918)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285137 (= res!147653 (or (= lt!140702 (MissingZero!1918 i!1267)) (= lt!140702 (MissingVacant!1918 i!1267))))))

(declare-datatypes ((array!14242 0))(
  ( (array!14243 (arr!6760 (Array (_ BitVec 32) (_ BitVec 64))) (size!7112 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14242)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14242 (_ BitVec 32)) SeekEntryResult!1918)

(assert (=> b!285137 (= lt!140702 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!147650 () Bool)

(assert (=> start!27592 (=> (not res!147650) (not e!180740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27592 (= res!147650 (validMask!0 mask!3868))))

(assert (=> start!27592 e!180740))

(declare-fun array_inv!4723 (array!14242) Bool)

(assert (=> start!27592 (array_inv!4723 a!3325)))

(assert (=> start!27592 true))

(declare-fun b!285138 () Bool)

(declare-fun res!147649 () Bool)

(assert (=> b!285138 (=> (not res!147649) (not e!180740))))

(declare-fun arrayContainsKey!0 (array!14242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285138 (= res!147649 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285139 () Bool)

(declare-fun res!147651 () Bool)

(assert (=> b!285139 (=> (not res!147651) (not e!180741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14242 (_ BitVec 32)) Bool)

(assert (=> b!285139 (= res!147651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285140 () Bool)

(declare-fun res!147652 () Bool)

(assert (=> b!285140 (=> (not res!147652) (not e!180740))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!285140 (= res!147652 (and (= (size!7112 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7112 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7112 a!3325))))))

(declare-fun b!285141 () Bool)

(declare-fun res!147645 () Bool)

(assert (=> b!285141 (=> (not res!147645) (not e!180740))))

(declare-datatypes ((List!4568 0))(
  ( (Nil!4565) (Cons!4564 (h!5237 (_ BitVec 64)) (t!9650 List!4568)) )
))
(declare-fun arrayNoDuplicates!0 (array!14242 (_ BitVec 32) List!4568) Bool)

(assert (=> b!285141 (= res!147645 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4565))))

(declare-fun b!285142 () Bool)

(declare-fun res!147654 () Bool)

(assert (=> b!285142 (=> (not res!147654) (not e!180740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285142 (= res!147654 (validKeyInArray!0 k!2581))))

(declare-fun b!285143 () Bool)

(declare-fun res!147646 () Bool)

(declare-fun e!180743 () Bool)

(assert (=> b!285143 (=> (not res!147646) (not e!180743))))

(assert (=> b!285143 (= res!147646 (and (bvslt startIndex!26 (bvsub (size!7112 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!285144 () Bool)

(declare-fun res!147648 () Bool)

(assert (=> b!285144 (=> (not res!147648) (not e!180743))))

(assert (=> b!285144 (= res!147648 (not (validKeyInArray!0 (select (arr!6760 a!3325) startIndex!26))))))

(declare-fun lt!140703 () array!14242)

(declare-fun b!285145 () Bool)

(assert (=> b!285145 (= e!180743 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140703 mask!3868)))))

(assert (=> b!285145 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140703 mask!3868)))

(declare-datatypes ((Unit!9042 0))(
  ( (Unit!9043) )
))
(declare-fun lt!140704 () Unit!9042)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9042)

(assert (=> b!285145 (= lt!140704 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!285146 () Bool)

(assert (=> b!285146 (= e!180741 e!180743)))

(declare-fun res!147647 () Bool)

(assert (=> b!285146 (=> (not res!147647) (not e!180743))))

(assert (=> b!285146 (= res!147647 (not (= startIndex!26 i!1267)))))

(assert (=> b!285146 (= lt!140703 (array!14243 (store (arr!6760 a!3325) i!1267 k!2581) (size!7112 a!3325)))))

(assert (= (and start!27592 res!147650) b!285140))

(assert (= (and b!285140 res!147652) b!285142))

(assert (= (and b!285142 res!147654) b!285141))

(assert (= (and b!285141 res!147645) b!285138))

(assert (= (and b!285138 res!147649) b!285137))

(assert (= (and b!285137 res!147653) b!285139))

(assert (= (and b!285139 res!147651) b!285146))

(assert (= (and b!285146 res!147647) b!285144))

(assert (= (and b!285144 res!147648) b!285143))

(assert (= (and b!285143 res!147646) b!285145))

(declare-fun m!299989 () Bool)

(assert (=> start!27592 m!299989))

(declare-fun m!299991 () Bool)

(assert (=> start!27592 m!299991))

(declare-fun m!299993 () Bool)

(assert (=> b!285141 m!299993))

(declare-fun m!299995 () Bool)

(assert (=> b!285137 m!299995))

(declare-fun m!299997 () Bool)

(assert (=> b!285144 m!299997))

(assert (=> b!285144 m!299997))

(declare-fun m!299999 () Bool)

(assert (=> b!285144 m!299999))

(declare-fun m!300001 () Bool)

(assert (=> b!285138 m!300001))

(declare-fun m!300003 () Bool)

(assert (=> b!285142 m!300003))

(declare-fun m!300005 () Bool)

(assert (=> b!285146 m!300005))

(declare-fun m!300007 () Bool)

(assert (=> b!285145 m!300007))

(declare-fun m!300009 () Bool)

(assert (=> b!285145 m!300009))

(declare-fun m!300011 () Bool)

(assert (=> b!285145 m!300011))

(declare-fun m!300013 () Bool)

(assert (=> b!285139 m!300013))

(push 1)

(assert (not b!285138))

(assert (not b!285145))

(assert (not start!27592))

(assert (not b!285144))

(assert (not b!285137))

(assert (not b!285141))

(assert (not b!285142))

(assert (not b!285139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!285183 () Bool)

(declare-fun e!180772 () Bool)

(declare-fun e!180773 () Bool)

(assert (=> b!285183 (= e!180772 e!180773)))

(declare-fun c!46309 () Bool)

(assert (=> b!285183 (= c!46309 (validKeyInArray!0 (select (arr!6760 lt!140703) startIndex!26)))))

(declare-fun call!25544 () Bool)

(declare-fun bm!25541 () Bool)

(assert (=> bm!25541 (= call!25544 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140703 mask!3868))))

(declare-fun b!285184 () Bool)

(declare-fun e!180771 () Bool)

(assert (=> b!285184 (= e!180773 e!180771)))

(declare-fun lt!140733 () (_ BitVec 64))

(assert (=> b!285184 (= lt!140733 (select (arr!6760 lt!140703) startIndex!26))))

(declare-fun lt!140734 () Unit!9042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14242 (_ BitVec 64) (_ BitVec 32)) Unit!9042)

(assert (=> b!285184 (= lt!140734 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140703 lt!140733 startIndex!26))))

(assert (=> b!285184 (arrayContainsKey!0 lt!140703 lt!140733 #b00000000000000000000000000000000)))

(declare-fun lt!140732 () Unit!9042)

(assert (=> b!285184 (= lt!140732 lt!140734)))

(declare-fun res!147673 () Bool)

(assert (=> b!285184 (= res!147673 (= (seekEntryOrOpen!0 (select (arr!6760 lt!140703) startIndex!26) lt!140703 mask!3868) (Found!1918 startIndex!26)))))

(assert (=> b!285184 (=> (not res!147673) (not e!180771))))

(declare-fun b!285185 () Bool)

(assert (=> b!285185 (= e!180771 call!25544)))

(declare-fun d!65703 () Bool)

(declare-fun res!147674 () Bool)

(assert (=> d!65703 (=> res!147674 e!180772)))

(assert (=> d!65703 (= res!147674 (bvsge startIndex!26 (size!7112 lt!140703)))))

(assert (=> d!65703 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140703 mask!3868) e!180772)))

(declare-fun b!285186 () Bool)

(assert (=> b!285186 (= e!180773 call!25544)))

(assert (= (and d!65703 (not res!147674)) b!285183))

(assert (= (and b!285183 c!46309) b!285184))

(assert (= (and b!285183 (not c!46309)) b!285186))

(assert (= (and b!285184 res!147673) b!285185))

(assert (= (or b!285185 b!285186) bm!25541))

(declare-fun m!300051 () Bool)

(assert (=> b!285183 m!300051))

(assert (=> b!285183 m!300051))

(declare-fun m!300053 () Bool)

(assert (=> b!285183 m!300053))

(declare-fun m!300055 () Bool)

(assert (=> bm!25541 m!300055))

(assert (=> b!285184 m!300051))

(declare-fun m!300057 () Bool)

(assert (=> b!285184 m!300057))

(declare-fun m!300059 () Bool)

(assert (=> b!285184 m!300059))

(assert (=> b!285184 m!300051))

(declare-fun m!300061 () Bool)

(assert (=> b!285184 m!300061))

(assert (=> b!285145 d!65703))

(declare-fun b!285189 () Bool)

(declare-fun e!180777 () Bool)

(declare-fun e!180778 () Bool)

(assert (=> b!285189 (= e!180777 e!180778)))

(declare-fun c!46310 () Bool)

(assert (=> b!285189 (= c!46310 (validKeyInArray!0 (select (arr!6760 lt!140703) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun bm!25542 () Bool)

(declare-fun call!25545 () Bool)

(assert (=> bm!25542 (= call!25545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!140703 mask!3868))))

(declare-fun b!285190 () Bool)

(declare-fun e!180776 () Bool)

(assert (=> b!285190 (= e!180778 e!180776)))

(declare-fun lt!140738 () (_ BitVec 64))

(assert (=> b!285190 (= lt!140738 (select (arr!6760 lt!140703) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!140739 () Unit!9042)

(assert (=> b!285190 (= lt!140739 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140703 lt!140738 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!285190 (arrayContainsKey!0 lt!140703 lt!140738 #b00000000000000000000000000000000)))

(declare-fun lt!140737 () Unit!9042)

(assert (=> b!285190 (= lt!140737 lt!140739)))

(declare-fun res!147677 () Bool)

(assert (=> b!285190 (= res!147677 (= (seekEntryOrOpen!0 (select (arr!6760 lt!140703) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!140703 mask!3868) (Found!1918 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!285190 (=> (not res!147677) (not e!180776))))

(declare-fun b!285191 () Bool)

(assert (=> b!285191 (= e!180776 call!25545)))

(declare-fun d!65711 () Bool)

(declare-fun res!147678 () Bool)

(assert (=> d!65711 (=> res!147678 e!180777)))

(assert (=> d!65711 (= res!147678 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7112 lt!140703)))))

(assert (=> d!65711 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140703 mask!3868) e!180777)))

(declare-fun b!285192 () Bool)

(assert (=> b!285192 (= e!180778 call!25545)))

(assert (= (and d!65711 (not res!147678)) b!285189))

(assert (= (and b!285189 c!46310) b!285190))

(assert (= (and b!285189 (not c!46310)) b!285192))

(assert (= (and b!285190 res!147677) b!285191))

(assert (= (or b!285191 b!285192) bm!25542))

(declare-fun m!300063 () Bool)

(assert (=> b!285189 m!300063))

(assert (=> b!285189 m!300063))

(declare-fun m!300065 () Bool)

(assert (=> b!285189 m!300065))

(declare-fun m!300067 () Bool)

(assert (=> bm!25542 m!300067))

(assert (=> b!285190 m!300063))

(declare-fun m!300069 () Bool)

(assert (=> b!285190 m!300069))

(declare-fun m!300071 () Bool)

(assert (=> b!285190 m!300071))

(assert (=> b!285190 m!300063))

(declare-fun m!300073 () Bool)

(assert (=> b!285190 m!300073))

(assert (=> b!285145 d!65711))

(declare-fun d!65713 () Bool)

(declare-fun e!180790 () Bool)

(assert (=> d!65713 e!180790))

(declare-fun res!147688 () Bool)

(assert (=> d!65713 (=> (not res!147688) (not e!180790))))

(assert (=> d!65713 (= res!147688 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7112 a!3325))))))

(declare-fun lt!140743 () Unit!9042)

(declare-fun choose!98 (array!14242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9042)

(assert (=> d!65713 (= lt!140743 (choose!98 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65713 (validMask!0 mask!3868)))

(assert (=> d!65713 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!140743)))

(declare-fun b!285206 () Bool)

(assert (=> b!285206 (= e!180790 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14243 (store (arr!6760 a!3325) i!1267 k!2581) (size!7112 a!3325)) mask!3868))))

(assert (= (and d!65713 res!147688) b!285206))

(declare-fun m!300079 () Bool)

(assert (=> d!65713 m!300079))

(assert (=> d!65713 m!299989))

(assert (=> b!285206 m!300005))

(declare-fun m!300081 () Bool)

(assert (=> b!285206 m!300081))

(assert (=> b!285145 d!65713))

(declare-fun d!65723 () Bool)

(assert (=> d!65723 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27592 d!65723))

(declare-fun d!65727 () Bool)

(assert (=> d!65727 (= (array_inv!4723 a!3325) (bvsge (size!7112 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27592 d!65727))

(declare-fun d!65729 () Bool)

(assert (=> d!65729 (= (validKeyInArray!0 (select (arr!6760 a!3325) startIndex!26)) (and (not (= (select (arr!6760 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6760 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285144 d!65729))

(declare-fun b!285212 () Bool)

(declare-fun e!180796 () Bool)

(declare-fun e!180797 () Bool)

(assert (=> b!285212 (= e!180796 e!180797)))

(declare-fun c!46314 () Bool)

(assert (=> b!285212 (= c!46314 (validKeyInArray!0 (select (arr!6760 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25546 () Bool)

(declare-fun call!25549 () Bool)

(assert (=> bm!25546 (= call!25549 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!285213 () Bool)

(declare-fun e!180795 () Bool)

(assert (=> b!285213 (= e!180797 e!180795)))

(declare-fun lt!140745 () (_ BitVec 64))

(assert (=> b!285213 (= lt!140745 (select (arr!6760 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140746 () Unit!9042)

(assert (=> b!285213 (= lt!140746 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140745 #b00000000000000000000000000000000))))

(assert (=> b!285213 (arrayContainsKey!0 a!3325 lt!140745 #b00000000000000000000000000000000)))

(declare-fun lt!140744 () Unit!9042)

(assert (=> b!285213 (= lt!140744 lt!140746)))

(declare-fun res!147692 () Bool)

(assert (=> b!285213 (= res!147692 (= (seekEntryOrOpen!0 (select (arr!6760 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1918 #b00000000000000000000000000000000)))))

(assert (=> b!285213 (=> (not res!147692) (not e!180795))))

(declare-fun b!285214 () Bool)

(assert (=> b!285214 (= e!180795 call!25549)))

(declare-fun d!65731 () Bool)

(declare-fun res!147693 () Bool)

(assert (=> d!65731 (=> res!147693 e!180796)))

(assert (=> d!65731 (= res!147693 (bvsge #b00000000000000000000000000000000 (size!7112 a!3325)))))

(assert (=> d!65731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!180796)))

(declare-fun b!285215 () Bool)

