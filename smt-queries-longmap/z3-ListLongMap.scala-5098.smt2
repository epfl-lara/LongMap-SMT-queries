; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69196 () Bool)

(assert start!69196)

(declare-fun b!807074 () Bool)

(declare-fun res!551203 () Bool)

(declare-fun e!446887 () Bool)

(assert (=> b!807074 (=> (not res!551203) (not e!446887))))

(declare-datatypes ((array!43896 0))(
  ( (array!43897 (arr!21025 (Array (_ BitVec 32) (_ BitVec 64))) (size!21446 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43896)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807074 (= res!551203 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807075 () Bool)

(declare-fun e!446888 () Bool)

(assert (=> b!807075 (= e!446888 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!361531 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807075 (= lt!361531 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807076 () Bool)

(declare-fun res!551205 () Bool)

(assert (=> b!807076 (=> (not res!551205) (not e!446887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807076 (= res!551205 (validKeyInArray!0 k0!2044))))

(declare-fun res!551201 () Bool)

(assert (=> start!69196 (=> (not res!551201) (not e!446887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69196 (= res!551201 (validMask!0 mask!3266))))

(assert (=> start!69196 e!446887))

(assert (=> start!69196 true))

(declare-fun array_inv!16821 (array!43896) Bool)

(assert (=> start!69196 (array_inv!16821 a!3170)))

(declare-fun b!807077 () Bool)

(declare-fun e!446885 () Bool)

(declare-fun e!446886 () Bool)

(assert (=> b!807077 (= e!446885 e!446886)))

(declare-fun res!551206 () Bool)

(assert (=> b!807077 (=> (not res!551206) (not e!446886))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361533 () (_ BitVec 64))

(declare-fun lt!361534 () array!43896)

(declare-datatypes ((SeekEntryResult!8616 0))(
  ( (MissingZero!8616 (index!36832 (_ BitVec 32))) (Found!8616 (index!36833 (_ BitVec 32))) (Intermediate!8616 (undefined!9428 Bool) (index!36834 (_ BitVec 32)) (x!67644 (_ BitVec 32))) (Undefined!8616) (MissingVacant!8616 (index!36835 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43896 (_ BitVec 32)) SeekEntryResult!8616)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43896 (_ BitVec 32)) SeekEntryResult!8616)

(assert (=> b!807077 (= res!551206 (= (seekEntryOrOpen!0 lt!361533 lt!361534 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361533 lt!361534 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807077 (= lt!361533 (select (store (arr!21025 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807077 (= lt!361534 (array!43897 (store (arr!21025 a!3170) i!1163 k0!2044) (size!21446 a!3170)))))

(declare-fun b!807078 () Bool)

(assert (=> b!807078 (= e!446887 e!446885)))

(declare-fun res!551204 () Bool)

(assert (=> b!807078 (=> (not res!551204) (not e!446885))))

(declare-fun lt!361532 () SeekEntryResult!8616)

(assert (=> b!807078 (= res!551204 (or (= lt!361532 (MissingZero!8616 i!1163)) (= lt!361532 (MissingVacant!8616 i!1163))))))

(assert (=> b!807078 (= lt!361532 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807079 () Bool)

(declare-fun res!551198 () Bool)

(assert (=> b!807079 (=> (not res!551198) (not e!446885))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807079 (= res!551198 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21446 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21025 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21446 a!3170)) (= (select (arr!21025 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807080 () Bool)

(declare-fun res!551202 () Bool)

(assert (=> b!807080 (=> (not res!551202) (not e!446885))))

(declare-datatypes ((List!14988 0))(
  ( (Nil!14985) (Cons!14984 (h!16113 (_ BitVec 64)) (t!21303 List!14988)) )
))
(declare-fun arrayNoDuplicates!0 (array!43896 (_ BitVec 32) List!14988) Bool)

(assert (=> b!807080 (= res!551202 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14985))))

(declare-fun b!807081 () Bool)

(declare-fun res!551199 () Bool)

(assert (=> b!807081 (=> (not res!551199) (not e!446885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43896 (_ BitVec 32)) Bool)

(assert (=> b!807081 (= res!551199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807082 () Bool)

(declare-fun res!551207 () Bool)

(assert (=> b!807082 (=> (not res!551207) (not e!446887))))

(assert (=> b!807082 (= res!551207 (validKeyInArray!0 (select (arr!21025 a!3170) j!153)))))

(declare-fun b!807083 () Bool)

(declare-fun res!551197 () Bool)

(assert (=> b!807083 (=> (not res!551197) (not e!446887))))

(assert (=> b!807083 (= res!551197 (and (= (size!21446 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21446 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21446 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807084 () Bool)

(assert (=> b!807084 (= e!446886 e!446888)))

(declare-fun res!551200 () Bool)

(assert (=> b!807084 (=> (not res!551200) (not e!446888))))

(declare-fun lt!361535 () SeekEntryResult!8616)

(declare-fun lt!361530 () SeekEntryResult!8616)

(assert (=> b!807084 (= res!551200 (and (= lt!361530 lt!361535) (= lt!361535 (Found!8616 j!153)) (not (= (select (arr!21025 a!3170) index!1236) (select (arr!21025 a!3170) j!153)))))))

(assert (=> b!807084 (= lt!361535 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21025 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807084 (= lt!361530 (seekEntryOrOpen!0 (select (arr!21025 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69196 res!551201) b!807083))

(assert (= (and b!807083 res!551197) b!807082))

(assert (= (and b!807082 res!551207) b!807076))

(assert (= (and b!807076 res!551205) b!807074))

(assert (= (and b!807074 res!551203) b!807078))

(assert (= (and b!807078 res!551204) b!807081))

(assert (= (and b!807081 res!551199) b!807080))

(assert (= (and b!807080 res!551202) b!807079))

(assert (= (and b!807079 res!551198) b!807077))

(assert (= (and b!807077 res!551206) b!807084))

(assert (= (and b!807084 res!551200) b!807075))

(declare-fun m!749053 () Bool)

(assert (=> start!69196 m!749053))

(declare-fun m!749055 () Bool)

(assert (=> start!69196 m!749055))

(declare-fun m!749057 () Bool)

(assert (=> b!807081 m!749057))

(declare-fun m!749059 () Bool)

(assert (=> b!807074 m!749059))

(declare-fun m!749061 () Bool)

(assert (=> b!807080 m!749061))

(declare-fun m!749063 () Bool)

(assert (=> b!807082 m!749063))

(assert (=> b!807082 m!749063))

(declare-fun m!749065 () Bool)

(assert (=> b!807082 m!749065))

(declare-fun m!749067 () Bool)

(assert (=> b!807075 m!749067))

(declare-fun m!749069 () Bool)

(assert (=> b!807076 m!749069))

(declare-fun m!749071 () Bool)

(assert (=> b!807084 m!749071))

(assert (=> b!807084 m!749063))

(assert (=> b!807084 m!749063))

(declare-fun m!749073 () Bool)

(assert (=> b!807084 m!749073))

(assert (=> b!807084 m!749063))

(declare-fun m!749075 () Bool)

(assert (=> b!807084 m!749075))

(declare-fun m!749077 () Bool)

(assert (=> b!807079 m!749077))

(declare-fun m!749079 () Bool)

(assert (=> b!807079 m!749079))

(declare-fun m!749081 () Bool)

(assert (=> b!807077 m!749081))

(declare-fun m!749083 () Bool)

(assert (=> b!807077 m!749083))

(declare-fun m!749085 () Bool)

(assert (=> b!807077 m!749085))

(declare-fun m!749087 () Bool)

(assert (=> b!807077 m!749087))

(declare-fun m!749089 () Bool)

(assert (=> b!807078 m!749089))

(check-sat (not b!807076) (not b!807084) (not b!807075) (not b!807080) (not b!807078) (not b!807082) (not b!807074) (not b!807077) (not start!69196) (not b!807081))
(check-sat)
