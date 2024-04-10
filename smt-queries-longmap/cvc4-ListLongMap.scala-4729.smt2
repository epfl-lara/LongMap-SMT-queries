; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65438 () Bool)

(assert start!65438)

(declare-fun b!745284 () Bool)

(declare-fun res!502190 () Bool)

(declare-fun e!416270 () Bool)

(assert (=> b!745284 (=> (not res!502190) (not e!416270))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745284 (= res!502190 (validKeyInArray!0 k!2102))))

(declare-fun b!745285 () Bool)

(declare-fun e!416272 () Bool)

(declare-fun e!416269 () Bool)

(assert (=> b!745285 (= e!416272 e!416269)))

(declare-fun res!502193 () Bool)

(assert (=> b!745285 (=> (not res!502193) (not e!416269))))

(declare-datatypes ((SeekEntryResult!7519 0))(
  ( (MissingZero!7519 (index!32444 (_ BitVec 32))) (Found!7519 (index!32445 (_ BitVec 32))) (Intermediate!7519 (undefined!8331 Bool) (index!32446 (_ BitVec 32)) (x!63397 (_ BitVec 32))) (Undefined!7519) (MissingVacant!7519 (index!32447 (_ BitVec 32))) )
))
(declare-fun lt!331099 () SeekEntryResult!7519)

(declare-fun lt!331100 () SeekEntryResult!7519)

(assert (=> b!745285 (= res!502193 (= lt!331099 lt!331100))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41611 0))(
  ( (array!41612 (arr!19919 (Array (_ BitVec 32) (_ BitVec 64))) (size!20340 (_ BitVec 32))) )
))
(declare-fun lt!331102 () array!41611)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331097 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41611 (_ BitVec 32)) SeekEntryResult!7519)

(assert (=> b!745285 (= lt!331100 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331097 lt!331102 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745285 (= lt!331099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331097 mask!3328) lt!331097 lt!331102 mask!3328))))

