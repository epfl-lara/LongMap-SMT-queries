; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65336 () Bool)

(assert start!65336)

(declare-fun b!742369 () Bool)

(declare-fun e!414896 () Bool)

(declare-fun e!414890 () Bool)

(assert (=> b!742369 (= e!414896 e!414890)))

(declare-fun res!499570 () Bool)

(assert (=> b!742369 (=> (not res!499570) (not e!414890))))

(declare-datatypes ((array!41509 0))(
  ( (array!41510 (arr!19868 (Array (_ BitVec 32) (_ BitVec 64))) (size!20289 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41509)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7468 0))(
  ( (MissingZero!7468 (index!32240 (_ BitVec 32))) (Found!7468 (index!32241 (_ BitVec 32))) (Intermediate!7468 (undefined!8280 Bool) (index!32242 (_ BitVec 32)) (x!63210 (_ BitVec 32))) (Undefined!7468) (MissingVacant!7468 (index!32243 (_ BitVec 32))) )
))
(declare-fun lt!329798 () SeekEntryResult!7468)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41509 (_ BitVec 32)) SeekEntryResult!7468)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742369 (= res!499570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19868 a!3186) j!159) mask!3328) (select (arr!19868 a!3186) j!159) a!3186 mask!3328) lt!329798))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742369 (= lt!329798 (Intermediate!7468 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!742370 () Bool)

(declare-fun e!414889 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41509 (_ BitVec 32)) SeekEntryResult!7468)

(assert (=> b!742370 (= e!414889 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) (Found!7468 j!159)))))

(declare-fun b!742371 () Bool)

(declare-fun res!499571 () Bool)

