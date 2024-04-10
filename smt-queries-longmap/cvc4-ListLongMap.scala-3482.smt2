; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48238 () Bool)

(assert start!48238)

(declare-fun b!531017 () Bool)

(declare-fun res!326725 () Bool)

(declare-fun e!309296 () Bool)

(assert (=> b!531017 (=> (not res!326725) (not e!309296))))

(declare-datatypes ((array!33663 0))(
  ( (array!33664 (arr!16178 (Array (_ BitVec 32) (_ BitVec 64))) (size!16542 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33663)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531017 (= res!326725 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531018 () Bool)

(declare-fun e!309295 () Bool)

(assert (=> b!531018 (= e!309295 (and (bvsle #b00000000000000000000000000000000 (size!16542 a!3154)) (bvsge (size!16542 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!531019 () Bool)

(declare-fun res!326729 () Bool)

(assert (=> b!531019 (=> (not res!326729) (not e!309295))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33663 (_ BitVec 32)) Bool)

(assert (=> b!531019 (= res!326729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531020 () Bool)

(declare-fun res!326728 () Bool)

(assert (=> b!531020 (=> (not res!326728) (not e!309296))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531020 (= res!326728 (validKeyInArray!0 (select (arr!16178 a!3154) j!147)))))

(declare-fun b!531021 () Bool)

(assert (=> b!531021 (= e!309296 e!309295)))

(declare-fun res!326723 () Bool)

(assert (=> b!531021 (=> (not res!326723) (not e!309295))))

(declare-datatypes ((SeekEntryResult!4636 0))(
  ( (MissingZero!4636 (index!20768 (_ BitVec 32))) (Found!4636 (index!20769 (_ BitVec 32))) (Intermediate!4636 (undefined!5448 Bool) (index!20770 (_ BitVec 32)) (x!49746 (_ BitVec 32))) (Undefined!4636) (MissingVacant!4636 (index!20771 (_ BitVec 32))) )
))
(declare-fun lt!244837 () SeekEntryResult!4636)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531021 (= res!326723 (or (= lt!244837 (MissingZero!4636 i!1153)) (= lt!244837 (MissingVacant!4636 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33663 (_ BitVec 32)) SeekEntryResult!4636)

(assert (=> b!531021 (= lt!244837 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531022 () Bool)

(declare-fun res!326726 () Bool)

(assert (=> b!531022 (=> (not res!326726) (not e!309296))))

(assert (=> b!531022 (= res!326726 (validKeyInArray!0 k!1998))))

(declare-fun res!326724 () Bool)

(assert (=> start!48238 (=> (not res!326724) (not e!309296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48238 (= res!326724 (validMask!0 mask!3216))))

(assert (=> start!48238 e!309296))

(assert (=> start!48238 true))

(declare-fun array_inv!11974 (array!33663) Bool)

(assert (=> start!48238 (array_inv!11974 a!3154)))

(declare-fun b!531023 () Bool)

(declare-fun res!326727 () Bool)

(assert (=> b!531023 (=> (not res!326727) (not e!309296))))

(assert (=> b!531023 (= res!326727 (and (= (size!16542 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16542 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16542 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48238 res!326724) b!531023))

(assert (= (and b!531023 res!326727) b!531020))

(assert (= (and b!531020 res!326728) b!531022))

(assert (= (and b!531022 res!326726) b!531017))

(assert (= (and b!531017 res!326725) b!531021))

(assert (= (and b!531021 res!326723) b!531019))

(assert (= (and b!531019 res!326729) b!531018))

(declare-fun m!511529 () Bool)

(assert (=> b!531019 m!511529))

(declare-fun m!511531 () Bool)

(assert (=> b!531017 m!511531))

(declare-fun m!511533 () Bool)

(assert (=> b!531022 m!511533))

(declare-fun m!511535 () Bool)

(assert (=> start!48238 m!511535))

(declare-fun m!511537 () Bool)

(assert (=> start!48238 m!511537))

(declare-fun m!511539 () Bool)

(assert (=> b!531021 m!511539))

(declare-fun m!511541 () Bool)

(assert (=> b!531020 m!511541))

(assert (=> b!531020 m!511541))

(declare-fun m!511543 () Bool)

(assert (=> b!531020 m!511543))

(push 1)

(assert (not b!531019))

(assert (not b!531021))

(assert (not start!48238))

(assert (not b!531022))

(assert (not b!531017))

(assert (not b!531020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81169 () Bool)

(assert (=> d!81169 (= (validKeyInArray!0 (select (arr!16178 a!3154) j!147)) (and (not (= (select (arr!16178 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16178 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531020 d!81169))

(declare-fun b!531078 () Bool)

(declare-fun e!309335 () SeekEntryResult!4636)

(declare-fun lt!244869 () SeekEntryResult!4636)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33663 (_ BitVec 32)) SeekEntryResult!4636)

(assert (=> b!531078 (= e!309335 (seekKeyOrZeroReturnVacant!0 (x!49746 lt!244869) (index!20770 lt!244869) (index!20770 lt!244869) k!1998 a!3154 mask!3216))))

(declare-fun b!531079 () Bool)

(declare-fun e!309334 () SeekEntryResult!4636)

(assert (=> b!531079 (= e!309334 Undefined!4636)))

(declare-fun b!531080 () Bool)

(assert (=> b!531080 (= e!309335 (MissingZero!4636 (index!20770 lt!244869)))))

(declare-fun d!81171 () Bool)

(declare-fun lt!244870 () SeekEntryResult!4636)

(assert (=> d!81171 (and (or (is-Undefined!4636 lt!244870) (not (is-Found!4636 lt!244870)) (and (bvsge (index!20769 lt!244870) #b00000000000000000000000000000000) (bvslt (index!20769 lt!244870) (size!16542 a!3154)))) (or (is-Undefined!4636 lt!244870) (is-Found!4636 lt!244870) (not (is-MissingZero!4636 lt!244870)) (and (bvsge (index!20768 lt!244870) #b00000000000000000000000000000000) (bvslt (index!20768 lt!244870) (size!16542 a!3154)))) (or (is-Undefined!4636 lt!244870) (is-Found!4636 lt!244870) (is-MissingZero!4636 lt!244870) (not (is-MissingVacant!4636 lt!244870)) (and (bvsge (index!20771 lt!244870) #b00000000000000000000000000000000) (bvslt (index!20771 lt!244870) (size!16542 a!3154)))) (or (is-Undefined!4636 lt!244870) (ite (is-Found!4636 lt!244870) (= (select (arr!16178 a!3154) (index!20769 lt!244870)) k!1998) (ite (is-MissingZero!4636 lt!244870) (= (select (arr!16178 a!3154) (index!20768 lt!244870)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4636 lt!244870) (= (select (arr!16178 a!3154) (index!20771 lt!244870)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81171 (= lt!244870 e!309334)))

(declare-fun c!62476 () Bool)

(assert (=> d!81171 (= c!62476 (and (is-Intermediate!4636 lt!244869) (undefined!5448 lt!244869)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33663 (_ BitVec 32)) SeekEntryResult!4636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81171 (= lt!244869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81171 (validMask!0 mask!3216)))

(assert (=> d!81171 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!244870)))

(declare-fun b!531081 () Bool)

(declare-fun e!309336 () SeekEntryResult!4636)

(assert (=> b!531081 (= e!309334 e!309336)))

(declare-fun lt!244868 () (_ BitVec 64))

(assert (=> b!531081 (= lt!244868 (select (arr!16178 a!3154) (index!20770 lt!244869)))))

(declare-fun c!62475 () Bool)

(assert (=> b!531081 (= c!62475 (= lt!244868 k!1998))))

(declare-fun b!531082 () Bool)

(declare-fun c!62477 () Bool)

(assert (=> b!531082 (= c!62477 (= lt!244868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!531082 (= e!309336 e!309335)))

(declare-fun b!531083 () Bool)

(assert (=> b!531083 (= e!309336 (Found!4636 (index!20770 lt!244869)))))

(assert (= (and d!81171 c!62476) b!531079))

(assert (= (and d!81171 (not c!62476)) b!531081))

(assert (= (and b!531081 c!62475) b!531083))

(assert (= (and b!531081 (not c!62475)) b!531082))

(assert (= (and b!531082 c!62477) b!531080))

(assert (= (and b!531082 (not c!62477)) b!531078))

(declare-fun m!511571 () Bool)

(assert (=> b!531078 m!511571))

(declare-fun m!511573 () Bool)

(assert (=> d!81171 m!511573))

(declare-fun m!511575 () Bool)

(assert (=> d!81171 m!511575))

(declare-fun m!511577 () Bool)

(assert (=> d!81171 m!511577))

(assert (=> d!81171 m!511535))

(declare-fun m!511579 () Bool)

(assert (=> d!81171 m!511579))

(assert (=> d!81171 m!511579))

(declare-fun m!511581 () Bool)

(assert (=> d!81171 m!511581))

(declare-fun m!511583 () Bool)

(assert (=> b!531081 m!511583))

(assert (=> b!531021 d!81171))

(declare-fun d!81189 () Bool)

(assert (=> d!81189 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531022 d!81189))

(declare-fun d!81191 () Bool)

(assert (=> d!81191 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48238 d!81191))

(declare-fun d!81195 () Bool)

(assert (=> d!81195 (= (array_inv!11974 a!3154) (bvsge (size!16542 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48238 d!81195))

(declare-fun d!81197 () Bool)

(declare-fun res!326756 () Bool)

(declare-fun e!309348 () Bool)

(assert (=> d!81197 (=> res!326756 e!309348)))

(assert (=> d!81197 (= res!326756 (= (select (arr!16178 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81197 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!309348)))

(declare-fun b!531098 () Bool)

(declare-fun e!309349 () Bool)

(assert (=> b!531098 (= e!309348 e!309349)))

(declare-fun res!326757 () Bool)

(assert (=> b!531098 (=> (not res!326757) (not e!309349))))

(assert (=> b!531098 (= res!326757 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16542 a!3154)))))

(declare-fun b!531099 () Bool)

(assert (=> b!531099 (= e!309349 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81197 (not res!326756)) b!531098))

(assert (= (and b!531098 res!326757) b!531099))

(declare-fun m!511599 () Bool)

