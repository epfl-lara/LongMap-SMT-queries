; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26690 () Bool)

(assert start!26690)

(declare-fun res!140896 () Bool)

(declare-fun e!176773 () Bool)

(assert (=> start!26690 (=> (not res!140896) (not e!176773))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26690 (= res!140896 (validMask!0 mask!3868))))

(assert (=> start!26690 e!176773))

(declare-datatypes ((array!13776 0))(
  ( (array!13777 (arr!6537 (Array (_ BitVec 32) (_ BitVec 64))) (size!6890 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13776)

(declare-fun array_inv!4509 (array!13776) Bool)

(assert (=> start!26690 (array_inv!4509 a!3325)))

(assert (=> start!26690 true))

(declare-fun b!276851 () Bool)

(declare-fun e!176775 () Bool)

(assert (=> b!276851 (= e!176773 e!176775)))

(declare-fun res!140894 () Bool)

(assert (=> b!276851 (=> (not res!140894) (not e!176775))))

(declare-datatypes ((SeekEntryResult!1694 0))(
  ( (MissingZero!1694 (index!8946 (_ BitVec 32))) (Found!1694 (index!8947 (_ BitVec 32))) (Intermediate!1694 (undefined!2506 Bool) (index!8948 (_ BitVec 32)) (x!27218 (_ BitVec 32))) (Undefined!1694) (MissingVacant!1694 (index!8949 (_ BitVec 32))) )
))
(declare-fun lt!137625 () SeekEntryResult!1694)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276851 (= res!140894 (or (= lt!137625 (MissingZero!1694 i!1267)) (= lt!137625 (MissingVacant!1694 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13776 (_ BitVec 32)) SeekEntryResult!1694)

(assert (=> b!276851 (= lt!137625 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276852 () Bool)

(declare-datatypes ((Unit!8655 0))(
  ( (Unit!8656) )
))
(declare-fun e!176774 () Unit!8655)

(declare-fun lt!137623 () Unit!8655)

(assert (=> b!276852 (= e!176774 lt!137623)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13776 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8655)

(assert (=> b!276852 (= lt!137623 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13776 (_ BitVec 32)) Bool)

(assert (=> b!276852 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13777 (store (arr!6537 a!3325) i!1267 k0!2581) (size!6890 a!3325)) mask!3868)))

(declare-fun b!276853 () Bool)

(declare-fun Unit!8657 () Unit!8655)

(assert (=> b!276853 (= e!176774 Unit!8657)))

(declare-fun b!276854 () Bool)

(declare-fun res!140889 () Bool)

(assert (=> b!276854 (=> (not res!140889) (not e!176773))))

(assert (=> b!276854 (= res!140889 (and (= (size!6890 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6890 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6890 a!3325))))))

(declare-fun b!276855 () Bool)

(assert (=> b!276855 (= e!176775 false)))

(declare-fun lt!137624 () Unit!8655)

(assert (=> b!276855 (= lt!137624 e!176774)))

(declare-fun c!45532 () Bool)

(assert (=> b!276855 (= c!45532 (bvslt startIndex!26 (bvsub (size!6890 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!276856 () Bool)

(declare-fun res!140890 () Bool)

(assert (=> b!276856 (=> (not res!140890) (not e!176773))))

(declare-datatypes ((List!4318 0))(
  ( (Nil!4315) (Cons!4314 (h!4981 (_ BitVec 64)) (t!9391 List!4318)) )
))
(declare-fun arrayNoDuplicates!0 (array!13776 (_ BitVec 32) List!4318) Bool)

(assert (=> b!276856 (= res!140890 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4315))))

(declare-fun b!276857 () Bool)

(declare-fun res!140895 () Bool)

(assert (=> b!276857 (=> (not res!140895) (not e!176773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276857 (= res!140895 (validKeyInArray!0 k0!2581))))

(declare-fun b!276858 () Bool)

(declare-fun res!140891 () Bool)

(assert (=> b!276858 (=> (not res!140891) (not e!176773))))

(declare-fun arrayContainsKey!0 (array!13776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276858 (= res!140891 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276859 () Bool)

(declare-fun res!140893 () Bool)

(assert (=> b!276859 (=> (not res!140893) (not e!176775))))

(assert (=> b!276859 (= res!140893 (= startIndex!26 i!1267))))

(declare-fun b!276860 () Bool)

(declare-fun res!140892 () Bool)

(assert (=> b!276860 (=> (not res!140892) (not e!176775))))

(assert (=> b!276860 (= res!140892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26690 res!140896) b!276854))

(assert (= (and b!276854 res!140889) b!276857))

(assert (= (and b!276857 res!140895) b!276856))

(assert (= (and b!276856 res!140890) b!276858))

(assert (= (and b!276858 res!140891) b!276851))

(assert (= (and b!276851 res!140894) b!276860))

(assert (= (and b!276860 res!140892) b!276859))

(assert (= (and b!276859 res!140893) b!276855))

(assert (= (and b!276855 c!45532) b!276852))

(assert (= (and b!276855 (not c!45532)) b!276853))

(declare-fun m!291599 () Bool)

(assert (=> b!276856 m!291599))

(declare-fun m!291601 () Bool)

(assert (=> b!276857 m!291601))

(declare-fun m!291603 () Bool)

(assert (=> b!276858 m!291603))

(declare-fun m!291605 () Bool)

(assert (=> b!276860 m!291605))

(declare-fun m!291607 () Bool)

(assert (=> b!276852 m!291607))

(declare-fun m!291609 () Bool)

(assert (=> b!276852 m!291609))

(declare-fun m!291611 () Bool)

(assert (=> b!276852 m!291611))

(declare-fun m!291613 () Bool)

(assert (=> b!276851 m!291613))

(declare-fun m!291615 () Bool)

(assert (=> start!26690 m!291615))

(declare-fun m!291617 () Bool)

(assert (=> start!26690 m!291617))

(check-sat (not start!26690) (not b!276856) (not b!276860) (not b!276858) (not b!276857) (not b!276852) (not b!276851))
(check-sat)
