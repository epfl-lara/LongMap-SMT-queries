; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68780 () Bool)

(assert start!68780)

(declare-fun b!801537 () Bool)

(declare-fun res!546062 () Bool)

(declare-fun e!444300 () Bool)

(assert (=> b!801537 (=> (not res!546062) (not e!444300))))

(declare-datatypes ((array!43570 0))(
  ( (array!43571 (arr!20865 (Array (_ BitVec 32) (_ BitVec 64))) (size!21286 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43570)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801537 (= res!546062 (validKeyInArray!0 (select (arr!20865 a!3170) j!153)))))

(declare-fun b!801538 () Bool)

(declare-fun res!546060 () Bool)

(declare-fun e!444297 () Bool)

(assert (=> b!801538 (=> (not res!546060) (not e!444297))))

(declare-datatypes ((SeekEntryResult!8456 0))(
  ( (MissingZero!8456 (index!36192 (_ BitVec 32))) (Found!8456 (index!36193 (_ BitVec 32))) (Intermediate!8456 (undefined!9268 Bool) (index!36194 (_ BitVec 32)) (x!67054 (_ BitVec 32))) (Undefined!8456) (MissingVacant!8456 (index!36195 (_ BitVec 32))) )
))
(declare-fun lt!358284 () SeekEntryResult!8456)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358289 () (_ BitVec 64))

(declare-fun lt!358282 () array!43570)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358286 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43570 (_ BitVec 32)) SeekEntryResult!8456)

(assert (=> b!801538 (= res!546060 (= lt!358284 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358286 vacantAfter!23 lt!358289 lt!358282 mask!3266)))))

(declare-fun b!801539 () Bool)

(declare-fun res!546066 () Bool)

(assert (=> b!801539 (=> (not res!546066) (not e!444300))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!801539 (= res!546066 (validKeyInArray!0 k!2044))))

(declare-fun b!801540 () Bool)

(declare-fun res!546067 () Bool)

(declare-fun e!444298 () Bool)

