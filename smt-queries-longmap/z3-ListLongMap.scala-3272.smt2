; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45578 () Bool)

(assert start!45578)

(declare-fun b!501667 () Bool)

(declare-fun e!293891 () Bool)

(assert (=> b!501667 (= e!293891 false)))

(declare-fun b!501668 () Bool)

(declare-fun res!303176 () Bool)

(declare-fun e!293890 () Bool)

(assert (=> b!501668 (=> (not res!303176) (not e!293890))))

(declare-datatypes ((array!32334 0))(
  ( (array!32335 (arr!15547 (Array (_ BitVec 32) (_ BitVec 64))) (size!15911 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32334)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501668 (= res!303176 (validKeyInArray!0 (select (arr!15547 a!3235) j!176)))))

(declare-fun b!501669 () Bool)

(declare-fun res!303179 () Bool)

(assert (=> b!501669 (=> (not res!303179) (not e!293890))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501669 (= res!303179 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501670 () Bool)

(declare-fun res!303185 () Bool)

(declare-fun e!293885 () Bool)

(assert (=> b!501670 (=> res!303185 e!293885)))

(declare-fun e!293892 () Bool)

(assert (=> b!501670 (= res!303185 e!293892)))

(declare-fun res!303175 () Bool)

(assert (=> b!501670 (=> (not res!303175) (not e!293892))))

(declare-datatypes ((SeekEntryResult!4014 0))(
  ( (MissingZero!4014 (index!18244 (_ BitVec 32))) (Found!4014 (index!18245 (_ BitVec 32))) (Intermediate!4014 (undefined!4826 Bool) (index!18246 (_ BitVec 32)) (x!47279 (_ BitVec 32))) (Undefined!4014) (MissingVacant!4014 (index!18247 (_ BitVec 32))) )
))
(declare-fun lt!227883 () SeekEntryResult!4014)

(assert (=> b!501670 (= res!303175 (bvsgt #b00000000000000000000000000000000 (x!47279 lt!227883)))))

(declare-fun b!501671 () Bool)

(declare-fun e!293887 () Bool)

(declare-fun e!293888 () Bool)

(assert (=> b!501671 (= e!293887 (not e!293888))))

(declare-fun res!303177 () Bool)

(assert (=> b!501671 (=> res!303177 e!293888)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227885 () array!32334)

(declare-fun lt!227877 () (_ BitVec 32))

(declare-fun lt!227879 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32334 (_ BitVec 32)) SeekEntryResult!4014)

(assert (=> b!501671 (= res!303177 (= lt!227883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227877 lt!227879 lt!227885 mask!3524)))))

(declare-fun lt!227887 () (_ BitVec 32))

(assert (=> b!501671 (= lt!227883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227887 (select (arr!15547 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501671 (= lt!227877 (toIndex!0 lt!227879 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501671 (= lt!227879 (select (store (arr!15547 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501671 (= lt!227887 (toIndex!0 (select (arr!15547 a!3235) j!176) mask!3524))))

(assert (=> b!501671 (= lt!227885 (array!32335 (store (arr!15547 a!3235) i!1204 k0!2280) (size!15911 a!3235)))))

(declare-fun e!293889 () Bool)

(assert (=> b!501671 e!293889))

(declare-fun res!303184 () Bool)

(assert (=> b!501671 (=> (not res!303184) (not e!293889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32334 (_ BitVec 32)) Bool)

(assert (=> b!501671 (= res!303184 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15132 0))(
  ( (Unit!15133) )
))
(declare-fun lt!227880 () Unit!15132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15132)

(assert (=> b!501671 (= lt!227880 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501672 () Bool)

(declare-fun res!303178 () Bool)

(assert (=> b!501672 (=> res!303178 e!293888)))

(get-info :version)

(assert (=> b!501672 (= res!303178 (or (undefined!4826 lt!227883) (not ((_ is Intermediate!4014) lt!227883))))))

(declare-fun b!501673 () Bool)

(declare-fun res!303174 () Bool)

(assert (=> b!501673 (=> (not res!303174) (not e!293887))))

(assert (=> b!501673 (= res!303174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501674 () Bool)

(assert (=> b!501674 (= e!293888 e!293885)))

(declare-fun res!303182 () Bool)

(assert (=> b!501674 (=> res!303182 e!293885)))

(assert (=> b!501674 (= res!303182 (or (bvsgt (x!47279 lt!227883) #b01111111111111111111111111111110) (bvslt lt!227887 #b00000000000000000000000000000000) (bvsge lt!227887 (size!15911 a!3235)) (bvslt (index!18246 lt!227883) #b00000000000000000000000000000000) (bvsge (index!18246 lt!227883) (size!15911 a!3235)) (not (= lt!227883 (Intermediate!4014 false (index!18246 lt!227883) (x!47279 lt!227883))))))))

(assert (=> b!501674 (= (index!18246 lt!227883) i!1204)))

(declare-fun lt!227878 () Unit!15132)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32334 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15132)

(assert (=> b!501674 (= lt!227878 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227887 #b00000000000000000000000000000000 (index!18246 lt!227883) (x!47279 lt!227883) mask!3524))))

(assert (=> b!501674 (and (or (= (select (arr!15547 a!3235) (index!18246 lt!227883)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15547 a!3235) (index!18246 lt!227883)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15547 a!3235) (index!18246 lt!227883)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15547 a!3235) (index!18246 lt!227883)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227886 () Unit!15132)

(declare-fun e!293886 () Unit!15132)

(assert (=> b!501674 (= lt!227886 e!293886)))

(declare-fun c!59525 () Bool)

(assert (=> b!501674 (= c!59525 (= (select (arr!15547 a!3235) (index!18246 lt!227883)) (select (arr!15547 a!3235) j!176)))))

(assert (=> b!501674 (and (bvslt (x!47279 lt!227883) #b01111111111111111111111111111110) (or (= (select (arr!15547 a!3235) (index!18246 lt!227883)) (select (arr!15547 a!3235) j!176)) (= (select (arr!15547 a!3235) (index!18246 lt!227883)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15547 a!3235) (index!18246 lt!227883)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501675 () Bool)

(assert (=> b!501675 (= e!293890 e!293887)))

(declare-fun res!303186 () Bool)

(assert (=> b!501675 (=> (not res!303186) (not e!293887))))

(declare-fun lt!227884 () SeekEntryResult!4014)

(assert (=> b!501675 (= res!303186 (or (= lt!227884 (MissingZero!4014 i!1204)) (= lt!227884 (MissingVacant!4014 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32334 (_ BitVec 32)) SeekEntryResult!4014)

(assert (=> b!501675 (= lt!227884 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501676 () Bool)

(declare-fun Unit!15134 () Unit!15132)

(assert (=> b!501676 (= e!293886 Unit!15134)))

(declare-fun b!501677 () Bool)

(assert (=> b!501677 (= e!293885 true)))

(declare-fun lt!227881 () SeekEntryResult!4014)

(assert (=> b!501677 (= lt!227881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227887 lt!227879 lt!227885 mask!3524))))

(declare-fun b!501678 () Bool)

(assert (=> b!501678 (= e!293889 (= (seekEntryOrOpen!0 (select (arr!15547 a!3235) j!176) a!3235 mask!3524) (Found!4014 j!176)))))

(declare-fun b!501679 () Bool)

(declare-fun Unit!15135 () Unit!15132)

(assert (=> b!501679 (= e!293886 Unit!15135)))

(declare-fun lt!227882 () Unit!15132)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32334 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15132)

(assert (=> b!501679 (= lt!227882 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227887 #b00000000000000000000000000000000 (index!18246 lt!227883) (x!47279 lt!227883) mask!3524))))

(declare-fun res!303188 () Bool)

(assert (=> b!501679 (= res!303188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227887 lt!227879 lt!227885 mask!3524) (Intermediate!4014 false (index!18246 lt!227883) (x!47279 lt!227883))))))

(assert (=> b!501679 (=> (not res!303188) (not e!293891))))

(assert (=> b!501679 e!293891))

(declare-fun b!501680 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32334 (_ BitVec 32)) SeekEntryResult!4014)

(assert (=> b!501680 (= e!293892 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227887 (index!18246 lt!227883) (select (arr!15547 a!3235) j!176) a!3235 mask!3524) (Found!4014 j!176))))))

(declare-fun b!501681 () Bool)

(declare-fun res!303183 () Bool)

(assert (=> b!501681 (=> (not res!303183) (not e!293890))))

(assert (=> b!501681 (= res!303183 (validKeyInArray!0 k0!2280))))

(declare-fun b!501682 () Bool)

(declare-fun res!303181 () Bool)

(assert (=> b!501682 (=> (not res!303181) (not e!293887))))

(declare-datatypes ((List!9705 0))(
  ( (Nil!9702) (Cons!9701 (h!10578 (_ BitVec 64)) (t!15933 List!9705)) )
))
(declare-fun arrayNoDuplicates!0 (array!32334 (_ BitVec 32) List!9705) Bool)

(assert (=> b!501682 (= res!303181 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9702))))

(declare-fun b!501683 () Bool)

(declare-fun res!303180 () Bool)

(assert (=> b!501683 (=> (not res!303180) (not e!293890))))

(assert (=> b!501683 (= res!303180 (and (= (size!15911 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15911 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15911 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!303187 () Bool)

(assert (=> start!45578 (=> (not res!303187) (not e!293890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45578 (= res!303187 (validMask!0 mask!3524))))

(assert (=> start!45578 e!293890))

(assert (=> start!45578 true))

(declare-fun array_inv!11343 (array!32334) Bool)

(assert (=> start!45578 (array_inv!11343 a!3235)))

(assert (= (and start!45578 res!303187) b!501683))

(assert (= (and b!501683 res!303180) b!501668))

(assert (= (and b!501668 res!303176) b!501681))

(assert (= (and b!501681 res!303183) b!501669))

(assert (= (and b!501669 res!303179) b!501675))

(assert (= (and b!501675 res!303186) b!501673))

(assert (= (and b!501673 res!303174) b!501682))

(assert (= (and b!501682 res!303181) b!501671))

(assert (= (and b!501671 res!303184) b!501678))

(assert (= (and b!501671 (not res!303177)) b!501672))

(assert (= (and b!501672 (not res!303178)) b!501674))

(assert (= (and b!501674 c!59525) b!501679))

(assert (= (and b!501674 (not c!59525)) b!501676))

(assert (= (and b!501679 res!303188) b!501667))

(assert (= (and b!501674 (not res!303182)) b!501670))

(assert (= (and b!501670 res!303175) b!501680))

(assert (= (and b!501670 (not res!303185)) b!501677))

(declare-fun m!482677 () Bool)

(assert (=> b!501671 m!482677))

(declare-fun m!482679 () Bool)

(assert (=> b!501671 m!482679))

(declare-fun m!482681 () Bool)

(assert (=> b!501671 m!482681))

(declare-fun m!482683 () Bool)

(assert (=> b!501671 m!482683))

(declare-fun m!482685 () Bool)

(assert (=> b!501671 m!482685))

(declare-fun m!482687 () Bool)

(assert (=> b!501671 m!482687))

(declare-fun m!482689 () Bool)

(assert (=> b!501671 m!482689))

(declare-fun m!482691 () Bool)

(assert (=> b!501671 m!482691))

(assert (=> b!501671 m!482685))

(declare-fun m!482693 () Bool)

(assert (=> b!501671 m!482693))

(assert (=> b!501671 m!482685))

(declare-fun m!482695 () Bool)

(assert (=> b!501679 m!482695))

(declare-fun m!482697 () Bool)

(assert (=> b!501679 m!482697))

(declare-fun m!482699 () Bool)

(assert (=> b!501673 m!482699))

(declare-fun m!482701 () Bool)

(assert (=> b!501681 m!482701))

(assert (=> b!501680 m!482685))

(assert (=> b!501680 m!482685))

(declare-fun m!482703 () Bool)

(assert (=> b!501680 m!482703))

(assert (=> b!501678 m!482685))

(assert (=> b!501678 m!482685))

(declare-fun m!482705 () Bool)

(assert (=> b!501678 m!482705))

(declare-fun m!482707 () Bool)

(assert (=> b!501669 m!482707))

(declare-fun m!482709 () Bool)

(assert (=> b!501674 m!482709))

(declare-fun m!482711 () Bool)

(assert (=> b!501674 m!482711))

(assert (=> b!501674 m!482685))

(assert (=> b!501668 m!482685))

(assert (=> b!501668 m!482685))

(declare-fun m!482713 () Bool)

(assert (=> b!501668 m!482713))

(declare-fun m!482715 () Bool)

(assert (=> b!501675 m!482715))

(declare-fun m!482717 () Bool)

(assert (=> start!45578 m!482717))

(declare-fun m!482719 () Bool)

(assert (=> start!45578 m!482719))

(assert (=> b!501677 m!482697))

(declare-fun m!482721 () Bool)

(assert (=> b!501682 m!482721))

(check-sat (not b!501669) (not b!501675) (not b!501677) (not b!501668) (not b!501671) (not b!501680) (not b!501674) (not b!501673) (not b!501679) (not b!501682) (not b!501678) (not b!501681) (not start!45578))
(check-sat)
