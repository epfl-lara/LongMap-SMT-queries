; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130518 () Bool)

(assert start!130518)

(declare-fun b!1532085 () Bool)

(declare-fun res!1049413 () Bool)

(declare-fun e!853606 () Bool)

(assert (=> b!1532085 (=> (not res!1049413) (not e!853606))))

(declare-datatypes ((array!101695 0))(
  ( (array!101696 (arr!49069 (Array (_ BitVec 32) (_ BitVec 64))) (size!49621 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101695)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532085 (= res!1049413 (validKeyInArray!0 (select (arr!49069 a!2792) i!951)))))

(declare-fun b!1532086 () Bool)

(declare-fun res!1049409 () Bool)

(assert (=> b!1532086 (=> (not res!1049409) (not e!853606))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1532086 (= res!1049409 (and (= (size!49621 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49621 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49621 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532087 () Bool)

(assert (=> b!1532087 (= e!853606 (and (bvsle #b00000000000000000000000000000000 (size!49621 a!2792)) (bvsge (size!49621 a!2792) #b01111111111111111111111111111111)))))

(declare-fun res!1049410 () Bool)

(assert (=> start!130518 (=> (not res!1049410) (not e!853606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130518 (= res!1049410 (validMask!0 mask!2480))))

(assert (=> start!130518 e!853606))

(assert (=> start!130518 true))

(declare-fun array_inv!38302 (array!101695) Bool)

(assert (=> start!130518 (array_inv!38302 a!2792)))

(declare-fun b!1532088 () Bool)

(declare-fun res!1049412 () Bool)

(assert (=> b!1532088 (=> (not res!1049412) (not e!853606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101695 (_ BitVec 32)) Bool)

(assert (=> b!1532088 (= res!1049412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532089 () Bool)

(declare-fun res!1049411 () Bool)

(assert (=> b!1532089 (=> (not res!1049411) (not e!853606))))

(assert (=> b!1532089 (= res!1049411 (validKeyInArray!0 (select (arr!49069 a!2792) j!64)))))

(assert (= (and start!130518 res!1049410) b!1532086))

(assert (= (and b!1532086 res!1049409) b!1532085))

(assert (= (and b!1532085 res!1049413) b!1532089))

(assert (= (and b!1532089 res!1049411) b!1532088))

(assert (= (and b!1532088 res!1049412) b!1532087))

(declare-fun m!1414235 () Bool)

(assert (=> b!1532085 m!1414235))

(assert (=> b!1532085 m!1414235))

(declare-fun m!1414237 () Bool)

(assert (=> b!1532085 m!1414237))

(declare-fun m!1414239 () Bool)

(assert (=> start!130518 m!1414239))

(declare-fun m!1414241 () Bool)

(assert (=> start!130518 m!1414241))

(declare-fun m!1414243 () Bool)

(assert (=> b!1532088 m!1414243))

(declare-fun m!1414245 () Bool)

(assert (=> b!1532089 m!1414245))

(assert (=> b!1532089 m!1414245))

(declare-fun m!1414247 () Bool)

(assert (=> b!1532089 m!1414247))

(check-sat (not b!1532088) (not b!1532089) (not b!1532085) (not start!130518))
(check-sat)
(get-model)

(declare-fun b!1532128 () Bool)

(declare-fun e!853627 () Bool)

(declare-fun e!853625 () Bool)

(assert (=> b!1532128 (= e!853627 e!853625)))

(declare-fun c!140901 () Bool)

(assert (=> b!1532128 (= c!140901 (validKeyInArray!0 (select (arr!49069 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1532129 () Bool)

(declare-fun e!853626 () Bool)

(assert (=> b!1532129 (= e!853625 e!853626)))

(declare-fun lt!663358 () (_ BitVec 64))

(assert (=> b!1532129 (= lt!663358 (select (arr!49069 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51125 0))(
  ( (Unit!51126) )
))
(declare-fun lt!663359 () Unit!51125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101695 (_ BitVec 64) (_ BitVec 32)) Unit!51125)

(assert (=> b!1532129 (= lt!663359 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663358 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532129 (arrayContainsKey!0 a!2792 lt!663358 #b00000000000000000000000000000000)))

(declare-fun lt!663360 () Unit!51125)

(assert (=> b!1532129 (= lt!663360 lt!663359)))

(declare-fun res!1049449 () Bool)

(declare-datatypes ((SeekEntryResult!13251 0))(
  ( (MissingZero!13251 (index!55399 (_ BitVec 32))) (Found!13251 (index!55400 (_ BitVec 32))) (Intermediate!13251 (undefined!14063 Bool) (index!55401 (_ BitVec 32)) (x!137112 (_ BitVec 32))) (Undefined!13251) (MissingVacant!13251 (index!55402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101695 (_ BitVec 32)) SeekEntryResult!13251)

(assert (=> b!1532129 (= res!1049449 (= (seekEntryOrOpen!0 (select (arr!49069 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13251 #b00000000000000000000000000000000)))))

(assert (=> b!1532129 (=> (not res!1049449) (not e!853626))))

(declare-fun d!159789 () Bool)

(declare-fun res!1049448 () Bool)

(assert (=> d!159789 (=> res!1049448 e!853627)))

(assert (=> d!159789 (= res!1049448 (bvsge #b00000000000000000000000000000000 (size!49621 a!2792)))))

(assert (=> d!159789 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853627)))

(declare-fun bm!68518 () Bool)

(declare-fun call!68521 () Bool)

(assert (=> bm!68518 (= call!68521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1532130 () Bool)

(assert (=> b!1532130 (= e!853626 call!68521)))

(declare-fun b!1532131 () Bool)

(assert (=> b!1532131 (= e!853625 call!68521)))

(assert (= (and d!159789 (not res!1049448)) b!1532128))

(assert (= (and b!1532128 c!140901) b!1532129))

(assert (= (and b!1532128 (not c!140901)) b!1532131))

(assert (= (and b!1532129 res!1049449) b!1532130))

(assert (= (or b!1532130 b!1532131) bm!68518))

(declare-fun m!1414277 () Bool)

(assert (=> b!1532128 m!1414277))

(assert (=> b!1532128 m!1414277))

(declare-fun m!1414279 () Bool)

(assert (=> b!1532128 m!1414279))

(assert (=> b!1532129 m!1414277))

(declare-fun m!1414281 () Bool)

(assert (=> b!1532129 m!1414281))

(declare-fun m!1414283 () Bool)

(assert (=> b!1532129 m!1414283))

(assert (=> b!1532129 m!1414277))

(declare-fun m!1414285 () Bool)

(assert (=> b!1532129 m!1414285))

(declare-fun m!1414287 () Bool)

(assert (=> bm!68518 m!1414287))

(assert (=> b!1532088 d!159789))

(declare-fun d!159793 () Bool)

(assert (=> d!159793 (= (validKeyInArray!0 (select (arr!49069 a!2792) j!64)) (and (not (= (select (arr!49069 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49069 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532089 d!159793))

(declare-fun d!159799 () Bool)

(assert (=> d!159799 (= (validKeyInArray!0 (select (arr!49069 a!2792) i!951)) (and (not (= (select (arr!49069 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49069 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532085 d!159799))

(declare-fun d!159801 () Bool)

(assert (=> d!159801 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130518 d!159801))

(declare-fun d!159807 () Bool)

(assert (=> d!159807 (= (array_inv!38302 a!2792) (bvsge (size!49621 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130518 d!159807))

(check-sat (not b!1532128) (not b!1532129) (not bm!68518))
(check-sat)
