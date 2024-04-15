; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45780 () Bool)

(assert start!45780)

(declare-fun b!506580 () Bool)

(declare-fun e!296468 () Bool)

(declare-fun e!296469 () Bool)

(assert (=> b!506580 (= e!296468 e!296469)))

(declare-fun res!307691 () Bool)

(assert (=> b!506580 (=> res!307691 e!296469)))

(declare-fun lt!231087 () Bool)

(declare-datatypes ((SeekEntryResult!4117 0))(
  ( (MissingZero!4117 (index!18656 (_ BitVec 32))) (Found!4117 (index!18657 (_ BitVec 32))) (Intermediate!4117 (undefined!4929 Bool) (index!18658 (_ BitVec 32)) (x!47665 (_ BitVec 32))) (Undefined!4117) (MissingVacant!4117 (index!18659 (_ BitVec 32))) )
))
(declare-fun lt!231088 () SeekEntryResult!4117)

(assert (=> b!506580 (= res!307691 (or (and (not lt!231087) (undefined!4929 lt!231088)) (and (not lt!231087) (not (undefined!4929 lt!231088)))))))

(get-info :version)

(assert (=> b!506580 (= lt!231087 (not ((_ is Intermediate!4117) lt!231088)))))

(declare-fun b!506581 () Bool)

(declare-fun e!296467 () Bool)

(declare-fun e!296470 () Bool)

(assert (=> b!506581 (= e!296467 e!296470)))

(declare-fun res!307690 () Bool)

(assert (=> b!506581 (=> (not res!307690) (not e!296470))))

