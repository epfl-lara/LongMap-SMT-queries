; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45432 () Bool)

(assert start!45432)

(declare-fun b!499683 () Bool)

(declare-fun e!292799 () Bool)

(assert (=> b!499683 (= e!292799 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3977 0))(
  ( (MissingZero!3977 (index!18090 (_ BitVec 32))) (Found!3977 (index!18091 (_ BitVec 32))) (Intermediate!3977 (undefined!4789 Bool) (index!18092 (_ BitVec 32)) (x!47134 (_ BitVec 32))) (Undefined!3977) (MissingVacant!3977 (index!18093 (_ BitVec 32))) )
))
(declare-fun lt!226617 () SeekEntryResult!3977)

(declare-fun lt!226612 () (_ BitVec 32))

(declare-datatypes ((array!32257 0))(
  ( (array!32258 (arr!15510 (Array (_ BitVec 32) (_ BitVec 64))) (size!15874 (_ BitVec 32))) )
))
(declare-fun lt!226615 () array!32257)

(declare-fun lt!226616 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32257 (_ BitVec 32)) SeekEntryResult!3977)

(assert (=> b!499683 (= lt!226617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226612 lt!226616 lt!226615 mask!3524))))

(declare-fun b!499684 () Bool)

(declare-fun a!3235 () array!32257)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!292801 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32257 (_ BitVec 32)) SeekEntryResult!3977)

(assert (=> b!499684 (= e!292801 (= (seekEntryOrOpen!0 (select (arr!15510 a!3235) j!176) a!3235 mask!3524) (Found!3977 j!176)))))

(declare-fun b!499685 () Bool)

(declare-fun res!301622 () Bool)

(declare-fun e!292805 () Bool)

