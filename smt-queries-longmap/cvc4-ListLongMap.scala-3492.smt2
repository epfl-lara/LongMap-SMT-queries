; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48424 () Bool)

(assert start!48424)

(declare-fun b!532145 () Bool)

(declare-fun res!327640 () Bool)

(declare-fun e!309852 () Bool)

(assert (=> b!532145 (=> (not res!327640) (not e!309852))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33732 0))(
  ( (array!33733 (arr!16208 (Array (_ BitVec 32) (_ BitVec 64))) (size!16572 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33732)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4666 0))(
  ( (MissingZero!4666 (index!20888 (_ BitVec 32))) (Found!4666 (index!20889 (_ BitVec 32))) (Intermediate!4666 (undefined!5478 Bool) (index!20890 (_ BitVec 32)) (x!49856 (_ BitVec 32))) (Undefined!4666) (MissingVacant!4666 (index!20891 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33732 (_ BitVec 32)) SeekEntryResult!4666)

(assert (=> b!532145 (= res!327640 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16208 a!3154) j!147) a!3154 mask!3216) (Intermediate!4666 false resIndex!32 resX!32)))))

(declare-fun res!327638 () Bool)

(declare-fun e!309851 () Bool)

(assert (=> start!48424 (=> (not res!327638) (not e!309851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48424 (= res!327638 (validMask!0 mask!3216))))

(assert (=> start!48424 e!309851))

(assert (=> start!48424 true))

(declare-fun array_inv!12004 (array!33732) Bool)

(assert (=> start!48424 (array_inv!12004 a!3154)))

(declare-fun b!532146 () Bool)

(declare-fun res!327644 () Bool)

(assert (=> b!532146 (=> (not res!327644) (not e!309852))))

(declare-datatypes ((List!10327 0))(
  ( (Nil!10324) (Cons!10323 (h!11263 (_ BitVec 64)) (t!16555 List!10327)) )
))
(declare-fun arrayNoDuplicates!0 (array!33732 (_ BitVec 32) List!10327) Bool)

(assert (=> b!532146 (= res!327644 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10324))))

(declare-fun b!532147 () Bool)

(assert (=> b!532147 (= e!309852 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsgt mask!3216 #b00111111111111111111111111111111)))))

(declare-fun b!532148 () Bool)

(declare-fun res!327641 () Bool)

(assert (=> b!532148 (=> (not res!327641) (not e!309851))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532148 (= res!327641 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532149 () Bool)

(declare-fun res!327643 () Bool)

(assert (=> b!532149 (=> (not res!327643) (not e!309851))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532149 (= res!327643 (and (= (size!16572 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16572 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16572 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532150 () Bool)

(declare-fun res!327642 () Bool)

(assert (=> b!532150 (=> (not res!327642) (not e!309852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33732 (_ BitVec 32)) Bool)

(assert (=> b!532150 (= res!327642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532151 () Bool)

(declare-fun res!327635 () Bool)

(assert (=> b!532151 (=> (not res!327635) (not e!309851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532151 (= res!327635 (validKeyInArray!0 k!1998))))

(declare-fun b!532152 () Bool)

(assert (=> b!532152 (= e!309851 e!309852)))

(declare-fun res!327639 () Bool)

(assert (=> b!532152 (=> (not res!327639) (not e!309852))))

(declare-fun lt!245128 () SeekEntryResult!4666)

(assert (=> b!532152 (= res!327639 (or (= lt!245128 (MissingZero!4666 i!1153)) (= lt!245128 (MissingVacant!4666 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33732 (_ BitVec 32)) SeekEntryResult!4666)

(assert (=> b!532152 (= lt!245128 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532153 () Bool)

(declare-fun res!327637 () Bool)

(assert (=> b!532153 (=> (not res!327637) (not e!309852))))

(assert (=> b!532153 (= res!327637 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16572 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16572 a!3154)) (= (select (arr!16208 a!3154) resIndex!32) (select (arr!16208 a!3154) j!147))))))

(declare-fun b!532154 () Bool)

(declare-fun res!327636 () Bool)

(assert (=> b!532154 (=> (not res!327636) (not e!309851))))

(assert (=> b!532154 (= res!327636 (validKeyInArray!0 (select (arr!16208 a!3154) j!147)))))

(assert (= (and start!48424 res!327638) b!532149))

(assert (= (and b!532149 res!327643) b!532154))

(assert (= (and b!532154 res!327636) b!532151))

(assert (= (and b!532151 res!327635) b!532148))

(assert (= (and b!532148 res!327641) b!532152))

(assert (= (and b!532152 res!327639) b!532150))

(assert (= (and b!532150 res!327642) b!532146))

(assert (= (and b!532146 res!327644) b!532153))

(assert (= (and b!532153 res!327637) b!532145))

(assert (= (and b!532145 res!327640) b!532147))

(declare-fun m!512423 () Bool)

(assert (=> b!532152 m!512423))

(declare-fun m!512425 () Bool)

(assert (=> b!532153 m!512425))

(declare-fun m!512427 () Bool)

(assert (=> b!532153 m!512427))

(declare-fun m!512429 () Bool)

(assert (=> b!532150 m!512429))

(declare-fun m!512431 () Bool)

(assert (=> start!48424 m!512431))

(declare-fun m!512433 () Bool)

(assert (=> start!48424 m!512433))

(assert (=> b!532145 m!512427))

(assert (=> b!532145 m!512427))

(declare-fun m!512435 () Bool)

(assert (=> b!532145 m!512435))

(declare-fun m!512437 () Bool)

(assert (=> b!532146 m!512437))

(declare-fun m!512439 () Bool)

(assert (=> b!532148 m!512439))

(declare-fun m!512441 () Bool)

(assert (=> b!532151 m!512441))

(assert (=> b!532154 m!512427))

(assert (=> b!532154 m!512427))

(declare-fun m!512443 () Bool)

(assert (=> b!532154 m!512443))

(push 1)

(assert (not start!48424))

(assert (not b!532150))

(assert (not b!532152))

(assert (not b!532146))

(assert (not b!532148))

(assert (not b!532145))

(assert (not b!532154))

(assert (not b!532151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81347 () Bool)

(declare-fun lt!245157 () SeekEntryResult!4666)

(assert (=> d!81347 (and (or (is-Undefined!4666 lt!245157) (not (is-Found!4666 lt!245157)) (and (bvsge (index!20889 lt!245157) #b00000000000000000000000000000000) (bvslt (index!20889 lt!245157) (size!16572 a!3154)))) (or (is-Undefined!4666 lt!245157) (is-Found!4666 lt!245157) (not (is-MissingZero!4666 lt!245157)) (and (bvsge (index!20888 lt!245157) #b00000000000000000000000000000000) (bvslt (index!20888 lt!245157) (size!16572 a!3154)))) (or (is-Undefined!4666 lt!245157) (is-Found!4666 lt!245157) (is-MissingZero!4666 lt!245157) (not (is-MissingVacant!4666 lt!245157)) (and (bvsge (index!20891 lt!245157) #b00000000000000000000000000000000) (bvslt (index!20891 lt!245157) (size!16572 a!3154)))) (or (is-Undefined!4666 lt!245157) (ite (is-Found!4666 lt!245157) (= (select (arr!16208 a!3154) (index!20889 lt!245157)) k!1998) (ite (is-MissingZero!4666 lt!245157) (= (select (arr!16208 a!3154) (index!20888 lt!245157)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4666 lt!245157) (= (select (arr!16208 a!3154) (index!20891 lt!245157)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!309897 () SeekEntryResult!4666)

(assert (=> d!81347 (= lt!245157 e!309897)))

(declare-fun c!62583 () Bool)

(declare-fun lt!245158 () SeekEntryResult!4666)

(assert (=> d!81347 (= c!62583 (and (is-Intermediate!4666 lt!245158) (undefined!5478 lt!245158)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81347 (= lt!245158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81347 (validMask!0 mask!3216)))

(assert (=> d!81347 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!245157)))

(declare-fun b!532216 () Bool)

(declare-fun e!309899 () SeekEntryResult!4666)

(assert (=> b!532216 (= e!309899 (MissingZero!4666 (index!20890 lt!245158)))))

(declare-fun b!532217 () Bool)

(assert (=> b!532217 (= e!309897 Undefined!4666)))

(declare-fun b!532218 () Bool)

(declare-fun e!309898 () SeekEntryResult!4666)

(assert (=> b!532218 (= e!309898 (Found!4666 (index!20890 lt!245158)))))

(declare-fun b!532219 () Bool)

(declare-fun c!62582 () Bool)

(declare-fun lt!245159 () (_ BitVec 64))

(assert (=> b!532219 (= c!62582 (= lt!245159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532219 (= e!309898 e!309899)))

(declare-fun b!532220 () Bool)

(assert (=> b!532220 (= e!309897 e!309898)))

(assert (=> b!532220 (= lt!245159 (select (arr!16208 a!3154) (index!20890 lt!245158)))))

(declare-fun c!62584 () Bool)

(assert (=> b!532220 (= c!62584 (= lt!245159 k!1998))))

(declare-fun b!532221 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33732 (_ BitVec 32)) SeekEntryResult!4666)

(assert (=> b!532221 (= e!309899 (seekKeyOrZeroReturnVacant!0 (x!49856 lt!245158) (index!20890 lt!245158) (index!20890 lt!245158) k!1998 a!3154 mask!3216))))

(assert (= (and d!81347 c!62583) b!532217))

(assert (= (and d!81347 (not c!62583)) b!532220))

(assert (= (and b!532220 c!62584) b!532218))

(assert (= (and b!532220 (not c!62584)) b!532219))

(assert (= (and b!532219 c!62582) b!532216))

(assert (= (and b!532219 (not c!62582)) b!532221))

(declare-fun m!512475 () Bool)

(assert (=> d!81347 m!512475))

(declare-fun m!512477 () Bool)

(assert (=> d!81347 m!512477))

(declare-fun m!512479 () Bool)

(assert (=> d!81347 m!512479))

(declare-fun m!512481 () Bool)

(assert (=> d!81347 m!512481))

(assert (=> d!81347 m!512431))

(declare-fun m!512483 () Bool)

(assert (=> d!81347 m!512483))

(assert (=> d!81347 m!512475))

(declare-fun m!512485 () Bool)

(assert (=> b!532220 m!512485))

(declare-fun m!512487 () Bool)

(assert (=> b!532221 m!512487))

(assert (=> b!532152 d!81347))

(declare-fun d!81353 () Bool)

(assert (=> d!81353 (= (validKeyInArray!0 (select (arr!16208 a!3154) j!147)) (and (not (= (select (arr!16208 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16208 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532154 d!81353))

(declare-fun d!81355 () Bool)

(declare-fun res!327688 () Bool)

(declare-fun e!309922 () Bool)

(assert (=> d!81355 (=> res!327688 e!309922)))

(assert (=> d!81355 (= res!327688 (= (select (arr!16208 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81355 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!309922)))

(declare-fun b!532258 () Bool)

(declare-fun e!309923 () Bool)

(assert (=> b!532258 (= e!309922 e!309923)))

(declare-fun res!327689 () Bool)

(assert (=> b!532258 (=> (not res!327689) (not e!309923))))

(assert (=> b!532258 (= res!327689 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16572 a!3154)))))

(declare-fun b!532259 () Bool)

(assert (=> b!532259 (= e!309923 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81355 (not res!327688)) b!532258))

(assert (= (and b!532258 res!327689) b!532259))

(declare-fun m!512489 () Bool)

(assert (=> d!81355 m!512489))

(declare-fun m!512491 () Bool)

(assert (=> b!532259 m!512491))

(assert (=> b!532148 d!81355))

(declare-fun d!81357 () Bool)

(declare-fun res!327701 () Bool)

(declare-fun e!309940 () Bool)

(assert (=> d!81357 (=> res!327701 e!309940)))

(assert (=> d!81357 (= res!327701 (bvsge #b00000000000000000000000000000000 (size!16572 a!3154)))))

(assert (=> d!81357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309940)))

(declare-fun b!532286 () Bool)

(declare-fun e!309941 () Bool)

(declare-fun call!31973 () Bool)

(assert (=> b!532286 (= e!309941 call!31973)))

(declare-fun bm!31970 () Bool)

(assert (=> bm!31970 (= call!31973 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!532287 () Bool)

(declare-fun e!309942 () Bool)

(assert (=> b!532287 (= e!309942 e!309941)))

(declare-fun lt!245174 () (_ BitVec 64))

(assert (=> b!532287 (= lt!245174 (select (arr!16208 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16840 0))(
  ( (Unit!16841) )
))
(declare-fun lt!245175 () Unit!16840)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33732 (_ BitVec 64) (_ BitVec 32)) Unit!16840)

(assert (=> b!532287 (= lt!245175 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245174 #b00000000000000000000000000000000))))

(assert (=> b!532287 (arrayContainsKey!0 a!3154 lt!245174 #b00000000000000000000000000000000)))

(declare-fun lt!245176 () Unit!16840)

(assert (=> b!532287 (= lt!245176 lt!245175)))

(declare-fun res!327700 () Bool)

(assert (=> b!532287 (= res!327700 (= (seekEntryOrOpen!0 (select (arr!16208 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4666 #b00000000000000000000000000000000)))))

(assert (=> b!532287 (=> (not res!327700) (not e!309941))))

(declare-fun b!532288 () Bool)

(assert (=> b!532288 (= e!309942 call!31973)))

(declare-fun b!532289 () Bool)

(assert (=> b!532289 (= e!309940 e!309942)))

(declare-fun c!62603 () Bool)

(assert (=> b!532289 (= c!62603 (validKeyInArray!0 (select (arr!16208 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81357 (not res!327701)) b!532289))

(assert (= (and b!532289 c!62603) b!532287))

(assert (= (and b!532289 (not c!62603)) b!532288))

(assert (= (and b!532287 res!327700) b!532286))

(assert (= (or b!532286 b!532288) bm!31970))

(declare-fun m!512509 () Bool)

(assert (=> bm!31970 m!512509))

(assert (=> b!532287 m!512489))

(declare-fun m!512511 () Bool)

(assert (=> b!532287 m!512511))

(declare-fun m!512513 () Bool)

(assert (=> b!532287 m!512513))

(assert (=> b!532287 m!512489))

(declare-fun m!512515 () Bool)

(assert (=> b!532287 m!512515))

(assert (=> b!532289 m!512489))

(assert (=> b!532289 m!512489))

(declare-fun m!512517 () Bool)

(assert (=> b!532289 m!512517))

(assert (=> b!532150 d!81357))

(declare-fun b!532300 () Bool)

(declare-fun e!309952 () Bool)

(declare-fun e!309951 () Bool)

(assert (=> b!532300 (= e!309952 e!309951)))

(declare-fun c!62606 () Bool)

(assert (=> b!532300 (= c!62606 (validKeyInArray!0 (select (arr!16208 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532301 () Bool)

(declare-fun call!31976 () Bool)

(assert (=> b!532301 (= e!309951 call!31976)))

(declare-fun b!532302 () Bool)

(declare-fun e!309954 () Bool)

(assert (=> b!532302 (= e!309954 e!309952)))

(declare-fun res!327710 () Bool)

(assert (=> b!532302 (=> (not res!327710) (not e!309952))))

(declare-fun e!309953 () Bool)

(assert (=> b!532302 (= res!327710 (not e!309953))))

(declare-fun res!327708 () Bool)

(assert (=> b!532302 (=> (not res!327708) (not e!309953))))

(assert (=> b!532302 (= res!327708 (validKeyInArray!0 (select (arr!16208 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!31973 () Bool)

(assert (=> bm!31973 (= call!31976 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62606 (Cons!10323 (select (arr!16208 a!3154) #b00000000000000000000000000000000) Nil!10324) Nil!10324)))))

(declare-fun d!81363 () Bool)

(declare-fun res!327709 () Bool)

(assert (=> d!81363 (=> res!327709 e!309954)))

(assert (=> d!81363 (= res!327709 (bvsge #b00000000000000000000000000000000 (size!16572 a!3154)))))

(assert (=> d!81363 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10324) e!309954)))

(declare-fun b!532303 () Bool)

(assert (=> b!532303 (= e!309951 call!31976)))

(declare-fun b!532304 () Bool)

(declare-fun contains!2788 (List!10327 (_ BitVec 64)) Bool)

(assert (=> b!532304 (= e!309953 (contains!2788 Nil!10324 (select (arr!16208 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81363 (not res!327709)) b!532302))

(assert (= (and b!532302 res!327708) b!532304))

(assert (= (and b!532302 res!327710) b!532300))

(assert (= (and b!532300 c!62606) b!532303))

(assert (= (and b!532300 (not c!62606)) b!532301))

(assert (= (or b!532303 b!532301) bm!31973))

(assert (=> b!532300 m!512489))

(assert (=> b!532300 m!512489))

(assert (=> b!532300 m!512517))

(assert (=> b!532302 m!512489))

(assert (=> b!532302 m!512489))

(assert (=> b!532302 m!512517))

(assert (=> bm!31973 m!512489))

(declare-fun m!512519 () Bool)

(assert (=> bm!31973 m!512519))

(assert (=> b!532304 m!512489))

(assert (=> b!532304 m!512489))

(declare-fun m!512521 () Bool)

(assert (=> b!532304 m!512521))

(assert (=> b!532146 d!81363))

(declare-fun d!81365 () Bool)

(assert (=> d!81365 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48424 d!81365))

(declare-fun d!81371 () Bool)

(assert (=> d!81371 (= (array_inv!12004 a!3154) (bvsge (size!16572 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48424 d!81371))

(declare-fun d!81373 () Bool)

(assert (=> d!81373 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532151 d!81373))

(declare-fun b!532380 () Bool)

(declare-fun e!310002 () SeekEntryResult!4666)

(declare-fun e!310004 () SeekEntryResult!4666)

(assert (=> b!532380 (= e!310002 e!310004)))

(declare-fun lt!245199 () (_ BitVec 64))

(declare-fun c!62634 () Bool)

(assert (=> b!532380 (= c!62634 (or (= lt!245199 (select (arr!16208 a!3154) j!147)) (= (bvadd lt!245199 lt!245199) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!532381 () Bool)

(declare-fun lt!245200 () SeekEntryResult!4666)

(assert (=> b!532381 (and (bvsge (index!20890 lt!245200) #b00000000000000000000000000000000) (bvslt (index!20890 lt!245200) (size!16572 a!3154)))))

(declare-fun res!327734 () Bool)

(assert (=> b!532381 (= res!327734 (= (select (arr!16208 a!3154) (index!20890 lt!245200)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!310003 () Bool)

(assert (=> b!532381 (=> res!327734 e!310003)))

(declare-fun d!81375 () Bool)

(declare-fun e!310001 () Bool)

(assert (=> d!81375 e!310001))

(declare-fun c!62635 () Bool)

(assert (=> d!81375 (= c!62635 (and (is-Intermediate!4666 lt!245200) (undefined!5478 lt!245200)))))

(assert (=> d!81375 (= lt!245200 e!310002)))

(declare-fun c!62636 () Bool)

(assert (=> d!81375 (= c!62636 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81375 (= lt!245199 (select (arr!16208 a!3154) index!1177))))

