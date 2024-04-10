; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64706 () Bool)

(assert start!64706)

(declare-fun b!729820 () Bool)

(declare-fun e!408457 () Bool)

(declare-fun e!408454 () Bool)

(assert (=> b!729820 (= e!408457 e!408454)))

(declare-fun res!490182 () Bool)

(assert (=> b!729820 (=> (not res!490182) (not e!408454))))

(declare-datatypes ((SeekEntryResult!7297 0))(
  ( (MissingZero!7297 (index!31556 (_ BitVec 32))) (Found!7297 (index!31557 (_ BitVec 32))) (Intermediate!7297 (undefined!8109 Bool) (index!31558 (_ BitVec 32)) (x!62535 (_ BitVec 32))) (Undefined!7297) (MissingVacant!7297 (index!31559 (_ BitVec 32))) )
))
(declare-fun lt!323356 () SeekEntryResult!7297)

(declare-fun lt!323353 () SeekEntryResult!7297)

(assert (=> b!729820 (= res!490182 (= lt!323356 lt!323353))))

(declare-fun lt!323355 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41155 0))(
  ( (array!41156 (arr!19697 (Array (_ BitVec 32) (_ BitVec 64))) (size!20118 (_ BitVec 32))) )
))
(declare-fun lt!323359 () array!41155)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41155 (_ BitVec 32)) SeekEntryResult!7297)

(assert (=> b!729820 (= lt!323353 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323355 lt!323359 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729820 (= lt!323356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323355 mask!3328) lt!323355 lt!323359 mask!3328))))

