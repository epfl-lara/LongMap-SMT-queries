; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68754 () Bool)

(assert start!68754)

(declare-fun b!801170 () Bool)

(declare-fun res!545831 () Bool)

(declare-fun e!444094 () Bool)

(assert (=> b!801170 (=> (not res!545831) (not e!444094))))

(declare-fun lt!357976 () (_ BitVec 64))

(declare-datatypes ((array!43561 0))(
  ( (array!43562 (arr!20861 (Array (_ BitVec 32) (_ BitVec 64))) (size!21282 (_ BitVec 32))) )
))
(declare-fun lt!357974 () array!43561)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8449 0))(
  ( (MissingZero!8449 (index!36164 (_ BitVec 32))) (Found!8449 (index!36165 (_ BitVec 32))) (Intermediate!8449 (undefined!9261 Bool) (index!36166 (_ BitVec 32)) (x!67034 (_ BitVec 32))) (Undefined!8449) (MissingVacant!8449 (index!36167 (_ BitVec 32))) )
))
(declare-fun lt!357977 () SeekEntryResult!8449)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357973 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43561 (_ BitVec 32)) SeekEntryResult!8449)

(assert (=> b!801170 (= res!545831 (= lt!357977 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357973 vacantAfter!23 lt!357976 lt!357974 mask!3266)))))

(declare-fun b!801171 () Bool)

(declare-fun res!545839 () Bool)

(declare-fun e!444092 () Bool)

