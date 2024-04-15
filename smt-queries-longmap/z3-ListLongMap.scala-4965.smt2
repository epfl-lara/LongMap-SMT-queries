; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68280 () Bool)

(assert start!68280)

(declare-fun b!793197 () Bool)

(declare-fun res!537859 () Bool)

(declare-fun e!440610 () Bool)

(assert (=> b!793197 (=> (not res!537859) (not e!440610))))

(declare-datatypes ((array!43087 0))(
  ( (array!43088 (arr!20624 (Array (_ BitVec 32) (_ BitVec 64))) (size!21045 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43087)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793197 (= res!537859 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793198 () Bool)

(declare-fun e!440609 () Bool)

(assert (=> b!793198 (= e!440610 e!440609)))

(declare-fun res!537858 () Bool)

(assert (=> b!793198 (=> (not res!537858) (not e!440609))))

(declare-datatypes ((SeekEntryResult!8212 0))(
  ( (MissingZero!8212 (index!35216 (_ BitVec 32))) (Found!8212 (index!35217 (_ BitVec 32))) (Intermediate!8212 (undefined!9024 Bool) (index!35218 (_ BitVec 32)) (x!66165 (_ BitVec 32))) (Undefined!8212) (MissingVacant!8212 (index!35219 (_ BitVec 32))) )
))
(declare-fun lt!353465 () SeekEntryResult!8212)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793198 (= res!537858 (or (= lt!353465 (MissingZero!8212 i!1163)) (= lt!353465 (MissingVacant!8212 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43087 (_ BitVec 32)) SeekEntryResult!8212)

(assert (=> b!793198 (= lt!353465 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793199 () Bool)

(declare-fun res!537857 () Bool)

(assert (=> b!793199 (=> (not res!537857) (not e!440609))))

(declare-datatypes ((List!14626 0))(
  ( (Nil!14623) (Cons!14622 (h!15751 (_ BitVec 64)) (t!20932 List!14626)) )
))
(declare-fun arrayNoDuplicates!0 (array!43087 (_ BitVec 32) List!14626) Bool)

(assert (=> b!793199 (= res!537857 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14623))))

(declare-fun b!793200 () Bool)

(declare-fun res!537863 () Bool)

(assert (=> b!793200 (=> (not res!537863) (not e!440610))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793200 (= res!537863 (and (= (size!21045 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21045 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21045 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793201 () Bool)

(declare-fun res!537856 () Bool)

(assert (=> b!793201 (=> (not res!537856) (not e!440610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793201 (= res!537856 (validKeyInArray!0 (select (arr!20624 a!3170) j!153)))))

(declare-fun b!793202 () Bool)

(assert (=> b!793202 (= e!440609 (not (validKeyInArray!0 (select (store (arr!20624 a!3170) i!1163 k0!2044) j!153))))))

(declare-fun b!793203 () Bool)

(declare-fun res!537862 () Bool)

(assert (=> b!793203 (=> (not res!537862) (not e!440610))))

(assert (=> b!793203 (= res!537862 (validKeyInArray!0 k0!2044))))

(declare-fun res!537861 () Bool)

(assert (=> start!68280 (=> (not res!537861) (not e!440610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68280 (= res!537861 (validMask!0 mask!3266))))

(assert (=> start!68280 e!440610))

(assert (=> start!68280 true))

(declare-fun array_inv!16507 (array!43087) Bool)

(assert (=> start!68280 (array_inv!16507 a!3170)))

(declare-fun b!793204 () Bool)

(declare-fun res!537864 () Bool)

(assert (=> b!793204 (=> (not res!537864) (not e!440609))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793204 (= res!537864 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21045 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20624 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21045 a!3170)) (= (select (arr!20624 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20624 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!793205 () Bool)

(declare-fun res!537860 () Bool)

(assert (=> b!793205 (=> (not res!537860) (not e!440609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43087 (_ BitVec 32)) Bool)

(assert (=> b!793205 (= res!537860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68280 res!537861) b!793200))

(assert (= (and b!793200 res!537863) b!793201))

(assert (= (and b!793201 res!537856) b!793203))

(assert (= (and b!793203 res!537862) b!793197))

(assert (= (and b!793197 res!537859) b!793198))

(assert (= (and b!793198 res!537858) b!793205))

(assert (= (and b!793205 res!537860) b!793199))

(assert (= (and b!793199 res!537857) b!793204))

(assert (= (and b!793204 res!537864) b!793202))

(declare-fun m!733171 () Bool)

(assert (=> start!68280 m!733171))

(declare-fun m!733173 () Bool)

(assert (=> start!68280 m!733173))

(declare-fun m!733175 () Bool)

(assert (=> b!793203 m!733175))

(declare-fun m!733177 () Bool)

(assert (=> b!793202 m!733177))

(declare-fun m!733179 () Bool)

(assert (=> b!793202 m!733179))

(assert (=> b!793202 m!733179))

(declare-fun m!733181 () Bool)

(assert (=> b!793202 m!733181))

(declare-fun m!733183 () Bool)

(assert (=> b!793201 m!733183))

(assert (=> b!793201 m!733183))

(declare-fun m!733185 () Bool)

(assert (=> b!793201 m!733185))

(declare-fun m!733187 () Bool)

(assert (=> b!793197 m!733187))

(declare-fun m!733189 () Bool)

(assert (=> b!793204 m!733189))

(declare-fun m!733191 () Bool)

(assert (=> b!793204 m!733191))

(assert (=> b!793204 m!733177))

(declare-fun m!733193 () Bool)

(assert (=> b!793204 m!733193))

(declare-fun m!733195 () Bool)

(assert (=> b!793199 m!733195))

(declare-fun m!733197 () Bool)

(assert (=> b!793205 m!733197))

(declare-fun m!733199 () Bool)

(assert (=> b!793198 m!733199))

(check-sat (not b!793201) (not b!793202) (not b!793198) (not b!793197) (not b!793205) (not start!68280) (not b!793203) (not b!793199))
(check-sat)
