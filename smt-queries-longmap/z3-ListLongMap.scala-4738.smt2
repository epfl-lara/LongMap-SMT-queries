; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65468 () Bool)

(assert start!65468)

(declare-fun res!503268 () Bool)

(declare-fun e!416791 () Bool)

(assert (=> start!65468 (=> (not res!503268) (not e!416791))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65468 (= res!503268 (validMask!0 mask!3328))))

(assert (=> start!65468 e!416791))

(assert (=> start!65468 true))

(declare-datatypes ((array!41658 0))(
  ( (array!41659 (arr!19943 (Array (_ BitVec 32) (_ BitVec 64))) (size!20364 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41658)

(declare-fun array_inv!15826 (array!41658) Bool)

(assert (=> start!65468 (array_inv!15826 a!3186)))

(declare-fun b!746385 () Bool)

(declare-fun res!503269 () Bool)

(declare-fun e!416788 () Bool)

(assert (=> b!746385 (=> (not res!503269) (not e!416788))))

(declare-datatypes ((List!13984 0))(
  ( (Nil!13981) (Cons!13980 (h!15052 (_ BitVec 64)) (t!20290 List!13984)) )
))
(declare-fun arrayNoDuplicates!0 (array!41658 (_ BitVec 32) List!13984) Bool)

(assert (=> b!746385 (= res!503269 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13981))))

(declare-fun b!746386 () Bool)

(declare-fun res!503276 () Bool)

(assert (=> b!746386 (=> (not res!503276) (not e!416791))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746386 (= res!503276 (validKeyInArray!0 (select (arr!19943 a!3186) j!159)))))

(declare-fun b!746387 () Bool)

(declare-fun e!416792 () Bool)

(assert (=> b!746387 (= e!416792 true)))

(declare-datatypes ((SeekEntryResult!7540 0))(
  ( (MissingZero!7540 (index!32528 (_ BitVec 32))) (Found!7540 (index!32529 (_ BitVec 32))) (Intermediate!7540 (undefined!8352 Bool) (index!32530 (_ BitVec 32)) (x!63485 (_ BitVec 32))) (Undefined!7540) (MissingVacant!7540 (index!32531 (_ BitVec 32))) )
))
(declare-fun lt!331591 () SeekEntryResult!7540)

(declare-fun lt!331593 () SeekEntryResult!7540)

(assert (=> b!746387 (= lt!331591 lt!331593)))

(declare-fun b!746388 () Bool)

(declare-fun res!503280 () Bool)

(assert (=> b!746388 (=> (not res!503280) (not e!416788))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746388 (= res!503280 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20364 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20364 a!3186))))))

(declare-fun b!746389 () Bool)

(declare-fun e!416790 () Bool)

(declare-fun e!416793 () Bool)

(assert (=> b!746389 (= e!416790 (not e!416793))))

(declare-fun res!503283 () Bool)

(assert (=> b!746389 (=> res!503283 e!416793)))

(declare-fun lt!331592 () SeekEntryResult!7540)

(get-info :version)

(assert (=> b!746389 (= res!503283 (or (not ((_ is Intermediate!7540) lt!331592)) (bvslt x!1131 (x!63485 lt!331592)) (not (= x!1131 (x!63485 lt!331592))) (not (= index!1321 (index!32530 lt!331592)))))))

(declare-fun e!416786 () Bool)

(assert (=> b!746389 e!416786))

(declare-fun res!503270 () Bool)

(assert (=> b!746389 (=> (not res!503270) (not e!416786))))

(declare-fun lt!331589 () SeekEntryResult!7540)

(assert (=> b!746389 (= res!503270 (= lt!331591 lt!331589))))

