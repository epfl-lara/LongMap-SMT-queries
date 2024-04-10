; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67170 () Bool)

(assert start!67170)

(declare-fun res!525382 () Bool)

(declare-fun e!432148 () Bool)

(assert (=> start!67170 (=> (not res!525382) (not e!432148))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67170 (= res!525382 (validMask!0 mask!3328))))

(assert (=> start!67170 e!432148))

(assert (=> start!67170 true))

(declare-datatypes ((array!42525 0))(
  ( (array!42526 (arr!20358 (Array (_ BitVec 32) (_ BitVec 64))) (size!20779 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42525)

(declare-fun array_inv!16154 (array!42525) Bool)

(assert (=> start!67170 (array_inv!16154 a!3186)))

(declare-fun b!776596 () Bool)

(declare-fun e!432147 () Bool)

(declare-fun e!432144 () Bool)

(assert (=> b!776596 (= e!432147 (not e!432144))))

(declare-fun res!525392 () Bool)

(assert (=> b!776596 (=> res!525392 e!432144)))

(declare-datatypes ((SeekEntryResult!7958 0))(
  ( (MissingZero!7958 (index!34200 (_ BitVec 32))) (Found!7958 (index!34201 (_ BitVec 32))) (Intermediate!7958 (undefined!8770 Bool) (index!34202 (_ BitVec 32)) (x!65141 (_ BitVec 32))) (Undefined!7958) (MissingVacant!7958 (index!34203 (_ BitVec 32))) )
))
(declare-fun lt!346005 () SeekEntryResult!7958)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!776596 (= res!525392 (or (not (is-Intermediate!7958 lt!346005)) (bvslt x!1131 (x!65141 lt!346005)) (not (= x!1131 (x!65141 lt!346005))) (not (= index!1321 (index!34202 lt!346005)))))))

(declare-fun e!432152 () Bool)

(assert (=> b!776596 e!432152))

(declare-fun res!525394 () Bool)

(assert (=> b!776596 (=> (not res!525394) (not e!432152))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42525 (_ BitVec 32)) Bool)

(assert (=> b!776596 (= res!525394 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26810 0))(
  ( (Unit!26811) )
))
(declare-fun lt!346001 () Unit!26810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26810)

(assert (=> b!776596 (= lt!346001 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776597 () Bool)

(declare-fun res!525391 () Bool)

(declare-fun e!432151 () Bool)

(assert (=> b!776597 (=> (not res!525391) (not e!432151))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776597 (= res!525391 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20779 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20779 a!3186))))))

(declare-fun b!776598 () Bool)

(declare-fun res!525380 () Bool)

(assert (=> b!776598 (=> (not res!525380) (not e!432148))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776598 (= res!525380 (validKeyInArray!0 k!2102))))

(declare-fun b!776599 () Bool)

(declare-fun e!432150 () Bool)

(assert (=> b!776599 (= e!432150 e!432147)))

(declare-fun res!525384 () Bool)

(assert (=> b!776599 (=> (not res!525384) (not e!432147))))

(declare-fun lt!346006 () SeekEntryResult!7958)

(assert (=> b!776599 (= res!525384 (= lt!346006 lt!346005))))

(declare-fun lt!346003 () array!42525)

(declare-fun lt!346000 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42525 (_ BitVec 32)) SeekEntryResult!7958)

(assert (=> b!776599 (= lt!346005 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346000 lt!346003 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776599 (= lt!346006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346000 mask!3328) lt!346000 lt!346003 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776599 (= lt!346000 (select (store (arr!20358 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776599 (= lt!346003 (array!42526 (store (arr!20358 a!3186) i!1173 k!2102) (size!20779 a!3186)))))

(declare-fun e!432145 () Bool)

(declare-fun b!776600 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42525 (_ BitVec 32)) SeekEntryResult!7958)

(assert (=> b!776600 (= e!432145 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20358 a!3186) j!159) a!3186 mask!3328) (Found!7958 j!159)))))

