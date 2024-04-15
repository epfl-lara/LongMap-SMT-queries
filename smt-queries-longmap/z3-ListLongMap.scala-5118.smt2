; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69402 () Bool)

(assert start!69402)

(declare-fun b!809295 () Bool)

(declare-fun res!553168 () Bool)

(declare-fun e!447944 () Bool)

(assert (=> b!809295 (=> (not res!553168) (not e!447944))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809295 (= res!553168 (validKeyInArray!0 k0!2044))))

(declare-fun b!809296 () Bool)

(declare-fun e!447941 () Bool)

(declare-fun e!447945 () Bool)

(assert (=> b!809296 (= e!447941 e!447945)))

(declare-fun res!553170 () Bool)

(assert (=> b!809296 (=> (not res!553170) (not e!447945))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!44017 0))(
  ( (array!44018 (arr!21083 (Array (_ BitVec 32) (_ BitVec 64))) (size!21504 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44017)

(declare-fun lt!362570 () (_ BitVec 32))

(assert (=> b!809296 (= res!553170 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!362570 #b00000000000000000000000000000000) (bvslt lt!362570 (size!21504 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809296 (= lt!362570 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809297 () Bool)

(declare-fun res!553172 () Bool)

(assert (=> b!809297 (=> (not res!553172) (not e!447944))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809297 (= res!553172 (and (= (size!21504 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21504 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21504 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809298 () Bool)

(declare-fun res!553164 () Bool)

(declare-fun e!447943 () Bool)

(assert (=> b!809298 (=> (not res!553164) (not e!447943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44017 (_ BitVec 32)) Bool)

(assert (=> b!809298 (= res!553164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809299 () Bool)

(declare-fun e!447942 () Bool)

(assert (=> b!809299 (= e!447943 e!447942)))

(declare-fun res!553169 () Bool)

(assert (=> b!809299 (=> (not res!553169) (not e!447942))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362569 () array!44017)

(declare-datatypes ((SeekEntryResult!8671 0))(
  ( (MissingZero!8671 (index!37052 (_ BitVec 32))) (Found!8671 (index!37053 (_ BitVec 32))) (Intermediate!8671 (undefined!9483 Bool) (index!37054 (_ BitVec 32)) (x!67866 (_ BitVec 32))) (Undefined!8671) (MissingVacant!8671 (index!37055 (_ BitVec 32))) )
))
(declare-fun lt!362568 () SeekEntryResult!8671)

(declare-fun lt!362567 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44017 (_ BitVec 32)) SeekEntryResult!8671)

(assert (=> b!809299 (= res!553169 (= lt!362568 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362567 lt!362569 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44017 (_ BitVec 32)) SeekEntryResult!8671)

(assert (=> b!809299 (= lt!362568 (seekEntryOrOpen!0 lt!362567 lt!362569 mask!3266))))

(assert (=> b!809299 (= lt!362567 (select (store (arr!21083 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809299 (= lt!362569 (array!44018 (store (arr!21083 a!3170) i!1163 k0!2044) (size!21504 a!3170)))))

(declare-fun b!809300 () Bool)

(declare-fun res!553167 () Bool)

(assert (=> b!809300 (=> (not res!553167) (not e!447943))))

(declare-datatypes ((List!15085 0))(
  ( (Nil!15082) (Cons!15081 (h!16210 (_ BitVec 64)) (t!21391 List!15085)) )
))
(declare-fun arrayNoDuplicates!0 (array!44017 (_ BitVec 32) List!15085) Bool)

(assert (=> b!809300 (= res!553167 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15082))))

(declare-fun b!809301 () Bool)

(declare-fun res!553173 () Bool)

(assert (=> b!809301 (=> (not res!553173) (not e!447943))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809301 (= res!553173 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21504 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21083 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21504 a!3170)) (= (select (arr!21083 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809302 () Bool)

(assert (=> b!809302 (= e!447945 (not (= lt!362568 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362570 vacantAfter!23 lt!362567 lt!362569 mask!3266))))))

(declare-fun b!809303 () Bool)

(assert (=> b!809303 (= e!447942 e!447941)))

(declare-fun res!553165 () Bool)

(assert (=> b!809303 (=> (not res!553165) (not e!447941))))

(declare-fun lt!362565 () SeekEntryResult!8671)

(declare-fun lt!362566 () SeekEntryResult!8671)

(assert (=> b!809303 (= res!553165 (and (= lt!362565 lt!362566) (= lt!362566 (Found!8671 j!153)) (not (= (select (arr!21083 a!3170) index!1236) (select (arr!21083 a!3170) j!153)))))))

(assert (=> b!809303 (= lt!362566 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21083 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809303 (= lt!362565 (seekEntryOrOpen!0 (select (arr!21083 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!553171 () Bool)

(assert (=> start!69402 (=> (not res!553171) (not e!447944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69402 (= res!553171 (validMask!0 mask!3266))))

(assert (=> start!69402 e!447944))

(assert (=> start!69402 true))

(declare-fun array_inv!16966 (array!44017) Bool)

(assert (=> start!69402 (array_inv!16966 a!3170)))

(declare-fun b!809304 () Bool)

(declare-fun res!553162 () Bool)

(assert (=> b!809304 (=> (not res!553162) (not e!447944))))

(assert (=> b!809304 (= res!553162 (validKeyInArray!0 (select (arr!21083 a!3170) j!153)))))

(declare-fun b!809305 () Bool)

(declare-fun res!553163 () Bool)

(assert (=> b!809305 (=> (not res!553163) (not e!447944))))

(declare-fun arrayContainsKey!0 (array!44017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809305 (= res!553163 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809306 () Bool)

(assert (=> b!809306 (= e!447944 e!447943)))

(declare-fun res!553166 () Bool)

(assert (=> b!809306 (=> (not res!553166) (not e!447943))))

(declare-fun lt!362564 () SeekEntryResult!8671)

(assert (=> b!809306 (= res!553166 (or (= lt!362564 (MissingZero!8671 i!1163)) (= lt!362564 (MissingVacant!8671 i!1163))))))

(assert (=> b!809306 (= lt!362564 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69402 res!553171) b!809297))

(assert (= (and b!809297 res!553172) b!809304))

(assert (= (and b!809304 res!553162) b!809295))

(assert (= (and b!809295 res!553168) b!809305))

(assert (= (and b!809305 res!553163) b!809306))

(assert (= (and b!809306 res!553166) b!809298))

(assert (= (and b!809298 res!553164) b!809300))

(assert (= (and b!809300 res!553167) b!809301))

(assert (= (and b!809301 res!553173) b!809299))

(assert (= (and b!809299 res!553169) b!809303))

(assert (= (and b!809303 res!553165) b!809296))

(assert (= (and b!809296 res!553170) b!809302))

(declare-fun m!751009 () Bool)

(assert (=> start!69402 m!751009))

(declare-fun m!751011 () Bool)

(assert (=> start!69402 m!751011))

(declare-fun m!751013 () Bool)

(assert (=> b!809304 m!751013))

(assert (=> b!809304 m!751013))

(declare-fun m!751015 () Bool)

(assert (=> b!809304 m!751015))

(declare-fun m!751017 () Bool)

(assert (=> b!809300 m!751017))

(declare-fun m!751019 () Bool)

(assert (=> b!809298 m!751019))

(declare-fun m!751021 () Bool)

(assert (=> b!809305 m!751021))

(declare-fun m!751023 () Bool)

(assert (=> b!809295 m!751023))

(declare-fun m!751025 () Bool)

(assert (=> b!809296 m!751025))

(declare-fun m!751027 () Bool)

(assert (=> b!809301 m!751027))

(declare-fun m!751029 () Bool)

(assert (=> b!809301 m!751029))

(declare-fun m!751031 () Bool)

(assert (=> b!809302 m!751031))

(declare-fun m!751033 () Bool)

(assert (=> b!809299 m!751033))

(declare-fun m!751035 () Bool)

(assert (=> b!809299 m!751035))

(declare-fun m!751037 () Bool)

(assert (=> b!809299 m!751037))

(declare-fun m!751039 () Bool)

(assert (=> b!809299 m!751039))

(declare-fun m!751041 () Bool)

(assert (=> b!809306 m!751041))

(declare-fun m!751043 () Bool)

(assert (=> b!809303 m!751043))

(assert (=> b!809303 m!751013))

(assert (=> b!809303 m!751013))

(declare-fun m!751045 () Bool)

(assert (=> b!809303 m!751045))

(assert (=> b!809303 m!751013))

(declare-fun m!751047 () Bool)

(assert (=> b!809303 m!751047))

(check-sat (not b!809296) (not b!809302) (not b!809303) (not b!809306) (not b!809305) (not b!809295) (not b!809304) (not b!809299) (not b!809298) (not start!69402) (not b!809300))
(check-sat)
(get-model)

(declare-fun b!809391 () Bool)

(declare-fun e!447990 () SeekEntryResult!8671)

(assert (=> b!809391 (= e!447990 Undefined!8671)))

(declare-fun b!809392 () Bool)

(declare-fun e!447991 () SeekEntryResult!8671)

(assert (=> b!809392 (= e!447990 e!447991)))

(declare-fun c!88483 () Bool)

(declare-fun lt!362618 () (_ BitVec 64))

(assert (=> b!809392 (= c!88483 (= lt!362618 (select (arr!21083 a!3170) j!153)))))

(declare-fun b!809394 () Bool)

(assert (=> b!809394 (= e!447991 (Found!8671 index!1236))))

(declare-fun b!809395 () Bool)

(declare-fun c!88484 () Bool)

(assert (=> b!809395 (= c!88484 (= lt!362618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447989 () SeekEntryResult!8671)

(assert (=> b!809395 (= e!447991 e!447989)))

(declare-fun b!809396 () Bool)

(assert (=> b!809396 (= e!447989 (MissingVacant!8671 vacantBefore!23))))

(declare-fun b!809393 () Bool)

(assert (=> b!809393 (= e!447989 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21083 a!3170) j!153) a!3170 mask!3266))))

(declare-fun d!103719 () Bool)

(declare-fun lt!362617 () SeekEntryResult!8671)

(get-info :version)

(assert (=> d!103719 (and (or ((_ is Undefined!8671) lt!362617) (not ((_ is Found!8671) lt!362617)) (and (bvsge (index!37053 lt!362617) #b00000000000000000000000000000000) (bvslt (index!37053 lt!362617) (size!21504 a!3170)))) (or ((_ is Undefined!8671) lt!362617) ((_ is Found!8671) lt!362617) (not ((_ is MissingVacant!8671) lt!362617)) (not (= (index!37055 lt!362617) vacantBefore!23)) (and (bvsge (index!37055 lt!362617) #b00000000000000000000000000000000) (bvslt (index!37055 lt!362617) (size!21504 a!3170)))) (or ((_ is Undefined!8671) lt!362617) (ite ((_ is Found!8671) lt!362617) (= (select (arr!21083 a!3170) (index!37053 lt!362617)) (select (arr!21083 a!3170) j!153)) (and ((_ is MissingVacant!8671) lt!362617) (= (index!37055 lt!362617) vacantBefore!23) (= (select (arr!21083 a!3170) (index!37055 lt!362617)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103719 (= lt!362617 e!447990)))

(declare-fun c!88485 () Bool)

(assert (=> d!103719 (= c!88485 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103719 (= lt!362618 (select (arr!21083 a!3170) index!1236))))

(assert (=> d!103719 (validMask!0 mask!3266)))

(assert (=> d!103719 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21083 a!3170) j!153) a!3170 mask!3266) lt!362617)))

(assert (= (and d!103719 c!88485) b!809391))

(assert (= (and d!103719 (not c!88485)) b!809392))

(assert (= (and b!809392 c!88483) b!809394))

(assert (= (and b!809392 (not c!88483)) b!809395))

(assert (= (and b!809395 c!88484) b!809396))

(assert (= (and b!809395 (not c!88484)) b!809393))

(assert (=> b!809393 m!751025))

(assert (=> b!809393 m!751025))

(assert (=> b!809393 m!751013))

(declare-fun m!751129 () Bool)

(assert (=> b!809393 m!751129))

(declare-fun m!751131 () Bool)

(assert (=> d!103719 m!751131))

(declare-fun m!751133 () Bool)

(assert (=> d!103719 m!751133))

(assert (=> d!103719 m!751043))

(assert (=> d!103719 m!751009))

(assert (=> b!809303 d!103719))

(declare-fun b!809409 () Bool)

(declare-fun e!447999 () SeekEntryResult!8671)

(declare-fun lt!362625 () SeekEntryResult!8671)

(assert (=> b!809409 (= e!447999 (MissingZero!8671 (index!37054 lt!362625)))))

(declare-fun b!809410 () Bool)

(declare-fun e!448000 () SeekEntryResult!8671)

(declare-fun e!447998 () SeekEntryResult!8671)

(assert (=> b!809410 (= e!448000 e!447998)))

(declare-fun lt!362627 () (_ BitVec 64))

(assert (=> b!809410 (= lt!362627 (select (arr!21083 a!3170) (index!37054 lt!362625)))))

(declare-fun c!88494 () Bool)

(assert (=> b!809410 (= c!88494 (= lt!362627 (select (arr!21083 a!3170) j!153)))))

(declare-fun b!809411 () Bool)

(declare-fun c!88492 () Bool)

(assert (=> b!809411 (= c!88492 (= lt!362627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809411 (= e!447998 e!447999)))

(declare-fun b!809412 () Bool)

(assert (=> b!809412 (= e!447999 (seekKeyOrZeroReturnVacant!0 (x!67866 lt!362625) (index!37054 lt!362625) (index!37054 lt!362625) (select (arr!21083 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809413 () Bool)

(assert (=> b!809413 (= e!448000 Undefined!8671)))

(declare-fun d!103721 () Bool)

(declare-fun lt!362626 () SeekEntryResult!8671)

(assert (=> d!103721 (and (or ((_ is Undefined!8671) lt!362626) (not ((_ is Found!8671) lt!362626)) (and (bvsge (index!37053 lt!362626) #b00000000000000000000000000000000) (bvslt (index!37053 lt!362626) (size!21504 a!3170)))) (or ((_ is Undefined!8671) lt!362626) ((_ is Found!8671) lt!362626) (not ((_ is MissingZero!8671) lt!362626)) (and (bvsge (index!37052 lt!362626) #b00000000000000000000000000000000) (bvslt (index!37052 lt!362626) (size!21504 a!3170)))) (or ((_ is Undefined!8671) lt!362626) ((_ is Found!8671) lt!362626) ((_ is MissingZero!8671) lt!362626) (not ((_ is MissingVacant!8671) lt!362626)) (and (bvsge (index!37055 lt!362626) #b00000000000000000000000000000000) (bvslt (index!37055 lt!362626) (size!21504 a!3170)))) (or ((_ is Undefined!8671) lt!362626) (ite ((_ is Found!8671) lt!362626) (= (select (arr!21083 a!3170) (index!37053 lt!362626)) (select (arr!21083 a!3170) j!153)) (ite ((_ is MissingZero!8671) lt!362626) (= (select (arr!21083 a!3170) (index!37052 lt!362626)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8671) lt!362626) (= (select (arr!21083 a!3170) (index!37055 lt!362626)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103721 (= lt!362626 e!448000)))

(declare-fun c!88493 () Bool)

(assert (=> d!103721 (= c!88493 (and ((_ is Intermediate!8671) lt!362625) (undefined!9483 lt!362625)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44017 (_ BitVec 32)) SeekEntryResult!8671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103721 (= lt!362625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21083 a!3170) j!153) mask!3266) (select (arr!21083 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103721 (validMask!0 mask!3266)))

(assert (=> d!103721 (= (seekEntryOrOpen!0 (select (arr!21083 a!3170) j!153) a!3170 mask!3266) lt!362626)))

(declare-fun b!809414 () Bool)

(assert (=> b!809414 (= e!447998 (Found!8671 (index!37054 lt!362625)))))

(assert (= (and d!103721 c!88493) b!809413))

(assert (= (and d!103721 (not c!88493)) b!809410))

(assert (= (and b!809410 c!88494) b!809414))

(assert (= (and b!809410 (not c!88494)) b!809411))

(assert (= (and b!809411 c!88492) b!809409))

(assert (= (and b!809411 (not c!88492)) b!809412))

(declare-fun m!751135 () Bool)

(assert (=> b!809410 m!751135))

(assert (=> b!809412 m!751013))

(declare-fun m!751137 () Bool)

(assert (=> b!809412 m!751137))

(declare-fun m!751139 () Bool)

(assert (=> d!103721 m!751139))

(declare-fun m!751141 () Bool)

(assert (=> d!103721 m!751141))

(assert (=> d!103721 m!751013))

(declare-fun m!751143 () Bool)

(assert (=> d!103721 m!751143))

(assert (=> d!103721 m!751009))

(assert (=> d!103721 m!751013))

(assert (=> d!103721 m!751141))

(declare-fun m!751145 () Bool)

(assert (=> d!103721 m!751145))

(declare-fun m!751147 () Bool)

(assert (=> d!103721 m!751147))

(assert (=> b!809303 d!103721))

(declare-fun b!809441 () Bool)

(declare-fun e!448017 () Bool)

(declare-fun call!35395 () Bool)

(assert (=> b!809441 (= e!448017 call!35395)))

(declare-fun b!809442 () Bool)

(declare-fun e!448016 () Bool)

(declare-fun e!448018 () Bool)

(assert (=> b!809442 (= e!448016 e!448018)))

(declare-fun c!88506 () Bool)

(assert (=> b!809442 (= c!88506 (validKeyInArray!0 (select (arr!21083 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809443 () Bool)

(assert (=> b!809443 (= e!448018 e!448017)))

(declare-fun lt!362641 () (_ BitVec 64))

(assert (=> b!809443 (= lt!362641 (select (arr!21083 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27584 0))(
  ( (Unit!27585) )
))
(declare-fun lt!362640 () Unit!27584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44017 (_ BitVec 64) (_ BitVec 32)) Unit!27584)

(assert (=> b!809443 (= lt!362640 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362641 #b00000000000000000000000000000000))))

(assert (=> b!809443 (arrayContainsKey!0 a!3170 lt!362641 #b00000000000000000000000000000000)))

(declare-fun lt!362642 () Unit!27584)

(assert (=> b!809443 (= lt!362642 lt!362640)))

(declare-fun res!553250 () Bool)

(assert (=> b!809443 (= res!553250 (= (seekEntryOrOpen!0 (select (arr!21083 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8671 #b00000000000000000000000000000000)))))

(assert (=> b!809443 (=> (not res!553250) (not e!448017))))

(declare-fun b!809444 () Bool)

(assert (=> b!809444 (= e!448018 call!35395)))

(declare-fun d!103727 () Bool)

(declare-fun res!553251 () Bool)

(assert (=> d!103727 (=> res!553251 e!448016)))

(assert (=> d!103727 (= res!553251 (bvsge #b00000000000000000000000000000000 (size!21504 a!3170)))))

(assert (=> d!103727 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448016)))

(declare-fun bm!35392 () Bool)

(assert (=> bm!35392 (= call!35395 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(assert (= (and d!103727 (not res!553251)) b!809442))

(assert (= (and b!809442 c!88506) b!809443))

(assert (= (and b!809442 (not c!88506)) b!809444))

(assert (= (and b!809443 res!553250) b!809441))

(assert (= (or b!809441 b!809444) bm!35392))

(declare-fun m!751157 () Bool)

(assert (=> b!809442 m!751157))

(assert (=> b!809442 m!751157))

(declare-fun m!751159 () Bool)

(assert (=> b!809442 m!751159))

(assert (=> b!809443 m!751157))

(declare-fun m!751161 () Bool)

(assert (=> b!809443 m!751161))

(declare-fun m!751163 () Bool)

(assert (=> b!809443 m!751163))

(assert (=> b!809443 m!751157))

(declare-fun m!751165 () Bool)

(assert (=> b!809443 m!751165))

(declare-fun m!751167 () Bool)

(assert (=> bm!35392 m!751167))

(assert (=> b!809298 d!103727))

(declare-fun b!809445 () Bool)

(declare-fun e!448020 () SeekEntryResult!8671)

(assert (=> b!809445 (= e!448020 Undefined!8671)))

(declare-fun b!809446 () Bool)

(declare-fun e!448021 () SeekEntryResult!8671)

(assert (=> b!809446 (= e!448020 e!448021)))

(declare-fun c!88507 () Bool)

(declare-fun lt!362644 () (_ BitVec 64))

(assert (=> b!809446 (= c!88507 (= lt!362644 lt!362567))))

(declare-fun b!809448 () Bool)

(assert (=> b!809448 (= e!448021 (Found!8671 index!1236))))

(declare-fun b!809449 () Bool)

(declare-fun c!88508 () Bool)

(assert (=> b!809449 (= c!88508 (= lt!362644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448019 () SeekEntryResult!8671)

(assert (=> b!809449 (= e!448021 e!448019)))

(declare-fun b!809450 () Bool)

(assert (=> b!809450 (= e!448019 (MissingVacant!8671 vacantAfter!23))))

(declare-fun b!809447 () Bool)

(assert (=> b!809447 (= e!448019 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362567 lt!362569 mask!3266))))

(declare-fun d!103731 () Bool)

(declare-fun lt!362643 () SeekEntryResult!8671)

(assert (=> d!103731 (and (or ((_ is Undefined!8671) lt!362643) (not ((_ is Found!8671) lt!362643)) (and (bvsge (index!37053 lt!362643) #b00000000000000000000000000000000) (bvslt (index!37053 lt!362643) (size!21504 lt!362569)))) (or ((_ is Undefined!8671) lt!362643) ((_ is Found!8671) lt!362643) (not ((_ is MissingVacant!8671) lt!362643)) (not (= (index!37055 lt!362643) vacantAfter!23)) (and (bvsge (index!37055 lt!362643) #b00000000000000000000000000000000) (bvslt (index!37055 lt!362643) (size!21504 lt!362569)))) (or ((_ is Undefined!8671) lt!362643) (ite ((_ is Found!8671) lt!362643) (= (select (arr!21083 lt!362569) (index!37053 lt!362643)) lt!362567) (and ((_ is MissingVacant!8671) lt!362643) (= (index!37055 lt!362643) vacantAfter!23) (= (select (arr!21083 lt!362569) (index!37055 lt!362643)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103731 (= lt!362643 e!448020)))

(declare-fun c!88509 () Bool)

(assert (=> d!103731 (= c!88509 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103731 (= lt!362644 (select (arr!21083 lt!362569) index!1236))))

(assert (=> d!103731 (validMask!0 mask!3266)))

(assert (=> d!103731 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362567 lt!362569 mask!3266) lt!362643)))

(assert (= (and d!103731 c!88509) b!809445))

(assert (= (and d!103731 (not c!88509)) b!809446))

(assert (= (and b!809446 c!88507) b!809448))

(assert (= (and b!809446 (not c!88507)) b!809449))

(assert (= (and b!809449 c!88508) b!809450))

(assert (= (and b!809449 (not c!88508)) b!809447))

(assert (=> b!809447 m!751025))

(assert (=> b!809447 m!751025))

(declare-fun m!751169 () Bool)

(assert (=> b!809447 m!751169))

(declare-fun m!751171 () Bool)

(assert (=> d!103731 m!751171))

(declare-fun m!751173 () Bool)

(assert (=> d!103731 m!751173))

(declare-fun m!751175 () Bool)

(assert (=> d!103731 m!751175))

(assert (=> d!103731 m!751009))

(assert (=> b!809299 d!103731))

(declare-fun b!809451 () Bool)

(declare-fun e!448023 () SeekEntryResult!8671)

(declare-fun lt!362645 () SeekEntryResult!8671)

(assert (=> b!809451 (= e!448023 (MissingZero!8671 (index!37054 lt!362645)))))

(declare-fun b!809452 () Bool)

(declare-fun e!448024 () SeekEntryResult!8671)

(declare-fun e!448022 () SeekEntryResult!8671)

(assert (=> b!809452 (= e!448024 e!448022)))

(declare-fun lt!362647 () (_ BitVec 64))

(assert (=> b!809452 (= lt!362647 (select (arr!21083 lt!362569) (index!37054 lt!362645)))))

(declare-fun c!88512 () Bool)

(assert (=> b!809452 (= c!88512 (= lt!362647 lt!362567))))

(declare-fun b!809453 () Bool)

(declare-fun c!88510 () Bool)

(assert (=> b!809453 (= c!88510 (= lt!362647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809453 (= e!448022 e!448023)))

(declare-fun b!809454 () Bool)

(assert (=> b!809454 (= e!448023 (seekKeyOrZeroReturnVacant!0 (x!67866 lt!362645) (index!37054 lt!362645) (index!37054 lt!362645) lt!362567 lt!362569 mask!3266))))

(declare-fun b!809455 () Bool)

(assert (=> b!809455 (= e!448024 Undefined!8671)))

(declare-fun d!103733 () Bool)

(declare-fun lt!362646 () SeekEntryResult!8671)

(assert (=> d!103733 (and (or ((_ is Undefined!8671) lt!362646) (not ((_ is Found!8671) lt!362646)) (and (bvsge (index!37053 lt!362646) #b00000000000000000000000000000000) (bvslt (index!37053 lt!362646) (size!21504 lt!362569)))) (or ((_ is Undefined!8671) lt!362646) ((_ is Found!8671) lt!362646) (not ((_ is MissingZero!8671) lt!362646)) (and (bvsge (index!37052 lt!362646) #b00000000000000000000000000000000) (bvslt (index!37052 lt!362646) (size!21504 lt!362569)))) (or ((_ is Undefined!8671) lt!362646) ((_ is Found!8671) lt!362646) ((_ is MissingZero!8671) lt!362646) (not ((_ is MissingVacant!8671) lt!362646)) (and (bvsge (index!37055 lt!362646) #b00000000000000000000000000000000) (bvslt (index!37055 lt!362646) (size!21504 lt!362569)))) (or ((_ is Undefined!8671) lt!362646) (ite ((_ is Found!8671) lt!362646) (= (select (arr!21083 lt!362569) (index!37053 lt!362646)) lt!362567) (ite ((_ is MissingZero!8671) lt!362646) (= (select (arr!21083 lt!362569) (index!37052 lt!362646)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8671) lt!362646) (= (select (arr!21083 lt!362569) (index!37055 lt!362646)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103733 (= lt!362646 e!448024)))

(declare-fun c!88511 () Bool)

(assert (=> d!103733 (= c!88511 (and ((_ is Intermediate!8671) lt!362645) (undefined!9483 lt!362645)))))

(assert (=> d!103733 (= lt!362645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362567 mask!3266) lt!362567 lt!362569 mask!3266))))

(assert (=> d!103733 (validMask!0 mask!3266)))

(assert (=> d!103733 (= (seekEntryOrOpen!0 lt!362567 lt!362569 mask!3266) lt!362646)))

(declare-fun b!809456 () Bool)

(assert (=> b!809456 (= e!448022 (Found!8671 (index!37054 lt!362645)))))

(assert (= (and d!103733 c!88511) b!809455))

(assert (= (and d!103733 (not c!88511)) b!809452))

(assert (= (and b!809452 c!88512) b!809456))

(assert (= (and b!809452 (not c!88512)) b!809453))

(assert (= (and b!809453 c!88510) b!809451))

(assert (= (and b!809453 (not c!88510)) b!809454))

(declare-fun m!751177 () Bool)

(assert (=> b!809452 m!751177))

(declare-fun m!751179 () Bool)

(assert (=> b!809454 m!751179))

(declare-fun m!751181 () Bool)

(assert (=> d!103733 m!751181))

(declare-fun m!751183 () Bool)

(assert (=> d!103733 m!751183))

(declare-fun m!751185 () Bool)

(assert (=> d!103733 m!751185))

(assert (=> d!103733 m!751009))

(assert (=> d!103733 m!751183))

(declare-fun m!751187 () Bool)

(assert (=> d!103733 m!751187))

(declare-fun m!751189 () Bool)

(assert (=> d!103733 m!751189))

(assert (=> b!809299 d!103733))

(declare-fun d!103735 () Bool)

(assert (=> d!103735 (= (validKeyInArray!0 (select (arr!21083 a!3170) j!153)) (and (not (= (select (arr!21083 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21083 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809304 d!103735))

(declare-fun d!103737 () Bool)

(assert (=> d!103737 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809295 d!103737))

(declare-fun b!809457 () Bool)

(declare-fun e!448026 () SeekEntryResult!8671)

(declare-fun lt!362648 () SeekEntryResult!8671)

(assert (=> b!809457 (= e!448026 (MissingZero!8671 (index!37054 lt!362648)))))

(declare-fun b!809458 () Bool)

(declare-fun e!448027 () SeekEntryResult!8671)

(declare-fun e!448025 () SeekEntryResult!8671)

(assert (=> b!809458 (= e!448027 e!448025)))

(declare-fun lt!362650 () (_ BitVec 64))

(assert (=> b!809458 (= lt!362650 (select (arr!21083 a!3170) (index!37054 lt!362648)))))

(declare-fun c!88515 () Bool)

(assert (=> b!809458 (= c!88515 (= lt!362650 k0!2044))))

(declare-fun b!809459 () Bool)

(declare-fun c!88513 () Bool)

(assert (=> b!809459 (= c!88513 (= lt!362650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809459 (= e!448025 e!448026)))

(declare-fun b!809460 () Bool)

(assert (=> b!809460 (= e!448026 (seekKeyOrZeroReturnVacant!0 (x!67866 lt!362648) (index!37054 lt!362648) (index!37054 lt!362648) k0!2044 a!3170 mask!3266))))

(declare-fun b!809461 () Bool)

(assert (=> b!809461 (= e!448027 Undefined!8671)))

(declare-fun d!103739 () Bool)

(declare-fun lt!362649 () SeekEntryResult!8671)

(assert (=> d!103739 (and (or ((_ is Undefined!8671) lt!362649) (not ((_ is Found!8671) lt!362649)) (and (bvsge (index!37053 lt!362649) #b00000000000000000000000000000000) (bvslt (index!37053 lt!362649) (size!21504 a!3170)))) (or ((_ is Undefined!8671) lt!362649) ((_ is Found!8671) lt!362649) (not ((_ is MissingZero!8671) lt!362649)) (and (bvsge (index!37052 lt!362649) #b00000000000000000000000000000000) (bvslt (index!37052 lt!362649) (size!21504 a!3170)))) (or ((_ is Undefined!8671) lt!362649) ((_ is Found!8671) lt!362649) ((_ is MissingZero!8671) lt!362649) (not ((_ is MissingVacant!8671) lt!362649)) (and (bvsge (index!37055 lt!362649) #b00000000000000000000000000000000) (bvslt (index!37055 lt!362649) (size!21504 a!3170)))) (or ((_ is Undefined!8671) lt!362649) (ite ((_ is Found!8671) lt!362649) (= (select (arr!21083 a!3170) (index!37053 lt!362649)) k0!2044) (ite ((_ is MissingZero!8671) lt!362649) (= (select (arr!21083 a!3170) (index!37052 lt!362649)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8671) lt!362649) (= (select (arr!21083 a!3170) (index!37055 lt!362649)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103739 (= lt!362649 e!448027)))

(declare-fun c!88514 () Bool)

(assert (=> d!103739 (= c!88514 (and ((_ is Intermediate!8671) lt!362648) (undefined!9483 lt!362648)))))

(assert (=> d!103739 (= lt!362648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103739 (validMask!0 mask!3266)))

(assert (=> d!103739 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!362649)))

(declare-fun b!809462 () Bool)

(assert (=> b!809462 (= e!448025 (Found!8671 (index!37054 lt!362648)))))

(assert (= (and d!103739 c!88514) b!809461))

(assert (= (and d!103739 (not c!88514)) b!809458))

(assert (= (and b!809458 c!88515) b!809462))

(assert (= (and b!809458 (not c!88515)) b!809459))

(assert (= (and b!809459 c!88513) b!809457))

(assert (= (and b!809459 (not c!88513)) b!809460))

(declare-fun m!751191 () Bool)

(assert (=> b!809458 m!751191))

(declare-fun m!751193 () Bool)

(assert (=> b!809460 m!751193))

(declare-fun m!751195 () Bool)

(assert (=> d!103739 m!751195))

(declare-fun m!751197 () Bool)

(assert (=> d!103739 m!751197))

(declare-fun m!751199 () Bool)

(assert (=> d!103739 m!751199))

(assert (=> d!103739 m!751009))

(assert (=> d!103739 m!751197))

(declare-fun m!751201 () Bool)

(assert (=> d!103739 m!751201))

(declare-fun m!751203 () Bool)

(assert (=> d!103739 m!751203))

(assert (=> b!809306 d!103739))

(declare-fun d!103741 () Bool)

(declare-fun res!553256 () Bool)

(declare-fun e!448032 () Bool)

(assert (=> d!103741 (=> res!553256 e!448032)))

(assert (=> d!103741 (= res!553256 (= (select (arr!21083 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103741 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448032)))

(declare-fun b!809467 () Bool)

(declare-fun e!448033 () Bool)

(assert (=> b!809467 (= e!448032 e!448033)))

(declare-fun res!553257 () Bool)

(assert (=> b!809467 (=> (not res!553257) (not e!448033))))

(assert (=> b!809467 (= res!553257 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21504 a!3170)))))

(declare-fun b!809468 () Bool)

(assert (=> b!809468 (= e!448033 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103741 (not res!553256)) b!809467))

(assert (= (and b!809467 res!553257) b!809468))

(assert (=> d!103741 m!751157))

(declare-fun m!751205 () Bool)

(assert (=> b!809468 m!751205))

(assert (=> b!809305 d!103741))

(declare-fun b!809491 () Bool)

(declare-fun e!448049 () Bool)

(declare-fun contains!4108 (List!15085 (_ BitVec 64)) Bool)

(assert (=> b!809491 (= e!448049 (contains!4108 Nil!15082 (select (arr!21083 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103743 () Bool)

(declare-fun res!553265 () Bool)

(declare-fun e!448050 () Bool)

(assert (=> d!103743 (=> res!553265 e!448050)))

(assert (=> d!103743 (= res!553265 (bvsge #b00000000000000000000000000000000 (size!21504 a!3170)))))

(assert (=> d!103743 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15082) e!448050)))

(declare-fun bm!35395 () Bool)

(declare-fun call!35398 () Bool)

(declare-fun c!88524 () Bool)

(assert (=> bm!35395 (= call!35398 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88524 (Cons!15081 (select (arr!21083 a!3170) #b00000000000000000000000000000000) Nil!15082) Nil!15082)))))

(declare-fun b!809492 () Bool)

(declare-fun e!448051 () Bool)

(assert (=> b!809492 (= e!448051 call!35398)))

(declare-fun b!809493 () Bool)

(declare-fun e!448048 () Bool)

(assert (=> b!809493 (= e!448048 e!448051)))

(assert (=> b!809493 (= c!88524 (validKeyInArray!0 (select (arr!21083 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809494 () Bool)

(assert (=> b!809494 (= e!448050 e!448048)))

(declare-fun res!553264 () Bool)

(assert (=> b!809494 (=> (not res!553264) (not e!448048))))

(assert (=> b!809494 (= res!553264 (not e!448049))))

(declare-fun res!553266 () Bool)

(assert (=> b!809494 (=> (not res!553266) (not e!448049))))

(assert (=> b!809494 (= res!553266 (validKeyInArray!0 (select (arr!21083 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809495 () Bool)

(assert (=> b!809495 (= e!448051 call!35398)))

(assert (= (and d!103743 (not res!553265)) b!809494))

(assert (= (and b!809494 res!553266) b!809491))

(assert (= (and b!809494 res!553264) b!809493))

(assert (= (and b!809493 c!88524) b!809495))

(assert (= (and b!809493 (not c!88524)) b!809492))

(assert (= (or b!809495 b!809492) bm!35395))

(assert (=> b!809491 m!751157))

(assert (=> b!809491 m!751157))

(declare-fun m!751207 () Bool)

(assert (=> b!809491 m!751207))

(assert (=> bm!35395 m!751157))

(declare-fun m!751209 () Bool)

(assert (=> bm!35395 m!751209))

(assert (=> b!809493 m!751157))

(assert (=> b!809493 m!751157))

(assert (=> b!809493 m!751159))

(assert (=> b!809494 m!751157))

(assert (=> b!809494 m!751157))

(assert (=> b!809494 m!751159))

(assert (=> b!809300 d!103743))

(declare-fun d!103745 () Bool)

(assert (=> d!103745 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69402 d!103745))

(declare-fun d!103751 () Bool)

(assert (=> d!103751 (= (array_inv!16966 a!3170) (bvsge (size!21504 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69402 d!103751))

(declare-fun b!809528 () Bool)

(declare-fun e!448071 () SeekEntryResult!8671)

(assert (=> b!809528 (= e!448071 Undefined!8671)))

(declare-fun b!809529 () Bool)

(declare-fun e!448072 () SeekEntryResult!8671)

(assert (=> b!809529 (= e!448071 e!448072)))

(declare-fun c!88539 () Bool)

(declare-fun lt!362673 () (_ BitVec 64))

(assert (=> b!809529 (= c!88539 (= lt!362673 lt!362567))))

(declare-fun b!809531 () Bool)

(assert (=> b!809531 (= e!448072 (Found!8671 lt!362570))))

(declare-fun b!809532 () Bool)

(declare-fun c!88540 () Bool)

(assert (=> b!809532 (= c!88540 (= lt!362673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448070 () SeekEntryResult!8671)

(assert (=> b!809532 (= e!448072 e!448070)))

(declare-fun b!809533 () Bool)

(assert (=> b!809533 (= e!448070 (MissingVacant!8671 vacantAfter!23))))

(declare-fun b!809530 () Bool)

(assert (=> b!809530 (= e!448070 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!362570 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!362567 lt!362569 mask!3266))))

(declare-fun d!103753 () Bool)

(declare-fun lt!362672 () SeekEntryResult!8671)

(assert (=> d!103753 (and (or ((_ is Undefined!8671) lt!362672) (not ((_ is Found!8671) lt!362672)) (and (bvsge (index!37053 lt!362672) #b00000000000000000000000000000000) (bvslt (index!37053 lt!362672) (size!21504 lt!362569)))) (or ((_ is Undefined!8671) lt!362672) ((_ is Found!8671) lt!362672) (not ((_ is MissingVacant!8671) lt!362672)) (not (= (index!37055 lt!362672) vacantAfter!23)) (and (bvsge (index!37055 lt!362672) #b00000000000000000000000000000000) (bvslt (index!37055 lt!362672) (size!21504 lt!362569)))) (or ((_ is Undefined!8671) lt!362672) (ite ((_ is Found!8671) lt!362672) (= (select (arr!21083 lt!362569) (index!37053 lt!362672)) lt!362567) (and ((_ is MissingVacant!8671) lt!362672) (= (index!37055 lt!362672) vacantAfter!23) (= (select (arr!21083 lt!362569) (index!37055 lt!362672)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103753 (= lt!362672 e!448071)))

(declare-fun c!88541 () Bool)

(assert (=> d!103753 (= c!88541 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!103753 (= lt!362673 (select (arr!21083 lt!362569) lt!362570))))

(assert (=> d!103753 (validMask!0 mask!3266)))

(assert (=> d!103753 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362570 vacantAfter!23 lt!362567 lt!362569 mask!3266) lt!362672)))

(assert (= (and d!103753 c!88541) b!809528))

(assert (= (and d!103753 (not c!88541)) b!809529))

(assert (= (and b!809529 c!88539) b!809531))

(assert (= (and b!809529 (not c!88539)) b!809532))

(assert (= (and b!809532 c!88540) b!809533))

(assert (= (and b!809532 (not c!88540)) b!809530))

(declare-fun m!751235 () Bool)

(assert (=> b!809530 m!751235))

(assert (=> b!809530 m!751235))

(declare-fun m!751237 () Bool)

(assert (=> b!809530 m!751237))

(declare-fun m!751239 () Bool)

(assert (=> d!103753 m!751239))

(declare-fun m!751241 () Bool)

(assert (=> d!103753 m!751241))

(declare-fun m!751243 () Bool)

(assert (=> d!103753 m!751243))

(assert (=> d!103753 m!751009))

(assert (=> b!809302 d!103753))

(declare-fun d!103755 () Bool)

(declare-fun lt!362687 () (_ BitVec 32))

(assert (=> d!103755 (and (bvsge lt!362687 #b00000000000000000000000000000000) (bvslt lt!362687 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103755 (= lt!362687 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103755 (validMask!0 mask!3266)))

(assert (=> d!103755 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362687)))

(declare-fun bs!22392 () Bool)

(assert (= bs!22392 d!103755))

(declare-fun m!751265 () Bool)

(assert (=> bs!22392 m!751265))

(assert (=> bs!22392 m!751009))

(assert (=> b!809296 d!103755))

(check-sat (not b!809454) (not d!103739) (not b!809447) (not bm!35395) (not bm!35392) (not b!809442) (not d!103753) (not b!809412) (not b!809530) (not d!103733) (not b!809468) (not b!809491) (not b!809460) (not b!809443) (not d!103731) (not b!809494) (not d!103721) (not d!103719) (not b!809493) (not b!809393) (not d!103755))
(check-sat)
