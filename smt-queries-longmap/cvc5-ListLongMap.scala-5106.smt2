; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69242 () Bool)

(assert start!69242)

(declare-fun b!807833 () Bool)

(declare-fun res!551956 () Bool)

(declare-fun e!447230 () Bool)

(assert (=> b!807833 (=> (not res!551956) (not e!447230))))

(declare-datatypes ((array!43942 0))(
  ( (array!43943 (arr!21048 (Array (_ BitVec 32) (_ BitVec 64))) (size!21469 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43942)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807833 (= res!551956 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807834 () Bool)

(declare-fun res!551959 () Bool)

(declare-fun e!447232 () Bool)

(assert (=> b!807834 (=> (not res!551959) (not e!447232))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807834 (= res!551959 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21469 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21048 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21469 a!3170)) (= (select (arr!21048 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807835 () Bool)

(declare-fun res!551964 () Bool)

(assert (=> b!807835 (=> (not res!551964) (not e!447232))))

(declare-datatypes ((List!15011 0))(
  ( (Nil!15008) (Cons!15007 (h!16136 (_ BitVec 64)) (t!21326 List!15011)) )
))
(declare-fun arrayNoDuplicates!0 (array!43942 (_ BitVec 32) List!15011) Bool)

(assert (=> b!807835 (= res!551964 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15008))))

(declare-fun b!807836 () Bool)

(declare-fun res!551958 () Bool)

(assert (=> b!807836 (=> (not res!551958) (not e!447230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807836 (= res!551958 (validKeyInArray!0 k!2044))))

(declare-fun res!551961 () Bool)

(assert (=> start!69242 (=> (not res!551961) (not e!447230))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69242 (= res!551961 (validMask!0 mask!3266))))

(assert (=> start!69242 e!447230))

(assert (=> start!69242 true))

(declare-fun array_inv!16844 (array!43942) Bool)

(assert (=> start!69242 (array_inv!16844 a!3170)))

(declare-fun b!807837 () Bool)

(declare-fun e!447231 () Bool)

(assert (=> b!807837 (= e!447232 e!447231)))

(declare-fun res!551963 () Bool)

(assert (=> b!807837 (=> (not res!551963) (not e!447231))))

(declare-fun lt!361945 () array!43942)

(declare-fun lt!361949 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8639 0))(
  ( (MissingZero!8639 (index!36924 (_ BitVec 32))) (Found!8639 (index!36925 (_ BitVec 32))) (Intermediate!8639 (undefined!9451 Bool) (index!36926 (_ BitVec 32)) (x!67731 (_ BitVec 32))) (Undefined!8639) (MissingVacant!8639 (index!36927 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43942 (_ BitVec 32)) SeekEntryResult!8639)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43942 (_ BitVec 32)) SeekEntryResult!8639)

(assert (=> b!807837 (= res!551963 (= (seekEntryOrOpen!0 lt!361949 lt!361945 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361949 lt!361945 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807837 (= lt!361949 (select (store (arr!21048 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807837 (= lt!361945 (array!43943 (store (arr!21048 a!3170) i!1163 k!2044) (size!21469 a!3170)))))

(declare-fun b!807838 () Bool)

(declare-fun res!551962 () Bool)

(assert (=> b!807838 (=> (not res!551962) (not e!447232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43942 (_ BitVec 32)) Bool)

(assert (=> b!807838 (= res!551962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807839 () Bool)

(declare-fun e!447229 () Bool)

(assert (=> b!807839 (= e!447229 false)))

(declare-fun lt!361944 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807839 (= lt!361944 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807840 () Bool)

(assert (=> b!807840 (= e!447231 e!447229)))

(declare-fun res!551965 () Bool)

(assert (=> b!807840 (=> (not res!551965) (not e!447229))))

(declare-fun lt!361947 () SeekEntryResult!8639)

(declare-fun lt!361948 () SeekEntryResult!8639)

(assert (=> b!807840 (= res!551965 (and (= lt!361947 lt!361948) (= lt!361948 (Found!8639 j!153)) (not (= (select (arr!21048 a!3170) index!1236) (select (arr!21048 a!3170) j!153)))))))

(assert (=> b!807840 (= lt!361948 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21048 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807840 (= lt!361947 (seekEntryOrOpen!0 (select (arr!21048 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807841 () Bool)

(declare-fun res!551957 () Bool)

(assert (=> b!807841 (=> (not res!551957) (not e!447230))))

(assert (=> b!807841 (= res!551957 (validKeyInArray!0 (select (arr!21048 a!3170) j!153)))))

(declare-fun b!807842 () Bool)

(declare-fun res!551960 () Bool)

(assert (=> b!807842 (=> (not res!551960) (not e!447230))))

(assert (=> b!807842 (= res!551960 (and (= (size!21469 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21469 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21469 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807843 () Bool)

(assert (=> b!807843 (= e!447230 e!447232)))

(declare-fun res!551966 () Bool)

(assert (=> b!807843 (=> (not res!551966) (not e!447232))))

(declare-fun lt!361946 () SeekEntryResult!8639)

(assert (=> b!807843 (= res!551966 (or (= lt!361946 (MissingZero!8639 i!1163)) (= lt!361946 (MissingVacant!8639 i!1163))))))

(assert (=> b!807843 (= lt!361946 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69242 res!551961) b!807842))

(assert (= (and b!807842 res!551960) b!807841))

(assert (= (and b!807841 res!551957) b!807836))

(assert (= (and b!807836 res!551958) b!807833))

(assert (= (and b!807833 res!551956) b!807843))

(assert (= (and b!807843 res!551966) b!807838))

(assert (= (and b!807838 res!551962) b!807835))

(assert (= (and b!807835 res!551964) b!807834))

(assert (= (and b!807834 res!551959) b!807837))

(assert (= (and b!807837 res!551963) b!807840))

(assert (= (and b!807840 res!551965) b!807839))

(declare-fun m!749927 () Bool)

(assert (=> b!807840 m!749927))

(declare-fun m!749929 () Bool)

(assert (=> b!807840 m!749929))

(assert (=> b!807840 m!749929))

(declare-fun m!749931 () Bool)

(assert (=> b!807840 m!749931))

(assert (=> b!807840 m!749929))

(declare-fun m!749933 () Bool)

(assert (=> b!807840 m!749933))

(declare-fun m!749935 () Bool)

(assert (=> b!807838 m!749935))

(declare-fun m!749937 () Bool)

(assert (=> b!807834 m!749937))

(declare-fun m!749939 () Bool)

(assert (=> b!807834 m!749939))

(declare-fun m!749941 () Bool)

(assert (=> b!807835 m!749941))

(declare-fun m!749943 () Bool)

(assert (=> b!807843 m!749943))

(declare-fun m!749945 () Bool)

(assert (=> b!807836 m!749945))

(declare-fun m!749947 () Bool)

(assert (=> b!807837 m!749947))

(declare-fun m!749949 () Bool)

(assert (=> b!807837 m!749949))

(declare-fun m!749951 () Bool)

(assert (=> b!807837 m!749951))

(declare-fun m!749953 () Bool)

(assert (=> b!807837 m!749953))

(declare-fun m!749955 () Bool)

(assert (=> start!69242 m!749955))

(declare-fun m!749957 () Bool)

(assert (=> start!69242 m!749957))

(assert (=> b!807841 m!749929))

(assert (=> b!807841 m!749929))

(declare-fun m!749959 () Bool)

(assert (=> b!807841 m!749959))

(declare-fun m!749961 () Bool)

(assert (=> b!807833 m!749961))

(declare-fun m!749963 () Bool)

(assert (=> b!807839 m!749963))

(push 1)

