; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26322 () Bool)

(assert start!26322)

(declare-fun b!272813 () Bool)

(declare-fun res!136779 () Bool)

(declare-fun e!174988 () Bool)

(assert (=> b!272813 (=> (not res!136779) (not e!174988))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272813 (= res!136779 (not (= startIndex!26 i!1267)))))

(declare-fun b!272814 () Bool)

(declare-fun res!136785 () Bool)

(declare-fun e!174987 () Bool)

(assert (=> b!272814 (=> (not res!136785) (not e!174987))))

(declare-datatypes ((array!13418 0))(
  ( (array!13419 (arr!6358 (Array (_ BitVec 32) (_ BitVec 64))) (size!6710 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13418)

(declare-datatypes ((List!4079 0))(
  ( (Nil!4076) (Cons!4075 (h!4742 (_ BitVec 64)) (t!9153 List!4079)) )
))
(declare-fun arrayNoDuplicates!0 (array!13418 (_ BitVec 32) List!4079) Bool)

(assert (=> b!272814 (= res!136785 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4076))))

(declare-fun b!272815 () Bool)

(declare-fun res!136784 () Bool)

(assert (=> b!272815 (=> (not res!136784) (not e!174988))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13418 (_ BitVec 32)) Bool)

(assert (=> b!272815 (= res!136784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!136778 () Bool)

(assert (=> start!26322 (=> (not res!136778) (not e!174987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26322 (= res!136778 (validMask!0 mask!3868))))

(assert (=> start!26322 e!174987))

(declare-fun array_inv!4308 (array!13418) Bool)

(assert (=> start!26322 (array_inv!4308 a!3325)))

(assert (=> start!26322 true))

(declare-fun b!272816 () Bool)

(declare-fun res!136780 () Bool)

(assert (=> b!272816 (=> (not res!136780) (not e!174987))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272816 (= res!136780 (validKeyInArray!0 k0!2581))))

(declare-fun b!272817 () Bool)

(assert (=> b!272817 (= e!174988 (not true))))

(assert (=> b!272817 (arrayNoDuplicates!0 (array!13419 (store (arr!6358 a!3325) i!1267 k0!2581) (size!6710 a!3325)) #b00000000000000000000000000000000 Nil!4076)))

(declare-datatypes ((Unit!8501 0))(
  ( (Unit!8502) )
))
(declare-fun lt!136133 () Unit!8501)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13418 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4079) Unit!8501)

(assert (=> b!272817 (= lt!136133 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4076))))

(declare-fun b!272818 () Bool)

(declare-fun res!136781 () Bool)

(assert (=> b!272818 (=> (not res!136781) (not e!174988))))

(assert (=> b!272818 (= res!136781 (validKeyInArray!0 (select (arr!6358 a!3325) startIndex!26)))))

(declare-fun b!272819 () Bool)

(declare-fun res!136783 () Bool)

(assert (=> b!272819 (=> (not res!136783) (not e!174987))))

(assert (=> b!272819 (= res!136783 (and (= (size!6710 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6710 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6710 a!3325))))))

(declare-fun b!272820 () Bool)

(assert (=> b!272820 (= e!174987 e!174988)))

(declare-fun res!136777 () Bool)

(assert (=> b!272820 (=> (not res!136777) (not e!174988))))

(declare-datatypes ((SeekEntryResult!1481 0))(
  ( (MissingZero!1481 (index!8094 (_ BitVec 32))) (Found!1481 (index!8095 (_ BitVec 32))) (Intermediate!1481 (undefined!2293 Bool) (index!8096 (_ BitVec 32)) (x!26518 (_ BitVec 32))) (Undefined!1481) (MissingVacant!1481 (index!8097 (_ BitVec 32))) )
))
(declare-fun lt!136134 () SeekEntryResult!1481)

(assert (=> b!272820 (= res!136777 (or (= lt!136134 (MissingZero!1481 i!1267)) (= lt!136134 (MissingVacant!1481 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13418 (_ BitVec 32)) SeekEntryResult!1481)

(assert (=> b!272820 (= lt!136134 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272821 () Bool)

(declare-fun res!136782 () Bool)

(assert (=> b!272821 (=> (not res!136782) (not e!174987))))

(declare-fun arrayContainsKey!0 (array!13418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272821 (= res!136782 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26322 res!136778) b!272819))

(assert (= (and b!272819 res!136783) b!272816))

(assert (= (and b!272816 res!136780) b!272814))

(assert (= (and b!272814 res!136785) b!272821))

(assert (= (and b!272821 res!136782) b!272820))

(assert (= (and b!272820 res!136777) b!272815))

(assert (= (and b!272815 res!136784) b!272813))

(assert (= (and b!272813 res!136779) b!272818))

(assert (= (and b!272818 res!136781) b!272817))

(declare-fun m!288035 () Bool)

(assert (=> b!272818 m!288035))

(assert (=> b!272818 m!288035))

(declare-fun m!288037 () Bool)

(assert (=> b!272818 m!288037))

(declare-fun m!288039 () Bool)

(assert (=> start!26322 m!288039))

(declare-fun m!288041 () Bool)

(assert (=> start!26322 m!288041))

(declare-fun m!288043 () Bool)

(assert (=> b!272820 m!288043))

(declare-fun m!288045 () Bool)

(assert (=> b!272817 m!288045))

(declare-fun m!288047 () Bool)

(assert (=> b!272817 m!288047))

(declare-fun m!288049 () Bool)

(assert (=> b!272817 m!288049))

(declare-fun m!288051 () Bool)

(assert (=> b!272821 m!288051))

(declare-fun m!288053 () Bool)

(assert (=> b!272814 m!288053))

(declare-fun m!288055 () Bool)

(assert (=> b!272815 m!288055))

(declare-fun m!288057 () Bool)

(assert (=> b!272816 m!288057))

(check-sat (not b!272818) (not b!272820) (not b!272814) (not start!26322) (not b!272821) (not b!272815) (not b!272817) (not b!272816))
(check-sat)
