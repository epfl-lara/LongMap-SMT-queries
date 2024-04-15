; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27092 () Bool)

(assert start!27092)

(declare-fun b!279722 () Bool)

(declare-fun res!142852 () Bool)

(declare-fun e!178308 () Bool)

(assert (=> b!279722 (=> (not res!142852) (not e!178308))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279722 (= res!142852 (not (= startIndex!26 i!1267)))))

(declare-fun b!279723 () Bool)

(declare-fun res!142855 () Bool)

(assert (=> b!279723 (=> (not res!142855) (not e!178308))))

(declare-datatypes ((List!4372 0))(
  ( (Nil!4369) (Cons!4368 (h!5038 (_ BitVec 64)) (t!9445 List!4372)) )
))
(declare-fun contains!1951 (List!4372 (_ BitVec 64)) Bool)

(assert (=> b!279723 (= res!142855 (not (contains!1951 Nil!4369 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279724 () Bool)

(assert (=> b!279724 (= e!178308 false)))

(declare-fun lt!138558 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!279724 (= lt!138558 (contains!1951 Nil!4369 k0!2581))))

(declare-fun res!142847 () Bool)

(declare-fun e!178306 () Bool)

(assert (=> start!27092 (=> (not res!142847) (not e!178306))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27092 (= res!142847 (validMask!0 mask!3868))))

(assert (=> start!27092 e!178306))

(declare-datatypes ((array!13899 0))(
  ( (array!13900 (arr!6591 (Array (_ BitVec 32) (_ BitVec 64))) (size!6944 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13899)

(declare-fun array_inv!4563 (array!13899) Bool)

(assert (=> start!27092 (array_inv!4563 a!3325)))

(assert (=> start!27092 true))

(declare-fun b!279725 () Bool)

(declare-fun res!142848 () Bool)

(assert (=> b!279725 (=> (not res!142848) (not e!178306))))

(assert (=> b!279725 (= res!142848 (and (= (size!6944 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6944 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6944 a!3325))))))

(declare-fun b!279726 () Bool)

(declare-fun res!142854 () Bool)

(assert (=> b!279726 (=> (not res!142854) (not e!178308))))

(assert (=> b!279726 (= res!142854 (not (contains!1951 Nil!4369 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279727 () Bool)

(declare-fun res!142843 () Bool)

(assert (=> b!279727 (=> (not res!142843) (not e!178308))))

(assert (=> b!279727 (= res!142843 (and (bvslt (size!6944 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6944 a!3325))))))

(declare-fun b!279728 () Bool)

(declare-fun res!142844 () Bool)

(assert (=> b!279728 (=> (not res!142844) (not e!178308))))

(declare-fun noDuplicate!160 (List!4372) Bool)

(assert (=> b!279728 (= res!142844 (noDuplicate!160 Nil!4369))))

(declare-fun b!279729 () Bool)

(assert (=> b!279729 (= e!178306 e!178308)))

(declare-fun res!142845 () Bool)

(assert (=> b!279729 (=> (not res!142845) (not e!178308))))

(declare-datatypes ((SeekEntryResult!1748 0))(
  ( (MissingZero!1748 (index!9162 (_ BitVec 32))) (Found!1748 (index!9163 (_ BitVec 32))) (Intermediate!1748 (undefined!2560 Bool) (index!9164 (_ BitVec 32)) (x!27425 (_ BitVec 32))) (Undefined!1748) (MissingVacant!1748 (index!9165 (_ BitVec 32))) )
))
(declare-fun lt!138557 () SeekEntryResult!1748)

(assert (=> b!279729 (= res!142845 (or (= lt!138557 (MissingZero!1748 i!1267)) (= lt!138557 (MissingVacant!1748 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13899 (_ BitVec 32)) SeekEntryResult!1748)

(assert (=> b!279729 (= lt!138557 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279730 () Bool)

(declare-fun res!142850 () Bool)

(assert (=> b!279730 (=> (not res!142850) (not e!178308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279730 (= res!142850 (validKeyInArray!0 (select (arr!6591 a!3325) startIndex!26)))))

(declare-fun b!279731 () Bool)

(declare-fun res!142851 () Bool)

(assert (=> b!279731 (=> (not res!142851) (not e!178306))))

(assert (=> b!279731 (= res!142851 (validKeyInArray!0 k0!2581))))

(declare-fun b!279732 () Bool)

(declare-fun res!142846 () Bool)

(assert (=> b!279732 (=> (not res!142846) (not e!178306))))

(declare-fun arrayNoDuplicates!0 (array!13899 (_ BitVec 32) List!4372) Bool)

(assert (=> b!279732 (= res!142846 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4369))))

(declare-fun b!279733 () Bool)

(declare-fun res!142853 () Bool)

(assert (=> b!279733 (=> (not res!142853) (not e!178306))))

(declare-fun arrayContainsKey!0 (array!13899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279733 (= res!142853 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279734 () Bool)

(declare-fun res!142849 () Bool)

(assert (=> b!279734 (=> (not res!142849) (not e!178308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13899 (_ BitVec 32)) Bool)

(assert (=> b!279734 (= res!142849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27092 res!142847) b!279725))

(assert (= (and b!279725 res!142848) b!279731))

(assert (= (and b!279731 res!142851) b!279732))

(assert (= (and b!279732 res!142846) b!279733))

(assert (= (and b!279733 res!142853) b!279729))

(assert (= (and b!279729 res!142845) b!279734))

(assert (= (and b!279734 res!142849) b!279722))

(assert (= (and b!279722 res!142852) b!279730))

(assert (= (and b!279730 res!142850) b!279727))

(assert (= (and b!279727 res!142843) b!279728))

(assert (= (and b!279728 res!142844) b!279726))

(assert (= (and b!279726 res!142854) b!279723))

(assert (= (and b!279723 res!142855) b!279724))

(declare-fun m!293897 () Bool)

(assert (=> b!279723 m!293897))

(declare-fun m!293899 () Bool)

(assert (=> b!279726 m!293899))

(declare-fun m!293901 () Bool)

(assert (=> b!279734 m!293901))

(declare-fun m!293903 () Bool)

(assert (=> b!279732 m!293903))

(declare-fun m!293905 () Bool)

(assert (=> b!279733 m!293905))

(declare-fun m!293907 () Bool)

(assert (=> b!279729 m!293907))

(declare-fun m!293909 () Bool)

(assert (=> b!279731 m!293909))

(declare-fun m!293911 () Bool)

(assert (=> b!279728 m!293911))

(declare-fun m!293913 () Bool)

(assert (=> b!279724 m!293913))

(declare-fun m!293915 () Bool)

(assert (=> start!27092 m!293915))

(declare-fun m!293917 () Bool)

(assert (=> start!27092 m!293917))

(declare-fun m!293919 () Bool)

(assert (=> b!279730 m!293919))

(assert (=> b!279730 m!293919))

(declare-fun m!293921 () Bool)

(assert (=> b!279730 m!293921))

(check-sat (not start!27092) (not b!279733) (not b!279731) (not b!279723) (not b!279734) (not b!279732) (not b!279730) (not b!279728) (not b!279726) (not b!279724) (not b!279729))
(check-sat)