(declare-fun lt!231084 () SeekEntryResult!4117)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506581 (= res!307690 (or (= lt!231084 (MissingZero!4117 i!1204)) (= lt!231084 (MissingVacant!4117 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((array!32546 0))(
  ( (array!32547 (arr!15653 (Array (_ BitVec 32) (_ BitVec 64))) (size!16018 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32546)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32546 (_ BitVec 32)) SeekEntryResult!4117)

(assert (=> b!506581 (= lt!231084 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506582 () Bool)

(declare-fun res!307681 () Bool)

(assert (=> b!506582 (=> (not res!307681) (not e!296467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506582 (= res!307681 (validKeyInArray!0 k0!2280))))

(declare-fun b!506583 () Bool)

(declare-fun res!307683 () Bool)

(assert (=> b!506583 (=> (not res!307683) (not e!296467))))

(declare-fun arrayContainsKey!0 (array!32546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506583 (= res!307683 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506584 () Bool)

(assert (=> b!506584 (= e!296470 (not e!296468))))

(declare-fun res!307689 () Bool)

(assert (=> b!506584 (=> res!307689 e!296468)))

(declare-fun lt!231085 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32546 (_ BitVec 32)) SeekEntryResult!4117)

(assert (=> b!506584 (= res!307689 (= lt!231088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231085 (select (store (arr!15653 a!3235) i!1204 k0!2280) j!176) (array!32547 (store (arr!15653 a!3235) i!1204 k0!2280) (size!16018 a!3235)) mask!3524)))))

(declare-fun lt!231086 () (_ BitVec 32))

(assert (=> b!506584 (= lt!231088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231086 (select (arr!15653 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506584 (= lt!231085 (toIndex!0 (select (store (arr!15653 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506584 (= lt!231086 (toIndex!0 (select (arr!15653 a!3235) j!176) mask!3524))))

(declare-fun e!296472 () Bool)

(assert (=> b!506584 e!296472))

(declare-fun res!307688 () Bool)

(assert (=> b!506584 (=> (not res!307688) (not e!296472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32546 (_ BitVec 32)) Bool)

(assert (=> b!506584 (= res!307688 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15508 0))(
  ( (Unit!15509) )
))
(declare-fun lt!231083 () Unit!15508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15508)

(assert (=> b!506584 (= lt!231083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506585 () Bool)

(assert (=> b!506585 (= e!296469 true)))

(assert (=> b!506585 false))

(declare-fun res!307684 () Bool)

(assert (=> start!45780 (=> (not res!307684) (not e!296467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45780 (= res!307684 (validMask!0 mask!3524))))

(assert (=> start!45780 e!296467))

(assert (=> start!45780 true))

(declare-fun array_inv!11536 (array!32546) Bool)

(assert (=> start!45780 (array_inv!11536 a!3235)))

(declare-fun b!506586 () Bool)

(declare-fun res!307682 () Bool)

(assert (=> b!506586 (=> (not res!307682) (not e!296467))))

(assert (=> b!506586 (= res!307682 (validKeyInArray!0 (select (arr!15653 a!3235) j!176)))))

(declare-fun b!506587 () Bool)

(declare-fun res!307687 () Bool)

(assert (=> b!506587 (=> (not res!307687) (not e!296470))))

(assert (=> b!506587 (= res!307687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506588 () Bool)

(assert (=> b!506588 (= e!296472 (= (seekEntryOrOpen!0 (select (arr!15653 a!3235) j!176) a!3235 mask!3524) (Found!4117 j!176)))))

(declare-fun b!506589 () Bool)

(declare-fun res!307686 () Bool)

(assert (=> b!506589 (=> (not res!307686) (not e!296467))))

(assert (=> b!506589 (= res!307686 (and (= (size!16018 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16018 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16018 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506590 () Bool)

(declare-fun res!307685 () Bool)

(assert (=> b!506590 (=> (not res!307685) (not e!296470))))

(declare-datatypes ((List!9850 0))(
  ( (Nil!9847) (Cons!9846 (h!10723 (_ BitVec 64)) (t!16069 List!9850)) )
))
(declare-fun arrayNoDuplicates!0 (array!32546 (_ BitVec 32) List!9850) Bool)

(assert (=> b!506590 (= res!307685 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9847))))

(assert (= (and start!45780 res!307684) b!506589))

(assert (= (and b!506589 res!307686) b!506586))

(assert (= (and b!506586 res!307682) b!506582))

(assert (= (and b!506582 res!307681) b!506583))

(assert (= (and b!506583 res!307683) b!506581))

(assert (= (and b!506581 res!307690) b!506587))

(assert (= (and b!506587 res!307687) b!506590))

(assert (= (and b!506590 res!307685) b!506584))

(assert (= (and b!506584 res!307688) b!506588))

(assert (= (and b!506584 (not res!307689)) b!506580))

(assert (= (and b!506580 (not res!307691)) b!506585))

(declare-fun m!486799 () Bool)

(assert (=> b!506582 m!486799))

(declare-fun m!486801 () Bool)

(assert (=> b!506587 m!486801))

(declare-fun m!486803 () Bool)

(assert (=> b!506588 m!486803))

(assert (=> b!506588 m!486803))

(declare-fun m!486805 () Bool)

(assert (=> b!506588 m!486805))

(declare-fun m!486807 () Bool)

(assert (=> b!506583 m!486807))

(declare-fun m!486809 () Bool)

(assert (=> b!506590 m!486809))

(declare-fun m!486811 () Bool)

(assert (=> start!45780 m!486811))

(declare-fun m!486813 () Bool)

(assert (=> start!45780 m!486813))

(declare-fun m!486815 () Bool)

(assert (=> b!506584 m!486815))

(declare-fun m!486817 () Bool)

(assert (=> b!506584 m!486817))

(declare-fun m!486819 () Bool)

(assert (=> b!506584 m!486819))

(assert (=> b!506584 m!486803))

(declare-fun m!486821 () Bool)

(assert (=> b!506584 m!486821))

(assert (=> b!506584 m!486803))

(declare-fun m!486823 () Bool)

(assert (=> b!506584 m!486823))

(assert (=> b!506584 m!486803))

(declare-fun m!486825 () Bool)

(assert (=> b!506584 m!486825))

(assert (=> b!506584 m!486819))

(declare-fun m!486827 () Bool)

(assert (=> b!506584 m!486827))

(assert (=> b!506584 m!486819))

(declare-fun m!486829 () Bool)

(assert (=> b!506584 m!486829))

(assert (=> b!506586 m!486803))

(assert (=> b!506586 m!486803))

(declare-fun m!486831 () Bool)

(assert (=> b!506586 m!486831))

(declare-fun m!486833 () Bool)

(assert (=> b!506581 m!486833))

(check-sat (not b!506588) (not b!506581) (not start!45780) (not b!506586) (not b!506582) (not b!506584) (not b!506590) (not b!506587) (not b!506583))
(check-sat)
