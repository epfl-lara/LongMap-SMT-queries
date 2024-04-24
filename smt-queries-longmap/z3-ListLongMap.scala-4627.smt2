; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64524 () Bool)

(assert start!64524)

(declare-fun b!725200 () Bool)

(declare-fun e!406222 () Bool)

(declare-fun e!406218 () Bool)

(assert (=> b!725200 (= e!406222 e!406218)))

(declare-fun res!486226 () Bool)

(assert (=> b!725200 (=> (not res!486226) (not e!406218))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!40975 0))(
  ( (array!40976 (arr!19606 (Array (_ BitVec 32) (_ BitVec 64))) (size!20026 (_ BitVec 32))) )
))
(declare-fun lt!321288 () array!40975)

(declare-fun lt!321285 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7162 0))(
  ( (MissingZero!7162 (index!31016 (_ BitVec 32))) (Found!7162 (index!31017 (_ BitVec 32))) (Intermediate!7162 (undefined!7974 Bool) (index!31018 (_ BitVec 32)) (x!62167 (_ BitVec 32))) (Undefined!7162) (MissingVacant!7162 (index!31019 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40975 (_ BitVec 32)) SeekEntryResult!7162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725200 (= res!486226 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321285 mask!3328) lt!321285 lt!321288 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321285 lt!321288 mask!3328)))))

