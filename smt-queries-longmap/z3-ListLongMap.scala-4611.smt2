; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64362 () Bool)

(assert start!64362)

(declare-fun b!722630 () Bool)

(declare-fun res!484215 () Bool)

(declare-fun e!405108 () Bool)

(assert (=> b!722630 (=> (not res!484215) (not e!405108))))

(declare-fun e!405110 () Bool)

(assert (=> b!722630 (= res!484215 e!405110)))

(declare-fun c!79583 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722630 (= c!79583 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722631 () Bool)

(declare-fun res!484214 () Bool)

(declare-fun e!405107 () Bool)

(assert (=> b!722631 (=> (not res!484214) (not e!405107))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722631 (= res!484214 (validKeyInArray!0 k0!2102))))

(declare-fun b!722632 () Bool)

(declare-fun res!484210 () Bool)

(assert (=> b!722632 (=> (not res!484210) (not e!405107))))

(declare-datatypes ((array!40876 0))(
  ( (array!40877 (arr!19558 (Array (_ BitVec 32) (_ BitVec 64))) (size!19978 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40876)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!722632 (= res!484210 (and (= (size!19978 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19978 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19978 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!484212 () Bool)

(assert (=> start!64362 (=> (not res!484212) (not e!405107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64362 (= res!484212 (validMask!0 mask!3328))))

(assert (=> start!64362 e!405107))

(assert (=> start!64362 true))

(declare-fun array_inv!15417 (array!40876) Bool)

(assert (=> start!64362 (array_inv!15417 a!3186)))

(declare-fun b!722633 () Bool)

(declare-fun res!484220 () Bool)

(declare-fun e!405111 () Bool)

(assert (=> b!722633 (=> (not res!484220) (not e!405111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40876 (_ BitVec 32)) Bool)

(assert (=> b!722633 (= res!484220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722634 () Bool)

(declare-fun res!484216 () Bool)

(assert (=> b!722634 (=> (not res!484216) (not e!405111))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!722634 (= res!484216 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19978 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19978 a!3186))))))

(declare-fun b!722635 () Bool)

(assert (=> b!722635 (= e!405108 (not (validKeyInArray!0 (select (store (arr!19558 a!3186) i!1173 k0!2102) j!159))))))

(declare-fun b!722636 () Bool)

(assert (=> b!722636 (= e!405111 e!405108)))

(declare-fun res!484222 () Bool)

(assert (=> b!722636 (=> (not res!484222) (not e!405108))))

(declare-datatypes ((SeekEntryResult!7114 0))(
  ( (MissingZero!7114 (index!30824 (_ BitVec 32))) (Found!7114 (index!30825 (_ BitVec 32))) (Intermediate!7114 (undefined!7926 Bool) (index!30826 (_ BitVec 32)) (x!61982 (_ BitVec 32))) (Undefined!7114) (MissingVacant!7114 (index!30827 (_ BitVec 32))) )
))
(declare-fun lt!320381 () SeekEntryResult!7114)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40876 (_ BitVec 32)) SeekEntryResult!7114)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722636 (= res!484222 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19558 a!3186) j!159) mask!3328) (select (arr!19558 a!3186) j!159) a!3186 mask!3328) lt!320381))))

(assert (=> b!722636 (= lt!320381 (Intermediate!7114 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722637 () Bool)

(declare-fun res!484219 () Bool)

(assert (=> b!722637 (=> (not res!484219) (not e!405107))))

(assert (=> b!722637 (= res!484219 (validKeyInArray!0 (select (arr!19558 a!3186) j!159)))))

(declare-fun b!722638 () Bool)

(assert (=> b!722638 (= e!405107 e!405111)))

(declare-fun res!484218 () Bool)

(assert (=> b!722638 (=> (not res!484218) (not e!405111))))

(declare-fun lt!320382 () SeekEntryResult!7114)

(assert (=> b!722638 (= res!484218 (or (= lt!320382 (MissingZero!7114 i!1173)) (= lt!320382 (MissingVacant!7114 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40876 (_ BitVec 32)) SeekEntryResult!7114)

(assert (=> b!722638 (= lt!320382 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722639 () Bool)

(declare-fun res!484221 () Bool)

(assert (=> b!722639 (=> (not res!484221) (not e!405108))))

(assert (=> b!722639 (= res!484221 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19558 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722640 () Bool)

(assert (=> b!722640 (= e!405110 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19558 a!3186) j!159) a!3186 mask!3328) lt!320381))))

(declare-fun b!722641 () Bool)

(declare-fun res!484213 () Bool)

(assert (=> b!722641 (=> (not res!484213) (not e!405107))))

(declare-fun arrayContainsKey!0 (array!40876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722641 (= res!484213 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722642 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40876 (_ BitVec 32)) SeekEntryResult!7114)

(assert (=> b!722642 (= e!405110 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19558 a!3186) j!159) a!3186 mask!3328) (Found!7114 j!159)))))

(declare-fun b!722643 () Bool)

(declare-fun res!484217 () Bool)

(assert (=> b!722643 (=> (not res!484217) (not e!405111))))

(declare-datatypes ((List!13467 0))(
  ( (Nil!13464) (Cons!13463 (h!14520 (_ BitVec 64)) (t!19774 List!13467)) )
))
(declare-fun arrayNoDuplicates!0 (array!40876 (_ BitVec 32) List!13467) Bool)

(assert (=> b!722643 (= res!484217 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13464))))

(declare-fun b!722644 () Bool)

(declare-fun res!484211 () Bool)

(assert (=> b!722644 (=> (not res!484211) (not e!405108))))

(assert (=> b!722644 (= res!484211 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (= (and start!64362 res!484212) b!722632))

(assert (= (and b!722632 res!484210) b!722637))

(assert (= (and b!722637 res!484219) b!722631))

(assert (= (and b!722631 res!484214) b!722641))

(assert (= (and b!722641 res!484213) b!722638))

(assert (= (and b!722638 res!484218) b!722633))

(assert (= (and b!722633 res!484220) b!722643))

(assert (= (and b!722643 res!484217) b!722634))

(assert (= (and b!722634 res!484216) b!722636))

(assert (= (and b!722636 res!484222) b!722639))

(assert (= (and b!722639 res!484221) b!722630))

(assert (= (and b!722630 c!79583) b!722640))

(assert (= (and b!722630 (not c!79583)) b!722642))

(assert (= (and b!722630 res!484215) b!722644))

(assert (= (and b!722644 res!484211) b!722635))

(declare-fun m!677709 () Bool)

(assert (=> b!722641 m!677709))

(declare-fun m!677711 () Bool)

(assert (=> b!722639 m!677711))

(declare-fun m!677713 () Bool)

(assert (=> b!722636 m!677713))

(assert (=> b!722636 m!677713))

(declare-fun m!677715 () Bool)

(assert (=> b!722636 m!677715))

(assert (=> b!722636 m!677715))

(assert (=> b!722636 m!677713))

(declare-fun m!677717 () Bool)

(assert (=> b!722636 m!677717))

(declare-fun m!677719 () Bool)

(assert (=> b!722638 m!677719))

(assert (=> b!722637 m!677713))

(assert (=> b!722637 m!677713))

(declare-fun m!677721 () Bool)

(assert (=> b!722637 m!677721))

(assert (=> b!722642 m!677713))

(assert (=> b!722642 m!677713))

(declare-fun m!677723 () Bool)

(assert (=> b!722642 m!677723))

(declare-fun m!677725 () Bool)

(assert (=> b!722633 m!677725))

(assert (=> b!722640 m!677713))

(assert (=> b!722640 m!677713))

(declare-fun m!677727 () Bool)

(assert (=> b!722640 m!677727))

(declare-fun m!677729 () Bool)

(assert (=> b!722643 m!677729))

(declare-fun m!677731 () Bool)

(assert (=> start!64362 m!677731))

(declare-fun m!677733 () Bool)

(assert (=> start!64362 m!677733))

(declare-fun m!677735 () Bool)

(assert (=> b!722635 m!677735))

(declare-fun m!677737 () Bool)

(assert (=> b!722635 m!677737))

(assert (=> b!722635 m!677737))

(declare-fun m!677739 () Bool)

(assert (=> b!722635 m!677739))

(declare-fun m!677741 () Bool)

(assert (=> b!722631 m!677741))

(check-sat (not start!64362) (not b!722636) (not b!722631) (not b!722637) (not b!722640) (not b!722633) (not b!722641) (not b!722638) (not b!722642) (not b!722635) (not b!722643))
(check-sat)
