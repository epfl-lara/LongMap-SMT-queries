; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45786 () Bool)

(assert start!45786)

(declare-fun e!296522 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32552 0))(
  ( (array!32553 (arr!15656 (Array (_ BitVec 32) (_ BitVec 64))) (size!16021 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32552)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!506679 () Bool)

(declare-datatypes ((SeekEntryResult!4120 0))(
  ( (MissingZero!4120 (index!18668 (_ BitVec 32))) (Found!4120 (index!18669 (_ BitVec 32))) (Intermediate!4120 (undefined!4932 Bool) (index!18670 (_ BitVec 32)) (x!47676 (_ BitVec 32))) (Undefined!4120) (MissingVacant!4120 (index!18671 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32552 (_ BitVec 32)) SeekEntryResult!4120)

(assert (=> b!506679 (= e!296522 (= (seekEntryOrOpen!0 (select (arr!15656 a!3235) j!176) a!3235 mask!3524) (Found!4120 j!176)))))

(declare-fun b!506680 () Bool)

(declare-fun res!307786 () Bool)

(declare-fun e!296521 () Bool)

(assert (=> b!506680 (=> (not res!307786) (not e!296521))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506680 (= res!307786 (and (= (size!16021 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16021 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16021 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506681 () Bool)

(declare-fun res!307783 () Bool)

(declare-fun e!296524 () Bool)

(assert (=> b!506681 (=> (not res!307783) (not e!296524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32552 (_ BitVec 32)) Bool)

(assert (=> b!506681 (= res!307783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506682 () Bool)

(declare-fun e!296525 () Bool)

(declare-fun e!296523 () Bool)

(assert (=> b!506682 (= e!296525 e!296523)))

(declare-fun res!307781 () Bool)

(assert (=> b!506682 (=> res!307781 e!296523)))

(declare-fun lt!231139 () Bool)

(declare-fun lt!231137 () SeekEntryResult!4120)

(assert (=> b!506682 (= res!307781 (or (and (not lt!231139) (undefined!4932 lt!231137)) (and (not lt!231139) (not (undefined!4932 lt!231137)))))))

(get-info :version)

(assert (=> b!506682 (= lt!231139 (not ((_ is Intermediate!4120) lt!231137)))))

(declare-fun res!307790 () Bool)

(assert (=> start!45786 (=> (not res!307790) (not e!296521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45786 (= res!307790 (validMask!0 mask!3524))))

(assert (=> start!45786 e!296521))

(assert (=> start!45786 true))

(declare-fun array_inv!11539 (array!32552) Bool)

(assert (=> start!45786 (array_inv!11539 a!3235)))

(declare-fun b!506683 () Bool)

(declare-fun res!307788 () Bool)

(assert (=> b!506683 (=> (not res!307788) (not e!296521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506683 (= res!307788 (validKeyInArray!0 (select (arr!15656 a!3235) j!176)))))

(declare-fun b!506684 () Bool)

(declare-fun res!307785 () Bool)

(assert (=> b!506684 (=> (not res!307785) (not e!296524))))

(declare-datatypes ((List!9853 0))(
  ( (Nil!9850) (Cons!9849 (h!10726 (_ BitVec 64)) (t!16072 List!9853)) )
))
(declare-fun arrayNoDuplicates!0 (array!32552 (_ BitVec 32) List!9853) Bool)

(assert (=> b!506684 (= res!307785 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9850))))

(declare-fun b!506685 () Bool)

(assert (=> b!506685 (= e!296524 (not e!296525))))

(declare-fun res!307789 () Bool)

(assert (=> b!506685 (=> res!307789 e!296525)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!231138 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32552 (_ BitVec 32)) SeekEntryResult!4120)

(assert (=> b!506685 (= res!307789 (= lt!231137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231138 (select (store (arr!15656 a!3235) i!1204 k0!2280) j!176) (array!32553 (store (arr!15656 a!3235) i!1204 k0!2280) (size!16021 a!3235)) mask!3524)))))

(declare-fun lt!231140 () (_ BitVec 32))

(assert (=> b!506685 (= lt!231137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231140 (select (arr!15656 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506685 (= lt!231138 (toIndex!0 (select (store (arr!15656 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506685 (= lt!231140 (toIndex!0 (select (arr!15656 a!3235) j!176) mask!3524))))

(assert (=> b!506685 e!296522))

(declare-fun res!307780 () Bool)

(assert (=> b!506685 (=> (not res!307780) (not e!296522))))

(assert (=> b!506685 (= res!307780 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15514 0))(
  ( (Unit!15515) )
))
(declare-fun lt!231142 () Unit!15514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15514)

(assert (=> b!506685 (= lt!231142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506686 () Bool)

(declare-fun res!307787 () Bool)

(assert (=> b!506686 (=> (not res!307787) (not e!296521))))

(declare-fun arrayContainsKey!0 (array!32552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506686 (= res!307787 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506687 () Bool)

(declare-fun res!307784 () Bool)

(assert (=> b!506687 (=> (not res!307784) (not e!296521))))

(assert (=> b!506687 (= res!307784 (validKeyInArray!0 k0!2280))))

(declare-fun b!506688 () Bool)

(assert (=> b!506688 (= e!296521 e!296524)))

(declare-fun res!307782 () Bool)

(assert (=> b!506688 (=> (not res!307782) (not e!296524))))

(declare-fun lt!231141 () SeekEntryResult!4120)

(assert (=> b!506688 (= res!307782 (or (= lt!231141 (MissingZero!4120 i!1204)) (= lt!231141 (MissingVacant!4120 i!1204))))))

(assert (=> b!506688 (= lt!231141 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506689 () Bool)

(assert (=> b!506689 (= e!296523 true)))

(assert (=> b!506689 false))

(assert (= (and start!45786 res!307790) b!506680))

(assert (= (and b!506680 res!307786) b!506683))

(assert (= (and b!506683 res!307788) b!506687))

(assert (= (and b!506687 res!307784) b!506686))

(assert (= (and b!506686 res!307787) b!506688))

(assert (= (and b!506688 res!307782) b!506681))

(assert (= (and b!506681 res!307783) b!506684))

(assert (= (and b!506684 res!307785) b!506685))

(assert (= (and b!506685 res!307780) b!506679))

(assert (= (and b!506685 (not res!307789)) b!506682))

(assert (= (and b!506682 (not res!307781)) b!506689))

(declare-fun m!486907 () Bool)

(assert (=> b!506684 m!486907))

(declare-fun m!486909 () Bool)

(assert (=> b!506686 m!486909))

(declare-fun m!486911 () Bool)

(assert (=> b!506683 m!486911))

(assert (=> b!506683 m!486911))

(declare-fun m!486913 () Bool)

(assert (=> b!506683 m!486913))

(assert (=> b!506685 m!486911))

(declare-fun m!486915 () Bool)

(assert (=> b!506685 m!486915))

(declare-fun m!486917 () Bool)

(assert (=> b!506685 m!486917))

(declare-fun m!486919 () Bool)

(assert (=> b!506685 m!486919))

(declare-fun m!486921 () Bool)

(assert (=> b!506685 m!486921))

(assert (=> b!506685 m!486921))

(declare-fun m!486923 () Bool)

(assert (=> b!506685 m!486923))

(assert (=> b!506685 m!486911))

(declare-fun m!486925 () Bool)

(assert (=> b!506685 m!486925))

(assert (=> b!506685 m!486911))

(declare-fun m!486927 () Bool)

(assert (=> b!506685 m!486927))

(assert (=> b!506685 m!486921))

(declare-fun m!486929 () Bool)

(assert (=> b!506685 m!486929))

(assert (=> b!506679 m!486911))

(assert (=> b!506679 m!486911))

(declare-fun m!486931 () Bool)

(assert (=> b!506679 m!486931))

(declare-fun m!486933 () Bool)

(assert (=> b!506688 m!486933))

(declare-fun m!486935 () Bool)

(assert (=> b!506681 m!486935))

(declare-fun m!486937 () Bool)

(assert (=> start!45786 m!486937))

(declare-fun m!486939 () Bool)

(assert (=> start!45786 m!486939))

(declare-fun m!486941 () Bool)

(assert (=> b!506687 m!486941))

(check-sat (not b!506686) (not b!506679) (not b!506687) (not start!45786) (not b!506683) (not b!506684) (not b!506688) (not b!506685) (not b!506681))
(check-sat)
