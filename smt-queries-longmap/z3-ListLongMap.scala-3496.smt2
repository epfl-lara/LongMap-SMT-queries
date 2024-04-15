; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48480 () Bool)

(assert start!48480)

(declare-fun b!532408 () Bool)

(declare-fun res!327901 () Bool)

(declare-fun e!309921 () Bool)

(assert (=> b!532408 (=> (not res!327901) (not e!309921))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532408 (= res!327901 (validKeyInArray!0 k0!1998))))

(declare-fun b!532409 () Bool)

(declare-fun e!309919 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!245025 () (_ BitVec 32))

(assert (=> b!532409 (= e!309919 (and (bvsge mask!3216 #b00000000000000000000000000000000) (or (bvslt lt!245025 #b00000000000000000000000000000000) (bvsge lt!245025 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33753 0))(
  ( (array!33754 (arr!16217 (Array (_ BitVec 32) (_ BitVec 64))) (size!16582 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532409 (= lt!245025 (toIndex!0 (select (arr!16217 a!3154) j!147) mask!3216))))

(declare-fun b!532410 () Bool)

(assert (=> b!532410 (= e!309921 e!309919)))

(declare-fun res!327898 () Bool)

(assert (=> b!532410 (=> (not res!327898) (not e!309919))))

(declare-datatypes ((SeekEntryResult!4672 0))(
  ( (MissingZero!4672 (index!20912 (_ BitVec 32))) (Found!4672 (index!20913 (_ BitVec 32))) (Intermediate!4672 (undefined!5484 Bool) (index!20914 (_ BitVec 32)) (x!49892 (_ BitVec 32))) (Undefined!4672) (MissingVacant!4672 (index!20915 (_ BitVec 32))) )
))
(declare-fun lt!245026 () SeekEntryResult!4672)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532410 (= res!327898 (or (= lt!245026 (MissingZero!4672 i!1153)) (= lt!245026 (MissingVacant!4672 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33753 (_ BitVec 32)) SeekEntryResult!4672)

(assert (=> b!532410 (= lt!245026 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!327904 () Bool)

(assert (=> start!48480 (=> (not res!327904) (not e!309921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48480 (= res!327904 (validMask!0 mask!3216))))

(assert (=> start!48480 e!309921))

(assert (=> start!48480 true))

(declare-fun array_inv!12100 (array!33753) Bool)

(assert (=> start!48480 (array_inv!12100 a!3154)))

(declare-fun b!532411 () Bool)

(declare-fun res!327899 () Bool)

(assert (=> b!532411 (=> (not res!327899) (not e!309921))))

(declare-fun arrayContainsKey!0 (array!33753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532411 (= res!327899 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532412 () Bool)

(declare-fun res!327902 () Bool)

(assert (=> b!532412 (=> (not res!327902) (not e!309919))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!532412 (= res!327902 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16582 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16582 a!3154)) (= (select (arr!16217 a!3154) resIndex!32) (select (arr!16217 a!3154) j!147))))))

(declare-fun b!532413 () Bool)

(declare-fun res!327896 () Bool)

(assert (=> b!532413 (=> (not res!327896) (not e!309921))))

(assert (=> b!532413 (= res!327896 (and (= (size!16582 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16582 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16582 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532414 () Bool)

(declare-fun res!327903 () Bool)

(assert (=> b!532414 (=> (not res!327903) (not e!309919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33753 (_ BitVec 32)) Bool)

(assert (=> b!532414 (= res!327903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532415 () Bool)

(declare-fun res!327900 () Bool)

(assert (=> b!532415 (=> (not res!327900) (not e!309919))))

(declare-datatypes ((List!10375 0))(
  ( (Nil!10372) (Cons!10371 (h!11311 (_ BitVec 64)) (t!16594 List!10375)) )
))
(declare-fun arrayNoDuplicates!0 (array!33753 (_ BitVec 32) List!10375) Bool)

(assert (=> b!532415 (= res!327900 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10372))))

(declare-fun b!532416 () Bool)

(declare-fun res!327897 () Bool)

(assert (=> b!532416 (=> (not res!327897) (not e!309921))))

(assert (=> b!532416 (= res!327897 (validKeyInArray!0 (select (arr!16217 a!3154) j!147)))))

(declare-fun b!532417 () Bool)

(declare-fun res!327905 () Bool)

(assert (=> b!532417 (=> (not res!327905) (not e!309919))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33753 (_ BitVec 32)) SeekEntryResult!4672)

(assert (=> b!532417 (= res!327905 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16217 a!3154) j!147) a!3154 mask!3216) (Intermediate!4672 false resIndex!32 resX!32)))))

(assert (= (and start!48480 res!327904) b!532413))

(assert (= (and b!532413 res!327896) b!532416))

(assert (= (and b!532416 res!327897) b!532408))

(assert (= (and b!532408 res!327901) b!532411))

(assert (= (and b!532411 res!327899) b!532410))

(assert (= (and b!532410 res!327898) b!532414))

(assert (= (and b!532414 res!327903) b!532415))

(assert (= (and b!532415 res!327900) b!532412))

(assert (= (and b!532412 res!327902) b!532417))

(assert (= (and b!532417 res!327905) b!532409))

(declare-fun m!512029 () Bool)

(assert (=> b!532410 m!512029))

(declare-fun m!512031 () Bool)

(assert (=> b!532417 m!512031))

(assert (=> b!532417 m!512031))

(declare-fun m!512033 () Bool)

(assert (=> b!532417 m!512033))

(declare-fun m!512035 () Bool)

(assert (=> b!532414 m!512035))

(assert (=> b!532416 m!512031))

(assert (=> b!532416 m!512031))

(declare-fun m!512037 () Bool)

(assert (=> b!532416 m!512037))

(declare-fun m!512039 () Bool)

(assert (=> b!532411 m!512039))

(declare-fun m!512041 () Bool)

(assert (=> b!532415 m!512041))

(declare-fun m!512043 () Bool)

(assert (=> b!532408 m!512043))

(assert (=> b!532409 m!512031))

(assert (=> b!532409 m!512031))

(declare-fun m!512045 () Bool)

(assert (=> b!532409 m!512045))

(declare-fun m!512047 () Bool)

(assert (=> b!532412 m!512047))

(assert (=> b!532412 m!512031))

(declare-fun m!512049 () Bool)

(assert (=> start!48480 m!512049))

(declare-fun m!512051 () Bool)

(assert (=> start!48480 m!512051))

(check-sat (not b!532409) (not b!532410) (not b!532416) (not start!48480) (not b!532411) (not b!532414) (not b!532415) (not b!532417) (not b!532408))
(check-sat)
(get-model)

(declare-fun d!81191 () Bool)

(assert (=> d!81191 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48480 d!81191))

(declare-fun d!81193 () Bool)

(assert (=> d!81193 (= (array_inv!12100 a!3154) (bvsge (size!16582 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48480 d!81193))

(declare-fun b!532508 () Bool)

(declare-fun e!309956 () Bool)

(declare-fun lt!245053 () SeekEntryResult!4672)

(assert (=> b!532508 (= e!309956 (bvsge (x!49892 lt!245053) #b01111111111111111111111111111110))))

(declare-fun b!532509 () Bool)

(declare-fun e!309960 () SeekEntryResult!4672)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532509 (= e!309960 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16217 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!532510 () Bool)

(declare-fun e!309957 () Bool)

(assert (=> b!532510 (= e!309956 e!309957)))

(declare-fun res!327973 () Bool)

(get-info :version)

(assert (=> b!532510 (= res!327973 (and ((_ is Intermediate!4672) lt!245053) (not (undefined!5484 lt!245053)) (bvslt (x!49892 lt!245053) #b01111111111111111111111111111110) (bvsge (x!49892 lt!245053) #b00000000000000000000000000000000) (bvsge (x!49892 lt!245053) x!1030)))))

(assert (=> b!532510 (=> (not res!327973) (not e!309957))))

(declare-fun b!532511 () Bool)

(assert (=> b!532511 (= e!309960 (Intermediate!4672 false index!1177 x!1030))))

(declare-fun b!532512 () Bool)

(assert (=> b!532512 (and (bvsge (index!20914 lt!245053) #b00000000000000000000000000000000) (bvslt (index!20914 lt!245053) (size!16582 a!3154)))))

(declare-fun e!309958 () Bool)

(assert (=> b!532512 (= e!309958 (= (select (arr!16217 a!3154) (index!20914 lt!245053)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!532513 () Bool)

(declare-fun e!309959 () SeekEntryResult!4672)

(assert (=> b!532513 (= e!309959 (Intermediate!4672 true index!1177 x!1030))))

(declare-fun d!81195 () Bool)

(assert (=> d!81195 e!309956))

(declare-fun c!62580 () Bool)

(assert (=> d!81195 (= c!62580 (and ((_ is Intermediate!4672) lt!245053) (undefined!5484 lt!245053)))))

(assert (=> d!81195 (= lt!245053 e!309959)))

(declare-fun c!62578 () Bool)

(assert (=> d!81195 (= c!62578 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!245054 () (_ BitVec 64))

(assert (=> d!81195 (= lt!245054 (select (arr!16217 a!3154) index!1177))))

(assert (=> d!81195 (validMask!0 mask!3216)))

(assert (=> d!81195 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16217 a!3154) j!147) a!3154 mask!3216) lt!245053)))

(declare-fun b!532514 () Bool)

(assert (=> b!532514 (and (bvsge (index!20914 lt!245053) #b00000000000000000000000000000000) (bvslt (index!20914 lt!245053) (size!16582 a!3154)))))

(declare-fun res!327975 () Bool)

(assert (=> b!532514 (= res!327975 (= (select (arr!16217 a!3154) (index!20914 lt!245053)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532514 (=> res!327975 e!309958)))

(declare-fun b!532515 () Bool)

(assert (=> b!532515 (and (bvsge (index!20914 lt!245053) #b00000000000000000000000000000000) (bvslt (index!20914 lt!245053) (size!16582 a!3154)))))

(declare-fun res!327974 () Bool)

(assert (=> b!532515 (= res!327974 (= (select (arr!16217 a!3154) (index!20914 lt!245053)) (select (arr!16217 a!3154) j!147)))))

(assert (=> b!532515 (=> res!327974 e!309958)))

(assert (=> b!532515 (= e!309957 e!309958)))

(declare-fun b!532516 () Bool)

(assert (=> b!532516 (= e!309959 e!309960)))

(declare-fun c!62579 () Bool)

(assert (=> b!532516 (= c!62579 (or (= lt!245054 (select (arr!16217 a!3154) j!147)) (= (bvadd lt!245054 lt!245054) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!81195 c!62578) b!532513))

(assert (= (and d!81195 (not c!62578)) b!532516))

(assert (= (and b!532516 c!62579) b!532511))

(assert (= (and b!532516 (not c!62579)) b!532509))

(assert (= (and d!81195 c!62580) b!532508))

(assert (= (and d!81195 (not c!62580)) b!532510))

(assert (= (and b!532510 res!327973) b!532515))

(assert (= (and b!532515 (not res!327974)) b!532514))

(assert (= (and b!532514 (not res!327975)) b!532512))

(declare-fun m!512101 () Bool)

(assert (=> b!532515 m!512101))

(declare-fun m!512103 () Bool)

(assert (=> b!532509 m!512103))

(assert (=> b!532509 m!512103))

(assert (=> b!532509 m!512031))

(declare-fun m!512105 () Bool)

(assert (=> b!532509 m!512105))

(assert (=> b!532514 m!512101))

(assert (=> b!532512 m!512101))

(declare-fun m!512107 () Bool)

(assert (=> d!81195 m!512107))

(assert (=> d!81195 m!512049))

(assert (=> b!532417 d!81195))

(declare-fun d!81205 () Bool)

(assert (=> d!81205 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532408 d!81205))

(declare-fun b!532558 () Bool)

(declare-fun e!309992 () Bool)

(declare-fun e!309991 () Bool)

(assert (=> b!532558 (= e!309992 e!309991)))

(declare-fun res!327999 () Bool)

(assert (=> b!532558 (=> (not res!327999) (not e!309991))))

(declare-fun e!309990 () Bool)

(assert (=> b!532558 (= res!327999 (not e!309990))))

(declare-fun res!327997 () Bool)

(assert (=> b!532558 (=> (not res!327997) (not e!309990))))

(assert (=> b!532558 (= res!327997 (validKeyInArray!0 (select (arr!16217 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532559 () Bool)

(declare-fun e!309993 () Bool)

(assert (=> b!532559 (= e!309991 e!309993)))

(declare-fun c!62592 () Bool)

(assert (=> b!532559 (= c!62592 (validKeyInArray!0 (select (arr!16217 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532560 () Bool)

(declare-fun contains!2770 (List!10375 (_ BitVec 64)) Bool)

(assert (=> b!532560 (= e!309990 (contains!2770 Nil!10372 (select (arr!16217 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!31954 () Bool)

(declare-fun call!31957 () Bool)

(assert (=> bm!31954 (= call!31957 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62592 (Cons!10371 (select (arr!16217 a!3154) #b00000000000000000000000000000000) Nil!10372) Nil!10372)))))

(declare-fun d!81207 () Bool)

(declare-fun res!327998 () Bool)

(assert (=> d!81207 (=> res!327998 e!309992)))

(assert (=> d!81207 (= res!327998 (bvsge #b00000000000000000000000000000000 (size!16582 a!3154)))))

(assert (=> d!81207 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10372) e!309992)))

(declare-fun b!532561 () Bool)

(assert (=> b!532561 (= e!309993 call!31957)))

(declare-fun b!532562 () Bool)

(assert (=> b!532562 (= e!309993 call!31957)))

(assert (= (and d!81207 (not res!327998)) b!532558))

(assert (= (and b!532558 res!327997) b!532560))

(assert (= (and b!532558 res!327999) b!532559))

(assert (= (and b!532559 c!62592) b!532562))

(assert (= (and b!532559 (not c!62592)) b!532561))

(assert (= (or b!532562 b!532561) bm!31954))

(declare-fun m!512117 () Bool)

(assert (=> b!532558 m!512117))

(assert (=> b!532558 m!512117))

(declare-fun m!512119 () Bool)

(assert (=> b!532558 m!512119))

(assert (=> b!532559 m!512117))

(assert (=> b!532559 m!512117))

(assert (=> b!532559 m!512119))

(assert (=> b!532560 m!512117))

(assert (=> b!532560 m!512117))

(declare-fun m!512121 () Bool)

(assert (=> b!532560 m!512121))

(assert (=> bm!31954 m!512117))

(declare-fun m!512125 () Bool)

(assert (=> bm!31954 m!512125))

(assert (=> b!532415 d!81207))

(declare-fun b!532588 () Bool)

(declare-fun e!310010 () Bool)

(declare-fun e!310009 () Bool)

(assert (=> b!532588 (= e!310010 e!310009)))

(declare-fun lt!245072 () (_ BitVec 64))

(assert (=> b!532588 (= lt!245072 (select (arr!16217 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16822 0))(
  ( (Unit!16823) )
))
(declare-fun lt!245074 () Unit!16822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33753 (_ BitVec 64) (_ BitVec 32)) Unit!16822)

(assert (=> b!532588 (= lt!245074 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245072 #b00000000000000000000000000000000))))

(assert (=> b!532588 (arrayContainsKey!0 a!3154 lt!245072 #b00000000000000000000000000000000)))

(declare-fun lt!245073 () Unit!16822)

(assert (=> b!532588 (= lt!245073 lt!245074)))

(declare-fun res!328008 () Bool)

(assert (=> b!532588 (= res!328008 (= (seekEntryOrOpen!0 (select (arr!16217 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4672 #b00000000000000000000000000000000)))))

(assert (=> b!532588 (=> (not res!328008) (not e!310009))))

(declare-fun d!81211 () Bool)

(declare-fun res!328007 () Bool)

(declare-fun e!310011 () Bool)

(assert (=> d!81211 (=> res!328007 e!310011)))

(assert (=> d!81211 (= res!328007 (bvsge #b00000000000000000000000000000000 (size!16582 a!3154)))))

(assert (=> d!81211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!310011)))

(declare-fun b!532589 () Bool)

(declare-fun call!31963 () Bool)

(assert (=> b!532589 (= e!310009 call!31963)))

(declare-fun bm!31960 () Bool)

(assert (=> bm!31960 (= call!31963 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!532590 () Bool)

(assert (=> b!532590 (= e!310011 e!310010)))

(declare-fun c!62601 () Bool)

(assert (=> b!532590 (= c!62601 (validKeyInArray!0 (select (arr!16217 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532591 () Bool)

(assert (=> b!532591 (= e!310010 call!31963)))

(assert (= (and d!81211 (not res!328007)) b!532590))

(assert (= (and b!532590 c!62601) b!532588))

(assert (= (and b!532590 (not c!62601)) b!532591))

(assert (= (and b!532588 res!328008) b!532589))

(assert (= (or b!532589 b!532591) bm!31960))

(assert (=> b!532588 m!512117))

(declare-fun m!512147 () Bool)

(assert (=> b!532588 m!512147))

(declare-fun m!512149 () Bool)

(assert (=> b!532588 m!512149))

(assert (=> b!532588 m!512117))

(declare-fun m!512151 () Bool)

(assert (=> b!532588 m!512151))

(declare-fun m!512153 () Bool)

(assert (=> bm!31960 m!512153))

(assert (=> b!532590 m!512117))

(assert (=> b!532590 m!512117))

(assert (=> b!532590 m!512119))

(assert (=> b!532414 d!81211))

(declare-fun d!81217 () Bool)

(declare-fun lt!245080 () (_ BitVec 32))

(declare-fun lt!245079 () (_ BitVec 32))

(assert (=> d!81217 (= lt!245080 (bvmul (bvxor lt!245079 (bvlshr lt!245079 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81217 (= lt!245079 ((_ extract 31 0) (bvand (bvxor (select (arr!16217 a!3154) j!147) (bvlshr (select (arr!16217 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81217 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!328009 (let ((h!11315 ((_ extract 31 0) (bvand (bvxor (select (arr!16217 a!3154) j!147) (bvlshr (select (arr!16217 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49898 (bvmul (bvxor h!11315 (bvlshr h!11315 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49898 (bvlshr x!49898 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!328009 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!328009 #b00000000000000000000000000000000))))))

(assert (=> d!81217 (= (toIndex!0 (select (arr!16217 a!3154) j!147) mask!3216) (bvand (bvxor lt!245080 (bvlshr lt!245080 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!532409 d!81217))

(declare-fun d!81231 () Bool)

(assert (=> d!81231 (= (validKeyInArray!0 (select (arr!16217 a!3154) j!147)) (and (not (= (select (arr!16217 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16217 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532416 d!81231))

(declare-fun d!81233 () Bool)

(declare-fun res!328026 () Bool)

(declare-fun e!310028 () Bool)

(assert (=> d!81233 (=> res!328026 e!310028)))

(assert (=> d!81233 (= res!328026 (= (select (arr!16217 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81233 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!310028)))

(declare-fun b!532608 () Bool)

(declare-fun e!310029 () Bool)

(assert (=> b!532608 (= e!310028 e!310029)))

(declare-fun res!328027 () Bool)

(assert (=> b!532608 (=> (not res!328027) (not e!310029))))

(assert (=> b!532608 (= res!328027 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16582 a!3154)))))

(declare-fun b!532609 () Bool)

(assert (=> b!532609 (= e!310029 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81233 (not res!328026)) b!532608))

(assert (= (and b!532608 res!328027) b!532609))

(assert (=> d!81233 m!512117))

(declare-fun m!512161 () Bool)

(assert (=> b!532609 m!512161))

(assert (=> b!532411 d!81233))

(declare-fun b!532661 () Bool)

(declare-fun e!310068 () SeekEntryResult!4672)

(declare-fun lt!245107 () SeekEntryResult!4672)

(assert (=> b!532661 (= e!310068 (MissingZero!4672 (index!20914 lt!245107)))))

(declare-fun b!532662 () Bool)

(declare-fun e!310066 () SeekEntryResult!4672)

(assert (=> b!532662 (= e!310066 (Found!4672 (index!20914 lt!245107)))))

(declare-fun b!532663 () Bool)

(declare-fun c!62619 () Bool)

(declare-fun lt!245106 () (_ BitVec 64))

(assert (=> b!532663 (= c!62619 (= lt!245106 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532663 (= e!310066 e!310068)))

(declare-fun d!81237 () Bool)

(declare-fun lt!245105 () SeekEntryResult!4672)

(assert (=> d!81237 (and (or ((_ is Undefined!4672) lt!245105) (not ((_ is Found!4672) lt!245105)) (and (bvsge (index!20913 lt!245105) #b00000000000000000000000000000000) (bvslt (index!20913 lt!245105) (size!16582 a!3154)))) (or ((_ is Undefined!4672) lt!245105) ((_ is Found!4672) lt!245105) (not ((_ is MissingZero!4672) lt!245105)) (and (bvsge (index!20912 lt!245105) #b00000000000000000000000000000000) (bvslt (index!20912 lt!245105) (size!16582 a!3154)))) (or ((_ is Undefined!4672) lt!245105) ((_ is Found!4672) lt!245105) ((_ is MissingZero!4672) lt!245105) (not ((_ is MissingVacant!4672) lt!245105)) (and (bvsge (index!20915 lt!245105) #b00000000000000000000000000000000) (bvslt (index!20915 lt!245105) (size!16582 a!3154)))) (or ((_ is Undefined!4672) lt!245105) (ite ((_ is Found!4672) lt!245105) (= (select (arr!16217 a!3154) (index!20913 lt!245105)) k0!1998) (ite ((_ is MissingZero!4672) lt!245105) (= (select (arr!16217 a!3154) (index!20912 lt!245105)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4672) lt!245105) (= (select (arr!16217 a!3154) (index!20915 lt!245105)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!310067 () SeekEntryResult!4672)

(assert (=> d!81237 (= lt!245105 e!310067)))

(declare-fun c!62617 () Bool)

(assert (=> d!81237 (= c!62617 (and ((_ is Intermediate!4672) lt!245107) (undefined!5484 lt!245107)))))

(assert (=> d!81237 (= lt!245107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81237 (validMask!0 mask!3216)))

(assert (=> d!81237 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!245105)))

(declare-fun b!532664 () Bool)

(assert (=> b!532664 (= e!310067 e!310066)))

(assert (=> b!532664 (= lt!245106 (select (arr!16217 a!3154) (index!20914 lt!245107)))))

(declare-fun c!62618 () Bool)

(assert (=> b!532664 (= c!62618 (= lt!245106 k0!1998))))

(declare-fun b!532665 () Bool)

(assert (=> b!532665 (= e!310067 Undefined!4672)))

(declare-fun b!532666 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33753 (_ BitVec 32)) SeekEntryResult!4672)

(assert (=> b!532666 (= e!310068 (seekKeyOrZeroReturnVacant!0 (x!49892 lt!245107) (index!20914 lt!245107) (index!20914 lt!245107) k0!1998 a!3154 mask!3216))))

(assert (= (and d!81237 c!62617) b!532665))

(assert (= (and d!81237 (not c!62617)) b!532664))

(assert (= (and b!532664 c!62618) b!532662))

(assert (= (and b!532664 (not c!62618)) b!532663))

(assert (= (and b!532663 c!62619) b!532661))

(assert (= (and b!532663 (not c!62619)) b!532666))

(declare-fun m!512185 () Bool)

(assert (=> d!81237 m!512185))

(declare-fun m!512187 () Bool)

(assert (=> d!81237 m!512187))

(declare-fun m!512189 () Bool)

(assert (=> d!81237 m!512189))

(declare-fun m!512191 () Bool)

(assert (=> d!81237 m!512191))

(assert (=> d!81237 m!512049))

(declare-fun m!512193 () Bool)

(assert (=> d!81237 m!512193))

(assert (=> d!81237 m!512185))

(declare-fun m!512195 () Bool)

(assert (=> b!532664 m!512195))

(declare-fun m!512197 () Bool)

(assert (=> b!532666 m!512197))

(assert (=> b!532410 d!81237))

(check-sat (not b!532558) (not b!532609) (not b!532590) (not b!532588) (not b!532559) (not d!81237) (not b!532509) (not b!532560) (not bm!31960) (not b!532666) (not bm!31954) (not d!81195))
(check-sat)
