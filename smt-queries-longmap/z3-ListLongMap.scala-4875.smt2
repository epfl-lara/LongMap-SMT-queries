; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67282 () Bool)

(assert start!67282)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42517 0))(
  ( (array!42518 (arr!20350 (Array (_ BitVec 32) (_ BitVec 64))) (size!20770 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42517)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!432482 () Bool)

(declare-fun b!777079 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7906 0))(
  ( (MissingZero!7906 (index!33992 (_ BitVec 32))) (Found!7906 (index!33993 (_ BitVec 32))) (Intermediate!7906 (undefined!8718 Bool) (index!33994 (_ BitVec 32)) (x!65092 (_ BitVec 32))) (Undefined!7906) (MissingVacant!7906 (index!33995 (_ BitVec 32))) )
))
(declare-fun lt!346196 () SeekEntryResult!7906)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42517 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!777079 (= e!432482 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20350 a!3186) j!159) a!3186 mask!3328) lt!346196))))

(declare-fun b!777080 () Bool)

(declare-fun res!525510 () Bool)

(declare-fun e!432486 () Bool)

(assert (=> b!777080 (=> (not res!525510) (not e!432486))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!777080 (= res!525510 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20770 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20770 a!3186))))))

(declare-fun b!777081 () Bool)

(declare-fun res!525516 () Bool)

(declare-fun e!432484 () Bool)

