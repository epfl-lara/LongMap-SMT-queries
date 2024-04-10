; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68658 () Bool)

(assert start!68658)

(declare-fun b!799158 () Bool)

(declare-fun res!543689 () Bool)

(declare-fun e!443203 () Bool)

(assert (=> b!799158 (=> (not res!543689) (not e!443203))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43448 0))(
  ( (array!43449 (arr!20804 (Array (_ BitVec 32) (_ BitVec 64))) (size!21225 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43448)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799158 (= res!543689 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21225 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20804 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21225 a!3170)) (= (select (arr!20804 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799159 () Bool)

(declare-fun e!443204 () Bool)

(assert (=> b!799159 (= e!443204 false)))

(declare-fun lt!356818 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8395 0))(
  ( (MissingZero!8395 (index!35948 (_ BitVec 32))) (Found!8395 (index!35949 (_ BitVec 32))) (Intermediate!8395 (undefined!9207 Bool) (index!35950 (_ BitVec 32)) (x!66825 (_ BitVec 32))) (Undefined!8395) (MissingVacant!8395 (index!35951 (_ BitVec 32))) )
))
(declare-fun lt!356820 () SeekEntryResult!8395)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43448 (_ BitVec 32)) SeekEntryResult!8395)

(assert (=> b!799159 (= lt!356820 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356818 vacantBefore!23 (select (arr!20804 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799160 () Bool)

(declare-fun res!543683 () Bool)

(declare-fun e!443202 () Bool)

(assert (=> b!799160 (=> (not res!543683) (not e!443202))))

(assert (=> b!799160 (= res!543683 (and (= (size!21225 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21225 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21225 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799161 () Bool)

(declare-fun res!543679 () Bool)

(assert (=> b!799161 (=> (not res!543679) (not e!443202))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799161 (= res!543679 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799162 () Bool)

(declare-fun res!543684 () Bool)

(assert (=> b!799162 (=> (not res!543684) (not e!443203))))

(declare-datatypes ((List!14767 0))(
  ( (Nil!14764) (Cons!14763 (h!15892 (_ BitVec 64)) (t!21082 List!14767)) )
))
(declare-fun arrayNoDuplicates!0 (array!43448 (_ BitVec 32) List!14767) Bool)

(assert (=> b!799162 (= res!543684 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14764))))

(declare-fun b!799163 () Bool)

(declare-fun res!543688 () Bool)

(assert (=> b!799163 (=> (not res!543688) (not e!443202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799163 (= res!543688 (validKeyInArray!0 k!2044))))

(declare-fun b!799164 () Bool)

(declare-fun res!543687 () Bool)

(assert (=> b!799164 (=> (not res!543687) (not e!443203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43448 (_ BitVec 32)) Bool)

(assert (=> b!799164 (= res!543687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799165 () Bool)

(declare-fun e!443200 () Bool)

(assert (=> b!799165 (= e!443200 e!443204)))

(declare-fun res!543685 () Bool)

(assert (=> b!799165 (=> (not res!543685) (not e!443204))))

(assert (=> b!799165 (= res!543685 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356818 #b00000000000000000000000000000000) (bvslt lt!356818 (size!21225 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799165 (= lt!356818 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799166 () Bool)

(declare-fun res!543681 () Bool)

(assert (=> b!799166 (=> (not res!543681) (not e!443202))))

(assert (=> b!799166 (= res!543681 (validKeyInArray!0 (select (arr!20804 a!3170) j!153)))))

(declare-fun b!799167 () Bool)

(assert (=> b!799167 (= e!443202 e!443203)))

(declare-fun res!543678 () Bool)

(assert (=> b!799167 (=> (not res!543678) (not e!443203))))

(declare-fun lt!356822 () SeekEntryResult!8395)

(assert (=> b!799167 (= res!543678 (or (= lt!356822 (MissingZero!8395 i!1163)) (= lt!356822 (MissingVacant!8395 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43448 (_ BitVec 32)) SeekEntryResult!8395)

(assert (=> b!799167 (= lt!356822 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799168 () Bool)

(declare-fun res!543677 () Bool)

(assert (=> b!799168 (=> (not res!543677) (not e!443204))))

(declare-fun lt!356824 () (_ BitVec 64))

(declare-fun lt!356825 () SeekEntryResult!8395)

(declare-fun lt!356821 () array!43448)

(assert (=> b!799168 (= res!543677 (= lt!356825 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356818 vacantAfter!23 lt!356824 lt!356821 mask!3266)))))

(declare-fun res!543682 () Bool)

(assert (=> start!68658 (=> (not res!543682) (not e!443202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68658 (= res!543682 (validMask!0 mask!3266))))

(assert (=> start!68658 e!443202))

(assert (=> start!68658 true))

(declare-fun array_inv!16600 (array!43448) Bool)

(assert (=> start!68658 (array_inv!16600 a!3170)))

(declare-fun b!799169 () Bool)

(declare-fun e!443199 () Bool)

(assert (=> b!799169 (= e!443203 e!443199)))

(declare-fun res!543686 () Bool)

(assert (=> b!799169 (=> (not res!543686) (not e!443199))))

(assert (=> b!799169 (= res!543686 (= lt!356825 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356824 lt!356821 mask!3266)))))

(assert (=> b!799169 (= lt!356825 (seekEntryOrOpen!0 lt!356824 lt!356821 mask!3266))))

(assert (=> b!799169 (= lt!356824 (select (store (arr!20804 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799169 (= lt!356821 (array!43449 (store (arr!20804 a!3170) i!1163 k!2044) (size!21225 a!3170)))))

(declare-fun b!799170 () Bool)

(assert (=> b!799170 (= e!443199 e!443200)))

(declare-fun res!543680 () Bool)

(assert (=> b!799170 (=> (not res!543680) (not e!443200))))

(declare-fun lt!356819 () SeekEntryResult!8395)

(declare-fun lt!356823 () SeekEntryResult!8395)

(assert (=> b!799170 (= res!543680 (and (= lt!356823 lt!356819) (= lt!356819 (Found!8395 j!153)) (not (= (select (arr!20804 a!3170) index!1236) (select (arr!20804 a!3170) j!153)))))))

(assert (=> b!799170 (= lt!356819 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20804 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799170 (= lt!356823 (seekEntryOrOpen!0 (select (arr!20804 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68658 res!543682) b!799160))

(assert (= (and b!799160 res!543683) b!799166))

(assert (= (and b!799166 res!543681) b!799163))

(assert (= (and b!799163 res!543688) b!799161))

(assert (= (and b!799161 res!543679) b!799167))

(assert (= (and b!799167 res!543678) b!799164))

(assert (= (and b!799164 res!543687) b!799162))

(assert (= (and b!799162 res!543684) b!799158))

(assert (= (and b!799158 res!543689) b!799169))

(assert (= (and b!799169 res!543686) b!799170))

(assert (= (and b!799170 res!543680) b!799165))

(assert (= (and b!799165 res!543685) b!799168))

(assert (= (and b!799168 res!543677) b!799159))

(declare-fun m!740147 () Bool)

(assert (=> b!799169 m!740147))

(declare-fun m!740149 () Bool)

(assert (=> b!799169 m!740149))

(declare-fun m!740151 () Bool)

(assert (=> b!799169 m!740151))

(declare-fun m!740153 () Bool)

(assert (=> b!799169 m!740153))

(declare-fun m!740155 () Bool)

(assert (=> b!799161 m!740155))

(declare-fun m!740157 () Bool)

(assert (=> b!799159 m!740157))

(assert (=> b!799159 m!740157))

(declare-fun m!740159 () Bool)

(assert (=> b!799159 m!740159))

(declare-fun m!740161 () Bool)

(assert (=> b!799164 m!740161))

(declare-fun m!740163 () Bool)

(assert (=> b!799162 m!740163))

(assert (=> b!799166 m!740157))

(assert (=> b!799166 m!740157))

(declare-fun m!740165 () Bool)

(assert (=> b!799166 m!740165))

(declare-fun m!740167 () Bool)

(assert (=> b!799170 m!740167))

(assert (=> b!799170 m!740157))

(assert (=> b!799170 m!740157))

(declare-fun m!740169 () Bool)

(assert (=> b!799170 m!740169))

(assert (=> b!799170 m!740157))

(declare-fun m!740171 () Bool)

(assert (=> b!799170 m!740171))

(declare-fun m!740173 () Bool)

(assert (=> b!799168 m!740173))

(declare-fun m!740175 () Bool)

(assert (=> start!68658 m!740175))

(declare-fun m!740177 () Bool)

(assert (=> start!68658 m!740177))

(declare-fun m!740179 () Bool)

(assert (=> b!799158 m!740179))

(declare-fun m!740181 () Bool)

(assert (=> b!799158 m!740181))

(declare-fun m!740183 () Bool)

(assert (=> b!799165 m!740183))

(declare-fun m!740185 () Bool)

(assert (=> b!799163 m!740185))

(declare-fun m!740187 () Bool)

(assert (=> b!799167 m!740187))

(push 1)

(assert (not b!799165))

(assert (not start!68658))

(assert (not b!799159))

(assert (not b!799161))

