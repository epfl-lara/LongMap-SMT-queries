; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128326 () Bool)

(assert start!128326)

(declare-fun b!1505759 () Bool)

(declare-fun e!841582 () Bool)

(declare-datatypes ((List!34946 0))(
  ( (Nil!34943) (Cons!34942 (h!36339 (_ BitVec 64)) (t!49640 List!34946)) )
))
(declare-fun contains!9960 (List!34946 (_ BitVec 64)) Bool)

(assert (=> b!1505759 (= e!841582 (contains!9960 Nil!34943 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505760 () Bool)

(declare-fun e!841581 () Bool)

(assert (=> b!1505760 (= e!841581 e!841582)))

(declare-fun res!1026170 () Bool)

(assert (=> b!1505760 (=> res!1026170 e!841582)))

(assert (=> b!1505760 (= res!1026170 (contains!9960 Nil!34943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505761 () Bool)

(declare-fun res!1026171 () Bool)

(assert (=> b!1505761 (=> (not res!1026171) (not e!841581))))

(declare-datatypes ((array!100431 0))(
  ( (array!100432 (arr!48463 (Array (_ BitVec 32) (_ BitVec 64))) (size!49013 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100431)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505761 (= res!1026171 (validKeyInArray!0 (select (arr!48463 a!2804) j!70)))))

(declare-fun res!1026169 () Bool)

(assert (=> start!128326 (=> (not res!1026169) (not e!841581))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128326 (= res!1026169 (validMask!0 mask!2512))))

(assert (=> start!128326 e!841581))

(assert (=> start!128326 true))

(declare-fun array_inv!37491 (array!100431) Bool)

(assert (=> start!128326 (array_inv!37491 a!2804)))

(declare-fun b!1505758 () Bool)

(declare-fun res!1026172 () Bool)

(assert (=> b!1505758 (=> (not res!1026172) (not e!841581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100431 (_ BitVec 32)) Bool)

(assert (=> b!1505758 (= res!1026172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505762 () Bool)

(declare-fun res!1026174 () Bool)

(assert (=> b!1505762 (=> (not res!1026174) (not e!841581))))

(assert (=> b!1505762 (= res!1026174 (and (bvsle #b00000000000000000000000000000000 (size!49013 a!2804)) (bvslt (size!49013 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505763 () Bool)

(declare-fun res!1026168 () Bool)

(assert (=> b!1505763 (=> (not res!1026168) (not e!841581))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1505763 (= res!1026168 (validKeyInArray!0 (select (arr!48463 a!2804) i!961)))))

(declare-fun b!1505764 () Bool)

(declare-fun res!1026175 () Bool)

(assert (=> b!1505764 (=> (not res!1026175) (not e!841581))))

(declare-fun noDuplicate!2629 (List!34946) Bool)

(assert (=> b!1505764 (= res!1026175 (noDuplicate!2629 Nil!34943))))

(declare-fun b!1505765 () Bool)

(declare-fun res!1026173 () Bool)

(assert (=> b!1505765 (=> (not res!1026173) (not e!841581))))

(assert (=> b!1505765 (= res!1026173 (and (= (size!49013 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49013 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49013 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128326 res!1026169) b!1505765))

(assert (= (and b!1505765 res!1026173) b!1505763))

(assert (= (and b!1505763 res!1026168) b!1505761))

(assert (= (and b!1505761 res!1026171) b!1505758))

(assert (= (and b!1505758 res!1026172) b!1505762))

(assert (= (and b!1505762 res!1026174) b!1505764))

(assert (= (and b!1505764 res!1026175) b!1505760))

(assert (= (and b!1505760 (not res!1026170)) b!1505759))

(declare-fun m!1388825 () Bool)

(assert (=> b!1505760 m!1388825))

(declare-fun m!1388827 () Bool)

(assert (=> b!1505763 m!1388827))

(assert (=> b!1505763 m!1388827))

(declare-fun m!1388829 () Bool)

(assert (=> b!1505763 m!1388829))

(declare-fun m!1388831 () Bool)

(assert (=> b!1505761 m!1388831))

(assert (=> b!1505761 m!1388831))

(declare-fun m!1388833 () Bool)

(assert (=> b!1505761 m!1388833))

(declare-fun m!1388835 () Bool)

(assert (=> b!1505759 m!1388835))

(declare-fun m!1388837 () Bool)

(assert (=> start!128326 m!1388837))

(declare-fun m!1388839 () Bool)

(assert (=> start!128326 m!1388839))

(declare-fun m!1388841 () Bool)

(assert (=> b!1505758 m!1388841))

(declare-fun m!1388843 () Bool)

(assert (=> b!1505764 m!1388843))

(push 1)

(assert (not b!1505760))

(assert (not b!1505758))

(assert (not b!1505763))

(assert (not b!1505759))

(assert (not b!1505764))

(assert (not b!1505761))

(assert (not start!128326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158105 () Bool)

(declare-fun lt!654079 () Bool)

(declare-fun content!785 (List!34946) (Set (_ BitVec 64)))

(assert (=> d!158105 (= lt!654079 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!785 Nil!34943)))))

(declare-fun e!841588 () Bool)

(assert (=> d!158105 (= lt!654079 e!841588)))

(declare-fun res!1026180 () Bool)

(assert (=> d!158105 (=> (not res!1026180) (not e!841588))))

(assert (=> d!158105 (= res!1026180 (is-Cons!34942 Nil!34943))))

(assert (=> d!158105 (= (contains!9960 Nil!34943 #b0000000000000000000000000000000000000000000000000000000000000000) lt!654079)))

(declare-fun b!1505770 () Bool)

(declare-fun e!841587 () Bool)

(assert (=> b!1505770 (= e!841588 e!841587)))

(declare-fun res!1026181 () Bool)

(assert (=> b!1505770 (=> res!1026181 e!841587)))

(assert (=> b!1505770 (= res!1026181 (= (h!36339 Nil!34943) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505771 () Bool)

(assert (=> b!1505771 (= e!841587 (contains!9960 (t!49640 Nil!34943) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158105 res!1026180) b!1505770))

(assert (= (and b!1505770 (not res!1026181)) b!1505771))

(declare-fun m!1388845 () Bool)

(assert (=> d!158105 m!1388845))

(declare-fun m!1388847 () Bool)

(assert (=> d!158105 m!1388847))

(declare-fun m!1388849 () Bool)

(assert (=> b!1505771 m!1388849))

(assert (=> b!1505760 d!158105))

(declare-fun d!158109 () Bool)

(assert (=> d!158109 (= (validKeyInArray!0 (select (arr!48463 a!2804) j!70)) (and (not (= (select (arr!48463 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48463 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505761 d!158109))

(declare-fun d!158111 () Bool)

(declare-fun lt!654080 () Bool)

(assert (=> d!158111 (= lt!654080 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!785 Nil!34943)))))

(declare-fun e!841590 () Bool)

(assert (=> d!158111 (= lt!654080 e!841590)))

(declare-fun res!1026182 () Bool)

(assert (=> d!158111 (=> (not res!1026182) (not e!841590))))

(assert (=> d!158111 (= res!1026182 (is-Cons!34942 Nil!34943))))

(assert (=> d!158111 (= (contains!9960 Nil!34943 #b1000000000000000000000000000000000000000000000000000000000000000) lt!654080)))

(declare-fun b!1505772 () Bool)

(declare-fun e!841589 () Bool)

(assert (=> b!1505772 (= e!841590 e!841589)))

(declare-fun res!1026183 () Bool)

(assert (=> b!1505772 (=> res!1026183 e!841589)))

(assert (=> b!1505772 (= res!1026183 (= (h!36339 Nil!34943) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505773 () Bool)

(assert (=> b!1505773 (= e!841589 (contains!9960 (t!49640 Nil!34943) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158111 res!1026182) b!1505772))

(assert (= (and b!1505772 (not res!1026183)) b!1505773))

(assert (=> d!158111 m!1388845))

(declare-fun m!1388851 () Bool)

(assert (=> d!158111 m!1388851))

(declare-fun m!1388853 () Bool)

(assert (=> b!1505773 m!1388853))

(assert (=> b!1505759 d!158111))

(declare-fun d!158113 () Bool)

(declare-fun res!1026188 () Bool)

(declare-fun e!841595 () Bool)

(assert (=> d!158113 (=> res!1026188 e!841595)))

(assert (=> d!158113 (= res!1026188 (is-Nil!34943 Nil!34943))))

(assert (=> d!158113 (= (noDuplicate!2629 Nil!34943) e!841595)))

(declare-fun b!1505778 () Bool)

(declare-fun e!841596 () Bool)

(assert (=> b!1505778 (= e!841595 e!841596)))

(declare-fun res!1026189 () Bool)

(assert (=> b!1505778 (=> (not res!1026189) (not e!841596))))

(assert (=> b!1505778 (= res!1026189 (not (contains!9960 (t!49640 Nil!34943) (h!36339 Nil!34943))))))

(declare-fun b!1505779 () Bool)

(assert (=> b!1505779 (= e!841596 (noDuplicate!2629 (t!49640 Nil!34943)))))

(assert (= (and d!158113 (not res!1026188)) b!1505778))

(assert (= (and b!1505778 res!1026189) b!1505779))

(declare-fun m!1388855 () Bool)

(assert (=> b!1505778 m!1388855))

(declare-fun m!1388857 () Bool)

(assert (=> b!1505779 m!1388857))

(assert (=> b!1505764 d!158113))

(declare-fun d!158119 () Bool)

(assert (=> d!158119 (= (validKeyInArray!0 (select (arr!48463 a!2804) i!961)) (and (not (= (select (arr!48463 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48463 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505763 d!158119))

(declare-fun bm!68193 () Bool)

(declare-fun call!68196 () Bool)

(assert (=> bm!68193 (= call!68196 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505812 () Bool)

(declare-fun e!841629 () Bool)

(declare-fun e!841628 () Bool)

(assert (=> b!1505812 (= e!841629 e!841628)))

(declare-fun c!139331 () Bool)

(assert (=> b!1505812 (= c!139331 (validKeyInArray!0 (select (arr!48463 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505813 () Bool)

(assert (=> b!1505813 (= e!841628 call!68196)))

(declare-fun d!158121 () Bool)

(declare-fun res!1026218 () Bool)

(assert (=> d!158121 (=> res!1026218 e!841629)))

(assert (=> d!158121 (= res!1026218 (bvsge #b00000000000000000000000000000000 (size!49013 a!2804)))))

(assert (=> d!158121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841629)))

(declare-fun b!1505814 () Bool)

(declare-fun e!841627 () Bool)

(assert (=> b!1505814 (= e!841628 e!841627)))

(declare-fun lt!654095 () (_ BitVec 64))

(assert (=> b!1505814 (= lt!654095 (select (arr!48463 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50312 0))(
  ( (Unit!50313) )
))
(declare-fun lt!654093 () Unit!50312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100431 (_ BitVec 64) (_ BitVec 32)) Unit!50312)

(assert (=> b!1505814 (= lt!654093 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654095 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505814 (arrayContainsKey!0 a!2804 lt!654095 #b00000000000000000000000000000000)))

(declare-fun lt!654094 () Unit!50312)

(assert (=> b!1505814 (= lt!654094 lt!654093)))

(declare-fun res!1026219 () Bool)

(declare-datatypes ((SeekEntryResult!12653 0))(
  ( (MissingZero!12653 (index!53007 (_ BitVec 32))) (Found!12653 (index!53008 (_ BitVec 32))) (Intermediate!12653 (undefined!13465 Bool) (index!53009 (_ BitVec 32)) (x!134712 (_ BitVec 32))) (Undefined!12653) (MissingVacant!12653 (index!53010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100431 (_ BitVec 32)) SeekEntryResult!12653)

(assert (=> b!1505814 (= res!1026219 (= (seekEntryOrOpen!0 (select (arr!48463 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12653 #b00000000000000000000000000000000)))))

(assert (=> b!1505814 (=> (not res!1026219) (not e!841627))))

(declare-fun b!1505815 () Bool)

