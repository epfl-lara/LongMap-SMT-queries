; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49338 () Bool)

(assert start!49338)

(declare-fun b!543527 () Bool)

(declare-fun res!338231 () Bool)

(declare-fun e!314247 () Bool)

(assert (=> b!543527 (=> (not res!338231) (not e!314247))))

(declare-datatypes ((array!34356 0))(
  ( (array!34357 (arr!16511 (Array (_ BitVec 32) (_ BitVec 64))) (size!16876 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34356)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543527 (= res!338231 (validKeyInArray!0 (select (arr!16511 a!3154) j!147)))))

(declare-fun b!543528 () Bool)

(declare-fun res!338222 () Bool)

(assert (=> b!543528 (=> (not res!338222) (not e!314247))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!543528 (= res!338222 (validKeyInArray!0 k0!1998))))

(declare-fun b!543529 () Bool)

(declare-fun e!314245 () Bool)

(declare-fun e!314246 () Bool)

(assert (=> b!543529 (= e!314245 e!314246)))

(declare-fun res!338224 () Bool)

(assert (=> b!543529 (=> (not res!338224) (not e!314246))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4966 0))(
  ( (MissingZero!4966 (index!22088 (_ BitVec 32))) (Found!4966 (index!22089 (_ BitVec 32))) (Intermediate!4966 (undefined!5778 Bool) (index!22090 (_ BitVec 32)) (x!51000 (_ BitVec 32))) (Undefined!4966) (MissingVacant!4966 (index!22091 (_ BitVec 32))) )
))
(declare-fun lt!248029 () SeekEntryResult!4966)

(assert (=> b!543529 (= res!338224 (= lt!248029 (Intermediate!4966 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34356 (_ BitVec 32)) SeekEntryResult!4966)

(assert (=> b!543529 (= lt!248029 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16511 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543530 () Bool)

(declare-fun res!338229 () Bool)

(assert (=> b!543530 (=> (not res!338229) (not e!314246))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543530 (= res!338229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216) lt!248029))))

(declare-fun b!543531 () Bool)

(assert (=> b!543531 (= e!314246 (bvsgt (bvadd #b00000000000000000000000000000001 x!1030) resX!32))))

(declare-fun lt!248028 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543531 (= lt!248028 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543532 () Bool)

(declare-fun res!338225 () Bool)

(assert (=> b!543532 (=> (not res!338225) (not e!314245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34356 (_ BitVec 32)) Bool)

(assert (=> b!543532 (= res!338225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543533 () Bool)

(declare-fun res!338230 () Bool)

(assert (=> b!543533 (=> (not res!338230) (not e!314247))))

(declare-fun arrayContainsKey!0 (array!34356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543533 (= res!338230 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!338228 () Bool)

(assert (=> start!49338 (=> (not res!338228) (not e!314247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49338 (= res!338228 (validMask!0 mask!3216))))

(assert (=> start!49338 e!314247))

(assert (=> start!49338 true))

(declare-fun array_inv!12394 (array!34356) Bool)

(assert (=> start!49338 (array_inv!12394 a!3154)))

(declare-fun b!543534 () Bool)

(assert (=> b!543534 (= e!314247 e!314245)))

(declare-fun res!338227 () Bool)

(assert (=> b!543534 (=> (not res!338227) (not e!314245))))

(declare-fun lt!248027 () SeekEntryResult!4966)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543534 (= res!338227 (or (= lt!248027 (MissingZero!4966 i!1153)) (= lt!248027 (MissingVacant!4966 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34356 (_ BitVec 32)) SeekEntryResult!4966)

(assert (=> b!543534 (= lt!248027 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543535 () Bool)

(declare-fun res!338221 () Bool)

(assert (=> b!543535 (=> (not res!338221) (not e!314246))))

(assert (=> b!543535 (= res!338221 (and (not (= (select (arr!16511 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16511 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16511 a!3154) index!1177) (select (arr!16511 a!3154) j!147)))))))

(declare-fun b!543536 () Bool)

(declare-fun res!338223 () Bool)

(assert (=> b!543536 (=> (not res!338223) (not e!314245))))

(assert (=> b!543536 (= res!338223 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16876 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16876 a!3154)) (= (select (arr!16511 a!3154) resIndex!32) (select (arr!16511 a!3154) j!147))))))

(declare-fun b!543537 () Bool)

(declare-fun res!338226 () Bool)

(assert (=> b!543537 (=> (not res!338226) (not e!314247))))

(assert (=> b!543537 (= res!338226 (and (= (size!16876 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16876 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16876 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543538 () Bool)

(declare-fun res!338220 () Bool)

(assert (=> b!543538 (=> (not res!338220) (not e!314245))))

(declare-datatypes ((List!10669 0))(
  ( (Nil!10666) (Cons!10665 (h!11620 (_ BitVec 64)) (t!16888 List!10669)) )
))
(declare-fun arrayNoDuplicates!0 (array!34356 (_ BitVec 32) List!10669) Bool)

(assert (=> b!543538 (= res!338220 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10666))))

(assert (= (and start!49338 res!338228) b!543537))

(assert (= (and b!543537 res!338226) b!543527))

(assert (= (and b!543527 res!338231) b!543528))

(assert (= (and b!543528 res!338222) b!543533))

(assert (= (and b!543533 res!338230) b!543534))

(assert (= (and b!543534 res!338227) b!543532))

(assert (= (and b!543532 res!338225) b!543538))

(assert (= (and b!543538 res!338220) b!543536))

(assert (= (and b!543536 res!338223) b!543529))

(assert (= (and b!543529 res!338224) b!543530))

(assert (= (and b!543530 res!338229) b!543535))

(assert (= (and b!543535 res!338221) b!543531))

(declare-fun m!521077 () Bool)

(assert (=> b!543538 m!521077))

(declare-fun m!521079 () Bool)

(assert (=> start!49338 m!521079))

(declare-fun m!521081 () Bool)

(assert (=> start!49338 m!521081))

(declare-fun m!521083 () Bool)

(assert (=> b!543527 m!521083))

(assert (=> b!543527 m!521083))

(declare-fun m!521085 () Bool)

(assert (=> b!543527 m!521085))

(assert (=> b!543529 m!521083))

(assert (=> b!543529 m!521083))

(declare-fun m!521087 () Bool)

(assert (=> b!543529 m!521087))

(assert (=> b!543530 m!521083))

(assert (=> b!543530 m!521083))

(declare-fun m!521089 () Bool)

(assert (=> b!543530 m!521089))

(assert (=> b!543530 m!521089))

(assert (=> b!543530 m!521083))

(declare-fun m!521091 () Bool)

(assert (=> b!543530 m!521091))

(declare-fun m!521093 () Bool)

(assert (=> b!543528 m!521093))

(declare-fun m!521095 () Bool)

(assert (=> b!543534 m!521095))

(declare-fun m!521097 () Bool)

(assert (=> b!543535 m!521097))

(assert (=> b!543535 m!521083))

(declare-fun m!521099 () Bool)

(assert (=> b!543531 m!521099))

(declare-fun m!521101 () Bool)

(assert (=> b!543533 m!521101))

(declare-fun m!521103 () Bool)

(assert (=> b!543536 m!521103))

(assert (=> b!543536 m!521083))

(declare-fun m!521105 () Bool)

(assert (=> b!543532 m!521105))

(check-sat (not b!543538) (not b!543529) (not b!543527) (not b!543531) (not b!543530) (not b!543528) (not b!543532) (not b!543534) (not b!543533) (not start!49338))
(check-sat)
(get-model)

(declare-fun d!81721 () Bool)

(assert (=> d!81721 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49338 d!81721))

(declare-fun d!81727 () Bool)

(assert (=> d!81727 (= (array_inv!12394 a!3154) (bvsge (size!16876 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49338 d!81727))

(declare-fun b!543674 () Bool)

(declare-fun lt!248073 () SeekEntryResult!4966)

(assert (=> b!543674 (and (bvsge (index!22090 lt!248073) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248073) (size!16876 a!3154)))))

(declare-fun e!314318 () Bool)

(assert (=> b!543674 (= e!314318 (= (select (arr!16511 a!3154) (index!22090 lt!248073)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!543675 () Bool)

(assert (=> b!543675 (and (bvsge (index!22090 lt!248073) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248073) (size!16876 a!3154)))))

(declare-fun res!338338 () Bool)

(assert (=> b!543675 (= res!338338 (= (select (arr!16511 a!3154) (index!22090 lt!248073)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!543675 (=> res!338338 e!314318)))

(declare-fun e!314322 () SeekEntryResult!4966)

(declare-fun b!543676 () Bool)

(assert (=> b!543676 (= e!314322 (Intermediate!4966 false (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!543677 () Bool)

(assert (=> b!543677 (= e!314322 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543678 () Bool)

(declare-fun e!314321 () SeekEntryResult!4966)

(assert (=> b!543678 (= e!314321 e!314322)))

(declare-fun c!62988 () Bool)

(declare-fun lt!248074 () (_ BitVec 64))

(assert (=> b!543678 (= c!62988 (or (= lt!248074 (select (arr!16511 a!3154) j!147)) (= (bvadd lt!248074 lt!248074) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!543679 () Bool)

(assert (=> b!543679 (and (bvsge (index!22090 lt!248073) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248073) (size!16876 a!3154)))))

(declare-fun res!338337 () Bool)

(assert (=> b!543679 (= res!338337 (= (select (arr!16511 a!3154) (index!22090 lt!248073)) (select (arr!16511 a!3154) j!147)))))

(assert (=> b!543679 (=> res!338337 e!314318)))

(declare-fun e!314319 () Bool)

(assert (=> b!543679 (= e!314319 e!314318)))

(declare-fun b!543680 () Bool)

(assert (=> b!543680 (= e!314321 (Intermediate!4966 true (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!543681 () Bool)

(declare-fun e!314320 () Bool)

(assert (=> b!543681 (= e!314320 (bvsge (x!51000 lt!248073) #b01111111111111111111111111111110))))

(declare-fun b!543682 () Bool)

(assert (=> b!543682 (= e!314320 e!314319)))

(declare-fun res!338339 () Bool)

(get-info :version)

(assert (=> b!543682 (= res!338339 (and ((_ is Intermediate!4966) lt!248073) (not (undefined!5778 lt!248073)) (bvslt (x!51000 lt!248073) #b01111111111111111111111111111110) (bvsge (x!51000 lt!248073) #b00000000000000000000000000000000) (bvsge (x!51000 lt!248073) #b00000000000000000000000000000000)))))

(assert (=> b!543682 (=> (not res!338339) (not e!314319))))

(declare-fun d!81731 () Bool)

(assert (=> d!81731 e!314320))

(declare-fun c!62987 () Bool)

(assert (=> d!81731 (= c!62987 (and ((_ is Intermediate!4966) lt!248073) (undefined!5778 lt!248073)))))

(assert (=> d!81731 (= lt!248073 e!314321)))

(declare-fun c!62986 () Bool)

(assert (=> d!81731 (= c!62986 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81731 (= lt!248074 (select (arr!16511 a!3154) (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216)))))

(assert (=> d!81731 (validMask!0 mask!3216)))

(assert (=> d!81731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216) lt!248073)))

(assert (= (and d!81731 c!62986) b!543680))

(assert (= (and d!81731 (not c!62986)) b!543678))

(assert (= (and b!543678 c!62988) b!543676))

(assert (= (and b!543678 (not c!62988)) b!543677))

(assert (= (and d!81731 c!62987) b!543681))

(assert (= (and d!81731 (not c!62987)) b!543682))

(assert (= (and b!543682 res!338339) b!543679))

(assert (= (and b!543679 (not res!338337)) b!543675))

(assert (= (and b!543675 (not res!338338)) b!543674))

(declare-fun m!521199 () Bool)

(assert (=> b!543675 m!521199))

(assert (=> b!543677 m!521089))

(declare-fun m!521201 () Bool)

(assert (=> b!543677 m!521201))

(assert (=> b!543677 m!521201))

(assert (=> b!543677 m!521083))

(declare-fun m!521203 () Bool)

(assert (=> b!543677 m!521203))

(assert (=> b!543674 m!521199))

(assert (=> d!81731 m!521089))

(declare-fun m!521205 () Bool)

(assert (=> d!81731 m!521205))

(assert (=> d!81731 m!521079))

(assert (=> b!543679 m!521199))

(assert (=> b!543530 d!81731))

(declare-fun d!81743 () Bool)

(declare-fun lt!248084 () (_ BitVec 32))

(declare-fun lt!248083 () (_ BitVec 32))

(assert (=> d!81743 (= lt!248084 (bvmul (bvxor lt!248083 (bvlshr lt!248083 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81743 (= lt!248083 ((_ extract 31 0) (bvand (bvxor (select (arr!16511 a!3154) j!147) (bvlshr (select (arr!16511 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81743 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338340 (let ((h!11623 ((_ extract 31 0) (bvand (bvxor (select (arr!16511 a!3154) j!147) (bvlshr (select (arr!16511 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51006 (bvmul (bvxor h!11623 (bvlshr h!11623 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51006 (bvlshr x!51006 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338340 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338340 #b00000000000000000000000000000000))))))

(assert (=> d!81743 (= (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) (bvand (bvxor lt!248084 (bvlshr lt!248084 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!543530 d!81743))

(declare-fun d!81745 () Bool)

(declare-fun lt!248089 () (_ BitVec 32))

(assert (=> d!81745 (and (bvsge lt!248089 #b00000000000000000000000000000000) (bvslt lt!248089 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81745 (= lt!248089 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!81745 (validMask!0 mask!3216)))

(assert (=> d!81745 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248089)))

(declare-fun bs!16946 () Bool)

(assert (= bs!16946 d!81745))

(declare-fun m!521215 () Bool)

(assert (=> bs!16946 m!521215))

(assert (=> bs!16946 m!521079))

(assert (=> b!543531 d!81745))

(declare-fun d!81749 () Bool)

(assert (=> d!81749 (= (validKeyInArray!0 (select (arr!16511 a!3154) j!147)) (and (not (= (select (arr!16511 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16511 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543527 d!81749))

(declare-fun b!543754 () Bool)

(declare-fun e!314365 () Bool)

(declare-fun e!314364 () Bool)

(assert (=> b!543754 (= e!314365 e!314364)))

(declare-fun c!63012 () Bool)

(assert (=> b!543754 (= c!63012 (validKeyInArray!0 (select (arr!16511 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81751 () Bool)

(declare-fun res!338368 () Bool)

(assert (=> d!81751 (=> res!338368 e!314365)))

(assert (=> d!81751 (= res!338368 (bvsge #b00000000000000000000000000000000 (size!16876 a!3154)))))

(assert (=> d!81751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314365)))

(declare-fun bm!32053 () Bool)

(declare-fun call!32056 () Bool)

(assert (=> bm!32053 (= call!32056 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!543755 () Bool)

(assert (=> b!543755 (= e!314364 call!32056)))

(declare-fun b!543756 () Bool)

(declare-fun e!314366 () Bool)

(assert (=> b!543756 (= e!314364 e!314366)))

(declare-fun lt!248114 () (_ BitVec 64))

(assert (=> b!543756 (= lt!248114 (select (arr!16511 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16892 0))(
  ( (Unit!16893) )
))
(declare-fun lt!248113 () Unit!16892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34356 (_ BitVec 64) (_ BitVec 32)) Unit!16892)

(assert (=> b!543756 (= lt!248113 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248114 #b00000000000000000000000000000000))))

(assert (=> b!543756 (arrayContainsKey!0 a!3154 lt!248114 #b00000000000000000000000000000000)))

(declare-fun lt!248115 () Unit!16892)

(assert (=> b!543756 (= lt!248115 lt!248113)))

(declare-fun res!338367 () Bool)

(assert (=> b!543756 (= res!338367 (= (seekEntryOrOpen!0 (select (arr!16511 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4966 #b00000000000000000000000000000000)))))

(assert (=> b!543756 (=> (not res!338367) (not e!314366))))

(declare-fun b!543757 () Bool)

(assert (=> b!543757 (= e!314366 call!32056)))

(assert (= (and d!81751 (not res!338368)) b!543754))

(assert (= (and b!543754 c!63012) b!543756))

(assert (= (and b!543754 (not c!63012)) b!543755))

(assert (= (and b!543756 res!338367) b!543757))

(assert (= (or b!543757 b!543755) bm!32053))

(declare-fun m!521227 () Bool)

(assert (=> b!543754 m!521227))

(assert (=> b!543754 m!521227))

(declare-fun m!521231 () Bool)

(assert (=> b!543754 m!521231))

(declare-fun m!521233 () Bool)

(assert (=> bm!32053 m!521233))

(assert (=> b!543756 m!521227))

(declare-fun m!521237 () Bool)

(assert (=> b!543756 m!521237))

(declare-fun m!521239 () Bool)

(assert (=> b!543756 m!521239))

(assert (=> b!543756 m!521227))

(declare-fun m!521241 () Bool)

(assert (=> b!543756 m!521241))

(assert (=> b!543532 d!81751))

(declare-fun d!81761 () Bool)

(declare-fun res!338374 () Bool)

(declare-fun e!314371 () Bool)

(assert (=> d!81761 (=> res!338374 e!314371)))

(assert (=> d!81761 (= res!338374 (= (select (arr!16511 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81761 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!314371)))

(declare-fun b!543762 () Bool)

(declare-fun e!314372 () Bool)

(assert (=> b!543762 (= e!314371 e!314372)))

(declare-fun res!338375 () Bool)

(assert (=> b!543762 (=> (not res!338375) (not e!314372))))

(assert (=> b!543762 (= res!338375 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(declare-fun b!543763 () Bool)

(assert (=> b!543763 (= e!314372 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81761 (not res!338374)) b!543762))

(assert (= (and b!543762 res!338375) b!543763))

(assert (=> d!81761 m!521227))

(declare-fun m!521243 () Bool)

(assert (=> b!543763 m!521243))

(assert (=> b!543533 d!81761))

(declare-fun b!543783 () Bool)

(declare-fun e!314386 () Bool)

(declare-fun contains!2786 (List!10669 (_ BitVec 64)) Bool)

(assert (=> b!543783 (= e!314386 (contains!2786 Nil!10666 (select (arr!16511 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!543784 () Bool)

(declare-fun e!314389 () Bool)

(declare-fun e!314388 () Bool)

(assert (=> b!543784 (= e!314389 e!314388)))

(declare-fun c!63018 () Bool)

(assert (=> b!543784 (= c!63018 (validKeyInArray!0 (select (arr!16511 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32056 () Bool)

(declare-fun call!32059 () Bool)

(assert (=> bm!32056 (= call!32059 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63018 (Cons!10665 (select (arr!16511 a!3154) #b00000000000000000000000000000000) Nil!10666) Nil!10666)))))

(declare-fun d!81763 () Bool)

(declare-fun res!338385 () Bool)

(declare-fun e!314387 () Bool)

(assert (=> d!81763 (=> res!338385 e!314387)))

(assert (=> d!81763 (= res!338385 (bvsge #b00000000000000000000000000000000 (size!16876 a!3154)))))

(assert (=> d!81763 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10666) e!314387)))

(declare-fun b!543785 () Bool)

(assert (=> b!543785 (= e!314388 call!32059)))

(declare-fun b!543786 () Bool)

(assert (=> b!543786 (= e!314387 e!314389)))

(declare-fun res!338387 () Bool)

(assert (=> b!543786 (=> (not res!338387) (not e!314389))))

(assert (=> b!543786 (= res!338387 (not e!314386))))

(declare-fun res!338386 () Bool)

(assert (=> b!543786 (=> (not res!338386) (not e!314386))))

(assert (=> b!543786 (= res!338386 (validKeyInArray!0 (select (arr!16511 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!543787 () Bool)

(assert (=> b!543787 (= e!314388 call!32059)))

(assert (= (and d!81763 (not res!338385)) b!543786))

(assert (= (and b!543786 res!338386) b!543783))

(assert (= (and b!543786 res!338387) b!543784))

(assert (= (and b!543784 c!63018) b!543787))

(assert (= (and b!543784 (not c!63018)) b!543785))

(assert (= (or b!543787 b!543785) bm!32056))

(assert (=> b!543783 m!521227))

(assert (=> b!543783 m!521227))

(declare-fun m!521249 () Bool)

(assert (=> b!543783 m!521249))

(assert (=> b!543784 m!521227))

(assert (=> b!543784 m!521227))

(assert (=> b!543784 m!521231))

(assert (=> bm!32056 m!521227))

(declare-fun m!521251 () Bool)

(assert (=> bm!32056 m!521251))

(assert (=> b!543786 m!521227))

(assert (=> b!543786 m!521227))

(assert (=> b!543786 m!521231))

(assert (=> b!543538 d!81763))

(declare-fun d!81771 () Bool)

(assert (=> d!81771 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543528 d!81771))

(declare-fun b!543788 () Bool)

(declare-fun lt!248124 () SeekEntryResult!4966)

(assert (=> b!543788 (and (bvsge (index!22090 lt!248124) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248124) (size!16876 a!3154)))))

(declare-fun e!314390 () Bool)

(assert (=> b!543788 (= e!314390 (= (select (arr!16511 a!3154) (index!22090 lt!248124)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!543789 () Bool)

(assert (=> b!543789 (and (bvsge (index!22090 lt!248124) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248124) (size!16876 a!3154)))))

(declare-fun res!338389 () Bool)

(assert (=> b!543789 (= res!338389 (= (select (arr!16511 a!3154) (index!22090 lt!248124)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!543789 (=> res!338389 e!314390)))

(declare-fun b!543790 () Bool)

(declare-fun e!314394 () SeekEntryResult!4966)

(assert (=> b!543790 (= e!314394 (Intermediate!4966 false index!1177 x!1030))))

(declare-fun b!543791 () Bool)

(assert (=> b!543791 (= e!314394 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543792 () Bool)

(declare-fun e!314393 () SeekEntryResult!4966)

(assert (=> b!543792 (= e!314393 e!314394)))

(declare-fun c!63021 () Bool)

(declare-fun lt!248125 () (_ BitVec 64))

(assert (=> b!543792 (= c!63021 (or (= lt!248125 (select (arr!16511 a!3154) j!147)) (= (bvadd lt!248125 lt!248125) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!543793 () Bool)

(assert (=> b!543793 (and (bvsge (index!22090 lt!248124) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248124) (size!16876 a!3154)))))

(declare-fun res!338388 () Bool)

(assert (=> b!543793 (= res!338388 (= (select (arr!16511 a!3154) (index!22090 lt!248124)) (select (arr!16511 a!3154) j!147)))))

(assert (=> b!543793 (=> res!338388 e!314390)))

(declare-fun e!314391 () Bool)

(assert (=> b!543793 (= e!314391 e!314390)))

(declare-fun b!543794 () Bool)

(assert (=> b!543794 (= e!314393 (Intermediate!4966 true index!1177 x!1030))))

(declare-fun b!543795 () Bool)

(declare-fun e!314392 () Bool)

(assert (=> b!543795 (= e!314392 (bvsge (x!51000 lt!248124) #b01111111111111111111111111111110))))

(declare-fun b!543796 () Bool)

(assert (=> b!543796 (= e!314392 e!314391)))

(declare-fun res!338390 () Bool)

(assert (=> b!543796 (= res!338390 (and ((_ is Intermediate!4966) lt!248124) (not (undefined!5778 lt!248124)) (bvslt (x!51000 lt!248124) #b01111111111111111111111111111110) (bvsge (x!51000 lt!248124) #b00000000000000000000000000000000) (bvsge (x!51000 lt!248124) x!1030)))))

(assert (=> b!543796 (=> (not res!338390) (not e!314391))))

(declare-fun d!81773 () Bool)

(assert (=> d!81773 e!314392))

(declare-fun c!63020 () Bool)

(assert (=> d!81773 (= c!63020 (and ((_ is Intermediate!4966) lt!248124) (undefined!5778 lt!248124)))))

(assert (=> d!81773 (= lt!248124 e!314393)))

(declare-fun c!63019 () Bool)

(assert (=> d!81773 (= c!63019 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81773 (= lt!248125 (select (arr!16511 a!3154) index!1177))))

(assert (=> d!81773 (validMask!0 mask!3216)))

(assert (=> d!81773 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16511 a!3154) j!147) a!3154 mask!3216) lt!248124)))

(assert (= (and d!81773 c!63019) b!543794))

(assert (= (and d!81773 (not c!63019)) b!543792))

(assert (= (and b!543792 c!63021) b!543790))

(assert (= (and b!543792 (not c!63021)) b!543791))

(assert (= (and d!81773 c!63020) b!543795))

(assert (= (and d!81773 (not c!63020)) b!543796))

(assert (= (and b!543796 res!338390) b!543793))

(assert (= (and b!543793 (not res!338388)) b!543789))

(assert (= (and b!543789 (not res!338389)) b!543788))

(declare-fun m!521253 () Bool)

(assert (=> b!543789 m!521253))

(assert (=> b!543791 m!521099))

(assert (=> b!543791 m!521099))

(assert (=> b!543791 m!521083))

(declare-fun m!521255 () Bool)

(assert (=> b!543791 m!521255))

(assert (=> b!543788 m!521253))

(assert (=> d!81773 m!521097))

(assert (=> d!81773 m!521079))

(assert (=> b!543793 m!521253))

(assert (=> b!543529 d!81773))

(declare-fun b!543848 () Bool)

(declare-fun e!314429 () SeekEntryResult!4966)

(declare-fun e!314430 () SeekEntryResult!4966)

(assert (=> b!543848 (= e!314429 e!314430)))

(declare-fun lt!248142 () (_ BitVec 64))

(declare-fun lt!248141 () SeekEntryResult!4966)

(assert (=> b!543848 (= lt!248142 (select (arr!16511 a!3154) (index!22090 lt!248141)))))

(declare-fun c!63042 () Bool)

(assert (=> b!543848 (= c!63042 (= lt!248142 k0!1998))))

(declare-fun b!543849 () Bool)

(declare-fun c!63041 () Bool)

(assert (=> b!543849 (= c!63041 (= lt!248142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314428 () SeekEntryResult!4966)

(assert (=> b!543849 (= e!314430 e!314428)))

(declare-fun b!543850 () Bool)

(assert (=> b!543850 (= e!314429 Undefined!4966)))

(declare-fun b!543851 () Bool)

(assert (=> b!543851 (= e!314428 (MissingZero!4966 (index!22090 lt!248141)))))

(declare-fun d!81775 () Bool)

(declare-fun lt!248143 () SeekEntryResult!4966)

(assert (=> d!81775 (and (or ((_ is Undefined!4966) lt!248143) (not ((_ is Found!4966) lt!248143)) (and (bvsge (index!22089 lt!248143) #b00000000000000000000000000000000) (bvslt (index!22089 lt!248143) (size!16876 a!3154)))) (or ((_ is Undefined!4966) lt!248143) ((_ is Found!4966) lt!248143) (not ((_ is MissingZero!4966) lt!248143)) (and (bvsge (index!22088 lt!248143) #b00000000000000000000000000000000) (bvslt (index!22088 lt!248143) (size!16876 a!3154)))) (or ((_ is Undefined!4966) lt!248143) ((_ is Found!4966) lt!248143) ((_ is MissingZero!4966) lt!248143) (not ((_ is MissingVacant!4966) lt!248143)) (and (bvsge (index!22091 lt!248143) #b00000000000000000000000000000000) (bvslt (index!22091 lt!248143) (size!16876 a!3154)))) (or ((_ is Undefined!4966) lt!248143) (ite ((_ is Found!4966) lt!248143) (= (select (arr!16511 a!3154) (index!22089 lt!248143)) k0!1998) (ite ((_ is MissingZero!4966) lt!248143) (= (select (arr!16511 a!3154) (index!22088 lt!248143)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4966) lt!248143) (= (select (arr!16511 a!3154) (index!22091 lt!248143)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81775 (= lt!248143 e!314429)))

(declare-fun c!63040 () Bool)

(assert (=> d!81775 (= c!63040 (and ((_ is Intermediate!4966) lt!248141) (undefined!5778 lt!248141)))))

(assert (=> d!81775 (= lt!248141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81775 (validMask!0 mask!3216)))

(assert (=> d!81775 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248143)))

(declare-fun b!543852 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34356 (_ BitVec 32)) SeekEntryResult!4966)

(assert (=> b!543852 (= e!314428 (seekKeyOrZeroReturnVacant!0 (x!51000 lt!248141) (index!22090 lt!248141) (index!22090 lt!248141) k0!1998 a!3154 mask!3216))))

(declare-fun b!543853 () Bool)

(assert (=> b!543853 (= e!314430 (Found!4966 (index!22090 lt!248141)))))

(assert (= (and d!81775 c!63040) b!543850))

(assert (= (and d!81775 (not c!63040)) b!543848))

(assert (= (and b!543848 c!63042) b!543853))

(assert (= (and b!543848 (not c!63042)) b!543849))

(assert (= (and b!543849 c!63041) b!543851))

(assert (= (and b!543849 (not c!63041)) b!543852))

(declare-fun m!521277 () Bool)

(assert (=> b!543848 m!521277))

(declare-fun m!521279 () Bool)

(assert (=> d!81775 m!521279))

(declare-fun m!521281 () Bool)

(assert (=> d!81775 m!521281))

(declare-fun m!521283 () Bool)

(assert (=> d!81775 m!521283))

(assert (=> d!81775 m!521079))

(declare-fun m!521285 () Bool)

(assert (=> d!81775 m!521285))

(assert (=> d!81775 m!521281))

(declare-fun m!521287 () Bool)

(assert (=> d!81775 m!521287))

(declare-fun m!521289 () Bool)

(assert (=> b!543852 m!521289))

(assert (=> b!543534 d!81775))

(check-sat (not b!543756) (not bm!32053) (not d!81773) (not d!81775) (not b!543784) (not b!543786) (not b!543677) (not b!543763) (not b!543852) (not bm!32056) (not b!543754) (not d!81745) (not b!543791) (not d!81731) (not b!543783))
(check-sat)
(get-model)

(declare-fun d!81819 () Bool)

(declare-fun res!338435 () (_ BitVec 32))

(assert (=> d!81819 (and (bvsge res!338435 #b00000000000000000000000000000000) (bvslt res!338435 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!81819 true))

(assert (=> d!81819 (= (choose!52 index!1177 x!1030 mask!3216) res!338435)))

(assert (=> d!81745 d!81819))

(assert (=> d!81745 d!81721))

(declare-fun d!81821 () Bool)

(declare-fun lt!248182 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!223 (List!10669) (InoxSet (_ BitVec 64)))

(assert (=> d!81821 (= lt!248182 (select (content!223 Nil!10666) (select (arr!16511 a!3154) #b00000000000000000000000000000000)))))

(declare-fun e!314489 () Bool)

(assert (=> d!81821 (= lt!248182 e!314489)))

(declare-fun res!338440 () Bool)

(assert (=> d!81821 (=> (not res!338440) (not e!314489))))

(assert (=> d!81821 (= res!338440 ((_ is Cons!10665) Nil!10666))))

(assert (=> d!81821 (= (contains!2786 Nil!10666 (select (arr!16511 a!3154) #b00000000000000000000000000000000)) lt!248182)))

(declare-fun b!543946 () Bool)

(declare-fun e!314488 () Bool)

(assert (=> b!543946 (= e!314489 e!314488)))

(declare-fun res!338441 () Bool)

(assert (=> b!543946 (=> res!338441 e!314488)))

(assert (=> b!543946 (= res!338441 (= (h!11620 Nil!10666) (select (arr!16511 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!543947 () Bool)

(assert (=> b!543947 (= e!314488 (contains!2786 (t!16888 Nil!10666) (select (arr!16511 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81821 res!338440) b!543946))

(assert (= (and b!543946 (not res!338441)) b!543947))

(declare-fun m!521381 () Bool)

(assert (=> d!81821 m!521381))

(assert (=> d!81821 m!521227))

(declare-fun m!521383 () Bool)

(assert (=> d!81821 m!521383))

(assert (=> b!543947 m!521227))

(declare-fun m!521385 () Bool)

(assert (=> b!543947 m!521385))

(assert (=> b!543783 d!81821))

(declare-fun d!81823 () Bool)

(assert (=> d!81823 (= (validKeyInArray!0 (select (arr!16511 a!3154) #b00000000000000000000000000000000)) (and (not (= (select (arr!16511 a!3154) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16511 a!3154) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543784 d!81823))

(declare-fun b!543948 () Bool)

(declare-fun lt!248183 () SeekEntryResult!4966)

(assert (=> b!543948 (and (bvsge (index!22090 lt!248183) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248183) (size!16876 a!3154)))))

(declare-fun e!314490 () Bool)

(assert (=> b!543948 (= e!314490 (= (select (arr!16511 a!3154) (index!22090 lt!248183)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!543949 () Bool)

(assert (=> b!543949 (and (bvsge (index!22090 lt!248183) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248183) (size!16876 a!3154)))))

(declare-fun res!338443 () Bool)

(assert (=> b!543949 (= res!338443 (= (select (arr!16511 a!3154) (index!22090 lt!248183)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!543949 (=> res!338443 e!314490)))

(declare-fun e!314494 () SeekEntryResult!4966)

(declare-fun b!543950 () Bool)

(assert (=> b!543950 (= e!314494 (Intermediate!4966 false (nextIndex!0 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!543951 () Bool)

(assert (=> b!543951 (= e!314494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543952 () Bool)

(declare-fun e!314493 () SeekEntryResult!4966)

(assert (=> b!543952 (= e!314493 e!314494)))

(declare-fun c!63077 () Bool)

(declare-fun lt!248184 () (_ BitVec 64))

(assert (=> b!543952 (= c!63077 (or (= lt!248184 (select (arr!16511 a!3154) j!147)) (= (bvadd lt!248184 lt!248184) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!543953 () Bool)

(assert (=> b!543953 (and (bvsge (index!22090 lt!248183) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248183) (size!16876 a!3154)))))

(declare-fun res!338442 () Bool)

(assert (=> b!543953 (= res!338442 (= (select (arr!16511 a!3154) (index!22090 lt!248183)) (select (arr!16511 a!3154) j!147)))))

(assert (=> b!543953 (=> res!338442 e!314490)))

(declare-fun e!314491 () Bool)

(assert (=> b!543953 (= e!314491 e!314490)))

(declare-fun b!543954 () Bool)

(assert (=> b!543954 (= e!314493 (Intermediate!4966 true (nextIndex!0 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!543955 () Bool)

(declare-fun e!314492 () Bool)

(assert (=> b!543955 (= e!314492 (bvsge (x!51000 lt!248183) #b01111111111111111111111111111110))))

(declare-fun b!543956 () Bool)

(assert (=> b!543956 (= e!314492 e!314491)))

(declare-fun res!338444 () Bool)

(assert (=> b!543956 (= res!338444 (and ((_ is Intermediate!4966) lt!248183) (not (undefined!5778 lt!248183)) (bvslt (x!51000 lt!248183) #b01111111111111111111111111111110) (bvsge (x!51000 lt!248183) #b00000000000000000000000000000000) (bvsge (x!51000 lt!248183) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!543956 (=> (not res!338444) (not e!314491))))

(declare-fun d!81825 () Bool)

(assert (=> d!81825 e!314492))

(declare-fun c!63076 () Bool)

(assert (=> d!81825 (= c!63076 (and ((_ is Intermediate!4966) lt!248183) (undefined!5778 lt!248183)))))

(assert (=> d!81825 (= lt!248183 e!314493)))

(declare-fun c!63075 () Bool)

(assert (=> d!81825 (= c!63075 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!81825 (= lt!248184 (select (arr!16511 a!3154) (nextIndex!0 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216)))))

(assert (=> d!81825 (validMask!0 mask!3216)))

(assert (=> d!81825 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216) lt!248183)))

(assert (= (and d!81825 c!63075) b!543954))

(assert (= (and d!81825 (not c!63075)) b!543952))

(assert (= (and b!543952 c!63077) b!543950))

(assert (= (and b!543952 (not c!63077)) b!543951))

(assert (= (and d!81825 c!63076) b!543955))

(assert (= (and d!81825 (not c!63076)) b!543956))

(assert (= (and b!543956 res!338444) b!543953))

(assert (= (and b!543953 (not res!338442)) b!543949))

(assert (= (and b!543949 (not res!338443)) b!543948))

(declare-fun m!521387 () Bool)

(assert (=> b!543949 m!521387))

(assert (=> b!543951 m!521201))

(declare-fun m!521389 () Bool)

(assert (=> b!543951 m!521389))

(assert (=> b!543951 m!521389))

(assert (=> b!543951 m!521083))

(declare-fun m!521391 () Bool)

(assert (=> b!543951 m!521391))

(assert (=> b!543948 m!521387))

(assert (=> d!81825 m!521201))

(declare-fun m!521393 () Bool)

(assert (=> d!81825 m!521393))

(assert (=> d!81825 m!521079))

(assert (=> b!543953 m!521387))

(assert (=> b!543677 d!81825))

(declare-fun d!81827 () Bool)

(declare-fun lt!248185 () (_ BitVec 32))

(assert (=> d!81827 (and (bvsge lt!248185 #b00000000000000000000000000000000) (bvslt lt!248185 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!81827 (= lt!248185 (choose!52 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216))))

(assert (=> d!81827 (validMask!0 mask!3216)))

(assert (=> d!81827 (= (nextIndex!0 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) lt!248185)))

(declare-fun bs!16950 () Bool)

(assert (= bs!16950 d!81827))

(assert (=> bs!16950 m!521089))

(declare-fun m!521395 () Bool)

(assert (=> bs!16950 m!521395))

(assert (=> bs!16950 m!521079))

(assert (=> b!543677 d!81827))

(declare-fun b!543957 () Bool)

(declare-fun lt!248186 () SeekEntryResult!4966)

(assert (=> b!543957 (and (bvsge (index!22090 lt!248186) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248186) (size!16876 a!3154)))))

(declare-fun e!314495 () Bool)

(assert (=> b!543957 (= e!314495 (= (select (arr!16511 a!3154) (index!22090 lt!248186)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!543958 () Bool)

(assert (=> b!543958 (and (bvsge (index!22090 lt!248186) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248186) (size!16876 a!3154)))))

(declare-fun res!338446 () Bool)

(assert (=> b!543958 (= res!338446 (= (select (arr!16511 a!3154) (index!22090 lt!248186)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!543958 (=> res!338446 e!314495)))

(declare-fun b!543959 () Bool)

(declare-fun e!314499 () SeekEntryResult!4966)

(assert (=> b!543959 (= e!314499 (Intermediate!4966 false (toIndex!0 k0!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!543960 () Bool)

(assert (=> b!543960 (= e!314499 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!1998 mask!3216) #b00000000000000000000000000000000 mask!3216) k0!1998 a!3154 mask!3216))))

(declare-fun b!543961 () Bool)

(declare-fun e!314498 () SeekEntryResult!4966)

(assert (=> b!543961 (= e!314498 e!314499)))

(declare-fun c!63080 () Bool)

(declare-fun lt!248187 () (_ BitVec 64))

(assert (=> b!543961 (= c!63080 (or (= lt!248187 k0!1998) (= (bvadd lt!248187 lt!248187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!543962 () Bool)

(assert (=> b!543962 (and (bvsge (index!22090 lt!248186) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248186) (size!16876 a!3154)))))

(declare-fun res!338445 () Bool)

(assert (=> b!543962 (= res!338445 (= (select (arr!16511 a!3154) (index!22090 lt!248186)) k0!1998))))

(assert (=> b!543962 (=> res!338445 e!314495)))

(declare-fun e!314496 () Bool)

(assert (=> b!543962 (= e!314496 e!314495)))

(declare-fun b!543963 () Bool)

(assert (=> b!543963 (= e!314498 (Intermediate!4966 true (toIndex!0 k0!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!543964 () Bool)

(declare-fun e!314497 () Bool)

(assert (=> b!543964 (= e!314497 (bvsge (x!51000 lt!248186) #b01111111111111111111111111111110))))

(declare-fun b!543965 () Bool)

(assert (=> b!543965 (= e!314497 e!314496)))

(declare-fun res!338447 () Bool)

(assert (=> b!543965 (= res!338447 (and ((_ is Intermediate!4966) lt!248186) (not (undefined!5778 lt!248186)) (bvslt (x!51000 lt!248186) #b01111111111111111111111111111110) (bvsge (x!51000 lt!248186) #b00000000000000000000000000000000) (bvsge (x!51000 lt!248186) #b00000000000000000000000000000000)))))

(assert (=> b!543965 (=> (not res!338447) (not e!314496))))

(declare-fun d!81829 () Bool)

(assert (=> d!81829 e!314497))

(declare-fun c!63079 () Bool)

(assert (=> d!81829 (= c!63079 (and ((_ is Intermediate!4966) lt!248186) (undefined!5778 lt!248186)))))

(assert (=> d!81829 (= lt!248186 e!314498)))

(declare-fun c!63078 () Bool)

(assert (=> d!81829 (= c!63078 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81829 (= lt!248187 (select (arr!16511 a!3154) (toIndex!0 k0!1998 mask!3216)))))

(assert (=> d!81829 (validMask!0 mask!3216)))

(assert (=> d!81829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216) lt!248186)))

(assert (= (and d!81829 c!63078) b!543963))

(assert (= (and d!81829 (not c!63078)) b!543961))

(assert (= (and b!543961 c!63080) b!543959))

(assert (= (and b!543961 (not c!63080)) b!543960))

(assert (= (and d!81829 c!63079) b!543964))

(assert (= (and d!81829 (not c!63079)) b!543965))

(assert (= (and b!543965 res!338447) b!543962))

(assert (= (and b!543962 (not res!338445)) b!543958))

(assert (= (and b!543958 (not res!338446)) b!543957))

(declare-fun m!521397 () Bool)

(assert (=> b!543958 m!521397))

(assert (=> b!543960 m!521281))

(declare-fun m!521399 () Bool)

(assert (=> b!543960 m!521399))

(assert (=> b!543960 m!521399))

(declare-fun m!521401 () Bool)

(assert (=> b!543960 m!521401))

(assert (=> b!543957 m!521397))

(assert (=> d!81829 m!521281))

(declare-fun m!521403 () Bool)

(assert (=> d!81829 m!521403))

(assert (=> d!81829 m!521079))

(assert (=> b!543962 m!521397))

(assert (=> d!81775 d!81829))

(declare-fun d!81831 () Bool)

(declare-fun lt!248189 () (_ BitVec 32))

(declare-fun lt!248188 () (_ BitVec 32))

(assert (=> d!81831 (= lt!248189 (bvmul (bvxor lt!248188 (bvlshr lt!248188 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81831 (= lt!248188 ((_ extract 31 0) (bvand (bvxor k0!1998 (bvlshr k0!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81831 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338340 (let ((h!11623 ((_ extract 31 0) (bvand (bvxor k0!1998 (bvlshr k0!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51006 (bvmul (bvxor h!11623 (bvlshr h!11623 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51006 (bvlshr x!51006 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338340 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338340 #b00000000000000000000000000000000))))))

(assert (=> d!81831 (= (toIndex!0 k0!1998 mask!3216) (bvand (bvxor lt!248189 (bvlshr lt!248189 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> d!81775 d!81831))

(assert (=> d!81775 d!81721))

(assert (=> b!543754 d!81823))

(declare-fun b!543966 () Bool)

(declare-fun e!314500 () Bool)

(assert (=> b!543966 (= e!314500 (contains!2786 (ite c!63018 (Cons!10665 (select (arr!16511 a!3154) #b00000000000000000000000000000000) Nil!10666) Nil!10666) (select (arr!16511 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!543967 () Bool)

(declare-fun e!314503 () Bool)

(declare-fun e!314502 () Bool)

(assert (=> b!543967 (= e!314503 e!314502)))

(declare-fun c!63081 () Bool)

(assert (=> b!543967 (= c!63081 (validKeyInArray!0 (select (arr!16511 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!32062 () Bool)

(declare-fun call!32065 () Bool)

(assert (=> bm!32062 (= call!32065 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!63081 (Cons!10665 (select (arr!16511 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!63018 (Cons!10665 (select (arr!16511 a!3154) #b00000000000000000000000000000000) Nil!10666) Nil!10666)) (ite c!63018 (Cons!10665 (select (arr!16511 a!3154) #b00000000000000000000000000000000) Nil!10666) Nil!10666))))))

(declare-fun d!81833 () Bool)

(declare-fun res!338448 () Bool)

(declare-fun e!314501 () Bool)

(assert (=> d!81833 (=> res!338448 e!314501)))

(assert (=> d!81833 (= res!338448 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(assert (=> d!81833 (= (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63018 (Cons!10665 (select (arr!16511 a!3154) #b00000000000000000000000000000000) Nil!10666) Nil!10666)) e!314501)))

(declare-fun b!543968 () Bool)

(assert (=> b!543968 (= e!314502 call!32065)))

(declare-fun b!543969 () Bool)

(assert (=> b!543969 (= e!314501 e!314503)))

(declare-fun res!338450 () Bool)

(assert (=> b!543969 (=> (not res!338450) (not e!314503))))

(assert (=> b!543969 (= res!338450 (not e!314500))))

(declare-fun res!338449 () Bool)

(assert (=> b!543969 (=> (not res!338449) (not e!314500))))

(assert (=> b!543969 (= res!338449 (validKeyInArray!0 (select (arr!16511 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!543970 () Bool)

(assert (=> b!543970 (= e!314502 call!32065)))

(assert (= (and d!81833 (not res!338448)) b!543969))

(assert (= (and b!543969 res!338449) b!543966))

(assert (= (and b!543969 res!338450) b!543967))

(assert (= (and b!543967 c!63081) b!543970))

(assert (= (and b!543967 (not c!63081)) b!543968))

(assert (= (or b!543970 b!543968) bm!32062))

(declare-fun m!521405 () Bool)

(assert (=> b!543966 m!521405))

(assert (=> b!543966 m!521405))

(declare-fun m!521407 () Bool)

(assert (=> b!543966 m!521407))

(assert (=> b!543967 m!521405))

(assert (=> b!543967 m!521405))

(declare-fun m!521409 () Bool)

(assert (=> b!543967 m!521409))

(assert (=> bm!32062 m!521405))

(declare-fun m!521411 () Bool)

(assert (=> bm!32062 m!521411))

(assert (=> b!543969 m!521405))

(assert (=> b!543969 m!521405))

(assert (=> b!543969 m!521409))

(assert (=> bm!32056 d!81833))

(declare-fun d!81835 () Bool)

(declare-fun res!338451 () Bool)

(declare-fun e!314504 () Bool)

(assert (=> d!81835 (=> res!338451 e!314504)))

(assert (=> d!81835 (= res!338451 (= (select (arr!16511 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1998))))

(assert (=> d!81835 (= (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!314504)))

(declare-fun b!543971 () Bool)

(declare-fun e!314505 () Bool)

(assert (=> b!543971 (= e!314504 e!314505)))

(declare-fun res!338452 () Bool)

(assert (=> b!543971 (=> (not res!338452) (not e!314505))))

(assert (=> b!543971 (= res!338452 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(declare-fun b!543972 () Bool)

(assert (=> b!543972 (= e!314505 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!81835 (not res!338451)) b!543971))

(assert (= (and b!543971 res!338452) b!543972))

(assert (=> d!81835 m!521405))

(declare-fun m!521413 () Bool)

(assert (=> b!543972 m!521413))

(assert (=> b!543763 d!81835))

(assert (=> d!81773 d!81721))

(declare-fun b!543973 () Bool)

(declare-fun e!314507 () Bool)

(declare-fun e!314506 () Bool)

(assert (=> b!543973 (= e!314507 e!314506)))

(declare-fun c!63082 () Bool)

(assert (=> b!543973 (= c!63082 (validKeyInArray!0 (select (arr!16511 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!81837 () Bool)

(declare-fun res!338454 () Bool)

(assert (=> d!81837 (=> res!338454 e!314507)))

(assert (=> d!81837 (= res!338454 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(assert (=> d!81837 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216) e!314507)))

(declare-fun bm!32063 () Bool)

(declare-fun call!32066 () Bool)

(assert (=> bm!32063 (= call!32066 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!543974 () Bool)

(assert (=> b!543974 (= e!314506 call!32066)))

(declare-fun b!543975 () Bool)

(declare-fun e!314508 () Bool)

(assert (=> b!543975 (= e!314506 e!314508)))

(declare-fun lt!248191 () (_ BitVec 64))

(assert (=> b!543975 (= lt!248191 (select (arr!16511 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!248190 () Unit!16892)

(assert (=> b!543975 (= lt!248190 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248191 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!543975 (arrayContainsKey!0 a!3154 lt!248191 #b00000000000000000000000000000000)))

(declare-fun lt!248192 () Unit!16892)

(assert (=> b!543975 (= lt!248192 lt!248190)))

(declare-fun res!338453 () Bool)

(assert (=> b!543975 (= res!338453 (= (seekEntryOrOpen!0 (select (arr!16511 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3154 mask!3216) (Found!4966 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!543975 (=> (not res!338453) (not e!314508))))

(declare-fun b!543976 () Bool)

(assert (=> b!543976 (= e!314508 call!32066)))

(assert (= (and d!81837 (not res!338454)) b!543973))

(assert (= (and b!543973 c!63082) b!543975))

(assert (= (and b!543973 (not c!63082)) b!543974))

(assert (= (and b!543975 res!338453) b!543976))

(assert (= (or b!543976 b!543974) bm!32063))

(assert (=> b!543973 m!521405))

(assert (=> b!543973 m!521405))

(assert (=> b!543973 m!521409))

(declare-fun m!521415 () Bool)

(assert (=> bm!32063 m!521415))

(assert (=> b!543975 m!521405))

(declare-fun m!521417 () Bool)

(assert (=> b!543975 m!521417))

(declare-fun m!521419 () Bool)

(assert (=> b!543975 m!521419))

(assert (=> b!543975 m!521405))

(declare-fun m!521421 () Bool)

(assert (=> b!543975 m!521421))

(assert (=> bm!32053 d!81837))

(declare-fun b!543989 () Bool)

(declare-fun e!314515 () SeekEntryResult!4966)

(declare-fun e!314517 () SeekEntryResult!4966)

(assert (=> b!543989 (= e!314515 e!314517)))

(declare-fun c!63089 () Bool)

(declare-fun lt!248197 () (_ BitVec 64))

(assert (=> b!543989 (= c!63089 (= lt!248197 k0!1998))))

(declare-fun b!543990 () Bool)

(declare-fun c!63090 () Bool)

(assert (=> b!543990 (= c!63090 (= lt!248197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314516 () SeekEntryResult!4966)

(assert (=> b!543990 (= e!314517 e!314516)))

(declare-fun b!543991 () Bool)

(assert (=> b!543991 (= e!314515 Undefined!4966)))

(declare-fun b!543992 () Bool)

(assert (=> b!543992 (= e!314516 (seekKeyOrZeroReturnVacant!0 (bvadd (x!51000 lt!248141) #b00000000000000000000000000000001) (nextIndex!0 (index!22090 lt!248141) (x!51000 lt!248141) mask!3216) (index!22090 lt!248141) k0!1998 a!3154 mask!3216))))

(declare-fun b!543993 () Bool)

(assert (=> b!543993 (= e!314517 (Found!4966 (index!22090 lt!248141)))))

(declare-fun lt!248198 () SeekEntryResult!4966)

(declare-fun d!81839 () Bool)

(assert (=> d!81839 (and (or ((_ is Undefined!4966) lt!248198) (not ((_ is Found!4966) lt!248198)) (and (bvsge (index!22089 lt!248198) #b00000000000000000000000000000000) (bvslt (index!22089 lt!248198) (size!16876 a!3154)))) (or ((_ is Undefined!4966) lt!248198) ((_ is Found!4966) lt!248198) (not ((_ is MissingVacant!4966) lt!248198)) (not (= (index!22091 lt!248198) (index!22090 lt!248141))) (and (bvsge (index!22091 lt!248198) #b00000000000000000000000000000000) (bvslt (index!22091 lt!248198) (size!16876 a!3154)))) (or ((_ is Undefined!4966) lt!248198) (ite ((_ is Found!4966) lt!248198) (= (select (arr!16511 a!3154) (index!22089 lt!248198)) k0!1998) (and ((_ is MissingVacant!4966) lt!248198) (= (index!22091 lt!248198) (index!22090 lt!248141)) (= (select (arr!16511 a!3154) (index!22091 lt!248198)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!81839 (= lt!248198 e!314515)))

(declare-fun c!63091 () Bool)

(assert (=> d!81839 (= c!63091 (bvsge (x!51000 lt!248141) #b01111111111111111111111111111110))))

(assert (=> d!81839 (= lt!248197 (select (arr!16511 a!3154) (index!22090 lt!248141)))))

(assert (=> d!81839 (validMask!0 mask!3216)))

(assert (=> d!81839 (= (seekKeyOrZeroReturnVacant!0 (x!51000 lt!248141) (index!22090 lt!248141) (index!22090 lt!248141) k0!1998 a!3154 mask!3216) lt!248198)))

(declare-fun b!543994 () Bool)

(assert (=> b!543994 (= e!314516 (MissingVacant!4966 (index!22090 lt!248141)))))

(assert (= (and d!81839 c!63091) b!543991))

(assert (= (and d!81839 (not c!63091)) b!543989))

(assert (= (and b!543989 c!63089) b!543993))

(assert (= (and b!543989 (not c!63089)) b!543990))

(assert (= (and b!543990 c!63090) b!543994))

(assert (= (and b!543990 (not c!63090)) b!543992))

(declare-fun m!521423 () Bool)

(assert (=> b!543992 m!521423))

(assert (=> b!543992 m!521423))

(declare-fun m!521425 () Bool)

(assert (=> b!543992 m!521425))

(declare-fun m!521427 () Bool)

(assert (=> d!81839 m!521427))

(declare-fun m!521429 () Bool)

(assert (=> d!81839 m!521429))

(assert (=> d!81839 m!521277))

(assert (=> d!81839 m!521079))

(assert (=> b!543852 d!81839))

(declare-fun b!543995 () Bool)

(declare-fun lt!248199 () SeekEntryResult!4966)

(assert (=> b!543995 (and (bvsge (index!22090 lt!248199) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248199) (size!16876 a!3154)))))

(declare-fun e!314518 () Bool)

(assert (=> b!543995 (= e!314518 (= (select (arr!16511 a!3154) (index!22090 lt!248199)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!543996 () Bool)

(assert (=> b!543996 (and (bvsge (index!22090 lt!248199) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248199) (size!16876 a!3154)))))

(declare-fun res!338456 () Bool)

(assert (=> b!543996 (= res!338456 (= (select (arr!16511 a!3154) (index!22090 lt!248199)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!543996 (=> res!338456 e!314518)))

(declare-fun e!314522 () SeekEntryResult!4966)

(declare-fun b!543997 () Bool)

(assert (=> b!543997 (= e!314522 (Intermediate!4966 false (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun b!543998 () Bool)

(assert (=> b!543998 (= e!314522 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543999 () Bool)

(declare-fun e!314521 () SeekEntryResult!4966)

(assert (=> b!543999 (= e!314521 e!314522)))

(declare-fun c!63094 () Bool)

(declare-fun lt!248200 () (_ BitVec 64))

(assert (=> b!543999 (= c!63094 (or (= lt!248200 (select (arr!16511 a!3154) j!147)) (= (bvadd lt!248200 lt!248200) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544000 () Bool)

(assert (=> b!544000 (and (bvsge (index!22090 lt!248199) #b00000000000000000000000000000000) (bvslt (index!22090 lt!248199) (size!16876 a!3154)))))

(declare-fun res!338455 () Bool)

(assert (=> b!544000 (= res!338455 (= (select (arr!16511 a!3154) (index!22090 lt!248199)) (select (arr!16511 a!3154) j!147)))))

(assert (=> b!544000 (=> res!338455 e!314518)))

(declare-fun e!314519 () Bool)

(assert (=> b!544000 (= e!314519 e!314518)))

(declare-fun b!544001 () Bool)

(assert (=> b!544001 (= e!314521 (Intermediate!4966 true (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun b!544002 () Bool)

(declare-fun e!314520 () Bool)

(assert (=> b!544002 (= e!314520 (bvsge (x!51000 lt!248199) #b01111111111111111111111111111110))))

(declare-fun b!544003 () Bool)

(assert (=> b!544003 (= e!314520 e!314519)))

(declare-fun res!338457 () Bool)

(assert (=> b!544003 (= res!338457 (and ((_ is Intermediate!4966) lt!248199) (not (undefined!5778 lt!248199)) (bvslt (x!51000 lt!248199) #b01111111111111111111111111111110) (bvsge (x!51000 lt!248199) #b00000000000000000000000000000000) (bvsge (x!51000 lt!248199) (bvadd x!1030 #b00000000000000000000000000000001))))))

(assert (=> b!544003 (=> (not res!338457) (not e!314519))))

(declare-fun d!81841 () Bool)

(assert (=> d!81841 e!314520))

(declare-fun c!63093 () Bool)

(assert (=> d!81841 (= c!63093 (and ((_ is Intermediate!4966) lt!248199) (undefined!5778 lt!248199)))))

(assert (=> d!81841 (= lt!248199 e!314521)))

(declare-fun c!63092 () Bool)

(assert (=> d!81841 (= c!63092 (bvsge (bvadd x!1030 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!81841 (= lt!248200 (select (arr!16511 a!3154) (nextIndex!0 index!1177 x!1030 mask!3216)))))

(assert (=> d!81841 (validMask!0 mask!3216)))

(assert (=> d!81841 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216) lt!248199)))

(assert (= (and d!81841 c!63092) b!544001))

(assert (= (and d!81841 (not c!63092)) b!543999))

(assert (= (and b!543999 c!63094) b!543997))

(assert (= (and b!543999 (not c!63094)) b!543998))

(assert (= (and d!81841 c!63093) b!544002))

(assert (= (and d!81841 (not c!63093)) b!544003))

(assert (= (and b!544003 res!338457) b!544000))

(assert (= (and b!544000 (not res!338455)) b!543996))

(assert (= (and b!543996 (not res!338456)) b!543995))

(declare-fun m!521431 () Bool)

(assert (=> b!543996 m!521431))

(assert (=> b!543998 m!521099))

(declare-fun m!521433 () Bool)

(assert (=> b!543998 m!521433))

(assert (=> b!543998 m!521433))

(assert (=> b!543998 m!521083))

(declare-fun m!521435 () Bool)

(assert (=> b!543998 m!521435))

(assert (=> b!543995 m!521431))

(assert (=> d!81841 m!521099))

(declare-fun m!521437 () Bool)

(assert (=> d!81841 m!521437))

(assert (=> d!81841 m!521079))

(assert (=> b!544000 m!521431))

(assert (=> b!543791 d!81841))

(assert (=> b!543791 d!81745))

(assert (=> b!543786 d!81823))

(declare-fun d!81843 () Bool)

(assert (=> d!81843 (arrayContainsKey!0 a!3154 lt!248114 #b00000000000000000000000000000000)))

(declare-fun lt!248203 () Unit!16892)

(declare-fun choose!13 (array!34356 (_ BitVec 64) (_ BitVec 32)) Unit!16892)

(assert (=> d!81843 (= lt!248203 (choose!13 a!3154 lt!248114 #b00000000000000000000000000000000))))

(assert (=> d!81843 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!81843 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248114 #b00000000000000000000000000000000) lt!248203)))

(declare-fun bs!16951 () Bool)

(assert (= bs!16951 d!81843))

(assert (=> bs!16951 m!521239))

(declare-fun m!521439 () Bool)

(assert (=> bs!16951 m!521439))

(assert (=> b!543756 d!81843))

(declare-fun d!81845 () Bool)

(declare-fun res!338458 () Bool)

(declare-fun e!314523 () Bool)

(assert (=> d!81845 (=> res!338458 e!314523)))

(assert (=> d!81845 (= res!338458 (= (select (arr!16511 a!3154) #b00000000000000000000000000000000) lt!248114))))

(assert (=> d!81845 (= (arrayContainsKey!0 a!3154 lt!248114 #b00000000000000000000000000000000) e!314523)))

(declare-fun b!544004 () Bool)

(declare-fun e!314524 () Bool)

(assert (=> b!544004 (= e!314523 e!314524)))

(declare-fun res!338459 () Bool)

(assert (=> b!544004 (=> (not res!338459) (not e!314524))))

(assert (=> b!544004 (= res!338459 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(declare-fun b!544005 () Bool)

(assert (=> b!544005 (= e!314524 (arrayContainsKey!0 a!3154 lt!248114 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81845 (not res!338458)) b!544004))

(assert (= (and b!544004 res!338459) b!544005))

(assert (=> d!81845 m!521227))

(declare-fun m!521441 () Bool)

(assert (=> b!544005 m!521441))

(assert (=> b!543756 d!81845))

(declare-fun b!544006 () Bool)

(declare-fun e!314526 () SeekEntryResult!4966)

(declare-fun e!314527 () SeekEntryResult!4966)

(assert (=> b!544006 (= e!314526 e!314527)))

(declare-fun lt!248205 () (_ BitVec 64))

(declare-fun lt!248204 () SeekEntryResult!4966)

(assert (=> b!544006 (= lt!248205 (select (arr!16511 a!3154) (index!22090 lt!248204)))))

(declare-fun c!63097 () Bool)

(assert (=> b!544006 (= c!63097 (= lt!248205 (select (arr!16511 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544007 () Bool)

(declare-fun c!63096 () Bool)

(assert (=> b!544007 (= c!63096 (= lt!248205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314525 () SeekEntryResult!4966)

(assert (=> b!544007 (= e!314527 e!314525)))

(declare-fun b!544008 () Bool)

(assert (=> b!544008 (= e!314526 Undefined!4966)))

(declare-fun b!544009 () Bool)

(assert (=> b!544009 (= e!314525 (MissingZero!4966 (index!22090 lt!248204)))))

(declare-fun d!81847 () Bool)

(declare-fun lt!248206 () SeekEntryResult!4966)

(assert (=> d!81847 (and (or ((_ is Undefined!4966) lt!248206) (not ((_ is Found!4966) lt!248206)) (and (bvsge (index!22089 lt!248206) #b00000000000000000000000000000000) (bvslt (index!22089 lt!248206) (size!16876 a!3154)))) (or ((_ is Undefined!4966) lt!248206) ((_ is Found!4966) lt!248206) (not ((_ is MissingZero!4966) lt!248206)) (and (bvsge (index!22088 lt!248206) #b00000000000000000000000000000000) (bvslt (index!22088 lt!248206) (size!16876 a!3154)))) (or ((_ is Undefined!4966) lt!248206) ((_ is Found!4966) lt!248206) ((_ is MissingZero!4966) lt!248206) (not ((_ is MissingVacant!4966) lt!248206)) (and (bvsge (index!22091 lt!248206) #b00000000000000000000000000000000) (bvslt (index!22091 lt!248206) (size!16876 a!3154)))) (or ((_ is Undefined!4966) lt!248206) (ite ((_ is Found!4966) lt!248206) (= (select (arr!16511 a!3154) (index!22089 lt!248206)) (select (arr!16511 a!3154) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!4966) lt!248206) (= (select (arr!16511 a!3154) (index!22088 lt!248206)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4966) lt!248206) (= (select (arr!16511 a!3154) (index!22091 lt!248206)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81847 (= lt!248206 e!314526)))

(declare-fun c!63095 () Bool)

(assert (=> d!81847 (= c!63095 (and ((_ is Intermediate!4966) lt!248204) (undefined!5778 lt!248204)))))

(assert (=> d!81847 (= lt!248204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16511 a!3154) #b00000000000000000000000000000000) mask!3216) (select (arr!16511 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(assert (=> d!81847 (validMask!0 mask!3216)))

(assert (=> d!81847 (= (seekEntryOrOpen!0 (select (arr!16511 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) lt!248206)))

(declare-fun b!544010 () Bool)

(assert (=> b!544010 (= e!314525 (seekKeyOrZeroReturnVacant!0 (x!51000 lt!248204) (index!22090 lt!248204) (index!22090 lt!248204) (select (arr!16511 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(declare-fun b!544011 () Bool)

(assert (=> b!544011 (= e!314527 (Found!4966 (index!22090 lt!248204)))))

(assert (= (and d!81847 c!63095) b!544008))

(assert (= (and d!81847 (not c!63095)) b!544006))

(assert (= (and b!544006 c!63097) b!544011))

(assert (= (and b!544006 (not c!63097)) b!544007))

(assert (= (and b!544007 c!63096) b!544009))

(assert (= (and b!544007 (not c!63096)) b!544010))

(declare-fun m!521443 () Bool)

(assert (=> b!544006 m!521443))

(declare-fun m!521445 () Bool)

(assert (=> d!81847 m!521445))

(declare-fun m!521447 () Bool)

(assert (=> d!81847 m!521447))

(assert (=> d!81847 m!521227))

(declare-fun m!521449 () Bool)

(assert (=> d!81847 m!521449))

(assert (=> d!81847 m!521079))

(declare-fun m!521451 () Bool)

(assert (=> d!81847 m!521451))

(assert (=> d!81847 m!521227))

(assert (=> d!81847 m!521447))

(declare-fun m!521453 () Bool)

(assert (=> d!81847 m!521453))

(assert (=> b!544010 m!521227))

(declare-fun m!521455 () Bool)

(assert (=> b!544010 m!521455))

(assert (=> b!543756 d!81847))

(assert (=> d!81731 d!81721))

(check-sat (not d!81841) (not b!543973) (not d!81821) (not b!543951) (not b!543947) (not b!543975) (not b!543972) (not d!81825) (not d!81829) (not bm!32063) (not d!81843) (not b!543969) (not b!543992) (not d!81827) (not d!81847) (not b!543960) (not b!544010) (not bm!32062) (not b!543998) (not b!544005) (not d!81839) (not b!543966) (not b!543967))
(check-sat)
