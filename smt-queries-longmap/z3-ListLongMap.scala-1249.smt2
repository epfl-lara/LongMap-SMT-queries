; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26054 () Bool)

(assert start!26054)

(declare-fun b!268755 () Bool)

(declare-fun e!173541 () Bool)

(assert (=> b!268755 (= e!173541 false)))

(declare-fun lt!134983 () Bool)

(declare-datatypes ((array!13151 0))(
  ( (array!13152 (arr!6225 (Array (_ BitVec 32) (_ BitVec 64))) (size!6577 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13151)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13151 (_ BitVec 32)) Bool)

(assert (=> b!268755 (= lt!134983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268756 () Bool)

(declare-fun e!173543 () Bool)

(assert (=> b!268756 (= e!173543 e!173541)))

(declare-fun res!133037 () Bool)

(assert (=> b!268756 (=> (not res!133037) (not e!173541))))

(declare-datatypes ((SeekEntryResult!1383 0))(
  ( (MissingZero!1383 (index!7702 (_ BitVec 32))) (Found!1383 (index!7703 (_ BitVec 32))) (Intermediate!1383 (undefined!2195 Bool) (index!7704 (_ BitVec 32)) (x!26060 (_ BitVec 32))) (Undefined!1383) (MissingVacant!1383 (index!7705 (_ BitVec 32))) )
))
(declare-fun lt!134982 () SeekEntryResult!1383)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268756 (= res!133037 (or (= lt!134982 (MissingZero!1383 i!1267)) (= lt!134982 (MissingVacant!1383 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13151 (_ BitVec 32)) SeekEntryResult!1383)

(assert (=> b!268756 (= lt!134982 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268757 () Bool)

(declare-fun res!133034 () Bool)

(assert (=> b!268757 (=> (not res!133034) (not e!173543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268757 (= res!133034 (validKeyInArray!0 k0!2581))))

(declare-fun b!268758 () Bool)

(declare-fun res!133036 () Bool)

(assert (=> b!268758 (=> (not res!133036) (not e!173543))))

(declare-datatypes ((List!4033 0))(
  ( (Nil!4030) (Cons!4029 (h!4696 (_ BitVec 64)) (t!9115 List!4033)) )
))
(declare-fun arrayNoDuplicates!0 (array!13151 (_ BitVec 32) List!4033) Bool)

(assert (=> b!268758 (= res!133036 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4030))))

(declare-fun res!133038 () Bool)

(assert (=> start!26054 (=> (not res!133038) (not e!173543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26054 (= res!133038 (validMask!0 mask!3868))))

(assert (=> start!26054 e!173543))

(declare-fun array_inv!4188 (array!13151) Bool)

(assert (=> start!26054 (array_inv!4188 a!3325)))

(assert (=> start!26054 true))

(declare-fun b!268759 () Bool)

(declare-fun res!133035 () Bool)

(assert (=> b!268759 (=> (not res!133035) (not e!173543))))

(declare-fun arrayContainsKey!0 (array!13151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268759 (= res!133035 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268760 () Bool)

(declare-fun res!133033 () Bool)

(assert (=> b!268760 (=> (not res!133033) (not e!173543))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268760 (= res!133033 (and (= (size!6577 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6577 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6577 a!3325))))))

(assert (= (and start!26054 res!133038) b!268760))

(assert (= (and b!268760 res!133033) b!268757))

(assert (= (and b!268757 res!133034) b!268758))

(assert (= (and b!268758 res!133036) b!268759))

(assert (= (and b!268759 res!133035) b!268756))

(assert (= (and b!268756 res!133037) b!268755))

(declare-fun m!284813 () Bool)

(assert (=> b!268757 m!284813))

(declare-fun m!284815 () Bool)

(assert (=> b!268756 m!284815))

(declare-fun m!284817 () Bool)

(assert (=> b!268759 m!284817))

(declare-fun m!284819 () Bool)

(assert (=> start!26054 m!284819))

(declare-fun m!284821 () Bool)

(assert (=> start!26054 m!284821))

(declare-fun m!284823 () Bool)

(assert (=> b!268758 m!284823))

(declare-fun m!284825 () Bool)

(assert (=> b!268755 m!284825))

(check-sat (not b!268756) (not start!26054) (not b!268759) (not b!268758) (not b!268757) (not b!268755))
(check-sat)