(declare-fun a!3186 () array!41155)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!729820 (= lt!323355 (select (store (arr!19697 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729820 (= lt!323359 (array!41156 (store (arr!19697 a!3186) i!1173 k!2102) (size!20118 a!3186)))))

(declare-fun b!729821 () Bool)

(declare-fun e!408456 () Bool)

(assert (=> b!729821 (= e!408454 (not e!408456))))

(declare-fun res!490196 () Bool)

(assert (=> b!729821 (=> res!490196 e!408456)))

(assert (=> b!729821 (= res!490196 (or (not (is-Intermediate!7297 lt!323353)) (bvsge x!1131 (x!62535 lt!323353))))))

(declare-fun e!408459 () Bool)

(assert (=> b!729821 e!408459))

(declare-fun res!490181 () Bool)

(assert (=> b!729821 (=> (not res!490181) (not e!408459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41155 (_ BitVec 32)) Bool)

(assert (=> b!729821 (= res!490181 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24912 0))(
  ( (Unit!24913) )
))
(declare-fun lt!323360 () Unit!24912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24912)

(assert (=> b!729821 (= lt!323360 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729822 () Bool)

(declare-fun res!490187 () Bool)

(declare-fun e!408458 () Bool)

(assert (=> b!729822 (=> (not res!490187) (not e!408458))))

(declare-fun arrayContainsKey!0 (array!41155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729822 (= res!490187 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729823 () Bool)

(declare-fun res!490186 () Bool)

(assert (=> b!729823 (=> (not res!490186) (not e!408457))))

(declare-fun e!408453 () Bool)

(assert (=> b!729823 (= res!490186 e!408453)))

(declare-fun c!80194 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729823 (= c!80194 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729824 () Bool)

(declare-fun res!490192 () Bool)

(declare-fun e!408461 () Bool)

(assert (=> b!729824 (=> (not res!490192) (not e!408461))))

(assert (=> b!729824 (= res!490192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729825 () Bool)

(declare-fun res!490195 () Bool)

(assert (=> b!729825 (=> (not res!490195) (not e!408458))))

(assert (=> b!729825 (= res!490195 (and (= (size!20118 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20118 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20118 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729826 () Bool)

(declare-fun e!408455 () Bool)

(assert (=> b!729826 (= e!408459 e!408455)))

(declare-fun res!490183 () Bool)

(assert (=> b!729826 (=> (not res!490183) (not e!408455))))

(declare-fun lt!323358 () SeekEntryResult!7297)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41155 (_ BitVec 32)) SeekEntryResult!7297)

(assert (=> b!729826 (= res!490183 (= (seekEntryOrOpen!0 (select (arr!19697 a!3186) j!159) a!3186 mask!3328) lt!323358))))

(assert (=> b!729826 (= lt!323358 (Found!7297 j!159))))

(declare-fun b!729827 () Bool)

(declare-fun res!490188 () Bool)

(assert (=> b!729827 (=> (not res!490188) (not e!408457))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!729827 (= res!490188 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19697 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!490190 () Bool)

(assert (=> start!64706 (=> (not res!490190) (not e!408458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64706 (= res!490190 (validMask!0 mask!3328))))

(assert (=> start!64706 e!408458))

(assert (=> start!64706 true))

(declare-fun array_inv!15493 (array!41155) Bool)

(assert (=> start!64706 (array_inv!15493 a!3186)))

(declare-fun b!729828 () Bool)

(declare-fun res!490191 () Bool)

(assert (=> b!729828 (=> (not res!490191) (not e!408458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729828 (= res!490191 (validKeyInArray!0 (select (arr!19697 a!3186) j!159)))))

(declare-fun b!729829 () Bool)

(declare-fun res!490185 () Bool)

(assert (=> b!729829 (=> (not res!490185) (not e!408461))))

(assert (=> b!729829 (= res!490185 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20118 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20118 a!3186))))))

(declare-fun b!729830 () Bool)

(declare-fun res!490189 () Bool)

(assert (=> b!729830 (=> (not res!490189) (not e!408461))))

(declare-datatypes ((List!13699 0))(
  ( (Nil!13696) (Cons!13695 (h!14755 (_ BitVec 64)) (t!20014 List!13699)) )
))
(declare-fun arrayNoDuplicates!0 (array!41155 (_ BitVec 32) List!13699) Bool)

(assert (=> b!729830 (= res!490189 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13696))))

(declare-fun b!729831 () Bool)

(assert (=> b!729831 (= e!408456 true)))

(declare-fun lt!323354 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729831 (= lt!323354 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!323357 () SeekEntryResult!7297)

(declare-fun b!729832 () Bool)

(assert (=> b!729832 (= e!408453 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19697 a!3186) j!159) a!3186 mask!3328) lt!323357))))

(declare-fun b!729833 () Bool)

(assert (=> b!729833 (= e!408461 e!408457)))

(declare-fun res!490184 () Bool)

(assert (=> b!729833 (=> (not res!490184) (not e!408457))))

(assert (=> b!729833 (= res!490184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19697 a!3186) j!159) mask!3328) (select (arr!19697 a!3186) j!159) a!3186 mask!3328) lt!323357))))

(assert (=> b!729833 (= lt!323357 (Intermediate!7297 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729834 () Bool)

(declare-fun res!490193 () Bool)

(assert (=> b!729834 (=> (not res!490193) (not e!408458))))

(assert (=> b!729834 (= res!490193 (validKeyInArray!0 k!2102))))

(declare-fun b!729835 () Bool)

(assert (=> b!729835 (= e!408458 e!408461)))

(declare-fun res!490194 () Bool)

(assert (=> b!729835 (=> (not res!490194) (not e!408461))))

(declare-fun lt!323352 () SeekEntryResult!7297)

(assert (=> b!729835 (= res!490194 (or (= lt!323352 (MissingZero!7297 i!1173)) (= lt!323352 (MissingVacant!7297 i!1173))))))

(assert (=> b!729835 (= lt!323352 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729836 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41155 (_ BitVec 32)) SeekEntryResult!7297)

(assert (=> b!729836 (= e!408455 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19697 a!3186) j!159) a!3186 mask!3328) lt!323358))))

(declare-fun b!729837 () Bool)

(assert (=> b!729837 (= e!408453 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19697 a!3186) j!159) a!3186 mask!3328) (Found!7297 j!159)))))

(assert (= (and start!64706 res!490190) b!729825))

(assert (= (and b!729825 res!490195) b!729828))

(assert (= (and b!729828 res!490191) b!729834))

(assert (= (and b!729834 res!490193) b!729822))

(assert (= (and b!729822 res!490187) b!729835))

(assert (= (and b!729835 res!490194) b!729824))

(assert (= (and b!729824 res!490192) b!729830))

(assert (= (and b!729830 res!490189) b!729829))

(assert (= (and b!729829 res!490185) b!729833))

(assert (= (and b!729833 res!490184) b!729827))

(assert (= (and b!729827 res!490188) b!729823))

(assert (= (and b!729823 c!80194) b!729832))

(assert (= (and b!729823 (not c!80194)) b!729837))

(assert (= (and b!729823 res!490186) b!729820))

(assert (= (and b!729820 res!490182) b!729821))

(assert (= (and b!729821 res!490181) b!729826))

(assert (= (and b!729826 res!490183) b!729836))

(assert (= (and b!729821 (not res!490196)) b!729831))

(declare-fun m!683419 () Bool)

(assert (=> b!729832 m!683419))

(assert (=> b!729832 m!683419))

(declare-fun m!683421 () Bool)

(assert (=> b!729832 m!683421))

(declare-fun m!683423 () Bool)

(assert (=> start!64706 m!683423))

(declare-fun m!683425 () Bool)

(assert (=> start!64706 m!683425))

(declare-fun m!683427 () Bool)

(assert (=> b!729822 m!683427))

(assert (=> b!729833 m!683419))

(assert (=> b!729833 m!683419))

(declare-fun m!683429 () Bool)

(assert (=> b!729833 m!683429))

(assert (=> b!729833 m!683429))

(assert (=> b!729833 m!683419))

(declare-fun m!683431 () Bool)

(assert (=> b!729833 m!683431))

(declare-fun m!683433 () Bool)

(assert (=> b!729830 m!683433))

(declare-fun m!683435 () Bool)

(assert (=> b!729835 m!683435))

(declare-fun m!683437 () Bool)

(assert (=> b!729834 m!683437))

(declare-fun m!683439 () Bool)

(assert (=> b!729821 m!683439))

(declare-fun m!683441 () Bool)

(assert (=> b!729821 m!683441))

(declare-fun m!683443 () Bool)

(assert (=> b!729824 m!683443))

(declare-fun m!683445 () Bool)

(assert (=> b!729827 m!683445))

(assert (=> b!729826 m!683419))

(assert (=> b!729826 m!683419))

(declare-fun m!683447 () Bool)

(assert (=> b!729826 m!683447))

(declare-fun m!683449 () Bool)

(assert (=> b!729820 m!683449))

(assert (=> b!729820 m!683449))

(declare-fun m!683451 () Bool)

(assert (=> b!729820 m!683451))

(declare-fun m!683453 () Bool)

(assert (=> b!729820 m!683453))

(declare-fun m!683455 () Bool)

(assert (=> b!729820 m!683455))

(declare-fun m!683457 () Bool)

(assert (=> b!729820 m!683457))

(assert (=> b!729828 m!683419))

(assert (=> b!729828 m!683419))

(declare-fun m!683459 () Bool)

(assert (=> b!729828 m!683459))

(declare-fun m!683461 () Bool)

(assert (=> b!729831 m!683461))

(assert (=> b!729837 m!683419))

(assert (=> b!729837 m!683419))

(declare-fun m!683463 () Bool)

(assert (=> b!729837 m!683463))

(assert (=> b!729836 m!683419))

(assert (=> b!729836 m!683419))

(declare-fun m!683465 () Bool)

(assert (=> b!729836 m!683465))

(push 1)

