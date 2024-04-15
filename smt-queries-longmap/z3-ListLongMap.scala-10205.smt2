; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120212 () Bool)

(assert start!120212)

(declare-fun b!1399260 () Bool)

(declare-fun res!938062 () Bool)

(declare-fun e!792179 () Bool)

(assert (=> b!1399260 (=> (not res!938062) (not e!792179))))

(declare-datatypes ((array!95637 0))(
  ( (array!95638 (arr!46171 (Array (_ BitVec 32) (_ BitVec 64))) (size!46723 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95637)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95637 (_ BitVec 32)) Bool)

(assert (=> b!1399260 (= res!938062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399262 () Bool)

(declare-fun res!938067 () Bool)

(assert (=> b!1399262 (=> (not res!938067) (not e!792179))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399262 (= res!938067 (validKeyInArray!0 (select (arr!46171 a!2901) i!1037)))))

(declare-fun b!1399263 () Bool)

(declare-fun e!792176 () Bool)

(assert (=> b!1399263 (= e!792179 (not e!792176))))

(declare-fun res!938061 () Bool)

(assert (=> b!1399263 (=> res!938061 e!792176)))

(declare-datatypes ((SeekEntryResult!10514 0))(
  ( (MissingZero!10514 (index!44430 (_ BitVec 32))) (Found!10514 (index!44431 (_ BitVec 32))) (Intermediate!10514 (undefined!11326 Bool) (index!44432 (_ BitVec 32)) (x!126070 (_ BitVec 32))) (Undefined!10514) (MissingVacant!10514 (index!44433 (_ BitVec 32))) )
))
(declare-fun lt!615302 () SeekEntryResult!10514)

(get-info :version)

(assert (=> b!1399263 (= res!938061 (or (not ((_ is Intermediate!10514) lt!615302)) (undefined!11326 lt!615302)))))

(declare-fun e!792177 () Bool)

(assert (=> b!1399263 e!792177))

(declare-fun res!938063 () Bool)

(assert (=> b!1399263 (=> (not res!938063) (not e!792177))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399263 (= res!938063 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46875 0))(
  ( (Unit!46876) )
))
(declare-fun lt!615305 () Unit!46875)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46875)

(assert (=> b!1399263 (= lt!615305 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615303 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95637 (_ BitVec 32)) SeekEntryResult!10514)

(assert (=> b!1399263 (= lt!615302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615303 (select (arr!46171 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399263 (= lt!615303 (toIndex!0 (select (arr!46171 a!2901) j!112) mask!2840))))

(declare-fun b!1399264 () Bool)

(declare-fun res!938068 () Bool)

(assert (=> b!1399264 (=> (not res!938068) (not e!792179))))

(assert (=> b!1399264 (= res!938068 (and (= (size!46723 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46723 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46723 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399265 () Bool)

(declare-fun res!938059 () Bool)

(assert (=> b!1399265 (=> (not res!938059) (not e!792179))))

(assert (=> b!1399265 (= res!938059 (validKeyInArray!0 (select (arr!46171 a!2901) j!112)))))

(declare-fun b!1399266 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95637 (_ BitVec 32)) SeekEntryResult!10514)

(assert (=> b!1399266 (= e!792177 (= (seekEntryOrOpen!0 (select (arr!46171 a!2901) j!112) a!2901 mask!2840) (Found!10514 j!112)))))

(declare-fun lt!615304 () (_ BitVec 64))

(declare-fun lt!615300 () array!95637)

(declare-fun e!792174 () Bool)

(declare-fun lt!615299 () SeekEntryResult!10514)

(declare-fun b!1399267 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95637 (_ BitVec 32)) SeekEntryResult!10514)

(assert (=> b!1399267 (= e!792174 (= (seekEntryOrOpen!0 lt!615304 lt!615300 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126070 lt!615299) (index!44432 lt!615299) (index!44432 lt!615299) (select (arr!46171 a!2901) j!112) lt!615300 mask!2840)))))

(declare-fun res!938066 () Bool)

(assert (=> start!120212 (=> (not res!938066) (not e!792179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120212 (= res!938066 (validMask!0 mask!2840))))

(assert (=> start!120212 e!792179))

(assert (=> start!120212 true))

(declare-fun array_inv!35404 (array!95637) Bool)

(assert (=> start!120212 (array_inv!35404 a!2901)))

(declare-fun b!1399261 () Bool)

(declare-fun e!792178 () Bool)

(assert (=> b!1399261 (= e!792176 e!792178)))

(declare-fun res!938065 () Bool)

(assert (=> b!1399261 (=> res!938065 e!792178)))

(assert (=> b!1399261 (= res!938065 (or (= lt!615302 lt!615299) (not ((_ is Intermediate!10514) lt!615299))))))

(assert (=> b!1399261 (= lt!615299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615304 mask!2840) lt!615304 lt!615300 mask!2840))))

(assert (=> b!1399261 (= lt!615304 (select (store (arr!46171 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399261 (= lt!615300 (array!95638 (store (arr!46171 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46723 a!2901)))))

(declare-fun b!1399268 () Bool)

(assert (=> b!1399268 (= e!792178 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> b!1399268 e!792174))

(declare-fun res!938064 () Bool)

(assert (=> b!1399268 (=> (not res!938064) (not e!792174))))

(assert (=> b!1399268 (= res!938064 (and (not (undefined!11326 lt!615299)) (= (index!44432 lt!615299) i!1037) (bvslt (x!126070 lt!615299) (x!126070 lt!615302)) (= (select (store (arr!46171 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44432 lt!615299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615301 () Unit!46875)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46875)

(assert (=> b!1399268 (= lt!615301 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615303 (x!126070 lt!615302) (index!44432 lt!615302) (x!126070 lt!615299) (index!44432 lt!615299) (undefined!11326 lt!615299) mask!2840))))

(declare-fun b!1399269 () Bool)

(declare-fun res!938060 () Bool)

(assert (=> b!1399269 (=> (not res!938060) (not e!792179))))

(declare-datatypes ((List!32768 0))(
  ( (Nil!32765) (Cons!32764 (h!34009 (_ BitVec 64)) (t!47454 List!32768)) )
))
(declare-fun arrayNoDuplicates!0 (array!95637 (_ BitVec 32) List!32768) Bool)

(assert (=> b!1399269 (= res!938060 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32765))))

(assert (= (and start!120212 res!938066) b!1399264))

(assert (= (and b!1399264 res!938068) b!1399262))

(assert (= (and b!1399262 res!938067) b!1399265))

(assert (= (and b!1399265 res!938059) b!1399260))

(assert (= (and b!1399260 res!938062) b!1399269))

(assert (= (and b!1399269 res!938060) b!1399263))

(assert (= (and b!1399263 res!938063) b!1399266))

(assert (= (and b!1399263 (not res!938061)) b!1399261))

(assert (= (and b!1399261 (not res!938065)) b!1399268))

(assert (= (and b!1399268 res!938064) b!1399267))

(declare-fun m!1286101 () Bool)

(assert (=> start!120212 m!1286101))

(declare-fun m!1286103 () Bool)

(assert (=> start!120212 m!1286103))

(declare-fun m!1286105 () Bool)

(assert (=> b!1399267 m!1286105))

(declare-fun m!1286107 () Bool)

(assert (=> b!1399267 m!1286107))

(assert (=> b!1399267 m!1286107))

(declare-fun m!1286109 () Bool)

(assert (=> b!1399267 m!1286109))

(declare-fun m!1286111 () Bool)

(assert (=> b!1399269 m!1286111))

(assert (=> b!1399263 m!1286107))

(declare-fun m!1286113 () Bool)

(assert (=> b!1399263 m!1286113))

(assert (=> b!1399263 m!1286107))

(declare-fun m!1286115 () Bool)

(assert (=> b!1399263 m!1286115))

(assert (=> b!1399263 m!1286107))

(declare-fun m!1286117 () Bool)

(assert (=> b!1399263 m!1286117))

(declare-fun m!1286119 () Bool)

(assert (=> b!1399263 m!1286119))

(declare-fun m!1286121 () Bool)

(assert (=> b!1399268 m!1286121))

(declare-fun m!1286123 () Bool)

(assert (=> b!1399268 m!1286123))

(declare-fun m!1286125 () Bool)

(assert (=> b!1399268 m!1286125))

(declare-fun m!1286127 () Bool)

(assert (=> b!1399262 m!1286127))

(assert (=> b!1399262 m!1286127))

(declare-fun m!1286129 () Bool)

(assert (=> b!1399262 m!1286129))

(assert (=> b!1399266 m!1286107))

(assert (=> b!1399266 m!1286107))

(declare-fun m!1286131 () Bool)

(assert (=> b!1399266 m!1286131))

(declare-fun m!1286133 () Bool)

(assert (=> b!1399260 m!1286133))

(declare-fun m!1286135 () Bool)

(assert (=> b!1399261 m!1286135))

(assert (=> b!1399261 m!1286135))

(declare-fun m!1286137 () Bool)

(assert (=> b!1399261 m!1286137))

(assert (=> b!1399261 m!1286121))

(declare-fun m!1286139 () Bool)

(assert (=> b!1399261 m!1286139))

(assert (=> b!1399265 m!1286107))

(assert (=> b!1399265 m!1286107))

(declare-fun m!1286141 () Bool)

(assert (=> b!1399265 m!1286141))

(check-sat (not b!1399260) (not start!120212) (not b!1399263) (not b!1399268) (not b!1399269) (not b!1399267) (not b!1399266) (not b!1399262) (not b!1399261) (not b!1399265))
(check-sat)
(get-model)

(declare-fun d!150911 () Bool)

(assert (=> d!150911 (= (validKeyInArray!0 (select (arr!46171 a!2901) i!1037)) (and (not (= (select (arr!46171 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46171 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1399262 d!150911))

(declare-fun d!150913 () Bool)

(declare-fun lt!615359 () SeekEntryResult!10514)

(assert (=> d!150913 (and (or ((_ is Undefined!10514) lt!615359) (not ((_ is Found!10514) lt!615359)) (and (bvsge (index!44431 lt!615359) #b00000000000000000000000000000000) (bvslt (index!44431 lt!615359) (size!46723 lt!615300)))) (or ((_ is Undefined!10514) lt!615359) ((_ is Found!10514) lt!615359) (not ((_ is MissingZero!10514) lt!615359)) (and (bvsge (index!44430 lt!615359) #b00000000000000000000000000000000) (bvslt (index!44430 lt!615359) (size!46723 lt!615300)))) (or ((_ is Undefined!10514) lt!615359) ((_ is Found!10514) lt!615359) ((_ is MissingZero!10514) lt!615359) (not ((_ is MissingVacant!10514) lt!615359)) (and (bvsge (index!44433 lt!615359) #b00000000000000000000000000000000) (bvslt (index!44433 lt!615359) (size!46723 lt!615300)))) (or ((_ is Undefined!10514) lt!615359) (ite ((_ is Found!10514) lt!615359) (= (select (arr!46171 lt!615300) (index!44431 lt!615359)) lt!615304) (ite ((_ is MissingZero!10514) lt!615359) (= (select (arr!46171 lt!615300) (index!44430 lt!615359)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10514) lt!615359) (= (select (arr!46171 lt!615300) (index!44433 lt!615359)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!792223 () SeekEntryResult!10514)

(assert (=> d!150913 (= lt!615359 e!792223)))

(declare-fun c!130067 () Bool)

(declare-fun lt!615358 () SeekEntryResult!10514)

(assert (=> d!150913 (= c!130067 (and ((_ is Intermediate!10514) lt!615358) (undefined!11326 lt!615358)))))

(assert (=> d!150913 (= lt!615358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615304 mask!2840) lt!615304 lt!615300 mask!2840))))

(assert (=> d!150913 (validMask!0 mask!2840)))

(assert (=> d!150913 (= (seekEntryOrOpen!0 lt!615304 lt!615300 mask!2840) lt!615359)))

(declare-fun b!1399342 () Bool)

(declare-fun e!792222 () SeekEntryResult!10514)

(assert (=> b!1399342 (= e!792222 (Found!10514 (index!44432 lt!615358)))))

(declare-fun b!1399343 () Bool)

(assert (=> b!1399343 (= e!792223 e!792222)))

(declare-fun lt!615357 () (_ BitVec 64))

(assert (=> b!1399343 (= lt!615357 (select (arr!46171 lt!615300) (index!44432 lt!615358)))))

(declare-fun c!130069 () Bool)

(assert (=> b!1399343 (= c!130069 (= lt!615357 lt!615304))))

(declare-fun b!1399344 () Bool)

(assert (=> b!1399344 (= e!792223 Undefined!10514)))

(declare-fun b!1399345 () Bool)

(declare-fun e!792224 () SeekEntryResult!10514)

(assert (=> b!1399345 (= e!792224 (MissingZero!10514 (index!44432 lt!615358)))))

(declare-fun b!1399346 () Bool)

(assert (=> b!1399346 (= e!792224 (seekKeyOrZeroReturnVacant!0 (x!126070 lt!615358) (index!44432 lt!615358) (index!44432 lt!615358) lt!615304 lt!615300 mask!2840))))

(declare-fun b!1399347 () Bool)

(declare-fun c!130068 () Bool)

(assert (=> b!1399347 (= c!130068 (= lt!615357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399347 (= e!792222 e!792224)))

(assert (= (and d!150913 c!130067) b!1399344))

(assert (= (and d!150913 (not c!130067)) b!1399343))

(assert (= (and b!1399343 c!130069) b!1399342))

(assert (= (and b!1399343 (not c!130069)) b!1399347))

(assert (= (and b!1399347 c!130068) b!1399345))

(assert (= (and b!1399347 (not c!130068)) b!1399346))

(declare-fun m!1286229 () Bool)

(assert (=> d!150913 m!1286229))

(assert (=> d!150913 m!1286135))

(declare-fun m!1286231 () Bool)

(assert (=> d!150913 m!1286231))

(declare-fun m!1286233 () Bool)

(assert (=> d!150913 m!1286233))

(assert (=> d!150913 m!1286101))

(assert (=> d!150913 m!1286135))

(assert (=> d!150913 m!1286137))

(declare-fun m!1286235 () Bool)

(assert (=> b!1399343 m!1286235))

(declare-fun m!1286237 () Bool)

(assert (=> b!1399346 m!1286237))

(assert (=> b!1399267 d!150913))

(declare-fun b!1399378 () Bool)

(declare-fun e!792242 () SeekEntryResult!10514)

(assert (=> b!1399378 (= e!792242 (Found!10514 (index!44432 lt!615299)))))

(declare-fun b!1399379 () Bool)

(declare-fun e!792241 () SeekEntryResult!10514)

(assert (=> b!1399379 (= e!792241 e!792242)))

(declare-fun c!130086 () Bool)

(declare-fun lt!615373 () (_ BitVec 64))

(assert (=> b!1399379 (= c!130086 (= lt!615373 (select (arr!46171 a!2901) j!112)))))

(declare-fun d!150921 () Bool)

(declare-fun lt!615374 () SeekEntryResult!10514)

(assert (=> d!150921 (and (or ((_ is Undefined!10514) lt!615374) (not ((_ is Found!10514) lt!615374)) (and (bvsge (index!44431 lt!615374) #b00000000000000000000000000000000) (bvslt (index!44431 lt!615374) (size!46723 lt!615300)))) (or ((_ is Undefined!10514) lt!615374) ((_ is Found!10514) lt!615374) (not ((_ is MissingVacant!10514) lt!615374)) (not (= (index!44433 lt!615374) (index!44432 lt!615299))) (and (bvsge (index!44433 lt!615374) #b00000000000000000000000000000000) (bvslt (index!44433 lt!615374) (size!46723 lt!615300)))) (or ((_ is Undefined!10514) lt!615374) (ite ((_ is Found!10514) lt!615374) (= (select (arr!46171 lt!615300) (index!44431 lt!615374)) (select (arr!46171 a!2901) j!112)) (and ((_ is MissingVacant!10514) lt!615374) (= (index!44433 lt!615374) (index!44432 lt!615299)) (= (select (arr!46171 lt!615300) (index!44433 lt!615374)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!150921 (= lt!615374 e!792241)))

(declare-fun c!130087 () Bool)

(assert (=> d!150921 (= c!130087 (bvsge (x!126070 lt!615299) #b01111111111111111111111111111110))))

(assert (=> d!150921 (= lt!615373 (select (arr!46171 lt!615300) (index!44432 lt!615299)))))

(assert (=> d!150921 (validMask!0 mask!2840)))

(assert (=> d!150921 (= (seekKeyOrZeroReturnVacant!0 (x!126070 lt!615299) (index!44432 lt!615299) (index!44432 lt!615299) (select (arr!46171 a!2901) j!112) lt!615300 mask!2840) lt!615374)))

(declare-fun b!1399380 () Bool)

(declare-fun e!792240 () SeekEntryResult!10514)

(assert (=> b!1399380 (= e!792240 (MissingVacant!10514 (index!44432 lt!615299)))))

(declare-fun b!1399381 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399381 (= e!792240 (seekKeyOrZeroReturnVacant!0 (bvadd (x!126070 lt!615299) #b00000000000000000000000000000001) (nextIndex!0 (index!44432 lt!615299) (x!126070 lt!615299) mask!2840) (index!44432 lt!615299) (select (arr!46171 a!2901) j!112) lt!615300 mask!2840))))

(declare-fun b!1399382 () Bool)

(declare-fun c!130085 () Bool)

(assert (=> b!1399382 (= c!130085 (= lt!615373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399382 (= e!792242 e!792240)))

(declare-fun b!1399383 () Bool)

(assert (=> b!1399383 (= e!792241 Undefined!10514)))

(assert (= (and d!150921 c!130087) b!1399383))

(assert (= (and d!150921 (not c!130087)) b!1399379))

(assert (= (and b!1399379 c!130086) b!1399378))

(assert (= (and b!1399379 (not c!130086)) b!1399382))

(assert (= (and b!1399382 c!130085) b!1399380))

(assert (= (and b!1399382 (not c!130085)) b!1399381))

(declare-fun m!1286251 () Bool)

(assert (=> d!150921 m!1286251))

(declare-fun m!1286253 () Bool)

(assert (=> d!150921 m!1286253))

(declare-fun m!1286255 () Bool)

(assert (=> d!150921 m!1286255))

(assert (=> d!150921 m!1286101))

(declare-fun m!1286257 () Bool)

(assert (=> b!1399381 m!1286257))

(assert (=> b!1399381 m!1286257))

(assert (=> b!1399381 m!1286107))

(declare-fun m!1286259 () Bool)

(assert (=> b!1399381 m!1286259))

(assert (=> b!1399267 d!150921))

(declare-fun d!150933 () Bool)

(assert (=> d!150933 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120212 d!150933))

(declare-fun d!150935 () Bool)

(assert (=> d!150935 (= (array_inv!35404 a!2901) (bvsge (size!46723 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120212 d!150935))

(declare-fun d!150937 () Bool)

(declare-fun lt!615377 () SeekEntryResult!10514)

(assert (=> d!150937 (and (or ((_ is Undefined!10514) lt!615377) (not ((_ is Found!10514) lt!615377)) (and (bvsge (index!44431 lt!615377) #b00000000000000000000000000000000) (bvslt (index!44431 lt!615377) (size!46723 a!2901)))) (or ((_ is Undefined!10514) lt!615377) ((_ is Found!10514) lt!615377) (not ((_ is MissingZero!10514) lt!615377)) (and (bvsge (index!44430 lt!615377) #b00000000000000000000000000000000) (bvslt (index!44430 lt!615377) (size!46723 a!2901)))) (or ((_ is Undefined!10514) lt!615377) ((_ is Found!10514) lt!615377) ((_ is MissingZero!10514) lt!615377) (not ((_ is MissingVacant!10514) lt!615377)) (and (bvsge (index!44433 lt!615377) #b00000000000000000000000000000000) (bvslt (index!44433 lt!615377) (size!46723 a!2901)))) (or ((_ is Undefined!10514) lt!615377) (ite ((_ is Found!10514) lt!615377) (= (select (arr!46171 a!2901) (index!44431 lt!615377)) (select (arr!46171 a!2901) j!112)) (ite ((_ is MissingZero!10514) lt!615377) (= (select (arr!46171 a!2901) (index!44430 lt!615377)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10514) lt!615377) (= (select (arr!46171 a!2901) (index!44433 lt!615377)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!792244 () SeekEntryResult!10514)

(assert (=> d!150937 (= lt!615377 e!792244)))

(declare-fun c!130088 () Bool)

(declare-fun lt!615376 () SeekEntryResult!10514)

(assert (=> d!150937 (= c!130088 (and ((_ is Intermediate!10514) lt!615376) (undefined!11326 lt!615376)))))

(assert (=> d!150937 (= lt!615376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46171 a!2901) j!112) mask!2840) (select (arr!46171 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150937 (validMask!0 mask!2840)))

(assert (=> d!150937 (= (seekEntryOrOpen!0 (select (arr!46171 a!2901) j!112) a!2901 mask!2840) lt!615377)))

(declare-fun b!1399384 () Bool)

(declare-fun e!792243 () SeekEntryResult!10514)

(assert (=> b!1399384 (= e!792243 (Found!10514 (index!44432 lt!615376)))))

(declare-fun b!1399385 () Bool)

(assert (=> b!1399385 (= e!792244 e!792243)))

(declare-fun lt!615375 () (_ BitVec 64))

(assert (=> b!1399385 (= lt!615375 (select (arr!46171 a!2901) (index!44432 lt!615376)))))

(declare-fun c!130090 () Bool)

(assert (=> b!1399385 (= c!130090 (= lt!615375 (select (arr!46171 a!2901) j!112)))))

(declare-fun b!1399386 () Bool)

(assert (=> b!1399386 (= e!792244 Undefined!10514)))

(declare-fun b!1399387 () Bool)

(declare-fun e!792245 () SeekEntryResult!10514)

(assert (=> b!1399387 (= e!792245 (MissingZero!10514 (index!44432 lt!615376)))))

(declare-fun b!1399388 () Bool)

(assert (=> b!1399388 (= e!792245 (seekKeyOrZeroReturnVacant!0 (x!126070 lt!615376) (index!44432 lt!615376) (index!44432 lt!615376) (select (arr!46171 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1399389 () Bool)

(declare-fun c!130089 () Bool)

(assert (=> b!1399389 (= c!130089 (= lt!615375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399389 (= e!792243 e!792245)))

(assert (= (and d!150937 c!130088) b!1399386))

(assert (= (and d!150937 (not c!130088)) b!1399385))

(assert (= (and b!1399385 c!130090) b!1399384))

(assert (= (and b!1399385 (not c!130090)) b!1399389))

(assert (= (and b!1399389 c!130089) b!1399387))

(assert (= (and b!1399389 (not c!130089)) b!1399388))

(declare-fun m!1286261 () Bool)

(assert (=> d!150937 m!1286261))

(assert (=> d!150937 m!1286107))

(assert (=> d!150937 m!1286113))

(declare-fun m!1286263 () Bool)

(assert (=> d!150937 m!1286263))

(declare-fun m!1286265 () Bool)

(assert (=> d!150937 m!1286265))

(assert (=> d!150937 m!1286101))

(assert (=> d!150937 m!1286113))

(assert (=> d!150937 m!1286107))

(declare-fun m!1286267 () Bool)

(assert (=> d!150937 m!1286267))

(declare-fun m!1286269 () Bool)

(assert (=> b!1399385 m!1286269))

(assert (=> b!1399388 m!1286107))

(declare-fun m!1286271 () Bool)

(assert (=> b!1399388 m!1286271))

(assert (=> b!1399266 d!150937))

(declare-fun b!1399453 () Bool)

(declare-fun e!792282 () Bool)

(declare-fun e!792280 () Bool)

(assert (=> b!1399453 (= e!792282 e!792280)))

(declare-fun res!938146 () Bool)

(declare-fun lt!615404 () SeekEntryResult!10514)

(assert (=> b!1399453 (= res!938146 (and ((_ is Intermediate!10514) lt!615404) (not (undefined!11326 lt!615404)) (bvslt (x!126070 lt!615404) #b01111111111111111111111111111110) (bvsge (x!126070 lt!615404) #b00000000000000000000000000000000) (bvsge (x!126070 lt!615404) #b00000000000000000000000000000000)))))

(assert (=> b!1399453 (=> (not res!938146) (not e!792280))))

(declare-fun b!1399454 () Bool)

(assert (=> b!1399454 (= e!792282 (bvsge (x!126070 lt!615404) #b01111111111111111111111111111110))))

(declare-fun b!1399455 () Bool)

(assert (=> b!1399455 (and (bvsge (index!44432 lt!615404) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615404) (size!46723 lt!615300)))))

(declare-fun res!938147 () Bool)

(assert (=> b!1399455 (= res!938147 (= (select (arr!46171 lt!615300) (index!44432 lt!615404)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!792283 () Bool)

(assert (=> b!1399455 (=> res!938147 e!792283)))

(declare-fun b!1399456 () Bool)

(assert (=> b!1399456 (and (bvsge (index!44432 lt!615404) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615404) (size!46723 lt!615300)))))

(declare-fun res!938145 () Bool)

(assert (=> b!1399456 (= res!938145 (= (select (arr!46171 lt!615300) (index!44432 lt!615404)) lt!615304))))

(assert (=> b!1399456 (=> res!938145 e!792283)))

(assert (=> b!1399456 (= e!792280 e!792283)))

(declare-fun e!792281 () SeekEntryResult!10514)

(declare-fun b!1399457 () Bool)

(assert (=> b!1399457 (= e!792281 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!615304 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!615304 lt!615300 mask!2840))))

(declare-fun d!150939 () Bool)

(assert (=> d!150939 e!792282))

(declare-fun c!130115 () Bool)

(assert (=> d!150939 (= c!130115 (and ((_ is Intermediate!10514) lt!615404) (undefined!11326 lt!615404)))))

(declare-fun e!792284 () SeekEntryResult!10514)

(assert (=> d!150939 (= lt!615404 e!792284)))

(declare-fun c!130116 () Bool)

(assert (=> d!150939 (= c!130116 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!615403 () (_ BitVec 64))

(assert (=> d!150939 (= lt!615403 (select (arr!46171 lt!615300) (toIndex!0 lt!615304 mask!2840)))))

(assert (=> d!150939 (validMask!0 mask!2840)))

(assert (=> d!150939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615304 mask!2840) lt!615304 lt!615300 mask!2840) lt!615404)))

(declare-fun b!1399458 () Bool)

(assert (=> b!1399458 (= e!792284 e!792281)))

(declare-fun c!130117 () Bool)

(assert (=> b!1399458 (= c!130117 (or (= lt!615403 lt!615304) (= (bvadd lt!615403 lt!615403) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1399459 () Bool)

(assert (=> b!1399459 (= e!792284 (Intermediate!10514 true (toIndex!0 lt!615304 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1399460 () Bool)

(assert (=> b!1399460 (= e!792281 (Intermediate!10514 false (toIndex!0 lt!615304 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1399461 () Bool)

(assert (=> b!1399461 (and (bvsge (index!44432 lt!615404) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615404) (size!46723 lt!615300)))))

(assert (=> b!1399461 (= e!792283 (= (select (arr!46171 lt!615300) (index!44432 lt!615404)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150939 c!130116) b!1399459))

(assert (= (and d!150939 (not c!130116)) b!1399458))

(assert (= (and b!1399458 c!130117) b!1399460))

(assert (= (and b!1399458 (not c!130117)) b!1399457))

(assert (= (and d!150939 c!130115) b!1399454))

(assert (= (and d!150939 (not c!130115)) b!1399453))

(assert (= (and b!1399453 res!938146) b!1399456))

(assert (= (and b!1399456 (not res!938145)) b!1399455))

(assert (= (and b!1399455 (not res!938147)) b!1399461))

(declare-fun m!1286291 () Bool)

(assert (=> b!1399456 m!1286291))

(assert (=> b!1399461 m!1286291))

(assert (=> b!1399455 m!1286291))

(assert (=> d!150939 m!1286135))

(declare-fun m!1286293 () Bool)

(assert (=> d!150939 m!1286293))

(assert (=> d!150939 m!1286101))

(assert (=> b!1399457 m!1286135))

(declare-fun m!1286295 () Bool)

(assert (=> b!1399457 m!1286295))

(assert (=> b!1399457 m!1286295))

(declare-fun m!1286297 () Bool)

(assert (=> b!1399457 m!1286297))

(assert (=> b!1399261 d!150939))

(declare-fun d!150947 () Bool)

(declare-fun lt!615414 () (_ BitVec 32))

(declare-fun lt!615413 () (_ BitVec 32))

(assert (=> d!150947 (= lt!615414 (bvmul (bvxor lt!615413 (bvlshr lt!615413 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150947 (= lt!615413 ((_ extract 31 0) (bvand (bvxor lt!615304 (bvlshr lt!615304 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150947 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!938148 (let ((h!34013 ((_ extract 31 0) (bvand (bvxor lt!615304 (bvlshr lt!615304 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126078 (bvmul (bvxor h!34013 (bvlshr h!34013 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126078 (bvlshr x!126078 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!938148 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!938148 #b00000000000000000000000000000000))))))

(assert (=> d!150947 (= (toIndex!0 lt!615304 mask!2840) (bvand (bvxor lt!615414 (bvlshr lt!615414 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1399261 d!150947))

(declare-fun b!1399511 () Bool)

(declare-fun e!792318 () Bool)

(declare-fun e!792319 () Bool)

(assert (=> b!1399511 (= e!792318 e!792319)))

(declare-fun lt!615429 () (_ BitVec 64))

(assert (=> b!1399511 (= lt!615429 (select (arr!46171 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!615430 () Unit!46875)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95637 (_ BitVec 64) (_ BitVec 32)) Unit!46875)

(assert (=> b!1399511 (= lt!615430 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615429 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1399511 (arrayContainsKey!0 a!2901 lt!615429 #b00000000000000000000000000000000)))

(declare-fun lt!615431 () Unit!46875)

(assert (=> b!1399511 (= lt!615431 lt!615430)))

(declare-fun res!938166 () Bool)

(assert (=> b!1399511 (= res!938166 (= (seekEntryOrOpen!0 (select (arr!46171 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10514 #b00000000000000000000000000000000)))))

(assert (=> b!1399511 (=> (not res!938166) (not e!792319))))

(declare-fun d!150953 () Bool)

(declare-fun res!938167 () Bool)

(declare-fun e!792320 () Bool)

(assert (=> d!150953 (=> res!938167 e!792320)))

(assert (=> d!150953 (= res!938167 (bvsge #b00000000000000000000000000000000 (size!46723 a!2901)))))

(assert (=> d!150953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!792320)))

(declare-fun b!1399512 () Bool)

(declare-fun call!66874 () Bool)

(assert (=> b!1399512 (= e!792319 call!66874)))

(declare-fun bm!66871 () Bool)

(assert (=> bm!66871 (= call!66874 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1399513 () Bool)

(assert (=> b!1399513 (= e!792318 call!66874)))

(declare-fun b!1399514 () Bool)

(assert (=> b!1399514 (= e!792320 e!792318)))

(declare-fun c!130134 () Bool)

(assert (=> b!1399514 (= c!130134 (validKeyInArray!0 (select (arr!46171 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150953 (not res!938167)) b!1399514))

(assert (= (and b!1399514 c!130134) b!1399511))

(assert (= (and b!1399514 (not c!130134)) b!1399513))

(assert (= (and b!1399511 res!938166) b!1399512))

(assert (= (or b!1399512 b!1399513) bm!66871))

(declare-fun m!1286317 () Bool)

(assert (=> b!1399511 m!1286317))

(declare-fun m!1286319 () Bool)

(assert (=> b!1399511 m!1286319))

(declare-fun m!1286321 () Bool)

(assert (=> b!1399511 m!1286321))

(assert (=> b!1399511 m!1286317))

(declare-fun m!1286323 () Bool)

(assert (=> b!1399511 m!1286323))

(declare-fun m!1286325 () Bool)

(assert (=> bm!66871 m!1286325))

(assert (=> b!1399514 m!1286317))

(assert (=> b!1399514 m!1286317))

(declare-fun m!1286327 () Bool)

(assert (=> b!1399514 m!1286327))

(assert (=> b!1399260 d!150953))

(declare-fun d!150961 () Bool)

(assert (=> d!150961 (= (validKeyInArray!0 (select (arr!46171 a!2901) j!112)) (and (not (= (select (arr!46171 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46171 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1399265 d!150961))

(declare-fun b!1399547 () Bool)

(declare-fun e!792346 () Bool)

(declare-fun call!66881 () Bool)

(assert (=> b!1399547 (= e!792346 call!66881)))

(declare-fun bm!66878 () Bool)

(declare-fun c!130144 () Bool)

(assert (=> bm!66878 (= call!66881 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130144 (Cons!32764 (select (arr!46171 a!2901) #b00000000000000000000000000000000) Nil!32765) Nil!32765)))))

(declare-fun b!1399548 () Bool)

(declare-fun e!792347 () Bool)

(declare-fun contains!9749 (List!32768 (_ BitVec 64)) Bool)

(assert (=> b!1399548 (= e!792347 (contains!9749 Nil!32765 (select (arr!46171 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150963 () Bool)

(declare-fun res!938184 () Bool)

(declare-fun e!792344 () Bool)

(assert (=> d!150963 (=> res!938184 e!792344)))

(assert (=> d!150963 (= res!938184 (bvsge #b00000000000000000000000000000000 (size!46723 a!2901)))))

(assert (=> d!150963 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32765) e!792344)))

(declare-fun b!1399549 () Bool)

(declare-fun e!792345 () Bool)

(assert (=> b!1399549 (= e!792345 e!792346)))

(assert (=> b!1399549 (= c!130144 (validKeyInArray!0 (select (arr!46171 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1399550 () Bool)

(assert (=> b!1399550 (= e!792344 e!792345)))

(declare-fun res!938183 () Bool)

(assert (=> b!1399550 (=> (not res!938183) (not e!792345))))

(assert (=> b!1399550 (= res!938183 (not e!792347))))

(declare-fun res!938182 () Bool)

(assert (=> b!1399550 (=> (not res!938182) (not e!792347))))

(assert (=> b!1399550 (= res!938182 (validKeyInArray!0 (select (arr!46171 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1399551 () Bool)

(assert (=> b!1399551 (= e!792346 call!66881)))

(assert (= (and d!150963 (not res!938184)) b!1399550))

(assert (= (and b!1399550 res!938182) b!1399548))

(assert (= (and b!1399550 res!938183) b!1399549))

(assert (= (and b!1399549 c!130144) b!1399551))

(assert (= (and b!1399549 (not c!130144)) b!1399547))

(assert (= (or b!1399551 b!1399547) bm!66878))

(assert (=> bm!66878 m!1286317))

(declare-fun m!1286361 () Bool)

(assert (=> bm!66878 m!1286361))

(assert (=> b!1399548 m!1286317))

(assert (=> b!1399548 m!1286317))

(declare-fun m!1286363 () Bool)

(assert (=> b!1399548 m!1286363))

(assert (=> b!1399549 m!1286317))

(assert (=> b!1399549 m!1286317))

(assert (=> b!1399549 m!1286327))

(assert (=> b!1399550 m!1286317))

(assert (=> b!1399550 m!1286317))

(assert (=> b!1399550 m!1286327))

(assert (=> b!1399269 d!150963))

(declare-fun d!150971 () Bool)

(assert (=> d!150971 (and (not (undefined!11326 lt!615299)) (= (index!44432 lt!615299) i!1037) (bvslt (x!126070 lt!615299) (x!126070 lt!615302)))))

(declare-fun lt!615452 () Unit!46875)

(declare-fun choose!62 (array!95637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46875)

(assert (=> d!150971 (= lt!615452 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615303 (x!126070 lt!615302) (index!44432 lt!615302) (x!126070 lt!615299) (index!44432 lt!615299) (undefined!11326 lt!615299) mask!2840))))

(assert (=> d!150971 (validMask!0 mask!2840)))

(assert (=> d!150971 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615303 (x!126070 lt!615302) (index!44432 lt!615302) (x!126070 lt!615299) (index!44432 lt!615299) (undefined!11326 lt!615299) mask!2840) lt!615452)))

(declare-fun bs!40715 () Bool)

(assert (= bs!40715 d!150971))

(declare-fun m!1286375 () Bool)

(assert (=> bs!40715 m!1286375))

(assert (=> bs!40715 m!1286101))

(assert (=> b!1399268 d!150971))

(declare-fun b!1399571 () Bool)

(declare-fun e!792363 () Bool)

(declare-fun e!792364 () Bool)

(assert (=> b!1399571 (= e!792363 e!792364)))

(declare-fun lt!615453 () (_ BitVec 64))

(assert (=> b!1399571 (= lt!615453 (select (arr!46171 a!2901) j!112))))

(declare-fun lt!615454 () Unit!46875)

(assert (=> b!1399571 (= lt!615454 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615453 j!112))))

(assert (=> b!1399571 (arrayContainsKey!0 a!2901 lt!615453 #b00000000000000000000000000000000)))

(declare-fun lt!615455 () Unit!46875)

(assert (=> b!1399571 (= lt!615455 lt!615454)))

(declare-fun res!938196 () Bool)

(assert (=> b!1399571 (= res!938196 (= (seekEntryOrOpen!0 (select (arr!46171 a!2901) j!112) a!2901 mask!2840) (Found!10514 j!112)))))

(assert (=> b!1399571 (=> (not res!938196) (not e!792364))))

(declare-fun d!150979 () Bool)

(declare-fun res!938197 () Bool)

(declare-fun e!792365 () Bool)

(assert (=> d!150979 (=> res!938197 e!792365)))

(assert (=> d!150979 (= res!938197 (bvsge j!112 (size!46723 a!2901)))))

(assert (=> d!150979 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!792365)))

(declare-fun b!1399572 () Bool)

(declare-fun call!66886 () Bool)

(assert (=> b!1399572 (= e!792364 call!66886)))

(declare-fun bm!66883 () Bool)

(assert (=> bm!66883 (= call!66886 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1399573 () Bool)

(assert (=> b!1399573 (= e!792363 call!66886)))

(declare-fun b!1399574 () Bool)

(assert (=> b!1399574 (= e!792365 e!792363)))

(declare-fun c!130149 () Bool)

(assert (=> b!1399574 (= c!130149 (validKeyInArray!0 (select (arr!46171 a!2901) j!112)))))

(assert (= (and d!150979 (not res!938197)) b!1399574))

(assert (= (and b!1399574 c!130149) b!1399571))

(assert (= (and b!1399574 (not c!130149)) b!1399573))

(assert (= (and b!1399571 res!938196) b!1399572))

(assert (= (or b!1399572 b!1399573) bm!66883))

(assert (=> b!1399571 m!1286107))

(declare-fun m!1286377 () Bool)

(assert (=> b!1399571 m!1286377))

(declare-fun m!1286379 () Bool)

(assert (=> b!1399571 m!1286379))

(assert (=> b!1399571 m!1286107))

(assert (=> b!1399571 m!1286131))

(declare-fun m!1286381 () Bool)

(assert (=> bm!66883 m!1286381))

(assert (=> b!1399574 m!1286107))

(assert (=> b!1399574 m!1286107))

(assert (=> b!1399574 m!1286141))

(assert (=> b!1399263 d!150979))

(declare-fun d!150981 () Bool)

(assert (=> d!150981 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!615468 () Unit!46875)

(declare-fun choose!38 (array!95637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46875)

(assert (=> d!150981 (= lt!615468 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150981 (validMask!0 mask!2840)))

(assert (=> d!150981 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!615468)))

(declare-fun bs!40717 () Bool)

(assert (= bs!40717 d!150981))

(assert (=> bs!40717 m!1286119))

(declare-fun m!1286403 () Bool)

(assert (=> bs!40717 m!1286403))

(assert (=> bs!40717 m!1286101))

(assert (=> b!1399263 d!150981))

(declare-fun b!1399590 () Bool)

(declare-fun e!792376 () Bool)

(declare-fun e!792374 () Bool)

(assert (=> b!1399590 (= e!792376 e!792374)))

(declare-fun res!938202 () Bool)

(declare-fun lt!615470 () SeekEntryResult!10514)

(assert (=> b!1399590 (= res!938202 (and ((_ is Intermediate!10514) lt!615470) (not (undefined!11326 lt!615470)) (bvslt (x!126070 lt!615470) #b01111111111111111111111111111110) (bvsge (x!126070 lt!615470) #b00000000000000000000000000000000) (bvsge (x!126070 lt!615470) #b00000000000000000000000000000000)))))

(assert (=> b!1399590 (=> (not res!938202) (not e!792374))))

(declare-fun b!1399591 () Bool)

(assert (=> b!1399591 (= e!792376 (bvsge (x!126070 lt!615470) #b01111111111111111111111111111110))))

(declare-fun b!1399592 () Bool)

(assert (=> b!1399592 (and (bvsge (index!44432 lt!615470) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615470) (size!46723 a!2901)))))

(declare-fun res!938203 () Bool)

(assert (=> b!1399592 (= res!938203 (= (select (arr!46171 a!2901) (index!44432 lt!615470)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!792377 () Bool)

(assert (=> b!1399592 (=> res!938203 e!792377)))

(declare-fun b!1399593 () Bool)

(assert (=> b!1399593 (and (bvsge (index!44432 lt!615470) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615470) (size!46723 a!2901)))))

(declare-fun res!938201 () Bool)

(assert (=> b!1399593 (= res!938201 (= (select (arr!46171 a!2901) (index!44432 lt!615470)) (select (arr!46171 a!2901) j!112)))))

(assert (=> b!1399593 (=> res!938201 e!792377)))

(assert (=> b!1399593 (= e!792374 e!792377)))

(declare-fun e!792375 () SeekEntryResult!10514)

(declare-fun b!1399594 () Bool)

(assert (=> b!1399594 (= e!792375 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!615303 #b00000000000000000000000000000000 mask!2840) (select (arr!46171 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150991 () Bool)

(assert (=> d!150991 e!792376))

(declare-fun c!130156 () Bool)

(assert (=> d!150991 (= c!130156 (and ((_ is Intermediate!10514) lt!615470) (undefined!11326 lt!615470)))))

(declare-fun e!792378 () SeekEntryResult!10514)

(assert (=> d!150991 (= lt!615470 e!792378)))

(declare-fun c!130157 () Bool)

(assert (=> d!150991 (= c!130157 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!615469 () (_ BitVec 64))

(assert (=> d!150991 (= lt!615469 (select (arr!46171 a!2901) lt!615303))))

(assert (=> d!150991 (validMask!0 mask!2840)))

(assert (=> d!150991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615303 (select (arr!46171 a!2901) j!112) a!2901 mask!2840) lt!615470)))

(declare-fun b!1399595 () Bool)

(assert (=> b!1399595 (= e!792378 e!792375)))

(declare-fun c!130158 () Bool)

(assert (=> b!1399595 (= c!130158 (or (= lt!615469 (select (arr!46171 a!2901) j!112)) (= (bvadd lt!615469 lt!615469) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1399596 () Bool)

(assert (=> b!1399596 (= e!792378 (Intermediate!10514 true lt!615303 #b00000000000000000000000000000000))))

(declare-fun b!1399597 () Bool)

(assert (=> b!1399597 (= e!792375 (Intermediate!10514 false lt!615303 #b00000000000000000000000000000000))))

(declare-fun b!1399598 () Bool)

(assert (=> b!1399598 (and (bvsge (index!44432 lt!615470) #b00000000000000000000000000000000) (bvslt (index!44432 lt!615470) (size!46723 a!2901)))))

(assert (=> b!1399598 (= e!792377 (= (select (arr!46171 a!2901) (index!44432 lt!615470)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150991 c!130157) b!1399596))

(assert (= (and d!150991 (not c!130157)) b!1399595))

(assert (= (and b!1399595 c!130158) b!1399597))

(assert (= (and b!1399595 (not c!130158)) b!1399594))

(assert (= (and d!150991 c!130156) b!1399591))

(assert (= (and d!150991 (not c!130156)) b!1399590))

(assert (= (and b!1399590 res!938202) b!1399593))

(assert (= (and b!1399593 (not res!938201)) b!1399592))

(assert (= (and b!1399592 (not res!938203)) b!1399598))

(declare-fun m!1286405 () Bool)

(assert (=> b!1399593 m!1286405))

(assert (=> b!1399598 m!1286405))

(assert (=> b!1399592 m!1286405))

(declare-fun m!1286407 () Bool)

(assert (=> d!150991 m!1286407))

(assert (=> d!150991 m!1286101))

(declare-fun m!1286409 () Bool)

(assert (=> b!1399594 m!1286409))

(assert (=> b!1399594 m!1286409))

(assert (=> b!1399594 m!1286107))

(declare-fun m!1286411 () Bool)

(assert (=> b!1399594 m!1286411))

(assert (=> b!1399263 d!150991))

(declare-fun d!150993 () Bool)

(declare-fun lt!615472 () (_ BitVec 32))

(declare-fun lt!615471 () (_ BitVec 32))

(assert (=> d!150993 (= lt!615472 (bvmul (bvxor lt!615471 (bvlshr lt!615471 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150993 (= lt!615471 ((_ extract 31 0) (bvand (bvxor (select (arr!46171 a!2901) j!112) (bvlshr (select (arr!46171 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150993 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!938148 (let ((h!34013 ((_ extract 31 0) (bvand (bvxor (select (arr!46171 a!2901) j!112) (bvlshr (select (arr!46171 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126078 (bvmul (bvxor h!34013 (bvlshr h!34013 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126078 (bvlshr x!126078 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!938148 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!938148 #b00000000000000000000000000000000))))))

(assert (=> d!150993 (= (toIndex!0 (select (arr!46171 a!2901) j!112) mask!2840) (bvand (bvxor lt!615472 (bvlshr lt!615472 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1399263 d!150993))

(check-sat (not b!1399550) (not d!150939) (not b!1399549) (not d!150971) (not d!150921) (not b!1399381) (not d!150991) (not b!1399457) (not d!150981) (not b!1399511) (not b!1399594) (not bm!66878) (not b!1399571) (not b!1399388) (not b!1399574) (not b!1399548) (not b!1399346) (not b!1399514) (not d!150913) (not d!150937) (not bm!66871) (not bm!66883))
(check-sat)
