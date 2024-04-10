; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49128 () Bool)

(assert start!49128)

(declare-fun b!541258 () Bool)

(declare-fun res!336146 () Bool)

(declare-fun e!313411 () Bool)

(assert (=> b!541258 (=> (not res!336146) (not e!313411))))

(declare-datatypes ((array!34238 0))(
  ( (array!34239 (arr!16455 (Array (_ BitVec 32) (_ BitVec 64))) (size!16819 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34238)

(declare-datatypes ((List!10574 0))(
  ( (Nil!10571) (Cons!10570 (h!11519 (_ BitVec 64)) (t!16802 List!10574)) )
))
(declare-fun arrayNoDuplicates!0 (array!34238 (_ BitVec 32) List!10574) Bool)

(assert (=> b!541258 (= res!336146 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10571))))

(declare-fun b!541259 () Bool)

(declare-fun e!313413 () Bool)

(assert (=> b!541259 (= e!313411 e!313413)))

(declare-fun res!336155 () Bool)

(assert (=> b!541259 (=> (not res!336155) (not e!313413))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4913 0))(
  ( (MissingZero!4913 (index!21876 (_ BitVec 32))) (Found!4913 (index!21877 (_ BitVec 32))) (Intermediate!4913 (undefined!5725 Bool) (index!21878 (_ BitVec 32)) (x!50788 (_ BitVec 32))) (Undefined!4913) (MissingVacant!4913 (index!21879 (_ BitVec 32))) )
))
(declare-fun lt!247585 () SeekEntryResult!4913)

(assert (=> b!541259 (= res!336155 (= lt!247585 (Intermediate!4913 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34238 (_ BitVec 32)) SeekEntryResult!4913)

(assert (=> b!541259 (= lt!247585 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16455 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541261 () Bool)

(declare-fun res!336150 () Bool)

(assert (=> b!541261 (=> (not res!336150) (not e!313411))))

(assert (=> b!541261 (= res!336150 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16819 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16819 a!3154)) (= (select (arr!16455 a!3154) resIndex!32) (select (arr!16455 a!3154) j!147))))))

(declare-fun b!541262 () Bool)

(declare-fun res!336153 () Bool)

(declare-fun e!313412 () Bool)

(assert (=> b!541262 (=> (not res!336153) (not e!313412))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541262 (= res!336153 (and (= (size!16819 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16819 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16819 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541263 () Bool)

(assert (=> b!541263 (= e!313412 e!313411)))

(declare-fun res!336149 () Bool)

(assert (=> b!541263 (=> (not res!336149) (not e!313411))))

(declare-fun lt!247584 () SeekEntryResult!4913)

(assert (=> b!541263 (= res!336149 (or (= lt!247584 (MissingZero!4913 i!1153)) (= lt!247584 (MissingVacant!4913 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34238 (_ BitVec 32)) SeekEntryResult!4913)

(assert (=> b!541263 (= lt!247584 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541264 () Bool)

(assert (=> b!541264 (= e!313413 (and (not (= (select (arr!16455 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16455 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16455 a!3154) index!1177) (select (arr!16455 a!3154) j!147)) (not (= index!1177 resIndex!32))))))

(declare-fun b!541260 () Bool)

(declare-fun res!336151 () Bool)

(assert (=> b!541260 (=> (not res!336151) (not e!313412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541260 (= res!336151 (validKeyInArray!0 (select (arr!16455 a!3154) j!147)))))

(declare-fun res!336148 () Bool)

(assert (=> start!49128 (=> (not res!336148) (not e!313412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49128 (= res!336148 (validMask!0 mask!3216))))

(assert (=> start!49128 e!313412))

(assert (=> start!49128 true))

(declare-fun array_inv!12251 (array!34238) Bool)

(assert (=> start!49128 (array_inv!12251 a!3154)))

(declare-fun b!541265 () Bool)

(declare-fun res!336147 () Bool)

(assert (=> b!541265 (=> (not res!336147) (not e!313411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34238 (_ BitVec 32)) Bool)

(assert (=> b!541265 (= res!336147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541266 () Bool)

(declare-fun res!336145 () Bool)

(assert (=> b!541266 (=> (not res!336145) (not e!313413))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541266 (= res!336145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16455 a!3154) j!147) mask!3216) (select (arr!16455 a!3154) j!147) a!3154 mask!3216) lt!247585))))

(declare-fun b!541267 () Bool)

(declare-fun res!336152 () Bool)

(assert (=> b!541267 (=> (not res!336152) (not e!313412))))

(assert (=> b!541267 (= res!336152 (validKeyInArray!0 k!1998))))

(declare-fun b!541268 () Bool)

(declare-fun res!336154 () Bool)

(assert (=> b!541268 (=> (not res!336154) (not e!313412))))

(declare-fun arrayContainsKey!0 (array!34238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541268 (= res!336154 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49128 res!336148) b!541262))

(assert (= (and b!541262 res!336153) b!541260))

(assert (= (and b!541260 res!336151) b!541267))

(assert (= (and b!541267 res!336152) b!541268))

(assert (= (and b!541268 res!336154) b!541263))

(assert (= (and b!541263 res!336149) b!541265))

(assert (= (and b!541265 res!336147) b!541258))

(assert (= (and b!541258 res!336146) b!541261))

(assert (= (and b!541261 res!336150) b!541259))

(assert (= (and b!541259 res!336155) b!541266))

(assert (= (and b!541266 res!336145) b!541264))

(declare-fun m!519855 () Bool)

(assert (=> b!541260 m!519855))

(assert (=> b!541260 m!519855))

(declare-fun m!519857 () Bool)

(assert (=> b!541260 m!519857))

(declare-fun m!519859 () Bool)

(assert (=> b!541261 m!519859))

(assert (=> b!541261 m!519855))

(declare-fun m!519861 () Bool)

(assert (=> start!49128 m!519861))

(declare-fun m!519863 () Bool)

(assert (=> start!49128 m!519863))

(declare-fun m!519865 () Bool)

(assert (=> b!541258 m!519865))

(assert (=> b!541259 m!519855))

(assert (=> b!541259 m!519855))

(declare-fun m!519867 () Bool)

(assert (=> b!541259 m!519867))

(declare-fun m!519869 () Bool)

(assert (=> b!541265 m!519869))

(declare-fun m!519871 () Bool)

(assert (=> b!541267 m!519871))

(assert (=> b!541266 m!519855))

(assert (=> b!541266 m!519855))

(declare-fun m!519873 () Bool)

(assert (=> b!541266 m!519873))

(assert (=> b!541266 m!519873))

(assert (=> b!541266 m!519855))

(declare-fun m!519875 () Bool)

(assert (=> b!541266 m!519875))

(declare-fun m!519877 () Bool)

(assert (=> b!541263 m!519877))

(declare-fun m!519879 () Bool)

(assert (=> b!541268 m!519879))

(declare-fun m!519881 () Bool)

(assert (=> b!541264 m!519881))

(assert (=> b!541264 m!519855))

(push 1)

(assert (not b!541258))

(assert (not b!541259))

(assert (not b!541267))

(assert (not b!541268))

(assert (not start!49128))

(assert (not b!541263))

(assert (not b!541266))

(assert (not b!541265))

(assert (not b!541260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!313471 () SeekEntryResult!4913)

(declare-fun lt!247612 () SeekEntryResult!4913)

(declare-fun b!541389 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34238 (_ BitVec 32)) SeekEntryResult!4913)

(assert (=> b!541389 (= e!313471 (seekKeyOrZeroReturnVacant!0 (x!50788 lt!247612) (index!21878 lt!247612) (index!21878 lt!247612) k!1998 a!3154 mask!3216))))

(declare-fun d!81749 () Bool)

(declare-fun lt!247610 () SeekEntryResult!4913)

(assert (=> d!81749 (and (or (is-Undefined!4913 lt!247610) (not (is-Found!4913 lt!247610)) (and (bvsge (index!21877 lt!247610) #b00000000000000000000000000000000) (bvslt (index!21877 lt!247610) (size!16819 a!3154)))) (or (is-Undefined!4913 lt!247610) (is-Found!4913 lt!247610) (not (is-MissingZero!4913 lt!247610)) (and (bvsge (index!21876 lt!247610) #b00000000000000000000000000000000) (bvslt (index!21876 lt!247610) (size!16819 a!3154)))) (or (is-Undefined!4913 lt!247610) (is-Found!4913 lt!247610) (is-MissingZero!4913 lt!247610) (not (is-MissingVacant!4913 lt!247610)) (and (bvsge (index!21879 lt!247610) #b00000000000000000000000000000000) (bvslt (index!21879 lt!247610) (size!16819 a!3154)))) (or (is-Undefined!4913 lt!247610) (ite (is-Found!4913 lt!247610) (= (select (arr!16455 a!3154) (index!21877 lt!247610)) k!1998) (ite (is-MissingZero!4913 lt!247610) (= (select (arr!16455 a!3154) (index!21876 lt!247610)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4913 lt!247610) (= (select (arr!16455 a!3154) (index!21879 lt!247610)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!313473 () SeekEntryResult!4913)

(assert (=> d!81749 (= lt!247610 e!313473)))

(declare-fun c!62890 () Bool)

(assert (=> d!81749 (= c!62890 (and (is-Intermediate!4913 lt!247612) (undefined!5725 lt!247612)))))

(assert (=> d!81749 (= lt!247612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81749 (validMask!0 mask!3216)))

(assert (=> d!81749 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!247610)))

(declare-fun b!541390 () Bool)

(declare-fun e!313472 () SeekEntryResult!4913)

(assert (=> b!541390 (= e!313472 (Found!4913 (index!21878 lt!247612)))))

(declare-fun b!541391 () Bool)

(assert (=> b!541391 (= e!313471 (MissingZero!4913 (index!21878 lt!247612)))))

(declare-fun b!541392 () Bool)

(declare-fun c!62891 () Bool)

(declare-fun lt!247611 () (_ BitVec 64))

(assert (=> b!541392 (= c!62891 (= lt!247611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541392 (= e!313472 e!313471)))

(declare-fun b!541393 () Bool)

(assert (=> b!541393 (= e!313473 e!313472)))

(assert (=> b!541393 (= lt!247611 (select (arr!16455 a!3154) (index!21878 lt!247612)))))

(declare-fun c!62889 () Bool)

(assert (=> b!541393 (= c!62889 (= lt!247611 k!1998))))

(declare-fun b!541394 () Bool)

(assert (=> b!541394 (= e!313473 Undefined!4913)))

(assert (= (and d!81749 c!62890) b!541394))

(assert (= (and d!81749 (not c!62890)) b!541393))

(assert (= (and b!541393 c!62889) b!541390))

(assert (= (and b!541393 (not c!62889)) b!541392))

(assert (= (and b!541392 c!62891) b!541391))

(assert (= (and b!541392 (not c!62891)) b!541389))

(declare-fun m!519953 () Bool)

(assert (=> b!541389 m!519953))

(assert (=> d!81749 m!519861))

(declare-fun m!519955 () Bool)

(assert (=> d!81749 m!519955))

(declare-fun m!519957 () Bool)

(assert (=> d!81749 m!519957))

(assert (=> d!81749 m!519955))

(declare-fun m!519959 () Bool)

(assert (=> d!81749 m!519959))

(declare-fun m!519961 () Bool)

(assert (=> d!81749 m!519961))

(declare-fun m!519963 () Bool)

(assert (=> d!81749 m!519963))

(declare-fun m!519965 () Bool)

(assert (=> b!541393 m!519965))

(assert (=> b!541263 d!81749))

(declare-fun bm!32036 () Bool)

(declare-fun call!32039 () Bool)

(declare-fun c!62909 () Bool)

(assert (=> bm!32036 (= call!32039 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62909 (Cons!10570 (select (arr!16455 a!3154) #b00000000000000000000000000000000) Nil!10571) Nil!10571)))))

(declare-fun b!541441 () Bool)

(declare-fun e!313501 () Bool)

(assert (=> b!541441 (= e!313501 call!32039)))

(declare-fun b!541442 () Bool)

(declare-fun e!313503 () Bool)

(declare-fun e!313502 () Bool)

(assert (=> b!541442 (= e!313503 e!313502)))

(declare-fun res!336252 () Bool)

(assert (=> b!541442 (=> (not res!336252) (not e!313502))))

(declare-fun e!313504 () Bool)

(assert (=> b!541442 (= res!336252 (not e!313504))))

(declare-fun res!336254 () Bool)

(assert (=> b!541442 (=> (not res!336254) (not e!313504))))

(assert (=> b!541442 (= res!336254 (validKeyInArray!0 (select (arr!16455 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81757 () Bool)

(declare-fun res!336253 () Bool)

(assert (=> d!81757 (=> res!336253 e!313503)))

(assert (=> d!81757 (= res!336253 (bvsge #b00000000000000000000000000000000 (size!16819 a!3154)))))

(assert (=> d!81757 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10571) e!313503)))

(declare-fun b!541443 () Bool)

(assert (=> b!541443 (= e!313502 e!313501)))

(assert (=> b!541443 (= c!62909 (validKeyInArray!0 (select (arr!16455 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541444 () Bool)

(declare-fun contains!2800 (List!10574 (_ BitVec 64)) Bool)

(assert (=> b!541444 (= e!313504 (contains!2800 Nil!10571 (select (arr!16455 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541445 () Bool)

(assert (=> b!541445 (= e!313501 call!32039)))

(assert (= (and d!81757 (not res!336253)) b!541442))

(assert (= (and b!541442 res!336254) b!541444))

(assert (= (and b!541442 res!336252) b!541443))

(assert (= (and b!541443 c!62909) b!541445))

(assert (= (and b!541443 (not c!62909)) b!541441))

(assert (= (or b!541445 b!541441) bm!32036))

(declare-fun m!519981 () Bool)

(assert (=> bm!32036 m!519981))

(declare-fun m!519983 () Bool)

(assert (=> bm!32036 m!519983))

(assert (=> b!541442 m!519981))

(assert (=> b!541442 m!519981))

(declare-fun m!519985 () Bool)

(assert (=> b!541442 m!519985))

(assert (=> b!541443 m!519981))

(assert (=> b!541443 m!519981))

(assert (=> b!541443 m!519985))

(assert (=> b!541444 m!519981))

(assert (=> b!541444 m!519981))

(declare-fun m!519987 () Bool)

(assert (=> b!541444 m!519987))

(assert (=> b!541258 d!81757))

(declare-fun d!81761 () Bool)

(assert (=> d!81761 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49128 d!81761))

(declare-fun d!81771 () Bool)

(assert (=> d!81771 (= (array_inv!12251 a!3154) (bvsge (size!16819 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49128 d!81771))

(declare-fun d!81773 () Bool)

(assert (=> d!81773 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541267 d!81773))

(declare-fun d!81775 () Bool)

(declare-fun res!336273 () Bool)

(declare-fun e!313528 () Bool)

(assert (=> d!81775 (=> res!336273 e!313528)))

(assert (=> d!81775 (= res!336273 (= (select (arr!16455 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81775 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!313528)))

(declare-fun b!541480 () Bool)

(declare-fun e!313529 () Bool)

(assert (=> b!541480 (= e!313528 e!313529)))

(declare-fun res!336274 () Bool)

(assert (=> b!541480 (=> (not res!336274) (not e!313529))))

(assert (=> b!541480 (= res!336274 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16819 a!3154)))))

(declare-fun b!541481 () Bool)

(assert (=> b!541481 (= e!313529 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81775 (not res!336273)) b!541480))

(assert (= (and b!541480 res!336274) b!541481))

(assert (=> d!81775 m!519981))

(declare-fun m!520017 () Bool)

(assert (=> b!541481 m!520017))

(assert (=> b!541268 d!81775))

(declare-fun b!541530 () Bool)

(declare-fun lt!247657 () SeekEntryResult!4913)

(assert (=> b!541530 (and (bvsge (index!21878 lt!247657) #b00000000000000000000000000000000) (bvslt (index!21878 lt!247657) (size!16819 a!3154)))))

(declare-fun res!336301 () Bool)

(assert (=> b!541530 (= res!336301 (= (select (arr!16455 a!3154) (index!21878 lt!247657)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313564 () Bool)

(assert (=> b!541530 (=> res!336301 e!313564)))

(declare-fun b!541531 () Bool)

(declare-fun e!313566 () SeekEntryResult!4913)

(assert (=> b!541531 (= e!313566 (Intermediate!4913 false (toIndex!0 (select (arr!16455 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541532 () Bool)

(assert (=> b!541532 (and (bvsge (index!21878 lt!247657) #b00000000000000000000000000000000) (bvslt (index!21878 lt!247657) (size!16819 a!3154)))))

(assert (=> b!541532 (= e!313564 (= (select (arr!16455 a!3154) (index!21878 lt!247657)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541533 () Bool)

(declare-fun e!313563 () Bool)

(declare-fun e!313567 () Bool)

(assert (=> b!541533 (= e!313563 e!313567)))

(declare-fun res!336299 () Bool)

(assert (=> b!541533 (= res!336299 (and (is-Intermediate!4913 lt!247657) (not (undefined!5725 lt!247657)) (bvslt (x!50788 lt!247657) #b01111111111111111111111111111110) (bvsge (x!50788 lt!247657) #b00000000000000000000000000000000) (bvsge (x!50788 lt!247657) #b00000000000000000000000000000000)))))

(assert (=> b!541533 (=> (not res!336299) (not e!313567))))

(declare-fun b!541534 () Bool)

(declare-fun e!313565 () SeekEntryResult!4913)

(assert (=> b!541534 (= e!313565 e!313566)))

(declare-fun lt!247658 () (_ BitVec 64))

(declare-fun c!62933 () Bool)

(assert (=> b!541534 (= c!62933 (or (= lt!247658 (select (arr!16455 a!3154) j!147)) (= (bvadd lt!247658 lt!247658) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541535 () Bool)

(assert (=> b!541535 (and (bvsge (index!21878 lt!247657) #b00000000000000000000000000000000) (bvslt (index!21878 lt!247657) (size!16819 a!3154)))))

(declare-fun res!336300 () Bool)

(assert (=> b!541535 (= res!336300 (= (select (arr!16455 a!3154) (index!21878 lt!247657)) (select (arr!16455 a!3154) j!147)))))

(assert (=> b!541535 (=> res!336300 e!313564)))

(assert (=> b!541535 (= e!313567 e!313564)))

(declare-fun b!541536 () Bool)

(assert (=> b!541536 (= e!313565 (Intermediate!4913 true (toIndex!0 (select (arr!16455 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun d!81779 () Bool)

(assert (=> d!81779 e!313563))

(declare-fun c!62931 () Bool)

(assert (=> d!81779 (= c!62931 (and (is-Intermediate!4913 lt!247657) (undefined!5725 lt!247657)))))

(assert (=> d!81779 (= lt!247657 e!313565)))

(declare-fun c!62932 () Bool)

(assert (=> d!81779 (= c!62932 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81779 (= lt!247658 (select (arr!16455 a!3154) (toIndex!0 (select (arr!16455 a!3154) j!147) mask!3216)))))

(assert (=> d!81779 (validMask!0 mask!3216)))

(assert (=> d!81779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16455 a!3154) j!147) mask!3216) (select (arr!16455 a!3154) j!147) a!3154 mask!3216) lt!247657)))

(declare-fun b!541537 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541537 (= e!313566 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16455 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16455 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541538 () Bool)

(assert (=> b!541538 (= e!313563 (bvsge (x!50788 lt!247657) #b01111111111111111111111111111110))))

(assert (= (and d!81779 c!62932) b!541536))

(assert (= (and d!81779 (not c!62932)) b!541534))

(assert (= (and b!541534 c!62933) b!541531))

(assert (= (and b!541534 (not c!62933)) b!541537))

(assert (= (and d!81779 c!62931) b!541538))

(assert (= (and d!81779 (not c!62931)) b!541533))

(assert (= (and b!541533 res!336299) b!541535))

(assert (= (and b!541535 (not res!336300)) b!541530))

(assert (= (and b!541530 (not res!336301)) b!541532))

(declare-fun m!520031 () Bool)

(assert (=> b!541532 m!520031))

(assert (=> b!541535 m!520031))

(assert (=> d!81779 m!519873))

(declare-fun m!520033 () Bool)

(assert (=> d!81779 m!520033))

(assert (=> d!81779 m!519861))

(assert (=> b!541537 m!519873))

(declare-fun m!520035 () Bool)

(assert (=> b!541537 m!520035))

(assert (=> b!541537 m!520035))

(assert (=> b!541537 m!519855))

(declare-fun m!520037 () Bool)

(assert (=> b!541537 m!520037))

(assert (=> b!541530 m!520031))

(assert (=> b!541266 d!81779))

(declare-fun d!81799 () Bool)

(declare-fun lt!247673 () (_ BitVec 32))

(declare-fun lt!247672 () (_ BitVec 32))

(assert (=> d!81799 (= lt!247673 (bvmul (bvxor lt!247672 (bvlshr lt!247672 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81799 (= lt!247672 ((_ extract 31 0) (bvand (bvxor (select (arr!16455 a!3154) j!147) (bvlshr (select (arr!16455 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81799 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336302 (let ((h!11524 ((_ extract 31 0) (bvand (bvxor (select (arr!16455 a!3154) j!147) (bvlshr (select (arr!16455 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50796 (bvmul (bvxor h!11524 (bvlshr h!11524 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50796 (bvlshr x!50796 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336302 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336302 #b00000000000000000000000000000000))))))

(assert (=> d!81799 (= (toIndex!0 (select (arr!16455 a!3154) j!147) mask!3216) (bvand (bvxor lt!247673 (bvlshr lt!247673 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!541266 d!81799))

(declare-fun b!541557 () Bool)

(declare-fun lt!247674 () SeekEntryResult!4913)

(assert (=> b!541557 (and (bvsge (index!21878 lt!247674) #b00000000000000000000000000000000) (bvslt (index!21878 lt!247674) (size!16819 a!3154)))))

(declare-fun res!336305 () Bool)

(assert (=> b!541557 (= res!336305 (= (select (arr!16455 a!3154) (index!21878 lt!247674)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313578 () Bool)

(assert (=> b!541557 (=> res!336305 e!313578)))

(declare-fun b!541558 () Bool)

(declare-fun e!313580 () SeekEntryResult!4913)

(assert (=> b!541558 (= e!313580 (Intermediate!4913 false index!1177 x!1030))))

(declare-fun b!541559 () Bool)

(assert (=> b!541559 (and (bvsge (index!21878 lt!247674) #b00000000000000000000000000000000) (bvslt (index!21878 lt!247674) (size!16819 a!3154)))))

(assert (=> b!541559 (= e!313578 (= (select (arr!16455 a!3154) (index!21878 lt!247674)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541560 () Bool)

(declare-fun e!313577 () Bool)

(declare-fun e!313581 () Bool)

(assert (=> b!541560 (= e!313577 e!313581)))

(declare-fun res!336303 () Bool)

(assert (=> b!541560 (= res!336303 (and (is-Intermediate!4913 lt!247674) (not (undefined!5725 lt!247674)) (bvslt (x!50788 lt!247674) #b01111111111111111111111111111110) (bvsge (x!50788 lt!247674) #b00000000000000000000000000000000) (bvsge (x!50788 lt!247674) x!1030)))))

(assert (=> b!541560 (=> (not res!336303) (not e!313581))))

(declare-fun b!541561 () Bool)

(declare-fun e!313579 () SeekEntryResult!4913)

(assert (=> b!541561 (= e!313579 e!313580)))

(declare-fun c!62945 () Bool)

(declare-fun lt!247675 () (_ BitVec 64))

(assert (=> b!541561 (= c!62945 (or (= lt!247675 (select (arr!16455 a!3154) j!147)) (= (bvadd lt!247675 lt!247675) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541562 () Bool)

(assert (=> b!541562 (and (bvsge (index!21878 lt!247674) #b00000000000000000000000000000000) (bvslt (index!21878 lt!247674) (size!16819 a!3154)))))

(declare-fun res!336304 () Bool)

(assert (=> b!541562 (= res!336304 (= (select (arr!16455 a!3154) (index!21878 lt!247674)) (select (arr!16455 a!3154) j!147)))))

