; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26674 () Bool)

(assert start!26674)

(declare-fun b!276855 () Bool)

(declare-fun res!140849 () Bool)

(declare-fun e!176809 () Bool)

(assert (=> b!276855 (=> (not res!140849) (not e!176809))))

(declare-datatypes ((array!13771 0))(
  ( (array!13772 (arr!6535 (Array (_ BitVec 32) (_ BitVec 64))) (size!6887 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13771)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276855 (= res!140849 (and (= (size!6887 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6887 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6887 a!3325))))))

(declare-fun res!140850 () Bool)

(assert (=> start!26674 (=> (not res!140850) (not e!176809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26674 (= res!140850 (validMask!0 mask!3868))))

(assert (=> start!26674 e!176809))

(declare-fun array_inv!4498 (array!13771) Bool)

(assert (=> start!26674 (array_inv!4498 a!3325)))

(assert (=> start!26674 true))

(declare-fun b!276856 () Bool)

(declare-fun e!176808 () Bool)

(assert (=> b!276856 (= e!176808 false)))

(declare-fun lt!137770 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13771 (_ BitVec 32)) Bool)

(assert (=> b!276856 (= lt!137770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276857 () Bool)

(assert (=> b!276857 (= e!176809 e!176808)))

(declare-fun res!140846 () Bool)

(assert (=> b!276857 (=> (not res!140846) (not e!176808))))

(declare-datatypes ((SeekEntryResult!1693 0))(
  ( (MissingZero!1693 (index!8942 (_ BitVec 32))) (Found!1693 (index!8943 (_ BitVec 32))) (Intermediate!1693 (undefined!2505 Bool) (index!8944 (_ BitVec 32)) (x!27194 (_ BitVec 32))) (Undefined!1693) (MissingVacant!1693 (index!8945 (_ BitVec 32))) )
))
(declare-fun lt!137769 () SeekEntryResult!1693)

(assert (=> b!276857 (= res!140846 (or (= lt!137769 (MissingZero!1693 i!1267)) (= lt!137769 (MissingVacant!1693 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13771 (_ BitVec 32)) SeekEntryResult!1693)

(assert (=> b!276857 (= lt!137769 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276858 () Bool)

(declare-fun res!140847 () Bool)

(assert (=> b!276858 (=> (not res!140847) (not e!176809))))

(declare-fun arrayContainsKey!0 (array!13771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276858 (= res!140847 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276859 () Bool)

(declare-fun res!140848 () Bool)

(assert (=> b!276859 (=> (not res!140848) (not e!176809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276859 (= res!140848 (validKeyInArray!0 k!2581))))

(declare-fun b!276860 () Bool)

(declare-fun res!140845 () Bool)

(assert (=> b!276860 (=> (not res!140845) (not e!176809))))

(declare-datatypes ((List!4343 0))(
  ( (Nil!4340) (Cons!4339 (h!5006 (_ BitVec 64)) (t!9425 List!4343)) )
))
(declare-fun arrayNoDuplicates!0 (array!13771 (_ BitVec 32) List!4343) Bool)

(assert (=> b!276860 (= res!140845 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4340))))

(assert (= (and start!26674 res!140850) b!276855))

(assert (= (and b!276855 res!140849) b!276859))

(assert (= (and b!276859 res!140848) b!276860))

(assert (= (and b!276860 res!140845) b!276858))

(assert (= (and b!276858 res!140847) b!276857))

(assert (= (and b!276857 res!140846) b!276856))

(declare-fun m!292093 () Bool)

(assert (=> start!26674 m!292093))

(declare-fun m!292095 () Bool)

(assert (=> start!26674 m!292095))

(declare-fun m!292097 () Bool)

(assert (=> b!276857 m!292097))

(declare-fun m!292099 () Bool)

(assert (=> b!276858 m!292099))

(declare-fun m!292101 () Bool)

(assert (=> b!276859 m!292101))

(declare-fun m!292103 () Bool)

(assert (=> b!276860 m!292103))

(declare-fun m!292105 () Bool)

(assert (=> b!276856 m!292105))

(push 1)

