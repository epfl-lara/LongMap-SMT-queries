; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65538 () Bool)

(assert start!65538)

(declare-fun b!748172 () Bool)

(declare-fun e!417627 () Bool)

(declare-fun e!417631 () Bool)

(assert (=> b!748172 (= e!417627 e!417631)))

(declare-fun res!504646 () Bool)

(assert (=> b!748172 (=> (not res!504646) (not e!417631))))

(declare-datatypes ((array!41711 0))(
  ( (array!41712 (arr!19969 (Array (_ BitVec 32) (_ BitVec 64))) (size!20390 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41711)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7569 0))(
  ( (MissingZero!7569 (index!32644 (_ BitVec 32))) (Found!7569 (index!32645 (_ BitVec 32))) (Intermediate!7569 (undefined!8381 Bool) (index!32646 (_ BitVec 32)) (x!63583 (_ BitVec 32))) (Undefined!7569) (MissingVacant!7569 (index!32647 (_ BitVec 32))) )
))
(declare-fun lt!332577 () SeekEntryResult!7569)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41711 (_ BitVec 32)) SeekEntryResult!7569)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748172 (= res!504646 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19969 a!3186) j!159) mask!3328) (select (arr!19969 a!3186) j!159) a!3186 mask!3328) lt!332577))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748172 (= lt!332577 (Intermediate!7569 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748173 () Bool)

(declare-fun res!504654 () Bool)

(declare-fun e!417632 () Bool)

(assert (=> b!748173 (=> (not res!504654) (not e!417632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748173 (= res!504654 (validKeyInArray!0 (select (arr!19969 a!3186) j!159)))))

(declare-fun b!748174 () Bool)

(declare-fun res!504655 () Bool)

(declare-fun e!417629 () Bool)

(assert (=> b!748174 (=> res!504655 e!417629)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!332582 () SeekEntryResult!7569)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41711 (_ BitVec 32)) SeekEntryResult!7569)

(assert (=> b!748174 (= res!504655 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19969 a!3186) j!159) a!3186 mask!3328) lt!332582)))))

(declare-fun b!748175 () Bool)