(assert (=> b!499685 (=> (not res!301622) (not e!292805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32257 (_ BitVec 32)) Bool)

(assert (=> b!499685 (= res!301622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499686 () Bool)

(declare-fun e!292802 () Bool)

(assert (=> b!499686 (= e!292802 false)))

(declare-fun b!499687 () Bool)

(declare-fun res!301624 () Bool)

(declare-fun e!292804 () Bool)

(assert (=> b!499687 (=> (not res!301624) (not e!292804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499687 (= res!301624 (validKeyInArray!0 (select (arr!15510 a!3235) j!176)))))

(declare-fun res!301614 () Bool)

(assert (=> start!45432 (=> (not res!301614) (not e!292804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45432 (= res!301614 (validMask!0 mask!3524))))

(assert (=> start!45432 e!292804))

(assert (=> start!45432 true))

(declare-fun array_inv!11306 (array!32257) Bool)

(assert (=> start!45432 (array_inv!11306 a!3235)))

(declare-fun b!499688 () Bool)

(declare-datatypes ((Unit!14984 0))(
  ( (Unit!14985) )
))
(declare-fun e!292806 () Unit!14984)

(declare-fun Unit!14986 () Unit!14984)

(assert (=> b!499688 (= e!292806 Unit!14986)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226614 () SeekEntryResult!3977)

(declare-fun lt!226613 () Unit!14984)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14984)

(assert (=> b!499688 (= lt!226613 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226612 #b00000000000000000000000000000000 (index!18092 lt!226614) (x!47134 lt!226614) mask!3524))))

(declare-fun res!301625 () Bool)

(assert (=> b!499688 (= res!301625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226612 lt!226616 lt!226615 mask!3524) (Intermediate!3977 false (index!18092 lt!226614) (x!47134 lt!226614))))))

(assert (=> b!499688 (=> (not res!301625) (not e!292802))))

(assert (=> b!499688 e!292802))

(declare-fun b!499689 () Bool)

(declare-fun e!292803 () Bool)

(assert (=> b!499689 (= e!292805 (not e!292803))))

(declare-fun res!301613 () Bool)

(assert (=> b!499689 (=> res!301613 e!292803)))

(declare-fun lt!226609 () (_ BitVec 32))

(assert (=> b!499689 (= res!301613 (= lt!226614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226609 lt!226616 lt!226615 mask!3524)))))

(assert (=> b!499689 (= lt!226614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226612 (select (arr!15510 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499689 (= lt!226609 (toIndex!0 lt!226616 mask!3524))))

(assert (=> b!499689 (= lt!226616 (select (store (arr!15510 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499689 (= lt!226612 (toIndex!0 (select (arr!15510 a!3235) j!176) mask!3524))))

(assert (=> b!499689 (= lt!226615 (array!32258 (store (arr!15510 a!3235) i!1204 k!2280) (size!15874 a!3235)))))

(assert (=> b!499689 e!292801))

(declare-fun res!301619 () Bool)

(assert (=> b!499689 (=> (not res!301619) (not e!292801))))

(assert (=> b!499689 (= res!301619 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226611 () Unit!14984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14984)

(assert (=> b!499689 (= lt!226611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499690 () Bool)

(declare-fun res!301617 () Bool)

(assert (=> b!499690 (=> (not res!301617) (not e!292805))))

(declare-datatypes ((List!9668 0))(
  ( (Nil!9665) (Cons!9664 (h!10538 (_ BitVec 64)) (t!15896 List!9668)) )
))
(declare-fun arrayNoDuplicates!0 (array!32257 (_ BitVec 32) List!9668) Bool)

(assert (=> b!499690 (= res!301617 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9665))))

(declare-fun b!499691 () Bool)

(declare-fun Unit!14987 () Unit!14984)

(assert (=> b!499691 (= e!292806 Unit!14987)))

(declare-fun b!499692 () Bool)

(declare-fun res!301618 () Bool)

(assert (=> b!499692 (=> (not res!301618) (not e!292804))))

(assert (=> b!499692 (= res!301618 (and (= (size!15874 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15874 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15874 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499693 () Bool)

(assert (=> b!499693 (= e!292804 e!292805)))

(declare-fun res!301621 () Bool)

(assert (=> b!499693 (=> (not res!301621) (not e!292805))))

(declare-fun lt!226618 () SeekEntryResult!3977)

(assert (=> b!499693 (= res!301621 (or (= lt!226618 (MissingZero!3977 i!1204)) (= lt!226618 (MissingVacant!3977 i!1204))))))

(assert (=> b!499693 (= lt!226618 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499694 () Bool)

(declare-fun res!301620 () Bool)

(assert (=> b!499694 (=> (not res!301620) (not e!292804))))

(declare-fun arrayContainsKey!0 (array!32257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499694 (= res!301620 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499695 () Bool)

(declare-fun res!301615 () Bool)

(assert (=> b!499695 (=> res!301615 e!292803)))

(assert (=> b!499695 (= res!301615 (or (undefined!4789 lt!226614) (not (is-Intermediate!3977 lt!226614))))))

(declare-fun b!499696 () Bool)

(assert (=> b!499696 (= e!292803 e!292799)))

(declare-fun res!301623 () Bool)

(assert (=> b!499696 (=> res!301623 e!292799)))

(assert (=> b!499696 (= res!301623 (or (bvsgt #b00000000000000000000000000000000 (x!47134 lt!226614)) (bvsgt (x!47134 lt!226614) #b01111111111111111111111111111110) (bvslt lt!226612 #b00000000000000000000000000000000) (bvsge lt!226612 (size!15874 a!3235)) (bvslt (index!18092 lt!226614) #b00000000000000000000000000000000) (bvsge (index!18092 lt!226614) (size!15874 a!3235)) (not (= lt!226614 (Intermediate!3977 false (index!18092 lt!226614) (x!47134 lt!226614))))))))

(assert (=> b!499696 (and (or (= (select (arr!15510 a!3235) (index!18092 lt!226614)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15510 a!3235) (index!18092 lt!226614)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15510 a!3235) (index!18092 lt!226614)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15510 a!3235) (index!18092 lt!226614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226610 () Unit!14984)

(assert (=> b!499696 (= lt!226610 e!292806)))

(declare-fun c!59312 () Bool)

(assert (=> b!499696 (= c!59312 (= (select (arr!15510 a!3235) (index!18092 lt!226614)) (select (arr!15510 a!3235) j!176)))))

(assert (=> b!499696 (and (bvslt (x!47134 lt!226614) #b01111111111111111111111111111110) (or (= (select (arr!15510 a!3235) (index!18092 lt!226614)) (select (arr!15510 a!3235) j!176)) (= (select (arr!15510 a!3235) (index!18092 lt!226614)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15510 a!3235) (index!18092 lt!226614)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499697 () Bool)

(declare-fun res!301616 () Bool)

(assert (=> b!499697 (=> (not res!301616) (not e!292804))))

(assert (=> b!499697 (= res!301616 (validKeyInArray!0 k!2280))))

(assert (= (and start!45432 res!301614) b!499692))

(assert (= (and b!499692 res!301618) b!499687))

(assert (= (and b!499687 res!301624) b!499697))

(assert (= (and b!499697 res!301616) b!499694))

(assert (= (and b!499694 res!301620) b!499693))

(assert (= (and b!499693 res!301621) b!499685))

(assert (= (and b!499685 res!301622) b!499690))

(assert (= (and b!499690 res!301617) b!499689))

(assert (= (and b!499689 res!301619) b!499684))

(assert (= (and b!499689 (not res!301613)) b!499695))

(assert (= (and b!499695 (not res!301615)) b!499696))

(assert (= (and b!499696 c!59312) b!499688))

(assert (= (and b!499696 (not c!59312)) b!499691))

(assert (= (and b!499688 res!301625) b!499686))

(assert (= (and b!499696 (not res!301623)) b!499683))

(declare-fun m!480867 () Bool)

(assert (=> start!45432 m!480867))

(declare-fun m!480869 () Bool)

(assert (=> start!45432 m!480869))

(declare-fun m!480871 () Bool)

(assert (=> b!499690 m!480871))

(declare-fun m!480873 () Bool)

(assert (=> b!499689 m!480873))

(declare-fun m!480875 () Bool)

(assert (=> b!499689 m!480875))

(declare-fun m!480877 () Bool)

(assert (=> b!499689 m!480877))

(declare-fun m!480879 () Bool)

(assert (=> b!499689 m!480879))

(assert (=> b!499689 m!480873))

(declare-fun m!480881 () Bool)

(assert (=> b!499689 m!480881))

(assert (=> b!499689 m!480873))

(declare-fun m!480883 () Bool)

(assert (=> b!499689 m!480883))

(declare-fun m!480885 () Bool)

(assert (=> b!499689 m!480885))

(declare-fun m!480887 () Bool)

(assert (=> b!499689 m!480887))

(declare-fun m!480889 () Bool)

(assert (=> b!499689 m!480889))

(declare-fun m!480891 () Bool)

(assert (=> b!499694 m!480891))

(declare-fun m!480893 () Bool)

(assert (=> b!499688 m!480893))

(declare-fun m!480895 () Bool)

(assert (=> b!499688 m!480895))

(declare-fun m!480897 () Bool)

(assert (=> b!499696 m!480897))

(assert (=> b!499696 m!480873))

(declare-fun m!480899 () Bool)

(assert (=> b!499685 m!480899))

(assert (=> b!499684 m!480873))

(assert (=> b!499684 m!480873))

(declare-fun m!480901 () Bool)

(assert (=> b!499684 m!480901))

(declare-fun m!480903 () Bool)

(assert (=> b!499697 m!480903))

(assert (=> b!499687 m!480873))

(assert (=> b!499687 m!480873))

(declare-fun m!480905 () Bool)

(assert (=> b!499687 m!480905))

(declare-fun m!480907 () Bool)

(assert (=> b!499693 m!480907))

(assert (=> b!499683 m!480895))

(push 1)

