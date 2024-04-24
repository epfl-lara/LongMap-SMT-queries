; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68604 () Bool)

(assert start!68604)

(declare-fun b!796766 () Bool)

(declare-fun e!442208 () Bool)

(declare-fun e!442206 () Bool)

(assert (=> b!796766 (= e!442208 e!442206)))

(declare-fun res!540918 () Bool)

(assert (=> b!796766 (=> (not res!540918) (not e!442206))))

(declare-datatypes ((SeekEntryResult!8257 0))(
  ( (MissingZero!8257 (index!35396 (_ BitVec 32))) (Found!8257 (index!35397 (_ BitVec 32))) (Intermediate!8257 (undefined!9069 Bool) (index!35398 (_ BitVec 32)) (x!66466 (_ BitVec 32))) (Undefined!8257) (MissingVacant!8257 (index!35399 (_ BitVec 32))) )
))
(declare-fun lt!355196 () SeekEntryResult!8257)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355200 () SeekEntryResult!8257)

(declare-datatypes ((array!43268 0))(
  ( (array!43269 (arr!20710 (Array (_ BitVec 32) (_ BitVec 64))) (size!21130 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43268)

(assert (=> b!796766 (= res!540918 (and (= lt!355196 lt!355200) (= lt!355200 (Found!8257 j!153)) (= (select (arr!20710 a!3170) index!1236) (select (arr!20710 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43268 (_ BitVec 32)) SeekEntryResult!8257)

(assert (=> b!796766 (= lt!355200 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20710 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43268 (_ BitVec 32)) SeekEntryResult!8257)

(assert (=> b!796766 (= lt!355196 (seekEntryOrOpen!0 (select (arr!20710 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!540916 () Bool)

(declare-fun e!442207 () Bool)

(assert (=> start!68604 (=> (not res!540916) (not e!442207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68604 (= res!540916 (validMask!0 mask!3266))))

(assert (=> start!68604 e!442207))

(assert (=> start!68604 true))

(declare-fun array_inv!16569 (array!43268) Bool)

(assert (=> start!68604 (array_inv!16569 a!3170)))

(declare-fun b!796767 () Bool)

(declare-fun e!442210 () Bool)

(assert (=> b!796767 (= e!442207 e!442210)))

(declare-fun res!540915 () Bool)

(assert (=> b!796767 (=> (not res!540915) (not e!442210))))

(declare-fun lt!355201 () SeekEntryResult!8257)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796767 (= res!540915 (or (= lt!355201 (MissingZero!8257 i!1163)) (= lt!355201 (MissingVacant!8257 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!796767 (= lt!355201 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796768 () Bool)

(declare-fun res!540917 () Bool)

(assert (=> b!796768 (=> (not res!540917) (not e!442210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43268 (_ BitVec 32)) Bool)

(assert (=> b!796768 (= res!540917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796769 () Bool)

(assert (=> b!796769 (= e!442210 e!442208)))

(declare-fun res!540913 () Bool)

(assert (=> b!796769 (=> (not res!540913) (not e!442208))))

(declare-fun lt!355197 () SeekEntryResult!8257)

(declare-fun lt!355199 () SeekEntryResult!8257)

(assert (=> b!796769 (= res!540913 (= lt!355197 lt!355199))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355195 () array!43268)

(declare-fun lt!355198 () (_ BitVec 64))

(assert (=> b!796769 (= lt!355199 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355198 lt!355195 mask!3266))))

(assert (=> b!796769 (= lt!355197 (seekEntryOrOpen!0 lt!355198 lt!355195 mask!3266))))

(assert (=> b!796769 (= lt!355198 (select (store (arr!20710 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796769 (= lt!355195 (array!43269 (store (arr!20710 a!3170) i!1163 k0!2044) (size!21130 a!3170)))))

(declare-fun b!796770 () Bool)

(declare-fun res!540921 () Bool)

(assert (=> b!796770 (=> (not res!540921) (not e!442210))))

(assert (=> b!796770 (= res!540921 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21130 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20710 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21130 a!3170)) (= (select (arr!20710 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796771 () Bool)

(declare-fun res!540911 () Bool)

(assert (=> b!796771 (=> (not res!540911) (not e!442207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796771 (= res!540911 (validKeyInArray!0 (select (arr!20710 a!3170) j!153)))))

(declare-fun b!796772 () Bool)

(assert (=> b!796772 (= e!442206 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!796772 (= lt!355199 (Found!8257 index!1236))))

(declare-fun b!796773 () Bool)

(declare-fun res!540919 () Bool)

(assert (=> b!796773 (=> (not res!540919) (not e!442207))))

(declare-fun arrayContainsKey!0 (array!43268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796773 (= res!540919 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796774 () Bool)

(declare-fun res!540920 () Bool)

(assert (=> b!796774 (=> (not res!540920) (not e!442207))))

(assert (=> b!796774 (= res!540920 (and (= (size!21130 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21130 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21130 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796775 () Bool)

(declare-fun res!540914 () Bool)

(assert (=> b!796775 (=> (not res!540914) (not e!442210))))

(declare-datatypes ((List!14580 0))(
  ( (Nil!14577) (Cons!14576 (h!15711 (_ BitVec 64)) (t!20887 List!14580)) )
))
(declare-fun arrayNoDuplicates!0 (array!43268 (_ BitVec 32) List!14580) Bool)

(assert (=> b!796775 (= res!540914 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14577))))

(declare-fun b!796776 () Bool)

(declare-fun res!540912 () Bool)

(assert (=> b!796776 (=> (not res!540912) (not e!442207))))

(assert (=> b!796776 (= res!540912 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68604 res!540916) b!796774))

(assert (= (and b!796774 res!540920) b!796771))

(assert (= (and b!796771 res!540911) b!796776))

(assert (= (and b!796776 res!540912) b!796773))

(assert (= (and b!796773 res!540919) b!796767))

(assert (= (and b!796767 res!540915) b!796768))

(assert (= (and b!796768 res!540917) b!796775))

(assert (= (and b!796775 res!540914) b!796770))

(assert (= (and b!796770 res!540921) b!796769))

(assert (= (and b!796769 res!540913) b!796766))

(assert (= (and b!796766 res!540918) b!796772))

(declare-fun m!737951 () Bool)

(assert (=> b!796769 m!737951))

(declare-fun m!737953 () Bool)

(assert (=> b!796769 m!737953))

(declare-fun m!737955 () Bool)

(assert (=> b!796769 m!737955))

(declare-fun m!737957 () Bool)

(assert (=> b!796769 m!737957))

(declare-fun m!737959 () Bool)

(assert (=> start!68604 m!737959))

(declare-fun m!737961 () Bool)

(assert (=> start!68604 m!737961))

(declare-fun m!737963 () Bool)

(assert (=> b!796773 m!737963))

(declare-fun m!737965 () Bool)

(assert (=> b!796767 m!737965))

(declare-fun m!737967 () Bool)

(assert (=> b!796771 m!737967))

(assert (=> b!796771 m!737967))

(declare-fun m!737969 () Bool)

(assert (=> b!796771 m!737969))

(declare-fun m!737971 () Bool)

(assert (=> b!796776 m!737971))

(declare-fun m!737973 () Bool)

(assert (=> b!796775 m!737973))

(declare-fun m!737975 () Bool)

(assert (=> b!796770 m!737975))

(declare-fun m!737977 () Bool)

(assert (=> b!796770 m!737977))

(declare-fun m!737979 () Bool)

(assert (=> b!796766 m!737979))

(assert (=> b!796766 m!737967))

(assert (=> b!796766 m!737967))

(declare-fun m!737981 () Bool)

(assert (=> b!796766 m!737981))

(assert (=> b!796766 m!737967))

(declare-fun m!737983 () Bool)

(assert (=> b!796766 m!737983))

(declare-fun m!737985 () Bool)

(assert (=> b!796768 m!737985))

(check-sat (not b!796776) (not b!796771) (not b!796775) (not b!796767) (not b!796773) (not b!796768) (not b!796769) (not b!796766) (not start!68604))
(check-sat)
