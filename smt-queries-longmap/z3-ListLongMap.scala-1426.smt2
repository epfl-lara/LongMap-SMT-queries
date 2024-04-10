; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27584 () Bool)

(assert start!27584)

(declare-fun b!285017 () Bool)

(declare-fun res!147533 () Bool)

(declare-fun e!180698 () Bool)

(assert (=> b!285017 (=> (not res!147533) (not e!180698))))

(declare-datatypes ((array!14234 0))(
  ( (array!14235 (arr!6756 (Array (_ BitVec 32) (_ BitVec 64))) (size!7108 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14234)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14234 (_ BitVec 32)) Bool)

(assert (=> b!285017 (= res!147533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285018 () Bool)

(assert (=> b!285018 (= e!180698 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!285018 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14235 (store (arr!6756 a!3325) i!1267 k0!2581) (size!7108 a!3325)) mask!3868)))

(declare-datatypes ((Unit!9034 0))(
  ( (Unit!9035) )
))
(declare-fun lt!140670 () Unit!9034)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14234 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9034)

(assert (=> b!285018 (= lt!140670 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!285019 () Bool)

(declare-fun res!147534 () Bool)

(assert (=> b!285019 (=> (not res!147534) (not e!180698))))

(assert (=> b!285019 (= res!147534 (not (= startIndex!26 i!1267)))))

(declare-fun res!147528 () Bool)

(declare-fun e!180696 () Bool)

(assert (=> start!27584 (=> (not res!147528) (not e!180696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27584 (= res!147528 (validMask!0 mask!3868))))

(assert (=> start!27584 e!180696))

(declare-fun array_inv!4719 (array!14234) Bool)

(assert (=> start!27584 (array_inv!4719 a!3325)))

(assert (=> start!27584 true))

(declare-fun b!285020 () Bool)

(declare-fun res!147526 () Bool)

(assert (=> b!285020 (=> (not res!147526) (not e!180696))))

(assert (=> b!285020 (= res!147526 (and (= (size!7108 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7108 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7108 a!3325))))))

(declare-fun b!285021 () Bool)

(declare-fun res!147530 () Bool)

(assert (=> b!285021 (=> (not res!147530) (not e!180698))))

(assert (=> b!285021 (= res!147530 (and (bvslt startIndex!26 (bvsub (size!7108 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!285022 () Bool)

(assert (=> b!285022 (= e!180696 e!180698)))

(declare-fun res!147531 () Bool)

(assert (=> b!285022 (=> (not res!147531) (not e!180698))))

(declare-datatypes ((SeekEntryResult!1914 0))(
  ( (MissingZero!1914 (index!9826 (_ BitVec 32))) (Found!1914 (index!9827 (_ BitVec 32))) (Intermediate!1914 (undefined!2726 Bool) (index!9828 (_ BitVec 32)) (x!28025 (_ BitVec 32))) (Undefined!1914) (MissingVacant!1914 (index!9829 (_ BitVec 32))) )
))
(declare-fun lt!140671 () SeekEntryResult!1914)

(assert (=> b!285022 (= res!147531 (or (= lt!140671 (MissingZero!1914 i!1267)) (= lt!140671 (MissingVacant!1914 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14234 (_ BitVec 32)) SeekEntryResult!1914)

(assert (=> b!285022 (= lt!140671 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!285023 () Bool)

(declare-fun res!147525 () Bool)

(assert (=> b!285023 (=> (not res!147525) (not e!180698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285023 (= res!147525 (not (validKeyInArray!0 (select (arr!6756 a!3325) startIndex!26))))))

(declare-fun b!285024 () Bool)

(declare-fun res!147529 () Bool)

(assert (=> b!285024 (=> (not res!147529) (not e!180696))))

(assert (=> b!285024 (= res!147529 (validKeyInArray!0 k0!2581))))

(declare-fun b!285025 () Bool)

(declare-fun res!147527 () Bool)

(assert (=> b!285025 (=> (not res!147527) (not e!180696))))

(declare-datatypes ((List!4564 0))(
  ( (Nil!4561) (Cons!4560 (h!5233 (_ BitVec 64)) (t!9646 List!4564)) )
))
(declare-fun arrayNoDuplicates!0 (array!14234 (_ BitVec 32) List!4564) Bool)

(assert (=> b!285025 (= res!147527 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4561))))

(declare-fun b!285026 () Bool)

(declare-fun res!147532 () Bool)

(assert (=> b!285026 (=> (not res!147532) (not e!180696))))

(declare-fun arrayContainsKey!0 (array!14234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285026 (= res!147532 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27584 res!147528) b!285020))

(assert (= (and b!285020 res!147526) b!285024))

(assert (= (and b!285024 res!147529) b!285025))

(assert (= (and b!285025 res!147527) b!285026))

(assert (= (and b!285026 res!147532) b!285022))

(assert (= (and b!285022 res!147531) b!285017))

(assert (= (and b!285017 res!147533) b!285019))

(assert (= (and b!285019 res!147534) b!285023))

(assert (= (and b!285023 res!147525) b!285021))

(assert (= (and b!285021 res!147530) b!285018))

(declare-fun m!299889 () Bool)

(assert (=> b!285017 m!299889))

(declare-fun m!299891 () Bool)

(assert (=> b!285025 m!299891))

(declare-fun m!299893 () Bool)

(assert (=> b!285026 m!299893))

(declare-fun m!299895 () Bool)

(assert (=> start!27584 m!299895))

(declare-fun m!299897 () Bool)

(assert (=> start!27584 m!299897))

(declare-fun m!299899 () Bool)

(assert (=> b!285018 m!299899))

(declare-fun m!299901 () Bool)

(assert (=> b!285018 m!299901))

(declare-fun m!299903 () Bool)

(assert (=> b!285018 m!299903))

(declare-fun m!299905 () Bool)

(assert (=> b!285023 m!299905))

(assert (=> b!285023 m!299905))

(declare-fun m!299907 () Bool)

(assert (=> b!285023 m!299907))

(declare-fun m!299909 () Bool)

(assert (=> b!285022 m!299909))

(declare-fun m!299911 () Bool)

(assert (=> b!285024 m!299911))

(check-sat (not b!285025) (not b!285023) (not b!285024) (not b!285018) (not b!285026) (not b!285022) (not b!285017) (not start!27584))
(check-sat)
