; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26682 () Bool)

(assert start!26682)

(declare-fun res!140944 () Bool)

(declare-fun e!176870 () Bool)

(assert (=> start!26682 (=> (not res!140944) (not e!176870))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26682 (= res!140944 (validMask!0 mask!3868))))

(assert (=> start!26682 e!176870))

(declare-datatypes ((array!13778 0))(
  ( (array!13779 (arr!6538 (Array (_ BitVec 32) (_ BitVec 64))) (size!6890 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13778)

(declare-fun array_inv!4488 (array!13778) Bool)

(assert (=> start!26682 (array_inv!4488 a!3325)))

(assert (=> start!26682 true))

(declare-fun b!276976 () Bool)

(declare-fun res!140942 () Bool)

(assert (=> b!276976 (=> (not res!140942) (not e!176870))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276976 (= res!140942 (validKeyInArray!0 k0!2581))))

(declare-fun b!276977 () Bool)

(declare-fun res!140940 () Bool)

(declare-fun e!176869 () Bool)

(assert (=> b!276977 (=> (not res!140940) (not e!176869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13778 (_ BitVec 32)) Bool)

(assert (=> b!276977 (= res!140940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276978 () Bool)

(declare-fun res!140946 () Bool)

(assert (=> b!276978 (=> (not res!140946) (not e!176870))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276978 (= res!140946 (and (= (size!6890 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6890 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6890 a!3325))))))

(declare-fun b!276979 () Bool)

(declare-fun res!140945 () Bool)

(assert (=> b!276979 (=> (not res!140945) (not e!176870))))

(declare-fun arrayContainsKey!0 (array!13778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276979 (= res!140945 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276980 () Bool)

(assert (=> b!276980 (= e!176870 e!176869)))

(declare-fun res!140941 () Bool)

(assert (=> b!276980 (=> (not res!140941) (not e!176869))))

(declare-datatypes ((SeekEntryResult!1661 0))(
  ( (MissingZero!1661 (index!8814 (_ BitVec 32))) (Found!1661 (index!8815 (_ BitVec 32))) (Intermediate!1661 (undefined!2473 Bool) (index!8816 (_ BitVec 32)) (x!27178 (_ BitVec 32))) (Undefined!1661) (MissingVacant!1661 (index!8817 (_ BitVec 32))) )
))
(declare-fun lt!137850 () SeekEntryResult!1661)

(assert (=> b!276980 (= res!140941 (or (= lt!137850 (MissingZero!1661 i!1267)) (= lt!137850 (MissingVacant!1661 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13778 (_ BitVec 32)) SeekEntryResult!1661)

(assert (=> b!276980 (= lt!137850 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276981 () Bool)

(declare-fun res!140943 () Bool)

(assert (=> b!276981 (=> (not res!140943) (not e!176870))))

(declare-datatypes ((List!4259 0))(
  ( (Nil!4256) (Cons!4255 (h!4922 (_ BitVec 64)) (t!9333 List!4259)) )
))
(declare-fun arrayNoDuplicates!0 (array!13778 (_ BitVec 32) List!4259) Bool)

(assert (=> b!276981 (= res!140943 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4256))))

(declare-fun b!276982 () Bool)

(assert (=> b!276982 (= e!176869 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6890 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!6890 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!6890 a!3325) startIndex!26))))))

(assert (= (and start!26682 res!140944) b!276978))

(assert (= (and b!276978 res!140946) b!276976))

(assert (= (and b!276976 res!140942) b!276981))

(assert (= (and b!276981 res!140943) b!276979))

(assert (= (and b!276979 res!140945) b!276980))

(assert (= (and b!276980 res!140941) b!276977))

(assert (= (and b!276977 res!140940) b!276982))

(declare-fun m!292355 () Bool)

(assert (=> b!276979 m!292355))

(declare-fun m!292357 () Bool)

(assert (=> b!276976 m!292357))

(declare-fun m!292359 () Bool)

(assert (=> b!276977 m!292359))

(declare-fun m!292361 () Bool)

(assert (=> start!26682 m!292361))

(declare-fun m!292363 () Bool)

(assert (=> start!26682 m!292363))

(declare-fun m!292365 () Bool)

(assert (=> b!276980 m!292365))

(declare-fun m!292367 () Bool)

(assert (=> b!276981 m!292367))

(check-sat (not b!276979) (not b!276980) (not b!276976) (not b!276977) (not start!26682) (not b!276981))
(check-sat)
