; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68318 () Bool)

(assert start!68318)

(declare-fun b!793699 () Bool)

(declare-fun res!538222 () Bool)

(declare-fun e!440855 () Bool)

(assert (=> b!793699 (=> (not res!538222) (not e!440855))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43108 0))(
  ( (array!43109 (arr!20634 (Array (_ BitVec 32) (_ BitVec 64))) (size!21055 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43108)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793699 (= res!538222 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21055 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20634 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21055 a!3170)) (= (select (arr!20634 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793700 () Bool)

(declare-fun e!440854 () Bool)

(assert (=> b!793700 (= e!440854 e!440855)))

(declare-fun res!538226 () Bool)

(assert (=> b!793700 (=> (not res!538226) (not e!440855))))

(declare-datatypes ((SeekEntryResult!8225 0))(
  ( (MissingZero!8225 (index!35268 (_ BitVec 32))) (Found!8225 (index!35269 (_ BitVec 32))) (Intermediate!8225 (undefined!9037 Bool) (index!35270 (_ BitVec 32)) (x!66207 (_ BitVec 32))) (Undefined!8225) (MissingVacant!8225 (index!35271 (_ BitVec 32))) )
))
(declare-fun lt!353798 () SeekEntryResult!8225)

(assert (=> b!793700 (= res!538226 (or (= lt!353798 (MissingZero!8225 i!1163)) (= lt!353798 (MissingVacant!8225 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43108 (_ BitVec 32)) SeekEntryResult!8225)

(assert (=> b!793700 (= lt!353798 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793701 () Bool)

(declare-fun res!538220 () Bool)

(assert (=> b!793701 (=> (not res!538220) (not e!440854))))

(declare-fun arrayContainsKey!0 (array!43108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793701 (= res!538220 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793702 () Bool)

(declare-fun res!538219 () Bool)

(assert (=> b!793702 (=> (not res!538219) (not e!440855))))

(declare-datatypes ((List!14597 0))(
  ( (Nil!14594) (Cons!14593 (h!15722 (_ BitVec 64)) (t!20912 List!14597)) )
))
(declare-fun arrayNoDuplicates!0 (array!43108 (_ BitVec 32) List!14597) Bool)

(assert (=> b!793702 (= res!538219 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14594))))

(declare-fun res!538218 () Bool)

(assert (=> start!68318 (=> (not res!538218) (not e!440854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68318 (= res!538218 (validMask!0 mask!3266))))

(assert (=> start!68318 e!440854))

(assert (=> start!68318 true))

(declare-fun array_inv!16430 (array!43108) Bool)

(assert (=> start!68318 (array_inv!16430 a!3170)))

(declare-fun b!793703 () Bool)

(declare-fun res!538225 () Bool)

(assert (=> b!793703 (=> (not res!538225) (not e!440854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793703 (= res!538225 (validKeyInArray!0 k!2044))))

(declare-fun b!793704 () Bool)

(declare-fun res!538221 () Bool)

(assert (=> b!793704 (=> (not res!538221) (not e!440854))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793704 (= res!538221 (validKeyInArray!0 (select (arr!20634 a!3170) j!153)))))

(declare-fun b!793705 () Bool)

(declare-fun res!538223 () Bool)

(assert (=> b!793705 (=> (not res!538223) (not e!440854))))

(assert (=> b!793705 (= res!538223 (and (= (size!21055 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21055 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21055 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793706 () Bool)

(declare-fun res!538224 () Bool)

(assert (=> b!793706 (=> (not res!538224) (not e!440855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43108 (_ BitVec 32)) Bool)

(assert (=> b!793706 (= res!538224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793707 () Bool)

(assert (=> b!793707 (= e!440855 false)))

(declare-fun lt!353796 () (_ BitVec 64))

(declare-fun lt!353794 () SeekEntryResult!8225)

(declare-fun lt!353795 () array!43108)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43108 (_ BitVec 32)) SeekEntryResult!8225)

(assert (=> b!793707 (= lt!353794 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353796 lt!353795 mask!3266))))

(declare-fun lt!353797 () SeekEntryResult!8225)

(assert (=> b!793707 (= lt!353797 (seekEntryOrOpen!0 lt!353796 lt!353795 mask!3266))))

(assert (=> b!793707 (= lt!353796 (select (store (arr!20634 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793707 (= lt!353795 (array!43109 (store (arr!20634 a!3170) i!1163 k!2044) (size!21055 a!3170)))))

(assert (= (and start!68318 res!538218) b!793705))

(assert (= (and b!793705 res!538223) b!793704))

(assert (= (and b!793704 res!538221) b!793703))

(assert (= (and b!793703 res!538225) b!793701))

(assert (= (and b!793701 res!538220) b!793700))

(assert (= (and b!793700 res!538226) b!793706))

(assert (= (and b!793706 res!538224) b!793702))

(assert (= (and b!793702 res!538219) b!793699))

(assert (= (and b!793699 res!538222) b!793707))

(declare-fun m!734183 () Bool)

(assert (=> b!793706 m!734183))

(declare-fun m!734185 () Bool)

(assert (=> b!793703 m!734185))

(declare-fun m!734187 () Bool)

(assert (=> b!793707 m!734187))

(declare-fun m!734189 () Bool)

(assert (=> b!793707 m!734189))

(declare-fun m!734191 () Bool)

(assert (=> b!793707 m!734191))

(declare-fun m!734193 () Bool)

(assert (=> b!793707 m!734193))

(declare-fun m!734195 () Bool)

(assert (=> b!793699 m!734195))

(declare-fun m!734197 () Bool)

(assert (=> b!793699 m!734197))

(declare-fun m!734199 () Bool)

(assert (=> start!68318 m!734199))

(declare-fun m!734201 () Bool)

(assert (=> start!68318 m!734201))

(declare-fun m!734203 () Bool)

(assert (=> b!793701 m!734203))

(declare-fun m!734205 () Bool)

(assert (=> b!793700 m!734205))

(declare-fun m!734207 () Bool)

(assert (=> b!793702 m!734207))

(declare-fun m!734209 () Bool)

(assert (=> b!793704 m!734209))

(assert (=> b!793704 m!734209))

(declare-fun m!734211 () Bool)

(assert (=> b!793704 m!734211))

(push 1)

