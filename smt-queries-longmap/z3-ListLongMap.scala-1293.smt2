; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26316 () Bool)

(assert start!26316)

(declare-fun b!272732 () Bool)

(declare-fun res!136696 () Bool)

(declare-fun e!174960 () Bool)

(assert (=> b!272732 (=> (not res!136696) (not e!174960))))

(declare-datatypes ((array!13412 0))(
  ( (array!13413 (arr!6355 (Array (_ BitVec 32) (_ BitVec 64))) (size!6707 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13412)

(declare-datatypes ((List!4076 0))(
  ( (Nil!4073) (Cons!4072 (h!4739 (_ BitVec 64)) (t!9150 List!4076)) )
))
(declare-fun arrayNoDuplicates!0 (array!13412 (_ BitVec 32) List!4076) Bool)

(assert (=> b!272732 (= res!136696 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4073))))

(declare-fun b!272733 () Bool)

(declare-fun res!136698 () Bool)

(assert (=> b!272733 (=> (not res!136698) (not e!174960))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272733 (= res!136698 (validKeyInArray!0 k0!2581))))

(declare-fun b!272735 () Bool)

(declare-fun e!174962 () Bool)

(assert (=> b!272735 (= e!174962 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272735 (arrayNoDuplicates!0 (array!13413 (store (arr!6355 a!3325) i!1267 k0!2581) (size!6707 a!3325)) #b00000000000000000000000000000000 Nil!4073)))

(declare-datatypes ((Unit!8495 0))(
  ( (Unit!8496) )
))
(declare-fun lt!136115 () Unit!8495)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13412 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4076) Unit!8495)

(assert (=> b!272735 (= lt!136115 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4073))))

(declare-fun b!272736 () Bool)

(declare-fun res!136703 () Bool)

(assert (=> b!272736 (=> (not res!136703) (not e!174962))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272736 (= res!136703 (validKeyInArray!0 (select (arr!6355 a!3325) startIndex!26)))))

(declare-fun b!272737 () Bool)

(declare-fun res!136702 () Bool)

(assert (=> b!272737 (=> (not res!136702) (not e!174960))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272737 (= res!136702 (and (= (size!6707 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6707 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6707 a!3325))))))

(declare-fun b!272738 () Bool)

(assert (=> b!272738 (= e!174960 e!174962)))

(declare-fun res!136704 () Bool)

(assert (=> b!272738 (=> (not res!136704) (not e!174962))))

(declare-datatypes ((SeekEntryResult!1478 0))(
  ( (MissingZero!1478 (index!8082 (_ BitVec 32))) (Found!1478 (index!8083 (_ BitVec 32))) (Intermediate!1478 (undefined!2290 Bool) (index!8084 (_ BitVec 32)) (x!26507 (_ BitVec 32))) (Undefined!1478) (MissingVacant!1478 (index!8085 (_ BitVec 32))) )
))
(declare-fun lt!136116 () SeekEntryResult!1478)

(assert (=> b!272738 (= res!136704 (or (= lt!136116 (MissingZero!1478 i!1267)) (= lt!136116 (MissingVacant!1478 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13412 (_ BitVec 32)) SeekEntryResult!1478)

(assert (=> b!272738 (= lt!136116 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272734 () Bool)

(declare-fun res!136701 () Bool)

(assert (=> b!272734 (=> (not res!136701) (not e!174962))))

(assert (=> b!272734 (= res!136701 (not (= startIndex!26 i!1267)))))

(declare-fun res!136699 () Bool)

(assert (=> start!26316 (=> (not res!136699) (not e!174960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26316 (= res!136699 (validMask!0 mask!3868))))

(assert (=> start!26316 e!174960))

(declare-fun array_inv!4305 (array!13412) Bool)

(assert (=> start!26316 (array_inv!4305 a!3325)))

(assert (=> start!26316 true))

(declare-fun b!272739 () Bool)

(declare-fun res!136700 () Bool)

(assert (=> b!272739 (=> (not res!136700) (not e!174962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13412 (_ BitVec 32)) Bool)

(assert (=> b!272739 (= res!136700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272740 () Bool)

(declare-fun res!136697 () Bool)

(assert (=> b!272740 (=> (not res!136697) (not e!174960))))

(declare-fun arrayContainsKey!0 (array!13412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272740 (= res!136697 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26316 res!136699) b!272737))

(assert (= (and b!272737 res!136702) b!272733))

(assert (= (and b!272733 res!136698) b!272732))

(assert (= (and b!272732 res!136696) b!272740))

(assert (= (and b!272740 res!136697) b!272738))

(assert (= (and b!272738 res!136704) b!272739))

(assert (= (and b!272739 res!136700) b!272734))

(assert (= (and b!272734 res!136701) b!272736))

(assert (= (and b!272736 res!136703) b!272735))

(declare-fun m!287963 () Bool)

(assert (=> b!272738 m!287963))

(declare-fun m!287965 () Bool)

(assert (=> b!272732 m!287965))

(declare-fun m!287967 () Bool)

(assert (=> b!272736 m!287967))

(assert (=> b!272736 m!287967))

(declare-fun m!287969 () Bool)

(assert (=> b!272736 m!287969))

(declare-fun m!287971 () Bool)

(assert (=> b!272740 m!287971))

(declare-fun m!287973 () Bool)

(assert (=> start!26316 m!287973))

(declare-fun m!287975 () Bool)

(assert (=> start!26316 m!287975))

(declare-fun m!287977 () Bool)

(assert (=> b!272739 m!287977))

(declare-fun m!287979 () Bool)

(assert (=> b!272733 m!287979))

(declare-fun m!287981 () Bool)

(assert (=> b!272735 m!287981))

(declare-fun m!287983 () Bool)

(assert (=> b!272735 m!287983))

(declare-fun m!287985 () Bool)

(assert (=> b!272735 m!287985))

(check-sat (not b!272738) (not start!26316) (not b!272732) (not b!272733) (not b!272736) (not b!272740) (not b!272739) (not b!272735))
(check-sat)
