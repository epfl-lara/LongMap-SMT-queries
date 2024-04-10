; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64258 () Bool)

(assert start!64258)

(declare-fun b!721436 () Bool)

(declare-fun e!404561 () Bool)

(assert (=> b!721436 (= e!404561 false)))

(declare-datatypes ((array!40839 0))(
  ( (array!40840 (arr!19542 (Array (_ BitVec 32) (_ BitVec 64))) (size!19963 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40839)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!320083 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721436 (= lt!320083 (toIndex!0 (select (store (arr!19542 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!721437 () Bool)

(declare-fun res!483297 () Bool)

(declare-fun e!404560 () Bool)

(assert (=> b!721437 (=> (not res!483297) (not e!404560))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721437 (= res!483297 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19963 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19963 a!3186))))))

(declare-fun b!721438 () Bool)

(declare-fun res!483292 () Bool)

(declare-fun e!404557 () Bool)

(assert (=> b!721438 (=> (not res!483292) (not e!404557))))

(declare-fun arrayContainsKey!0 (array!40839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721438 (= res!483292 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721439 () Bool)

(declare-fun res!483302 () Bool)

(assert (=> b!721439 (=> (not res!483302) (not e!404560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40839 (_ BitVec 32)) Bool)

(assert (=> b!721439 (= res!483302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!483296 () Bool)

(assert (=> start!64258 (=> (not res!483296) (not e!404557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64258 (= res!483296 (validMask!0 mask!3328))))

(assert (=> start!64258 e!404557))

(assert (=> start!64258 true))

(declare-fun array_inv!15338 (array!40839) Bool)

(assert (=> start!64258 (array_inv!15338 a!3186)))

(declare-fun b!721440 () Bool)

(assert (=> b!721440 (= e!404560 e!404561)))

(declare-fun res!483293 () Bool)

(assert (=> b!721440 (=> (not res!483293) (not e!404561))))

(declare-datatypes ((SeekEntryResult!7142 0))(
  ( (MissingZero!7142 (index!30936 (_ BitVec 32))) (Found!7142 (index!30937 (_ BitVec 32))) (Intermediate!7142 (undefined!7954 Bool) (index!30938 (_ BitVec 32)) (x!61951 (_ BitVec 32))) (Undefined!7142) (MissingVacant!7142 (index!30939 (_ BitVec 32))) )
))
(declare-fun lt!320082 () SeekEntryResult!7142)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40839 (_ BitVec 32)) SeekEntryResult!7142)

(assert (=> b!721440 (= res!483293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19542 a!3186) j!159) mask!3328) (select (arr!19542 a!3186) j!159) a!3186 mask!3328) lt!320082))))

(assert (=> b!721440 (= lt!320082 (Intermediate!7142 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721441 () Bool)

(declare-fun res!483299 () Bool)

(assert (=> b!721441 (=> (not res!483299) (not e!404557))))

(assert (=> b!721441 (= res!483299 (and (= (size!19963 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19963 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19963 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721442 () Bool)

(declare-fun res!483295 () Bool)

(assert (=> b!721442 (=> (not res!483295) (not e!404557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721442 (= res!483295 (validKeyInArray!0 (select (arr!19542 a!3186) j!159)))))

(declare-fun b!721443 () Bool)

(declare-fun res!483291 () Bool)

(assert (=> b!721443 (=> (not res!483291) (not e!404557))))

(assert (=> b!721443 (= res!483291 (validKeyInArray!0 k!2102))))

(declare-fun e!404559 () Bool)

(declare-fun b!721444 () Bool)

(assert (=> b!721444 (= e!404559 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19542 a!3186) j!159) a!3186 mask!3328) lt!320082))))

(declare-fun b!721445 () Bool)

(declare-fun res!483301 () Bool)

(assert (=> b!721445 (=> (not res!483301) (not e!404561))))

(assert (=> b!721445 (= res!483301 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19542 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721446 () Bool)

(declare-fun res!483294 () Bool)

(assert (=> b!721446 (=> (not res!483294) (not e!404560))))

(declare-datatypes ((List!13544 0))(
  ( (Nil!13541) (Cons!13540 (h!14594 (_ BitVec 64)) (t!19859 List!13544)) )
))
(declare-fun arrayNoDuplicates!0 (array!40839 (_ BitVec 32) List!13544) Bool)

(assert (=> b!721446 (= res!483294 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13541))))

(declare-fun b!721447 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40839 (_ BitVec 32)) SeekEntryResult!7142)

(assert (=> b!721447 (= e!404559 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19542 a!3186) j!159) a!3186 mask!3328) (Found!7142 j!159)))))

(declare-fun b!721448 () Bool)

(assert (=> b!721448 (= e!404557 e!404560)))

(declare-fun res!483298 () Bool)

(assert (=> b!721448 (=> (not res!483298) (not e!404560))))

(declare-fun lt!320084 () SeekEntryResult!7142)

(assert (=> b!721448 (= res!483298 (or (= lt!320084 (MissingZero!7142 i!1173)) (= lt!320084 (MissingVacant!7142 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40839 (_ BitVec 32)) SeekEntryResult!7142)

(assert (=> b!721448 (= lt!320084 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721449 () Bool)

(declare-fun res!483300 () Bool)

(assert (=> b!721449 (=> (not res!483300) (not e!404561))))

(assert (=> b!721449 (= res!483300 e!404559)))

(declare-fun c!79444 () Bool)

(assert (=> b!721449 (= c!79444 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64258 res!483296) b!721441))

(assert (= (and b!721441 res!483299) b!721442))

(assert (= (and b!721442 res!483295) b!721443))

(assert (= (and b!721443 res!483291) b!721438))

(assert (= (and b!721438 res!483292) b!721448))

(assert (= (and b!721448 res!483298) b!721439))

(assert (= (and b!721439 res!483302) b!721446))

(assert (= (and b!721446 res!483294) b!721437))

(assert (= (and b!721437 res!483297) b!721440))

(assert (= (and b!721440 res!483293) b!721445))

(assert (= (and b!721445 res!483301) b!721449))

(assert (= (and b!721449 c!79444) b!721444))

(assert (= (and b!721449 (not c!79444)) b!721447))

(assert (= (and b!721449 res!483300) b!721436))

(declare-fun m!676231 () Bool)

(assert (=> b!721438 m!676231))

(declare-fun m!676233 () Bool)

(assert (=> b!721446 m!676233))

(declare-fun m!676235 () Bool)

(assert (=> b!721442 m!676235))

(assert (=> b!721442 m!676235))

(declare-fun m!676237 () Bool)

(assert (=> b!721442 m!676237))

(declare-fun m!676239 () Bool)

(assert (=> b!721448 m!676239))

(declare-fun m!676241 () Bool)

(assert (=> b!721443 m!676241))

(declare-fun m!676243 () Bool)

(assert (=> b!721436 m!676243))

(declare-fun m!676245 () Bool)

(assert (=> b!721436 m!676245))

(assert (=> b!721436 m!676245))

(declare-fun m!676247 () Bool)

(assert (=> b!721436 m!676247))

(assert (=> b!721444 m!676235))

(assert (=> b!721444 m!676235))

(declare-fun m!676249 () Bool)

(assert (=> b!721444 m!676249))

(assert (=> b!721447 m!676235))

(assert (=> b!721447 m!676235))

(declare-fun m!676251 () Bool)

(assert (=> b!721447 m!676251))

(assert (=> b!721440 m!676235))

(assert (=> b!721440 m!676235))

(declare-fun m!676253 () Bool)

(assert (=> b!721440 m!676253))

(assert (=> b!721440 m!676253))

(assert (=> b!721440 m!676235))

(declare-fun m!676255 () Bool)

(assert (=> b!721440 m!676255))

(declare-fun m!676257 () Bool)

(assert (=> b!721439 m!676257))

(declare-fun m!676259 () Bool)

(assert (=> b!721445 m!676259))

(declare-fun m!676261 () Bool)

(assert (=> start!64258 m!676261))

(declare-fun m!676263 () Bool)

(assert (=> start!64258 m!676263))

(push 1)

