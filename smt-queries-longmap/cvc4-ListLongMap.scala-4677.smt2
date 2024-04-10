; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65126 () Bool)

(assert start!65126)

(declare-fun b!735316 () Bool)

(declare-fun e!411421 () Bool)

(declare-fun e!411420 () Bool)

(assert (=> b!735316 (= e!411421 (not e!411420))))

(declare-fun res!494089 () Bool)

(assert (=> b!735316 (=> res!494089 e!411420)))

(declare-datatypes ((SeekEntryResult!7363 0))(
  ( (MissingZero!7363 (index!31820 (_ BitVec 32))) (Found!7363 (index!31821 (_ BitVec 32))) (Intermediate!7363 (undefined!8175 Bool) (index!31822 (_ BitVec 32)) (x!62825 (_ BitVec 32))) (Undefined!7363) (MissingVacant!7363 (index!31823 (_ BitVec 32))) )
))
(declare-fun lt!325949 () SeekEntryResult!7363)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!735316 (= res!494089 (or (not (is-Intermediate!7363 lt!325949)) (bvsge x!1131 (x!62825 lt!325949))))))

(declare-fun lt!325950 () SeekEntryResult!7363)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!735316 (= lt!325950 (Found!7363 j!159))))

(declare-fun e!411412 () Bool)

(assert (=> b!735316 e!411412))

(declare-fun res!494098 () Bool)

(assert (=> b!735316 (=> (not res!494098) (not e!411412))))

(declare-datatypes ((array!41299 0))(
  ( (array!41300 (arr!19763 (Array (_ BitVec 32) (_ BitVec 64))) (size!20184 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41299)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41299 (_ BitVec 32)) Bool)

(assert (=> b!735316 (= res!494098 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25048 0))(
  ( (Unit!25049) )
))
(declare-fun lt!325951 () Unit!25048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25048)

(assert (=> b!735316 (= lt!325951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735317 () Bool)

(declare-fun res!494100 () Bool)

(declare-fun e!411419 () Bool)

(assert (=> b!735317 (=> (not res!494100) (not e!411419))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735317 (= res!494100 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735318 () Bool)

(declare-fun e!411422 () Bool)

(assert (=> b!735318 (= e!411422 true)))

(declare-fun lt!325942 () (_ BitVec 64))

(declare-fun lt!325945 () array!41299)

(declare-fun lt!325947 () SeekEntryResult!7363)

(declare-fun lt!325955 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41299 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!735318 (= lt!325947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325955 lt!325942 lt!325945 mask!3328))))

(declare-fun res!494091 () Bool)

(assert (=> start!65126 (=> (not res!494091) (not e!411419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65126 (= res!494091 (validMask!0 mask!3328))))

(assert (=> start!65126 e!411419))

(assert (=> start!65126 true))

(declare-fun array_inv!15559 (array!41299) Bool)

(assert (=> start!65126 (array_inv!15559 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!411417 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!735319 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41299 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!735319 (= e!411417 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) (Found!7363 j!159)))))

(declare-fun b!735320 () Bool)

(declare-fun res!494099 () Bool)

(declare-fun e!411415 () Bool)

(assert (=> b!735320 (=> (not res!494099) (not e!411415))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735320 (= res!494099 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20184 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20184 a!3186))))))

(declare-fun b!735321 () Bool)

(declare-fun e!411413 () Unit!25048)

(declare-fun Unit!25050 () Unit!25048)

(assert (=> b!735321 (= e!411413 Unit!25050)))

(declare-fun lt!325953 () SeekEntryResult!7363)

(assert (=> b!735321 (= lt!325953 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735321 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325955 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325950)))

(declare-fun b!735322 () Bool)

(declare-fun Unit!25051 () Unit!25048)

(assert (=> b!735322 (= e!411413 Unit!25051)))

(declare-fun lt!325943 () SeekEntryResult!7363)

(assert (=> b!735322 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325955 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325943)))

(declare-fun b!735323 () Bool)

(declare-fun e!411411 () Bool)

(assert (=> b!735323 (= e!411411 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325955 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325950)))))

(declare-fun b!735324 () Bool)

(declare-fun res!494090 () Bool)

(declare-fun e!411418 () Bool)

