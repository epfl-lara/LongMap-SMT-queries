; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69396 () Bool)

(assert start!69396)

(declare-fun b!809194 () Bool)

(declare-fun e!447898 () Bool)

(declare-fun e!447895 () Bool)

(assert (=> b!809194 (= e!447898 e!447895)))

(declare-fun res!553068 () Bool)

(assert (=> b!809194 (=> (not res!553068) (not e!447895))))

(declare-datatypes ((SeekEntryResult!8668 0))(
  ( (MissingZero!8668 (index!37040 (_ BitVec 32))) (Found!8668 (index!37041 (_ BitVec 32))) (Intermediate!8668 (undefined!9480 Bool) (index!37042 (_ BitVec 32)) (x!67855 (_ BitVec 32))) (Undefined!8668) (MissingVacant!8668 (index!37043 (_ BitVec 32))) )
))
(declare-fun lt!362513 () SeekEntryResult!8668)

(declare-datatypes ((array!44011 0))(
  ( (array!44012 (arr!21080 (Array (_ BitVec 32) (_ BitVec 64))) (size!21501 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44011)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!362509 () SeekEntryResult!8668)

(assert (=> b!809194 (= res!553068 (and (= lt!362513 lt!362509) (= lt!362509 (Found!8668 j!153)) (not (= (select (arr!21080 a!3170) index!1236) (select (arr!21080 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44011 (_ BitVec 32)) SeekEntryResult!8668)

(assert (=> b!809194 (= lt!362509 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21080 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44011 (_ BitVec 32)) SeekEntryResult!8668)

(assert (=> b!809194 (= lt!362513 (seekEntryOrOpen!0 (select (arr!21080 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809195 () Bool)

(declare-fun res!553069 () Bool)

(declare-fun e!447894 () Bool)

(assert (=> b!809195 (=> (not res!553069) (not e!447894))))

(declare-datatypes ((List!15082 0))(
  ( (Nil!15079) (Cons!15078 (h!16207 (_ BitVec 64)) (t!21388 List!15082)) )
))
(declare-fun arrayNoDuplicates!0 (array!44011 (_ BitVec 32) List!15082) Bool)

(assert (=> b!809195 (= res!553069 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15079))))

(declare-fun b!809196 () Bool)

(declare-fun res!553071 () Bool)

(assert (=> b!809196 (=> (not res!553071) (not e!447894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44011 (_ BitVec 32)) Bool)

(assert (=> b!809196 (= res!553071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809197 () Bool)

(declare-fun res!553066 () Bool)

(declare-fun e!447897 () Bool)

(assert (=> b!809197 (=> (not res!553066) (not e!447897))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809197 (= res!553066 (validKeyInArray!0 k0!2044))))

(declare-fun b!809198 () Bool)

(assert (=> b!809198 (= e!447894 e!447898)))

(declare-fun res!553062 () Bool)

(assert (=> b!809198 (=> (not res!553062) (not e!447898))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362508 () (_ BitVec 64))

(declare-fun lt!362512 () array!44011)

(assert (=> b!809198 (= res!553062 (= (seekEntryOrOpen!0 lt!362508 lt!362512 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362508 lt!362512 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809198 (= lt!362508 (select (store (arr!21080 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809198 (= lt!362512 (array!44012 (store (arr!21080 a!3170) i!1163 k0!2044) (size!21501 a!3170)))))

(declare-fun b!809199 () Bool)

(assert (=> b!809199 (= e!447895 false)))

(declare-fun lt!362511 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809199 (= lt!362511 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!553064 () Bool)

(assert (=> start!69396 (=> (not res!553064) (not e!447897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69396 (= res!553064 (validMask!0 mask!3266))))

(assert (=> start!69396 e!447897))

(assert (=> start!69396 true))

(declare-fun array_inv!16963 (array!44011) Bool)

(assert (=> start!69396 (array_inv!16963 a!3170)))

(declare-fun b!809200 () Bool)

(declare-fun res!553070 () Bool)

(assert (=> b!809200 (=> (not res!553070) (not e!447897))))

(declare-fun arrayContainsKey!0 (array!44011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809200 (= res!553070 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809201 () Bool)

(declare-fun res!553063 () Bool)

(assert (=> b!809201 (=> (not res!553063) (not e!447894))))

(assert (=> b!809201 (= res!553063 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21501 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21080 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21501 a!3170)) (= (select (arr!21080 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809202 () Bool)

(declare-fun res!553065 () Bool)

(assert (=> b!809202 (=> (not res!553065) (not e!447897))))

(assert (=> b!809202 (= res!553065 (validKeyInArray!0 (select (arr!21080 a!3170) j!153)))))

(declare-fun b!809203 () Bool)

(assert (=> b!809203 (= e!447897 e!447894)))

(declare-fun res!553067 () Bool)

(assert (=> b!809203 (=> (not res!553067) (not e!447894))))

(declare-fun lt!362510 () SeekEntryResult!8668)

(assert (=> b!809203 (= res!553067 (or (= lt!362510 (MissingZero!8668 i!1163)) (= lt!362510 (MissingVacant!8668 i!1163))))))

(assert (=> b!809203 (= lt!362510 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809204 () Bool)

(declare-fun res!553061 () Bool)

(assert (=> b!809204 (=> (not res!553061) (not e!447897))))

(assert (=> b!809204 (= res!553061 (and (= (size!21501 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21501 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21501 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69396 res!553064) b!809204))

(assert (= (and b!809204 res!553061) b!809202))

(assert (= (and b!809202 res!553065) b!809197))

(assert (= (and b!809197 res!553066) b!809200))

(assert (= (and b!809200 res!553070) b!809203))

(assert (= (and b!809203 res!553067) b!809196))

(assert (= (and b!809196 res!553071) b!809195))

(assert (= (and b!809195 res!553069) b!809201))

(assert (= (and b!809201 res!553063) b!809198))

(assert (= (and b!809198 res!553062) b!809194))

(assert (= (and b!809194 res!553068) b!809199))

(declare-fun m!750895 () Bool)

(assert (=> b!809199 m!750895))

(declare-fun m!750897 () Bool)

(assert (=> b!809198 m!750897))

(declare-fun m!750899 () Bool)

(assert (=> b!809198 m!750899))

(declare-fun m!750901 () Bool)

(assert (=> b!809198 m!750901))

(declare-fun m!750903 () Bool)

(assert (=> b!809198 m!750903))

(declare-fun m!750905 () Bool)

(assert (=> b!809196 m!750905))

(declare-fun m!750907 () Bool)

(assert (=> b!809195 m!750907))

(declare-fun m!750909 () Bool)

(assert (=> b!809197 m!750909))

(declare-fun m!750911 () Bool)

(assert (=> b!809201 m!750911))

(declare-fun m!750913 () Bool)

(assert (=> b!809201 m!750913))

(declare-fun m!750915 () Bool)

(assert (=> b!809202 m!750915))

(assert (=> b!809202 m!750915))

(declare-fun m!750917 () Bool)

(assert (=> b!809202 m!750917))

(declare-fun m!750919 () Bool)

(assert (=> b!809200 m!750919))

(declare-fun m!750921 () Bool)

(assert (=> b!809203 m!750921))

(declare-fun m!750923 () Bool)

(assert (=> b!809194 m!750923))

(assert (=> b!809194 m!750915))

(assert (=> b!809194 m!750915))

(declare-fun m!750925 () Bool)

(assert (=> b!809194 m!750925))

(assert (=> b!809194 m!750915))

(declare-fun m!750927 () Bool)

(assert (=> b!809194 m!750927))

(declare-fun m!750929 () Bool)

(assert (=> start!69396 m!750929))

(declare-fun m!750931 () Bool)

(assert (=> start!69396 m!750931))

(check-sat (not b!809198) (not b!809195) (not b!809196) (not b!809203) (not b!809199) (not b!809200) (not b!809202) (not b!809194) (not b!809197) (not start!69396))
(check-sat)
