; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67680 () Bool)

(assert start!67680)

(declare-fun b!784172 () Bool)

(declare-fun e!435999 () Bool)

(declare-fun e!435996 () Bool)

(assert (=> b!784172 (= e!435999 e!435996)))

(declare-fun res!530624 () Bool)

(assert (=> b!784172 (=> res!530624 e!435996)))

(declare-fun lt!349548 () (_ BitVec 64))

(declare-fun lt!349553 () (_ BitVec 64))

(assert (=> b!784172 (= res!530624 (= lt!349548 lt!349553))))

(declare-datatypes ((array!42720 0))(
  ( (array!42721 (arr!20448 (Array (_ BitVec 32) (_ BitVec 64))) (size!20869 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42720)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!784172 (= lt!349548 (select (store (arr!20448 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!784173 () Bool)

(declare-fun res!530628 () Bool)

(declare-fun e!436004 () Bool)

(assert (=> b!784173 (=> (not res!530628) (not e!436004))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784173 (= res!530628 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20869 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20869 a!3186))))))

(declare-fun b!784174 () Bool)

(declare-fun res!530619 () Bool)

(declare-fun e!436002 () Bool)

(assert (=> b!784174 (=> (not res!530619) (not e!436002))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!784174 (= res!530619 (and (= (size!20869 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20869 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20869 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784175 () Bool)

(declare-fun e!435994 () Bool)

(declare-datatypes ((SeekEntryResult!8048 0))(
  ( (MissingZero!8048 (index!34560 (_ BitVec 32))) (Found!8048 (index!34561 (_ BitVec 32))) (Intermediate!8048 (undefined!8860 Bool) (index!34562 (_ BitVec 32)) (x!65516 (_ BitVec 32))) (Undefined!8048) (MissingVacant!8048 (index!34563 (_ BitVec 32))) )
))
(declare-fun lt!349546 () SeekEntryResult!8048)

(declare-fun lt!349551 () SeekEntryResult!8048)

(assert (=> b!784175 (= e!435994 (= lt!349546 lt!349551))))

(declare-fun b!784176 () Bool)

(declare-datatypes ((Unit!27080 0))(
  ( (Unit!27081) )
))
(declare-fun e!435995 () Unit!27080)

(declare-fun Unit!27082 () Unit!27080)

(assert (=> b!784176 (= e!435995 Unit!27082)))

(assert (=> b!784176 false))

(declare-fun b!784177 () Bool)

(declare-fun res!530630 () Bool)

(assert (=> b!784177 (=> (not res!530630) (not e!436002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784177 (= res!530630 (validKeyInArray!0 (select (arr!20448 a!3186) j!159)))))

(declare-fun res!530621 () Bool)

(assert (=> start!67680 (=> (not res!530621) (not e!436002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67680 (= res!530621 (validMask!0 mask!3328))))

(assert (=> start!67680 e!436002))

(assert (=> start!67680 true))

(declare-fun array_inv!16244 (array!42720) Bool)

(assert (=> start!67680 (array_inv!16244 a!3186)))

(declare-fun b!784178 () Bool)

(declare-fun res!530631 () Bool)

(assert (=> b!784178 (=> (not res!530631) (not e!436002))))

(declare-fun arrayContainsKey!0 (array!42720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784178 (= res!530631 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784179 () Bool)

(declare-fun e!436003 () Bool)

(assert (=> b!784179 (= e!436004 e!436003)))

(declare-fun res!530617 () Bool)

(assert (=> b!784179 (=> (not res!530617) (not e!436003))))

(declare-fun lt!349545 () SeekEntryResult!8048)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42720 (_ BitVec 32)) SeekEntryResult!8048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784179 (= res!530617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20448 a!3186) j!159) mask!3328) (select (arr!20448 a!3186) j!159) a!3186 mask!3328) lt!349545))))

(assert (=> b!784179 (= lt!349545 (Intermediate!8048 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784180 () Bool)

(declare-fun e!435998 () Bool)

(declare-fun e!435993 () Bool)

(assert (=> b!784180 (= e!435998 (not e!435993))))

(declare-fun res!530618 () Bool)

(assert (=> b!784180 (=> res!530618 e!435993)))

(declare-fun lt!349549 () SeekEntryResult!8048)

(assert (=> b!784180 (= res!530618 (or (not (is-Intermediate!8048 lt!349549)) (bvslt x!1131 (x!65516 lt!349549)) (not (= x!1131 (x!65516 lt!349549))) (not (= index!1321 (index!34562 lt!349549)))))))

(declare-fun e!436001 () Bool)

(assert (=> b!784180 e!436001))

(declare-fun res!530632 () Bool)

(assert (=> b!784180 (=> (not res!530632) (not e!436001))))

(declare-fun lt!349552 () SeekEntryResult!8048)

(assert (=> b!784180 (= res!530632 (= lt!349546 lt!349552))))

(assert (=> b!784180 (= lt!349552 (Found!8048 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42720 (_ BitVec 32)) SeekEntryResult!8048)

(assert (=> b!784180 (= lt!349546 (seekEntryOrOpen!0 (select (arr!20448 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42720 (_ BitVec 32)) Bool)

(assert (=> b!784180 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349547 () Unit!27080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27080)

(assert (=> b!784180 (= lt!349547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784181 () Bool)

(declare-fun res!530616 () Bool)

(assert (=> b!784181 (=> (not res!530616) (not e!436004))))

(declare-datatypes ((List!14450 0))(
  ( (Nil!14447) (Cons!14446 (h!15569 (_ BitVec 64)) (t!20765 List!14450)) )
))
(declare-fun arrayNoDuplicates!0 (array!42720 (_ BitVec 32) List!14450) Bool)

(assert (=> b!784181 (= res!530616 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14447))))

(declare-fun b!784182 () Bool)

(declare-fun e!435997 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42720 (_ BitVec 32)) SeekEntryResult!8048)

(assert (=> b!784182 (= e!435997 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20448 a!3186) j!159) a!3186 mask!3328) (Found!8048 j!159)))))

(declare-fun b!784183 () Bool)

(assert (=> b!784183 (= e!436003 e!435998)))

(declare-fun res!530627 () Bool)

(assert (=> b!784183 (=> (not res!530627) (not e!435998))))

(declare-fun lt!349556 () SeekEntryResult!8048)

(assert (=> b!784183 (= res!530627 (= lt!349556 lt!349549))))

(declare-fun lt!349550 () array!42720)

(assert (=> b!784183 (= lt!349549 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349553 lt!349550 mask!3328))))

(assert (=> b!784183 (= lt!349556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349553 mask!3328) lt!349553 lt!349550 mask!3328))))

(assert (=> b!784183 (= lt!349553 (select (store (arr!20448 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784183 (= lt!349550 (array!42721 (store (arr!20448 a!3186) i!1173 k!2102) (size!20869 a!3186)))))

(declare-fun b!784184 () Bool)

(assert (=> b!784184 (= e!436002 e!436004)))

(declare-fun res!530623 () Bool)

(assert (=> b!784184 (=> (not res!530623) (not e!436004))))

(declare-fun lt!349554 () SeekEntryResult!8048)

(assert (=> b!784184 (= res!530623 (or (= lt!349554 (MissingZero!8048 i!1173)) (= lt!349554 (MissingVacant!8048 i!1173))))))

(assert (=> b!784184 (= lt!349554 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784185 () Bool)

(declare-fun Unit!27083 () Unit!27080)

(assert (=> b!784185 (= e!435995 Unit!27083)))

(declare-fun b!784186 () Bool)

(declare-fun res!530622 () Bool)

(assert (=> b!784186 (=> (not res!530622) (not e!436004))))

(assert (=> b!784186 (= res!530622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784187 () Bool)

(declare-fun res!530633 () Bool)

(assert (=> b!784187 (=> (not res!530633) (not e!436003))))

(assert (=> b!784187 (= res!530633 e!435997)))

(declare-fun c!87187 () Bool)

(assert (=> b!784187 (= c!87187 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784188 () Bool)

(declare-fun res!530620 () Bool)

(assert (=> b!784188 (=> (not res!530620) (not e!436002))))

(assert (=> b!784188 (= res!530620 (validKeyInArray!0 k!2102))))

(declare-fun b!784189 () Bool)

(assert (=> b!784189 (= e!435993 e!435999)))

(declare-fun res!530625 () Bool)

(assert (=> b!784189 (=> res!530625 e!435999)))

(assert (=> b!784189 (= res!530625 (not (= lt!349551 lt!349552)))))

(assert (=> b!784189 (= lt!349551 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20448 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784190 () Bool)

(assert (=> b!784190 (= e!435996 true)))

(assert (=> b!784190 e!435994))

(declare-fun res!530615 () Bool)

(assert (=> b!784190 (=> (not res!530615) (not e!435994))))

(assert (=> b!784190 (= res!530615 (= lt!349548 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349555 () Unit!27080)

(assert (=> b!784190 (= lt!349555 e!435995)))

(declare-fun c!87186 () Bool)

(assert (=> b!784190 (= c!87186 (= lt!349548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784191 () Bool)

(declare-fun res!530629 () Bool)

(assert (=> b!784191 (=> (not res!530629) (not e!436003))))

(assert (=> b!784191 (= res!530629 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20448 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784192 () Bool)

(assert (=> b!784192 (= e!436001 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20448 a!3186) j!159) a!3186 mask!3328) lt!349552))))

(declare-fun b!784193 () Bool)

(declare-fun res!530626 () Bool)

(assert (=> b!784193 (=> (not res!530626) (not e!435994))))

(assert (=> b!784193 (= res!530626 (= (seekEntryOrOpen!0 lt!349553 lt!349550 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349553 lt!349550 mask!3328)))))

(declare-fun b!784194 () Bool)

(assert (=> b!784194 (= e!435997 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20448 a!3186) j!159) a!3186 mask!3328) lt!349545))))

(assert (= (and start!67680 res!530621) b!784174))

(assert (= (and b!784174 res!530619) b!784177))

(assert (= (and b!784177 res!530630) b!784188))

(assert (= (and b!784188 res!530620) b!784178))

(assert (= (and b!784178 res!530631) b!784184))

(assert (= (and b!784184 res!530623) b!784186))

(assert (= (and b!784186 res!530622) b!784181))

(assert (= (and b!784181 res!530616) b!784173))

(assert (= (and b!784173 res!530628) b!784179))

(assert (= (and b!784179 res!530617) b!784191))

(assert (= (and b!784191 res!530629) b!784187))

(assert (= (and b!784187 c!87187) b!784194))

(assert (= (and b!784187 (not c!87187)) b!784182))

(assert (= (and b!784187 res!530633) b!784183))

(assert (= (and b!784183 res!530627) b!784180))

(assert (= (and b!784180 res!530632) b!784192))

(assert (= (and b!784180 (not res!530618)) b!784189))

(assert (= (and b!784189 (not res!530625)) b!784172))

(assert (= (and b!784172 (not res!530624)) b!784190))

(assert (= (and b!784190 c!87186) b!784176))

(assert (= (and b!784190 (not c!87186)) b!784185))

(assert (= (and b!784190 res!530615) b!784193))

(assert (= (and b!784193 res!530626) b!784175))

(declare-fun m!726557 () Bool)

(assert (=> b!784182 m!726557))

(assert (=> b!784182 m!726557))

(declare-fun m!726559 () Bool)

(assert (=> b!784182 m!726559))

(declare-fun m!726561 () Bool)

(assert (=> start!67680 m!726561))

(declare-fun m!726563 () Bool)

(assert (=> start!67680 m!726563))

(declare-fun m!726565 () Bool)

(assert (=> b!784191 m!726565))

(declare-fun m!726567 () Bool)

(assert (=> b!784188 m!726567))

(declare-fun m!726569 () Bool)

(assert (=> b!784178 m!726569))

(declare-fun m!726571 () Bool)

(assert (=> b!784172 m!726571))

(declare-fun m!726573 () Bool)

(assert (=> b!784172 m!726573))

(declare-fun m!726575 () Bool)

(assert (=> b!784186 m!726575))

(assert (=> b!784179 m!726557))

(assert (=> b!784179 m!726557))

(declare-fun m!726577 () Bool)

(assert (=> b!784179 m!726577))

(assert (=> b!784179 m!726577))

(assert (=> b!784179 m!726557))

(declare-fun m!726579 () Bool)

(assert (=> b!784179 m!726579))

(assert (=> b!784177 m!726557))

(assert (=> b!784177 m!726557))

(declare-fun m!726581 () Bool)

(assert (=> b!784177 m!726581))

(declare-fun m!726583 () Bool)

(assert (=> b!784183 m!726583))

(declare-fun m!726585 () Bool)

(assert (=> b!784183 m!726585))

(assert (=> b!784183 m!726571))

(declare-fun m!726587 () Bool)

(assert (=> b!784183 m!726587))

(assert (=> b!784183 m!726585))

(declare-fun m!726589 () Bool)

(assert (=> b!784183 m!726589))

(declare-fun m!726591 () Bool)

(assert (=> b!784181 m!726591))

(declare-fun m!726593 () Bool)

(assert (=> b!784193 m!726593))

(declare-fun m!726595 () Bool)

(assert (=> b!784193 m!726595))

(assert (=> b!784189 m!726557))

(assert (=> b!784189 m!726557))

(assert (=> b!784189 m!726559))

(assert (=> b!784194 m!726557))

(assert (=> b!784194 m!726557))

(declare-fun m!726597 () Bool)

(assert (=> b!784194 m!726597))

(declare-fun m!726599 () Bool)

(assert (=> b!784184 m!726599))

(assert (=> b!784180 m!726557))

(assert (=> b!784180 m!726557))

(declare-fun m!726601 () Bool)

(assert (=> b!784180 m!726601))

(declare-fun m!726603 () Bool)

(assert (=> b!784180 m!726603))

(declare-fun m!726605 () Bool)

(assert (=> b!784180 m!726605))

(assert (=> b!784192 m!726557))

(assert (=> b!784192 m!726557))

(declare-fun m!726607 () Bool)

(assert (=> b!784192 m!726607))

(push 1)

