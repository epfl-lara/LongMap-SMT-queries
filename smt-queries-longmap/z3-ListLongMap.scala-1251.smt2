; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26066 () Bool)

(assert start!26066)

(declare-fun b!268863 () Bool)

(declare-fun res!133143 () Bool)

(declare-fun e!173595 () Bool)

(assert (=> b!268863 (=> (not res!133143) (not e!173595))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13163 0))(
  ( (array!13164 (arr!6231 (Array (_ BitVec 32) (_ BitVec 64))) (size!6583 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13163)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268863 (= res!133143 (and (= (size!6583 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6583 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6583 a!3325))))))

(declare-fun b!268864 () Bool)

(declare-fun res!133142 () Bool)

(assert (=> b!268864 (=> (not res!133142) (not e!173595))))

(declare-datatypes ((List!4039 0))(
  ( (Nil!4036) (Cons!4035 (h!4702 (_ BitVec 64)) (t!9121 List!4039)) )
))
(declare-fun arrayNoDuplicates!0 (array!13163 (_ BitVec 32) List!4039) Bool)

(assert (=> b!268864 (= res!133142 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4036))))

(declare-fun res!133146 () Bool)

(assert (=> start!26066 (=> (not res!133146) (not e!173595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26066 (= res!133146 (validMask!0 mask!3868))))

(assert (=> start!26066 e!173595))

(declare-fun array_inv!4194 (array!13163) Bool)

(assert (=> start!26066 (array_inv!4194 a!3325)))

(assert (=> start!26066 true))

(declare-fun b!268865 () Bool)

(declare-fun res!133141 () Bool)

(assert (=> b!268865 (=> (not res!133141) (not e!173595))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268865 (= res!133141 (validKeyInArray!0 k0!2581))))

(declare-fun b!268866 () Bool)

(declare-fun e!173597 () Bool)

(assert (=> b!268866 (= e!173597 false)))

(declare-fun lt!135019 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13163 (_ BitVec 32)) Bool)

(assert (=> b!268866 (= lt!135019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268867 () Bool)

(declare-fun res!133145 () Bool)

(assert (=> b!268867 (=> (not res!133145) (not e!173595))))

(declare-fun arrayContainsKey!0 (array!13163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268867 (= res!133145 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268868 () Bool)

(assert (=> b!268868 (= e!173595 e!173597)))

(declare-fun res!133144 () Bool)

(assert (=> b!268868 (=> (not res!133144) (not e!173597))))

(declare-datatypes ((SeekEntryResult!1389 0))(
  ( (MissingZero!1389 (index!7726 (_ BitVec 32))) (Found!1389 (index!7727 (_ BitVec 32))) (Intermediate!1389 (undefined!2201 Bool) (index!7728 (_ BitVec 32)) (x!26082 (_ BitVec 32))) (Undefined!1389) (MissingVacant!1389 (index!7729 (_ BitVec 32))) )
))
(declare-fun lt!135018 () SeekEntryResult!1389)

(assert (=> b!268868 (= res!133144 (or (= lt!135018 (MissingZero!1389 i!1267)) (= lt!135018 (MissingVacant!1389 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13163 (_ BitVec 32)) SeekEntryResult!1389)

(assert (=> b!268868 (= lt!135018 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26066 res!133146) b!268863))

(assert (= (and b!268863 res!133143) b!268865))

(assert (= (and b!268865 res!133141) b!268864))

(assert (= (and b!268864 res!133142) b!268867))

(assert (= (and b!268867 res!133145) b!268868))

(assert (= (and b!268868 res!133144) b!268866))

(declare-fun m!284897 () Bool)

(assert (=> b!268864 m!284897))

(declare-fun m!284899 () Bool)

(assert (=> b!268866 m!284899))

(declare-fun m!284901 () Bool)

(assert (=> b!268867 m!284901))

(declare-fun m!284903 () Bool)

(assert (=> b!268865 m!284903))

(declare-fun m!284905 () Bool)

(assert (=> start!26066 m!284905))

(declare-fun m!284907 () Bool)

(assert (=> start!26066 m!284907))

(declare-fun m!284909 () Bool)

(assert (=> b!268868 m!284909))

(check-sat (not b!268865) (not b!268868) (not start!26066) (not b!268867) (not b!268866) (not b!268864))
(check-sat)
