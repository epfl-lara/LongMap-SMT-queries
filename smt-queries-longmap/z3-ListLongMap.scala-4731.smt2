; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65426 () Bool)

(assert start!65426)

(declare-fun b!745251 () Bool)

(declare-fun e!416220 () Bool)

(declare-fun e!416224 () Bool)

(assert (=> b!745251 (= e!416220 e!416224)))

(declare-fun res!502270 () Bool)

(assert (=> b!745251 (=> (not res!502270) (not e!416224))))

(declare-datatypes ((array!41616 0))(
  ( (array!41617 (arr!19922 (Array (_ BitVec 32) (_ BitVec 64))) (size!20343 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41616)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7519 0))(
  ( (MissingZero!7519 (index!32444 (_ BitVec 32))) (Found!7519 (index!32445 (_ BitVec 32))) (Intermediate!7519 (undefined!8331 Bool) (index!32446 (_ BitVec 32)) (x!63408 (_ BitVec 32))) (Undefined!7519) (MissingVacant!7519 (index!32447 (_ BitVec 32))) )
))
(declare-fun lt!330969 () SeekEntryResult!7519)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41616 (_ BitVec 32)) SeekEntryResult!7519)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745251 (= res!502270 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19922 a!3186) j!159) mask!3328) (select (arr!19922 a!3186) j!159) a!3186 mask!3328) lt!330969))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745251 (= lt!330969 (Intermediate!7519 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745252 () Bool)

(declare-fun res!502267 () Bool)

(assert (=> b!745252 (=> (not res!502267) (not e!416224))))

(declare-fun e!416219 () Bool)

(assert (=> b!745252 (= res!502267 e!416219)))

(declare-fun c!81876 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!745252 (= c!81876 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!745253 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41616 (_ BitVec 32)) SeekEntryResult!7519)

(assert (=> b!745253 (= e!416219 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19922 a!3186) j!159) a!3186 mask!3328) (Found!7519 j!159)))))

(declare-fun b!745254 () Bool)

(declare-fun e!416222 () Bool)

(assert (=> b!745254 (= e!416222 true)))

(declare-fun lt!330966 () SeekEntryResult!7519)

