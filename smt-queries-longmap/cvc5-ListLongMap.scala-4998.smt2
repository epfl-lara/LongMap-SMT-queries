; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68498 () Bool)

(assert start!68498)

(declare-fun b!796412 () Bool)

(declare-fun e!441919 () Bool)

(declare-fun e!441920 () Bool)

(assert (=> b!796412 (= e!441919 e!441920)))

(declare-fun res!540941 () Bool)

(assert (=> b!796412 (=> (not res!540941) (not e!441920))))

(declare-datatypes ((SeekEntryResult!8315 0))(
  ( (MissingZero!8315 (index!35628 (_ BitVec 32))) (Found!8315 (index!35629 (_ BitVec 32))) (Intermediate!8315 (undefined!9127 Bool) (index!35630 (_ BitVec 32)) (x!66537 (_ BitVec 32))) (Undefined!8315) (MissingVacant!8315 (index!35631 (_ BitVec 32))) )
))
(declare-fun lt!355113 () SeekEntryResult!8315)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796412 (= res!540941 (or (= lt!355113 (MissingZero!8315 i!1163)) (= lt!355113 (MissingVacant!8315 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43288 0))(
  ( (array!43289 (arr!20724 (Array (_ BitVec 32) (_ BitVec 64))) (size!21145 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43288)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43288 (_ BitVec 32)) SeekEntryResult!8315)

(assert (=> b!796412 (= lt!355113 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796413 () Bool)

(declare-fun res!540940 () Bool)

(assert (=> b!796413 (=> (not res!540940) (not e!441920))))

(declare-datatypes ((List!14687 0))(
  ( (Nil!14684) (Cons!14683 (h!15812 (_ BitVec 64)) (t!21002 List!14687)) )
))
(declare-fun arrayNoDuplicates!0 (array!43288 (_ BitVec 32) List!14687) Bool)

(assert (=> b!796413 (= res!540940 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14684))))

(declare-fun b!796414 () Bool)

(declare-fun res!540934 () Bool)

(assert (=> b!796414 (=> (not res!540934) (not e!441919))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796414 (= res!540934 (validKeyInArray!0 (select (arr!20724 a!3170) j!153)))))

(declare-fun b!796415 () Bool)

(declare-fun res!540931 () Bool)

(assert (=> b!796415 (=> (not res!540931) (not e!441919))))

(declare-fun arrayContainsKey!0 (array!43288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796415 (= res!540931 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796416 () Bool)

(declare-fun e!441923 () Bool)

(assert (=> b!796416 (= e!441923 (not true))))

(declare-fun lt!355117 () SeekEntryResult!8315)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796416 (= lt!355117 (Found!8315 index!1236))))

(declare-fun b!796417 () Bool)

(declare-fun e!441921 () Bool)

(assert (=> b!796417 (= e!441920 e!441921)))

(declare-fun res!540932 () Bool)

(assert (=> b!796417 (=> (not res!540932) (not e!441921))))

(declare-fun lt!355116 () SeekEntryResult!8315)

(assert (=> b!796417 (= res!540932 (= lt!355116 lt!355117))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355115 () (_ BitVec 64))

(declare-fun lt!355112 () array!43288)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43288 (_ BitVec 32)) SeekEntryResult!8315)

(assert (=> b!796417 (= lt!355117 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355115 lt!355112 mask!3266))))

(assert (=> b!796417 (= lt!355116 (seekEntryOrOpen!0 lt!355115 lt!355112 mask!3266))))

(assert (=> b!796417 (= lt!355115 (select (store (arr!20724 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796417 (= lt!355112 (array!43289 (store (arr!20724 a!3170) i!1163 k!2044) (size!21145 a!3170)))))

(declare-fun b!796418 () Bool)

(declare-fun res!540935 () Bool)

(assert (=> b!796418 (=> (not res!540935) (not e!441920))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796418 (= res!540935 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21145 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20724 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21145 a!3170)) (= (select (arr!20724 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796419 () Bool)

(declare-fun res!540936 () Bool)

(assert (=> b!796419 (=> (not res!540936) (not e!441919))))

(assert (=> b!796419 (= res!540936 (validKeyInArray!0 k!2044))))

(declare-fun res!540937 () Bool)

(assert (=> start!68498 (=> (not res!540937) (not e!441919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68498 (= res!540937 (validMask!0 mask!3266))))

(assert (=> start!68498 e!441919))

(assert (=> start!68498 true))

(declare-fun array_inv!16520 (array!43288) Bool)

(assert (=> start!68498 (array_inv!16520 a!3170)))

(declare-fun b!796420 () Bool)

(declare-fun res!540938 () Bool)

(assert (=> b!796420 (=> (not res!540938) (not e!441919))))

(assert (=> b!796420 (= res!540938 (and (= (size!21145 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21145 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21145 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796421 () Bool)

(declare-fun res!540933 () Bool)

(assert (=> b!796421 (=> (not res!540933) (not e!441920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43288 (_ BitVec 32)) Bool)

(assert (=> b!796421 (= res!540933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796422 () Bool)

(assert (=> b!796422 (= e!441921 e!441923)))

(declare-fun res!540939 () Bool)

(assert (=> b!796422 (=> (not res!540939) (not e!441923))))

(declare-fun lt!355118 () SeekEntryResult!8315)

(declare-fun lt!355114 () SeekEntryResult!8315)

(assert (=> b!796422 (= res!540939 (and (= lt!355118 lt!355114) (= lt!355114 (Found!8315 j!153)) (= (select (arr!20724 a!3170) index!1236) (select (arr!20724 a!3170) j!153))))))

(assert (=> b!796422 (= lt!355114 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20724 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796422 (= lt!355118 (seekEntryOrOpen!0 (select (arr!20724 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68498 res!540937) b!796420))

(assert (= (and b!796420 res!540938) b!796414))

(assert (= (and b!796414 res!540934) b!796419))

(assert (= (and b!796419 res!540936) b!796415))

(assert (= (and b!796415 res!540931) b!796412))

(assert (= (and b!796412 res!540941) b!796421))

(assert (= (and b!796421 res!540933) b!796413))

(assert (= (and b!796413 res!540940) b!796418))

(assert (= (and b!796418 res!540935) b!796417))

(assert (= (and b!796417 res!540932) b!796422))

(assert (= (and b!796422 res!540939) b!796416))

(declare-fun m!737195 () Bool)

(assert (=> b!796418 m!737195))

(declare-fun m!737197 () Bool)

(assert (=> b!796418 m!737197))

(declare-fun m!737199 () Bool)

(assert (=> b!796412 m!737199))

(declare-fun m!737201 () Bool)

(assert (=> b!796419 m!737201))

(declare-fun m!737203 () Bool)

(assert (=> b!796414 m!737203))

(assert (=> b!796414 m!737203))

(declare-fun m!737205 () Bool)

(assert (=> b!796414 m!737205))

(declare-fun m!737207 () Bool)

(assert (=> b!796415 m!737207))

(declare-fun m!737209 () Bool)

(assert (=> start!68498 m!737209))

(declare-fun m!737211 () Bool)

(assert (=> start!68498 m!737211))

(declare-fun m!737213 () Bool)

(assert (=> b!796421 m!737213))

(declare-fun m!737215 () Bool)

(assert (=> b!796417 m!737215))

(declare-fun m!737217 () Bool)

(assert (=> b!796417 m!737217))

(declare-fun m!737219 () Bool)

(assert (=> b!796417 m!737219))

(declare-fun m!737221 () Bool)

(assert (=> b!796417 m!737221))

(declare-fun m!737223 () Bool)

(assert (=> b!796422 m!737223))

(assert (=> b!796422 m!737203))

(assert (=> b!796422 m!737203))

(declare-fun m!737225 () Bool)

(assert (=> b!796422 m!737225))

(assert (=> b!796422 m!737203))

(declare-fun m!737227 () Bool)

(assert (=> b!796422 m!737227))

(declare-fun m!737229 () Bool)

(assert (=> b!796413 m!737229))

(push 1)

