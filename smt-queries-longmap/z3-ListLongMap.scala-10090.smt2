; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119066 () Bool)

(assert start!119066)

(declare-fun b!1389711 () Bool)

(declare-fun res!929314 () Bool)

(declare-fun e!787328 () Bool)

(assert (=> b!1389711 (=> (not res!929314) (not e!787328))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95066 0))(
  ( (array!95067 (arr!45904 (Array (_ BitVec 32) (_ BitVec 64))) (size!46455 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95066)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389711 (= res!929314 (and (= (size!46455 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46455 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46455 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389712 () Bool)

(declare-fun res!929313 () Bool)

(assert (=> b!1389712 (=> (not res!929313) (not e!787328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95066 (_ BitVec 32)) Bool)

(assert (=> b!1389712 (= res!929313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389713 () Bool)

(declare-fun res!929312 () Bool)

(assert (=> b!1389713 (=> (not res!929312) (not e!787328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389713 (= res!929312 (validKeyInArray!0 (select (arr!45904 a!2901) i!1037)))))

(declare-fun b!1389714 () Bool)

(assert (=> b!1389714 (= e!787328 (and (bvsle #b00000000000000000000000000000000 (size!46455 a!2901)) (bvsge (size!46455 a!2901) #b01111111111111111111111111111111)))))

(declare-fun res!929310 () Bool)

(assert (=> start!119066 (=> (not res!929310) (not e!787328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119066 (= res!929310 (validMask!0 mask!2840))))

(assert (=> start!119066 e!787328))

(assert (=> start!119066 true))

(declare-fun array_inv!35185 (array!95066) Bool)

(assert (=> start!119066 (array_inv!35185 a!2901)))

(declare-fun b!1389710 () Bool)

(declare-fun res!929311 () Bool)

(assert (=> b!1389710 (=> (not res!929311) (not e!787328))))

(assert (=> b!1389710 (= res!929311 (validKeyInArray!0 (select (arr!45904 a!2901) j!112)))))

(assert (= (and start!119066 res!929310) b!1389711))

(assert (= (and b!1389711 res!929314) b!1389713))

(assert (= (and b!1389713 res!929312) b!1389710))

(assert (= (and b!1389710 res!929311) b!1389712))

(assert (= (and b!1389712 res!929313) b!1389714))

(declare-fun m!1275691 () Bool)

(assert (=> b!1389712 m!1275691))

(declare-fun m!1275693 () Bool)

(assert (=> b!1389713 m!1275693))

(assert (=> b!1389713 m!1275693))

(declare-fun m!1275695 () Bool)

(assert (=> b!1389713 m!1275695))

(declare-fun m!1275697 () Bool)

(assert (=> start!119066 m!1275697))

(declare-fun m!1275699 () Bool)

(assert (=> start!119066 m!1275699))

(declare-fun m!1275701 () Bool)

(assert (=> b!1389710 m!1275701))

(assert (=> b!1389710 m!1275701))

(declare-fun m!1275703 () Bool)

(assert (=> b!1389710 m!1275703))

(check-sat (not start!119066) (not b!1389710) (not b!1389713) (not b!1389712))
(check-sat)
(get-model)

(declare-fun d!150293 () Bool)

(assert (=> d!150293 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119066 d!150293))

(declare-fun d!150301 () Bool)

(assert (=> d!150301 (= (array_inv!35185 a!2901) (bvsge (size!46455 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119066 d!150301))

(declare-fun d!150303 () Bool)

(assert (=> d!150303 (= (validKeyInArray!0 (select (arr!45904 a!2901) j!112)) (and (not (= (select (arr!45904 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45904 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389710 d!150303))

(declare-fun d!150305 () Bool)

(assert (=> d!150305 (= (validKeyInArray!0 (select (arr!45904 a!2901) i!1037)) (and (not (= (select (arr!45904 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45904 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389713 d!150305))

(declare-fun d!150307 () Bool)

(declare-fun res!929355 () Bool)

(declare-fun e!787357 () Bool)

(assert (=> d!150307 (=> res!929355 e!787357)))

(assert (=> d!150307 (= res!929355 (bvsge #b00000000000000000000000000000000 (size!46455 a!2901)))))

(assert (=> d!150307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787357)))

(declare-fun b!1389765 () Bool)

(declare-fun e!787358 () Bool)

(declare-fun call!66699 () Bool)

(assert (=> b!1389765 (= e!787358 call!66699)))

(declare-fun b!1389766 () Bool)

(assert (=> b!1389766 (= e!787357 e!787358)))

(declare-fun c!129655 () Bool)

(assert (=> b!1389766 (= c!129655 (validKeyInArray!0 (select (arr!45904 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389767 () Bool)

(declare-fun e!787356 () Bool)

(assert (=> b!1389767 (= e!787356 call!66699)))

(declare-fun b!1389768 () Bool)

(assert (=> b!1389768 (= e!787358 e!787356)))

(declare-fun lt!610770 () (_ BitVec 64))

(assert (=> b!1389768 (= lt!610770 (select (arr!45904 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46347 0))(
  ( (Unit!46348) )
))
(declare-fun lt!610771 () Unit!46347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95066 (_ BitVec 64) (_ BitVec 32)) Unit!46347)

(assert (=> b!1389768 (= lt!610771 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610770 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389768 (arrayContainsKey!0 a!2901 lt!610770 #b00000000000000000000000000000000)))

(declare-fun lt!610772 () Unit!46347)

(assert (=> b!1389768 (= lt!610772 lt!610771)))

(declare-fun res!929356 () Bool)

(declare-datatypes ((SeekEntryResult!10145 0))(
  ( (MissingZero!10145 (index!42951 (_ BitVec 32))) (Found!10145 (index!42952 (_ BitVec 32))) (Intermediate!10145 (undefined!10957 Bool) (index!42953 (_ BitVec 32)) (x!124743 (_ BitVec 32))) (Undefined!10145) (MissingVacant!10145 (index!42954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95066 (_ BitVec 32)) SeekEntryResult!10145)

(assert (=> b!1389768 (= res!929356 (= (seekEntryOrOpen!0 (select (arr!45904 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10145 #b00000000000000000000000000000000)))))

(assert (=> b!1389768 (=> (not res!929356) (not e!787356))))

(declare-fun bm!66696 () Bool)

(assert (=> bm!66696 (= call!66699 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!150307 (not res!929355)) b!1389766))

(assert (= (and b!1389766 c!129655) b!1389768))

(assert (= (and b!1389766 (not c!129655)) b!1389765))

(assert (= (and b!1389768 res!929356) b!1389767))

(assert (= (or b!1389767 b!1389765) bm!66696))

(declare-fun m!1275745 () Bool)

(assert (=> b!1389766 m!1275745))

(assert (=> b!1389766 m!1275745))

(declare-fun m!1275747 () Bool)

(assert (=> b!1389766 m!1275747))

(assert (=> b!1389768 m!1275745))

(declare-fun m!1275749 () Bool)

(assert (=> b!1389768 m!1275749))

(declare-fun m!1275751 () Bool)

(assert (=> b!1389768 m!1275751))

(assert (=> b!1389768 m!1275745))

(declare-fun m!1275753 () Bool)

(assert (=> b!1389768 m!1275753))

(declare-fun m!1275755 () Bool)

(assert (=> bm!66696 m!1275755))

(assert (=> b!1389712 d!150307))

(check-sat (not b!1389768) (not bm!66696) (not b!1389766))
(check-sat)
