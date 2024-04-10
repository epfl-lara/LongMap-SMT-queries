; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130638 () Bool)

(assert start!130638)

(declare-fun b!1532641 () Bool)

(declare-fun res!1049749 () Bool)

(declare-fun e!853933 () Bool)

(assert (=> b!1532641 (=> (not res!1049749) (not e!853933))))

(declare-datatypes ((array!101769 0))(
  ( (array!101770 (arr!49102 (Array (_ BitVec 32) (_ BitVec 64))) (size!49652 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101769)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532641 (= res!1049749 (and (= (size!49652 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49652 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49652 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532642 () Bool)

(declare-fun res!1049751 () Bool)

(assert (=> b!1532642 (=> (not res!1049751) (not e!853933))))

(assert (=> b!1532642 (= res!1049751 (and (bvsle #b00000000000000000000000000000000 (size!49652 a!2792)) (bvslt (size!49652 a!2792) #b01111111111111111111111111111111)))))

(declare-fun b!1532643 () Bool)

(declare-fun e!853932 () Bool)

(declare-datatypes ((List!35576 0))(
  ( (Nil!35573) (Cons!35572 (h!37017 (_ BitVec 64)) (t!50270 List!35576)) )
))
(declare-fun contains!10009 (List!35576 (_ BitVec 64)) Bool)

(assert (=> b!1532643 (= e!853932 (contains!10009 Nil!35573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532644 () Bool)

(declare-fun res!1049748 () Bool)

(assert (=> b!1532644 (=> (not res!1049748) (not e!853933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101769 (_ BitVec 32)) Bool)

(assert (=> b!1532644 (= res!1049748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532645 () Bool)

(assert (=> b!1532645 (= e!853933 e!853932)))

(declare-fun res!1049745 () Bool)

(assert (=> b!1532645 (=> res!1049745 e!853932)))

(assert (=> b!1532645 (= res!1049745 (contains!10009 Nil!35573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532646 () Bool)

(declare-fun res!1049747 () Bool)

(assert (=> b!1532646 (=> (not res!1049747) (not e!853933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532646 (= res!1049747 (validKeyInArray!0 (select (arr!49102 a!2792) i!951)))))

(declare-fun b!1532647 () Bool)

(declare-fun res!1049750 () Bool)

(assert (=> b!1532647 (=> (not res!1049750) (not e!853933))))

(assert (=> b!1532647 (= res!1049750 (validKeyInArray!0 (select (arr!49102 a!2792) j!64)))))

(declare-fun b!1532648 () Bool)

(declare-fun res!1049752 () Bool)

(assert (=> b!1532648 (=> (not res!1049752) (not e!853933))))

(declare-fun noDuplicate!2635 (List!35576) Bool)

(assert (=> b!1532648 (= res!1049752 (noDuplicate!2635 Nil!35573))))

(declare-fun res!1049746 () Bool)

(assert (=> start!130638 (=> (not res!1049746) (not e!853933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130638 (= res!1049746 (validMask!0 mask!2480))))

(assert (=> start!130638 e!853933))

(assert (=> start!130638 true))

(declare-fun array_inv!38130 (array!101769) Bool)

(assert (=> start!130638 (array_inv!38130 a!2792)))

(assert (= (and start!130638 res!1049746) b!1532641))

(assert (= (and b!1532641 res!1049749) b!1532646))

(assert (= (and b!1532646 res!1049747) b!1532647))

(assert (= (and b!1532647 res!1049750) b!1532644))

(assert (= (and b!1532644 res!1049748) b!1532642))

(assert (= (and b!1532642 res!1049751) b!1532648))

(assert (= (and b!1532648 res!1049752) b!1532645))

(assert (= (and b!1532645 (not res!1049745)) b!1532643))

(declare-fun m!1415341 () Bool)

(assert (=> b!1532644 m!1415341))

(declare-fun m!1415343 () Bool)

(assert (=> start!130638 m!1415343))

(declare-fun m!1415345 () Bool)

(assert (=> start!130638 m!1415345))

(declare-fun m!1415347 () Bool)

(assert (=> b!1532645 m!1415347))

(declare-fun m!1415349 () Bool)

(assert (=> b!1532648 m!1415349))

(declare-fun m!1415351 () Bool)

(assert (=> b!1532643 m!1415351))

(declare-fun m!1415353 () Bool)

(assert (=> b!1532646 m!1415353))

(assert (=> b!1532646 m!1415353))

(declare-fun m!1415355 () Bool)

(assert (=> b!1532646 m!1415355))

(declare-fun m!1415357 () Bool)

(assert (=> b!1532647 m!1415357))

(assert (=> b!1532647 m!1415357))

(declare-fun m!1415359 () Bool)

(assert (=> b!1532647 m!1415359))

(push 1)

(assert (not b!1532648))

(assert (not b!1532647))

(assert (not b!1532645))

(assert (not b!1532644))

(assert (not start!130638))

(assert (not b!1532643))

(assert (not b!1532646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160117 () Bool)

(declare-fun res!1049757 () Bool)

(declare-fun e!853938 () Bool)

(assert (=> d!160117 (=> res!1049757 e!853938)))

(assert (=> d!160117 (= res!1049757 (is-Nil!35573 Nil!35573))))

(assert (=> d!160117 (= (noDuplicate!2635 Nil!35573) e!853938)))

(declare-fun b!1532653 () Bool)

(declare-fun e!853939 () Bool)

(assert (=> b!1532653 (= e!853938 e!853939)))

(declare-fun res!1049758 () Bool)

(assert (=> b!1532653 (=> (not res!1049758) (not e!853939))))

(assert (=> b!1532653 (= res!1049758 (not (contains!10009 (t!50270 Nil!35573) (h!37017 Nil!35573))))))

(declare-fun b!1532654 () Bool)

(assert (=> b!1532654 (= e!853939 (noDuplicate!2635 (t!50270 Nil!35573)))))

(assert (= (and d!160117 (not res!1049757)) b!1532653))

(assert (= (and b!1532653 res!1049758) b!1532654))

(declare-fun m!1415361 () Bool)

(assert (=> b!1532653 m!1415361))

(declare-fun m!1415363 () Bool)

(assert (=> b!1532654 m!1415363))

(assert (=> b!1532648 d!160117))

(declare-fun d!160123 () Bool)

(assert (=> d!160123 (= (validKeyInArray!0 (select (arr!49102 a!2792) j!64)) (and (not (= (select (arr!49102 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49102 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532647 d!160123))

(declare-fun d!160125 () Bool)

(assert (=> d!160125 (= (validKeyInArray!0 (select (arr!49102 a!2792) i!951)) (and (not (= (select (arr!49102 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49102 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532646 d!160125))

(declare-fun d!160127 () Bool)

(declare-fun lt!663697 () Bool)

(declare-fun content!790 (List!35576) (Set (_ BitVec 64)))

(assert (=> d!160127 (= lt!663697 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!790 Nil!35573)))))

(declare-fun e!853956 () Bool)

(assert (=> d!160127 (= lt!663697 e!853956)))

(declare-fun res!1049775 () Bool)

(assert (=> d!160127 (=> (not res!1049775) (not e!853956))))

(assert (=> d!160127 (= res!1049775 (is-Cons!35572 Nil!35573))))

(assert (=> d!160127 (= (contains!10009 Nil!35573 #b0000000000000000000000000000000000000000000000000000000000000000) lt!663697)))

(declare-fun b!1532671 () Bool)

(declare-fun e!853957 () Bool)

(assert (=> b!1532671 (= e!853956 e!853957)))

(declare-fun res!1049776 () Bool)

(assert (=> b!1532671 (=> res!1049776 e!853957)))

(assert (=> b!1532671 (= res!1049776 (= (h!37017 Nil!35573) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532672 () Bool)

(assert (=> b!1532672 (= e!853957 (contains!10009 (t!50270 Nil!35573) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160127 res!1049775) b!1532671))

(assert (= (and b!1532671 (not res!1049776)) b!1532672))

(declare-fun m!1415375 () Bool)

(assert (=> d!160127 m!1415375))

(declare-fun m!1415377 () Bool)

(assert (=> d!160127 m!1415377))

(declare-fun m!1415379 () Bool)

(assert (=> b!1532672 m!1415379))

(assert (=> b!1532645 d!160127))

(declare-fun d!160137 () Bool)

(assert (=> d!160137 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130638 d!160137))

(declare-fun d!160139 () Bool)

(assert (=> d!160139 (= (array_inv!38130 a!2792) (bvsge (size!49652 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130638 d!160139))

(declare-fun bm!68574 () Bool)

(declare-fun call!68577 () Bool)

(assert (=> bm!68574 (= call!68577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1532699 () Bool)

(declare-fun e!853979 () Bool)

(assert (=> b!1532699 (= e!853979 call!68577)))

(declare-fun d!160141 () Bool)

(declare-fun res!1049793 () Bool)

(declare-fun e!853980 () Bool)

(assert (=> d!160141 (=> res!1049793 e!853980)))

(assert (=> d!160141 (= res!1049793 (bvsge #b00000000000000000000000000000000 (size!49652 a!2792)))))

(assert (=> d!160141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853980)))

(declare-fun b!1532700 () Bool)

(declare-fun e!853981 () Bool)

(assert (=> b!1532700 (= e!853980 e!853981)))

(declare-fun c!141011 () Bool)

(assert (=> b!1532700 (= c!141011 (validKeyInArray!0 (select (arr!49102 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1532701 () Bool)

(assert (=> b!1532701 (= e!853981 e!853979)))

(declare-fun lt!663717 () (_ BitVec 64))

(assert (=> b!1532701 (= lt!663717 (select (arr!49102 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51304 0))(
  ( (Unit!51305) )
))
(declare-fun lt!663716 () Unit!51304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101769 (_ BitVec 64) (_ BitVec 32)) Unit!51304)

(assert (=> b!1532701 (= lt!663716 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663717 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532701 (arrayContainsKey!0 a!2792 lt!663717 #b00000000000000000000000000000000)))

(declare-fun lt!663718 () Unit!51304)

(assert (=> b!1532701 (= lt!663718 lt!663716)))

(declare-fun res!1049794 () Bool)

(declare-datatypes ((SeekEntryResult!13258 0))(
  ( (MissingZero!13258 (index!55427 (_ BitVec 32))) (Found!13258 (index!55428 (_ BitVec 32))) (Intermediate!13258 (undefined!14070 Bool) (index!55429 (_ BitVec 32)) (x!137140 (_ BitVec 32))) (Undefined!13258) (MissingVacant!13258 (index!55430 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101769 (_ BitVec 32)) SeekEntryResult!13258)

(assert (=> b!1532701 (= res!1049794 (= (seekEntryOrOpen!0 (select (arr!49102 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13258 #b00000000000000000000000000000000)))))

(assert (=> b!1532701 (=> (not res!1049794) (not e!853979))))

(declare-fun b!1532702 () Bool)

(assert (=> b!1532702 (= e!853981 call!68577)))

(assert (= (and d!160141 (not res!1049793)) b!1532700))

(assert (= (and b!1532700 c!141011) b!1532701))

(assert (= (and b!1532700 (not c!141011)) b!1532702))

(assert (= (and b!1532701 res!1049794) b!1532699))

(assert (= (or b!1532699 b!1532702) bm!68574))

(declare-fun m!1415397 () Bool)

(assert (=> bm!68574 m!1415397))

(declare-fun m!1415399 () Bool)

(assert (=> b!1532700 m!1415399))

(assert (=> b!1532700 m!1415399))

(declare-fun m!1415401 () Bool)

(assert (=> b!1532700 m!1415401))

(assert (=> b!1532701 m!1415399))

(declare-fun m!1415403 () Bool)

(assert (=> b!1532701 m!1415403))

(declare-fun m!1415405 () Bool)

(assert (=> b!1532701 m!1415405))

(assert (=> b!1532701 m!1415399))

(declare-fun m!1415409 () Bool)

(assert (=> b!1532701 m!1415409))

(assert (=> b!1532644 d!160141))

(declare-fun d!160155 () Bool)

(declare-fun lt!663720 () Bool)

(assert (=> d!160155 (= lt!663720 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!790 Nil!35573)))))

(declare-fun e!853988 () Bool)

(assert (=> d!160155 (= lt!663720 e!853988)))

(declare-fun res!1049801 () Bool)

(assert (=> d!160155 (=> (not res!1049801) (not e!853988))))

(assert (=> d!160155 (= res!1049801 (is-Cons!35572 Nil!35573))))

(assert (=> d!160155 (= (contains!10009 Nil!35573 #b1000000000000000000000000000000000000000000000000000000000000000) lt!663720)))

(declare-fun b!1532709 () Bool)

(declare-fun e!853989 () Bool)

(assert (=> b!1532709 (= e!853988 e!853989)))

(declare-fun res!1049802 () Bool)

(assert (=> b!1532709 (=> res!1049802 e!853989)))

(assert (=> b!1532709 (= res!1049802 (= (h!37017 Nil!35573) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532710 () Bool)

(assert (=> b!1532710 (= e!853989 (contains!10009 (t!50270 Nil!35573) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160155 res!1049801) b!1532709))

(assert (= (and b!1532709 (not res!1049802)) b!1532710))

(assert (=> d!160155 m!1415375))

(declare-fun m!1415415 () Bool)

(assert (=> d!160155 m!1415415))

(declare-fun m!1415417 () Bool)

(assert (=> b!1532710 m!1415417))

(assert (=> b!1532643 d!160155))

(push 1)

