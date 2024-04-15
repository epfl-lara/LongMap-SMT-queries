; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64286 () Bool)

(assert start!64286)

(declare-fun b!722185 () Bool)

(declare-fun res!484039 () Bool)

(declare-fun e!404774 () Bool)

(assert (=> b!722185 (=> (not res!484039) (not e!404774))))

(declare-datatypes ((array!40884 0))(
  ( (array!40885 (arr!19565 (Array (_ BitVec 32) (_ BitVec 64))) (size!19986 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40884)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!722185 (= res!484039 (and (= (size!19986 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19986 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19986 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722186 () Bool)

(declare-fun res!484041 () Bool)

(declare-fun e!404776 () Bool)

(assert (=> b!722186 (=> (not res!484041) (not e!404776))))

(declare-datatypes ((List!13606 0))(
  ( (Nil!13603) (Cons!13602 (h!14656 (_ BitVec 64)) (t!19912 List!13606)) )
))
(declare-fun arrayNoDuplicates!0 (array!40884 (_ BitVec 32) List!13606) Bool)

(assert (=> b!722186 (= res!484041 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13603))))

(declare-fun res!484047 () Bool)

(assert (=> start!64286 (=> (not res!484047) (not e!404774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64286 (= res!484047 (validMask!0 mask!3328))))

(assert (=> start!64286 e!404774))

(assert (=> start!64286 true))

(declare-fun array_inv!15448 (array!40884) Bool)

(assert (=> start!64286 (array_inv!15448 a!3186)))

(declare-fun b!722187 () Bool)

(declare-fun e!404773 () Bool)

(assert (=> b!722187 (= e!404773 false)))

(declare-fun lt!320041 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7162 0))(
  ( (MissingZero!7162 (index!31016 (_ BitVec 32))) (Found!7162 (index!31017 (_ BitVec 32))) (Intermediate!7162 (undefined!7974 Bool) (index!31018 (_ BitVec 32)) (x!62030 (_ BitVec 32))) (Undefined!7162) (MissingVacant!7162 (index!31019 (_ BitVec 32))) )
))
(declare-fun lt!320038 () SeekEntryResult!7162)

(declare-fun lt!320039 () array!40884)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40884 (_ BitVec 32)) SeekEntryResult!7162)

(assert (=> b!722187 (= lt!320038 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320041 lt!320039 mask!3328))))

(declare-fun lt!320042 () SeekEntryResult!7162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722187 (= lt!320042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320041 mask!3328) lt!320041 lt!320039 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!722187 (= lt!320041 (select (store (arr!19565 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722187 (= lt!320039 (array!40885 (store (arr!19565 a!3186) i!1173 k0!2102) (size!19986 a!3186)))))

(declare-fun b!722188 () Bool)

(declare-fun res!484043 () Bool)

(assert (=> b!722188 (=> (not res!484043) (not e!404774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722188 (= res!484043 (validKeyInArray!0 (select (arr!19565 a!3186) j!159)))))

(declare-fun b!722189 () Bool)

(declare-fun lt!320037 () SeekEntryResult!7162)

(declare-fun e!404775 () Bool)

(assert (=> b!722189 (= e!404775 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19565 a!3186) j!159) a!3186 mask!3328) lt!320037))))

(declare-fun b!722190 () Bool)

(declare-fun res!484044 () Bool)

(assert (=> b!722190 (=> (not res!484044) (not e!404776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40884 (_ BitVec 32)) Bool)

(assert (=> b!722190 (= res!484044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722191 () Bool)

(declare-fun res!484040 () Bool)

(assert (=> b!722191 (=> (not res!484040) (not e!404773))))

(assert (=> b!722191 (= res!484040 e!404775)))

(declare-fun c!79446 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722191 (= c!79446 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!722192 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40884 (_ BitVec 32)) SeekEntryResult!7162)

(assert (=> b!722192 (= e!404775 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19565 a!3186) j!159) a!3186 mask!3328) (Found!7162 j!159)))))

(declare-fun b!722193 () Bool)

(assert (=> b!722193 (= e!404776 e!404773)))

(declare-fun res!484046 () Bool)

(assert (=> b!722193 (=> (not res!484046) (not e!404773))))

(assert (=> b!722193 (= res!484046 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19565 a!3186) j!159) mask!3328) (select (arr!19565 a!3186) j!159) a!3186 mask!3328) lt!320037))))

