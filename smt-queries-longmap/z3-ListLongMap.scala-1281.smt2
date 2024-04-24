; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26244 () Bool)

(assert start!26244)

(declare-fun b!271732 () Bool)

(declare-fun res!135697 () Bool)

(declare-fun e!174636 () Bool)

(assert (=> b!271732 (=> (not res!135697) (not e!174636))))

(declare-datatypes ((array!13340 0))(
  ( (array!13341 (arr!6319 (Array (_ BitVec 32) (_ BitVec 64))) (size!6671 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13340)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271732 (= res!135697 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271733 () Bool)

(declare-fun res!135701 () Bool)

(assert (=> b!271733 (=> (not res!135701) (not e!174636))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271733 (= res!135701 (and (= (size!6671 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6671 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6671 a!3325))))))

(declare-fun b!271734 () Bool)

(declare-fun res!135696 () Bool)

(declare-fun e!174638 () Bool)

(assert (=> b!271734 (=> (not res!135696) (not e!174638))))

(declare-datatypes ((List!4040 0))(
  ( (Nil!4037) (Cons!4036 (h!4703 (_ BitVec 64)) (t!9114 List!4040)) )
))
(declare-fun noDuplicate!149 (List!4040) Bool)

(assert (=> b!271734 (= res!135696 (noDuplicate!149 Nil!4037))))

(declare-fun b!271735 () Bool)

(declare-fun res!135707 () Bool)

(assert (=> b!271735 (=> (not res!135707) (not e!174638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13340 (_ BitVec 32)) Bool)

(assert (=> b!271735 (= res!135707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271736 () Bool)

(declare-fun res!135700 () Bool)

(assert (=> b!271736 (=> (not res!135700) (not e!174638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271736 (= res!135700 (validKeyInArray!0 (select (arr!6319 a!3325) startIndex!26)))))

(declare-fun b!271737 () Bool)

(assert (=> b!271737 (= e!174638 false)))

(declare-fun lt!135900 () Bool)

(declare-fun contains!1933 (List!4040 (_ BitVec 64)) Bool)

(assert (=> b!271737 (= lt!135900 (contains!1933 Nil!4037 k0!2581))))

(declare-fun b!271738 () Bool)

(declare-fun res!135704 () Bool)

(assert (=> b!271738 (=> (not res!135704) (not e!174638))))

(assert (=> b!271738 (= res!135704 (and (bvslt (size!6671 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6671 a!3325))))))

(declare-fun b!271739 () Bool)

(declare-fun res!135708 () Bool)

(assert (=> b!271739 (=> (not res!135708) (not e!174638))))

(assert (=> b!271739 (= res!135708 (not (contains!1933 Nil!4037 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271740 () Bool)

(assert (=> b!271740 (= e!174636 e!174638)))

(declare-fun res!135703 () Bool)

(assert (=> b!271740 (=> (not res!135703) (not e!174638))))

(declare-datatypes ((SeekEntryResult!1442 0))(
  ( (MissingZero!1442 (index!7938 (_ BitVec 32))) (Found!1442 (index!7939 (_ BitVec 32))) (Intermediate!1442 (undefined!2254 Bool) (index!7940 (_ BitVec 32)) (x!26375 (_ BitVec 32))) (Undefined!1442) (MissingVacant!1442 (index!7941 (_ BitVec 32))) )
))
(declare-fun lt!135899 () SeekEntryResult!1442)

(assert (=> b!271740 (= res!135703 (or (= lt!135899 (MissingZero!1442 i!1267)) (= lt!135899 (MissingVacant!1442 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13340 (_ BitVec 32)) SeekEntryResult!1442)

(assert (=> b!271740 (= lt!135899 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271741 () Bool)

(declare-fun res!135699 () Bool)

(assert (=> b!271741 (=> (not res!135699) (not e!174636))))

(declare-fun arrayNoDuplicates!0 (array!13340 (_ BitVec 32) List!4040) Bool)

(assert (=> b!271741 (= res!135699 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4037))))

(declare-fun b!271743 () Bool)

(declare-fun res!135706 () Bool)

(assert (=> b!271743 (=> (not res!135706) (not e!174636))))

(assert (=> b!271743 (= res!135706 (validKeyInArray!0 k0!2581))))

(declare-fun b!271744 () Bool)

(declare-fun res!135698 () Bool)

(assert (=> b!271744 (=> (not res!135698) (not e!174638))))

(assert (=> b!271744 (= res!135698 (not (contains!1933 Nil!4037 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!135702 () Bool)

(assert (=> start!26244 (=> (not res!135702) (not e!174636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26244 (= res!135702 (validMask!0 mask!3868))))

(assert (=> start!26244 e!174636))

(declare-fun array_inv!4269 (array!13340) Bool)

(assert (=> start!26244 (array_inv!4269 a!3325)))

(assert (=> start!26244 true))

(declare-fun b!271742 () Bool)

(declare-fun res!135705 () Bool)

(assert (=> b!271742 (=> (not res!135705) (not e!174638))))

(assert (=> b!271742 (= res!135705 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26244 res!135702) b!271733))

(assert (= (and b!271733 res!135701) b!271743))

(assert (= (and b!271743 res!135706) b!271741))

(assert (= (and b!271741 res!135699) b!271732))

(assert (= (and b!271732 res!135697) b!271740))

(assert (= (and b!271740 res!135703) b!271735))

(assert (= (and b!271735 res!135707) b!271742))

(assert (= (and b!271742 res!135705) b!271736))

(assert (= (and b!271736 res!135700) b!271738))

(assert (= (and b!271738 res!135704) b!271734))

(assert (= (and b!271734 res!135696) b!271739))

(assert (= (and b!271739 res!135708) b!271744))

(assert (= (and b!271744 res!135698) b!271737))

(declare-fun m!287093 () Bool)

(assert (=> b!271732 m!287093))

(declare-fun m!287095 () Bool)

(assert (=> b!271743 m!287095))

(declare-fun m!287097 () Bool)

(assert (=> b!271734 m!287097))

(declare-fun m!287099 () Bool)

(assert (=> b!271735 m!287099))

(declare-fun m!287101 () Bool)

(assert (=> b!271744 m!287101))

(declare-fun m!287103 () Bool)

(assert (=> b!271741 m!287103))

(declare-fun m!287105 () Bool)

(assert (=> b!271739 m!287105))

(declare-fun m!287107 () Bool)

(assert (=> b!271736 m!287107))

(assert (=> b!271736 m!287107))

(declare-fun m!287109 () Bool)

(assert (=> b!271736 m!287109))

(declare-fun m!287111 () Bool)

(assert (=> b!271737 m!287111))

(declare-fun m!287113 () Bool)

(assert (=> start!26244 m!287113))

(declare-fun m!287115 () Bool)

(assert (=> start!26244 m!287115))

(declare-fun m!287117 () Bool)

(assert (=> b!271740 m!287117))

(check-sat (not b!271737) (not b!271744) (not b!271736) (not start!26244) (not b!271741) (not b!271732) (not b!271739) (not b!271734) (not b!271743) (not b!271740) (not b!271735))
(check-sat)
