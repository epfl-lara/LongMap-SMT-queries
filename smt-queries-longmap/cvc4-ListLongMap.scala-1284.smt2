; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26266 () Bool)

(assert start!26266)

(declare-fun b!272011 () Bool)

(declare-fun res!136006 () Bool)

(declare-fun e!174713 () Bool)

(assert (=> b!272011 (=> (not res!136006) (not e!174713))))

(declare-datatypes ((array!13363 0))(
  ( (array!13364 (arr!6331 (Array (_ BitVec 32) (_ BitVec 64))) (size!6683 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13363)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272011 (= res!136006 (validKeyInArray!0 (select (arr!6331 a!3325) startIndex!26)))))

(declare-fun b!272012 () Bool)

(declare-fun res!136005 () Bool)

(assert (=> b!272012 (=> (not res!136005) (not e!174713))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13363 (_ BitVec 32)) Bool)

(assert (=> b!272012 (= res!136005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272013 () Bool)

(declare-fun res!136002 () Bool)

(declare-fun e!174711 () Bool)

(assert (=> b!272013 (=> (not res!136002) (not e!174711))))

(declare-datatypes ((List!4139 0))(
  ( (Nil!4136) (Cons!4135 (h!4802 (_ BitVec 64)) (t!9221 List!4139)) )
))
(declare-fun arrayNoDuplicates!0 (array!13363 (_ BitVec 32) List!4139) Bool)

(assert (=> b!272013 (= res!136002 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4136))))

(declare-fun b!272014 () Bool)

(assert (=> b!272014 (= e!174713 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!272014 (arrayNoDuplicates!0 (array!13364 (store (arr!6331 a!3325) i!1267 k!2581) (size!6683 a!3325)) #b00000000000000000000000000000000 Nil!4136)))

(declare-datatypes ((Unit!8465 0))(
  ( (Unit!8466) )
))
(declare-fun lt!135907 () Unit!8465)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4139) Unit!8465)

(assert (=> b!272014 (= lt!135907 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4136))))

(declare-fun b!272015 () Bool)

(assert (=> b!272015 (= e!174711 e!174713)))

(declare-fun res!136007 () Bool)

(assert (=> b!272015 (=> (not res!136007) (not e!174713))))

(declare-datatypes ((SeekEntryResult!1489 0))(
  ( (MissingZero!1489 (index!8126 (_ BitVec 32))) (Found!1489 (index!8127 (_ BitVec 32))) (Intermediate!1489 (undefined!2301 Bool) (index!8128 (_ BitVec 32)) (x!26446 (_ BitVec 32))) (Undefined!1489) (MissingVacant!1489 (index!8129 (_ BitVec 32))) )
))
(declare-fun lt!135906 () SeekEntryResult!1489)

(assert (=> b!272015 (= res!136007 (or (= lt!135906 (MissingZero!1489 i!1267)) (= lt!135906 (MissingVacant!1489 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13363 (_ BitVec 32)) SeekEntryResult!1489)

(assert (=> b!272015 (= lt!135906 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272016 () Bool)

(declare-fun res!136001 () Bool)

(assert (=> b!272016 (=> (not res!136001) (not e!174711))))

(assert (=> b!272016 (= res!136001 (and (= (size!6683 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6683 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6683 a!3325))))))

(declare-fun res!136003 () Bool)

(assert (=> start!26266 (=> (not res!136003) (not e!174711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26266 (= res!136003 (validMask!0 mask!3868))))

(assert (=> start!26266 e!174711))

(declare-fun array_inv!4294 (array!13363) Bool)

(assert (=> start!26266 (array_inv!4294 a!3325)))

(assert (=> start!26266 true))

(declare-fun b!272010 () Bool)

(declare-fun res!136004 () Bool)

(assert (=> b!272010 (=> (not res!136004) (not e!174711))))

(declare-fun arrayContainsKey!0 (array!13363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272010 (= res!136004 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272017 () Bool)

(declare-fun res!136008 () Bool)

(assert (=> b!272017 (=> (not res!136008) (not e!174711))))

(assert (=> b!272017 (= res!136008 (validKeyInArray!0 k!2581))))

(declare-fun b!272018 () Bool)

(declare-fun res!136000 () Bool)

(assert (=> b!272018 (=> (not res!136000) (not e!174713))))

(assert (=> b!272018 (= res!136000 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26266 res!136003) b!272016))

(assert (= (and b!272016 res!136001) b!272017))

(assert (= (and b!272017 res!136008) b!272013))

(assert (= (and b!272013 res!136002) b!272010))

(assert (= (and b!272010 res!136004) b!272015))

(assert (= (and b!272015 res!136007) b!272012))

(assert (= (and b!272012 res!136005) b!272018))

(assert (= (and b!272018 res!136000) b!272011))

(assert (= (and b!272011 res!136006) b!272014))

(declare-fun m!287157 () Bool)

(assert (=> b!272017 m!287157))

(declare-fun m!287159 () Bool)

(assert (=> b!272014 m!287159))

(declare-fun m!287161 () Bool)

(assert (=> b!272014 m!287161))

(declare-fun m!287163 () Bool)

(assert (=> b!272014 m!287163))

(declare-fun m!287165 () Bool)

(assert (=> b!272011 m!287165))

(assert (=> b!272011 m!287165))

(declare-fun m!287167 () Bool)

(assert (=> b!272011 m!287167))

(declare-fun m!287169 () Bool)

(assert (=> b!272013 m!287169))

(declare-fun m!287171 () Bool)

(assert (=> start!26266 m!287171))

(declare-fun m!287173 () Bool)

(assert (=> start!26266 m!287173))

(declare-fun m!287175 () Bool)

(assert (=> b!272015 m!287175))

(declare-fun m!287177 () Bool)

(assert (=> b!272010 m!287177))

(declare-fun m!287179 () Bool)

(assert (=> b!272012 m!287179))

(push 1)

(assert (not start!26266))

(assert (not b!272017))

