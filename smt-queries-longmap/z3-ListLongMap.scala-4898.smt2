; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67568 () Bool)

(assert start!67568)

(declare-fun b!782203 () Bool)

(declare-fun res!529252 () Bool)

(declare-fun e!434973 () Bool)

(assert (=> b!782203 (=> (not res!529252) (not e!434973))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42671 0))(
  ( (array!42672 (arr!20425 (Array (_ BitVec 32) (_ BitVec 64))) (size!20846 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42671)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782203 (= res!529252 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20425 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782204 () Bool)

(declare-fun e!434977 () Bool)

(declare-fun e!434974 () Bool)

(assert (=> b!782204 (= e!434977 (not e!434974))))

(declare-fun res!529264 () Bool)

(assert (=> b!782204 (=> res!529264 e!434974)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8025 0))(
  ( (MissingZero!8025 (index!34468 (_ BitVec 32))) (Found!8025 (index!34469 (_ BitVec 32))) (Intermediate!8025 (undefined!8837 Bool) (index!34470 (_ BitVec 32)) (x!65420 (_ BitVec 32))) (Undefined!8025) (MissingVacant!8025 (index!34471 (_ BitVec 32))) )
))
(declare-fun lt!348597 () SeekEntryResult!8025)

(get-info :version)

(assert (=> b!782204 (= res!529264 (or (not ((_ is Intermediate!8025) lt!348597)) (bvslt x!1131 (x!65420 lt!348597)) (not (= x!1131 (x!65420 lt!348597))) (not (= index!1321 (index!34470 lt!348597)))))))

(declare-fun e!434971 () Bool)

(assert (=> b!782204 e!434971))

(declare-fun res!529261 () Bool)

(assert (=> b!782204 (=> (not res!529261) (not e!434971))))

(declare-fun lt!348592 () SeekEntryResult!8025)

(declare-fun lt!348596 () SeekEntryResult!8025)

(assert (=> b!782204 (= res!529261 (= lt!348592 lt!348596))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!782204 (= lt!348596 (Found!8025 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42671 (_ BitVec 32)) SeekEntryResult!8025)

(assert (=> b!782204 (= lt!348592 (seekEntryOrOpen!0 (select (arr!20425 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42671 (_ BitVec 32)) Bool)

(assert (=> b!782204 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26988 0))(
  ( (Unit!26989) )
))
(declare-fun lt!348594 () Unit!26988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26988)

(assert (=> b!782204 (= lt!348594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782205 () Bool)

(assert (=> b!782205 (= e!434974 true)))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782205 (= (select (store (arr!20425 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348599 () Unit!26988)

(declare-fun e!434976 () Unit!26988)

(assert (=> b!782205 (= lt!348599 e!434976)))

(declare-fun c!86884 () Bool)

(assert (=> b!782205 (= c!86884 (= (select (store (arr!20425 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782206 () Bool)

(declare-fun res!529263 () Bool)

(declare-fun e!434970 () Bool)

(assert (=> b!782206 (=> (not res!529263) (not e!434970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782206 (= res!529263 (validKeyInArray!0 k0!2102))))

(declare-fun e!434975 () Bool)

(declare-fun b!782207 () Bool)

(declare-fun lt!348590 () SeekEntryResult!8025)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42671 (_ BitVec 32)) SeekEntryResult!8025)

(assert (=> b!782207 (= e!434975 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!348590))))

(declare-fun b!782208 () Bool)

(declare-fun res!529262 () Bool)

(assert (=> b!782208 (=> (not res!529262) (not e!434970))))

(declare-fun arrayContainsKey!0 (array!42671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782208 (= res!529262 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782209 () Bool)

(declare-fun res!529250 () Bool)

(declare-fun e!434978 () Bool)

(assert (=> b!782209 (=> (not res!529250) (not e!434978))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782209 (= res!529250 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20846 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20846 a!3186))))))

(declare-fun b!782210 () Bool)

(declare-fun Unit!26990 () Unit!26988)

(assert (=> b!782210 (= e!434976 Unit!26990)))

(declare-fun res!529259 () Bool)

(assert (=> start!67568 (=> (not res!529259) (not e!434970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67568 (= res!529259 (validMask!0 mask!3328))))

(assert (=> start!67568 e!434970))

(assert (=> start!67568 true))

(declare-fun array_inv!16221 (array!42671) Bool)

(assert (=> start!67568 (array_inv!16221 a!3186)))

(declare-fun b!782211 () Bool)

(declare-fun res!529257 () Bool)

(assert (=> b!782211 (=> (not res!529257) (not e!434970))))

(assert (=> b!782211 (= res!529257 (and (= (size!20846 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20846 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20846 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782212 () Bool)

(declare-fun res!529260 () Bool)

(assert (=> b!782212 (=> (not res!529260) (not e!434978))))

(declare-datatypes ((List!14427 0))(
  ( (Nil!14424) (Cons!14423 (h!15543 (_ BitVec 64)) (t!20742 List!14427)) )
))
(declare-fun arrayNoDuplicates!0 (array!42671 (_ BitVec 32) List!14427) Bool)

(assert (=> b!782212 (= res!529260 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14424))))

(declare-fun b!782213 () Bool)

(assert (=> b!782213 (= e!434973 e!434977)))

(declare-fun res!529249 () Bool)

(assert (=> b!782213 (=> (not res!529249) (not e!434977))))

(declare-fun lt!348595 () SeekEntryResult!8025)

(assert (=> b!782213 (= res!529249 (= lt!348595 lt!348597))))

(declare-fun lt!348591 () (_ BitVec 64))

(declare-fun lt!348598 () array!42671)

(assert (=> b!782213 (= lt!348597 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348591 lt!348598 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782213 (= lt!348595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348591 mask!3328) lt!348591 lt!348598 mask!3328))))

(assert (=> b!782213 (= lt!348591 (select (store (arr!20425 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782213 (= lt!348598 (array!42672 (store (arr!20425 a!3186) i!1173 k0!2102) (size!20846 a!3186)))))

(declare-fun b!782214 () Bool)

(declare-fun res!529253 () Bool)

(assert (=> b!782214 (=> (not res!529253) (not e!434978))))

(assert (=> b!782214 (= res!529253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782215 () Bool)

(declare-fun res!529256 () Bool)

(assert (=> b!782215 (=> (not res!529256) (not e!434970))))

(assert (=> b!782215 (= res!529256 (validKeyInArray!0 (select (arr!20425 a!3186) j!159)))))

(declare-fun b!782216 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42671 (_ BitVec 32)) SeekEntryResult!8025)

(assert (=> b!782216 (= e!434975 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) (Found!8025 j!159)))))

(declare-fun b!782217 () Bool)

(assert (=> b!782217 (= e!434978 e!434973)))

(declare-fun res!529254 () Bool)

(assert (=> b!782217 (=> (not res!529254) (not e!434973))))

(assert (=> b!782217 (= res!529254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328) (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!348590))))

(assert (=> b!782217 (= lt!348590 (Intermediate!8025 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782218 () Bool)

(declare-fun res!529265 () Bool)

(assert (=> b!782218 (=> (not res!529265) (not e!434973))))

(assert (=> b!782218 (= res!529265 e!434975)))

(declare-fun c!86883 () Bool)

(assert (=> b!782218 (= c!86883 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782219 () Bool)

(declare-fun Unit!26991 () Unit!26988)

(assert (=> b!782219 (= e!434976 Unit!26991)))

(assert (=> b!782219 false))

(declare-fun b!782220 () Bool)

(declare-fun res!529251 () Bool)

(assert (=> b!782220 (=> res!529251 e!434974)))

(assert (=> b!782220 (= res!529251 (= (select (store (arr!20425 a!3186) i!1173 k0!2102) index!1321) lt!348591))))

(declare-fun b!782221 () Bool)

(assert (=> b!782221 (= e!434970 e!434978)))

(declare-fun res!529258 () Bool)

(assert (=> b!782221 (=> (not res!529258) (not e!434978))))

(declare-fun lt!348593 () SeekEntryResult!8025)

(assert (=> b!782221 (= res!529258 (or (= lt!348593 (MissingZero!8025 i!1173)) (= lt!348593 (MissingVacant!8025 i!1173))))))

(assert (=> b!782221 (= lt!348593 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782222 () Bool)

(assert (=> b!782222 (= e!434971 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!348596))))

(declare-fun b!782223 () Bool)

(declare-fun res!529255 () Bool)

(assert (=> b!782223 (=> res!529255 e!434974)))

(assert (=> b!782223 (= res!529255 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!348596)))))

(assert (= (and start!67568 res!529259) b!782211))

(assert (= (and b!782211 res!529257) b!782215))

(assert (= (and b!782215 res!529256) b!782206))

(assert (= (and b!782206 res!529263) b!782208))

(assert (= (and b!782208 res!529262) b!782221))

(assert (= (and b!782221 res!529258) b!782214))

(assert (= (and b!782214 res!529253) b!782212))

(assert (= (and b!782212 res!529260) b!782209))

(assert (= (and b!782209 res!529250) b!782217))

(assert (= (and b!782217 res!529254) b!782203))

(assert (= (and b!782203 res!529252) b!782218))

(assert (= (and b!782218 c!86883) b!782207))

(assert (= (and b!782218 (not c!86883)) b!782216))

(assert (= (and b!782218 res!529265) b!782213))

(assert (= (and b!782213 res!529249) b!782204))

(assert (= (and b!782204 res!529261) b!782222))

(assert (= (and b!782204 (not res!529264)) b!782223))

(assert (= (and b!782223 (not res!529255)) b!782220))

(assert (= (and b!782220 (not res!529251)) b!782205))

(assert (= (and b!782205 c!86884) b!782219))

(assert (= (and b!782205 (not c!86884)) b!782210))

(declare-fun m!725051 () Bool)

(assert (=> b!782204 m!725051))

(assert (=> b!782204 m!725051))

(declare-fun m!725053 () Bool)

(assert (=> b!782204 m!725053))

(declare-fun m!725055 () Bool)

(assert (=> b!782204 m!725055))

(declare-fun m!725057 () Bool)

(assert (=> b!782204 m!725057))

(declare-fun m!725059 () Bool)

(assert (=> b!782220 m!725059))

(declare-fun m!725061 () Bool)

(assert (=> b!782220 m!725061))

(assert (=> b!782215 m!725051))

(assert (=> b!782215 m!725051))

(declare-fun m!725063 () Bool)

(assert (=> b!782215 m!725063))

(assert (=> b!782205 m!725059))

(assert (=> b!782205 m!725061))

(declare-fun m!725065 () Bool)

(assert (=> b!782208 m!725065))

(assert (=> b!782207 m!725051))

(assert (=> b!782207 m!725051))

(declare-fun m!725067 () Bool)

(assert (=> b!782207 m!725067))

(declare-fun m!725069 () Bool)

(assert (=> start!67568 m!725069))

(declare-fun m!725071 () Bool)

(assert (=> start!67568 m!725071))

(declare-fun m!725073 () Bool)

(assert (=> b!782213 m!725073))

(assert (=> b!782213 m!725059))

(declare-fun m!725075 () Bool)

(assert (=> b!782213 m!725075))

(declare-fun m!725077 () Bool)

(assert (=> b!782213 m!725077))

(declare-fun m!725079 () Bool)

(assert (=> b!782213 m!725079))

(assert (=> b!782213 m!725077))

(declare-fun m!725081 () Bool)

(assert (=> b!782214 m!725081))

(declare-fun m!725083 () Bool)

(assert (=> b!782206 m!725083))

(declare-fun m!725085 () Bool)

(assert (=> b!782221 m!725085))

(assert (=> b!782223 m!725051))

(assert (=> b!782223 m!725051))

(declare-fun m!725087 () Bool)

(assert (=> b!782223 m!725087))

(declare-fun m!725089 () Bool)

(assert (=> b!782212 m!725089))

(assert (=> b!782217 m!725051))

(assert (=> b!782217 m!725051))

(declare-fun m!725091 () Bool)

(assert (=> b!782217 m!725091))

(assert (=> b!782217 m!725091))

(assert (=> b!782217 m!725051))

(declare-fun m!725093 () Bool)

(assert (=> b!782217 m!725093))

(assert (=> b!782222 m!725051))

(assert (=> b!782222 m!725051))

(declare-fun m!725095 () Bool)

(assert (=> b!782222 m!725095))

(assert (=> b!782216 m!725051))

(assert (=> b!782216 m!725051))

(assert (=> b!782216 m!725087))

(declare-fun m!725097 () Bool)

(assert (=> b!782203 m!725097))

(check-sat (not b!782213) (not b!782212) (not b!782217) (not b!782223) (not b!782208) (not b!782204) (not b!782214) (not b!782221) (not b!782222) (not b!782215) (not b!782207) (not b!782216) (not start!67568) (not b!782206))
(check-sat)