(declare-fun b!776601 () Bool)

(declare-fun res!525389 () Bool)

(assert (=> b!776601 (=> (not res!525389) (not e!432150))))

(assert (=> b!776601 (= res!525389 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20358 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776602 () Bool)

(declare-fun res!525390 () Bool)

(assert (=> b!776602 (=> (not res!525390) (not e!432148))))

(assert (=> b!776602 (= res!525390 (validKeyInArray!0 (select (arr!20358 a!3186) j!159)))))

(declare-fun b!776603 () Bool)

(declare-fun res!525395 () Bool)

(assert (=> b!776603 (=> (not res!525395) (not e!432150))))

(assert (=> b!776603 (= res!525395 e!432145)))

(declare-fun c!86008 () Bool)

(assert (=> b!776603 (= c!86008 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776604 () Bool)

(declare-fun e!432149 () Bool)

(assert (=> b!776604 (= e!432152 e!432149)))

(declare-fun res!525381 () Bool)

(assert (=> b!776604 (=> (not res!525381) (not e!432149))))

(declare-fun lt!346002 () SeekEntryResult!7958)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42525 (_ BitVec 32)) SeekEntryResult!7958)

(assert (=> b!776604 (= res!525381 (= (seekEntryOrOpen!0 (select (arr!20358 a!3186) j!159) a!3186 mask!3328) lt!346002))))

(assert (=> b!776604 (= lt!346002 (Found!7958 j!159))))

(declare-fun b!776605 () Bool)

(declare-fun res!525386 () Bool)

(assert (=> b!776605 (=> (not res!525386) (not e!432151))))

(declare-datatypes ((List!14360 0))(
  ( (Nil!14357) (Cons!14356 (h!15464 (_ BitVec 64)) (t!20675 List!14360)) )
))
(declare-fun arrayNoDuplicates!0 (array!42525 (_ BitVec 32) List!14360) Bool)

(assert (=> b!776605 (= res!525386 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14357))))

(declare-fun b!776606 () Bool)

(declare-fun res!525383 () Bool)

(assert (=> b!776606 (=> (not res!525383) (not e!432151))))

(assert (=> b!776606 (= res!525383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!345999 () SeekEntryResult!7958)

(declare-fun b!776607 () Bool)

(assert (=> b!776607 (= e!432145 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20358 a!3186) j!159) a!3186 mask!3328) lt!345999))))

(declare-fun b!776608 () Bool)

(assert (=> b!776608 (= e!432144 true)))

(declare-fun lt!346007 () SeekEntryResult!7958)

(assert (=> b!776608 (= lt!346007 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20358 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776609 () Bool)

(assert (=> b!776609 (= e!432149 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20358 a!3186) j!159) a!3186 mask!3328) lt!346002))))

(declare-fun b!776610 () Bool)

(assert (=> b!776610 (= e!432148 e!432151)))

(declare-fun res!525387 () Bool)

(assert (=> b!776610 (=> (not res!525387) (not e!432151))))

(declare-fun lt!346004 () SeekEntryResult!7958)

(assert (=> b!776610 (= res!525387 (or (= lt!346004 (MissingZero!7958 i!1173)) (= lt!346004 (MissingVacant!7958 i!1173))))))

(assert (=> b!776610 (= lt!346004 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776611 () Bool)

(assert (=> b!776611 (= e!432151 e!432150)))

(declare-fun res!525385 () Bool)

(assert (=> b!776611 (=> (not res!525385) (not e!432150))))

(assert (=> b!776611 (= res!525385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20358 a!3186) j!159) mask!3328) (select (arr!20358 a!3186) j!159) a!3186 mask!3328) lt!345999))))

