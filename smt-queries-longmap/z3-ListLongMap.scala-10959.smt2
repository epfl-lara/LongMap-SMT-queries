; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128288 () Bool)

(assert start!128288)

(declare-fun b!1505616 () Bool)

(declare-fun res!1026047 () Bool)

(declare-fun e!841503 () Bool)

(assert (=> b!1505616 (=> (not res!1026047) (not e!841503))))

(declare-datatypes ((array!100420 0))(
  ( (array!100421 (arr!48459 (Array (_ BitVec 32) (_ BitVec 64))) (size!49009 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100420)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505616 (= res!1026047 (validKeyInArray!0 (select (arr!48459 a!2804) i!961)))))

(declare-fun b!1505617 () Bool)

(declare-fun res!1026044 () Bool)

(assert (=> b!1505617 (=> (not res!1026044) (not e!841503))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1505617 (= res!1026044 (and (= (size!49009 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49009 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49009 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505618 () Bool)

(declare-fun res!1026049 () Bool)

(assert (=> b!1505618 (=> (not res!1026049) (not e!841503))))

(assert (=> b!1505618 (= res!1026049 (and (bvsle #b00000000000000000000000000000000 (size!49009 a!2804)) (bvslt (size!49009 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505619 () Bool)

(declare-fun res!1026046 () Bool)

(assert (=> b!1505619 (=> (not res!1026046) (not e!841503))))

(assert (=> b!1505619 (= res!1026046 (validKeyInArray!0 (select (arr!48459 a!2804) j!70)))))

(declare-fun b!1505620 () Bool)

(declare-fun res!1026045 () Bool)

(assert (=> b!1505620 (=> (not res!1026045) (not e!841503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100420 (_ BitVec 32)) Bool)

(assert (=> b!1505620 (= res!1026045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505621 () Bool)

(declare-datatypes ((List!34942 0))(
  ( (Nil!34939) (Cons!34938 (h!36335 (_ BitVec 64)) (t!49636 List!34942)) )
))
(declare-fun noDuplicate!2625 (List!34942) Bool)

(assert (=> b!1505621 (= e!841503 (not (noDuplicate!2625 Nil!34939)))))

(declare-fun res!1026048 () Bool)

(assert (=> start!128288 (=> (not res!1026048) (not e!841503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128288 (= res!1026048 (validMask!0 mask!2512))))

(assert (=> start!128288 e!841503))

(assert (=> start!128288 true))

(declare-fun array_inv!37487 (array!100420) Bool)

(assert (=> start!128288 (array_inv!37487 a!2804)))

(assert (= (and start!128288 res!1026048) b!1505617))

(assert (= (and b!1505617 res!1026044) b!1505616))

(assert (= (and b!1505616 res!1026047) b!1505619))

(assert (= (and b!1505619 res!1026046) b!1505620))

(assert (= (and b!1505620 res!1026045) b!1505618))

(assert (= (and b!1505618 res!1026049) b!1505621))

(declare-fun m!1388705 () Bool)

(assert (=> b!1505620 m!1388705))

(declare-fun m!1388707 () Bool)

(assert (=> b!1505619 m!1388707))

(assert (=> b!1505619 m!1388707))

(declare-fun m!1388709 () Bool)

(assert (=> b!1505619 m!1388709))

(declare-fun m!1388711 () Bool)

(assert (=> start!128288 m!1388711))

(declare-fun m!1388713 () Bool)

(assert (=> start!128288 m!1388713))

(declare-fun m!1388715 () Bool)

(assert (=> b!1505616 m!1388715))

(assert (=> b!1505616 m!1388715))

(declare-fun m!1388717 () Bool)

(assert (=> b!1505616 m!1388717))

(declare-fun m!1388719 () Bool)

(assert (=> b!1505621 m!1388719))

(check-sat (not b!1505620) (not b!1505619) (not b!1505621) (not start!128288) (not b!1505616))
(check-sat)
(get-model)

(declare-fun b!1505648 () Bool)

(declare-fun e!841517 () Bool)

(declare-fun call!68187 () Bool)

(assert (=> b!1505648 (= e!841517 call!68187)))

(declare-fun d!158063 () Bool)

(declare-fun res!1026072 () Bool)

(declare-fun e!841518 () Bool)

(assert (=> d!158063 (=> res!1026072 e!841518)))

(assert (=> d!158063 (= res!1026072 (bvsge #b00000000000000000000000000000000 (size!49009 a!2804)))))

(assert (=> d!158063 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841518)))

(declare-fun b!1505649 () Bool)

(declare-fun e!841519 () Bool)

(assert (=> b!1505649 (= e!841518 e!841519)))

(declare-fun c!139322 () Bool)

(assert (=> b!1505649 (= c!139322 (validKeyInArray!0 (select (arr!48459 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505650 () Bool)

(assert (=> b!1505650 (= e!841519 call!68187)))

(declare-fun bm!68184 () Bool)

(assert (=> bm!68184 (= call!68187 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505651 () Bool)

(assert (=> b!1505651 (= e!841519 e!841517)))

(declare-fun lt!654057 () (_ BitVec 64))

(assert (=> b!1505651 (= lt!654057 (select (arr!48459 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50304 0))(
  ( (Unit!50305) )
))
(declare-fun lt!654056 () Unit!50304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100420 (_ BitVec 64) (_ BitVec 32)) Unit!50304)

(assert (=> b!1505651 (= lt!654056 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654057 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505651 (arrayContainsKey!0 a!2804 lt!654057 #b00000000000000000000000000000000)))

(declare-fun lt!654058 () Unit!50304)

(assert (=> b!1505651 (= lt!654058 lt!654056)))

(declare-fun res!1026073 () Bool)

(declare-datatypes ((SeekEntryResult!12649 0))(
  ( (MissingZero!12649 (index!52991 (_ BitVec 32))) (Found!12649 (index!52992 (_ BitVec 32))) (Intermediate!12649 (undefined!13461 Bool) (index!52993 (_ BitVec 32)) (x!134700 (_ BitVec 32))) (Undefined!12649) (MissingVacant!12649 (index!52994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100420 (_ BitVec 32)) SeekEntryResult!12649)

(assert (=> b!1505651 (= res!1026073 (= (seekEntryOrOpen!0 (select (arr!48459 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12649 #b00000000000000000000000000000000)))))

(assert (=> b!1505651 (=> (not res!1026073) (not e!841517))))

(assert (= (and d!158063 (not res!1026072)) b!1505649))

(assert (= (and b!1505649 c!139322) b!1505651))

(assert (= (and b!1505649 (not c!139322)) b!1505650))

(assert (= (and b!1505651 res!1026073) b!1505648))

(assert (= (or b!1505648 b!1505650) bm!68184))

(declare-fun m!1388737 () Bool)

(assert (=> b!1505649 m!1388737))

(assert (=> b!1505649 m!1388737))

(declare-fun m!1388739 () Bool)

(assert (=> b!1505649 m!1388739))

(declare-fun m!1388741 () Bool)

(assert (=> bm!68184 m!1388741))

(assert (=> b!1505651 m!1388737))

(declare-fun m!1388743 () Bool)

(assert (=> b!1505651 m!1388743))

(declare-fun m!1388745 () Bool)

(assert (=> b!1505651 m!1388745))

(assert (=> b!1505651 m!1388737))

(declare-fun m!1388747 () Bool)

(assert (=> b!1505651 m!1388747))

(assert (=> b!1505620 d!158063))

(declare-fun d!158071 () Bool)

(assert (=> d!158071 (= (validKeyInArray!0 (select (arr!48459 a!2804) j!70)) (and (not (= (select (arr!48459 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48459 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505619 d!158071))

(declare-fun d!158073 () Bool)

(assert (=> d!158073 (= (validKeyInArray!0 (select (arr!48459 a!2804) i!961)) (and (not (= (select (arr!48459 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48459 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505616 d!158073))

(declare-fun d!158075 () Bool)

(assert (=> d!158075 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128288 d!158075))

(declare-fun d!158089 () Bool)

(assert (=> d!158089 (= (array_inv!37487 a!2804) (bvsge (size!49009 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128288 d!158089))

(declare-fun d!158091 () Bool)

(declare-fun res!1026082 () Bool)

(declare-fun e!841530 () Bool)

(assert (=> d!158091 (=> res!1026082 e!841530)))

(get-info :version)

(assert (=> d!158091 (= res!1026082 ((_ is Nil!34939) Nil!34939))))

(assert (=> d!158091 (= (noDuplicate!2625 Nil!34939) e!841530)))

(declare-fun b!1505664 () Bool)

(declare-fun e!841531 () Bool)

(assert (=> b!1505664 (= e!841530 e!841531)))

(declare-fun res!1026083 () Bool)

(assert (=> b!1505664 (=> (not res!1026083) (not e!841531))))

(declare-fun contains!9957 (List!34942 (_ BitVec 64)) Bool)

(assert (=> b!1505664 (= res!1026083 (not (contains!9957 (t!49636 Nil!34939) (h!36335 Nil!34939))))))

(declare-fun b!1505665 () Bool)

(assert (=> b!1505665 (= e!841531 (noDuplicate!2625 (t!49636 Nil!34939)))))

(assert (= (and d!158091 (not res!1026082)) b!1505664))

(assert (= (and b!1505664 res!1026083) b!1505665))

(declare-fun m!1388749 () Bool)

(assert (=> b!1505664 m!1388749))

(declare-fun m!1388751 () Bool)

(assert (=> b!1505665 m!1388751))

(assert (=> b!1505621 d!158091))

(check-sat (not b!1505651) (not b!1505665) (not b!1505664) (not bm!68184) (not b!1505649))
(check-sat)
