; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26244 () Bool)

(assert start!26244)

(declare-fun b!271685 () Bool)

(declare-fun res!135685 () Bool)

(declare-fun e!174612 () Bool)

(assert (=> b!271685 (=> (not res!135685) (not e!174612))))

(declare-datatypes ((array!13341 0))(
  ( (array!13342 (arr!6320 (Array (_ BitVec 32) (_ BitVec 64))) (size!6672 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13341)

(declare-datatypes ((List!4128 0))(
  ( (Nil!4125) (Cons!4124 (h!4791 (_ BitVec 64)) (t!9210 List!4128)) )
))
(declare-fun arrayNoDuplicates!0 (array!13341 (_ BitVec 32) List!4128) Bool)

(assert (=> b!271685 (= res!135685 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4125))))

(declare-fun b!271686 () Bool)

(declare-fun e!174614 () Bool)

(assert (=> b!271686 (= e!174614 false)))

(declare-fun lt!135841 () Bool)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun contains!1958 (List!4128 (_ BitVec 64)) Bool)

(assert (=> b!271686 (= lt!135841 (contains!1958 Nil!4125 k!2581))))

(declare-fun b!271687 () Bool)

(declare-fun res!135680 () Bool)

(assert (=> b!271687 (=> (not res!135680) (not e!174614))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271687 (= res!135680 (not (= startIndex!26 i!1267)))))

(declare-fun b!271688 () Bool)

(declare-fun res!135683 () Bool)

(assert (=> b!271688 (=> (not res!135683) (not e!174614))))

(declare-fun noDuplicate!146 (List!4128) Bool)

(assert (=> b!271688 (= res!135683 (noDuplicate!146 Nil!4125))))

(declare-fun b!271689 () Bool)

(declare-fun res!135676 () Bool)

(assert (=> b!271689 (=> (not res!135676) (not e!174614))))

(assert (=> b!271689 (= res!135676 (and (bvslt (size!6672 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6672 a!3325))))))

(declare-fun b!271690 () Bool)

(declare-fun res!135679 () Bool)

(assert (=> b!271690 (=> (not res!135679) (not e!174614))))

(assert (=> b!271690 (= res!135679 (not (contains!1958 Nil!4125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271691 () Bool)

(declare-fun res!135682 () Bool)

(assert (=> b!271691 (=> (not res!135682) (not e!174614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271691 (= res!135682 (validKeyInArray!0 (select (arr!6320 a!3325) startIndex!26)))))

(declare-fun b!271692 () Bool)

(declare-fun res!135675 () Bool)

(assert (=> b!271692 (=> (not res!135675) (not e!174612))))

(assert (=> b!271692 (= res!135675 (validKeyInArray!0 k!2581))))

(declare-fun res!135686 () Bool)

(assert (=> start!26244 (=> (not res!135686) (not e!174612))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26244 (= res!135686 (validMask!0 mask!3868))))

(assert (=> start!26244 e!174612))

(declare-fun array_inv!4283 (array!13341) Bool)

(assert (=> start!26244 (array_inv!4283 a!3325)))

(assert (=> start!26244 true))

(declare-fun b!271693 () Bool)

(assert (=> b!271693 (= e!174612 e!174614)))

(declare-fun res!135681 () Bool)

(assert (=> b!271693 (=> (not res!135681) (not e!174614))))

(declare-datatypes ((SeekEntryResult!1478 0))(
  ( (MissingZero!1478 (index!8082 (_ BitVec 32))) (Found!1478 (index!8083 (_ BitVec 32))) (Intermediate!1478 (undefined!2290 Bool) (index!8084 (_ BitVec 32)) (x!26411 (_ BitVec 32))) (Undefined!1478) (MissingVacant!1478 (index!8085 (_ BitVec 32))) )
))
(declare-fun lt!135840 () SeekEntryResult!1478)

(assert (=> b!271693 (= res!135681 (or (= lt!135840 (MissingZero!1478 i!1267)) (= lt!135840 (MissingVacant!1478 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13341 (_ BitVec 32)) SeekEntryResult!1478)

(assert (=> b!271693 (= lt!135840 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271694 () Bool)

(declare-fun res!135678 () Bool)

(assert (=> b!271694 (=> (not res!135678) (not e!174614))))

(assert (=> b!271694 (= res!135678 (not (contains!1958 Nil!4125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271695 () Bool)

(declare-fun res!135684 () Bool)

(assert (=> b!271695 (=> (not res!135684) (not e!174614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13341 (_ BitVec 32)) Bool)

(assert (=> b!271695 (= res!135684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271696 () Bool)

(declare-fun res!135687 () Bool)

(assert (=> b!271696 (=> (not res!135687) (not e!174612))))

(declare-fun arrayContainsKey!0 (array!13341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271696 (= res!135687 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271697 () Bool)

(declare-fun res!135677 () Bool)

(assert (=> b!271697 (=> (not res!135677) (not e!174612))))

(assert (=> b!271697 (= res!135677 (and (= (size!6672 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6672 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6672 a!3325))))))

(assert (= (and start!26244 res!135686) b!271697))

(assert (= (and b!271697 res!135677) b!271692))

(assert (= (and b!271692 res!135675) b!271685))

(assert (= (and b!271685 res!135685) b!271696))

(assert (= (and b!271696 res!135687) b!271693))

(assert (= (and b!271693 res!135681) b!271695))

(assert (= (and b!271695 res!135684) b!271687))

(assert (= (and b!271687 res!135680) b!271691))

(assert (= (and b!271691 res!135682) b!271689))

(assert (= (and b!271689 res!135676) b!271688))

(assert (= (and b!271688 res!135683) b!271690))

(assert (= (and b!271690 res!135679) b!271694))

(assert (= (and b!271694 res!135678) b!271686))

(declare-fun m!286887 () Bool)

(assert (=> b!271693 m!286887))

(declare-fun m!286889 () Bool)

(assert (=> b!271686 m!286889))

(declare-fun m!286891 () Bool)

(assert (=> b!271688 m!286891))

(declare-fun m!286893 () Bool)

(assert (=> b!271695 m!286893))

(declare-fun m!286895 () Bool)

(assert (=> b!271691 m!286895))

(assert (=> b!271691 m!286895))

(declare-fun m!286897 () Bool)

(assert (=> b!271691 m!286897))

(declare-fun m!286899 () Bool)

(assert (=> b!271690 m!286899))

(declare-fun m!286901 () Bool)

(assert (=> b!271685 m!286901))

(declare-fun m!286903 () Bool)

(assert (=> b!271694 m!286903))

(declare-fun m!286905 () Bool)

(assert (=> start!26244 m!286905))

(declare-fun m!286907 () Bool)

(assert (=> start!26244 m!286907))

(declare-fun m!286909 () Bool)

(assert (=> b!271696 m!286909))

(declare-fun m!286911 () Bool)

(assert (=> b!271692 m!286911))

(push 1)

