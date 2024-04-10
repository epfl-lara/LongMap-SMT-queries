; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68292 () Bool)

(assert start!68292)

(declare-fun res!537872 () Bool)

(declare-fun e!440727 () Bool)

(assert (=> start!68292 (=> (not res!537872) (not e!440727))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68292 (= res!537872 (validMask!0 mask!3266))))

(assert (=> start!68292 e!440727))

(assert (=> start!68292 true))

(declare-datatypes ((array!43082 0))(
  ( (array!43083 (arr!20621 (Array (_ BitVec 32) (_ BitVec 64))) (size!21042 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43082)

(declare-fun array_inv!16417 (array!43082) Bool)

(assert (=> start!68292 (array_inv!16417 a!3170)))

(declare-fun b!793349 () Bool)

(declare-fun res!537868 () Bool)

(assert (=> b!793349 (=> (not res!537868) (not e!440727))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793349 (= res!537868 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793350 () Bool)

(declare-fun res!537873 () Bool)

(assert (=> b!793350 (=> (not res!537873) (not e!440727))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793350 (= res!537873 (validKeyInArray!0 (select (arr!20621 a!3170) j!153)))))

(declare-fun b!793351 () Bool)

(declare-fun res!537871 () Bool)

(declare-fun e!440728 () Bool)

(assert (=> b!793351 (=> (not res!537871) (not e!440728))))

(declare-datatypes ((List!14584 0))(
  ( (Nil!14581) (Cons!14580 (h!15709 (_ BitVec 64)) (t!20899 List!14584)) )
))
(declare-fun arrayNoDuplicates!0 (array!43082 (_ BitVec 32) List!14584) Bool)

(assert (=> b!793351 (= res!537871 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14581))))

(declare-fun b!793352 () Bool)

(assert (=> b!793352 (= e!440727 e!440728)))

(declare-fun res!537875 () Bool)

(assert (=> b!793352 (=> (not res!537875) (not e!440728))))

(declare-datatypes ((SeekEntryResult!8212 0))(
  ( (MissingZero!8212 (index!35216 (_ BitVec 32))) (Found!8212 (index!35217 (_ BitVec 32))) (Intermediate!8212 (undefined!9024 Bool) (index!35218 (_ BitVec 32)) (x!66154 (_ BitVec 32))) (Undefined!8212) (MissingVacant!8212 (index!35219 (_ BitVec 32))) )
))
(declare-fun lt!353693 () SeekEntryResult!8212)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793352 (= res!537875 (or (= lt!353693 (MissingZero!8212 i!1163)) (= lt!353693 (MissingVacant!8212 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43082 (_ BitVec 32)) SeekEntryResult!8212)

(assert (=> b!793352 (= lt!353693 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793353 () Bool)

(declare-fun res!537870 () Bool)

(assert (=> b!793353 (=> (not res!537870) (not e!440728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43082 (_ BitVec 32)) Bool)

(assert (=> b!793353 (= res!537870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793354 () Bool)

(declare-fun res!537869 () Bool)

(assert (=> b!793354 (=> (not res!537869) (not e!440727))))

(assert (=> b!793354 (= res!537869 (validKeyInArray!0 k!2044))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!793355 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793355 (= e!440728 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21042 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20621 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21042 a!3170)) (= (select (arr!20621 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!793356 () Bool)

(declare-fun res!537874 () Bool)

(assert (=> b!793356 (=> (not res!537874) (not e!440727))))

(assert (=> b!793356 (= res!537874 (and (= (size!21042 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21042 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21042 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68292 res!537872) b!793356))

(assert (= (and b!793356 res!537874) b!793350))

(assert (= (and b!793350 res!537873) b!793354))

(assert (= (and b!793354 res!537869) b!793349))

(assert (= (and b!793349 res!537868) b!793352))

(assert (= (and b!793352 res!537875) b!793353))

(assert (= (and b!793353 res!537870) b!793351))

(assert (= (and b!793351 res!537871) b!793355))

(declare-fun m!733813 () Bool)

(assert (=> b!793352 m!733813))

(declare-fun m!733815 () Bool)

(assert (=> b!793354 m!733815))

(declare-fun m!733817 () Bool)

(assert (=> b!793349 m!733817))

(declare-fun m!733819 () Bool)

(assert (=> b!793353 m!733819))

(declare-fun m!733821 () Bool)

(assert (=> start!68292 m!733821))

(declare-fun m!733823 () Bool)

(assert (=> start!68292 m!733823))

(declare-fun m!733825 () Bool)

(assert (=> b!793351 m!733825))

(declare-fun m!733827 () Bool)

(assert (=> b!793355 m!733827))

(declare-fun m!733829 () Bool)

(assert (=> b!793355 m!733829))

(declare-fun m!733831 () Bool)

(assert (=> b!793350 m!733831))

(assert (=> b!793350 m!733831))

(declare-fun m!733833 () Bool)

(assert (=> b!793350 m!733833))

(push 1)

(assert (not b!793351))

(assert (not start!68292))

(assert (not b!793353))

(assert (not b!793354))

(assert (not b!793350))

(assert (not b!793349))

(assert (not b!793352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

