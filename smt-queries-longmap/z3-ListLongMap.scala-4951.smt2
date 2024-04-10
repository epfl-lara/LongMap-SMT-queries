; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68096 () Bool)

(assert start!68096)

(declare-fun b!792105 () Bool)

(declare-fun e!440115 () Bool)

(declare-fun e!440116 () Bool)

(assert (=> b!792105 (= e!440115 e!440116)))

(declare-fun res!536841 () Bool)

(assert (=> b!792105 (=> (not res!536841) (not e!440116))))

(declare-datatypes ((SeekEntryResult!8175 0))(
  ( (MissingZero!8175 (index!35068 (_ BitVec 32))) (Found!8175 (index!35069 (_ BitVec 32))) (Intermediate!8175 (undefined!8987 Bool) (index!35070 (_ BitVec 32)) (x!66021 (_ BitVec 32))) (Undefined!8175) (MissingVacant!8175 (index!35071 (_ BitVec 32))) )
))
(declare-fun lt!353363 () SeekEntryResult!8175)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792105 (= res!536841 (or (= lt!353363 (MissingZero!8175 i!1163)) (= lt!353363 (MissingVacant!8175 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!42999 0))(
  ( (array!43000 (arr!20584 (Array (_ BitVec 32) (_ BitVec 64))) (size!21005 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42999)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42999 (_ BitVec 32)) SeekEntryResult!8175)

(assert (=> b!792105 (= lt!353363 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!536846 () Bool)

(assert (=> start!68096 (=> (not res!536846) (not e!440115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68096 (= res!536846 (validMask!0 mask!3266))))

(assert (=> start!68096 e!440115))

(assert (=> start!68096 true))

(declare-fun array_inv!16380 (array!42999) Bool)

(assert (=> start!68096 (array_inv!16380 a!3170)))

(declare-fun b!792106 () Bool)

(declare-fun res!536842 () Bool)

(assert (=> b!792106 (=> (not res!536842) (not e!440115))))

(declare-fun arrayContainsKey!0 (array!42999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792106 (= res!536842 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792107 () Bool)

(assert (=> b!792107 (= e!440116 (and (bvsle #b00000000000000000000000000000000 (size!21005 a!3170)) (bvsge (size!21005 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792108 () Bool)

(declare-fun res!536840 () Bool)

(assert (=> b!792108 (=> (not res!536840) (not e!440115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792108 (= res!536840 (validKeyInArray!0 k0!2044))))

(declare-fun b!792109 () Bool)

(declare-fun res!536844 () Bool)

(assert (=> b!792109 (=> (not res!536844) (not e!440115))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792109 (= res!536844 (and (= (size!21005 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21005 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21005 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792110 () Bool)

(declare-fun res!536843 () Bool)

(assert (=> b!792110 (=> (not res!536843) (not e!440116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42999 (_ BitVec 32)) Bool)

(assert (=> b!792110 (= res!536843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792111 () Bool)

(declare-fun res!536845 () Bool)

(assert (=> b!792111 (=> (not res!536845) (not e!440115))))

(assert (=> b!792111 (= res!536845 (validKeyInArray!0 (select (arr!20584 a!3170) j!153)))))

(assert (= (and start!68096 res!536846) b!792109))

(assert (= (and b!792109 res!536844) b!792111))

(assert (= (and b!792111 res!536845) b!792108))

(assert (= (and b!792108 res!536840) b!792106))

(assert (= (and b!792106 res!536842) b!792105))

(assert (= (and b!792105 res!536841) b!792110))

(assert (= (and b!792110 res!536843) b!792107))

(declare-fun m!732777 () Bool)

(assert (=> b!792105 m!732777))

(declare-fun m!732779 () Bool)

(assert (=> b!792111 m!732779))

(assert (=> b!792111 m!732779))

(declare-fun m!732781 () Bool)

(assert (=> b!792111 m!732781))

(declare-fun m!732783 () Bool)

(assert (=> b!792108 m!732783))

(declare-fun m!732785 () Bool)

(assert (=> start!68096 m!732785))

(declare-fun m!732787 () Bool)

(assert (=> start!68096 m!732787))

(declare-fun m!732789 () Bool)

(assert (=> b!792106 m!732789))

(declare-fun m!732791 () Bool)

(assert (=> b!792110 m!732791))

(check-sat (not b!792106) (not b!792105) (not b!792108) (not b!792110) (not b!792111) (not start!68096))
(check-sat)
(get-model)

(declare-fun d!103135 () Bool)

(assert (=> d!103135 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792108 d!103135))

(declare-fun d!103137 () Bool)

(declare-fun res!536872 () Bool)

(declare-fun e!440131 () Bool)

(assert (=> d!103137 (=> res!536872 e!440131)))

(assert (=> d!103137 (= res!536872 (= (select (arr!20584 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103137 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!440131)))

(declare-fun b!792137 () Bool)

(declare-fun e!440132 () Bool)

(assert (=> b!792137 (= e!440131 e!440132)))

(declare-fun res!536873 () Bool)

(assert (=> b!792137 (=> (not res!536873) (not e!440132))))

(assert (=> b!792137 (= res!536873 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21005 a!3170)))))

(declare-fun b!792138 () Bool)

(assert (=> b!792138 (= e!440132 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103137 (not res!536872)) b!792137))

(assert (= (and b!792137 res!536873) b!792138))

(declare-fun m!732809 () Bool)

(assert (=> d!103137 m!732809))

(declare-fun m!732811 () Bool)

(assert (=> b!792138 m!732811))

(assert (=> b!792106 d!103137))

(declare-fun d!103141 () Bool)

(assert (=> d!103141 (= (validKeyInArray!0 (select (arr!20584 a!3170) j!153)) (and (not (= (select (arr!20584 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20584 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792111 d!103141))

(declare-fun b!792159 () Bool)

(declare-fun e!440149 () Bool)

(declare-fun call!35325 () Bool)

(assert (=> b!792159 (= e!440149 call!35325)))

(declare-fun b!792160 () Bool)

(declare-fun e!440150 () Bool)

(assert (=> b!792160 (= e!440150 call!35325)))

(declare-fun d!103143 () Bool)

(declare-fun res!536885 () Bool)

(declare-fun e!440148 () Bool)

(assert (=> d!103143 (=> res!536885 e!440148)))

(assert (=> d!103143 (= res!536885 (bvsge #b00000000000000000000000000000000 (size!21005 a!3170)))))

(assert (=> d!103143 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440148)))

(declare-fun b!792161 () Bool)

(assert (=> b!792161 (= e!440148 e!440150)))

(declare-fun c!88048 () Bool)

(assert (=> b!792161 (= c!88048 (validKeyInArray!0 (select (arr!20584 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!792162 () Bool)

(assert (=> b!792162 (= e!440150 e!440149)))

(declare-fun lt!353383 () (_ BitVec 64))

(assert (=> b!792162 (= lt!353383 (select (arr!20584 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27446 0))(
  ( (Unit!27447) )
))
(declare-fun lt!353384 () Unit!27446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42999 (_ BitVec 64) (_ BitVec 32)) Unit!27446)

(assert (=> b!792162 (= lt!353384 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353383 #b00000000000000000000000000000000))))

(assert (=> b!792162 (arrayContainsKey!0 a!3170 lt!353383 #b00000000000000000000000000000000)))

(declare-fun lt!353382 () Unit!27446)

(assert (=> b!792162 (= lt!353382 lt!353384)))

(declare-fun res!536884 () Bool)

(assert (=> b!792162 (= res!536884 (= (seekEntryOrOpen!0 (select (arr!20584 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8175 #b00000000000000000000000000000000)))))

(assert (=> b!792162 (=> (not res!536884) (not e!440149))))

(declare-fun bm!35322 () Bool)

(assert (=> bm!35322 (= call!35325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(assert (= (and d!103143 (not res!536885)) b!792161))

(assert (= (and b!792161 c!88048) b!792162))

(assert (= (and b!792161 (not c!88048)) b!792160))

(assert (= (and b!792162 res!536884) b!792159))

(assert (= (or b!792159 b!792160) bm!35322))

(assert (=> b!792161 m!732809))

(assert (=> b!792161 m!732809))

(declare-fun m!732825 () Bool)

(assert (=> b!792161 m!732825))

(assert (=> b!792162 m!732809))

(declare-fun m!732827 () Bool)

(assert (=> b!792162 m!732827))

(declare-fun m!732829 () Bool)

(assert (=> b!792162 m!732829))

(assert (=> b!792162 m!732809))

(declare-fun m!732831 () Bool)

(assert (=> b!792162 m!732831))

(declare-fun m!732833 () Bool)

(assert (=> bm!35322 m!732833))

(assert (=> b!792110 d!103143))

(declare-fun e!440173 () SeekEntryResult!8175)

(declare-fun lt!353402 () SeekEntryResult!8175)

(declare-fun b!792199 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42999 (_ BitVec 32)) SeekEntryResult!8175)

(assert (=> b!792199 (= e!440173 (seekKeyOrZeroReturnVacant!0 (x!66021 lt!353402) (index!35070 lt!353402) (index!35070 lt!353402) k0!2044 a!3170 mask!3266))))

(declare-fun b!792200 () Bool)

(declare-fun e!440172 () SeekEntryResult!8175)

(assert (=> b!792200 (= e!440172 (Found!8175 (index!35070 lt!353402)))))

(declare-fun b!792201 () Bool)

(declare-fun e!440174 () SeekEntryResult!8175)

(assert (=> b!792201 (= e!440174 e!440172)))

(declare-fun lt!353400 () (_ BitVec 64))

(assert (=> b!792201 (= lt!353400 (select (arr!20584 a!3170) (index!35070 lt!353402)))))

(declare-fun c!88065 () Bool)

(assert (=> b!792201 (= c!88065 (= lt!353400 k0!2044))))

(declare-fun b!792203 () Bool)

(assert (=> b!792203 (= e!440174 Undefined!8175)))

(declare-fun b!792204 () Bool)

(assert (=> b!792204 (= e!440173 (MissingZero!8175 (index!35070 lt!353402)))))

(declare-fun d!103149 () Bool)

(declare-fun lt!353401 () SeekEntryResult!8175)

(get-info :version)

(assert (=> d!103149 (and (or ((_ is Undefined!8175) lt!353401) (not ((_ is Found!8175) lt!353401)) (and (bvsge (index!35069 lt!353401) #b00000000000000000000000000000000) (bvslt (index!35069 lt!353401) (size!21005 a!3170)))) (or ((_ is Undefined!8175) lt!353401) ((_ is Found!8175) lt!353401) (not ((_ is MissingZero!8175) lt!353401)) (and (bvsge (index!35068 lt!353401) #b00000000000000000000000000000000) (bvslt (index!35068 lt!353401) (size!21005 a!3170)))) (or ((_ is Undefined!8175) lt!353401) ((_ is Found!8175) lt!353401) ((_ is MissingZero!8175) lt!353401) (not ((_ is MissingVacant!8175) lt!353401)) (and (bvsge (index!35071 lt!353401) #b00000000000000000000000000000000) (bvslt (index!35071 lt!353401) (size!21005 a!3170)))) (or ((_ is Undefined!8175) lt!353401) (ite ((_ is Found!8175) lt!353401) (= (select (arr!20584 a!3170) (index!35069 lt!353401)) k0!2044) (ite ((_ is MissingZero!8175) lt!353401) (= (select (arr!20584 a!3170) (index!35068 lt!353401)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8175) lt!353401) (= (select (arr!20584 a!3170) (index!35071 lt!353401)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103149 (= lt!353401 e!440174)))

(declare-fun c!88064 () Bool)

(assert (=> d!103149 (= c!88064 (and ((_ is Intermediate!8175) lt!353402) (undefined!8987 lt!353402)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42999 (_ BitVec 32)) SeekEntryResult!8175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103149 (= lt!353402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103149 (validMask!0 mask!3266)))

(assert (=> d!103149 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!353401)))

(declare-fun b!792202 () Bool)

(declare-fun c!88066 () Bool)

(assert (=> b!792202 (= c!88066 (= lt!353400 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!792202 (= e!440172 e!440173)))

(assert (= (and d!103149 c!88064) b!792203))

(assert (= (and d!103149 (not c!88064)) b!792201))

(assert (= (and b!792201 c!88065) b!792200))

(assert (= (and b!792201 (not c!88065)) b!792202))

(assert (= (and b!792202 c!88066) b!792204))

(assert (= (and b!792202 (not c!88066)) b!792199))

(declare-fun m!732853 () Bool)

(assert (=> b!792199 m!732853))

(declare-fun m!732855 () Bool)

(assert (=> b!792201 m!732855))

(declare-fun m!732857 () Bool)

(assert (=> d!103149 m!732857))

(declare-fun m!732859 () Bool)

(assert (=> d!103149 m!732859))

(declare-fun m!732861 () Bool)

(assert (=> d!103149 m!732861))

(assert (=> d!103149 m!732859))

(assert (=> d!103149 m!732785))

(declare-fun m!732863 () Bool)

(assert (=> d!103149 m!732863))

(declare-fun m!732865 () Bool)

(assert (=> d!103149 m!732865))

(assert (=> b!792105 d!103149))

(declare-fun d!103163 () Bool)

(assert (=> d!103163 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68096 d!103163))

(declare-fun d!103167 () Bool)

(assert (=> d!103167 (= (array_inv!16380 a!3170) (bvsge (size!21005 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68096 d!103167))

(check-sat (not b!792199) (not bm!35322) (not d!103149) (not b!792138) (not b!792162) (not b!792161))
(check-sat)
