; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130548 () Bool)

(assert start!130548)

(declare-fun b!1532168 () Bool)

(declare-fun e!853651 () Bool)

(declare-datatypes ((List!35624 0))(
  ( (Nil!35621) (Cons!35620 (h!37066 (_ BitVec 64)) (t!50310 List!35624)) )
))
(declare-fun noDuplicate!2652 (List!35624) Bool)

(assert (=> b!1532168 (= e!853651 (not (noDuplicate!2652 Nil!35621)))))

(declare-fun b!1532169 () Bool)

(declare-fun res!1049476 () Bool)

(assert (=> b!1532169 (=> (not res!1049476) (not e!853651))))

(declare-datatypes ((array!101704 0))(
  ( (array!101705 (arr!49072 (Array (_ BitVec 32) (_ BitVec 64))) (size!49624 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101704)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101704 (_ BitVec 32)) Bool)

(assert (=> b!1532169 (= res!1049476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532170 () Bool)

(declare-fun res!1049478 () Bool)

(assert (=> b!1532170 (=> (not res!1049478) (not e!853651))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532170 (= res!1049478 (validKeyInArray!0 (select (arr!49072 a!2792) i!951)))))

(declare-fun b!1532171 () Bool)

(declare-fun res!1049475 () Bool)

(assert (=> b!1532171 (=> (not res!1049475) (not e!853651))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532171 (= res!1049475 (validKeyInArray!0 (select (arr!49072 a!2792) j!64)))))

(declare-fun res!1049477 () Bool)

(assert (=> start!130548 (=> (not res!1049477) (not e!853651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130548 (= res!1049477 (validMask!0 mask!2480))))

(assert (=> start!130548 e!853651))

(assert (=> start!130548 true))

(declare-fun array_inv!38305 (array!101704) Bool)

(assert (=> start!130548 (array_inv!38305 a!2792)))

(declare-fun b!1532172 () Bool)

(declare-fun res!1049474 () Bool)

(assert (=> b!1532172 (=> (not res!1049474) (not e!853651))))

(assert (=> b!1532172 (= res!1049474 (and (= (size!49624 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49624 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49624 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532173 () Bool)

(declare-fun res!1049479 () Bool)

(assert (=> b!1532173 (=> (not res!1049479) (not e!853651))))

(assert (=> b!1532173 (= res!1049479 (and (bvsle #b00000000000000000000000000000000 (size!49624 a!2792)) (bvslt (size!49624 a!2792) #b01111111111111111111111111111111)))))

(assert (= (and start!130548 res!1049477) b!1532172))

(assert (= (and b!1532172 res!1049474) b!1532170))

(assert (= (and b!1532170 res!1049478) b!1532171))

(assert (= (and b!1532171 res!1049475) b!1532169))

(assert (= (and b!1532169 res!1049476) b!1532173))

(assert (= (and b!1532173 res!1049479) b!1532168))

(declare-fun m!1414313 () Bool)

(assert (=> b!1532170 m!1414313))

(assert (=> b!1532170 m!1414313))

(declare-fun m!1414315 () Bool)

(assert (=> b!1532170 m!1414315))

(declare-fun m!1414317 () Bool)

(assert (=> b!1532169 m!1414317))

(declare-fun m!1414319 () Bool)

(assert (=> b!1532168 m!1414319))

(declare-fun m!1414321 () Bool)

(assert (=> start!130548 m!1414321))

(declare-fun m!1414323 () Bool)

(assert (=> start!130548 m!1414323))

(declare-fun m!1414325 () Bool)

(assert (=> b!1532171 m!1414325))

(assert (=> b!1532171 m!1414325))

(declare-fun m!1414327 () Bool)

(assert (=> b!1532171 m!1414327))

(check-sat (not b!1532170) (not b!1532171) (not b!1532168) (not start!130548) (not b!1532169))
(check-sat)
(get-model)

(declare-fun d!159821 () Bool)

(declare-fun res!1049520 () Bool)

(declare-fun e!853668 () Bool)

(assert (=> d!159821 (=> res!1049520 e!853668)))

(get-info :version)

(assert (=> d!159821 (= res!1049520 ((_ is Nil!35621) Nil!35621))))

(assert (=> d!159821 (= (noDuplicate!2652 Nil!35621) e!853668)))

(declare-fun b!1532214 () Bool)

(declare-fun e!853669 () Bool)

(assert (=> b!1532214 (= e!853668 e!853669)))

(declare-fun res!1049521 () Bool)

(assert (=> b!1532214 (=> (not res!1049521) (not e!853669))))

(declare-fun contains!9969 (List!35624 (_ BitVec 64)) Bool)

(assert (=> b!1532214 (= res!1049521 (not (contains!9969 (t!50310 Nil!35621) (h!37066 Nil!35621))))))

(declare-fun b!1532215 () Bool)

(assert (=> b!1532215 (= e!853669 (noDuplicate!2652 (t!50310 Nil!35621)))))

(assert (= (and d!159821 (not res!1049520)) b!1532214))

(assert (= (and b!1532214 res!1049521) b!1532215))

(declare-fun m!1414361 () Bool)

(assert (=> b!1532214 m!1414361))

(declare-fun m!1414363 () Bool)

(assert (=> b!1532215 m!1414363))

(assert (=> b!1532168 d!159821))

(declare-fun b!1532224 () Bool)

(declare-fun e!853677 () Bool)

(declare-fun e!853678 () Bool)

(assert (=> b!1532224 (= e!853677 e!853678)))

(declare-fun c!140910 () Bool)

(assert (=> b!1532224 (= c!140910 (validKeyInArray!0 (select (arr!49072 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1532225 () Bool)

(declare-fun e!853676 () Bool)

(declare-fun call!68530 () Bool)

(assert (=> b!1532225 (= e!853676 call!68530)))

(declare-fun bm!68527 () Bool)

(assert (=> bm!68527 (= call!68530 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun d!159823 () Bool)

(declare-fun res!1049526 () Bool)

(assert (=> d!159823 (=> res!1049526 e!853677)))

(assert (=> d!159823 (= res!1049526 (bvsge #b00000000000000000000000000000000 (size!49624 a!2792)))))

(assert (=> d!159823 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853677)))

(declare-fun b!1532226 () Bool)

(assert (=> b!1532226 (= e!853678 e!853676)))

(declare-fun lt!663386 () (_ BitVec 64))

(assert (=> b!1532226 (= lt!663386 (select (arr!49072 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51129 0))(
  ( (Unit!51130) )
))
(declare-fun lt!663387 () Unit!51129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101704 (_ BitVec 64) (_ BitVec 32)) Unit!51129)

(assert (=> b!1532226 (= lt!663387 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663386 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532226 (arrayContainsKey!0 a!2792 lt!663386 #b00000000000000000000000000000000)))

(declare-fun lt!663385 () Unit!51129)

(assert (=> b!1532226 (= lt!663385 lt!663387)))

(declare-fun res!1049527 () Bool)

(declare-datatypes ((SeekEntryResult!13253 0))(
  ( (MissingZero!13253 (index!55407 (_ BitVec 32))) (Found!13253 (index!55408 (_ BitVec 32))) (Intermediate!13253 (undefined!14065 Bool) (index!55409 (_ BitVec 32)) (x!137122 (_ BitVec 32))) (Undefined!13253) (MissingVacant!13253 (index!55410 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101704 (_ BitVec 32)) SeekEntryResult!13253)

(assert (=> b!1532226 (= res!1049527 (= (seekEntryOrOpen!0 (select (arr!49072 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13253 #b00000000000000000000000000000000)))))

(assert (=> b!1532226 (=> (not res!1049527) (not e!853676))))

(declare-fun b!1532227 () Bool)

(assert (=> b!1532227 (= e!853678 call!68530)))

(assert (= (and d!159823 (not res!1049526)) b!1532224))

(assert (= (and b!1532224 c!140910) b!1532226))

(assert (= (and b!1532224 (not c!140910)) b!1532227))

(assert (= (and b!1532226 res!1049527) b!1532225))

(assert (= (or b!1532225 b!1532227) bm!68527))

(declare-fun m!1414365 () Bool)

(assert (=> b!1532224 m!1414365))

(assert (=> b!1532224 m!1414365))

(declare-fun m!1414367 () Bool)

(assert (=> b!1532224 m!1414367))

(declare-fun m!1414369 () Bool)

(assert (=> bm!68527 m!1414369))

(assert (=> b!1532226 m!1414365))

(declare-fun m!1414371 () Bool)

(assert (=> b!1532226 m!1414371))

(declare-fun m!1414373 () Bool)

(assert (=> b!1532226 m!1414373))

(assert (=> b!1532226 m!1414365))

(declare-fun m!1414375 () Bool)

(assert (=> b!1532226 m!1414375))

(assert (=> b!1532169 d!159823))

(declare-fun d!159831 () Bool)

(assert (=> d!159831 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130548 d!159831))

(declare-fun d!159841 () Bool)

(assert (=> d!159841 (= (array_inv!38305 a!2792) (bvsge (size!49624 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130548 d!159841))

(declare-fun d!159843 () Bool)

(assert (=> d!159843 (= (validKeyInArray!0 (select (arr!49072 a!2792) i!951)) (and (not (= (select (arr!49072 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49072 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532170 d!159843))

(declare-fun d!159845 () Bool)

(assert (=> d!159845 (= (validKeyInArray!0 (select (arr!49072 a!2792) j!64)) (and (not (= (select (arr!49072 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49072 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532171 d!159845))

(check-sat (not bm!68527) (not b!1532226) (not b!1532215) (not b!1532224) (not b!1532214))
(check-sat)
