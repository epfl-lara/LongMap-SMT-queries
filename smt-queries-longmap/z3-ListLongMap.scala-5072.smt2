; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68944 () Bool)

(assert start!68944)

(declare-fun b!804264 () Bool)

(declare-fun res!548785 () Bool)

(declare-fun e!445578 () Bool)

(assert (=> b!804264 (=> (not res!548785) (not e!445578))))

(declare-datatypes ((array!43734 0))(
  ( (array!43735 (arr!20947 (Array (_ BitVec 32) (_ BitVec 64))) (size!21368 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43734)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804264 (= res!548785 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804265 () Bool)

(declare-fun res!548783 () Bool)

(assert (=> b!804265 (=> (not res!548783) (not e!445578))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804265 (= res!548783 (validKeyInArray!0 (select (arr!20947 a!3170) j!153)))))

(declare-fun b!804266 () Bool)

(declare-fun e!445579 () Bool)

(assert (=> b!804266 (= e!445579 false)))

(declare-fun lt!360103 () Bool)

(declare-datatypes ((List!14910 0))(
  ( (Nil!14907) (Cons!14906 (h!16035 (_ BitVec 64)) (t!21225 List!14910)) )
))
(declare-fun arrayNoDuplicates!0 (array!43734 (_ BitVec 32) List!14910) Bool)

(assert (=> b!804266 (= lt!360103 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14907))))

(declare-fun b!804267 () Bool)

(declare-fun res!548789 () Bool)

(assert (=> b!804267 (=> (not res!548789) (not e!445579))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43734 (_ BitVec 32)) Bool)

(assert (=> b!804267 (= res!548789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804268 () Bool)

(declare-fun res!548786 () Bool)

(assert (=> b!804268 (=> (not res!548786) (not e!445578))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804268 (= res!548786 (and (= (size!21368 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21368 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21368 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804269 () Bool)

(declare-fun res!548784 () Bool)

(assert (=> b!804269 (=> (not res!548784) (not e!445578))))

(assert (=> b!804269 (= res!548784 (validKeyInArray!0 k0!2044))))

(declare-fun res!548787 () Bool)

(assert (=> start!68944 (=> (not res!548787) (not e!445578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68944 (= res!548787 (validMask!0 mask!3266))))

(assert (=> start!68944 e!445578))

(assert (=> start!68944 true))

(declare-fun array_inv!16743 (array!43734) Bool)

(assert (=> start!68944 (array_inv!16743 a!3170)))

(declare-fun b!804270 () Bool)

(assert (=> b!804270 (= e!445578 e!445579)))

(declare-fun res!548788 () Bool)

(assert (=> b!804270 (=> (not res!548788) (not e!445579))))

(declare-datatypes ((SeekEntryResult!8538 0))(
  ( (MissingZero!8538 (index!36520 (_ BitVec 32))) (Found!8538 (index!36521 (_ BitVec 32))) (Intermediate!8538 (undefined!9350 Bool) (index!36522 (_ BitVec 32)) (x!67352 (_ BitVec 32))) (Undefined!8538) (MissingVacant!8538 (index!36523 (_ BitVec 32))) )
))
(declare-fun lt!360104 () SeekEntryResult!8538)

(assert (=> b!804270 (= res!548788 (or (= lt!360104 (MissingZero!8538 i!1163)) (= lt!360104 (MissingVacant!8538 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43734 (_ BitVec 32)) SeekEntryResult!8538)

(assert (=> b!804270 (= lt!360104 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68944 res!548787) b!804268))

(assert (= (and b!804268 res!548786) b!804265))

(assert (= (and b!804265 res!548783) b!804269))

(assert (= (and b!804269 res!548784) b!804264))

(assert (= (and b!804264 res!548785) b!804270))

(assert (= (and b!804270 res!548788) b!804267))

(assert (= (and b!804267 res!548789) b!804266))

(declare-fun m!746165 () Bool)

(assert (=> b!804264 m!746165))

(declare-fun m!746167 () Bool)

(assert (=> b!804265 m!746167))

(assert (=> b!804265 m!746167))

(declare-fun m!746169 () Bool)

(assert (=> b!804265 m!746169))

(declare-fun m!746171 () Bool)

(assert (=> b!804270 m!746171))

(declare-fun m!746173 () Bool)

(assert (=> start!68944 m!746173))

(declare-fun m!746175 () Bool)

(assert (=> start!68944 m!746175))

(declare-fun m!746177 () Bool)

(assert (=> b!804267 m!746177))

(declare-fun m!746179 () Bool)

(assert (=> b!804269 m!746179))

(declare-fun m!746181 () Bool)

(assert (=> b!804266 m!746181))

(check-sat (not b!804267) (not start!68944) (not b!804269) (not b!804266) (not b!804265) (not b!804270) (not b!804264))
(check-sat)
