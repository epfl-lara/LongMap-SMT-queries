; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64274 () Bool)

(assert start!64274)

(declare-fun b!721773 () Bool)

(declare-fun res!483589 () Bool)

(declare-fun e!404689 () Bool)

(assert (=> b!721773 (=> (not res!483589) (not e!404689))))

(declare-datatypes ((array!40855 0))(
  ( (array!40856 (arr!19550 (Array (_ BitVec 32) (_ BitVec 64))) (size!19971 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40855)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!721773 (= res!483589 (and (= (size!19971 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19971 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19971 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721774 () Bool)

(declare-fun res!483587 () Bool)

(assert (=> b!721774 (=> (not res!483587) (not e!404689))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721774 (= res!483587 (validKeyInArray!0 k!2102))))

(declare-fun res!483583 () Bool)

(assert (=> start!64274 (=> (not res!483583) (not e!404689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64274 (= res!483583 (validMask!0 mask!3328))))

(assert (=> start!64274 e!404689))

(assert (=> start!64274 true))

(declare-fun array_inv!15346 (array!40855) Bool)

(assert (=> start!64274 (array_inv!15346 a!3186)))

(declare-fun b!721775 () Bool)

(declare-fun res!483581 () Bool)

(declare-fun e!404688 () Bool)

(assert (=> b!721775 (=> (not res!483581) (not e!404688))))

(declare-datatypes ((List!13552 0))(
  ( (Nil!13549) (Cons!13548 (h!14602 (_ BitVec 64)) (t!19867 List!13552)) )
))
(declare-fun arrayNoDuplicates!0 (array!40855 (_ BitVec 32) List!13552) Bool)

(assert (=> b!721775 (= res!483581 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13549))))

(declare-fun b!721776 () Bool)

(declare-fun e!404690 () Bool)

(assert (=> b!721776 (= e!404688 e!404690)))

(declare-fun res!483590 () Bool)

(assert (=> b!721776 (=> (not res!483590) (not e!404690))))

(declare-datatypes ((SeekEntryResult!7150 0))(
  ( (MissingZero!7150 (index!30968 (_ BitVec 32))) (Found!7150 (index!30969 (_ BitVec 32))) (Intermediate!7150 (undefined!7962 Bool) (index!30970 (_ BitVec 32)) (x!61975 (_ BitVec 32))) (Undefined!7150) (MissingVacant!7150 (index!30971 (_ BitVec 32))) )
))
(declare-fun lt!320155 () SeekEntryResult!7150)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40855 (_ BitVec 32)) SeekEntryResult!7150)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721776 (= res!483590 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19550 a!3186) j!159) mask!3328) (select (arr!19550 a!3186) j!159) a!3186 mask!3328) lt!320155))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721776 (= lt!320155 (Intermediate!7150 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721777 () Bool)

(declare-fun res!483584 () Bool)

(assert (=> b!721777 (=> (not res!483584) (not e!404688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40855 (_ BitVec 32)) Bool)

(assert (=> b!721777 (= res!483584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721778 () Bool)

(assert (=> b!721778 (= e!404689 e!404688)))

(declare-fun res!483582 () Bool)

(assert (=> b!721778 (=> (not res!483582) (not e!404688))))

(declare-fun lt!320156 () SeekEntryResult!7150)

(assert (=> b!721778 (= res!483582 (or (= lt!320156 (MissingZero!7150 i!1173)) (= lt!320156 (MissingVacant!7150 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40855 (_ BitVec 32)) SeekEntryResult!7150)

(assert (=> b!721778 (= lt!320156 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721779 () Bool)

(declare-fun res!483580 () Bool)

(assert (=> b!721779 (=> (not res!483580) (not e!404688))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!721779 (= res!483580 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19971 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19971 a!3186))))))

(declare-fun b!721780 () Bool)

(assert (=> b!721780 (= e!404690 false)))

(declare-fun lt!320154 () Bool)

(declare-fun e!404687 () Bool)

(assert (=> b!721780 (= lt!320154 e!404687)))

(declare-fun c!79468 () Bool)

(assert (=> b!721780 (= c!79468 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721781 () Bool)

(assert (=> b!721781 (= e!404687 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19550 a!3186) j!159) a!3186 mask!3328) lt!320155)))))

(declare-fun b!721782 () Bool)

(declare-fun res!483585 () Bool)

(assert (=> b!721782 (=> (not res!483585) (not e!404689))))

(declare-fun arrayContainsKey!0 (array!40855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721782 (= res!483585 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721783 () Bool)

(declare-fun res!483588 () Bool)

(assert (=> b!721783 (=> (not res!483588) (not e!404690))))

(assert (=> b!721783 (= res!483588 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19550 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721784 () Bool)

(declare-fun res!483586 () Bool)

(assert (=> b!721784 (=> (not res!483586) (not e!404689))))

(assert (=> b!721784 (= res!483586 (validKeyInArray!0 (select (arr!19550 a!3186) j!159)))))

(declare-fun b!721785 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40855 (_ BitVec 32)) SeekEntryResult!7150)

(assert (=> b!721785 (= e!404687 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19550 a!3186) j!159) a!3186 mask!3328) (Found!7150 j!159))))))

(assert (= (and start!64274 res!483583) b!721773))

(assert (= (and b!721773 res!483589) b!721784))

(assert (= (and b!721784 res!483586) b!721774))

(assert (= (and b!721774 res!483587) b!721782))

(assert (= (and b!721782 res!483585) b!721778))

(assert (= (and b!721778 res!483582) b!721777))

(assert (= (and b!721777 res!483584) b!721775))

(assert (= (and b!721775 res!483581) b!721779))

(assert (= (and b!721779 res!483580) b!721776))

(assert (= (and b!721776 res!483590) b!721783))

(assert (= (and b!721783 res!483588) b!721780))

(assert (= (and b!721780 c!79468) b!721781))

(assert (= (and b!721780 (not c!79468)) b!721785))

(declare-fun m!676497 () Bool)

(assert (=> b!721783 m!676497))

(declare-fun m!676499 () Bool)

(assert (=> b!721781 m!676499))

(assert (=> b!721781 m!676499))

(declare-fun m!676501 () Bool)

(assert (=> b!721781 m!676501))

(declare-fun m!676503 () Bool)

(assert (=> b!721782 m!676503))

(declare-fun m!676505 () Bool)

(assert (=> b!721774 m!676505))

(declare-fun m!676507 () Bool)

(assert (=> b!721777 m!676507))

(declare-fun m!676509 () Bool)

(assert (=> start!64274 m!676509))

(declare-fun m!676511 () Bool)

(assert (=> start!64274 m!676511))

(assert (=> b!721785 m!676499))

(assert (=> b!721785 m!676499))

(declare-fun m!676513 () Bool)

(assert (=> b!721785 m!676513))

(assert (=> b!721784 m!676499))

(assert (=> b!721784 m!676499))

(declare-fun m!676515 () Bool)

(assert (=> b!721784 m!676515))

(declare-fun m!676517 () Bool)

(assert (=> b!721775 m!676517))

(declare-fun m!676519 () Bool)

(assert (=> b!721778 m!676519))

(assert (=> b!721776 m!676499))

(assert (=> b!721776 m!676499))

(declare-fun m!676521 () Bool)

(assert (=> b!721776 m!676521))

(assert (=> b!721776 m!676521))

(assert (=> b!721776 m!676499))

(declare-fun m!676523 () Bool)

(assert (=> b!721776 m!676523))

(push 1)

