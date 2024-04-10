; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65208 () Bool)

(assert start!65208)

(declare-fun b!738268 () Bool)

(declare-fun e!412891 () Bool)

(declare-fun e!412898 () Bool)

(assert (=> b!738268 (= e!412891 e!412898)))

(declare-fun res!496302 () Bool)

(assert (=> b!738268 (=> (not res!496302) (not e!412898))))

(declare-datatypes ((array!41381 0))(
  ( (array!41382 (arr!19804 (Array (_ BitVec 32) (_ BitVec 64))) (size!20225 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41381)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7404 0))(
  ( (MissingZero!7404 (index!31984 (_ BitVec 32))) (Found!7404 (index!31985 (_ BitVec 32))) (Intermediate!7404 (undefined!8216 Bool) (index!31986 (_ BitVec 32)) (x!62978 (_ BitVec 32))) (Undefined!7404) (MissingVacant!7404 (index!31987 (_ BitVec 32))) )
))
(declare-fun lt!327665 () SeekEntryResult!7404)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41381 (_ BitVec 32)) SeekEntryResult!7404)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738268 (= res!496302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19804 a!3186) j!159) mask!3328) (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!327665))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738268 (= lt!327665 (Intermediate!7404 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738269 () Bool)

(declare-fun res!496307 () Bool)

(declare-fun e!412894 () Bool)

(assert (=> b!738269 (=> (not res!496307) (not e!412894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738269 (= res!496307 (validKeyInArray!0 (select (arr!19804 a!3186) j!159)))))

(declare-fun b!738270 () Bool)

(declare-fun e!412892 () Bool)

(declare-fun e!412897 () Bool)

(assert (=> b!738270 (= e!412892 e!412897)))

(declare-fun res!496314 () Bool)

(assert (=> b!738270 (=> res!496314 e!412897)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327668 () (_ BitVec 32))

(assert (=> b!738270 (= res!496314 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327668 #b00000000000000000000000000000000) (bvsge lt!327668 (size!20225 a!3186))))))

(declare-datatypes ((Unit!25212 0))(
  ( (Unit!25213) )
))
(declare-fun lt!327676 () Unit!25212)

(declare-fun e!412890 () Unit!25212)

(assert (=> b!738270 (= lt!327676 e!412890)))

(declare-fun c!81367 () Bool)

(declare-fun lt!327677 () Bool)

(assert (=> b!738270 (= c!81367 lt!327677)))

(assert (=> b!738270 (= lt!327677 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738270 (= lt!327668 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738271 () Bool)

(declare-fun e!412889 () Bool)

(assert (=> b!738271 (= e!412898 e!412889)))

(declare-fun res!496316 () Bool)

(assert (=> b!738271 (=> (not res!496316) (not e!412889))))

(declare-fun lt!327671 () SeekEntryResult!7404)

(declare-fun lt!327667 () SeekEntryResult!7404)

(assert (=> b!738271 (= res!496316 (= lt!327671 lt!327667))))

(declare-fun lt!327669 () array!41381)

(declare-fun lt!327670 () (_ BitVec 64))

(assert (=> b!738271 (= lt!327667 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327670 lt!327669 mask!3328))))

(assert (=> b!738271 (= lt!327671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327670 mask!3328) lt!327670 lt!327669 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!738271 (= lt!327670 (select (store (arr!19804 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738271 (= lt!327669 (array!41382 (store (arr!19804 a!3186) i!1173 k0!2102) (size!20225 a!3186)))))

(declare-fun b!738272 () Bool)

(declare-fun e!412888 () Bool)

(assert (=> b!738272 (= e!412888 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!327665))))

(declare-fun b!738273 () Bool)

(declare-fun res!496312 () Bool)

(assert (=> b!738273 (=> (not res!496312) (not e!412894))))

(declare-fun arrayContainsKey!0 (array!41381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738273 (= res!496312 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738274 () Bool)

(declare-fun e!412896 () Bool)

(declare-fun e!412893 () Bool)

(assert (=> b!738274 (= e!412896 e!412893)))

(declare-fun res!496308 () Bool)

(assert (=> b!738274 (=> (not res!496308) (not e!412893))))

(declare-fun lt!327672 () SeekEntryResult!7404)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41381 (_ BitVec 32)) SeekEntryResult!7404)

(assert (=> b!738274 (= res!496308 (= (seekEntryOrOpen!0 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!327672))))

(assert (=> b!738274 (= lt!327672 (Found!7404 j!159))))

(declare-fun b!738275 () Bool)

(declare-fun res!496310 () Bool)

(assert (=> b!738275 (=> (not res!496310) (not e!412894))))

(assert (=> b!738275 (= res!496310 (validKeyInArray!0 k0!2102))))

(declare-fun b!738276 () Bool)

(declare-fun res!496315 () Bool)

(assert (=> b!738276 (=> (not res!496315) (not e!412894))))

(assert (=> b!738276 (= res!496315 (and (= (size!20225 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20225 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20225 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738277 () Bool)

(assert (=> b!738277 (= e!412894 e!412891)))

(declare-fun res!496305 () Bool)

(assert (=> b!738277 (=> (not res!496305) (not e!412891))))

(declare-fun lt!327673 () SeekEntryResult!7404)

(assert (=> b!738277 (= res!496305 (or (= lt!327673 (MissingZero!7404 i!1173)) (= lt!327673 (MissingVacant!7404 i!1173))))))

(assert (=> b!738277 (= lt!327673 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738278 () Bool)

(assert (=> b!738278 (= e!412889 (not e!412892))))

(declare-fun res!496303 () Bool)

(assert (=> b!738278 (=> res!496303 e!412892)))

(get-info :version)

(assert (=> b!738278 (= res!496303 (or (not ((_ is Intermediate!7404) lt!327667)) (bvsge x!1131 (x!62978 lt!327667))))))

(declare-fun lt!327666 () SeekEntryResult!7404)

(assert (=> b!738278 (= lt!327666 (Found!7404 j!159))))

(assert (=> b!738278 e!412896))

(declare-fun res!496301 () Bool)

(assert (=> b!738278 (=> (not res!496301) (not e!412896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41381 (_ BitVec 32)) Bool)

(assert (=> b!738278 (= res!496301 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327674 () Unit!25212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25212)

(assert (=> b!738278 (= lt!327674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738279 () Bool)

(declare-fun e!412887 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41381 (_ BitVec 32)) SeekEntryResult!7404)

(assert (=> b!738279 (= e!412887 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327668 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!327666)))))

(declare-fun b!738280 () Bool)

(declare-fun Unit!25214 () Unit!25212)

(assert (=> b!738280 (= e!412890 Unit!25214)))

(assert (=> b!738280 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327668 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!327665)))

(declare-fun b!738281 () Bool)

(declare-fun res!496311 () Bool)

(assert (=> b!738281 (=> (not res!496311) (not e!412891))))

(assert (=> b!738281 (= res!496311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738282 () Bool)

(assert (=> b!738282 (= e!412888 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) (Found!7404 j!159)))))

(declare-fun b!738283 () Bool)

(declare-fun res!496304 () Bool)

(assert (=> b!738283 (=> (not res!496304) (not e!412891))))

(declare-datatypes ((List!13806 0))(
  ( (Nil!13803) (Cons!13802 (h!14874 (_ BitVec 64)) (t!20121 List!13806)) )
))
(declare-fun arrayNoDuplicates!0 (array!41381 (_ BitVec 32) List!13806) Bool)

(assert (=> b!738283 (= res!496304 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13803))))

(declare-fun b!738284 () Bool)

(assert (=> b!738284 (= e!412897 true)))

(declare-fun lt!327664 () SeekEntryResult!7404)

(assert (=> b!738284 (= lt!327664 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327668 lt!327670 lt!327669 mask!3328))))

(declare-fun b!738285 () Bool)

(declare-fun res!496306 () Bool)

(assert (=> b!738285 (=> res!496306 e!412897)))

(assert (=> b!738285 (= res!496306 e!412887)))

(declare-fun c!81366 () Bool)

(assert (=> b!738285 (= c!81366 lt!327677)))

(declare-fun b!738286 () Bool)

(declare-fun res!496299 () Bool)

(assert (=> b!738286 (=> (not res!496299) (not e!412891))))

(assert (=> b!738286 (= res!496299 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20225 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20225 a!3186))))))

(declare-fun res!496313 () Bool)

(assert (=> start!65208 (=> (not res!496313) (not e!412894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65208 (= res!496313 (validMask!0 mask!3328))))

(assert (=> start!65208 e!412894))

(assert (=> start!65208 true))

(declare-fun array_inv!15600 (array!41381) Bool)

(assert (=> start!65208 (array_inv!15600 a!3186)))

(declare-fun b!738287 () Bool)

(declare-fun res!496309 () Bool)

(assert (=> b!738287 (=> (not res!496309) (not e!412898))))

(assert (=> b!738287 (= res!496309 e!412888)))

(declare-fun c!81365 () Bool)

(assert (=> b!738287 (= c!81365 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738288 () Bool)

(assert (=> b!738288 (= e!412893 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!327672))))

(declare-fun b!738289 () Bool)

(declare-fun Unit!25215 () Unit!25212)

(assert (=> b!738289 (= e!412890 Unit!25215)))

(declare-fun lt!327675 () SeekEntryResult!7404)

(assert (=> b!738289 (= lt!327675 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738289 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327668 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!327666)))

(declare-fun b!738290 () Bool)

(declare-fun res!496300 () Bool)

(assert (=> b!738290 (=> (not res!496300) (not e!412898))))

(assert (=> b!738290 (= res!496300 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19804 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738291 () Bool)

(assert (=> b!738291 (= e!412887 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327668 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!327665)))))

(assert (= (and start!65208 res!496313) b!738276))

(assert (= (and b!738276 res!496315) b!738269))

(assert (= (and b!738269 res!496307) b!738275))

(assert (= (and b!738275 res!496310) b!738273))

(assert (= (and b!738273 res!496312) b!738277))

(assert (= (and b!738277 res!496305) b!738281))

(assert (= (and b!738281 res!496311) b!738283))

(assert (= (and b!738283 res!496304) b!738286))

(assert (= (and b!738286 res!496299) b!738268))

(assert (= (and b!738268 res!496302) b!738290))

(assert (= (and b!738290 res!496300) b!738287))

(assert (= (and b!738287 c!81365) b!738272))

(assert (= (and b!738287 (not c!81365)) b!738282))

(assert (= (and b!738287 res!496309) b!738271))

(assert (= (and b!738271 res!496316) b!738278))

(assert (= (and b!738278 res!496301) b!738274))

(assert (= (and b!738274 res!496308) b!738288))

(assert (= (and b!738278 (not res!496303)) b!738270))

(assert (= (and b!738270 c!81367) b!738280))

(assert (= (and b!738270 (not c!81367)) b!738289))

(assert (= (and b!738270 (not res!496314)) b!738285))

(assert (= (and b!738285 c!81366) b!738291))

(assert (= (and b!738285 (not c!81366)) b!738279))

(assert (= (and b!738285 (not res!496306)) b!738284))

(declare-fun m!689941 () Bool)

(assert (=> b!738288 m!689941))

(assert (=> b!738288 m!689941))

(declare-fun m!689943 () Bool)

(assert (=> b!738288 m!689943))

(assert (=> b!738272 m!689941))

(assert (=> b!738272 m!689941))

(declare-fun m!689945 () Bool)

(assert (=> b!738272 m!689945))

(assert (=> b!738282 m!689941))

(assert (=> b!738282 m!689941))

(declare-fun m!689947 () Bool)

(assert (=> b!738282 m!689947))

(assert (=> b!738269 m!689941))

(assert (=> b!738269 m!689941))

(declare-fun m!689949 () Bool)

(assert (=> b!738269 m!689949))

(assert (=> b!738291 m!689941))

(assert (=> b!738291 m!689941))

(declare-fun m!689951 () Bool)

(assert (=> b!738291 m!689951))

(assert (=> b!738279 m!689941))

(assert (=> b!738279 m!689941))

(declare-fun m!689953 () Bool)

(assert (=> b!738279 m!689953))

(assert (=> b!738280 m!689941))

(assert (=> b!738280 m!689941))

(assert (=> b!738280 m!689951))

(declare-fun m!689955 () Bool)

(assert (=> b!738283 m!689955))

(assert (=> b!738268 m!689941))

(assert (=> b!738268 m!689941))

(declare-fun m!689957 () Bool)

(assert (=> b!738268 m!689957))

(assert (=> b!738268 m!689957))

(assert (=> b!738268 m!689941))

(declare-fun m!689959 () Bool)

(assert (=> b!738268 m!689959))

(assert (=> b!738289 m!689941))

(assert (=> b!738289 m!689941))

(assert (=> b!738289 m!689947))

(assert (=> b!738289 m!689941))

(assert (=> b!738289 m!689953))

(declare-fun m!689961 () Bool)

(assert (=> start!65208 m!689961))

(declare-fun m!689963 () Bool)

(assert (=> start!65208 m!689963))

(declare-fun m!689965 () Bool)

(assert (=> b!738277 m!689965))

(declare-fun m!689967 () Bool)

(assert (=> b!738284 m!689967))

(declare-fun m!689969 () Bool)

(assert (=> b!738290 m!689969))

(declare-fun m!689971 () Bool)

(assert (=> b!738281 m!689971))

(declare-fun m!689973 () Bool)

(assert (=> b!738275 m!689973))

(declare-fun m!689975 () Bool)

(assert (=> b!738278 m!689975))

(declare-fun m!689977 () Bool)

(assert (=> b!738278 m!689977))

(assert (=> b!738274 m!689941))

(assert (=> b!738274 m!689941))

(declare-fun m!689979 () Bool)

(assert (=> b!738274 m!689979))

(declare-fun m!689981 () Bool)

(assert (=> b!738271 m!689981))

(declare-fun m!689983 () Bool)

(assert (=> b!738271 m!689983))

(declare-fun m!689985 () Bool)

(assert (=> b!738271 m!689985))

(declare-fun m!689987 () Bool)

(assert (=> b!738271 m!689987))

(declare-fun m!689989 () Bool)

(assert (=> b!738271 m!689989))

(assert (=> b!738271 m!689987))

(declare-fun m!689991 () Bool)

(assert (=> b!738273 m!689991))

(declare-fun m!689993 () Bool)

(assert (=> b!738270 m!689993))

(check-sat (not b!738268) (not b!738279) (not b!738277) (not b!738269) (not b!738291) (not start!65208) (not b!738288) (not b!738278) (not b!738270) (not b!738289) (not b!738275) (not b!738284) (not b!738282) (not b!738281) (not b!738271) (not b!738272) (not b!738280) (not b!738273) (not b!738283) (not b!738274))
(check-sat)
