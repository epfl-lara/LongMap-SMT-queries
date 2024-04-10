; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128370 () Bool)

(assert start!128370)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1505910 () Bool)

(declare-fun e!841675 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100442 0))(
  ( (array!100443 (arr!48467 (Array (_ BitVec 32) (_ BitVec 64))) (size!49017 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100442)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505910 (= e!841675 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49017 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49017 a!2804)) (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1505911 () Bool)

(declare-fun res!1026305 () Bool)

(assert (=> b!1505911 (=> (not res!1026305) (not e!841675))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505911 (= res!1026305 (validKeyInArray!0 (select (arr!48467 a!2804) i!961)))))

(declare-fun res!1026306 () Bool)

(assert (=> start!128370 (=> (not res!1026306) (not e!841675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128370 (= res!1026306 (validMask!0 mask!2512))))

(assert (=> start!128370 e!841675))

(assert (=> start!128370 true))

(declare-fun array_inv!37495 (array!100442) Bool)

(assert (=> start!128370 (array_inv!37495 a!2804)))

(declare-fun b!1505912 () Bool)

(declare-fun res!1026303 () Bool)

(assert (=> b!1505912 (=> (not res!1026303) (not e!841675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100442 (_ BitVec 32)) Bool)

(assert (=> b!1505912 (= res!1026303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505913 () Bool)

(declare-fun res!1026307 () Bool)

(assert (=> b!1505913 (=> (not res!1026307) (not e!841675))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505913 (= res!1026307 (and (= (size!49017 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49017 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49017 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505914 () Bool)

(declare-fun res!1026302 () Bool)

(assert (=> b!1505914 (=> (not res!1026302) (not e!841675))))

(assert (=> b!1505914 (= res!1026302 (validKeyInArray!0 (select (arr!48467 a!2804) j!70)))))

(declare-fun b!1505915 () Bool)

(declare-fun res!1026304 () Bool)

(assert (=> b!1505915 (=> (not res!1026304) (not e!841675))))

(declare-datatypes ((List!34950 0))(
  ( (Nil!34947) (Cons!34946 (h!36343 (_ BitVec 64)) (t!49644 List!34950)) )
))
(declare-fun arrayNoDuplicates!0 (array!100442 (_ BitVec 32) List!34950) Bool)

(assert (=> b!1505915 (= res!1026304 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34947))))

(assert (= (and start!128370 res!1026306) b!1505913))

(assert (= (and b!1505913 res!1026307) b!1505911))

(assert (= (and b!1505911 res!1026305) b!1505914))

(assert (= (and b!1505914 res!1026302) b!1505912))

(assert (= (and b!1505912 res!1026303) b!1505915))

(assert (= (and b!1505915 res!1026304) b!1505910))

(declare-fun m!1388971 () Bool)

(assert (=> b!1505912 m!1388971))

(declare-fun m!1388973 () Bool)

(assert (=> start!128370 m!1388973))

(declare-fun m!1388975 () Bool)

(assert (=> start!128370 m!1388975))

(declare-fun m!1388977 () Bool)

(assert (=> b!1505911 m!1388977))

(assert (=> b!1505911 m!1388977))

(declare-fun m!1388979 () Bool)

(assert (=> b!1505911 m!1388979))

(declare-fun m!1388981 () Bool)

(assert (=> b!1505915 m!1388981))

(declare-fun m!1388983 () Bool)

(assert (=> b!1505914 m!1388983))

(assert (=> b!1505914 m!1388983))

(declare-fun m!1388985 () Bool)

(assert (=> b!1505914 m!1388985))

(push 1)

(assert (not b!1505911))

(assert (not b!1505914))

(assert (not b!1505915))

(assert (not start!128370))

(assert (not b!1505912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158159 () Bool)

(assert (=> d!158159 (= (validKeyInArray!0 (select (arr!48467 a!2804) j!70)) (and (not (= (select (arr!48467 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48467 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505914 d!158159))

(declare-fun b!1506002 () Bool)

(declare-fun e!841729 () Bool)

(declare-fun e!841727 () Bool)

(assert (=> b!1506002 (= e!841729 e!841727)))

(declare-fun lt!654133 () (_ BitVec 64))

(assert (=> b!1506002 (= lt!654133 (select (arr!48467 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50316 0))(
  ( (Unit!50317) )
))
(declare-fun lt!654131 () Unit!50316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100442 (_ BitVec 64) (_ BitVec 32)) Unit!50316)

(assert (=> b!1506002 (= lt!654131 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654133 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1506002 (arrayContainsKey!0 a!2804 lt!654133 #b00000000000000000000000000000000)))

(declare-fun lt!654132 () Unit!50316)

(assert (=> b!1506002 (= lt!654132 lt!654131)))

(declare-fun res!1026373 () Bool)

(declare-datatypes ((SeekEntryResult!12655 0))(
  ( (MissingZero!12655 (index!53015 (_ BitVec 32))) (Found!12655 (index!53016 (_ BitVec 32))) (Intermediate!12655 (undefined!13467 Bool) (index!53017 (_ BitVec 32)) (x!134730 (_ BitVec 32))) (Undefined!12655) (MissingVacant!12655 (index!53018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100442 (_ BitVec 32)) SeekEntryResult!12655)

(assert (=> b!1506002 (= res!1026373 (= (seekEntryOrOpen!0 (select (arr!48467 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12655 #b00000000000000000000000000000000)))))

(assert (=> b!1506002 (=> (not res!1026373) (not e!841727))))

(declare-fun b!1506003 () Bool)

(declare-fun call!68214 () Bool)

(assert (=> b!1506003 (= e!841729 call!68214)))

(declare-fun b!1506004 () Bool)

(assert (=> b!1506004 (= e!841727 call!68214)))

(declare-fun b!1506005 () Bool)

(declare-fun e!841728 () Bool)

(assert (=> b!1506005 (= e!841728 e!841729)))

(declare-fun c!139349 () Bool)

(assert (=> b!1506005 (= c!139349 (validKeyInArray!0 (select (arr!48467 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158161 () Bool)

(declare-fun res!1026372 () Bool)

(assert (=> d!158161 (=> res!1026372 e!841728)))

(assert (=> d!158161 (= res!1026372 (bvsge #b00000000000000000000000000000000 (size!49017 a!2804)))))

(assert (=> d!158161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841728)))

(declare-fun bm!68211 () Bool)

(assert (=> bm!68211 (= call!68214 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158161 (not res!1026372)) b!1506005))

(assert (= (and b!1506005 c!139349) b!1506002))

(assert (= (and b!1506005 (not c!139349)) b!1506003))

(assert (= (and b!1506002 res!1026373) b!1506004))

(assert (= (or b!1506004 b!1506003) bm!68211))

(declare-fun m!1389043 () Bool)

(assert (=> b!1506002 m!1389043))

(declare-fun m!1389045 () Bool)

(assert (=> b!1506002 m!1389045))

(declare-fun m!1389047 () Bool)

