; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31074 () Bool)

(assert start!31074)

(declare-fun b!312802 () Bool)

(declare-fun res!169310 () Bool)

(declare-fun e!194989 () Bool)

(assert (=> b!312802 (=> (not res!169310) (not e!194989))))

(declare-datatypes ((array!15989 0))(
  ( (array!15990 (arr!7576 (Array (_ BitVec 32) (_ BitVec 64))) (size!7928 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15989)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312802 (= res!169310 (and (= (select (arr!7576 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7928 a!3293))))))

(declare-fun b!312803 () Bool)

(declare-fun res!169309 () Bool)

(declare-fun e!194990 () Bool)

(assert (=> b!312803 (=> (not res!169309) (not e!194990))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15989 (_ BitVec 32)) Bool)

(assert (=> b!312803 (= res!169309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312804 () Bool)

(declare-fun res!169313 () Bool)

(assert (=> b!312804 (=> (not res!169313) (not e!194990))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312804 (= res!169313 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312806 () Bool)

(declare-fun res!169314 () Bool)

(assert (=> b!312806 (=> (not res!169314) (not e!194990))))

(declare-datatypes ((SeekEntryResult!2681 0))(
  ( (MissingZero!2681 (index!12900 (_ BitVec 32))) (Found!2681 (index!12901 (_ BitVec 32))) (Intermediate!2681 (undefined!3493 Bool) (index!12902 (_ BitVec 32)) (x!31211 (_ BitVec 32))) (Undefined!2681) (MissingVacant!2681 (index!12903 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15989 (_ BitVec 32)) SeekEntryResult!2681)

(assert (=> b!312806 (= res!169314 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2681 i!1240)))))

(declare-fun b!312807 () Bool)

(declare-fun res!169311 () Bool)

(assert (=> b!312807 (=> (not res!169311) (not e!194990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312807 (= res!169311 (validKeyInArray!0 k0!2441))))

(declare-fun b!312808 () Bool)

(assert (=> b!312808 (= e!194989 (bvsge resX!52 #b01111111111111111111111111111110))))

(declare-fun b!312809 () Bool)

(assert (=> b!312809 (= e!194990 e!194989)))

(declare-fun res!169308 () Bool)

(assert (=> b!312809 (=> (not res!169308) (not e!194989))))

(declare-fun lt!153366 () SeekEntryResult!2681)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15989 (_ BitVec 32)) SeekEntryResult!2681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312809 (= res!169308 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153366))))

(assert (=> b!312809 (= lt!153366 (Intermediate!2681 false resIndex!52 resX!52))))

(declare-fun b!312810 () Bool)

(declare-fun res!169306 () Bool)

(assert (=> b!312810 (=> (not res!169306) (not e!194990))))

(assert (=> b!312810 (= res!169306 (and (= (size!7928 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7928 a!3293))))))

(declare-fun b!312805 () Bool)

(declare-fun res!169307 () Bool)

(assert (=> b!312805 (=> (not res!169307) (not e!194989))))

(assert (=> b!312805 (= res!169307 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153366))))

(declare-fun res!169312 () Bool)

(assert (=> start!31074 (=> (not res!169312) (not e!194990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31074 (= res!169312 (validMask!0 mask!3709))))

(assert (=> start!31074 e!194990))

(declare-fun array_inv!5526 (array!15989) Bool)

(assert (=> start!31074 (array_inv!5526 a!3293)))

(assert (=> start!31074 true))

(assert (= (and start!31074 res!169312) b!312810))

(assert (= (and b!312810 res!169306) b!312807))

(assert (= (and b!312807 res!169311) b!312804))

(assert (= (and b!312804 res!169313) b!312806))

(assert (= (and b!312806 res!169314) b!312803))

(assert (= (and b!312803 res!169309) b!312809))

(assert (= (and b!312809 res!169308) b!312802))

(assert (= (and b!312802 res!169310) b!312805))

(assert (= (and b!312805 res!169307) b!312808))

(declare-fun m!323131 () Bool)

(assert (=> b!312807 m!323131))

(declare-fun m!323133 () Bool)

(assert (=> start!31074 m!323133))

(declare-fun m!323135 () Bool)

(assert (=> start!31074 m!323135))

(declare-fun m!323137 () Bool)

(assert (=> b!312809 m!323137))

(assert (=> b!312809 m!323137))

(declare-fun m!323139 () Bool)

(assert (=> b!312809 m!323139))

(declare-fun m!323141 () Bool)

(assert (=> b!312802 m!323141))

(declare-fun m!323143 () Bool)

(assert (=> b!312804 m!323143))

(declare-fun m!323145 () Bool)

(assert (=> b!312805 m!323145))

(declare-fun m!323147 () Bool)

(assert (=> b!312806 m!323147))

(declare-fun m!323149 () Bool)

(assert (=> b!312803 m!323149))

(check-sat (not b!312804) (not b!312806) (not b!312807) (not start!31074) (not b!312803) (not b!312805) (not b!312809))
(check-sat)
(get-model)

(declare-fun b!312873 () Bool)

(declare-fun e!195016 () Bool)

(declare-fun e!195017 () Bool)

(assert (=> b!312873 (= e!195016 e!195017)))

(declare-fun lt!153381 () (_ BitVec 64))

(assert (=> b!312873 (= lt!153381 (select (arr!7576 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9623 0))(
  ( (Unit!9624) )
))
(declare-fun lt!153380 () Unit!9623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15989 (_ BitVec 64) (_ BitVec 32)) Unit!9623)

(assert (=> b!312873 (= lt!153380 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153381 #b00000000000000000000000000000000))))

(assert (=> b!312873 (arrayContainsKey!0 a!3293 lt!153381 #b00000000000000000000000000000000)))

(declare-fun lt!153379 () Unit!9623)

(assert (=> b!312873 (= lt!153379 lt!153380)))

(declare-fun res!169373 () Bool)

(assert (=> b!312873 (= res!169373 (= (seekEntryOrOpen!0 (select (arr!7576 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2681 #b00000000000000000000000000000000)))))

(assert (=> b!312873 (=> (not res!169373) (not e!195017))))

(declare-fun b!312874 () Bool)

(declare-fun call!25916 () Bool)

(assert (=> b!312874 (= e!195017 call!25916)))

(declare-fun b!312875 () Bool)

(assert (=> b!312875 (= e!195016 call!25916)))

(declare-fun bm!25913 () Bool)

(assert (=> bm!25913 (= call!25916 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68507 () Bool)

(declare-fun res!169374 () Bool)

(declare-fun e!195018 () Bool)

(assert (=> d!68507 (=> res!169374 e!195018)))

(assert (=> d!68507 (= res!169374 (bvsge #b00000000000000000000000000000000 (size!7928 a!3293)))))

(assert (=> d!68507 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195018)))

(declare-fun b!312876 () Bool)

(assert (=> b!312876 (= e!195018 e!195016)))

(declare-fun c!49355 () Bool)

(assert (=> b!312876 (= c!49355 (validKeyInArray!0 (select (arr!7576 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68507 (not res!169374)) b!312876))

(assert (= (and b!312876 c!49355) b!312873))

(assert (= (and b!312876 (not c!49355)) b!312875))

(assert (= (and b!312873 res!169373) b!312874))

(assert (= (or b!312874 b!312875) bm!25913))

(declare-fun m!323191 () Bool)

(assert (=> b!312873 m!323191))

(declare-fun m!323193 () Bool)

(assert (=> b!312873 m!323193))

(declare-fun m!323195 () Bool)

(assert (=> b!312873 m!323195))

(assert (=> b!312873 m!323191))

(declare-fun m!323197 () Bool)

(assert (=> b!312873 m!323197))

(declare-fun m!323199 () Bool)

(assert (=> bm!25913 m!323199))

(assert (=> b!312876 m!323191))

(assert (=> b!312876 m!323191))

(declare-fun m!323201 () Bool)

(assert (=> b!312876 m!323201))

(assert (=> b!312803 d!68507))

(declare-fun d!68513 () Bool)

(assert (=> d!68513 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31074 d!68513))

(declare-fun d!68521 () Bool)

(assert (=> d!68521 (= (array_inv!5526 a!3293) (bvsge (size!7928 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31074 d!68521))

(declare-fun b!312931 () Bool)

(declare-fun c!49374 () Bool)

(declare-fun lt!153412 () (_ BitVec 64))

(assert (=> b!312931 (= c!49374 (= lt!153412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195053 () SeekEntryResult!2681)

(declare-fun e!195054 () SeekEntryResult!2681)

(assert (=> b!312931 (= e!195053 e!195054)))

(declare-fun b!312932 () Bool)

(declare-fun lt!153411 () SeekEntryResult!2681)

(assert (=> b!312932 (= e!195053 (Found!2681 (index!12902 lt!153411)))))

(declare-fun d!68523 () Bool)

(declare-fun lt!153410 () SeekEntryResult!2681)

(get-info :version)

(assert (=> d!68523 (and (or ((_ is Undefined!2681) lt!153410) (not ((_ is Found!2681) lt!153410)) (and (bvsge (index!12901 lt!153410) #b00000000000000000000000000000000) (bvslt (index!12901 lt!153410) (size!7928 a!3293)))) (or ((_ is Undefined!2681) lt!153410) ((_ is Found!2681) lt!153410) (not ((_ is MissingZero!2681) lt!153410)) (and (bvsge (index!12900 lt!153410) #b00000000000000000000000000000000) (bvslt (index!12900 lt!153410) (size!7928 a!3293)))) (or ((_ is Undefined!2681) lt!153410) ((_ is Found!2681) lt!153410) ((_ is MissingZero!2681) lt!153410) (not ((_ is MissingVacant!2681) lt!153410)) (and (bvsge (index!12903 lt!153410) #b00000000000000000000000000000000) (bvslt (index!12903 lt!153410) (size!7928 a!3293)))) (or ((_ is Undefined!2681) lt!153410) (ite ((_ is Found!2681) lt!153410) (= (select (arr!7576 a!3293) (index!12901 lt!153410)) k0!2441) (ite ((_ is MissingZero!2681) lt!153410) (= (select (arr!7576 a!3293) (index!12900 lt!153410)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2681) lt!153410) (= (select (arr!7576 a!3293) (index!12903 lt!153410)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195055 () SeekEntryResult!2681)

(assert (=> d!68523 (= lt!153410 e!195055)))

(declare-fun c!49375 () Bool)

(assert (=> d!68523 (= c!49375 (and ((_ is Intermediate!2681) lt!153411) (undefined!3493 lt!153411)))))

(assert (=> d!68523 (= lt!153411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68523 (validMask!0 mask!3709)))

(assert (=> d!68523 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153410)))

(declare-fun b!312933 () Bool)

(assert (=> b!312933 (= e!195055 Undefined!2681)))

(declare-fun b!312934 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15989 (_ BitVec 32)) SeekEntryResult!2681)

(assert (=> b!312934 (= e!195054 (seekKeyOrZeroReturnVacant!0 (x!31211 lt!153411) (index!12902 lt!153411) (index!12902 lt!153411) k0!2441 a!3293 mask!3709))))

(declare-fun b!312935 () Bool)

(assert (=> b!312935 (= e!195055 e!195053)))

(assert (=> b!312935 (= lt!153412 (select (arr!7576 a!3293) (index!12902 lt!153411)))))

(declare-fun c!49376 () Bool)

(assert (=> b!312935 (= c!49376 (= lt!153412 k0!2441))))

(declare-fun b!312936 () Bool)

(assert (=> b!312936 (= e!195054 (MissingZero!2681 (index!12902 lt!153411)))))

(assert (= (and d!68523 c!49375) b!312933))

(assert (= (and d!68523 (not c!49375)) b!312935))

(assert (= (and b!312935 c!49376) b!312932))

(assert (= (and b!312935 (not c!49376)) b!312931))

(assert (= (and b!312931 c!49374) b!312936))

(assert (= (and b!312931 (not c!49374)) b!312934))

(declare-fun m!323227 () Bool)

(assert (=> d!68523 m!323227))

(declare-fun m!323229 () Bool)

(assert (=> d!68523 m!323229))

(assert (=> d!68523 m!323137))

(assert (=> d!68523 m!323139))

(declare-fun m!323233 () Bool)

(assert (=> d!68523 m!323233))

(assert (=> d!68523 m!323137))

(assert (=> d!68523 m!323133))

(declare-fun m!323237 () Bool)

(assert (=> b!312934 m!323237))

(declare-fun m!323239 () Bool)

(assert (=> b!312935 m!323239))

(assert (=> b!312806 d!68523))

(declare-fun d!68531 () Bool)

(assert (=> d!68531 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!312807 d!68531))

(declare-fun b!313006 () Bool)

(declare-fun lt!153439 () SeekEntryResult!2681)

(assert (=> b!313006 (and (bvsge (index!12902 lt!153439) #b00000000000000000000000000000000) (bvslt (index!12902 lt!153439) (size!7928 a!3293)))))

(declare-fun res!169424 () Bool)

(assert (=> b!313006 (= res!169424 (= (select (arr!7576 a!3293) (index!12902 lt!153439)) k0!2441))))

(declare-fun e!195098 () Bool)

(assert (=> b!313006 (=> res!169424 e!195098)))

(declare-fun e!195099 () Bool)

(assert (=> b!313006 (= e!195099 e!195098)))

(declare-fun b!313007 () Bool)

(declare-fun e!195101 () Bool)

(assert (=> b!313007 (= e!195101 (bvsge (x!31211 lt!153439) #b01111111111111111111111111111110))))

(declare-fun b!313008 () Bool)

(assert (=> b!313008 (and (bvsge (index!12902 lt!153439) #b00000000000000000000000000000000) (bvslt (index!12902 lt!153439) (size!7928 a!3293)))))

(assert (=> b!313008 (= e!195098 (= (select (arr!7576 a!3293) (index!12902 lt!153439)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313009 () Bool)

(declare-fun e!195100 () SeekEntryResult!2681)

(assert (=> b!313009 (= e!195100 (Intermediate!2681 true index!1781 x!1427))))

(declare-fun b!313010 () Bool)

(declare-fun e!195097 () SeekEntryResult!2681)

(assert (=> b!313010 (= e!195100 e!195097)))

(declare-fun c!49400 () Bool)

(declare-fun lt!153440 () (_ BitVec 64))

(assert (=> b!313010 (= c!49400 (or (= lt!153440 k0!2441) (= (bvadd lt!153440 lt!153440) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68535 () Bool)

(assert (=> d!68535 e!195101))

(declare-fun c!49399 () Bool)

(assert (=> d!68535 (= c!49399 (and ((_ is Intermediate!2681) lt!153439) (undefined!3493 lt!153439)))))

(assert (=> d!68535 (= lt!153439 e!195100)))

(declare-fun c!49398 () Bool)

(assert (=> d!68535 (= c!49398 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68535 (= lt!153440 (select (arr!7576 a!3293) index!1781))))

(assert (=> d!68535 (validMask!0 mask!3709)))

(assert (=> d!68535 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153439)))

(declare-fun b!313011 () Bool)

(assert (=> b!313011 (= e!195101 e!195099)))

(declare-fun res!169423 () Bool)

(assert (=> b!313011 (= res!169423 (and ((_ is Intermediate!2681) lt!153439) (not (undefined!3493 lt!153439)) (bvslt (x!31211 lt!153439) #b01111111111111111111111111111110) (bvsge (x!31211 lt!153439) #b00000000000000000000000000000000) (bvsge (x!31211 lt!153439) x!1427)))))

(assert (=> b!313011 (=> (not res!169423) (not e!195099))))

(declare-fun b!313012 () Bool)

(assert (=> b!313012 (= e!195097 (Intermediate!2681 false index!1781 x!1427))))

(declare-fun b!313013 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313013 (= e!195097 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313014 () Bool)

(assert (=> b!313014 (and (bvsge (index!12902 lt!153439) #b00000000000000000000000000000000) (bvslt (index!12902 lt!153439) (size!7928 a!3293)))))

(declare-fun res!169422 () Bool)

(assert (=> b!313014 (= res!169422 (= (select (arr!7576 a!3293) (index!12902 lt!153439)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313014 (=> res!169422 e!195098)))

(assert (= (and d!68535 c!49398) b!313009))

(assert (= (and d!68535 (not c!49398)) b!313010))

(assert (= (and b!313010 c!49400) b!313012))

(assert (= (and b!313010 (not c!49400)) b!313013))

(assert (= (and d!68535 c!49399) b!313007))

(assert (= (and d!68535 (not c!49399)) b!313011))

(assert (= (and b!313011 res!169423) b!313006))

(assert (= (and b!313006 (not res!169424)) b!313014))

(assert (= (and b!313014 (not res!169422)) b!313008))

(declare-fun m!323263 () Bool)

(assert (=> b!313013 m!323263))

(assert (=> b!313013 m!323263))

(declare-fun m!323265 () Bool)

(assert (=> b!313013 m!323265))

(declare-fun m!323267 () Bool)

(assert (=> b!313014 m!323267))

(assert (=> b!313008 m!323267))

(declare-fun m!323269 () Bool)

(assert (=> d!68535 m!323269))

(assert (=> d!68535 m!323133))

(assert (=> b!313006 m!323267))

(assert (=> b!312805 d!68535))

(declare-fun b!313017 () Bool)

(declare-fun lt!153441 () SeekEntryResult!2681)

(assert (=> b!313017 (and (bvsge (index!12902 lt!153441) #b00000000000000000000000000000000) (bvslt (index!12902 lt!153441) (size!7928 a!3293)))))

(declare-fun res!169431 () Bool)

(assert (=> b!313017 (= res!169431 (= (select (arr!7576 a!3293) (index!12902 lt!153441)) k0!2441))))

(declare-fun e!195107 () Bool)

(assert (=> b!313017 (=> res!169431 e!195107)))

(declare-fun e!195108 () Bool)

(assert (=> b!313017 (= e!195108 e!195107)))

(declare-fun b!313018 () Bool)

(declare-fun e!195110 () Bool)

(assert (=> b!313018 (= e!195110 (bvsge (x!31211 lt!153441) #b01111111111111111111111111111110))))

(declare-fun b!313019 () Bool)

(assert (=> b!313019 (and (bvsge (index!12902 lt!153441) #b00000000000000000000000000000000) (bvslt (index!12902 lt!153441) (size!7928 a!3293)))))

(assert (=> b!313019 (= e!195107 (= (select (arr!7576 a!3293) (index!12902 lt!153441)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313020 () Bool)

(declare-fun e!195109 () SeekEntryResult!2681)

(assert (=> b!313020 (= e!195109 (Intermediate!2681 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313021 () Bool)

(declare-fun e!195106 () SeekEntryResult!2681)

(assert (=> b!313021 (= e!195109 e!195106)))

(declare-fun c!49403 () Bool)

(declare-fun lt!153442 () (_ BitVec 64))

(assert (=> b!313021 (= c!49403 (or (= lt!153442 k0!2441) (= (bvadd lt!153442 lt!153442) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68551 () Bool)

(assert (=> d!68551 e!195110))

(declare-fun c!49402 () Bool)

(assert (=> d!68551 (= c!49402 (and ((_ is Intermediate!2681) lt!153441) (undefined!3493 lt!153441)))))

(assert (=> d!68551 (= lt!153441 e!195109)))

(declare-fun c!49401 () Bool)

(assert (=> d!68551 (= c!49401 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68551 (= lt!153442 (select (arr!7576 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68551 (validMask!0 mask!3709)))

(assert (=> d!68551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153441)))

(declare-fun b!313022 () Bool)

(assert (=> b!313022 (= e!195110 e!195108)))

(declare-fun res!169430 () Bool)

(assert (=> b!313022 (= res!169430 (and ((_ is Intermediate!2681) lt!153441) (not (undefined!3493 lt!153441)) (bvslt (x!31211 lt!153441) #b01111111111111111111111111111110) (bvsge (x!31211 lt!153441) #b00000000000000000000000000000000) (bvsge (x!31211 lt!153441) #b00000000000000000000000000000000)))))

(assert (=> b!313022 (=> (not res!169430) (not e!195108))))

(declare-fun b!313023 () Bool)

(assert (=> b!313023 (= e!195106 (Intermediate!2681 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313024 () Bool)

(assert (=> b!313024 (= e!195106 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313025 () Bool)

(assert (=> b!313025 (and (bvsge (index!12902 lt!153441) #b00000000000000000000000000000000) (bvslt (index!12902 lt!153441) (size!7928 a!3293)))))

(declare-fun res!169429 () Bool)

(assert (=> b!313025 (= res!169429 (= (select (arr!7576 a!3293) (index!12902 lt!153441)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313025 (=> res!169429 e!195107)))

(assert (= (and d!68551 c!49401) b!313020))

(assert (= (and d!68551 (not c!49401)) b!313021))

(assert (= (and b!313021 c!49403) b!313023))

(assert (= (and b!313021 (not c!49403)) b!313024))

(assert (= (and d!68551 c!49402) b!313018))

(assert (= (and d!68551 (not c!49402)) b!313022))

(assert (= (and b!313022 res!169430) b!313017))

(assert (= (and b!313017 (not res!169431)) b!313025))

(assert (= (and b!313025 (not res!169429)) b!313019))

(assert (=> b!313024 m!323137))

(declare-fun m!323271 () Bool)

(assert (=> b!313024 m!323271))

(assert (=> b!313024 m!323271))

(declare-fun m!323273 () Bool)

(assert (=> b!313024 m!323273))

(declare-fun m!323275 () Bool)

(assert (=> b!313025 m!323275))

(assert (=> b!313019 m!323275))

(assert (=> d!68551 m!323137))

(declare-fun m!323277 () Bool)

(assert (=> d!68551 m!323277))

(assert (=> d!68551 m!323133))

(assert (=> b!313017 m!323275))

(assert (=> b!312809 d!68551))

(declare-fun d!68553 () Bool)

(declare-fun lt!153450 () (_ BitVec 32))

(declare-fun lt!153449 () (_ BitVec 32))

(assert (=> d!68553 (= lt!153450 (bvmul (bvxor lt!153449 (bvlshr lt!153449 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68553 (= lt!153449 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68553 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169437 (let ((h!5260 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31219 (bvmul (bvxor h!5260 (bvlshr h!5260 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31219 (bvlshr x!31219 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169437 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169437 #b00000000000000000000000000000000))))))

(assert (=> d!68553 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153450 (bvlshr lt!153450 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!312809 d!68553))

(declare-fun d!68559 () Bool)

(declare-fun res!169442 () Bool)

(declare-fun e!195122 () Bool)

(assert (=> d!68559 (=> res!169442 e!195122)))

(assert (=> d!68559 (= res!169442 (= (select (arr!7576 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68559 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195122)))

(declare-fun b!313043 () Bool)

(declare-fun e!195123 () Bool)

(assert (=> b!313043 (= e!195122 e!195123)))

(declare-fun res!169443 () Bool)

(assert (=> b!313043 (=> (not res!169443) (not e!195123))))

(assert (=> b!313043 (= res!169443 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7928 a!3293)))))

(declare-fun b!313044 () Bool)

(assert (=> b!313044 (= e!195123 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68559 (not res!169442)) b!313043))

(assert (= (and b!313043 res!169443) b!313044))

(assert (=> d!68559 m!323191))

(declare-fun m!323289 () Bool)

(assert (=> b!313044 m!323289))

(assert (=> b!312804 d!68559))

(check-sat (not b!313044) (not d!68535) (not bm!25913) (not d!68551) (not d!68523) (not b!312934) (not b!313024) (not b!312873) (not b!313013) (not b!312876))
(check-sat)
