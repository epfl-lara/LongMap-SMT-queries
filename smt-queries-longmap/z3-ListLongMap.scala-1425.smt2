; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27578 () Bool)

(assert start!27578)

(declare-fun b!284931 () Bool)

(declare-fun res!147440 () Bool)

(declare-fun e!180669 () Bool)

(assert (=> b!284931 (=> (not res!147440) (not e!180669))))

(declare-datatypes ((array!14228 0))(
  ( (array!14229 (arr!6753 (Array (_ BitVec 32) (_ BitVec 64))) (size!7105 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14228)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14228 (_ BitVec 32)) Bool)

(assert (=> b!284931 (= res!147440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284932 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284932 (= e!180669 (and (bvslt startIndex!26 (bvsub (size!7105 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!7105 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7105 a!3325) startIndex!26))))))

(declare-fun b!284933 () Bool)

(declare-fun res!147439 () Bool)

(declare-fun e!180671 () Bool)

(assert (=> b!284933 (=> (not res!147439) (not e!180671))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284933 (= res!147439 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284934 () Bool)

(declare-fun res!147443 () Bool)

(assert (=> b!284934 (=> (not res!147443) (not e!180671))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284934 (= res!147443 (and (= (size!7105 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7105 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7105 a!3325))))))

(declare-fun b!284935 () Bool)

(assert (=> b!284935 (= e!180671 e!180669)))

(declare-fun res!147444 () Bool)

(assert (=> b!284935 (=> (not res!147444) (not e!180669))))

(declare-datatypes ((SeekEntryResult!1911 0))(
  ( (MissingZero!1911 (index!9814 (_ BitVec 32))) (Found!1911 (index!9815 (_ BitVec 32))) (Intermediate!1911 (undefined!2723 Bool) (index!9816 (_ BitVec 32)) (x!28014 (_ BitVec 32))) (Undefined!1911) (MissingVacant!1911 (index!9817 (_ BitVec 32))) )
))
(declare-fun lt!140656 () SeekEntryResult!1911)

(assert (=> b!284935 (= res!147444 (or (= lt!140656 (MissingZero!1911 i!1267)) (= lt!140656 (MissingVacant!1911 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14228 (_ BitVec 32)) SeekEntryResult!1911)

(assert (=> b!284935 (= lt!140656 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284936 () Bool)

(declare-fun res!147447 () Bool)

(assert (=> b!284936 (=> (not res!147447) (not e!180671))))

(declare-datatypes ((List!4561 0))(
  ( (Nil!4558) (Cons!4557 (h!5230 (_ BitVec 64)) (t!9643 List!4561)) )
))
(declare-fun arrayNoDuplicates!0 (array!14228 (_ BitVec 32) List!4561) Bool)

(assert (=> b!284936 (= res!147447 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4558))))

(declare-fun b!284937 () Bool)

(declare-fun res!147441 () Bool)

(assert (=> b!284937 (=> (not res!147441) (not e!180669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284937 (= res!147441 (not (validKeyInArray!0 (select (arr!6753 a!3325) startIndex!26))))))

(declare-fun res!147445 () Bool)

(assert (=> start!27578 (=> (not res!147445) (not e!180671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27578 (= res!147445 (validMask!0 mask!3868))))

(assert (=> start!27578 e!180671))

(declare-fun array_inv!4716 (array!14228) Bool)

(assert (=> start!27578 (array_inv!4716 a!3325)))

(assert (=> start!27578 true))

(declare-fun b!284938 () Bool)

(declare-fun res!147442 () Bool)

(assert (=> b!284938 (=> (not res!147442) (not e!180669))))

(assert (=> b!284938 (= res!147442 (not (= startIndex!26 i!1267)))))

(declare-fun b!284939 () Bool)

(declare-fun res!147446 () Bool)

(assert (=> b!284939 (=> (not res!147446) (not e!180671))))

(assert (=> b!284939 (= res!147446 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27578 res!147445) b!284934))

(assert (= (and b!284934 res!147443) b!284939))

(assert (= (and b!284939 res!147446) b!284936))

(assert (= (and b!284936 res!147447) b!284933))

(assert (= (and b!284933 res!147439) b!284935))

(assert (= (and b!284935 res!147444) b!284931))

(assert (= (and b!284931 res!147440) b!284938))

(assert (= (and b!284938 res!147442) b!284937))

(assert (= (and b!284937 res!147441) b!284932))

(declare-fun m!299829 () Bool)

(assert (=> b!284935 m!299829))

(declare-fun m!299831 () Bool)

(assert (=> b!284937 m!299831))

(assert (=> b!284937 m!299831))

(declare-fun m!299833 () Bool)

(assert (=> b!284937 m!299833))

(declare-fun m!299835 () Bool)

(assert (=> b!284931 m!299835))

(declare-fun m!299837 () Bool)

(assert (=> start!27578 m!299837))

(declare-fun m!299839 () Bool)

(assert (=> start!27578 m!299839))

(declare-fun m!299841 () Bool)

(assert (=> b!284936 m!299841))

(declare-fun m!299843 () Bool)

(assert (=> b!284933 m!299843))

(declare-fun m!299845 () Bool)

(assert (=> b!284939 m!299845))

(check-sat (not b!284933) (not b!284939) (not start!27578) (not b!284936) (not b!284931) (not b!284935) (not b!284937))
(check-sat)
