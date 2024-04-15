; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25994 () Bool)

(assert start!25994)

(declare-fun b!268041 () Bool)

(declare-fun e!173161 () Bool)

(assert (=> b!268041 (= e!173161 false)))

(declare-fun lt!134624 () Bool)

(declare-datatypes ((array!13080 0))(
  ( (array!13081 (arr!6189 (Array (_ BitVec 32) (_ BitVec 64))) (size!6542 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13080)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13080 (_ BitVec 32)) Bool)

(assert (=> b!268041 (= lt!134624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268042 () Bool)

(declare-fun e!173163 () Bool)

(assert (=> b!268042 (= e!173163 e!173161)))

(declare-fun res!132376 () Bool)

(assert (=> b!268042 (=> (not res!132376) (not e!173161))))

(declare-datatypes ((SeekEntryResult!1346 0))(
  ( (MissingZero!1346 (index!7554 (_ BitVec 32))) (Found!1346 (index!7555 (_ BitVec 32))) (Intermediate!1346 (undefined!2158 Bool) (index!7556 (_ BitVec 32)) (x!25942 (_ BitVec 32))) (Undefined!1346) (MissingVacant!1346 (index!7557 (_ BitVec 32))) )
))
(declare-fun lt!134625 () SeekEntryResult!1346)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268042 (= res!132376 (or (= lt!134625 (MissingZero!1346 i!1267)) (= lt!134625 (MissingVacant!1346 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13080 (_ BitVec 32)) SeekEntryResult!1346)

(assert (=> b!268042 (= lt!134625 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!132375 () Bool)

(assert (=> start!25994 (=> (not res!132375) (not e!173163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25994 (= res!132375 (validMask!0 mask!3868))))

(assert (=> start!25994 e!173163))

(declare-fun array_inv!4161 (array!13080) Bool)

(assert (=> start!25994 (array_inv!4161 a!3325)))

(assert (=> start!25994 true))

(declare-fun b!268043 () Bool)

(declare-fun res!132371 () Bool)

(assert (=> b!268043 (=> (not res!132371) (not e!173163))))

(declare-datatypes ((List!3970 0))(
  ( (Nil!3967) (Cons!3966 (h!4633 (_ BitVec 64)) (t!9043 List!3970)) )
))
(declare-fun arrayNoDuplicates!0 (array!13080 (_ BitVec 32) List!3970) Bool)

(assert (=> b!268043 (= res!132371 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3967))))

(declare-fun b!268044 () Bool)

(declare-fun res!132373 () Bool)

(assert (=> b!268044 (=> (not res!132373) (not e!173163))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268044 (= res!132373 (and (= (size!6542 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6542 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6542 a!3325))))))

(declare-fun b!268045 () Bool)

(declare-fun res!132372 () Bool)

(assert (=> b!268045 (=> (not res!132372) (not e!173163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268045 (= res!132372 (validKeyInArray!0 k0!2581))))

(declare-fun b!268046 () Bool)

(declare-fun res!132374 () Bool)

(assert (=> b!268046 (=> (not res!132374) (not e!173163))))

(declare-fun arrayContainsKey!0 (array!13080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268046 (= res!132374 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!25994 res!132375) b!268044))

(assert (= (and b!268044 res!132373) b!268045))

(assert (= (and b!268045 res!132372) b!268043))

(assert (= (and b!268043 res!132371) b!268046))

(assert (= (and b!268046 res!132374) b!268042))

(assert (= (and b!268042 res!132376) b!268041))

(declare-fun m!283787 () Bool)

(assert (=> b!268043 m!283787))

(declare-fun m!283789 () Bool)

(assert (=> start!25994 m!283789))

(declare-fun m!283791 () Bool)

(assert (=> start!25994 m!283791))

(declare-fun m!283793 () Bool)

(assert (=> b!268046 m!283793))

(declare-fun m!283795 () Bool)

(assert (=> b!268045 m!283795))

(declare-fun m!283797 () Bool)

(assert (=> b!268041 m!283797))

(declare-fun m!283799 () Bool)

(assert (=> b!268042 m!283799))

(check-sat (not b!268041) (not b!268045) (not b!268043) (not b!268042) (not start!25994) (not b!268046))
(check-sat)
