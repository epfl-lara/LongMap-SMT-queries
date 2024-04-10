; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64918 () Bool)

(assert start!64918)

(declare-fun b!732582 () Bool)

(declare-fun e!409939 () Bool)

(declare-fun e!409933 () Bool)

(assert (=> b!732582 (= e!409939 e!409933)))

(declare-fun res!492164 () Bool)

(assert (=> b!732582 (=> res!492164 e!409933)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732582 (= res!492164 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324639 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732582 (= lt!324639 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!492157 () Bool)

(declare-fun e!409936 () Bool)

(assert (=> start!64918 (=> (not res!492157) (not e!409936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64918 (= res!492157 (validMask!0 mask!3328))))

(assert (=> start!64918 e!409936))

(assert (=> start!64918 true))

(declare-datatypes ((array!41229 0))(
  ( (array!41230 (arr!19731 (Array (_ BitVec 32) (_ BitVec 64))) (size!20152 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41229)

(declare-fun array_inv!15527 (array!41229) Bool)

(assert (=> start!64918 (array_inv!15527 a!3186)))

(declare-fun b!732583 () Bool)

(declare-fun res!492169 () Bool)

(assert (=> b!732583 (=> (not res!492169) (not e!409936))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732583 (= res!492169 (validKeyInArray!0 (select (arr!19731 a!3186) j!159)))))

(declare-fun b!732584 () Bool)

(declare-fun res!492171 () Bool)

(assert (=> b!732584 (=> (not res!492171) (not e!409936))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732584 (= res!492171 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732585 () Bool)

(declare-fun res!492162 () Bool)

(declare-fun e!409935 () Bool)

(assert (=> b!732585 (=> (not res!492162) (not e!409935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41229 (_ BitVec 32)) Bool)

(assert (=> b!732585 (= res!492162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732586 () Bool)

(declare-fun res!492161 () Bool)

(assert (=> b!732586 (=> (not res!492161) (not e!409936))))

(assert (=> b!732586 (= res!492161 (validKeyInArray!0 k!2102))))

(declare-fun b!732587 () Bool)

(declare-fun e!409938 () Bool)

(assert (=> b!732587 (= e!409938 (not e!409939))))

(declare-fun res!492160 () Bool)

(assert (=> b!732587 (=> res!492160 e!409939)))

(declare-datatypes ((SeekEntryResult!7331 0))(
  ( (MissingZero!7331 (index!31692 (_ BitVec 32))) (Found!7331 (index!31693 (_ BitVec 32))) (Intermediate!7331 (undefined!8143 Bool) (index!31694 (_ BitVec 32)) (x!62689 (_ BitVec 32))) (Undefined!7331) (MissingVacant!7331 (index!31695 (_ BitVec 32))) )
))
(declare-fun lt!324641 () SeekEntryResult!7331)

(assert (=> b!732587 (= res!492160 (or (not (is-Intermediate!7331 lt!324641)) (bvsge x!1131 (x!62689 lt!324641))))))

(declare-fun e!409937 () Bool)

(assert (=> b!732587 e!409937))

(declare-fun res!492168 () Bool)

(assert (=> b!732587 (=> (not res!492168) (not e!409937))))

(assert (=> b!732587 (= res!492168 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24980 0))(
  ( (Unit!24981) )
))
(declare-fun lt!324642 () Unit!24980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24980)

(assert (=> b!732587 (= lt!324642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732588 () Bool)

(declare-fun res!492159 () Bool)

(declare-fun e!409931 () Bool)

(assert (=> b!732588 (=> (not res!492159) (not e!409931))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732588 (= res!492159 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19731 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732589 () Bool)

(assert (=> b!732589 (= e!409933 true)))

(declare-fun lt!324646 () SeekEntryResult!7331)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41229 (_ BitVec 32)) SeekEntryResult!7331)

(assert (=> b!732589 (= lt!324646 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19731 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732590 () Bool)

(declare-fun e!409940 () Bool)

(assert (=> b!732590 (= e!409937 e!409940)))

(declare-fun res!492170 () Bool)

(assert (=> b!732590 (=> (not res!492170) (not e!409940))))

(declare-fun lt!324644 () SeekEntryResult!7331)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41229 (_ BitVec 32)) SeekEntryResult!7331)

(assert (=> b!732590 (= res!492170 (= (seekEntryOrOpen!0 (select (arr!19731 a!3186) j!159) a!3186 mask!3328) lt!324644))))

(assert (=> b!732590 (= lt!324644 (Found!7331 j!159))))

(declare-fun b!732591 () Bool)

(assert (=> b!732591 (= e!409936 e!409935)))

(declare-fun res!492173 () Bool)

(assert (=> b!732591 (=> (not res!492173) (not e!409935))))

(declare-fun lt!324647 () SeekEntryResult!7331)

(assert (=> b!732591 (= res!492173 (or (= lt!324647 (MissingZero!7331 i!1173)) (= lt!324647 (MissingVacant!7331 i!1173))))))

(assert (=> b!732591 (= lt!324647 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!732592 () Bool)

(declare-fun res!492163 () Bool)

(assert (=> b!732592 (=> (not res!492163) (not e!409931))))

(declare-fun e!409932 () Bool)

(assert (=> b!732592 (= res!492163 e!409932)))

(declare-fun c!80590 () Bool)

(assert (=> b!732592 (= c!80590 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732593 () Bool)

(declare-fun res!492158 () Bool)

(assert (=> b!732593 (=> (not res!492158) (not e!409935))))

(declare-datatypes ((List!13733 0))(
  ( (Nil!13730) (Cons!13729 (h!14795 (_ BitVec 64)) (t!20048 List!13733)) )
))
(declare-fun arrayNoDuplicates!0 (array!41229 (_ BitVec 32) List!13733) Bool)

(assert (=> b!732593 (= res!492158 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13730))))

(declare-fun b!732594 () Bool)

(assert (=> b!732594 (= e!409935 e!409931)))

(declare-fun res!492172 () Bool)

(assert (=> b!732594 (=> (not res!492172) (not e!409931))))

(declare-fun lt!324643 () SeekEntryResult!7331)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41229 (_ BitVec 32)) SeekEntryResult!7331)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732594 (= res!492172 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19731 a!3186) j!159) mask!3328) (select (arr!19731 a!3186) j!159) a!3186 mask!3328) lt!324643))))

(assert (=> b!732594 (= lt!324643 (Intermediate!7331 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732595 () Bool)

(assert (=> b!732595 (= e!409932 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19731 a!3186) j!159) a!3186 mask!3328) (Found!7331 j!159)))))

(declare-fun b!732596 () Bool)

(assert (=> b!732596 (= e!409932 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19731 a!3186) j!159) a!3186 mask!3328) lt!324643))))

(declare-fun b!732597 () Bool)

(assert (=> b!732597 (= e!409931 e!409938)))

(declare-fun res!492165 () Bool)

(assert (=> b!732597 (=> (not res!492165) (not e!409938))))

(declare-fun lt!324645 () SeekEntryResult!7331)

(assert (=> b!732597 (= res!492165 (= lt!324645 lt!324641))))

(declare-fun lt!324640 () (_ BitVec 64))

(declare-fun lt!324638 () array!41229)

(assert (=> b!732597 (= lt!324641 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324640 lt!324638 mask!3328))))

(assert (=> b!732597 (= lt!324645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324640 mask!3328) lt!324640 lt!324638 mask!3328))))

(assert (=> b!732597 (= lt!324640 (select (store (arr!19731 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!732597 (= lt!324638 (array!41230 (store (arr!19731 a!3186) i!1173 k!2102) (size!20152 a!3186)))))

(declare-fun b!732598 () Bool)

(assert (=> b!732598 (= e!409940 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19731 a!3186) j!159) a!3186 mask!3328) lt!324644))))

(declare-fun b!732599 () Bool)

(declare-fun res!492166 () Bool)

(assert (=> b!732599 (=> (not res!492166) (not e!409935))))

(assert (=> b!732599 (= res!492166 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20152 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20152 a!3186))))))