(assert (=> b!801540 (=> (not res!546067) (not e!444298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43570 (_ BitVec 32)) Bool)

(assert (=> b!801540 (= res!546067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801541 () Bool)

(declare-fun res!546056 () Bool)

(assert (=> b!801541 (=> (not res!546056) (not e!444298))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801541 (= res!546056 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21286 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20865 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21286 a!3170)) (= (select (arr!20865 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801542 () Bool)

(declare-fun res!546064 () Bool)

(assert (=> b!801542 (=> (not res!546064) (not e!444300))))

(assert (=> b!801542 (= res!546064 (and (= (size!21286 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21286 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21286 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801543 () Bool)

(assert (=> b!801543 (= e!444297 false)))

(declare-fun lt!358285 () SeekEntryResult!8456)

(assert (=> b!801543 (= lt!358285 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358286 vacantBefore!23 (select (arr!20865 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801544 () Bool)

(declare-fun e!444299 () Bool)

(assert (=> b!801544 (= e!444298 e!444299)))

(declare-fun res!546058 () Bool)

(assert (=> b!801544 (=> (not res!546058) (not e!444299))))

(assert (=> b!801544 (= res!546058 (= lt!358284 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358289 lt!358282 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43570 (_ BitVec 32)) SeekEntryResult!8456)

(assert (=> b!801544 (= lt!358284 (seekEntryOrOpen!0 lt!358289 lt!358282 mask!3266))))

(assert (=> b!801544 (= lt!358289 (select (store (arr!20865 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801544 (= lt!358282 (array!43571 (store (arr!20865 a!3170) i!1163 k!2044) (size!21286 a!3170)))))

(declare-fun b!801545 () Bool)

(assert (=> b!801545 (= e!444300 e!444298)))

(declare-fun res!546059 () Bool)

(assert (=> b!801545 (=> (not res!546059) (not e!444298))))

(declare-fun lt!358288 () SeekEntryResult!8456)

(assert (=> b!801545 (= res!546059 (or (= lt!358288 (MissingZero!8456 i!1163)) (= lt!358288 (MissingVacant!8456 i!1163))))))

(assert (=> b!801545 (= lt!358288 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801546 () Bool)

(declare-fun res!546063 () Bool)

(assert (=> b!801546 (=> (not res!546063) (not e!444300))))

(declare-fun arrayContainsKey!0 (array!43570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801546 (= res!546063 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801547 () Bool)

(declare-fun e!444302 () Bool)

(assert (=> b!801547 (= e!444299 e!444302)))

(declare-fun res!546057 () Bool)

(assert (=> b!801547 (=> (not res!546057) (not e!444302))))

(declare-fun lt!358283 () SeekEntryResult!8456)

(declare-fun lt!358287 () SeekEntryResult!8456)

(assert (=> b!801547 (= res!546057 (and (= lt!358283 lt!358287) (= lt!358287 (Found!8456 j!153)) (not (= (select (arr!20865 a!3170) index!1236) (select (arr!20865 a!3170) j!153)))))))

(assert (=> b!801547 (= lt!358287 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20865 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801547 (= lt!358283 (seekEntryOrOpen!0 (select (arr!20865 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801548 () Bool)

(declare-fun res!546068 () Bool)

(assert (=> b!801548 (=> (not res!546068) (not e!444298))))

(declare-datatypes ((List!14828 0))(
  ( (Nil!14825) (Cons!14824 (h!15953 (_ BitVec 64)) (t!21143 List!14828)) )
))
(declare-fun arrayNoDuplicates!0 (array!43570 (_ BitVec 32) List!14828) Bool)

(assert (=> b!801548 (= res!546068 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14825))))

(declare-fun b!801549 () Bool)

(assert (=> b!801549 (= e!444302 e!444297)))

(declare-fun res!546061 () Bool)

(assert (=> b!801549 (=> (not res!546061) (not e!444297))))

(assert (=> b!801549 (= res!546061 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358286 #b00000000000000000000000000000000) (bvslt lt!358286 (size!21286 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801549 (= lt!358286 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!546065 () Bool)

(assert (=> start!68780 (=> (not res!546065) (not e!444300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68780 (= res!546065 (validMask!0 mask!3266))))

(assert (=> start!68780 e!444300))

(assert (=> start!68780 true))

(declare-fun array_inv!16661 (array!43570) Bool)

(assert (=> start!68780 (array_inv!16661 a!3170)))

(assert (= (and start!68780 res!546065) b!801542))

(assert (= (and b!801542 res!546064) b!801537))

(assert (= (and b!801537 res!546062) b!801539))

(assert (= (and b!801539 res!546066) b!801546))

(assert (= (and b!801546 res!546063) b!801545))

(assert (= (and b!801545 res!546059) b!801540))

(assert (= (and b!801540 res!546067) b!801548))

(assert (= (and b!801548 res!546068) b!801541))

(assert (= (and b!801541 res!546056) b!801544))

(assert (= (and b!801544 res!546058) b!801547))

(assert (= (and b!801547 res!546057) b!801549))

(assert (= (and b!801549 res!546061) b!801538))

(assert (= (and b!801538 res!546060) b!801543))

(declare-fun m!742709 () Bool)

(assert (=> b!801548 m!742709))

(declare-fun m!742711 () Bool)

(assert (=> b!801545 m!742711))

(declare-fun m!742713 () Bool)

(assert (=> b!801540 m!742713))

(declare-fun m!742715 () Bool)

(assert (=> b!801541 m!742715))

(declare-fun m!742717 () Bool)

(assert (=> b!801541 m!742717))

(declare-fun m!742719 () Bool)

(assert (=> start!68780 m!742719))

(declare-fun m!742721 () Bool)

(assert (=> start!68780 m!742721))

(declare-fun m!742723 () Bool)

(assert (=> b!801546 m!742723))

(declare-fun m!742725 () Bool)

(assert (=> b!801537 m!742725))

(assert (=> b!801537 m!742725))

(declare-fun m!742727 () Bool)

(assert (=> b!801537 m!742727))

(declare-fun m!742729 () Bool)

(assert (=> b!801538 m!742729))

(declare-fun m!742731 () Bool)

(assert (=> b!801549 m!742731))

(declare-fun m!742733 () Bool)

(assert (=> b!801539 m!742733))

(assert (=> b!801543 m!742725))

(assert (=> b!801543 m!742725))

(declare-fun m!742735 () Bool)

(assert (=> b!801543 m!742735))

(declare-fun m!742737 () Bool)

(assert (=> b!801547 m!742737))

(assert (=> b!801547 m!742725))

(assert (=> b!801547 m!742725))

(declare-fun m!742739 () Bool)

(assert (=> b!801547 m!742739))

(assert (=> b!801547 m!742725))

(declare-fun m!742741 () Bool)

(assert (=> b!801547 m!742741))

(declare-fun m!742743 () Bool)

(assert (=> b!801544 m!742743))

(declare-fun m!742745 () Bool)

(assert (=> b!801544 m!742745))

(declare-fun m!742747 () Bool)

(assert (=> b!801544 m!742747))

(declare-fun m!742749 () Bool)

(assert (=> b!801544 m!742749))

(push 1)

