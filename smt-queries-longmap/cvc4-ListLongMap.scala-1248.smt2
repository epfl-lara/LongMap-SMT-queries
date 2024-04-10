; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26050 () Bool)

(assert start!26050)

(declare-fun b!268719 () Bool)

(declare-fun res!133001 () Bool)

(declare-fun e!173524 () Bool)

(assert (=> b!268719 (=> (not res!133001) (not e!173524))))

(declare-datatypes ((array!13147 0))(
  ( (array!13148 (arr!6223 (Array (_ BitVec 32) (_ BitVec 64))) (size!6575 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13147)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268719 (= res!133001 (and (= (size!6575 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6575 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6575 a!3325))))))

(declare-fun b!268721 () Bool)

(declare-fun res!133002 () Bool)

(assert (=> b!268721 (=> (not res!133002) (not e!173524))))

(declare-datatypes ((List!4031 0))(
  ( (Nil!4028) (Cons!4027 (h!4694 (_ BitVec 64)) (t!9113 List!4031)) )
))
(declare-fun arrayNoDuplicates!0 (array!13147 (_ BitVec 32) List!4031) Bool)

(assert (=> b!268721 (= res!133002 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4028))))

(declare-fun b!268722 () Bool)

(declare-fun res!132997 () Bool)

(assert (=> b!268722 (=> (not res!132997) (not e!173524))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268722 (= res!132997 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268723 () Bool)

(declare-fun res!132998 () Bool)

(assert (=> b!268723 (=> (not res!132998) (not e!173524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268723 (= res!132998 (validKeyInArray!0 k!2581))))

(declare-fun b!268724 () Bool)

(declare-fun e!173523 () Bool)

(assert (=> b!268724 (= e!173524 e!173523)))

(declare-fun res!133000 () Bool)

(assert (=> b!268724 (=> (not res!133000) (not e!173523))))

(declare-datatypes ((SeekEntryResult!1381 0))(
  ( (MissingZero!1381 (index!7694 (_ BitVec 32))) (Found!1381 (index!7695 (_ BitVec 32))) (Intermediate!1381 (undefined!2193 Bool) (index!7696 (_ BitVec 32)) (x!26050 (_ BitVec 32))) (Undefined!1381) (MissingVacant!1381 (index!7697 (_ BitVec 32))) )
))
(declare-fun lt!134971 () SeekEntryResult!1381)

(assert (=> b!268724 (= res!133000 (or (= lt!134971 (MissingZero!1381 i!1267)) (= lt!134971 (MissingVacant!1381 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13147 (_ BitVec 32)) SeekEntryResult!1381)

(assert (=> b!268724 (= lt!134971 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132999 () Bool)

(assert (=> start!26050 (=> (not res!132999) (not e!173524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26050 (= res!132999 (validMask!0 mask!3868))))

(assert (=> start!26050 e!173524))

(declare-fun array_inv!4186 (array!13147) Bool)

(assert (=> start!26050 (array_inv!4186 a!3325)))

(assert (=> start!26050 true))

(declare-fun b!268720 () Bool)

(assert (=> b!268720 (= e!173523 false)))

(declare-fun lt!134970 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13147 (_ BitVec 32)) Bool)

(assert (=> b!268720 (= lt!134970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26050 res!132999) b!268719))

(assert (= (and b!268719 res!133001) b!268723))

(assert (= (and b!268723 res!132998) b!268721))

(assert (= (and b!268721 res!133002) b!268722))

(assert (= (and b!268722 res!132997) b!268724))

(assert (= (and b!268724 res!133000) b!268720))

(declare-fun m!284785 () Bool)

(assert (=> b!268724 m!284785))

(declare-fun m!284787 () Bool)

(assert (=> b!268723 m!284787))

(declare-fun m!284789 () Bool)

(assert (=> b!268721 m!284789))

(declare-fun m!284791 () Bool)

(assert (=> b!268720 m!284791))

(declare-fun m!284793 () Bool)

(assert (=> b!268722 m!284793))

(declare-fun m!284795 () Bool)

(assert (=> start!26050 m!284795))

(declare-fun m!284797 () Bool)

(assert (=> start!26050 m!284797))

(push 1)

(assert (not b!268721))

(assert (not b!268722))

(assert (not b!268723))

