; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56724 () Bool)

(assert start!56724)

(declare-fun b!628450 () Bool)

(declare-fun res!406053 () Bool)

(declare-fun e!359604 () Bool)

(assert (=> b!628450 (=> (not res!406053) (not e!359604))))

(declare-datatypes ((array!37959 0))(
  ( (array!37960 (arr!18217 (Array (_ BitVec 32) (_ BitVec 64))) (size!18581 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37959)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628450 (= res!406053 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628451 () Bool)

(declare-fun res!406049 () Bool)

(assert (=> b!628451 (=> (not res!406049) (not e!359604))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628451 (= res!406049 (and (= (size!18581 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18581 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18581 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628452 () Bool)

(declare-fun e!359603 () Bool)

(assert (=> b!628452 (= e!359604 e!359603)))

(declare-fun res!406045 () Bool)

(assert (=> b!628452 (=> (not res!406045) (not e!359603))))

(declare-datatypes ((SeekEntryResult!6613 0))(
  ( (MissingZero!6613 (index!28736 (_ BitVec 32))) (Found!6613 (index!28737 (_ BitVec 32))) (Intermediate!6613 (undefined!7425 Bool) (index!28738 (_ BitVec 32)) (x!57620 (_ BitVec 32))) (Undefined!6613) (MissingVacant!6613 (index!28739 (_ BitVec 32))) )
))
(declare-fun lt!290527 () SeekEntryResult!6613)

(assert (=> b!628452 (= res!406045 (or (= lt!290527 (MissingZero!6613 i!1108)) (= lt!290527 (MissingVacant!6613 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37959 (_ BitVec 32)) SeekEntryResult!6613)

(assert (=> b!628452 (= lt!290527 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628453 () Bool)

(declare-fun res!406048 () Bool)

(assert (=> b!628453 (=> (not res!406048) (not e!359603))))

(declare-datatypes ((List!12165 0))(
  ( (Nil!12162) (Cons!12161 (h!13209 (_ BitVec 64)) (t!18385 List!12165)) )
))
(declare-fun arrayNoDuplicates!0 (array!37959 (_ BitVec 32) List!12165) Bool)

(assert (=> b!628453 (= res!406048 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12162))))

(declare-fun b!628454 () Bool)

(declare-fun res!406044 () Bool)

(assert (=> b!628454 (=> (not res!406044) (not e!359604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628454 (= res!406044 (validKeyInArray!0 (select (arr!18217 a!2986) j!136)))))

(declare-fun b!628455 () Bool)

(declare-fun res!406052 () Bool)

(assert (=> b!628455 (=> (not res!406052) (not e!359603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37959 (_ BitVec 32)) Bool)

(assert (=> b!628455 (= res!406052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628456 () Bool)

(declare-fun res!406046 () Bool)

(assert (=> b!628456 (=> (not res!406046) (not e!359604))))

(assert (=> b!628456 (= res!406046 (validKeyInArray!0 k0!1786))))

(declare-fun b!628457 () Bool)

(declare-fun res!406054 () Bool)

(assert (=> b!628457 (=> (not res!406054) (not e!359603))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628457 (= res!406054 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18217 a!2986) index!984) (select (arr!18217 a!2986) j!136))) (not (= (select (arr!18217 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628449 () Bool)

(declare-fun lt!290526 () (_ BitVec 32))

(assert (=> b!628449 (= e!359603 (or (bvslt lt!290526 #b00000000000000000000000000000000) (bvsge lt!290526 (bvadd mask!3053 #b00000000000000000000000000000001))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628449 (= lt!290526 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!406047 () Bool)

(assert (=> start!56724 (=> (not res!406047) (not e!359604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56724 (= res!406047 (validMask!0 mask!3053))))

(assert (=> start!56724 e!359604))

(assert (=> start!56724 true))

(declare-fun array_inv!14076 (array!37959) Bool)

(assert (=> start!56724 (array_inv!14076 a!2986)))

(declare-fun b!628458 () Bool)

(declare-fun res!406050 () Bool)

(assert (=> b!628458 (=> (not res!406050) (not e!359603))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37959 (_ BitVec 32)) SeekEntryResult!6613)

(assert (=> b!628458 (= res!406050 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18217 a!2986) j!136) a!2986 mask!3053) (Found!6613 j!136)))))

(declare-fun b!628459 () Bool)

(declare-fun res!406051 () Bool)

(assert (=> b!628459 (=> (not res!406051) (not e!359603))))

(assert (=> b!628459 (= res!406051 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18217 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18217 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56724 res!406047) b!628451))

(assert (= (and b!628451 res!406049) b!628454))

(assert (= (and b!628454 res!406044) b!628456))

(assert (= (and b!628456 res!406046) b!628450))

(assert (= (and b!628450 res!406053) b!628452))

(assert (= (and b!628452 res!406045) b!628455))

(assert (= (and b!628455 res!406052) b!628453))

(assert (= (and b!628453 res!406048) b!628459))

(assert (= (and b!628459 res!406051) b!628458))

(assert (= (and b!628458 res!406050) b!628457))

(assert (= (and b!628457 res!406054) b!628449))

(declare-fun m!603967 () Bool)

(assert (=> b!628457 m!603967))

(declare-fun m!603969 () Bool)

(assert (=> b!628457 m!603969))

(assert (=> b!628454 m!603969))

(assert (=> b!628454 m!603969))

(declare-fun m!603971 () Bool)

(assert (=> b!628454 m!603971))

(declare-fun m!603973 () Bool)

(assert (=> start!56724 m!603973))

(declare-fun m!603975 () Bool)

(assert (=> start!56724 m!603975))

(declare-fun m!603977 () Bool)

(assert (=> b!628459 m!603977))

(declare-fun m!603979 () Bool)

(assert (=> b!628459 m!603979))

(declare-fun m!603981 () Bool)

(assert (=> b!628459 m!603981))

(declare-fun m!603983 () Bool)

(assert (=> b!628455 m!603983))

(declare-fun m!603985 () Bool)

(assert (=> b!628452 m!603985))

(assert (=> b!628458 m!603969))

(assert (=> b!628458 m!603969))

(declare-fun m!603987 () Bool)

(assert (=> b!628458 m!603987))

(declare-fun m!603989 () Bool)

(assert (=> b!628456 m!603989))

(declare-fun m!603991 () Bool)

(assert (=> b!628453 m!603991))

(declare-fun m!603993 () Bool)

(assert (=> b!628450 m!603993))

(declare-fun m!603995 () Bool)

(assert (=> b!628449 m!603995))

(check-sat (not b!628455) (not b!628458) (not b!628449) (not start!56724) (not b!628450) (not b!628453) (not b!628452) (not b!628456) (not b!628454))
(check-sat)
(get-model)

(declare-fun d!89103 () Bool)

(declare-fun lt!290542 () (_ BitVec 32))

(assert (=> d!89103 (and (bvsge lt!290542 #b00000000000000000000000000000000) (bvslt lt!290542 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89103 (= lt!290542 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89103 (validMask!0 mask!3053)))

(assert (=> d!89103 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!290542)))

(declare-fun bs!18974 () Bool)

(assert (= bs!18974 d!89103))

(declare-fun m!604057 () Bool)

(assert (=> bs!18974 m!604057))

(assert (=> bs!18974 m!603973))

(assert (=> b!628449 d!89103))

(declare-fun bm!33258 () Bool)

(declare-fun call!33261 () Bool)

(assert (=> bm!33258 (= call!33261 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!628534 () Bool)

(declare-fun e!359630 () Bool)

(assert (=> b!628534 (= e!359630 call!33261)))

(declare-fun d!89105 () Bool)

(declare-fun res!406126 () Bool)

(declare-fun e!359631 () Bool)

(assert (=> d!89105 (=> res!406126 e!359631)))

(assert (=> d!89105 (= res!406126 (bvsge #b00000000000000000000000000000000 (size!18581 a!2986)))))

(assert (=> d!89105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359631)))

(declare-fun b!628535 () Bool)

(assert (=> b!628535 (= e!359631 e!359630)))

(declare-fun c!71573 () Bool)

(assert (=> b!628535 (= c!71573 (validKeyInArray!0 (select (arr!18217 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628536 () Bool)

(declare-fun e!359629 () Bool)

(assert (=> b!628536 (= e!359629 call!33261)))

(declare-fun b!628537 () Bool)

(assert (=> b!628537 (= e!359630 e!359629)))

(declare-fun lt!290549 () (_ BitVec 64))

(assert (=> b!628537 (= lt!290549 (select (arr!18217 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21077 0))(
  ( (Unit!21078) )
))
(declare-fun lt!290550 () Unit!21077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37959 (_ BitVec 64) (_ BitVec 32)) Unit!21077)

(assert (=> b!628537 (= lt!290550 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290549 #b00000000000000000000000000000000))))

(assert (=> b!628537 (arrayContainsKey!0 a!2986 lt!290549 #b00000000000000000000000000000000)))

(declare-fun lt!290551 () Unit!21077)

(assert (=> b!628537 (= lt!290551 lt!290550)))

(declare-fun res!406125 () Bool)

(assert (=> b!628537 (= res!406125 (= (seekEntryOrOpen!0 (select (arr!18217 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6613 #b00000000000000000000000000000000)))))

(assert (=> b!628537 (=> (not res!406125) (not e!359629))))

(assert (= (and d!89105 (not res!406126)) b!628535))

(assert (= (and b!628535 c!71573) b!628537))

(assert (= (and b!628535 (not c!71573)) b!628534))

(assert (= (and b!628537 res!406125) b!628536))

(assert (= (or b!628536 b!628534) bm!33258))

(declare-fun m!604059 () Bool)

(assert (=> bm!33258 m!604059))

(declare-fun m!604061 () Bool)

(assert (=> b!628535 m!604061))

(assert (=> b!628535 m!604061))

(declare-fun m!604063 () Bool)

(assert (=> b!628535 m!604063))

(assert (=> b!628537 m!604061))

(declare-fun m!604065 () Bool)

(assert (=> b!628537 m!604065))

(declare-fun m!604067 () Bool)

(assert (=> b!628537 m!604067))

(assert (=> b!628537 m!604061))

(declare-fun m!604069 () Bool)

(assert (=> b!628537 m!604069))

(assert (=> b!628455 d!89105))

(declare-fun d!89107 () Bool)

(declare-fun res!406131 () Bool)

(declare-fun e!359636 () Bool)

(assert (=> d!89107 (=> res!406131 e!359636)))

(assert (=> d!89107 (= res!406131 (= (select (arr!18217 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89107 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!359636)))

(declare-fun b!628542 () Bool)

(declare-fun e!359637 () Bool)

(assert (=> b!628542 (= e!359636 e!359637)))

(declare-fun res!406132 () Bool)

(assert (=> b!628542 (=> (not res!406132) (not e!359637))))

(assert (=> b!628542 (= res!406132 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18581 a!2986)))))

(declare-fun b!628543 () Bool)

(assert (=> b!628543 (= e!359637 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89107 (not res!406131)) b!628542))

(assert (= (and b!628542 res!406132) b!628543))

(assert (=> d!89107 m!604061))

(declare-fun m!604071 () Bool)

(assert (=> b!628543 m!604071))

(assert (=> b!628450 d!89107))

(declare-fun b!628554 () Bool)

(declare-fun e!359647 () Bool)

(declare-fun call!33264 () Bool)

(assert (=> b!628554 (= e!359647 call!33264)))

(declare-fun b!628555 () Bool)

(declare-fun e!359646 () Bool)

(declare-fun contains!3055 (List!12165 (_ BitVec 64)) Bool)

(assert (=> b!628555 (= e!359646 (contains!3055 Nil!12162 (select (arr!18217 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628556 () Bool)

(declare-fun e!359649 () Bool)

(assert (=> b!628556 (= e!359649 e!359647)))

(declare-fun c!71576 () Bool)

(assert (=> b!628556 (= c!71576 (validKeyInArray!0 (select (arr!18217 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628557 () Bool)

(assert (=> b!628557 (= e!359647 call!33264)))

(declare-fun b!628558 () Bool)

(declare-fun e!359648 () Bool)

(assert (=> b!628558 (= e!359648 e!359649)))

(declare-fun res!406139 () Bool)

(assert (=> b!628558 (=> (not res!406139) (not e!359649))))

(assert (=> b!628558 (= res!406139 (not e!359646))))

(declare-fun res!406140 () Bool)

(assert (=> b!628558 (=> (not res!406140) (not e!359646))))

(assert (=> b!628558 (= res!406140 (validKeyInArray!0 (select (arr!18217 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33261 () Bool)

(assert (=> bm!33261 (= call!33264 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71576 (Cons!12161 (select (arr!18217 a!2986) #b00000000000000000000000000000000) Nil!12162) Nil!12162)))))

(declare-fun d!89109 () Bool)

(declare-fun res!406141 () Bool)

(assert (=> d!89109 (=> res!406141 e!359648)))

(assert (=> d!89109 (= res!406141 (bvsge #b00000000000000000000000000000000 (size!18581 a!2986)))))

(assert (=> d!89109 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12162) e!359648)))

(assert (= (and d!89109 (not res!406141)) b!628558))

(assert (= (and b!628558 res!406140) b!628555))

(assert (= (and b!628558 res!406139) b!628556))

(assert (= (and b!628556 c!71576) b!628557))

(assert (= (and b!628556 (not c!71576)) b!628554))

(assert (= (or b!628557 b!628554) bm!33261))

(assert (=> b!628555 m!604061))

(assert (=> b!628555 m!604061))

(declare-fun m!604073 () Bool)

(assert (=> b!628555 m!604073))

(assert (=> b!628556 m!604061))

(assert (=> b!628556 m!604061))

(assert (=> b!628556 m!604063))

(assert (=> b!628558 m!604061))

(assert (=> b!628558 m!604061))

(assert (=> b!628558 m!604063))

(assert (=> bm!33261 m!604061))

(declare-fun m!604075 () Bool)

(assert (=> bm!33261 m!604075))

(assert (=> b!628453 d!89109))

(declare-fun d!89115 () Bool)

(assert (=> d!89115 (= (validKeyInArray!0 (select (arr!18217 a!2986) j!136)) (and (not (= (select (arr!18217 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18217 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628454 d!89115))

(declare-fun b!628619 () Bool)

(declare-fun e!359695 () SeekEntryResult!6613)

(declare-fun lt!290571 () SeekEntryResult!6613)

(assert (=> b!628619 (= e!359695 (MissingZero!6613 (index!28738 lt!290571)))))

(declare-fun b!628620 () Bool)

(declare-fun e!359696 () SeekEntryResult!6613)

(declare-fun e!359697 () SeekEntryResult!6613)

(assert (=> b!628620 (= e!359696 e!359697)))

(declare-fun lt!290570 () (_ BitVec 64))

(assert (=> b!628620 (= lt!290570 (select (arr!18217 a!2986) (index!28738 lt!290571)))))

(declare-fun c!71593 () Bool)

(assert (=> b!628620 (= c!71593 (= lt!290570 k0!1786))))

(declare-fun b!628621 () Bool)

(declare-fun c!71594 () Bool)

(assert (=> b!628621 (= c!71594 (= lt!290570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628621 (= e!359697 e!359695)))

(declare-fun b!628622 () Bool)

(assert (=> b!628622 (= e!359696 Undefined!6613)))

(declare-fun b!628623 () Bool)

(assert (=> b!628623 (= e!359697 (Found!6613 (index!28738 lt!290571)))))

(declare-fun b!628624 () Bool)

(assert (=> b!628624 (= e!359695 (seekKeyOrZeroReturnVacant!0 (x!57620 lt!290571) (index!28738 lt!290571) (index!28738 lt!290571) k0!1786 a!2986 mask!3053))))

(declare-fun d!89117 () Bool)

(declare-fun lt!290572 () SeekEntryResult!6613)

(get-info :version)

(assert (=> d!89117 (and (or ((_ is Undefined!6613) lt!290572) (not ((_ is Found!6613) lt!290572)) (and (bvsge (index!28737 lt!290572) #b00000000000000000000000000000000) (bvslt (index!28737 lt!290572) (size!18581 a!2986)))) (or ((_ is Undefined!6613) lt!290572) ((_ is Found!6613) lt!290572) (not ((_ is MissingZero!6613) lt!290572)) (and (bvsge (index!28736 lt!290572) #b00000000000000000000000000000000) (bvslt (index!28736 lt!290572) (size!18581 a!2986)))) (or ((_ is Undefined!6613) lt!290572) ((_ is Found!6613) lt!290572) ((_ is MissingZero!6613) lt!290572) (not ((_ is MissingVacant!6613) lt!290572)) (and (bvsge (index!28739 lt!290572) #b00000000000000000000000000000000) (bvslt (index!28739 lt!290572) (size!18581 a!2986)))) (or ((_ is Undefined!6613) lt!290572) (ite ((_ is Found!6613) lt!290572) (= (select (arr!18217 a!2986) (index!28737 lt!290572)) k0!1786) (ite ((_ is MissingZero!6613) lt!290572) (= (select (arr!18217 a!2986) (index!28736 lt!290572)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6613) lt!290572) (= (select (arr!18217 a!2986) (index!28739 lt!290572)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89117 (= lt!290572 e!359696)))

(declare-fun c!71592 () Bool)

(assert (=> d!89117 (= c!71592 (and ((_ is Intermediate!6613) lt!290571) (undefined!7425 lt!290571)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37959 (_ BitVec 32)) SeekEntryResult!6613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89117 (= lt!290571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89117 (validMask!0 mask!3053)))

(assert (=> d!89117 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290572)))

(assert (= (and d!89117 c!71592) b!628622))

(assert (= (and d!89117 (not c!71592)) b!628620))

(assert (= (and b!628620 c!71593) b!628623))

(assert (= (and b!628620 (not c!71593)) b!628621))

(assert (= (and b!628621 c!71594) b!628619))

(assert (= (and b!628621 (not c!71594)) b!628624))

(declare-fun m!604105 () Bool)

(assert (=> b!628620 m!604105))

(declare-fun m!604107 () Bool)

(assert (=> b!628624 m!604107))

(declare-fun m!604109 () Bool)

(assert (=> d!89117 m!604109))

(declare-fun m!604111 () Bool)

(assert (=> d!89117 m!604111))

(declare-fun m!604113 () Bool)

(assert (=> d!89117 m!604113))

(assert (=> d!89117 m!603973))

(assert (=> d!89117 m!604109))

(declare-fun m!604115 () Bool)

(assert (=> d!89117 m!604115))

(declare-fun m!604117 () Bool)

(assert (=> d!89117 m!604117))

(assert (=> b!628452 d!89117))

(declare-fun b!628661 () Bool)

(declare-fun c!71611 () Bool)

(declare-fun lt!290594 () (_ BitVec 64))

(assert (=> b!628661 (= c!71611 (= lt!290594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359720 () SeekEntryResult!6613)

(declare-fun e!359719 () SeekEntryResult!6613)

(assert (=> b!628661 (= e!359720 e!359719)))

(declare-fun lt!290593 () SeekEntryResult!6613)

(declare-fun d!89133 () Bool)

(assert (=> d!89133 (and (or ((_ is Undefined!6613) lt!290593) (not ((_ is Found!6613) lt!290593)) (and (bvsge (index!28737 lt!290593) #b00000000000000000000000000000000) (bvslt (index!28737 lt!290593) (size!18581 a!2986)))) (or ((_ is Undefined!6613) lt!290593) ((_ is Found!6613) lt!290593) (not ((_ is MissingVacant!6613) lt!290593)) (not (= (index!28739 lt!290593) vacantSpotIndex!68)) (and (bvsge (index!28739 lt!290593) #b00000000000000000000000000000000) (bvslt (index!28739 lt!290593) (size!18581 a!2986)))) (or ((_ is Undefined!6613) lt!290593) (ite ((_ is Found!6613) lt!290593) (= (select (arr!18217 a!2986) (index!28737 lt!290593)) (select (arr!18217 a!2986) j!136)) (and ((_ is MissingVacant!6613) lt!290593) (= (index!28739 lt!290593) vacantSpotIndex!68) (= (select (arr!18217 a!2986) (index!28739 lt!290593)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359721 () SeekEntryResult!6613)

(assert (=> d!89133 (= lt!290593 e!359721)))

(declare-fun c!71612 () Bool)

(assert (=> d!89133 (= c!71612 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89133 (= lt!290594 (select (arr!18217 a!2986) index!984))))

(assert (=> d!89133 (validMask!0 mask!3053)))

(assert (=> d!89133 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18217 a!2986) j!136) a!2986 mask!3053) lt!290593)))

(declare-fun b!628662 () Bool)

(assert (=> b!628662 (= e!359719 (MissingVacant!6613 vacantSpotIndex!68))))

(declare-fun b!628663 () Bool)

(assert (=> b!628663 (= e!359721 Undefined!6613)))

(declare-fun b!628664 () Bool)

(assert (=> b!628664 (= e!359720 (Found!6613 index!984))))

(declare-fun b!628665 () Bool)

(assert (=> b!628665 (= e!359719 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18217 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!628666 () Bool)

(assert (=> b!628666 (= e!359721 e!359720)))

(declare-fun c!71610 () Bool)

(assert (=> b!628666 (= c!71610 (= lt!290594 (select (arr!18217 a!2986) j!136)))))

(assert (= (and d!89133 c!71612) b!628663))

(assert (= (and d!89133 (not c!71612)) b!628666))

(assert (= (and b!628666 c!71610) b!628664))

(assert (= (and b!628666 (not c!71610)) b!628661))

(assert (= (and b!628661 c!71611) b!628662))

(assert (= (and b!628661 (not c!71611)) b!628665))

(declare-fun m!604129 () Bool)

(assert (=> d!89133 m!604129))

(declare-fun m!604131 () Bool)

(assert (=> d!89133 m!604131))

(assert (=> d!89133 m!603967))

(assert (=> d!89133 m!603973))

(declare-fun m!604135 () Bool)

(assert (=> b!628665 m!604135))

(assert (=> b!628665 m!604135))

(assert (=> b!628665 m!603969))

(declare-fun m!604139 () Bool)

(assert (=> b!628665 m!604139))

(assert (=> b!628458 d!89133))

(declare-fun d!89141 () Bool)

(assert (=> d!89141 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56724 d!89141))

(declare-fun d!89147 () Bool)

(assert (=> d!89147 (= (array_inv!14076 a!2986) (bvsge (size!18581 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56724 d!89147))

(declare-fun d!89149 () Bool)

(assert (=> d!89149 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628456 d!89149))

(check-sat (not bm!33261) (not d!89133) (not d!89117) (not d!89103) (not b!628537) (not b!628543) (not b!628558) (not b!628535) (not b!628665) (not bm!33258) (not b!628556) (not b!628624) (not b!628555))
(check-sat)