(assert (=> b!748175 (= e!417629 true)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!748175 (= (select (store (arr!19969 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25656 0))(
  ( (Unit!25657) )
))
(declare-fun lt!332580 () Unit!25656)

(declare-fun e!417626 () Unit!25656)

(assert (=> b!748175 (= lt!332580 e!417626)))

(declare-fun c!82144 () Bool)

(assert (=> b!748175 (= c!82144 (= (select (store (arr!19969 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748176 () Bool)

(declare-fun res!504653 () Bool)

(assert (=> b!748176 (=> (not res!504653) (not e!417631))))

(declare-fun e!417628 () Bool)

(assert (=> b!748176 (= res!504653 e!417628)))

(declare-fun c!82143 () Bool)

(assert (=> b!748176 (= c!82143 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748177 () Bool)

(declare-fun e!417624 () Bool)

(assert (=> b!748177 (= e!417631 e!417624)))

(declare-fun res!504659 () Bool)

(assert (=> b!748177 (=> (not res!504659) (not e!417624))))

(declare-fun lt!332581 () SeekEntryResult!7569)

(declare-fun lt!332584 () SeekEntryResult!7569)

(assert (=> b!748177 (= res!504659 (= lt!332581 lt!332584))))

(declare-fun lt!332579 () (_ BitVec 64))

(declare-fun lt!332583 () array!41711)

(assert (=> b!748177 (= lt!332584 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332579 lt!332583 mask!3328))))

(assert (=> b!748177 (= lt!332581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332579 mask!3328) lt!332579 lt!332583 mask!3328))))

(assert (=> b!748177 (= lt!332579 (select (store (arr!19969 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748177 (= lt!332583 (array!41712 (store (arr!19969 a!3186) i!1173 k0!2102) (size!20390 a!3186)))))

(declare-fun b!748178 () Bool)

(declare-fun res!504656 () Bool)

(assert (=> b!748178 (=> (not res!504656) (not e!417632))))

(assert (=> b!748178 (= res!504656 (validKeyInArray!0 k0!2102))))

(declare-fun b!748171 () Bool)

(declare-fun res!504648 () Bool)

(assert (=> b!748171 (=> (not res!504648) (not e!417632))))

(declare-fun arrayContainsKey!0 (array!41711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748171 (= res!504648 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!504651 () Bool)

(assert (=> start!65538 (=> (not res!504651) (not e!417632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65538 (= res!504651 (validMask!0 mask!3328))))

(assert (=> start!65538 e!417632))

(assert (=> start!65538 true))

(declare-fun array_inv!15765 (array!41711) Bool)

(assert (=> start!65538 (array_inv!15765 a!3186)))

(declare-fun e!417630 () Bool)

(declare-fun b!748179 () Bool)

(assert (=> b!748179 (= e!417630 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19969 a!3186) j!159) a!3186 mask!3328) lt!332582))))

(declare-fun b!748180 () Bool)

(declare-fun res!504662 () Bool)

(assert (=> b!748180 (=> (not res!504662) (not e!417627))))

(assert (=> b!748180 (= res!504662 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20390 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20390 a!3186))))))

(declare-fun b!748181 () Bool)

(assert (=> b!748181 (= e!417632 e!417627)))

(declare-fun res!504649 () Bool)

(assert (=> b!748181 (=> (not res!504649) (not e!417627))))

(declare-fun lt!332585 () SeekEntryResult!7569)

(assert (=> b!748181 (= res!504649 (or (= lt!332585 (MissingZero!7569 i!1173)) (= lt!332585 (MissingVacant!7569 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41711 (_ BitVec 32)) SeekEntryResult!7569)

(assert (=> b!748181 (= lt!332585 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748182 () Bool)

(assert (=> b!748182 (= e!417628 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19969 a!3186) j!159) a!3186 mask!3328) lt!332577))))

(declare-fun b!748183 () Bool)

(declare-fun Unit!25658 () Unit!25656)

(assert (=> b!748183 (= e!417626 Unit!25658)))

(declare-fun b!748184 () Bool)

(declare-fun res!504652 () Bool)

(assert (=> b!748184 (=> (not res!504652) (not e!417627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41711 (_ BitVec 32)) Bool)

(assert (=> b!748184 (= res!504652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748185 () Bool)

(assert (=> b!748185 (= e!417624 (not e!417629))))

(declare-fun res!504658 () Bool)

(assert (=> b!748185 (=> res!504658 e!417629)))

(get-info :version)

(assert (=> b!748185 (= res!504658 (or (not ((_ is Intermediate!7569) lt!332584)) (bvslt x!1131 (x!63583 lt!332584)) (not (= x!1131 (x!63583 lt!332584))) (not (= index!1321 (index!32646 lt!332584)))))))

(assert (=> b!748185 e!417630))

(declare-fun res!504650 () Bool)

(assert (=> b!748185 (=> (not res!504650) (not e!417630))))

(declare-fun lt!332578 () SeekEntryResult!7569)

(assert (=> b!748185 (= res!504650 (= lt!332578 lt!332582))))

(assert (=> b!748185 (= lt!332582 (Found!7569 j!159))))

(assert (=> b!748185 (= lt!332578 (seekEntryOrOpen!0 (select (arr!19969 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748185 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332576 () Unit!25656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25656)

(assert (=> b!748185 (= lt!332576 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748186 () Bool)

(assert (=> b!748186 (= e!417628 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19969 a!3186) j!159) a!3186 mask!3328) (Found!7569 j!159)))))

(declare-fun b!748187 () Bool)

(declare-fun res!504657 () Bool)

(assert (=> b!748187 (=> (not res!504657) (not e!417631))))

(assert (=> b!748187 (= res!504657 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19969 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748188 () Bool)

(declare-fun Unit!25659 () Unit!25656)

(assert (=> b!748188 (= e!417626 Unit!25659)))

(assert (=> b!748188 false))

(declare-fun b!748189 () Bool)

(declare-fun res!504660 () Bool)

(assert (=> b!748189 (=> (not res!504660) (not e!417632))))

(assert (=> b!748189 (= res!504660 (and (= (size!20390 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20390 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20390 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748190 () Bool)

(declare-fun res!504647 () Bool)

(assert (=> b!748190 (=> (not res!504647) (not e!417627))))

(declare-datatypes ((List!13971 0))(
  ( (Nil!13968) (Cons!13967 (h!15039 (_ BitVec 64)) (t!20286 List!13971)) )
))
(declare-fun arrayNoDuplicates!0 (array!41711 (_ BitVec 32) List!13971) Bool)

(assert (=> b!748190 (= res!504647 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13968))))

(declare-fun b!748191 () Bool)

(declare-fun res!504661 () Bool)

(assert (=> b!748191 (=> res!504661 e!417629)))

(assert (=> b!748191 (= res!504661 (= (select (store (arr!19969 a!3186) i!1173 k0!2102) index!1321) lt!332579))))

(assert (= (and start!65538 res!504651) b!748189))

(assert (= (and b!748189 res!504660) b!748173))

(assert (= (and b!748173 res!504654) b!748178))

(assert (= (and b!748178 res!504656) b!748171))

(assert (= (and b!748171 res!504648) b!748181))

(assert (= (and b!748181 res!504649) b!748184))

(assert (= (and b!748184 res!504652) b!748190))

(assert (= (and b!748190 res!504647) b!748180))

(assert (= (and b!748180 res!504662) b!748172))

(assert (= (and b!748172 res!504646) b!748187))

(assert (= (and b!748187 res!504657) b!748176))

(assert (= (and b!748176 c!82143) b!748182))

(assert (= (and b!748176 (not c!82143)) b!748186))

(assert (= (and b!748176 res!504653) b!748177))

(assert (= (and b!748177 res!504659) b!748185))

(assert (= (and b!748185 res!504650) b!748179))

(assert (= (and b!748185 (not res!504658)) b!748174))

(assert (= (and b!748174 (not res!504655)) b!748191))

(assert (= (and b!748191 (not res!504661)) b!748175))

(assert (= (and b!748175 c!82144) b!748188))

(assert (= (and b!748175 (not c!82144)) b!748183))

(declare-fun m!698077 () Bool)

(assert (=> b!748172 m!698077))

(assert (=> b!748172 m!698077))

(declare-fun m!698079 () Bool)

(assert (=> b!748172 m!698079))

(assert (=> b!748172 m!698079))

(assert (=> b!748172 m!698077))

(declare-fun m!698081 () Bool)

(assert (=> b!748172 m!698081))

(declare-fun m!698083 () Bool)

(assert (=> b!748184 m!698083))

(declare-fun m!698085 () Bool)

(assert (=> b!748181 m!698085))

(assert (=> b!748185 m!698077))

(assert (=> b!748185 m!698077))

(declare-fun m!698087 () Bool)

(assert (=> b!748185 m!698087))

(declare-fun m!698089 () Bool)

(assert (=> b!748185 m!698089))

(declare-fun m!698091 () Bool)

(assert (=> b!748185 m!698091))

(assert (=> b!748179 m!698077))

(assert (=> b!748179 m!698077))

(declare-fun m!698093 () Bool)

(assert (=> b!748179 m!698093))

(declare-fun m!698095 () Bool)

(assert (=> b!748171 m!698095))

(declare-fun m!698097 () Bool)

(assert (=> b!748177 m!698097))

(declare-fun m!698099 () Bool)

(assert (=> b!748177 m!698099))

(assert (=> b!748177 m!698097))

(declare-fun m!698101 () Bool)

(assert (=> b!748177 m!698101))

(declare-fun m!698103 () Bool)

(assert (=> b!748177 m!698103))

(declare-fun m!698105 () Bool)

(assert (=> b!748177 m!698105))

(assert (=> b!748175 m!698099))

(declare-fun m!698107 () Bool)

(assert (=> b!748175 m!698107))

(assert (=> b!748186 m!698077))

(assert (=> b!748186 m!698077))

(declare-fun m!698109 () Bool)

(assert (=> b!748186 m!698109))

(declare-fun m!698111 () Bool)

(assert (=> b!748190 m!698111))

(assert (=> b!748191 m!698099))

(assert (=> b!748191 m!698107))

(assert (=> b!748173 m!698077))

(assert (=> b!748173 m!698077))

(declare-fun m!698113 () Bool)

(assert (=> b!748173 m!698113))

(assert (=> b!748174 m!698077))

(assert (=> b!748174 m!698077))

(assert (=> b!748174 m!698109))

(assert (=> b!748182 m!698077))

(assert (=> b!748182 m!698077))

(declare-fun m!698115 () Bool)

(assert (=> b!748182 m!698115))

(declare-fun m!698117 () Bool)

(assert (=> b!748187 m!698117))

(declare-fun m!698119 () Bool)

(assert (=> start!65538 m!698119))

(declare-fun m!698121 () Bool)

(assert (=> start!65538 m!698121))

(declare-fun m!698123 () Bool)

(assert (=> b!748178 m!698123))

(check-sat (not b!748185) (not b!748173) (not b!748172) (not b!748174) (not b!748181) (not b!748190) (not b!748171) (not b!748177) (not b!748179) (not b!748184) (not start!65538) (not b!748182) (not b!748178) (not b!748186))
(check-sat)