(assert (=> b!745254 (= lt!330966 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19922 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745255 () Bool)

(declare-fun res!502262 () Bool)

(assert (=> b!745255 (=> (not res!502262) (not e!416220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41616 (_ BitVec 32)) Bool)

(assert (=> b!745255 (= res!502262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745256 () Bool)

(declare-fun res!502265 () Bool)

(assert (=> b!745256 (=> (not res!502265) (not e!416220))))

(assert (=> b!745256 (= res!502265 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20343 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20343 a!3186))))))

(declare-fun b!745257 () Bool)

(declare-fun res!502260 () Bool)

(declare-fun e!416226 () Bool)

(assert (=> b!745257 (=> (not res!502260) (not e!416226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745257 (= res!502260 (validKeyInArray!0 (select (arr!19922 a!3186) j!159)))))

(declare-fun b!745258 () Bool)

(declare-fun res!502263 () Bool)

(assert (=> b!745258 (=> (not res!502263) (not e!416224))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745258 (= res!502263 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19922 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745259 () Bool)

(declare-fun e!416223 () Bool)

(declare-fun lt!330971 () SeekEntryResult!7519)

(assert (=> b!745259 (= e!416223 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19922 a!3186) j!159) a!3186 mask!3328) lt!330971))))

(declare-fun b!745260 () Bool)

(declare-fun res!502271 () Bool)

(assert (=> b!745260 (=> (not res!502271) (not e!416220))))

(declare-datatypes ((List!13963 0))(
  ( (Nil!13960) (Cons!13959 (h!15031 (_ BitVec 64)) (t!20269 List!13963)) )
))
(declare-fun arrayNoDuplicates!0 (array!41616 (_ BitVec 32) List!13963) Bool)

(assert (=> b!745260 (= res!502271 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13960))))

(declare-fun b!745261 () Bool)

(declare-fun e!416221 () Bool)

(assert (=> b!745261 (= e!416224 e!416221)))

(declare-fun res!502266 () Bool)

(assert (=> b!745261 (=> (not res!502266) (not e!416221))))

(declare-fun lt!330968 () SeekEntryResult!7519)

(declare-fun lt!330963 () SeekEntryResult!7519)

(assert (=> b!745261 (= res!502266 (= lt!330968 lt!330963))))

(declare-fun lt!330970 () (_ BitVec 64))

(declare-fun lt!330964 () array!41616)

(assert (=> b!745261 (= lt!330963 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330970 lt!330964 mask!3328))))

(assert (=> b!745261 (= lt!330968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330970 mask!3328) lt!330970 lt!330964 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!745261 (= lt!330970 (select (store (arr!19922 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745261 (= lt!330964 (array!41617 (store (arr!19922 a!3186) i!1173 k0!2102) (size!20343 a!3186)))))

(declare-fun b!745262 () Bool)

(assert (=> b!745262 (= e!416219 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19922 a!3186) j!159) a!3186 mask!3328) lt!330969))))

(declare-fun res!502275 () Bool)

(assert (=> start!65426 (=> (not res!502275) (not e!416226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65426 (= res!502275 (validMask!0 mask!3328))))

(assert (=> start!65426 e!416226))

(assert (=> start!65426 true))

(declare-fun array_inv!15805 (array!41616) Bool)

(assert (=> start!65426 (array_inv!15805 a!3186)))

(declare-fun b!745263 () Bool)

(declare-fun res!502264 () Bool)

(assert (=> b!745263 (=> (not res!502264) (not e!416226))))

(declare-fun arrayContainsKey!0 (array!41616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745263 (= res!502264 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745264 () Bool)

(declare-fun res!502268 () Bool)

(assert (=> b!745264 (=> (not res!502268) (not e!416226))))

(assert (=> b!745264 (= res!502268 (and (= (size!20343 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20343 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20343 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745265 () Bool)

(assert (=> b!745265 (= e!416226 e!416220)))

(declare-fun res!502274 () Bool)

(assert (=> b!745265 (=> (not res!502274) (not e!416220))))

(declare-fun lt!330965 () SeekEntryResult!7519)

(assert (=> b!745265 (= res!502274 (or (= lt!330965 (MissingZero!7519 i!1173)) (= lt!330965 (MissingVacant!7519 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41616 (_ BitVec 32)) SeekEntryResult!7519)

(assert (=> b!745265 (= lt!330965 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745266 () Bool)

(declare-fun res!502272 () Bool)

(assert (=> b!745266 (=> (not res!502272) (not e!416226))))

(assert (=> b!745266 (= res!502272 (validKeyInArray!0 k0!2102))))

(declare-fun b!745267 () Bool)

(declare-fun e!416225 () Bool)

(assert (=> b!745267 (= e!416225 e!416223)))

(declare-fun res!502273 () Bool)

(assert (=> b!745267 (=> (not res!502273) (not e!416223))))

(assert (=> b!745267 (= res!502273 (= (seekEntryOrOpen!0 (select (arr!19922 a!3186) j!159) a!3186 mask!3328) lt!330971))))

(assert (=> b!745267 (= lt!330971 (Found!7519 j!159))))

(declare-fun b!745268 () Bool)

(assert (=> b!745268 (= e!416221 (not e!416222))))

(declare-fun res!502261 () Bool)

(assert (=> b!745268 (=> res!502261 e!416222)))

(get-info :version)

(assert (=> b!745268 (= res!502261 (or (not ((_ is Intermediate!7519) lt!330963)) (bvslt x!1131 (x!63408 lt!330963)) (not (= x!1131 (x!63408 lt!330963))) (not (= index!1321 (index!32446 lt!330963)))))))

(assert (=> b!745268 e!416225))

(declare-fun res!502269 () Bool)

(assert (=> b!745268 (=> (not res!502269) (not e!416225))))

(assert (=> b!745268 (= res!502269 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25490 0))(
  ( (Unit!25491) )
))
(declare-fun lt!330967 () Unit!25490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25490)

(assert (=> b!745268 (= lt!330967 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65426 res!502275) b!745264))

(assert (= (and b!745264 res!502268) b!745257))

(assert (= (and b!745257 res!502260) b!745266))

(assert (= (and b!745266 res!502272) b!745263))

(assert (= (and b!745263 res!502264) b!745265))

(assert (= (and b!745265 res!502274) b!745255))

(assert (= (and b!745255 res!502262) b!745260))

(assert (= (and b!745260 res!502271) b!745256))

(assert (= (and b!745256 res!502265) b!745251))

(assert (= (and b!745251 res!502270) b!745258))

(assert (= (and b!745258 res!502263) b!745252))

(assert (= (and b!745252 c!81876) b!745262))

(assert (= (and b!745252 (not c!81876)) b!745253))

(assert (= (and b!745252 res!502267) b!745261))

(assert (= (and b!745261 res!502266) b!745268))

(assert (= (and b!745268 res!502269) b!745267))

(assert (= (and b!745267 res!502273) b!745259))

(assert (= (and b!745268 (not res!502261)) b!745254))

(declare-fun m!695111 () Bool)

(assert (=> b!745255 m!695111))

(declare-fun m!695113 () Bool)

(assert (=> b!745262 m!695113))

(assert (=> b!745262 m!695113))

(declare-fun m!695115 () Bool)

(assert (=> b!745262 m!695115))

(assert (=> b!745267 m!695113))

(assert (=> b!745267 m!695113))

(declare-fun m!695117 () Bool)

(assert (=> b!745267 m!695117))

(assert (=> b!745254 m!695113))

(assert (=> b!745254 m!695113))

(declare-fun m!695119 () Bool)

(assert (=> b!745254 m!695119))

(declare-fun m!695121 () Bool)

(assert (=> b!745260 m!695121))

(assert (=> b!745259 m!695113))

(assert (=> b!745259 m!695113))

(declare-fun m!695123 () Bool)

(assert (=> b!745259 m!695123))

(declare-fun m!695125 () Bool)

(assert (=> b!745266 m!695125))

(assert (=> b!745251 m!695113))

(assert (=> b!745251 m!695113))

(declare-fun m!695127 () Bool)

(assert (=> b!745251 m!695127))

(assert (=> b!745251 m!695127))

(assert (=> b!745251 m!695113))

(declare-fun m!695129 () Bool)

(assert (=> b!745251 m!695129))

(declare-fun m!695131 () Bool)

(assert (=> start!65426 m!695131))

(declare-fun m!695133 () Bool)

(assert (=> start!65426 m!695133))

(assert (=> b!745257 m!695113))

(assert (=> b!745257 m!695113))

(declare-fun m!695135 () Bool)

(assert (=> b!745257 m!695135))

(declare-fun m!695137 () Bool)

(assert (=> b!745263 m!695137))

(declare-fun m!695139 () Bool)

(assert (=> b!745258 m!695139))

(declare-fun m!695141 () Bool)

(assert (=> b!745261 m!695141))

(declare-fun m!695143 () Bool)

(assert (=> b!745261 m!695143))

(declare-fun m!695145 () Bool)

(assert (=> b!745261 m!695145))

(declare-fun m!695147 () Bool)

(assert (=> b!745261 m!695147))

(declare-fun m!695149 () Bool)

(assert (=> b!745261 m!695149))

(assert (=> b!745261 m!695145))

(declare-fun m!695151 () Bool)

(assert (=> b!745268 m!695151))

(declare-fun m!695153 () Bool)

(assert (=> b!745268 m!695153))

(declare-fun m!695155 () Bool)

(assert (=> b!745265 m!695155))

(assert (=> b!745253 m!695113))

(assert (=> b!745253 m!695113))

(assert (=> b!745253 m!695119))

(check-sat (not b!745255) (not b!745260) (not b!745257) (not b!745259) (not b!745263) (not b!745265) (not b!745266) (not b!745261) (not b!745262) (not b!745268) (not b!745254) (not start!65426) (not b!745253) (not b!745267) (not b!745251))
(check-sat)
