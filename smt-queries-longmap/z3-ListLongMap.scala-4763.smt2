; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65640 () Bool)

(assert start!65640)

(declare-fun b!751497 () Bool)

(declare-fun res!507363 () Bool)

(declare-fun e!419224 () Bool)

(assert (=> b!751497 (=> (not res!507363) (not e!419224))))

(declare-datatypes ((array!41813 0))(
  ( (array!41814 (arr!20020 (Array (_ BitVec 32) (_ BitVec 64))) (size!20441 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41813)

(declare-datatypes ((List!14022 0))(
  ( (Nil!14019) (Cons!14018 (h!15090 (_ BitVec 64)) (t!20337 List!14022)) )
))
(declare-fun arrayNoDuplicates!0 (array!41813 (_ BitVec 32) List!14022) Bool)

(assert (=> b!751497 (= res!507363 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14019))))

(declare-fun b!751498 () Bool)

(declare-fun e!419220 () Bool)

(declare-fun e!419225 () Bool)

(assert (=> b!751498 (= e!419220 e!419225)))

(declare-fun res!507377 () Bool)

(assert (=> b!751498 (=> (not res!507377) (not e!419225))))

(declare-datatypes ((SeekEntryResult!7620 0))(
  ( (MissingZero!7620 (index!32848 (_ BitVec 32))) (Found!7620 (index!32849 (_ BitVec 32))) (Intermediate!7620 (undefined!8432 Bool) (index!32850 (_ BitVec 32)) (x!63770 (_ BitVec 32))) (Undefined!7620) (MissingVacant!7620 (index!32851 (_ BitVec 32))) )
))
(declare-fun lt!334215 () SeekEntryResult!7620)

(declare-fun lt!334217 () SeekEntryResult!7620)

(assert (=> b!751498 (= res!507377 (= lt!334215 lt!334217))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!334212 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!334220 () array!41813)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41813 (_ BitVec 32)) SeekEntryResult!7620)

(assert (=> b!751498 (= lt!334217 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334212 lt!334220 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751498 (= lt!334215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334212 mask!3328) lt!334212 lt!334220 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!751498 (= lt!334212 (select (store (arr!20020 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751498 (= lt!334220 (array!41814 (store (arr!20020 a!3186) i!1173 k0!2102) (size!20441 a!3186)))))

(declare-fun b!751499 () Bool)

(declare-fun res!507365 () Bool)

(declare-fun e!419223 () Bool)

(assert (=> b!751499 (=> (not res!507365) (not e!419223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751499 (= res!507365 (validKeyInArray!0 (select (arr!20020 a!3186) j!159)))))

(declare-fun b!751500 () Bool)

(declare-fun e!419228 () Bool)

(declare-fun e!419219 () Bool)

(assert (=> b!751500 (= e!419228 e!419219)))

(declare-fun res!507360 () Bool)

(assert (=> b!751500 (=> res!507360 e!419219)))

(declare-fun lt!334214 () (_ BitVec 64))

(assert (=> b!751500 (= res!507360 (= lt!334214 lt!334212))))

(assert (=> b!751500 (= lt!334214 (select (store (arr!20020 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751501 () Bool)

(assert (=> b!751501 (= e!419223 e!419224)))

(declare-fun res!507362 () Bool)

(assert (=> b!751501 (=> (not res!507362) (not e!419224))))

(declare-fun lt!334218 () SeekEntryResult!7620)

(assert (=> b!751501 (= res!507362 (or (= lt!334218 (MissingZero!7620 i!1173)) (= lt!334218 (MissingVacant!7620 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41813 (_ BitVec 32)) SeekEntryResult!7620)

(assert (=> b!751501 (= lt!334218 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751502 () Bool)

(declare-datatypes ((Unit!25860 0))(
  ( (Unit!25861) )
))
(declare-fun e!419222 () Unit!25860)

(declare-fun Unit!25862 () Unit!25860)

(assert (=> b!751502 (= e!419222 Unit!25862)))

(assert (=> b!751502 false))

(declare-fun b!751503 () Bool)

(declare-fun res!507375 () Bool)

(assert (=> b!751503 (=> (not res!507375) (not e!419223))))

(declare-fun arrayContainsKey!0 (array!41813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751503 (= res!507375 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751504 () Bool)

(declare-fun res!507361 () Bool)

(assert (=> b!751504 (=> (not res!507361) (not e!419223))))

(assert (=> b!751504 (= res!507361 (validKeyInArray!0 k0!2102))))

(declare-fun b!751505 () Bool)

(declare-fun lt!334219 () SeekEntryResult!7620)

(declare-fun e!419226 () Bool)

(assert (=> b!751505 (= e!419226 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20020 a!3186) j!159) a!3186 mask!3328) lt!334219))))

(declare-fun res!507364 () Bool)

(assert (=> start!65640 (=> (not res!507364) (not e!419223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65640 (= res!507364 (validMask!0 mask!3328))))

(assert (=> start!65640 e!419223))

(assert (=> start!65640 true))

(declare-fun array_inv!15816 (array!41813) Bool)

(assert (=> start!65640 (array_inv!15816 a!3186)))

(declare-fun b!751506 () Bool)

(declare-fun res!507373 () Bool)

(assert (=> b!751506 (=> (not res!507373) (not e!419220))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!751506 (= res!507373 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20020 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751507 () Bool)

(assert (=> b!751507 (= e!419225 (not e!419228))))

(declare-fun res!507367 () Bool)

(assert (=> b!751507 (=> res!507367 e!419228)))

(get-info :version)

(assert (=> b!751507 (= res!507367 (or (not ((_ is Intermediate!7620) lt!334217)) (bvslt x!1131 (x!63770 lt!334217)) (not (= x!1131 (x!63770 lt!334217))) (not (= index!1321 (index!32850 lt!334217)))))))

(declare-fun e!419221 () Bool)

(assert (=> b!751507 e!419221))

(declare-fun res!507366 () Bool)

(assert (=> b!751507 (=> (not res!507366) (not e!419221))))

(declare-fun lt!334211 () SeekEntryResult!7620)

(declare-fun lt!334210 () SeekEntryResult!7620)

(assert (=> b!751507 (= res!507366 (= lt!334211 lt!334210))))

(assert (=> b!751507 (= lt!334210 (Found!7620 j!159))))

(assert (=> b!751507 (= lt!334211 (seekEntryOrOpen!0 (select (arr!20020 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41813 (_ BitVec 32)) Bool)

(assert (=> b!751507 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334216 () Unit!25860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25860)

(assert (=> b!751507 (= lt!334216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751508 () Bool)

(assert (=> b!751508 (= e!419224 e!419220)))

(declare-fun res!507370 () Bool)

(assert (=> b!751508 (=> (not res!507370) (not e!419220))))

(assert (=> b!751508 (= res!507370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20020 a!3186) j!159) mask!3328) (select (arr!20020 a!3186) j!159) a!3186 mask!3328) lt!334219))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751508 (= lt!334219 (Intermediate!7620 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751509 () Bool)

(assert (=> b!751509 (= e!419219 true)))

(declare-fun e!419227 () Bool)

(assert (=> b!751509 e!419227))

(declare-fun res!507372 () Bool)

(assert (=> b!751509 (=> (not res!507372) (not e!419227))))

(assert (=> b!751509 (= res!507372 (= lt!334214 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334213 () Unit!25860)

(assert (=> b!751509 (= lt!334213 e!419222)))

(declare-fun c!82449 () Bool)

(assert (=> b!751509 (= c!82449 (= lt!334214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751510 () Bool)

(declare-fun Unit!25863 () Unit!25860)

(assert (=> b!751510 (= e!419222 Unit!25863)))

(declare-fun b!751511 () Bool)

(declare-fun res!507368 () Bool)

(assert (=> b!751511 (=> (not res!507368) (not e!419223))))

(assert (=> b!751511 (= res!507368 (and (= (size!20441 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20441 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20441 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751512 () Bool)

(declare-fun res!507371 () Bool)

(assert (=> b!751512 (=> res!507371 e!419228)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41813 (_ BitVec 32)) SeekEntryResult!7620)

(assert (=> b!751512 (= res!507371 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20020 a!3186) j!159) a!3186 mask!3328) lt!334210)))))

(declare-fun b!751513 () Bool)

(declare-fun res!507374 () Bool)

(assert (=> b!751513 (=> (not res!507374) (not e!419224))))

(assert (=> b!751513 (= res!507374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751514 () Bool)

(assert (=> b!751514 (= e!419227 (= (seekEntryOrOpen!0 lt!334212 lt!334220 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334212 lt!334220 mask!3328)))))

(declare-fun b!751515 () Bool)

(declare-fun res!507376 () Bool)

(assert (=> b!751515 (=> (not res!507376) (not e!419224))))

(assert (=> b!751515 (= res!507376 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20441 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20441 a!3186))))))

(declare-fun b!751516 () Bool)

(assert (=> b!751516 (= e!419221 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20020 a!3186) j!159) a!3186 mask!3328) lt!334210))))

(declare-fun b!751517 () Bool)

(assert (=> b!751517 (= e!419226 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20020 a!3186) j!159) a!3186 mask!3328) (Found!7620 j!159)))))

(declare-fun b!751518 () Bool)

(declare-fun res!507369 () Bool)

(assert (=> b!751518 (=> (not res!507369) (not e!419220))))

(assert (=> b!751518 (= res!507369 e!419226)))

(declare-fun c!82450 () Bool)

(assert (=> b!751518 (= c!82450 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65640 res!507364) b!751511))

(assert (= (and b!751511 res!507368) b!751499))

(assert (= (and b!751499 res!507365) b!751504))

(assert (= (and b!751504 res!507361) b!751503))

(assert (= (and b!751503 res!507375) b!751501))

(assert (= (and b!751501 res!507362) b!751513))

(assert (= (and b!751513 res!507374) b!751497))

(assert (= (and b!751497 res!507363) b!751515))

(assert (= (and b!751515 res!507376) b!751508))

(assert (= (and b!751508 res!507370) b!751506))

(assert (= (and b!751506 res!507373) b!751518))

(assert (= (and b!751518 c!82450) b!751505))

(assert (= (and b!751518 (not c!82450)) b!751517))

(assert (= (and b!751518 res!507369) b!751498))

(assert (= (and b!751498 res!507377) b!751507))

(assert (= (and b!751507 res!507366) b!751516))

(assert (= (and b!751507 (not res!507367)) b!751512))

(assert (= (and b!751512 (not res!507371)) b!751500))

(assert (= (and b!751500 (not res!507360)) b!751509))

(assert (= (and b!751509 c!82449) b!751502))

(assert (= (and b!751509 (not c!82449)) b!751510))

(assert (= (and b!751509 res!507372) b!751514))

(declare-fun m!700667 () Bool)

(assert (=> b!751501 m!700667))

(declare-fun m!700669 () Bool)

(assert (=> b!751513 m!700669))

(declare-fun m!700671 () Bool)

(assert (=> b!751512 m!700671))

(assert (=> b!751512 m!700671))

(declare-fun m!700673 () Bool)

(assert (=> b!751512 m!700673))

(declare-fun m!700675 () Bool)

(assert (=> b!751497 m!700675))

(declare-fun m!700677 () Bool)

(assert (=> b!751500 m!700677))

(declare-fun m!700679 () Bool)

(assert (=> b!751500 m!700679))

(declare-fun m!700681 () Bool)

(assert (=> start!65640 m!700681))

(declare-fun m!700683 () Bool)

(assert (=> start!65640 m!700683))

(assert (=> b!751499 m!700671))

(assert (=> b!751499 m!700671))

(declare-fun m!700685 () Bool)

(assert (=> b!751499 m!700685))

(declare-fun m!700687 () Bool)

(assert (=> b!751503 m!700687))

(declare-fun m!700689 () Bool)

(assert (=> b!751506 m!700689))

(assert (=> b!751505 m!700671))

(assert (=> b!751505 m!700671))

(declare-fun m!700691 () Bool)

(assert (=> b!751505 m!700691))

(assert (=> b!751507 m!700671))

(assert (=> b!751507 m!700671))

(declare-fun m!700693 () Bool)

(assert (=> b!751507 m!700693))

(declare-fun m!700695 () Bool)

(assert (=> b!751507 m!700695))

(declare-fun m!700697 () Bool)

(assert (=> b!751507 m!700697))

(assert (=> b!751516 m!700671))

(assert (=> b!751516 m!700671))

(declare-fun m!700699 () Bool)

(assert (=> b!751516 m!700699))

(declare-fun m!700701 () Bool)

(assert (=> b!751498 m!700701))

(assert (=> b!751498 m!700677))

(assert (=> b!751498 m!700701))

(declare-fun m!700703 () Bool)

(assert (=> b!751498 m!700703))

(declare-fun m!700705 () Bool)

(assert (=> b!751498 m!700705))

(declare-fun m!700707 () Bool)

(assert (=> b!751498 m!700707))

(assert (=> b!751517 m!700671))

(assert (=> b!751517 m!700671))

(assert (=> b!751517 m!700673))

(assert (=> b!751508 m!700671))

(assert (=> b!751508 m!700671))

(declare-fun m!700709 () Bool)

(assert (=> b!751508 m!700709))

(assert (=> b!751508 m!700709))

(assert (=> b!751508 m!700671))

(declare-fun m!700711 () Bool)

(assert (=> b!751508 m!700711))

(declare-fun m!700713 () Bool)

(assert (=> b!751514 m!700713))

(declare-fun m!700715 () Bool)

(assert (=> b!751514 m!700715))

(declare-fun m!700717 () Bool)

(assert (=> b!751504 m!700717))

(check-sat (not b!751503) (not b!751514) (not b!751513) (not start!65640) (not b!751516) (not b!751517) (not b!751507) (not b!751497) (not b!751504) (not b!751501) (not b!751508) (not b!751512) (not b!751499) (not b!751498) (not b!751505))
(check-sat)
