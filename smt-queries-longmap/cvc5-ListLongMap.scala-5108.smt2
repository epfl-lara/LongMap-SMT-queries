; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69254 () Bool)

(assert start!69254)

(declare-fun b!808031 () Bool)

(declare-fun e!447321 () Bool)

(declare-fun e!447320 () Bool)

(assert (=> b!808031 (= e!447321 e!447320)))

(declare-fun res!552161 () Bool)

(assert (=> b!808031 (=> (not res!552161) (not e!447320))))

(declare-datatypes ((SeekEntryResult!8645 0))(
  ( (MissingZero!8645 (index!36948 (_ BitVec 32))) (Found!8645 (index!36949 (_ BitVec 32))) (Intermediate!8645 (undefined!9457 Bool) (index!36950 (_ BitVec 32)) (x!67753 (_ BitVec 32))) (Undefined!8645) (MissingVacant!8645 (index!36951 (_ BitVec 32))) )
))
(declare-fun lt!362055 () SeekEntryResult!8645)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!362054 () SeekEntryResult!8645)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43954 0))(
  ( (array!43955 (arr!21054 (Array (_ BitVec 32) (_ BitVec 64))) (size!21475 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43954)

(assert (=> b!808031 (= res!552161 (and (= lt!362055 lt!362054) (= lt!362054 (Found!8645 j!153)) (not (= (select (arr!21054 a!3170) index!1236) (select (arr!21054 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43954 (_ BitVec 32)) SeekEntryResult!8645)

(assert (=> b!808031 (= lt!362054 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21054 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43954 (_ BitVec 32)) SeekEntryResult!8645)

(assert (=> b!808031 (= lt!362055 (seekEntryOrOpen!0 (select (arr!21054 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808032 () Bool)

(declare-fun res!552162 () Bool)

(declare-fun e!447323 () Bool)

(assert (=> b!808032 (=> (not res!552162) (not e!447323))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808032 (= res!552162 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21475 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21054 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21475 a!3170)) (= (select (arr!21054 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808033 () Bool)

(declare-fun res!552154 () Bool)

(declare-fun e!447322 () Bool)

(assert (=> b!808033 (=> (not res!552154) (not e!447322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808033 (= res!552154 (validKeyInArray!0 (select (arr!21054 a!3170) j!153)))))

(declare-fun b!808034 () Bool)

(declare-fun res!552155 () Bool)

(assert (=> b!808034 (=> (not res!552155) (not e!447323))))

(declare-datatypes ((List!15017 0))(
  ( (Nil!15014) (Cons!15013 (h!16142 (_ BitVec 64)) (t!21332 List!15017)) )
))
(declare-fun arrayNoDuplicates!0 (array!43954 (_ BitVec 32) List!15017) Bool)

(assert (=> b!808034 (= res!552155 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15014))))

(declare-fun b!808035 () Bool)

(declare-fun res!552160 () Bool)

(assert (=> b!808035 (=> (not res!552160) (not e!447322))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!808035 (= res!552160 (validKeyInArray!0 k!2044))))

(declare-fun b!808036 () Bool)

(declare-fun res!552163 () Bool)

(assert (=> b!808036 (=> (not res!552163) (not e!447322))))

(assert (=> b!808036 (= res!552163 (and (= (size!21475 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21475 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21475 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808037 () Bool)

(declare-fun res!552164 () Bool)

(assert (=> b!808037 (=> (not res!552164) (not e!447322))))

(declare-fun arrayContainsKey!0 (array!43954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808037 (= res!552164 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808038 () Bool)

(assert (=> b!808038 (= e!447323 e!447321)))

(declare-fun res!552158 () Bool)

(assert (=> b!808038 (=> (not res!552158) (not e!447321))))

(declare-fun lt!362056 () (_ BitVec 64))

(declare-fun lt!362052 () array!43954)

(assert (=> b!808038 (= res!552158 (= (seekEntryOrOpen!0 lt!362056 lt!362052 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362056 lt!362052 mask!3266)))))

(assert (=> b!808038 (= lt!362056 (select (store (arr!21054 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808038 (= lt!362052 (array!43955 (store (arr!21054 a!3170) i!1163 k!2044) (size!21475 a!3170)))))

(declare-fun res!552156 () Bool)

(assert (=> start!69254 (=> (not res!552156) (not e!447322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69254 (= res!552156 (validMask!0 mask!3266))))

(assert (=> start!69254 e!447322))

(assert (=> start!69254 true))

(declare-fun array_inv!16850 (array!43954) Bool)

(assert (=> start!69254 (array_inv!16850 a!3170)))

(declare-fun b!808039 () Bool)

(assert (=> b!808039 (= e!447320 false)))

(declare-fun lt!362053 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808039 (= lt!362053 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808040 () Bool)

(assert (=> b!808040 (= e!447322 e!447323)))

(declare-fun res!552157 () Bool)

(assert (=> b!808040 (=> (not res!552157) (not e!447323))))

(declare-fun lt!362057 () SeekEntryResult!8645)

(assert (=> b!808040 (= res!552157 (or (= lt!362057 (MissingZero!8645 i!1163)) (= lt!362057 (MissingVacant!8645 i!1163))))))

(assert (=> b!808040 (= lt!362057 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808041 () Bool)

(declare-fun res!552159 () Bool)

(assert (=> b!808041 (=> (not res!552159) (not e!447323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43954 (_ BitVec 32)) Bool)

(assert (=> b!808041 (= res!552159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69254 res!552156) b!808036))

(assert (= (and b!808036 res!552163) b!808033))

(assert (= (and b!808033 res!552154) b!808035))

(assert (= (and b!808035 res!552160) b!808037))

(assert (= (and b!808037 res!552164) b!808040))

(assert (= (and b!808040 res!552157) b!808041))

(assert (= (and b!808041 res!552159) b!808034))

(assert (= (and b!808034 res!552155) b!808032))

(assert (= (and b!808032 res!552162) b!808038))

(assert (= (and b!808038 res!552158) b!808031))

(assert (= (and b!808031 res!552161) b!808039))

(declare-fun m!750155 () Bool)

(assert (=> b!808041 m!750155))

(declare-fun m!750157 () Bool)

(assert (=> b!808037 m!750157))

(declare-fun m!750159 () Bool)

(assert (=> b!808031 m!750159))

(declare-fun m!750161 () Bool)

(assert (=> b!808031 m!750161))

(assert (=> b!808031 m!750161))

(declare-fun m!750163 () Bool)

(assert (=> b!808031 m!750163))

(assert (=> b!808031 m!750161))

(declare-fun m!750165 () Bool)

(assert (=> b!808031 m!750165))

(declare-fun m!750167 () Bool)

(assert (=> b!808039 m!750167))

(declare-fun m!750169 () Bool)

(assert (=> start!69254 m!750169))

(declare-fun m!750171 () Bool)

(assert (=> start!69254 m!750171))

(declare-fun m!750173 () Bool)

(assert (=> b!808035 m!750173))

(declare-fun m!750175 () Bool)

(assert (=> b!808032 m!750175))

(declare-fun m!750177 () Bool)

(assert (=> b!808032 m!750177))

(assert (=> b!808033 m!750161))

(assert (=> b!808033 m!750161))

(declare-fun m!750179 () Bool)

(assert (=> b!808033 m!750179))

(declare-fun m!750181 () Bool)

(assert (=> b!808034 m!750181))

(declare-fun m!750183 () Bool)

(assert (=> b!808038 m!750183))

(declare-fun m!750185 () Bool)

(assert (=> b!808038 m!750185))

(declare-fun m!750187 () Bool)

(assert (=> b!808038 m!750187))

(declare-fun m!750189 () Bool)

(assert (=> b!808038 m!750189))

(declare-fun m!750191 () Bool)

(assert (=> b!808040 m!750191))

(push 1)