(declare-fun a!3186 () array!41611)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745285 (= lt!331097 (select (store (arr!19919 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745285 (= lt!331102 (array!41612 (store (arr!19919 a!3186) i!1173 k!2102) (size!20340 a!3186)))))

(declare-fun b!745286 () Bool)

(declare-fun res!502177 () Bool)

(assert (=> b!745286 (=> (not res!502177) (not e!416270))))

(assert (=> b!745286 (= res!502177 (validKeyInArray!0 (select (arr!19919 a!3186) j!159)))))

(declare-fun res!502185 () Bool)

(assert (=> start!65438 (=> (not res!502185) (not e!416270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65438 (= res!502185 (validMask!0 mask!3328))))

(assert (=> start!65438 e!416270))

(assert (=> start!65438 true))

(declare-fun array_inv!15715 (array!41611) Bool)

(assert (=> start!65438 (array_inv!15715 a!3186)))

(declare-fun b!745287 () Bool)

(declare-fun e!416268 () Bool)

(assert (=> b!745287 (= e!416269 (not e!416268))))

(declare-fun res!502180 () Bool)

(assert (=> b!745287 (=> res!502180 e!416268)))

(assert (=> b!745287 (= res!502180 (or (not (is-Intermediate!7519 lt!331100)) (bvslt x!1131 (x!63397 lt!331100)) (not (= x!1131 (x!63397 lt!331100))) (not (= index!1321 (index!32446 lt!331100)))))))

(declare-fun e!416267 () Bool)

(assert (=> b!745287 e!416267))

(declare-fun res!502192 () Bool)

(assert (=> b!745287 (=> (not res!502192) (not e!416267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41611 (_ BitVec 32)) Bool)

(assert (=> b!745287 (= res!502192 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25518 0))(
  ( (Unit!25519) )
))
(declare-fun lt!331096 () Unit!25518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25518)

(assert (=> b!745287 (= lt!331096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!745288 () Bool)

(declare-fun e!416273 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41611 (_ BitVec 32)) SeekEntryResult!7519)

(assert (=> b!745288 (= e!416273 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) (Found!7519 j!159)))))

(declare-fun b!745289 () Bool)

(declare-fun e!416266 () Bool)

(assert (=> b!745289 (= e!416270 e!416266)))

(declare-fun res!502191 () Bool)

(assert (=> b!745289 (=> (not res!502191) (not e!416266))))

(declare-fun lt!331101 () SeekEntryResult!7519)

(assert (=> b!745289 (= res!502191 (or (= lt!331101 (MissingZero!7519 i!1173)) (= lt!331101 (MissingVacant!7519 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41611 (_ BitVec 32)) SeekEntryResult!7519)

(assert (=> b!745289 (= lt!331101 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745290 () Bool)

(declare-fun res!502189 () Bool)

(assert (=> b!745290 (=> (not res!502189) (not e!416272))))

(assert (=> b!745290 (= res!502189 e!416273)))

(declare-fun c!81934 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745290 (= c!81934 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745291 () Bool)

(declare-fun e!416265 () Bool)

(declare-fun lt!331103 () SeekEntryResult!7519)

(assert (=> b!745291 (= e!416265 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) lt!331103))))

(declare-fun b!745292 () Bool)

(declare-fun res!502187 () Bool)

(assert (=> b!745292 (=> (not res!502187) (not e!416266))))

(declare-datatypes ((List!13921 0))(
  ( (Nil!13918) (Cons!13917 (h!14989 (_ BitVec 64)) (t!20236 List!13921)) )
))
(declare-fun arrayNoDuplicates!0 (array!41611 (_ BitVec 32) List!13921) Bool)

(assert (=> b!745292 (= res!502187 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13918))))

(declare-fun b!745293 () Bool)

(assert (=> b!745293 (= e!416268 (or (= (select (store (arr!19919 a!3186) i!1173 k!2102) index!1321) lt!331097) (not (= (select (store (arr!19919 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!331098 () SeekEntryResult!7519)

(declare-fun b!745294 () Bool)

(assert (=> b!745294 (= e!416273 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) lt!331098))))

(declare-fun b!745295 () Bool)

(declare-fun res!502188 () Bool)

(assert (=> b!745295 (=> (not res!502188) (not e!416266))))

(assert (=> b!745295 (= res!502188 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20340 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20340 a!3186))))))

(declare-fun b!745296 () Bool)

(assert (=> b!745296 (= e!416267 e!416265)))

(declare-fun res!502179 () Bool)

(assert (=> b!745296 (=> (not res!502179) (not e!416265))))

(assert (=> b!745296 (= res!502179 (= (seekEntryOrOpen!0 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) lt!331103))))

(assert (=> b!745296 (= lt!331103 (Found!7519 j!159))))

(declare-fun b!745297 () Bool)

(assert (=> b!745297 (= e!416266 e!416272)))

(declare-fun res!502186 () Bool)

(assert (=> b!745297 (=> (not res!502186) (not e!416272))))

(assert (=> b!745297 (= res!502186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19919 a!3186) j!159) mask!3328) (select (arr!19919 a!3186) j!159) a!3186 mask!3328) lt!331098))))

(assert (=> b!745297 (= lt!331098 (Intermediate!7519 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745298 () Bool)

(declare-fun res!502183 () Bool)

(assert (=> b!745298 (=> (not res!502183) (not e!416266))))

(assert (=> b!745298 (= res!502183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745299 () Bool)

(declare-fun res!502178 () Bool)

(assert (=> b!745299 (=> (not res!502178) (not e!416272))))

(assert (=> b!745299 (= res!502178 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19919 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745300 () Bool)

(declare-fun res!502184 () Bool)

(assert (=> b!745300 (=> (not res!502184) (not e!416270))))

(declare-fun arrayContainsKey!0 (array!41611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745300 (= res!502184 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745301 () Bool)

(declare-fun res!502181 () Bool)

(assert (=> b!745301 (=> (not res!502181) (not e!416270))))

(assert (=> b!745301 (= res!502181 (and (= (size!20340 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20340 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20340 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745302 () Bool)

(declare-fun res!502182 () Bool)

(assert (=> b!745302 (=> res!502182 e!416268)))

(assert (=> b!745302 (= res!502182 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) (Found!7519 j!159))))))

(assert (= (and start!65438 res!502185) b!745301))

(assert (= (and b!745301 res!502181) b!745286))

(assert (= (and b!745286 res!502177) b!745284))

(assert (= (and b!745284 res!502190) b!745300))

(assert (= (and b!745300 res!502184) b!745289))

(assert (= (and b!745289 res!502191) b!745298))

(assert (= (and b!745298 res!502183) b!745292))

(assert (= (and b!745292 res!502187) b!745295))

(assert (= (and b!745295 res!502188) b!745297))

(assert (= (and b!745297 res!502186) b!745299))

(assert (= (and b!745299 res!502178) b!745290))

(assert (= (and b!745290 c!81934) b!745294))

(assert (= (and b!745290 (not c!81934)) b!745288))

(assert (= (and b!745290 res!502189) b!745285))

(assert (= (and b!745285 res!502193) b!745287))

(assert (= (and b!745287 res!502192) b!745296))

(assert (= (and b!745296 res!502179) b!745291))

(assert (= (and b!745287 (not res!502180)) b!745302))

(assert (= (and b!745302 (not res!502182)) b!745293))

(declare-fun m!695683 () Bool)

(assert (=> b!745300 m!695683))

(declare-fun m!695685 () Bool)

(assert (=> b!745287 m!695685))

(declare-fun m!695687 () Bool)

(assert (=> b!745287 m!695687))

(declare-fun m!695689 () Bool)

(assert (=> b!745284 m!695689))

(declare-fun m!695691 () Bool)

(assert (=> b!745292 m!695691))

(declare-fun m!695693 () Bool)

(assert (=> b!745296 m!695693))

(assert (=> b!745296 m!695693))

(declare-fun m!695695 () Bool)

(assert (=> b!745296 m!695695))

(declare-fun m!695697 () Bool)

(assert (=> b!745285 m!695697))

(declare-fun m!695699 () Bool)

(assert (=> b!745285 m!695699))

(declare-fun m!695701 () Bool)

(assert (=> b!745285 m!695701))

(declare-fun m!695703 () Bool)

(assert (=> b!745285 m!695703))

(assert (=> b!745285 m!695701))

(declare-fun m!695705 () Bool)

(assert (=> b!745285 m!695705))

(declare-fun m!695707 () Bool)

(assert (=> b!745289 m!695707))

(assert (=> b!745302 m!695693))

(assert (=> b!745302 m!695693))

(declare-fun m!695709 () Bool)

(assert (=> b!745302 m!695709))

(assert (=> b!745286 m!695693))

(assert (=> b!745286 m!695693))

(declare-fun m!695711 () Bool)

(assert (=> b!745286 m!695711))

(declare-fun m!695713 () Bool)

(assert (=> b!745299 m!695713))

(declare-fun m!695715 () Bool)

(assert (=> b!745298 m!695715))

(assert (=> b!745291 m!695693))

(assert (=> b!745291 m!695693))

(declare-fun m!695717 () Bool)

(assert (=> b!745291 m!695717))

(assert (=> b!745297 m!695693))

(assert (=> b!745297 m!695693))

(declare-fun m!695719 () Bool)

(assert (=> b!745297 m!695719))

(assert (=> b!745297 m!695719))

(assert (=> b!745297 m!695693))

(declare-fun m!695721 () Bool)

(assert (=> b!745297 m!695721))

(assert (=> b!745294 m!695693))

(assert (=> b!745294 m!695693))

(declare-fun m!695723 () Bool)

(assert (=> b!745294 m!695723))

(declare-fun m!695725 () Bool)

(assert (=> start!65438 m!695725))

(declare-fun m!695727 () Bool)

(assert (=> start!65438 m!695727))

(assert (=> b!745293 m!695699))

(declare-fun m!695729 () Bool)

(assert (=> b!745293 m!695729))

(assert (=> b!745288 m!695693))

(assert (=> b!745288 m!695693))

(assert (=> b!745288 m!695709))

(push 1)

(assert (not b!745302))

(assert (not b!745288))

(assert (not b!745297))

(assert (not b!745285))

(assert (not b!745296))

(assert (not start!65438))

(assert (not b!745292))

(assert (not b!745287))

(assert (not b!745291))

(assert (not b!745284))

(assert (not b!745300))

(assert (not b!745294))

(assert (not b!745289))

(assert (not b!745286))

(assert (not b!745298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