(assert (=> b!776611 (= lt!345999 (Intermediate!7958 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776612 () Bool)

(declare-fun res!525393 () Bool)

(assert (=> b!776612 (=> (not res!525393) (not e!432148))))

(declare-fun arrayContainsKey!0 (array!42525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776612 (= res!525393 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776613 () Bool)

(declare-fun res!525388 () Bool)

(assert (=> b!776613 (=> (not res!525388) (not e!432148))))

(assert (=> b!776613 (= res!525388 (and (= (size!20779 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20779 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20779 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67170 res!525382) b!776613))

(assert (= (and b!776613 res!525388) b!776602))

(assert (= (and b!776602 res!525390) b!776598))

(assert (= (and b!776598 res!525380) b!776612))

(assert (= (and b!776612 res!525393) b!776610))

(assert (= (and b!776610 res!525387) b!776606))

(assert (= (and b!776606 res!525383) b!776605))

(assert (= (and b!776605 res!525386) b!776597))

(assert (= (and b!776597 res!525391) b!776611))

(assert (= (and b!776611 res!525385) b!776601))

(assert (= (and b!776601 res!525389) b!776603))

(assert (= (and b!776603 c!86008) b!776607))

(assert (= (and b!776603 (not c!86008)) b!776600))

(assert (= (and b!776603 res!525395) b!776599))

(assert (= (and b!776599 res!525384) b!776596))

(assert (= (and b!776596 res!525394) b!776604))

(assert (= (and b!776604 res!525381) b!776609))

(assert (= (and b!776596 (not res!525392)) b!776608))

(declare-fun m!720653 () Bool)

(assert (=> b!776604 m!720653))

(assert (=> b!776604 m!720653))

(declare-fun m!720655 () Bool)

(assert (=> b!776604 m!720655))

(assert (=> b!776602 m!720653))

(assert (=> b!776602 m!720653))

(declare-fun m!720657 () Bool)

(assert (=> b!776602 m!720657))

(assert (=> b!776609 m!720653))

(assert (=> b!776609 m!720653))

(declare-fun m!720659 () Bool)

(assert (=> b!776609 m!720659))

(declare-fun m!720661 () Bool)

(assert (=> b!776599 m!720661))

(declare-fun m!720663 () Bool)

(assert (=> b!776599 m!720663))

(declare-fun m!720665 () Bool)

(assert (=> b!776599 m!720665))

(declare-fun m!720667 () Bool)

(assert (=> b!776599 m!720667))

(assert (=> b!776599 m!720663))

(declare-fun m!720669 () Bool)

(assert (=> b!776599 m!720669))

(assert (=> b!776611 m!720653))

(assert (=> b!776611 m!720653))

(declare-fun m!720671 () Bool)

(assert (=> b!776611 m!720671))

(assert (=> b!776611 m!720671))

(assert (=> b!776611 m!720653))

(declare-fun m!720673 () Bool)

(assert (=> b!776611 m!720673))

(assert (=> b!776600 m!720653))

(assert (=> b!776600 m!720653))

(declare-fun m!720675 () Bool)

(assert (=> b!776600 m!720675))

(assert (=> b!776607 m!720653))

(assert (=> b!776607 m!720653))

(declare-fun m!720677 () Bool)

(assert (=> b!776607 m!720677))

(declare-fun m!720679 () Bool)

(assert (=> start!67170 m!720679))

(declare-fun m!720681 () Bool)

(assert (=> start!67170 m!720681))

(declare-fun m!720683 () Bool)

(assert (=> b!776606 m!720683))

(declare-fun m!720685 () Bool)

(assert (=> b!776610 m!720685))

(declare-fun m!720687 () Bool)

(assert (=> b!776596 m!720687))

(declare-fun m!720689 () Bool)

(assert (=> b!776596 m!720689))

(declare-fun m!720691 () Bool)

(assert (=> b!776601 m!720691))

(declare-fun m!720693 () Bool)

(assert (=> b!776605 m!720693))

(declare-fun m!720695 () Bool)

(assert (=> b!776598 m!720695))

(assert (=> b!776608 m!720653))

(assert (=> b!776608 m!720653))

(assert (=> b!776608 m!720675))

(declare-fun m!720697 () Bool)

(assert (=> b!776612 m!720697))

(push 1)