(assert (=> b!735324 (=> (not res!494090) (not e!411418))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735324 (= res!494090 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19763 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735325 () Bool)

(assert (=> b!735325 (= e!411419 e!411415)))

(declare-fun res!494088 () Bool)

(assert (=> b!735325 (=> (not res!494088) (not e!411415))))

(declare-fun lt!325948 () SeekEntryResult!7363)

(assert (=> b!735325 (= res!494088 (or (= lt!325948 (MissingZero!7363 i!1173)) (= lt!325948 (MissingVacant!7363 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41299 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!735325 (= lt!325948 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!735326 () Bool)

(declare-fun res!494102 () Bool)

(assert (=> b!735326 (=> (not res!494102) (not e!411419))))

(assert (=> b!735326 (= res!494102 (and (= (size!20184 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20184 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20184 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735327 () Bool)

(declare-fun res!494086 () Bool)

(assert (=> b!735327 (=> (not res!494086) (not e!411415))))

(declare-datatypes ((List!13765 0))(
  ( (Nil!13762) (Cons!13761 (h!14833 (_ BitVec 64)) (t!20080 List!13765)) )
))
(declare-fun arrayNoDuplicates!0 (array!41299 (_ BitVec 32) List!13765) Bool)

(assert (=> b!735327 (= res!494086 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13762))))

(declare-fun lt!325946 () SeekEntryResult!7363)

(declare-fun e!411416 () Bool)

(declare-fun b!735328 () Bool)

(assert (=> b!735328 (= e!411416 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325946))))

(declare-fun b!735329 () Bool)

(declare-fun res!494093 () Bool)

(assert (=> b!735329 (=> (not res!494093) (not e!411418))))

(assert (=> b!735329 (= res!494093 e!411417)))

(declare-fun c!80997 () Bool)

(assert (=> b!735329 (= c!80997 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735330 () Bool)

(assert (=> b!735330 (= e!411417 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325943))))

(declare-fun b!735331 () Bool)

(declare-fun res!494085 () Bool)

(assert (=> b!735331 (=> res!494085 e!411422)))

(assert (=> b!735331 (= res!494085 e!411411)))

(declare-fun c!80998 () Bool)

(declare-fun lt!325952 () Bool)

(assert (=> b!735331 (= c!80998 lt!325952)))

(declare-fun b!735332 () Bool)

(assert (=> b!735332 (= e!411412 e!411416)))

(declare-fun res!494101 () Bool)

(assert (=> b!735332 (=> (not res!494101) (not e!411416))))

(assert (=> b!735332 (= res!494101 (= (seekEntryOrOpen!0 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325946))))

(assert (=> b!735332 (= lt!325946 (Found!7363 j!159))))

(declare-fun b!735333 () Bool)

(declare-fun res!494097 () Bool)

(assert (=> b!735333 (=> (not res!494097) (not e!411419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735333 (= res!494097 (validKeyInArray!0 k!2102))))

(declare-fun b!735334 () Bool)

(assert (=> b!735334 (= e!411420 e!411422)))

(declare-fun res!494096 () Bool)

(assert (=> b!735334 (=> res!494096 e!411422)))

(assert (=> b!735334 (= res!494096 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!325955 #b00000000000000000000000000000000) (bvsge lt!325955 (size!20184 a!3186))))))

(declare-fun lt!325944 () Unit!25048)

(assert (=> b!735334 (= lt!325944 e!411413)))

(declare-fun c!80996 () Bool)

(assert (=> b!735334 (= c!80996 lt!325952)))

(assert (=> b!735334 (= lt!325952 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735334 (= lt!325955 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735335 () Bool)

(assert (=> b!735335 (= e!411411 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325955 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325943)))))

(declare-fun b!735336 () Bool)

(assert (=> b!735336 (= e!411415 e!411418)))

(declare-fun res!494087 () Bool)

(assert (=> b!735336 (=> (not res!494087) (not e!411418))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735336 (= res!494087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19763 a!3186) j!159) mask!3328) (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325943))))

(assert (=> b!735336 (= lt!325943 (Intermediate!7363 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735337 () Bool)

(declare-fun res!494095 () Bool)

(assert (=> b!735337 (=> (not res!494095) (not e!411419))))

(assert (=> b!735337 (= res!494095 (validKeyInArray!0 (select (arr!19763 a!3186) j!159)))))

(declare-fun b!735338 () Bool)

(assert (=> b!735338 (= e!411418 e!411421)))

(declare-fun res!494094 () Bool)

(assert (=> b!735338 (=> (not res!494094) (not e!411421))))

(declare-fun lt!325954 () SeekEntryResult!7363)

(assert (=> b!735338 (= res!494094 (= lt!325954 lt!325949))))

(assert (=> b!735338 (= lt!325949 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325942 lt!325945 mask!3328))))

(assert (=> b!735338 (= lt!325954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325942 mask!3328) lt!325942 lt!325945 mask!3328))))

(assert (=> b!735338 (= lt!325942 (select (store (arr!19763 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735338 (= lt!325945 (array!41300 (store (arr!19763 a!3186) i!1173 k!2102) (size!20184 a!3186)))))

(declare-fun b!735339 () Bool)

(declare-fun res!494092 () Bool)

(assert (=> b!735339 (=> (not res!494092) (not e!411415))))

(assert (=> b!735339 (= res!494092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65126 res!494091) b!735326))

(assert (= (and b!735326 res!494102) b!735337))

(assert (= (and b!735337 res!494095) b!735333))

(assert (= (and b!735333 res!494097) b!735317))

(assert (= (and b!735317 res!494100) b!735325))

(assert (= (and b!735325 res!494088) b!735339))

(assert (= (and b!735339 res!494092) b!735327))

(assert (= (and b!735327 res!494086) b!735320))

(assert (= (and b!735320 res!494099) b!735336))

(assert (= (and b!735336 res!494087) b!735324))

(assert (= (and b!735324 res!494090) b!735329))

(assert (= (and b!735329 c!80997) b!735330))

(assert (= (and b!735329 (not c!80997)) b!735319))

(assert (= (and b!735329 res!494093) b!735338))

(assert (= (and b!735338 res!494094) b!735316))

(assert (= (and b!735316 res!494098) b!735332))

(assert (= (and b!735332 res!494101) b!735328))

(assert (= (and b!735316 (not res!494089)) b!735334))

(assert (= (and b!735334 c!80996) b!735322))

(assert (= (and b!735334 (not c!80996)) b!735321))

(assert (= (and b!735334 (not res!494096)) b!735331))

(assert (= (and b!735331 c!80998) b!735335))

(assert (= (and b!735331 (not c!80998)) b!735323))

(assert (= (and b!735331 (not res!494085)) b!735318))

(declare-fun m!687727 () Bool)

(assert (=> b!735318 m!687727))

(declare-fun m!687729 () Bool)

(assert (=> start!65126 m!687729))

(declare-fun m!687731 () Bool)

(assert (=> start!65126 m!687731))

(declare-fun m!687733 () Bool)

(assert (=> b!735325 m!687733))

(declare-fun m!687735 () Bool)

(assert (=> b!735323 m!687735))

(assert (=> b!735323 m!687735))

(declare-fun m!687737 () Bool)

(assert (=> b!735323 m!687737))

(assert (=> b!735335 m!687735))

(assert (=> b!735335 m!687735))

(declare-fun m!687739 () Bool)

(assert (=> b!735335 m!687739))

(declare-fun m!687741 () Bool)

(assert (=> b!735327 m!687741))

(declare-fun m!687743 () Bool)

(assert (=> b!735334 m!687743))

(declare-fun m!687745 () Bool)

(assert (=> b!735317 m!687745))

(assert (=> b!735337 m!687735))

(assert (=> b!735337 m!687735))

(declare-fun m!687747 () Bool)

(assert (=> b!735337 m!687747))

(declare-fun m!687749 () Bool)

(assert (=> b!735339 m!687749))

(assert (=> b!735322 m!687735))

(assert (=> b!735322 m!687735))

(assert (=> b!735322 m!687739))

(assert (=> b!735328 m!687735))

(assert (=> b!735328 m!687735))

(declare-fun m!687751 () Bool)

(assert (=> b!735328 m!687751))

(assert (=> b!735332 m!687735))

(assert (=> b!735332 m!687735))

(declare-fun m!687753 () Bool)

(assert (=> b!735332 m!687753))

(assert (=> b!735336 m!687735))

(assert (=> b!735336 m!687735))

(declare-fun m!687755 () Bool)

(assert (=> b!735336 m!687755))

(assert (=> b!735336 m!687755))

(assert (=> b!735336 m!687735))

(declare-fun m!687757 () Bool)

(assert (=> b!735336 m!687757))

(assert (=> b!735319 m!687735))

(assert (=> b!735319 m!687735))

(declare-fun m!687759 () Bool)

(assert (=> b!735319 m!687759))

(declare-fun m!687761 () Bool)

(assert (=> b!735338 m!687761))

(declare-fun m!687763 () Bool)

(assert (=> b!735338 m!687763))

(declare-fun m!687765 () Bool)

(assert (=> b!735338 m!687765))

(declare-fun m!687767 () Bool)

(assert (=> b!735338 m!687767))

(assert (=> b!735338 m!687761))

(declare-fun m!687769 () Bool)

(assert (=> b!735338 m!687769))

(assert (=> b!735321 m!687735))

(assert (=> b!735321 m!687735))

(assert (=> b!735321 m!687759))

(assert (=> b!735321 m!687735))

(assert (=> b!735321 m!687737))

(declare-fun m!687771 () Bool)

(assert (=> b!735316 m!687771))

(declare-fun m!687773 () Bool)

(assert (=> b!735316 m!687773))

(assert (=> b!735330 m!687735))

(assert (=> b!735330 m!687735))

(declare-fun m!687775 () Bool)

(assert (=> b!735330 m!687775))

(declare-fun m!687777 () Bool)

(assert (=> b!735324 m!687777))

(declare-fun m!687779 () Bool)

(assert (=> b!735333 m!687779))

(push 1)

