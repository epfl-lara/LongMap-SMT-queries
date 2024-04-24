; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69398 () Bool)

(assert start!69398)

(declare-fun b!808523 () Bool)

(declare-fun res!552108 () Bool)

(declare-fun e!447712 () Bool)

(assert (=> b!808523 (=> (not res!552108) (not e!447712))))

(declare-datatypes ((array!43930 0))(
  ( (array!43931 (arr!21037 (Array (_ BitVec 32) (_ BitVec 64))) (size!21457 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43930)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808523 (= res!552108 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808524 () Bool)

(declare-fun e!447715 () Bool)

(declare-fun e!447714 () Bool)

(assert (=> b!808524 (= e!447715 e!447714)))

(declare-fun res!552107 () Bool)

(assert (=> b!808524 (=> (not res!552107) (not e!447714))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362196 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!362193 () array!43930)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8584 0))(
  ( (MissingZero!8584 (index!36704 (_ BitVec 32))) (Found!8584 (index!36705 (_ BitVec 32))) (Intermediate!8584 (undefined!9396 Bool) (index!36706 (_ BitVec 32)) (x!67674 (_ BitVec 32))) (Undefined!8584) (MissingVacant!8584 (index!36707 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43930 (_ BitVec 32)) SeekEntryResult!8584)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43930 (_ BitVec 32)) SeekEntryResult!8584)

(assert (=> b!808524 (= res!552107 (= (seekEntryOrOpen!0 lt!362196 lt!362193 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362196 lt!362193 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808524 (= lt!362196 (select (store (arr!21037 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808524 (= lt!362193 (array!43931 (store (arr!21037 a!3170) i!1163 k0!2044) (size!21457 a!3170)))))

(declare-fun b!808525 () Bool)

(declare-fun res!552105 () Bool)

(assert (=> b!808525 (=> (not res!552105) (not e!447715))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808525 (= res!552105 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21457 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21037 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21457 a!3170)) (= (select (arr!21037 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808526 () Bool)

(declare-fun res!552104 () Bool)

(assert (=> b!808526 (=> (not res!552104) (not e!447715))))

(declare-datatypes ((List!14907 0))(
  ( (Nil!14904) (Cons!14903 (h!16038 (_ BitVec 64)) (t!21214 List!14907)) )
))
(declare-fun arrayNoDuplicates!0 (array!43930 (_ BitVec 32) List!14907) Bool)

(assert (=> b!808526 (= res!552104 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14904))))

(declare-fun b!808527 () Bool)

(declare-fun e!447713 () Bool)

(assert (=> b!808527 (= e!447714 e!447713)))

(declare-fun res!552098 () Bool)

(assert (=> b!808527 (=> (not res!552098) (not e!447713))))

(declare-fun lt!362194 () SeekEntryResult!8584)

(declare-fun lt!362197 () SeekEntryResult!8584)

(assert (=> b!808527 (= res!552098 (and (= lt!362194 lt!362197) (= lt!362197 (Found!8584 j!153)) (not (= (select (arr!21037 a!3170) index!1236) (select (arr!21037 a!3170) j!153)))))))

(assert (=> b!808527 (= lt!362197 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21037 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808527 (= lt!362194 (seekEntryOrOpen!0 (select (arr!21037 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808528 () Bool)

(declare-fun res!552099 () Bool)

(assert (=> b!808528 (=> (not res!552099) (not e!447712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808528 (= res!552099 (validKeyInArray!0 (select (arr!21037 a!3170) j!153)))))

(declare-fun res!552103 () Bool)

(assert (=> start!69398 (=> (not res!552103) (not e!447712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69398 (= res!552103 (validMask!0 mask!3266))))

(assert (=> start!69398 e!447712))

(assert (=> start!69398 true))

(declare-fun array_inv!16896 (array!43930) Bool)

(assert (=> start!69398 (array_inv!16896 a!3170)))

(declare-fun b!808529 () Bool)

(assert (=> b!808529 (= e!447712 e!447715)))

(declare-fun res!552100 () Bool)

(assert (=> b!808529 (=> (not res!552100) (not e!447715))))

(declare-fun lt!362195 () SeekEntryResult!8584)

(assert (=> b!808529 (= res!552100 (or (= lt!362195 (MissingZero!8584 i!1163)) (= lt!362195 (MissingVacant!8584 i!1163))))))

(assert (=> b!808529 (= lt!362195 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808530 () Bool)

(declare-fun res!552106 () Bool)

(assert (=> b!808530 (=> (not res!552106) (not e!447712))))

(assert (=> b!808530 (= res!552106 (validKeyInArray!0 k0!2044))))

(declare-fun b!808531 () Bool)

(declare-fun res!552101 () Bool)

(assert (=> b!808531 (=> (not res!552101) (not e!447712))))

(assert (=> b!808531 (= res!552101 (and (= (size!21457 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21457 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21457 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808532 () Bool)

(declare-fun res!552102 () Bool)

(assert (=> b!808532 (=> (not res!552102) (not e!447715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43930 (_ BitVec 32)) Bool)

(assert (=> b!808532 (= res!552102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808533 () Bool)

(assert (=> b!808533 (= e!447713 false)))

(declare-fun lt!362198 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808533 (= lt!362198 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (= (and start!69398 res!552103) b!808531))

(assert (= (and b!808531 res!552101) b!808528))

(assert (= (and b!808528 res!552099) b!808530))

(assert (= (and b!808530 res!552106) b!808523))

(assert (= (and b!808523 res!552108) b!808529))

(assert (= (and b!808529 res!552100) b!808532))

(assert (= (and b!808532 res!552102) b!808526))

(assert (= (and b!808526 res!552104) b!808525))

(assert (= (and b!808525 res!552105) b!808524))

(assert (= (and b!808524 res!552107) b!808527))

(assert (= (and b!808527 res!552098) b!808533))

(declare-fun m!750955 () Bool)

(assert (=> start!69398 m!750955))

(declare-fun m!750957 () Bool)

(assert (=> start!69398 m!750957))

(declare-fun m!750959 () Bool)

(assert (=> b!808523 m!750959))

(declare-fun m!750961 () Bool)

(assert (=> b!808524 m!750961))

(declare-fun m!750963 () Bool)

(assert (=> b!808524 m!750963))

(declare-fun m!750965 () Bool)

(assert (=> b!808524 m!750965))

(declare-fun m!750967 () Bool)

(assert (=> b!808524 m!750967))

(declare-fun m!750969 () Bool)

(assert (=> b!808530 m!750969))

(declare-fun m!750971 () Bool)

(assert (=> b!808528 m!750971))

(assert (=> b!808528 m!750971))

(declare-fun m!750973 () Bool)

(assert (=> b!808528 m!750973))

(declare-fun m!750975 () Bool)

(assert (=> b!808526 m!750975))

(declare-fun m!750977 () Bool)

(assert (=> b!808527 m!750977))

(assert (=> b!808527 m!750971))

(assert (=> b!808527 m!750971))

(declare-fun m!750979 () Bool)

(assert (=> b!808527 m!750979))

(assert (=> b!808527 m!750971))

(declare-fun m!750981 () Bool)

(assert (=> b!808527 m!750981))

(declare-fun m!750983 () Bool)

(assert (=> b!808529 m!750983))

(declare-fun m!750985 () Bool)

(assert (=> b!808525 m!750985))

(declare-fun m!750987 () Bool)

(assert (=> b!808525 m!750987))

(declare-fun m!750989 () Bool)

(assert (=> b!808532 m!750989))

(declare-fun m!750991 () Bool)

(assert (=> b!808533 m!750991))

(check-sat (not b!808527) (not b!808524) (not b!808530) (not b!808529) (not b!808528) (not b!808526) (not b!808523) (not b!808532) (not start!69398) (not b!808533))
(check-sat)
