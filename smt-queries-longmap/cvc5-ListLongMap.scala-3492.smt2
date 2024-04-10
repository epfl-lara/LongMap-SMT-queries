; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48420 () Bool)

(assert start!48420)

(declare-fun b!532085 () Bool)

(declare-fun e!309832 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!532085 (= e!309832 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsgt mask!3216 #b00111111111111111111111111111111)))))

(declare-fun b!532086 () Bool)

(declare-fun e!309833 () Bool)

(assert (=> b!532086 (= e!309833 e!309832)))

(declare-fun res!327578 () Bool)

(assert (=> b!532086 (=> (not res!327578) (not e!309832))))

(declare-datatypes ((SeekEntryResult!4664 0))(
  ( (MissingZero!4664 (index!20880 (_ BitVec 32))) (Found!4664 (index!20881 (_ BitVec 32))) (Intermediate!4664 (undefined!5476 Bool) (index!20882 (_ BitVec 32)) (x!49854 (_ BitVec 32))) (Undefined!4664) (MissingVacant!4664 (index!20883 (_ BitVec 32))) )
))
(declare-fun lt!245122 () SeekEntryResult!4664)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532086 (= res!327578 (or (= lt!245122 (MissingZero!4664 i!1153)) (= lt!245122 (MissingVacant!4664 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33728 0))(
  ( (array!33729 (arr!16206 (Array (_ BitVec 32) (_ BitVec 64))) (size!16570 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33728)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33728 (_ BitVec 32)) SeekEntryResult!4664)

(assert (=> b!532086 (= lt!245122 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532088 () Bool)

(declare-fun res!327582 () Bool)

(assert (=> b!532088 (=> (not res!327582) (not e!309833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532088 (= res!327582 (validKeyInArray!0 k!1998))))

(declare-fun b!532087 () Bool)

(declare-fun res!327579 () Bool)

(assert (=> b!532087 (=> (not res!327579) (not e!309833))))

(declare-fun arrayContainsKey!0 (array!33728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532087 (= res!327579 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!327583 () Bool)

(assert (=> start!48420 (=> (not res!327583) (not e!309833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48420 (= res!327583 (validMask!0 mask!3216))))

(assert (=> start!48420 e!309833))

(assert (=> start!48420 true))

(declare-fun array_inv!12002 (array!33728) Bool)

(assert (=> start!48420 (array_inv!12002 a!3154)))

(declare-fun b!532089 () Bool)

(declare-fun res!327576 () Bool)

(assert (=> b!532089 (=> (not res!327576) (not e!309832))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!532089 (= res!327576 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16570 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16570 a!3154)) (= (select (arr!16206 a!3154) resIndex!32) (select (arr!16206 a!3154) j!147))))))

(declare-fun b!532090 () Bool)

(declare-fun res!327584 () Bool)

(assert (=> b!532090 (=> (not res!327584) (not e!309832))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33728 (_ BitVec 32)) SeekEntryResult!4664)

(assert (=> b!532090 (= res!327584 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16206 a!3154) j!147) a!3154 mask!3216) (Intermediate!4664 false resIndex!32 resX!32)))))

(declare-fun b!532091 () Bool)

(declare-fun res!327577 () Bool)

(assert (=> b!532091 (=> (not res!327577) (not e!309833))))

(assert (=> b!532091 (= res!327577 (validKeyInArray!0 (select (arr!16206 a!3154) j!147)))))

(declare-fun b!532092 () Bool)

(declare-fun res!327580 () Bool)

(assert (=> b!532092 (=> (not res!327580) (not e!309832))))

(declare-datatypes ((List!10325 0))(
  ( (Nil!10322) (Cons!10321 (h!11261 (_ BitVec 64)) (t!16553 List!10325)) )
))
(declare-fun arrayNoDuplicates!0 (array!33728 (_ BitVec 32) List!10325) Bool)

(assert (=> b!532092 (= res!327580 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10322))))

(declare-fun b!532093 () Bool)

(declare-fun res!327575 () Bool)

(assert (=> b!532093 (=> (not res!327575) (not e!309832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33728 (_ BitVec 32)) Bool)

(assert (=> b!532093 (= res!327575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532094 () Bool)

(declare-fun res!327581 () Bool)

(assert (=> b!532094 (=> (not res!327581) (not e!309833))))

(assert (=> b!532094 (= res!327581 (and (= (size!16570 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16570 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16570 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48420 res!327583) b!532094))

(assert (= (and b!532094 res!327581) b!532091))

(assert (= (and b!532091 res!327577) b!532088))

(assert (= (and b!532088 res!327582) b!532087))

(assert (= (and b!532087 res!327579) b!532086))

(assert (= (and b!532086 res!327578) b!532093))

(assert (= (and b!532093 res!327575) b!532092))

(assert (= (and b!532092 res!327580) b!532089))

(assert (= (and b!532089 res!327576) b!532090))

(assert (= (and b!532090 res!327584) b!532085))

(declare-fun m!512379 () Bool)

(assert (=> b!532092 m!512379))

(declare-fun m!512381 () Bool)

(assert (=> b!532087 m!512381))

(declare-fun m!512383 () Bool)

(assert (=> b!532090 m!512383))

(assert (=> b!532090 m!512383))

(declare-fun m!512385 () Bool)

(assert (=> b!532090 m!512385))

(declare-fun m!512387 () Bool)

(assert (=> b!532089 m!512387))

(assert (=> b!532089 m!512383))

(assert (=> b!532091 m!512383))

(assert (=> b!532091 m!512383))

(declare-fun m!512389 () Bool)

(assert (=> b!532091 m!512389))

(declare-fun m!512391 () Bool)

(assert (=> b!532088 m!512391))

(declare-fun m!512393 () Bool)

(assert (=> b!532093 m!512393))

(declare-fun m!512395 () Bool)

(assert (=> b!532086 m!512395))

(declare-fun m!512397 () Bool)

(assert (=> start!48420 m!512397))

(declare-fun m!512399 () Bool)

(assert (=> start!48420 m!512399))

(push 1)

(assert (not b!532090))

(assert (not b!532086))

(assert (not start!48420))

(assert (not b!532087))

(assert (not b!532093))

(assert (not b!532091))

(assert (not b!532092))

(assert (not b!532088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81339 () Bool)

(assert (=> d!81339 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532088 d!81339))

(declare-fun bm!31967 () Bool)

(declare-fun call!31970 () Bool)

(assert (=> bm!31967 (= call!31970 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!532196 () Bool)

(declare-fun e!309887 () Bool)

(assert (=> b!532196 (= e!309887 call!31970)))

(declare-fun b!532197 () Bool)

(declare-fun e!309888 () Bool)

(declare-fun e!309886 () Bool)

(assert (=> b!532197 (= e!309888 e!309886)))

(declare-fun c!62573 () Bool)

(assert (=> b!532197 (= c!62573 (validKeyInArray!0 (select (arr!16206 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532198 () Bool)

(assert (=> b!532198 (= e!309886 call!31970)))

(declare-fun d!81341 () Bool)

(declare-fun res!327671 () Bool)

(assert (=> d!81341 (=> res!327671 e!309888)))

(assert (=> d!81341 (= res!327671 (bvsge #b00000000000000000000000000000000 (size!16570 a!3154)))))

(assert (=> d!81341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309888)))

(declare-fun b!532199 () Bool)

(assert (=> b!532199 (= e!309886 e!309887)))

(declare-fun lt!245144 () (_ BitVec 64))

(assert (=> b!532199 (= lt!245144 (select (arr!16206 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16838 0))(
  ( (Unit!16839) )
))
(declare-fun lt!245146 () Unit!16838)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33728 (_ BitVec 64) (_ BitVec 32)) Unit!16838)

(assert (=> b!532199 (= lt!245146 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245144 #b00000000000000000000000000000000))))

(assert (=> b!532199 (arrayContainsKey!0 a!3154 lt!245144 #b00000000000000000000000000000000)))

(declare-fun lt!245145 () Unit!16838)

(assert (=> b!532199 (= lt!245145 lt!245146)))

(declare-fun res!327670 () Bool)

(assert (=> b!532199 (= res!327670 (= (seekEntryOrOpen!0 (select (arr!16206 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4664 #b00000000000000000000000000000000)))))

(assert (=> b!532199 (=> (not res!327670) (not e!309887))))

(assert (= (and d!81341 (not res!327671)) b!532197))

(assert (= (and b!532197 c!62573) b!532199))

(assert (= (and b!532197 (not c!62573)) b!532198))

(assert (= (and b!532199 res!327670) b!532196))

(assert (= (or b!532196 b!532198) bm!31967))

(declare-fun m!512463 () Bool)

(assert (=> bm!31967 m!512463))

(declare-fun m!512465 () Bool)

(assert (=> b!532197 m!512465))

(assert (=> b!532197 m!512465))

(declare-fun m!512467 () Bool)

(assert (=> b!532197 m!512467))

(assert (=> b!532199 m!512465))

(declare-fun m!512469 () Bool)

(assert (=> b!532199 m!512469))

(declare-fun m!512471 () Bool)

(assert (=> b!532199 m!512471))

(assert (=> b!532199 m!512465))

(declare-fun m!512473 () Bool)

(assert (=> b!532199 m!512473))

(assert (=> b!532093 d!81341))

(declare-fun e!309931 () SeekEntryResult!4664)

(declare-fun b!532269 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532269 (= e!309931 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16206 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!532270 () Bool)

(declare-fun lt!245166 () SeekEntryResult!4664)

(assert (=> b!532270 (and (bvsge (index!20882 lt!245166) #b00000000000000000000000000000000) (bvslt (index!20882 lt!245166) (size!16570 a!3154)))))

(declare-fun e!309930 () Bool)

(assert (=> b!532270 (= e!309930 (= (select (arr!16206 a!3154) (index!20882 lt!245166)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!532271 () Bool)

(declare-fun e!309933 () Bool)

(declare-fun e!309932 () Bool)

(assert (=> b!532271 (= e!309933 e!309932)))

(declare-fun res!327694 () Bool)

(assert (=> b!532271 (= res!327694 (and (is-Intermediate!4664 lt!245166) (not (undefined!5476 lt!245166)) (bvslt (x!49854 lt!245166) #b01111111111111111111111111111110) (bvsge (x!49854 lt!245166) #b00000000000000000000000000000000) (bvsge (x!49854 lt!245166) x!1030)))))

(assert (=> b!532271 (=> (not res!327694) (not e!309932))))

(declare-fun b!532272 () Bool)

(assert (=> b!532272 (and (bvsge (index!20882 lt!245166) #b00000000000000000000000000000000) (bvslt (index!20882 lt!245166) (size!16570 a!3154)))))

(declare-fun res!327695 () Bool)

(assert (=> b!532272 (= res!327695 (= (select (arr!16206 a!3154) (index!20882 lt!245166)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532272 (=> res!327695 e!309930)))

(declare-fun b!532273 () Bool)

(declare-fun e!309929 () SeekEntryResult!4664)

(assert (=> b!532273 (= e!309929 e!309931)))

(declare-fun lt!245167 () (_ BitVec 64))

(declare-fun c!62599 () Bool)

(assert (=> b!532273 (= c!62599 (or (= lt!245167 (select (arr!16206 a!3154) j!147)) (= (bvadd lt!245167 lt!245167) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!532274 () Bool)

(assert (=> b!532274 (= e!309933 (bvsge (x!49854 lt!245166) #b01111111111111111111111111111110))))

(declare-fun b!532276 () Bool)

(assert (=> b!532276 (and (bvsge (index!20882 lt!245166) #b00000000000000000000000000000000) (bvslt (index!20882 lt!245166) (size!16570 a!3154)))))

(declare-fun res!327693 () Bool)

(assert (=> b!532276 (= res!327693 (= (select (arr!16206 a!3154) (index!20882 lt!245166)) (select (arr!16206 a!3154) j!147)))))

(assert (=> b!532276 (=> res!327693 e!309930)))

(assert (=> b!532276 (= e!309932 e!309930)))

(declare-fun b!532277 () Bool)

(assert (=> b!532277 (= e!309929 (Intermediate!4664 true index!1177 x!1030))))

(declare-fun d!81351 () Bool)

(assert (=> d!81351 e!309933))

(declare-fun c!62600 () Bool)

(assert (=> d!81351 (= c!62600 (and (is-Intermediate!4664 lt!245166) (undefined!5476 lt!245166)))))

(assert (=> d!81351 (= lt!245166 e!309929)))

(declare-fun c!62598 () Bool)

(assert (=> d!81351 (= c!62598 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81351 (= lt!245167 (select (arr!16206 a!3154) index!1177))))

(assert (=> d!81351 (validMask!0 mask!3216)))

(assert (=> d!81351 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16206 a!3154) j!147) a!3154 mask!3216) lt!245166)))

(declare-fun b!532275 () Bool)

(assert (=> b!532275 (= e!309931 (Intermediate!4664 false index!1177 x!1030))))

(assert (= (and d!81351 c!62598) b!532277))

(assert (= (and d!81351 (not c!62598)) b!532273))

(assert (= (and b!532273 c!62599) b!532275))

(assert (= (and b!532273 (not c!62599)) b!532269))

(assert (= (and d!81351 c!62600) b!532274))

(assert (= (and d!81351 (not c!62600)) b!532271))

(assert (= (and b!532271 res!327694) b!532276))

(assert (= (and b!532276 (not res!327693)) b!532272))

(assert (= (and b!532272 (not res!327695)) b!532270))

(declare-fun m!512501 () Bool)

(assert (=> b!532269 m!512501))

(assert (=> b!532269 m!512501))

(assert (=> b!532269 m!512383))

(declare-fun m!512503 () Bool)

(assert (=> b!532269 m!512503))

(declare-fun m!512505 () Bool)

(assert (=> b!532272 m!512505))

(assert (=> b!532270 m!512505))

(assert (=> b!532276 m!512505))

(declare-fun m!512507 () Bool)

(assert (=> d!81351 m!512507))

(assert (=> d!81351 m!512397))

(assert (=> b!532090 d!81351))

(declare-fun lt!245193 () SeekEntryResult!4664)

(declare-fun e!309970 () SeekEntryResult!4664)

(declare-fun b!532335 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33728 (_ BitVec 32)) SeekEntryResult!4664)

(assert (=> b!532335 (= e!309970 (seekKeyOrZeroReturnVacant!0 (x!49854 lt!245193) (index!20882 lt!245193) (index!20882 lt!245193) k!1998 a!3154 mask!3216))))

(declare-fun b!532337 () Bool)

(declare-fun e!309972 () SeekEntryResult!4664)

(assert (=> b!532337 (= e!309972 Undefined!4664)))

(declare-fun b!532338 () Bool)

(assert (=> b!532338 (= e!309970 (MissingZero!4664 (index!20882 lt!245193)))))

(declare-fun b!532339 () Bool)

(declare-fun c!62622 () Bool)

(declare-fun lt!245194 () (_ BitVec 64))

(assert (=> b!532339 (= c!62622 (= lt!245194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309971 () SeekEntryResult!4664)

(assert (=> b!532339 (= e!309971 e!309970)))

(declare-fun b!532340 () Bool)

(assert (=> b!532340 (= e!309971 (Found!4664 (index!20882 lt!245193)))))

(declare-fun d!81361 () Bool)

(declare-fun lt!245192 () SeekEntryResult!4664)

(assert (=> d!81361 (and (or (is-Undefined!4664 lt!245192) (not (is-Found!4664 lt!245192)) (and (bvsge (index!20881 lt!245192) #b00000000000000000000000000000000) (bvslt (index!20881 lt!245192) (size!16570 a!3154)))) (or (is-Undefined!4664 lt!245192) (is-Found!4664 lt!245192) (not (is-MissingZero!4664 lt!245192)) (and (bvsge (index!20880 lt!245192) #b00000000000000000000000000000000) (bvslt (index!20880 lt!245192) (size!16570 a!3154)))) (or (is-Undefined!4664 lt!245192) (is-Found!4664 lt!245192) (is-MissingZero!4664 lt!245192) (not (is-MissingVacant!4664 lt!245192)) (and (bvsge (index!20883 lt!245192) #b00000000000000000000000000000000) (bvslt (index!20883 lt!245192) (size!16570 a!3154)))) (or (is-Undefined!4664 lt!245192) (ite (is-Found!4664 lt!245192) (= (select (arr!16206 a!3154) (index!20881 lt!245192)) k!1998) (ite (is-MissingZero!4664 lt!245192) (= (select (arr!16206 a!3154) (index!20880 lt!245192)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4664 lt!245192) (= (select (arr!16206 a!3154) (index!20883 lt!245192)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81361 (= lt!245192 e!309972)))

(declare-fun c!62623 () Bool)

(assert (=> d!81361 (= c!62623 (and (is-Intermediate!4664 lt!245193) (undefined!5476 lt!245193)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81361 (= lt!245193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81361 (validMask!0 mask!3216)))

(assert (=> d!81361 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!245192)))

(declare-fun b!532336 () Bool)

(assert (=> b!532336 (= e!309972 e!309971)))

(assert (=> b!532336 (= lt!245194 (select (arr!16206 a!3154) (index!20882 lt!245193)))))

(declare-fun c!62624 () Bool)

(assert (=> b!532336 (= c!62624 (= lt!245194 k!1998))))

(assert (= (and d!81361 c!62623) b!532337))

(assert (= (and d!81361 (not c!62623)) b!532336))

(assert (= (and b!532336 c!62624) b!532340))

(assert (= (and b!532336 (not c!62624)) b!532339))

(assert (= (and b!532339 c!62622) b!532338))

(assert (= (and b!532339 (not c!62622)) b!532335))

(declare-fun m!512537 () Bool)

(assert (=> b!532335 m!512537))

(declare-fun m!512539 () Bool)

(assert (=> d!81361 m!512539))

(declare-fun m!512541 () Bool)

(assert (=> d!81361 m!512541))

(assert (=> d!81361 m!512397))

(declare-fun m!512543 () Bool)

(assert (=> d!81361 m!512543))

(assert (=> d!81361 m!512539))

(declare-fun m!512545 () Bool)

(assert (=> d!81361 m!512545))

(declare-fun m!512547 () Bool)

(assert (=> d!81361 m!512547))

(declare-fun m!512549 () Bool)

(assert (=> b!532336 m!512549))

(assert (=> b!532086 d!81361))

(declare-fun d!81369 () Bool)

(assert (=> d!81369 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48420 d!81369))

(declare-fun d!81381 () Bool)

(assert (=> d!81381 (= (array_inv!12002 a!3154) (bvsge (size!16570 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48420 d!81381))

(declare-fun d!81383 () Bool)

(assert (=> d!81383 (= (validKeyInArray!0 (select (arr!16206 a!3154) j!147)) (and (not (= (select (arr!16206 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16206 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532091 d!81383))

(declare-fun d!81385 () Bool)

(declare-fun res!327715 () Bool)

(declare-fun e!309977 () Bool)

(assert (=> d!81385 (=> res!327715 e!309977)))

(assert (=> d!81385 (= res!327715 (= (select (arr!16206 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81385 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!309977)))

(declare-fun b!532345 () Bool)

(declare-fun e!309978 () Bool)

(assert (=> b!532345 (= e!309977 e!309978)))

(declare-fun res!327716 () Bool)

(assert (=> b!532345 (=> (not res!327716) (not e!309978))))

(assert (=> b!532345 (= res!327716 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16570 a!3154)))))

(declare-fun b!532346 () Bool)

(assert (=> b!532346 (= e!309978 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81385 (not res!327715)) b!532345))

(assert (= (and b!532345 res!327716) b!532346))

(assert (=> d!81385 m!512465))

(declare-fun m!512551 () Bool)

(assert (=> b!532346 m!512551))

(assert (=> b!532087 d!81385))

(declare-fun d!81387 () Bool)

(declare-fun res!327730 () Bool)

(declare-fun e!309997 () Bool)

(assert (=> d!81387 (=> res!327730 e!309997)))

(assert (=> d!81387 (= res!327730 (bvsge #b00000000000000000000000000000000 (size!16570 a!3154)))))

(assert (=> d!81387 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10322) e!309997)))

(declare-fun b!532375 () Bool)

(declare-fun e!309999 () Bool)

(declare-fun call!31979 () Bool)

(assert (=> b!532375 (= e!309999 call!31979)))

(declare-fun bm!31976 () Bool)

(declare-fun c!62633 () Bool)

(assert (=> bm!31976 (= call!31979 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62633 (Cons!10321 (select (arr!16206 a!3154) #b00000000000000000000000000000000) Nil!10322) Nil!10322)))))

(declare-fun b!532376 () Bool)

(declare-fun e!309998 () Bool)

(assert (=> b!532376 (= e!309998 e!309999)))

(assert (=> b!532376 (= c!62633 (validKeyInArray!0 (select (arr!16206 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532377 () Bool)

(assert (=> b!532377 (= e!309999 call!31979)))

(declare-fun b!532378 () Bool)

(assert (=> b!532378 (= e!309997 e!309998)))

(declare-fun res!327729 () Bool)

(assert (=> b!532378 (=> (not res!327729) (not e!309998))))

(declare-fun e!310000 () Bool)

(assert (=> b!532378 (= res!327729 (not e!310000))))

(declare-fun res!327731 () Bool)

(assert (=> b!532378 (=> (not res!327731) (not e!310000))))

(assert (=> b!532378 (= res!327731 (validKeyInArray!0 (select (arr!16206 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532379 () Bool)

(declare-fun contains!2789 (List!10325 (_ BitVec 64)) Bool)

(assert (=> b!532379 (= e!310000 (contains!2789 Nil!10322 (select (arr!16206 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81387 (not res!327730)) b!532378))

(assert (= (and b!532378 res!327731) b!532379))

(assert (= (and b!532378 res!327729) b!532376))

(assert (= (and b!532376 c!62633) b!532377))

(assert (= (and b!532376 (not c!62633)) b!532375))

(assert (= (or b!532377 b!532375) bm!31976))

(assert (=> bm!31976 m!512465))

(declare-fun m!512553 () Bool)

(assert (=> bm!31976 m!512553))

(assert (=> b!532376 m!512465))

(assert (=> b!532376 m!512465))

(assert (=> b!532376 m!512467))

(assert (=> b!532378 m!512465))

(assert (=> b!532378 m!512465))

(assert (=> b!532378 m!512467))

(assert (=> b!532379 m!512465))

(assert (=> b!532379 m!512465))

(declare-fun m!512555 () Bool)

(assert (=> b!532379 m!512555))

(assert (=> b!532092 d!81387))

(push 1)

