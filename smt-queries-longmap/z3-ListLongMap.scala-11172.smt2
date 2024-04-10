; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130600 () Bool)

(assert start!130600)

(declare-fun b!1532499 () Bool)

(declare-fun e!853854 () Bool)

(declare-datatypes ((List!35572 0))(
  ( (Nil!35569) (Cons!35568 (h!37013 (_ BitVec 64)) (t!50266 List!35572)) )
))
(declare-fun noDuplicate!2631 (List!35572) Bool)

(assert (=> b!1532499 (= e!853854 (not (noDuplicate!2631 Nil!35569)))))

(declare-fun b!1532500 () Bool)

(declare-fun res!1049623 () Bool)

(assert (=> b!1532500 (=> (not res!1049623) (not e!853854))))

(declare-datatypes ((array!101758 0))(
  ( (array!101759 (arr!49098 (Array (_ BitVec 32) (_ BitVec 64))) (size!49648 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101758)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532500 (= res!1049623 (validKeyInArray!0 (select (arr!49098 a!2792) i!951)))))

(declare-fun b!1532502 () Bool)

(declare-fun res!1049624 () Bool)

(assert (=> b!1532502 (=> (not res!1049624) (not e!853854))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532502 (= res!1049624 (validKeyInArray!0 (select (arr!49098 a!2792) j!64)))))

(declare-fun b!1532503 () Bool)

(declare-fun res!1049626 () Bool)

(assert (=> b!1532503 (=> (not res!1049626) (not e!853854))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1532503 (= res!1049626 (and (= (size!49648 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49648 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49648 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532504 () Bool)

(declare-fun res!1049625 () Bool)

(assert (=> b!1532504 (=> (not res!1049625) (not e!853854))))

(assert (=> b!1532504 (= res!1049625 (and (bvsle #b00000000000000000000000000000000 (size!49648 a!2792)) (bvslt (size!49648 a!2792) #b01111111111111111111111111111111)))))

(declare-fun res!1049622 () Bool)

(assert (=> start!130600 (=> (not res!1049622) (not e!853854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130600 (= res!1049622 (validMask!0 mask!2480))))

(assert (=> start!130600 e!853854))

(assert (=> start!130600 true))

(declare-fun array_inv!38126 (array!101758) Bool)

(assert (=> start!130600 (array_inv!38126 a!2792)))

(declare-fun b!1532501 () Bool)

(declare-fun res!1049621 () Bool)

(assert (=> b!1532501 (=> (not res!1049621) (not e!853854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101758 (_ BitVec 32)) Bool)

(assert (=> b!1532501 (= res!1049621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130600 res!1049622) b!1532503))

(assert (= (and b!1532503 res!1049626) b!1532500))

(assert (= (and b!1532500 res!1049623) b!1532502))

(assert (= (and b!1532502 res!1049624) b!1532501))

(assert (= (and b!1532501 res!1049621) b!1532504))

(assert (= (and b!1532504 res!1049625) b!1532499))

(declare-fun m!1415221 () Bool)

(assert (=> b!1532499 m!1415221))

(declare-fun m!1415223 () Bool)

(assert (=> b!1532500 m!1415223))

(assert (=> b!1532500 m!1415223))

(declare-fun m!1415225 () Bool)

(assert (=> b!1532500 m!1415225))

(declare-fun m!1415227 () Bool)

(assert (=> start!130600 m!1415227))

(declare-fun m!1415229 () Bool)

(assert (=> start!130600 m!1415229))

(declare-fun m!1415231 () Bool)

(assert (=> b!1532501 m!1415231))

(declare-fun m!1415233 () Bool)

(assert (=> b!1532502 m!1415233))

(assert (=> b!1532502 m!1415233))

(declare-fun m!1415235 () Bool)

(assert (=> b!1532502 m!1415235))

(check-sat (not b!1532501) (not start!130600) (not b!1532502) (not b!1532500) (not b!1532499))
(check-sat)
(get-model)

(declare-fun d!160079 () Bool)

(declare-fun res!1049655 () Bool)

(declare-fun e!853872 () Bool)

(assert (=> d!160079 (=> res!1049655 e!853872)))

(get-info :version)

(assert (=> d!160079 (= res!1049655 ((_ is Nil!35569) Nil!35569))))

(assert (=> d!160079 (= (noDuplicate!2631 Nil!35569) e!853872)))

(declare-fun b!1532533 () Bool)

(declare-fun e!853873 () Bool)

(assert (=> b!1532533 (= e!853872 e!853873)))

(declare-fun res!1049656 () Bool)

(assert (=> b!1532533 (=> (not res!1049656) (not e!853873))))

(declare-fun contains!10006 (List!35572 (_ BitVec 64)) Bool)

(assert (=> b!1532533 (= res!1049656 (not (contains!10006 (t!50266 Nil!35569) (h!37013 Nil!35569))))))

(declare-fun b!1532534 () Bool)

(assert (=> b!1532534 (= e!853873 (noDuplicate!2631 (t!50266 Nil!35569)))))

(assert (= (and d!160079 (not res!1049655)) b!1532533))

(assert (= (and b!1532533 res!1049656) b!1532534))

(declare-fun m!1415257 () Bool)

(assert (=> b!1532533 m!1415257))

(declare-fun m!1415259 () Bool)

(assert (=> b!1532534 m!1415259))

(assert (=> b!1532499 d!160079))

(declare-fun d!160083 () Bool)

(assert (=> d!160083 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130600 d!160083))

(declare-fun d!160095 () Bool)

(assert (=> d!160095 (= (array_inv!38126 a!2792) (bvsge (size!49648 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130600 d!160095))

(declare-fun d!160097 () Bool)

(assert (=> d!160097 (= (validKeyInArray!0 (select (arr!49098 a!2792) i!951)) (and (not (= (select (arr!49098 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49098 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532500 d!160097))

(declare-fun bm!68568 () Bool)

(declare-fun call!68571 () Bool)

(assert (=> bm!68568 (= call!68571 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1532573 () Bool)

(declare-fun e!853906 () Bool)

(assert (=> b!1532573 (= e!853906 call!68571)))

(declare-fun d!160099 () Bool)

(declare-fun res!1049679 () Bool)

(declare-fun e!853905 () Bool)

(assert (=> d!160099 (=> res!1049679 e!853905)))

(assert (=> d!160099 (= res!1049679 (bvsge #b00000000000000000000000000000000 (size!49648 a!2792)))))

(assert (=> d!160099 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853905)))

(declare-fun b!1532574 () Bool)

(assert (=> b!1532574 (= e!853905 e!853906)))

(declare-fun c!141005 () Bool)

(assert (=> b!1532574 (= c!141005 (validKeyInArray!0 (select (arr!49098 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1532575 () Bool)

(declare-fun e!853904 () Bool)

(assert (=> b!1532575 (= e!853906 e!853904)))

(declare-fun lt!663691 () (_ BitVec 64))

(assert (=> b!1532575 (= lt!663691 (select (arr!49098 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51300 0))(
  ( (Unit!51301) )
))
(declare-fun lt!663689 () Unit!51300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101758 (_ BitVec 64) (_ BitVec 32)) Unit!51300)

(assert (=> b!1532575 (= lt!663689 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663691 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532575 (arrayContainsKey!0 a!2792 lt!663691 #b00000000000000000000000000000000)))

(declare-fun lt!663690 () Unit!51300)

(assert (=> b!1532575 (= lt!663690 lt!663689)))

(declare-fun res!1049680 () Bool)

(declare-datatypes ((SeekEntryResult!13256 0))(
  ( (MissingZero!13256 (index!55419 (_ BitVec 32))) (Found!13256 (index!55420 (_ BitVec 32))) (Intermediate!13256 (undefined!14068 Bool) (index!55421 (_ BitVec 32)) (x!137130 (_ BitVec 32))) (Undefined!13256) (MissingVacant!13256 (index!55422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101758 (_ BitVec 32)) SeekEntryResult!13256)

(assert (=> b!1532575 (= res!1049680 (= (seekEntryOrOpen!0 (select (arr!49098 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13256 #b00000000000000000000000000000000)))))

(assert (=> b!1532575 (=> (not res!1049680) (not e!853904))))

(declare-fun b!1532576 () Bool)

(assert (=> b!1532576 (= e!853904 call!68571)))

(assert (= (and d!160099 (not res!1049679)) b!1532574))

(assert (= (and b!1532574 c!141005) b!1532575))

(assert (= (and b!1532574 (not c!141005)) b!1532573))

(assert (= (and b!1532575 res!1049680) b!1532576))

(assert (= (or b!1532576 b!1532573) bm!68568))

(declare-fun m!1415289 () Bool)

(assert (=> bm!68568 m!1415289))

(declare-fun m!1415291 () Bool)

(assert (=> b!1532574 m!1415291))

(assert (=> b!1532574 m!1415291))

(declare-fun m!1415293 () Bool)

(assert (=> b!1532574 m!1415293))

(assert (=> b!1532575 m!1415291))

(declare-fun m!1415295 () Bool)

(assert (=> b!1532575 m!1415295))

(declare-fun m!1415297 () Bool)

(assert (=> b!1532575 m!1415297))

(assert (=> b!1532575 m!1415291))

(declare-fun m!1415299 () Bool)

(assert (=> b!1532575 m!1415299))

(assert (=> b!1532501 d!160099))

(declare-fun d!160109 () Bool)

(assert (=> d!160109 (= (validKeyInArray!0 (select (arr!49098 a!2792) j!64)) (and (not (= (select (arr!49098 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49098 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532502 d!160109))

(check-sat (not b!1532575) (not b!1532534) (not bm!68568) (not b!1532533) (not b!1532574))
(check-sat)
