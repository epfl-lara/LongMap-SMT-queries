; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26048 () Bool)

(assert start!26048)

(declare-fun b!268536 () Bool)

(declare-fun e!173404 () Bool)

(declare-fun e!173405 () Bool)

(assert (=> b!268536 (= e!173404 e!173405)))

(declare-fun res!132868 () Bool)

(assert (=> b!268536 (=> (not res!132868) (not e!173405))))

(declare-datatypes ((SeekEntryResult!1373 0))(
  ( (MissingZero!1373 (index!7662 (_ BitVec 32))) (Found!1373 (index!7663 (_ BitVec 32))) (Intermediate!1373 (undefined!2185 Bool) (index!7664 (_ BitVec 32)) (x!26041 (_ BitVec 32))) (Undefined!1373) (MissingVacant!1373 (index!7665 (_ BitVec 32))) )
))
(declare-fun lt!134778 () SeekEntryResult!1373)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268536 (= res!132868 (or (= lt!134778 (MissingZero!1373 i!1267)) (= lt!134778 (MissingVacant!1373 i!1267))))))

(declare-datatypes ((array!13134 0))(
  ( (array!13135 (arr!6216 (Array (_ BitVec 32) (_ BitVec 64))) (size!6569 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13134)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13134 (_ BitVec 32)) SeekEntryResult!1373)

(assert (=> b!268536 (= lt!134778 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268537 () Bool)

(declare-fun res!132867 () Bool)

(assert (=> b!268537 (=> (not res!132867) (not e!173404))))

(declare-fun arrayContainsKey!0 (array!13134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268537 (= res!132867 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268538 () Bool)

(declare-fun res!132871 () Bool)

(assert (=> b!268538 (=> (not res!132871) (not e!173404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268538 (= res!132871 (validKeyInArray!0 k0!2581))))

(declare-fun b!268539 () Bool)

(assert (=> b!268539 (= e!173405 false)))

(declare-fun lt!134777 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13134 (_ BitVec 32)) Bool)

(assert (=> b!268539 (= lt!134777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!132870 () Bool)

(assert (=> start!26048 (=> (not res!132870) (not e!173404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26048 (= res!132870 (validMask!0 mask!3868))))

(assert (=> start!26048 e!173404))

(declare-fun array_inv!4188 (array!13134) Bool)

(assert (=> start!26048 (array_inv!4188 a!3325)))

(assert (=> start!26048 true))

(declare-fun b!268540 () Bool)

(declare-fun res!132866 () Bool)

(assert (=> b!268540 (=> (not res!132866) (not e!173404))))

(declare-datatypes ((List!3997 0))(
  ( (Nil!3994) (Cons!3993 (h!4660 (_ BitVec 64)) (t!9070 List!3997)) )
))
(declare-fun arrayNoDuplicates!0 (array!13134 (_ BitVec 32) List!3997) Bool)

(assert (=> b!268540 (= res!132866 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3994))))

(declare-fun b!268541 () Bool)

(declare-fun res!132869 () Bool)

(assert (=> b!268541 (=> (not res!132869) (not e!173404))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268541 (= res!132869 (and (= (size!6569 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6569 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6569 a!3325))))))

(assert (= (and start!26048 res!132870) b!268541))

(assert (= (and b!268541 res!132869) b!268538))

(assert (= (and b!268538 res!132871) b!268540))

(assert (= (and b!268540 res!132866) b!268537))

(assert (= (and b!268537 res!132867) b!268536))

(assert (= (and b!268536 res!132868) b!268539))

(declare-fun m!284165 () Bool)

(assert (=> b!268536 m!284165))

(declare-fun m!284167 () Bool)

(assert (=> b!268538 m!284167))

(declare-fun m!284169 () Bool)

(assert (=> start!26048 m!284169))

(declare-fun m!284171 () Bool)

(assert (=> start!26048 m!284171))

(declare-fun m!284173 () Bool)

(assert (=> b!268540 m!284173))

(declare-fun m!284175 () Bool)

(assert (=> b!268537 m!284175))

(declare-fun m!284177 () Bool)

(assert (=> b!268539 m!284177))

(check-sat (not b!268537) (not b!268540) (not b!268538) (not b!268536) (not start!26048) (not b!268539))
(check-sat)