(assert (=> b!722193 (= lt!320037 (Intermediate!7162 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722194 () Bool)

(assert (=> b!722194 (= e!404774 e!404776)))

(declare-fun res!484038 () Bool)

(assert (=> b!722194 (=> (not res!484038) (not e!404776))))

(declare-fun lt!320040 () SeekEntryResult!7162)

(assert (=> b!722194 (= res!484038 (or (= lt!320040 (MissingZero!7162 i!1173)) (= lt!320040 (MissingVacant!7162 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40884 (_ BitVec 32)) SeekEntryResult!7162)

(assert (=> b!722194 (= lt!320040 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722195 () Bool)

(declare-fun res!484037 () Bool)

(assert (=> b!722195 (=> (not res!484037) (not e!404774))))

(assert (=> b!722195 (= res!484037 (validKeyInArray!0 k0!2102))))

(declare-fun b!722196 () Bool)

(declare-fun res!484036 () Bool)

(assert (=> b!722196 (=> (not res!484036) (not e!404773))))

(assert (=> b!722196 (= res!484036 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19565 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722197 () Bool)

(declare-fun res!484045 () Bool)

(assert (=> b!722197 (=> (not res!484045) (not e!404774))))

(declare-fun arrayContainsKey!0 (array!40884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722197 (= res!484045 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722198 () Bool)

(declare-fun res!484042 () Bool)

(assert (=> b!722198 (=> (not res!484042) (not e!404776))))

(assert (=> b!722198 (= res!484042 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19986 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19986 a!3186))))))

(assert (= (and start!64286 res!484047) b!722185))

(assert (= (and b!722185 res!484039) b!722188))

(assert (= (and b!722188 res!484043) b!722195))

(assert (= (and b!722195 res!484037) b!722197))

(assert (= (and b!722197 res!484045) b!722194))

(assert (= (and b!722194 res!484038) b!722190))

(assert (= (and b!722190 res!484044) b!722186))

(assert (= (and b!722186 res!484041) b!722198))

(assert (= (and b!722198 res!484042) b!722193))

(assert (= (and b!722193 res!484046) b!722196))

(assert (= (and b!722196 res!484036) b!722191))

(assert (= (and b!722191 c!79446) b!722189))

(assert (= (and b!722191 (not c!79446)) b!722192))

(assert (= (and b!722191 res!484040) b!722187))

(declare-fun m!676205 () Bool)

(assert (=> start!64286 m!676205))

(declare-fun m!676207 () Bool)

(assert (=> start!64286 m!676207))

(declare-fun m!676209 () Bool)

(assert (=> b!722188 m!676209))

(assert (=> b!722188 m!676209))

(declare-fun m!676211 () Bool)

(assert (=> b!722188 m!676211))

(assert (=> b!722193 m!676209))

(assert (=> b!722193 m!676209))

(declare-fun m!676213 () Bool)

(assert (=> b!722193 m!676213))

(assert (=> b!722193 m!676213))

(assert (=> b!722193 m!676209))

(declare-fun m!676215 () Bool)

(assert (=> b!722193 m!676215))

(declare-fun m!676217 () Bool)

(assert (=> b!722195 m!676217))

(assert (=> b!722192 m!676209))

(assert (=> b!722192 m!676209))

(declare-fun m!676219 () Bool)

(assert (=> b!722192 m!676219))

(declare-fun m!676221 () Bool)

(assert (=> b!722196 m!676221))

(declare-fun m!676223 () Bool)

(assert (=> b!722190 m!676223))

(declare-fun m!676225 () Bool)

(assert (=> b!722186 m!676225))

(declare-fun m!676227 () Bool)

(assert (=> b!722187 m!676227))

(declare-fun m!676229 () Bool)

(assert (=> b!722187 m!676229))

(declare-fun m!676231 () Bool)

(assert (=> b!722187 m!676231))

(declare-fun m!676233 () Bool)

(assert (=> b!722187 m!676233))

(declare-fun m!676235 () Bool)

(assert (=> b!722187 m!676235))

(assert (=> b!722187 m!676233))

(assert (=> b!722189 m!676209))

(assert (=> b!722189 m!676209))

(declare-fun m!676237 () Bool)

(assert (=> b!722189 m!676237))

(declare-fun m!676239 () Bool)

(assert (=> b!722197 m!676239))

(declare-fun m!676241 () Bool)

(assert (=> b!722194 m!676241))

(check-sat (not b!722187) (not b!722186) (not b!722193) (not b!722195) (not start!64286) (not b!722192) (not b!722197) (not b!722188) (not b!722189) (not b!722190) (not b!722194))
(check-sat)
