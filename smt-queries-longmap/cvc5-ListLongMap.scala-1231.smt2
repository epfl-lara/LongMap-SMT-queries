; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25950 () Bool)

(assert start!25950)

(declare-fun b!267700 () Bool)

(declare-fun e!173028 () Bool)

(assert (=> b!267700 (= e!173028 false)))

(declare-datatypes ((array!13036 0))(
  ( (array!13037 (arr!6167 (Array (_ BitVec 32) (_ BitVec 64))) (size!6520 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13036)

(declare-datatypes ((SeekEntryResult!1324 0))(
  ( (MissingZero!1324 (index!7466 (_ BitVec 32))) (Found!1324 (index!7467 (_ BitVec 32))) (Intermediate!1324 (undefined!2136 Bool) (index!7468 (_ BitVec 32)) (x!25856 (_ BitVec 32))) (Undefined!1324) (MissingVacant!1324 (index!7469 (_ BitVec 32))) )
))
(declare-fun lt!134565 () SeekEntryResult!1324)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13036 (_ BitVec 32)) SeekEntryResult!1324)

(assert (=> b!267700 (= lt!134565 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!267701 () Bool)

(declare-fun res!132030 () Bool)

(assert (=> b!267701 (=> (not res!132030) (not e!173028))))

(declare-fun arrayContainsKey!0 (array!13036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267701 (= res!132030 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132034 () Bool)

(assert (=> start!25950 (=> (not res!132034) (not e!173028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25950 (= res!132034 (validMask!0 mask!3868))))

(assert (=> start!25950 e!173028))

(declare-fun array_inv!4139 (array!13036) Bool)

(assert (=> start!25950 (array_inv!4139 a!3325)))

(assert (=> start!25950 true))

(declare-fun b!267702 () Bool)

(declare-fun res!132031 () Bool)

(assert (=> b!267702 (=> (not res!132031) (not e!173028))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267702 (= res!132031 (and (= (size!6520 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6520 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6520 a!3325))))))

(declare-fun b!267703 () Bool)

(declare-fun res!132033 () Bool)

(assert (=> b!267703 (=> (not res!132033) (not e!173028))))

(declare-datatypes ((List!3948 0))(
  ( (Nil!3945) (Cons!3944 (h!4611 (_ BitVec 64)) (t!9021 List!3948)) )
))
(declare-fun arrayNoDuplicates!0 (array!13036 (_ BitVec 32) List!3948) Bool)

(assert (=> b!267703 (= res!132033 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3945))))

(declare-fun b!267704 () Bool)

(declare-fun res!132032 () Bool)

(assert (=> b!267704 (=> (not res!132032) (not e!173028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267704 (= res!132032 (validKeyInArray!0 k!2581))))

(assert (= (and start!25950 res!132034) b!267702))

(assert (= (and b!267702 res!132031) b!267704))

(assert (= (and b!267704 res!132032) b!267703))

(assert (= (and b!267703 res!132033) b!267701))

(assert (= (and b!267701 res!132030) b!267700))

(declare-fun m!283523 () Bool)

(assert (=> b!267704 m!283523))

(declare-fun m!283525 () Bool)

(assert (=> b!267703 m!283525))

(declare-fun m!283527 () Bool)

(assert (=> b!267700 m!283527))

(declare-fun m!283529 () Bool)

(assert (=> b!267701 m!283529))

(declare-fun m!283531 () Bool)

(assert (=> start!25950 m!283531))

(declare-fun m!283533 () Bool)

(assert (=> start!25950 m!283533))

(push 1)

(assert (not b!267703))

(assert (not b!267704))

(assert (not b!267701))

(assert (not b!267700))

(assert (not start!25950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

