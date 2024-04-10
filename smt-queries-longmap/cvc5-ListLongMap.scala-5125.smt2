; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69572 () Bool)

(assert start!69572)

(declare-fun b!810895 () Bool)

(declare-fun e!448820 () Bool)

(declare-fun e!448819 () Bool)

(assert (=> b!810895 (= e!448820 e!448819)))

(declare-fun res!554174 () Bool)

(assert (=> b!810895 (=> (not res!554174) (not e!448819))))

(declare-datatypes ((SeekEntryResult!8696 0))(
  ( (MissingZero!8696 (index!37152 (_ BitVec 32))) (Found!8696 (index!37153 (_ BitVec 32))) (Intermediate!8696 (undefined!9508 Bool) (index!37154 (_ BitVec 32)) (x!67964 (_ BitVec 32))) (Undefined!8696) (MissingVacant!8696 (index!37155 (_ BitVec 32))) )
))
(declare-fun lt!363523 () SeekEntryResult!8696)

(declare-fun lt!363516 () SeekEntryResult!8696)

(assert (=> b!810895 (= res!554174 (= lt!363523 lt!363516))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363518 () (_ BitVec 64))

(declare-datatypes ((array!44068 0))(
  ( (array!44069 (arr!21105 (Array (_ BitVec 32) (_ BitVec 64))) (size!21526 (_ BitVec 32))) )
))
(declare-fun lt!363522 () array!44068)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44068 (_ BitVec 32)) SeekEntryResult!8696)

