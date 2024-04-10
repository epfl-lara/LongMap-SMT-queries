; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27504 () Bool)

(assert start!27504)

(declare-fun b!284223 () Bool)

(declare-fun e!180336 () Bool)

(assert (=> b!284223 (= e!180336 false)))

(declare-fun lt!140448 () Bool)

(declare-datatypes ((array!14154 0))(
  ( (array!14155 (arr!6716 (Array (_ BitVec 32) (_ BitVec 64))) (size!7068 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14154)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14154 (_ BitVec 32)) Bool)

(assert (=> b!284223 (= lt!140448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284224 () Bool)

(declare-fun res!146736 () Bool)

(declare-fun e!180337 () Bool)

(assert (=> b!284224 (=> (not res!146736) (not e!180337))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284224 (= res!146736 (and (= (size!7068 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7068 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7068 a!3325))))))

(declare-fun b!284225 () Bool)

(assert (=> b!284225 (= e!180337 e!180336)))

(declare-fun res!146733 () Bool)

(assert (=> b!284225 (=> (not res!146733) (not e!180336))))

(declare-datatypes ((SeekEntryResult!1874 0))(
  ( (MissingZero!1874 (index!9666 (_ BitVec 32))) (Found!1874 (index!9667 (_ BitVec 32))) (Intermediate!1874 (undefined!2686 Bool) (index!9668 (_ BitVec 32)) (x!27881 (_ BitVec 32))) (Undefined!1874) (MissingVacant!1874 (index!9669 (_ BitVec 32))) )
))
(declare-fun lt!140449 () SeekEntryResult!1874)

(assert (=> b!284225 (= res!146733 (or (= lt!140449 (MissingZero!1874 i!1267)) (= lt!140449 (MissingVacant!1874 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14154 (_ BitVec 32)) SeekEntryResult!1874)

(assert (=> b!284225 (= lt!140449 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284226 () Bool)

(declare-fun res!146734 () Bool)

(assert (=> b!284226 (=> (not res!146734) (not e!180337))))

(declare-fun arrayContainsKey!0 (array!14154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284226 (= res!146734 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284228 () Bool)

(declare-fun res!146735 () Bool)

(assert (=> b!284228 (=> (not res!146735) (not e!180337))))

(declare-datatypes ((List!4524 0))(
  ( (Nil!4521) (Cons!4520 (h!5193 (_ BitVec 64)) (t!9606 List!4524)) )
))
(declare-fun arrayNoDuplicates!0 (array!14154 (_ BitVec 32) List!4524) Bool)

(assert (=> b!284228 (= res!146735 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4521))))

(declare-fun res!146731 () Bool)

(assert (=> start!27504 (=> (not res!146731) (not e!180337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27504 (= res!146731 (validMask!0 mask!3868))))

(assert (=> start!27504 e!180337))

(declare-fun array_inv!4679 (array!14154) Bool)

(assert (=> start!27504 (array_inv!4679 a!3325)))

(assert (=> start!27504 true))

(declare-fun b!284227 () Bool)

(declare-fun res!146732 () Bool)

(assert (=> b!284227 (=> (not res!146732) (not e!180337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284227 (= res!146732 (validKeyInArray!0 k!2581))))

(assert (= (and start!27504 res!146731) b!284224))

(assert (= (and b!284224 res!146736) b!284227))

(assert (= (and b!284227 res!146732) b!284228))

(assert (= (and b!284228 res!146735) b!284226))

(assert (= (and b!284226 res!146734) b!284225))

(assert (= (and b!284225 res!146733) b!284223))

(declare-fun m!299295 () Bool)

(assert (=> b!284227 m!299295))

(declare-fun m!299297 () Bool)

(assert (=> b!284225 m!299297))

(declare-fun m!299299 () Bool)

(assert (=> b!284228 m!299299))

(declare-fun m!299301 () Bool)

(assert (=> b!284223 m!299301))

(declare-fun m!299303 () Bool)

(assert (=> start!27504 m!299303))

(declare-fun m!299305 () Bool)

(assert (=> start!27504 m!299305))

(declare-fun m!299307 () Bool)

(assert (=> b!284226 m!299307))

(push 1)

(assert (not b!284228))

