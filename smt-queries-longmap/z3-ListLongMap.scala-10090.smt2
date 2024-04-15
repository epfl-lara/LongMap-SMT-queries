; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118874 () Bool)

(assert start!118874)

(declare-fun b!1388490 () Bool)

(declare-fun res!928826 () Bool)

(declare-fun e!786551 () Bool)

(assert (=> b!1388490 (=> (not res!928826) (not e!786551))))

(declare-datatypes ((array!94905 0))(
  ( (array!94906 (arr!45826 (Array (_ BitVec 32) (_ BitVec 64))) (size!46378 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94905)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388490 (= res!928826 (validKeyInArray!0 (select (arr!45826 a!2901) i!1037)))))

(declare-fun b!1388491 () Bool)

(declare-fun res!928827 () Bool)

(assert (=> b!1388491 (=> (not res!928827) (not e!786551))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94905 (_ BitVec 32)) Bool)

(assert (=> b!1388491 (= res!928827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388492 () Bool)

(assert (=> b!1388492 (= e!786551 (and (bvsle #b00000000000000000000000000000000 (size!46378 a!2901)) (bvsge (size!46378 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388493 () Bool)

(declare-fun res!928824 () Bool)

(assert (=> b!1388493 (=> (not res!928824) (not e!786551))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388493 (= res!928824 (validKeyInArray!0 (select (arr!45826 a!2901) j!112)))))

(declare-fun b!1388489 () Bool)

(declare-fun res!928825 () Bool)

(assert (=> b!1388489 (=> (not res!928825) (not e!786551))))

(assert (=> b!1388489 (= res!928825 (and (= (size!46378 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46378 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46378 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!928828 () Bool)

(assert (=> start!118874 (=> (not res!928828) (not e!786551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118874 (= res!928828 (validMask!0 mask!2840))))

(assert (=> start!118874 e!786551))

(assert (=> start!118874 true))

(declare-fun array_inv!35059 (array!94905) Bool)

(assert (=> start!118874 (array_inv!35059 a!2901)))

(assert (= (and start!118874 res!928828) b!1388489))

(assert (= (and b!1388489 res!928825) b!1388490))

(assert (= (and b!1388490 res!928826) b!1388493))

(assert (= (and b!1388493 res!928824) b!1388491))

(assert (= (and b!1388491 res!928827) b!1388492))

(declare-fun m!1273783 () Bool)

(assert (=> b!1388490 m!1273783))

(assert (=> b!1388490 m!1273783))

(declare-fun m!1273785 () Bool)

(assert (=> b!1388490 m!1273785))

(declare-fun m!1273787 () Bool)

(assert (=> b!1388491 m!1273787))

(declare-fun m!1273789 () Bool)

(assert (=> b!1388493 m!1273789))

(assert (=> b!1388493 m!1273789))

(declare-fun m!1273791 () Bool)

(assert (=> b!1388493 m!1273791))

(declare-fun m!1273793 () Bool)

(assert (=> start!118874 m!1273793))

(declare-fun m!1273795 () Bool)

(assert (=> start!118874 m!1273795))

(check-sat (not start!118874) (not b!1388490) (not b!1388491) (not b!1388493))
(check-sat)
(get-model)

(declare-fun d!149823 () Bool)

(assert (=> d!149823 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118874 d!149823))

(declare-fun d!149833 () Bool)

(assert (=> d!149833 (= (array_inv!35059 a!2901) (bvsge (size!46378 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118874 d!149833))

(declare-fun d!149835 () Bool)

(assert (=> d!149835 (= (validKeyInArray!0 (select (arr!45826 a!2901) i!1037)) (and (not (= (select (arr!45826 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45826 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388490 d!149835))

(declare-fun b!1388544 () Bool)

(declare-fun e!786579 () Bool)

(declare-fun call!66620 () Bool)

(assert (=> b!1388544 (= e!786579 call!66620)))

(declare-fun bm!66617 () Bool)

(assert (=> bm!66617 (= call!66620 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!149837 () Bool)

(declare-fun res!928870 () Bool)

(declare-fun e!786580 () Bool)

(assert (=> d!149837 (=> res!928870 e!786580)))

(assert (=> d!149837 (= res!928870 (bvsge #b00000000000000000000000000000000 (size!46378 a!2901)))))

(assert (=> d!149837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786580)))

(declare-fun b!1388545 () Bool)

(assert (=> b!1388545 (= e!786580 e!786579)))

(declare-fun c!129283 () Bool)

(assert (=> b!1388545 (= c!129283 (validKeyInArray!0 (select (arr!45826 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1388546 () Bool)

(declare-fun e!786581 () Bool)

(assert (=> b!1388546 (= e!786579 e!786581)))

(declare-fun lt!610184 () (_ BitVec 64))

(assert (=> b!1388546 (= lt!610184 (select (arr!45826 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46251 0))(
  ( (Unit!46252) )
))
(declare-fun lt!610182 () Unit!46251)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94905 (_ BitVec 64) (_ BitVec 32)) Unit!46251)

(assert (=> b!1388546 (= lt!610182 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610184 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388546 (arrayContainsKey!0 a!2901 lt!610184 #b00000000000000000000000000000000)))

(declare-fun lt!610183 () Unit!46251)

(assert (=> b!1388546 (= lt!610183 lt!610182)))

(declare-fun res!928869 () Bool)

(declare-datatypes ((SeekEntryResult!10189 0))(
  ( (MissingZero!10189 (index!43127 (_ BitVec 32))) (Found!10189 (index!43128 (_ BitVec 32))) (Intermediate!10189 (undefined!11001 Bool) (index!43129 (_ BitVec 32)) (x!124765 (_ BitVec 32))) (Undefined!10189) (MissingVacant!10189 (index!43130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94905 (_ BitVec 32)) SeekEntryResult!10189)

(assert (=> b!1388546 (= res!928869 (= (seekEntryOrOpen!0 (select (arr!45826 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10189 #b00000000000000000000000000000000)))))

(assert (=> b!1388546 (=> (not res!928869) (not e!786581))))

(declare-fun b!1388547 () Bool)

(assert (=> b!1388547 (= e!786581 call!66620)))

(assert (= (and d!149837 (not res!928870)) b!1388545))

(assert (= (and b!1388545 c!129283) b!1388546))

(assert (= (and b!1388545 (not c!129283)) b!1388544))

(assert (= (and b!1388546 res!928869) b!1388547))

(assert (= (or b!1388547 b!1388544) bm!66617))

(declare-fun m!1273837 () Bool)

(assert (=> bm!66617 m!1273837))

(declare-fun m!1273839 () Bool)

(assert (=> b!1388545 m!1273839))

(assert (=> b!1388545 m!1273839))

(declare-fun m!1273841 () Bool)

(assert (=> b!1388545 m!1273841))

(assert (=> b!1388546 m!1273839))

(declare-fun m!1273843 () Bool)

(assert (=> b!1388546 m!1273843))

(declare-fun m!1273845 () Bool)

(assert (=> b!1388546 m!1273845))

(assert (=> b!1388546 m!1273839))

(declare-fun m!1273847 () Bool)

(assert (=> b!1388546 m!1273847))

(assert (=> b!1388491 d!149837))

(declare-fun d!149847 () Bool)

(assert (=> d!149847 (= (validKeyInArray!0 (select (arr!45826 a!2901) j!112)) (and (not (= (select (arr!45826 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45826 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388493 d!149847))

(check-sat (not bm!66617) (not b!1388545) (not b!1388546))
(check-sat)
