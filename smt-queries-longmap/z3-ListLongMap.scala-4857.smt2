; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67030 () Bool)

(assert start!67030)

(declare-fun b!772703 () Bool)

(declare-fun res!522491 () Bool)

(declare-fun e!430229 () Bool)

(assert (=> b!772703 (=> (not res!522491) (not e!430229))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42403 0))(
  ( (array!42404 (arr!20296 (Array (_ BitVec 32) (_ BitVec 64))) (size!20716 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42403)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!772703 (= res!522491 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20716 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20716 a!3186))))))

(declare-fun b!772704 () Bool)

(declare-fun res!522490 () Bool)

(declare-fun e!430223 () Bool)

(assert (=> b!772704 (=> (not res!522490) (not e!430223))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!772704 (= res!522490 (and (= (size!20716 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20716 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20716 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!522486 () Bool)

(assert (=> start!67030 (=> (not res!522486) (not e!430223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67030 (= res!522486 (validMask!0 mask!3328))))

(assert (=> start!67030 e!430223))

(assert (=> start!67030 true))

(declare-fun array_inv!16155 (array!42403) Bool)

(assert (=> start!67030 (array_inv!16155 a!3186)))

(declare-fun e!430225 () Bool)

(declare-datatypes ((SeekEntryResult!7852 0))(
  ( (MissingZero!7852 (index!33776 (_ BitVec 32))) (Found!7852 (index!33777 (_ BitVec 32))) (Intermediate!7852 (undefined!8664 Bool) (index!33778 (_ BitVec 32)) (x!64870 (_ BitVec 32))) (Undefined!7852) (MissingVacant!7852 (index!33779 (_ BitVec 32))) )
))
(declare-fun lt!343998 () SeekEntryResult!7852)

(declare-fun b!772705 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42403 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!772705 (= e!430225 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343998))))

(declare-fun b!772706 () Bool)

(declare-fun res!522487 () Bool)

(assert (=> b!772706 (=> (not res!522487) (not e!430223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772706 (= res!522487 (validKeyInArray!0 (select (arr!20296 a!3186) j!159)))))

(declare-fun b!772707 () Bool)

(declare-fun res!522488 () Bool)

(declare-fun e!430231 () Bool)

(assert (=> b!772707 (=> (not res!522488) (not e!430231))))

(assert (=> b!772707 (= res!522488 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20296 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772708 () Bool)

(declare-fun e!430230 () Bool)

(declare-fun e!430228 () Bool)

(assert (=> b!772708 (= e!430230 (not e!430228))))

(declare-fun res!522483 () Bool)

(assert (=> b!772708 (=> res!522483 e!430228)))

(declare-fun lt!343993 () SeekEntryResult!7852)

(get-info :version)

(assert (=> b!772708 (= res!522483 (or (not ((_ is Intermediate!7852) lt!343993)) (bvsge x!1131 (x!64870 lt!343993))))))

(declare-fun e!430226 () Bool)

(assert (=> b!772708 e!430226))

(declare-fun res!522485 () Bool)

(assert (=> b!772708 (=> (not res!522485) (not e!430226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42403 (_ BitVec 32)) Bool)

(assert (=> b!772708 (= res!522485 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26599 0))(
  ( (Unit!26600) )
))
(declare-fun lt!343989 () Unit!26599)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26599)

(assert (=> b!772708 (= lt!343989 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772709 () Bool)

(declare-fun res!522493 () Bool)

(assert (=> b!772709 (=> (not res!522493) (not e!430229))))

(assert (=> b!772709 (= res!522493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772710 () Bool)

(declare-fun res!522497 () Bool)

(assert (=> b!772710 (=> (not res!522497) (not e!430231))))

(declare-fun e!430222 () Bool)

(assert (=> b!772710 (= res!522497 e!430222)))

(declare-fun c!85510 () Bool)

(assert (=> b!772710 (= c!85510 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772711 () Bool)

(declare-fun res!522495 () Bool)

(assert (=> b!772711 (=> (not res!522495) (not e!430223))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!772711 (= res!522495 (validKeyInArray!0 k0!2102))))

(declare-fun b!772712 () Bool)

(declare-fun res!522498 () Bool)

(assert (=> b!772712 (=> (not res!522498) (not e!430223))))

(declare-fun arrayContainsKey!0 (array!42403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772712 (= res!522498 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772713 () Bool)

(assert (=> b!772713 (= e!430228 true)))

(declare-fun lt!343994 () Unit!26599)

(declare-fun e!430227 () Unit!26599)

(assert (=> b!772713 (= lt!343994 e!430227)))

(declare-fun c!85511 () Bool)

(assert (=> b!772713 (= c!85511 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343990 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772713 (= lt!343990 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!772714 () Bool)

(declare-fun Unit!26601 () Unit!26599)

(assert (=> b!772714 (= e!430227 Unit!26601)))

(declare-fun lt!343996 () SeekEntryResult!7852)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42403 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!772714 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343990 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343996)))

(declare-fun b!772715 () Bool)

(assert (=> b!772715 (= e!430231 e!430230)))

(declare-fun res!522494 () Bool)

(assert (=> b!772715 (=> (not res!522494) (not e!430230))))

(declare-fun lt!343999 () SeekEntryResult!7852)

(assert (=> b!772715 (= res!522494 (= lt!343999 lt!343993))))

(declare-fun lt!343991 () array!42403)

(declare-fun lt!343995 () (_ BitVec 64))

(assert (=> b!772715 (= lt!343993 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343995 lt!343991 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772715 (= lt!343999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343995 mask!3328) lt!343995 lt!343991 mask!3328))))

(assert (=> b!772715 (= lt!343995 (select (store (arr!20296 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772715 (= lt!343991 (array!42404 (store (arr!20296 a!3186) i!1173 k0!2102) (size!20716 a!3186)))))

(declare-fun b!772716 () Bool)

(assert (=> b!772716 (= e!430229 e!430231)))

(declare-fun res!522492 () Bool)

(assert (=> b!772716 (=> (not res!522492) (not e!430231))))

(assert (=> b!772716 (= res!522492 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328) (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343996))))

(assert (=> b!772716 (= lt!343996 (Intermediate!7852 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772717 () Bool)

(assert (=> b!772717 (= e!430223 e!430229)))

(declare-fun res!522484 () Bool)

(assert (=> b!772717 (=> (not res!522484) (not e!430229))))

(declare-fun lt!343992 () SeekEntryResult!7852)

(assert (=> b!772717 (= res!522484 (or (= lt!343992 (MissingZero!7852 i!1173)) (= lt!343992 (MissingVacant!7852 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42403 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!772717 (= lt!343992 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!772718 () Bool)

(assert (=> b!772718 (= e!430222 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343996))))

(declare-fun b!772719 () Bool)

(declare-fun res!522496 () Bool)

(assert (=> b!772719 (=> (not res!522496) (not e!430229))))

(declare-datatypes ((List!14205 0))(
  ( (Nil!14202) (Cons!14201 (h!15309 (_ BitVec 64)) (t!20512 List!14205)) )
))
(declare-fun arrayNoDuplicates!0 (array!42403 (_ BitVec 32) List!14205) Bool)

(assert (=> b!772719 (= res!522496 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14202))))

(declare-fun b!772720 () Bool)

(declare-fun Unit!26602 () Unit!26599)

(assert (=> b!772720 (= e!430227 Unit!26602)))

(declare-fun lt!343997 () SeekEntryResult!7852)

(assert (=> b!772720 (= lt!343997 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772720 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343990 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) (Found!7852 j!159))))

(declare-fun b!772721 () Bool)

(assert (=> b!772721 (= e!430226 e!430225)))

(declare-fun res!522489 () Bool)

(assert (=> b!772721 (=> (not res!522489) (not e!430225))))

(assert (=> b!772721 (= res!522489 (= (seekEntryOrOpen!0 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343998))))

(assert (=> b!772721 (= lt!343998 (Found!7852 j!159))))

(declare-fun b!772722 () Bool)

(assert (=> b!772722 (= e!430222 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) (Found!7852 j!159)))))

(assert (= (and start!67030 res!522486) b!772704))

(assert (= (and b!772704 res!522490) b!772706))

(assert (= (and b!772706 res!522487) b!772711))

(assert (= (and b!772711 res!522495) b!772712))

(assert (= (and b!772712 res!522498) b!772717))

(assert (= (and b!772717 res!522484) b!772709))

(assert (= (and b!772709 res!522493) b!772719))

(assert (= (and b!772719 res!522496) b!772703))

(assert (= (and b!772703 res!522491) b!772716))

(assert (= (and b!772716 res!522492) b!772707))

(assert (= (and b!772707 res!522488) b!772710))

(assert (= (and b!772710 c!85510) b!772718))

(assert (= (and b!772710 (not c!85510)) b!772722))

(assert (= (and b!772710 res!522497) b!772715))

(assert (= (and b!772715 res!522494) b!772708))

(assert (= (and b!772708 res!522485) b!772721))

(assert (= (and b!772721 res!522489) b!772705))

(assert (= (and b!772708 (not res!522483)) b!772713))

(assert (= (and b!772713 c!85511) b!772714))

(assert (= (and b!772713 (not c!85511)) b!772720))

(declare-fun m!718097 () Bool)

(assert (=> b!772719 m!718097))

(declare-fun m!718099 () Bool)

(assert (=> b!772722 m!718099))

(assert (=> b!772722 m!718099))

(declare-fun m!718101 () Bool)

(assert (=> b!772722 m!718101))

(declare-fun m!718103 () Bool)

(assert (=> b!772712 m!718103))

(assert (=> b!772720 m!718099))

(assert (=> b!772720 m!718099))

(assert (=> b!772720 m!718101))

(assert (=> b!772720 m!718099))

(declare-fun m!718105 () Bool)

(assert (=> b!772720 m!718105))

(declare-fun m!718107 () Bool)

(assert (=> b!772708 m!718107))

(declare-fun m!718109 () Bool)

(assert (=> b!772708 m!718109))

(assert (=> b!772721 m!718099))

(assert (=> b!772721 m!718099))

(declare-fun m!718111 () Bool)

(assert (=> b!772721 m!718111))

(declare-fun m!718113 () Bool)

(assert (=> b!772713 m!718113))

(declare-fun m!718115 () Bool)

(assert (=> b!772709 m!718115))

(declare-fun m!718117 () Bool)

(assert (=> start!67030 m!718117))

(declare-fun m!718119 () Bool)

(assert (=> start!67030 m!718119))

(declare-fun m!718121 () Bool)

(assert (=> b!772717 m!718121))

(declare-fun m!718123 () Bool)

(assert (=> b!772715 m!718123))

(declare-fun m!718125 () Bool)

(assert (=> b!772715 m!718125))

(declare-fun m!718127 () Bool)

(assert (=> b!772715 m!718127))

(declare-fun m!718129 () Bool)

(assert (=> b!772715 m!718129))

(assert (=> b!772715 m!718123))

(declare-fun m!718131 () Bool)

(assert (=> b!772715 m!718131))

(assert (=> b!772716 m!718099))

(assert (=> b!772716 m!718099))

(declare-fun m!718133 () Bool)

(assert (=> b!772716 m!718133))

(assert (=> b!772716 m!718133))

(assert (=> b!772716 m!718099))

(declare-fun m!718135 () Bool)

(assert (=> b!772716 m!718135))

(declare-fun m!718137 () Bool)

(assert (=> b!772707 m!718137))

(assert (=> b!772718 m!718099))

(assert (=> b!772718 m!718099))

(declare-fun m!718139 () Bool)

(assert (=> b!772718 m!718139))

(assert (=> b!772706 m!718099))

(assert (=> b!772706 m!718099))

(declare-fun m!718141 () Bool)

(assert (=> b!772706 m!718141))

(declare-fun m!718143 () Bool)

(assert (=> b!772711 m!718143))

(assert (=> b!772714 m!718099))

(assert (=> b!772714 m!718099))

(declare-fun m!718145 () Bool)

(assert (=> b!772714 m!718145))

(assert (=> b!772705 m!718099))

(assert (=> b!772705 m!718099))

(declare-fun m!718147 () Bool)

(assert (=> b!772705 m!718147))

(check-sat (not b!772717) (not b!772712) (not b!772721) (not b!772709) (not b!772715) (not b!772718) (not b!772706) (not b!772714) (not b!772720) (not b!772711) (not b!772708) (not b!772713) (not b!772716) (not start!67030) (not b!772705) (not b!772719) (not b!772722))
(check-sat)
