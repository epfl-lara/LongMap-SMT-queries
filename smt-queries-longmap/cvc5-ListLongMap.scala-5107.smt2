; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69248 () Bool)

(assert start!69248)

(declare-fun b!807932 () Bool)

(declare-fun e!447278 () Bool)

(declare-fun e!447275 () Bool)

(assert (=> b!807932 (= e!447278 e!447275)))

(declare-fun res!552057 () Bool)

(assert (=> b!807932 (=> (not res!552057) (not e!447275))))

(declare-fun lt!362001 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43948 0))(
  ( (array!43949 (arr!21051 (Array (_ BitVec 32) (_ BitVec 64))) (size!21472 (_ BitVec 32))) )
))
(declare-fun lt!362003 () array!43948)

(declare-datatypes ((SeekEntryResult!8642 0))(
  ( (MissingZero!8642 (index!36936 (_ BitVec 32))) (Found!8642 (index!36937 (_ BitVec 32))) (Intermediate!8642 (undefined!9454 Bool) (index!36938 (_ BitVec 32)) (x!67742 (_ BitVec 32))) (Undefined!8642) (MissingVacant!8642 (index!36939 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43948 (_ BitVec 32)) SeekEntryResult!8642)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43948 (_ BitVec 32)) SeekEntryResult!8642)

(assert (=> b!807932 (= res!552057 (= (seekEntryOrOpen!0 lt!362001 lt!362003 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362001 lt!362003 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43948)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807932 (= lt!362001 (select (store (arr!21051 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807932 (= lt!362003 (array!43949 (store (arr!21051 a!3170) i!1163 k!2044) (size!21472 a!3170)))))

(declare-fun b!807933 () Bool)

(declare-fun res!552056 () Bool)

(declare-fun e!447277 () Bool)

(assert (=> b!807933 (=> (not res!552056) (not e!447277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807933 (= res!552056 (validKeyInArray!0 k!2044))))

(declare-fun b!807934 () Bool)

(declare-fun res!552064 () Bool)

(assert (=> b!807934 (=> (not res!552064) (not e!447278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43948 (_ BitVec 32)) Bool)

(assert (=> b!807934 (= res!552064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!552059 () Bool)

(assert (=> start!69248 (=> (not res!552059) (not e!447277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69248 (= res!552059 (validMask!0 mask!3266))))

(assert (=> start!69248 e!447277))

(assert (=> start!69248 true))

(declare-fun array_inv!16847 (array!43948) Bool)

(assert (=> start!69248 (array_inv!16847 a!3170)))

(declare-fun b!807935 () Bool)

(declare-fun res!552063 () Bool)

(assert (=> b!807935 (=> (not res!552063) (not e!447278))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807935 (= res!552063 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21472 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21051 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21472 a!3170)) (= (select (arr!21051 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807936 () Bool)

(declare-fun res!552060 () Bool)

(assert (=> b!807936 (=> (not res!552060) (not e!447277))))

(declare-fun arrayContainsKey!0 (array!43948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807936 (= res!552060 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807937 () Bool)

(assert (=> b!807937 (= e!447277 e!447278)))

(declare-fun res!552058 () Bool)

(assert (=> b!807937 (=> (not res!552058) (not e!447278))))

(declare-fun lt!362002 () SeekEntryResult!8642)

(assert (=> b!807937 (= res!552058 (or (= lt!362002 (MissingZero!8642 i!1163)) (= lt!362002 (MissingVacant!8642 i!1163))))))

(assert (=> b!807937 (= lt!362002 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807938 () Bool)

(declare-fun e!447276 () Bool)

(assert (=> b!807938 (= e!447276 false)))

(declare-fun lt!361999 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807938 (= lt!361999 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807939 () Bool)

(declare-fun res!552061 () Bool)

(assert (=> b!807939 (=> (not res!552061) (not e!447277))))

(assert (=> b!807939 (= res!552061 (and (= (size!21472 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21472 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21472 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807940 () Bool)

(assert (=> b!807940 (= e!447275 e!447276)))

(declare-fun res!552065 () Bool)

(assert (=> b!807940 (=> (not res!552065) (not e!447276))))

(declare-fun lt!361998 () SeekEntryResult!8642)

(declare-fun lt!362000 () SeekEntryResult!8642)

(assert (=> b!807940 (= res!552065 (and (= lt!362000 lt!361998) (= lt!361998 (Found!8642 j!153)) (not (= (select (arr!21051 a!3170) index!1236) (select (arr!21051 a!3170) j!153)))))))

(assert (=> b!807940 (= lt!361998 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21051 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807940 (= lt!362000 (seekEntryOrOpen!0 (select (arr!21051 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807941 () Bool)

(declare-fun res!552055 () Bool)

(assert (=> b!807941 (=> (not res!552055) (not e!447278))))

(declare-datatypes ((List!15014 0))(
  ( (Nil!15011) (Cons!15010 (h!16139 (_ BitVec 64)) (t!21329 List!15014)) )
))
(declare-fun arrayNoDuplicates!0 (array!43948 (_ BitVec 32) List!15014) Bool)

(assert (=> b!807941 (= res!552055 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15011))))

(declare-fun b!807942 () Bool)

(declare-fun res!552062 () Bool)

(assert (=> b!807942 (=> (not res!552062) (not e!447277))))

(assert (=> b!807942 (= res!552062 (validKeyInArray!0 (select (arr!21051 a!3170) j!153)))))

(assert (= (and start!69248 res!552059) b!807939))

(assert (= (and b!807939 res!552061) b!807942))

(assert (= (and b!807942 res!552062) b!807933))

(assert (= (and b!807933 res!552056) b!807936))

(assert (= (and b!807936 res!552060) b!807937))

(assert (= (and b!807937 res!552058) b!807934))

(assert (= (and b!807934 res!552064) b!807941))

(assert (= (and b!807941 res!552055) b!807935))

(assert (= (and b!807935 res!552063) b!807932))

(assert (= (and b!807932 res!552057) b!807940))

(assert (= (and b!807940 res!552065) b!807938))

(declare-fun m!750041 () Bool)

(assert (=> b!807940 m!750041))

(declare-fun m!750043 () Bool)

(assert (=> b!807940 m!750043))

(assert (=> b!807940 m!750043))

(declare-fun m!750045 () Bool)

(assert (=> b!807940 m!750045))

(assert (=> b!807940 m!750043))

(declare-fun m!750047 () Bool)

(assert (=> b!807940 m!750047))

(declare-fun m!750049 () Bool)

(assert (=> b!807933 m!750049))

(declare-fun m!750051 () Bool)

(assert (=> b!807937 m!750051))

(declare-fun m!750053 () Bool)

(assert (=> b!807934 m!750053))

(declare-fun m!750055 () Bool)

(assert (=> b!807932 m!750055))

(declare-fun m!750057 () Bool)

(assert (=> b!807932 m!750057))

(declare-fun m!750059 () Bool)

(assert (=> b!807932 m!750059))

(declare-fun m!750061 () Bool)

(assert (=> b!807932 m!750061))

(declare-fun m!750063 () Bool)

(assert (=> b!807936 m!750063))

(declare-fun m!750065 () Bool)

(assert (=> b!807941 m!750065))

(declare-fun m!750067 () Bool)

(assert (=> start!69248 m!750067))

(declare-fun m!750069 () Bool)

(assert (=> start!69248 m!750069))

(declare-fun m!750071 () Bool)

(assert (=> b!807935 m!750071))

(declare-fun m!750073 () Bool)

(assert (=> b!807935 m!750073))

(declare-fun m!750075 () Bool)

(assert (=> b!807938 m!750075))

(assert (=> b!807942 m!750043))

(assert (=> b!807942 m!750043))

(declare-fun m!750077 () Bool)

(assert (=> b!807942 m!750077))

(push 1)

