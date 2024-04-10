; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26060 () Bool)

(assert start!26060)

(declare-fun b!268809 () Bool)

(declare-fun e!173569 () Bool)

(assert (=> b!268809 (= e!173569 false)))

(declare-fun lt!135000 () Bool)

(declare-datatypes ((array!13157 0))(
  ( (array!13158 (arr!6228 (Array (_ BitVec 32) (_ BitVec 64))) (size!6580 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13157)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13157 (_ BitVec 32)) Bool)

(assert (=> b!268809 (= lt!135000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268810 () Bool)

(declare-fun res!133091 () Bool)

(declare-fun e!173570 () Bool)

(assert (=> b!268810 (=> (not res!133091) (not e!173570))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268810 (= res!133091 (and (= (size!6580 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6580 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6580 a!3325))))))

(declare-fun b!268811 () Bool)

(declare-fun res!133089 () Bool)

(assert (=> b!268811 (=> (not res!133089) (not e!173570))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268811 (= res!133089 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268812 () Bool)

(assert (=> b!268812 (= e!173570 e!173569)))

(declare-fun res!133092 () Bool)

(assert (=> b!268812 (=> (not res!133092) (not e!173569))))

(declare-datatypes ((SeekEntryResult!1386 0))(
  ( (MissingZero!1386 (index!7714 (_ BitVec 32))) (Found!1386 (index!7715 (_ BitVec 32))) (Intermediate!1386 (undefined!2198 Bool) (index!7716 (_ BitVec 32)) (x!26071 (_ BitVec 32))) (Undefined!1386) (MissingVacant!1386 (index!7717 (_ BitVec 32))) )
))
(declare-fun lt!135001 () SeekEntryResult!1386)

(assert (=> b!268812 (= res!133092 (or (= lt!135001 (MissingZero!1386 i!1267)) (= lt!135001 (MissingVacant!1386 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13157 (_ BitVec 32)) SeekEntryResult!1386)

(assert (=> b!268812 (= lt!135001 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268813 () Bool)

(declare-fun res!133088 () Bool)

(assert (=> b!268813 (=> (not res!133088) (not e!173570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268813 (= res!133088 (validKeyInArray!0 k0!2581))))

(declare-fun res!133090 () Bool)

(assert (=> start!26060 (=> (not res!133090) (not e!173570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26060 (= res!133090 (validMask!0 mask!3868))))

(assert (=> start!26060 e!173570))

(declare-fun array_inv!4191 (array!13157) Bool)

(assert (=> start!26060 (array_inv!4191 a!3325)))

(assert (=> start!26060 true))

(declare-fun b!268814 () Bool)

(declare-fun res!133087 () Bool)

(assert (=> b!268814 (=> (not res!133087) (not e!173570))))

(declare-datatypes ((List!4036 0))(
  ( (Nil!4033) (Cons!4032 (h!4699 (_ BitVec 64)) (t!9118 List!4036)) )
))
(declare-fun arrayNoDuplicates!0 (array!13157 (_ BitVec 32) List!4036) Bool)

(assert (=> b!268814 (= res!133087 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4033))))

(assert (= (and start!26060 res!133090) b!268810))

(assert (= (and b!268810 res!133091) b!268813))

(assert (= (and b!268813 res!133088) b!268814))

(assert (= (and b!268814 res!133087) b!268811))

(assert (= (and b!268811 res!133089) b!268812))

(assert (= (and b!268812 res!133092) b!268809))

(declare-fun m!284855 () Bool)

(assert (=> start!26060 m!284855))

(declare-fun m!284857 () Bool)

(assert (=> start!26060 m!284857))

(declare-fun m!284859 () Bool)

(assert (=> b!268809 m!284859))

(declare-fun m!284861 () Bool)

(assert (=> b!268813 m!284861))

(declare-fun m!284863 () Bool)

(assert (=> b!268814 m!284863))

(declare-fun m!284865 () Bool)

(assert (=> b!268812 m!284865))

(declare-fun m!284867 () Bool)

(assert (=> b!268811 m!284867))

(check-sat (not b!268814) (not start!26060) (not b!268813) (not b!268809) (not b!268812) (not b!268811))
(check-sat)
