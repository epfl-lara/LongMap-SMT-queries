; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130570 () Bool)

(assert start!130570)

(declare-fun b!1532413 () Bool)

(declare-fun res!1049556 () Bool)

(declare-fun e!853810 () Bool)

(assert (=> b!1532413 (=> (not res!1049556) (not e!853810))))

(declare-datatypes ((array!101749 0))(
  ( (array!101750 (arr!49095 (Array (_ BitVec 32) (_ BitVec 64))) (size!49645 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101749)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532413 (= res!1049556 (validKeyInArray!0 (select (arr!49095 a!2792) j!64)))))

(declare-fun b!1532414 () Bool)

(declare-fun res!1049555 () Bool)

(assert (=> b!1532414 (=> (not res!1049555) (not e!853810))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101749 (_ BitVec 32)) Bool)

(assert (=> b!1532414 (= res!1049555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532415 () Bool)

(declare-fun res!1049554 () Bool)

(assert (=> b!1532415 (=> (not res!1049554) (not e!853810))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532415 (= res!1049554 (and (= (size!49645 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49645 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49645 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1049553 () Bool)

(assert (=> start!130570 (=> (not res!1049553) (not e!853810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130570 (= res!1049553 (validMask!0 mask!2480))))

(assert (=> start!130570 e!853810))

(assert (=> start!130570 true))

(declare-fun array_inv!38123 (array!101749) Bool)

(assert (=> start!130570 (array_inv!38123 a!2792)))

(declare-fun b!1532416 () Bool)

(declare-fun res!1049557 () Bool)

(assert (=> b!1532416 (=> (not res!1049557) (not e!853810))))

(assert (=> b!1532416 (= res!1049557 (validKeyInArray!0 (select (arr!49095 a!2792) i!951)))))

(declare-fun b!1532417 () Bool)

(assert (=> b!1532417 (= e!853810 (and (bvsle #b00000000000000000000000000000000 (size!49645 a!2792)) (bvsge (size!49645 a!2792) #b01111111111111111111111111111111)))))

(assert (= (and start!130570 res!1049553) b!1532415))

(assert (= (and b!1532415 res!1049554) b!1532416))

(assert (= (and b!1532416 res!1049557) b!1532413))

(assert (= (and b!1532413 res!1049556) b!1532414))

(assert (= (and b!1532414 res!1049555) b!1532417))

(declare-fun m!1415141 () Bool)

(assert (=> b!1532413 m!1415141))

(assert (=> b!1532413 m!1415141))

(declare-fun m!1415143 () Bool)

(assert (=> b!1532413 m!1415143))

(declare-fun m!1415145 () Bool)

(assert (=> b!1532414 m!1415145))

(declare-fun m!1415147 () Bool)

(assert (=> start!130570 m!1415147))

(declare-fun m!1415149 () Bool)

(assert (=> start!130570 m!1415149))

(declare-fun m!1415151 () Bool)

(assert (=> b!1532416 m!1415151))

(assert (=> b!1532416 m!1415151))

(declare-fun m!1415153 () Bool)

(assert (=> b!1532416 m!1415153))

(check-sat (not b!1532414) (not b!1532416) (not b!1532413) (not start!130570))
(check-sat)
(get-model)

(declare-fun b!1532441 () Bool)

(declare-fun e!853825 () Bool)

(declare-fun call!68556 () Bool)

(assert (=> b!1532441 (= e!853825 call!68556)))

(declare-fun b!1532442 () Bool)

(declare-fun e!853824 () Bool)

(assert (=> b!1532442 (= e!853824 call!68556)))

(declare-fun d!160043 () Bool)

(declare-fun res!1049577 () Bool)

(declare-fun e!853823 () Bool)

(assert (=> d!160043 (=> res!1049577 e!853823)))

(assert (=> d!160043 (= res!1049577 (bvsge #b00000000000000000000000000000000 (size!49645 a!2792)))))

(assert (=> d!160043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853823)))

(declare-fun bm!68553 () Bool)

(assert (=> bm!68553 (= call!68556 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1532443 () Bool)

(assert (=> b!1532443 (= e!853825 e!853824)))

(declare-fun lt!663645 () (_ BitVec 64))

(assert (=> b!1532443 (= lt!663645 (select (arr!49095 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51290 0))(
  ( (Unit!51291) )
))
(declare-fun lt!663646 () Unit!51290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101749 (_ BitVec 64) (_ BitVec 32)) Unit!51290)

(assert (=> b!1532443 (= lt!663646 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663645 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532443 (arrayContainsKey!0 a!2792 lt!663645 #b00000000000000000000000000000000)))

(declare-fun lt!663644 () Unit!51290)

(assert (=> b!1532443 (= lt!663644 lt!663646)))

(declare-fun res!1049578 () Bool)

(declare-datatypes ((SeekEntryResult!13253 0))(
  ( (MissingZero!13253 (index!55407 (_ BitVec 32))) (Found!13253 (index!55408 (_ BitVec 32))) (Intermediate!13253 (undefined!14065 Bool) (index!55409 (_ BitVec 32)) (x!137119 (_ BitVec 32))) (Undefined!13253) (MissingVacant!13253 (index!55410 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101749 (_ BitVec 32)) SeekEntryResult!13253)

(assert (=> b!1532443 (= res!1049578 (= (seekEntryOrOpen!0 (select (arr!49095 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13253 #b00000000000000000000000000000000)))))

(assert (=> b!1532443 (=> (not res!1049578) (not e!853824))))

(declare-fun b!1532444 () Bool)

(assert (=> b!1532444 (= e!853823 e!853825)))

(declare-fun c!140990 () Bool)

(assert (=> b!1532444 (= c!140990 (validKeyInArray!0 (select (arr!49095 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160043 (not res!1049577)) b!1532444))

(assert (= (and b!1532444 c!140990) b!1532443))

(assert (= (and b!1532444 (not c!140990)) b!1532441))

(assert (= (and b!1532443 res!1049578) b!1532442))

(assert (= (or b!1532442 b!1532441) bm!68553))

(declare-fun m!1415169 () Bool)

(assert (=> bm!68553 m!1415169))

(declare-fun m!1415171 () Bool)

(assert (=> b!1532443 m!1415171))

(declare-fun m!1415173 () Bool)

(assert (=> b!1532443 m!1415173))

(declare-fun m!1415175 () Bool)

(assert (=> b!1532443 m!1415175))

(assert (=> b!1532443 m!1415171))

(declare-fun m!1415177 () Bool)

(assert (=> b!1532443 m!1415177))

(assert (=> b!1532444 m!1415171))

(assert (=> b!1532444 m!1415171))

(declare-fun m!1415179 () Bool)

(assert (=> b!1532444 m!1415179))

(assert (=> b!1532414 d!160043))

(declare-fun d!160051 () Bool)

(assert (=> d!160051 (= (validKeyInArray!0 (select (arr!49095 a!2792) i!951)) (and (not (= (select (arr!49095 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49095 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532416 d!160051))

(declare-fun d!160053 () Bool)

(assert (=> d!160053 (= (validKeyInArray!0 (select (arr!49095 a!2792) j!64)) (and (not (= (select (arr!49095 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49095 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532413 d!160053))

(declare-fun d!160055 () Bool)

(assert (=> d!160055 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130570 d!160055))

(declare-fun d!160065 () Bool)

(assert (=> d!160065 (= (array_inv!38123 a!2792) (bvsge (size!49645 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130570 d!160065))

(check-sat (not bm!68553) (not b!1532443) (not b!1532444))
(check-sat)
