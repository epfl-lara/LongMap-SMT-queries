; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49130 () Bool)

(assert start!49130)

(declare-fun b!541291 () Bool)

(declare-fun res!336181 () Bool)

(declare-fun e!313424 () Bool)

(assert (=> b!541291 (=> (not res!336181) (not e!313424))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541291 (= res!336181 (validKeyInArray!0 k0!1998))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun b!541292 () Bool)

(declare-datatypes ((array!34240 0))(
  ( (array!34241 (arr!16456 (Array (_ BitVec 32) (_ BitVec 64))) (size!16820 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34240)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun e!313423 () Bool)

(assert (=> b!541292 (= e!313423 (and (not (= (select (arr!16456 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16456 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16456 a!3154) index!1177) (select (arr!16456 a!3154) j!147)) (not (= index!1177 resIndex!32))))))

(declare-fun b!541293 () Bool)

(declare-fun res!336187 () Bool)

(declare-fun e!313425 () Bool)

(assert (=> b!541293 (=> (not res!336187) (not e!313425))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34240 (_ BitVec 32)) Bool)

(assert (=> b!541293 (= res!336187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541294 () Bool)

(assert (=> b!541294 (= e!313425 e!313423)))

(declare-fun res!336178 () Bool)

(assert (=> b!541294 (=> (not res!336178) (not e!313423))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4914 0))(
  ( (MissingZero!4914 (index!21880 (_ BitVec 32))) (Found!4914 (index!21881 (_ BitVec 32))) (Intermediate!4914 (undefined!5726 Bool) (index!21882 (_ BitVec 32)) (x!50789 (_ BitVec 32))) (Undefined!4914) (MissingVacant!4914 (index!21883 (_ BitVec 32))) )
))
(declare-fun lt!247590 () SeekEntryResult!4914)

(assert (=> b!541294 (= res!336178 (= lt!247590 (Intermediate!4914 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34240 (_ BitVec 32)) SeekEntryResult!4914)

(assert (=> b!541294 (= lt!247590 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16456 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541295 () Bool)

(declare-fun res!336179 () Bool)

(assert (=> b!541295 (=> (not res!336179) (not e!313425))))

(declare-datatypes ((List!10575 0))(
  ( (Nil!10572) (Cons!10571 (h!11520 (_ BitVec 64)) (t!16803 List!10575)) )
))
(declare-fun arrayNoDuplicates!0 (array!34240 (_ BitVec 32) List!10575) Bool)

(assert (=> b!541295 (= res!336179 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10572))))

(declare-fun b!541296 () Bool)

(declare-fun res!336186 () Bool)

(assert (=> b!541296 (=> (not res!336186) (not e!313423))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541296 (= res!336186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16456 a!3154) j!147) mask!3216) (select (arr!16456 a!3154) j!147) a!3154 mask!3216) lt!247590))))

(declare-fun b!541298 () Bool)

(assert (=> b!541298 (= e!313424 e!313425)))

(declare-fun res!336180 () Bool)

(assert (=> b!541298 (=> (not res!336180) (not e!313425))))

(declare-fun lt!247591 () SeekEntryResult!4914)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541298 (= res!336180 (or (= lt!247591 (MissingZero!4914 i!1153)) (= lt!247591 (MissingVacant!4914 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34240 (_ BitVec 32)) SeekEntryResult!4914)

(assert (=> b!541298 (= lt!247591 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541299 () Bool)

(declare-fun res!336184 () Bool)

(assert (=> b!541299 (=> (not res!336184) (not e!313425))))

(assert (=> b!541299 (= res!336184 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16820 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16820 a!3154)) (= (select (arr!16456 a!3154) resIndex!32) (select (arr!16456 a!3154) j!147))))))

(declare-fun b!541300 () Bool)

(declare-fun res!336183 () Bool)

(assert (=> b!541300 (=> (not res!336183) (not e!313424))))

(declare-fun arrayContainsKey!0 (array!34240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541300 (= res!336183 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541301 () Bool)

(declare-fun res!336188 () Bool)

(assert (=> b!541301 (=> (not res!336188) (not e!313424))))

(assert (=> b!541301 (= res!336188 (validKeyInArray!0 (select (arr!16456 a!3154) j!147)))))

(declare-fun b!541297 () Bool)

(declare-fun res!336182 () Bool)

(assert (=> b!541297 (=> (not res!336182) (not e!313424))))

(assert (=> b!541297 (= res!336182 (and (= (size!16820 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16820 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16820 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!336185 () Bool)

(assert (=> start!49130 (=> (not res!336185) (not e!313424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49130 (= res!336185 (validMask!0 mask!3216))))

(assert (=> start!49130 e!313424))

(assert (=> start!49130 true))

(declare-fun array_inv!12252 (array!34240) Bool)

(assert (=> start!49130 (array_inv!12252 a!3154)))

(assert (= (and start!49130 res!336185) b!541297))

(assert (= (and b!541297 res!336182) b!541301))

(assert (= (and b!541301 res!336188) b!541291))

(assert (= (and b!541291 res!336181) b!541300))

(assert (= (and b!541300 res!336183) b!541298))

(assert (= (and b!541298 res!336180) b!541293))

(assert (= (and b!541293 res!336187) b!541295))

(assert (= (and b!541295 res!336179) b!541299))

(assert (= (and b!541299 res!336184) b!541294))

(assert (= (and b!541294 res!336178) b!541296))

(assert (= (and b!541296 res!336186) b!541292))

(declare-fun m!519883 () Bool)

(assert (=> b!541293 m!519883))

(declare-fun m!519885 () Bool)

(assert (=> b!541301 m!519885))

(assert (=> b!541301 m!519885))

(declare-fun m!519887 () Bool)

(assert (=> b!541301 m!519887))

(declare-fun m!519889 () Bool)

(assert (=> b!541298 m!519889))

(declare-fun m!519891 () Bool)

(assert (=> b!541300 m!519891))

(declare-fun m!519893 () Bool)

(assert (=> start!49130 m!519893))

(declare-fun m!519895 () Bool)

(assert (=> start!49130 m!519895))

(declare-fun m!519897 () Bool)

(assert (=> b!541292 m!519897))

(assert (=> b!541292 m!519885))

(declare-fun m!519899 () Bool)

(assert (=> b!541299 m!519899))

(assert (=> b!541299 m!519885))

(declare-fun m!519901 () Bool)

(assert (=> b!541291 m!519901))

(assert (=> b!541296 m!519885))

(assert (=> b!541296 m!519885))

(declare-fun m!519903 () Bool)

(assert (=> b!541296 m!519903))

(assert (=> b!541296 m!519903))

(assert (=> b!541296 m!519885))

(declare-fun m!519905 () Bool)

(assert (=> b!541296 m!519905))

(declare-fun m!519907 () Bool)

(assert (=> b!541295 m!519907))

(assert (=> b!541294 m!519885))

(assert (=> b!541294 m!519885))

(declare-fun m!519909 () Bool)

(assert (=> b!541294 m!519909))

(check-sat (not b!541301) (not start!49130) (not b!541293) (not b!541296) (not b!541298) (not b!541291) (not b!541294) (not b!541300) (not b!541295))
(check-sat)
(get-model)

(declare-fun b!541353 () Bool)

(declare-fun lt!247603 () SeekEntryResult!4914)

(assert (=> b!541353 (and (bvsge (index!21882 lt!247603) #b00000000000000000000000000000000) (bvslt (index!21882 lt!247603) (size!16820 a!3154)))))

(declare-fun res!336229 () Bool)

(assert (=> b!541353 (= res!336229 (= (select (arr!16456 a!3154) (index!21882 lt!247603)) (select (arr!16456 a!3154) j!147)))))

(declare-fun e!313452 () Bool)

(assert (=> b!541353 (=> res!336229 e!313452)))

(declare-fun e!313450 () Bool)

(assert (=> b!541353 (= e!313450 e!313452)))

(declare-fun d!81747 () Bool)

(declare-fun e!313451 () Bool)

(assert (=> d!81747 e!313451))

(declare-fun c!62877 () Bool)

(get-info :version)

(assert (=> d!81747 (= c!62877 (and ((_ is Intermediate!4914) lt!247603) (undefined!5726 lt!247603)))))

(declare-fun e!313449 () SeekEntryResult!4914)

(assert (=> d!81747 (= lt!247603 e!313449)))

(declare-fun c!62879 () Bool)

(assert (=> d!81747 (= c!62879 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!247602 () (_ BitVec 64))

(assert (=> d!81747 (= lt!247602 (select (arr!16456 a!3154) index!1177))))

(assert (=> d!81747 (validMask!0 mask!3216)))

(assert (=> d!81747 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16456 a!3154) j!147) a!3154 mask!3216) lt!247603)))

(declare-fun b!541354 () Bool)

(declare-fun e!313448 () SeekEntryResult!4914)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541354 (= e!313448 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16456 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541355 () Bool)

(assert (=> b!541355 (and (bvsge (index!21882 lt!247603) #b00000000000000000000000000000000) (bvslt (index!21882 lt!247603) (size!16820 a!3154)))))

(declare-fun res!336230 () Bool)

(assert (=> b!541355 (= res!336230 (= (select (arr!16456 a!3154) (index!21882 lt!247603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541355 (=> res!336230 e!313452)))

(declare-fun b!541356 () Bool)

(assert (=> b!541356 (= e!313451 (bvsge (x!50789 lt!247603) #b01111111111111111111111111111110))))

(declare-fun b!541357 () Bool)

(assert (=> b!541357 (= e!313449 e!313448)))

(declare-fun c!62878 () Bool)

(assert (=> b!541357 (= c!62878 (or (= lt!247602 (select (arr!16456 a!3154) j!147)) (= (bvadd lt!247602 lt!247602) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541358 () Bool)

(assert (=> b!541358 (= e!313448 (Intermediate!4914 false index!1177 x!1030))))

(declare-fun b!541359 () Bool)

(assert (=> b!541359 (and (bvsge (index!21882 lt!247603) #b00000000000000000000000000000000) (bvslt (index!21882 lt!247603) (size!16820 a!3154)))))

(assert (=> b!541359 (= e!313452 (= (select (arr!16456 a!3154) (index!21882 lt!247603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541360 () Bool)

(assert (=> b!541360 (= e!313451 e!313450)))

(declare-fun res!336228 () Bool)

(assert (=> b!541360 (= res!336228 (and ((_ is Intermediate!4914) lt!247603) (not (undefined!5726 lt!247603)) (bvslt (x!50789 lt!247603) #b01111111111111111111111111111110) (bvsge (x!50789 lt!247603) #b00000000000000000000000000000000) (bvsge (x!50789 lt!247603) x!1030)))))

(assert (=> b!541360 (=> (not res!336228) (not e!313450))))

(declare-fun b!541361 () Bool)

(assert (=> b!541361 (= e!313449 (Intermediate!4914 true index!1177 x!1030))))

(assert (= (and d!81747 c!62879) b!541361))

(assert (= (and d!81747 (not c!62879)) b!541357))

(assert (= (and b!541357 c!62878) b!541358))

(assert (= (and b!541357 (not c!62878)) b!541354))

(assert (= (and d!81747 c!62877) b!541356))

(assert (= (and d!81747 (not c!62877)) b!541360))

(assert (= (and b!541360 res!336228) b!541353))

(assert (= (and b!541353 (not res!336229)) b!541355))

(assert (= (and b!541355 (not res!336230)) b!541359))

(declare-fun m!519939 () Bool)

(assert (=> b!541354 m!519939))

(assert (=> b!541354 m!519939))

(assert (=> b!541354 m!519885))

(declare-fun m!519941 () Bool)

(assert (=> b!541354 m!519941))

(declare-fun m!519943 () Bool)

(assert (=> b!541355 m!519943))

(assert (=> b!541359 m!519943))

(assert (=> d!81747 m!519897))

(assert (=> d!81747 m!519893))

(assert (=> b!541353 m!519943))

(assert (=> b!541294 d!81747))

(declare-fun lt!247625 () SeekEntryResult!4914)

(declare-fun b!541421 () Bool)

(declare-fun e!313490 () SeekEntryResult!4914)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34240 (_ BitVec 32)) SeekEntryResult!4914)

(assert (=> b!541421 (= e!313490 (seekKeyOrZeroReturnVacant!0 (x!50789 lt!247625) (index!21882 lt!247625) (index!21882 lt!247625) k0!1998 a!3154 mask!3216))))

(declare-fun b!541422 () Bool)

(declare-fun e!313492 () SeekEntryResult!4914)

(declare-fun e!313489 () SeekEntryResult!4914)

(assert (=> b!541422 (= e!313492 e!313489)))

(declare-fun lt!247623 () (_ BitVec 64))

(assert (=> b!541422 (= lt!247623 (select (arr!16456 a!3154) (index!21882 lt!247625)))))

(declare-fun c!62900 () Bool)

(assert (=> b!541422 (= c!62900 (= lt!247623 k0!1998))))

(declare-fun b!541423 () Bool)

(assert (=> b!541423 (= e!313490 (MissingZero!4914 (index!21882 lt!247625)))))

(declare-fun b!541424 () Bool)

(declare-fun c!62902 () Bool)

(assert (=> b!541424 (= c!62902 (= lt!247623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541424 (= e!313489 e!313490)))

(declare-fun b!541425 () Bool)

(assert (=> b!541425 (= e!313492 Undefined!4914)))

(declare-fun b!541426 () Bool)

(assert (=> b!541426 (= e!313489 (Found!4914 (index!21882 lt!247625)))))

(declare-fun d!81753 () Bool)

(declare-fun lt!247624 () SeekEntryResult!4914)

(assert (=> d!81753 (and (or ((_ is Undefined!4914) lt!247624) (not ((_ is Found!4914) lt!247624)) (and (bvsge (index!21881 lt!247624) #b00000000000000000000000000000000) (bvslt (index!21881 lt!247624) (size!16820 a!3154)))) (or ((_ is Undefined!4914) lt!247624) ((_ is Found!4914) lt!247624) (not ((_ is MissingZero!4914) lt!247624)) (and (bvsge (index!21880 lt!247624) #b00000000000000000000000000000000) (bvslt (index!21880 lt!247624) (size!16820 a!3154)))) (or ((_ is Undefined!4914) lt!247624) ((_ is Found!4914) lt!247624) ((_ is MissingZero!4914) lt!247624) (not ((_ is MissingVacant!4914) lt!247624)) (and (bvsge (index!21883 lt!247624) #b00000000000000000000000000000000) (bvslt (index!21883 lt!247624) (size!16820 a!3154)))) (or ((_ is Undefined!4914) lt!247624) (ite ((_ is Found!4914) lt!247624) (= (select (arr!16456 a!3154) (index!21881 lt!247624)) k0!1998) (ite ((_ is MissingZero!4914) lt!247624) (= (select (arr!16456 a!3154) (index!21880 lt!247624)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4914) lt!247624) (= (select (arr!16456 a!3154) (index!21883 lt!247624)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81753 (= lt!247624 e!313492)))

(declare-fun c!62904 () Bool)

(assert (=> d!81753 (= c!62904 (and ((_ is Intermediate!4914) lt!247625) (undefined!5726 lt!247625)))))

(assert (=> d!81753 (= lt!247625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81753 (validMask!0 mask!3216)))

(assert (=> d!81753 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247624)))

(assert (= (and d!81753 c!62904) b!541425))

(assert (= (and d!81753 (not c!62904)) b!541422))

(assert (= (and b!541422 c!62900) b!541426))

(assert (= (and b!541422 (not c!62900)) b!541424))

(assert (= (and b!541424 c!62902) b!541423))

(assert (= (and b!541424 (not c!62902)) b!541421))

(declare-fun m!519967 () Bool)

(assert (=> b!541421 m!519967))

(declare-fun m!519969 () Bool)

(assert (=> b!541422 m!519969))

(declare-fun m!519971 () Bool)

(assert (=> d!81753 m!519971))

(assert (=> d!81753 m!519893))

(declare-fun m!519973 () Bool)

(assert (=> d!81753 m!519973))

(declare-fun m!519975 () Bool)

(assert (=> d!81753 m!519975))

(declare-fun m!519977 () Bool)

(assert (=> d!81753 m!519977))

(declare-fun m!519979 () Bool)

(assert (=> d!81753 m!519979))

(assert (=> d!81753 m!519973))

(assert (=> b!541298 d!81753))

(declare-fun bm!32039 () Bool)

(declare-fun call!32042 () Bool)

(assert (=> bm!32039 (= call!32042 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!541464 () Bool)

(declare-fun e!313518 () Bool)

(declare-fun e!313517 () Bool)

(assert (=> b!541464 (= e!313518 e!313517)))

(declare-fun c!62915 () Bool)

(assert (=> b!541464 (= c!62915 (validKeyInArray!0 (select (arr!16456 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541465 () Bool)

(declare-fun e!313516 () Bool)

(assert (=> b!541465 (= e!313516 call!32042)))

(declare-fun b!541466 () Bool)

(assert (=> b!541466 (= e!313517 e!313516)))

(declare-fun lt!247634 () (_ BitVec 64))

(assert (=> b!541466 (= lt!247634 (select (arr!16456 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16896 0))(
  ( (Unit!16897) )
))
(declare-fun lt!247635 () Unit!16896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34240 (_ BitVec 64) (_ BitVec 32)) Unit!16896)

(assert (=> b!541466 (= lt!247635 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247634 #b00000000000000000000000000000000))))

(assert (=> b!541466 (arrayContainsKey!0 a!3154 lt!247634 #b00000000000000000000000000000000)))

(declare-fun lt!247636 () Unit!16896)

(assert (=> b!541466 (= lt!247636 lt!247635)))

(declare-fun res!336263 () Bool)

(assert (=> b!541466 (= res!336263 (= (seekEntryOrOpen!0 (select (arr!16456 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4914 #b00000000000000000000000000000000)))))

(assert (=> b!541466 (=> (not res!336263) (not e!313516))))

(declare-fun d!81759 () Bool)

(declare-fun res!336264 () Bool)

(assert (=> d!81759 (=> res!336264 e!313518)))

(assert (=> d!81759 (= res!336264 (bvsge #b00000000000000000000000000000000 (size!16820 a!3154)))))

(assert (=> d!81759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313518)))

(declare-fun b!541463 () Bool)

(assert (=> b!541463 (= e!313517 call!32042)))

(assert (= (and d!81759 (not res!336264)) b!541464))

(assert (= (and b!541464 c!62915) b!541466))

(assert (= (and b!541464 (not c!62915)) b!541463))

(assert (= (and b!541466 res!336263) b!541465))

(assert (= (or b!541465 b!541463) bm!32039))

(declare-fun m!519997 () Bool)

(assert (=> bm!32039 m!519997))

(declare-fun m!519999 () Bool)

(assert (=> b!541464 m!519999))

(assert (=> b!541464 m!519999))

(declare-fun m!520001 () Bool)

(assert (=> b!541464 m!520001))

(assert (=> b!541466 m!519999))

(declare-fun m!520003 () Bool)

(assert (=> b!541466 m!520003))

(declare-fun m!520005 () Bool)

(assert (=> b!541466 m!520005))

(assert (=> b!541466 m!519999))

(declare-fun m!520007 () Bool)

(assert (=> b!541466 m!520007))

(assert (=> b!541293 d!81759))

(declare-fun b!541467 () Bool)

(declare-fun lt!247642 () SeekEntryResult!4914)

(assert (=> b!541467 (and (bvsge (index!21882 lt!247642) #b00000000000000000000000000000000) (bvslt (index!21882 lt!247642) (size!16820 a!3154)))))

(declare-fun res!336266 () Bool)

(assert (=> b!541467 (= res!336266 (= (select (arr!16456 a!3154) (index!21882 lt!247642)) (select (arr!16456 a!3154) j!147)))))

(declare-fun e!313523 () Bool)

(assert (=> b!541467 (=> res!336266 e!313523)))

(declare-fun e!313521 () Bool)

(assert (=> b!541467 (= e!313521 e!313523)))

(declare-fun d!81765 () Bool)

(declare-fun e!313522 () Bool)

(assert (=> d!81765 e!313522))

(declare-fun c!62916 () Bool)

(assert (=> d!81765 (= c!62916 (and ((_ is Intermediate!4914) lt!247642) (undefined!5726 lt!247642)))))

(declare-fun e!313520 () SeekEntryResult!4914)

(assert (=> d!81765 (= lt!247642 e!313520)))

(declare-fun c!62918 () Bool)

(assert (=> d!81765 (= c!62918 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!247641 () (_ BitVec 64))

(assert (=> d!81765 (= lt!247641 (select (arr!16456 a!3154) (toIndex!0 (select (arr!16456 a!3154) j!147) mask!3216)))))

(assert (=> d!81765 (validMask!0 mask!3216)))

(assert (=> d!81765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16456 a!3154) j!147) mask!3216) (select (arr!16456 a!3154) j!147) a!3154 mask!3216) lt!247642)))

(declare-fun e!313519 () SeekEntryResult!4914)

(declare-fun b!541468 () Bool)

(assert (=> b!541468 (= e!313519 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16456 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16456 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541469 () Bool)

(assert (=> b!541469 (and (bvsge (index!21882 lt!247642) #b00000000000000000000000000000000) (bvslt (index!21882 lt!247642) (size!16820 a!3154)))))

(declare-fun res!336267 () Bool)

(assert (=> b!541469 (= res!336267 (= (select (arr!16456 a!3154) (index!21882 lt!247642)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541469 (=> res!336267 e!313523)))

(declare-fun b!541470 () Bool)

(assert (=> b!541470 (= e!313522 (bvsge (x!50789 lt!247642) #b01111111111111111111111111111110))))

(declare-fun b!541471 () Bool)

(assert (=> b!541471 (= e!313520 e!313519)))

(declare-fun c!62917 () Bool)

(assert (=> b!541471 (= c!62917 (or (= lt!247641 (select (arr!16456 a!3154) j!147)) (= (bvadd lt!247641 lt!247641) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541472 () Bool)

(assert (=> b!541472 (= e!313519 (Intermediate!4914 false (toIndex!0 (select (arr!16456 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541473 () Bool)

(assert (=> b!541473 (and (bvsge (index!21882 lt!247642) #b00000000000000000000000000000000) (bvslt (index!21882 lt!247642) (size!16820 a!3154)))))

(assert (=> b!541473 (= e!313523 (= (select (arr!16456 a!3154) (index!21882 lt!247642)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541474 () Bool)

(assert (=> b!541474 (= e!313522 e!313521)))

(declare-fun res!336265 () Bool)

(assert (=> b!541474 (= res!336265 (and ((_ is Intermediate!4914) lt!247642) (not (undefined!5726 lt!247642)) (bvslt (x!50789 lt!247642) #b01111111111111111111111111111110) (bvsge (x!50789 lt!247642) #b00000000000000000000000000000000) (bvsge (x!50789 lt!247642) #b00000000000000000000000000000000)))))

(assert (=> b!541474 (=> (not res!336265) (not e!313521))))

(declare-fun b!541475 () Bool)

(assert (=> b!541475 (= e!313520 (Intermediate!4914 true (toIndex!0 (select (arr!16456 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(assert (= (and d!81765 c!62918) b!541475))

(assert (= (and d!81765 (not c!62918)) b!541471))

(assert (= (and b!541471 c!62917) b!541472))

(assert (= (and b!541471 (not c!62917)) b!541468))

(assert (= (and d!81765 c!62916) b!541470))

(assert (= (and d!81765 (not c!62916)) b!541474))

(assert (= (and b!541474 res!336265) b!541467))

(assert (= (and b!541467 (not res!336266)) b!541469))

(assert (= (and b!541469 (not res!336267)) b!541473))

(assert (=> b!541468 m!519903))

(declare-fun m!520009 () Bool)

(assert (=> b!541468 m!520009))

(assert (=> b!541468 m!520009))

(assert (=> b!541468 m!519885))

(declare-fun m!520011 () Bool)

(assert (=> b!541468 m!520011))

(declare-fun m!520013 () Bool)

(assert (=> b!541469 m!520013))

(assert (=> b!541473 m!520013))

(assert (=> d!81765 m!519903))

(declare-fun m!520015 () Bool)

(assert (=> d!81765 m!520015))

(assert (=> d!81765 m!519893))

(assert (=> b!541467 m!520013))

(assert (=> b!541296 d!81765))

(declare-fun d!81769 () Bool)

(declare-fun lt!247650 () (_ BitVec 32))

(declare-fun lt!247649 () (_ BitVec 32))

(assert (=> d!81769 (= lt!247650 (bvmul (bvxor lt!247649 (bvlshr lt!247649 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81769 (= lt!247649 ((_ extract 31 0) (bvand (bvxor (select (arr!16456 a!3154) j!147) (bvlshr (select (arr!16456 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81769 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336268 (let ((h!11523 ((_ extract 31 0) (bvand (bvxor (select (arr!16456 a!3154) j!147) (bvlshr (select (arr!16456 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50794 (bvmul (bvxor h!11523 (bvlshr h!11523 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50794 (bvlshr x!50794 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336268 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336268 #b00000000000000000000000000000000))))))

(assert (=> d!81769 (= (toIndex!0 (select (arr!16456 a!3154) j!147) mask!3216) (bvand (bvxor lt!247650 (bvlshr lt!247650 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!541296 d!81769))

(declare-fun d!81777 () Bool)

(assert (=> d!81777 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541291 d!81777))

(declare-fun d!81781 () Bool)

(assert (=> d!81781 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49130 d!81781))

(declare-fun d!81791 () Bool)

(assert (=> d!81791 (= (array_inv!12252 a!3154) (bvsge (size!16820 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49130 d!81791))

(declare-fun d!81793 () Bool)

(declare-fun res!336282 () Bool)

(declare-fun e!313539 () Bool)

(assert (=> d!81793 (=> res!336282 e!313539)))

(assert (=> d!81793 (= res!336282 (= (select (arr!16456 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81793 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!313539)))

(declare-fun b!541495 () Bool)

(declare-fun e!313540 () Bool)

(assert (=> b!541495 (= e!313539 e!313540)))

(declare-fun res!336283 () Bool)

(assert (=> b!541495 (=> (not res!336283) (not e!313540))))

(assert (=> b!541495 (= res!336283 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16820 a!3154)))))

(declare-fun b!541496 () Bool)

(assert (=> b!541496 (= e!313540 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81793 (not res!336282)) b!541495))

(assert (= (and b!541495 res!336283) b!541496))

(assert (=> d!81793 m!519999))

(declare-fun m!520025 () Bool)

(assert (=> b!541496 m!520025))

(assert (=> b!541300 d!81793))

(declare-fun bm!32042 () Bool)

(declare-fun call!32045 () Bool)

(declare-fun c!62930 () Bool)

(assert (=> bm!32042 (= call!32045 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62930 (Cons!10571 (select (arr!16456 a!3154) #b00000000000000000000000000000000) Nil!10572) Nil!10572)))))

(declare-fun b!541526 () Bool)

(declare-fun e!313562 () Bool)

(declare-fun e!313559 () Bool)

(assert (=> b!541526 (= e!313562 e!313559)))

(assert (=> b!541526 (= c!62930 (validKeyInArray!0 (select (arr!16456 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541527 () Bool)

(declare-fun e!313560 () Bool)

(assert (=> b!541527 (= e!313560 e!313562)))

(declare-fun res!336298 () Bool)

(assert (=> b!541527 (=> (not res!336298) (not e!313562))))

(declare-fun e!313561 () Bool)

(assert (=> b!541527 (= res!336298 (not e!313561))))

(declare-fun res!336297 () Bool)

(assert (=> b!541527 (=> (not res!336297) (not e!313561))))

(assert (=> b!541527 (= res!336297 (validKeyInArray!0 (select (arr!16456 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81795 () Bool)

(declare-fun res!336296 () Bool)

(assert (=> d!81795 (=> res!336296 e!313560)))

(assert (=> d!81795 (= res!336296 (bvsge #b00000000000000000000000000000000 (size!16820 a!3154)))))

(assert (=> d!81795 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10572) e!313560)))

(declare-fun b!541525 () Bool)

(declare-fun contains!2801 (List!10575 (_ BitVec 64)) Bool)

(assert (=> b!541525 (= e!313561 (contains!2801 Nil!10572 (select (arr!16456 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541528 () Bool)

(assert (=> b!541528 (= e!313559 call!32045)))

(declare-fun b!541529 () Bool)

(assert (=> b!541529 (= e!313559 call!32045)))

(assert (= (and d!81795 (not res!336296)) b!541527))

(assert (= (and b!541527 res!336297) b!541525))

(assert (= (and b!541527 res!336298) b!541526))

(assert (= (and b!541526 c!62930) b!541529))

(assert (= (and b!541526 (not c!62930)) b!541528))

(assert (= (or b!541529 b!541528) bm!32042))

(assert (=> bm!32042 m!519999))

(declare-fun m!520027 () Bool)

(assert (=> bm!32042 m!520027))

(assert (=> b!541526 m!519999))

(assert (=> b!541526 m!519999))

(assert (=> b!541526 m!520001))

(assert (=> b!541527 m!519999))

(assert (=> b!541527 m!519999))

(assert (=> b!541527 m!520001))

(assert (=> b!541525 m!519999))

(assert (=> b!541525 m!519999))

(declare-fun m!520029 () Bool)

(assert (=> b!541525 m!520029))

(assert (=> b!541295 d!81795))

(declare-fun d!81797 () Bool)

(assert (=> d!81797 (= (validKeyInArray!0 (select (arr!16456 a!3154) j!147)) (and (not (= (select (arr!16456 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16456 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541301 d!81797))

(check-sat (not b!541464) (not d!81753) (not b!541466) (not b!541496) (not d!81747) (not b!541354) (not bm!32039) (not b!541468) (not b!541525) (not bm!32042) (not b!541421) (not b!541527) (not b!541526) (not d!81765))
(check-sat)
