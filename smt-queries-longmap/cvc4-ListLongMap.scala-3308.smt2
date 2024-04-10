; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45796 () Bool)

(assert start!45796)

(declare-fun b!506917 () Bool)

(declare-fun e!296682 () Bool)

(declare-fun e!296680 () Bool)

(assert (=> b!506917 (= e!296682 e!296680)))

(declare-fun res!307886 () Bool)

(assert (=> b!506917 (=> (not res!307886) (not e!296680))))

(declare-datatypes ((SeekEntryResult!4123 0))(
  ( (MissingZero!4123 (index!18680 (_ BitVec 32))) (Found!4123 (index!18681 (_ BitVec 32))) (Intermediate!4123 (undefined!4935 Bool) (index!18682 (_ BitVec 32)) (x!47676 (_ BitVec 32))) (Undefined!4123) (MissingVacant!4123 (index!18683 (_ BitVec 32))) )
))
(declare-fun lt!231353 () SeekEntryResult!4123)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506917 (= res!307886 (or (= lt!231353 (MissingZero!4123 i!1204)) (= lt!231353 (MissingVacant!4123 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32552 0))(
  ( (array!32553 (arr!15656 (Array (_ BitVec 32) (_ BitVec 64))) (size!16020 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32552)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32552 (_ BitVec 32)) SeekEntryResult!4123)

(assert (=> b!506917 (= lt!231353 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506918 () Bool)

(declare-fun res!307882 () Bool)

(assert (=> b!506918 (=> (not res!307882) (not e!296682))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506918 (= res!307882 (and (= (size!16020 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16020 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16020 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506919 () Bool)

(declare-fun res!307883 () Bool)

(assert (=> b!506919 (=> (not res!307883) (not e!296682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506919 (= res!307883 (validKeyInArray!0 k!2280))))

(declare-fun res!307885 () Bool)

(assert (=> start!45796 (=> (not res!307885) (not e!296682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45796 (= res!307885 (validMask!0 mask!3524))))

(assert (=> start!45796 e!296682))

(assert (=> start!45796 true))

(declare-fun array_inv!11452 (array!32552) Bool)

(assert (=> start!45796 (array_inv!11452 a!3235)))

(declare-fun b!506920 () Bool)

(declare-fun res!307878 () Bool)

(assert (=> b!506920 (=> (not res!307878) (not e!296680))))

(declare-datatypes ((List!9814 0))(
  ( (Nil!9811) (Cons!9810 (h!10687 (_ BitVec 64)) (t!16042 List!9814)) )
))
(declare-fun arrayNoDuplicates!0 (array!32552 (_ BitVec 32) List!9814) Bool)

(assert (=> b!506920 (= res!307878 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9811))))

(declare-fun b!506921 () Bool)

(declare-fun e!296679 () Bool)

(assert (=> b!506921 (= e!296679 (= (seekEntryOrOpen!0 (select (arr!15656 a!3235) j!176) a!3235 mask!3524) (Found!4123 j!176)))))

(declare-fun b!506922 () Bool)

(declare-fun res!307877 () Bool)

(assert (=> b!506922 (=> (not res!307877) (not e!296682))))

(assert (=> b!506922 (= res!307877 (validKeyInArray!0 (select (arr!15656 a!3235) j!176)))))

(declare-fun b!506923 () Bool)

(declare-fun res!307881 () Bool)

(assert (=> b!506923 (=> (not res!307881) (not e!296682))))

(declare-fun arrayContainsKey!0 (array!32552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506923 (= res!307881 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506924 () Bool)

(declare-fun e!296681 () Bool)

(assert (=> b!506924 (= e!296681 true)))

(assert (=> b!506924 false))

(declare-fun b!506925 () Bool)

(declare-fun e!296678 () Bool)

(assert (=> b!506925 (= e!296680 (not e!296678))))

(declare-fun res!307879 () Bool)

(assert (=> b!506925 (=> res!307879 e!296678)))

(declare-fun lt!231357 () SeekEntryResult!4123)

(declare-fun lt!231356 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32552 (_ BitVec 32)) SeekEntryResult!4123)

(assert (=> b!506925 (= res!307879 (= lt!231357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231356 (select (store (arr!15656 a!3235) i!1204 k!2280) j!176) (array!32553 (store (arr!15656 a!3235) i!1204 k!2280) (size!16020 a!3235)) mask!3524)))))

(declare-fun lt!231355 () (_ BitVec 32))

(assert (=> b!506925 (= lt!231357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231355 (select (arr!15656 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506925 (= lt!231356 (toIndex!0 (select (store (arr!15656 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506925 (= lt!231355 (toIndex!0 (select (arr!15656 a!3235) j!176) mask!3524))))

(assert (=> b!506925 e!296679))

(declare-fun res!307880 () Bool)

(assert (=> b!506925 (=> (not res!307880) (not e!296679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32552 (_ BitVec 32)) Bool)

(assert (=> b!506925 (= res!307880 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15534 0))(
  ( (Unit!15535) )
))
(declare-fun lt!231354 () Unit!15534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15534)

(assert (=> b!506925 (= lt!231354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506926 () Bool)

(declare-fun res!307876 () Bool)

(assert (=> b!506926 (=> (not res!307876) (not e!296680))))

(assert (=> b!506926 (= res!307876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506927 () Bool)

(assert (=> b!506927 (= e!296678 e!296681)))

(declare-fun res!307884 () Bool)

(assert (=> b!506927 (=> res!307884 e!296681)))

(declare-fun lt!231358 () Bool)

(assert (=> b!506927 (= res!307884 (or (and (not lt!231358) (undefined!4935 lt!231357)) (and (not lt!231358) (not (undefined!4935 lt!231357)))))))

(assert (=> b!506927 (= lt!231358 (not (is-Intermediate!4123 lt!231357)))))

(assert (= (and start!45796 res!307885) b!506918))

(assert (= (and b!506918 res!307882) b!506922))

(assert (= (and b!506922 res!307877) b!506919))

(assert (= (and b!506919 res!307883) b!506923))

(assert (= (and b!506923 res!307881) b!506917))

(assert (= (and b!506917 res!307886) b!506926))

(assert (= (and b!506926 res!307876) b!506920))

(assert (= (and b!506920 res!307878) b!506925))

(assert (= (and b!506925 res!307880) b!506921))

(assert (= (and b!506925 (not res!307879)) b!506927))

(assert (= (and b!506927 (not res!307884)) b!506924))

(declare-fun m!487623 () Bool)

(assert (=> b!506922 m!487623))

(assert (=> b!506922 m!487623))

(declare-fun m!487625 () Bool)

(assert (=> b!506922 m!487625))

(declare-fun m!487627 () Bool)

(assert (=> b!506923 m!487627))

(declare-fun m!487629 () Bool)

(assert (=> b!506919 m!487629))

(assert (=> b!506925 m!487623))

(declare-fun m!487631 () Bool)

(assert (=> b!506925 m!487631))

(declare-fun m!487633 () Bool)

(assert (=> b!506925 m!487633))

(declare-fun m!487635 () Bool)

(assert (=> b!506925 m!487635))

(declare-fun m!487637 () Bool)

(assert (=> b!506925 m!487637))

(assert (=> b!506925 m!487637))

(declare-fun m!487639 () Bool)

(assert (=> b!506925 m!487639))

(assert (=> b!506925 m!487623))

(declare-fun m!487641 () Bool)

(assert (=> b!506925 m!487641))

(assert (=> b!506925 m!487623))

(declare-fun m!487643 () Bool)

(assert (=> b!506925 m!487643))

(assert (=> b!506925 m!487637))

(declare-fun m!487645 () Bool)

(assert (=> b!506925 m!487645))

(declare-fun m!487647 () Bool)

(assert (=> b!506926 m!487647))

(assert (=> b!506921 m!487623))

(assert (=> b!506921 m!487623))

(declare-fun m!487649 () Bool)

(assert (=> b!506921 m!487649))

(declare-fun m!487651 () Bool)

(assert (=> start!45796 m!487651))

(declare-fun m!487653 () Bool)

(assert (=> start!45796 m!487653))

(declare-fun m!487655 () Bool)

(assert (=> b!506920 m!487655))

(declare-fun m!487657 () Bool)

(assert (=> b!506917 m!487657))

(push 1)

