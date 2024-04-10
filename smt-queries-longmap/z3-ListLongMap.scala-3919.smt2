; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53526 () Bool)

(assert start!53526)

(declare-fun b!582651 () Bool)

(declare-fun res!370471 () Bool)

(declare-fun e!334059 () Bool)

(assert (=> b!582651 (=> (not res!370471) (not e!334059))))

(declare-datatypes ((array!36427 0))(
  ( (array!36428 (arr!17488 (Array (_ BitVec 32) (_ BitVec 64))) (size!17852 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36427)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582651 (= res!370471 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582652 () Bool)

(declare-fun res!370467 () Bool)

(assert (=> b!582652 (=> (not res!370467) (not e!334059))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582652 (= res!370467 (validKeyInArray!0 (select (arr!17488 a!2986) j!136)))))

(declare-fun b!582653 () Bool)

(declare-fun res!370474 () Bool)

(declare-fun e!334058 () Bool)

(assert (=> b!582653 (=> (not res!370474) (not e!334058))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36427 (_ BitVec 32)) Bool)

(assert (=> b!582653 (= res!370474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582654 () Bool)

(declare-fun res!370473 () Bool)

(assert (=> b!582654 (=> (not res!370473) (not e!334059))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582654 (= res!370473 (and (= (size!17852 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17852 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17852 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582655 () Bool)

(assert (=> b!582655 (= e!334058 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5928 0))(
  ( (MissingZero!5928 (index!25939 (_ BitVec 32))) (Found!5928 (index!25940 (_ BitVec 32))) (Intermediate!5928 (undefined!6740 Bool) (index!25941 (_ BitVec 32)) (x!54789 (_ BitVec 32))) (Undefined!5928) (MissingVacant!5928 (index!25942 (_ BitVec 32))) )
))
(declare-fun lt!265161 () SeekEntryResult!5928)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36427 (_ BitVec 32)) SeekEntryResult!5928)

(assert (=> b!582655 (= lt!265161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17488 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!370468 () Bool)

(assert (=> start!53526 (=> (not res!370468) (not e!334059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53526 (= res!370468 (validMask!0 mask!3053))))

(assert (=> start!53526 e!334059))

(assert (=> start!53526 true))

(declare-fun array_inv!13284 (array!36427) Bool)

(assert (=> start!53526 (array_inv!13284 a!2986)))

(declare-fun b!582656 () Bool)

(declare-fun res!370475 () Bool)

(assert (=> b!582656 (=> (not res!370475) (not e!334059))))

(assert (=> b!582656 (= res!370475 (validKeyInArray!0 k0!1786))))

(declare-fun b!582657 () Bool)

(assert (=> b!582657 (= e!334059 e!334058)))

(declare-fun res!370469 () Bool)

(assert (=> b!582657 (=> (not res!370469) (not e!334058))))

(declare-fun lt!265162 () SeekEntryResult!5928)

(assert (=> b!582657 (= res!370469 (or (= lt!265162 (MissingZero!5928 i!1108)) (= lt!265162 (MissingVacant!5928 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36427 (_ BitVec 32)) SeekEntryResult!5928)

(assert (=> b!582657 (= lt!265162 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582658 () Bool)

(declare-fun res!370472 () Bool)

(assert (=> b!582658 (=> (not res!370472) (not e!334058))))

(assert (=> b!582658 (= res!370472 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17488 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17488 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582659 () Bool)

(declare-fun res!370470 () Bool)

(assert (=> b!582659 (=> (not res!370470) (not e!334058))))

(declare-datatypes ((List!11529 0))(
  ( (Nil!11526) (Cons!11525 (h!12570 (_ BitVec 64)) (t!17757 List!11529)) )
))
(declare-fun arrayNoDuplicates!0 (array!36427 (_ BitVec 32) List!11529) Bool)

(assert (=> b!582659 (= res!370470 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11526))))

(assert (= (and start!53526 res!370468) b!582654))

(assert (= (and b!582654 res!370473) b!582652))

(assert (= (and b!582652 res!370467) b!582656))

(assert (= (and b!582656 res!370475) b!582651))

(assert (= (and b!582651 res!370471) b!582657))

(assert (= (and b!582657 res!370469) b!582653))

(assert (= (and b!582653 res!370474) b!582659))

(assert (= (and b!582659 res!370470) b!582658))

(assert (= (and b!582658 res!370472) b!582655))

(declare-fun m!561147 () Bool)

(assert (=> b!582651 m!561147))

(declare-fun m!561149 () Bool)

(assert (=> start!53526 m!561149))

(declare-fun m!561151 () Bool)

(assert (=> start!53526 m!561151))

(declare-fun m!561153 () Bool)

(assert (=> b!582655 m!561153))

(assert (=> b!582655 m!561153))

(declare-fun m!561155 () Bool)

(assert (=> b!582655 m!561155))

(declare-fun m!561157 () Bool)

(assert (=> b!582653 m!561157))

(declare-fun m!561159 () Bool)

(assert (=> b!582657 m!561159))

(assert (=> b!582652 m!561153))

(assert (=> b!582652 m!561153))

(declare-fun m!561161 () Bool)

(assert (=> b!582652 m!561161))

(declare-fun m!561163 () Bool)

(assert (=> b!582656 m!561163))

(declare-fun m!561165 () Bool)

(assert (=> b!582658 m!561165))

(declare-fun m!561167 () Bool)

(assert (=> b!582658 m!561167))

(declare-fun m!561169 () Bool)

(assert (=> b!582658 m!561169))

(declare-fun m!561171 () Bool)

(assert (=> b!582659 m!561171))

(check-sat (not b!582657) (not b!582655) (not b!582659) (not b!582652) (not b!582656) (not b!582651) (not start!53526) (not b!582653))