(assert (=> b!801171 (=> (not res!545839) (not e!444092))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43561)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801171 (= res!545839 (and (= (size!21282 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21282 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21282 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801172 () Bool)

(declare-fun res!545832 () Bool)

(declare-fun e!444093 () Bool)

(assert (=> b!801172 (=> (not res!545832) (not e!444093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43561 (_ BitVec 32)) Bool)

(assert (=> b!801172 (= res!545832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801173 () Bool)

(declare-fun e!444091 () Bool)

(assert (=> b!801173 (= e!444093 e!444091)))

(declare-fun res!545838 () Bool)

(assert (=> b!801173 (=> (not res!545838) (not e!444091))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801173 (= res!545838 (= lt!357977 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357976 lt!357974 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43561 (_ BitVec 32)) SeekEntryResult!8449)

(assert (=> b!801173 (= lt!357977 (seekEntryOrOpen!0 lt!357976 lt!357974 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!801173 (= lt!357976 (select (store (arr!20861 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801173 (= lt!357974 (array!43562 (store (arr!20861 a!3170) i!1163 k0!2044) (size!21282 a!3170)))))

(declare-fun b!801174 () Bool)

(declare-fun e!444089 () Bool)

(assert (=> b!801174 (= e!444091 e!444089)))

(declare-fun res!545829 () Bool)

(assert (=> b!801174 (=> (not res!545829) (not e!444089))))

(declare-fun lt!357975 () SeekEntryResult!8449)

(declare-fun lt!357970 () SeekEntryResult!8449)

(assert (=> b!801174 (= res!545829 (and (= lt!357970 lt!357975) (= lt!357975 (Found!8449 j!153)) (not (= (select (arr!20861 a!3170) index!1236) (select (arr!20861 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801174 (= lt!357975 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20861 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801174 (= lt!357970 (seekEntryOrOpen!0 (select (arr!20861 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801175 () Bool)

(assert (=> b!801175 (= e!444089 e!444094)))

(declare-fun res!545837 () Bool)

(assert (=> b!801175 (=> (not res!545837) (not e!444094))))

(assert (=> b!801175 (= res!545837 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357973 #b00000000000000000000000000000000) (bvslt lt!357973 (size!21282 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801175 (= lt!357973 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801176 () Bool)

(assert (=> b!801176 (= e!444094 false)))

(declare-fun lt!357971 () SeekEntryResult!8449)

(assert (=> b!801176 (= lt!357971 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357973 vacantBefore!23 (select (arr!20861 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545840 () Bool)

(assert (=> start!68754 (=> (not res!545840) (not e!444092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68754 (= res!545840 (validMask!0 mask!3266))))

(assert (=> start!68754 e!444092))

(assert (=> start!68754 true))

(declare-fun array_inv!16744 (array!43561) Bool)

(assert (=> start!68754 (array_inv!16744 a!3170)))

(declare-fun b!801177 () Bool)

(declare-fun res!545841 () Bool)

(assert (=> b!801177 (=> (not res!545841) (not e!444092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801177 (= res!545841 (validKeyInArray!0 k0!2044))))

(declare-fun b!801178 () Bool)

(declare-fun res!545833 () Bool)

(assert (=> b!801178 (=> (not res!545833) (not e!444093))))

(declare-datatypes ((List!14863 0))(
  ( (Nil!14860) (Cons!14859 (h!15988 (_ BitVec 64)) (t!21169 List!14863)) )
))
(declare-fun arrayNoDuplicates!0 (array!43561 (_ BitVec 32) List!14863) Bool)

(assert (=> b!801178 (= res!545833 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14860))))

(declare-fun b!801179 () Bool)

(declare-fun res!545836 () Bool)

(assert (=> b!801179 (=> (not res!545836) (not e!444093))))

(assert (=> b!801179 (= res!545836 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21282 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20861 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21282 a!3170)) (= (select (arr!20861 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801180 () Bool)

(declare-fun res!545830 () Bool)

(assert (=> b!801180 (=> (not res!545830) (not e!444092))))

(declare-fun arrayContainsKey!0 (array!43561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801180 (= res!545830 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801181 () Bool)

(declare-fun res!545835 () Bool)

(assert (=> b!801181 (=> (not res!545835) (not e!444092))))

(assert (=> b!801181 (= res!545835 (validKeyInArray!0 (select (arr!20861 a!3170) j!153)))))

(declare-fun b!801182 () Bool)

(assert (=> b!801182 (= e!444092 e!444093)))

(declare-fun res!545834 () Bool)

(assert (=> b!801182 (=> (not res!545834) (not e!444093))))

(declare-fun lt!357972 () SeekEntryResult!8449)

(assert (=> b!801182 (= res!545834 (or (= lt!357972 (MissingZero!8449 i!1163)) (= lt!357972 (MissingVacant!8449 i!1163))))))

(assert (=> b!801182 (= lt!357972 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68754 res!545840) b!801171))

(assert (= (and b!801171 res!545839) b!801181))

(assert (= (and b!801181 res!545835) b!801177))

(assert (= (and b!801177 res!545841) b!801180))

(assert (= (and b!801180 res!545830) b!801182))

(assert (= (and b!801182 res!545834) b!801172))

(assert (= (and b!801172 res!545832) b!801178))

(assert (= (and b!801178 res!545833) b!801179))

(assert (= (and b!801179 res!545836) b!801173))

(assert (= (and b!801173 res!545838) b!801174))

(assert (= (and b!801174 res!545829) b!801175))

(assert (= (and b!801175 res!545837) b!801170))

(assert (= (and b!801170 res!545831) b!801176))

(declare-fun m!741841 () Bool)

(assert (=> b!801181 m!741841))

(assert (=> b!801181 m!741841))

(declare-fun m!741843 () Bool)

(assert (=> b!801181 m!741843))

(declare-fun m!741845 () Bool)

(assert (=> b!801182 m!741845))

(declare-fun m!741847 () Bool)

(assert (=> b!801172 m!741847))

(declare-fun m!741849 () Bool)

(assert (=> b!801170 m!741849))

(declare-fun m!741851 () Bool)

(assert (=> b!801179 m!741851))

(declare-fun m!741853 () Bool)

(assert (=> b!801179 m!741853))

(declare-fun m!741855 () Bool)

(assert (=> b!801180 m!741855))

(declare-fun m!741857 () Bool)

(assert (=> b!801178 m!741857))

(declare-fun m!741859 () Bool)

(assert (=> b!801175 m!741859))

(declare-fun m!741861 () Bool)

(assert (=> start!68754 m!741861))

(declare-fun m!741863 () Bool)

(assert (=> start!68754 m!741863))

(declare-fun m!741865 () Bool)

(assert (=> b!801177 m!741865))

(declare-fun m!741867 () Bool)

(assert (=> b!801174 m!741867))

(assert (=> b!801174 m!741841))

(assert (=> b!801174 m!741841))

(declare-fun m!741869 () Bool)

(assert (=> b!801174 m!741869))

(assert (=> b!801174 m!741841))

(declare-fun m!741871 () Bool)

(assert (=> b!801174 m!741871))

(declare-fun m!741873 () Bool)

(assert (=> b!801173 m!741873))

(declare-fun m!741875 () Bool)

(assert (=> b!801173 m!741875))

(declare-fun m!741877 () Bool)

(assert (=> b!801173 m!741877))

(declare-fun m!741879 () Bool)

(assert (=> b!801173 m!741879))

(assert (=> b!801176 m!741841))

(assert (=> b!801176 m!741841))

(declare-fun m!741881 () Bool)

(assert (=> b!801176 m!741881))

(check-sat (not b!801178) (not b!801176) (not b!801182) (not b!801180) (not b!801174) (not b!801181) (not b!801175) (not b!801173) (not b!801172) (not start!68754) (not b!801177) (not b!801170))
(check-sat)
