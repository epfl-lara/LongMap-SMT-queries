; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68240 () Bool)

(assert start!68240)

(declare-fun b!792752 () Bool)

(declare-fun res!537274 () Bool)

(declare-fun e!440493 () Bool)

(assert (=> b!792752 (=> (not res!537274) (not e!440493))))

(declare-datatypes ((array!43030 0))(
  ( (array!43031 (arr!20595 (Array (_ BitVec 32) (_ BitVec 64))) (size!21016 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43030)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43030 (_ BitVec 32)) Bool)

(assert (=> b!792752 (= res!537274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792753 () Bool)

(declare-fun res!537275 () Bool)

(declare-fun e!440494 () Bool)

(assert (=> b!792753 (=> (not res!537275) (not e!440494))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792753 (= res!537275 (and (= (size!21016 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21016 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21016 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792754 () Bool)

(declare-fun res!537277 () Bool)

(assert (=> b!792754 (=> (not res!537277) (not e!440493))))

(declare-datatypes ((List!14558 0))(
  ( (Nil!14555) (Cons!14554 (h!15683 (_ BitVec 64)) (t!20873 List!14558)) )
))
(declare-fun arrayNoDuplicates!0 (array!43030 (_ BitVec 32) List!14558) Bool)

(assert (=> b!792754 (= res!537277 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14555))))

(declare-fun b!792755 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792755 (= e!440493 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21016 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20595 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21016 a!3170)) (= (select (arr!20595 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!792756 () Bool)

(declare-fun res!537272 () Bool)

(assert (=> b!792756 (=> (not res!537272) (not e!440494))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792756 (= res!537272 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792757 () Bool)

(declare-fun res!537271 () Bool)

(assert (=> b!792757 (=> (not res!537271) (not e!440494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792757 (= res!537271 (validKeyInArray!0 k!2044))))

(declare-fun b!792758 () Bool)

(declare-fun res!537276 () Bool)

(assert (=> b!792758 (=> (not res!537276) (not e!440494))))

(assert (=> b!792758 (= res!537276 (validKeyInArray!0 (select (arr!20595 a!3170) j!153)))))

(declare-fun res!537278 () Bool)

(assert (=> start!68240 (=> (not res!537278) (not e!440494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68240 (= res!537278 (validMask!0 mask!3266))))

(assert (=> start!68240 e!440494))

(assert (=> start!68240 true))

(declare-fun array_inv!16391 (array!43030) Bool)

(assert (=> start!68240 (array_inv!16391 a!3170)))

(declare-fun b!792759 () Bool)

(assert (=> b!792759 (= e!440494 e!440493)))

(declare-fun res!537273 () Bool)

(assert (=> b!792759 (=> (not res!537273) (not e!440493))))

(declare-datatypes ((SeekEntryResult!8186 0))(
  ( (MissingZero!8186 (index!35112 (_ BitVec 32))) (Found!8186 (index!35113 (_ BitVec 32))) (Intermediate!8186 (undefined!8998 Bool) (index!35114 (_ BitVec 32)) (x!66064 (_ BitVec 32))) (Undefined!8186) (MissingVacant!8186 (index!35115 (_ BitVec 32))) )
))
(declare-fun lt!353579 () SeekEntryResult!8186)

(assert (=> b!792759 (= res!537273 (or (= lt!353579 (MissingZero!8186 i!1163)) (= lt!353579 (MissingVacant!8186 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43030 (_ BitVec 32)) SeekEntryResult!8186)

(assert (=> b!792759 (= lt!353579 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68240 res!537278) b!792753))

(assert (= (and b!792753 res!537275) b!792758))

(assert (= (and b!792758 res!537276) b!792757))

(assert (= (and b!792757 res!537271) b!792756))

(assert (= (and b!792756 res!537272) b!792759))

(assert (= (and b!792759 res!537273) b!792752))

(assert (= (and b!792752 res!537274) b!792754))

(assert (= (and b!792754 res!537277) b!792755))

(declare-fun m!733271 () Bool)

(assert (=> b!792758 m!733271))

(assert (=> b!792758 m!733271))

(declare-fun m!733273 () Bool)

(assert (=> b!792758 m!733273))

(declare-fun m!733275 () Bool)

(assert (=> b!792754 m!733275))

(declare-fun m!733277 () Bool)

(assert (=> start!68240 m!733277))

(declare-fun m!733279 () Bool)

(assert (=> start!68240 m!733279))

(declare-fun m!733281 () Bool)

(assert (=> b!792756 m!733281))

(declare-fun m!733283 () Bool)

(assert (=> b!792759 m!733283))

(declare-fun m!733285 () Bool)

(assert (=> b!792755 m!733285))

(declare-fun m!733287 () Bool)

(assert (=> b!792755 m!733287))

(declare-fun m!733289 () Bool)

(assert (=> b!792757 m!733289))

(declare-fun m!733291 () Bool)

(assert (=> b!792752 m!733291))

(push 1)

(assert (not b!792754))

(assert (not b!792752))

(assert (not b!792758))

(assert (not b!792759))

(assert (not b!792757))

(assert (not start!68240))

(assert (not b!792756))

(check-sat)

