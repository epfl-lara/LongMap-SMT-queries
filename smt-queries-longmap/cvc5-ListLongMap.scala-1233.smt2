; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25956 () Bool)

(assert start!25956)

(declare-fun b!267916 () Bool)

(declare-fun res!132195 () Bool)

(declare-fun e!173153 () Bool)

(assert (=> b!267916 (=> (not res!132195) (not e!173153))))

(declare-datatypes ((array!13053 0))(
  ( (array!13054 (arr!6176 (Array (_ BitVec 32) (_ BitVec 64))) (size!6528 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13053)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267916 (= res!132195 (and (= (size!6528 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6528 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6528 a!3325))))))

(declare-fun b!267917 () Bool)

(declare-fun res!132198 () Bool)

(assert (=> b!267917 (=> (not res!132198) (not e!173153))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267917 (= res!132198 (validKeyInArray!0 k!2581))))

(declare-fun b!267918 () Bool)

(assert (=> b!267918 (= e!173153 false)))

(declare-datatypes ((SeekEntryResult!1334 0))(
  ( (MissingZero!1334 (index!7506 (_ BitVec 32))) (Found!1334 (index!7507 (_ BitVec 32))) (Intermediate!1334 (undefined!2146 Bool) (index!7508 (_ BitVec 32)) (x!25883 (_ BitVec 32))) (Undefined!1334) (MissingVacant!1334 (index!7509 (_ BitVec 32))) )
))
(declare-fun lt!134749 () SeekEntryResult!1334)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13053 (_ BitVec 32)) SeekEntryResult!1334)

(assert (=> b!267918 (= lt!134749 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!267919 () Bool)

(declare-fun res!132196 () Bool)

(assert (=> b!267919 (=> (not res!132196) (not e!173153))))

(declare-fun arrayContainsKey!0 (array!13053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267919 (= res!132196 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132194 () Bool)

(assert (=> start!25956 (=> (not res!132194) (not e!173153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25956 (= res!132194 (validMask!0 mask!3868))))

(assert (=> start!25956 e!173153))

(declare-fun array_inv!4139 (array!13053) Bool)

(assert (=> start!25956 (array_inv!4139 a!3325)))

(assert (=> start!25956 true))

(declare-fun b!267920 () Bool)

(declare-fun res!132197 () Bool)

(assert (=> b!267920 (=> (not res!132197) (not e!173153))))

(declare-datatypes ((List!3984 0))(
  ( (Nil!3981) (Cons!3980 (h!4647 (_ BitVec 64)) (t!9066 List!3984)) )
))
(declare-fun arrayNoDuplicates!0 (array!13053 (_ BitVec 32) List!3984) Bool)

(assert (=> b!267920 (= res!132197 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3981))))

(assert (= (and start!25956 res!132194) b!267916))

(assert (= (and b!267916 res!132195) b!267917))

(assert (= (and b!267917 res!132198) b!267920))

(assert (= (and b!267920 res!132197) b!267919))

(assert (= (and b!267919 res!132196) b!267918))

(declare-fun m!284163 () Bool)

(assert (=> b!267918 m!284163))

(declare-fun m!284165 () Bool)

(assert (=> b!267919 m!284165))

(declare-fun m!284167 () Bool)

(assert (=> b!267920 m!284167))

(declare-fun m!284169 () Bool)

(assert (=> start!25956 m!284169))

(declare-fun m!284171 () Bool)

(assert (=> start!25956 m!284171))

(declare-fun m!284173 () Bool)

(assert (=> b!267917 m!284173))

(push 1)

(assert (not start!25956))

(assert (not b!267920))

(assert (not b!267919))

(assert (not b!267917))

(assert (not b!267918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

