; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68480 () Bool)

(assert start!68480)

(declare-fun b!796115 () Bool)

(declare-fun res!540642 () Bool)

(declare-fun e!441787 () Bool)

(assert (=> b!796115 (=> (not res!540642) (not e!441787))))

(declare-datatypes ((array!43270 0))(
  ( (array!43271 (arr!20715 (Array (_ BitVec 32) (_ BitVec 64))) (size!21136 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43270)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43270 (_ BitVec 32)) Bool)

(assert (=> b!796115 (= res!540642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796116 () Bool)

(declare-fun res!540634 () Bool)

(declare-fun e!441785 () Bool)

(assert (=> b!796116 (=> (not res!540634) (not e!441785))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796116 (= res!540634 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796117 () Bool)

(declare-fun res!540640 () Bool)

(assert (=> b!796117 (=> (not res!540640) (not e!441785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796117 (= res!540640 (validKeyInArray!0 k!2044))))

(declare-fun b!796119 () Bool)

(assert (=> b!796119 (= e!441785 e!441787)))

(declare-fun res!540641 () Bool)

(assert (=> b!796119 (=> (not res!540641) (not e!441787))))

(declare-datatypes ((SeekEntryResult!8306 0))(
  ( (MissingZero!8306 (index!35592 (_ BitVec 32))) (Found!8306 (index!35593 (_ BitVec 32))) (Intermediate!8306 (undefined!9118 Bool) (index!35594 (_ BitVec 32)) (x!66504 (_ BitVec 32))) (Undefined!8306) (MissingVacant!8306 (index!35595 (_ BitVec 32))) )
))
(declare-fun lt!354926 () SeekEntryResult!8306)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796119 (= res!540641 (or (= lt!354926 (MissingZero!8306 i!1163)) (= lt!354926 (MissingVacant!8306 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43270 (_ BitVec 32)) SeekEntryResult!8306)

(assert (=> b!796119 (= lt!354926 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796120 () Bool)

(declare-fun res!540639 () Bool)

(assert (=> b!796120 (=> (not res!540639) (not e!441787))))

(declare-datatypes ((List!14678 0))(
  ( (Nil!14675) (Cons!14674 (h!15803 (_ BitVec 64)) (t!20993 List!14678)) )
))
(declare-fun arrayNoDuplicates!0 (array!43270 (_ BitVec 32) List!14678) Bool)

(assert (=> b!796120 (= res!540639 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14675))))

(declare-fun b!796121 () Bool)

(declare-fun res!540635 () Bool)

(assert (=> b!796121 (=> (not res!540635) (not e!441785))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796121 (= res!540635 (validKeyInArray!0 (select (arr!20715 a!3170) j!153)))))

(declare-fun b!796122 () Bool)

(declare-fun e!441784 () Bool)

(assert (=> b!796122 (= e!441787 e!441784)))

(declare-fun res!540637 () Bool)

(assert (=> b!796122 (=> (not res!540637) (not e!441784))))

(declare-fun lt!354927 () SeekEntryResult!8306)

(declare-fun lt!354923 () SeekEntryResult!8306)

(assert (=> b!796122 (= res!540637 (= lt!354927 lt!354923))))

(declare-fun lt!354928 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354929 () array!43270)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43270 (_ BitVec 32)) SeekEntryResult!8306)

(assert (=> b!796122 (= lt!354923 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354928 lt!354929 mask!3266))))

(assert (=> b!796122 (= lt!354927 (seekEntryOrOpen!0 lt!354928 lt!354929 mask!3266))))

(assert (=> b!796122 (= lt!354928 (select (store (arr!20715 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796122 (= lt!354929 (array!43271 (store (arr!20715 a!3170) i!1163 k!2044) (size!21136 a!3170)))))

(declare-fun b!796123 () Bool)

(declare-fun e!441786 () Bool)

(assert (=> b!796123 (= e!441786 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!796123 (= lt!354923 (Found!8306 index!1236))))

(declare-fun b!796124 () Bool)

(declare-fun res!540638 () Bool)

(assert (=> b!796124 (=> (not res!540638) (not e!441787))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796124 (= res!540638 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21136 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20715 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21136 a!3170)) (= (select (arr!20715 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796125 () Bool)

(assert (=> b!796125 (= e!441784 e!441786)))

(declare-fun res!540644 () Bool)

(assert (=> b!796125 (=> (not res!540644) (not e!441786))))

(declare-fun lt!354925 () SeekEntryResult!8306)

(declare-fun lt!354924 () SeekEntryResult!8306)

(assert (=> b!796125 (= res!540644 (and (= lt!354924 lt!354925) (= lt!354925 (Found!8306 j!153)) (= (select (arr!20715 a!3170) index!1236) (select (arr!20715 a!3170) j!153))))))

(assert (=> b!796125 (= lt!354925 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20715 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796125 (= lt!354924 (seekEntryOrOpen!0 (select (arr!20715 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796118 () Bool)

(declare-fun res!540643 () Bool)

(assert (=> b!796118 (=> (not res!540643) (not e!441785))))

(assert (=> b!796118 (= res!540643 (and (= (size!21136 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21136 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21136 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!540636 () Bool)

(assert (=> start!68480 (=> (not res!540636) (not e!441785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68480 (= res!540636 (validMask!0 mask!3266))))

(assert (=> start!68480 e!441785))

(assert (=> start!68480 true))

(declare-fun array_inv!16511 (array!43270) Bool)

(assert (=> start!68480 (array_inv!16511 a!3170)))

(assert (= (and start!68480 res!540636) b!796118))

(assert (= (and b!796118 res!540643) b!796121))

(assert (= (and b!796121 res!540635) b!796117))

(assert (= (and b!796117 res!540640) b!796116))

(assert (= (and b!796116 res!540634) b!796119))

(assert (= (and b!796119 res!540641) b!796115))

(assert (= (and b!796115 res!540642) b!796120))

(assert (= (and b!796120 res!540639) b!796124))

(assert (= (and b!796124 res!540638) b!796122))

(assert (= (and b!796122 res!540637) b!796125))

(assert (= (and b!796125 res!540644) b!796123))

(declare-fun m!736871 () Bool)

(assert (=> b!796115 m!736871))

(declare-fun m!736873 () Bool)

(assert (=> b!796116 m!736873))

(declare-fun m!736875 () Bool)

(assert (=> b!796119 m!736875))

(declare-fun m!736877 () Bool)

(assert (=> b!796117 m!736877))

(declare-fun m!736879 () Bool)

(assert (=> start!68480 m!736879))

(declare-fun m!736881 () Bool)

(assert (=> start!68480 m!736881))

(declare-fun m!736883 () Bool)

(assert (=> b!796120 m!736883))

(declare-fun m!736885 () Bool)

(assert (=> b!796121 m!736885))

(assert (=> b!796121 m!736885))

(declare-fun m!736887 () Bool)

(assert (=> b!796121 m!736887))

(declare-fun m!736889 () Bool)

(assert (=> b!796122 m!736889))

(declare-fun m!736891 () Bool)

(assert (=> b!796122 m!736891))

(declare-fun m!736893 () Bool)

(assert (=> b!796122 m!736893))

(declare-fun m!736895 () Bool)

(assert (=> b!796122 m!736895))

(declare-fun m!736897 () Bool)

(assert (=> b!796124 m!736897))

(declare-fun m!736899 () Bool)

(assert (=> b!796124 m!736899))

(declare-fun m!736901 () Bool)

(assert (=> b!796125 m!736901))

(assert (=> b!796125 m!736885))

(assert (=> b!796125 m!736885))

(declare-fun m!736903 () Bool)

(assert (=> b!796125 m!736903))

(assert (=> b!796125 m!736885))

(declare-fun m!736905 () Bool)

(assert (=> b!796125 m!736905))

(push 1)

(assert (not b!796116))

(assert (not b!796121))

(assert (not b!796122))

(assert (not b!796125))

(assert (not b!796117))

(assert (not start!68480))

(assert (not b!796115))

(assert (not b!796119))

(assert (not b!796120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

