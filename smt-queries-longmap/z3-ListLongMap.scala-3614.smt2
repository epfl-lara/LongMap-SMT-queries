; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49756 () Bool)

(assert start!49756)

(declare-fun b!546862 () Bool)

(declare-fun res!340580 () Bool)

(declare-fun e!316022 () Bool)

(assert (=> b!546862 (=> (not res!340580) (not e!316022))))

(declare-datatypes ((array!34494 0))(
  ( (array!34495 (arr!16573 (Array (_ BitVec 32) (_ BitVec 64))) (size!16937 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34494)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546862 (= res!340580 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546863 () Bool)

(declare-fun res!340579 () Bool)

(assert (=> b!546863 (=> (not res!340579) (not e!316022))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546863 (= res!340579 (and (= (size!16937 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16937 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16937 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340578 () Bool)

(assert (=> start!49756 (=> (not res!340578) (not e!316022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49756 (= res!340578 (validMask!0 mask!3119))))

(assert (=> start!49756 e!316022))

(assert (=> start!49756 true))

(declare-fun array_inv!12369 (array!34494) Bool)

(assert (=> start!49756 (array_inv!12369 a!3118)))

(declare-fun b!546864 () Bool)

(assert (=> b!546864 (= e!316022 false)))

(declare-datatypes ((SeekEntryResult!5022 0))(
  ( (MissingZero!5022 (index!22315 (_ BitVec 32))) (Found!5022 (index!22316 (_ BitVec 32))) (Intermediate!5022 (undefined!5834 Bool) (index!22317 (_ BitVec 32)) (x!51266 (_ BitVec 32))) (Undefined!5022) (MissingVacant!5022 (index!22318 (_ BitVec 32))) )
))
(declare-fun lt!249379 () SeekEntryResult!5022)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34494 (_ BitVec 32)) SeekEntryResult!5022)

(assert (=> b!546864 (= lt!249379 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!546865 () Bool)

(declare-fun res!340576 () Bool)

(assert (=> b!546865 (=> (not res!340576) (not e!316022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546865 (= res!340576 (validKeyInArray!0 k0!1914))))

(declare-fun b!546866 () Bool)

(declare-fun res!340577 () Bool)

(assert (=> b!546866 (=> (not res!340577) (not e!316022))))

(assert (=> b!546866 (= res!340577 (validKeyInArray!0 (select (arr!16573 a!3118) j!142)))))

(assert (= (and start!49756 res!340578) b!546863))

(assert (= (and b!546863 res!340579) b!546866))

(assert (= (and b!546866 res!340577) b!546865))

(assert (= (and b!546865 res!340576) b!546862))

(assert (= (and b!546862 res!340580) b!546864))

(declare-fun m!524249 () Bool)

(assert (=> b!546866 m!524249))

(assert (=> b!546866 m!524249))

(declare-fun m!524251 () Bool)

(assert (=> b!546866 m!524251))

(declare-fun m!524253 () Bool)

(assert (=> start!49756 m!524253))

(declare-fun m!524255 () Bool)

(assert (=> start!49756 m!524255))

(declare-fun m!524257 () Bool)

(assert (=> b!546862 m!524257))

(declare-fun m!524259 () Bool)

(assert (=> b!546865 m!524259))

(declare-fun m!524261 () Bool)

(assert (=> b!546864 m!524261))

(check-sat (not b!546865) (not b!546866) (not start!49756) (not b!546862) (not b!546864))
