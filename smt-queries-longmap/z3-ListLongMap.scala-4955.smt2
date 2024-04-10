; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68242 () Bool)

(assert start!68242)

(declare-fun res!537298 () Bool)

(declare-fun e!440503 () Bool)

(assert (=> start!68242 (=> (not res!537298) (not e!440503))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68242 (= res!537298 (validMask!0 mask!3266))))

(assert (=> start!68242 e!440503))

(assert (=> start!68242 true))

(declare-datatypes ((array!43032 0))(
  ( (array!43033 (arr!20596 (Array (_ BitVec 32) (_ BitVec 64))) (size!21017 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43032)

(declare-fun array_inv!16392 (array!43032) Bool)

(assert (=> start!68242 (array_inv!16392 a!3170)))

(declare-fun b!792776 () Bool)

(declare-fun res!537295 () Bool)

(declare-fun e!440502 () Bool)

(assert (=> b!792776 (=> (not res!537295) (not e!440502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43032 (_ BitVec 32)) Bool)

(assert (=> b!792776 (= res!537295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792777 () Bool)

(declare-fun res!537302 () Bool)

(assert (=> b!792777 (=> (not res!537302) (not e!440502))))

(declare-datatypes ((List!14559 0))(
  ( (Nil!14556) (Cons!14555 (h!15684 (_ BitVec 64)) (t!20874 List!14559)) )
))
(declare-fun arrayNoDuplicates!0 (array!43032 (_ BitVec 32) List!14559) Bool)

(assert (=> b!792777 (= res!537302 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14556))))

(declare-fun b!792778 () Bool)

(declare-fun res!537297 () Bool)

(assert (=> b!792778 (=> (not res!537297) (not e!440503))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792778 (= res!537297 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun b!792779 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792779 (= e!440502 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21017 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20596 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21017 a!3170)) (= (select (arr!20596 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!792780 () Bool)

(declare-fun res!537299 () Bool)

(assert (=> b!792780 (=> (not res!537299) (not e!440503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792780 (= res!537299 (validKeyInArray!0 k0!2044))))

(declare-fun b!792781 () Bool)

(assert (=> b!792781 (= e!440503 e!440502)))

(declare-fun res!537300 () Bool)

(assert (=> b!792781 (=> (not res!537300) (not e!440502))))

(declare-datatypes ((SeekEntryResult!8187 0))(
  ( (MissingZero!8187 (index!35116 (_ BitVec 32))) (Found!8187 (index!35117 (_ BitVec 32))) (Intermediate!8187 (undefined!8999 Bool) (index!35118 (_ BitVec 32)) (x!66065 (_ BitVec 32))) (Undefined!8187) (MissingVacant!8187 (index!35119 (_ BitVec 32))) )
))
(declare-fun lt!353582 () SeekEntryResult!8187)

(assert (=> b!792781 (= res!537300 (or (= lt!353582 (MissingZero!8187 i!1163)) (= lt!353582 (MissingVacant!8187 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43032 (_ BitVec 32)) SeekEntryResult!8187)

(assert (=> b!792781 (= lt!353582 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792782 () Bool)

(declare-fun res!537301 () Bool)

(assert (=> b!792782 (=> (not res!537301) (not e!440503))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792782 (= res!537301 (validKeyInArray!0 (select (arr!20596 a!3170) j!153)))))

(declare-fun b!792783 () Bool)

(declare-fun res!537296 () Bool)

(assert (=> b!792783 (=> (not res!537296) (not e!440503))))

(assert (=> b!792783 (= res!537296 (and (= (size!21017 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21017 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21017 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68242 res!537298) b!792783))

(assert (= (and b!792783 res!537296) b!792782))

(assert (= (and b!792782 res!537301) b!792780))

(assert (= (and b!792780 res!537299) b!792778))

(assert (= (and b!792778 res!537297) b!792781))

(assert (= (and b!792781 res!537300) b!792776))

(assert (= (and b!792776 res!537295) b!792777))

(assert (= (and b!792777 res!537302) b!792779))

(declare-fun m!733293 () Bool)

(assert (=> b!792777 m!733293))

(declare-fun m!733295 () Bool)

(assert (=> start!68242 m!733295))

(declare-fun m!733297 () Bool)

(assert (=> start!68242 m!733297))

(declare-fun m!733299 () Bool)

(assert (=> b!792778 m!733299))

(declare-fun m!733301 () Bool)

(assert (=> b!792779 m!733301))

(declare-fun m!733303 () Bool)

(assert (=> b!792779 m!733303))

(declare-fun m!733305 () Bool)

(assert (=> b!792780 m!733305))

(declare-fun m!733307 () Bool)

(assert (=> b!792782 m!733307))

(assert (=> b!792782 m!733307))

(declare-fun m!733309 () Bool)

(assert (=> b!792782 m!733309))

(declare-fun m!733311 () Bool)

(assert (=> b!792776 m!733311))

(declare-fun m!733313 () Bool)

(assert (=> b!792781 m!733313))

(check-sat (not b!792782) (not b!792778) (not b!792777) (not b!792780) (not b!792776) (not b!792781) (not start!68242))
(check-sat)
