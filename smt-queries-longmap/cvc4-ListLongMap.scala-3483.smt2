; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48280 () Bool)

(assert start!48280)

(declare-fun res!326832 () Bool)

(declare-fun e!309395 () Bool)

(assert (=> start!48280 (=> (not res!326832) (not e!309395))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48280 (= res!326832 (validMask!0 mask!3216))))

(assert (=> start!48280 e!309395))

(assert (=> start!48280 true))

(declare-datatypes ((array!33672 0))(
  ( (array!33673 (arr!16181 (Array (_ BitVec 32) (_ BitVec 64))) (size!16545 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33672)

(declare-fun array_inv!11977 (array!33672) Bool)

(assert (=> start!48280 (array_inv!11977 a!3154)))

(declare-fun b!531196 () Bool)

(declare-fun e!309396 () Bool)

(assert (=> b!531196 (= e!309395 e!309396)))

(declare-fun res!326836 () Bool)

(assert (=> b!531196 (=> (not res!326836) (not e!309396))))

(declare-datatypes ((SeekEntryResult!4639 0))(
  ( (MissingZero!4639 (index!20780 (_ BitVec 32))) (Found!4639 (index!20781 (_ BitVec 32))) (Intermediate!4639 (undefined!5451 Bool) (index!20782 (_ BitVec 32)) (x!49757 (_ BitVec 32))) (Undefined!4639) (MissingVacant!4639 (index!20783 (_ BitVec 32))) )
))
(declare-fun lt!244900 () SeekEntryResult!4639)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531196 (= res!326836 (or (= lt!244900 (MissingZero!4639 i!1153)) (= lt!244900 (MissingVacant!4639 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33672 (_ BitVec 32)) SeekEntryResult!4639)

(assert (=> b!531196 (= lt!244900 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531197 () Bool)

(declare-datatypes ((List!10300 0))(
  ( (Nil!10297) (Cons!10296 (h!11236 (_ BitVec 64)) (t!16528 List!10300)) )
))
(declare-fun noDuplicate!215 (List!10300) Bool)

(assert (=> b!531197 (= e!309396 (not (noDuplicate!215 Nil!10297)))))

(declare-fun b!531198 () Bool)

(declare-fun res!326835 () Bool)

(assert (=> b!531198 (=> (not res!326835) (not e!309396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33672 (_ BitVec 32)) Bool)

(assert (=> b!531198 (= res!326835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531199 () Bool)

(declare-fun res!326837 () Bool)

(assert (=> b!531199 (=> (not res!326837) (not e!309396))))

(assert (=> b!531199 (= res!326837 (and (bvsle #b00000000000000000000000000000000 (size!16545 a!3154)) (bvslt (size!16545 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!531200 () Bool)

(declare-fun res!326834 () Bool)

(assert (=> b!531200 (=> (not res!326834) (not e!309395))))

(declare-fun arrayContainsKey!0 (array!33672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531200 (= res!326834 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531201 () Bool)

(declare-fun res!326830 () Bool)

(assert (=> b!531201 (=> (not res!326830) (not e!309395))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531201 (= res!326830 (validKeyInArray!0 (select (arr!16181 a!3154) j!147)))))

(declare-fun b!531202 () Bool)

(declare-fun res!326831 () Bool)

(assert (=> b!531202 (=> (not res!326831) (not e!309395))))

(assert (=> b!531202 (= res!326831 (validKeyInArray!0 k!1998))))

(declare-fun b!531203 () Bool)

(declare-fun res!326833 () Bool)

(assert (=> b!531203 (=> (not res!326833) (not e!309395))))

(assert (=> b!531203 (= res!326833 (and (= (size!16545 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16545 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16545 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48280 res!326832) b!531203))

(assert (= (and b!531203 res!326833) b!531201))

(assert (= (and b!531201 res!326830) b!531202))

(assert (= (and b!531202 res!326831) b!531200))

(assert (= (and b!531200 res!326834) b!531196))

(assert (= (and b!531196 res!326836) b!531198))

(assert (= (and b!531198 res!326835) b!531199))

(assert (= (and b!531199 res!326837) b!531197))

(declare-fun m!511665 () Bool)

(assert (=> b!531202 m!511665))

(declare-fun m!511667 () Bool)

(assert (=> b!531197 m!511667))

(declare-fun m!511669 () Bool)

(assert (=> start!48280 m!511669))

(declare-fun m!511671 () Bool)

(assert (=> start!48280 m!511671))

(declare-fun m!511673 () Bool)

(assert (=> b!531196 m!511673))

(declare-fun m!511675 () Bool)

(assert (=> b!531198 m!511675))

(declare-fun m!511677 () Bool)

(assert (=> b!531201 m!511677))

(assert (=> b!531201 m!511677))

(declare-fun m!511679 () Bool)

(assert (=> b!531201 m!511679))

(declare-fun m!511681 () Bool)

(assert (=> b!531200 m!511681))

(push 1)

(assert (not b!531196))

(assert (not b!531202))

(assert (not start!48280))

(assert (not b!531198))

(assert (not b!531201))

(assert (not b!531200))

(assert (not b!531197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81215 () Bool)

(assert (=> d!81215 (= (validKeyInArray!0 (select (arr!16181 a!3154) j!147)) (and (not (= (select (arr!16181 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16181 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531201 d!81215))

(declare-fun b!531264 () Bool)

(declare-fun c!62512 () Bool)

(declare-fun lt!244925 () (_ BitVec 64))

(assert (=> b!531264 (= c!62512 (= lt!244925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309441 () SeekEntryResult!4639)

(declare-fun e!309439 () SeekEntryResult!4639)

(assert (=> b!531264 (= e!309441 e!309439)))

(declare-fun b!531265 () Bool)

(declare-fun lt!244926 () SeekEntryResult!4639)

(assert (=> b!531265 (= e!309441 (Found!4639 (index!20782 lt!244926)))))

(declare-fun b!531266 () Bool)

(assert (=> b!531266 (= e!309439 (MissingZero!4639 (index!20782 lt!244926)))))

(declare-fun b!531267 () Bool)

(declare-fun e!309440 () SeekEntryResult!4639)

(assert (=> b!531267 (= e!309440 Undefined!4639)))

(declare-fun b!531268 () Bool)

(assert (=> b!531268 (= e!309440 e!309441)))

(assert (=> b!531268 (= lt!244925 (select (arr!16181 a!3154) (index!20782 lt!244926)))))

(declare-fun c!62513 () Bool)

(assert (=> b!531268 (= c!62513 (= lt!244925 k!1998))))

(declare-fun d!81217 () Bool)

(declare-fun lt!244927 () SeekEntryResult!4639)

(assert (=> d!81217 (and (or (is-Undefined!4639 lt!244927) (not (is-Found!4639 lt!244927)) (and (bvsge (index!20781 lt!244927) #b00000000000000000000000000000000) (bvslt (index!20781 lt!244927) (size!16545 a!3154)))) (or (is-Undefined!4639 lt!244927) (is-Found!4639 lt!244927) (not (is-MissingZero!4639 lt!244927)) (and (bvsge (index!20780 lt!244927) #b00000000000000000000000000000000) (bvslt (index!20780 lt!244927) (size!16545 a!3154)))) (or (is-Undefined!4639 lt!244927) (is-Found!4639 lt!244927) (is-MissingZero!4639 lt!244927) (not (is-MissingVacant!4639 lt!244927)) (and (bvsge (index!20783 lt!244927) #b00000000000000000000000000000000) (bvslt (index!20783 lt!244927) (size!16545 a!3154)))) (or (is-Undefined!4639 lt!244927) (ite (is-Found!4639 lt!244927) (= (select (arr!16181 a!3154) (index!20781 lt!244927)) k!1998) (ite (is-MissingZero!4639 lt!244927) (= (select (arr!16181 a!3154) (index!20780 lt!244927)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4639 lt!244927) (= (select (arr!16181 a!3154) (index!20783 lt!244927)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81217 (= lt!244927 e!309440)))

(declare-fun c!62511 () Bool)

(assert (=> d!81217 (= c!62511 (and (is-Intermediate!4639 lt!244926) (undefined!5451 lt!244926)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33672 (_ BitVec 32)) SeekEntryResult!4639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81217 (= lt!244926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81217 (validMask!0 mask!3216)))

(assert (=> d!81217 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!244927)))

(declare-fun b!531269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33672 (_ BitVec 32)) SeekEntryResult!4639)

(assert (=> b!531269 (= e!309439 (seekKeyOrZeroReturnVacant!0 (x!49757 lt!244926) (index!20782 lt!244926) (index!20782 lt!244926) k!1998 a!3154 mask!3216))))

(assert (= (and d!81217 c!62511) b!531267))

(assert (= (and d!81217 (not c!62511)) b!531268))

(assert (= (and b!531268 c!62513) b!531265))

(assert (= (and b!531268 (not c!62513)) b!531264))

(assert (= (and b!531264 c!62512) b!531266))

(assert (= (and b!531264 (not c!62512)) b!531269))

(declare-fun m!511719 () Bool)

(assert (=> b!531268 m!511719))

(declare-fun m!511721 () Bool)

(assert (=> d!81217 m!511721))

(assert (=> d!81217 m!511669))

(declare-fun m!511723 () Bool)

(assert (=> d!81217 m!511723))

(declare-fun m!511725 () Bool)

(assert (=> d!81217 m!511725))

(declare-fun m!511727 () Bool)

(assert (=> d!81217 m!511727))

(assert (=> d!81217 m!511721))

(declare-fun m!511729 () Bool)

(assert (=> d!81217 m!511729))

(declare-fun m!511731 () Bool)

(assert (=> b!531269 m!511731))

(assert (=> b!531196 d!81217))

(declare-fun d!81235 () Bool)

(assert (=> d!81235 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48280 d!81235))

(declare-fun d!81241 () Bool)

(assert (=> d!81241 (= (array_inv!11977 a!3154) (bvsge (size!16545 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48280 d!81241))

(declare-fun d!81243 () Bool)

(assert (=> d!81243 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531202 d!81243))

(declare-fun d!81245 () Bool)

(declare-fun res!326872 () Bool)

(declare-fun e!309455 () Bool)

(assert (=> d!81245 (=> res!326872 e!309455)))

(assert (=> d!81245 (= res!326872 (is-Nil!10297 Nil!10297))))

(assert (=> d!81245 (= (noDuplicate!215 Nil!10297) e!309455)))

(declare-fun b!531286 () Bool)

(declare-fun e!309456 () Bool)

(assert (=> b!531286 (= e!309455 e!309456)))

(declare-fun res!326873 () Bool)

(assert (=> b!531286 (=> (not res!326873) (not e!309456))))

(declare-fun contains!2783 (List!10300 (_ BitVec 64)) Bool)

(assert (=> b!531286 (= res!326873 (not (contains!2783 (t!16528 Nil!10297) (h!11236 Nil!10297))))))

(declare-fun b!531287 () Bool)

(assert (=> b!531287 (= e!309456 (noDuplicate!215 (t!16528 Nil!10297)))))

(assert (= (and d!81245 (not res!326872)) b!531286))

(assert (= (and b!531286 res!326873) b!531287))

(declare-fun m!511743 () Bool)

(assert (=> b!531286 m!511743))

(declare-fun m!511745 () Bool)

(assert (=> b!531287 m!511745))

(assert (=> b!531197 d!81245))

(declare-fun b!531314 () Bool)

(declare-fun e!309472 () Bool)

(declare-fun e!309474 () Bool)

(assert (=> b!531314 (= e!309472 e!309474)))

(declare-fun c!62528 () Bool)

(assert (=> b!531314 (= c!62528 (validKeyInArray!0 (select (arr!16181 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81247 () Bool)

(declare-fun res!326879 () Bool)

(assert (=> d!81247 (=> res!326879 e!309472)))

(assert (=> d!81247 (= res!326879 (bvsge #b00000000000000000000000000000000 (size!16545 a!3154)))))

(assert (=> d!81247 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309472)))

(declare-fun b!531315 () Bool)

(declare-fun e!309473 () Bool)

(declare-fun call!31952 () Bool)

(assert (=> b!531315 (= e!309473 call!31952)))

