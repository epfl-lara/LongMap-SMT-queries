; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26288 () Bool)

(assert start!26288)

(declare-fun b!272133 () Bool)

(declare-fun e!174700 () Bool)

(assert (=> b!272133 (= e!174700 (not true))))

(declare-datatypes ((array!13374 0))(
  ( (array!13375 (arr!6336 (Array (_ BitVec 32) (_ BitVec 64))) (size!6689 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13374)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4117 0))(
  ( (Nil!4114) (Cons!4113 (h!4780 (_ BitVec 64)) (t!9190 List!4117)) )
))
(declare-fun arrayNoDuplicates!0 (array!13374 (_ BitVec 32) List!4117) Bool)

(assert (=> b!272133 (arrayNoDuplicates!0 (array!13375 (store (arr!6336 a!3325) i!1267 k0!2581) (size!6689 a!3325)) #b00000000000000000000000000000000 Nil!4114)))

(declare-datatypes ((Unit!8439 0))(
  ( (Unit!8440) )
))
(declare-fun lt!135785 () Unit!8439)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4117) Unit!8439)

(assert (=> b!272133 (= lt!135785 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4114))))

(declare-fun b!272134 () Bool)

(declare-fun res!136177 () Bool)

(declare-fun e!174702 () Bool)

(assert (=> b!272134 (=> (not res!136177) (not e!174702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272134 (= res!136177 (validKeyInArray!0 k0!2581))))

(declare-fun b!272135 () Bool)

(declare-fun res!136179 () Bool)

(assert (=> b!272135 (=> (not res!136179) (not e!174702))))

(assert (=> b!272135 (= res!136179 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4114))))

(declare-fun b!272136 () Bool)

(declare-fun res!136180 () Bool)

(assert (=> b!272136 (=> (not res!136180) (not e!174702))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272136 (= res!136180 (and (= (size!6689 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6689 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6689 a!3325))))))

(declare-fun b!272137 () Bool)

(declare-fun res!136181 () Bool)

(assert (=> b!272137 (=> (not res!136181) (not e!174700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13374 (_ BitVec 32)) Bool)

(assert (=> b!272137 (= res!136181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272138 () Bool)

(declare-fun res!136176 () Bool)

(assert (=> b!272138 (=> (not res!136176) (not e!174700))))

(assert (=> b!272138 (= res!136176 (not (= startIndex!26 i!1267)))))

(declare-fun res!136175 () Bool)

(assert (=> start!26288 (=> (not res!136175) (not e!174702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26288 (= res!136175 (validMask!0 mask!3868))))

(assert (=> start!26288 e!174702))

(declare-fun array_inv!4308 (array!13374) Bool)

(assert (=> start!26288 (array_inv!4308 a!3325)))

(assert (=> start!26288 true))

(declare-fun b!272139 () Bool)

(declare-fun res!136178 () Bool)

(assert (=> b!272139 (=> (not res!136178) (not e!174702))))

(declare-fun arrayContainsKey!0 (array!13374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272139 (= res!136178 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272140 () Bool)

(assert (=> b!272140 (= e!174702 e!174700)))

(declare-fun res!136182 () Bool)

(assert (=> b!272140 (=> (not res!136182) (not e!174700))))

(declare-datatypes ((SeekEntryResult!1493 0))(
  ( (MissingZero!1493 (index!8142 (_ BitVec 32))) (Found!1493 (index!8143 (_ BitVec 32))) (Intermediate!1493 (undefined!2305 Bool) (index!8144 (_ BitVec 32)) (x!26481 (_ BitVec 32))) (Undefined!1493) (MissingVacant!1493 (index!8145 (_ BitVec 32))) )
))
(declare-fun lt!135786 () SeekEntryResult!1493)

(assert (=> b!272140 (= res!136182 (or (= lt!135786 (MissingZero!1493 i!1267)) (= lt!135786 (MissingVacant!1493 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13374 (_ BitVec 32)) SeekEntryResult!1493)

(assert (=> b!272140 (= lt!135786 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272141 () Bool)

(declare-fun res!136183 () Bool)

(assert (=> b!272141 (=> (not res!136183) (not e!174700))))

(assert (=> b!272141 (= res!136183 (validKeyInArray!0 (select (arr!6336 a!3325) startIndex!26)))))

(assert (= (and start!26288 res!136175) b!272136))

(assert (= (and b!272136 res!136180) b!272134))

(assert (= (and b!272134 res!136177) b!272135))

(assert (= (and b!272135 res!136179) b!272139))

(assert (= (and b!272139 res!136178) b!272140))

(assert (= (and b!272140 res!136182) b!272137))

(assert (= (and b!272137 res!136181) b!272138))

(assert (= (and b!272138 res!136176) b!272141))

(assert (= (and b!272141 res!136183) b!272133))

(declare-fun m!286805 () Bool)

(assert (=> b!272135 m!286805))

(declare-fun m!286807 () Bool)

(assert (=> b!272140 m!286807))

(declare-fun m!286809 () Bool)

(assert (=> b!272133 m!286809))

(declare-fun m!286811 () Bool)

(assert (=> b!272133 m!286811))

(declare-fun m!286813 () Bool)

(assert (=> b!272133 m!286813))

(declare-fun m!286815 () Bool)

(assert (=> start!26288 m!286815))

(declare-fun m!286817 () Bool)

(assert (=> start!26288 m!286817))

(declare-fun m!286819 () Bool)

(assert (=> b!272139 m!286819))

(declare-fun m!286821 () Bool)

(assert (=> b!272134 m!286821))

(declare-fun m!286823 () Bool)

(assert (=> b!272137 m!286823))

(declare-fun m!286825 () Bool)

(assert (=> b!272141 m!286825))

(assert (=> b!272141 m!286825))

(declare-fun m!286827 () Bool)

(assert (=> b!272141 m!286827))

(check-sat (not b!272139) (not b!272134) (not b!272135) (not b!272133) (not b!272137) (not start!26288) (not b!272141) (not b!272140))
(check-sat)
