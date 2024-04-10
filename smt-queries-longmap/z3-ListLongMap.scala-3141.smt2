; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44270 () Bool)

(assert start!44270)

(declare-fun b!486830 () Bool)

(declare-fun res!290219 () Bool)

(declare-fun e!286541 () Bool)

(assert (=> b!486830 (=> (not res!290219) (not e!286541))))

(declare-datatypes ((array!31521 0))(
  ( (array!31522 (arr!15154 (Array (_ BitVec 32) (_ BitVec 64))) (size!15518 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31521)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486830 (= res!290219 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486831 () Bool)

(declare-fun e!286540 () Bool)

(assert (=> b!486831 (= e!286540 false)))

(declare-fun lt!219867 () Bool)

(declare-datatypes ((List!9312 0))(
  ( (Nil!9309) (Cons!9308 (h!10164 (_ BitVec 64)) (t!15540 List!9312)) )
))
(declare-fun arrayNoDuplicates!0 (array!31521 (_ BitVec 32) List!9312) Bool)

(assert (=> b!486831 (= lt!219867 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9309))))

(declare-fun b!486832 () Bool)

(declare-fun res!290216 () Bool)

(assert (=> b!486832 (=> (not res!290216) (not e!286541))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486832 (= res!290216 (and (= (size!15518 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15518 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15518 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486834 () Bool)

(declare-fun res!290221 () Bool)

(assert (=> b!486834 (=> (not res!290221) (not e!286540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31521 (_ BitVec 32)) Bool)

(assert (=> b!486834 (= res!290221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290217 () Bool)

(assert (=> start!44270 (=> (not res!290217) (not e!286541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44270 (= res!290217 (validMask!0 mask!3524))))

(assert (=> start!44270 e!286541))

(assert (=> start!44270 true))

(declare-fun array_inv!10950 (array!31521) Bool)

(assert (=> start!44270 (array_inv!10950 a!3235)))

(declare-fun b!486833 () Bool)

(declare-fun res!290218 () Bool)

(assert (=> b!486833 (=> (not res!290218) (not e!286541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486833 (= res!290218 (validKeyInArray!0 (select (arr!15154 a!3235) j!176)))))

(declare-fun b!486835 () Bool)

(declare-fun res!290220 () Bool)

(assert (=> b!486835 (=> (not res!290220) (not e!286541))))

(assert (=> b!486835 (= res!290220 (validKeyInArray!0 k0!2280))))

(declare-fun b!486836 () Bool)

(assert (=> b!486836 (= e!286541 e!286540)))

(declare-fun res!290222 () Bool)

(assert (=> b!486836 (=> (not res!290222) (not e!286540))))

(declare-datatypes ((SeekEntryResult!3621 0))(
  ( (MissingZero!3621 (index!16663 (_ BitVec 32))) (Found!3621 (index!16664 (_ BitVec 32))) (Intermediate!3621 (undefined!4433 Bool) (index!16665 (_ BitVec 32)) (x!45793 (_ BitVec 32))) (Undefined!3621) (MissingVacant!3621 (index!16666 (_ BitVec 32))) )
))
(declare-fun lt!219868 () SeekEntryResult!3621)

(assert (=> b!486836 (= res!290222 (or (= lt!219868 (MissingZero!3621 i!1204)) (= lt!219868 (MissingVacant!3621 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31521 (_ BitVec 32)) SeekEntryResult!3621)

(assert (=> b!486836 (= lt!219868 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44270 res!290217) b!486832))

(assert (= (and b!486832 res!290216) b!486833))

(assert (= (and b!486833 res!290218) b!486835))

(assert (= (and b!486835 res!290220) b!486830))

(assert (= (and b!486830 res!290219) b!486836))

(assert (= (and b!486836 res!290222) b!486834))

(assert (= (and b!486834 res!290221) b!486831))

(declare-fun m!466713 () Bool)

(assert (=> b!486835 m!466713))

(declare-fun m!466715 () Bool)

(assert (=> start!44270 m!466715))

(declare-fun m!466717 () Bool)

(assert (=> start!44270 m!466717))

(declare-fun m!466719 () Bool)

(assert (=> b!486834 m!466719))

(declare-fun m!466721 () Bool)

(assert (=> b!486836 m!466721))

(declare-fun m!466723 () Bool)

(assert (=> b!486830 m!466723))

(declare-fun m!466725 () Bool)

(assert (=> b!486831 m!466725))

(declare-fun m!466727 () Bool)

(assert (=> b!486833 m!466727))

(assert (=> b!486833 m!466727))

(declare-fun m!466729 () Bool)

(assert (=> b!486833 m!466729))

(check-sat (not b!486834) (not b!486831) (not b!486833) (not start!44270) (not b!486836) (not b!486835) (not b!486830))
(check-sat)