(assert (=> b!810895 (= lt!363516 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363518 lt!363522 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44068 (_ BitVec 32)) SeekEntryResult!8696)

(assert (=> b!810895 (= lt!363523 (seekEntryOrOpen!0 lt!363518 lt!363522 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!44068)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810895 (= lt!363518 (select (store (arr!21105 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810895 (= lt!363522 (array!44069 (store (arr!21105 a!3170) i!1163 k!2044) (size!21526 a!3170)))))

(declare-fun b!810896 () Bool)

(declare-fun e!448815 () Bool)

(assert (=> b!810896 (= e!448819 e!448815)))

(declare-fun res!554172 () Bool)

(assert (=> b!810896 (=> (not res!554172) (not e!448815))))

(declare-fun lt!363517 () SeekEntryResult!8696)

(declare-fun lt!363524 () SeekEntryResult!8696)

(assert (=> b!810896 (= res!554172 (= lt!363517 lt!363524))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810896 (= lt!363524 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21105 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810896 (= lt!363517 (seekEntryOrOpen!0 (select (arr!21105 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810898 () Bool)

(declare-fun res!554182 () Bool)

(declare-fun e!448816 () Bool)

(assert (=> b!810898 (=> (not res!554182) (not e!448816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810898 (= res!554182 (validKeyInArray!0 k!2044))))

(declare-fun b!810899 () Bool)

(declare-fun e!448818 () Bool)

(assert (=> b!810899 (= e!448815 e!448818)))

(declare-fun res!554175 () Bool)

(assert (=> b!810899 (=> (not res!554175) (not e!448818))))

(declare-fun lt!363521 () SeekEntryResult!8696)

(assert (=> b!810899 (= res!554175 (and (= lt!363524 lt!363521) (not (= (select (arr!21105 a!3170) index!1236) (select (arr!21105 a!3170) j!153)))))))

(assert (=> b!810899 (= lt!363521 (Found!8696 j!153))))

(declare-fun b!810900 () Bool)

(declare-fun res!554176 () Bool)

(assert (=> b!810900 (=> (not res!554176) (not e!448816))))

(assert (=> b!810900 (= res!554176 (validKeyInArray!0 (select (arr!21105 a!3170) j!153)))))

(declare-fun b!810901 () Bool)

(assert (=> b!810901 (= e!448816 e!448820)))

(declare-fun res!554183 () Bool)

(assert (=> b!810901 (=> (not res!554183) (not e!448820))))

(declare-fun lt!363515 () SeekEntryResult!8696)

(assert (=> b!810901 (= res!554183 (or (= lt!363515 (MissingZero!8696 i!1163)) (= lt!363515 (MissingVacant!8696 i!1163))))))

(assert (=> b!810901 (= lt!363515 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810902 () Bool)

(assert (=> b!810902 (= e!448818 (not (= lt!363516 lt!363521)))))

(declare-fun lt!363520 () (_ BitVec 32))

(assert (=> b!810902 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363520 vacantAfter!23 lt!363518 lt!363522 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363520 vacantBefore!23 (select (arr!21105 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27654 0))(
  ( (Unit!27655) )
))
(declare-fun lt!363519 () Unit!27654)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27654)

(assert (=> b!810902 (= lt!363519 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363520 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810902 (= lt!363520 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!554173 () Bool)

(assert (=> start!69572 (=> (not res!554173) (not e!448816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69572 (= res!554173 (validMask!0 mask!3266))))

(assert (=> start!69572 e!448816))

(assert (=> start!69572 true))

(declare-fun array_inv!16901 (array!44068) Bool)

(assert (=> start!69572 (array_inv!16901 a!3170)))

(declare-fun b!810897 () Bool)

(declare-fun res!554178 () Bool)

(assert (=> b!810897 (=> (not res!554178) (not e!448820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44068 (_ BitVec 32)) Bool)

(assert (=> b!810897 (= res!554178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810903 () Bool)

(declare-fun res!554180 () Bool)

(assert (=> b!810903 (=> (not res!554180) (not e!448820))))

(assert (=> b!810903 (= res!554180 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21526 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21105 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21526 a!3170)) (= (select (arr!21105 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810904 () Bool)

(declare-fun res!554179 () Bool)

(assert (=> b!810904 (=> (not res!554179) (not e!448816))))

(declare-fun arrayContainsKey!0 (array!44068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810904 (= res!554179 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810905 () Bool)

(declare-fun res!554181 () Bool)

(assert (=> b!810905 (=> (not res!554181) (not e!448816))))

(assert (=> b!810905 (= res!554181 (and (= (size!21526 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21526 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21526 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810906 () Bool)

(declare-fun res!554177 () Bool)

(assert (=> b!810906 (=> (not res!554177) (not e!448820))))

(declare-datatypes ((List!15068 0))(
  ( (Nil!15065) (Cons!15064 (h!16193 (_ BitVec 64)) (t!21383 List!15068)) )
))
(declare-fun arrayNoDuplicates!0 (array!44068 (_ BitVec 32) List!15068) Bool)

(assert (=> b!810906 (= res!554177 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15065))))

(assert (= (and start!69572 res!554173) b!810905))

(assert (= (and b!810905 res!554181) b!810900))

(assert (= (and b!810900 res!554176) b!810898))

(assert (= (and b!810898 res!554182) b!810904))

(assert (= (and b!810904 res!554179) b!810901))

(assert (= (and b!810901 res!554183) b!810897))

(assert (= (and b!810897 res!554178) b!810906))

(assert (= (and b!810906 res!554177) b!810903))

(assert (= (and b!810903 res!554180) b!810895))

(assert (= (and b!810895 res!554174) b!810896))

(assert (= (and b!810896 res!554172) b!810899))

(assert (= (and b!810899 res!554175) b!810902))

(declare-fun m!753185 () Bool)

(assert (=> b!810896 m!753185))

(assert (=> b!810896 m!753185))

(declare-fun m!753187 () Bool)

(assert (=> b!810896 m!753187))

(assert (=> b!810896 m!753185))

(declare-fun m!753189 () Bool)

(assert (=> b!810896 m!753189))

(assert (=> b!810902 m!753185))

(declare-fun m!753191 () Bool)

(assert (=> b!810902 m!753191))

(declare-fun m!753193 () Bool)

(assert (=> b!810902 m!753193))

(assert (=> b!810902 m!753185))

(declare-fun m!753195 () Bool)

(assert (=> b!810902 m!753195))

(declare-fun m!753197 () Bool)

(assert (=> b!810902 m!753197))

(declare-fun m!753199 () Bool)

(assert (=> b!810897 m!753199))

(declare-fun m!753201 () Bool)

(assert (=> b!810899 m!753201))

(assert (=> b!810899 m!753185))

(assert (=> b!810900 m!753185))

(assert (=> b!810900 m!753185))

(declare-fun m!753203 () Bool)

(assert (=> b!810900 m!753203))

(declare-fun m!753205 () Bool)

(assert (=> b!810903 m!753205))

(declare-fun m!753207 () Bool)

(assert (=> b!810903 m!753207))

(declare-fun m!753209 () Bool)

(assert (=> b!810906 m!753209))

(declare-fun m!753211 () Bool)

(assert (=> b!810898 m!753211))

(declare-fun m!753213 () Bool)

(assert (=> start!69572 m!753213))

(declare-fun m!753215 () Bool)

(assert (=> start!69572 m!753215))

(declare-fun m!753217 () Bool)

(assert (=> b!810901 m!753217))

(declare-fun m!753219 () Bool)

(assert (=> b!810904 m!753219))

(declare-fun m!753221 () Bool)

(assert (=> b!810895 m!753221))

(declare-fun m!753223 () Bool)

(assert (=> b!810895 m!753223))

(declare-fun m!753225 () Bool)

(assert (=> b!810895 m!753225))

(declare-fun m!753227 () Bool)

(assert (=> b!810895 m!753227))

(push 1)

(assert (not b!810898))

(assert (not b!810897))

(assert (not b!810906))

(assert (not b!810901))

(assert (not start!69572))

(assert (not b!810902))

(assert (not b!810900))

(assert (not b!810896))

(assert (not b!810904))

(assert (not b!810895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!811013 () Bool)

(declare-fun e!448879 () Bool)

(declare-fun e!448880 () Bool)

(assert (=> b!811013 (= e!448879 e!448880)))

(declare-fun c!88785 () Bool)

(assert (=> b!811013 (= c!88785 (validKeyInArray!0 (select (arr!21105 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!104103 () Bool)

(declare-fun res!554264 () Bool)

(assert (=> d!104103 (=> res!554264 e!448879)))

(assert (=> d!104103 (= res!554264 (bvsge #b00000000000000000000000000000000 (size!21526 a!3170)))))

(assert (=> d!104103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448879)))

(declare-fun b!811014 () Bool)

(declare-fun e!448878 () Bool)

(assert (=> b!811014 (= e!448880 e!448878)))

(declare-fun lt!363603 () (_ BitVec 64))

(assert (=> b!811014 (= lt!363603 (select (arr!21105 a!3170) #b00000000000000000000000000000000))))

(declare-fun lt!363606 () Unit!27654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44068 (_ BitVec 64) (_ BitVec 32)) Unit!27654)

(assert (=> b!811014 (= lt!363606 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363603 #b00000000000000000000000000000000))))

(assert (=> b!811014 (arrayContainsKey!0 a!3170 lt!363603 #b00000000000000000000000000000000)))

(declare-fun lt!363605 () Unit!27654)

(assert (=> b!811014 (= lt!363605 lt!363606)))

(declare-fun res!554265 () Bool)

(assert (=> b!811014 (= res!554265 (= (seekEntryOrOpen!0 (select (arr!21105 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8696 #b00000000000000000000000000000000)))))

(assert (=> b!811014 (=> (not res!554265) (not e!448878))))

(declare-fun bm!35456 () Bool)

(declare-fun call!35459 () Bool)

(assert (=> bm!35456 (= call!35459 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!811015 () Bool)

(assert (=> b!811015 (= e!448878 call!35459)))

(declare-fun b!811016 () Bool)

(assert (=> b!811016 (= e!448880 call!35459)))

(assert (= (and d!104103 (not res!554264)) b!811013))

(assert (= (and b!811013 c!88785) b!811014))

(assert (= (and b!811013 (not c!88785)) b!811016))

(assert (= (and b!811014 res!554265) b!811015))

(assert (= (or b!811015 b!811016) bm!35456))

(declare-fun m!753327 () Bool)

(assert (=> b!811013 m!753327))

(assert (=> b!811013 m!753327))

(declare-fun m!753331 () Bool)

(assert (=> b!811013 m!753331))

(assert (=> b!811014 m!753327))

(declare-fun m!753335 () Bool)

(assert (=> b!811014 m!753335))

(declare-fun m!753339 () Bool)

(assert (=> b!811014 m!753339))

(assert (=> b!811014 m!753327))

(declare-fun m!753343 () Bool)

(assert (=> b!811014 m!753343))

(declare-fun m!753347 () Bool)

(assert (=> bm!35456 m!753347))

(assert (=> b!810897 d!104103))

(declare-fun b!811063 () Bool)

(declare-fun e!448906 () SeekEntryResult!8696)

(declare-fun e!448905 () SeekEntryResult!8696)

(assert (=> b!811063 (= e!448906 e!448905)))

(declare-fun c!88808 () Bool)

(declare-fun lt!363627 () (_ BitVec 64))

(assert (=> b!811063 (= c!88808 (= lt!363627 lt!363518))))

(declare-fun b!811064 () Bool)

(assert (=> b!811064 (= e!448906 Undefined!8696)))

(declare-fun b!811065 () Bool)

(declare-fun e!448907 () SeekEntryResult!8696)

(assert (=> b!811065 (= e!448907 (MissingVacant!8696 vacantAfter!23))))

(declare-fun b!811066 () Bool)

(declare-fun c!88810 () Bool)

(assert (=> b!811066 (= c!88810 (= lt!363627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811066 (= e!448905 e!448907)))

(declare-fun lt!363626 () SeekEntryResult!8696)

(declare-fun d!104111 () Bool)

(assert (=> d!104111 (and (or (is-Undefined!8696 lt!363626) (not (is-Found!8696 lt!363626)) (and (bvsge (index!37153 lt!363626) #b00000000000000000000000000000000) (bvslt (index!37153 lt!363626) (size!21526 lt!363522)))) (or (is-Undefined!8696 lt!363626) (is-Found!8696 lt!363626) (not (is-MissingVacant!8696 lt!363626)) (not (= (index!37155 lt!363626) vacantAfter!23)) (and (bvsge (index!37155 lt!363626) #b00000000000000000000000000000000) (bvslt (index!37155 lt!363626) (size!21526 lt!363522)))) (or (is-Undefined!8696 lt!363626) (ite (is-Found!8696 lt!363626) (= (select (arr!21105 lt!363522) (index!37153 lt!363626)) lt!363518) (and (is-MissingVacant!8696 lt!363626) (= (index!37155 lt!363626) vacantAfter!23) (= (select (arr!21105 lt!363522) (index!37155 lt!363626)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104111 (= lt!363626 e!448906)))

(declare-fun c!88809 () Bool)

(assert (=> d!104111 (= c!88809 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104111 (= lt!363627 (select (arr!21105 lt!363522) lt!363520))))

(assert (=> d!104111 (validMask!0 mask!3266)))

(assert (=> d!104111 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363520 vacantAfter!23 lt!363518 lt!363522 mask!3266) lt!363626)))

(declare-fun b!811067 () Bool)

(assert (=> b!811067 (= e!448907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363520 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!363518 lt!363522 mask!3266))))

(declare-fun b!811068 () Bool)

(assert (=> b!811068 (= e!448905 (Found!8696 lt!363520))))

(assert (= (and d!104111 c!88809) b!811064))

(assert (= (and d!104111 (not c!88809)) b!811063))

(assert (= (and b!811063 c!88808) b!811068))

(assert (= (and b!811063 (not c!88808)) b!811066))

(assert (= (and b!811066 c!88810) b!811065))

(assert (= (and b!811066 (not c!88810)) b!811067))

(declare-fun m!753353 () Bool)

(assert (=> d!104111 m!753353))

(declare-fun m!753357 () Bool)

(assert (=> d!104111 m!753357))

(declare-fun m!753361 () Bool)

(assert (=> d!104111 m!753361))

(assert (=> d!104111 m!753213))

(declare-fun m!753367 () Bool)

(assert (=> b!811067 m!753367))

(assert (=> b!811067 m!753367))

(declare-fun m!753371 () Bool)

(assert (=> b!811067 m!753371))

(assert (=> b!810902 d!104111))

(declare-fun b!811069 () Bool)

(declare-fun e!448909 () SeekEntryResult!8696)

(declare-fun e!448908 () SeekEntryResult!8696)

(assert (=> b!811069 (= e!448909 e!448908)))

(declare-fun lt!363629 () (_ BitVec 64))

(declare-fun c!88811 () Bool)

(assert (=> b!811069 (= c!88811 (= lt!363629 (select (arr!21105 a!3170) j!153)))))

(declare-fun b!811070 () Bool)

(assert (=> b!811070 (= e!448909 Undefined!8696)))

(declare-fun b!811071 () Bool)

(declare-fun e!448910 () SeekEntryResult!8696)

(assert (=> b!811071 (= e!448910 (MissingVacant!8696 vacantBefore!23))))

(declare-fun b!811072 () Bool)

(declare-fun c!88813 () Bool)

(assert (=> b!811072 (= c!88813 (= lt!363629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811072 (= e!448908 e!448910)))

(declare-fun d!104115 () Bool)

(declare-fun lt!363628 () SeekEntryResult!8696)

(assert (=> d!104115 (and (or (is-Undefined!8696 lt!363628) (not (is-Found!8696 lt!363628)) (and (bvsge (index!37153 lt!363628) #b00000000000000000000000000000000) (bvslt (index!37153 lt!363628) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363628) (is-Found!8696 lt!363628) (not (is-MissingVacant!8696 lt!363628)) (not (= (index!37155 lt!363628) vacantBefore!23)) (and (bvsge (index!37155 lt!363628) #b00000000000000000000000000000000) (bvslt (index!37155 lt!363628) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363628) (ite (is-Found!8696 lt!363628) (= (select (arr!21105 a!3170) (index!37153 lt!363628)) (select (arr!21105 a!3170) j!153)) (and (is-MissingVacant!8696 lt!363628) (= (index!37155 lt!363628) vacantBefore!23) (= (select (arr!21105 a!3170) (index!37155 lt!363628)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104115 (= lt!363628 e!448909)))

(declare-fun c!88812 () Bool)

(assert (=> d!104115 (= c!88812 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104115 (= lt!363629 (select (arr!21105 a!3170) lt!363520))))

(assert (=> d!104115 (validMask!0 mask!3266)))

(assert (=> d!104115 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363520 vacantBefore!23 (select (arr!21105 a!3170) j!153) a!3170 mask!3266) lt!363628)))

(declare-fun b!811073 () Bool)

(assert (=> b!811073 (= e!448910 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363520 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantBefore!23 (select (arr!21105 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811074 () Bool)

(assert (=> b!811074 (= e!448908 (Found!8696 lt!363520))))

(assert (= (and d!104115 c!88812) b!811070))

(assert (= (and d!104115 (not c!88812)) b!811069))

(assert (= (and b!811069 c!88811) b!811074))

(assert (= (and b!811069 (not c!88811)) b!811072))

(assert (= (and b!811072 c!88813) b!811071))

(assert (= (and b!811072 (not c!88813)) b!811073))

(declare-fun m!753373 () Bool)

(assert (=> d!104115 m!753373))

(declare-fun m!753375 () Bool)

(assert (=> d!104115 m!753375))

(declare-fun m!753377 () Bool)

(assert (=> d!104115 m!753377))

(assert (=> d!104115 m!753213))

(assert (=> b!811073 m!753367))

(assert (=> b!811073 m!753367))

(assert (=> b!811073 m!753185))

(declare-fun m!753379 () Bool)

(assert (=> b!811073 m!753379))

(assert (=> b!810902 d!104115))

(declare-fun d!104117 () Bool)

(declare-fun e!448922 () Bool)

(assert (=> d!104117 e!448922))

(declare-fun res!554270 () Bool)

(assert (=> d!104117 (=> (not res!554270) (not e!448922))))

(assert (=> d!104117 (= res!554270 (and (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21526 a!3170)) (and (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21526 a!3170)))) (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21526 a!3170)) (and (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21526 a!3170)))) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21526 a!3170))))))

(declare-fun lt!363640 () Unit!27654)

(declare-fun choose!112 (array!44068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27654)

(assert (=> d!104117 (= lt!363640 (choose!112 a!3170 i!1163 k!2044 j!153 lt!363520 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(assert (=> d!104117 (validMask!0 mask!3266)))

(assert (=> d!104117 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363520 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266) lt!363640)))

(declare-fun b!811095 () Bool)

(assert (=> b!811095 (= e!448922 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363520 vacantAfter!23 (select (store (arr!21105 a!3170) i!1163 k!2044) j!153) (array!44069 (store (arr!21105 a!3170) i!1163 k!2044) (size!21526 a!3170)) mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363520 vacantBefore!23 (select (arr!21105 a!3170) j!153) a!3170 mask!3266)))))

(assert (= (and d!104117 res!554270) b!811095))

(declare-fun m!753405 () Bool)

(assert (=> d!104117 m!753405))

(assert (=> d!104117 m!753213))

(assert (=> b!811095 m!753185))

(assert (=> b!811095 m!753195))

(assert (=> b!811095 m!753185))

(assert (=> b!811095 m!753227))

(assert (=> b!811095 m!753227))

(declare-fun m!753407 () Bool)

(assert (=> b!811095 m!753407))

(assert (=> b!811095 m!753225))

(assert (=> b!810902 d!104117))

(declare-fun d!104127 () Bool)

(declare-fun lt!363644 () (_ BitVec 32))

(assert (=> d!104127 (and (bvsge lt!363644 #b00000000000000000000000000000000) (bvslt lt!363644 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104127 (= lt!363644 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!104127 (validMask!0 mask!3266)))

(assert (=> d!104127 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!363644)))

(declare-fun bs!22450 () Bool)

(assert (= bs!22450 d!104127))

(declare-fun m!753413 () Bool)

(assert (=> bs!22450 m!753413))

(assert (=> bs!22450 m!753213))

(assert (=> b!810902 d!104127))

(declare-fun d!104131 () Bool)

(declare-fun res!554278 () Bool)

(declare-fun e!448939 () Bool)

(assert (=> d!104131 (=> res!554278 e!448939)))

(assert (=> d!104131 (= res!554278 (= (select (arr!21105 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!104131 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!448939)))

(declare-fun b!811121 () Bool)

(declare-fun e!448940 () Bool)

(assert (=> b!811121 (= e!448939 e!448940)))

(declare-fun res!554279 () Bool)

(assert (=> b!811121 (=> (not res!554279) (not e!448940))))

(assert (=> b!811121 (= res!554279 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21526 a!3170)))))

(declare-fun b!811122 () Bool)

(assert (=> b!811122 (= e!448940 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104131 (not res!554278)) b!811121))

(assert (= (and b!811121 res!554279) b!811122))

(assert (=> d!104131 m!753327))

(declare-fun m!753417 () Bool)

(assert (=> b!811122 m!753417))

(assert (=> b!810904 d!104131))

(declare-fun d!104135 () Bool)

(assert (=> d!104135 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810898 d!104135))

(declare-fun d!104139 () Bool)

(assert (=> d!104139 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69572 d!104139))

(declare-fun d!104159 () Bool)

(assert (=> d!104159 (= (array_inv!16901 a!3170) (bvsge (size!21526 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69572 d!104159))

(declare-fun d!104161 () Bool)

(assert (=> d!104161 (= (validKeyInArray!0 (select (arr!21105 a!3170) j!153)) (and (not (= (select (arr!21105 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21105 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810900 d!104161))

(declare-fun lt!363693 () SeekEntryResult!8696)

(declare-fun b!811237 () Bool)

(declare-fun e!449018 () SeekEntryResult!8696)

(assert (=> b!811237 (= e!449018 (seekKeyOrZeroReturnVacant!0 (x!67964 lt!363693) (index!37154 lt!363693) (index!37154 lt!363693) k!2044 a!3170 mask!3266))))

(declare-fun b!811238 () Bool)

(assert (=> b!811238 (= e!449018 (MissingZero!8696 (index!37154 lt!363693)))))

(declare-fun b!811239 () Bool)

(declare-fun e!449017 () SeekEntryResult!8696)

(assert (=> b!811239 (= e!449017 (Found!8696 (index!37154 lt!363693)))))

(declare-fun d!104163 () Bool)

(declare-fun lt!363694 () SeekEntryResult!8696)

(assert (=> d!104163 (and (or (is-Undefined!8696 lt!363694) (not (is-Found!8696 lt!363694)) (and (bvsge (index!37153 lt!363694) #b00000000000000000000000000000000) (bvslt (index!37153 lt!363694) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363694) (is-Found!8696 lt!363694) (not (is-MissingZero!8696 lt!363694)) (and (bvsge (index!37152 lt!363694) #b00000000000000000000000000000000) (bvslt (index!37152 lt!363694) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363694) (is-Found!8696 lt!363694) (is-MissingZero!8696 lt!363694) (not (is-MissingVacant!8696 lt!363694)) (and (bvsge (index!37155 lt!363694) #b00000000000000000000000000000000) (bvslt (index!37155 lt!363694) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363694) (ite (is-Found!8696 lt!363694) (= (select (arr!21105 a!3170) (index!37153 lt!363694)) k!2044) (ite (is-MissingZero!8696 lt!363694) (= (select (arr!21105 a!3170) (index!37152 lt!363694)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8696 lt!363694) (= (select (arr!21105 a!3170) (index!37155 lt!363694)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!449016 () SeekEntryResult!8696)

(assert (=> d!104163 (= lt!363694 e!449016)))

(declare-fun c!88873 () Bool)

(assert (=> d!104163 (= c!88873 (and (is-Intermediate!8696 lt!363693) (undefined!9508 lt!363693)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44068 (_ BitVec 32)) SeekEntryResult!8696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104163 (= lt!363693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!104163 (validMask!0 mask!3266)))

(assert (=> d!104163 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!363694)))

(declare-fun b!811240 () Bool)

(declare-fun c!88872 () Bool)

(declare-fun lt!363692 () (_ BitVec 64))

(assert (=> b!811240 (= c!88872 (= lt!363692 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811240 (= e!449017 e!449018)))

(declare-fun b!811241 () Bool)

(assert (=> b!811241 (= e!449016 Undefined!8696)))

(declare-fun b!811242 () Bool)

(assert (=> b!811242 (= e!449016 e!449017)))

(assert (=> b!811242 (= lt!363692 (select (arr!21105 a!3170) (index!37154 lt!363693)))))

(declare-fun c!88871 () Bool)

(assert (=> b!811242 (= c!88871 (= lt!363692 k!2044))))

(assert (= (and d!104163 c!88873) b!811241))

(assert (= (and d!104163 (not c!88873)) b!811242))

(assert (= (and b!811242 c!88871) b!811239))

(assert (= (and b!811242 (not c!88871)) b!811240))

(assert (= (and b!811240 c!88872) b!811238))

(assert (= (and b!811240 (not c!88872)) b!811237))

(declare-fun m!753545 () Bool)

(assert (=> b!811237 m!753545))

(declare-fun m!753547 () Bool)

(assert (=> d!104163 m!753547))

(assert (=> d!104163 m!753213))

(declare-fun m!753549 () Bool)

(assert (=> d!104163 m!753549))

(declare-fun m!753551 () Bool)

(assert (=> d!104163 m!753551))

(assert (=> d!104163 m!753551))

(declare-fun m!753553 () Bool)

(assert (=> d!104163 m!753553))

(declare-fun m!753555 () Bool)

(assert (=> d!104163 m!753555))

(declare-fun m!753557 () Bool)

(assert (=> b!811242 m!753557))

(assert (=> b!810901 d!104163))

(declare-fun b!811243 () Bool)

(declare-fun e!449020 () SeekEntryResult!8696)

(declare-fun e!449019 () SeekEntryResult!8696)

(assert (=> b!811243 (= e!449020 e!449019)))

(declare-fun c!88874 () Bool)

(declare-fun lt!363696 () (_ BitVec 64))

(assert (=> b!811243 (= c!88874 (= lt!363696 (select (arr!21105 a!3170) j!153)))))

(declare-fun b!811244 () Bool)

(assert (=> b!811244 (= e!449020 Undefined!8696)))

(declare-fun b!811245 () Bool)

(declare-fun e!449021 () SeekEntryResult!8696)

(assert (=> b!811245 (= e!449021 (MissingVacant!8696 vacantBefore!23))))

(declare-fun b!811246 () Bool)

(declare-fun c!88876 () Bool)

(assert (=> b!811246 (= c!88876 (= lt!363696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811246 (= e!449019 e!449021)))

(declare-fun lt!363695 () SeekEntryResult!8696)

(declare-fun d!104185 () Bool)

(assert (=> d!104185 (and (or (is-Undefined!8696 lt!363695) (not (is-Found!8696 lt!363695)) (and (bvsge (index!37153 lt!363695) #b00000000000000000000000000000000) (bvslt (index!37153 lt!363695) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363695) (is-Found!8696 lt!363695) (not (is-MissingVacant!8696 lt!363695)) (not (= (index!37155 lt!363695) vacantBefore!23)) (and (bvsge (index!37155 lt!363695) #b00000000000000000000000000000000) (bvslt (index!37155 lt!363695) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363695) (ite (is-Found!8696 lt!363695) (= (select (arr!21105 a!3170) (index!37153 lt!363695)) (select (arr!21105 a!3170) j!153)) (and (is-MissingVacant!8696 lt!363695) (= (index!37155 lt!363695) vacantBefore!23) (= (select (arr!21105 a!3170) (index!37155 lt!363695)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104185 (= lt!363695 e!449020)))

(declare-fun c!88875 () Bool)

(assert (=> d!104185 (= c!88875 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104185 (= lt!363696 (select (arr!21105 a!3170) index!1236))))

(assert (=> d!104185 (validMask!0 mask!3266)))

(assert (=> d!104185 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21105 a!3170) j!153) a!3170 mask!3266) lt!363695)))

(declare-fun b!811247 () Bool)

(assert (=> b!811247 (= e!449021 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21105 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811248 () Bool)

(assert (=> b!811248 (= e!449019 (Found!8696 index!1236))))

(assert (= (and d!104185 c!88875) b!811244))

(assert (= (and d!104185 (not c!88875)) b!811243))

(assert (= (and b!811243 c!88874) b!811248))

(assert (= (and b!811243 (not c!88874)) b!811246))

(assert (= (and b!811246 c!88876) b!811245))

(assert (= (and b!811246 (not c!88876)) b!811247))

(declare-fun m!753559 () Bool)

(assert (=> d!104185 m!753559))

(declare-fun m!753561 () Bool)

(assert (=> d!104185 m!753561))

(assert (=> d!104185 m!753201))

(assert (=> d!104185 m!753213))

(assert (=> b!811247 m!753191))

(assert (=> b!811247 m!753191))

(assert (=> b!811247 m!753185))

(declare-fun m!753563 () Bool)

(assert (=> b!811247 m!753563))

(assert (=> b!810896 d!104185))

(declare-fun b!811249 () Bool)

(declare-fun lt!363698 () SeekEntryResult!8696)

(declare-fun e!449024 () SeekEntryResult!8696)

(assert (=> b!811249 (= e!449024 (seekKeyOrZeroReturnVacant!0 (x!67964 lt!363698) (index!37154 lt!363698) (index!37154 lt!363698) (select (arr!21105 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811250 () Bool)

(assert (=> b!811250 (= e!449024 (MissingZero!8696 (index!37154 lt!363698)))))

(declare-fun b!811251 () Bool)

(declare-fun e!449023 () SeekEntryResult!8696)

(assert (=> b!811251 (= e!449023 (Found!8696 (index!37154 lt!363698)))))

(declare-fun d!104187 () Bool)

(declare-fun lt!363699 () SeekEntryResult!8696)

(assert (=> d!104187 (and (or (is-Undefined!8696 lt!363699) (not (is-Found!8696 lt!363699)) (and (bvsge (index!37153 lt!363699) #b00000000000000000000000000000000) (bvslt (index!37153 lt!363699) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363699) (is-Found!8696 lt!363699) (not (is-MissingZero!8696 lt!363699)) (and (bvsge (index!37152 lt!363699) #b00000000000000000000000000000000) (bvslt (index!37152 lt!363699) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363699) (is-Found!8696 lt!363699) (is-MissingZero!8696 lt!363699) (not (is-MissingVacant!8696 lt!363699)) (and (bvsge (index!37155 lt!363699) #b00000000000000000000000000000000) (bvslt (index!37155 lt!363699) (size!21526 a!3170)))) (or (is-Undefined!8696 lt!363699) (ite (is-Found!8696 lt!363699) (= (select (arr!21105 a!3170) (index!37153 lt!363699)) (select (arr!21105 a!3170) j!153)) (ite (is-MissingZero!8696 lt!363699) (= (select (arr!21105 a!3170) (index!37152 lt!363699)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8696 lt!363699) (= (select (arr!21105 a!3170) (index!37155 lt!363699)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!449022 () SeekEntryResult!8696)

(assert (=> d!104187 (= lt!363699 e!449022)))

(declare-fun c!88879 () Bool)

(assert (=> d!104187 (= c!88879 (and (is-Intermediate!8696 lt!363698) (undefined!9508 lt!363698)))))

(assert (=> d!104187 (= lt!363698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21105 a!3170) j!153) mask!3266) (select (arr!21105 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104187 (validMask!0 mask!3266)))

(assert (=> d!104187 (= (seekEntryOrOpen!0 (select (arr!21105 a!3170) j!153) a!3170 mask!3266) lt!363699)))

(declare-fun b!811252 () Bool)

(declare-fun c!88878 () Bool)

(declare-fun lt!363697 () (_ BitVec 64))

(assert (=> b!811252 (= c!88878 (= lt!363697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811252 (= e!449023 e!449024)))

(declare-fun b!811253 () Bool)

(assert (=> b!811253 (= e!449022 Undefined!8696)))

(declare-fun b!811254 () Bool)

(assert (=> b!811254 (= e!449022 e!449023)))

(assert (=> b!811254 (= lt!363697 (select (arr!21105 a!3170) (index!37154 lt!363698)))))

(declare-fun c!88877 () Bool)

(assert (=> b!811254 (= c!88877 (= lt!363697 (select (arr!21105 a!3170) j!153)))))

(assert (= (and d!104187 c!88879) b!811253))

(assert (= (and d!104187 (not c!88879)) b!811254))

(assert (= (and b!811254 c!88877) b!811251))

(assert (= (and b!811254 (not c!88877)) b!811252))

(assert (= (and b!811252 c!88878) b!811250))

(assert (= (and b!811252 (not c!88878)) b!811249))

(assert (=> b!811249 m!753185))

(declare-fun m!753565 () Bool)

(assert (=> b!811249 m!753565))

(declare-fun m!753567 () Bool)

(assert (=> d!104187 m!753567))

(assert (=> d!104187 m!753213))

(declare-fun m!753569 () Bool)

(assert (=> d!104187 m!753569))

(assert (=> d!104187 m!753185))

(declare-fun m!753571 () Bool)

(assert (=> d!104187 m!753571))

(assert (=> d!104187 m!753571))

(assert (=> d!104187 m!753185))

(declare-fun m!753573 () Bool)

(assert (=> d!104187 m!753573))

(declare-fun m!753575 () Bool)

(assert (=> d!104187 m!753575))

(declare-fun m!753577 () Bool)

(assert (=> b!811254 m!753577))

(assert (=> b!810896 d!104187))

(declare-fun b!811255 () Bool)

(declare-fun e!449026 () SeekEntryResult!8696)

(declare-fun e!449025 () SeekEntryResult!8696)

(assert (=> b!811255 (= e!449026 e!449025)))

(declare-fun c!88880 () Bool)

(declare-fun lt!363701 () (_ BitVec 64))

(assert (=> b!811255 (= c!88880 (= lt!363701 lt!363518))))

(declare-fun b!811256 () Bool)

(assert (=> b!811256 (= e!449026 Undefined!8696)))

(declare-fun b!811257 () Bool)

(declare-fun e!449027 () SeekEntryResult!8696)

(assert (=> b!811257 (= e!449027 (MissingVacant!8696 vacantAfter!23))))

(declare-fun b!811258 () Bool)

(declare-fun c!88882 () Bool)

(assert (=> b!811258 (= c!88882 (= lt!363701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811258 (= e!449025 e!449027)))

(declare-fun d!104189 () Bool)

(declare-fun lt!363700 () SeekEntryResult!8696)

(assert (=> d!104189 (and (or (is-Undefined!8696 lt!363700) (not (is-Found!8696 lt!363700)) (and (bvsge (index!37153 lt!363700) #b00000000000000000000000000000000) (bvslt (index!37153 lt!363700) (size!21526 lt!363522)))) (or (is-Undefined!8696 lt!363700) (is-Found!8696 lt!363700) (not (is-MissingVacant!8696 lt!363700)) (not (= (index!37155 lt!363700) vacantAfter!23)) (and (bvsge (index!37155 lt!363700) #b00000000000000000000000000000000) (bvslt (index!37155 lt!363700) (size!21526 lt!363522)))) (or (is-Undefined!8696 lt!363700) (ite (is-Found!8696 lt!363700) (= (select (arr!21105 lt!363522) (index!37153 lt!363700)) lt!363518) (and (is-MissingVacant!8696 lt!363700) (= (index!37155 lt!363700) vacantAfter!23) (= (select (arr!21105 lt!363522) (index!37155 lt!363700)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104189 (= lt!363700 e!449026)))

(declare-fun c!88881 () Bool)

(assert (=> d!104189 (= c!88881 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104189 (= lt!363701 (select (arr!21105 lt!363522) index!1236))))

(assert (=> d!104189 (validMask!0 mask!3266)))

(assert (=> d!104189 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363518 lt!363522 mask!3266) lt!363700)))

(declare-fun b!811259 () Bool)

(assert (=> b!811259 (= e!449027 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!363518 lt!363522 mask!3266))))

(declare-fun b!811260 () Bool)

(assert (=> b!811260 (= e!449025 (Found!8696 index!1236))))

(assert (= (and d!104189 c!88881) b!811256))

(assert (= (and d!104189 (not c!88881)) b!811255))

(assert (= (and b!811255 c!88880) b!811260))

(assert (= (and b!811255 (not c!88880)) b!811258))

(assert (= (and b!811258 c!88882) b!811257))

(assert (= (and b!811258 (not c!88882)) b!811259))

(declare-fun m!753579 () Bool)

(assert (=> d!104189 m!753579))

(declare-fun m!753581 () Bool)

(assert (=> d!104189 m!753581))

(declare-fun m!753583 () Bool)

(assert (=> d!104189 m!753583))

(assert (=> d!104189 m!753213))

(assert (=> b!811259 m!753191))

(assert (=> b!811259 m!753191))

(declare-fun m!753585 () Bool)

(assert (=> b!811259 m!753585))

(assert (=> b!810895 d!104189))

(declare-fun lt!363703 () SeekEntryResult!8696)

(declare-fun e!449030 () SeekEntryResult!8696)

(declare-fun b!811261 () Bool)

(assert (=> b!811261 (= e!449030 (seekKeyOrZeroReturnVacant!0 (x!67964 lt!363703) (index!37154 lt!363703) (index!37154 lt!363703) lt!363518 lt!363522 mask!3266))))

(declare-fun b!811262 () Bool)

(assert (=> b!811262 (= e!449030 (MissingZero!8696 (index!37154 lt!363703)))))

(declare-fun b!811263 () Bool)

(declare-fun e!449029 () SeekEntryResult!8696)

(assert (=> b!811263 (= e!449029 (Found!8696 (index!37154 lt!363703)))))

(declare-fun d!104191 () Bool)

(declare-fun lt!363704 () SeekEntryResult!8696)

(assert (=> d!104191 (and (or (is-Undefined!8696 lt!363704) (not (is-Found!8696 lt!363704)) (and (bvsge (index!37153 lt!363704) #b00000000000000000000000000000000) (bvslt (index!37153 lt!363704) (size!21526 lt!363522)))) (or (is-Undefined!8696 lt!363704) (is-Found!8696 lt!363704) (not (is-MissingZero!8696 lt!363704)) (and (bvsge (index!37152 lt!363704) #b00000000000000000000000000000000) (bvslt (index!37152 lt!363704) (size!21526 lt!363522)))) (or (is-Undefined!8696 lt!363704) (is-Found!8696 lt!363704) (is-MissingZero!8696 lt!363704) (not (is-MissingVacant!8696 lt!363704)) (and (bvsge (index!37155 lt!363704) #b00000000000000000000000000000000) (bvslt (index!37155 lt!363704) (size!21526 lt!363522)))) (or (is-Undefined!8696 lt!363704) (ite (is-Found!8696 lt!363704) (= (select (arr!21105 lt!363522) (index!37153 lt!363704)) lt!363518) (ite (is-MissingZero!8696 lt!363704) (= (select (arr!21105 lt!363522) (index!37152 lt!363704)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8696 lt!363704) (= (select (arr!21105 lt!363522) (index!37155 lt!363704)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!449028 () SeekEntryResult!8696)

(assert (=> d!104191 (= lt!363704 e!449028)))

(declare-fun c!88885 () Bool)

(assert (=> d!104191 (= c!88885 (and (is-Intermediate!8696 lt!363703) (undefined!9508 lt!363703)))))

(assert (=> d!104191 (= lt!363703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!363518 mask!3266) lt!363518 lt!363522 mask!3266))))

(assert (=> d!104191 (validMask!0 mask!3266)))

(assert (=> d!104191 (= (seekEntryOrOpen!0 lt!363518 lt!363522 mask!3266) lt!363704)))

(declare-fun b!811264 () Bool)

(declare-fun c!88884 () Bool)

(declare-fun lt!363702 () (_ BitVec 64))

(assert (=> b!811264 (= c!88884 (= lt!363702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811264 (= e!449029 e!449030)))

(declare-fun b!811265 () Bool)

(assert (=> b!811265 (= e!449028 Undefined!8696)))

(declare-fun b!811266 () Bool)

(assert (=> b!811266 (= e!449028 e!449029)))

(assert (=> b!811266 (= lt!363702 (select (arr!21105 lt!363522) (index!37154 lt!363703)))))

(declare-fun c!88883 () Bool)

(assert (=> b!811266 (= c!88883 (= lt!363702 lt!363518))))

(assert (= (and d!104191 c!88885) b!811265))

(assert (= (and d!104191 (not c!88885)) b!811266))

(assert (= (and b!811266 c!88883) b!811263))

(assert (= (and b!811266 (not c!88883)) b!811264))

(assert (= (and b!811264 c!88884) b!811262))

(assert (= (and b!811264 (not c!88884)) b!811261))

(declare-fun m!753587 () Bool)

(assert (=> b!811261 m!753587))

(declare-fun m!753589 () Bool)

(assert (=> d!104191 m!753589))

(assert (=> d!104191 m!753213))

(declare-fun m!753591 () Bool)

(assert (=> d!104191 m!753591))

(declare-fun m!753593 () Bool)

(assert (=> d!104191 m!753593))

(assert (=> d!104191 m!753593))

(declare-fun m!753595 () Bool)

(assert (=> d!104191 m!753595))

(declare-fun m!753597 () Bool)

(assert (=> d!104191 m!753597))

(declare-fun m!753599 () Bool)

(assert (=> b!811266 m!753599))

(assert (=> b!810895 d!104191))

(declare-fun bm!35469 () Bool)

(declare-fun call!35472 () Bool)

(declare-fun c!88888 () Bool)

(assert (=> bm!35469 (= call!35472 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88888 (Cons!15064 (select (arr!21105 a!3170) #b00000000000000000000000000000000) Nil!15065) Nil!15065)))))

(declare-fun b!811281 () Bool)

(declare-fun e!449044 () Bool)

(assert (=> b!811281 (= e!449044 call!35472)))

(declare-fun b!811282 () Bool)

(declare-fun e!449042 () Bool)

(declare-fun contains!4136 (List!15068 (_ BitVec 64)) Bool)

(assert (=> b!811282 (= e!449042 (contains!4136 Nil!15065 (select (arr!21105 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811283 () Bool)

(declare-fun e!449045 () Bool)

(assert (=> b!811283 (= e!449045 e!449044)))

(assert (=> b!811283 (= c!88888 (validKeyInArray!0 (select (arr!21105 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811284 () Bool)

(assert (=> b!811284 (= e!449044 call!35472)))

(declare-fun b!811280 () Bool)

(declare-fun e!449043 () Bool)

(assert (=> b!811280 (= e!449043 e!449045)))

(declare-fun res!554325 () Bool)

(assert (=> b!811280 (=> (not res!554325) (not e!449045))))

(assert (=> b!811280 (= res!554325 (not e!449042))))

(declare-fun res!554327 () Bool)

(assert (=> b!811280 (=> (not res!554327) (not e!449042))))

(assert (=> b!811280 (= res!554327 (validKeyInArray!0 (select (arr!21105 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!104193 () Bool)

(declare-fun res!554326 () Bool)

(assert (=> d!104193 (=> res!554326 e!449043)))

(assert (=> d!104193 (= res!554326 (bvsge #b00000000000000000000000000000000 (size!21526 a!3170)))))

(assert (=> d!104193 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15065) e!449043)))

(assert (= (and d!104193 (not res!554326)) b!811280))

(assert (= (and b!811280 res!554327) b!811282))

(assert (= (and b!811280 res!554325) b!811283))

(assert (= (and b!811283 c!88888) b!811284))

(assert (= (and b!811283 (not c!88888)) b!811281))

(assert (= (or b!811284 b!811281) bm!35469))

(assert (=> bm!35469 m!753327))

(declare-fun m!753605 () Bool)

(assert (=> bm!35469 m!753605))

(assert (=> b!811282 m!753327))

(assert (=> b!811282 m!753327))

(declare-fun m!753607 () Bool)

(assert (=> b!811282 m!753607))

(assert (=> b!811283 m!753327))

(assert (=> b!811283 m!753327))

(assert (=> b!811283 m!753331))

(assert (=> b!811280 m!753327))

(assert (=> b!811280 m!753327))

(assert (=> b!811280 m!753331))

(assert (=> b!810906 d!104193))

(push 1)

(assert (not b!811237))

(assert (not d!104189))

(assert (not b!811259))

(assert (not b!811249))

(assert (not b!811067))

(assert (not b!811247))

(assert (not b!811283))

(assert (not d!104117))

(assert (not d!104111))

(assert (not d!104191))

(assert (not b!811073))

(assert (not b!811282))

(assert (not d!104115))

(assert (not d!104187))

(assert (not bm!35456))

(assert (not d!104185))

(assert (not b!811014))

(assert (not bm!35469))

(assert (not b!811095))

(assert (not b!811013))

(assert (not d!104163))

(assert (not b!811280))

(assert (not b!811261))

(assert (not d!104127))

(assert (not b!811122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

