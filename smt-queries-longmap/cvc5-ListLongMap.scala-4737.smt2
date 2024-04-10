; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65482 () Bool)

(assert start!65482)

(declare-fun b!746473 () Bool)

(declare-fun res!503236 () Bool)

(declare-fun e!416866 () Bool)

(assert (=> b!746473 (=> (not res!503236) (not e!416866))))

(declare-datatypes ((array!41655 0))(
  ( (array!41656 (arr!19941 (Array (_ BitVec 32) (_ BitVec 64))) (size!20362 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41655)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746473 (= res!503236 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746474 () Bool)

(declare-fun res!503245 () Bool)

(assert (=> b!746474 (=> (not res!503245) (not e!416866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746474 (= res!503245 (validKeyInArray!0 k!2102))))

(declare-fun b!746475 () Bool)

(declare-fun e!416864 () Bool)

(declare-fun e!416859 () Bool)

(assert (=> b!746475 (= e!416864 e!416859)))

(declare-fun res!503249 () Bool)

(assert (=> b!746475 (=> (not res!503249) (not e!416859))))

(declare-datatypes ((SeekEntryResult!7541 0))(
  ( (MissingZero!7541 (index!32532 (_ BitVec 32))) (Found!7541 (index!32533 (_ BitVec 32))) (Intermediate!7541 (undefined!8353 Bool) (index!32534 (_ BitVec 32)) (x!63483 (_ BitVec 32))) (Undefined!7541) (MissingVacant!7541 (index!32535 (_ BitVec 32))) )
))
(declare-fun lt!331743 () SeekEntryResult!7541)

(declare-fun lt!331741 () SeekEntryResult!7541)

(assert (=> b!746475 (= res!503249 (= lt!331743 lt!331741))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331742 () array!41655)

(declare-fun lt!331744 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41655 (_ BitVec 32)) SeekEntryResult!7541)

(assert (=> b!746475 (= lt!331741 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331744 lt!331742 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746475 (= lt!331743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331744 mask!3328) lt!331744 lt!331742 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746475 (= lt!331744 (select (store (arr!19941 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746475 (= lt!331742 (array!41656 (store (arr!19941 a!3186) i!1173 k!2102) (size!20362 a!3186)))))

(declare-fun e!416861 () Bool)

(declare-fun b!746476 () Bool)

(declare-fun lt!331740 () SeekEntryResult!7541)

(assert (=> b!746476 (= e!416861 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19941 a!3186) j!159) a!3186 mask!3328) lt!331740))))

(declare-fun b!746477 () Bool)

(declare-fun res!503239 () Bool)

(assert (=> b!746477 (=> (not res!503239) (not e!416866))))

(assert (=> b!746477 (= res!503239 (and (= (size!20362 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20362 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20362 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746478 () Bool)

(declare-fun e!416865 () Bool)

(assert (=> b!746478 (= e!416865 e!416864)))

(declare-fun res!503248 () Bool)

(assert (=> b!746478 (=> (not res!503248) (not e!416864))))

(assert (=> b!746478 (= res!503248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19941 a!3186) j!159) mask!3328) (select (arr!19941 a!3186) j!159) a!3186 mask!3328) lt!331740))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746478 (= lt!331740 (Intermediate!7541 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746479 () Bool)

(declare-fun res!503247 () Bool)

(assert (=> b!746479 (=> (not res!503247) (not e!416866))))

(assert (=> b!746479 (= res!503247 (validKeyInArray!0 (select (arr!19941 a!3186) j!159)))))

(declare-fun b!746480 () Bool)

(declare-fun e!416867 () Bool)

(assert (=> b!746480 (= e!416859 (not e!416867))))

(declare-fun res!503240 () Bool)

(assert (=> b!746480 (=> res!503240 e!416867)))

(assert (=> b!746480 (= res!503240 (or (not (is-Intermediate!7541 lt!331741)) (bvslt x!1131 (x!63483 lt!331741)) (not (= x!1131 (x!63483 lt!331741))) (not (= index!1321 (index!32534 lt!331741)))))))

(declare-fun e!416863 () Bool)

(assert (=> b!746480 e!416863))

(declare-fun res!503237 () Bool)

(assert (=> b!746480 (=> (not res!503237) (not e!416863))))

(declare-fun lt!331738 () SeekEntryResult!7541)

(declare-fun lt!331737 () SeekEntryResult!7541)

(assert (=> b!746480 (= res!503237 (= lt!331738 lt!331737))))

(assert (=> b!746480 (= lt!331737 (Found!7541 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41655 (_ BitVec 32)) SeekEntryResult!7541)

(assert (=> b!746480 (= lt!331738 (seekEntryOrOpen!0 (select (arr!19941 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41655 (_ BitVec 32)) Bool)

(assert (=> b!746480 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25562 0))(
  ( (Unit!25563) )
))
(declare-fun lt!331736 () Unit!25562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25562)

(assert (=> b!746480 (= lt!331736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746481 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41655 (_ BitVec 32)) SeekEntryResult!7541)

(assert (=> b!746481 (= e!416861 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19941 a!3186) j!159) a!3186 mask!3328) (Found!7541 j!159)))))

(declare-fun res!503235 () Bool)

(assert (=> start!65482 (=> (not res!503235) (not e!416866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65482 (= res!503235 (validMask!0 mask!3328))))

(assert (=> start!65482 e!416866))

(assert (=> start!65482 true))

(declare-fun array_inv!15737 (array!41655) Bool)

(assert (=> start!65482 (array_inv!15737 a!3186)))

(declare-fun b!746482 () Bool)

(declare-fun res!503244 () Bool)

(assert (=> b!746482 (=> (not res!503244) (not e!416865))))

(assert (=> b!746482 (= res!503244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746483 () Bool)

(assert (=> b!746483 (= e!416866 e!416865)))

(declare-fun res!503246 () Bool)

(assert (=> b!746483 (=> (not res!503246) (not e!416865))))

(declare-fun lt!331745 () SeekEntryResult!7541)

(assert (=> b!746483 (= res!503246 (or (= lt!331745 (MissingZero!7541 i!1173)) (= lt!331745 (MissingVacant!7541 i!1173))))))

(assert (=> b!746483 (= lt!331745 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746484 () Bool)

(declare-fun e!416862 () Bool)

(assert (=> b!746484 (= e!416867 e!416862)))

(declare-fun res!503242 () Bool)

(assert (=> b!746484 (=> res!503242 e!416862)))

(declare-fun lt!331739 () SeekEntryResult!7541)

(assert (=> b!746484 (= res!503242 (or (not (= lt!331739 lt!331737)) (= (select (store (arr!19941 a!3186) i!1173 k!2102) index!1321) lt!331744) (not (= (select (store (arr!19941 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746484 (= lt!331739 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19941 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746485 () Bool)

(declare-fun res!503238 () Bool)

(assert (=> b!746485 (=> (not res!503238) (not e!416865))))

(assert (=> b!746485 (= res!503238 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20362 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20362 a!3186))))))

(declare-fun b!746486 () Bool)

(declare-fun res!503234 () Bool)

(assert (=> b!746486 (=> (not res!503234) (not e!416865))))

(declare-datatypes ((List!13943 0))(
  ( (Nil!13940) (Cons!13939 (h!15011 (_ BitVec 64)) (t!20258 List!13943)) )
))
(declare-fun arrayNoDuplicates!0 (array!41655 (_ BitVec 32) List!13943) Bool)

(assert (=> b!746486 (= res!503234 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13940))))

(declare-fun b!746487 () Bool)

(assert (=> b!746487 (= e!416862 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!746487 (= lt!331738 lt!331739)))

(declare-fun b!746488 () Bool)

(declare-fun res!503243 () Bool)

(assert (=> b!746488 (=> (not res!503243) (not e!416864))))

(assert (=> b!746488 (= res!503243 e!416861)))

(declare-fun c!82000 () Bool)

(assert (=> b!746488 (= c!82000 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746489 () Bool)

(declare-fun res!503241 () Bool)

(assert (=> b!746489 (=> (not res!503241) (not e!416864))))

(assert (=> b!746489 (= res!503241 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19941 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746490 () Bool)

(assert (=> b!746490 (= e!416863 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19941 a!3186) j!159) a!3186 mask!3328) lt!331737))))

(assert (= (and start!65482 res!503235) b!746477))

(assert (= (and b!746477 res!503239) b!746479))

(assert (= (and b!746479 res!503247) b!746474))

(assert (= (and b!746474 res!503245) b!746473))

(assert (= (and b!746473 res!503236) b!746483))

(assert (= (and b!746483 res!503246) b!746482))

(assert (= (and b!746482 res!503244) b!746486))

(assert (= (and b!746486 res!503234) b!746485))

(assert (= (and b!746485 res!503238) b!746478))

(assert (= (and b!746478 res!503248) b!746489))

(assert (= (and b!746489 res!503241) b!746488))

(assert (= (and b!746488 c!82000) b!746476))

(assert (= (and b!746488 (not c!82000)) b!746481))

(assert (= (and b!746488 res!503243) b!746475))

(assert (= (and b!746475 res!503249) b!746480))

(assert (= (and b!746480 res!503237) b!746490))

(assert (= (and b!746480 (not res!503240)) b!746484))

(assert (= (and b!746484 (not res!503242)) b!746487))

(declare-fun m!696727 () Bool)

(assert (=> b!746490 m!696727))

(assert (=> b!746490 m!696727))

(declare-fun m!696729 () Bool)

(assert (=> b!746490 m!696729))

(assert (=> b!746481 m!696727))

(assert (=> b!746481 m!696727))

(declare-fun m!696731 () Bool)

(assert (=> b!746481 m!696731))

(declare-fun m!696733 () Bool)

(assert (=> b!746484 m!696733))

(declare-fun m!696735 () Bool)

(assert (=> b!746484 m!696735))

(assert (=> b!746484 m!696727))

(assert (=> b!746484 m!696727))

(assert (=> b!746484 m!696731))

(declare-fun m!696737 () Bool)

(assert (=> b!746489 m!696737))

(assert (=> b!746480 m!696727))

(assert (=> b!746480 m!696727))

(declare-fun m!696739 () Bool)

(assert (=> b!746480 m!696739))

(declare-fun m!696741 () Bool)

(assert (=> b!746480 m!696741))

(declare-fun m!696743 () Bool)

(assert (=> b!746480 m!696743))

(assert (=> b!746479 m!696727))

(assert (=> b!746479 m!696727))

(declare-fun m!696745 () Bool)

(assert (=> b!746479 m!696745))

(assert (=> b!746478 m!696727))

(assert (=> b!746478 m!696727))

(declare-fun m!696747 () Bool)

(assert (=> b!746478 m!696747))

(assert (=> b!746478 m!696747))

(assert (=> b!746478 m!696727))

(declare-fun m!696749 () Bool)

(assert (=> b!746478 m!696749))

(declare-fun m!696751 () Bool)

(assert (=> b!746482 m!696751))

(declare-fun m!696753 () Bool)

(assert (=> b!746483 m!696753))

(declare-fun m!696755 () Bool)

(assert (=> b!746486 m!696755))

(declare-fun m!696757 () Bool)

(assert (=> b!746473 m!696757))

(declare-fun m!696759 () Bool)

(assert (=> b!746475 m!696759))

(declare-fun m!696761 () Bool)

(assert (=> b!746475 m!696761))

(declare-fun m!696763 () Bool)

(assert (=> b!746475 m!696763))

(assert (=> b!746475 m!696733))

(declare-fun m!696765 () Bool)

(assert (=> b!746475 m!696765))

(assert (=> b!746475 m!696761))

(assert (=> b!746476 m!696727))

(assert (=> b!746476 m!696727))

(declare-fun m!696767 () Bool)

(assert (=> b!746476 m!696767))

(declare-fun m!696769 () Bool)

(assert (=> b!746474 m!696769))

(declare-fun m!696771 () Bool)

(assert (=> start!65482 m!696771))

(declare-fun m!696773 () Bool)

(assert (=> start!65482 m!696773))

(push 1)

(assert (not b!746481))

(assert (not start!65482))

(assert (not b!746484))

(assert (not b!746482))

(assert (not b!746479))

(assert (not b!746474))

(assert (not b!746478))

(assert (not b!746475))

(assert (not b!746483))

(assert (not b!746473))

(assert (not b!746486))

(assert (not b!746480))

(assert (not b!746476))

(assert (not b!746490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

