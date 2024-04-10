; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69426 () Bool)

(assert start!69426)

(declare-fun b!809617 () Bool)

(declare-fun res!553346 () Bool)

(declare-fun e!448135 () Bool)

(assert (=> b!809617 (=> (not res!553346) (not e!448135))))

(declare-datatypes ((array!44024 0))(
  ( (array!44025 (arr!21086 (Array (_ BitVec 32) (_ BitVec 64))) (size!21507 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44024)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809617 (= res!553346 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809618 () Bool)

(declare-fun e!448134 () Bool)

(declare-fun e!448131 () Bool)

(assert (=> b!809618 (= e!448134 e!448131)))

(declare-fun res!553354 () Bool)

(assert (=> b!809618 (=> (not res!553354) (not e!448131))))

(declare-datatypes ((SeekEntryResult!8677 0))(
  ( (MissingZero!8677 (index!37076 (_ BitVec 32))) (Found!8677 (index!37077 (_ BitVec 32))) (Intermediate!8677 (undefined!9489 Bool) (index!37078 (_ BitVec 32)) (x!67877 (_ BitVec 32))) (Undefined!8677) (MissingVacant!8677 (index!37079 (_ BitVec 32))) )
))
(declare-fun lt!362850 () SeekEntryResult!8677)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!362849 () SeekEntryResult!8677)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809618 (= res!553354 (and (= lt!362850 lt!362849) (= lt!362849 (Found!8677 j!153)) (not (= (select (arr!21086 a!3170) index!1236) (select (arr!21086 a!3170) j!153)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44024 (_ BitVec 32)) SeekEntryResult!8677)

(assert (=> b!809618 (= lt!362849 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44024 (_ BitVec 32)) SeekEntryResult!8677)

(assert (=> b!809618 (= lt!362850 (seekEntryOrOpen!0 (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!553353 () Bool)

(assert (=> start!69426 (=> (not res!553353) (not e!448135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69426 (= res!553353 (validMask!0 mask!3266))))

(assert (=> start!69426 e!448135))

(assert (=> start!69426 true))

(declare-fun array_inv!16882 (array!44024) Bool)

(assert (=> start!69426 (array_inv!16882 a!3170)))

(declare-fun b!809619 () Bool)

(declare-fun e!448133 () Bool)

(assert (=> b!809619 (= e!448135 e!448133)))

(declare-fun res!553351 () Bool)

(assert (=> b!809619 (=> (not res!553351) (not e!448133))))

(declare-fun lt!362851 () SeekEntryResult!8677)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809619 (= res!553351 (or (= lt!362851 (MissingZero!8677 i!1163)) (= lt!362851 (MissingVacant!8677 i!1163))))))

(assert (=> b!809619 (= lt!362851 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809620 () Bool)

(declare-fun res!553355 () Bool)

(assert (=> b!809620 (=> (not res!553355) (not e!448133))))

(declare-datatypes ((List!15049 0))(
  ( (Nil!15046) (Cons!15045 (h!16174 (_ BitVec 64)) (t!21364 List!15049)) )
))
(declare-fun arrayNoDuplicates!0 (array!44024 (_ BitVec 32) List!15049) Bool)

(assert (=> b!809620 (= res!553355 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15046))))

(declare-fun b!809621 () Bool)

(declare-fun res!553345 () Bool)

(assert (=> b!809621 (=> (not res!553345) (not e!448135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809621 (= res!553345 (validKeyInArray!0 k!2044))))

(declare-fun b!809622 () Bool)

(declare-fun res!553347 () Bool)

(assert (=> b!809622 (=> (not res!553347) (not e!448133))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!809622 (= res!553347 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21507 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21086 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21507 a!3170)) (= (select (arr!21086 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809623 () Bool)

(declare-fun res!553349 () Bool)

(assert (=> b!809623 (=> (not res!553349) (not e!448135))))

(assert (=> b!809623 (= res!553349 (and (= (size!21507 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21507 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21507 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809624 () Bool)

(declare-fun res!553348 () Bool)

(assert (=> b!809624 (=> (not res!553348) (not e!448135))))

(assert (=> b!809624 (= res!553348 (validKeyInArray!0 (select (arr!21086 a!3170) j!153)))))

(declare-fun e!448132 () Bool)

(declare-fun lt!362847 () (_ BitVec 64))

(declare-fun b!809625 () Bool)

(declare-fun lt!362852 () (_ BitVec 32))

(declare-fun lt!362848 () array!44024)

(declare-fun lt!362846 () SeekEntryResult!8677)

(assert (=> b!809625 (= e!448132 (not (= lt!362846 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362852 vacantAfter!23 lt!362847 lt!362848 mask!3266))))))

(declare-fun b!809626 () Bool)

(assert (=> b!809626 (= e!448131 e!448132)))

(declare-fun res!553352 () Bool)

(assert (=> b!809626 (=> (not res!553352) (not e!448132))))

(assert (=> b!809626 (= res!553352 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!362852 #b00000000000000000000000000000000) (bvslt lt!362852 (size!21507 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809626 (= lt!362852 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809627 () Bool)

(declare-fun res!553344 () Bool)

(assert (=> b!809627 (=> (not res!553344) (not e!448133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44024 (_ BitVec 32)) Bool)

(assert (=> b!809627 (= res!553344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809628 () Bool)

(assert (=> b!809628 (= e!448133 e!448134)))

(declare-fun res!553350 () Bool)

(assert (=> b!809628 (=> (not res!553350) (not e!448134))))

(assert (=> b!809628 (= res!553350 (= lt!362846 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362847 lt!362848 mask!3266)))))

(assert (=> b!809628 (= lt!362846 (seekEntryOrOpen!0 lt!362847 lt!362848 mask!3266))))

(assert (=> b!809628 (= lt!362847 (select (store (arr!21086 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809628 (= lt!362848 (array!44025 (store (arr!21086 a!3170) i!1163 k!2044) (size!21507 a!3170)))))

(assert (= (and start!69426 res!553353) b!809623))

(assert (= (and b!809623 res!553349) b!809624))

(assert (= (and b!809624 res!553348) b!809621))

(assert (= (and b!809621 res!553345) b!809617))

(assert (= (and b!809617 res!553346) b!809619))

(assert (= (and b!809619 res!553351) b!809627))

(assert (= (and b!809627 res!553344) b!809620))

(assert (= (and b!809620 res!553355) b!809622))

(assert (= (and b!809622 res!553347) b!809628))

(assert (= (and b!809628 res!553350) b!809618))

(assert (= (and b!809618 res!553354) b!809626))

(assert (= (and b!809626 res!553352) b!809625))

(declare-fun m!751831 () Bool)

(assert (=> b!809625 m!751831))

(declare-fun m!751833 () Bool)

(assert (=> b!809622 m!751833))

(declare-fun m!751835 () Bool)

(assert (=> b!809622 m!751835))

(declare-fun m!751837 () Bool)

(assert (=> start!69426 m!751837))

(declare-fun m!751839 () Bool)

(assert (=> start!69426 m!751839))

(declare-fun m!751841 () Bool)

(assert (=> b!809621 m!751841))

(declare-fun m!751843 () Bool)

(assert (=> b!809627 m!751843))

(declare-fun m!751845 () Bool)

(assert (=> b!809624 m!751845))

(assert (=> b!809624 m!751845))

(declare-fun m!751847 () Bool)

(assert (=> b!809624 m!751847))

(declare-fun m!751849 () Bool)

(assert (=> b!809626 m!751849))

(declare-fun m!751851 () Bool)

(assert (=> b!809619 m!751851))

(declare-fun m!751853 () Bool)

(assert (=> b!809620 m!751853))

(declare-fun m!751855 () Bool)

(assert (=> b!809628 m!751855))

(declare-fun m!751857 () Bool)

(assert (=> b!809628 m!751857))

(declare-fun m!751859 () Bool)

(assert (=> b!809628 m!751859))

(declare-fun m!751861 () Bool)

(assert (=> b!809628 m!751861))

(declare-fun m!751863 () Bool)

(assert (=> b!809617 m!751863))

(declare-fun m!751865 () Bool)

(assert (=> b!809618 m!751865))

(assert (=> b!809618 m!751845))

(assert (=> b!809618 m!751845))

(declare-fun m!751867 () Bool)

(assert (=> b!809618 m!751867))

(assert (=> b!809618 m!751845))

(declare-fun m!751869 () Bool)

(assert (=> b!809618 m!751869))

(push 1)

(assert (not b!809619))

(assert (not start!69426))

(assert (not b!809624))

(assert (not b!809626))

(assert (not b!809618))

(assert (not b!809627))

(assert (not b!809617))

(assert (not b!809628))

(assert (not b!809621))

(assert (not b!809625))

(assert (not b!809620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103931 () Bool)

(assert (=> d!103931 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809621 d!103931))

(declare-fun b!809724 () Bool)

(declare-fun e!448198 () Bool)

(declare-fun e!448199 () Bool)

(assert (=> b!809724 (= e!448198 e!448199)))

(declare-fun lt!362891 () (_ BitVec 64))

(assert (=> b!809724 (= lt!362891 (select (arr!21086 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27628 0))(
  ( (Unit!27629) )
))
(declare-fun lt!362893 () Unit!27628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44024 (_ BitVec 64) (_ BitVec 32)) Unit!27628)

(assert (=> b!809724 (= lt!362893 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362891 #b00000000000000000000000000000000))))

(assert (=> b!809724 (arrayContainsKey!0 a!3170 lt!362891 #b00000000000000000000000000000000)))

(declare-fun lt!362892 () Unit!27628)

(assert (=> b!809724 (= lt!362892 lt!362893)))

(declare-fun res!553381 () Bool)

(assert (=> b!809724 (= res!553381 (= (seekEntryOrOpen!0 (select (arr!21086 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8677 #b00000000000000000000000000000000)))))

(assert (=> b!809724 (=> (not res!553381) (not e!448199))))

(declare-fun b!809725 () Bool)

(declare-fun call!35427 () Bool)

(assert (=> b!809725 (= e!448199 call!35427)))

(declare-fun bm!35424 () Bool)

(assert (=> bm!35424 (= call!35427 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun d!103933 () Bool)

(declare-fun res!553382 () Bool)

(declare-fun e!448197 () Bool)

(assert (=> d!103933 (=> res!553382 e!448197)))

(assert (=> d!103933 (= res!553382 (bvsge #b00000000000000000000000000000000 (size!21507 a!3170)))))

(assert (=> d!103933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448197)))

(declare-fun b!809726 () Bool)

(assert (=> b!809726 (= e!448198 call!35427)))

(declare-fun b!809727 () Bool)

(assert (=> b!809727 (= e!448197 e!448198)))

(declare-fun c!88582 () Bool)

(assert (=> b!809727 (= c!88582 (validKeyInArray!0 (select (arr!21086 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103933 (not res!553382)) b!809727))

(assert (= (and b!809727 c!88582) b!809724))

(assert (= (and b!809727 (not c!88582)) b!809726))

(assert (= (and b!809724 res!553381) b!809725))

(assert (= (or b!809725 b!809726) bm!35424))

(declare-fun m!751917 () Bool)

(assert (=> b!809724 m!751917))

(declare-fun m!751919 () Bool)

(assert (=> b!809724 m!751919))

(declare-fun m!751921 () Bool)

(assert (=> b!809724 m!751921))

(assert (=> b!809724 m!751917))

(declare-fun m!751923 () Bool)

(assert (=> b!809724 m!751923))

(declare-fun m!751925 () Bool)

(assert (=> bm!35424 m!751925))

(assert (=> b!809727 m!751917))

(assert (=> b!809727 m!751917))

(declare-fun m!751927 () Bool)

(assert (=> b!809727 m!751927))

(assert (=> b!809627 d!103933))

(declare-fun d!103937 () Bool)

(declare-fun res!553387 () Bool)

(declare-fun e!448213 () Bool)

(assert (=> d!103937 (=> res!553387 e!448213)))

(assert (=> d!103937 (= res!553387 (= (select (arr!21086 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103937 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!448213)))

(declare-fun b!809750 () Bool)

(declare-fun e!448214 () Bool)

(assert (=> b!809750 (= e!448213 e!448214)))

(declare-fun res!553388 () Bool)

(assert (=> b!809750 (=> (not res!553388) (not e!448214))))

(assert (=> b!809750 (= res!553388 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21507 a!3170)))))

(declare-fun b!809751 () Bool)

(assert (=> b!809751 (= e!448214 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103937 (not res!553387)) b!809750))

(assert (= (and b!809750 res!553388) b!809751))

(assert (=> d!103937 m!751917))

(declare-fun m!751964 () Bool)

(assert (=> b!809751 m!751964))

(assert (=> b!809617 d!103937))

(declare-fun lt!362925 () SeekEntryResult!8677)

(declare-fun d!103945 () Bool)

(assert (=> d!103945 (and (or (is-Undefined!8677 lt!362925) (not (is-Found!8677 lt!362925)) (and (bvsge (index!37077 lt!362925) #b00000000000000000000000000000000) (bvslt (index!37077 lt!362925) (size!21507 lt!362848)))) (or (is-Undefined!8677 lt!362925) (is-Found!8677 lt!362925) (not (is-MissingVacant!8677 lt!362925)) (not (= (index!37079 lt!362925) vacantAfter!23)) (and (bvsge (index!37079 lt!362925) #b00000000000000000000000000000000) (bvslt (index!37079 lt!362925) (size!21507 lt!362848)))) (or (is-Undefined!8677 lt!362925) (ite (is-Found!8677 lt!362925) (= (select (arr!21086 lt!362848) (index!37077 lt!362925)) lt!362847) (and (is-MissingVacant!8677 lt!362925) (= (index!37079 lt!362925) vacantAfter!23) (= (select (arr!21086 lt!362848) (index!37079 lt!362925)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448245 () SeekEntryResult!8677)

(assert (=> d!103945 (= lt!362925 e!448245)))

(declare-fun c!88614 () Bool)

(assert (=> d!103945 (= c!88614 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362924 () (_ BitVec 64))

(assert (=> d!103945 (= lt!362924 (select (arr!21086 lt!362848) index!1236))))

(assert (=> d!103945 (validMask!0 mask!3266)))

(assert (=> d!103945 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362847 lt!362848 mask!3266) lt!362925)))

(declare-fun e!448246 () SeekEntryResult!8677)

(declare-fun b!809802 () Bool)

(assert (=> b!809802 (= e!448246 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362847 lt!362848 mask!3266))))

(declare-fun b!809803 () Bool)

(assert (=> b!809803 (= e!448245 Undefined!8677)))

(declare-fun b!809804 () Bool)

(declare-fun e!448247 () SeekEntryResult!8677)

(assert (=> b!809804 (= e!448247 (Found!8677 index!1236))))

(declare-fun b!809805 () Bool)

(declare-fun c!88613 () Bool)

(assert (=> b!809805 (= c!88613 (= lt!362924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809805 (= e!448247 e!448246)))

(declare-fun b!809806 () Bool)

(assert (=> b!809806 (= e!448245 e!448247)))

(declare-fun c!88612 () Bool)

(assert (=> b!809806 (= c!88612 (= lt!362924 lt!362847))))

(declare-fun b!809807 () Bool)

(assert (=> b!809807 (= e!448246 (MissingVacant!8677 vacantAfter!23))))

(assert (= (and d!103945 c!88614) b!809803))

(assert (= (and d!103945 (not c!88614)) b!809806))

(assert (= (and b!809806 c!88612) b!809804))

(assert (= (and b!809806 (not c!88612)) b!809805))

(assert (= (and b!809805 c!88613) b!809807))

(assert (= (and b!809805 (not c!88613)) b!809802))

(declare-fun m!751997 () Bool)

(assert (=> d!103945 m!751997))

(declare-fun m!751999 () Bool)

(assert (=> d!103945 m!751999))

(declare-fun m!752001 () Bool)

(assert (=> d!103945 m!752001))

(assert (=> d!103945 m!751837))

(assert (=> b!809802 m!751849))

(assert (=> b!809802 m!751849))

(declare-fun m!752003 () Bool)

(assert (=> b!809802 m!752003))

(assert (=> b!809628 d!103945))

(declare-fun b!809863 () Bool)

(declare-fun c!88638 () Bool)

(declare-fun lt!362950 () (_ BitVec 64))

(assert (=> b!809863 (= c!88638 (= lt!362950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448282 () SeekEntryResult!8677)

(declare-fun e!448281 () SeekEntryResult!8677)

(assert (=> b!809863 (= e!448282 e!448281)))

(declare-fun lt!362949 () SeekEntryResult!8677)

(declare-fun b!809864 () Bool)

(assert (=> b!809864 (= e!448281 (seekKeyOrZeroReturnVacant!0 (x!67877 lt!362949) (index!37078 lt!362949) (index!37078 lt!362949) lt!362847 lt!362848 mask!3266))))

(declare-fun b!809865 () Bool)

(assert (=> b!809865 (= e!448281 (MissingZero!8677 (index!37078 lt!362949)))))

(declare-fun b!809866 () Bool)

(declare-fun e!448283 () SeekEntryResult!8677)

(assert (=> b!809866 (= e!448283 e!448282)))

(assert (=> b!809866 (= lt!362950 (select (arr!21086 lt!362848) (index!37078 lt!362949)))))

(declare-fun c!88639 () Bool)

(assert (=> b!809866 (= c!88639 (= lt!362950 lt!362847))))

(declare-fun b!809867 () Bool)

(assert (=> b!809867 (= e!448282 (Found!8677 (index!37078 lt!362949)))))

(declare-fun b!809868 () Bool)

(assert (=> b!809868 (= e!448283 Undefined!8677)))

(declare-fun d!103959 () Bool)

(declare-fun lt!362948 () SeekEntryResult!8677)

(assert (=> d!103959 (and (or (is-Undefined!8677 lt!362948) (not (is-Found!8677 lt!362948)) (and (bvsge (index!37077 lt!362948) #b00000000000000000000000000000000) (bvslt (index!37077 lt!362948) (size!21507 lt!362848)))) (or (is-Undefined!8677 lt!362948) (is-Found!8677 lt!362948) (not (is-MissingZero!8677 lt!362948)) (and (bvsge (index!37076 lt!362948) #b00000000000000000000000000000000) (bvslt (index!37076 lt!362948) (size!21507 lt!362848)))) (or (is-Undefined!8677 lt!362948) (is-Found!8677 lt!362948) (is-MissingZero!8677 lt!362948) (not (is-MissingVacant!8677 lt!362948)) (and (bvsge (index!37079 lt!362948) #b00000000000000000000000000000000) (bvslt (index!37079 lt!362948) (size!21507 lt!362848)))) (or (is-Undefined!8677 lt!362948) (ite (is-Found!8677 lt!362948) (= (select (arr!21086 lt!362848) (index!37077 lt!362948)) lt!362847) (ite (is-MissingZero!8677 lt!362948) (= (select (arr!21086 lt!362848) (index!37076 lt!362948)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8677 lt!362948) (= (select (arr!21086 lt!362848) (index!37079 lt!362948)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103959 (= lt!362948 e!448283)))

(declare-fun c!88637 () Bool)

(assert (=> d!103959 (= c!88637 (and (is-Intermediate!8677 lt!362949) (undefined!9489 lt!362949)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44024 (_ BitVec 32)) SeekEntryResult!8677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103959 (= lt!362949 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362847 mask!3266) lt!362847 lt!362848 mask!3266))))

(assert (=> d!103959 (validMask!0 mask!3266)))

(assert (=> d!103959 (= (seekEntryOrOpen!0 lt!362847 lt!362848 mask!3266) lt!362948)))

(assert (= (and d!103959 c!88637) b!809868))

(assert (= (and d!103959 (not c!88637)) b!809866))

(assert (= (and b!809866 c!88639) b!809867))

(assert (= (and b!809866 (not c!88639)) b!809863))

(assert (= (and b!809863 c!88638) b!809865))

(assert (= (and b!809863 (not c!88638)) b!809864))

(declare-fun m!752065 () Bool)

(assert (=> b!809864 m!752065))

(declare-fun m!752067 () Bool)

(assert (=> b!809866 m!752067))

(declare-fun m!752069 () Bool)

(assert (=> d!103959 m!752069))

(declare-fun m!752071 () Bool)

(assert (=> d!103959 m!752071))

(declare-fun m!752073 () Bool)

(assert (=> d!103959 m!752073))

(assert (=> d!103959 m!752071))

(declare-fun m!752075 () Bool)

(assert (=> d!103959 m!752075))

(assert (=> d!103959 m!751837))

(declare-fun m!752077 () Bool)

(assert (=> d!103959 m!752077))

(assert (=> b!809628 d!103959))

(declare-fun lt!362952 () SeekEntryResult!8677)

(declare-fun d!103977 () Bool)

(assert (=> d!103977 (and (or (is-Undefined!8677 lt!362952) (not (is-Found!8677 lt!362952)) (and (bvsge (index!37077 lt!362952) #b00000000000000000000000000000000) (bvslt (index!37077 lt!362952) (size!21507 a!3170)))) (or (is-Undefined!8677 lt!362952) (is-Found!8677 lt!362952) (not (is-MissingVacant!8677 lt!362952)) (not (= (index!37079 lt!362952) vacantBefore!23)) (and (bvsge (index!37079 lt!362952) #b00000000000000000000000000000000) (bvslt (index!37079 lt!362952) (size!21507 a!3170)))) (or (is-Undefined!8677 lt!362952) (ite (is-Found!8677 lt!362952) (= (select (arr!21086 a!3170) (index!37077 lt!362952)) (select (arr!21086 a!3170) j!153)) (and (is-MissingVacant!8677 lt!362952) (= (index!37079 lt!362952) vacantBefore!23) (= (select (arr!21086 a!3170) (index!37079 lt!362952)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448284 () SeekEntryResult!8677)

(assert (=> d!103977 (= lt!362952 e!448284)))

(declare-fun c!88642 () Bool)

(assert (=> d!103977 (= c!88642 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362951 () (_ BitVec 64))

(assert (=> d!103977 (= lt!362951 (select (arr!21086 a!3170) index!1236))))

(assert (=> d!103977 (validMask!0 mask!3266)))

(assert (=> d!103977 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266) lt!362952)))

(declare-fun b!809869 () Bool)

(declare-fun e!448285 () SeekEntryResult!8677)

(assert (=> b!809869 (= e!448285 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809870 () Bool)

(assert (=> b!809870 (= e!448284 Undefined!8677)))

(declare-fun b!809871 () Bool)

(declare-fun e!448286 () SeekEntryResult!8677)

(assert (=> b!809871 (= e!448286 (Found!8677 index!1236))))

(declare-fun b!809872 () Bool)

(declare-fun c!88641 () Bool)

(assert (=> b!809872 (= c!88641 (= lt!362951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809872 (= e!448286 e!448285)))

(declare-fun b!809873 () Bool)

(assert (=> b!809873 (= e!448284 e!448286)))

(declare-fun c!88640 () Bool)

(assert (=> b!809873 (= c!88640 (= lt!362951 (select (arr!21086 a!3170) j!153)))))

(declare-fun b!809874 () Bool)

(assert (=> b!809874 (= e!448285 (MissingVacant!8677 vacantBefore!23))))

(assert (= (and d!103977 c!88642) b!809870))

(assert (= (and d!103977 (not c!88642)) b!809873))

(assert (= (and b!809873 c!88640) b!809871))

(assert (= (and b!809873 (not c!88640)) b!809872))

(assert (= (and b!809872 c!88641) b!809874))

(assert (= (and b!809872 (not c!88641)) b!809869))

(declare-fun m!752079 () Bool)

(assert (=> d!103977 m!752079))

(declare-fun m!752081 () Bool)

(assert (=> d!103977 m!752081))

(assert (=> d!103977 m!751865))

(assert (=> d!103977 m!751837))

(assert (=> b!809869 m!751849))

(assert (=> b!809869 m!751849))

(assert (=> b!809869 m!751845))

(declare-fun m!752083 () Bool)

(assert (=> b!809869 m!752083))

(assert (=> b!809618 d!103977))

(declare-fun b!809875 () Bool)

(declare-fun c!88644 () Bool)

(declare-fun lt!362955 () (_ BitVec 64))

(assert (=> b!809875 (= c!88644 (= lt!362955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448288 () SeekEntryResult!8677)

(declare-fun e!448287 () SeekEntryResult!8677)

(assert (=> b!809875 (= e!448288 e!448287)))

(declare-fun b!809876 () Bool)

(declare-fun lt!362954 () SeekEntryResult!8677)

(assert (=> b!809876 (= e!448287 (seekKeyOrZeroReturnVacant!0 (x!67877 lt!362954) (index!37078 lt!362954) (index!37078 lt!362954) (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809877 () Bool)

(assert (=> b!809877 (= e!448287 (MissingZero!8677 (index!37078 lt!362954)))))

(declare-fun b!809878 () Bool)

(declare-fun e!448289 () SeekEntryResult!8677)

(assert (=> b!809878 (= e!448289 e!448288)))

(assert (=> b!809878 (= lt!362955 (select (arr!21086 a!3170) (index!37078 lt!362954)))))

(declare-fun c!88645 () Bool)

(assert (=> b!809878 (= c!88645 (= lt!362955 (select (arr!21086 a!3170) j!153)))))

(declare-fun b!809879 () Bool)

(assert (=> b!809879 (= e!448288 (Found!8677 (index!37078 lt!362954)))))

(declare-fun b!809880 () Bool)

(assert (=> b!809880 (= e!448289 Undefined!8677)))

(declare-fun d!103979 () Bool)

(declare-fun lt!362953 () SeekEntryResult!8677)

(assert (=> d!103979 (and (or (is-Undefined!8677 lt!362953) (not (is-Found!8677 lt!362953)) (and (bvsge (index!37077 lt!362953) #b00000000000000000000000000000000) (bvslt (index!37077 lt!362953) (size!21507 a!3170)))) (or (is-Undefined!8677 lt!362953) (is-Found!8677 lt!362953) (not (is-MissingZero!8677 lt!362953)) (and (bvsge (index!37076 lt!362953) #b00000000000000000000000000000000) (bvslt (index!37076 lt!362953) (size!21507 a!3170)))) (or (is-Undefined!8677 lt!362953) (is-Found!8677 lt!362953) (is-MissingZero!8677 lt!362953) (not (is-MissingVacant!8677 lt!362953)) (and (bvsge (index!37079 lt!362953) #b00000000000000000000000000000000) (bvslt (index!37079 lt!362953) (size!21507 a!3170)))) (or (is-Undefined!8677 lt!362953) (ite (is-Found!8677 lt!362953) (= (select (arr!21086 a!3170) (index!37077 lt!362953)) (select (arr!21086 a!3170) j!153)) (ite (is-MissingZero!8677 lt!362953) (= (select (arr!21086 a!3170) (index!37076 lt!362953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8677 lt!362953) (= (select (arr!21086 a!3170) (index!37079 lt!362953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103979 (= lt!362953 e!448289)))

(declare-fun c!88643 () Bool)

(assert (=> d!103979 (= c!88643 (and (is-Intermediate!8677 lt!362954) (undefined!9489 lt!362954)))))

(assert (=> d!103979 (= lt!362954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21086 a!3170) j!153) mask!3266) (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103979 (validMask!0 mask!3266)))

(assert (=> d!103979 (= (seekEntryOrOpen!0 (select (arr!21086 a!3170) j!153) a!3170 mask!3266) lt!362953)))

(assert (= (and d!103979 c!88643) b!809880))

(assert (= (and d!103979 (not c!88643)) b!809878))

(assert (= (and b!809878 c!88645) b!809879))

(assert (= (and b!809878 (not c!88645)) b!809875))

(assert (= (and b!809875 c!88644) b!809877))

(assert (= (and b!809875 (not c!88644)) b!809876))

(assert (=> b!809876 m!751845))

(declare-fun m!752085 () Bool)

(assert (=> b!809876 m!752085))

(declare-fun m!752087 () Bool)

(assert (=> b!809878 m!752087))

(declare-fun m!752089 () Bool)

(assert (=> d!103979 m!752089))

(assert (=> d!103979 m!751845))

(declare-fun m!752091 () Bool)

(assert (=> d!103979 m!752091))

(declare-fun m!752093 () Bool)

(assert (=> d!103979 m!752093))

(assert (=> d!103979 m!752091))

(assert (=> d!103979 m!751845))

(declare-fun m!752095 () Bool)

(assert (=> d!103979 m!752095))

(assert (=> d!103979 m!751837))

(declare-fun m!752097 () Bool)

(assert (=> d!103979 m!752097))

(assert (=> b!809618 d!103979))

(declare-fun d!103981 () Bool)

(assert (=> d!103981 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69426 d!103981))

(declare-fun d!103985 () Bool)

(assert (=> d!103985 (= (array_inv!16882 a!3170) (bvsge (size!21507 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69426 d!103985))

(declare-fun d!103987 () Bool)

(assert (=> d!103987 (= (validKeyInArray!0 (select (arr!21086 a!3170) j!153)) (and (not (= (select (arr!21086 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21086 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809624 d!103987))

(declare-fun b!809881 () Bool)

(declare-fun c!88647 () Bool)

(declare-fun lt!362958 () (_ BitVec 64))

(assert (=> b!809881 (= c!88647 (= lt!362958 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448291 () SeekEntryResult!8677)

(declare-fun e!448290 () SeekEntryResult!8677)

(assert (=> b!809881 (= e!448291 e!448290)))

(declare-fun lt!362957 () SeekEntryResult!8677)

(declare-fun b!809882 () Bool)

(assert (=> b!809882 (= e!448290 (seekKeyOrZeroReturnVacant!0 (x!67877 lt!362957) (index!37078 lt!362957) (index!37078 lt!362957) k!2044 a!3170 mask!3266))))

(declare-fun b!809883 () Bool)

(assert (=> b!809883 (= e!448290 (MissingZero!8677 (index!37078 lt!362957)))))

(declare-fun b!809884 () Bool)

(declare-fun e!448292 () SeekEntryResult!8677)

(assert (=> b!809884 (= e!448292 e!448291)))

(assert (=> b!809884 (= lt!362958 (select (arr!21086 a!3170) (index!37078 lt!362957)))))

(declare-fun c!88648 () Bool)

(assert (=> b!809884 (= c!88648 (= lt!362958 k!2044))))

(declare-fun b!809885 () Bool)

(assert (=> b!809885 (= e!448291 (Found!8677 (index!37078 lt!362957)))))

(declare-fun b!809886 () Bool)

(assert (=> b!809886 (= e!448292 Undefined!8677)))

(declare-fun d!103989 () Bool)

(declare-fun lt!362956 () SeekEntryResult!8677)

(assert (=> d!103989 (and (or (is-Undefined!8677 lt!362956) (not (is-Found!8677 lt!362956)) (and (bvsge (index!37077 lt!362956) #b00000000000000000000000000000000) (bvslt (index!37077 lt!362956) (size!21507 a!3170)))) (or (is-Undefined!8677 lt!362956) (is-Found!8677 lt!362956) (not (is-MissingZero!8677 lt!362956)) (and (bvsge (index!37076 lt!362956) #b00000000000000000000000000000000) (bvslt (index!37076 lt!362956) (size!21507 a!3170)))) (or (is-Undefined!8677 lt!362956) (is-Found!8677 lt!362956) (is-MissingZero!8677 lt!362956) (not (is-MissingVacant!8677 lt!362956)) (and (bvsge (index!37079 lt!362956) #b00000000000000000000000000000000) (bvslt (index!37079 lt!362956) (size!21507 a!3170)))) (or (is-Undefined!8677 lt!362956) (ite (is-Found!8677 lt!362956) (= (select (arr!21086 a!3170) (index!37077 lt!362956)) k!2044) (ite (is-MissingZero!8677 lt!362956) (= (select (arr!21086 a!3170) (index!37076 lt!362956)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8677 lt!362956) (= (select (arr!21086 a!3170) (index!37079 lt!362956)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103989 (= lt!362956 e!448292)))

(declare-fun c!88646 () Bool)

(assert (=> d!103989 (= c!88646 (and (is-Intermediate!8677 lt!362957) (undefined!9489 lt!362957)))))

(assert (=> d!103989 (= lt!362957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103989 (validMask!0 mask!3266)))

(assert (=> d!103989 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!362956)))

(assert (= (and d!103989 c!88646) b!809886))

(assert (= (and d!103989 (not c!88646)) b!809884))

(assert (= (and b!809884 c!88648) b!809885))

(assert (= (and b!809884 (not c!88648)) b!809881))

(assert (= (and b!809881 c!88647) b!809883))

(assert (= (and b!809881 (not c!88647)) b!809882))

(declare-fun m!752099 () Bool)

(assert (=> b!809882 m!752099))

(declare-fun m!752101 () Bool)

(assert (=> b!809884 m!752101))

(declare-fun m!752103 () Bool)

(assert (=> d!103989 m!752103))

(declare-fun m!752105 () Bool)

(assert (=> d!103989 m!752105))

(declare-fun m!752107 () Bool)

(assert (=> d!103989 m!752107))

(assert (=> d!103989 m!752105))

(declare-fun m!752109 () Bool)

(assert (=> d!103989 m!752109))

(assert (=> d!103989 m!751837))

(declare-fun m!752111 () Bool)

(assert (=> d!103989 m!752111))

(assert (=> b!809619 d!103989))

(declare-fun lt!362960 () SeekEntryResult!8677)

(declare-fun d!103991 () Bool)

(assert (=> d!103991 (and (or (is-Undefined!8677 lt!362960) (not (is-Found!8677 lt!362960)) (and (bvsge (index!37077 lt!362960) #b00000000000000000000000000000000) (bvslt (index!37077 lt!362960) (size!21507 lt!362848)))) (or (is-Undefined!8677 lt!362960) (is-Found!8677 lt!362960) (not (is-MissingVacant!8677 lt!362960)) (not (= (index!37079 lt!362960) vacantAfter!23)) (and (bvsge (index!37079 lt!362960) #b00000000000000000000000000000000) (bvslt (index!37079 lt!362960) (size!21507 lt!362848)))) (or (is-Undefined!8677 lt!362960) (ite (is-Found!8677 lt!362960) (= (select (arr!21086 lt!362848) (index!37077 lt!362960)) lt!362847) (and (is-MissingVacant!8677 lt!362960) (= (index!37079 lt!362960) vacantAfter!23) (= (select (arr!21086 lt!362848) (index!37079 lt!362960)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448293 () SeekEntryResult!8677)

(assert (=> d!103991 (= lt!362960 e!448293)))

(declare-fun c!88651 () Bool)

(assert (=> d!103991 (= c!88651 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!362959 () (_ BitVec 64))

(assert (=> d!103991 (= lt!362959 (select (arr!21086 lt!362848) lt!362852))))

(assert (=> d!103991 (validMask!0 mask!3266)))

(assert (=> d!103991 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362852 vacantAfter!23 lt!362847 lt!362848 mask!3266) lt!362960)))

(declare-fun e!448294 () SeekEntryResult!8677)

(declare-fun b!809887 () Bool)

(assert (=> b!809887 (= e!448294 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!362852 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!362847 lt!362848 mask!3266))))

(declare-fun b!809888 () Bool)

(assert (=> b!809888 (= e!448293 Undefined!8677)))

(declare-fun b!809889 () Bool)

(declare-fun e!448295 () SeekEntryResult!8677)

(assert (=> b!809889 (= e!448295 (Found!8677 lt!362852))))

(declare-fun b!809890 () Bool)

(declare-fun c!88650 () Bool)

(assert (=> b!809890 (= c!88650 (= lt!362959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809890 (= e!448295 e!448294)))

(declare-fun b!809891 () Bool)

(assert (=> b!809891 (= e!448293 e!448295)))

(declare-fun c!88649 () Bool)

(assert (=> b!809891 (= c!88649 (= lt!362959 lt!362847))))

(declare-fun b!809892 () Bool)

(assert (=> b!809892 (= e!448294 (MissingVacant!8677 vacantAfter!23))))

(assert (= (and d!103991 c!88651) b!809888))

(assert (= (and d!103991 (not c!88651)) b!809891))

(assert (= (and b!809891 c!88649) b!809889))

(assert (= (and b!809891 (not c!88649)) b!809890))

(assert (= (and b!809890 c!88650) b!809892))

(assert (= (and b!809890 (not c!88650)) b!809887))

(declare-fun m!752113 () Bool)

(assert (=> d!103991 m!752113))

(declare-fun m!752115 () Bool)

(assert (=> d!103991 m!752115))

(declare-fun m!752117 () Bool)

