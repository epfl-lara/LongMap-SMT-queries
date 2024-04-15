; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64334 () Bool)

(assert start!64334)

(declare-fun b!723222 () Bool)

(declare-fun e!405162 () Bool)

(declare-fun e!405166 () Bool)

(assert (=> b!723222 (= e!405162 e!405166)))

(declare-fun res!484930 () Bool)

(assert (=> b!723222 (=> (not res!484930) (not e!405166))))

(declare-datatypes ((array!40932 0))(
  ( (array!40933 (arr!19589 (Array (_ BitVec 32) (_ BitVec 64))) (size!20010 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40932)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7186 0))(
  ( (MissingZero!7186 (index!31112 (_ BitVec 32))) (Found!7186 (index!31113 (_ BitVec 32))) (Intermediate!7186 (undefined!7998 Bool) (index!31114 (_ BitVec 32)) (x!62118 (_ BitVec 32))) (Undefined!7186) (MissingVacant!7186 (index!31115 (_ BitVec 32))) )
))
(declare-fun lt!320443 () SeekEntryResult!7186)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40932 (_ BitVec 32)) SeekEntryResult!7186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723222 (= res!484930 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19589 a!3186) j!159) mask!3328) (select (arr!19589 a!3186) j!159) a!3186 mask!3328) lt!320443))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723222 (= lt!320443 (Intermediate!7186 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723224 () Bool)

(declare-fun res!484941 () Bool)

(assert (=> b!723224 (=> (not res!484941) (not e!405162))))

(declare-datatypes ((List!13630 0))(
  ( (Nil!13627) (Cons!13626 (h!14680 (_ BitVec 64)) (t!19936 List!13630)) )
))
(declare-fun arrayNoDuplicates!0 (array!40932 (_ BitVec 32) List!13630) Bool)

(assert (=> b!723224 (= res!484941 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13627))))

(declare-fun b!723225 () Bool)

(declare-fun e!405165 () Bool)

(assert (=> b!723225 (= e!405165 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40932 (_ BitVec 32)) Bool)

(assert (=> b!723225 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24662 0))(
  ( (Unit!24663) )
))
(declare-fun lt!320444 () Unit!24662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24662)

(assert (=> b!723225 (= lt!320444 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723226 () Bool)

(declare-fun res!484940 () Bool)

(declare-fun e!405164 () Bool)

(assert (=> b!723226 (=> (not res!484940) (not e!405164))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723226 (= res!484940 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723227 () Bool)

(declare-fun e!405161 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40932 (_ BitVec 32)) SeekEntryResult!7186)

(assert (=> b!723227 (= e!405161 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19589 a!3186) j!159) a!3186 mask!3328) (Found!7186 j!159)))))

(declare-fun b!723228 () Bool)

(declare-fun res!484935 () Bool)

(assert (=> b!723228 (=> (not res!484935) (not e!405162))))

(assert (=> b!723228 (= res!484935 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20010 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20010 a!3186))))))

(declare-fun b!723229 () Bool)

(declare-fun res!484933 () Bool)

