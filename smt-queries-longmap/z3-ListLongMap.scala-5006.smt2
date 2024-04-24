; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68670 () Bool)

(assert start!68670)

(declare-fun b!797882 () Bool)

(declare-fun e!442731 () Bool)

(declare-fun e!442730 () Bool)

(assert (=> b!797882 (= e!442731 e!442730)))

(declare-fun res!542030 () Bool)

(assert (=> b!797882 (=> (not res!542030) (not e!442730))))

(declare-datatypes ((SeekEntryResult!8290 0))(
  ( (MissingZero!8290 (index!35528 (_ BitVec 32))) (Found!8290 (index!35529 (_ BitVec 32))) (Intermediate!8290 (undefined!9102 Bool) (index!35530 (_ BitVec 32)) (x!66587 (_ BitVec 32))) (Undefined!8290) (MissingVacant!8290 (index!35531 (_ BitVec 32))) )
))
(declare-fun lt!355908 () SeekEntryResult!8290)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((array!43334 0))(
  ( (array!43335 (arr!20743 (Array (_ BitVec 32) (_ BitVec 64))) (size!21163 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43334)

(declare-fun lt!355906 () SeekEntryResult!8290)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797882 (= res!542030 (and (= lt!355906 lt!355908) (= lt!355908 (Found!8290 j!153)) (= (select (arr!20743 a!3170) index!1236) (select (arr!20743 a!3170) j!153))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43334 (_ BitVec 32)) SeekEntryResult!8290)

(assert (=> b!797882 (= lt!355908 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20743 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43334 (_ BitVec 32)) SeekEntryResult!8290)

(assert (=> b!797882 (= lt!355906 (seekEntryOrOpen!0 (select (arr!20743 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797883 () Bool)

(declare-fun res!542027 () Bool)

(declare-fun e!442732 () Bool)

(assert (=> b!797883 (=> (not res!542027) (not e!442732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797883 (= res!542027 (validKeyInArray!0 (select (arr!20743 a!3170) j!153)))))

(declare-fun b!797885 () Bool)

(declare-fun e!442728 () Bool)

(assert (=> b!797885 (= e!442728 e!442731)))

(declare-fun res!542031 () Bool)

(assert (=> b!797885 (=> (not res!542031) (not e!442731))))

(declare-fun lt!355912 () SeekEntryResult!8290)

(declare-fun lt!355907 () SeekEntryResult!8290)

(assert (=> b!797885 (= res!542031 (= lt!355912 lt!355907))))

(declare-fun lt!355911 () (_ BitVec 64))

(declare-fun lt!355910 () array!43334)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!797885 (= lt!355907 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355911 lt!355910 mask!3266))))

(assert (=> b!797885 (= lt!355912 (seekEntryOrOpen!0 lt!355911 lt!355910 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797885 (= lt!355911 (select (store (arr!20743 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797885 (= lt!355910 (array!43335 (store (arr!20743 a!3170) i!1163 k0!2044) (size!21163 a!3170)))))

(declare-fun b!797886 () Bool)

(assert (=> b!797886 (= e!442732 e!442728)))

(declare-fun res!542034 () Bool)

(assert (=> b!797886 (=> (not res!542034) (not e!442728))))

(declare-fun lt!355909 () SeekEntryResult!8290)

(assert (=> b!797886 (= res!542034 (or (= lt!355909 (MissingZero!8290 i!1163)) (= lt!355909 (MissingVacant!8290 i!1163))))))

(assert (=> b!797886 (= lt!355909 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797887 () Bool)

(declare-fun res!542032 () Bool)

(assert (=> b!797887 (=> (not res!542032) (not e!442728))))

(assert (=> b!797887 (= res!542032 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21163 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20743 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21163 a!3170)) (= (select (arr!20743 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797888 () Bool)

(declare-fun res!542028 () Bool)

(assert (=> b!797888 (=> (not res!542028) (not e!442732))))

(assert (=> b!797888 (= res!542028 (and (= (size!21163 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21163 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21163 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797889 () Bool)

(declare-fun res!542037 () Bool)

(assert (=> b!797889 (=> (not res!542037) (not e!442728))))

(declare-datatypes ((List!14613 0))(
  ( (Nil!14610) (Cons!14609 (h!15744 (_ BitVec 64)) (t!20920 List!14613)) )
))
(declare-fun arrayNoDuplicates!0 (array!43334 (_ BitVec 32) List!14613) Bool)

(assert (=> b!797889 (= res!542037 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14610))))

(declare-fun res!542035 () Bool)

(assert (=> start!68670 (=> (not res!542035) (not e!442732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68670 (= res!542035 (validMask!0 mask!3266))))

(assert (=> start!68670 e!442732))

(assert (=> start!68670 true))

(declare-fun array_inv!16602 (array!43334) Bool)

(assert (=> start!68670 (array_inv!16602 a!3170)))

(declare-fun b!797884 () Bool)

(declare-fun res!542033 () Bool)

(assert (=> b!797884 (=> (not res!542033) (not e!442732))))

(assert (=> b!797884 (= res!542033 (validKeyInArray!0 k0!2044))))

(declare-fun b!797890 () Bool)

(assert (=> b!797890 (= e!442730 (not true))))

(assert (=> b!797890 (= lt!355907 (Found!8290 index!1236))))

(declare-fun b!797891 () Bool)

(declare-fun res!542036 () Bool)

(assert (=> b!797891 (=> (not res!542036) (not e!442728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43334 (_ BitVec 32)) Bool)

(assert (=> b!797891 (= res!542036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797892 () Bool)

(declare-fun res!542029 () Bool)

(assert (=> b!797892 (=> (not res!542029) (not e!442732))))

(declare-fun arrayContainsKey!0 (array!43334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797892 (= res!542029 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68670 res!542035) b!797888))

(assert (= (and b!797888 res!542028) b!797883))

(assert (= (and b!797883 res!542027) b!797884))

(assert (= (and b!797884 res!542033) b!797892))

(assert (= (and b!797892 res!542029) b!797886))

(assert (= (and b!797886 res!542034) b!797891))

(assert (= (and b!797891 res!542036) b!797889))

(assert (= (and b!797889 res!542037) b!797887))

(assert (= (and b!797887 res!542032) b!797885))

(assert (= (and b!797885 res!542031) b!797882))

(assert (= (and b!797882 res!542030) b!797890))

(declare-fun m!739157 () Bool)

(assert (=> b!797883 m!739157))

(assert (=> b!797883 m!739157))

(declare-fun m!739159 () Bool)

(assert (=> b!797883 m!739159))

(declare-fun m!739161 () Bool)

(assert (=> b!797887 m!739161))

(declare-fun m!739163 () Bool)

(assert (=> b!797887 m!739163))

(declare-fun m!739165 () Bool)

(assert (=> b!797884 m!739165))

(declare-fun m!739167 () Bool)

(assert (=> b!797889 m!739167))

(declare-fun m!739169 () Bool)

(assert (=> b!797882 m!739169))

(assert (=> b!797882 m!739157))

(assert (=> b!797882 m!739157))

(declare-fun m!739171 () Bool)

(assert (=> b!797882 m!739171))

(assert (=> b!797882 m!739157))

(declare-fun m!739173 () Bool)

(assert (=> b!797882 m!739173))

(declare-fun m!739175 () Bool)

(assert (=> b!797886 m!739175))

(declare-fun m!739177 () Bool)

(assert (=> start!68670 m!739177))

(declare-fun m!739179 () Bool)

(assert (=> start!68670 m!739179))

(declare-fun m!739181 () Bool)

(assert (=> b!797891 m!739181))

(declare-fun m!739183 () Bool)

(assert (=> b!797885 m!739183))

(declare-fun m!739185 () Bool)

(assert (=> b!797885 m!739185))

(declare-fun m!739187 () Bool)

(assert (=> b!797885 m!739187))

(declare-fun m!739189 () Bool)

(assert (=> b!797885 m!739189))

(declare-fun m!739191 () Bool)

(assert (=> b!797892 m!739191))

(check-sat (not b!797886) (not b!797889) (not b!797883) (not start!68670) (not b!797882) (not b!797891) (not b!797892) (not b!797884) (not b!797885))
(check-sat)