(declare-fun a!3186 () array!40975)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725200 (= lt!321285 (select (store (arr!19606 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725200 (= lt!321288 (array!40976 (store (arr!19606 a!3186) i!1173 k0!2102) (size!20026 a!3186)))))

(declare-fun b!725201 () Bool)

(declare-fun res!486219 () Bool)

(assert (=> b!725201 (=> (not res!486219) (not e!406222))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725201 (= res!486219 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19606 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!321284 () SeekEntryResult!7162)

(declare-fun e!406220 () Bool)

(declare-fun b!725202 () Bool)

(assert (=> b!725202 (= e!406220 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) lt!321284))))

(declare-fun b!725203 () Bool)

(declare-fun e!406221 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40975 (_ BitVec 32)) SeekEntryResult!7162)

(assert (=> b!725203 (= e!406221 (= (seekEntryOrOpen!0 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) (Found!7162 j!159)))))

(declare-fun b!725204 () Bool)

(declare-fun res!486231 () Bool)

(declare-fun e!406223 () Bool)

(assert (=> b!725204 (=> (not res!486231) (not e!406223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725204 (= res!486231 (validKeyInArray!0 (select (arr!19606 a!3186) j!159)))))

(declare-fun b!725206 () Bool)

(declare-fun res!486225 () Bool)

(declare-fun e!406219 () Bool)

(assert (=> b!725206 (=> (not res!486225) (not e!406219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40975 (_ BitVec 32)) Bool)

(assert (=> b!725206 (= res!486225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725207 () Bool)

(declare-fun res!486227 () Bool)

(assert (=> b!725207 (=> (not res!486227) (not e!406223))))

(assert (=> b!725207 (= res!486227 (and (= (size!20026 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20026 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20026 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725208 () Bool)

(declare-fun res!486228 () Bool)

(assert (=> b!725208 (=> (not res!486228) (not e!406219))))

(declare-datatypes ((List!13515 0))(
  ( (Nil!13512) (Cons!13511 (h!14571 (_ BitVec 64)) (t!19822 List!13515)) )
))
(declare-fun arrayNoDuplicates!0 (array!40975 (_ BitVec 32) List!13515) Bool)

(assert (=> b!725208 (= res!486228 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13512))))

(declare-fun b!725209 () Bool)

(assert (=> b!725209 (= e!406219 e!406222)))

(declare-fun res!486220 () Bool)

(assert (=> b!725209 (=> (not res!486220) (not e!406222))))

(assert (=> b!725209 (= res!486220 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328) (select (arr!19606 a!3186) j!159) a!3186 mask!3328) lt!321284))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725209 (= lt!321284 (Intermediate!7162 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725210 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40975 (_ BitVec 32)) SeekEntryResult!7162)

(assert (=> b!725210 (= e!406220 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) (Found!7162 j!159)))))

(declare-fun b!725211 () Bool)

(assert (=> b!725211 (= e!406218 (not true))))

(assert (=> b!725211 e!406221))

(declare-fun res!486222 () Bool)

(assert (=> b!725211 (=> (not res!486222) (not e!406221))))

(assert (=> b!725211 (= res!486222 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24721 0))(
  ( (Unit!24722) )
))
(declare-fun lt!321287 () Unit!24721)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24721)

(assert (=> b!725211 (= lt!321287 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!486229 () Bool)

(assert (=> start!64524 (=> (not res!486229) (not e!406223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64524 (= res!486229 (validMask!0 mask!3328))))

(assert (=> start!64524 e!406223))

(assert (=> start!64524 true))

(declare-fun array_inv!15465 (array!40975) Bool)

(assert (=> start!64524 (array_inv!15465 a!3186)))

(declare-fun b!725205 () Bool)

(declare-fun res!486223 () Bool)

(assert (=> b!725205 (=> (not res!486223) (not e!406219))))

(assert (=> b!725205 (= res!486223 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20026 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20026 a!3186))))))

(declare-fun b!725212 () Bool)

(assert (=> b!725212 (= e!406223 e!406219)))

(declare-fun res!486224 () Bool)

(assert (=> b!725212 (=> (not res!486224) (not e!406219))))

(declare-fun lt!321286 () SeekEntryResult!7162)

(assert (=> b!725212 (= res!486224 (or (= lt!321286 (MissingZero!7162 i!1173)) (= lt!321286 (MissingVacant!7162 i!1173))))))

(assert (=> b!725212 (= lt!321286 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725213 () Bool)

(declare-fun res!486221 () Bool)

(assert (=> b!725213 (=> (not res!486221) (not e!406222))))

(assert (=> b!725213 (= res!486221 e!406220)))

(declare-fun c!79865 () Bool)

(assert (=> b!725213 (= c!79865 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725214 () Bool)

(declare-fun res!486232 () Bool)

(assert (=> b!725214 (=> (not res!486232) (not e!406223))))

(declare-fun arrayContainsKey!0 (array!40975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725214 (= res!486232 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725215 () Bool)

(declare-fun res!486230 () Bool)

(assert (=> b!725215 (=> (not res!486230) (not e!406223))))

(assert (=> b!725215 (= res!486230 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64524 res!486229) b!725207))

(assert (= (and b!725207 res!486227) b!725204))

(assert (= (and b!725204 res!486231) b!725215))

(assert (= (and b!725215 res!486230) b!725214))

(assert (= (and b!725214 res!486232) b!725212))

(assert (= (and b!725212 res!486224) b!725206))

(assert (= (and b!725206 res!486225) b!725208))

(assert (= (and b!725208 res!486228) b!725205))

(assert (= (and b!725205 res!486223) b!725209))

(assert (= (and b!725209 res!486220) b!725201))

(assert (= (and b!725201 res!486219) b!725213))

(assert (= (and b!725213 c!79865) b!725202))

(assert (= (and b!725213 (not c!79865)) b!725210))

(assert (= (and b!725213 res!486221) b!725200))

(assert (= (and b!725200 res!486226) b!725211))

(assert (= (and b!725211 res!486222) b!725203))

(declare-fun m!679935 () Bool)

(assert (=> start!64524 m!679935))

(declare-fun m!679937 () Bool)

(assert (=> start!64524 m!679937))

(declare-fun m!679939 () Bool)

(assert (=> b!725211 m!679939))

(declare-fun m!679941 () Bool)

(assert (=> b!725211 m!679941))

(declare-fun m!679943 () Bool)

(assert (=> b!725206 m!679943))

(declare-fun m!679945 () Bool)

(assert (=> b!725201 m!679945))

(declare-fun m!679947 () Bool)

(assert (=> b!725202 m!679947))

(assert (=> b!725202 m!679947))

(declare-fun m!679949 () Bool)

(assert (=> b!725202 m!679949))

(declare-fun m!679951 () Bool)

(assert (=> b!725212 m!679951))

(assert (=> b!725203 m!679947))

(assert (=> b!725203 m!679947))

(declare-fun m!679953 () Bool)

(assert (=> b!725203 m!679953))

(assert (=> b!725210 m!679947))

(assert (=> b!725210 m!679947))

(declare-fun m!679955 () Bool)

(assert (=> b!725210 m!679955))

(declare-fun m!679957 () Bool)

(assert (=> b!725215 m!679957))

(assert (=> b!725209 m!679947))

(assert (=> b!725209 m!679947))

(declare-fun m!679959 () Bool)

(assert (=> b!725209 m!679959))

(assert (=> b!725209 m!679959))

(assert (=> b!725209 m!679947))

(declare-fun m!679961 () Bool)

(assert (=> b!725209 m!679961))

(assert (=> b!725204 m!679947))

(assert (=> b!725204 m!679947))

(declare-fun m!679963 () Bool)

(assert (=> b!725204 m!679963))

(declare-fun m!679965 () Bool)

(assert (=> b!725214 m!679965))

(declare-fun m!679967 () Bool)

(assert (=> b!725208 m!679967))

(declare-fun m!679969 () Bool)

(assert (=> b!725200 m!679969))

(declare-fun m!679971 () Bool)

(assert (=> b!725200 m!679971))

(declare-fun m!679973 () Bool)

(assert (=> b!725200 m!679973))

(declare-fun m!679975 () Bool)

(assert (=> b!725200 m!679975))

(assert (=> b!725200 m!679969))

(declare-fun m!679977 () Bool)

(assert (=> b!725200 m!679977))

(check-sat (not b!725202) (not b!725211) (not b!725212) (not b!725206) (not b!725203) (not b!725214) (not b!725204) (not b!725210) (not b!725215) (not start!64524) (not b!725208) (not b!725200) (not b!725209))
(check-sat)
