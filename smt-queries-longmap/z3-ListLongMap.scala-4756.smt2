; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65598 () Bool)

(assert start!65598)

(declare-fun b!750111 () Bool)

(declare-fun e!418534 () Bool)

(declare-fun e!418532 () Bool)

(assert (=> b!750111 (= e!418534 e!418532)))

(declare-fun res!506242 () Bool)

(assert (=> b!750111 (=> res!506242 e!418532)))

(declare-fun lt!333524 () (_ BitVec 64))

(declare-fun lt!333525 () (_ BitVec 64))

(assert (=> b!750111 (= res!506242 (= lt!333524 lt!333525))))

(declare-datatypes ((array!41771 0))(
  ( (array!41772 (arr!19999 (Array (_ BitVec 32) (_ BitVec 64))) (size!20420 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41771)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!750111 (= lt!333524 (select (store (arr!19999 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!333518 () array!41771)

(declare-fun b!750112 () Bool)

(declare-fun e!418530 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7599 0))(
  ( (MissingZero!7599 (index!32764 (_ BitVec 32))) (Found!7599 (index!32765 (_ BitVec 32))) (Intermediate!7599 (undefined!8411 Bool) (index!32766 (_ BitVec 32)) (x!63693 (_ BitVec 32))) (Undefined!7599) (MissingVacant!7599 (index!32767 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41771 (_ BitVec 32)) SeekEntryResult!7599)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41771 (_ BitVec 32)) SeekEntryResult!7599)

(assert (=> b!750112 (= e!418530 (= (seekEntryOrOpen!0 lt!333525 lt!333518 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333525 lt!333518 mask!3328)))))

(declare-fun b!750113 () Bool)

(declare-fun res!506241 () Bool)

(declare-fun e!418533 () Bool)

(assert (=> b!750113 (=> (not res!506241) (not e!418533))))

(declare-fun arrayContainsKey!0 (array!41771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750113 (= res!506241 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750114 () Bool)

(declare-fun e!418526 () Bool)

(declare-fun lt!333527 () SeekEntryResult!7599)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41771 (_ BitVec 32)) SeekEntryResult!7599)

(assert (=> b!750114 (= e!418526 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19999 a!3186) j!159) a!3186 mask!3328) lt!333527))))

(declare-fun b!750115 () Bool)

(declare-fun e!418531 () Bool)

(assert (=> b!750115 (= e!418531 (not e!418534))))

(declare-fun res!506240 () Bool)

(assert (=> b!750115 (=> res!506240 e!418534)))

(declare-fun lt!333523 () SeekEntryResult!7599)

(get-info :version)

(assert (=> b!750115 (= res!506240 (or (not ((_ is Intermediate!7599) lt!333523)) (bvslt x!1131 (x!63693 lt!333523)) (not (= x!1131 (x!63693 lt!333523))) (not (= index!1321 (index!32766 lt!333523)))))))

(declare-fun e!418535 () Bool)

(assert (=> b!750115 e!418535))

(declare-fun res!506228 () Bool)

(assert (=> b!750115 (=> (not res!506228) (not e!418535))))

(declare-fun lt!333522 () SeekEntryResult!7599)

(declare-fun lt!333517 () SeekEntryResult!7599)

(assert (=> b!750115 (= res!506228 (= lt!333522 lt!333517))))

(assert (=> b!750115 (= lt!333517 (Found!7599 j!159))))

(assert (=> b!750115 (= lt!333522 (seekEntryOrOpen!0 (select (arr!19999 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41771 (_ BitVec 32)) Bool)

(assert (=> b!750115 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25776 0))(
  ( (Unit!25777) )
))
(declare-fun lt!333521 () Unit!25776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25776)

(assert (=> b!750115 (= lt!333521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750116 () Bool)

(declare-fun e!418527 () Unit!25776)

(declare-fun Unit!25778 () Unit!25776)

(assert (=> b!750116 (= e!418527 Unit!25778)))

(declare-fun res!506232 () Bool)

(assert (=> start!65598 (=> (not res!506232) (not e!418533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65598 (= res!506232 (validMask!0 mask!3328))))

(assert (=> start!65598 e!418533))

(assert (=> start!65598 true))

(declare-fun array_inv!15795 (array!41771) Bool)

(assert (=> start!65598 (array_inv!15795 a!3186)))

(declare-fun b!750117 () Bool)

(declare-fun res!506227 () Bool)

(declare-fun e!418525 () Bool)

(assert (=> b!750117 (=> (not res!506227) (not e!418525))))

(assert (=> b!750117 (= res!506227 e!418526)))

(declare-fun c!82323 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750117 (= c!82323 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750118 () Bool)

(declare-fun res!506226 () Bool)

(assert (=> b!750118 (=> (not res!506226) (not e!418533))))

(assert (=> b!750118 (= res!506226 (and (= (size!20420 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20420 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20420 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750119 () Bool)

(declare-fun e!418528 () Bool)

(assert (=> b!750119 (= e!418533 e!418528)))

(declare-fun res!506239 () Bool)

(assert (=> b!750119 (=> (not res!506239) (not e!418528))))

(declare-fun lt!333526 () SeekEntryResult!7599)

(assert (=> b!750119 (= res!506239 (or (= lt!333526 (MissingZero!7599 i!1173)) (= lt!333526 (MissingVacant!7599 i!1173))))))

(assert (=> b!750119 (= lt!333526 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750120 () Bool)

(declare-fun res!506243 () Bool)

(assert (=> b!750120 (=> (not res!506243) (not e!418533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750120 (= res!506243 (validKeyInArray!0 (select (arr!19999 a!3186) j!159)))))

(declare-fun b!750121 () Bool)

(declare-fun res!506231 () Bool)

(assert (=> b!750121 (=> (not res!506231) (not e!418528))))

(assert (=> b!750121 (= res!506231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750122 () Bool)

(declare-fun res!506234 () Bool)

(assert (=> b!750122 (=> (not res!506234) (not e!418528))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!750122 (= res!506234 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20420 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20420 a!3186))))))

(declare-fun b!750123 () Bool)

(assert (=> b!750123 (= e!418532 true)))

(assert (=> b!750123 e!418530))

(declare-fun res!506237 () Bool)

(assert (=> b!750123 (=> (not res!506237) (not e!418530))))

(assert (=> b!750123 (= res!506237 (= lt!333524 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333519 () Unit!25776)

(assert (=> b!750123 (= lt!333519 e!418527)))

(declare-fun c!82324 () Bool)

(assert (=> b!750123 (= c!82324 (= lt!333524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750124 () Bool)

(declare-fun res!506233 () Bool)

(assert (=> b!750124 (=> (not res!506233) (not e!418528))))

(declare-datatypes ((List!14001 0))(
  ( (Nil!13998) (Cons!13997 (h!15069 (_ BitVec 64)) (t!20316 List!14001)) )
))
(declare-fun arrayNoDuplicates!0 (array!41771 (_ BitVec 32) List!14001) Bool)

(assert (=> b!750124 (= res!506233 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13998))))

(declare-fun b!750125 () Bool)

(assert (=> b!750125 (= e!418526 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19999 a!3186) j!159) a!3186 mask!3328) (Found!7599 j!159)))))

(declare-fun b!750126 () Bool)

(declare-fun res!506229 () Bool)

(assert (=> b!750126 (=> (not res!506229) (not e!418525))))

(assert (=> b!750126 (= res!506229 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19999 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750127 () Bool)

(declare-fun res!506238 () Bool)

(assert (=> b!750127 (=> (not res!506238) (not e!418533))))

(assert (=> b!750127 (= res!506238 (validKeyInArray!0 k0!2102))))

(declare-fun b!750128 () Bool)

(declare-fun Unit!25779 () Unit!25776)

(assert (=> b!750128 (= e!418527 Unit!25779)))

(assert (=> b!750128 false))

(declare-fun b!750129 () Bool)

(assert (=> b!750129 (= e!418535 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19999 a!3186) j!159) a!3186 mask!3328) lt!333517))))

(declare-fun b!750130 () Bool)

(assert (=> b!750130 (= e!418528 e!418525)))

(declare-fun res!506236 () Bool)

(assert (=> b!750130 (=> (not res!506236) (not e!418525))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750130 (= res!506236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19999 a!3186) j!159) mask!3328) (select (arr!19999 a!3186) j!159) a!3186 mask!3328) lt!333527))))

(assert (=> b!750130 (= lt!333527 (Intermediate!7599 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750131 () Bool)

(declare-fun res!506235 () Bool)

(assert (=> b!750131 (=> res!506235 e!418534)))

(assert (=> b!750131 (= res!506235 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19999 a!3186) j!159) a!3186 mask!3328) lt!333517)))))

(declare-fun b!750132 () Bool)

(assert (=> b!750132 (= e!418525 e!418531)))

(declare-fun res!506230 () Bool)

(assert (=> b!750132 (=> (not res!506230) (not e!418531))))

(declare-fun lt!333520 () SeekEntryResult!7599)

(assert (=> b!750132 (= res!506230 (= lt!333520 lt!333523))))

(assert (=> b!750132 (= lt!333523 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333525 lt!333518 mask!3328))))

(assert (=> b!750132 (= lt!333520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333525 mask!3328) lt!333525 lt!333518 mask!3328))))

(assert (=> b!750132 (= lt!333525 (select (store (arr!19999 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750132 (= lt!333518 (array!41772 (store (arr!19999 a!3186) i!1173 k0!2102) (size!20420 a!3186)))))

(assert (= (and start!65598 res!506232) b!750118))

(assert (= (and b!750118 res!506226) b!750120))

(assert (= (and b!750120 res!506243) b!750127))

(assert (= (and b!750127 res!506238) b!750113))

(assert (= (and b!750113 res!506241) b!750119))

(assert (= (and b!750119 res!506239) b!750121))

(assert (= (and b!750121 res!506231) b!750124))

(assert (= (and b!750124 res!506233) b!750122))

(assert (= (and b!750122 res!506234) b!750130))

(assert (= (and b!750130 res!506236) b!750126))

(assert (= (and b!750126 res!506229) b!750117))

(assert (= (and b!750117 c!82323) b!750114))

(assert (= (and b!750117 (not c!82323)) b!750125))

(assert (= (and b!750117 res!506227) b!750132))

(assert (= (and b!750132 res!506230) b!750115))

(assert (= (and b!750115 res!506228) b!750129))

(assert (= (and b!750115 (not res!506240)) b!750131))

(assert (= (and b!750131 (not res!506235)) b!750111))

(assert (= (and b!750111 (not res!506242)) b!750123))

(assert (= (and b!750123 c!82324) b!750128))

(assert (= (and b!750123 (not c!82324)) b!750116))

(assert (= (and b!750123 res!506237) b!750112))

(declare-fun m!699575 () Bool)

(assert (=> b!750121 m!699575))

(declare-fun m!699577 () Bool)

(assert (=> b!750129 m!699577))

(assert (=> b!750129 m!699577))

(declare-fun m!699579 () Bool)

(assert (=> b!750129 m!699579))

(assert (=> b!750125 m!699577))

(assert (=> b!750125 m!699577))

(declare-fun m!699581 () Bool)

(assert (=> b!750125 m!699581))

(declare-fun m!699583 () Bool)

(assert (=> b!750111 m!699583))

(declare-fun m!699585 () Bool)

(assert (=> b!750111 m!699585))

(declare-fun m!699587 () Bool)

(assert (=> b!750127 m!699587))

(declare-fun m!699589 () Bool)

(assert (=> b!750124 m!699589))

(declare-fun m!699591 () Bool)

(assert (=> b!750112 m!699591))

(declare-fun m!699593 () Bool)

(assert (=> b!750112 m!699593))

(assert (=> b!750114 m!699577))

(assert (=> b!750114 m!699577))

(declare-fun m!699595 () Bool)

(assert (=> b!750114 m!699595))

(declare-fun m!699597 () Bool)

(assert (=> b!750113 m!699597))

(assert (=> b!750130 m!699577))

(assert (=> b!750130 m!699577))

(declare-fun m!699599 () Bool)

(assert (=> b!750130 m!699599))

(assert (=> b!750130 m!699599))

(assert (=> b!750130 m!699577))

(declare-fun m!699601 () Bool)

(assert (=> b!750130 m!699601))

(assert (=> b!750120 m!699577))

(assert (=> b!750120 m!699577))

(declare-fun m!699603 () Bool)

(assert (=> b!750120 m!699603))

(declare-fun m!699605 () Bool)

(assert (=> start!65598 m!699605))

(declare-fun m!699607 () Bool)

(assert (=> start!65598 m!699607))

(declare-fun m!699609 () Bool)

(assert (=> b!750126 m!699609))

(assert (=> b!750115 m!699577))

(assert (=> b!750115 m!699577))

(declare-fun m!699611 () Bool)

(assert (=> b!750115 m!699611))

(declare-fun m!699613 () Bool)

(assert (=> b!750115 m!699613))

(declare-fun m!699615 () Bool)

(assert (=> b!750115 m!699615))

(assert (=> b!750131 m!699577))

(assert (=> b!750131 m!699577))

(assert (=> b!750131 m!699581))

(declare-fun m!699617 () Bool)

(assert (=> b!750132 m!699617))

(assert (=> b!750132 m!699583))

(assert (=> b!750132 m!699617))

(declare-fun m!699619 () Bool)

(assert (=> b!750132 m!699619))

(declare-fun m!699621 () Bool)

(assert (=> b!750132 m!699621))

(declare-fun m!699623 () Bool)

(assert (=> b!750132 m!699623))

(declare-fun m!699625 () Bool)

(assert (=> b!750119 m!699625))

(check-sat (not b!750120) (not b!750132) (not b!750131) (not start!65598) (not b!750125) (not b!750112) (not b!750124) (not b!750113) (not b!750114) (not b!750121) (not b!750129) (not b!750130) (not b!750127) (not b!750115) (not b!750119))
(check-sat)
