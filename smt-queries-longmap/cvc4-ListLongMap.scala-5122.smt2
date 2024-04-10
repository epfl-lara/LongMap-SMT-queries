; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69558 () Bool)

(assert start!69558)

(declare-fun res!553949 () Bool)

(declare-fun e!448708 () Bool)

(assert (=> start!69558 (=> (not res!553949) (not e!448708))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69558 (= res!553949 (validMask!0 mask!3266))))

(assert (=> start!69558 e!448708))

(assert (=> start!69558 true))

(declare-datatypes ((array!44054 0))(
  ( (array!44055 (arr!21098 (Array (_ BitVec 32) (_ BitVec 64))) (size!21519 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44054)

(declare-fun array_inv!16894 (array!44054) Bool)

(assert (=> start!69558 (array_inv!16894 a!3170)))

(declare-fun b!810662 () Bool)

(declare-fun e!448712 () Bool)

(declare-fun e!448711 () Bool)

(assert (=> b!810662 (= e!448712 e!448711)))

(declare-fun res!553948 () Bool)

(assert (=> b!810662 (=> (not res!553948) (not e!448711))))

(declare-datatypes ((SeekEntryResult!8689 0))(
  ( (MissingZero!8689 (index!37124 (_ BitVec 32))) (Found!8689 (index!37125 (_ BitVec 32))) (Intermediate!8689 (undefined!9501 Bool) (index!37126 (_ BitVec 32)) (x!67933 (_ BitVec 32))) (Undefined!8689) (MissingVacant!8689 (index!37127 (_ BitVec 32))) )
))
(declare-fun lt!363366 () SeekEntryResult!8689)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363365 () SeekEntryResult!8689)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810662 (= res!553948 (and (= lt!363366 lt!363365) (= lt!363365 (Found!8689 j!153)) (not (= (select (arr!21098 a!3170) index!1236) (select (arr!21098 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44054 (_ BitVec 32)) SeekEntryResult!8689)

(assert (=> b!810662 (= lt!363365 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21098 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44054 (_ BitVec 32)) SeekEntryResult!8689)

(assert (=> b!810662 (= lt!363366 (seekEntryOrOpen!0 (select (arr!21098 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810663 () Bool)

(assert (=> b!810663 (= e!448711 (not true))))

(declare-fun lt!363364 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363363 () array!44054)

(declare-fun lt!363362 () (_ BitVec 32))

(assert (=> b!810663 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363362 vacantAfter!23 lt!363364 lt!363363 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363362 vacantBefore!23 (select (arr!21098 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27640 0))(
  ( (Unit!27641) )
))
(declare-fun lt!363368 () Unit!27640)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44054 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27640)

(assert (=> b!810663 (= lt!363368 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363362 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810663 (= lt!363362 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810664 () Bool)

(declare-fun e!448710 () Bool)

(assert (=> b!810664 (= e!448708 e!448710)))

(declare-fun res!553947 () Bool)

(assert (=> b!810664 (=> (not res!553947) (not e!448710))))

(declare-fun lt!363367 () SeekEntryResult!8689)

(assert (=> b!810664 (= res!553947 (or (= lt!363367 (MissingZero!8689 i!1163)) (= lt!363367 (MissingVacant!8689 i!1163))))))

(assert (=> b!810664 (= lt!363367 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810665 () Bool)

(declare-fun res!553946 () Bool)

(assert (=> b!810665 (=> (not res!553946) (not e!448708))))

(declare-fun arrayContainsKey!0 (array!44054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810665 (= res!553946 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810666 () Bool)

(declare-fun res!553940 () Bool)

(assert (=> b!810666 (=> (not res!553940) (not e!448710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44054 (_ BitVec 32)) Bool)

(assert (=> b!810666 (= res!553940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810667 () Bool)

(declare-fun res!553942 () Bool)

(assert (=> b!810667 (=> (not res!553942) (not e!448710))))

(declare-datatypes ((List!15061 0))(
  ( (Nil!15058) (Cons!15057 (h!16186 (_ BitVec 64)) (t!21376 List!15061)) )
))
(declare-fun arrayNoDuplicates!0 (array!44054 (_ BitVec 32) List!15061) Bool)

(assert (=> b!810667 (= res!553942 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15058))))

(declare-fun b!810668 () Bool)

(declare-fun res!553939 () Bool)

(assert (=> b!810668 (=> (not res!553939) (not e!448710))))

(assert (=> b!810668 (= res!553939 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21519 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21098 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21519 a!3170)) (= (select (arr!21098 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810669 () Bool)

(declare-fun res!553944 () Bool)

(assert (=> b!810669 (=> (not res!553944) (not e!448708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810669 (= res!553944 (validKeyInArray!0 k!2044))))

(declare-fun b!810670 () Bool)

(assert (=> b!810670 (= e!448710 e!448712)))

(declare-fun res!553943 () Bool)

(assert (=> b!810670 (=> (not res!553943) (not e!448712))))

(assert (=> b!810670 (= res!553943 (= (seekEntryOrOpen!0 lt!363364 lt!363363 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363364 lt!363363 mask!3266)))))

(assert (=> b!810670 (= lt!363364 (select (store (arr!21098 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810670 (= lt!363363 (array!44055 (store (arr!21098 a!3170) i!1163 k!2044) (size!21519 a!3170)))))

(declare-fun b!810671 () Bool)

(declare-fun res!553945 () Bool)

(assert (=> b!810671 (=> (not res!553945) (not e!448708))))

(assert (=> b!810671 (= res!553945 (and (= (size!21519 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21519 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21519 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810672 () Bool)

(declare-fun res!553941 () Bool)

(assert (=> b!810672 (=> (not res!553941) (not e!448708))))

(assert (=> b!810672 (= res!553941 (validKeyInArray!0 (select (arr!21098 a!3170) j!153)))))

(assert (= (and start!69558 res!553949) b!810671))

(assert (= (and b!810671 res!553945) b!810672))

(assert (= (and b!810672 res!553941) b!810669))

(assert (= (and b!810669 res!553944) b!810665))

(assert (= (and b!810665 res!553946) b!810664))

(assert (= (and b!810664 res!553947) b!810666))

(assert (= (and b!810666 res!553940) b!810667))

(assert (= (and b!810667 res!553942) b!810668))

(assert (= (and b!810668 res!553939) b!810670))

(assert (= (and b!810670 res!553943) b!810662))

(assert (= (and b!810662 res!553948) b!810663))

(declare-fun m!752877 () Bool)

(assert (=> start!69558 m!752877))

(declare-fun m!752879 () Bool)

(assert (=> start!69558 m!752879))

(declare-fun m!752881 () Bool)

(assert (=> b!810669 m!752881))

(declare-fun m!752883 () Bool)

(assert (=> b!810665 m!752883))

(declare-fun m!752885 () Bool)

(assert (=> b!810668 m!752885))

(declare-fun m!752887 () Bool)

(assert (=> b!810668 m!752887))

(declare-fun m!752889 () Bool)

(assert (=> b!810664 m!752889))

(declare-fun m!752891 () Bool)

(assert (=> b!810666 m!752891))

(declare-fun m!752893 () Bool)

(assert (=> b!810663 m!752893))

(assert (=> b!810663 m!752893))

(declare-fun m!752895 () Bool)

(assert (=> b!810663 m!752895))

(declare-fun m!752897 () Bool)

(assert (=> b!810663 m!752897))

(declare-fun m!752899 () Bool)

(assert (=> b!810663 m!752899))

(declare-fun m!752901 () Bool)

(assert (=> b!810663 m!752901))

(declare-fun m!752903 () Bool)

(assert (=> b!810670 m!752903))

(declare-fun m!752905 () Bool)

(assert (=> b!810670 m!752905))

(declare-fun m!752907 () Bool)

(assert (=> b!810670 m!752907))

(declare-fun m!752909 () Bool)

(assert (=> b!810670 m!752909))

(declare-fun m!752911 () Bool)

(assert (=> b!810667 m!752911))

(declare-fun m!752913 () Bool)

(assert (=> b!810662 m!752913))

(assert (=> b!810662 m!752893))

(assert (=> b!810662 m!752893))

(declare-fun m!752915 () Bool)

(assert (=> b!810662 m!752915))

(assert (=> b!810662 m!752893))

(declare-fun m!752917 () Bool)

(assert (=> b!810662 m!752917))

(assert (=> b!810672 m!752893))

(assert (=> b!810672 m!752893))

(declare-fun m!752919 () Bool)

(assert (=> b!810672 m!752919))

(push 1)

