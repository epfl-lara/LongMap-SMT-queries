; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68990 () Bool)

(assert start!68990)

(declare-fun b!803132 () Bool)

(declare-fun e!445191 () Bool)

(declare-fun e!445192 () Bool)

(assert (=> b!803132 (= e!445191 e!445192)))

(declare-fun res!547109 () Bool)

(assert (=> b!803132 (=> (not res!547109) (not e!445192))))

(declare-datatypes ((SeekEntryResult!8428 0))(
  ( (MissingZero!8428 (index!36080 (_ BitVec 32))) (Found!8428 (index!36081 (_ BitVec 32))) (Intermediate!8428 (undefined!9240 Bool) (index!36082 (_ BitVec 32)) (x!67096 (_ BitVec 32))) (Undefined!8428) (MissingVacant!8428 (index!36083 (_ BitVec 32))) )
))
(declare-fun lt!359091 () SeekEntryResult!8428)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803132 (= res!547109 (or (= lt!359091 (MissingZero!8428 i!1163)) (= lt!359091 (MissingVacant!8428 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43612 0))(
  ( (array!43613 (arr!20881 (Array (_ BitVec 32) (_ BitVec 64))) (size!21301 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43612)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43612 (_ BitVec 32)) SeekEntryResult!8428)

(assert (=> b!803132 (= lt!359091 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803133 () Bool)

(declare-fun e!445193 () Bool)

(assert (=> b!803133 (= e!445192 e!445193)))

(declare-fun res!547103 () Bool)

(assert (=> b!803133 (=> (not res!547103) (not e!445193))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359093 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359088 () array!43612)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43612 (_ BitVec 32)) SeekEntryResult!8428)

(assert (=> b!803133 (= res!547103 (= (seekEntryOrOpen!0 lt!359093 lt!359088 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359093 lt!359088 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803133 (= lt!359093 (select (store (arr!20881 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803133 (= lt!359088 (array!43613 (store (arr!20881 a!3170) i!1163 k0!2044) (size!21301 a!3170)))))

(declare-fun b!803134 () Bool)

(declare-fun res!547106 () Bool)

(assert (=> b!803134 (=> (not res!547106) (not e!445191))))

(assert (=> b!803134 (= res!547106 (and (= (size!21301 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21301 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21301 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803135 () Bool)

(declare-fun res!547113 () Bool)

(assert (=> b!803135 (=> (not res!547113) (not e!445191))))

(declare-fun arrayContainsKey!0 (array!43612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803135 (= res!547113 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!547111 () Bool)

(assert (=> start!68990 (=> (not res!547111) (not e!445191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68990 (= res!547111 (validMask!0 mask!3266))))

(assert (=> start!68990 e!445191))

(assert (=> start!68990 true))

(declare-fun array_inv!16740 (array!43612) Bool)

(assert (=> start!68990 (array_inv!16740 a!3170)))

(declare-fun b!803136 () Bool)

(declare-fun res!547110 () Bool)

(assert (=> b!803136 (=> (not res!547110) (not e!445191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803136 (= res!547110 (validKeyInArray!0 k0!2044))))

(declare-fun b!803137 () Bool)

(declare-fun e!445194 () Bool)

(assert (=> b!803137 (= e!445193 e!445194)))

(declare-fun res!547108 () Bool)

(assert (=> b!803137 (=> (not res!547108) (not e!445194))))

(declare-fun lt!359090 () SeekEntryResult!8428)

(declare-fun lt!359092 () SeekEntryResult!8428)

(assert (=> b!803137 (= res!547108 (and (= lt!359092 lt!359090) (= lt!359090 (Found!8428 j!153)) (not (= (select (arr!20881 a!3170) index!1236) (select (arr!20881 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803137 (= lt!359090 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20881 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803137 (= lt!359092 (seekEntryOrOpen!0 (select (arr!20881 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803138 () Bool)

(declare-fun res!547112 () Bool)

(assert (=> b!803138 (=> (not res!547112) (not e!445192))))

(declare-datatypes ((List!14751 0))(
  ( (Nil!14748) (Cons!14747 (h!15882 (_ BitVec 64)) (t!21058 List!14751)) )
))
(declare-fun arrayNoDuplicates!0 (array!43612 (_ BitVec 32) List!14751) Bool)

(assert (=> b!803138 (= res!547112 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14748))))

(declare-fun b!803139 () Bool)

(declare-fun res!547105 () Bool)

(assert (=> b!803139 (=> (not res!547105) (not e!445192))))

(assert (=> b!803139 (= res!547105 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21301 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20881 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21301 a!3170)) (= (select (arr!20881 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803140 () Bool)

(declare-fun res!547104 () Bool)

(assert (=> b!803140 (=> (not res!547104) (not e!445192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43612 (_ BitVec 32)) Bool)

(assert (=> b!803140 (= res!547104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803141 () Bool)

(declare-fun res!547107 () Bool)

(assert (=> b!803141 (=> (not res!547107) (not e!445191))))

(assert (=> b!803141 (= res!547107 (validKeyInArray!0 (select (arr!20881 a!3170) j!153)))))

(declare-fun b!803142 () Bool)

(assert (=> b!803142 (= e!445194 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20881 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359089 () (_ BitVec 32))

(assert (=> b!803142 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359089 vacantAfter!23 lt!359093 lt!359088 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359089 vacantBefore!23 (select (arr!20881 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27481 0))(
  ( (Unit!27482) )
))
(declare-fun lt!359087 () Unit!27481)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43612 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27481)

(assert (=> b!803142 (= lt!359087 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359089 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803142 (= lt!359089 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (= (and start!68990 res!547111) b!803134))

(assert (= (and b!803134 res!547106) b!803141))

(assert (= (and b!803141 res!547107) b!803136))

(assert (= (and b!803136 res!547110) b!803135))

(assert (= (and b!803135 res!547113) b!803132))

(assert (= (and b!803132 res!547109) b!803140))

(assert (= (and b!803140 res!547104) b!803138))

(assert (= (and b!803138 res!547112) b!803139))

(assert (= (and b!803139 res!547105) b!803133))

(assert (= (and b!803133 res!547103) b!803137))

(assert (= (and b!803137 res!547108) b!803142))

(declare-fun m!744883 () Bool)

(assert (=> b!803135 m!744883))

(declare-fun m!744885 () Bool)

(assert (=> b!803136 m!744885))

(declare-fun m!744887 () Bool)

(assert (=> b!803139 m!744887))

(declare-fun m!744889 () Bool)

(assert (=> b!803139 m!744889))

(declare-fun m!744891 () Bool)

(assert (=> start!68990 m!744891))

(declare-fun m!744893 () Bool)

(assert (=> start!68990 m!744893))

(declare-fun m!744895 () Bool)

(assert (=> b!803141 m!744895))

(assert (=> b!803141 m!744895))

(declare-fun m!744897 () Bool)

(assert (=> b!803141 m!744897))

(declare-fun m!744899 () Bool)

(assert (=> b!803140 m!744899))

(assert (=> b!803142 m!744895))

(declare-fun m!744901 () Bool)

(assert (=> b!803142 m!744901))

(assert (=> b!803142 m!744895))

(declare-fun m!744903 () Bool)

(assert (=> b!803142 m!744903))

(declare-fun m!744905 () Bool)

(assert (=> b!803142 m!744905))

(declare-fun m!744907 () Bool)

(assert (=> b!803142 m!744907))

(declare-fun m!744909 () Bool)

(assert (=> b!803142 m!744909))

(declare-fun m!744911 () Bool)

(assert (=> b!803142 m!744911))

(declare-fun m!744913 () Bool)

(assert (=> b!803137 m!744913))

(assert (=> b!803137 m!744895))

(assert (=> b!803137 m!744895))

(declare-fun m!744915 () Bool)

(assert (=> b!803137 m!744915))

(assert (=> b!803137 m!744895))

(declare-fun m!744917 () Bool)

(assert (=> b!803137 m!744917))

(declare-fun m!744919 () Bool)

(assert (=> b!803132 m!744919))

(declare-fun m!744921 () Bool)

(assert (=> b!803133 m!744921))

(declare-fun m!744923 () Bool)

(assert (=> b!803133 m!744923))

(assert (=> b!803133 m!744911))

(declare-fun m!744925 () Bool)

(assert (=> b!803133 m!744925))

(declare-fun m!744927 () Bool)

(assert (=> b!803138 m!744927))

(check-sat (not b!803137) (not b!803141) (not b!803140) (not b!803133) (not b!803132) (not start!68990) (not b!803136) (not b!803138) (not b!803135) (not b!803142))
(check-sat)
