; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26278 () Bool)

(assert start!26278)

(declare-fun b!272172 () Bool)

(declare-fun res!136167 () Bool)

(declare-fun e!174765 () Bool)

(assert (=> b!272172 (=> (not res!136167) (not e!174765))))

(declare-datatypes ((array!13375 0))(
  ( (array!13376 (arr!6337 (Array (_ BitVec 32) (_ BitVec 64))) (size!6689 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13375)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13375 (_ BitVec 32)) Bool)

(assert (=> b!272172 (= res!136167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272173 () Bool)

(declare-fun res!136168 () Bool)

(assert (=> b!272173 (=> (not res!136168) (not e!174765))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272173 (= res!136168 (validKeyInArray!0 (select (arr!6337 a!3325) startIndex!26)))))

(declare-fun b!272174 () Bool)

(declare-fun e!174766 () Bool)

(assert (=> b!272174 (= e!174766 e!174765)))

(declare-fun res!136163 () Bool)

(assert (=> b!272174 (=> (not res!136163) (not e!174765))))

(declare-datatypes ((SeekEntryResult!1495 0))(
  ( (MissingZero!1495 (index!8150 (_ BitVec 32))) (Found!1495 (index!8151 (_ BitVec 32))) (Intermediate!1495 (undefined!2307 Bool) (index!8152 (_ BitVec 32)) (x!26468 (_ BitVec 32))) (Undefined!1495) (MissingVacant!1495 (index!8153 (_ BitVec 32))) )
))
(declare-fun lt!135943 () SeekEntryResult!1495)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272174 (= res!136163 (or (= lt!135943 (MissingZero!1495 i!1267)) (= lt!135943 (MissingVacant!1495 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13375 (_ BitVec 32)) SeekEntryResult!1495)

(assert (=> b!272174 (= lt!135943 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272175 () Bool)

(declare-fun res!136164 () Bool)

(assert (=> b!272175 (=> (not res!136164) (not e!174765))))

(assert (=> b!272175 (= res!136164 (not (= startIndex!26 i!1267)))))

(declare-fun b!272176 () Bool)

(assert (=> b!272176 (= e!174765 (not true))))

(declare-datatypes ((List!4145 0))(
  ( (Nil!4142) (Cons!4141 (h!4808 (_ BitVec 64)) (t!9227 List!4145)) )
))
(declare-fun arrayNoDuplicates!0 (array!13375 (_ BitVec 32) List!4145) Bool)

(assert (=> b!272176 (arrayNoDuplicates!0 (array!13376 (store (arr!6337 a!3325) i!1267 k!2581) (size!6689 a!3325)) #b00000000000000000000000000000000 Nil!4142)))

(declare-datatypes ((Unit!8477 0))(
  ( (Unit!8478) )
))
(declare-fun lt!135942 () Unit!8477)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13375 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4145) Unit!8477)

(assert (=> b!272176 (= lt!135942 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4142))))

(declare-fun b!272177 () Bool)

(declare-fun res!136166 () Bool)

(assert (=> b!272177 (=> (not res!136166) (not e!174766))))

(assert (=> b!272177 (= res!136166 (validKeyInArray!0 k!2581))))

(declare-fun res!136169 () Bool)

(assert (=> start!26278 (=> (not res!136169) (not e!174766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26278 (= res!136169 (validMask!0 mask!3868))))

(assert (=> start!26278 e!174766))

(declare-fun array_inv!4300 (array!13375) Bool)

(assert (=> start!26278 (array_inv!4300 a!3325)))

(assert (=> start!26278 true))

(declare-fun b!272178 () Bool)

(declare-fun res!136162 () Bool)

(assert (=> b!272178 (=> (not res!136162) (not e!174766))))

(assert (=> b!272178 (= res!136162 (and (= (size!6689 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6689 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6689 a!3325))))))

(declare-fun b!272179 () Bool)

(declare-fun res!136170 () Bool)

(assert (=> b!272179 (=> (not res!136170) (not e!174766))))

(assert (=> b!272179 (= res!136170 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4142))))

(declare-fun b!272180 () Bool)

(declare-fun res!136165 () Bool)

(assert (=> b!272180 (=> (not res!136165) (not e!174766))))

(declare-fun arrayContainsKey!0 (array!13375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272180 (= res!136165 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26278 res!136169) b!272178))

(assert (= (and b!272178 res!136162) b!272177))

(assert (= (and b!272177 res!136166) b!272179))

(assert (= (and b!272179 res!136170) b!272180))

(assert (= (and b!272180 res!136165) b!272174))

(assert (= (and b!272174 res!136163) b!272172))

(assert (= (and b!272172 res!136167) b!272175))

(assert (= (and b!272175 res!136164) b!272173))

(assert (= (and b!272173 res!136168) b!272176))

(declare-fun m!287301 () Bool)

(assert (=> b!272179 m!287301))

(declare-fun m!287303 () Bool)

(assert (=> b!272180 m!287303))

(declare-fun m!287305 () Bool)

(assert (=> b!272176 m!287305))

(declare-fun m!287307 () Bool)

(assert (=> b!272176 m!287307))

(declare-fun m!287309 () Bool)

(assert (=> b!272176 m!287309))

(declare-fun m!287311 () Bool)

(assert (=> start!26278 m!287311))

(declare-fun m!287313 () Bool)

(assert (=> start!26278 m!287313))

(declare-fun m!287315 () Bool)

(assert (=> b!272177 m!287315))

(declare-fun m!287317 () Bool)

(assert (=> b!272173 m!287317))

(assert (=> b!272173 m!287317))

(declare-fun m!287319 () Bool)

(assert (=> b!272173 m!287319))

(declare-fun m!287321 () Bool)

(assert (=> b!272174 m!287321))

(declare-fun m!287323 () Bool)

(assert (=> b!272172 m!287323))

(push 1)

(assert (not b!272177))

(assert (not start!26278))

