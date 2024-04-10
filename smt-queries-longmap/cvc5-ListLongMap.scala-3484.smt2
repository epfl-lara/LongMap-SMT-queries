; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48324 () Bool)

(assert start!48324)

(declare-fun b!531350 () Bool)

(declare-fun e!309497 () Bool)

(declare-fun e!309496 () Bool)

(assert (=> b!531350 (= e!309497 e!309496)))

(declare-fun res!326915 () Bool)

(assert (=> b!531350 (=> (not res!326915) (not e!309496))))

(declare-datatypes ((SeekEntryResult!4640 0))(
  ( (MissingZero!4640 (index!20784 (_ BitVec 32))) (Found!4640 (index!20785 (_ BitVec 32))) (Intermediate!4640 (undefined!5452 Bool) (index!20786 (_ BitVec 32)) (x!49766 (_ BitVec 32))) (Undefined!4640) (MissingVacant!4640 (index!20787 (_ BitVec 32))) )
))
(declare-fun lt!244957 () SeekEntryResult!4640)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531350 (= res!326915 (or (= lt!244957 (MissingZero!4640 i!1153)) (= lt!244957 (MissingVacant!4640 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33677 0))(
  ( (array!33678 (arr!16182 (Array (_ BitVec 32) (_ BitVec 64))) (size!16546 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33677)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33677 (_ BitVec 32)) SeekEntryResult!4640)

(assert (=> b!531350 (= lt!244957 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!326917 () Bool)

(assert (=> start!48324 (=> (not res!326917) (not e!309497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48324 (= res!326917 (validMask!0 mask!3216))))

(assert (=> start!48324 e!309497))

(assert (=> start!48324 true))

(declare-fun array_inv!11978 (array!33677) Bool)

(assert (=> start!48324 (array_inv!11978 a!3154)))

(declare-fun b!531351 () Bool)

(declare-fun res!326921 () Bool)

(assert (=> b!531351 (=> (not res!326921) (not e!309497))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531351 (= res!326921 (and (= (size!16546 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16546 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16546 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531352 () Bool)

(declare-fun res!326914 () Bool)

(assert (=> b!531352 (=> (not res!326914) (not e!309496))))

(declare-datatypes ((List!10301 0))(
  ( (Nil!10298) (Cons!10297 (h!11237 (_ BitVec 64)) (t!16529 List!10301)) )
))
(declare-fun noDuplicate!216 (List!10301) Bool)

(assert (=> b!531352 (= res!326914 (noDuplicate!216 Nil!10298))))

(declare-fun b!531353 () Bool)

(declare-fun res!326913 () Bool)

(assert (=> b!531353 (=> (not res!326913) (not e!309496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33677 (_ BitVec 32)) Bool)

(assert (=> b!531353 (= res!326913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531354 () Bool)

(declare-fun e!309498 () Bool)

(declare-fun contains!2784 (List!10301 (_ BitVec 64)) Bool)

(assert (=> b!531354 (= e!309498 (contains!2784 Nil!10298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531355 () Bool)

(declare-fun res!326916 () Bool)

(assert (=> b!531355 (=> (not res!326916) (not e!309497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531355 (= res!326916 (validKeyInArray!0 (select (arr!16182 a!3154) j!147)))))

(declare-fun b!531356 () Bool)

(declare-fun res!326919 () Bool)

(assert (=> b!531356 (=> (not res!326919) (not e!309496))))

(assert (=> b!531356 (= res!326919 (and (bvsle #b00000000000000000000000000000000 (size!16546 a!3154)) (bvslt (size!16546 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!531357 () Bool)

(declare-fun res!326920 () Bool)

(assert (=> b!531357 (=> (not res!326920) (not e!309497))))

(assert (=> b!531357 (= res!326920 (validKeyInArray!0 k!1998))))

(declare-fun b!531358 () Bool)

(declare-fun res!326918 () Bool)

(assert (=> b!531358 (=> (not res!326918) (not e!309497))))

(declare-fun arrayContainsKey!0 (array!33677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531358 (= res!326918 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531359 () Bool)

(assert (=> b!531359 (= e!309496 e!309498)))

(declare-fun res!326912 () Bool)

(assert (=> b!531359 (=> res!326912 e!309498)))

(assert (=> b!531359 (= res!326912 (contains!2784 Nil!10298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!48324 res!326917) b!531351))

(assert (= (and b!531351 res!326921) b!531355))

(assert (= (and b!531355 res!326916) b!531357))

(assert (= (and b!531357 res!326920) b!531358))

(assert (= (and b!531358 res!326918) b!531350))

(assert (= (and b!531350 res!326915) b!531353))

(assert (= (and b!531353 res!326913) b!531356))

(assert (= (and b!531356 res!326919) b!531352))

(assert (= (and b!531352 res!326914) b!531359))

(assert (= (and b!531359 (not res!326912)) b!531354))

(declare-fun m!511779 () Bool)

(assert (=> b!531352 m!511779))

(declare-fun m!511781 () Bool)

(assert (=> b!531359 m!511781))

(declare-fun m!511783 () Bool)

(assert (=> b!531357 m!511783))

(declare-fun m!511785 () Bool)

(assert (=> b!531354 m!511785))

(declare-fun m!511787 () Bool)

(assert (=> b!531353 m!511787))

(declare-fun m!511789 () Bool)

(assert (=> start!48324 m!511789))

(declare-fun m!511791 () Bool)

(assert (=> start!48324 m!511791))

(declare-fun m!511793 () Bool)

(assert (=> b!531355 m!511793))

(assert (=> b!531355 m!511793))

(declare-fun m!511795 () Bool)

(assert (=> b!531355 m!511795))

(declare-fun m!511797 () Bool)

(assert (=> b!531358 m!511797))

(declare-fun m!511799 () Bool)

(assert (=> b!531350 m!511799))

(push 1)

(assert (not b!531350))

(assert (not start!48324))

(assert (not b!531352))

(assert (not b!531358))

(assert (not b!531354))

(assert (not b!531353))

(assert (not b!531357))

(assert (not b!531355))

(assert (not b!531359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!531468 () Bool)

(declare-fun c!62552 () Bool)

(declare-fun lt!244986 () (_ BitVec 64))

(assert (=> b!531468 (= c!62552 (= lt!244986 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309550 () SeekEntryResult!4640)

(declare-fun e!309551 () SeekEntryResult!4640)

(assert (=> b!531468 (= e!309550 e!309551)))

(declare-fun lt!244987 () SeekEntryResult!4640)

(declare-fun b!531469 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33677 (_ BitVec 32)) SeekEntryResult!4640)

(assert (=> b!531469 (= e!309551 (seekKeyOrZeroReturnVacant!0 (x!49766 lt!244987) (index!20786 lt!244987) (index!20786 lt!244987) k!1998 a!3154 mask!3216))))

(declare-fun d!81261 () Bool)

(declare-fun lt!244985 () SeekEntryResult!4640)

(assert (=> d!81261 (and (or (is-Undefined!4640 lt!244985) (not (is-Found!4640 lt!244985)) (and (bvsge (index!20785 lt!244985) #b00000000000000000000000000000000) (bvslt (index!20785 lt!244985) (size!16546 a!3154)))) (or (is-Undefined!4640 lt!244985) (is-Found!4640 lt!244985) (not (is-MissingZero!4640 lt!244985)) (and (bvsge (index!20784 lt!244985) #b00000000000000000000000000000000) (bvslt (index!20784 lt!244985) (size!16546 a!3154)))) (or (is-Undefined!4640 lt!244985) (is-Found!4640 lt!244985) (is-MissingZero!4640 lt!244985) (not (is-MissingVacant!4640 lt!244985)) (and (bvsge (index!20787 lt!244985) #b00000000000000000000000000000000) (bvslt (index!20787 lt!244985) (size!16546 a!3154)))) (or (is-Undefined!4640 lt!244985) (ite (is-Found!4640 lt!244985) (= (select (arr!16182 a!3154) (index!20785 lt!244985)) k!1998) (ite (is-MissingZero!4640 lt!244985) (= (select (arr!16182 a!3154) (index!20784 lt!244985)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4640 lt!244985) (= (select (arr!16182 a!3154) (index!20787 lt!244985)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!309552 () SeekEntryResult!4640)

(assert (=> d!81261 (= lt!244985 e!309552)))

(declare-fun c!62550 () Bool)

(assert (=> d!81261 (= c!62550 (and (is-Intermediate!4640 lt!244987) (undefined!5452 lt!244987)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33677 (_ BitVec 32)) SeekEntryResult!4640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81261 (= lt!244987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81261 (validMask!0 mask!3216)))

(assert (=> d!81261 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!244985)))

(declare-fun b!531470 () Bool)

(assert (=> b!531470 (= e!309552 e!309550)))

(assert (=> b!531470 (= lt!244986 (select (arr!16182 a!3154) (index!20786 lt!244987)))))

(declare-fun c!62551 () Bool)

(assert (=> b!531470 (= c!62551 (= lt!244986 k!1998))))

(declare-fun b!531471 () Bool)

(assert (=> b!531471 (= e!309552 Undefined!4640)))

(declare-fun b!531472 () Bool)

(assert (=> b!531472 (= e!309550 (Found!4640 (index!20786 lt!244987)))))

(declare-fun b!531473 () Bool)

(assert (=> b!531473 (= e!309551 (MissingZero!4640 (index!20786 lt!244987)))))

(assert (= (and d!81261 c!62550) b!531471))

(assert (= (and d!81261 (not c!62550)) b!531470))

(assert (= (and b!531470 c!62551) b!531472))

(assert (= (and b!531470 (not c!62551)) b!531468))

(assert (= (and b!531468 c!62552) b!531473))

(assert (= (and b!531468 (not c!62552)) b!531469))

(declare-fun m!511863 () Bool)

(assert (=> b!531469 m!511863))

(declare-fun m!511865 () Bool)

(assert (=> d!81261 m!511865))

(declare-fun m!511867 () Bool)

(assert (=> d!81261 m!511867))

(declare-fun m!511869 () Bool)

(assert (=> d!81261 m!511869))

(declare-fun m!511871 () Bool)

(assert (=> d!81261 m!511871))

(declare-fun m!511873 () Bool)

(assert (=> d!81261 m!511873))

(assert (=> d!81261 m!511789))

(assert (=> d!81261 m!511869))

(declare-fun m!511875 () Bool)

(assert (=> b!531470 m!511875))

(assert (=> b!531350 d!81261))

(declare-fun d!81273 () Bool)

(assert (=> d!81273 (= (validKeyInArray!0 (select (arr!16182 a!3154) j!147)) (and (not (= (select (arr!16182 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16182 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531355 d!81273))

(declare-fun d!81275 () Bool)

(declare-fun lt!244995 () Bool)

(declare-fun content!224 (List!10301) (Set (_ BitVec 64)))

(assert (=> d!81275 (= lt!244995 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!224 Nil!10298)))))

(declare-fun e!309565 () Bool)

(assert (=> d!81275 (= lt!244995 e!309565)))

(declare-fun res!326997 () Bool)

(assert (=> d!81275 (=> (not res!326997) (not e!309565))))

(assert (=> d!81275 (= res!326997 (is-Cons!10297 Nil!10298))))

(assert (=> d!81275 (= (contains!2784 Nil!10298 #b1000000000000000000000000000000000000000000000000000000000000000) lt!244995)))

(declare-fun b!531488 () Bool)

(declare-fun e!309564 () Bool)

(assert (=> b!531488 (= e!309565 e!309564)))

(declare-fun res!326996 () Bool)

(assert (=> b!531488 (=> res!326996 e!309564)))

(assert (=> b!531488 (= res!326996 (= (h!11237 Nil!10298) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531489 () Bool)

(assert (=> b!531489 (= e!309564 (contains!2784 (t!16529 Nil!10298) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81275 res!326997) b!531488))

(assert (= (and b!531488 (not res!326996)) b!531489))

(declare-fun m!511891 () Bool)

(assert (=> d!81275 m!511891))

(declare-fun m!511893 () Bool)

(assert (=> d!81275 m!511893))

(declare-fun m!511895 () Bool)

(assert (=> b!531489 m!511895))

(assert (=> b!531354 d!81275))

(declare-fun d!81283 () Bool)

(declare-fun lt!244997 () Bool)

(assert (=> d!81283 (= lt!244997 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!224 Nil!10298)))))

(declare-fun e!309569 () Bool)

(assert (=> d!81283 (= lt!244997 e!309569)))

(declare-fun res!327001 () Bool)

(assert (=> d!81283 (=> (not res!327001) (not e!309569))))

(assert (=> d!81283 (= res!327001 (is-Cons!10297 Nil!10298))))

(assert (=> d!81283 (= (contains!2784 Nil!10298 #b0000000000000000000000000000000000000000000000000000000000000000) lt!244997)))

(declare-fun b!531492 () Bool)

(declare-fun e!309568 () Bool)

(assert (=> b!531492 (= e!309569 e!309568)))

(declare-fun res!327000 () Bool)

(assert (=> b!531492 (=> res!327000 e!309568)))

(assert (=> b!531492 (= res!327000 (= (h!11237 Nil!10298) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531493 () Bool)

(assert (=> b!531493 (= e!309568 (contains!2784 (t!16529 Nil!10298) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81283 res!327001) b!531492))

(assert (= (and b!531492 (not res!327000)) b!531493))

(assert (=> d!81283 m!511891))

(declare-fun m!511903 () Bool)

(assert (=> d!81283 m!511903))

(declare-fun m!511905 () Bool)

(assert (=> b!531493 m!511905))

(assert (=> b!531359 d!81283))

(declare-fun d!81287 () Bool)

