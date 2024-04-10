; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45622 () Bool)

(assert start!45622)

(declare-fun b!502789 () Bool)

(declare-fun res!304177 () Bool)

(declare-fun e!294484 () Bool)

(assert (=> b!502789 (=> res!304177 e!294484)))

(declare-fun e!294483 () Bool)

(assert (=> b!502789 (= res!304177 e!294483)))

(declare-fun res!304167 () Bool)

(assert (=> b!502789 (=> (not res!304167) (not e!294483))))

(declare-datatypes ((SeekEntryResult!4036 0))(
  ( (MissingZero!4036 (index!18332 (_ BitVec 32))) (Found!4036 (index!18333 (_ BitVec 32))) (Intermediate!4036 (undefined!4848 Bool) (index!18334 (_ BitVec 32)) (x!47357 (_ BitVec 32))) (Undefined!4036) (MissingVacant!4036 (index!18335 (_ BitVec 32))) )
))
(declare-fun lt!228610 () SeekEntryResult!4036)

(assert (=> b!502789 (= res!304167 (bvsgt #b00000000000000000000000000000000 (x!47357 lt!228610)))))

(declare-fun b!502790 () Bool)

(declare-fun res!304170 () Bool)

(declare-fun e!294480 () Bool)

(assert (=> b!502790 (=> (not res!304170) (not e!294480))))

(declare-datatypes ((array!32378 0))(
  ( (array!32379 (arr!15569 (Array (_ BitVec 32) (_ BitVec 64))) (size!15933 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32378)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32378 (_ BitVec 32)) Bool)

(assert (=> b!502790 (= res!304170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502791 () Bool)

(declare-fun res!304176 () Bool)

(declare-fun e!294481 () Bool)

(assert (=> b!502791 (=> (not res!304176) (not e!294481))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502791 (= res!304176 (validKeyInArray!0 k!2280))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!294478 () Bool)

(declare-fun b!502792 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32378 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!502792 (= e!294478 (= (seekEntryOrOpen!0 (select (arr!15569 a!3235) j!176) a!3235 mask!3524) (Found!4036 j!176)))))

(declare-fun res!304168 () Bool)

(assert (=> start!45622 (=> (not res!304168) (not e!294481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45622 (= res!304168 (validMask!0 mask!3524))))

(assert (=> start!45622 e!294481))

(assert (=> start!45622 true))

(declare-fun array_inv!11365 (array!32378) Bool)

(assert (=> start!45622 (array_inv!11365 a!3235)))

(declare-fun b!502793 () Bool)

(declare-datatypes ((Unit!15220 0))(
  ( (Unit!15221) )
))
(declare-fun e!294486 () Unit!15220)

(declare-fun Unit!15222 () Unit!15220)

(assert (=> b!502793 (= e!294486 Unit!15222)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!228612 () Unit!15220)

(declare-fun lt!228613 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32378 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15220)

(assert (=> b!502793 (= lt!228612 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228613 #b00000000000000000000000000000000 (index!18334 lt!228610) (x!47357 lt!228610) mask!3524))))

(declare-fun lt!228604 () array!32378)

(declare-fun res!304164 () Bool)

(declare-fun lt!228606 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32378 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!502793 (= res!304164 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228613 lt!228606 lt!228604 mask!3524) (Intermediate!4036 false (index!18334 lt!228610) (x!47357 lt!228610))))))

(declare-fun e!294479 () Bool)

(assert (=> b!502793 (=> (not res!304164) (not e!294479))))

(assert (=> b!502793 e!294479))

(declare-fun b!502794 () Bool)

(declare-fun e!294485 () Bool)

(assert (=> b!502794 (= e!294485 e!294484)))

(declare-fun res!304173 () Bool)

(assert (=> b!502794 (=> res!304173 e!294484)))

(assert (=> b!502794 (= res!304173 (or (bvsgt (x!47357 lt!228610) #b01111111111111111111111111111110) (bvslt lt!228613 #b00000000000000000000000000000000) (bvsge lt!228613 (size!15933 a!3235)) (bvslt (index!18334 lt!228610) #b00000000000000000000000000000000) (bvsge (index!18334 lt!228610) (size!15933 a!3235)) (not (= lt!228610 (Intermediate!4036 false (index!18334 lt!228610) (x!47357 lt!228610))))))))

(assert (=> b!502794 (= (index!18334 lt!228610) i!1204)))

(declare-fun lt!228609 () Unit!15220)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32378 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15220)

(assert (=> b!502794 (= lt!228609 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228613 #b00000000000000000000000000000000 (index!18334 lt!228610) (x!47357 lt!228610) mask!3524))))

(assert (=> b!502794 (and (or (= (select (arr!15569 a!3235) (index!18334 lt!228610)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15569 a!3235) (index!18334 lt!228610)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15569 a!3235) (index!18334 lt!228610)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15569 a!3235) (index!18334 lt!228610)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228611 () Unit!15220)

(assert (=> b!502794 (= lt!228611 e!294486)))

(declare-fun c!59591 () Bool)

(assert (=> b!502794 (= c!59591 (= (select (arr!15569 a!3235) (index!18334 lt!228610)) (select (arr!15569 a!3235) j!176)))))

(assert (=> b!502794 (and (bvslt (x!47357 lt!228610) #b01111111111111111111111111111110) (or (= (select (arr!15569 a!3235) (index!18334 lt!228610)) (select (arr!15569 a!3235) j!176)) (= (select (arr!15569 a!3235) (index!18334 lt!228610)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15569 a!3235) (index!18334 lt!228610)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502795 () Bool)

(assert (=> b!502795 (= e!294480 (not e!294485))))

(declare-fun res!304171 () Bool)

(assert (=> b!502795 (=> res!304171 e!294485)))

(declare-fun lt!228607 () (_ BitVec 32))

(assert (=> b!502795 (= res!304171 (= lt!228610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228607 lt!228606 lt!228604 mask!3524)))))

(assert (=> b!502795 (= lt!228610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228613 (select (arr!15569 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502795 (= lt!228607 (toIndex!0 lt!228606 mask!3524))))

(assert (=> b!502795 (= lt!228606 (select (store (arr!15569 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502795 (= lt!228613 (toIndex!0 (select (arr!15569 a!3235) j!176) mask!3524))))

(assert (=> b!502795 (= lt!228604 (array!32379 (store (arr!15569 a!3235) i!1204 k!2280) (size!15933 a!3235)))))

(assert (=> b!502795 e!294478))

(declare-fun res!304178 () Bool)

(assert (=> b!502795 (=> (not res!304178) (not e!294478))))

(assert (=> b!502795 (= res!304178 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228605 () Unit!15220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15220)

(assert (=> b!502795 (= lt!228605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502796 () Bool)

(declare-fun res!304174 () Bool)

(assert (=> b!502796 (=> (not res!304174) (not e!294481))))

(assert (=> b!502796 (= res!304174 (validKeyInArray!0 (select (arr!15569 a!3235) j!176)))))

(declare-fun b!502797 () Bool)

(declare-fun res!304172 () Bool)

(assert (=> b!502797 (=> (not res!304172) (not e!294481))))

(assert (=> b!502797 (= res!304172 (and (= (size!15933 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15933 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15933 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502798 () Bool)

(declare-fun Unit!15223 () Unit!15220)

(assert (=> b!502798 (= e!294486 Unit!15223)))

(declare-fun b!502799 () Bool)

(declare-fun res!304169 () Bool)

(assert (=> b!502799 (=> (not res!304169) (not e!294481))))

(declare-fun arrayContainsKey!0 (array!32378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502799 (= res!304169 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502800 () Bool)

(assert (=> b!502800 (= e!294481 e!294480)))

(declare-fun res!304166 () Bool)

(assert (=> b!502800 (=> (not res!304166) (not e!294480))))

(declare-fun lt!228603 () SeekEntryResult!4036)

(assert (=> b!502800 (= res!304166 (or (= lt!228603 (MissingZero!4036 i!1204)) (= lt!228603 (MissingVacant!4036 i!1204))))))

(assert (=> b!502800 (= lt!228603 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502801 () Bool)

(declare-fun res!304165 () Bool)

(assert (=> b!502801 (=> res!304165 e!294485)))

(assert (=> b!502801 (= res!304165 (or (undefined!4848 lt!228610) (not (is-Intermediate!4036 lt!228610))))))

(declare-fun b!502802 () Bool)

(assert (=> b!502802 (= e!294479 false)))

(declare-fun b!502803 () Bool)

(declare-fun res!304175 () Bool)

(assert (=> b!502803 (=> (not res!304175) (not e!294480))))

(declare-datatypes ((List!9727 0))(
  ( (Nil!9724) (Cons!9723 (h!10600 (_ BitVec 64)) (t!15955 List!9727)) )
))
(declare-fun arrayNoDuplicates!0 (array!32378 (_ BitVec 32) List!9727) Bool)

(assert (=> b!502803 (= res!304175 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9724))))

(declare-fun b!502804 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32378 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!502804 (= e!294483 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228613 (index!18334 lt!228610) (select (arr!15569 a!3235) j!176) a!3235 mask!3524) (Found!4036 j!176))))))

(declare-fun b!502805 () Bool)

(assert (=> b!502805 (= e!294484 true)))

(declare-fun lt!228608 () SeekEntryResult!4036)

(assert (=> b!502805 (= lt!228608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228613 lt!228606 lt!228604 mask!3524))))

(assert (= (and start!45622 res!304168) b!502797))

(assert (= (and b!502797 res!304172) b!502796))

(assert (= (and b!502796 res!304174) b!502791))

(assert (= (and b!502791 res!304176) b!502799))

(assert (= (and b!502799 res!304169) b!502800))

(assert (= (and b!502800 res!304166) b!502790))

(assert (= (and b!502790 res!304170) b!502803))

(assert (= (and b!502803 res!304175) b!502795))

(assert (= (and b!502795 res!304178) b!502792))

(assert (= (and b!502795 (not res!304171)) b!502801))

(assert (= (and b!502801 (not res!304165)) b!502794))

(assert (= (and b!502794 c!59591) b!502793))

(assert (= (and b!502794 (not c!59591)) b!502798))

(assert (= (and b!502793 res!304164) b!502802))

(assert (= (and b!502794 (not res!304173)) b!502789))

(assert (= (and b!502789 res!304167) b!502804))

(assert (= (and b!502789 (not res!304177)) b!502805))

(declare-fun m!483689 () Bool)

(assert (=> b!502803 m!483689))

(declare-fun m!483691 () Bool)

(assert (=> b!502800 m!483691))

(declare-fun m!483693 () Bool)

(assert (=> start!45622 m!483693))

(declare-fun m!483695 () Bool)

(assert (=> start!45622 m!483695))

(declare-fun m!483697 () Bool)

(assert (=> b!502796 m!483697))

(assert (=> b!502796 m!483697))

(declare-fun m!483699 () Bool)

(assert (=> b!502796 m!483699))

(declare-fun m!483701 () Bool)

(assert (=> b!502791 m!483701))

(assert (=> b!502804 m!483697))

(assert (=> b!502804 m!483697))

(declare-fun m!483703 () Bool)

(assert (=> b!502804 m!483703))

(assert (=> b!502792 m!483697))

(assert (=> b!502792 m!483697))

(declare-fun m!483705 () Bool)

(assert (=> b!502792 m!483705))

(declare-fun m!483707 () Bool)

(assert (=> b!502790 m!483707))

(declare-fun m!483709 () Bool)

(assert (=> b!502805 m!483709))

(declare-fun m!483711 () Bool)

(assert (=> b!502794 m!483711))

(declare-fun m!483713 () Bool)

(assert (=> b!502794 m!483713))

(assert (=> b!502794 m!483697))

(declare-fun m!483715 () Bool)

(assert (=> b!502799 m!483715))

(declare-fun m!483717 () Bool)

(assert (=> b!502793 m!483717))

(assert (=> b!502793 m!483709))

(declare-fun m!483719 () Bool)

(assert (=> b!502795 m!483719))

(declare-fun m!483721 () Bool)

(assert (=> b!502795 m!483721))

(declare-fun m!483723 () Bool)

(assert (=> b!502795 m!483723))

(assert (=> b!502795 m!483697))

(declare-fun m!483725 () Bool)

(assert (=> b!502795 m!483725))

(assert (=> b!502795 m!483697))

(declare-fun m!483727 () Bool)

(assert (=> b!502795 m!483727))

(assert (=> b!502795 m!483697))

(declare-fun m!483729 () Bool)

(assert (=> b!502795 m!483729))

(declare-fun m!483731 () Bool)

(assert (=> b!502795 m!483731))

(declare-fun m!483733 () Bool)

(assert (=> b!502795 m!483733))

(push 1)

