; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68788 () Bool)

(assert start!68788)

(declare-fun b!801684 () Bool)

(declare-fun e!444367 () Bool)

(assert (=> b!801684 (= e!444367 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358379 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43578 0))(
  ( (array!43579 (arr!20869 (Array (_ BitVec 32) (_ BitVec 64))) (size!21290 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43578)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358374 () array!43578)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!358376 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8460 0))(
  ( (MissingZero!8460 (index!36208 (_ BitVec 32))) (Found!8460 (index!36209 (_ BitVec 32))) (Intermediate!8460 (undefined!9272 Bool) (index!36210 (_ BitVec 32)) (x!67066 (_ BitVec 32))) (Undefined!8460) (MissingVacant!8460 (index!36211 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43578 (_ BitVec 32)) SeekEntryResult!8460)

(assert (=> b!801684 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358376 vacantAfter!23 lt!358379 lt!358374 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358376 vacantBefore!23 (select (arr!20869 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27460 0))(
  ( (Unit!27461) )
))
(declare-fun lt!358375 () Unit!27460)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43578 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27460)

(assert (=> b!801684 (= lt!358375 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358376 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801684 (= lt!358376 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801685 () Bool)

(declare-fun res!546209 () Bool)

(declare-fun e!444368 () Bool)

(assert (=> b!801685 (=> (not res!546209) (not e!444368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801685 (= res!546209 (validKeyInArray!0 k0!2044))))

(declare-fun b!801686 () Bool)

(declare-fun res!546204 () Bool)

(declare-fun e!444365 () Bool)

(assert (=> b!801686 (=> (not res!546204) (not e!444365))))

(declare-datatypes ((List!14832 0))(
  ( (Nil!14829) (Cons!14828 (h!15957 (_ BitVec 64)) (t!21147 List!14832)) )
))
(declare-fun arrayNoDuplicates!0 (array!43578 (_ BitVec 32) List!14832) Bool)

(assert (=> b!801686 (= res!546204 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14829))))

(declare-fun b!801687 () Bool)

(declare-fun res!546210 () Bool)

(assert (=> b!801687 (=> (not res!546210) (not e!444365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43578 (_ BitVec 32)) Bool)

(assert (=> b!801687 (= res!546210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801688 () Bool)

(declare-fun res!546202 () Bool)

(assert (=> b!801688 (=> (not res!546202) (not e!444368))))

(assert (=> b!801688 (= res!546202 (validKeyInArray!0 (select (arr!20869 a!3170) j!153)))))

(declare-fun b!801689 () Bool)

(declare-fun e!444366 () Bool)

(assert (=> b!801689 (= e!444366 e!444367)))

(declare-fun res!546205 () Bool)

(assert (=> b!801689 (=> (not res!546205) (not e!444367))))

(declare-fun lt!358378 () SeekEntryResult!8460)

(declare-fun lt!358373 () SeekEntryResult!8460)

(assert (=> b!801689 (= res!546205 (and (= lt!358373 lt!358378) (= lt!358378 (Found!8460 j!153)) (not (= (select (arr!20869 a!3170) index!1236) (select (arr!20869 a!3170) j!153)))))))

(assert (=> b!801689 (= lt!358378 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20869 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43578 (_ BitVec 32)) SeekEntryResult!8460)

(assert (=> b!801689 (= lt!358373 (seekEntryOrOpen!0 (select (arr!20869 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!546208 () Bool)

(assert (=> start!68788 (=> (not res!546208) (not e!444368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68788 (= res!546208 (validMask!0 mask!3266))))

(assert (=> start!68788 e!444368))

(assert (=> start!68788 true))

(declare-fun array_inv!16665 (array!43578) Bool)

(assert (=> start!68788 (array_inv!16665 a!3170)))

(declare-fun b!801683 () Bool)

(assert (=> b!801683 (= e!444368 e!444365)))

(declare-fun res!546203 () Bool)

(assert (=> b!801683 (=> (not res!546203) (not e!444365))))

(declare-fun lt!358377 () SeekEntryResult!8460)

(assert (=> b!801683 (= res!546203 (or (= lt!358377 (MissingZero!8460 i!1163)) (= lt!358377 (MissingVacant!8460 i!1163))))))

(assert (=> b!801683 (= lt!358377 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801690 () Bool)

(declare-fun res!546211 () Bool)

(assert (=> b!801690 (=> (not res!546211) (not e!444365))))

(assert (=> b!801690 (= res!546211 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21290 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20869 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21290 a!3170)) (= (select (arr!20869 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801691 () Bool)

(assert (=> b!801691 (= e!444365 e!444366)))

(declare-fun res!546206 () Bool)

(assert (=> b!801691 (=> (not res!546206) (not e!444366))))

(assert (=> b!801691 (= res!546206 (= (seekEntryOrOpen!0 lt!358379 lt!358374 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358379 lt!358374 mask!3266)))))

(assert (=> b!801691 (= lt!358379 (select (store (arr!20869 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801691 (= lt!358374 (array!43579 (store (arr!20869 a!3170) i!1163 k0!2044) (size!21290 a!3170)))))

(declare-fun b!801692 () Bool)

(declare-fun res!546207 () Bool)

(assert (=> b!801692 (=> (not res!546207) (not e!444368))))

(assert (=> b!801692 (= res!546207 (and (= (size!21290 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21290 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21290 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801693 () Bool)

(declare-fun res!546212 () Bool)

(assert (=> b!801693 (=> (not res!546212) (not e!444368))))

(declare-fun arrayContainsKey!0 (array!43578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801693 (= res!546212 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68788 res!546208) b!801692))

(assert (= (and b!801692 res!546207) b!801688))

(assert (= (and b!801688 res!546202) b!801685))

(assert (= (and b!801685 res!546209) b!801693))

(assert (= (and b!801693 res!546212) b!801683))

(assert (= (and b!801683 res!546203) b!801687))

(assert (= (and b!801687 res!546210) b!801686))

(assert (= (and b!801686 res!546204) b!801690))

(assert (= (and b!801690 res!546211) b!801691))

(assert (= (and b!801691 res!546206) b!801689))

(assert (= (and b!801689 res!546205) b!801684))

(declare-fun m!742879 () Bool)

(assert (=> b!801684 m!742879))

(declare-fun m!742881 () Bool)

(assert (=> b!801684 m!742881))

(declare-fun m!742883 () Bool)

(assert (=> b!801684 m!742883))

(declare-fun m!742885 () Bool)

(assert (=> b!801684 m!742885))

(declare-fun m!742887 () Bool)

(assert (=> b!801684 m!742887))

(assert (=> b!801684 m!742885))

(declare-fun m!742889 () Bool)

(assert (=> b!801683 m!742889))

(assert (=> b!801688 m!742885))

(assert (=> b!801688 m!742885))

(declare-fun m!742891 () Bool)

(assert (=> b!801688 m!742891))

(declare-fun m!742893 () Bool)

(assert (=> b!801691 m!742893))

(declare-fun m!742895 () Bool)

(assert (=> b!801691 m!742895))

(declare-fun m!742897 () Bool)

(assert (=> b!801691 m!742897))

(declare-fun m!742899 () Bool)

(assert (=> b!801691 m!742899))

(declare-fun m!742901 () Bool)

(assert (=> start!68788 m!742901))

(declare-fun m!742903 () Bool)

(assert (=> start!68788 m!742903))

(declare-fun m!742905 () Bool)

(assert (=> b!801693 m!742905))

(declare-fun m!742907 () Bool)

(assert (=> b!801689 m!742907))

(assert (=> b!801689 m!742885))

(assert (=> b!801689 m!742885))

(declare-fun m!742909 () Bool)

(assert (=> b!801689 m!742909))

(assert (=> b!801689 m!742885))

(declare-fun m!742911 () Bool)

(assert (=> b!801689 m!742911))

(declare-fun m!742913 () Bool)

(assert (=> b!801685 m!742913))

(declare-fun m!742915 () Bool)

(assert (=> b!801690 m!742915))

(declare-fun m!742917 () Bool)

(assert (=> b!801690 m!742917))

(declare-fun m!742919 () Bool)

(assert (=> b!801686 m!742919))

(declare-fun m!742921 () Bool)

(assert (=> b!801687 m!742921))

(check-sat (not b!801683) (not b!801693) (not b!801685) (not b!801686) (not b!801684) (not b!801691) (not b!801687) (not b!801689) (not start!68788) (not b!801688))
(check-sat)
