; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68352 () Bool)

(assert start!68352)

(declare-fun b!794205 () Bool)

(declare-fun e!440971 () Bool)

(declare-fun e!440969 () Bool)

(assert (=> b!794205 (= e!440971 e!440969)))

(declare-fun res!538864 () Bool)

(assert (=> b!794205 (=> (not res!538864) (not e!440969))))

(declare-datatypes ((SeekEntryResult!8248 0))(
  ( (MissingZero!8248 (index!35360 (_ BitVec 32))) (Found!8248 (index!35361 (_ BitVec 32))) (Intermediate!8248 (undefined!9060 Bool) (index!35362 (_ BitVec 32)) (x!66297 (_ BitVec 32))) (Undefined!8248) (MissingVacant!8248 (index!35363 (_ BitVec 32))) )
))
(declare-fun lt!353907 () SeekEntryResult!8248)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794205 (= res!538864 (or (= lt!353907 (MissingZero!8248 i!1163)) (= lt!353907 (MissingVacant!8248 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43159 0))(
  ( (array!43160 (arr!20660 (Array (_ BitVec 32) (_ BitVec 64))) (size!21081 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43159)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43159 (_ BitVec 32)) SeekEntryResult!8248)

(assert (=> b!794205 (= lt!353907 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794207 () Bool)

(declare-fun res!538871 () Bool)

(assert (=> b!794207 (=> (not res!538871) (not e!440971))))

(declare-fun arrayContainsKey!0 (array!43159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794207 (= res!538871 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794208 () Bool)

(declare-fun res!538870 () Bool)

(assert (=> b!794208 (=> (not res!538870) (not e!440971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794208 (= res!538870 (validKeyInArray!0 k0!2044))))

(declare-fun b!794209 () Bool)

(declare-fun res!538866 () Bool)

(assert (=> b!794209 (=> (not res!538866) (not e!440969))))

(declare-datatypes ((List!14662 0))(
  ( (Nil!14659) (Cons!14658 (h!15787 (_ BitVec 64)) (t!20968 List!14662)) )
))
(declare-fun arrayNoDuplicates!0 (array!43159 (_ BitVec 32) List!14662) Bool)

(assert (=> b!794209 (= res!538866 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14659))))

(declare-fun b!794210 () Bool)

(declare-fun res!538872 () Bool)

(assert (=> b!794210 (=> (not res!538872) (not e!440971))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794210 (= res!538872 (and (= (size!21081 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21081 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21081 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794211 () Bool)

(assert (=> b!794211 (= e!440969 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353905 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!353909 () array!43159)

(declare-fun lt!353906 () SeekEntryResult!8248)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43159 (_ BitVec 32)) SeekEntryResult!8248)

(assert (=> b!794211 (= lt!353906 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353905 lt!353909 mask!3266))))

(declare-fun lt!353908 () SeekEntryResult!8248)

(assert (=> b!794211 (= lt!353908 (seekEntryOrOpen!0 lt!353905 lt!353909 mask!3266))))

(assert (=> b!794211 (= lt!353905 (select (store (arr!20660 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794211 (= lt!353909 (array!43160 (store (arr!20660 a!3170) i!1163 k0!2044) (size!21081 a!3170)))))

(declare-fun b!794212 () Bool)

(declare-fun res!538867 () Bool)

(assert (=> b!794212 (=> (not res!538867) (not e!440969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43159 (_ BitVec 32)) Bool)

(assert (=> b!794212 (= res!538867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794213 () Bool)

(declare-fun res!538868 () Bool)

(assert (=> b!794213 (=> (not res!538868) (not e!440969))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794213 (= res!538868 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21081 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20660 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21081 a!3170)) (= (select (arr!20660 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794206 () Bool)

(declare-fun res!538869 () Bool)

(assert (=> b!794206 (=> (not res!538869) (not e!440971))))

(assert (=> b!794206 (= res!538869 (validKeyInArray!0 (select (arr!20660 a!3170) j!153)))))

(declare-fun res!538865 () Bool)

(assert (=> start!68352 (=> (not res!538865) (not e!440971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68352 (= res!538865 (validMask!0 mask!3266))))

(assert (=> start!68352 e!440971))

(assert (=> start!68352 true))

(declare-fun array_inv!16543 (array!43159) Bool)

(assert (=> start!68352 (array_inv!16543 a!3170)))

(assert (= (and start!68352 res!538865) b!794210))

(assert (= (and b!794210 res!538872) b!794206))

(assert (= (and b!794206 res!538869) b!794208))

(assert (= (and b!794208 res!538870) b!794207))

(assert (= (and b!794207 res!538871) b!794205))

(assert (= (and b!794205 res!538864) b!794212))

(assert (= (and b!794212 res!538867) b!794209))

(assert (= (and b!794209 res!538866) b!794213))

(assert (= (and b!794213 res!538868) b!794211))

(declare-fun m!734251 () Bool)

(assert (=> b!794213 m!734251))

(declare-fun m!734253 () Bool)

(assert (=> b!794213 m!734253))

(declare-fun m!734255 () Bool)

(assert (=> b!794212 m!734255))

(declare-fun m!734257 () Bool)

(assert (=> b!794209 m!734257))

(declare-fun m!734259 () Bool)

(assert (=> b!794208 m!734259))

(declare-fun m!734261 () Bool)

(assert (=> b!794207 m!734261))

(declare-fun m!734263 () Bool)

(assert (=> start!68352 m!734263))

(declare-fun m!734265 () Bool)

(assert (=> start!68352 m!734265))

(declare-fun m!734267 () Bool)

(assert (=> b!794206 m!734267))

(assert (=> b!794206 m!734267))

(declare-fun m!734269 () Bool)

(assert (=> b!794206 m!734269))

(declare-fun m!734271 () Bool)

(assert (=> b!794211 m!734271))

(declare-fun m!734273 () Bool)

(assert (=> b!794211 m!734273))

(declare-fun m!734275 () Bool)

(assert (=> b!794211 m!734275))

(declare-fun m!734277 () Bool)

(assert (=> b!794211 m!734277))

(declare-fun m!734279 () Bool)

(assert (=> b!794205 m!734279))

(check-sat (not b!794208) (not b!794212) (not b!794211) (not b!794206) (not b!794209) (not b!794205) (not start!68352) (not b!794207))
(check-sat)