(declare-fun b!732600 () Bool)

(declare-fun res!492167 () Bool)

(assert (=> b!732600 (=> (not res!492167) (not e!409936))))

(assert (=> b!732600 (= res!492167 (and (= (size!20152 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20152 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20152 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64918 res!492157) b!732600))

(assert (= (and b!732600 res!492167) b!732583))

(assert (= (and b!732583 res!492169) b!732586))

(assert (= (and b!732586 res!492161) b!732584))

(assert (= (and b!732584 res!492171) b!732591))

(assert (= (and b!732591 res!492173) b!732585))

(assert (= (and b!732585 res!492162) b!732593))

(assert (= (and b!732593 res!492158) b!732599))

(assert (= (and b!732599 res!492166) b!732594))

(assert (= (and b!732594 res!492172) b!732588))

(assert (= (and b!732588 res!492159) b!732592))

(assert (= (and b!732592 c!80590) b!732596))

(assert (= (and b!732592 (not c!80590)) b!732595))

(assert (= (and b!732592 res!492163) b!732597))

(assert (= (and b!732597 res!492165) b!732587))

(assert (= (and b!732587 res!492168) b!732590))

(assert (= (and b!732590 res!492170) b!732598))

(assert (= (and b!732587 (not res!492160)) b!732582))

(assert (= (and b!732582 (not res!492164)) b!732589))

(declare-fun m!685615 () Bool)

(assert (=> b!732590 m!685615))

(assert (=> b!732590 m!685615))

(declare-fun m!685617 () Bool)

(assert (=> b!732590 m!685617))

(declare-fun m!685619 () Bool)

(assert (=> b!732597 m!685619))

(declare-fun m!685621 () Bool)

(assert (=> b!732597 m!685621))

(declare-fun m!685623 () Bool)

(assert (=> b!732597 m!685623))

(assert (=> b!732597 m!685619))

(declare-fun m!685625 () Bool)

(assert (=> b!732597 m!685625))

(declare-fun m!685627 () Bool)

(assert (=> b!732597 m!685627))

(declare-fun m!685629 () Bool)

(assert (=> b!732593 m!685629))

(assert (=> b!732594 m!685615))

(assert (=> b!732594 m!685615))

(declare-fun m!685631 () Bool)

(assert (=> b!732594 m!685631))

(assert (=> b!732594 m!685631))

(assert (=> b!732594 m!685615))

(declare-fun m!685633 () Bool)

(assert (=> b!732594 m!685633))

(declare-fun m!685635 () Bool)

(assert (=> b!732584 m!685635))

(declare-fun m!685637 () Bool)

(assert (=> b!732587 m!685637))

(declare-fun m!685639 () Bool)

(assert (=> b!732587 m!685639))

(declare-fun m!685641 () Bool)

(assert (=> b!732586 m!685641))

(assert (=> b!732595 m!685615))

(assert (=> b!732595 m!685615))

(declare-fun m!685643 () Bool)

(assert (=> b!732595 m!685643))

(assert (=> b!732589 m!685615))

(assert (=> b!732589 m!685615))

(assert (=> b!732589 m!685643))

(assert (=> b!732598 m!685615))

(assert (=> b!732598 m!685615))

(declare-fun m!685645 () Bool)

(assert (=> b!732598 m!685645))

(declare-fun m!685647 () Bool)

(assert (=> b!732591 m!685647))

(assert (=> b!732596 m!685615))

(assert (=> b!732596 m!685615))

(declare-fun m!685649 () Bool)

(assert (=> b!732596 m!685649))

(assert (=> b!732583 m!685615))

(assert (=> b!732583 m!685615))

(declare-fun m!685651 () Bool)

(assert (=> b!732583 m!685651))

(declare-fun m!685653 () Bool)

(assert (=> b!732588 m!685653))

(declare-fun m!685655 () Bool)

(assert (=> start!64918 m!685655))

(declare-fun m!685657 () Bool)

(assert (=> start!64918 m!685657))

(declare-fun m!685659 () Bool)

(assert (=> b!732585 m!685659))

(declare-fun m!685661 () Bool)

(assert (=> b!732582 m!685661))

(push 1)

