; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69666 () Bool)

(assert start!69666)

(declare-fun res!554824 () Bool)

(declare-fun e!449278 () Bool)

(assert (=> start!69666 (=> (not res!554824) (not e!449278))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69666 (= res!554824 (validMask!0 mask!3266))))

(assert (=> start!69666 e!449278))

(assert (=> start!69666 true))

(declare-datatypes ((array!44105 0))(
  ( (array!44106 (arr!21122 (Array (_ BitVec 32) (_ BitVec 64))) (size!21543 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44105)

(declare-fun array_inv!16918 (array!44105) Bool)

(assert (=> start!69666 (array_inv!16918 a!3170)))

(declare-fun b!811777 () Bool)

(declare-fun res!554830 () Bool)

(assert (=> b!811777 (=> (not res!554830) (not e!449278))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811777 (= res!554830 (validKeyInArray!0 (select (arr!21122 a!3170) j!153)))))

(declare-fun b!811778 () Bool)

(declare-fun e!449275 () Bool)

(assert (=> b!811778 (= e!449278 e!449275)))

(declare-fun res!554825 () Bool)

(assert (=> b!811778 (=> (not res!554825) (not e!449275))))

(declare-datatypes ((SeekEntryResult!8713 0))(
  ( (MissingZero!8713 (index!37223 (_ BitVec 32))) (Found!8713 (index!37224 (_ BitVec 32))) (Intermediate!8713 (undefined!9525 Bool) (index!37225 (_ BitVec 32)) (x!68030 (_ BitVec 32))) (Undefined!8713) (MissingVacant!8713 (index!37226 (_ BitVec 32))) )
))
(declare-fun lt!364051 () SeekEntryResult!8713)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811778 (= res!554825 (or (= lt!364051 (MissingZero!8713 i!1163)) (= lt!364051 (MissingVacant!8713 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44105 (_ BitVec 32)) SeekEntryResult!8713)

(assert (=> b!811778 (= lt!364051 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!811779 () Bool)

(declare-fun res!554820 () Bool)

(assert (=> b!811779 (=> (not res!554820) (not e!449275))))

(declare-datatypes ((List!15085 0))(
  ( (Nil!15082) (Cons!15081 (h!16210 (_ BitVec 64)) (t!21400 List!15085)) )
))
(declare-fun arrayNoDuplicates!0 (array!44105 (_ BitVec 32) List!15085) Bool)

(assert (=> b!811779 (= res!554820 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15082))))

(declare-fun b!811780 () Bool)

(declare-fun res!554826 () Bool)

(assert (=> b!811780 (=> (not res!554826) (not e!449278))))

(assert (=> b!811780 (= res!554826 (and (= (size!21543 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21543 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21543 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811781 () Bool)

(declare-fun res!554822 () Bool)

(assert (=> b!811781 (=> (not res!554822) (not e!449275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44105 (_ BitVec 32)) Bool)

(assert (=> b!811781 (= res!554822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun lt!364047 () SeekEntryResult!8713)

(declare-fun lt!364044 () SeekEntryResult!8713)

(declare-fun lt!364050 () SeekEntryResult!8713)

(declare-fun b!811782 () Bool)

(declare-fun e!449276 () Bool)

(assert (=> b!811782 (= e!449276 (not (or (not (= lt!364050 lt!364047)) (= lt!364050 lt!364044))))))

(declare-fun lt!364052 () (_ BitVec 32))

(declare-fun lt!364046 () array!44105)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!364043 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44105 (_ BitVec 32)) SeekEntryResult!8713)

(assert (=> b!811782 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364052 vacantAfter!23 lt!364043 lt!364046 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364052 vacantBefore!23 (select (arr!21122 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27688 0))(
  ( (Unit!27689) )
))
(declare-fun lt!364049 () Unit!27688)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27688)

(assert (=> b!811782 (= lt!364049 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!364052 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811782 (= lt!364052 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811783 () Bool)

(declare-fun res!554831 () Bool)

(assert (=> b!811783 (=> (not res!554831) (not e!449278))))

(declare-fun arrayContainsKey!0 (array!44105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811783 (= res!554831 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811784 () Bool)

(declare-fun e!449277 () Bool)

(assert (=> b!811784 (= e!449277 e!449276)))

(declare-fun res!554827 () Bool)

(assert (=> b!811784 (=> (not res!554827) (not e!449276))))

(assert (=> b!811784 (= res!554827 (and (= lt!364044 lt!364047) (not (= (select (arr!21122 a!3170) index!1236) (select (arr!21122 a!3170) j!153)))))))

(assert (=> b!811784 (= lt!364047 (Found!8713 j!153))))

(declare-fun b!811785 () Bool)

(declare-fun res!554821 () Bool)

(assert (=> b!811785 (=> (not res!554821) (not e!449275))))

(assert (=> b!811785 (= res!554821 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21543 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21122 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21543 a!3170)) (= (select (arr!21122 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811786 () Bool)

(declare-fun e!449279 () Bool)

(assert (=> b!811786 (= e!449275 e!449279)))

(declare-fun res!554829 () Bool)

(assert (=> b!811786 (=> (not res!554829) (not e!449279))))

(declare-fun lt!364045 () SeekEntryResult!8713)

(assert (=> b!811786 (= res!554829 (= lt!364045 lt!364050))))

(assert (=> b!811786 (= lt!364050 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!364043 lt!364046 mask!3266))))

(assert (=> b!811786 (= lt!364045 (seekEntryOrOpen!0 lt!364043 lt!364046 mask!3266))))

(assert (=> b!811786 (= lt!364043 (select (store (arr!21122 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811786 (= lt!364046 (array!44106 (store (arr!21122 a!3170) i!1163 k!2044) (size!21543 a!3170)))))

(declare-fun b!811787 () Bool)

(declare-fun res!554823 () Bool)

(assert (=> b!811787 (=> (not res!554823) (not e!449278))))

(assert (=> b!811787 (= res!554823 (validKeyInArray!0 k!2044))))

(declare-fun b!811788 () Bool)

(assert (=> b!811788 (= e!449279 e!449277)))

(declare-fun res!554828 () Bool)

(assert (=> b!811788 (=> (not res!554828) (not e!449277))))

(declare-fun lt!364048 () SeekEntryResult!8713)

(assert (=> b!811788 (= res!554828 (= lt!364048 lt!364044))))

(assert (=> b!811788 (= lt!364044 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21122 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811788 (= lt!364048 (seekEntryOrOpen!0 (select (arr!21122 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69666 res!554824) b!811780))

(assert (= (and b!811780 res!554826) b!811777))

(assert (= (and b!811777 res!554830) b!811787))

(assert (= (and b!811787 res!554823) b!811783))

(assert (= (and b!811783 res!554831) b!811778))

(assert (= (and b!811778 res!554825) b!811781))

(assert (= (and b!811781 res!554822) b!811779))

(assert (= (and b!811779 res!554820) b!811785))

(assert (= (and b!811785 res!554821) b!811786))

(assert (= (and b!811786 res!554829) b!811788))

(assert (= (and b!811788 res!554828) b!811784))

(assert (= (and b!811784 res!554827) b!811782))

(declare-fun m!754227 () Bool)

(assert (=> b!811778 m!754227))

(declare-fun m!754229 () Bool)

(assert (=> b!811785 m!754229))

(declare-fun m!754231 () Bool)

(assert (=> b!811785 m!754231))

(declare-fun m!754233 () Bool)

(assert (=> b!811777 m!754233))

(assert (=> b!811777 m!754233))

(declare-fun m!754235 () Bool)

(assert (=> b!811777 m!754235))

(declare-fun m!754237 () Bool)

(assert (=> b!811779 m!754237))

(declare-fun m!754239 () Bool)

(assert (=> start!69666 m!754239))

(declare-fun m!754241 () Bool)

(assert (=> start!69666 m!754241))

(declare-fun m!754243 () Bool)

(assert (=> b!811786 m!754243))

(declare-fun m!754245 () Bool)

(assert (=> b!811786 m!754245))

(declare-fun m!754247 () Bool)

(assert (=> b!811786 m!754247))

(declare-fun m!754249 () Bool)

(assert (=> b!811786 m!754249))

(declare-fun m!754251 () Bool)

(assert (=> b!811781 m!754251))

(declare-fun m!754253 () Bool)

(assert (=> b!811784 m!754253))

(assert (=> b!811784 m!754233))

(declare-fun m!754255 () Bool)

(assert (=> b!811787 m!754255))

(assert (=> b!811788 m!754233))

(assert (=> b!811788 m!754233))

(declare-fun m!754257 () Bool)

(assert (=> b!811788 m!754257))

(assert (=> b!811788 m!754233))

(declare-fun m!754259 () Bool)

(assert (=> b!811788 m!754259))

(declare-fun m!754261 () Bool)

(assert (=> b!811783 m!754261))

(declare-fun m!754263 () Bool)

(assert (=> b!811782 m!754263))

(assert (=> b!811782 m!754233))

(declare-fun m!754265 () Bool)

(assert (=> b!811782 m!754265))

(declare-fun m!754267 () Bool)

(assert (=> b!811782 m!754267))

(assert (=> b!811782 m!754233))

(declare-fun m!754269 () Bool)

(assert (=> b!811782 m!754269))

(push 1)

