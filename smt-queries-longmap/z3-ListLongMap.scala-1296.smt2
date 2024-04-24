; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26334 () Bool)

(assert start!26334)

(declare-fun b!272975 () Bool)

(declare-fun res!136945 () Bool)

(declare-fun e!175055 () Bool)

(assert (=> b!272975 (=> (not res!136945) (not e!175055))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272975 (= res!136945 (validKeyInArray!0 k0!2581))))

(declare-fun b!272976 () Bool)

(declare-fun res!136939 () Bool)

(assert (=> b!272976 (=> (not res!136939) (not e!175055))))

(declare-datatypes ((array!13430 0))(
  ( (array!13431 (arr!6364 (Array (_ BitVec 32) (_ BitVec 64))) (size!6716 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13430)

(declare-datatypes ((List!4085 0))(
  ( (Nil!4082) (Cons!4081 (h!4748 (_ BitVec 64)) (t!9159 List!4085)) )
))
(declare-fun arrayNoDuplicates!0 (array!13430 (_ BitVec 32) List!4085) Bool)

(assert (=> b!272976 (= res!136939 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4082))))

(declare-fun b!272977 () Bool)

(declare-fun e!175052 () Bool)

(assert (=> b!272977 (= e!175055 e!175052)))

(declare-fun res!136947 () Bool)

(assert (=> b!272977 (=> (not res!136947) (not e!175052))))

(declare-datatypes ((SeekEntryResult!1487 0))(
  ( (MissingZero!1487 (index!8118 (_ BitVec 32))) (Found!1487 (index!8119 (_ BitVec 32))) (Intermediate!1487 (undefined!2299 Bool) (index!8120 (_ BitVec 32)) (x!26540 (_ BitVec 32))) (Undefined!1487) (MissingVacant!1487 (index!8121 (_ BitVec 32))) )
))
(declare-fun lt!136192 () SeekEntryResult!1487)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272977 (= res!136947 (or (= lt!136192 (MissingZero!1487 i!1267)) (= lt!136192 (MissingVacant!1487 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13430 (_ BitVec 32)) SeekEntryResult!1487)

(assert (=> b!272977 (= lt!136192 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272978 () Bool)

(declare-fun res!136940 () Bool)

(assert (=> b!272978 (=> (not res!136940) (not e!175055))))

(declare-fun arrayContainsKey!0 (array!13430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272978 (= res!136940 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272979 () Bool)

(declare-fun res!136946 () Bool)

(assert (=> b!272979 (=> (not res!136946) (not e!175055))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272979 (= res!136946 (and (= (size!6716 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6716 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6716 a!3325))))))

(declare-fun b!272980 () Bool)

(declare-fun e!175053 () Bool)

(assert (=> b!272980 (= e!175052 e!175053)))

(declare-fun res!136944 () Bool)

(assert (=> b!272980 (=> (not res!136944) (not e!175053))))

(assert (=> b!272980 (= res!136944 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136191 () array!13430)

(assert (=> b!272980 (= lt!136191 (array!13431 (store (arr!6364 a!3325) i!1267 k0!2581) (size!6716 a!3325)))))

(declare-fun b!272981 () Bool)

(declare-fun res!136943 () Bool)

(assert (=> b!272981 (=> (not res!136943) (not e!175053))))

(assert (=> b!272981 (= res!136943 (validKeyInArray!0 (select (arr!6364 a!3325) startIndex!26)))))

(declare-fun b!272982 () Bool)

(assert (=> b!272982 (= e!175053 (not true))))

(assert (=> b!272982 (= (seekEntryOrOpen!0 (select (arr!6364 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6364 a!3325) i!1267 k0!2581) startIndex!26) lt!136191 mask!3868))))

(declare-datatypes ((Unit!8513 0))(
  ( (Unit!8514) )
))
(declare-fun lt!136194 () Unit!8513)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13430 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8513)

(assert (=> b!272982 (= lt!136194 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!272982 (arrayNoDuplicates!0 lt!136191 #b00000000000000000000000000000000 Nil!4082)))

(declare-fun lt!136193 () Unit!8513)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13430 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4085) Unit!8513)

(assert (=> b!272982 (= lt!136193 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4082))))

(declare-fun b!272983 () Bool)

(declare-fun res!136941 () Bool)

(assert (=> b!272983 (=> (not res!136941) (not e!175052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13430 (_ BitVec 32)) Bool)

(assert (=> b!272983 (= res!136941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!136942 () Bool)

(assert (=> start!26334 (=> (not res!136942) (not e!175055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26334 (= res!136942 (validMask!0 mask!3868))))

(assert (=> start!26334 e!175055))

(declare-fun array_inv!4314 (array!13430) Bool)

(assert (=> start!26334 (array_inv!4314 a!3325)))

(assert (=> start!26334 true))

(assert (= (and start!26334 res!136942) b!272979))

(assert (= (and b!272979 res!136946) b!272975))

(assert (= (and b!272975 res!136945) b!272976))

(assert (= (and b!272976 res!136939) b!272978))

(assert (= (and b!272978 res!136940) b!272977))

(assert (= (and b!272977 res!136947) b!272983))

(assert (= (and b!272983 res!136941) b!272980))

(assert (= (and b!272980 res!136944) b!272981))

(assert (= (and b!272981 res!136943) b!272982))

(declare-fun m!288203 () Bool)

(assert (=> b!272975 m!288203))

(declare-fun m!288205 () Bool)

(assert (=> start!26334 m!288205))

(declare-fun m!288207 () Bool)

(assert (=> start!26334 m!288207))

(declare-fun m!288209 () Bool)

(assert (=> b!272983 m!288209))

(declare-fun m!288211 () Bool)

(assert (=> b!272977 m!288211))

(declare-fun m!288213 () Bool)

(assert (=> b!272982 m!288213))

(declare-fun m!288215 () Bool)

(assert (=> b!272982 m!288215))

(declare-fun m!288217 () Bool)

(assert (=> b!272982 m!288217))

(declare-fun m!288219 () Bool)

(assert (=> b!272982 m!288219))

(declare-fun m!288221 () Bool)

(assert (=> b!272982 m!288221))

(declare-fun m!288223 () Bool)

(assert (=> b!272982 m!288223))

(assert (=> b!272982 m!288215))

(declare-fun m!288225 () Bool)

(assert (=> b!272982 m!288225))

(assert (=> b!272982 m!288219))

(declare-fun m!288227 () Bool)

(assert (=> b!272982 m!288227))

(assert (=> b!272980 m!288217))

(declare-fun m!288229 () Bool)

(assert (=> b!272978 m!288229))

(declare-fun m!288231 () Bool)

(assert (=> b!272976 m!288231))

(assert (=> b!272981 m!288219))

(assert (=> b!272981 m!288219))

(declare-fun m!288233 () Bool)

(assert (=> b!272981 m!288233))

(check-sat (not start!26334) (not b!272983) (not b!272978) (not b!272981) (not b!272975) (not b!272982) (not b!272976) (not b!272977))
(check-sat)
