; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68324 () Bool)

(assert start!68324)

(declare-fun b!793780 () Bool)

(declare-fun e!440880 () Bool)

(declare-fun e!440881 () Bool)

(assert (=> b!793780 (= e!440880 e!440881)))

(declare-fun res!538303 () Bool)

(assert (=> b!793780 (=> (not res!538303) (not e!440881))))

(declare-datatypes ((SeekEntryResult!8228 0))(
  ( (MissingZero!8228 (index!35280 (_ BitVec 32))) (Found!8228 (index!35281 (_ BitVec 32))) (Intermediate!8228 (undefined!9040 Bool) (index!35282 (_ BitVec 32)) (x!66218 (_ BitVec 32))) (Undefined!8228) (MissingVacant!8228 (index!35283 (_ BitVec 32))) )
))
(declare-fun lt!353840 () SeekEntryResult!8228)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793780 (= res!538303 (or (= lt!353840 (MissingZero!8228 i!1163)) (= lt!353840 (MissingVacant!8228 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43114 0))(
  ( (array!43115 (arr!20637 (Array (_ BitVec 32) (_ BitVec 64))) (size!21058 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43114)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43114 (_ BitVec 32)) SeekEntryResult!8228)

(assert (=> b!793780 (= lt!353840 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793781 () Bool)

(declare-fun res!538307 () Bool)

(assert (=> b!793781 (=> (not res!538307) (not e!440880))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793781 (= res!538307 (validKeyInArray!0 (select (arr!20637 a!3170) j!153)))))

(declare-fun b!793782 () Bool)

(declare-fun res!538305 () Bool)

(assert (=> b!793782 (=> (not res!538305) (not e!440880))))

(declare-fun arrayContainsKey!0 (array!43114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793782 (= res!538305 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793783 () Bool)

(declare-fun res!538300 () Bool)

(assert (=> b!793783 (=> (not res!538300) (not e!440880))))

(assert (=> b!793783 (= res!538300 (and (= (size!21058 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21058 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21058 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!538304 () Bool)

(assert (=> start!68324 (=> (not res!538304) (not e!440880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68324 (= res!538304 (validMask!0 mask!3266))))

(assert (=> start!68324 e!440880))

(assert (=> start!68324 true))

(declare-fun array_inv!16433 (array!43114) Bool)

(assert (=> start!68324 (array_inv!16433 a!3170)))

(declare-fun b!793784 () Bool)

(declare-fun res!538306 () Bool)

(assert (=> b!793784 (=> (not res!538306) (not e!440881))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793784 (= res!538306 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21058 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20637 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21058 a!3170)) (= (select (arr!20637 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793785 () Bool)

(declare-fun res!538302 () Bool)

(assert (=> b!793785 (=> (not res!538302) (not e!440881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43114 (_ BitVec 32)) Bool)

(assert (=> b!793785 (= res!538302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793786 () Bool)

(declare-fun res!538301 () Bool)

(assert (=> b!793786 (=> (not res!538301) (not e!440881))))

(declare-datatypes ((List!14600 0))(
  ( (Nil!14597) (Cons!14596 (h!15725 (_ BitVec 64)) (t!20915 List!14600)) )
))
(declare-fun arrayNoDuplicates!0 (array!43114 (_ BitVec 32) List!14600) Bool)

(assert (=> b!793786 (= res!538301 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14597))))

(declare-fun b!793787 () Bool)

(assert (=> b!793787 (= e!440881 false)))

(declare-fun lt!353841 () array!43114)

(declare-fun lt!353839 () (_ BitVec 64))

(declare-fun lt!353843 () SeekEntryResult!8228)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43114 (_ BitVec 32)) SeekEntryResult!8228)

(assert (=> b!793787 (= lt!353843 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353839 lt!353841 mask!3266))))

(declare-fun lt!353842 () SeekEntryResult!8228)

(assert (=> b!793787 (= lt!353842 (seekEntryOrOpen!0 lt!353839 lt!353841 mask!3266))))

(assert (=> b!793787 (= lt!353839 (select (store (arr!20637 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793787 (= lt!353841 (array!43115 (store (arr!20637 a!3170) i!1163 k!2044) (size!21058 a!3170)))))

(declare-fun b!793788 () Bool)

(declare-fun res!538299 () Bool)

(assert (=> b!793788 (=> (not res!538299) (not e!440880))))

(assert (=> b!793788 (= res!538299 (validKeyInArray!0 k!2044))))

(assert (= (and start!68324 res!538304) b!793783))

(assert (= (and b!793783 res!538300) b!793781))

(assert (= (and b!793781 res!538307) b!793788))

(assert (= (and b!793788 res!538299) b!793782))

(assert (= (and b!793782 res!538305) b!793780))

(assert (= (and b!793780 res!538303) b!793785))

(assert (= (and b!793785 res!538302) b!793786))

(assert (= (and b!793786 res!538301) b!793784))

(assert (= (and b!793784 res!538306) b!793787))

(declare-fun m!734273 () Bool)

(assert (=> b!793786 m!734273))

(declare-fun m!734275 () Bool)

(assert (=> b!793782 m!734275))

(declare-fun m!734277 () Bool)

(assert (=> b!793788 m!734277))

(declare-fun m!734279 () Bool)

(assert (=> b!793787 m!734279))

(declare-fun m!734281 () Bool)

(assert (=> b!793787 m!734281))

(declare-fun m!734283 () Bool)

(assert (=> b!793787 m!734283))

(declare-fun m!734285 () Bool)

(assert (=> b!793787 m!734285))

(declare-fun m!734287 () Bool)

(assert (=> b!793785 m!734287))

(declare-fun m!734289 () Bool)

(assert (=> start!68324 m!734289))

(declare-fun m!734291 () Bool)

(assert (=> start!68324 m!734291))

(declare-fun m!734293 () Bool)

(assert (=> b!793780 m!734293))

(declare-fun m!734295 () Bool)

(assert (=> b!793784 m!734295))

(declare-fun m!734297 () Bool)

(assert (=> b!793784 m!734297))

(declare-fun m!734299 () Bool)

(assert (=> b!793781 m!734299))

(assert (=> b!793781 m!734299))

(declare-fun m!734301 () Bool)

(assert (=> b!793781 m!734301))

(push 1)

