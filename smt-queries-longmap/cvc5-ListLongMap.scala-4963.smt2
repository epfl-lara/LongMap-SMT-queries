; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68288 () Bool)

(assert start!68288)

(declare-fun b!793301 () Bool)

(declare-fun res!537826 () Bool)

(declare-fun e!440710 () Bool)

(assert (=> b!793301 (=> (not res!537826) (not e!440710))))

(declare-datatypes ((array!43078 0))(
  ( (array!43079 (arr!20619 (Array (_ BitVec 32) (_ BitVec 64))) (size!21040 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43078)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793301 (= res!537826 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793302 () Bool)

(declare-fun res!537825 () Bool)

(assert (=> b!793302 (=> (not res!537825) (not e!440710))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793302 (= res!537825 (validKeyInArray!0 (select (arr!20619 a!3170) j!153)))))

(declare-fun b!793303 () Bool)

(declare-fun res!537820 () Bool)

(declare-fun e!440711 () Bool)

(assert (=> b!793303 (=> (not res!537820) (not e!440711))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43078 (_ BitVec 32)) Bool)

(assert (=> b!793303 (= res!537820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793304 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793304 (= e!440711 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21040 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20619 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21040 a!3170)) (= (select (arr!20619 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun res!537824 () Bool)

(assert (=> start!68288 (=> (not res!537824) (not e!440710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68288 (= res!537824 (validMask!0 mask!3266))))

(assert (=> start!68288 e!440710))

(assert (=> start!68288 true))

(declare-fun array_inv!16415 (array!43078) Bool)

(assert (=> start!68288 (array_inv!16415 a!3170)))

(declare-fun b!793305 () Bool)

(declare-fun res!537821 () Bool)

(assert (=> b!793305 (=> (not res!537821) (not e!440710))))

(assert (=> b!793305 (= res!537821 (validKeyInArray!0 k!2044))))

(declare-fun b!793306 () Bool)

(assert (=> b!793306 (= e!440710 e!440711)))

(declare-fun res!537823 () Bool)

(assert (=> b!793306 (=> (not res!537823) (not e!440711))))

(declare-datatypes ((SeekEntryResult!8210 0))(
  ( (MissingZero!8210 (index!35208 (_ BitVec 32))) (Found!8210 (index!35209 (_ BitVec 32))) (Intermediate!8210 (undefined!9022 Bool) (index!35210 (_ BitVec 32)) (x!66152 (_ BitVec 32))) (Undefined!8210) (MissingVacant!8210 (index!35211 (_ BitVec 32))) )
))
(declare-fun lt!353687 () SeekEntryResult!8210)

(assert (=> b!793306 (= res!537823 (or (= lt!353687 (MissingZero!8210 i!1163)) (= lt!353687 (MissingVacant!8210 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43078 (_ BitVec 32)) SeekEntryResult!8210)

(assert (=> b!793306 (= lt!353687 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793307 () Bool)

(declare-fun res!537822 () Bool)

(assert (=> b!793307 (=> (not res!537822) (not e!440710))))

(assert (=> b!793307 (= res!537822 (and (= (size!21040 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21040 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21040 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793308 () Bool)

(declare-fun res!537827 () Bool)

(assert (=> b!793308 (=> (not res!537827) (not e!440711))))

(declare-datatypes ((List!14582 0))(
  ( (Nil!14579) (Cons!14578 (h!15707 (_ BitVec 64)) (t!20897 List!14582)) )
))
(declare-fun arrayNoDuplicates!0 (array!43078 (_ BitVec 32) List!14582) Bool)

(assert (=> b!793308 (= res!537827 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14579))))

(assert (= (and start!68288 res!537824) b!793307))

(assert (= (and b!793307 res!537822) b!793302))

(assert (= (and b!793302 res!537825) b!793305))

(assert (= (and b!793305 res!537821) b!793301))

(assert (= (and b!793301 res!537826) b!793306))

(assert (= (and b!793306 res!537823) b!793303))

(assert (= (and b!793303 res!537820) b!793308))

(assert (= (and b!793308 res!537827) b!793304))

(declare-fun m!733769 () Bool)

(assert (=> b!793306 m!733769))

(declare-fun m!733771 () Bool)

(assert (=> b!793308 m!733771))

(declare-fun m!733773 () Bool)

(assert (=> b!793301 m!733773))

(declare-fun m!733775 () Bool)

(assert (=> b!793303 m!733775))

(declare-fun m!733777 () Bool)

(assert (=> start!68288 m!733777))

(declare-fun m!733779 () Bool)

(assert (=> start!68288 m!733779))

(declare-fun m!733781 () Bool)

(assert (=> b!793305 m!733781))

(declare-fun m!733783 () Bool)

(assert (=> b!793302 m!733783))

(assert (=> b!793302 m!733783))

(declare-fun m!733785 () Bool)

(assert (=> b!793302 m!733785))

(declare-fun m!733787 () Bool)

(assert (=> b!793304 m!733787))

(declare-fun m!733789 () Bool)

(assert (=> b!793304 m!733789))

(push 1)

(assert (not b!793303))

(assert (not b!793305))

(assert (not b!793302))

(assert (not b!793306))

(assert (not start!68288))

(assert (not b!793308))

(assert (not b!793301))

(check-sat)

(pop 1)

(push 1)

(check-sat)