(assert (=> b!746389 (= lt!331589 (Found!7540 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41658 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!746389 (= lt!331591 (seekEntryOrOpen!0 (select (arr!19943 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41658 (_ BitVec 32)) Bool)

(assert (=> b!746389 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25532 0))(
  ( (Unit!25533) )
))
(declare-fun lt!331594 () Unit!25532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25532)

(assert (=> b!746389 (= lt!331594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746390 () Bool)

(declare-fun res!503272 () Bool)

(declare-fun e!416787 () Bool)

(assert (=> b!746390 (=> (not res!503272) (not e!416787))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746390 (= res!503272 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19943 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!416789 () Bool)

(declare-fun b!746391 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41658 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!746391 (= e!416789 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19943 a!3186) j!159) a!3186 mask!3328) (Found!7540 j!159)))))

(declare-fun lt!331587 () SeekEntryResult!7540)

(declare-fun b!746392 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41658 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!746392 (= e!416789 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19943 a!3186) j!159) a!3186 mask!3328) lt!331587))))

(declare-fun b!746393 () Bool)

(assert (=> b!746393 (= e!416787 e!416790)))

(declare-fun res!503274 () Bool)

(assert (=> b!746393 (=> (not res!503274) (not e!416790))))

(declare-fun lt!331590 () SeekEntryResult!7540)

(assert (=> b!746393 (= res!503274 (= lt!331590 lt!331592))))

(declare-fun lt!331586 () array!41658)

(declare-fun lt!331595 () (_ BitVec 64))

