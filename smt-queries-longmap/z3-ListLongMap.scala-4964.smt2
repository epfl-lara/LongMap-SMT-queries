; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68418 () Bool)

(assert start!68418)

(declare-fun b!794024 () Bool)

(declare-fun e!441158 () Bool)

(declare-fun e!441159 () Bool)

(assert (=> b!794024 (= e!441158 e!441159)))

(declare-fun res!538173 () Bool)

(assert (=> b!794024 (=> (not res!538173) (not e!441159))))

(declare-datatypes ((SeekEntryResult!8164 0))(
  ( (MissingZero!8164 (index!35024 (_ BitVec 32))) (Found!8164 (index!35025 (_ BitVec 32))) (Intermediate!8164 (undefined!8976 Bool) (index!35026 (_ BitVec 32)) (x!66125 (_ BitVec 32))) (Undefined!8164) (MissingVacant!8164 (index!35027 (_ BitVec 32))) )
))
(declare-fun lt!353968 () SeekEntryResult!8164)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794024 (= res!538173 (or (= lt!353968 (MissingZero!8164 i!1163)) (= lt!353968 (MissingVacant!8164 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43082 0))(
  ( (array!43083 (arr!20617 (Array (_ BitVec 32) (_ BitVec 64))) (size!21037 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43082)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43082 (_ BitVec 32)) SeekEntryResult!8164)

(assert (=> b!794024 (= lt!353968 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!538176 () Bool)

(assert (=> start!68418 (=> (not res!538176) (not e!441158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68418 (= res!538176 (validMask!0 mask!3266))))

(assert (=> start!68418 e!441158))

(assert (=> start!68418 true))

(declare-fun array_inv!16476 (array!43082) Bool)

(assert (=> start!68418 (array_inv!16476 a!3170)))

(declare-fun b!794025 () Bool)

(declare-fun res!538169 () Bool)

(assert (=> b!794025 (=> (not res!538169) (not e!441159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43082 (_ BitVec 32)) Bool)

(assert (=> b!794025 (= res!538169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794026 () Bool)

(declare-fun res!538171 () Bool)

(assert (=> b!794026 (=> (not res!538171) (not e!441159))))

(declare-datatypes ((List!14487 0))(
  ( (Nil!14484) (Cons!14483 (h!15618 (_ BitVec 64)) (t!20794 List!14487)) )
))
(declare-fun arrayNoDuplicates!0 (array!43082 (_ BitVec 32) List!14487) Bool)

(assert (=> b!794026 (= res!538171 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14484))))

(declare-fun b!794027 () Bool)

(declare-fun res!538170 () Bool)

(assert (=> b!794027 (=> (not res!538170) (not e!441158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794027 (= res!538170 (validKeyInArray!0 k0!2044))))

(declare-fun b!794028 () Bool)

(declare-fun res!538174 () Bool)

(assert (=> b!794028 (=> (not res!538174) (not e!441158))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794028 (= res!538174 (validKeyInArray!0 (select (arr!20617 a!3170) j!153)))))

(declare-fun b!794029 () Bool)

(declare-fun res!538172 () Bool)

(assert (=> b!794029 (=> (not res!538172) (not e!441158))))

(assert (=> b!794029 (= res!538172 (and (= (size!21037 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21037 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21037 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794030 () Bool)

(declare-fun res!538175 () Bool)

(assert (=> b!794030 (=> (not res!538175) (not e!441158))))

(declare-fun arrayContainsKey!0 (array!43082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794030 (= res!538175 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun b!794031 () Bool)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794031 (= e!441159 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21037 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20617 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21037 a!3170)) (= (select (arr!20617 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20617 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!68418 res!538176) b!794029))

(assert (= (and b!794029 res!538172) b!794028))

(assert (= (and b!794028 res!538174) b!794027))

(assert (= (and b!794027 res!538170) b!794030))

(assert (= (and b!794030 res!538175) b!794024))

(assert (= (and b!794024 res!538173) b!794025))

(assert (= (and b!794025 res!538169) b!794026))

(assert (= (and b!794026 res!538171) b!794031))

(declare-fun m!734915 () Bool)

(assert (=> b!794026 m!734915))

(declare-fun m!734917 () Bool)

(assert (=> b!794027 m!734917))

(declare-fun m!734919 () Bool)

(assert (=> b!794024 m!734919))

(declare-fun m!734921 () Bool)

(assert (=> start!68418 m!734921))

(declare-fun m!734923 () Bool)

(assert (=> start!68418 m!734923))

(declare-fun m!734925 () Bool)

(assert (=> b!794025 m!734925))

(declare-fun m!734927 () Bool)

(assert (=> b!794030 m!734927))

(declare-fun m!734929 () Bool)

(assert (=> b!794028 m!734929))

(assert (=> b!794028 m!734929))

(declare-fun m!734931 () Bool)

(assert (=> b!794028 m!734931))

(declare-fun m!734933 () Bool)

(assert (=> b!794031 m!734933))

(declare-fun m!734935 () Bool)

(assert (=> b!794031 m!734935))

(declare-fun m!734937 () Bool)

(assert (=> b!794031 m!734937))

(declare-fun m!734939 () Bool)

(assert (=> b!794031 m!734939))

(check-sat (not b!794025) (not b!794024) (not b!794027) (not b!794026) (not b!794028) (not start!68418) (not b!794030))
(check-sat)
