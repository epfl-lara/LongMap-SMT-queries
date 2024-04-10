; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65366 () Bool)

(assert start!65366)

(declare-datatypes ((array!41539 0))(
  ( (array!41540 (arr!19883 (Array (_ BitVec 32) (_ BitVec 64))) (size!20304 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41539)

(declare-fun e!415299 () Bool)

(declare-fun b!743248 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7483 0))(
  ( (MissingZero!7483 (index!32300 (_ BitVec 32))) (Found!7483 (index!32301 (_ BitVec 32))) (Intermediate!7483 (undefined!8295 Bool) (index!32302 (_ BitVec 32)) (x!63265 (_ BitVec 32))) (Undefined!7483) (MissingVacant!7483 (index!32303 (_ BitVec 32))) )
))
(declare-fun lt!330169 () SeekEntryResult!7483)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41539 (_ BitVec 32)) SeekEntryResult!7483)

(assert (=> b!743248 (= e!415299 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) lt!330169))))

(declare-fun b!743249 () Bool)

(declare-fun res!500364 () Bool)

(declare-fun e!415301 () Bool)

(assert (=> b!743249 (=> (not res!500364) (not e!415301))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743249 (= res!500364 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19883 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743250 () Bool)

(declare-fun res!500367 () Bool)

(declare-fun e!415300 () Bool)

(assert (=> b!743250 (=> (not res!500367) (not e!415300))))

(assert (=> b!743250 (= res!500367 (and (= (size!20304 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20304 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20304 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743252 () Bool)

(declare-fun e!415297 () Bool)

(declare-fun e!415298 () Bool)

(assert (=> b!743252 (= e!415297 (not e!415298))))

(declare-fun res!500372 () Bool)

(assert (=> b!743252 (=> res!500372 e!415298)))

(declare-fun lt!330170 () SeekEntryResult!7483)

(assert (=> b!743252 (= res!500372 (or (not (is-Intermediate!7483 lt!330170)) (bvslt x!1131 (x!63265 lt!330170)) (not (= x!1131 (x!63265 lt!330170))) (not (= index!1321 (index!32302 lt!330170)))))))

(declare-fun e!415294 () Bool)

(assert (=> b!743252 e!415294))

(declare-fun res!500363 () Bool)

(assert (=> b!743252 (=> (not res!500363) (not e!415294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41539 (_ BitVec 32)) Bool)

(assert (=> b!743252 (= res!500363 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25446 0))(
  ( (Unit!25447) )
))
(declare-fun lt!330171 () Unit!25446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25446)

(assert (=> b!743252 (= lt!330171 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743253 () Bool)

(declare-fun lt!330174 () SeekEntryResult!7483)

(declare-fun e!415293 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41539 (_ BitVec 32)) SeekEntryResult!7483)

(assert (=> b!743253 (= e!415293 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) lt!330174))))

(declare-fun b!743254 () Bool)

(declare-fun res!500358 () Bool)

(assert (=> b!743254 (=> (not res!500358) (not e!415300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743254 (= res!500358 (validKeyInArray!0 (select (arr!19883 a!3186) j!159)))))

(declare-fun b!743255 () Bool)

(declare-fun res!500374 () Bool)

(declare-fun e!415296 () Bool)

(assert (=> b!743255 (=> (not res!500374) (not e!415296))))

(assert (=> b!743255 (= res!500374 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20304 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20304 a!3186))))))

(declare-fun b!743256 () Bool)

(declare-fun res!500375 () Bool)

(assert (=> b!743256 (=> res!500375 e!415298)))

(assert (=> b!743256 (= res!500375 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) (Found!7483 j!159))))))

(declare-fun b!743257 () Bool)

(assert (=> b!743257 (= e!415298 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!743258 () Bool)

(assert (=> b!743258 (= e!415300 e!415296)))

(declare-fun res!500370 () Bool)

(assert (=> b!743258 (=> (not res!500370) (not e!415296))))

(declare-fun lt!330173 () SeekEntryResult!7483)

(assert (=> b!743258 (= res!500370 (or (= lt!330173 (MissingZero!7483 i!1173)) (= lt!330173 (MissingVacant!7483 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41539 (_ BitVec 32)) SeekEntryResult!7483)

(assert (=> b!743258 (= lt!330173 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743259 () Bool)

(assert (=> b!743259 (= e!415294 e!415293)))

(declare-fun res!500373 () Bool)

(assert (=> b!743259 (=> (not res!500373) (not e!415293))))

(assert (=> b!743259 (= res!500373 (= (seekEntryOrOpen!0 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) lt!330174))))

(assert (=> b!743259 (= lt!330174 (Found!7483 j!159))))

(declare-fun b!743260 () Bool)

(declare-fun res!500359 () Bool)

(assert (=> b!743260 (=> (not res!500359) (not e!415300))))

(assert (=> b!743260 (= res!500359 (validKeyInArray!0 k!2102))))

(declare-fun res!500369 () Bool)

(assert (=> start!65366 (=> (not res!500369) (not e!415300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65366 (= res!500369 (validMask!0 mask!3328))))

(assert (=> start!65366 e!415300))

(assert (=> start!65366 true))

(declare-fun array_inv!15679 (array!41539) Bool)

(assert (=> start!65366 (array_inv!15679 a!3186)))

(declare-fun b!743251 () Bool)

(assert (=> b!743251 (= e!415299 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) (Found!7483 j!159)))))

(declare-fun b!743261 () Bool)

(declare-fun res!500360 () Bool)

(assert (=> b!743261 (=> res!500360 e!415298)))

(declare-fun lt!330176 () (_ BitVec 64))

(assert (=> b!743261 (= res!500360 (or (not (= (select (store (arr!19883 a!3186) i!1173 k!2102) index!1321) lt!330176)) (undefined!8295 lt!330170)))))

(declare-fun b!743262 () Bool)

(declare-fun res!500357 () Bool)

(assert (=> b!743262 (=> (not res!500357) (not e!415296))))

(assert (=> b!743262 (= res!500357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743263 () Bool)

(declare-fun res!500361 () Bool)

(assert (=> b!743263 (=> (not res!500361) (not e!415296))))

(declare-datatypes ((List!13885 0))(
  ( (Nil!13882) (Cons!13881 (h!14953 (_ BitVec 64)) (t!20200 List!13885)) )
))
(declare-fun arrayNoDuplicates!0 (array!41539 (_ BitVec 32) List!13885) Bool)

(assert (=> b!743263 (= res!500361 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13882))))

(declare-fun b!743264 () Bool)

(declare-fun res!500362 () Bool)

(assert (=> b!743264 (=> res!500362 e!415298)))

(declare-fun lt!330172 () array!41539)

(assert (=> b!743264 (= res!500362 (not (= (seekEntryOrOpen!0 lt!330176 lt!330172 mask!3328) (Found!7483 index!1321))))))

(declare-fun b!743265 () Bool)

(assert (=> b!743265 (= e!415301 e!415297)))

(declare-fun res!500366 () Bool)

(assert (=> b!743265 (=> (not res!500366) (not e!415297))))

(declare-fun lt!330175 () SeekEntryResult!7483)

(assert (=> b!743265 (= res!500366 (= lt!330175 lt!330170))))

(assert (=> b!743265 (= lt!330170 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330176 lt!330172 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743265 (= lt!330175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330176 mask!3328) lt!330176 lt!330172 mask!3328))))

(assert (=> b!743265 (= lt!330176 (select (store (arr!19883 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743265 (= lt!330172 (array!41540 (store (arr!19883 a!3186) i!1173 k!2102) (size!20304 a!3186)))))

(declare-fun b!743266 () Bool)

(declare-fun res!500371 () Bool)

(assert (=> b!743266 (=> (not res!500371) (not e!415300))))

(declare-fun arrayContainsKey!0 (array!41539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743266 (= res!500371 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743267 () Bool)

(declare-fun res!500365 () Bool)

(assert (=> b!743267 (=> (not res!500365) (not e!415301))))

(assert (=> b!743267 (= res!500365 e!415299)))

(declare-fun c!81826 () Bool)

(assert (=> b!743267 (= c!81826 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743268 () Bool)

(assert (=> b!743268 (= e!415296 e!415301)))

(declare-fun res!500368 () Bool)

(assert (=> b!743268 (=> (not res!500368) (not e!415301))))

(assert (=> b!743268 (= res!500368 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19883 a!3186) j!159) mask!3328) (select (arr!19883 a!3186) j!159) a!3186 mask!3328) lt!330169))))

(assert (=> b!743268 (= lt!330169 (Intermediate!7483 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65366 res!500369) b!743250))

(assert (= (and b!743250 res!500367) b!743254))

(assert (= (and b!743254 res!500358) b!743260))

(assert (= (and b!743260 res!500359) b!743266))

(assert (= (and b!743266 res!500371) b!743258))

(assert (= (and b!743258 res!500370) b!743262))

(assert (= (and b!743262 res!500357) b!743263))

(assert (= (and b!743263 res!500361) b!743255))

(assert (= (and b!743255 res!500374) b!743268))

(assert (= (and b!743268 res!500368) b!743249))

(assert (= (and b!743249 res!500364) b!743267))

(assert (= (and b!743267 c!81826) b!743248))

(assert (= (and b!743267 (not c!81826)) b!743251))

(assert (= (and b!743267 res!500365) b!743265))

(assert (= (and b!743265 res!500366) b!743252))

(assert (= (and b!743252 res!500363) b!743259))

(assert (= (and b!743259 res!500373) b!743253))

(assert (= (and b!743252 (not res!500372)) b!743256))

(assert (= (and b!743256 (not res!500375)) b!743261))

(assert (= (and b!743261 (not res!500360)) b!743264))

(assert (= (and b!743264 (not res!500362)) b!743257))

(declare-fun m!693971 () Bool)

(assert (=> b!743253 m!693971))

(assert (=> b!743253 m!693971))

(declare-fun m!693973 () Bool)

(assert (=> b!743253 m!693973))

(declare-fun m!693975 () Bool)

(assert (=> start!65366 m!693975))

(declare-fun m!693977 () Bool)

(assert (=> start!65366 m!693977))

(declare-fun m!693979 () Bool)

(assert (=> b!743262 m!693979))

(declare-fun m!693981 () Bool)

(assert (=> b!743264 m!693981))

(declare-fun m!693983 () Bool)

(assert (=> b!743249 m!693983))

(declare-fun m!693985 () Bool)

(assert (=> b!743266 m!693985))

(assert (=> b!743254 m!693971))

(assert (=> b!743254 m!693971))

(declare-fun m!693987 () Bool)

(assert (=> b!743254 m!693987))

(declare-fun m!693989 () Bool)

(assert (=> b!743261 m!693989))

(declare-fun m!693991 () Bool)

(assert (=> b!743261 m!693991))

(declare-fun m!693993 () Bool)

(assert (=> b!743258 m!693993))

(declare-fun m!693995 () Bool)

(assert (=> b!743265 m!693995))

(declare-fun m!693997 () Bool)

(assert (=> b!743265 m!693997))

(assert (=> b!743265 m!693989))

(declare-fun m!693999 () Bool)

(assert (=> b!743265 m!693999))

(assert (=> b!743265 m!693995))

(declare-fun m!694001 () Bool)

(assert (=> b!743265 m!694001))

(assert (=> b!743251 m!693971))

(assert (=> b!743251 m!693971))

(declare-fun m!694003 () Bool)

(assert (=> b!743251 m!694003))

(assert (=> b!743248 m!693971))

(assert (=> b!743248 m!693971))

(declare-fun m!694005 () Bool)

(assert (=> b!743248 m!694005))

(assert (=> b!743268 m!693971))

(assert (=> b!743268 m!693971))

(declare-fun m!694007 () Bool)

(assert (=> b!743268 m!694007))

(assert (=> b!743268 m!694007))

(assert (=> b!743268 m!693971))

(declare-fun m!694009 () Bool)

(assert (=> b!743268 m!694009))

(assert (=> b!743259 m!693971))

(assert (=> b!743259 m!693971))

(declare-fun m!694011 () Bool)

(assert (=> b!743259 m!694011))

(declare-fun m!694013 () Bool)

(assert (=> b!743263 m!694013))

(declare-fun m!694015 () Bool)

(assert (=> b!743260 m!694015))

(assert (=> b!743256 m!693971))

(assert (=> b!743256 m!693971))

(assert (=> b!743256 m!694003))

(declare-fun m!694017 () Bool)

(assert (=> b!743252 m!694017))

(declare-fun m!694019 () Bool)

(assert (=> b!743252 m!694019))

(push 1)

