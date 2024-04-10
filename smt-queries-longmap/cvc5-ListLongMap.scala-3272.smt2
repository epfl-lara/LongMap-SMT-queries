; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45576 () Bool)

(assert start!45576)

(declare-fun b!501616 () Bool)

(declare-fun e!293857 () Bool)

(declare-fun e!293860 () Bool)

(assert (=> b!501616 (= e!293857 e!293860)))

(declare-fun res!303137 () Bool)

(assert (=> b!501616 (=> res!303137 e!293860)))

(declare-datatypes ((SeekEntryResult!4013 0))(
  ( (MissingZero!4013 (index!18240 (_ BitVec 32))) (Found!4013 (index!18241 (_ BitVec 32))) (Intermediate!4013 (undefined!4825 Bool) (index!18242 (_ BitVec 32)) (x!47278 (_ BitVec 32))) (Undefined!4013) (MissingVacant!4013 (index!18243 (_ BitVec 32))) )
))
(declare-fun lt!227846 () SeekEntryResult!4013)

(declare-datatypes ((array!32332 0))(
  ( (array!32333 (arr!15546 (Array (_ BitVec 32) (_ BitVec 64))) (size!15910 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32332)

(declare-fun lt!227848 () (_ BitVec 32))

(assert (=> b!501616 (= res!303137 (or (bvsgt (x!47278 lt!227846) #b01111111111111111111111111111110) (bvslt lt!227848 #b00000000000000000000000000000000) (bvsge lt!227848 (size!15910 a!3235)) (bvslt (index!18242 lt!227846) #b00000000000000000000000000000000) (bvsge (index!18242 lt!227846) (size!15910 a!3235)) (not (= lt!227846 (Intermediate!4013 false (index!18242 lt!227846) (x!47278 lt!227846))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501616 (= (index!18242 lt!227846) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!15128 0))(
  ( (Unit!15129) )
))
(declare-fun lt!227850 () Unit!15128)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32332 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15128)

(assert (=> b!501616 (= lt!227850 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227848 #b00000000000000000000000000000000 (index!18242 lt!227846) (x!47278 lt!227846) mask!3524))))

(assert (=> b!501616 (and (or (= (select (arr!15546 a!3235) (index!18242 lt!227846)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15546 a!3235) (index!18242 lt!227846)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15546 a!3235) (index!18242 lt!227846)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15546 a!3235) (index!18242 lt!227846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227849 () Unit!15128)

(declare-fun e!293863 () Unit!15128)

(assert (=> b!501616 (= lt!227849 e!293863)))

(declare-fun c!59522 () Bool)

(assert (=> b!501616 (= c!59522 (= (select (arr!15546 a!3235) (index!18242 lt!227846)) (select (arr!15546 a!3235) j!176)))))

(assert (=> b!501616 (and (bvslt (x!47278 lt!227846) #b01111111111111111111111111111110) (or (= (select (arr!15546 a!3235) (index!18242 lt!227846)) (select (arr!15546 a!3235) j!176)) (= (select (arr!15546 a!3235) (index!18242 lt!227846)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15546 a!3235) (index!18242 lt!227846)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!293859 () Bool)

(declare-fun b!501618 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32332 (_ BitVec 32)) SeekEntryResult!4013)

(assert (=> b!501618 (= e!293859 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227848 (index!18242 lt!227846) (select (arr!15546 a!3235) j!176) a!3235 mask!3524) (Found!4013 j!176))))))

(declare-fun b!501619 () Bool)

(declare-fun res!303138 () Bool)

(declare-fun e!293858 () Bool)

(assert (=> b!501619 (=> (not res!303138) (not e!293858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501619 (= res!303138 (validKeyInArray!0 (select (arr!15546 a!3235) j!176)))))

(declare-fun b!501620 () Bool)

(declare-fun res!303142 () Bool)

(declare-fun e!293862 () Bool)

(assert (=> b!501620 (=> (not res!303142) (not e!293862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32332 (_ BitVec 32)) Bool)

(assert (=> b!501620 (= res!303142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501621 () Bool)

(declare-fun res!303135 () Bool)

(assert (=> b!501621 (=> (not res!303135) (not e!293858))))

(assert (=> b!501621 (= res!303135 (and (= (size!15910 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15910 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15910 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!293865 () Bool)

(declare-fun b!501622 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32332 (_ BitVec 32)) SeekEntryResult!4013)

(assert (=> b!501622 (= e!293865 (= (seekEntryOrOpen!0 (select (arr!15546 a!3235) j!176) a!3235 mask!3524) (Found!4013 j!176)))))

(declare-fun b!501623 () Bool)

(declare-fun e!293864 () Bool)

(assert (=> b!501623 (= e!293864 false)))

(declare-fun b!501624 () Bool)

(assert (=> b!501624 (= e!293860 true)))

(declare-fun lt!227852 () array!32332)

(declare-fun lt!227847 () (_ BitVec 64))

(declare-fun lt!227845 () SeekEntryResult!4013)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32332 (_ BitVec 32)) SeekEntryResult!4013)

(assert (=> b!501624 (= lt!227845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227848 lt!227847 lt!227852 mask!3524))))

(declare-fun b!501617 () Bool)

(declare-fun res!303131 () Bool)

(assert (=> b!501617 (=> res!303131 e!293860)))

(assert (=> b!501617 (= res!303131 e!293859)))

(declare-fun res!303140 () Bool)

(assert (=> b!501617 (=> (not res!303140) (not e!293859))))

(assert (=> b!501617 (= res!303140 (bvsgt #b00000000000000000000000000000000 (x!47278 lt!227846)))))

(declare-fun res!303139 () Bool)

(assert (=> start!45576 (=> (not res!303139) (not e!293858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45576 (= res!303139 (validMask!0 mask!3524))))

(assert (=> start!45576 e!293858))

(assert (=> start!45576 true))

(declare-fun array_inv!11342 (array!32332) Bool)

(assert (=> start!45576 (array_inv!11342 a!3235)))

(declare-fun b!501625 () Bool)

(assert (=> b!501625 (= e!293862 (not e!293857))))

(declare-fun res!303132 () Bool)

(assert (=> b!501625 (=> res!303132 e!293857)))

(declare-fun lt!227854 () (_ BitVec 32))

(assert (=> b!501625 (= res!303132 (= lt!227846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227854 lt!227847 lt!227852 mask!3524)))))

(assert (=> b!501625 (= lt!227846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227848 (select (arr!15546 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501625 (= lt!227854 (toIndex!0 lt!227847 mask!3524))))

(assert (=> b!501625 (= lt!227847 (select (store (arr!15546 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501625 (= lt!227848 (toIndex!0 (select (arr!15546 a!3235) j!176) mask!3524))))

(assert (=> b!501625 (= lt!227852 (array!32333 (store (arr!15546 a!3235) i!1204 k!2280) (size!15910 a!3235)))))

(assert (=> b!501625 e!293865))

(declare-fun res!303143 () Bool)

(assert (=> b!501625 (=> (not res!303143) (not e!293865))))

(assert (=> b!501625 (= res!303143 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227853 () Unit!15128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15128)

(assert (=> b!501625 (= lt!227853 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501626 () Bool)

(declare-fun Unit!15130 () Unit!15128)

(assert (=> b!501626 (= e!293863 Unit!15130)))

(declare-fun lt!227851 () Unit!15128)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32332 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15128)

(assert (=> b!501626 (= lt!227851 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227848 #b00000000000000000000000000000000 (index!18242 lt!227846) (x!47278 lt!227846) mask!3524))))

(declare-fun res!303134 () Bool)

(assert (=> b!501626 (= res!303134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227848 lt!227847 lt!227852 mask!3524) (Intermediate!4013 false (index!18242 lt!227846) (x!47278 lt!227846))))))

(assert (=> b!501626 (=> (not res!303134) (not e!293864))))

(assert (=> b!501626 e!293864))

(declare-fun b!501627 () Bool)

(declare-fun res!303141 () Bool)

(assert (=> b!501627 (=> (not res!303141) (not e!293862))))

(declare-datatypes ((List!9704 0))(
  ( (Nil!9701) (Cons!9700 (h!10577 (_ BitVec 64)) (t!15932 List!9704)) )
))
(declare-fun arrayNoDuplicates!0 (array!32332 (_ BitVec 32) List!9704) Bool)

(assert (=> b!501627 (= res!303141 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9701))))

(declare-fun b!501628 () Bool)

(declare-fun res!303130 () Bool)

(assert (=> b!501628 (=> res!303130 e!293857)))

(assert (=> b!501628 (= res!303130 (or (undefined!4825 lt!227846) (not (is-Intermediate!4013 lt!227846))))))

(declare-fun b!501629 () Bool)

(declare-fun Unit!15131 () Unit!15128)

(assert (=> b!501629 (= e!293863 Unit!15131)))

(declare-fun b!501630 () Bool)

(assert (=> b!501630 (= e!293858 e!293862)))

(declare-fun res!303133 () Bool)

(assert (=> b!501630 (=> (not res!303133) (not e!293862))))

(declare-fun lt!227844 () SeekEntryResult!4013)

(assert (=> b!501630 (= res!303133 (or (= lt!227844 (MissingZero!4013 i!1204)) (= lt!227844 (MissingVacant!4013 i!1204))))))

(assert (=> b!501630 (= lt!227844 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501631 () Bool)

(declare-fun res!303136 () Bool)

(assert (=> b!501631 (=> (not res!303136) (not e!293858))))

(assert (=> b!501631 (= res!303136 (validKeyInArray!0 k!2280))))

(declare-fun b!501632 () Bool)

(declare-fun res!303129 () Bool)

(assert (=> b!501632 (=> (not res!303129) (not e!293858))))

(declare-fun arrayContainsKey!0 (array!32332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501632 (= res!303129 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45576 res!303139) b!501621))

(assert (= (and b!501621 res!303135) b!501619))

(assert (= (and b!501619 res!303138) b!501631))

(assert (= (and b!501631 res!303136) b!501632))

(assert (= (and b!501632 res!303129) b!501630))

(assert (= (and b!501630 res!303133) b!501620))

(assert (= (and b!501620 res!303142) b!501627))

(assert (= (and b!501627 res!303141) b!501625))

(assert (= (and b!501625 res!303143) b!501622))

(assert (= (and b!501625 (not res!303132)) b!501628))

(assert (= (and b!501628 (not res!303130)) b!501616))

(assert (= (and b!501616 c!59522) b!501626))

(assert (= (and b!501616 (not c!59522)) b!501629))

(assert (= (and b!501626 res!303134) b!501623))

(assert (= (and b!501616 (not res!303137)) b!501617))

(assert (= (and b!501617 res!303140) b!501618))

(assert (= (and b!501617 (not res!303131)) b!501624))

(declare-fun m!482631 () Bool)

(assert (=> b!501630 m!482631))

(declare-fun m!482633 () Bool)

(assert (=> b!501632 m!482633))

(declare-fun m!482635 () Bool)

(assert (=> b!501619 m!482635))

(assert (=> b!501619 m!482635))

(declare-fun m!482637 () Bool)

(assert (=> b!501619 m!482637))

(declare-fun m!482639 () Bool)

(assert (=> b!501627 m!482639))

(declare-fun m!482641 () Bool)

(assert (=> b!501616 m!482641))

(declare-fun m!482643 () Bool)

(assert (=> b!501616 m!482643))

(assert (=> b!501616 m!482635))

(assert (=> b!501622 m!482635))

(assert (=> b!501622 m!482635))

(declare-fun m!482645 () Bool)

(assert (=> b!501622 m!482645))

(assert (=> b!501618 m!482635))

(assert (=> b!501618 m!482635))

(declare-fun m!482647 () Bool)

(assert (=> b!501618 m!482647))

(declare-fun m!482649 () Bool)

(assert (=> b!501625 m!482649))

(declare-fun m!482651 () Bool)

(assert (=> b!501625 m!482651))

(declare-fun m!482653 () Bool)

(assert (=> b!501625 m!482653))

(assert (=> b!501625 m!482635))

(declare-fun m!482655 () Bool)

(assert (=> b!501625 m!482655))

(assert (=> b!501625 m!482635))

(declare-fun m!482657 () Bool)

(assert (=> b!501625 m!482657))

(declare-fun m!482659 () Bool)

(assert (=> b!501625 m!482659))

(assert (=> b!501625 m!482635))

(declare-fun m!482661 () Bool)

(assert (=> b!501625 m!482661))

(declare-fun m!482663 () Bool)

(assert (=> b!501625 m!482663))

(declare-fun m!482665 () Bool)

(assert (=> b!501620 m!482665))

(declare-fun m!482667 () Bool)

(assert (=> start!45576 m!482667))

(declare-fun m!482669 () Bool)

(assert (=> start!45576 m!482669))

(declare-fun m!482671 () Bool)

(assert (=> b!501631 m!482671))

(declare-fun m!482673 () Bool)

(assert (=> b!501624 m!482673))

(declare-fun m!482675 () Bool)

(assert (=> b!501626 m!482675))

(assert (=> b!501626 m!482673))

(push 1)

