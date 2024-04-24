; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28906 () Bool)

(assert start!28906)

(declare-fun b!294449 () Bool)

(declare-fun e!186139 () Bool)

(declare-fun e!186140 () Bool)

(assert (=> b!294449 (= e!186139 e!186140)))

(declare-fun res!154783 () Bool)

(assert (=> b!294449 (=> (not res!154783) (not e!186140))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145995 () Bool)

(declare-datatypes ((SeekEntryResult!2177 0))(
  ( (MissingZero!2177 (index!10878 (_ BitVec 32))) (Found!2177 (index!10879 (_ BitVec 32))) (Intermediate!2177 (undefined!2989 Bool) (index!10880 (_ BitVec 32)) (x!29190 (_ BitVec 32))) (Undefined!2177) (MissingVacant!2177 (index!10881 (_ BitVec 32))) )
))
(declare-fun lt!145991 () SeekEntryResult!2177)

(assert (=> b!294449 (= res!154783 (or lt!145995 (= lt!145991 (MissingVacant!2177 i!1256))))))

(assert (=> b!294449 (= lt!145995 (= lt!145991 (MissingZero!2177 i!1256)))))

(declare-datatypes ((array!14892 0))(
  ( (array!14893 (arr!7063 (Array (_ BitVec 32) (_ BitVec 64))) (size!7415 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14892)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14892 (_ BitVec 32)) SeekEntryResult!2177)

(assert (=> b!294449 (= lt!145991 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!294450 () Bool)

(declare-fun res!154787 () Bool)

(assert (=> b!294450 (=> (not res!154787) (not e!186139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294450 (= res!154787 (validKeyInArray!0 k0!2524))))

(declare-fun res!154785 () Bool)

(assert (=> start!28906 (=> (not res!154785) (not e!186139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28906 (= res!154785 (validMask!0 mask!3809))))

(assert (=> start!28906 e!186139))

(assert (=> start!28906 true))

(declare-fun array_inv!5013 (array!14892) Bool)

(assert (=> start!28906 (array_inv!5013 a!3312)))

(declare-fun b!294451 () Bool)

(declare-fun lt!145994 () SeekEntryResult!2177)

(get-info :version)

(assert (=> b!294451 (= e!186140 (and lt!145995 (let ((bdg!6235 (not ((_ is Intermediate!2177) lt!145994)))) (and (or bdg!6235 (not (undefined!2989 lt!145994))) (or bdg!6235 (not (= (select (arr!7063 a!3312) (index!10880 lt!145994)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6235) (= (select (arr!7063 a!3312) (index!10880 lt!145994)) k0!2524)))))))

(declare-fun lt!145993 () (_ BitVec 32))

(declare-fun lt!145992 () SeekEntryResult!2177)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14892 (_ BitVec 32)) SeekEntryResult!2177)

(assert (=> b!294451 (= lt!145992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145993 k0!2524 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312)) mask!3809))))

(assert (=> b!294451 (= lt!145994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145993 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294451 (= lt!145993 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!294452 () Bool)

(declare-fun res!154788 () Bool)

(assert (=> b!294452 (=> (not res!154788) (not e!186139))))

(declare-fun arrayContainsKey!0 (array!14892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294452 (= res!154788 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294453 () Bool)

(declare-fun res!154784 () Bool)

(assert (=> b!294453 (=> (not res!154784) (not e!186140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14892 (_ BitVec 32)) Bool)

(assert (=> b!294453 (= res!154784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294454 () Bool)

(declare-fun res!154786 () Bool)

(assert (=> b!294454 (=> (not res!154786) (not e!186139))))

(assert (=> b!294454 (= res!154786 (and (= (size!7415 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7415 a!3312))))))

(assert (= (and start!28906 res!154785) b!294454))

(assert (= (and b!294454 res!154786) b!294450))

(assert (= (and b!294450 res!154787) b!294452))

(assert (= (and b!294452 res!154788) b!294449))

(assert (= (and b!294449 res!154783) b!294453))

(assert (= (and b!294453 res!154784) b!294451))

(declare-fun m!308075 () Bool)

(assert (=> b!294449 m!308075))

(declare-fun m!308077 () Bool)

(assert (=> b!294451 m!308077))

(declare-fun m!308079 () Bool)

(assert (=> b!294451 m!308079))

(declare-fun m!308081 () Bool)

(assert (=> b!294451 m!308081))

(declare-fun m!308083 () Bool)

(assert (=> b!294451 m!308083))

(declare-fun m!308085 () Bool)

(assert (=> b!294451 m!308085))

(declare-fun m!308087 () Bool)

(assert (=> b!294453 m!308087))

(declare-fun m!308089 () Bool)

(assert (=> b!294450 m!308089))

(declare-fun m!308091 () Bool)

(assert (=> b!294452 m!308091))

(declare-fun m!308093 () Bool)

(assert (=> start!28906 m!308093))

(declare-fun m!308095 () Bool)

(assert (=> start!28906 m!308095))

(check-sat (not b!294452) (not b!294449) (not start!28906) (not b!294450) (not b!294451) (not b!294453))
(check-sat)
(get-model)

(declare-fun d!66863 () Bool)

(assert (=> d!66863 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294450 d!66863))

(declare-fun b!294503 () Bool)

(declare-fun e!186167 () SeekEntryResult!2177)

(declare-fun e!186166 () SeekEntryResult!2177)

(assert (=> b!294503 (= e!186167 e!186166)))

(declare-fun lt!146033 () (_ BitVec 64))

(declare-fun lt!146032 () SeekEntryResult!2177)

(assert (=> b!294503 (= lt!146033 (select (arr!7063 a!3312) (index!10880 lt!146032)))))

(declare-fun c!47412 () Bool)

(assert (=> b!294503 (= c!47412 (= lt!146033 k0!2524))))

(declare-fun e!186165 () SeekEntryResult!2177)

(declare-fun b!294504 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14892 (_ BitVec 32)) SeekEntryResult!2177)

(assert (=> b!294504 (= e!186165 (seekKeyOrZeroReturnVacant!0 (x!29190 lt!146032) (index!10880 lt!146032) (index!10880 lt!146032) k0!2524 a!3312 mask!3809))))

(declare-fun b!294505 () Bool)

(declare-fun c!47413 () Bool)

(assert (=> b!294505 (= c!47413 (= lt!146033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294505 (= e!186166 e!186165)))

(declare-fun b!294506 () Bool)

(assert (=> b!294506 (= e!186165 (MissingZero!2177 (index!10880 lt!146032)))))

(declare-fun d!66865 () Bool)

(declare-fun lt!146034 () SeekEntryResult!2177)

(assert (=> d!66865 (and (or ((_ is Undefined!2177) lt!146034) (not ((_ is Found!2177) lt!146034)) (and (bvsge (index!10879 lt!146034) #b00000000000000000000000000000000) (bvslt (index!10879 lt!146034) (size!7415 a!3312)))) (or ((_ is Undefined!2177) lt!146034) ((_ is Found!2177) lt!146034) (not ((_ is MissingZero!2177) lt!146034)) (and (bvsge (index!10878 lt!146034) #b00000000000000000000000000000000) (bvslt (index!10878 lt!146034) (size!7415 a!3312)))) (or ((_ is Undefined!2177) lt!146034) ((_ is Found!2177) lt!146034) ((_ is MissingZero!2177) lt!146034) (not ((_ is MissingVacant!2177) lt!146034)) (and (bvsge (index!10881 lt!146034) #b00000000000000000000000000000000) (bvslt (index!10881 lt!146034) (size!7415 a!3312)))) (or ((_ is Undefined!2177) lt!146034) (ite ((_ is Found!2177) lt!146034) (= (select (arr!7063 a!3312) (index!10879 lt!146034)) k0!2524) (ite ((_ is MissingZero!2177) lt!146034) (= (select (arr!7063 a!3312) (index!10878 lt!146034)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2177) lt!146034) (= (select (arr!7063 a!3312) (index!10881 lt!146034)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66865 (= lt!146034 e!186167)))

(declare-fun c!47411 () Bool)

(assert (=> d!66865 (= c!47411 (and ((_ is Intermediate!2177) lt!146032) (undefined!2989 lt!146032)))))

(assert (=> d!66865 (= lt!146032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66865 (validMask!0 mask!3809)))

(assert (=> d!66865 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146034)))

(declare-fun b!294507 () Bool)

(assert (=> b!294507 (= e!186166 (Found!2177 (index!10880 lt!146032)))))

(declare-fun b!294508 () Bool)

(assert (=> b!294508 (= e!186167 Undefined!2177)))

(assert (= (and d!66865 c!47411) b!294508))

(assert (= (and d!66865 (not c!47411)) b!294503))

(assert (= (and b!294503 c!47412) b!294507))

(assert (= (and b!294503 (not c!47412)) b!294505))

(assert (= (and b!294505 c!47413) b!294506))

(assert (= (and b!294505 (not c!47413)) b!294504))

(declare-fun m!308141 () Bool)

(assert (=> b!294503 m!308141))

(declare-fun m!308143 () Bool)

(assert (=> b!294504 m!308143))

(assert (=> d!66865 m!308093))

(declare-fun m!308145 () Bool)

(assert (=> d!66865 m!308145))

(declare-fun m!308147 () Bool)

(assert (=> d!66865 m!308147))

(declare-fun m!308149 () Bool)

(assert (=> d!66865 m!308149))

(assert (=> d!66865 m!308081))

(assert (=> d!66865 m!308081))

(declare-fun m!308151 () Bool)

(assert (=> d!66865 m!308151))

(assert (=> b!294449 d!66865))

(declare-fun d!66869 () Bool)

(assert (=> d!66869 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28906 d!66869))

(declare-fun d!66873 () Bool)

(assert (=> d!66873 (= (array_inv!5013 a!3312) (bvsge (size!7415 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28906 d!66873))

(declare-fun b!294541 () Bool)

(declare-fun e!186189 () Bool)

(declare-fun e!186191 () Bool)

(assert (=> b!294541 (= e!186189 e!186191)))

(declare-fun c!47425 () Bool)

(assert (=> b!294541 (= c!47425 (validKeyInArray!0 (select (arr!7063 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294542 () Bool)

(declare-fun call!25690 () Bool)

(assert (=> b!294542 (= e!186191 call!25690)))

(declare-fun d!66875 () Bool)

(declare-fun res!154835 () Bool)

(assert (=> d!66875 (=> res!154835 e!186189)))

(assert (=> d!66875 (= res!154835 (bvsge #b00000000000000000000000000000000 (size!7415 a!3312)))))

(assert (=> d!66875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186189)))

(declare-fun b!294543 () Bool)

(declare-fun e!186190 () Bool)

(assert (=> b!294543 (= e!186191 e!186190)))

(declare-fun lt!146050 () (_ BitVec 64))

(assert (=> b!294543 (= lt!146050 (select (arr!7063 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9172 0))(
  ( (Unit!9173) )
))
(declare-fun lt!146051 () Unit!9172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14892 (_ BitVec 64) (_ BitVec 32)) Unit!9172)

(assert (=> b!294543 (= lt!146051 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146050 #b00000000000000000000000000000000))))

(assert (=> b!294543 (arrayContainsKey!0 a!3312 lt!146050 #b00000000000000000000000000000000)))

(declare-fun lt!146052 () Unit!9172)

(assert (=> b!294543 (= lt!146052 lt!146051)))

(declare-fun res!154836 () Bool)

(assert (=> b!294543 (= res!154836 (= (seekEntryOrOpen!0 (select (arr!7063 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2177 #b00000000000000000000000000000000)))))

(assert (=> b!294543 (=> (not res!154836) (not e!186190))))

(declare-fun b!294544 () Bool)

(assert (=> b!294544 (= e!186190 call!25690)))

(declare-fun bm!25687 () Bool)

(assert (=> bm!25687 (= call!25690 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66875 (not res!154835)) b!294541))

(assert (= (and b!294541 c!47425) b!294543))

(assert (= (and b!294541 (not c!47425)) b!294542))

(assert (= (and b!294543 res!154836) b!294544))

(assert (= (or b!294544 b!294542) bm!25687))

(declare-fun m!308163 () Bool)

(assert (=> b!294541 m!308163))

(assert (=> b!294541 m!308163))

(declare-fun m!308169 () Bool)

(assert (=> b!294541 m!308169))

(assert (=> b!294543 m!308163))

(declare-fun m!308173 () Bool)

(assert (=> b!294543 m!308173))

(declare-fun m!308175 () Bool)

(assert (=> b!294543 m!308175))

(assert (=> b!294543 m!308163))

(declare-fun m!308177 () Bool)

(assert (=> b!294543 m!308177))

(declare-fun m!308179 () Bool)

(assert (=> bm!25687 m!308179))

(assert (=> b!294453 d!66875))

(declare-fun d!66881 () Bool)

(declare-fun res!154847 () Bool)

(declare-fun e!186202 () Bool)

(assert (=> d!66881 (=> res!154847 e!186202)))

(assert (=> d!66881 (= res!154847 (= (select (arr!7063 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66881 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186202)))

(declare-fun b!294555 () Bool)

(declare-fun e!186203 () Bool)

(assert (=> b!294555 (= e!186202 e!186203)))

(declare-fun res!154848 () Bool)

(assert (=> b!294555 (=> (not res!154848) (not e!186203))))

(assert (=> b!294555 (= res!154848 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7415 a!3312)))))

(declare-fun b!294556 () Bool)

(assert (=> b!294556 (= e!186203 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66881 (not res!154847)) b!294555))

(assert (= (and b!294555 res!154848) b!294556))

(assert (=> d!66881 m!308163))

(declare-fun m!308185 () Bool)

(assert (=> b!294556 m!308185))

(assert (=> b!294452 d!66881))

(declare-fun b!294614 () Bool)

(declare-fun e!186242 () SeekEntryResult!2177)

(declare-fun e!186239 () SeekEntryResult!2177)

(assert (=> b!294614 (= e!186242 e!186239)))

(declare-fun c!47446 () Bool)

(declare-fun lt!146072 () (_ BitVec 64))

(assert (=> b!294614 (= c!47446 (or (= lt!146072 k0!2524) (= (bvadd lt!146072 lt!146072) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294615 () Bool)

(assert (=> b!294615 (= e!186239 (Intermediate!2177 false lt!145993 #b00000000000000000000000000000000))))

(declare-fun b!294616 () Bool)

(declare-fun e!186238 () Bool)

(declare-fun lt!146073 () SeekEntryResult!2177)

(assert (=> b!294616 (= e!186238 (bvsge (x!29190 lt!146073) #b01111111111111111111111111111110))))

(declare-fun b!294617 () Bool)

(declare-fun e!186241 () Bool)

(assert (=> b!294617 (= e!186238 e!186241)))

(declare-fun res!154872 () Bool)

(assert (=> b!294617 (= res!154872 (and ((_ is Intermediate!2177) lt!146073) (not (undefined!2989 lt!146073)) (bvslt (x!29190 lt!146073) #b01111111111111111111111111111110) (bvsge (x!29190 lt!146073) #b00000000000000000000000000000000) (bvsge (x!29190 lt!146073) #b00000000000000000000000000000000)))))

(assert (=> b!294617 (=> (not res!154872) (not e!186241))))

(declare-fun b!294618 () Bool)

(assert (=> b!294618 (and (bvsge (index!10880 lt!146073) #b00000000000000000000000000000000) (bvslt (index!10880 lt!146073) (size!7415 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312)))))))

(declare-fun res!154870 () Bool)

(assert (=> b!294618 (= res!154870 (= (select (arr!7063 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312))) (index!10880 lt!146073)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186240 () Bool)

(assert (=> b!294618 (=> res!154870 e!186240)))

(declare-fun b!294619 () Bool)

(assert (=> b!294619 (and (bvsge (index!10880 lt!146073) #b00000000000000000000000000000000) (bvslt (index!10880 lt!146073) (size!7415 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312)))))))

(declare-fun res!154871 () Bool)

(assert (=> b!294619 (= res!154871 (= (select (arr!7063 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312))) (index!10880 lt!146073)) k0!2524))))

(assert (=> b!294619 (=> res!154871 e!186240)))

(assert (=> b!294619 (= e!186241 e!186240)))

(declare-fun b!294621 () Bool)

(assert (=> b!294621 (and (bvsge (index!10880 lt!146073) #b00000000000000000000000000000000) (bvslt (index!10880 lt!146073) (size!7415 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312)))))))

(assert (=> b!294621 (= e!186240 (= (select (arr!7063 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312))) (index!10880 lt!146073)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294622 () Bool)

(assert (=> b!294622 (= e!186242 (Intermediate!2177 true lt!145993 #b00000000000000000000000000000000))))

(declare-fun b!294620 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294620 (= e!186239 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145993 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312)) mask!3809))))

(declare-fun d!66885 () Bool)

(assert (=> d!66885 e!186238))

(declare-fun c!47445 () Bool)

(assert (=> d!66885 (= c!47445 (and ((_ is Intermediate!2177) lt!146073) (undefined!2989 lt!146073)))))

(assert (=> d!66885 (= lt!146073 e!186242)))

(declare-fun c!47444 () Bool)

(assert (=> d!66885 (= c!47444 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66885 (= lt!146072 (select (arr!7063 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312))) lt!145993))))

(assert (=> d!66885 (validMask!0 mask!3809)))

(assert (=> d!66885 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145993 k0!2524 (array!14893 (store (arr!7063 a!3312) i!1256 k0!2524) (size!7415 a!3312)) mask!3809) lt!146073)))

(assert (= (and d!66885 c!47444) b!294622))

(assert (= (and d!66885 (not c!47444)) b!294614))

(assert (= (and b!294614 c!47446) b!294615))

(assert (= (and b!294614 (not c!47446)) b!294620))

(assert (= (and d!66885 c!47445) b!294616))

(assert (= (and d!66885 (not c!47445)) b!294617))

(assert (= (and b!294617 res!154872) b!294619))

(assert (= (and b!294619 (not res!154871)) b!294618))

(assert (= (and b!294618 (not res!154870)) b!294621))

(declare-fun m!308205 () Bool)

(assert (=> d!66885 m!308205))

(assert (=> d!66885 m!308093))

(declare-fun m!308207 () Bool)

(assert (=> b!294619 m!308207))

(assert (=> b!294621 m!308207))

(assert (=> b!294618 m!308207))

(declare-fun m!308209 () Bool)

(assert (=> b!294620 m!308209))

(assert (=> b!294620 m!308209))

(declare-fun m!308211 () Bool)

(assert (=> b!294620 m!308211))

(assert (=> b!294451 d!66885))

(declare-fun b!294632 () Bool)

(declare-fun e!186252 () SeekEntryResult!2177)

(declare-fun e!186249 () SeekEntryResult!2177)

(assert (=> b!294632 (= e!186252 e!186249)))

(declare-fun c!47452 () Bool)

(declare-fun lt!146076 () (_ BitVec 64))

(assert (=> b!294632 (= c!47452 (or (= lt!146076 k0!2524) (= (bvadd lt!146076 lt!146076) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294633 () Bool)

(assert (=> b!294633 (= e!186249 (Intermediate!2177 false lt!145993 #b00000000000000000000000000000000))))

(declare-fun b!294634 () Bool)

(declare-fun e!186248 () Bool)

(declare-fun lt!146077 () SeekEntryResult!2177)

(assert (=> b!294634 (= e!186248 (bvsge (x!29190 lt!146077) #b01111111111111111111111111111110))))

(declare-fun b!294635 () Bool)

(declare-fun e!186251 () Bool)

(assert (=> b!294635 (= e!186248 e!186251)))

(declare-fun res!154878 () Bool)

(assert (=> b!294635 (= res!154878 (and ((_ is Intermediate!2177) lt!146077) (not (undefined!2989 lt!146077)) (bvslt (x!29190 lt!146077) #b01111111111111111111111111111110) (bvsge (x!29190 lt!146077) #b00000000000000000000000000000000) (bvsge (x!29190 lt!146077) #b00000000000000000000000000000000)))))

(assert (=> b!294635 (=> (not res!154878) (not e!186251))))

(declare-fun b!294636 () Bool)

(assert (=> b!294636 (and (bvsge (index!10880 lt!146077) #b00000000000000000000000000000000) (bvslt (index!10880 lt!146077) (size!7415 a!3312)))))

(declare-fun res!154876 () Bool)

(assert (=> b!294636 (= res!154876 (= (select (arr!7063 a!3312) (index!10880 lt!146077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186250 () Bool)

(assert (=> b!294636 (=> res!154876 e!186250)))

(declare-fun b!294637 () Bool)

(assert (=> b!294637 (and (bvsge (index!10880 lt!146077) #b00000000000000000000000000000000) (bvslt (index!10880 lt!146077) (size!7415 a!3312)))))

(declare-fun res!154877 () Bool)

(assert (=> b!294637 (= res!154877 (= (select (arr!7063 a!3312) (index!10880 lt!146077)) k0!2524))))

(assert (=> b!294637 (=> res!154877 e!186250)))

(assert (=> b!294637 (= e!186251 e!186250)))

(declare-fun b!294639 () Bool)

(assert (=> b!294639 (and (bvsge (index!10880 lt!146077) #b00000000000000000000000000000000) (bvslt (index!10880 lt!146077) (size!7415 a!3312)))))

(assert (=> b!294639 (= e!186250 (= (select (arr!7063 a!3312) (index!10880 lt!146077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294640 () Bool)

(assert (=> b!294640 (= e!186252 (Intermediate!2177 true lt!145993 #b00000000000000000000000000000000))))

(declare-fun b!294638 () Bool)

(assert (=> b!294638 (= e!186249 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145993 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun d!66897 () Bool)

(assert (=> d!66897 e!186248))

(declare-fun c!47451 () Bool)

(assert (=> d!66897 (= c!47451 (and ((_ is Intermediate!2177) lt!146077) (undefined!2989 lt!146077)))))

(assert (=> d!66897 (= lt!146077 e!186252)))

(declare-fun c!47450 () Bool)

(assert (=> d!66897 (= c!47450 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66897 (= lt!146076 (select (arr!7063 a!3312) lt!145993))))

(assert (=> d!66897 (validMask!0 mask!3809)))

(assert (=> d!66897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145993 k0!2524 a!3312 mask!3809) lt!146077)))

(assert (= (and d!66897 c!47450) b!294640))

(assert (= (and d!66897 (not c!47450)) b!294632))

(assert (= (and b!294632 c!47452) b!294633))

(assert (= (and b!294632 (not c!47452)) b!294638))

(assert (= (and d!66897 c!47451) b!294634))

(assert (= (and d!66897 (not c!47451)) b!294635))

(assert (= (and b!294635 res!154878) b!294637))

(assert (= (and b!294637 (not res!154877)) b!294636))

(assert (= (and b!294636 (not res!154876)) b!294639))

(declare-fun m!308219 () Bool)

(assert (=> d!66897 m!308219))

(assert (=> d!66897 m!308093))

(declare-fun m!308221 () Bool)

(assert (=> b!294637 m!308221))

(assert (=> b!294639 m!308221))

(assert (=> b!294636 m!308221))

(assert (=> b!294638 m!308209))

(assert (=> b!294638 m!308209))

(declare-fun m!308223 () Bool)

(assert (=> b!294638 m!308223))

(assert (=> b!294451 d!66897))

(declare-fun d!66901 () Bool)

(declare-fun lt!146087 () (_ BitVec 32))

(declare-fun lt!146086 () (_ BitVec 32))

(assert (=> d!66901 (= lt!146087 (bvmul (bvxor lt!146086 (bvlshr lt!146086 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66901 (= lt!146086 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66901 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154880 (let ((h!5193 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29196 (bvmul (bvxor h!5193 (bvlshr h!5193 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29196 (bvlshr x!29196 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154880 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154880 #b00000000000000000000000000000000))))))

(assert (=> d!66901 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146087 (bvlshr lt!146087 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294451 d!66901))

(check-sat (not b!294638) (not d!66885) (not d!66865) (not b!294620) (not b!294543) (not bm!25687) (not d!66897) (not b!294541) (not b!294504) (not b!294556))
(check-sat)
