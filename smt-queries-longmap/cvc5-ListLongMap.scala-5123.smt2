; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69560 () Bool)

(assert start!69560)

(declare-fun b!810695 () Bool)

(declare-fun res!553982 () Bool)

(declare-fun e!448725 () Bool)

(assert (=> b!810695 (=> (not res!553982) (not e!448725))))

(declare-datatypes ((array!44056 0))(
  ( (array!44057 (arr!21099 (Array (_ BitVec 32) (_ BitVec 64))) (size!21520 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44056)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44056 (_ BitVec 32)) Bool)

(assert (=> b!810695 (= res!553982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810696 () Bool)

(declare-fun res!553978 () Bool)

(declare-fun e!448724 () Bool)

(assert (=> b!810696 (=> (not res!553978) (not e!448724))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810696 (= res!553978 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810697 () Bool)

(declare-fun res!553979 () Bool)

(assert (=> b!810697 (=> (not res!553979) (not e!448724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810697 (= res!553979 (validKeyInArray!0 k!2044))))

(declare-fun b!810698 () Bool)

(declare-fun e!448726 () Bool)

(assert (=> b!810698 (= e!448725 e!448726)))

(declare-fun res!553977 () Bool)

(assert (=> b!810698 (=> (not res!553977) (not e!448726))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363387 () array!44056)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363388 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8690 0))(
  ( (MissingZero!8690 (index!37128 (_ BitVec 32))) (Found!8690 (index!37129 (_ BitVec 32))) (Intermediate!8690 (undefined!9502 Bool) (index!37130 (_ BitVec 32)) (x!67942 (_ BitVec 32))) (Undefined!8690) (MissingVacant!8690 (index!37131 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44056 (_ BitVec 32)) SeekEntryResult!8690)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44056 (_ BitVec 32)) SeekEntryResult!8690)

(assert (=> b!810698 (= res!553977 (= (seekEntryOrOpen!0 lt!363388 lt!363387 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363388 lt!363387 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810698 (= lt!363388 (select (store (arr!21099 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810698 (= lt!363387 (array!44057 (store (arr!21099 a!3170) i!1163 k!2044) (size!21520 a!3170)))))

(declare-fun b!810699 () Bool)

(declare-fun res!553974 () Bool)

(assert (=> b!810699 (=> (not res!553974) (not e!448724))))

(assert (=> b!810699 (= res!553974 (validKeyInArray!0 (select (arr!21099 a!3170) j!153)))))

(declare-fun b!810700 () Bool)

(declare-fun res!553980 () Bool)

(assert (=> b!810700 (=> (not res!553980) (not e!448725))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810700 (= res!553980 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21520 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21099 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21520 a!3170)) (= (select (arr!21099 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810701 () Bool)

(declare-fun e!448727 () Bool)

(assert (=> b!810701 (= e!448727 (not true))))

(declare-fun lt!363383 () (_ BitVec 32))

(assert (=> b!810701 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363383 vacantAfter!23 lt!363388 lt!363387 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363383 vacantBefore!23 (select (arr!21099 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27642 0))(
  ( (Unit!27643) )
))
(declare-fun lt!363385 () Unit!27642)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44056 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27642)

(assert (=> b!810701 (= lt!363385 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363383 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810701 (= lt!363383 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810702 () Bool)

(declare-fun res!553973 () Bool)

(assert (=> b!810702 (=> (not res!553973) (not e!448724))))

(assert (=> b!810702 (= res!553973 (and (= (size!21520 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21520 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21520 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810703 () Bool)

(assert (=> b!810703 (= e!448724 e!448725)))

(declare-fun res!553981 () Bool)

(assert (=> b!810703 (=> (not res!553981) (not e!448725))))

(declare-fun lt!363386 () SeekEntryResult!8690)

(assert (=> b!810703 (= res!553981 (or (= lt!363386 (MissingZero!8690 i!1163)) (= lt!363386 (MissingVacant!8690 i!1163))))))

(assert (=> b!810703 (= lt!363386 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!553972 () Bool)

(assert (=> start!69560 (=> (not res!553972) (not e!448724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69560 (= res!553972 (validMask!0 mask!3266))))

(assert (=> start!69560 e!448724))

(assert (=> start!69560 true))

(declare-fun array_inv!16895 (array!44056) Bool)

(assert (=> start!69560 (array_inv!16895 a!3170)))

(declare-fun b!810704 () Bool)

(declare-fun res!553975 () Bool)

(assert (=> b!810704 (=> (not res!553975) (not e!448725))))

(declare-datatypes ((List!15062 0))(
  ( (Nil!15059) (Cons!15058 (h!16187 (_ BitVec 64)) (t!21377 List!15062)) )
))
(declare-fun arrayNoDuplicates!0 (array!44056 (_ BitVec 32) List!15062) Bool)

(assert (=> b!810704 (= res!553975 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15059))))

(declare-fun b!810705 () Bool)

(assert (=> b!810705 (= e!448726 e!448727)))

(declare-fun res!553976 () Bool)

(assert (=> b!810705 (=> (not res!553976) (not e!448727))))

(declare-fun lt!363384 () SeekEntryResult!8690)

(declare-fun lt!363389 () SeekEntryResult!8690)

(assert (=> b!810705 (= res!553976 (and (= lt!363384 lt!363389) (= lt!363389 (Found!8690 j!153)) (not (= (select (arr!21099 a!3170) index!1236) (select (arr!21099 a!3170) j!153)))))))

(assert (=> b!810705 (= lt!363389 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21099 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810705 (= lt!363384 (seekEntryOrOpen!0 (select (arr!21099 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69560 res!553972) b!810702))

(assert (= (and b!810702 res!553973) b!810699))

(assert (= (and b!810699 res!553974) b!810697))

(assert (= (and b!810697 res!553979) b!810696))

(assert (= (and b!810696 res!553978) b!810703))

(assert (= (and b!810703 res!553981) b!810695))

(assert (= (and b!810695 res!553982) b!810704))

(assert (= (and b!810704 res!553975) b!810700))

(assert (= (and b!810700 res!553980) b!810698))

(assert (= (and b!810698 res!553977) b!810705))

(assert (= (and b!810705 res!553976) b!810701))

(declare-fun m!752921 () Bool)

(assert (=> b!810704 m!752921))

(declare-fun m!752923 () Bool)

(assert (=> b!810698 m!752923))

(declare-fun m!752925 () Bool)

(assert (=> b!810698 m!752925))

(declare-fun m!752927 () Bool)

(assert (=> b!810698 m!752927))

(declare-fun m!752929 () Bool)

(assert (=> b!810698 m!752929))

(declare-fun m!752931 () Bool)

(assert (=> b!810699 m!752931))

(assert (=> b!810699 m!752931))

(declare-fun m!752933 () Bool)

(assert (=> b!810699 m!752933))

(declare-fun m!752935 () Bool)

(assert (=> b!810703 m!752935))

(assert (=> b!810701 m!752931))

(declare-fun m!752937 () Bool)

(assert (=> b!810701 m!752937))

(declare-fun m!752939 () Bool)

(assert (=> b!810701 m!752939))

(assert (=> b!810701 m!752931))

(declare-fun m!752941 () Bool)

(assert (=> b!810701 m!752941))

(declare-fun m!752943 () Bool)

(assert (=> b!810701 m!752943))

(declare-fun m!752945 () Bool)

(assert (=> b!810695 m!752945))

(declare-fun m!752947 () Bool)

(assert (=> b!810696 m!752947))

(declare-fun m!752949 () Bool)

(assert (=> b!810697 m!752949))

(declare-fun m!752951 () Bool)

(assert (=> b!810705 m!752951))

(assert (=> b!810705 m!752931))

(assert (=> b!810705 m!752931))

(declare-fun m!752953 () Bool)

(assert (=> b!810705 m!752953))

(assert (=> b!810705 m!752931))

(declare-fun m!752955 () Bool)

(assert (=> b!810705 m!752955))

(declare-fun m!752957 () Bool)

(assert (=> start!69560 m!752957))

(declare-fun m!752959 () Bool)

(assert (=> start!69560 m!752959))

(declare-fun m!752961 () Bool)

(assert (=> b!810700 m!752961))

(declare-fun m!752963 () Bool)

(assert (=> b!810700 m!752963))

(push 1)

