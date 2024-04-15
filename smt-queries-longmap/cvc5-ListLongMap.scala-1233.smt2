; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25962 () Bool)

(assert start!25962)

(declare-fun b!267799 () Bool)

(declare-fun res!132133 () Bool)

(declare-fun e!173063 () Bool)

(assert (=> b!267799 (=> (not res!132133) (not e!173063))))

(declare-datatypes ((array!13048 0))(
  ( (array!13049 (arr!6173 (Array (_ BitVec 32) (_ BitVec 64))) (size!6526 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13048)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267799 (= res!132133 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267800 () Bool)

(declare-fun res!132129 () Bool)

(assert (=> b!267800 (=> (not res!132129) (not e!173063))))

(declare-datatypes ((List!3954 0))(
  ( (Nil!3951) (Cons!3950 (h!4617 (_ BitVec 64)) (t!9027 List!3954)) )
))
(declare-fun arrayNoDuplicates!0 (array!13048 (_ BitVec 32) List!3954) Bool)

(assert (=> b!267800 (= res!132129 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3951))))

(declare-fun b!267801 () Bool)

(assert (=> b!267801 (= e!173063 false)))

(declare-datatypes ((SeekEntryResult!1330 0))(
  ( (MissingZero!1330 (index!7490 (_ BitVec 32))) (Found!1330 (index!7491 (_ BitVec 32))) (Intermediate!1330 (undefined!2142 Bool) (index!7492 (_ BitVec 32)) (x!25878 (_ BitVec 32))) (Undefined!1330) (MissingVacant!1330 (index!7493 (_ BitVec 32))) )
))
(declare-fun lt!134574 () SeekEntryResult!1330)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13048 (_ BitVec 32)) SeekEntryResult!1330)

(assert (=> b!267801 (= lt!134574 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132132 () Bool)

(assert (=> start!25962 (=> (not res!132132) (not e!173063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25962 (= res!132132 (validMask!0 mask!3868))))

(assert (=> start!25962 e!173063))

(declare-fun array_inv!4145 (array!13048) Bool)

(assert (=> start!25962 (array_inv!4145 a!3325)))

(assert (=> start!25962 true))

(declare-fun b!267802 () Bool)

(declare-fun res!132131 () Bool)

(assert (=> b!267802 (=> (not res!132131) (not e!173063))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267802 (= res!132131 (and (= (size!6526 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6526 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6526 a!3325))))))

(declare-fun b!267803 () Bool)

(declare-fun res!132130 () Bool)

(assert (=> b!267803 (=> (not res!132130) (not e!173063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267803 (= res!132130 (validKeyInArray!0 k!2581))))

(assert (= (and start!25962 res!132132) b!267802))

(assert (= (and b!267802 res!132131) b!267803))

(assert (= (and b!267803 res!132130) b!267800))

(assert (= (and b!267800 res!132129) b!267799))

(assert (= (and b!267799 res!132133) b!267801))

(declare-fun m!283595 () Bool)

(assert (=> b!267799 m!283595))

(declare-fun m!283597 () Bool)

(assert (=> b!267803 m!283597))

(declare-fun m!283599 () Bool)

(assert (=> b!267800 m!283599))

(declare-fun m!283601 () Bool)

(assert (=> start!25962 m!283601))

(declare-fun m!283603 () Bool)

(assert (=> start!25962 m!283603))

(declare-fun m!283605 () Bool)

(assert (=> b!267801 m!283605))

(push 1)

(assert (not b!267800))

(assert (not b!267803))

(assert (not start!25962))

(assert (not b!267801))

(assert (not b!267799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

