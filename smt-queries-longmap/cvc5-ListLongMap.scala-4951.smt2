; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68094 () Bool)

(assert start!68094)

(declare-fun b!792084 () Bool)

(declare-fun res!536822 () Bool)

(declare-fun e!440106 () Bool)

(assert (=> b!792084 (=> (not res!536822) (not e!440106))))

(declare-datatypes ((array!42997 0))(
  ( (array!42998 (arr!20583 (Array (_ BitVec 32) (_ BitVec 64))) (size!21004 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42997)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42997 (_ BitVec 32)) Bool)

(assert (=> b!792084 (= res!536822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!536825 () Bool)

(declare-fun e!440107 () Bool)

(assert (=> start!68094 (=> (not res!536825) (not e!440107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68094 (= res!536825 (validMask!0 mask!3266))))

(assert (=> start!68094 e!440107))

(assert (=> start!68094 true))

(declare-fun array_inv!16379 (array!42997) Bool)

(assert (=> start!68094 (array_inv!16379 a!3170)))

(declare-fun b!792085 () Bool)

(assert (=> b!792085 (= e!440106 (and (bvsle #b00000000000000000000000000000000 (size!21004 a!3170)) (bvsge (size!21004 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792086 () Bool)

(declare-fun res!536824 () Bool)

(assert (=> b!792086 (=> (not res!536824) (not e!440107))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792086 (= res!536824 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792087 () Bool)

(declare-fun res!536819 () Bool)

(assert (=> b!792087 (=> (not res!536819) (not e!440107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792087 (= res!536819 (validKeyInArray!0 k!2044))))

(declare-fun b!792088 () Bool)

(declare-fun res!536820 () Bool)

(assert (=> b!792088 (=> (not res!536820) (not e!440107))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792088 (= res!536820 (validKeyInArray!0 (select (arr!20583 a!3170) j!153)))))

(declare-fun b!792089 () Bool)

(assert (=> b!792089 (= e!440107 e!440106)))

(declare-fun res!536821 () Bool)

(assert (=> b!792089 (=> (not res!536821) (not e!440106))))

(declare-datatypes ((SeekEntryResult!8174 0))(
  ( (MissingZero!8174 (index!35064 (_ BitVec 32))) (Found!8174 (index!35065 (_ BitVec 32))) (Intermediate!8174 (undefined!8986 Bool) (index!35066 (_ BitVec 32)) (x!66020 (_ BitVec 32))) (Undefined!8174) (MissingVacant!8174 (index!35067 (_ BitVec 32))) )
))
(declare-fun lt!353360 () SeekEntryResult!8174)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792089 (= res!536821 (or (= lt!353360 (MissingZero!8174 i!1163)) (= lt!353360 (MissingVacant!8174 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42997 (_ BitVec 32)) SeekEntryResult!8174)

(assert (=> b!792089 (= lt!353360 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792090 () Bool)

(declare-fun res!536823 () Bool)

(assert (=> b!792090 (=> (not res!536823) (not e!440107))))

(assert (=> b!792090 (= res!536823 (and (= (size!21004 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21004 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21004 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68094 res!536825) b!792090))

(assert (= (and b!792090 res!536823) b!792088))

(assert (= (and b!792088 res!536820) b!792087))

(assert (= (and b!792087 res!536819) b!792086))

(assert (= (and b!792086 res!536824) b!792089))

(assert (= (and b!792089 res!536821) b!792084))

(assert (= (and b!792084 res!536822) b!792085))

(declare-fun m!732761 () Bool)

(assert (=> b!792086 m!732761))

(declare-fun m!732763 () Bool)

(assert (=> b!792088 m!732763))

(assert (=> b!792088 m!732763))

(declare-fun m!732765 () Bool)

(assert (=> b!792088 m!732765))

(declare-fun m!732767 () Bool)

(assert (=> b!792089 m!732767))

(declare-fun m!732769 () Bool)

(assert (=> b!792087 m!732769))

(declare-fun m!732771 () Bool)

(assert (=> b!792084 m!732771))

(declare-fun m!732773 () Bool)

(assert (=> start!68094 m!732773))

(declare-fun m!732775 () Bool)

(assert (=> start!68094 m!732775))

(push 1)

(assert (not b!792084))

(assert (not b!792087))

(assert (not start!68094))

(assert (not b!792086))

(assert (not b!792088))

(assert (not b!792089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!792153 () Bool)

(declare-fun e!440143 () Bool)

(declare-fun e!440144 () Bool)

(assert (=> b!792153 (= e!440143 e!440144)))

(declare-fun lt!353375 () (_ BitVec 64))

(assert (=> b!792153 (= lt!353375 (select (arr!20583 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27448 0))(
  ( (Unit!27449) )
))
(declare-fun lt!353374 () Unit!27448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42997 (_ BitVec 64) (_ BitVec 32)) Unit!27448)

(assert (=> b!792153 (= lt!353374 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353375 #b00000000000000000000000000000000))))

(assert (=> b!792153 (arrayContainsKey!0 a!3170 lt!353375 #b00000000000000000000000000000000)))

(declare-fun lt!353373 () Unit!27448)

(assert (=> b!792153 (= lt!353373 lt!353374)))

(declare-fun res!536880 () Bool)

(assert (=> b!792153 (= res!536880 (= (seekEntryOrOpen!0 (select (arr!20583 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8174 #b00000000000000000000000000000000)))))

(assert (=> b!792153 (=> (not res!536880) (not e!440144))))

(declare-fun b!792154 () Bool)

(declare-fun call!35322 () Bool)

(assert (=> b!792154 (= e!440144 call!35322)))

(declare-fun bm!35319 () Bool)

(assert (=> bm!35319 (= call!35322 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun d!103139 () Bool)

(declare-fun res!536881 () Bool)

(declare-fun e!440145 () Bool)

(assert (=> d!103139 (=> res!536881 e!440145)))

(assert (=> d!103139 (= res!536881 (bvsge #b00000000000000000000000000000000 (size!21004 a!3170)))))

(assert (=> d!103139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440145)))

(declare-fun b!792155 () Bool)

(assert (=> b!792155 (= e!440145 e!440143)))

(declare-fun c!88047 () Bool)

(assert (=> b!792155 (= c!88047 (validKeyInArray!0 (select (arr!20583 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!792156 () Bool)

(assert (=> b!792156 (= e!440143 call!35322)))

(assert (= (and d!103139 (not res!536881)) b!792155))

(assert (= (and b!792155 c!88047) b!792153))

(assert (= (and b!792155 (not c!88047)) b!792156))

(assert (= (and b!792153 res!536880) b!792154))

(assert (= (or b!792154 b!792156) bm!35319))

(declare-fun m!732813 () Bool)

(assert (=> b!792153 m!732813))

(declare-fun m!732815 () Bool)

(assert (=> b!792153 m!732815))

(declare-fun m!732817 () Bool)

(assert (=> b!792153 m!732817))

(assert (=> b!792153 m!732813))

(declare-fun m!732819 () Bool)

(assert (=> b!792153 m!732819))

(declare-fun m!732821 () Bool)

(assert (=> bm!35319 m!732821))

(assert (=> b!792155 m!732813))

(assert (=> b!792155 m!732813))

(declare-fun m!732823 () Bool)

(assert (=> b!792155 m!732823))

(assert (=> b!792084 d!103139))

(declare-fun d!103147 () Bool)

(assert (=> d!103147 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68094 d!103147))

(declare-fun d!103151 () Bool)

(assert (=> d!103151 (= (array_inv!16379 a!3170) (bvsge (size!21004 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68094 d!103151))

(declare-fun b!792229 () Bool)

(declare-fun c!88076 () Bool)

(declare-fun lt!353420 () (_ BitVec 64))

(assert (=> b!792229 (= c!88076 (= lt!353420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440190 () SeekEntryResult!8174)

(declare-fun e!440191 () SeekEntryResult!8174)

(assert (=> b!792229 (= e!440190 e!440191)))

(declare-fun b!792230 () Bool)

(declare-fun lt!353419 () SeekEntryResult!8174)

(assert (=> b!792230 (= e!440190 (Found!8174 (index!35066 lt!353419)))))

(declare-fun b!792231 () Bool)

(declare-fun e!440192 () SeekEntryResult!8174)

(assert (=> b!792231 (= e!440192 Undefined!8174)))

(declare-fun d!103153 () Bool)

(declare-fun lt!353418 () SeekEntryResult!8174)

(assert (=> d!103153 (and (or (is-Undefined!8174 lt!353418) (not (is-Found!8174 lt!353418)) (and (bvsge (index!35065 lt!353418) #b00000000000000000000000000000000) (bvslt (index!35065 lt!353418) (size!21004 a!3170)))) (or (is-Undefined!8174 lt!353418) (is-Found!8174 lt!353418) (not (is-MissingZero!8174 lt!353418)) (and (bvsge (index!35064 lt!353418) #b00000000000000000000000000000000) (bvslt (index!35064 lt!353418) (size!21004 a!3170)))) (or (is-Undefined!8174 lt!353418) (is-Found!8174 lt!353418) (is-MissingZero!8174 lt!353418) (not (is-MissingVacant!8174 lt!353418)) (and (bvsge (index!35067 lt!353418) #b00000000000000000000000000000000) (bvslt (index!35067 lt!353418) (size!21004 a!3170)))) (or (is-Undefined!8174 lt!353418) (ite (is-Found!8174 lt!353418) (= (select (arr!20583 a!3170) (index!35065 lt!353418)) k!2044) (ite (is-MissingZero!8174 lt!353418) (= (select (arr!20583 a!3170) (index!35064 lt!353418)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8174 lt!353418) (= (select (arr!20583 a!3170) (index!35067 lt!353418)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103153 (= lt!353418 e!440192)))

(declare-fun c!88078 () Bool)

(assert (=> d!103153 (= c!88078 (and (is-Intermediate!8174 lt!353419) (undefined!8986 lt!353419)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42997 (_ BitVec 32)) SeekEntryResult!8174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103153 (= lt!353419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103153 (validMask!0 mask!3266)))

(assert (=> d!103153 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!353418)))

(declare-fun b!792232 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42997 (_ BitVec 32)) SeekEntryResult!8174)

(assert (=> b!792232 (= e!440191 (seekKeyOrZeroReturnVacant!0 (x!66020 lt!353419) (index!35066 lt!353419) (index!35066 lt!353419) k!2044 a!3170 mask!3266))))

(declare-fun b!792233 () Bool)

(assert (=> b!792233 (= e!440192 e!440190)))

(assert (=> b!792233 (= lt!353420 (select (arr!20583 a!3170) (index!35066 lt!353419)))))

(declare-fun c!88077 () Bool)

(assert (=> b!792233 (= c!88077 (= lt!353420 k!2044))))

(declare-fun b!792234 () Bool)

(assert (=> b!792234 (= e!440191 (MissingZero!8174 (index!35066 lt!353419)))))

(assert (= (and d!103153 c!88078) b!792231))

(assert (= (and d!103153 (not c!88078)) b!792233))

(assert (= (and b!792233 c!88077) b!792230))

(assert (= (and b!792233 (not c!88077)) b!792229))

(assert (= (and b!792229 c!88076) b!792234))

(assert (= (and b!792229 (not c!88076)) b!792232))

(declare-fun m!732877 () Bool)

(assert (=> d!103153 m!732877))

