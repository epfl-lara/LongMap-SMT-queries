; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127424 () Bool)

(assert start!127424)

(declare-fun b!1497807 () Bool)

(declare-fun res!1018923 () Bool)

(declare-fun e!838726 () Bool)

(assert (=> b!1497807 (=> (not res!1018923) (not e!838726))))

(declare-datatypes ((array!99865 0))(
  ( (array!99866 (arr!48195 (Array (_ BitVec 32) (_ BitVec 64))) (size!48745 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99865)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497807 (= res!1018923 (validKeyInArray!0 (select (arr!48195 a!2850) i!996)))))

(declare-fun b!1497808 () Bool)

(declare-fun res!1018922 () Bool)

(assert (=> b!1497808 (=> (not res!1018922) (not e!838726))))

(assert (=> b!1497808 (= res!1018922 (and (bvsle #b00000000000000000000000000000000 (size!48745 a!2850)) (bvslt (size!48745 a!2850) #b01111111111111111111111111111111)))))

(declare-fun res!1018919 () Bool)

(assert (=> start!127424 (=> (not res!1018919) (not e!838726))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127424 (= res!1018919 (validMask!0 mask!2661))))

(assert (=> start!127424 e!838726))

(assert (=> start!127424 true))

(declare-fun array_inv!37223 (array!99865) Bool)

(assert (=> start!127424 (array_inv!37223 a!2850)))

(declare-fun b!1497809 () Bool)

(declare-datatypes ((List!34687 0))(
  ( (Nil!34684) (Cons!34683 (h!36080 (_ BitVec 64)) (t!49381 List!34687)) )
))
(declare-fun noDuplicate!2619 (List!34687) Bool)

(assert (=> b!1497809 (= e!838726 (not (noDuplicate!2619 Nil!34684)))))

(declare-fun b!1497810 () Bool)

(declare-fun res!1018920 () Bool)

(assert (=> b!1497810 (=> (not res!1018920) (not e!838726))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497810 (= res!1018920 (and (= (size!48745 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48745 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48745 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497811 () Bool)

(declare-fun res!1018924 () Bool)

(assert (=> b!1497811 (=> (not res!1018924) (not e!838726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99865 (_ BitVec 32)) Bool)

(assert (=> b!1497811 (= res!1018924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497812 () Bool)

(declare-fun res!1018921 () Bool)

(assert (=> b!1497812 (=> (not res!1018921) (not e!838726))))

(assert (=> b!1497812 (= res!1018921 (validKeyInArray!0 (select (arr!48195 a!2850) j!87)))))

(assert (= (and start!127424 res!1018919) b!1497810))

(assert (= (and b!1497810 res!1018920) b!1497807))

(assert (= (and b!1497807 res!1018923) b!1497812))

(assert (= (and b!1497812 res!1018921) b!1497811))

(assert (= (and b!1497811 res!1018924) b!1497808))

(assert (= (and b!1497808 res!1018922) b!1497809))

(declare-fun m!1380887 () Bool)

(assert (=> b!1497812 m!1380887))

(assert (=> b!1497812 m!1380887))

(declare-fun m!1380889 () Bool)

(assert (=> b!1497812 m!1380889))

(declare-fun m!1380891 () Bool)

(assert (=> b!1497809 m!1380891))

(declare-fun m!1380893 () Bool)

(assert (=> start!127424 m!1380893))

(declare-fun m!1380895 () Bool)

(assert (=> start!127424 m!1380895))

(declare-fun m!1380897 () Bool)

(assert (=> b!1497811 m!1380897))

(declare-fun m!1380899 () Bool)

(assert (=> b!1497807 m!1380899))

(assert (=> b!1497807 m!1380899))

(declare-fun m!1380901 () Bool)

(assert (=> b!1497807 m!1380901))

(check-sat (not start!127424) (not b!1497809) (not b!1497807) (not b!1497811) (not b!1497812))
(check-sat)
(get-model)

(declare-fun d!157461 () Bool)

(declare-fun res!1018947 () Bool)

(declare-fun e!838737 () Bool)

(assert (=> d!157461 (=> res!1018947 e!838737)))

(get-info :version)

(assert (=> d!157461 (= res!1018947 ((_ is Nil!34684) Nil!34684))))

(assert (=> d!157461 (= (noDuplicate!2619 Nil!34684) e!838737)))

(declare-fun b!1497835 () Bool)

(declare-fun e!838738 () Bool)

(assert (=> b!1497835 (= e!838737 e!838738)))

(declare-fun res!1018948 () Bool)

(assert (=> b!1497835 (=> (not res!1018948) (not e!838738))))

(declare-fun contains!9937 (List!34687 (_ BitVec 64)) Bool)

(assert (=> b!1497835 (= res!1018948 (not (contains!9937 (t!49381 Nil!34684) (h!36080 Nil!34684))))))

(declare-fun b!1497836 () Bool)

(assert (=> b!1497836 (= e!838738 (noDuplicate!2619 (t!49381 Nil!34684)))))

(assert (= (and d!157461 (not res!1018947)) b!1497835))

(assert (= (and b!1497835 res!1018948) b!1497836))

(declare-fun m!1380919 () Bool)

(assert (=> b!1497835 m!1380919))

(declare-fun m!1380921 () Bool)

(assert (=> b!1497836 m!1380921))

(assert (=> b!1497809 d!157461))

(declare-fun bm!68049 () Bool)

(declare-fun call!68052 () Bool)

(assert (=> bm!68049 (= call!68052 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1497846 () Bool)

(declare-fun e!838747 () Bool)

(assert (=> b!1497846 (= e!838747 call!68052)))

(declare-fun b!1497847 () Bool)

(declare-fun e!838746 () Bool)

(assert (=> b!1497847 (= e!838746 call!68052)))

(declare-fun b!1497848 () Bool)

(assert (=> b!1497848 (= e!838747 e!838746)))

(declare-fun lt!652538 () (_ BitVec 64))

(assert (=> b!1497848 (= lt!652538 (select (arr!48195 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50196 0))(
  ( (Unit!50197) )
))
(declare-fun lt!652539 () Unit!50196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99865 (_ BitVec 64) (_ BitVec 32)) Unit!50196)

(assert (=> b!1497848 (= lt!652539 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652538 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497848 (arrayContainsKey!0 a!2850 lt!652538 #b00000000000000000000000000000000)))

(declare-fun lt!652540 () Unit!50196)

(assert (=> b!1497848 (= lt!652540 lt!652539)))

(declare-fun res!1018954 () Bool)

(declare-datatypes ((SeekEntryResult!12428 0))(
  ( (MissingZero!12428 (index!52104 (_ BitVec 32))) (Found!12428 (index!52105 (_ BitVec 32))) (Intermediate!12428 (undefined!13240 Bool) (index!52106 (_ BitVec 32)) (x!133742 (_ BitVec 32))) (Undefined!12428) (MissingVacant!12428 (index!52107 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99865 (_ BitVec 32)) SeekEntryResult!12428)

(assert (=> b!1497848 (= res!1018954 (= (seekEntryOrOpen!0 (select (arr!48195 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12428 #b00000000000000000000000000000000)))))

(assert (=> b!1497848 (=> (not res!1018954) (not e!838746))))

(declare-fun d!157463 () Bool)

(declare-fun res!1018953 () Bool)

(declare-fun e!838745 () Bool)

(assert (=> d!157463 (=> res!1018953 e!838745)))

(assert (=> d!157463 (= res!1018953 (bvsge #b00000000000000000000000000000000 (size!48745 a!2850)))))

(assert (=> d!157463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838745)))

(declare-fun b!1497845 () Bool)

(assert (=> b!1497845 (= e!838745 e!838747)))

(declare-fun c!138980 () Bool)

(assert (=> b!1497845 (= c!138980 (validKeyInArray!0 (select (arr!48195 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157463 (not res!1018953)) b!1497845))

(assert (= (and b!1497845 c!138980) b!1497848))

(assert (= (and b!1497845 (not c!138980)) b!1497846))

(assert (= (and b!1497848 res!1018954) b!1497847))

(assert (= (or b!1497847 b!1497846) bm!68049))

(declare-fun m!1380923 () Bool)

(assert (=> bm!68049 m!1380923))

(declare-fun m!1380925 () Bool)

(assert (=> b!1497848 m!1380925))

(declare-fun m!1380927 () Bool)

(assert (=> b!1497848 m!1380927))

(declare-fun m!1380929 () Bool)

(assert (=> b!1497848 m!1380929))

(assert (=> b!1497848 m!1380925))

(declare-fun m!1380931 () Bool)

(assert (=> b!1497848 m!1380931))

(assert (=> b!1497845 m!1380925))

(assert (=> b!1497845 m!1380925))

(declare-fun m!1380933 () Bool)

(assert (=> b!1497845 m!1380933))

(assert (=> b!1497811 d!157463))

(declare-fun d!157469 () Bool)

(assert (=> d!157469 (= (validKeyInArray!0 (select (arr!48195 a!2850) i!996)) (and (not (= (select (arr!48195 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48195 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497807 d!157469))

(declare-fun d!157471 () Bool)

(assert (=> d!157471 (= (validKeyInArray!0 (select (arr!48195 a!2850) j!87)) (and (not (= (select (arr!48195 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48195 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497812 d!157471))

(declare-fun d!157473 () Bool)

(assert (=> d!157473 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127424 d!157473))

(declare-fun d!157481 () Bool)

(assert (=> d!157481 (= (array_inv!37223 a!2850) (bvsge (size!48745 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127424 d!157481))

(check-sat (not b!1497848) (not b!1497845) (not b!1497835) (not bm!68049) (not b!1497836))
(check-sat)
