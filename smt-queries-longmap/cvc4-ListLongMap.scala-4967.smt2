; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68316 () Bool)

(assert start!68316)

(declare-fun b!793671 () Bool)

(declare-fun e!440845 () Bool)

(declare-fun e!440846 () Bool)

(assert (=> b!793671 (= e!440845 e!440846)))

(declare-fun res!538197 () Bool)

(assert (=> b!793671 (=> (not res!538197) (not e!440846))))

(declare-datatypes ((SeekEntryResult!8224 0))(
  ( (MissingZero!8224 (index!35264 (_ BitVec 32))) (Found!8224 (index!35265 (_ BitVec 32))) (Intermediate!8224 (undefined!9036 Bool) (index!35266 (_ BitVec 32)) (x!66198 (_ BitVec 32))) (Undefined!8224) (MissingVacant!8224 (index!35267 (_ BitVec 32))) )
))
(declare-fun lt!353782 () SeekEntryResult!8224)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793671 (= res!538197 (or (= lt!353782 (MissingZero!8224 i!1163)) (= lt!353782 (MissingVacant!8224 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43106 0))(
  ( (array!43107 (arr!20633 (Array (_ BitVec 32) (_ BitVec 64))) (size!21054 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43106)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43106 (_ BitVec 32)) SeekEntryResult!8224)

(assert (=> b!793671 (= lt!353782 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!538199 () Bool)

(assert (=> start!68316 (=> (not res!538199) (not e!440845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68316 (= res!538199 (validMask!0 mask!3266))))

(assert (=> start!68316 e!440845))

(assert (=> start!68316 true))

(declare-fun array_inv!16429 (array!43106) Bool)

(assert (=> start!68316 (array_inv!16429 a!3170)))

(declare-fun b!793672 () Bool)

(declare-fun res!538191 () Bool)

(assert (=> b!793672 (=> (not res!538191) (not e!440845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793672 (= res!538191 (validKeyInArray!0 k!2044))))

(declare-fun b!793673 () Bool)

(declare-fun e!440843 () Bool)

(assert (=> b!793673 (= e!440843 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!793674 () Bool)

(declare-fun res!538196 () Bool)

(assert (=> b!793674 (=> (not res!538196) (not e!440846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43106 (_ BitVec 32)) Bool)

(assert (=> b!793674 (= res!538196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793675 () Bool)

(declare-fun res!538193 () Bool)

(assert (=> b!793675 (=> (not res!538193) (not e!440845))))

(declare-fun arrayContainsKey!0 (array!43106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793675 (= res!538193 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793676 () Bool)

(declare-fun res!538195 () Bool)

(assert (=> b!793676 (=> (not res!538195) (not e!440846))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793676 (= res!538195 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21054 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20633 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21054 a!3170)) (= (select (arr!20633 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793677 () Bool)

(declare-fun res!538192 () Bool)

(assert (=> b!793677 (=> (not res!538192) (not e!440845))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793677 (= res!538192 (and (= (size!21054 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21054 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21054 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793678 () Bool)

(assert (=> b!793678 (= e!440846 e!440843)))

(declare-fun res!538198 () Bool)

(assert (=> b!793678 (=> (not res!538198) (not e!440843))))

(declare-fun lt!353781 () array!43106)

(declare-fun lt!353783 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43106 (_ BitVec 32)) SeekEntryResult!8224)

(assert (=> b!793678 (= res!538198 (= (seekEntryOrOpen!0 lt!353783 lt!353781 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353783 lt!353781 mask!3266)))))

(assert (=> b!793678 (= lt!353783 (select (store (arr!20633 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793678 (= lt!353781 (array!43107 (store (arr!20633 a!3170) i!1163 k!2044) (size!21054 a!3170)))))

(declare-fun b!793679 () Bool)

(declare-fun res!538194 () Bool)

(assert (=> b!793679 (=> (not res!538194) (not e!440845))))

(assert (=> b!793679 (= res!538194 (validKeyInArray!0 (select (arr!20633 a!3170) j!153)))))

(declare-fun b!793680 () Bool)

(declare-fun res!538190 () Bool)

(assert (=> b!793680 (=> (not res!538190) (not e!440846))))

(declare-datatypes ((List!14596 0))(
  ( (Nil!14593) (Cons!14592 (h!15721 (_ BitVec 64)) (t!20911 List!14596)) )
))
(declare-fun arrayNoDuplicates!0 (array!43106 (_ BitVec 32) List!14596) Bool)

(assert (=> b!793680 (= res!538190 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14593))))

(assert (= (and start!68316 res!538199) b!793677))

(assert (= (and b!793677 res!538192) b!793679))

(assert (= (and b!793679 res!538194) b!793672))

(assert (= (and b!793672 res!538191) b!793675))

(assert (= (and b!793675 res!538193) b!793671))

(assert (= (and b!793671 res!538197) b!793674))

(assert (= (and b!793674 res!538196) b!793680))

(assert (= (and b!793680 res!538190) b!793676))

(assert (= (and b!793676 res!538195) b!793678))

(assert (= (and b!793678 res!538198) b!793673))

(declare-fun m!734153 () Bool)

(assert (=> b!793672 m!734153))

(declare-fun m!734155 () Bool)

(assert (=> b!793676 m!734155))

(declare-fun m!734157 () Bool)

(assert (=> b!793676 m!734157))

(declare-fun m!734159 () Bool)

(assert (=> b!793675 m!734159))

(declare-fun m!734161 () Bool)

(assert (=> b!793679 m!734161))

(assert (=> b!793679 m!734161))

(declare-fun m!734163 () Bool)

(assert (=> b!793679 m!734163))

(declare-fun m!734165 () Bool)

(assert (=> b!793674 m!734165))

(declare-fun m!734167 () Bool)

(assert (=> start!68316 m!734167))

(declare-fun m!734169 () Bool)

(assert (=> start!68316 m!734169))

(declare-fun m!734171 () Bool)

(assert (=> b!793680 m!734171))

(declare-fun m!734173 () Bool)

(assert (=> b!793671 m!734173))

(declare-fun m!734175 () Bool)

(assert (=> b!793678 m!734175))

(declare-fun m!734177 () Bool)

(assert (=> b!793678 m!734177))

(declare-fun m!734179 () Bool)

(assert (=> b!793678 m!734179))

(declare-fun m!734181 () Bool)

(assert (=> b!793678 m!734181))

(push 1)

(assert (not b!793671))

(assert (not b!793680))

(assert (not b!793672))

(assert (not b!793674))

(assert (not b!793679))

(assert (not b!793675))

(assert (not start!68316))

(assert (not b!793678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