(assert (=> b!777081 (=> (not res!525516) (not e!432484))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777081 (= res!525516 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20350 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777082 () Bool)

(declare-fun e!432479 () Bool)

(assert (=> b!777082 (= e!432479 e!432486)))

(declare-fun res!525515 () Bool)

(assert (=> b!777082 (=> (not res!525515) (not e!432486))))

(declare-fun lt!346192 () SeekEntryResult!7906)

(assert (=> b!777082 (= res!525515 (or (= lt!346192 (MissingZero!7906 i!1173)) (= lt!346192 (MissingVacant!7906 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42517 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!777082 (= lt!346192 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777083 () Bool)

(declare-fun res!525517 () Bool)

(assert (=> b!777083 (=> (not res!525517) (not e!432484))))

(declare-fun e!432481 () Bool)

(assert (=> b!777083 (= res!525517 e!432481)))

(declare-fun c!86189 () Bool)

(assert (=> b!777083 (= c!86189 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777084 () Bool)

(declare-fun res!525507 () Bool)

(assert (=> b!777084 (=> (not res!525507) (not e!432479))))

(assert (=> b!777084 (= res!525507 (and (= (size!20770 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20770 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20770 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777085 () Bool)

(declare-fun e!432483 () Bool)

(assert (=> b!777085 (= e!432483 true)))

(declare-fun lt!346197 () SeekEntryResult!7906)

(assert (=> b!777085 (= lt!346197 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20350 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777086 () Bool)

(declare-fun res!525511 () Bool)

(assert (=> b!777086 (=> (not res!525511) (not e!432479))))

(declare-fun arrayContainsKey!0 (array!42517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777086 (= res!525511 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777087 () Bool)

(declare-fun res!525522 () Bool)

(assert (=> b!777087 (=> (not res!525522) (not e!432479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777087 (= res!525522 (validKeyInArray!0 (select (arr!20350 a!3186) j!159)))))

(declare-fun b!777088 () Bool)

(declare-fun res!525509 () Bool)

(assert (=> b!777088 (=> (not res!525509) (not e!432486))))

(declare-datatypes ((List!14259 0))(
  ( (Nil!14256) (Cons!14255 (h!15369 (_ BitVec 64)) (t!20566 List!14259)) )
))
(declare-fun arrayNoDuplicates!0 (array!42517 (_ BitVec 32) List!14259) Bool)

(assert (=> b!777088 (= res!525509 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14256))))

(declare-fun lt!346198 () SeekEntryResult!7906)

(declare-fun b!777089 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42517 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!777089 (= e!432481 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20350 a!3186) j!159) a!3186 mask!3328) lt!346198))))

(declare-fun b!777091 () Bool)

(declare-fun res!525514 () Bool)

(assert (=> b!777091 (=> (not res!525514) (not e!432486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42517 (_ BitVec 32)) Bool)

(assert (=> b!777091 (= res!525514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777092 () Bool)

(declare-fun e!432485 () Bool)

(assert (=> b!777092 (= e!432484 e!432485)))

(declare-fun res!525521 () Bool)

(assert (=> b!777092 (=> (not res!525521) (not e!432485))))

(declare-fun lt!346191 () SeekEntryResult!7906)

(declare-fun lt!346195 () SeekEntryResult!7906)

(assert (=> b!777092 (= res!525521 (= lt!346191 lt!346195))))

(declare-fun lt!346193 () (_ BitVec 64))

(declare-fun lt!346190 () array!42517)

(assert (=> b!777092 (= lt!346195 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346193 lt!346190 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777092 (= lt!346191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346193 mask!3328) lt!346193 lt!346190 mask!3328))))

(assert (=> b!777092 (= lt!346193 (select (store (arr!20350 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777092 (= lt!346190 (array!42518 (store (arr!20350 a!3186) i!1173 k0!2102) (size!20770 a!3186)))))

(declare-fun b!777093 () Bool)

(assert (=> b!777093 (= e!432486 e!432484)))

(declare-fun res!525520 () Bool)

(assert (=> b!777093 (=> (not res!525520) (not e!432484))))

(assert (=> b!777093 (= res!525520 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20350 a!3186) j!159) mask!3328) (select (arr!20350 a!3186) j!159) a!3186 mask!3328) lt!346198))))

(assert (=> b!777093 (= lt!346198 (Intermediate!7906 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777094 () Bool)

(assert (=> b!777094 (= e!432485 (not e!432483))))

(declare-fun res!525512 () Bool)

(assert (=> b!777094 (=> res!525512 e!432483)))

(get-info :version)

(assert (=> b!777094 (= res!525512 (or (not ((_ is Intermediate!7906) lt!346195)) (bvslt x!1131 (x!65092 lt!346195)) (not (= x!1131 (x!65092 lt!346195))) (not (= index!1321 (index!33994 lt!346195)))))))

(declare-fun e!432487 () Bool)

(assert (=> b!777094 e!432487))

(declare-fun res!525508 () Bool)

(assert (=> b!777094 (=> (not res!525508) (not e!432487))))

(assert (=> b!777094 (= res!525508 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26785 0))(
  ( (Unit!26786) )
))
(declare-fun lt!346194 () Unit!26785)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26785)

(assert (=> b!777094 (= lt!346194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777095 () Bool)

(assert (=> b!777095 (= e!432481 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20350 a!3186) j!159) a!3186 mask!3328) (Found!7906 j!159)))))

(declare-fun b!777096 () Bool)

(assert (=> b!777096 (= e!432487 e!432482)))

(declare-fun res!525513 () Bool)

(assert (=> b!777096 (=> (not res!525513) (not e!432482))))

(assert (=> b!777096 (= res!525513 (= (seekEntryOrOpen!0 (select (arr!20350 a!3186) j!159) a!3186 mask!3328) lt!346196))))

(assert (=> b!777096 (= lt!346196 (Found!7906 j!159))))

(declare-fun b!777090 () Bool)

(declare-fun res!525519 () Bool)

(assert (=> b!777090 (=> (not res!525519) (not e!432479))))

(assert (=> b!777090 (= res!525519 (validKeyInArray!0 k0!2102))))

(declare-fun res!525518 () Bool)

(assert (=> start!67282 (=> (not res!525518) (not e!432479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67282 (= res!525518 (validMask!0 mask!3328))))

(assert (=> start!67282 e!432479))

(assert (=> start!67282 true))

(declare-fun array_inv!16209 (array!42517) Bool)

(assert (=> start!67282 (array_inv!16209 a!3186)))

(assert (= (and start!67282 res!525518) b!777084))

(assert (= (and b!777084 res!525507) b!777087))

(assert (= (and b!777087 res!525522) b!777090))

(assert (= (and b!777090 res!525519) b!777086))

(assert (= (and b!777086 res!525511) b!777082))

(assert (= (and b!777082 res!525515) b!777091))

(assert (= (and b!777091 res!525514) b!777088))

(assert (= (and b!777088 res!525509) b!777080))

(assert (= (and b!777080 res!525510) b!777093))

(assert (= (and b!777093 res!525520) b!777081))

(assert (= (and b!777081 res!525516) b!777083))

(assert (= (and b!777083 c!86189) b!777089))

(assert (= (and b!777083 (not c!86189)) b!777095))

(assert (= (and b!777083 res!525517) b!777092))

(assert (= (and b!777092 res!525521) b!777094))

(assert (= (and b!777094 res!525508) b!777096))

(assert (= (and b!777096 res!525513) b!777079))

(assert (= (and b!777094 (not res!525512)) b!777085))

(declare-fun m!721577 () Bool)

(assert (=> start!67282 m!721577))

(declare-fun m!721579 () Bool)

(assert (=> start!67282 m!721579))

(declare-fun m!721581 () Bool)

(assert (=> b!777085 m!721581))

(assert (=> b!777085 m!721581))

(declare-fun m!721583 () Bool)

(assert (=> b!777085 m!721583))

(assert (=> b!777079 m!721581))

(assert (=> b!777079 m!721581))

(declare-fun m!721585 () Bool)

(assert (=> b!777079 m!721585))

(assert (=> b!777089 m!721581))

(assert (=> b!777089 m!721581))

(declare-fun m!721587 () Bool)

(assert (=> b!777089 m!721587))

(declare-fun m!721589 () Bool)

(assert (=> b!777094 m!721589))

(declare-fun m!721591 () Bool)

(assert (=> b!777094 m!721591))

(declare-fun m!721593 () Bool)

(assert (=> b!777088 m!721593))

(declare-fun m!721595 () Bool)

(assert (=> b!777082 m!721595))

(assert (=> b!777095 m!721581))

(assert (=> b!777095 m!721581))

(assert (=> b!777095 m!721583))

(declare-fun m!721597 () Bool)

(assert (=> b!777091 m!721597))

(assert (=> b!777087 m!721581))

(assert (=> b!777087 m!721581))

(declare-fun m!721599 () Bool)

(assert (=> b!777087 m!721599))

(assert (=> b!777093 m!721581))

(assert (=> b!777093 m!721581))

(declare-fun m!721601 () Bool)

(assert (=> b!777093 m!721601))

(assert (=> b!777093 m!721601))

(assert (=> b!777093 m!721581))

(declare-fun m!721603 () Bool)

(assert (=> b!777093 m!721603))

(declare-fun m!721605 () Bool)

(assert (=> b!777081 m!721605))

(declare-fun m!721607 () Bool)

(assert (=> b!777086 m!721607))

(assert (=> b!777096 m!721581))

(assert (=> b!777096 m!721581))

(declare-fun m!721609 () Bool)

(assert (=> b!777096 m!721609))

(declare-fun m!721611 () Bool)

(assert (=> b!777092 m!721611))

(declare-fun m!721613 () Bool)

(assert (=> b!777092 m!721613))

(declare-fun m!721615 () Bool)

(assert (=> b!777092 m!721615))

(declare-fun m!721617 () Bool)

(assert (=> b!777092 m!721617))

(assert (=> b!777092 m!721617))

(declare-fun m!721619 () Bool)

(assert (=> b!777092 m!721619))

(declare-fun m!721621 () Bool)

(assert (=> b!777090 m!721621))

(check-sat (not b!777088) (not b!777085) (not b!777095) (not start!67282) (not b!777093) (not b!777094) (not b!777082) (not b!777091) (not b!777092) (not b!777090) (not b!777096) (not b!777089) (not b!777087) (not b!777086) (not b!777079))
(check-sat)
