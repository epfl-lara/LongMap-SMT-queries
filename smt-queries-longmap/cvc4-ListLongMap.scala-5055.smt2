; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68844 () Bool)

(assert start!68844)

(declare-fun b!802624 () Bool)

(declare-fun e!444802 () Bool)

(declare-fun e!444806 () Bool)

(assert (=> b!802624 (= e!444802 e!444806)))

(declare-fun res!547145 () Bool)

(assert (=> b!802624 (=> (not res!547145) (not e!444806))))

(declare-datatypes ((SeekEntryResult!8488 0))(
  ( (MissingZero!8488 (index!36320 (_ BitVec 32))) (Found!8488 (index!36321 (_ BitVec 32))) (Intermediate!8488 (undefined!9300 Bool) (index!36322 (_ BitVec 32)) (x!67166 (_ BitVec 32))) (Undefined!8488) (MissingVacant!8488 (index!36323 (_ BitVec 32))) )
))
(declare-fun lt!358994 () SeekEntryResult!8488)

(declare-datatypes ((array!43634 0))(
  ( (array!43635 (arr!20897 (Array (_ BitVec 32) (_ BitVec 64))) (size!21318 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43634)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358993 () SeekEntryResult!8488)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802624 (= res!547145 (and (= lt!358994 lt!358993) (not (= (select (arr!20897 a!3170) index!1236) (select (arr!20897 a!3170) j!153)))))))

(assert (=> b!802624 (= lt!358993 (Found!8488 j!153))))

(declare-fun b!802625 () Bool)

(declare-fun e!444805 () Bool)

(declare-fun e!444804 () Bool)

(assert (=> b!802625 (= e!444805 e!444804)))

(declare-fun res!547144 () Bool)

(assert (=> b!802625 (=> (not res!547144) (not e!444804))))

(declare-fun lt!358985 () SeekEntryResult!8488)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802625 (= res!547144 (or (= lt!358985 (MissingZero!8488 i!1163)) (= lt!358985 (MissingVacant!8488 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43634 (_ BitVec 32)) SeekEntryResult!8488)

(assert (=> b!802625 (= lt!358985 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802626 () Bool)

(declare-fun res!547143 () Bool)

(assert (=> b!802626 (=> (not res!547143) (not e!444805))))

(declare-fun arrayContainsKey!0 (array!43634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802626 (= res!547143 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!547148 () Bool)

(assert (=> start!68844 (=> (not res!547148) (not e!444805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68844 (= res!547148 (validMask!0 mask!3266))))

(assert (=> start!68844 e!444805))

(assert (=> start!68844 true))

(declare-fun array_inv!16693 (array!43634) Bool)

(assert (=> start!68844 (array_inv!16693 a!3170)))

(declare-fun b!802627 () Bool)

(declare-fun res!547154 () Bool)

(assert (=> b!802627 (=> (not res!547154) (not e!444805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802627 (= res!547154 (validKeyInArray!0 k!2044))))

(declare-fun b!802628 () Bool)

(declare-fun res!547149 () Bool)

(assert (=> b!802628 (=> (not res!547149) (not e!444804))))

(declare-datatypes ((List!14860 0))(
  ( (Nil!14857) (Cons!14856 (h!15985 (_ BitVec 64)) (t!21175 List!14860)) )
))
(declare-fun arrayNoDuplicates!0 (array!43634 (_ BitVec 32) List!14860) Bool)

(assert (=> b!802628 (= res!547149 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14857))))

(declare-fun b!802629 () Bool)

(declare-fun res!547147 () Bool)

(assert (=> b!802629 (=> (not res!547147) (not e!444804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43634 (_ BitVec 32)) Bool)

(assert (=> b!802629 (= res!547147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802630 () Bool)

(declare-fun e!444801 () Bool)

(assert (=> b!802630 (= e!444801 e!444802)))

(declare-fun res!547150 () Bool)

(assert (=> b!802630 (=> (not res!547150) (not e!444802))))

(declare-fun lt!358986 () SeekEntryResult!8488)

(assert (=> b!802630 (= res!547150 (= lt!358986 lt!358994))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43634 (_ BitVec 32)) SeekEntryResult!8488)

(assert (=> b!802630 (= lt!358994 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20897 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802630 (= lt!358986 (seekEntryOrOpen!0 (select (arr!20897 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802631 () Bool)

(declare-fun res!547152 () Bool)

(assert (=> b!802631 (=> (not res!547152) (not e!444805))))

(assert (=> b!802631 (= res!547152 (validKeyInArray!0 (select (arr!20897 a!3170) j!153)))))

(declare-fun b!802632 () Bool)

(declare-fun res!547151 () Bool)

(assert (=> b!802632 (=> (not res!547151) (not e!444804))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!802632 (= res!547151 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21318 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20897 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21318 a!3170)) (= (select (arr!20897 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802633 () Bool)

(declare-fun res!547153 () Bool)

(assert (=> b!802633 (=> (not res!547153) (not e!444805))))

(assert (=> b!802633 (= res!547153 (and (= (size!21318 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21318 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21318 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802634 () Bool)

(assert (=> b!802634 (= e!444804 e!444801)))

(declare-fun res!547146 () Bool)

(assert (=> b!802634 (=> (not res!547146) (not e!444801))))

(declare-fun lt!358987 () SeekEntryResult!8488)

(declare-fun lt!358991 () SeekEntryResult!8488)

(assert (=> b!802634 (= res!547146 (= lt!358987 lt!358991))))

(declare-fun lt!358992 () (_ BitVec 64))

(declare-fun lt!358990 () array!43634)

(assert (=> b!802634 (= lt!358991 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358992 lt!358990 mask!3266))))

(assert (=> b!802634 (= lt!358987 (seekEntryOrOpen!0 lt!358992 lt!358990 mask!3266))))

(assert (=> b!802634 (= lt!358992 (select (store (arr!20897 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802634 (= lt!358990 (array!43635 (store (arr!20897 a!3170) i!1163 k!2044) (size!21318 a!3170)))))

(declare-fun b!802635 () Bool)

(assert (=> b!802635 (= e!444806 (not (or (not (= lt!358991 lt!358993)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!358988 () (_ BitVec 32))

(assert (=> b!802635 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358988 vacantAfter!23 lt!358992 lt!358990 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358988 vacantBefore!23 (select (arr!20897 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27516 0))(
  ( (Unit!27517) )
))
(declare-fun lt!358989 () Unit!27516)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43634 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27516)

(assert (=> b!802635 (= lt!358989 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358988 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802635 (= lt!358988 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68844 res!547148) b!802633))

(assert (= (and b!802633 res!547153) b!802631))

(assert (= (and b!802631 res!547152) b!802627))

(assert (= (and b!802627 res!547154) b!802626))

(assert (= (and b!802626 res!547143) b!802625))

(assert (= (and b!802625 res!547144) b!802629))

(assert (= (and b!802629 res!547147) b!802628))

(assert (= (and b!802628 res!547149) b!802632))

(assert (= (and b!802632 res!547151) b!802634))

(assert (= (and b!802634 res!547146) b!802630))

(assert (= (and b!802630 res!547150) b!802624))

(assert (= (and b!802624 res!547145) b!802635))

(declare-fun m!744129 () Bool)

(assert (=> b!802629 m!744129))

(declare-fun m!744131 () Bool)

(assert (=> b!802631 m!744131))

(assert (=> b!802631 m!744131))

(declare-fun m!744133 () Bool)

(assert (=> b!802631 m!744133))

(declare-fun m!744135 () Bool)

(assert (=> b!802624 m!744135))

(assert (=> b!802624 m!744131))

(declare-fun m!744137 () Bool)

(assert (=> b!802628 m!744137))

(declare-fun m!744139 () Bool)

(assert (=> b!802632 m!744139))

(declare-fun m!744141 () Bool)

(assert (=> b!802632 m!744141))

(declare-fun m!744143 () Bool)

(assert (=> b!802634 m!744143))

(declare-fun m!744145 () Bool)

(assert (=> b!802634 m!744145))

(declare-fun m!744147 () Bool)

(assert (=> b!802634 m!744147))

(declare-fun m!744149 () Bool)

(assert (=> b!802634 m!744149))

(assert (=> b!802630 m!744131))

(assert (=> b!802630 m!744131))

(declare-fun m!744151 () Bool)

(assert (=> b!802630 m!744151))

(assert (=> b!802630 m!744131))

(declare-fun m!744153 () Bool)

(assert (=> b!802630 m!744153))

(declare-fun m!744155 () Bool)

(assert (=> b!802625 m!744155))

(declare-fun m!744157 () Bool)

(assert (=> start!68844 m!744157))

(declare-fun m!744159 () Bool)

(assert (=> start!68844 m!744159))

(declare-fun m!744161 () Bool)

(assert (=> b!802627 m!744161))

(assert (=> b!802635 m!744131))

(declare-fun m!744163 () Bool)

(assert (=> b!802635 m!744163))

(assert (=> b!802635 m!744131))

(declare-fun m!744165 () Bool)

(assert (=> b!802635 m!744165))

(declare-fun m!744167 () Bool)

(assert (=> b!802635 m!744167))

(declare-fun m!744169 () Bool)

(assert (=> b!802635 m!744169))

(declare-fun m!744171 () Bool)

(assert (=> b!802626 m!744171))

(push 1)

(assert (not b!802625))

(assert (not b!802631))

(assert (not start!68844))

(assert (not b!802630))

