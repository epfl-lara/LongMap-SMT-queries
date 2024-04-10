; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69576 () Bool)

(assert start!69576)

(declare-fun b!810967 () Bool)

(declare-fun e!448853 () Bool)

(declare-fun e!448855 () Bool)

(assert (=> b!810967 (= e!448853 e!448855)))

(declare-fun res!554252 () Bool)

(assert (=> b!810967 (=> (not res!554252) (not e!448855))))

(declare-datatypes ((SeekEntryResult!8698 0))(
  ( (MissingZero!8698 (index!37160 (_ BitVec 32))) (Found!8698 (index!37161 (_ BitVec 32))) (Intermediate!8698 (undefined!9510 Bool) (index!37162 (_ BitVec 32)) (x!67966 (_ BitVec 32))) (Undefined!8698) (MissingVacant!8698 (index!37163 (_ BitVec 32))) )
))
(declare-fun lt!363584 () SeekEntryResult!8698)

(declare-fun lt!363576 () SeekEntryResult!8698)

(assert (=> b!810967 (= res!554252 (= lt!363584 lt!363576))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!44072 0))(
  ( (array!44073 (arr!21107 (Array (_ BitVec 32) (_ BitVec 64))) (size!21528 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44072)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44072 (_ BitVec 32)) SeekEntryResult!8698)

(assert (=> b!810967 (= lt!363576 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44072 (_ BitVec 32)) SeekEntryResult!8698)

(assert (=> b!810967 (= lt!363584 (seekEntryOrOpen!0 (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810968 () Bool)

(declare-fun res!554253 () Bool)

(declare-fun e!448856 () Bool)

(assert (=> b!810968 (=> (not res!554253) (not e!448856))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810968 (= res!554253 (and (= (size!21528 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21528 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21528 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810969 () Bool)

(declare-fun e!448852 () Bool)

(assert (=> b!810969 (= e!448852 e!448853)))

(declare-fun res!554246 () Bool)

(assert (=> b!810969 (=> (not res!554246) (not e!448853))))

(declare-fun lt!363579 () SeekEntryResult!8698)

(declare-fun lt!363582 () SeekEntryResult!8698)

(assert (=> b!810969 (= res!554246 (= lt!363579 lt!363582))))

(declare-fun lt!363577 () array!44072)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363581 () (_ BitVec 64))

(assert (=> b!810969 (= lt!363582 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363581 lt!363577 mask!3266))))

(assert (=> b!810969 (= lt!363579 (seekEntryOrOpen!0 lt!363581 lt!363577 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!810969 (= lt!363581 (select (store (arr!21107 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810969 (= lt!363577 (array!44073 (store (arr!21107 a!3170) i!1163 k!2044) (size!21528 a!3170)))))

(declare-fun b!810970 () Bool)

(assert (=> b!810970 (= e!448856 e!448852)))

(declare-fun res!554255 () Bool)

(assert (=> b!810970 (=> (not res!554255) (not e!448852))))

(declare-fun lt!363580 () SeekEntryResult!8698)

(assert (=> b!810970 (= res!554255 (or (= lt!363580 (MissingZero!8698 i!1163)) (= lt!363580 (MissingVacant!8698 i!1163))))))

(assert (=> b!810970 (= lt!363580 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810971 () Bool)

(declare-fun e!448854 () Bool)

(assert (=> b!810971 (= e!448855 e!448854)))

(declare-fun res!554250 () Bool)

(assert (=> b!810971 (=> (not res!554250) (not e!448854))))

(declare-fun lt!363583 () SeekEntryResult!8698)

(assert (=> b!810971 (= res!554250 (and (= lt!363576 lt!363583) (not (= (select (arr!21107 a!3170) index!1236) (select (arr!21107 a!3170) j!153)))))))

(assert (=> b!810971 (= lt!363583 (Found!8698 j!153))))

(declare-fun res!554247 () Bool)

(assert (=> start!69576 (=> (not res!554247) (not e!448856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69576 (= res!554247 (validMask!0 mask!3266))))

(assert (=> start!69576 e!448856))

(assert (=> start!69576 true))

(declare-fun array_inv!16903 (array!44072) Bool)

(assert (=> start!69576 (array_inv!16903 a!3170)))

(declare-fun b!810972 () Bool)

(declare-fun res!554251 () Bool)

(assert (=> b!810972 (=> (not res!554251) (not e!448852))))

(declare-datatypes ((List!15070 0))(
  ( (Nil!15067) (Cons!15066 (h!16195 (_ BitVec 64)) (t!21385 List!15070)) )
))
(declare-fun arrayNoDuplicates!0 (array!44072 (_ BitVec 32) List!15070) Bool)

(assert (=> b!810972 (= res!554251 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15067))))

(declare-fun b!810973 () Bool)

(declare-fun res!554244 () Bool)

(assert (=> b!810973 (=> (not res!554244) (not e!448856))))

(declare-fun arrayContainsKey!0 (array!44072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810973 (= res!554244 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810974 () Bool)

(declare-fun res!554248 () Bool)

(assert (=> b!810974 (=> (not res!554248) (not e!448856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810974 (= res!554248 (validKeyInArray!0 (select (arr!21107 a!3170) j!153)))))

(declare-fun b!810975 () Bool)

(declare-fun res!554249 () Bool)

(assert (=> b!810975 (=> (not res!554249) (not e!448856))))

(assert (=> b!810975 (= res!554249 (validKeyInArray!0 k!2044))))

(declare-fun b!810976 () Bool)

(declare-fun res!554254 () Bool)

(assert (=> b!810976 (=> (not res!554254) (not e!448852))))

(assert (=> b!810976 (= res!554254 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21528 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21107 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21528 a!3170)) (= (select (arr!21107 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810977 () Bool)

(assert (=> b!810977 (= e!448854 (not (= lt!363582 lt!363583)))))

(declare-fun lt!363575 () (_ BitVec 32))

(assert (=> b!810977 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363575 vacantAfter!23 lt!363581 lt!363577 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363575 vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27658 0))(
  ( (Unit!27659) )
))
(declare-fun lt!363578 () Unit!27658)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44072 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27658)

(assert (=> b!810977 (= lt!363578 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363575 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810977 (= lt!363575 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810978 () Bool)

(declare-fun res!554245 () Bool)

(assert (=> b!810978 (=> (not res!554245) (not e!448852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44072 (_ BitVec 32)) Bool)

(assert (=> b!810978 (= res!554245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69576 res!554247) b!810968))

(assert (= (and b!810968 res!554253) b!810974))

(assert (= (and b!810974 res!554248) b!810975))

(assert (= (and b!810975 res!554249) b!810973))

(assert (= (and b!810973 res!554244) b!810970))

(assert (= (and b!810970 res!554255) b!810978))

(assert (= (and b!810978 res!554245) b!810972))

(assert (= (and b!810972 res!554251) b!810976))

(assert (= (and b!810976 res!554254) b!810969))

(assert (= (and b!810969 res!554246) b!810967))

(assert (= (and b!810967 res!554252) b!810971))

(assert (= (and b!810971 res!554250) b!810977))

(declare-fun m!753273 () Bool)

(assert (=> b!810969 m!753273))

(declare-fun m!753275 () Bool)

(assert (=> b!810969 m!753275))

(declare-fun m!753277 () Bool)

(assert (=> b!810969 m!753277))

(declare-fun m!753279 () Bool)

(assert (=> b!810969 m!753279))

(declare-fun m!753281 () Bool)

(assert (=> b!810978 m!753281))

(declare-fun m!753283 () Bool)

(assert (=> b!810977 m!753283))

(declare-fun m!753285 () Bool)

(assert (=> b!810977 m!753285))

(declare-fun m!753287 () Bool)

(assert (=> b!810977 m!753287))

(declare-fun m!753289 () Bool)

(assert (=> b!810977 m!753289))

(declare-fun m!753291 () Bool)

(assert (=> b!810977 m!753291))

(assert (=> b!810977 m!753289))

(declare-fun m!753293 () Bool)

(assert (=> b!810975 m!753293))

(declare-fun m!753295 () Bool)

(assert (=> b!810976 m!753295))

(declare-fun m!753297 () Bool)

(assert (=> b!810976 m!753297))

(declare-fun m!753299 () Bool)

(assert (=> b!810972 m!753299))

(assert (=> b!810967 m!753289))

(assert (=> b!810967 m!753289))

(declare-fun m!753301 () Bool)

(assert (=> b!810967 m!753301))

(assert (=> b!810967 m!753289))

(declare-fun m!753303 () Bool)

(assert (=> b!810967 m!753303))

(declare-fun m!753305 () Bool)

(assert (=> b!810973 m!753305))

(assert (=> b!810974 m!753289))

(assert (=> b!810974 m!753289))

(declare-fun m!753307 () Bool)

(assert (=> b!810974 m!753307))

(declare-fun m!753309 () Bool)

(assert (=> b!810970 m!753309))

(declare-fun m!753311 () Bool)

(assert (=> start!69576 m!753311))

(declare-fun m!753313 () Bool)

(assert (=> start!69576 m!753313))

(declare-fun m!753315 () Bool)

(assert (=> b!810971 m!753315))

(assert (=> b!810971 m!753289))

(push 1)

(assert (not b!810972))

(assert (not start!69576))

(assert (not b!810977))

(assert (not b!810969))

(assert (not b!810973))

(assert (not b!810970))

(assert (not b!810978))

(assert (not b!810967))

(assert (not b!810975))

(assert (not b!810974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104105 () Bool)

(declare-fun res!554267 () Bool)

(declare-fun e!448881 () Bool)

(assert (=> d!104105 (=> res!554267 e!448881)))

(assert (=> d!104105 (= res!554267 (bvsge #b00000000000000000000000000000000 (size!21528 a!3170)))))

(assert (=> d!104105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448881)))

(declare-fun b!811017 () Bool)

(declare-fun e!448883 () Bool)

(assert (=> b!811017 (= e!448881 e!448883)))

(declare-fun c!88786 () Bool)

(assert (=> b!811017 (= c!88786 (validKeyInArray!0 (select (arr!21107 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811018 () Bool)

(declare-fun e!448882 () Bool)

(assert (=> b!811018 (= e!448883 e!448882)))

(declare-fun lt!363604 () (_ BitVec 64))

(assert (=> b!811018 (= lt!363604 (select (arr!21107 a!3170) #b00000000000000000000000000000000))))

(declare-fun lt!363608 () Unit!27658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44072 (_ BitVec 64) (_ BitVec 32)) Unit!27658)

(assert (=> b!811018 (= lt!363608 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363604 #b00000000000000000000000000000000))))

(assert (=> b!811018 (arrayContainsKey!0 a!3170 lt!363604 #b00000000000000000000000000000000)))

(declare-fun lt!363607 () Unit!27658)

(assert (=> b!811018 (= lt!363607 lt!363608)))

(declare-fun res!554266 () Bool)

(assert (=> b!811018 (= res!554266 (= (seekEntryOrOpen!0 (select (arr!21107 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8698 #b00000000000000000000000000000000)))))

(assert (=> b!811018 (=> (not res!554266) (not e!448882))))

(declare-fun b!811019 () Bool)

(declare-fun call!35460 () Bool)

(assert (=> b!811019 (= e!448883 call!35460)))

(declare-fun bm!35457 () Bool)

(assert (=> bm!35457 (= call!35460 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!811020 () Bool)

(assert (=> b!811020 (= e!448882 call!35460)))

(assert (= (and d!104105 (not res!554267)) b!811017))

(assert (= (and b!811017 c!88786) b!811018))

(assert (= (and b!811017 (not c!88786)) b!811019))

(assert (= (and b!811018 res!554266) b!811020))

(assert (= (or b!811020 b!811019) bm!35457))

(declare-fun m!753326 () Bool)

(assert (=> b!811017 m!753326))

(assert (=> b!811017 m!753326))

(declare-fun m!753329 () Bool)

(assert (=> b!811017 m!753329))

(assert (=> b!811018 m!753326))

(declare-fun m!753333 () Bool)

(assert (=> b!811018 m!753333))

(declare-fun m!753337 () Bool)

(assert (=> b!811018 m!753337))

(assert (=> b!811018 m!753326))

(declare-fun m!753341 () Bool)

(assert (=> b!811018 m!753341))

(declare-fun m!753345 () Bool)

(assert (=> bm!35457 m!753345))

(assert (=> b!810978 d!104105))

(declare-fun b!811075 () Bool)

(declare-fun c!88814 () Bool)

(declare-fun lt!363631 () (_ BitVec 64))

(assert (=> b!811075 (= c!88814 (= lt!363631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448912 () SeekEntryResult!8698)

(declare-fun e!448913 () SeekEntryResult!8698)

(assert (=> b!811075 (= e!448912 e!448913)))

(declare-fun b!811076 () Bool)

(declare-fun e!448911 () SeekEntryResult!8698)

(assert (=> b!811076 (= e!448911 Undefined!8698)))

(declare-fun b!811077 () Bool)

(assert (=> b!811077 (= e!448913 (MissingVacant!8698 vacantBefore!23))))

(declare-fun b!811078 () Bool)

(assert (=> b!811078 (= e!448913 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811079 () Bool)

(assert (=> b!811079 (= e!448911 e!448912)))

(declare-fun c!88816 () Bool)

(assert (=> b!811079 (= c!88816 (= lt!363631 (select (arr!21107 a!3170) j!153)))))

(declare-fun d!104109 () Bool)

(declare-fun lt!363630 () SeekEntryResult!8698)

(assert (=> d!104109 (and (or (is-Undefined!8698 lt!363630) (not (is-Found!8698 lt!363630)) (and (bvsge (index!37161 lt!363630) #b00000000000000000000000000000000) (bvslt (index!37161 lt!363630) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363630) (is-Found!8698 lt!363630) (not (is-MissingVacant!8698 lt!363630)) (not (= (index!37163 lt!363630) vacantBefore!23)) (and (bvsge (index!37163 lt!363630) #b00000000000000000000000000000000) (bvslt (index!37163 lt!363630) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363630) (ite (is-Found!8698 lt!363630) (= (select (arr!21107 a!3170) (index!37161 lt!363630)) (select (arr!21107 a!3170) j!153)) (and (is-MissingVacant!8698 lt!363630) (= (index!37163 lt!363630) vacantBefore!23) (= (select (arr!21107 a!3170) (index!37163 lt!363630)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104109 (= lt!363630 e!448911)))

(declare-fun c!88815 () Bool)

(assert (=> d!104109 (= c!88815 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104109 (= lt!363631 (select (arr!21107 a!3170) index!1236))))

(assert (=> d!104109 (validMask!0 mask!3266)))

(assert (=> d!104109 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266) lt!363630)))

(declare-fun b!811080 () Bool)

(assert (=> b!811080 (= e!448912 (Found!8698 index!1236))))

(assert (= (and d!104109 c!88815) b!811076))

(assert (= (and d!104109 (not c!88815)) b!811079))

(assert (= (and b!811079 c!88816) b!811080))

(assert (= (and b!811079 (not c!88816)) b!811075))

(assert (= (and b!811075 c!88814) b!811077))

(assert (= (and b!811075 (not c!88814)) b!811078))

(assert (=> b!811078 m!753283))

(assert (=> b!811078 m!753283))

(assert (=> b!811078 m!753289))

(declare-fun m!753381 () Bool)

(assert (=> b!811078 m!753381))

(declare-fun m!753385 () Bool)

(assert (=> d!104109 m!753385))

(declare-fun m!753389 () Bool)

(assert (=> d!104109 m!753389))

(assert (=> d!104109 m!753315))

(assert (=> d!104109 m!753311))

(assert (=> b!810967 d!104109))

(declare-fun b!811135 () Bool)

(declare-fun c!88840 () Bool)

(declare-fun lt!363662 () (_ BitVec 64))

(assert (=> b!811135 (= c!88840 (= lt!363662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448949 () SeekEntryResult!8698)

(declare-fun e!448948 () SeekEntryResult!8698)

(assert (=> b!811135 (= e!448949 e!448948)))

(declare-fun b!811136 () Bool)

(declare-fun e!448947 () SeekEntryResult!8698)

(assert (=> b!811136 (= e!448947 Undefined!8698)))

(declare-fun b!811137 () Bool)

(assert (=> b!811137 (= e!448947 e!448949)))

(declare-fun lt!363664 () SeekEntryResult!8698)

(assert (=> b!811137 (= lt!363662 (select (arr!21107 a!3170) (index!37162 lt!363664)))))

(declare-fun c!88839 () Bool)

(assert (=> b!811137 (= c!88839 (= lt!363662 (select (arr!21107 a!3170) j!153)))))

(declare-fun b!811138 () Bool)

(assert (=> b!811138 (= e!448948 (seekKeyOrZeroReturnVacant!0 (x!67966 lt!363664) (index!37162 lt!363664) (index!37162 lt!363664) (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811139 () Bool)

(assert (=> b!811139 (= e!448949 (Found!8698 (index!37162 lt!363664)))))

(declare-fun d!104121 () Bool)

(declare-fun lt!363663 () SeekEntryResult!8698)

(assert (=> d!104121 (and (or (is-Undefined!8698 lt!363663) (not (is-Found!8698 lt!363663)) (and (bvsge (index!37161 lt!363663) #b00000000000000000000000000000000) (bvslt (index!37161 lt!363663) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363663) (is-Found!8698 lt!363663) (not (is-MissingZero!8698 lt!363663)) (and (bvsge (index!37160 lt!363663) #b00000000000000000000000000000000) (bvslt (index!37160 lt!363663) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363663) (is-Found!8698 lt!363663) (is-MissingZero!8698 lt!363663) (not (is-MissingVacant!8698 lt!363663)) (and (bvsge (index!37163 lt!363663) #b00000000000000000000000000000000) (bvslt (index!37163 lt!363663) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363663) (ite (is-Found!8698 lt!363663) (= (select (arr!21107 a!3170) (index!37161 lt!363663)) (select (arr!21107 a!3170) j!153)) (ite (is-MissingZero!8698 lt!363663) (= (select (arr!21107 a!3170) (index!37160 lt!363663)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8698 lt!363663) (= (select (arr!21107 a!3170) (index!37163 lt!363663)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104121 (= lt!363663 e!448947)))

(declare-fun c!88838 () Bool)

(assert (=> d!104121 (= c!88838 (and (is-Intermediate!8698 lt!363664) (undefined!9510 lt!363664)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44072 (_ BitVec 32)) SeekEntryResult!8698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104121 (= lt!363664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21107 a!3170) j!153) mask!3266) (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104121 (validMask!0 mask!3266)))

(assert (=> d!104121 (= (seekEntryOrOpen!0 (select (arr!21107 a!3170) j!153) a!3170 mask!3266) lt!363663)))

(declare-fun b!811140 () Bool)

(assert (=> b!811140 (= e!448948 (MissingZero!8698 (index!37162 lt!363664)))))

(assert (= (and d!104121 c!88838) b!811136))

(assert (= (and d!104121 (not c!88838)) b!811137))

(assert (= (and b!811137 c!88839) b!811139))

(assert (= (and b!811137 (not c!88839)) b!811135))

(assert (= (and b!811135 c!88840) b!811140))

(assert (= (and b!811135 (not c!88840)) b!811138))

(declare-fun m!753451 () Bool)

(assert (=> b!811137 m!753451))

(assert (=> b!811138 m!753289))

(declare-fun m!753455 () Bool)

(assert (=> b!811138 m!753455))

(declare-fun m!753457 () Bool)

(assert (=> d!104121 m!753457))

(declare-fun m!753459 () Bool)

(assert (=> d!104121 m!753459))

(declare-fun m!753461 () Bool)

(assert (=> d!104121 m!753461))

(assert (=> d!104121 m!753289))

(declare-fun m!753463 () Bool)

(assert (=> d!104121 m!753463))

(assert (=> d!104121 m!753463))

(assert (=> d!104121 m!753289))

(declare-fun m!753465 () Bool)

(assert (=> d!104121 m!753465))

(assert (=> d!104121 m!753311))

(assert (=> b!810967 d!104121))

(declare-fun d!104147 () Bool)

(declare-fun res!554284 () Bool)

(declare-fun e!448954 () Bool)

(assert (=> d!104147 (=> res!554284 e!448954)))

(assert (=> d!104147 (= res!554284 (= (select (arr!21107 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!104147 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!448954)))

(declare-fun b!811145 () Bool)

(declare-fun e!448955 () Bool)

(assert (=> b!811145 (= e!448954 e!448955)))

(declare-fun res!554285 () Bool)

(assert (=> b!811145 (=> (not res!554285) (not e!448955))))

(assert (=> b!811145 (= res!554285 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21528 a!3170)))))

(declare-fun b!811146 () Bool)

(assert (=> b!811146 (= e!448955 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104147 (not res!554284)) b!811145))

(assert (= (and b!811145 res!554285) b!811146))

(assert (=> d!104147 m!753326))

(declare-fun m!753467 () Bool)

(assert (=> b!811146 m!753467))

(assert (=> b!810973 d!104147))

(declare-fun d!104149 () Bool)

(assert (=> d!104149 (= (validKeyInArray!0 (select (arr!21107 a!3170) j!153)) (and (not (= (select (arr!21107 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21107 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810974 d!104149))

(declare-fun b!811147 () Bool)

(declare-fun c!88841 () Bool)

(declare-fun lt!363666 () (_ BitVec 64))

(assert (=> b!811147 (= c!88841 (= lt!363666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448957 () SeekEntryResult!8698)

(declare-fun e!448958 () SeekEntryResult!8698)

(assert (=> b!811147 (= e!448957 e!448958)))

(declare-fun b!811148 () Bool)

(declare-fun e!448956 () SeekEntryResult!8698)

(assert (=> b!811148 (= e!448956 Undefined!8698)))

(declare-fun b!811149 () Bool)

(assert (=> b!811149 (= e!448958 (MissingVacant!8698 vacantAfter!23))))

(declare-fun b!811150 () Bool)

(assert (=> b!811150 (= e!448958 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!363581 lt!363577 mask!3266))))

(declare-fun b!811151 () Bool)

(assert (=> b!811151 (= e!448956 e!448957)))

(declare-fun c!88843 () Bool)

(assert (=> b!811151 (= c!88843 (= lt!363666 lt!363581))))

(declare-fun lt!363665 () SeekEntryResult!8698)

(declare-fun d!104151 () Bool)

(assert (=> d!104151 (and (or (is-Undefined!8698 lt!363665) (not (is-Found!8698 lt!363665)) (and (bvsge (index!37161 lt!363665) #b00000000000000000000000000000000) (bvslt (index!37161 lt!363665) (size!21528 lt!363577)))) (or (is-Undefined!8698 lt!363665) (is-Found!8698 lt!363665) (not (is-MissingVacant!8698 lt!363665)) (not (= (index!37163 lt!363665) vacantAfter!23)) (and (bvsge (index!37163 lt!363665) #b00000000000000000000000000000000) (bvslt (index!37163 lt!363665) (size!21528 lt!363577)))) (or (is-Undefined!8698 lt!363665) (ite (is-Found!8698 lt!363665) (= (select (arr!21107 lt!363577) (index!37161 lt!363665)) lt!363581) (and (is-MissingVacant!8698 lt!363665) (= (index!37163 lt!363665) vacantAfter!23) (= (select (arr!21107 lt!363577) (index!37163 lt!363665)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104151 (= lt!363665 e!448956)))

(declare-fun c!88842 () Bool)

(assert (=> d!104151 (= c!88842 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104151 (= lt!363666 (select (arr!21107 lt!363577) index!1236))))

(assert (=> d!104151 (validMask!0 mask!3266)))

(assert (=> d!104151 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363581 lt!363577 mask!3266) lt!363665)))

(declare-fun b!811152 () Bool)

(assert (=> b!811152 (= e!448957 (Found!8698 index!1236))))

(assert (= (and d!104151 c!88842) b!811148))

(assert (= (and d!104151 (not c!88842)) b!811151))

(assert (= (and b!811151 c!88843) b!811152))

(assert (= (and b!811151 (not c!88843)) b!811147))

(assert (= (and b!811147 c!88841) b!811149))

(assert (= (and b!811147 (not c!88841)) b!811150))

(assert (=> b!811150 m!753283))

(assert (=> b!811150 m!753283))

(declare-fun m!753469 () Bool)

(assert (=> b!811150 m!753469))

(declare-fun m!753471 () Bool)

(assert (=> d!104151 m!753471))

(declare-fun m!753473 () Bool)

(assert (=> d!104151 m!753473))

(declare-fun m!753475 () Bool)

(assert (=> d!104151 m!753475))

(assert (=> d!104151 m!753311))

(assert (=> b!810969 d!104151))

(declare-fun b!811153 () Bool)

(declare-fun c!88846 () Bool)

(declare-fun lt!363667 () (_ BitVec 64))

(assert (=> b!811153 (= c!88846 (= lt!363667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448961 () SeekEntryResult!8698)

(declare-fun e!448960 () SeekEntryResult!8698)

(assert (=> b!811153 (= e!448961 e!448960)))

(declare-fun b!811154 () Bool)

(declare-fun e!448959 () SeekEntryResult!8698)

(assert (=> b!811154 (= e!448959 Undefined!8698)))

(declare-fun b!811155 () Bool)

(assert (=> b!811155 (= e!448959 e!448961)))

(declare-fun lt!363669 () SeekEntryResult!8698)

(assert (=> b!811155 (= lt!363667 (select (arr!21107 lt!363577) (index!37162 lt!363669)))))

(declare-fun c!88845 () Bool)

(assert (=> b!811155 (= c!88845 (= lt!363667 lt!363581))))

(declare-fun b!811156 () Bool)

(assert (=> b!811156 (= e!448960 (seekKeyOrZeroReturnVacant!0 (x!67966 lt!363669) (index!37162 lt!363669) (index!37162 lt!363669) lt!363581 lt!363577 mask!3266))))

(declare-fun b!811157 () Bool)

(assert (=> b!811157 (= e!448961 (Found!8698 (index!37162 lt!363669)))))

(declare-fun d!104153 () Bool)

(declare-fun lt!363668 () SeekEntryResult!8698)

(assert (=> d!104153 (and (or (is-Undefined!8698 lt!363668) (not (is-Found!8698 lt!363668)) (and (bvsge (index!37161 lt!363668) #b00000000000000000000000000000000) (bvslt (index!37161 lt!363668) (size!21528 lt!363577)))) (or (is-Undefined!8698 lt!363668) (is-Found!8698 lt!363668) (not (is-MissingZero!8698 lt!363668)) (and (bvsge (index!37160 lt!363668) #b00000000000000000000000000000000) (bvslt (index!37160 lt!363668) (size!21528 lt!363577)))) (or (is-Undefined!8698 lt!363668) (is-Found!8698 lt!363668) (is-MissingZero!8698 lt!363668) (not (is-MissingVacant!8698 lt!363668)) (and (bvsge (index!37163 lt!363668) #b00000000000000000000000000000000) (bvslt (index!37163 lt!363668) (size!21528 lt!363577)))) (or (is-Undefined!8698 lt!363668) (ite (is-Found!8698 lt!363668) (= (select (arr!21107 lt!363577) (index!37161 lt!363668)) lt!363581) (ite (is-MissingZero!8698 lt!363668) (= (select (arr!21107 lt!363577) (index!37160 lt!363668)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8698 lt!363668) (= (select (arr!21107 lt!363577) (index!37163 lt!363668)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104153 (= lt!363668 e!448959)))

(declare-fun c!88844 () Bool)

(assert (=> d!104153 (= c!88844 (and (is-Intermediate!8698 lt!363669) (undefined!9510 lt!363669)))))

(assert (=> d!104153 (= lt!363669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!363581 mask!3266) lt!363581 lt!363577 mask!3266))))

(assert (=> d!104153 (validMask!0 mask!3266)))

(assert (=> d!104153 (= (seekEntryOrOpen!0 lt!363581 lt!363577 mask!3266) lt!363668)))

(declare-fun b!811158 () Bool)

(assert (=> b!811158 (= e!448960 (MissingZero!8698 (index!37162 lt!363669)))))

(assert (= (and d!104153 c!88844) b!811154))

(assert (= (and d!104153 (not c!88844)) b!811155))

(assert (= (and b!811155 c!88845) b!811157))

(assert (= (and b!811155 (not c!88845)) b!811153))

(assert (= (and b!811153 c!88846) b!811158))

(assert (= (and b!811153 (not c!88846)) b!811156))

(declare-fun m!753477 () Bool)

(assert (=> b!811155 m!753477))

(declare-fun m!753479 () Bool)

(assert (=> b!811156 m!753479))

(declare-fun m!753481 () Bool)

(assert (=> d!104153 m!753481))

(declare-fun m!753483 () Bool)

(assert (=> d!104153 m!753483))

(declare-fun m!753485 () Bool)

(assert (=> d!104153 m!753485))

(declare-fun m!753487 () Bool)

(assert (=> d!104153 m!753487))

(assert (=> d!104153 m!753487))

(declare-fun m!753489 () Bool)

(assert (=> d!104153 m!753489))

(assert (=> d!104153 m!753311))

(assert (=> b!810969 d!104153))

(declare-fun b!811165 () Bool)

(declare-fun c!88851 () Bool)

(declare-fun lt!363676 () (_ BitVec 64))

(assert (=> b!811165 (= c!88851 (= lt!363676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448968 () SeekEntryResult!8698)

(declare-fun e!448967 () SeekEntryResult!8698)

(assert (=> b!811165 (= e!448968 e!448967)))

(declare-fun b!811166 () Bool)

(declare-fun e!448966 () SeekEntryResult!8698)

(assert (=> b!811166 (= e!448966 Undefined!8698)))

(declare-fun b!811167 () Bool)

(assert (=> b!811167 (= e!448966 e!448968)))

(declare-fun lt!363678 () SeekEntryResult!8698)

(assert (=> b!811167 (= lt!363676 (select (arr!21107 a!3170) (index!37162 lt!363678)))))

(declare-fun c!88850 () Bool)

(assert (=> b!811167 (= c!88850 (= lt!363676 k!2044))))

(declare-fun b!811168 () Bool)

(assert (=> b!811168 (= e!448967 (seekKeyOrZeroReturnVacant!0 (x!67966 lt!363678) (index!37162 lt!363678) (index!37162 lt!363678) k!2044 a!3170 mask!3266))))

(declare-fun b!811169 () Bool)

(assert (=> b!811169 (= e!448968 (Found!8698 (index!37162 lt!363678)))))

(declare-fun d!104155 () Bool)

(declare-fun lt!363677 () SeekEntryResult!8698)

(assert (=> d!104155 (and (or (is-Undefined!8698 lt!363677) (not (is-Found!8698 lt!363677)) (and (bvsge (index!37161 lt!363677) #b00000000000000000000000000000000) (bvslt (index!37161 lt!363677) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363677) (is-Found!8698 lt!363677) (not (is-MissingZero!8698 lt!363677)) (and (bvsge (index!37160 lt!363677) #b00000000000000000000000000000000) (bvslt (index!37160 lt!363677) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363677) (is-Found!8698 lt!363677) (is-MissingZero!8698 lt!363677) (not (is-MissingVacant!8698 lt!363677)) (and (bvsge (index!37163 lt!363677) #b00000000000000000000000000000000) (bvslt (index!37163 lt!363677) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363677) (ite (is-Found!8698 lt!363677) (= (select (arr!21107 a!3170) (index!37161 lt!363677)) k!2044) (ite (is-MissingZero!8698 lt!363677) (= (select (arr!21107 a!3170) (index!37160 lt!363677)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8698 lt!363677) (= (select (arr!21107 a!3170) (index!37163 lt!363677)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104155 (= lt!363677 e!448966)))

(declare-fun c!88849 () Bool)

(assert (=> d!104155 (= c!88849 (and (is-Intermediate!8698 lt!363678) (undefined!9510 lt!363678)))))

(assert (=> d!104155 (= lt!363678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!104155 (validMask!0 mask!3266)))

(assert (=> d!104155 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!363677)))

(declare-fun b!811170 () Bool)

(assert (=> b!811170 (= e!448967 (MissingZero!8698 (index!37162 lt!363678)))))

(assert (= (and d!104155 c!88849) b!811166))

(assert (= (and d!104155 (not c!88849)) b!811167))

(assert (= (and b!811167 c!88850) b!811169))

(assert (= (and b!811167 (not c!88850)) b!811165))

(assert (= (and b!811165 c!88851) b!811170))

(assert (= (and b!811165 (not c!88851)) b!811168))

(declare-fun m!753491 () Bool)

(assert (=> b!811167 m!753491))

(declare-fun m!753493 () Bool)

(assert (=> b!811168 m!753493))

(declare-fun m!753495 () Bool)

(assert (=> d!104155 m!753495))

(declare-fun m!753497 () Bool)

(assert (=> d!104155 m!753497))

(declare-fun m!753499 () Bool)

(assert (=> d!104155 m!753499))

(declare-fun m!753501 () Bool)

(assert (=> d!104155 m!753501))

(assert (=> d!104155 m!753501))

(declare-fun m!753503 () Bool)

(assert (=> d!104155 m!753503))

(assert (=> d!104155 m!753311))

(assert (=> b!810970 d!104155))

(declare-fun d!104157 () Bool)

(assert (=> d!104157 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69576 d!104157))

(declare-fun d!104169 () Bool)

(assert (=> d!104169 (= (array_inv!16903 a!3170) (bvsge (size!21528 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69576 d!104169))

(declare-fun d!104171 () Bool)

(assert (=> d!104171 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810975 d!104171))

(declare-fun b!811193 () Bool)

(declare-fun e!448988 () Bool)

(declare-fun call!35466 () Bool)

(assert (=> b!811193 (= e!448988 call!35466)))

(declare-fun b!811194 () Bool)

(assert (=> b!811194 (= e!448988 call!35466)))

(declare-fun b!811195 () Bool)

(declare-fun e!448989 () Bool)

(declare-fun e!448990 () Bool)

(assert (=> b!811195 (= e!448989 e!448990)))

(declare-fun res!554305 () Bool)

(assert (=> b!811195 (=> (not res!554305) (not e!448990))))

(declare-fun e!448991 () Bool)

(assert (=> b!811195 (= res!554305 (not e!448991))))

(declare-fun res!554306 () Bool)

(assert (=> b!811195 (=> (not res!554306) (not e!448991))))

(assert (=> b!811195 (= res!554306 (validKeyInArray!0 (select (arr!21107 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811196 () Bool)

(declare-fun contains!4138 (List!15070 (_ BitVec 64)) Bool)

(assert (=> b!811196 (= e!448991 (contains!4138 Nil!15067 (select (arr!21107 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!104173 () Bool)

(declare-fun res!554304 () Bool)

(assert (=> d!104173 (=> res!554304 e!448989)))

(assert (=> d!104173 (= res!554304 (bvsge #b00000000000000000000000000000000 (size!21528 a!3170)))))

(assert (=> d!104173 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15067) e!448989)))

(declare-fun bm!35463 () Bool)

(declare-fun c!88855 () Bool)

(assert (=> bm!35463 (= call!35466 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88855 (Cons!15066 (select (arr!21107 a!3170) #b00000000000000000000000000000000) Nil!15067) Nil!15067)))))

(declare-fun b!811197 () Bool)

(assert (=> b!811197 (= e!448990 e!448988)))

(assert (=> b!811197 (= c!88855 (validKeyInArray!0 (select (arr!21107 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!104173 (not res!554304)) b!811195))

(assert (= (and b!811195 res!554306) b!811196))

(assert (= (and b!811195 res!554305) b!811197))

(assert (= (and b!811197 c!88855) b!811194))

(assert (= (and b!811197 (not c!88855)) b!811193))

(assert (= (or b!811194 b!811193) bm!35463))

(assert (=> b!811195 m!753326))

(assert (=> b!811195 m!753326))

(assert (=> b!811195 m!753329))

(assert (=> b!811196 m!753326))

(assert (=> b!811196 m!753326))

(declare-fun m!753519 () Bool)

(assert (=> b!811196 m!753519))

(assert (=> bm!35463 m!753326))

(declare-fun m!753521 () Bool)

(assert (=> bm!35463 m!753521))

(assert (=> b!811197 m!753326))

(assert (=> b!811197 m!753326))

(assert (=> b!811197 m!753329))

(assert (=> b!810972 d!104173))

(declare-fun b!811198 () Bool)

(declare-fun c!88856 () Bool)

(declare-fun lt!363683 () (_ BitVec 64))

(assert (=> b!811198 (= c!88856 (= lt!363683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448993 () SeekEntryResult!8698)

(declare-fun e!448994 () SeekEntryResult!8698)

(assert (=> b!811198 (= e!448993 e!448994)))

(declare-fun b!811199 () Bool)

(declare-fun e!448992 () SeekEntryResult!8698)

(assert (=> b!811199 (= e!448992 Undefined!8698)))

(declare-fun b!811200 () Bool)

(assert (=> b!811200 (= e!448994 (MissingVacant!8698 vacantAfter!23))))

(declare-fun b!811201 () Bool)

(assert (=> b!811201 (= e!448994 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363575 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!363581 lt!363577 mask!3266))))

(declare-fun b!811202 () Bool)

(assert (=> b!811202 (= e!448992 e!448993)))

(declare-fun c!88858 () Bool)

(assert (=> b!811202 (= c!88858 (= lt!363683 lt!363581))))

(declare-fun d!104179 () Bool)

(declare-fun lt!363682 () SeekEntryResult!8698)

(assert (=> d!104179 (and (or (is-Undefined!8698 lt!363682) (not (is-Found!8698 lt!363682)) (and (bvsge (index!37161 lt!363682) #b00000000000000000000000000000000) (bvslt (index!37161 lt!363682) (size!21528 lt!363577)))) (or (is-Undefined!8698 lt!363682) (is-Found!8698 lt!363682) (not (is-MissingVacant!8698 lt!363682)) (not (= (index!37163 lt!363682) vacantAfter!23)) (and (bvsge (index!37163 lt!363682) #b00000000000000000000000000000000) (bvslt (index!37163 lt!363682) (size!21528 lt!363577)))) (or (is-Undefined!8698 lt!363682) (ite (is-Found!8698 lt!363682) (= (select (arr!21107 lt!363577) (index!37161 lt!363682)) lt!363581) (and (is-MissingVacant!8698 lt!363682) (= (index!37163 lt!363682) vacantAfter!23) (= (select (arr!21107 lt!363577) (index!37163 lt!363682)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104179 (= lt!363682 e!448992)))

(declare-fun c!88857 () Bool)

(assert (=> d!104179 (= c!88857 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104179 (= lt!363683 (select (arr!21107 lt!363577) lt!363575))))

(assert (=> d!104179 (validMask!0 mask!3266)))

(assert (=> d!104179 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363575 vacantAfter!23 lt!363581 lt!363577 mask!3266) lt!363682)))

(declare-fun b!811203 () Bool)

(assert (=> b!811203 (= e!448993 (Found!8698 lt!363575))))

(assert (= (and d!104179 c!88857) b!811199))

(assert (= (and d!104179 (not c!88857)) b!811202))

(assert (= (and b!811202 c!88858) b!811203))

(assert (= (and b!811202 (not c!88858)) b!811198))

(assert (= (and b!811198 c!88856) b!811200))

(assert (= (and b!811198 (not c!88856)) b!811201))

(declare-fun m!753523 () Bool)

(assert (=> b!811201 m!753523))

(assert (=> b!811201 m!753523))

(declare-fun m!753525 () Bool)

(assert (=> b!811201 m!753525))

(declare-fun m!753527 () Bool)

(assert (=> d!104179 m!753527))

(declare-fun m!753529 () Bool)

(assert (=> d!104179 m!753529))

(declare-fun m!753531 () Bool)

(assert (=> d!104179 m!753531))

(assert (=> d!104179 m!753311))

(assert (=> b!810977 d!104179))

(declare-fun b!811216 () Bool)

(declare-fun c!88865 () Bool)

(declare-fun lt!363691 () (_ BitVec 64))

(assert (=> b!811216 (= c!88865 (= lt!363691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449002 () SeekEntryResult!8698)

(declare-fun e!449003 () SeekEntryResult!8698)

(assert (=> b!811216 (= e!449002 e!449003)))

(declare-fun b!811217 () Bool)

(declare-fun e!449001 () SeekEntryResult!8698)

(assert (=> b!811217 (= e!449001 Undefined!8698)))

(declare-fun b!811218 () Bool)

(assert (=> b!811218 (= e!449003 (MissingVacant!8698 vacantBefore!23))))

(declare-fun b!811219 () Bool)

(assert (=> b!811219 (= e!449003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363575 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811220 () Bool)

(assert (=> b!811220 (= e!449001 e!449002)))

(declare-fun c!88867 () Bool)

(assert (=> b!811220 (= c!88867 (= lt!363691 (select (arr!21107 a!3170) j!153)))))

(declare-fun d!104181 () Bool)

(declare-fun lt!363690 () SeekEntryResult!8698)

(assert (=> d!104181 (and (or (is-Undefined!8698 lt!363690) (not (is-Found!8698 lt!363690)) (and (bvsge (index!37161 lt!363690) #b00000000000000000000000000000000) (bvslt (index!37161 lt!363690) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363690) (is-Found!8698 lt!363690) (not (is-MissingVacant!8698 lt!363690)) (not (= (index!37163 lt!363690) vacantBefore!23)) (and (bvsge (index!37163 lt!363690) #b00000000000000000000000000000000) (bvslt (index!37163 lt!363690) (size!21528 a!3170)))) (or (is-Undefined!8698 lt!363690) (ite (is-Found!8698 lt!363690) (= (select (arr!21107 a!3170) (index!37161 lt!363690)) (select (arr!21107 a!3170) j!153)) (and (is-MissingVacant!8698 lt!363690) (= (index!37163 lt!363690) vacantBefore!23) (= (select (arr!21107 a!3170) (index!37163 lt!363690)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104181 (= lt!363690 e!449001)))

(declare-fun c!88866 () Bool)

(assert (=> d!104181 (= c!88866 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104181 (= lt!363691 (select (arr!21107 a!3170) lt!363575))))

(assert (=> d!104181 (validMask!0 mask!3266)))

(assert (=> d!104181 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363575 vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266) lt!363690)))

(declare-fun b!811221 () Bool)

(assert (=> b!811221 (= e!449002 (Found!8698 lt!363575))))

(assert (= (and d!104181 c!88866) b!811217))

(assert (= (and d!104181 (not c!88866)) b!811220))

(assert (= (and b!811220 c!88867) b!811221))

(assert (= (and b!811220 (not c!88867)) b!811216))

(assert (= (and b!811216 c!88865) b!811218))

(assert (= (and b!811216 (not c!88865)) b!811219))

(assert (=> b!811219 m!753523))

(assert (=> b!811219 m!753523))

(assert (=> b!811219 m!753289))

(declare-fun m!753533 () Bool)

(assert (=> b!811219 m!753533))

(declare-fun m!753535 () Bool)

(assert (=> d!104181 m!753535))

(declare-fun m!753537 () Bool)

(assert (=> d!104181 m!753537))

(declare-fun m!753539 () Bool)

(assert (=> d!104181 m!753539))

(assert (=> d!104181 m!753311))

(assert (=> b!810977 d!104181))

(declare-fun d!104183 () Bool)

(declare-fun e!449041 () Bool)

(assert (=> d!104183 e!449041))

(declare-fun res!554324 () Bool)

(assert (=> d!104183 (=> (not res!554324) (not e!449041))))

(assert (=> d!104183 (= res!554324 (and (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21528 a!3170)) (and (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21528 a!3170)))) (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21528 a!3170)) (and (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21528 a!3170)))) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21528 a!3170))))))

(declare-fun lt!363707 () Unit!27658)

(declare-fun choose!112 (array!44072 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27658)

(assert (=> d!104183 (= lt!363707 (choose!112 a!3170 i!1163 k!2044 j!153 lt!363575 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(assert (=> d!104183 (validMask!0 mask!3266)))

(assert (=> d!104183 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363575 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266) lt!363707)))

(declare-fun b!811279 () Bool)

(assert (=> b!811279 (= e!449041 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363575 vacantAfter!23 (select (store (arr!21107 a!3170) i!1163 k!2044) j!153) (array!44073 (store (arr!21107 a!3170) i!1163 k!2044) (size!21528 a!3170)) mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363575 vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266)))))

(assert (= (and d!104183 res!554324) b!811279))

(declare-fun m!753601 () Bool)

(assert (=> d!104183 m!753601))

(assert (=> d!104183 m!753311))

(assert (=> b!811279 m!753277))

(assert (=> b!811279 m!753279))

(assert (=> b!811279 m!753279))

(declare-fun m!753603 () Bool)

(assert (=> b!811279 m!753603))

(assert (=> b!811279 m!753289))

(assert (=> b!811279 m!753289))

(assert (=> b!811279 m!753291))

(assert (=> b!810977 d!104183))

(declare-fun d!104195 () Bool)

(declare-fun lt!363710 () (_ BitVec 32))

(assert (=> d!104195 (and (bvsge lt!363710 #b00000000000000000000000000000000) (bvslt lt!363710 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104195 (= lt!363710 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!104195 (validMask!0 mask!3266)))

(assert (=> d!104195 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!363710)))

(declare-fun bs!22452 () Bool)

(assert (= bs!22452 d!104195))

(declare-fun m!753609 () Bool)

(assert (=> bs!22452 m!753609))

(assert (=> bs!22452 m!753311))

(assert (=> b!810977 d!104195))

(push 1)

(assert (not d!104155))

(assert (not d!104195))

(assert (not d!104109))

(assert (not b!811196))

(assert (not b!811219))

(assert (not b!811156))

(assert (not b!811195))

(assert (not d!104153))

(assert (not d!104151))

(assert (not b!811018))

(assert (not d!104181))

(assert (not b!811078))

(assert (not b!811168))

(assert (not bm!35463))

(assert (not b!811138))

(assert (not b!811197))

(assert (not b!811146))

(assert (not b!811201))

(assert (not d!104179))

(assert (not bm!35457))

(assert (not b!811150))

(assert (not d!104121))

(assert (not d!104183))

(assert (not b!811017))

(assert (not b!811279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

