; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47742 () Bool)

(assert start!47742)

(declare-fun b!525382 () Bool)

(declare-fun res!322163 () Bool)

(declare-fun e!306333 () Bool)

(assert (=> b!525382 (=> (not res!322163) (not e!306333))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33379 0))(
  ( (array!33380 (arr!16041 (Array (_ BitVec 32) (_ BitVec 64))) (size!16405 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33379)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525382 (= res!322163 (and (= (size!16405 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16405 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16405 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!322166 () Bool)

(assert (=> start!47742 (=> (not res!322166) (not e!306333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47742 (= res!322166 (validMask!0 mask!3524))))

(assert (=> start!47742 e!306333))

(assert (=> start!47742 true))

(declare-fun array_inv!11837 (array!33379) Bool)

(assert (=> start!47742 (array_inv!11837 a!3235)))

(declare-fun b!525383 () Bool)

(declare-fun e!306331 () Bool)

(assert (=> b!525383 (= e!306333 e!306331)))

(declare-fun res!322155 () Bool)

(assert (=> b!525383 (=> (not res!322155) (not e!306331))))

(declare-datatypes ((SeekEntryResult!4508 0))(
  ( (MissingZero!4508 (index!20244 (_ BitVec 32))) (Found!4508 (index!20245 (_ BitVec 32))) (Intermediate!4508 (undefined!5320 Bool) (index!20246 (_ BitVec 32)) (x!49225 (_ BitVec 32))) (Undefined!4508) (MissingVacant!4508 (index!20247 (_ BitVec 32))) )
))
(declare-fun lt!241363 () SeekEntryResult!4508)

(assert (=> b!525383 (= res!322155 (or (= lt!241363 (MissingZero!4508 i!1204)) (= lt!241363 (MissingVacant!4508 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33379 (_ BitVec 32)) SeekEntryResult!4508)

(assert (=> b!525383 (= lt!241363 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525384 () Bool)

(declare-fun res!322165 () Bool)

(declare-fun e!306335 () Bool)

(assert (=> b!525384 (=> res!322165 e!306335)))

(declare-fun lt!241362 () SeekEntryResult!4508)

(assert (=> b!525384 (= res!322165 (or (undefined!5320 lt!241362) (not (is-Intermediate!4508 lt!241362))))))

(declare-fun b!525385 () Bool)

(declare-fun res!322157 () Bool)

(assert (=> b!525385 (=> (not res!322157) (not e!306331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33379 (_ BitVec 32)) Bool)

(assert (=> b!525385 (= res!322157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525386 () Bool)

(declare-datatypes ((Unit!16484 0))(
  ( (Unit!16485) )
))
(declare-fun e!306332 () Unit!16484)

(declare-fun Unit!16486 () Unit!16484)

(assert (=> b!525386 (= e!306332 Unit!16486)))

(declare-fun b!525387 () Bool)

(declare-fun Unit!16487 () Unit!16484)

(assert (=> b!525387 (= e!306332 Unit!16487)))

(declare-fun lt!241358 () Unit!16484)

(declare-fun lt!241361 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16484)

(assert (=> b!525387 (= lt!241358 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241361 #b00000000000000000000000000000000 (index!20246 lt!241362) (x!49225 lt!241362) mask!3524))))

(declare-fun lt!241360 () (_ BitVec 64))

(declare-fun res!322160 () Bool)

(declare-fun lt!241354 () array!33379)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33379 (_ BitVec 32)) SeekEntryResult!4508)

(assert (=> b!525387 (= res!322160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241361 lt!241360 lt!241354 mask!3524) (Intermediate!4508 false (index!20246 lt!241362) (x!49225 lt!241362))))))

(declare-fun e!306336 () Bool)

(assert (=> b!525387 (=> (not res!322160) (not e!306336))))

(assert (=> b!525387 e!306336))

(declare-fun e!306330 () Bool)

(declare-fun b!525388 () Bool)

(assert (=> b!525388 (= e!306330 (= (seekEntryOrOpen!0 (select (arr!16041 a!3235) j!176) a!3235 mask!3524) (Found!4508 j!176)))))

(declare-fun b!525389 () Bool)

(assert (=> b!525389 (= e!306336 false)))

(declare-fun b!525390 () Bool)

(assert (=> b!525390 (= e!306335 true)))

(assert (=> b!525390 (= (index!20246 lt!241362) i!1204)))

(declare-fun lt!241359 () Unit!16484)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16484)

(assert (=> b!525390 (= lt!241359 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241361 #b00000000000000000000000000000000 (index!20246 lt!241362) (x!49225 lt!241362) mask!3524))))

(assert (=> b!525390 (and (or (= (select (arr!16041 a!3235) (index!20246 lt!241362)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16041 a!3235) (index!20246 lt!241362)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16041 a!3235) (index!20246 lt!241362)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16041 a!3235) (index!20246 lt!241362)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241357 () Unit!16484)

(assert (=> b!525390 (= lt!241357 e!306332)))

(declare-fun c!61919 () Bool)

(assert (=> b!525390 (= c!61919 (= (select (arr!16041 a!3235) (index!20246 lt!241362)) (select (arr!16041 a!3235) j!176)))))

(assert (=> b!525390 (and (bvslt (x!49225 lt!241362) #b01111111111111111111111111111110) (or (= (select (arr!16041 a!3235) (index!20246 lt!241362)) (select (arr!16041 a!3235) j!176)) (= (select (arr!16041 a!3235) (index!20246 lt!241362)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16041 a!3235) (index!20246 lt!241362)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525391 () Bool)

(declare-fun res!322156 () Bool)

(assert (=> b!525391 (=> (not res!322156) (not e!306333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525391 (= res!322156 (validKeyInArray!0 (select (arr!16041 a!3235) j!176)))))

(declare-fun b!525392 () Bool)

(assert (=> b!525392 (= e!306331 (not e!306335))))

(declare-fun res!322161 () Bool)

(assert (=> b!525392 (=> res!322161 e!306335)))

(declare-fun lt!241356 () (_ BitVec 32))

(assert (=> b!525392 (= res!322161 (= lt!241362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241356 lt!241360 lt!241354 mask!3524)))))

(assert (=> b!525392 (= lt!241362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241361 (select (arr!16041 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525392 (= lt!241356 (toIndex!0 lt!241360 mask!3524))))

(assert (=> b!525392 (= lt!241360 (select (store (arr!16041 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525392 (= lt!241361 (toIndex!0 (select (arr!16041 a!3235) j!176) mask!3524))))

(assert (=> b!525392 (= lt!241354 (array!33380 (store (arr!16041 a!3235) i!1204 k!2280) (size!16405 a!3235)))))

(assert (=> b!525392 e!306330))

(declare-fun res!322162 () Bool)

(assert (=> b!525392 (=> (not res!322162) (not e!306330))))

(assert (=> b!525392 (= res!322162 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241355 () Unit!16484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16484)

(assert (=> b!525392 (= lt!241355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525393 () Bool)

(declare-fun res!322159 () Bool)

(assert (=> b!525393 (=> (not res!322159) (not e!306333))))

(assert (=> b!525393 (= res!322159 (validKeyInArray!0 k!2280))))

(declare-fun b!525394 () Bool)

(declare-fun res!322158 () Bool)

(assert (=> b!525394 (=> (not res!322158) (not e!306333))))

(declare-fun arrayContainsKey!0 (array!33379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525394 (= res!322158 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525395 () Bool)

(declare-fun res!322164 () Bool)

(assert (=> b!525395 (=> (not res!322164) (not e!306331))))

(declare-datatypes ((List!10199 0))(
  ( (Nil!10196) (Cons!10195 (h!11126 (_ BitVec 64)) (t!16427 List!10199)) )
))
(declare-fun arrayNoDuplicates!0 (array!33379 (_ BitVec 32) List!10199) Bool)

(assert (=> b!525395 (= res!322164 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10196))))

(assert (= (and start!47742 res!322166) b!525382))

(assert (= (and b!525382 res!322163) b!525391))

(assert (= (and b!525391 res!322156) b!525393))

(assert (= (and b!525393 res!322159) b!525394))

(assert (= (and b!525394 res!322158) b!525383))

(assert (= (and b!525383 res!322155) b!525385))

(assert (= (and b!525385 res!322157) b!525395))

(assert (= (and b!525395 res!322164) b!525392))

(assert (= (and b!525392 res!322162) b!525388))

(assert (= (and b!525392 (not res!322161)) b!525384))

(assert (= (and b!525384 (not res!322165)) b!525390))

(assert (= (and b!525390 c!61919) b!525387))

(assert (= (and b!525390 (not c!61919)) b!525386))

(assert (= (and b!525387 res!322160) b!525389))

(declare-fun m!506037 () Bool)

(assert (=> b!525383 m!506037))

(declare-fun m!506039 () Bool)

(assert (=> b!525395 m!506039))

(declare-fun m!506041 () Bool)

(assert (=> b!525388 m!506041))

(assert (=> b!525388 m!506041))

(declare-fun m!506043 () Bool)

(assert (=> b!525388 m!506043))

(declare-fun m!506045 () Bool)

(assert (=> b!525393 m!506045))

(declare-fun m!506047 () Bool)

(assert (=> b!525385 m!506047))

(declare-fun m!506049 () Bool)

(assert (=> b!525390 m!506049))

(declare-fun m!506051 () Bool)

(assert (=> b!525390 m!506051))

(assert (=> b!525390 m!506041))

(assert (=> b!525391 m!506041))

(assert (=> b!525391 m!506041))

(declare-fun m!506053 () Bool)

(assert (=> b!525391 m!506053))

(assert (=> b!525392 m!506041))

(declare-fun m!506055 () Bool)

(assert (=> b!525392 m!506055))

(declare-fun m!506057 () Bool)

(assert (=> b!525392 m!506057))

(declare-fun m!506059 () Bool)

(assert (=> b!525392 m!506059))

(declare-fun m!506061 () Bool)

(assert (=> b!525392 m!506061))

(assert (=> b!525392 m!506041))

(declare-fun m!506063 () Bool)

(assert (=> b!525392 m!506063))

(assert (=> b!525392 m!506041))

(declare-fun m!506065 () Bool)

(assert (=> b!525392 m!506065))

(declare-fun m!506067 () Bool)

(assert (=> b!525392 m!506067))

(declare-fun m!506069 () Bool)

(assert (=> b!525392 m!506069))

(declare-fun m!506071 () Bool)

(assert (=> start!47742 m!506071))

(declare-fun m!506073 () Bool)

(assert (=> start!47742 m!506073))

(declare-fun m!506075 () Bool)

(assert (=> b!525387 m!506075))

(declare-fun m!506077 () Bool)

(assert (=> b!525387 m!506077))

(declare-fun m!506079 () Bool)

(assert (=> b!525394 m!506079))

(push 1)

