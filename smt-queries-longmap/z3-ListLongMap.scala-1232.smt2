; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25952 () Bool)

(assert start!25952)

(declare-fun b!267882 () Bool)

(declare-fun res!132162 () Bool)

(declare-fun e!173141 () Bool)

(assert (=> b!267882 (=> (not res!132162) (not e!173141))))

(declare-datatypes ((array!13049 0))(
  ( (array!13050 (arr!6174 (Array (_ BitVec 32) (_ BitVec 64))) (size!6526 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13049)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267882 (= res!132162 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267883 () Bool)

(declare-fun res!132165 () Bool)

(assert (=> b!267883 (=> (not res!132165) (not e!173141))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267883 (= res!132165 (and (= (size!6526 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6526 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6526 a!3325))))))

(declare-fun b!267884 () Bool)

(assert (=> b!267884 (= e!173141 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun res!132161 () Bool)

(assert (=> start!25952 (=> (not res!132161) (not e!173141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25952 (= res!132161 (validMask!0 mask!3868))))

(assert (=> start!25952 e!173141))

(declare-fun array_inv!4137 (array!13049) Bool)

(assert (=> start!25952 (array_inv!4137 a!3325)))

(assert (=> start!25952 true))

(declare-fun b!267885 () Bool)

(declare-fun res!132164 () Bool)

(assert (=> b!267885 (=> (not res!132164) (not e!173141))))

(declare-datatypes ((List!3982 0))(
  ( (Nil!3979) (Cons!3978 (h!4645 (_ BitVec 64)) (t!9064 List!3982)) )
))
(declare-fun arrayNoDuplicates!0 (array!13049 (_ BitVec 32) List!3982) Bool)

(assert (=> b!267885 (= res!132164 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3979))))

(declare-fun b!267886 () Bool)

(declare-fun res!132160 () Bool)

(assert (=> b!267886 (=> (not res!132160) (not e!173141))))

(declare-datatypes ((SeekEntryResult!1332 0))(
  ( (MissingZero!1332 (index!7498 (_ BitVec 32))) (Found!1332 (index!7499 (_ BitVec 32))) (Intermediate!1332 (undefined!2144 Bool) (index!7500 (_ BitVec 32)) (x!25873 (_ BitVec 32))) (Undefined!1332) (MissingVacant!1332 (index!7501 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13049 (_ BitVec 32)) SeekEntryResult!1332)

(assert (=> b!267886 (= res!132160 (not (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) (MissingZero!1332 i!1267))))))

(declare-fun b!267887 () Bool)

(declare-fun res!132163 () Bool)

(assert (=> b!267887 (=> (not res!132163) (not e!173141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267887 (= res!132163 (validKeyInArray!0 k0!2581))))

(assert (= (and start!25952 res!132161) b!267883))

(assert (= (and b!267883 res!132165) b!267887))

(assert (= (and b!267887 res!132163) b!267885))

(assert (= (and b!267885 res!132164) b!267882))

(assert (= (and b!267882 res!132162) b!267886))

(assert (= (and b!267886 res!132160) b!267884))

(declare-fun m!284139 () Bool)

(assert (=> start!25952 m!284139))

(declare-fun m!284141 () Bool)

(assert (=> start!25952 m!284141))

(declare-fun m!284143 () Bool)

(assert (=> b!267887 m!284143))

(declare-fun m!284145 () Bool)

(assert (=> b!267885 m!284145))

(declare-fun m!284147 () Bool)

(assert (=> b!267882 m!284147))

(declare-fun m!284149 () Bool)

(assert (=> b!267886 m!284149))

(check-sat (not b!267886) (not b!267887) (not b!267882) (not start!25952) (not b!267885))
(check-sat)
