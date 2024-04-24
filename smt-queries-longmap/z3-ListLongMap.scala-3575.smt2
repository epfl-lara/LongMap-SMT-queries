; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49174 () Bool)

(assert start!49174)

(declare-fun b!541458 () Bool)

(declare-fun res!336243 () Bool)

(declare-fun e!313541 () Bool)

(assert (=> b!541458 (=> (not res!336243) (not e!313541))))

(declare-datatypes ((array!34232 0))(
  ( (array!34233 (arr!16450 (Array (_ BitVec 32) (_ BitVec 64))) (size!16814 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34232)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541458 (= res!336243 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541459 () Bool)

(declare-fun res!336245 () Bool)

(assert (=> b!541459 (=> (not res!336245) (not e!313541))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541459 (= res!336245 (validKeyInArray!0 (select (arr!16450 a!3154) j!147)))))

(declare-fun res!336246 () Bool)

(assert (=> start!49174 (=> (not res!336246) (not e!313541))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49174 (= res!336246 (validMask!0 mask!3216))))

(assert (=> start!49174 e!313541))

(assert (=> start!49174 true))

(declare-fun array_inv!12309 (array!34232) Bool)

(assert (=> start!49174 (array_inv!12309 a!3154)))

(declare-fun b!541460 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun e!313542 () Bool)

(assert (=> b!541460 (= e!313542 (and (not (= (select (arr!16450 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16450 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16450 a!3154) index!1177) (select (arr!16450 a!3154) j!147)) (not (= index!1177 resIndex!32))))))

(declare-fun b!541461 () Bool)

(declare-fun res!336241 () Bool)

(declare-fun e!313539 () Bool)

(assert (=> b!541461 (=> (not res!336241) (not e!313539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34232 (_ BitVec 32)) Bool)

(assert (=> b!541461 (= res!336241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541462 () Bool)

(assert (=> b!541462 (= e!313539 e!313542)))

(declare-fun res!336240 () Bool)

(assert (=> b!541462 (=> (not res!336240) (not e!313542))))

(declare-datatypes ((SeekEntryResult!4864 0))(
  ( (MissingZero!4864 (index!21680 (_ BitVec 32))) (Found!4864 (index!21681 (_ BitVec 32))) (Intermediate!4864 (undefined!5676 Bool) (index!21682 (_ BitVec 32)) (x!50742 (_ BitVec 32))) (Undefined!4864) (MissingVacant!4864 (index!21683 (_ BitVec 32))) )
))
(declare-fun lt!247692 () SeekEntryResult!4864)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541462 (= res!336240 (= lt!247692 (Intermediate!4864 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34232 (_ BitVec 32)) SeekEntryResult!4864)

(assert (=> b!541462 (= lt!247692 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16450 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541463 () Bool)

(declare-fun res!336242 () Bool)

(assert (=> b!541463 (=> (not res!336242) (not e!313539))))

(assert (=> b!541463 (= res!336242 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16814 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16814 a!3154)) (= (select (arr!16450 a!3154) resIndex!32) (select (arr!16450 a!3154) j!147))))))

(declare-fun b!541464 () Bool)

(declare-fun res!336248 () Bool)

(assert (=> b!541464 (=> (not res!336248) (not e!313539))))

(declare-datatypes ((List!10476 0))(
  ( (Nil!10473) (Cons!10472 (h!11424 (_ BitVec 64)) (t!16696 List!10476)) )
))
(declare-fun arrayNoDuplicates!0 (array!34232 (_ BitVec 32) List!10476) Bool)

(assert (=> b!541464 (= res!336248 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10473))))

(declare-fun b!541465 () Bool)

(declare-fun res!336244 () Bool)

(assert (=> b!541465 (=> (not res!336244) (not e!313541))))

(assert (=> b!541465 (= res!336244 (validKeyInArray!0 k0!1998))))

(declare-fun b!541466 () Bool)

(declare-fun res!336249 () Bool)

(assert (=> b!541466 (=> (not res!336249) (not e!313541))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541466 (= res!336249 (and (= (size!16814 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16814 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16814 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541467 () Bool)

(assert (=> b!541467 (= e!313541 e!313539)))

(declare-fun res!336247 () Bool)

(assert (=> b!541467 (=> (not res!336247) (not e!313539))))

(declare-fun lt!247693 () SeekEntryResult!4864)

(assert (=> b!541467 (= res!336247 (or (= lt!247693 (MissingZero!4864 i!1153)) (= lt!247693 (MissingVacant!4864 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34232 (_ BitVec 32)) SeekEntryResult!4864)

(assert (=> b!541467 (= lt!247693 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541468 () Bool)

(declare-fun res!336250 () Bool)

(assert (=> b!541468 (=> (not res!336250) (not e!313542))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541468 (= res!336250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16450 a!3154) j!147) mask!3216) (select (arr!16450 a!3154) j!147) a!3154 mask!3216) lt!247692))))

(assert (= (and start!49174 res!336246) b!541466))

(assert (= (and b!541466 res!336249) b!541459))

(assert (= (and b!541459 res!336245) b!541465))

(assert (= (and b!541465 res!336244) b!541458))

(assert (= (and b!541458 res!336243) b!541467))

(assert (= (and b!541467 res!336247) b!541461))

(assert (= (and b!541461 res!336241) b!541464))

(assert (= (and b!541464 res!336248) b!541463))

(assert (= (and b!541463 res!336242) b!541462))

(assert (= (and b!541462 res!336240) b!541468))

(assert (= (and b!541468 res!336250) b!541460))

(declare-fun m!520177 () Bool)

(assert (=> b!541458 m!520177))

(declare-fun m!520179 () Bool)

(assert (=> b!541468 m!520179))

(assert (=> b!541468 m!520179))

(declare-fun m!520181 () Bool)

(assert (=> b!541468 m!520181))

(assert (=> b!541468 m!520181))

(assert (=> b!541468 m!520179))

(declare-fun m!520183 () Bool)

(assert (=> b!541468 m!520183))

(declare-fun m!520185 () Bool)

(assert (=> b!541464 m!520185))

(declare-fun m!520187 () Bool)

(assert (=> b!541461 m!520187))

(declare-fun m!520189 () Bool)

(assert (=> b!541465 m!520189))

(declare-fun m!520191 () Bool)

(assert (=> b!541467 m!520191))

(declare-fun m!520193 () Bool)

(assert (=> b!541460 m!520193))

(assert (=> b!541460 m!520179))

(assert (=> b!541462 m!520179))

(assert (=> b!541462 m!520179))

(declare-fun m!520195 () Bool)

(assert (=> b!541462 m!520195))

(declare-fun m!520197 () Bool)

(assert (=> start!49174 m!520197))

(declare-fun m!520199 () Bool)

(assert (=> start!49174 m!520199))

(declare-fun m!520201 () Bool)

(assert (=> b!541463 m!520201))

(assert (=> b!541463 m!520179))

(assert (=> b!541459 m!520179))

(assert (=> b!541459 m!520179))

(declare-fun m!520203 () Bool)

(assert (=> b!541459 m!520203))

(check-sat (not b!541462) (not b!541468) (not b!541461) (not start!49174) (not b!541467) (not b!541464) (not b!541458) (not b!541459) (not b!541465))
(check-sat)
(get-model)

(declare-fun d!81849 () Bool)

(declare-fun res!336321 () Bool)

(declare-fun e!313571 () Bool)

(assert (=> d!81849 (=> res!336321 e!313571)))

(assert (=> d!81849 (= res!336321 (= (select (arr!16450 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81849 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!313571)))

(declare-fun b!541539 () Bool)

(declare-fun e!313572 () Bool)

(assert (=> b!541539 (= e!313571 e!313572)))

(declare-fun res!336322 () Bool)

(assert (=> b!541539 (=> (not res!336322) (not e!313572))))

(assert (=> b!541539 (= res!336322 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16814 a!3154)))))

(declare-fun b!541540 () Bool)

(assert (=> b!541540 (= e!313572 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81849 (not res!336321)) b!541539))

(assert (= (and b!541539 res!336322) b!541540))

(declare-fun m!520261 () Bool)

(assert (=> d!81849 m!520261))

(declare-fun m!520263 () Bool)

(assert (=> b!541540 m!520263))

(assert (=> b!541458 d!81849))

(declare-fun b!541551 () Bool)

(declare-fun e!313584 () Bool)

(declare-fun call!32040 () Bool)

(assert (=> b!541551 (= e!313584 call!32040)))

(declare-fun d!81851 () Bool)

(declare-fun res!336331 () Bool)

(declare-fun e!313582 () Bool)

(assert (=> d!81851 (=> res!336331 e!313582)))

(assert (=> d!81851 (= res!336331 (bvsge #b00000000000000000000000000000000 (size!16814 a!3154)))))

(assert (=> d!81851 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10473) e!313582)))

(declare-fun bm!32037 () Bool)

(declare-fun c!62927 () Bool)

(assert (=> bm!32037 (= call!32040 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62927 (Cons!10472 (select (arr!16450 a!3154) #b00000000000000000000000000000000) Nil!10473) Nil!10473)))))

(declare-fun b!541552 () Bool)

(declare-fun e!313581 () Bool)

(declare-fun contains!2777 (List!10476 (_ BitVec 64)) Bool)

(assert (=> b!541552 (= e!313581 (contains!2777 Nil!10473 (select (arr!16450 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541553 () Bool)

(declare-fun e!313583 () Bool)

(assert (=> b!541553 (= e!313582 e!313583)))

(declare-fun res!336330 () Bool)

(assert (=> b!541553 (=> (not res!336330) (not e!313583))))

(assert (=> b!541553 (= res!336330 (not e!313581))))

(declare-fun res!336329 () Bool)

(assert (=> b!541553 (=> (not res!336329) (not e!313581))))

(assert (=> b!541553 (= res!336329 (validKeyInArray!0 (select (arr!16450 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541554 () Bool)

(assert (=> b!541554 (= e!313583 e!313584)))

(assert (=> b!541554 (= c!62927 (validKeyInArray!0 (select (arr!16450 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541555 () Bool)

(assert (=> b!541555 (= e!313584 call!32040)))

(assert (= (and d!81851 (not res!336331)) b!541553))

(assert (= (and b!541553 res!336329) b!541552))

(assert (= (and b!541553 res!336330) b!541554))

(assert (= (and b!541554 c!62927) b!541555))

(assert (= (and b!541554 (not c!62927)) b!541551))

(assert (= (or b!541555 b!541551) bm!32037))

(assert (=> bm!32037 m!520261))

(declare-fun m!520265 () Bool)

(assert (=> bm!32037 m!520265))

(assert (=> b!541552 m!520261))

(assert (=> b!541552 m!520261))

(declare-fun m!520267 () Bool)

(assert (=> b!541552 m!520267))

(assert (=> b!541553 m!520261))

(assert (=> b!541553 m!520261))

(declare-fun m!520269 () Bool)

(assert (=> b!541553 m!520269))

(assert (=> b!541554 m!520261))

(assert (=> b!541554 m!520261))

(assert (=> b!541554 m!520269))

(assert (=> b!541464 d!81851))

(declare-fun d!81853 () Bool)

(assert (=> d!81853 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49174 d!81853))

(declare-fun d!81857 () Bool)

(assert (=> d!81857 (= (array_inv!12309 a!3154) (bvsge (size!16814 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49174 d!81857))

(declare-fun b!541604 () Bool)

(declare-fun lt!247730 () SeekEntryResult!4864)

(declare-fun e!313617 () SeekEntryResult!4864)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34232 (_ BitVec 32)) SeekEntryResult!4864)

(assert (=> b!541604 (= e!313617 (seekKeyOrZeroReturnVacant!0 (x!50742 lt!247730) (index!21682 lt!247730) (index!21682 lt!247730) k0!1998 a!3154 mask!3216))))

(declare-fun b!541605 () Bool)

(declare-fun c!62946 () Bool)

(declare-fun lt!247732 () (_ BitVec 64))

(assert (=> b!541605 (= c!62946 (= lt!247732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313615 () SeekEntryResult!4864)

(assert (=> b!541605 (= e!313615 e!313617)))

(declare-fun b!541607 () Bool)

(declare-fun e!313616 () SeekEntryResult!4864)

(assert (=> b!541607 (= e!313616 Undefined!4864)))

(declare-fun b!541608 () Bool)

(assert (=> b!541608 (= e!313616 e!313615)))

(assert (=> b!541608 (= lt!247732 (select (arr!16450 a!3154) (index!21682 lt!247730)))))

(declare-fun c!62948 () Bool)

(assert (=> b!541608 (= c!62948 (= lt!247732 k0!1998))))

(declare-fun b!541609 () Bool)

(assert (=> b!541609 (= e!313615 (Found!4864 (index!21682 lt!247730)))))

(declare-fun d!81859 () Bool)

(declare-fun lt!247731 () SeekEntryResult!4864)

(get-info :version)

(assert (=> d!81859 (and (or ((_ is Undefined!4864) lt!247731) (not ((_ is Found!4864) lt!247731)) (and (bvsge (index!21681 lt!247731) #b00000000000000000000000000000000) (bvslt (index!21681 lt!247731) (size!16814 a!3154)))) (or ((_ is Undefined!4864) lt!247731) ((_ is Found!4864) lt!247731) (not ((_ is MissingZero!4864) lt!247731)) (and (bvsge (index!21680 lt!247731) #b00000000000000000000000000000000) (bvslt (index!21680 lt!247731) (size!16814 a!3154)))) (or ((_ is Undefined!4864) lt!247731) ((_ is Found!4864) lt!247731) ((_ is MissingZero!4864) lt!247731) (not ((_ is MissingVacant!4864) lt!247731)) (and (bvsge (index!21683 lt!247731) #b00000000000000000000000000000000) (bvslt (index!21683 lt!247731) (size!16814 a!3154)))) (or ((_ is Undefined!4864) lt!247731) (ite ((_ is Found!4864) lt!247731) (= (select (arr!16450 a!3154) (index!21681 lt!247731)) k0!1998) (ite ((_ is MissingZero!4864) lt!247731) (= (select (arr!16450 a!3154) (index!21680 lt!247731)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4864) lt!247731) (= (select (arr!16450 a!3154) (index!21683 lt!247731)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81859 (= lt!247731 e!313616)))

(declare-fun c!62947 () Bool)

(assert (=> d!81859 (= c!62947 (and ((_ is Intermediate!4864) lt!247730) (undefined!5676 lt!247730)))))

(assert (=> d!81859 (= lt!247730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81859 (validMask!0 mask!3216)))

(assert (=> d!81859 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247731)))

(declare-fun b!541606 () Bool)

(assert (=> b!541606 (= e!313617 (MissingZero!4864 (index!21682 lt!247730)))))

(assert (= (and d!81859 c!62947) b!541607))

(assert (= (and d!81859 (not c!62947)) b!541608))

(assert (= (and b!541608 c!62948) b!541609))

(assert (= (and b!541608 (not c!62948)) b!541605))

(assert (= (and b!541605 c!62946) b!541606))

(assert (= (and b!541605 (not c!62946)) b!541604))

(declare-fun m!520299 () Bool)

(assert (=> b!541604 m!520299))

(declare-fun m!520301 () Bool)

(assert (=> b!541608 m!520301))

(assert (=> d!81859 m!520197))

(declare-fun m!520303 () Bool)

(assert (=> d!81859 m!520303))

(declare-fun m!520305 () Bool)

(assert (=> d!81859 m!520305))

(declare-fun m!520307 () Bool)

(assert (=> d!81859 m!520307))

(declare-fun m!520309 () Bool)

(assert (=> d!81859 m!520309))

(assert (=> d!81859 m!520305))

(declare-fun m!520311 () Bool)

(assert (=> d!81859 m!520311))

(assert (=> b!541467 d!81859))

(declare-fun b!541691 () Bool)

(declare-fun lt!247756 () SeekEntryResult!4864)

(assert (=> b!541691 (and (bvsge (index!21682 lt!247756) #b00000000000000000000000000000000) (bvslt (index!21682 lt!247756) (size!16814 a!3154)))))

(declare-fun e!313665 () Bool)

(assert (=> b!541691 (= e!313665 (= (select (arr!16450 a!3154) (index!21682 lt!247756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541692 () Bool)

(declare-fun e!313666 () SeekEntryResult!4864)

(declare-fun e!313667 () SeekEntryResult!4864)

(assert (=> b!541692 (= e!313666 e!313667)))

(declare-fun c!62976 () Bool)

(declare-fun lt!247755 () (_ BitVec 64))

(assert (=> b!541692 (= c!62976 (or (= lt!247755 (select (arr!16450 a!3154) j!147)) (= (bvadd lt!247755 lt!247755) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541693 () Bool)

(assert (=> b!541693 (and (bvsge (index!21682 lt!247756) #b00000000000000000000000000000000) (bvslt (index!21682 lt!247756) (size!16814 a!3154)))))

(declare-fun res!336374 () Bool)

(assert (=> b!541693 (= res!336374 (= (select (arr!16450 a!3154) (index!21682 lt!247756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541693 (=> res!336374 e!313665)))

(declare-fun b!541694 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541694 (= e!313667 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16450 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541695 () Bool)

(assert (=> b!541695 (= e!313666 (Intermediate!4864 true index!1177 x!1030))))

(declare-fun b!541696 () Bool)

(assert (=> b!541696 (and (bvsge (index!21682 lt!247756) #b00000000000000000000000000000000) (bvslt (index!21682 lt!247756) (size!16814 a!3154)))))

(declare-fun res!336373 () Bool)

(assert (=> b!541696 (= res!336373 (= (select (arr!16450 a!3154) (index!21682 lt!247756)) (select (arr!16450 a!3154) j!147)))))

(assert (=> b!541696 (=> res!336373 e!313665)))

(declare-fun e!313664 () Bool)

(assert (=> b!541696 (= e!313664 e!313665)))

(declare-fun d!81871 () Bool)

(declare-fun e!313663 () Bool)

(assert (=> d!81871 e!313663))

(declare-fun c!62977 () Bool)

(assert (=> d!81871 (= c!62977 (and ((_ is Intermediate!4864) lt!247756) (undefined!5676 lt!247756)))))

(assert (=> d!81871 (= lt!247756 e!313666)))

(declare-fun c!62978 () Bool)

(assert (=> d!81871 (= c!62978 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81871 (= lt!247755 (select (arr!16450 a!3154) index!1177))))

(assert (=> d!81871 (validMask!0 mask!3216)))

(assert (=> d!81871 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16450 a!3154) j!147) a!3154 mask!3216) lt!247756)))

(declare-fun b!541697 () Bool)

(assert (=> b!541697 (= e!313663 e!313664)))

(declare-fun res!336375 () Bool)

(assert (=> b!541697 (= res!336375 (and ((_ is Intermediate!4864) lt!247756) (not (undefined!5676 lt!247756)) (bvslt (x!50742 lt!247756) #b01111111111111111111111111111110) (bvsge (x!50742 lt!247756) #b00000000000000000000000000000000) (bvsge (x!50742 lt!247756) x!1030)))))

(assert (=> b!541697 (=> (not res!336375) (not e!313664))))

(declare-fun b!541698 () Bool)

(assert (=> b!541698 (= e!313667 (Intermediate!4864 false index!1177 x!1030))))

(declare-fun b!541699 () Bool)

(assert (=> b!541699 (= e!313663 (bvsge (x!50742 lt!247756) #b01111111111111111111111111111110))))

(assert (= (and d!81871 c!62978) b!541695))

(assert (= (and d!81871 (not c!62978)) b!541692))

(assert (= (and b!541692 c!62976) b!541698))

(assert (= (and b!541692 (not c!62976)) b!541694))

(assert (= (and d!81871 c!62977) b!541699))

(assert (= (and d!81871 (not c!62977)) b!541697))

(assert (= (and b!541697 res!336375) b!541696))

(assert (= (and b!541696 (not res!336373)) b!541693))

(assert (= (and b!541693 (not res!336374)) b!541691))

(declare-fun m!520335 () Bool)

(assert (=> b!541694 m!520335))

(assert (=> b!541694 m!520335))

(assert (=> b!541694 m!520179))

(declare-fun m!520337 () Bool)

(assert (=> b!541694 m!520337))

(declare-fun m!520339 () Bool)

(assert (=> b!541693 m!520339))

(assert (=> b!541691 m!520339))

(assert (=> b!541696 m!520339))

(assert (=> d!81871 m!520193))

(assert (=> d!81871 m!520197))

(assert (=> b!541462 d!81871))

(declare-fun b!541709 () Bool)

(declare-fun lt!247762 () SeekEntryResult!4864)

(assert (=> b!541709 (and (bvsge (index!21682 lt!247762) #b00000000000000000000000000000000) (bvslt (index!21682 lt!247762) (size!16814 a!3154)))))

(declare-fun e!313675 () Bool)

(assert (=> b!541709 (= e!313675 (= (select (arr!16450 a!3154) (index!21682 lt!247762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541710 () Bool)

(declare-fun e!313676 () SeekEntryResult!4864)

(declare-fun e!313677 () SeekEntryResult!4864)

(assert (=> b!541710 (= e!313676 e!313677)))

(declare-fun lt!247761 () (_ BitVec 64))

(declare-fun c!62982 () Bool)

(assert (=> b!541710 (= c!62982 (or (= lt!247761 (select (arr!16450 a!3154) j!147)) (= (bvadd lt!247761 lt!247761) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541711 () Bool)

(assert (=> b!541711 (and (bvsge (index!21682 lt!247762) #b00000000000000000000000000000000) (bvslt (index!21682 lt!247762) (size!16814 a!3154)))))

(declare-fun res!336380 () Bool)

(assert (=> b!541711 (= res!336380 (= (select (arr!16450 a!3154) (index!21682 lt!247762)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541711 (=> res!336380 e!313675)))

(declare-fun b!541712 () Bool)

(assert (=> b!541712 (= e!313677 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16450 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16450 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541713 () Bool)

(assert (=> b!541713 (= e!313676 (Intermediate!4864 true (toIndex!0 (select (arr!16450 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541714 () Bool)

(assert (=> b!541714 (and (bvsge (index!21682 lt!247762) #b00000000000000000000000000000000) (bvslt (index!21682 lt!247762) (size!16814 a!3154)))))

(declare-fun res!336379 () Bool)

(assert (=> b!541714 (= res!336379 (= (select (arr!16450 a!3154) (index!21682 lt!247762)) (select (arr!16450 a!3154) j!147)))))

(assert (=> b!541714 (=> res!336379 e!313675)))

(declare-fun e!313674 () Bool)

(assert (=> b!541714 (= e!313674 e!313675)))

(declare-fun d!81881 () Bool)

(declare-fun e!313673 () Bool)

(assert (=> d!81881 e!313673))

(declare-fun c!62983 () Bool)

(assert (=> d!81881 (= c!62983 (and ((_ is Intermediate!4864) lt!247762) (undefined!5676 lt!247762)))))

(assert (=> d!81881 (= lt!247762 e!313676)))

(declare-fun c!62984 () Bool)

(assert (=> d!81881 (= c!62984 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81881 (= lt!247761 (select (arr!16450 a!3154) (toIndex!0 (select (arr!16450 a!3154) j!147) mask!3216)))))

(assert (=> d!81881 (validMask!0 mask!3216)))

(assert (=> d!81881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16450 a!3154) j!147) mask!3216) (select (arr!16450 a!3154) j!147) a!3154 mask!3216) lt!247762)))

(declare-fun b!541715 () Bool)

(assert (=> b!541715 (= e!313673 e!313674)))

(declare-fun res!336381 () Bool)

(assert (=> b!541715 (= res!336381 (and ((_ is Intermediate!4864) lt!247762) (not (undefined!5676 lt!247762)) (bvslt (x!50742 lt!247762) #b01111111111111111111111111111110) (bvsge (x!50742 lt!247762) #b00000000000000000000000000000000) (bvsge (x!50742 lt!247762) #b00000000000000000000000000000000)))))

(assert (=> b!541715 (=> (not res!336381) (not e!313674))))

(declare-fun b!541716 () Bool)

(assert (=> b!541716 (= e!313677 (Intermediate!4864 false (toIndex!0 (select (arr!16450 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541717 () Bool)

(assert (=> b!541717 (= e!313673 (bvsge (x!50742 lt!247762) #b01111111111111111111111111111110))))

(assert (= (and d!81881 c!62984) b!541713))

(assert (= (and d!81881 (not c!62984)) b!541710))

(assert (= (and b!541710 c!62982) b!541716))

(assert (= (and b!541710 (not c!62982)) b!541712))

(assert (= (and d!81881 c!62983) b!541717))

(assert (= (and d!81881 (not c!62983)) b!541715))

(assert (= (and b!541715 res!336381) b!541714))

(assert (= (and b!541714 (not res!336379)) b!541711))

(assert (= (and b!541711 (not res!336380)) b!541709))

(assert (=> b!541712 m!520181))

(declare-fun m!520347 () Bool)

(assert (=> b!541712 m!520347))

(assert (=> b!541712 m!520347))

(assert (=> b!541712 m!520179))

(declare-fun m!520349 () Bool)

(assert (=> b!541712 m!520349))

(declare-fun m!520351 () Bool)

(assert (=> b!541711 m!520351))

(assert (=> b!541709 m!520351))

(assert (=> b!541714 m!520351))

(assert (=> d!81881 m!520181))

(declare-fun m!520353 () Bool)

(assert (=> d!81881 m!520353))

(assert (=> d!81881 m!520197))

(assert (=> b!541468 d!81881))

(declare-fun d!81885 () Bool)

(declare-fun lt!247774 () (_ BitVec 32))

(declare-fun lt!247773 () (_ BitVec 32))

(assert (=> d!81885 (= lt!247774 (bvmul (bvxor lt!247773 (bvlshr lt!247773 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81885 (= lt!247773 ((_ extract 31 0) (bvand (bvxor (select (arr!16450 a!3154) j!147) (bvlshr (select (arr!16450 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81885 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336382 (let ((h!11429 ((_ extract 31 0) (bvand (bvxor (select (arr!16450 a!3154) j!147) (bvlshr (select (arr!16450 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50750 (bvmul (bvxor h!11429 (bvlshr h!11429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50750 (bvlshr x!50750 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336382 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336382 #b00000000000000000000000000000000))))))

(assert (=> d!81885 (= (toIndex!0 (select (arr!16450 a!3154) j!147) mask!3216) (bvand (bvxor lt!247774 (bvlshr lt!247774 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!541468 d!81885))

(declare-fun d!81889 () Bool)

(declare-fun res!336396 () Bool)

(declare-fun e!313696 () Bool)

(assert (=> d!81889 (=> res!336396 e!313696)))

(assert (=> d!81889 (= res!336396 (bvsge #b00000000000000000000000000000000 (size!16814 a!3154)))))

(assert (=> d!81889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313696)))

(declare-fun b!541741 () Bool)

(declare-fun e!313697 () Bool)

(declare-fun call!32049 () Bool)

(assert (=> b!541741 (= e!313697 call!32049)))

(declare-fun bm!32046 () Bool)

(assert (=> bm!32046 (= call!32049 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!541742 () Bool)

(declare-fun e!313698 () Bool)

(assert (=> b!541742 (= e!313698 e!313697)))

(declare-fun lt!247782 () (_ BitVec 64))

(assert (=> b!541742 (= lt!247782 (select (arr!16450 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16871 0))(
  ( (Unit!16872) )
))
(declare-fun lt!247783 () Unit!16871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34232 (_ BitVec 64) (_ BitVec 32)) Unit!16871)

(assert (=> b!541742 (= lt!247783 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247782 #b00000000000000000000000000000000))))

(assert (=> b!541742 (arrayContainsKey!0 a!3154 lt!247782 #b00000000000000000000000000000000)))

(declare-fun lt!247781 () Unit!16871)

(assert (=> b!541742 (= lt!247781 lt!247783)))

(declare-fun res!336397 () Bool)

(assert (=> b!541742 (= res!336397 (= (seekEntryOrOpen!0 (select (arr!16450 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4864 #b00000000000000000000000000000000)))))

(assert (=> b!541742 (=> (not res!336397) (not e!313697))))

(declare-fun b!541743 () Bool)

(assert (=> b!541743 (= e!313698 call!32049)))

(declare-fun b!541744 () Bool)

(assert (=> b!541744 (= e!313696 e!313698)))

(declare-fun c!62990 () Bool)

(assert (=> b!541744 (= c!62990 (validKeyInArray!0 (select (arr!16450 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81889 (not res!336396)) b!541744))

(assert (= (and b!541744 c!62990) b!541742))

(assert (= (and b!541744 (not c!62990)) b!541743))

(assert (= (and b!541742 res!336397) b!541741))

(assert (= (or b!541741 b!541743) bm!32046))

(declare-fun m!520359 () Bool)

(assert (=> bm!32046 m!520359))

(assert (=> b!541742 m!520261))

(declare-fun m!520361 () Bool)

(assert (=> b!541742 m!520361))

(declare-fun m!520363 () Bool)

(assert (=> b!541742 m!520363))

(assert (=> b!541742 m!520261))

(declare-fun m!520365 () Bool)

(assert (=> b!541742 m!520365))

(assert (=> b!541744 m!520261))

(assert (=> b!541744 m!520261))

(assert (=> b!541744 m!520269))

(assert (=> b!541461 d!81889))

(declare-fun d!81899 () Bool)

(assert (=> d!81899 (= (validKeyInArray!0 (select (arr!16450 a!3154) j!147)) (and (not (= (select (arr!16450 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16450 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541459 d!81899))

(declare-fun d!81901 () Bool)

(assert (=> d!81901 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541465 d!81901))

(check-sat (not b!541554) (not bm!32046) (not b!541552) (not d!81859) (not b!541742) (not b!541540) (not b!541604) (not d!81881) (not b!541694) (not b!541553) (not b!541712) (not bm!32037) (not d!81871) (not b!541744))
(check-sat)
