; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26490 () Bool)

(assert start!26490)

(declare-fun b!275010 () Bool)

(declare-fun res!139004 () Bool)

(declare-fun e!175980 () Bool)

(assert (=> b!275010 (=> (not res!139004) (not e!175980))))

(declare-datatypes ((array!13587 0))(
  ( (array!13588 (arr!6443 (Array (_ BitVec 32) (_ BitVec 64))) (size!6795 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13587)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275010 (= res!139004 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275011 () Bool)

(declare-fun res!139003 () Bool)

(assert (=> b!275011 (=> (not res!139003) (not e!175980))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275011 (= res!139003 (and (= (size!6795 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6795 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6795 a!3325))))))

(declare-fun b!275012 () Bool)

(declare-fun e!175981 () Bool)

(assert (=> b!275012 (= e!175981 false)))

(declare-fun lt!137245 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13587 (_ BitVec 32)) Bool)

(assert (=> b!275012 (= lt!137245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139000 () Bool)

(assert (=> start!26490 (=> (not res!139000) (not e!175980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26490 (= res!139000 (validMask!0 mask!3868))))

(assert (=> start!26490 e!175980))

(declare-fun array_inv!4406 (array!13587) Bool)

(assert (=> start!26490 (array_inv!4406 a!3325)))

(assert (=> start!26490 true))

(declare-fun b!275013 () Bool)

(declare-fun res!139002 () Bool)

(assert (=> b!275013 (=> (not res!139002) (not e!175980))))

(declare-datatypes ((List!4251 0))(
  ( (Nil!4248) (Cons!4247 (h!4914 (_ BitVec 64)) (t!9333 List!4251)) )
))
(declare-fun arrayNoDuplicates!0 (array!13587 (_ BitVec 32) List!4251) Bool)

(assert (=> b!275013 (= res!139002 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4248))))

(declare-fun b!275014 () Bool)

(declare-fun res!139001 () Bool)

(assert (=> b!275014 (=> (not res!139001) (not e!175980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275014 (= res!139001 (validKeyInArray!0 k!2581))))

(declare-fun b!275015 () Bool)

(assert (=> b!275015 (= e!175980 e!175981)))

(declare-fun res!139005 () Bool)

(assert (=> b!275015 (=> (not res!139005) (not e!175981))))

(declare-datatypes ((SeekEntryResult!1601 0))(
  ( (MissingZero!1601 (index!8574 (_ BitVec 32))) (Found!1601 (index!8575 (_ BitVec 32))) (Intermediate!1601 (undefined!2413 Bool) (index!8576 (_ BitVec 32)) (x!26862 (_ BitVec 32))) (Undefined!1601) (MissingVacant!1601 (index!8577 (_ BitVec 32))) )
))
(declare-fun lt!137244 () SeekEntryResult!1601)

(assert (=> b!275015 (= res!139005 (or (= lt!137244 (MissingZero!1601 i!1267)) (= lt!137244 (MissingVacant!1601 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13587 (_ BitVec 32)) SeekEntryResult!1601)

(assert (=> b!275015 (= lt!137244 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26490 res!139000) b!275011))

(assert (= (and b!275011 res!139003) b!275014))

(assert (= (and b!275014 res!139001) b!275013))

(assert (= (and b!275013 res!139002) b!275010))

(assert (= (and b!275010 res!139004) b!275015))

(assert (= (and b!275015 res!139005) b!275012))

(declare-fun m!290673 () Bool)

(assert (=> start!26490 m!290673))

(declare-fun m!290675 () Bool)

(assert (=> start!26490 m!290675))

(declare-fun m!290677 () Bool)

(assert (=> b!275012 m!290677))

(declare-fun m!290679 () Bool)

(assert (=> b!275013 m!290679))

(declare-fun m!290681 () Bool)

(assert (=> b!275010 m!290681))

(declare-fun m!290683 () Bool)

(assert (=> b!275014 m!290683))

(declare-fun m!290685 () Bool)

(assert (=> b!275015 m!290685))

(push 1)

