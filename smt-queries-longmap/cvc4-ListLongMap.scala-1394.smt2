; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27220 () Bool)

(assert start!27220)

(declare-fun b!281796 () Bool)

(declare-fun res!144870 () Bool)

(declare-fun e!179027 () Bool)

(assert (=> b!281796 (=> (not res!144870) (not e!179027))))

(declare-datatypes ((array!14038 0))(
  ( (array!14039 (arr!6661 (Array (_ BitVec 32) (_ BitVec 64))) (size!7013 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14038)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281796 (= res!144870 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!144866 () Bool)

(assert (=> start!27220 (=> (not res!144866) (not e!179027))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27220 (= res!144866 (validMask!0 mask!3868))))

(assert (=> start!27220 e!179027))

(declare-fun array_inv!4624 (array!14038) Bool)

(assert (=> start!27220 (array_inv!4624 a!3325)))

(assert (=> start!27220 true))

(declare-fun b!281797 () Bool)

(declare-fun e!179030 () Bool)

(assert (=> b!281797 (= e!179027 e!179030)))

(declare-fun res!144871 () Bool)

(assert (=> b!281797 (=> (not res!144871) (not e!179030))))

(declare-datatypes ((SeekEntryResult!1819 0))(
  ( (MissingZero!1819 (index!9446 (_ BitVec 32))) (Found!1819 (index!9447 (_ BitVec 32))) (Intermediate!1819 (undefined!2631 Bool) (index!9448 (_ BitVec 32)) (x!27665 (_ BitVec 32))) (Undefined!1819) (MissingVacant!1819 (index!9449 (_ BitVec 32))) )
))
(declare-fun lt!139198 () SeekEntryResult!1819)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281797 (= res!144871 (or (= lt!139198 (MissingZero!1819 i!1267)) (= lt!139198 (MissingVacant!1819 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14038 (_ BitVec 32)) SeekEntryResult!1819)

(assert (=> b!281797 (= lt!139198 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281798 () Bool)

(declare-fun e!179028 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281798 (= e!179028 (not (or (bvsgt #b00000000000000000000000000000000 (size!7013 a!3325)) (bvsle startIndex!26 (size!7013 a!3325)))))))

(declare-fun lt!139199 () array!14038)

(assert (=> b!281798 (= (seekEntryOrOpen!0 (select (arr!6661 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6661 a!3325) i!1267 k!2581) startIndex!26) lt!139199 mask!3868))))

(declare-datatypes ((Unit!8922 0))(
  ( (Unit!8923) )
))
(declare-fun lt!139201 () Unit!8922)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14038 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8922)

(assert (=> b!281798 (= lt!139201 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4469 0))(
  ( (Nil!4466) (Cons!4465 (h!5135 (_ BitVec 64)) (t!9551 List!4469)) )
))
(declare-fun arrayNoDuplicates!0 (array!14038 (_ BitVec 32) List!4469) Bool)

(assert (=> b!281798 (arrayNoDuplicates!0 lt!139199 #b00000000000000000000000000000000 Nil!4466)))

(declare-fun lt!139200 () Unit!8922)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14038 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4469) Unit!8922)

(assert (=> b!281798 (= lt!139200 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4466))))

(declare-fun b!281799 () Bool)

(declare-fun res!144872 () Bool)

(assert (=> b!281799 (=> (not res!144872) (not e!179028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281799 (= res!144872 (validKeyInArray!0 (select (arr!6661 a!3325) startIndex!26)))))

(declare-fun b!281800 () Bool)

(declare-fun res!144865 () Bool)

(assert (=> b!281800 (=> (not res!144865) (not e!179027))))

(assert (=> b!281800 (= res!144865 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4466))))

(declare-fun b!281801 () Bool)

(declare-fun res!144868 () Bool)

(assert (=> b!281801 (=> (not res!144868) (not e!179030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14038 (_ BitVec 32)) Bool)

(assert (=> b!281801 (= res!144868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281802 () Bool)

(declare-fun res!144869 () Bool)

(assert (=> b!281802 (=> (not res!144869) (not e!179027))))

(assert (=> b!281802 (= res!144869 (and (= (size!7013 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7013 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7013 a!3325))))))

(declare-fun b!281803 () Bool)

(declare-fun res!144873 () Bool)

(assert (=> b!281803 (=> (not res!144873) (not e!179027))))

(assert (=> b!281803 (= res!144873 (validKeyInArray!0 k!2581))))

(declare-fun b!281804 () Bool)

(assert (=> b!281804 (= e!179030 e!179028)))

(declare-fun res!144867 () Bool)

(assert (=> b!281804 (=> (not res!144867) (not e!179028))))

(assert (=> b!281804 (= res!144867 (not (= startIndex!26 i!1267)))))

(assert (=> b!281804 (= lt!139199 (array!14039 (store (arr!6661 a!3325) i!1267 k!2581) (size!7013 a!3325)))))

(assert (= (and start!27220 res!144866) b!281802))

(assert (= (and b!281802 res!144869) b!281803))

(assert (= (and b!281803 res!144873) b!281800))

(assert (= (and b!281800 res!144865) b!281796))

(assert (= (and b!281796 res!144870) b!281797))

(assert (= (and b!281797 res!144871) b!281801))

(assert (= (and b!281801 res!144868) b!281804))

(assert (= (and b!281804 res!144867) b!281799))

(assert (= (and b!281799 res!144872) b!281798))

(declare-fun m!296167 () Bool)

(assert (=> start!27220 m!296167))

(declare-fun m!296169 () Bool)

(assert (=> start!27220 m!296169))

(declare-fun m!296171 () Bool)

(assert (=> b!281800 m!296171))

(declare-fun m!296173 () Bool)

(assert (=> b!281799 m!296173))

(assert (=> b!281799 m!296173))

(declare-fun m!296175 () Bool)

(assert (=> b!281799 m!296175))

(declare-fun m!296177 () Bool)

(assert (=> b!281803 m!296177))

(declare-fun m!296179 () Bool)

(assert (=> b!281796 m!296179))

(declare-fun m!296181 () Bool)

(assert (=> b!281797 m!296181))

(declare-fun m!296183 () Bool)

(assert (=> b!281798 m!296183))

(assert (=> b!281798 m!296183))

(declare-fun m!296185 () Bool)

(assert (=> b!281798 m!296185))

(declare-fun m!296187 () Bool)

(assert (=> b!281798 m!296187))

(declare-fun m!296189 () Bool)

(assert (=> b!281798 m!296189))

(assert (=> b!281798 m!296173))

(declare-fun m!296191 () Bool)

(assert (=> b!281798 m!296191))

(declare-fun m!296193 () Bool)

(assert (=> b!281798 m!296193))

(assert (=> b!281798 m!296173))

(declare-fun m!296195 () Bool)

(assert (=> b!281798 m!296195))

(assert (=> b!281804 m!296187))

(declare-fun m!296197 () Bool)

(assert (=> b!281801 m!296197))

(push 1)

(assert (not b!281796))

(assert (not b!281798))

(assert (not b!281797))

(assert (not b!281799))

(assert (not b!281801))

(assert (not b!281803))

(assert (not b!281800))

(assert (not start!27220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

