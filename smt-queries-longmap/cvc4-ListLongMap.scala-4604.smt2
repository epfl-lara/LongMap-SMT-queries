; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64262 () Bool)

(assert start!64262)

(declare-fun res!483373 () Bool)

(declare-fun e!404590 () Bool)

(assert (=> start!64262 (=> (not res!483373) (not e!404590))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64262 (= res!483373 (validMask!0 mask!3328))))

(assert (=> start!64262 e!404590))

(assert (=> start!64262 true))

(declare-datatypes ((array!40843 0))(
  ( (array!40844 (arr!19544 (Array (_ BitVec 32) (_ BitVec 64))) (size!19965 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40843)

(declare-fun array_inv!15340 (array!40843) Bool)

(assert (=> start!64262 (array_inv!15340 a!3186)))

(declare-fun b!721520 () Bool)

(declare-fun res!483372 () Bool)

(assert (=> b!721520 (=> (not res!483372) (not e!404590))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721520 (= res!483372 (validKeyInArray!0 k!2102))))

(declare-fun b!721521 () Bool)

(declare-fun res!483363 () Bool)

(declare-fun e!404591 () Bool)

(assert (=> b!721521 (=> (not res!483363) (not e!404591))))

(declare-fun e!404588 () Bool)

(assert (=> b!721521 (= res!483363 e!404588)))

(declare-fun c!79450 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721521 (= c!79450 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721522 () Bool)

(declare-fun e!404589 () Bool)

(assert (=> b!721522 (= e!404590 e!404589)))

(declare-fun res!483371 () Bool)

(assert (=> b!721522 (=> (not res!483371) (not e!404589))))

(declare-datatypes ((SeekEntryResult!7144 0))(
  ( (MissingZero!7144 (index!30944 (_ BitVec 32))) (Found!7144 (index!30945 (_ BitVec 32))) (Intermediate!7144 (undefined!7956 Bool) (index!30946 (_ BitVec 32)) (x!61953 (_ BitVec 32))) (Undefined!7144) (MissingVacant!7144 (index!30947 (_ BitVec 32))) )
))
(declare-fun lt!320102 () SeekEntryResult!7144)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721522 (= res!483371 (or (= lt!320102 (MissingZero!7144 i!1173)) (= lt!320102 (MissingVacant!7144 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40843 (_ BitVec 32)) SeekEntryResult!7144)

(assert (=> b!721522 (= lt!320102 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721523 () Bool)

(declare-fun res!483366 () Bool)

(assert (=> b!721523 (=> (not res!483366) (not e!404590))))

(declare-fun arrayContainsKey!0 (array!40843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721523 (= res!483366 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721524 () Bool)

(assert (=> b!721524 (= e!404589 e!404591)))

(declare-fun res!483369 () Bool)

(assert (=> b!721524 (=> (not res!483369) (not e!404591))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!320101 () SeekEntryResult!7144)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40843 (_ BitVec 32)) SeekEntryResult!7144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721524 (= res!483369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19544 a!3186) j!159) mask!3328) (select (arr!19544 a!3186) j!159) a!3186 mask!3328) lt!320101))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!721524 (= lt!320101 (Intermediate!7144 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721525 () Bool)

(declare-fun res!483370 () Bool)

(assert (=> b!721525 (=> (not res!483370) (not e!404590))))

(assert (=> b!721525 (= res!483370 (validKeyInArray!0 (select (arr!19544 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721526 () Bool)

(assert (=> b!721526 (= e!404588 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19544 a!3186) j!159) a!3186 mask!3328) lt!320101))))

(declare-fun b!721527 () Bool)

(declare-fun res!483365 () Bool)

(assert (=> b!721527 (=> (not res!483365) (not e!404589))))

(assert (=> b!721527 (= res!483365 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19965 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19965 a!3186))))))

(declare-fun b!721528 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40843 (_ BitVec 32)) SeekEntryResult!7144)

(assert (=> b!721528 (= e!404588 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19544 a!3186) j!159) a!3186 mask!3328) (Found!7144 j!159)))))

(declare-fun b!721529 () Bool)

