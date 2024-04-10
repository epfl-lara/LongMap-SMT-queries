; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69188 () Bool)

(assert start!69188)

(declare-fun b!806942 () Bool)

(declare-fun res!551074 () Bool)

(declare-fun e!446826 () Bool)

(assert (=> b!806942 (=> (not res!551074) (not e!446826))))

(declare-datatypes ((array!43888 0))(
  ( (array!43889 (arr!21021 (Array (_ BitVec 32) (_ BitVec 64))) (size!21442 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43888)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43888 (_ BitVec 32)) Bool)

(assert (=> b!806942 (= res!551074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806943 () Bool)

(declare-fun res!551066 () Bool)

(declare-fun e!446824 () Bool)

(assert (=> b!806943 (=> (not res!551066) (not e!446824))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806943 (= res!551066 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806944 () Bool)

(declare-fun res!551065 () Bool)

(assert (=> b!806944 (=> (not res!551065) (not e!446824))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806944 (= res!551065 (and (= (size!21442 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21442 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21442 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806945 () Bool)

(declare-fun e!446827 () Bool)

(assert (=> b!806945 (= e!446827 false)))

(declare-fun lt!361462 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806945 (= lt!361462 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!806946 () Bool)

(declare-fun e!446825 () Bool)

(assert (=> b!806946 (= e!446825 e!446827)))

(declare-fun res!551069 () Bool)

(assert (=> b!806946 (=> (not res!551069) (not e!446827))))

(declare-datatypes ((SeekEntryResult!8612 0))(
  ( (MissingZero!8612 (index!36816 (_ BitVec 32))) (Found!8612 (index!36817 (_ BitVec 32))) (Intermediate!8612 (undefined!9424 Bool) (index!36818 (_ BitVec 32)) (x!67632 (_ BitVec 32))) (Undefined!8612) (MissingVacant!8612 (index!36819 (_ BitVec 32))) )
))
(declare-fun lt!361461 () SeekEntryResult!8612)

(declare-fun lt!361460 () SeekEntryResult!8612)

(assert (=> b!806946 (= res!551069 (and (= lt!361461 lt!361460) (= lt!361460 (Found!8612 j!153)) (not (= (select (arr!21021 a!3170) index!1236) (select (arr!21021 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43888 (_ BitVec 32)) SeekEntryResult!8612)

(assert (=> b!806946 (= lt!361460 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21021 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43888 (_ BitVec 32)) SeekEntryResult!8612)

(assert (=> b!806946 (= lt!361461 (seekEntryOrOpen!0 (select (arr!21021 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806947 () Bool)

(assert (=> b!806947 (= e!446824 e!446826)))

(declare-fun res!551070 () Bool)

(assert (=> b!806947 (=> (not res!551070) (not e!446826))))

(declare-fun lt!361459 () SeekEntryResult!8612)

(assert (=> b!806947 (= res!551070 (or (= lt!361459 (MissingZero!8612 i!1163)) (= lt!361459 (MissingVacant!8612 i!1163))))))

(assert (=> b!806947 (= lt!361459 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806948 () Bool)

(assert (=> b!806948 (= e!446826 e!446825)))

(declare-fun res!551068 () Bool)

(assert (=> b!806948 (=> (not res!551068) (not e!446825))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361458 () array!43888)

(declare-fun lt!361463 () (_ BitVec 64))

(assert (=> b!806948 (= res!551068 (= (seekEntryOrOpen!0 lt!361463 lt!361458 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361463 lt!361458 mask!3266)))))

(assert (=> b!806948 (= lt!361463 (select (store (arr!21021 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806948 (= lt!361458 (array!43889 (store (arr!21021 a!3170) i!1163 k!2044) (size!21442 a!3170)))))

(declare-fun b!806949 () Bool)

(declare-fun res!551071 () Bool)

(assert (=> b!806949 (=> (not res!551071) (not e!446826))))

(assert (=> b!806949 (= res!551071 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21442 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21021 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21442 a!3170)) (= (select (arr!21021 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806950 () Bool)

(declare-fun res!551073 () Bool)

(assert (=> b!806950 (=> (not res!551073) (not e!446824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806950 (= res!551073 (validKeyInArray!0 (select (arr!21021 a!3170) j!153)))))

(declare-fun b!806951 () Bool)

(declare-fun res!551072 () Bool)

(assert (=> b!806951 (=> (not res!551072) (not e!446826))))

(declare-datatypes ((List!14984 0))(
  ( (Nil!14981) (Cons!14980 (h!16109 (_ BitVec 64)) (t!21299 List!14984)) )
))
(declare-fun arrayNoDuplicates!0 (array!43888 (_ BitVec 32) List!14984) Bool)

(assert (=> b!806951 (= res!551072 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14981))))

(declare-fun b!806952 () Bool)

(declare-fun res!551075 () Bool)

(assert (=> b!806952 (=> (not res!551075) (not e!446824))))

(assert (=> b!806952 (= res!551075 (validKeyInArray!0 k!2044))))

(declare-fun res!551067 () Bool)

(assert (=> start!69188 (=> (not res!551067) (not e!446824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69188 (= res!551067 (validMask!0 mask!3266))))

(assert (=> start!69188 e!446824))

(assert (=> start!69188 true))

(declare-fun array_inv!16817 (array!43888) Bool)

(assert (=> start!69188 (array_inv!16817 a!3170)))

(assert (= (and start!69188 res!551067) b!806944))

(assert (= (and b!806944 res!551065) b!806950))

(assert (= (and b!806950 res!551073) b!806952))

(assert (= (and b!806952 res!551075) b!806943))

(assert (= (and b!806943 res!551066) b!806947))

(assert (= (and b!806947 res!551070) b!806942))

(assert (= (and b!806942 res!551074) b!806951))

(assert (= (and b!806951 res!551072) b!806949))

(assert (= (and b!806949 res!551071) b!806948))

(assert (= (and b!806948 res!551068) b!806946))

(assert (= (and b!806946 res!551069) b!806945))

(declare-fun m!748901 () Bool)

(assert (=> b!806942 m!748901))

(declare-fun m!748903 () Bool)

(assert (=> b!806945 m!748903))

(declare-fun m!748905 () Bool)

(assert (=> b!806947 m!748905))

(declare-fun m!748907 () Bool)

(assert (=> start!69188 m!748907))

(declare-fun m!748909 () Bool)

(assert (=> start!69188 m!748909))

(declare-fun m!748911 () Bool)

(assert (=> b!806946 m!748911))

(declare-fun m!748913 () Bool)

(assert (=> b!806946 m!748913))

(assert (=> b!806946 m!748913))

(declare-fun m!748915 () Bool)

(assert (=> b!806946 m!748915))

(assert (=> b!806946 m!748913))

(declare-fun m!748917 () Bool)

(assert (=> b!806946 m!748917))

(declare-fun m!748919 () Bool)

(assert (=> b!806952 m!748919))

(declare-fun m!748921 () Bool)

(assert (=> b!806949 m!748921))

(declare-fun m!748923 () Bool)

(assert (=> b!806949 m!748923))

(declare-fun m!748925 () Bool)

(assert (=> b!806943 m!748925))

(declare-fun m!748927 () Bool)

(assert (=> b!806948 m!748927))

(declare-fun m!748929 () Bool)

(assert (=> b!806948 m!748929))

(declare-fun m!748931 () Bool)

(assert (=> b!806948 m!748931))

(declare-fun m!748933 () Bool)

(assert (=> b!806948 m!748933))

(assert (=> b!806950 m!748913))

(assert (=> b!806950 m!748913))

(declare-fun m!748935 () Bool)

(assert (=> b!806950 m!748935))

(declare-fun m!748937 () Bool)

(assert (=> b!806951 m!748937))

(push 1)