(assert (=> b!742371 (=> (not res!499571) (not e!414896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41509 (_ BitVec 32)) Bool)

(assert (=> b!742371 (= res!499571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742372 () Bool)

(declare-fun res!499575 () Bool)

(assert (=> b!742372 (=> (not res!499575) (not e!414896))))

(declare-datatypes ((List!13870 0))(
  ( (Nil!13867) (Cons!13866 (h!14938 (_ BitVec 64)) (t!20185 List!13870)) )
))
(declare-fun arrayNoDuplicates!0 (array!41509 (_ BitVec 32) List!13870) Bool)

(assert (=> b!742372 (= res!499575 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13867))))

(declare-fun b!742373 () Bool)

(declare-fun res!499582 () Bool)

(declare-fun e!414891 () Bool)

(assert (=> b!742373 (=> (not res!499582) (not e!414891))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742373 (= res!499582 (validKeyInArray!0 k!2102))))

(declare-fun b!742374 () Bool)

(declare-fun res!499583 () Bool)

(assert (=> b!742374 (=> (not res!499583) (not e!414890))))

(assert (=> b!742374 (= res!499583 e!414889)))

(declare-fun c!81781 () Bool)

(assert (=> b!742374 (= c!81781 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742375 () Bool)

(assert (=> b!742375 (= e!414891 e!414896)))

(declare-fun res!499568 () Bool)

(assert (=> b!742375 (=> (not res!499568) (not e!414896))))

(declare-fun lt!329796 () SeekEntryResult!7468)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742375 (= res!499568 (or (= lt!329796 (MissingZero!7468 i!1173)) (= lt!329796 (MissingVacant!7468 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41509 (_ BitVec 32)) SeekEntryResult!7468)

(assert (=> b!742375 (= lt!329796 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742376 () Bool)

(declare-fun e!414894 () Bool)

(declare-fun e!414895 () Bool)

(assert (=> b!742376 (= e!414894 e!414895)))

(declare-fun res!499580 () Bool)

(assert (=> b!742376 (=> (not res!499580) (not e!414895))))

(declare-fun lt!329795 () SeekEntryResult!7468)

(assert (=> b!742376 (= res!499580 (= (seekEntryOrOpen!0 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) lt!329795))))

(assert (=> b!742376 (= lt!329795 (Found!7468 j!159))))

(declare-fun b!742377 () Bool)

(declare-fun e!414892 () Bool)

(declare-fun e!414888 () Bool)

(assert (=> b!742377 (= e!414892 (not e!414888))))

(declare-fun res!499573 () Bool)

(assert (=> b!742377 (=> res!499573 e!414888)))

(declare-fun lt!329797 () SeekEntryResult!7468)

(assert (=> b!742377 (= res!499573 (or (not (is-Intermediate!7468 lt!329797)) (bvslt x!1131 (x!63210 lt!329797)) (not (= x!1131 (x!63210 lt!329797))) (not (= index!1321 (index!32242 lt!329797)))))))

(assert (=> b!742377 e!414894))

(declare-fun res!499576 () Bool)

(assert (=> b!742377 (=> (not res!499576) (not e!414894))))

(assert (=> b!742377 (= res!499576 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25416 0))(
  ( (Unit!25417) )
))
(declare-fun lt!329790 () Unit!25416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25416)

(assert (=> b!742377 (= lt!329790 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742378 () Bool)

(declare-fun res!499572 () Bool)

(assert (=> b!742378 (=> (not res!499572) (not e!414891))))

(assert (=> b!742378 (= res!499572 (validKeyInArray!0 (select (arr!19868 a!3186) j!159)))))

(declare-fun b!742379 () Bool)

(declare-fun res!499579 () Bool)

(assert (=> b!742379 (=> (not res!499579) (not e!414896))))

(assert (=> b!742379 (= res!499579 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20289 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20289 a!3186))))))

(declare-fun res!499577 () Bool)

(assert (=> start!65336 (=> (not res!499577) (not e!414891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65336 (= res!499577 (validMask!0 mask!3328))))

(assert (=> start!65336 e!414891))

(assert (=> start!65336 true))

(declare-fun array_inv!15664 (array!41509) Bool)

(assert (=> start!65336 (array_inv!15664 a!3186)))

(declare-fun b!742380 () Bool)

(declare-fun res!499569 () Bool)

(assert (=> b!742380 (=> (not res!499569) (not e!414891))))

(declare-fun arrayContainsKey!0 (array!41509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742380 (= res!499569 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742381 () Bool)

(declare-fun res!499581 () Bool)

(assert (=> b!742381 (=> (not res!499581) (not e!414890))))

(assert (=> b!742381 (= res!499581 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19868 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742382 () Bool)

(assert (=> b!742382 (= e!414889 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) lt!329798))))

(declare-fun b!742383 () Bool)

(declare-fun res!499574 () Bool)

(assert (=> b!742383 (=> (not res!499574) (not e!414891))))

(assert (=> b!742383 (= res!499574 (and (= (size!20289 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20289 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20289 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742384 () Bool)

(assert (=> b!742384 (= e!414890 e!414892)))

(declare-fun res!499578 () Bool)

(assert (=> b!742384 (=> (not res!499578) (not e!414892))))

(declare-fun lt!329791 () SeekEntryResult!7468)

(assert (=> b!742384 (= res!499578 (= lt!329791 lt!329797))))

(declare-fun lt!329793 () array!41509)

(declare-fun lt!329792 () (_ BitVec 64))

(assert (=> b!742384 (= lt!329797 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329792 lt!329793 mask!3328))))

(assert (=> b!742384 (= lt!329791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329792 mask!3328) lt!329792 lt!329793 mask!3328))))

(assert (=> b!742384 (= lt!329792 (select (store (arr!19868 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742384 (= lt!329793 (array!41510 (store (arr!19868 a!3186) i!1173 k!2102) (size!20289 a!3186)))))

(declare-fun b!742385 () Bool)

(assert (=> b!742385 (= e!414888 true)))

(declare-fun lt!329794 () SeekEntryResult!7468)

(assert (=> b!742385 (= lt!329794 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19868 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!742386 () Bool)

(assert (=> b!742386 (= e!414895 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) lt!329795))))

(assert (= (and start!65336 res!499577) b!742383))

(assert (= (and b!742383 res!499574) b!742378))

(assert (= (and b!742378 res!499572) b!742373))

(assert (= (and b!742373 res!499582) b!742380))

(assert (= (and b!742380 res!499569) b!742375))

(assert (= (and b!742375 res!499568) b!742371))

(assert (= (and b!742371 res!499571) b!742372))

(assert (= (and b!742372 res!499575) b!742379))

(assert (= (and b!742379 res!499579) b!742369))

(assert (= (and b!742369 res!499570) b!742381))

(assert (= (and b!742381 res!499581) b!742374))

(assert (= (and b!742374 c!81781) b!742382))

(assert (= (and b!742374 (not c!81781)) b!742370))

(assert (= (and b!742374 res!499583) b!742384))

(assert (= (and b!742384 res!499578) b!742377))

(assert (= (and b!742377 res!499576) b!742376))

(assert (= (and b!742376 res!499580) b!742386))

(assert (= (and b!742377 (not res!499573)) b!742385))

(declare-fun m!693243 () Bool)

(assert (=> b!742369 m!693243))

(assert (=> b!742369 m!693243))

(declare-fun m!693245 () Bool)

(assert (=> b!742369 m!693245))

(assert (=> b!742369 m!693245))

(assert (=> b!742369 m!693243))

(declare-fun m!693247 () Bool)

(assert (=> b!742369 m!693247))

(assert (=> b!742385 m!693243))

(assert (=> b!742385 m!693243))

(declare-fun m!693249 () Bool)

(assert (=> b!742385 m!693249))

(declare-fun m!693251 () Bool)

(assert (=> b!742380 m!693251))

(assert (=> b!742376 m!693243))

(assert (=> b!742376 m!693243))

(declare-fun m!693253 () Bool)

(assert (=> b!742376 m!693253))

(assert (=> b!742378 m!693243))

(assert (=> b!742378 m!693243))

(declare-fun m!693255 () Bool)

(assert (=> b!742378 m!693255))

(declare-fun m!693257 () Bool)

(assert (=> start!65336 m!693257))

(declare-fun m!693259 () Bool)

(assert (=> start!65336 m!693259))

(assert (=> b!742382 m!693243))

(assert (=> b!742382 m!693243))

(declare-fun m!693261 () Bool)

(assert (=> b!742382 m!693261))

(declare-fun m!693263 () Bool)

(assert (=> b!742372 m!693263))

(declare-fun m!693265 () Bool)

(assert (=> b!742377 m!693265))

(declare-fun m!693267 () Bool)

(assert (=> b!742377 m!693267))

(declare-fun m!693269 () Bool)

(assert (=> b!742381 m!693269))

(assert (=> b!742386 m!693243))

(assert (=> b!742386 m!693243))

(declare-fun m!693271 () Bool)

(assert (=> b!742386 m!693271))

(declare-fun m!693273 () Bool)

(assert (=> b!742371 m!693273))

(assert (=> b!742370 m!693243))

(assert (=> b!742370 m!693243))

(assert (=> b!742370 m!693249))

(declare-fun m!693275 () Bool)

(assert (=> b!742375 m!693275))

(declare-fun m!693277 () Bool)

(assert (=> b!742373 m!693277))

(declare-fun m!693279 () Bool)

(assert (=> b!742384 m!693279))

(declare-fun m!693281 () Bool)

(assert (=> b!742384 m!693281))

(declare-fun m!693283 () Bool)

(assert (=> b!742384 m!693283))

(assert (=> b!742384 m!693279))

(declare-fun m!693285 () Bool)

(assert (=> b!742384 m!693285))

(declare-fun m!693287 () Bool)

(assert (=> b!742384 m!693287))

(push 1)