(declare-fun res!483367 () Bool)

(assert (=> b!721529 (=> (not res!483367) (not e!404591))))

(assert (=> b!721529 (= res!483367 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19544 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721530 () Bool)

(declare-fun res!483374 () Bool)

(assert (=> b!721530 (=> (not res!483374) (not e!404589))))

(declare-datatypes ((List!13546 0))(
  ( (Nil!13543) (Cons!13542 (h!14596 (_ BitVec 64)) (t!19861 List!13546)) )
))
(declare-fun arrayNoDuplicates!0 (array!40843 (_ BitVec 32) List!13546) Bool)

(assert (=> b!721530 (= res!483374 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13543))))

(declare-fun b!721531 () Bool)

(declare-fun res!483364 () Bool)

(assert (=> b!721531 (=> (not res!483364) (not e!404589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40843 (_ BitVec 32)) Bool)

(assert (=> b!721531 (= res!483364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721532 () Bool)

(assert (=> b!721532 (= e!404591 false)))

(declare-fun lt!320100 () (_ BitVec 32))

(assert (=> b!721532 (= lt!320100 (toIndex!0 (select (store (arr!19544 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!721533 () Bool)

(declare-fun res!483368 () Bool)

(assert (=> b!721533 (=> (not res!483368) (not e!404590))))

(assert (=> b!721533 (= res!483368 (and (= (size!19965 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19965 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19965 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64262 res!483373) b!721533))

(assert (= (and b!721533 res!483368) b!721525))

(assert (= (and b!721525 res!483370) b!721520))

(assert (= (and b!721520 res!483372) b!721523))

(assert (= (and b!721523 res!483366) b!721522))

(assert (= (and b!721522 res!483371) b!721531))

(assert (= (and b!721531 res!483364) b!721530))

(assert (= (and b!721530 res!483374) b!721527))

(assert (= (and b!721527 res!483365) b!721524))

(assert (= (and b!721524 res!483369) b!721529))

(assert (= (and b!721529 res!483367) b!721521))

(assert (= (and b!721521 c!79450) b!721526))

(assert (= (and b!721521 (not c!79450)) b!721528))

(assert (= (and b!721521 res!483363) b!721532))

(declare-fun m!676299 () Bool)

(assert (=> b!721520 m!676299))

(declare-fun m!676301 () Bool)

(assert (=> b!721522 m!676301))

(declare-fun m!676303 () Bool)

(assert (=> b!721532 m!676303))

(declare-fun m!676305 () Bool)

(assert (=> b!721532 m!676305))

(assert (=> b!721532 m!676305))

(declare-fun m!676307 () Bool)

(assert (=> b!721532 m!676307))

(declare-fun m!676309 () Bool)

(assert (=> b!721530 m!676309))

(declare-fun m!676311 () Bool)

(assert (=> b!721529 m!676311))

(declare-fun m!676313 () Bool)

(assert (=> b!721531 m!676313))

(declare-fun m!676315 () Bool)

(assert (=> b!721528 m!676315))

(assert (=> b!721528 m!676315))

(declare-fun m!676317 () Bool)

(assert (=> b!721528 m!676317))

(assert (=> b!721526 m!676315))

(assert (=> b!721526 m!676315))

(declare-fun m!676319 () Bool)

(assert (=> b!721526 m!676319))

(declare-fun m!676321 () Bool)

(assert (=> b!721523 m!676321))

(assert (=> b!721524 m!676315))

(assert (=> b!721524 m!676315))

(declare-fun m!676323 () Bool)

(assert (=> b!721524 m!676323))

(assert (=> b!721524 m!676323))

(assert (=> b!721524 m!676315))

(declare-fun m!676325 () Bool)

(assert (=> b!721524 m!676325))

(declare-fun m!676327 () Bool)

(assert (=> start!64262 m!676327))

(declare-fun m!676329 () Bool)

(assert (=> start!64262 m!676329))

(assert (=> b!721525 m!676315))

(assert (=> b!721525 m!676315))

(declare-fun m!676331 () Bool)

(assert (=> b!721525 m!676331))

(push 1)

