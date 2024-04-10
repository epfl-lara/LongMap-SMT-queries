; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136414 () Bool)

(assert start!136414)

(declare-fun b!1577406 () Bool)

(declare-fun res!1077669 () Bool)

(declare-fun e!879842 () Bool)

(assert (=> b!1577406 (=> (not res!1077669) (not e!879842))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105605 0))(
  ( (array!105606 (arr!50923 (Array (_ BitVec 32) (_ BitVec 64))) (size!51473 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105605)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577406 (= res!1077669 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51473 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577408 () Bool)

(declare-fun res!1077670 () Bool)

(assert (=> b!1577408 (=> (not res!1077670) (not e!879842))))

(declare-fun k!768 () (_ BitVec 64))

(assert (=> b!1577408 (= res!1077670 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50923 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50923 _keys!610) ee!12) (select (arr!50923 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577409 () Bool)

(declare-datatypes ((SeekEntryResult!13752 0))(
  ( (MissingZero!13752 (index!57406 (_ BitVec 32))) (Found!13752 (index!57407 (_ BitVec 32))) (Intermediate!13752 (undefined!14564 Bool) (index!57408 (_ BitVec 32)) (x!142533 (_ BitVec 32))) (Undefined!13752) (MissingVacant!13752 (index!57409 (_ BitVec 32))) )
))
(declare-fun lt!675985 () SeekEntryResult!13752)

(assert (=> b!1577409 (= e!879842 (and (is-Intermediate!13752 lt!675985) (not (undefined!14564 lt!675985)) (bvslt (x!142533 lt!675985) #b01111111111111111111111111111110) (bvsge (x!142533 lt!675985) #b00000000000000000000000000000000) (bvsge (x!142533 lt!675985) x!458) (or (bvslt (index!57408 lt!675985) #b00000000000000000000000000000000) (bvsge (index!57408 lt!675985) (size!51473 _keys!610)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105605 (_ BitVec 32)) SeekEntryResult!13752)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577409 (= lt!675985 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577407 () Bool)

(declare-fun res!1077671 () Bool)

(assert (=> b!1577407 (=> (not res!1077671) (not e!879842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577407 (= res!1077671 (validKeyInArray!0 k!768))))

(declare-fun res!1077672 () Bool)

(assert (=> start!136414 (=> (not res!1077672) (not e!879842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136414 (= res!1077672 (validMask!0 mask!910))))

(assert (=> start!136414 e!879842))

(assert (=> start!136414 true))

(declare-fun array_inv!39650 (array!105605) Bool)

(assert (=> start!136414 (array_inv!39650 _keys!610)))

(assert (= (and start!136414 res!1077672) b!1577406))

(assert (= (and b!1577406 res!1077669) b!1577407))

(assert (= (and b!1577407 res!1077671) b!1577408))

(assert (= (and b!1577408 res!1077670) b!1577409))

(declare-fun m!1449685 () Bool)

(assert (=> b!1577408 m!1449685))

(declare-fun m!1449687 () Bool)

(assert (=> b!1577409 m!1449687))

(assert (=> b!1577409 m!1449687))

(declare-fun m!1449689 () Bool)

(assert (=> b!1577409 m!1449689))

(declare-fun m!1449691 () Bool)

(assert (=> b!1577407 m!1449691))

(declare-fun m!1449693 () Bool)

(assert (=> start!136414 m!1449693))

(declare-fun m!1449695 () Bool)

(assert (=> start!136414 m!1449695))

(push 1)

(assert (not b!1577409))

(assert (not start!136414))

(assert (not b!1577407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1577479 () Bool)

(declare-fun e!879882 () Bool)

(declare-fun e!879881 () Bool)

(assert (=> b!1577479 (= e!879882 e!879881)))

(declare-fun res!1077714 () Bool)

(declare-fun lt!676005 () SeekEntryResult!13752)

(assert (=> b!1577479 (= res!1077714 (and (is-Intermediate!13752 lt!676005) (not (undefined!14564 lt!676005)) (bvslt (x!142533 lt!676005) #b01111111111111111111111111111110) (bvsge (x!142533 lt!676005) #b00000000000000000000000000000000) (bvsge (x!142533 lt!676005) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577479 (=> (not res!1077714) (not e!879881))))

(declare-fun b!1577480 () Bool)

(assert (=> b!1577480 (and (bvsge (index!57408 lt!676005) #b00000000000000000000000000000000) (bvslt (index!57408 lt!676005) (size!51473 _keys!610)))))

(declare-fun res!1077713 () Bool)

(assert (=> b!1577480 (= res!1077713 (= (select (arr!50923 _keys!610) (index!57408 lt!676005)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879884 () Bool)

(assert (=> b!1577480 (=> res!1077713 e!879884)))

(declare-fun b!1577481 () Bool)

(declare-fun e!879883 () SeekEntryResult!13752)

(assert (=> b!1577481 (= e!879883 (Intermediate!13752 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun d!165865 () Bool)

(assert (=> d!165865 e!879882))

(declare-fun c!146167 () Bool)

(assert (=> d!165865 (= c!146167 (and (is-Intermediate!13752 lt!676005) (undefined!14564 lt!676005)))))

(assert (=> d!165865 (= lt!676005 e!879883)))

(declare-fun c!146169 () Bool)

(assert (=> d!165865 (= c!146169 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676006 () (_ BitVec 64))

(assert (=> d!165865 (= lt!676006 (select (arr!50923 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165865 (validMask!0 mask!910)))

(assert (=> d!165865 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910) lt!676005)))

(declare-fun b!1577482 () Bool)

(assert (=> b!1577482 (= e!879882 (bvsge (x!142533 lt!676005) #b01111111111111111111111111111110))))

(declare-fun b!1577483 () Bool)

(assert (=> b!1577483 (and (bvsge (index!57408 lt!676005) #b00000000000000000000000000000000) (bvslt (index!57408 lt!676005) (size!51473 _keys!610)))))

(declare-fun res!1077712 () Bool)

(assert (=> b!1577483 (= res!1077712 (= (select (arr!50923 _keys!610) (index!57408 lt!676005)) k!768))))

(assert (=> b!1577483 (=> res!1077712 e!879884)))

(assert (=> b!1577483 (= e!879881 e!879884)))

(declare-fun e!879880 () SeekEntryResult!13752)

(declare-fun b!1577484 () Bool)

(assert (=> b!1577484 (= e!879880 (Intermediate!13752 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577485 () Bool)

(assert (=> b!1577485 (= e!879883 e!879880)))

(declare-fun c!146168 () Bool)

(assert (=> b!1577485 (= c!146168 (or (= lt!676006 k!768) (= (bvadd lt!676006 lt!676006) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577486 () Bool)

(assert (=> b!1577486 (= e!879880 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577487 () Bool)

(assert (=> b!1577487 (and (bvsge (index!57408 lt!676005) #b00000000000000000000000000000000) (bvslt (index!57408 lt!676005) (size!51473 _keys!610)))))

(assert (=> b!1577487 (= e!879884 (= (select (arr!50923 _keys!610) (index!57408 lt!676005)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165865 c!146169) b!1577481))

(assert (= (and d!165865 (not c!146169)) b!1577485))

(assert (= (and b!1577485 c!146168) b!1577484))

(assert (= (and b!1577485 (not c!146168)) b!1577486))

(assert (= (and d!165865 c!146167) b!1577482))

(assert (= (and d!165865 (not c!146167)) b!1577479))

(assert (= (and b!1577479 res!1077714) b!1577483))

(assert (= (and b!1577483 (not res!1077712)) b!1577480))

(assert (= (and b!1577480 (not res!1077713)) b!1577487))

(assert (=> b!1577486 m!1449687))

(declare-fun m!1449731 () Bool)

(assert (=> b!1577486 m!1449731))

(assert (=> b!1577486 m!1449731))

(declare-fun m!1449733 () Bool)

(assert (=> b!1577486 m!1449733))

(declare-fun m!1449735 () Bool)

(assert (=> b!1577480 m!1449735))

(assert (=> d!165865 m!1449687))

(declare-fun m!1449737 () Bool)

(assert (=> d!165865 m!1449737))

(assert (=> d!165865 m!1449693))

(assert (=> b!1577487 m!1449735))

(assert (=> b!1577483 m!1449735))

(assert (=> b!1577409 d!165865))

(declare-fun d!165873 () Bool)

(declare-fun lt!676009 () (_ BitVec 32))

(assert (=> d!165873 (and (bvsge lt!676009 #b00000000000000000000000000000000) (bvslt lt!676009 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165873 (= lt!676009 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165873 (validMask!0 mask!910)))

(assert (=> d!165873 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676009)))

(declare-fun bs!45584 () Bool)

(assert (= bs!45584 d!165873))

(declare-fun m!1449739 () Bool)

(assert (=> bs!45584 m!1449739))

(assert (=> bs!45584 m!1449693))

(assert (=> b!1577409 d!165873))

(declare-fun d!165875 () Bool)

(assert (=> d!165875 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136414 d!165875))

(declare-fun d!165885 () Bool)

(assert (=> d!165885 (= (array_inv!39650 _keys!610) (bvsge (size!51473 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136414 d!165885))

(declare-fun d!165887 () Bool)

(assert (=> d!165887 (= (validKeyInArray!0 k!768) (and (not (= k!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577407 d!165887))

(push 1)

