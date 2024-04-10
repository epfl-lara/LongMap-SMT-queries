; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69240 () Bool)

(assert start!69240)

(declare-fun b!807800 () Bool)

(declare-fun res!551926 () Bool)

(declare-fun e!447217 () Bool)

(assert (=> b!807800 (=> (not res!551926) (not e!447217))))

(declare-datatypes ((array!43940 0))(
  ( (array!43941 (arr!21047 (Array (_ BitVec 32) (_ BitVec 64))) (size!21468 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43940)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807800 (= res!551926 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807801 () Bool)

(declare-fun res!551925 () Bool)

(assert (=> b!807801 (=> (not res!551925) (not e!447217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807801 (= res!551925 (validKeyInArray!0 k!2044))))

(declare-fun b!807802 () Bool)

(declare-fun res!551924 () Bool)

(declare-fun e!447216 () Bool)

(assert (=> b!807802 (=> (not res!551924) (not e!447216))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807802 (= res!551924 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21468 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21047 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21468 a!3170)) (= (select (arr!21047 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807803 () Bool)

(declare-fun e!447218 () Bool)

(assert (=> b!807803 (= e!447216 e!447218)))

(declare-fun res!551928 () Bool)

(assert (=> b!807803 (=> (not res!551928) (not e!447218))))

(declare-fun lt!361927 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!361926 () array!43940)

(declare-datatypes ((SeekEntryResult!8638 0))(
  ( (MissingZero!8638 (index!36920 (_ BitVec 32))) (Found!8638 (index!36921 (_ BitVec 32))) (Intermediate!8638 (undefined!9450 Bool) (index!36922 (_ BitVec 32)) (x!67722 (_ BitVec 32))) (Undefined!8638) (MissingVacant!8638 (index!36923 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43940 (_ BitVec 32)) SeekEntryResult!8638)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43940 (_ BitVec 32)) SeekEntryResult!8638)

(assert (=> b!807803 (= res!551928 (= (seekEntryOrOpen!0 lt!361927 lt!361926 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361927 lt!361926 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807803 (= lt!361927 (select (store (arr!21047 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807803 (= lt!361926 (array!43941 (store (arr!21047 a!3170) i!1163 k!2044) (size!21468 a!3170)))))

(declare-fun b!807804 () Bool)

(declare-fun res!551929 () Bool)

(assert (=> b!807804 (=> (not res!551929) (not e!447217))))

(assert (=> b!807804 (= res!551929 (and (= (size!21468 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21468 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21468 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807805 () Bool)

(declare-fun res!551930 () Bool)

(assert (=> b!807805 (=> (not res!551930) (not e!447216))))

(declare-datatypes ((List!15010 0))(
  ( (Nil!15007) (Cons!15006 (h!16135 (_ BitVec 64)) (t!21325 List!15010)) )
))
(declare-fun arrayNoDuplicates!0 (array!43940 (_ BitVec 32) List!15010) Bool)

(assert (=> b!807805 (= res!551930 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15007))))

(declare-fun b!807806 () Bool)

(declare-fun e!447215 () Bool)

(assert (=> b!807806 (= e!447215 false)))

(declare-fun lt!361931 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807806 (= lt!361931 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!551931 () Bool)

(assert (=> start!69240 (=> (not res!551931) (not e!447217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69240 (= res!551931 (validMask!0 mask!3266))))

(assert (=> start!69240 e!447217))

(assert (=> start!69240 true))

(declare-fun array_inv!16843 (array!43940) Bool)

(assert (=> start!69240 (array_inv!16843 a!3170)))

(declare-fun b!807807 () Bool)

(declare-fun res!551923 () Bool)

(assert (=> b!807807 (=> (not res!551923) (not e!447217))))

(assert (=> b!807807 (= res!551923 (validKeyInArray!0 (select (arr!21047 a!3170) j!153)))))

(declare-fun b!807808 () Bool)

(assert (=> b!807808 (= e!447218 e!447215)))

(declare-fun res!551932 () Bool)

(assert (=> b!807808 (=> (not res!551932) (not e!447215))))

(declare-fun lt!361928 () SeekEntryResult!8638)

(declare-fun lt!361929 () SeekEntryResult!8638)

(assert (=> b!807808 (= res!551932 (and (= lt!361928 lt!361929) (= lt!361929 (Found!8638 j!153)) (not (= (select (arr!21047 a!3170) index!1236) (select (arr!21047 a!3170) j!153)))))))

(assert (=> b!807808 (= lt!361929 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21047 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807808 (= lt!361928 (seekEntryOrOpen!0 (select (arr!21047 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807809 () Bool)

(declare-fun res!551933 () Bool)

(assert (=> b!807809 (=> (not res!551933) (not e!447216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43940 (_ BitVec 32)) Bool)

(assert (=> b!807809 (= res!551933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807810 () Bool)

(assert (=> b!807810 (= e!447217 e!447216)))

(declare-fun res!551927 () Bool)

(assert (=> b!807810 (=> (not res!551927) (not e!447216))))

(declare-fun lt!361930 () SeekEntryResult!8638)

(assert (=> b!807810 (= res!551927 (or (= lt!361930 (MissingZero!8638 i!1163)) (= lt!361930 (MissingVacant!8638 i!1163))))))

(assert (=> b!807810 (= lt!361930 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69240 res!551931) b!807804))

(assert (= (and b!807804 res!551929) b!807807))

(assert (= (and b!807807 res!551923) b!807801))

(assert (= (and b!807801 res!551925) b!807800))

(assert (= (and b!807800 res!551926) b!807810))

(assert (= (and b!807810 res!551927) b!807809))

(assert (= (and b!807809 res!551933) b!807805))

(assert (= (and b!807805 res!551930) b!807802))

(assert (= (and b!807802 res!551924) b!807803))

(assert (= (and b!807803 res!551928) b!807808))

(assert (= (and b!807808 res!551932) b!807806))

(declare-fun m!749889 () Bool)

(assert (=> b!807807 m!749889))

(assert (=> b!807807 m!749889))

(declare-fun m!749891 () Bool)

(assert (=> b!807807 m!749891))

(declare-fun m!749893 () Bool)

(assert (=> b!807810 m!749893))

(declare-fun m!749895 () Bool)

(assert (=> b!807808 m!749895))

(assert (=> b!807808 m!749889))

(assert (=> b!807808 m!749889))

(declare-fun m!749897 () Bool)

(assert (=> b!807808 m!749897))

(assert (=> b!807808 m!749889))

(declare-fun m!749899 () Bool)

(assert (=> b!807808 m!749899))

(declare-fun m!749901 () Bool)

(assert (=> b!807800 m!749901))

(declare-fun m!749903 () Bool)

(assert (=> start!69240 m!749903))

(declare-fun m!749905 () Bool)

(assert (=> start!69240 m!749905))

(declare-fun m!749907 () Bool)

(assert (=> b!807805 m!749907))

(declare-fun m!749909 () Bool)

(assert (=> b!807802 m!749909))

(declare-fun m!749911 () Bool)

(assert (=> b!807802 m!749911))

(declare-fun m!749913 () Bool)

(assert (=> b!807809 m!749913))

(declare-fun m!749915 () Bool)

(assert (=> b!807801 m!749915))

(declare-fun m!749917 () Bool)

(assert (=> b!807803 m!749917))

(declare-fun m!749919 () Bool)

(assert (=> b!807803 m!749919))

(declare-fun m!749921 () Bool)

(assert (=> b!807803 m!749921))

(declare-fun m!749923 () Bool)

(assert (=> b!807803 m!749923))

(declare-fun m!749925 () Bool)

(assert (=> b!807806 m!749925))

(push 1)

(assert (not b!807800))