(assert (=> b!746393 (= lt!331592 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331595 lt!331586 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746393 (= lt!331590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331595 mask!3328) lt!331595 lt!331586 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!746393 (= lt!331595 (select (store (arr!19943 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746393 (= lt!331586 (array!41659 (store (arr!19943 a!3186) i!1173 k0!2102) (size!20364 a!3186)))))

(declare-fun b!746394 () Bool)

(declare-fun res!503273 () Bool)

(assert (=> b!746394 (=> (not res!503273) (not e!416791))))

(assert (=> b!746394 (= res!503273 (validKeyInArray!0 k0!2102))))

(declare-fun b!746395 () Bool)

(declare-fun res!503275 () Bool)

(assert (=> b!746395 (=> (not res!503275) (not e!416788))))

(assert (=> b!746395 (= res!503275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746396 () Bool)

(assert (=> b!746396 (= e!416793 e!416792)))

(declare-fun res!503282 () Bool)

(assert (=> b!746396 (=> res!503282 e!416792)))

(assert (=> b!746396 (= res!503282 (or (not (= lt!331593 lt!331589)) (= (select (store (arr!19943 a!3186) i!1173 k0!2102) index!1321) lt!331595) (not (= (select (store (arr!19943 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746396 (= lt!331593 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19943 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746397 () Bool)

(assert (=> b!746397 (= e!416786 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19943 a!3186) j!159) a!3186 mask!3328) lt!331589))))

(declare-fun b!746398 () Bool)

(declare-fun res!503281 () Bool)

(assert (=> b!746398 (=> (not res!503281) (not e!416791))))

(assert (=> b!746398 (= res!503281 (and (= (size!20364 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20364 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20364 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746399 () Bool)

(declare-fun res!503278 () Bool)

(assert (=> b!746399 (=> (not res!503278) (not e!416791))))

(declare-fun arrayContainsKey!0 (array!41658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746399 (= res!503278 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746400 () Bool)

(assert (=> b!746400 (= e!416791 e!416788)))

(declare-fun res!503279 () Bool)

(assert (=> b!746400 (=> (not res!503279) (not e!416788))))

(declare-fun lt!331588 () SeekEntryResult!7540)

(assert (=> b!746400 (= res!503279 (or (= lt!331588 (MissingZero!7540 i!1173)) (= lt!331588 (MissingVacant!7540 i!1173))))))

(assert (=> b!746400 (= lt!331588 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746401 () Bool)

(assert (=> b!746401 (= e!416788 e!416787)))

(declare-fun res!503277 () Bool)

(assert (=> b!746401 (=> (not res!503277) (not e!416787))))

(assert (=> b!746401 (= res!503277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19943 a!3186) j!159) mask!3328) (select (arr!19943 a!3186) j!159) a!3186 mask!3328) lt!331587))))

(assert (=> b!746401 (= lt!331587 (Intermediate!7540 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746402 () Bool)

(declare-fun res!503271 () Bool)

(assert (=> b!746402 (=> (not res!503271) (not e!416787))))

(assert (=> b!746402 (= res!503271 e!416789)))

(declare-fun c!81939 () Bool)

(assert (=> b!746402 (= c!81939 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65468 res!503268) b!746398))

(assert (= (and b!746398 res!503281) b!746386))

(assert (= (and b!746386 res!503276) b!746394))

(assert (= (and b!746394 res!503273) b!746399))

(assert (= (and b!746399 res!503278) b!746400))

(assert (= (and b!746400 res!503279) b!746395))

(assert (= (and b!746395 res!503275) b!746385))

(assert (= (and b!746385 res!503269) b!746388))

(assert (= (and b!746388 res!503280) b!746401))

(assert (= (and b!746401 res!503277) b!746390))

(assert (= (and b!746390 res!503272) b!746402))

(assert (= (and b!746402 c!81939) b!746392))

(assert (= (and b!746402 (not c!81939)) b!746391))

(assert (= (and b!746402 res!503271) b!746393))

(assert (= (and b!746393 res!503274) b!746389))

(assert (= (and b!746389 res!503270) b!746397))

(assert (= (and b!746389 (not res!503283)) b!746396))

(assert (= (and b!746396 (not res!503282)) b!746387))

(declare-fun m!696113 () Bool)

(assert (=> b!746395 m!696113))

(declare-fun m!696115 () Bool)

(assert (=> b!746391 m!696115))

(assert (=> b!746391 m!696115))

(declare-fun m!696117 () Bool)

(assert (=> b!746391 m!696117))

(declare-fun m!696119 () Bool)

(assert (=> b!746394 m!696119))

(assert (=> b!746392 m!696115))

(assert (=> b!746392 m!696115))

(declare-fun m!696121 () Bool)

(assert (=> b!746392 m!696121))

(declare-fun m!696123 () Bool)

(assert (=> b!746393 m!696123))

(assert (=> b!746393 m!696123))

(declare-fun m!696125 () Bool)

(assert (=> b!746393 m!696125))

(declare-fun m!696127 () Bool)

(assert (=> b!746393 m!696127))

(declare-fun m!696129 () Bool)

(assert (=> b!746393 m!696129))

(declare-fun m!696131 () Bool)

(assert (=> b!746393 m!696131))

(assert (=> b!746401 m!696115))

(assert (=> b!746401 m!696115))

(declare-fun m!696133 () Bool)

(assert (=> b!746401 m!696133))

(assert (=> b!746401 m!696133))

(assert (=> b!746401 m!696115))

(declare-fun m!696135 () Bool)

(assert (=> b!746401 m!696135))

(declare-fun m!696137 () Bool)

(assert (=> b!746399 m!696137))

(assert (=> b!746396 m!696127))

(declare-fun m!696139 () Bool)

(assert (=> b!746396 m!696139))

(assert (=> b!746396 m!696115))

(assert (=> b!746396 m!696115))

(assert (=> b!746396 m!696117))

(assert (=> b!746386 m!696115))

(assert (=> b!746386 m!696115))

(declare-fun m!696141 () Bool)

(assert (=> b!746386 m!696141))

(declare-fun m!696143 () Bool)

(assert (=> b!746385 m!696143))

(declare-fun m!696145 () Bool)

(assert (=> start!65468 m!696145))

(declare-fun m!696147 () Bool)

(assert (=> start!65468 m!696147))

(declare-fun m!696149 () Bool)

(assert (=> b!746390 m!696149))

(declare-fun m!696151 () Bool)

(assert (=> b!746400 m!696151))

(assert (=> b!746397 m!696115))

(assert (=> b!746397 m!696115))

(declare-fun m!696153 () Bool)

(assert (=> b!746397 m!696153))

(assert (=> b!746389 m!696115))

(assert (=> b!746389 m!696115))

(declare-fun m!696155 () Bool)

(assert (=> b!746389 m!696155))

(declare-fun m!696157 () Bool)

(assert (=> b!746389 m!696157))

(declare-fun m!696159 () Bool)

(assert (=> b!746389 m!696159))

(check-sat (not b!746391) (not b!746396) (not b!746393) (not b!746399) (not b!746385) (not b!746400) (not b!746401) (not b!746397) (not start!65468) (not b!746395) (not b!746392) (not b!746389) (not b!746394) (not b!746386))
(check-sat)
