; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64270 () Bool)

(assert start!64270)

(declare-fun b!721695 () Bool)

(declare-fun res!483521 () Bool)

(declare-fun e!404657 () Bool)

(assert (=> b!721695 (=> (not res!483521) (not e!404657))))

(declare-datatypes ((array!40851 0))(
  ( (array!40852 (arr!19548 (Array (_ BitVec 32) (_ BitVec 64))) (size!19969 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40851)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721695 (= res!483521 (validKeyInArray!0 (select (arr!19548 a!3186) j!159)))))

(declare-fun b!721696 () Bool)

(declare-fun res!483515 () Bool)

(assert (=> b!721696 (=> (not res!483515) (not e!404657))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!721696 (= res!483515 (validKeyInArray!0 k!2102))))

(declare-fun b!721697 () Bool)

(declare-fun res!483517 () Bool)

(declare-fun e!404656 () Bool)

(assert (=> b!721697 (=> (not res!483517) (not e!404656))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721697 (= res!483517 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19548 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721698 () Bool)

(declare-fun res!483523 () Bool)

(assert (=> b!721698 (=> (not res!483523) (not e!404657))))

(declare-fun arrayContainsKey!0 (array!40851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721698 (= res!483523 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!483516 () Bool)

(assert (=> start!64270 (=> (not res!483516) (not e!404657))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64270 (= res!483516 (validMask!0 mask!3328))))

(assert (=> start!64270 e!404657))

(assert (=> start!64270 true))

(declare-fun array_inv!15344 (array!40851) Bool)

(assert (=> start!64270 (array_inv!15344 a!3186)))

(declare-fun b!721699 () Bool)

(declare-fun res!483514 () Bool)

(assert (=> b!721699 (=> (not res!483514) (not e!404657))))

(assert (=> b!721699 (= res!483514 (and (= (size!19969 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19969 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19969 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!404660 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721700 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7148 0))(
  ( (MissingZero!7148 (index!30960 (_ BitVec 32))) (Found!7148 (index!30961 (_ BitVec 32))) (Intermediate!7148 (undefined!7960 Bool) (index!30962 (_ BitVec 32)) (x!61973 (_ BitVec 32))) (Undefined!7148) (MissingVacant!7148 (index!30963 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40851 (_ BitVec 32)) SeekEntryResult!7148)

(assert (=> b!721700 (= e!404660 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19548 a!3186) j!159) a!3186 mask!3328) (Found!7148 j!159))))))

(declare-fun b!721701 () Bool)

(declare-fun e!404659 () Bool)

(assert (=> b!721701 (= e!404657 e!404659)))

(declare-fun res!483519 () Bool)

(assert (=> b!721701 (=> (not res!483519) (not e!404659))))

(declare-fun lt!320136 () SeekEntryResult!7148)

(assert (=> b!721701 (= res!483519 (or (= lt!320136 (MissingZero!7148 i!1173)) (= lt!320136 (MissingVacant!7148 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40851 (_ BitVec 32)) SeekEntryResult!7148)

(assert (=> b!721701 (= lt!320136 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721702 () Bool)

(declare-fun res!483518 () Bool)

(assert (=> b!721702 (=> (not res!483518) (not e!404659))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721702 (= res!483518 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19969 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19969 a!3186))))))

(declare-fun b!721703 () Bool)

(declare-fun res!483524 () Bool)

(assert (=> b!721703 (=> (not res!483524) (not e!404659))))

(declare-datatypes ((List!13550 0))(
  ( (Nil!13547) (Cons!13546 (h!14600 (_ BitVec 64)) (t!19865 List!13550)) )
))
(declare-fun arrayNoDuplicates!0 (array!40851 (_ BitVec 32) List!13550) Bool)

(assert (=> b!721703 (= res!483524 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13547))))

(declare-fun b!721704 () Bool)

(assert (=> b!721704 (= e!404656 false)))

(declare-fun lt!320137 () Bool)

(assert (=> b!721704 (= lt!320137 e!404660)))

(declare-fun c!79462 () Bool)

(assert (=> b!721704 (= c!79462 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721705 () Bool)

(declare-fun res!483522 () Bool)

(assert (=> b!721705 (=> (not res!483522) (not e!404659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40851 (_ BitVec 32)) Bool)

(assert (=> b!721705 (= res!483522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721706 () Bool)

(assert (=> b!721706 (= e!404659 e!404656)))

(declare-fun res!483520 () Bool)

(assert (=> b!721706 (=> (not res!483520) (not e!404656))))

(declare-fun lt!320138 () SeekEntryResult!7148)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40851 (_ BitVec 32)) SeekEntryResult!7148)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721706 (= res!483520 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19548 a!3186) j!159) mask!3328) (select (arr!19548 a!3186) j!159) a!3186 mask!3328) lt!320138))))

(assert (=> b!721706 (= lt!320138 (Intermediate!7148 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721707 () Bool)

(assert (=> b!721707 (= e!404660 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19548 a!3186) j!159) a!3186 mask!3328) lt!320138)))))

(assert (= (and start!64270 res!483516) b!721699))

(assert (= (and b!721699 res!483514) b!721695))

(assert (= (and b!721695 res!483521) b!721696))

(assert (= (and b!721696 res!483515) b!721698))

(assert (= (and b!721698 res!483523) b!721701))

(assert (= (and b!721701 res!483519) b!721705))

(assert (= (and b!721705 res!483522) b!721703))

(assert (= (and b!721703 res!483524) b!721702))

(assert (= (and b!721702 res!483518) b!721706))

(assert (= (and b!721706 res!483520) b!721697))

(assert (= (and b!721697 res!483517) b!721704))

(assert (= (and b!721704 c!79462) b!721707))

(assert (= (and b!721704 (not c!79462)) b!721700))

(declare-fun m!676441 () Bool)

(assert (=> b!721703 m!676441))

(declare-fun m!676443 () Bool)

(assert (=> b!721705 m!676443))

(declare-fun m!676445 () Bool)

(assert (=> start!64270 m!676445))

(declare-fun m!676447 () Bool)

(assert (=> start!64270 m!676447))

(declare-fun m!676449 () Bool)

(assert (=> b!721698 m!676449))

(declare-fun m!676451 () Bool)

(assert (=> b!721696 m!676451))

(declare-fun m!676453 () Bool)

(assert (=> b!721695 m!676453))

(assert (=> b!721695 m!676453))

(declare-fun m!676455 () Bool)

(assert (=> b!721695 m!676455))

(assert (=> b!721706 m!676453))

(assert (=> b!721706 m!676453))

(declare-fun m!676457 () Bool)

(assert (=> b!721706 m!676457))

(assert (=> b!721706 m!676457))

(assert (=> b!721706 m!676453))

(declare-fun m!676459 () Bool)

(assert (=> b!721706 m!676459))

(declare-fun m!676461 () Bool)

(assert (=> b!721697 m!676461))

(assert (=> b!721700 m!676453))

(assert (=> b!721700 m!676453))

(declare-fun m!676463 () Bool)

(assert (=> b!721700 m!676463))

(assert (=> b!721707 m!676453))

(assert (=> b!721707 m!676453))

(declare-fun m!676465 () Bool)

(assert (=> b!721707 m!676465))

(declare-fun m!676467 () Bool)

(assert (=> b!721701 m!676467))

(push 1)

