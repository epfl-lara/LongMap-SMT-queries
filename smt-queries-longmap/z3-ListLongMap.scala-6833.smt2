; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86038 () Bool)

(assert start!86038)

(declare-fun b!996591 () Bool)

(declare-fun res!666711 () Bool)

(declare-fun e!562250 () Bool)

(assert (=> b!996591 (=> (not res!666711) (not e!562250))))

(declare-datatypes ((array!63043 0))(
  ( (array!63044 (arr!30353 (Array (_ BitVec 32) (_ BitVec 64))) (size!30855 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63043)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9285 0))(
  ( (MissingZero!9285 (index!39511 (_ BitVec 32))) (Found!9285 (index!39512 (_ BitVec 32))) (Intermediate!9285 (undefined!10097 Bool) (index!39513 (_ BitVec 32)) (x!86945 (_ BitVec 32))) (Undefined!9285) (MissingVacant!9285 (index!39514 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63043 (_ BitVec 32)) SeekEntryResult!9285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996591 (= res!666711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30353 a!3219) j!170) mask!3464) (select (arr!30353 a!3219) j!170) a!3219 mask!3464) (Intermediate!9285 false resIndex!38 resX!38)))))

(declare-fun b!996592 () Bool)

(declare-fun res!666705 () Bool)

(declare-fun e!562251 () Bool)

(assert (=> b!996592 (=> (not res!666705) (not e!562251))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996592 (= res!666705 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996593 () Bool)

(declare-fun res!666713 () Bool)

(assert (=> b!996593 (=> (not res!666713) (not e!562251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996593 (= res!666713 (validKeyInArray!0 k0!2224))))

(declare-fun b!996594 () Bool)

(assert (=> b!996594 (= e!562250 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!996595 () Bool)

(assert (=> b!996595 (= e!562251 e!562250)))

(declare-fun res!666712 () Bool)

(assert (=> b!996595 (=> (not res!666712) (not e!562250))))

(declare-fun lt!441263 () SeekEntryResult!9285)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996595 (= res!666712 (or (= lt!441263 (MissingVacant!9285 i!1194)) (= lt!441263 (MissingZero!9285 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63043 (_ BitVec 32)) SeekEntryResult!9285)

(assert (=> b!996595 (= lt!441263 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!666706 () Bool)

(assert (=> start!86038 (=> (not res!666706) (not e!562251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86038 (= res!666706 (validMask!0 mask!3464))))

(assert (=> start!86038 e!562251))

(declare-fun array_inv!23477 (array!63043) Bool)

(assert (=> start!86038 (array_inv!23477 a!3219)))

(assert (=> start!86038 true))

(declare-fun b!996596 () Bool)

(declare-fun res!666714 () Bool)

(assert (=> b!996596 (=> (not res!666714) (not e!562250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63043 (_ BitVec 32)) Bool)

(assert (=> b!996596 (= res!666714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996597 () Bool)

(declare-fun res!666708 () Bool)

(assert (=> b!996597 (=> (not res!666708) (not e!562250))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!996597 (= res!666708 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30855 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30855 a!3219))))))

(declare-fun b!996598 () Bool)

(declare-fun res!666710 () Bool)

(assert (=> b!996598 (=> (not res!666710) (not e!562250))))

(declare-datatypes ((List!21029 0))(
  ( (Nil!21026) (Cons!21025 (h!22190 (_ BitVec 64)) (t!30030 List!21029)) )
))
(declare-fun arrayNoDuplicates!0 (array!63043 (_ BitVec 32) List!21029) Bool)

(assert (=> b!996598 (= res!666710 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21026))))

(declare-fun b!996599 () Bool)

(declare-fun res!666709 () Bool)

(assert (=> b!996599 (=> (not res!666709) (not e!562251))))

(assert (=> b!996599 (= res!666709 (and (= (size!30855 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30855 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30855 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996600 () Bool)

(declare-fun res!666707 () Bool)

(assert (=> b!996600 (=> (not res!666707) (not e!562251))))

(assert (=> b!996600 (= res!666707 (validKeyInArray!0 (select (arr!30353 a!3219) j!170)))))

(assert (= (and start!86038 res!666706) b!996599))

(assert (= (and b!996599 res!666709) b!996600))

(assert (= (and b!996600 res!666707) b!996593))

(assert (= (and b!996593 res!666713) b!996592))

(assert (= (and b!996592 res!666705) b!996595))

(assert (= (and b!996595 res!666712) b!996596))

(assert (= (and b!996596 res!666714) b!996598))

(assert (= (and b!996598 res!666710) b!996597))

(assert (= (and b!996597 res!666708) b!996591))

(assert (= (and b!996591 res!666711) b!996594))

(declare-fun m!923673 () Bool)

(assert (=> b!996600 m!923673))

(assert (=> b!996600 m!923673))

(declare-fun m!923675 () Bool)

(assert (=> b!996600 m!923675))

(declare-fun m!923677 () Bool)

(assert (=> b!996598 m!923677))

(declare-fun m!923679 () Bool)

(assert (=> b!996592 m!923679))

(assert (=> b!996591 m!923673))

(assert (=> b!996591 m!923673))

(declare-fun m!923681 () Bool)

(assert (=> b!996591 m!923681))

(assert (=> b!996591 m!923681))

(assert (=> b!996591 m!923673))

(declare-fun m!923683 () Bool)

(assert (=> b!996591 m!923683))

(declare-fun m!923685 () Bool)

(assert (=> b!996593 m!923685))

(declare-fun m!923687 () Bool)

(assert (=> b!996595 m!923687))

(declare-fun m!923689 () Bool)

(assert (=> start!86038 m!923689))

(declare-fun m!923691 () Bool)

(assert (=> start!86038 m!923691))

(declare-fun m!923693 () Bool)

(assert (=> b!996596 m!923693))

(check-sat (not start!86038) (not b!996600) (not b!996596) (not b!996591) (not b!996598) (not b!996593) (not b!996592) (not b!996595))
(check-sat)
