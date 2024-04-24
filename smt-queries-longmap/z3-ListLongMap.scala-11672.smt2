; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136954 () Bool)

(assert start!136954)

(declare-fun b!1580220 () Bool)

(declare-fun res!1078746 () Bool)

(declare-fun e!881558 () Bool)

(assert (=> b!1580220 (=> (not res!1078746) (not e!881558))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105764 0))(
  ( (array!105765 (arr!50989 (Array (_ BitVec 32) (_ BitVec 64))) (size!51540 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105764)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1580220 (= res!1078746 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51540 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13709 0))(
  ( (MissingZero!13709 (index!57234 (_ BitVec 32))) (Found!13709 (index!57235 (_ BitVec 32))) (Intermediate!13709 (undefined!14521 Bool) (index!57236 (_ BitVec 32)) (x!142591 (_ BitVec 32))) (Undefined!13709) (MissingVacant!13709 (index!57237 (_ BitVec 32))) )
))
(declare-fun lt!677001 () SeekEntryResult!13709)

(declare-fun b!1580223 () Bool)

(get-info :version)

(assert (=> b!1580223 (= e!881558 (ite (and ((_ is Intermediate!13709) lt!677001) (undefined!14521 lt!677001)) (bvslt (x!142591 lt!677001) #b01111111111111111111111111111110) (or (not ((_ is Intermediate!13709) lt!677001)) (undefined!14521 lt!677001) (bvsge (x!142591 lt!677001) #b01111111111111111111111111111110) (bvslt (x!142591 lt!677001) #b00000000000000000000000000000000) (bvslt (x!142591 lt!677001) x!458) (and (not (= (select (arr!50989 _keys!610) (index!57236 lt!677001)) k0!768)) (not (= (select (arr!50989 _keys!610) (index!57236 lt!677001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50989 _keys!610) (index!57236 lt!677001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105764 (_ BitVec 32)) SeekEntryResult!13709)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580223 (= lt!677001 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1580221 () Bool)

(declare-fun res!1078745 () Bool)

(assert (=> b!1580221 (=> (not res!1078745) (not e!881558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580221 (= res!1078745 (validKeyInArray!0 k0!768))))

(declare-fun b!1580222 () Bool)

(declare-fun res!1078747 () Bool)

(assert (=> b!1580222 (=> (not res!1078747) (not e!881558))))

(assert (=> b!1580222 (= res!1078747 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50989 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50989 _keys!610) ee!12) (select (arr!50989 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078748 () Bool)

(assert (=> start!136954 (=> (not res!1078748) (not e!881558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136954 (= res!1078748 (validMask!0 mask!910))))

(assert (=> start!136954 e!881558))

(assert (=> start!136954 true))

(declare-fun array_inv!39944 (array!105764) Bool)

(assert (=> start!136954 (array_inv!39944 _keys!610)))

(assert (= (and start!136954 res!1078748) b!1580220))

(assert (= (and b!1580220 res!1078746) b!1580221))

(assert (= (and b!1580221 res!1078745) b!1580222))

(assert (= (and b!1580222 res!1078747) b!1580223))

(declare-fun m!1452177 () Bool)

(assert (=> b!1580223 m!1452177))

(declare-fun m!1452179 () Bool)

(assert (=> b!1580223 m!1452179))

(assert (=> b!1580223 m!1452179))

(declare-fun m!1452181 () Bool)

(assert (=> b!1580223 m!1452181))

(declare-fun m!1452183 () Bool)

(assert (=> b!1580221 m!1452183))

(declare-fun m!1452185 () Bool)

(assert (=> b!1580222 m!1452185))

(declare-fun m!1452187 () Bool)

(assert (=> start!136954 m!1452187))

(declare-fun m!1452189 () Bool)

(assert (=> start!136954 m!1452189))

(check-sat (not b!1580223) (not start!136954) (not b!1580221))
(check-sat)
(get-model)

(declare-fun b!1580267 () Bool)

(declare-fun lt!677012 () SeekEntryResult!13709)

(assert (=> b!1580267 (and (bvsge (index!57236 lt!677012) #b00000000000000000000000000000000) (bvslt (index!57236 lt!677012) (size!51540 _keys!610)))))

(declare-fun e!881583 () Bool)

(assert (=> b!1580267 (= e!881583 (= (select (arr!50989 _keys!610) (index!57236 lt!677012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1580268 () Bool)

(declare-fun e!881585 () SeekEntryResult!13709)

(declare-fun e!881581 () SeekEntryResult!13709)

(assert (=> b!1580268 (= e!881585 e!881581)))

(declare-fun c!147041 () Bool)

(declare-fun lt!677013 () (_ BitVec 64))

(assert (=> b!1580268 (= c!147041 (or (= lt!677013 k0!768) (= (bvadd lt!677013 lt!677013) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580269 () Bool)

(assert (=> b!1580269 (= e!881581 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1580270 () Bool)

(assert (=> b!1580270 (and (bvsge (index!57236 lt!677012) #b00000000000000000000000000000000) (bvslt (index!57236 lt!677012) (size!51540 _keys!610)))))

(declare-fun res!1078779 () Bool)

(assert (=> b!1580270 (= res!1078779 (= (select (arr!50989 _keys!610) (index!57236 lt!677012)) k0!768))))

(assert (=> b!1580270 (=> res!1078779 e!881583)))

(declare-fun e!881582 () Bool)

(assert (=> b!1580270 (= e!881582 e!881583)))

(declare-fun b!1580271 () Bool)

(declare-fun e!881584 () Bool)

(assert (=> b!1580271 (= e!881584 (bvsge (x!142591 lt!677012) #b01111111111111111111111111111110))))

(declare-fun b!1580272 () Bool)

(assert (=> b!1580272 (= e!881584 e!881582)))

(declare-fun res!1078781 () Bool)

(assert (=> b!1580272 (= res!1078781 (and ((_ is Intermediate!13709) lt!677012) (not (undefined!14521 lt!677012)) (bvslt (x!142591 lt!677012) #b01111111111111111111111111111110) (bvsge (x!142591 lt!677012) #b00000000000000000000000000000000) (bvsge (x!142591 lt!677012) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1580272 (=> (not res!1078781) (not e!881582))))

(declare-fun d!166677 () Bool)

(assert (=> d!166677 e!881584))

(declare-fun c!147040 () Bool)

(assert (=> d!166677 (= c!147040 (and ((_ is Intermediate!13709) lt!677012) (undefined!14521 lt!677012)))))

(assert (=> d!166677 (= lt!677012 e!881585)))

(declare-fun c!147039 () Bool)

(assert (=> d!166677 (= c!147039 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(assert (=> d!166677 (= lt!677013 (select (arr!50989 _keys!610) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910)))))

(assert (=> d!166677 (validMask!0 mask!910)))

(assert (=> d!166677 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910) lt!677012)))

(declare-fun b!1580266 () Bool)

(assert (=> b!1580266 (= e!881585 (Intermediate!13709 true (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1580273 () Bool)

(assert (=> b!1580273 (and (bvsge (index!57236 lt!677012) #b00000000000000000000000000000000) (bvslt (index!57236 lt!677012) (size!51540 _keys!610)))))

(declare-fun res!1078780 () Bool)

(assert (=> b!1580273 (= res!1078780 (= (select (arr!50989 _keys!610) (index!57236 lt!677012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1580273 (=> res!1078780 e!881583)))

(declare-fun b!1580274 () Bool)

(assert (=> b!1580274 (= e!881581 (Intermediate!13709 false (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(assert (= (and d!166677 c!147039) b!1580266))

(assert (= (and d!166677 (not c!147039)) b!1580268))

(assert (= (and b!1580268 c!147041) b!1580274))

(assert (= (and b!1580268 (not c!147041)) b!1580269))

(assert (= (and d!166677 c!147040) b!1580271))

(assert (= (and d!166677 (not c!147040)) b!1580272))

(assert (= (and b!1580272 res!1078781) b!1580270))

(assert (= (and b!1580270 (not res!1078779)) b!1580273))

(assert (= (and b!1580273 (not res!1078780)) b!1580267))

(assert (=> b!1580269 m!1452179))

(declare-fun m!1452219 () Bool)

(assert (=> b!1580269 m!1452219))

(assert (=> b!1580269 m!1452219))

(declare-fun m!1452221 () Bool)

(assert (=> b!1580269 m!1452221))

(declare-fun m!1452223 () Bool)

(assert (=> b!1580270 m!1452223))

(assert (=> d!166677 m!1452179))

(declare-fun m!1452225 () Bool)

(assert (=> d!166677 m!1452225))

(assert (=> d!166677 m!1452187))

(assert (=> b!1580267 m!1452223))

(assert (=> b!1580273 m!1452223))

(assert (=> b!1580223 d!166677))

(declare-fun d!166681 () Bool)

(declare-fun lt!677016 () (_ BitVec 32))

(assert (=> d!166681 (and (bvsge lt!677016 #b00000000000000000000000000000000) (bvslt lt!677016 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166681 (= lt!677016 (choose!52 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(assert (=> d!166681 (validMask!0 mask!910)))

(assert (=> d!166681 (= (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) lt!677016)))

(declare-fun bs!45622 () Bool)

(assert (= bs!45622 d!166681))

(declare-fun m!1452227 () Bool)

(assert (=> bs!45622 m!1452227))

(assert (=> bs!45622 m!1452187))

(assert (=> b!1580223 d!166681))

(declare-fun d!166685 () Bool)

(assert (=> d!166685 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136954 d!166685))

(declare-fun d!166695 () Bool)

(assert (=> d!166695 (= (array_inv!39944 _keys!610) (bvsge (size!51540 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136954 d!166695))

(declare-fun d!166697 () Bool)

(assert (=> d!166697 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1580221 d!166697))

(check-sat (not d!166677) (not d!166681) (not b!1580269))
(check-sat)
