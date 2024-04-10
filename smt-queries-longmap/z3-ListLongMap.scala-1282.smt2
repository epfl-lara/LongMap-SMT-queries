; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26252 () Bool)

(assert start!26252)

(declare-fun b!271821 () Bool)

(declare-fun res!135814 () Bool)

(declare-fun e!174650 () Bool)

(assert (=> b!271821 (=> (not res!135814) (not e!174650))))

(declare-datatypes ((array!13349 0))(
  ( (array!13350 (arr!6324 (Array (_ BitVec 32) (_ BitVec 64))) (size!6676 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13349)

(declare-datatypes ((List!4132 0))(
  ( (Nil!4129) (Cons!4128 (h!4795 (_ BitVec 64)) (t!9214 List!4132)) )
))
(declare-fun arrayNoDuplicates!0 (array!13349 (_ BitVec 32) List!4132) Bool)

(assert (=> b!271821 (= res!135814 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4129))))

(declare-fun b!271822 () Bool)

(declare-fun res!135812 () Bool)

(declare-fun e!174648 () Bool)

(assert (=> b!271822 (=> (not res!135812) (not e!174648))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13349 (_ BitVec 32)) Bool)

(assert (=> b!271822 (= res!135812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!135813 () Bool)

(assert (=> start!26252 (=> (not res!135813) (not e!174650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26252 (= res!135813 (validMask!0 mask!3868))))

(assert (=> start!26252 e!174650))

(declare-fun array_inv!4287 (array!13349) Bool)

(assert (=> start!26252 (array_inv!4287 a!3325)))

(assert (=> start!26252 true))

(declare-fun b!271823 () Bool)

(declare-fun res!135815 () Bool)

(assert (=> b!271823 (=> (not res!135815) (not e!174648))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271823 (= res!135815 (not (= startIndex!26 i!1267)))))

(declare-fun b!271824 () Bool)

(declare-fun res!135811 () Bool)

(assert (=> b!271824 (=> (not res!135811) (not e!174650))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271824 (= res!135811 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271825 () Bool)

(assert (=> b!271825 (= e!174648 (not true))))

(assert (=> b!271825 (arrayNoDuplicates!0 (array!13350 (store (arr!6324 a!3325) i!1267 k0!2581) (size!6676 a!3325)) #b00000000000000000000000000000000 Nil!4129)))

(declare-datatypes ((Unit!8451 0))(
  ( (Unit!8452) )
))
(declare-fun lt!135865 () Unit!8451)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4132) Unit!8451)

(assert (=> b!271825 (= lt!135865 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4129))))

(declare-fun b!271826 () Bool)

(declare-fun res!135819 () Bool)

(assert (=> b!271826 (=> (not res!135819) (not e!174650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271826 (= res!135819 (validKeyInArray!0 k0!2581))))

(declare-fun b!271827 () Bool)

(declare-fun res!135817 () Bool)

(assert (=> b!271827 (=> (not res!135817) (not e!174650))))

(assert (=> b!271827 (= res!135817 (and (= (size!6676 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6676 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6676 a!3325))))))

(declare-fun b!271828 () Bool)

(assert (=> b!271828 (= e!174650 e!174648)))

(declare-fun res!135816 () Bool)

(assert (=> b!271828 (=> (not res!135816) (not e!174648))))

(declare-datatypes ((SeekEntryResult!1482 0))(
  ( (MissingZero!1482 (index!8098 (_ BitVec 32))) (Found!1482 (index!8099 (_ BitVec 32))) (Intermediate!1482 (undefined!2294 Bool) (index!8100 (_ BitVec 32)) (x!26423 (_ BitVec 32))) (Undefined!1482) (MissingVacant!1482 (index!8101 (_ BitVec 32))) )
))
(declare-fun lt!135864 () SeekEntryResult!1482)

(assert (=> b!271828 (= res!135816 (or (= lt!135864 (MissingZero!1482 i!1267)) (= lt!135864 (MissingVacant!1482 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13349 (_ BitVec 32)) SeekEntryResult!1482)

(assert (=> b!271828 (= lt!135864 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271829 () Bool)

(declare-fun res!135818 () Bool)

(assert (=> b!271829 (=> (not res!135818) (not e!174648))))

(assert (=> b!271829 (= res!135818 (validKeyInArray!0 (select (arr!6324 a!3325) startIndex!26)))))

(assert (= (and start!26252 res!135813) b!271827))

(assert (= (and b!271827 res!135817) b!271826))

(assert (= (and b!271826 res!135819) b!271821))

(assert (= (and b!271821 res!135814) b!271824))

(assert (= (and b!271824 res!135811) b!271828))

(assert (= (and b!271828 res!135816) b!271822))

(assert (= (and b!271822 res!135812) b!271823))

(assert (= (and b!271823 res!135815) b!271829))

(assert (= (and b!271829 res!135818) b!271825))

(declare-fun m!286989 () Bool)

(assert (=> b!271822 m!286989))

(declare-fun m!286991 () Bool)

(assert (=> b!271821 m!286991))

(declare-fun m!286993 () Bool)

(assert (=> b!271828 m!286993))

(declare-fun m!286995 () Bool)

(assert (=> b!271824 m!286995))

(declare-fun m!286997 () Bool)

(assert (=> start!26252 m!286997))

(declare-fun m!286999 () Bool)

(assert (=> start!26252 m!286999))

(declare-fun m!287001 () Bool)

(assert (=> b!271826 m!287001))

(declare-fun m!287003 () Bool)

(assert (=> b!271825 m!287003))

(declare-fun m!287005 () Bool)

(assert (=> b!271825 m!287005))

(declare-fun m!287007 () Bool)

(assert (=> b!271825 m!287007))

(declare-fun m!287009 () Bool)

(assert (=> b!271829 m!287009))

(assert (=> b!271829 m!287009))

(declare-fun m!287011 () Bool)

(assert (=> b!271829 m!287011))

(check-sat (not b!271826) (not b!271821) (not b!271822) (not start!26252) (not b!271828) (not b!271825) (not b!271829) (not b!271824))
(check-sat)
