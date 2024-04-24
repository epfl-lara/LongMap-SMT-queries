; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26736 () Bool)

(assert start!26736)

(declare-fun b!277765 () Bool)

(declare-datatypes ((Unit!8753 0))(
  ( (Unit!8754) )
))
(declare-fun e!177187 () Unit!8753)

(declare-fun lt!138085 () Unit!8753)

(assert (=> b!277765 (= e!177187 lt!138085)))

(declare-datatypes ((array!13832 0))(
  ( (array!13833 (arr!6565 (Array (_ BitVec 32) (_ BitVec 64))) (size!6917 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13832)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13832 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8753)

(assert (=> b!277765 (= lt!138085 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!138087 () array!13832)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13832 (_ BitVec 32)) Bool)

(assert (=> b!277765 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138087 mask!3868)))

(declare-fun b!277766 () Bool)

(declare-fun e!177188 () Bool)

(assert (=> b!277766 (= e!177188 (not true))))

(declare-datatypes ((SeekEntryResult!1688 0))(
  ( (MissingZero!1688 (index!8922 (_ BitVec 32))) (Found!1688 (index!8923 (_ BitVec 32))) (Intermediate!1688 (undefined!2500 Bool) (index!8924 (_ BitVec 32)) (x!27277 (_ BitVec 32))) (Undefined!1688) (MissingVacant!1688 (index!8925 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13832 (_ BitVec 32)) SeekEntryResult!1688)

(assert (=> b!277766 (= (seekEntryOrOpen!0 k0!2581 lt!138087 mask!3868) (Found!1688 i!1267))))

(declare-fun lt!138086 () Unit!8753)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13832 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8753)

(assert (=> b!277766 (= lt!138086 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!138083 () Unit!8753)

(assert (=> b!277766 (= lt!138083 e!177187)))

(declare-fun c!45643 () Bool)

(assert (=> b!277766 (= c!45643 (bvslt startIndex!26 (bvsub (size!6917 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277767 () Bool)

(declare-fun res!141582 () Bool)

(declare-fun e!177189 () Bool)

(assert (=> b!277767 (=> (not res!141582) (not e!177189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277767 (= res!141582 (validKeyInArray!0 k0!2581))))

(declare-fun b!277768 () Bool)

(declare-fun e!177191 () Bool)

(assert (=> b!277768 (= e!177191 e!177188)))

(declare-fun res!141581 () Bool)

(assert (=> b!277768 (=> (not res!141581) (not e!177188))))

(assert (=> b!277768 (= res!141581 (= startIndex!26 i!1267))))

(assert (=> b!277768 (= lt!138087 (array!13833 (store (arr!6565 a!3325) i!1267 k0!2581) (size!6917 a!3325)))))

(declare-fun res!141586 () Bool)

(assert (=> start!26736 (=> (not res!141586) (not e!177189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26736 (= res!141586 (validMask!0 mask!3868))))

(assert (=> start!26736 e!177189))

(declare-fun array_inv!4515 (array!13832) Bool)

(assert (=> start!26736 (array_inv!4515 a!3325)))

(assert (=> start!26736 true))

(declare-fun b!277769 () Bool)

(declare-fun Unit!8755 () Unit!8753)

(assert (=> b!277769 (= e!177187 Unit!8755)))

(declare-fun b!277770 () Bool)

(declare-fun res!141587 () Bool)

(assert (=> b!277770 (=> (not res!141587) (not e!177191))))

(assert (=> b!277770 (= res!141587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277771 () Bool)

(declare-fun res!141583 () Bool)

(assert (=> b!277771 (=> (not res!141583) (not e!177189))))

(assert (=> b!277771 (= res!141583 (and (= (size!6917 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6917 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6917 a!3325))))))

(declare-fun b!277772 () Bool)

(declare-fun res!141584 () Bool)

(assert (=> b!277772 (=> (not res!141584) (not e!177189))))

(declare-datatypes ((List!4286 0))(
  ( (Nil!4283) (Cons!4282 (h!4949 (_ BitVec 64)) (t!9360 List!4286)) )
))
(declare-fun arrayNoDuplicates!0 (array!13832 (_ BitVec 32) List!4286) Bool)

(assert (=> b!277772 (= res!141584 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4283))))

(declare-fun b!277773 () Bool)

(assert (=> b!277773 (= e!177189 e!177191)))

(declare-fun res!141585 () Bool)

(assert (=> b!277773 (=> (not res!141585) (not e!177191))))

(declare-fun lt!138084 () SeekEntryResult!1688)

(assert (=> b!277773 (= res!141585 (or (= lt!138084 (MissingZero!1688 i!1267)) (= lt!138084 (MissingVacant!1688 i!1267))))))

(assert (=> b!277773 (= lt!138084 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277774 () Bool)

(declare-fun res!141588 () Bool)

(assert (=> b!277774 (=> (not res!141588) (not e!177189))))

(declare-fun arrayContainsKey!0 (array!13832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277774 (= res!141588 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26736 res!141586) b!277771))

(assert (= (and b!277771 res!141583) b!277767))

(assert (= (and b!277767 res!141582) b!277772))

(assert (= (and b!277772 res!141584) b!277774))

(assert (= (and b!277774 res!141588) b!277773))

(assert (= (and b!277773 res!141585) b!277770))

(assert (= (and b!277770 res!141587) b!277768))

(assert (= (and b!277768 res!141581) b!277766))

(assert (= (and b!277766 c!45643) b!277765))

(assert (= (and b!277766 (not c!45643)) b!277769))

(declare-fun m!292877 () Bool)

(assert (=> b!277768 m!292877))

(declare-fun m!292879 () Bool)

(assert (=> b!277773 m!292879))

(declare-fun m!292881 () Bool)

(assert (=> start!26736 m!292881))

(declare-fun m!292883 () Bool)

(assert (=> start!26736 m!292883))

(declare-fun m!292885 () Bool)

(assert (=> b!277767 m!292885))

(declare-fun m!292887 () Bool)

(assert (=> b!277772 m!292887))

(declare-fun m!292889 () Bool)

(assert (=> b!277765 m!292889))

(declare-fun m!292891 () Bool)

(assert (=> b!277765 m!292891))

(declare-fun m!292893 () Bool)

(assert (=> b!277774 m!292893))

(declare-fun m!292895 () Bool)

(assert (=> b!277770 m!292895))

(declare-fun m!292897 () Bool)

(assert (=> b!277766 m!292897))

(declare-fun m!292899 () Bool)

(assert (=> b!277766 m!292899))

(check-sat (not b!277765) (not b!277767) (not b!277773) (not b!277774) (not start!26736) (not b!277770) (not b!277772) (not b!277766))
(check-sat)
