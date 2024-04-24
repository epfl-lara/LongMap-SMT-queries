; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69716 () Bool)

(assert start!69716)

(declare-fun b!811364 () Bool)

(declare-fun e!449197 () Bool)

(declare-fun e!449191 () Bool)

(assert (=> b!811364 (= e!449197 e!449191)))

(declare-fun res!554098 () Bool)

(assert (=> b!811364 (=> (not res!554098) (not e!449191))))

(declare-datatypes ((array!44044 0))(
  ( (array!44045 (arr!21088 (Array (_ BitVec 32) (_ BitVec 64))) (size!21508 (_ BitVec 32))) )
))
(declare-fun lt!363600 () array!44044)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8635 0))(
  ( (MissingZero!8635 (index!36908 (_ BitVec 32))) (Found!8635 (index!36909 (_ BitVec 32))) (Intermediate!8635 (undefined!9447 Bool) (index!36910 (_ BitVec 32)) (x!67885 (_ BitVec 32))) (Undefined!8635) (MissingVacant!8635 (index!36911 (_ BitVec 32))) )
))
(declare-fun lt!363606 () SeekEntryResult!8635)

(declare-fun lt!363602 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44044 (_ BitVec 32)) SeekEntryResult!8635)

(assert (=> b!811364 (= res!554098 (= lt!363606 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363602 lt!363600 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44044 (_ BitVec 32)) SeekEntryResult!8635)

(assert (=> b!811364 (= lt!363606 (seekEntryOrOpen!0 lt!363602 lt!363600 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!44044)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811364 (= lt!363602 (select (store (arr!21088 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811364 (= lt!363600 (array!44045 (store (arr!21088 a!3170) i!1163 k0!2044) (size!21508 a!3170)))))

(declare-fun b!811365 () Bool)

(declare-fun res!554100 () Bool)

(declare-fun e!449196 () Bool)

(assert (=> b!811365 (=> (not res!554100) (not e!449196))))

(declare-fun arrayContainsKey!0 (array!44044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811365 (= res!554100 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811366 () Bool)

(declare-fun res!554093 () Bool)

(declare-fun e!449192 () Bool)

(assert (=> b!811366 (=> (not res!554093) (not e!449192))))

(declare-fun lt!363604 () (_ BitVec 32))

(assert (=> b!811366 (= res!554093 (= lt!363606 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363604 vacantAfter!23 lt!363602 lt!363600 mask!3266)))))

(declare-fun b!811367 () Bool)

(declare-fun e!449193 () Bool)

(assert (=> b!811367 (= e!449191 e!449193)))

(declare-fun res!554102 () Bool)

(assert (=> b!811367 (=> (not res!554102) (not e!449193))))

(declare-fun lt!363607 () SeekEntryResult!8635)

(declare-fun lt!363608 () SeekEntryResult!8635)

(assert (=> b!811367 (= res!554102 (= lt!363607 lt!363608))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!811367 (= lt!363608 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811367 (= lt!363607 (seekEntryOrOpen!0 (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!363601 () SeekEntryResult!8635)

(declare-fun b!811369 () Bool)

(declare-fun lt!363603 () SeekEntryResult!8635)

(assert (=> b!811369 (= e!449192 (and (= lt!363607 lt!363601) (= lt!363601 lt!363603) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1077)) (bvsub #b01111111111111111111111111111110 x!1077))))))

(assert (=> b!811369 (= lt!363601 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363604 vacantBefore!23 (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811370 () Bool)

(declare-fun res!554097 () Bool)

(assert (=> b!811370 (=> (not res!554097) (not e!449197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44044 (_ BitVec 32)) Bool)

(assert (=> b!811370 (= res!554097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811371 () Bool)

(declare-fun e!449194 () Bool)

(assert (=> b!811371 (= e!449193 e!449194)))

(declare-fun res!554106 () Bool)

(assert (=> b!811371 (=> (not res!554106) (not e!449194))))

(assert (=> b!811371 (= res!554106 (and (= lt!363608 lt!363603) (not (= (select (arr!21088 a!3170) index!1236) (select (arr!21088 a!3170) j!153)))))))

(assert (=> b!811371 (= lt!363603 (Found!8635 j!153))))

(declare-fun res!554099 () Bool)

(assert (=> start!69716 (=> (not res!554099) (not e!449196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69716 (= res!554099 (validMask!0 mask!3266))))

(assert (=> start!69716 e!449196))

(assert (=> start!69716 true))

(declare-fun array_inv!16947 (array!44044) Bool)

(assert (=> start!69716 (array_inv!16947 a!3170)))

(declare-fun b!811368 () Bool)

(declare-fun res!554105 () Bool)

(assert (=> b!811368 (=> (not res!554105) (not e!449197))))

(declare-datatypes ((List!14958 0))(
  ( (Nil!14955) (Cons!14954 (h!16089 (_ BitVec 64)) (t!21265 List!14958)) )
))
(declare-fun arrayNoDuplicates!0 (array!44044 (_ BitVec 32) List!14958) Bool)

(assert (=> b!811368 (= res!554105 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14955))))

(declare-fun b!811372 () Bool)

(assert (=> b!811372 (= e!449194 e!449192)))

(declare-fun res!554095 () Bool)

(assert (=> b!811372 (=> (not res!554095) (not e!449192))))

(assert (=> b!811372 (= res!554095 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363604 #b00000000000000000000000000000000) (bvslt lt!363604 (size!21508 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811372 (= lt!363604 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!811373 () Bool)

(assert (=> b!811373 (= e!449196 e!449197)))

(declare-fun res!554094 () Bool)

(assert (=> b!811373 (=> (not res!554094) (not e!449197))))

(declare-fun lt!363605 () SeekEntryResult!8635)

(assert (=> b!811373 (= res!554094 (or (= lt!363605 (MissingZero!8635 i!1163)) (= lt!363605 (MissingVacant!8635 i!1163))))))

(assert (=> b!811373 (= lt!363605 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811374 () Bool)

(declare-fun res!554103 () Bool)

(assert (=> b!811374 (=> (not res!554103) (not e!449196))))

(assert (=> b!811374 (= res!554103 (and (= (size!21508 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21508 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21508 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811375 () Bool)

(declare-fun res!554096 () Bool)

(assert (=> b!811375 (=> (not res!554096) (not e!449196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811375 (= res!554096 (validKeyInArray!0 k0!2044))))

(declare-fun b!811376 () Bool)

(declare-fun res!554104 () Bool)

(assert (=> b!811376 (=> (not res!554104) (not e!449197))))

(assert (=> b!811376 (= res!554104 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21508 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21088 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21508 a!3170)) (= (select (arr!21088 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811377 () Bool)

(declare-fun res!554101 () Bool)

(assert (=> b!811377 (=> (not res!554101) (not e!449196))))

(assert (=> b!811377 (= res!554101 (validKeyInArray!0 (select (arr!21088 a!3170) j!153)))))

(assert (= (and start!69716 res!554099) b!811374))

(assert (= (and b!811374 res!554103) b!811377))

(assert (= (and b!811377 res!554101) b!811375))

(assert (= (and b!811375 res!554096) b!811365))

(assert (= (and b!811365 res!554100) b!811373))

(assert (= (and b!811373 res!554094) b!811370))

(assert (= (and b!811370 res!554097) b!811368))

(assert (= (and b!811368 res!554105) b!811376))

(assert (= (and b!811376 res!554104) b!811364))

(assert (= (and b!811364 res!554098) b!811367))

(assert (= (and b!811367 res!554102) b!811371))

(assert (= (and b!811371 res!554106) b!811372))

(assert (= (and b!811372 res!554095) b!811366))

(assert (= (and b!811366 res!554093) b!811369))

(declare-fun m!753943 () Bool)

(assert (=> b!811364 m!753943))

(declare-fun m!753945 () Bool)

(assert (=> b!811364 m!753945))

(declare-fun m!753947 () Bool)

(assert (=> b!811364 m!753947))

(declare-fun m!753949 () Bool)

(assert (=> b!811364 m!753949))

(declare-fun m!753951 () Bool)

(assert (=> b!811370 m!753951))

(declare-fun m!753953 () Bool)

(assert (=> b!811366 m!753953))

(declare-fun m!753955 () Bool)

(assert (=> b!811377 m!753955))

(assert (=> b!811377 m!753955))

(declare-fun m!753957 () Bool)

(assert (=> b!811377 m!753957))

(declare-fun m!753959 () Bool)

(assert (=> b!811372 m!753959))

(assert (=> b!811367 m!753955))

(assert (=> b!811367 m!753955))

(declare-fun m!753961 () Bool)

(assert (=> b!811367 m!753961))

(assert (=> b!811367 m!753955))

(declare-fun m!753963 () Bool)

(assert (=> b!811367 m!753963))

(declare-fun m!753965 () Bool)

(assert (=> b!811376 m!753965))

(declare-fun m!753967 () Bool)

(assert (=> b!811376 m!753967))

(declare-fun m!753969 () Bool)

(assert (=> b!811371 m!753969))

(assert (=> b!811371 m!753955))

(declare-fun m!753971 () Bool)

(assert (=> start!69716 m!753971))

(declare-fun m!753973 () Bool)

(assert (=> start!69716 m!753973))

(declare-fun m!753975 () Bool)

(assert (=> b!811375 m!753975))

(assert (=> b!811369 m!753955))

(assert (=> b!811369 m!753955))

(declare-fun m!753977 () Bool)

(assert (=> b!811369 m!753977))

(declare-fun m!753979 () Bool)

(assert (=> b!811368 m!753979))

(declare-fun m!753981 () Bool)

(assert (=> b!811365 m!753981))

(declare-fun m!753983 () Bool)

(assert (=> b!811373 m!753983))

(check-sat (not b!811368) (not b!811367) (not b!811372) (not b!811364) (not b!811365) (not b!811370) (not b!811369) (not b!811373) (not b!811377) (not b!811366) (not b!811375) (not start!69716))
(check-sat)