(assert (=> b!723229 (=> (not res!484933) (not e!405166))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723229 (= res!484933 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19589 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723230 () Bool)

(assert (=> b!723230 (= e!405164 e!405162)))

(declare-fun res!484939 () Bool)

(assert (=> b!723230 (=> (not res!484939) (not e!405162))))

(declare-fun lt!320441 () SeekEntryResult!7186)

(assert (=> b!723230 (= res!484939 (or (= lt!320441 (MissingZero!7186 i!1173)) (= lt!320441 (MissingVacant!7186 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40932 (_ BitVec 32)) SeekEntryResult!7186)

(assert (=> b!723230 (= lt!320441 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723231 () Bool)

(declare-fun res!484938 () Bool)

(assert (=> b!723231 (=> (not res!484938) (not e!405162))))

(assert (=> b!723231 (= res!484938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723232 () Bool)

(declare-fun res!484931 () Bool)

(assert (=> b!723232 (=> (not res!484931) (not e!405166))))

(assert (=> b!723232 (= res!484931 e!405161)))

(declare-fun c!79518 () Bool)

(assert (=> b!723232 (= c!79518 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723233 () Bool)

(declare-fun res!484937 () Bool)

(assert (=> b!723233 (=> (not res!484937) (not e!405164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723233 (= res!484937 (validKeyInArray!0 (select (arr!19589 a!3186) j!159)))))

(declare-fun b!723234 () Bool)

(declare-fun res!484934 () Bool)

(assert (=> b!723234 (=> (not res!484934) (not e!405164))))

(assert (=> b!723234 (= res!484934 (and (= (size!20010 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20010 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20010 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723223 () Bool)

(assert (=> b!723223 (= e!405161 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19589 a!3186) j!159) a!3186 mask!3328) lt!320443))))

(declare-fun res!484932 () Bool)

(assert (=> start!64334 (=> (not res!484932) (not e!405164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64334 (= res!484932 (validMask!0 mask!3328))))

(assert (=> start!64334 e!405164))

(assert (=> start!64334 true))

(declare-fun array_inv!15472 (array!40932) Bool)

(assert (=> start!64334 (array_inv!15472 a!3186)))

(declare-fun b!723235 () Bool)

(assert (=> b!723235 (= e!405166 e!405165)))

(declare-fun res!484929 () Bool)

(assert (=> b!723235 (=> (not res!484929) (not e!405165))))

(declare-fun lt!320440 () array!40932)

(declare-fun lt!320442 () (_ BitVec 64))

(assert (=> b!723235 (= res!484929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320442 mask!3328) lt!320442 lt!320440 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320442 lt!320440 mask!3328)))))

(assert (=> b!723235 (= lt!320442 (select (store (arr!19589 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723235 (= lt!320440 (array!40933 (store (arr!19589 a!3186) i!1173 k0!2102) (size!20010 a!3186)))))

(declare-fun b!723236 () Bool)

(declare-fun res!484936 () Bool)

(assert (=> b!723236 (=> (not res!484936) (not e!405164))))

(assert (=> b!723236 (= res!484936 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64334 res!484932) b!723234))

(assert (= (and b!723234 res!484934) b!723233))

(assert (= (and b!723233 res!484937) b!723236))

(assert (= (and b!723236 res!484936) b!723226))

(assert (= (and b!723226 res!484940) b!723230))

(assert (= (and b!723230 res!484939) b!723231))

(assert (= (and b!723231 res!484938) b!723224))

(assert (= (and b!723224 res!484941) b!723228))

(assert (= (and b!723228 res!484935) b!723222))

(assert (= (and b!723222 res!484930) b!723229))

(assert (= (and b!723229 res!484933) b!723232))

(assert (= (and b!723232 c!79518) b!723223))

(assert (= (and b!723232 (not c!79518)) b!723227))

(assert (= (and b!723232 res!484931) b!723235))

(assert (= (and b!723235 res!484929) b!723225))

(declare-fun m!677153 () Bool)

(assert (=> b!723230 m!677153))

(declare-fun m!677155 () Bool)

(assert (=> b!723233 m!677155))

(assert (=> b!723233 m!677155))

(declare-fun m!677157 () Bool)

(assert (=> b!723233 m!677157))

(declare-fun m!677159 () Bool)

(assert (=> start!64334 m!677159))

(declare-fun m!677161 () Bool)

(assert (=> start!64334 m!677161))

(declare-fun m!677163 () Bool)

(assert (=> b!723225 m!677163))

(declare-fun m!677165 () Bool)

(assert (=> b!723225 m!677165))

(assert (=> b!723227 m!677155))

(assert (=> b!723227 m!677155))

(declare-fun m!677167 () Bool)

(assert (=> b!723227 m!677167))

(declare-fun m!677169 () Bool)

(assert (=> b!723235 m!677169))

(declare-fun m!677171 () Bool)

(assert (=> b!723235 m!677171))

(declare-fun m!677173 () Bool)

(assert (=> b!723235 m!677173))

(declare-fun m!677175 () Bool)

(assert (=> b!723235 m!677175))

(assert (=> b!723235 m!677169))

(declare-fun m!677177 () Bool)

(assert (=> b!723235 m!677177))

(assert (=> b!723222 m!677155))

(assert (=> b!723222 m!677155))

(declare-fun m!677179 () Bool)

(assert (=> b!723222 m!677179))

(assert (=> b!723222 m!677179))

(assert (=> b!723222 m!677155))

(declare-fun m!677181 () Bool)

(assert (=> b!723222 m!677181))

(assert (=> b!723223 m!677155))

(assert (=> b!723223 m!677155))

(declare-fun m!677183 () Bool)

(assert (=> b!723223 m!677183))

(declare-fun m!677185 () Bool)

(assert (=> b!723236 m!677185))

(declare-fun m!677187 () Bool)

(assert (=> b!723226 m!677187))

(declare-fun m!677189 () Bool)

(assert (=> b!723231 m!677189))

(declare-fun m!677191 () Bool)

(assert (=> b!723224 m!677191))

(declare-fun m!677193 () Bool)

(assert (=> b!723229 m!677193))

(check-sat (not b!723231) (not b!723223) (not b!723226) (not b!723222) (not b!723227) (not b!723235) (not b!723224) (not b!723233) (not b!723236) (not start!64334) (not b!723230) (not b!723225))
(check-sat)
