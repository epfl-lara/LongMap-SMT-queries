; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26214 () Bool)

(assert start!26214)

(declare-fun b!271147 () Bool)

(declare-fun res!135112 () Bool)

(declare-fun e!174502 () Bool)

(assert (=> b!271147 (=> (not res!135112) (not e!174502))))

(declare-datatypes ((array!13310 0))(
  ( (array!13311 (arr!6304 (Array (_ BitVec 32) (_ BitVec 64))) (size!6656 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13310)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271147 (= res!135112 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271148 () Bool)

(declare-fun res!135115 () Bool)

(assert (=> b!271148 (=> (not res!135115) (not e!174502))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271148 (= res!135115 (and (= (size!6656 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6656 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6656 a!3325))))))

(declare-fun b!271149 () Bool)

(declare-fun res!135114 () Bool)

(declare-fun e!174503 () Bool)

(assert (=> b!271149 (=> (not res!135114) (not e!174503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271149 (= res!135114 (validKeyInArray!0 (select (arr!6304 a!3325) startIndex!26)))))

(declare-fun b!271150 () Bool)

(declare-fun res!135119 () Bool)

(assert (=> b!271150 (=> (not res!135119) (not e!174502))))

(declare-datatypes ((List!4025 0))(
  ( (Nil!4022) (Cons!4021 (h!4688 (_ BitVec 64)) (t!9099 List!4025)) )
))
(declare-fun arrayNoDuplicates!0 (array!13310 (_ BitVec 32) List!4025) Bool)

(assert (=> b!271150 (= res!135119 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4022))))

(declare-fun b!271151 () Bool)

(declare-fun res!135120 () Bool)

(assert (=> b!271151 (=> (not res!135120) (not e!174503))))

(assert (=> b!271151 (= res!135120 (not (= startIndex!26 i!1267)))))

(declare-fun b!271152 () Bool)

(assert (=> b!271152 (= e!174503 false)))

(declare-fun lt!135810 () Bool)

(declare-fun contains!1918 (List!4025 (_ BitVec 64)) Bool)

(assert (=> b!271152 (= lt!135810 (contains!1918 Nil!4022 k0!2581))))

(declare-fun b!271153 () Bool)

(declare-fun res!135121 () Bool)

(assert (=> b!271153 (=> (not res!135121) (not e!174502))))

(assert (=> b!271153 (= res!135121 (validKeyInArray!0 k0!2581))))

(declare-fun b!271154 () Bool)

(declare-fun res!135113 () Bool)

(assert (=> b!271154 (=> (not res!135113) (not e!174503))))

(declare-fun noDuplicate!134 (List!4025) Bool)

(assert (=> b!271154 (= res!135113 (noDuplicate!134 Nil!4022))))

(declare-fun res!135117 () Bool)

(assert (=> start!26214 (=> (not res!135117) (not e!174502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26214 (= res!135117 (validMask!0 mask!3868))))

(assert (=> start!26214 e!174502))

(declare-fun array_inv!4254 (array!13310) Bool)

(assert (=> start!26214 (array_inv!4254 a!3325)))

(assert (=> start!26214 true))

(declare-fun b!271155 () Bool)

(declare-fun res!135122 () Bool)

(assert (=> b!271155 (=> (not res!135122) (not e!174503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13310 (_ BitVec 32)) Bool)

(assert (=> b!271155 (= res!135122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271156 () Bool)

(assert (=> b!271156 (= e!174502 e!174503)))

(declare-fun res!135118 () Bool)

(assert (=> b!271156 (=> (not res!135118) (not e!174503))))

(declare-datatypes ((SeekEntryResult!1427 0))(
  ( (MissingZero!1427 (index!7878 (_ BitVec 32))) (Found!1427 (index!7879 (_ BitVec 32))) (Intermediate!1427 (undefined!2239 Bool) (index!7880 (_ BitVec 32)) (x!26320 (_ BitVec 32))) (Undefined!1427) (MissingVacant!1427 (index!7881 (_ BitVec 32))) )
))
(declare-fun lt!135809 () SeekEntryResult!1427)

(assert (=> b!271156 (= res!135118 (or (= lt!135809 (MissingZero!1427 i!1267)) (= lt!135809 (MissingVacant!1427 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13310 (_ BitVec 32)) SeekEntryResult!1427)

(assert (=> b!271156 (= lt!135809 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271157 () Bool)

(declare-fun res!135111 () Bool)

(assert (=> b!271157 (=> (not res!135111) (not e!174503))))

(assert (=> b!271157 (= res!135111 (not (contains!1918 Nil!4022 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271158 () Bool)

(declare-fun res!135116 () Bool)

(assert (=> b!271158 (=> (not res!135116) (not e!174503))))

(assert (=> b!271158 (= res!135116 (not (contains!1918 Nil!4022 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271159 () Bool)

(declare-fun res!135123 () Bool)

(assert (=> b!271159 (=> (not res!135123) (not e!174503))))

(assert (=> b!271159 (= res!135123 (and (bvslt (size!6656 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6656 a!3325))))))

(assert (= (and start!26214 res!135117) b!271148))

(assert (= (and b!271148 res!135115) b!271153))

(assert (= (and b!271153 res!135121) b!271150))

(assert (= (and b!271150 res!135119) b!271147))

(assert (= (and b!271147 res!135112) b!271156))

(assert (= (and b!271156 res!135118) b!271155))

(assert (= (and b!271155 res!135122) b!271151))

(assert (= (and b!271151 res!135120) b!271149))

(assert (= (and b!271149 res!135114) b!271159))

(assert (= (and b!271159 res!135123) b!271154))

(assert (= (and b!271154 res!135113) b!271157))

(assert (= (and b!271157 res!135111) b!271158))

(assert (= (and b!271158 res!135116) b!271152))

(declare-fun m!286703 () Bool)

(assert (=> start!26214 m!286703))

(declare-fun m!286705 () Bool)

(assert (=> start!26214 m!286705))

(declare-fun m!286707 () Bool)

(assert (=> b!271153 m!286707))

(declare-fun m!286709 () Bool)

(assert (=> b!271158 m!286709))

(declare-fun m!286711 () Bool)

(assert (=> b!271154 m!286711))

(declare-fun m!286713 () Bool)

(assert (=> b!271156 m!286713))

(declare-fun m!286715 () Bool)

(assert (=> b!271150 m!286715))

(declare-fun m!286717 () Bool)

(assert (=> b!271147 m!286717))

(declare-fun m!286719 () Bool)

(assert (=> b!271149 m!286719))

(assert (=> b!271149 m!286719))

(declare-fun m!286721 () Bool)

(assert (=> b!271149 m!286721))

(declare-fun m!286723 () Bool)

(assert (=> b!271152 m!286723))

(declare-fun m!286725 () Bool)

(assert (=> b!271157 m!286725))

(declare-fun m!286727 () Bool)

(assert (=> b!271155 m!286727))

(check-sat (not b!271149) (not b!271152) (not b!271147) (not b!271158) (not b!271150) (not b!271157) (not b!271155) (not b!271156) (not b!271154) (not start!26214) (not b!271153))
(check-sat)
