; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69246 () Bool)

(assert start!69246)

(declare-fun b!807899 () Bool)

(declare-fun res!552025 () Bool)

(declare-fun e!447261 () Bool)

(assert (=> b!807899 (=> (not res!552025) (not e!447261))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807899 (= res!552025 (validKeyInArray!0 k!2044))))

(declare-fun b!807900 () Bool)

(declare-fun res!552032 () Bool)

(assert (=> b!807900 (=> (not res!552032) (not e!447261))))

(declare-datatypes ((array!43946 0))(
  ( (array!43947 (arr!21050 (Array (_ BitVec 32) (_ BitVec 64))) (size!21471 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43946)

(declare-fun arrayContainsKey!0 (array!43946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807900 (= res!552032 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807901 () Bool)

(declare-fun res!552024 () Bool)

(declare-fun e!447262 () Bool)

(assert (=> b!807901 (=> (not res!552024) (not e!447262))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807901 (= res!552024 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21471 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21050 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21471 a!3170)) (= (select (arr!21050 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807902 () Bool)

(declare-fun res!552027 () Bool)

(assert (=> b!807902 (=> (not res!552027) (not e!447261))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807902 (= res!552027 (validKeyInArray!0 (select (arr!21050 a!3170) j!153)))))

(declare-fun b!807903 () Bool)

(declare-fun res!552029 () Bool)

(assert (=> b!807903 (=> (not res!552029) (not e!447262))))

(declare-datatypes ((List!15013 0))(
  ( (Nil!15010) (Cons!15009 (h!16138 (_ BitVec 64)) (t!21328 List!15013)) )
))
(declare-fun arrayNoDuplicates!0 (array!43946 (_ BitVec 32) List!15013) Bool)

(assert (=> b!807903 (= res!552029 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15010))))

(declare-fun b!807905 () Bool)

(assert (=> b!807905 (= e!447261 e!447262)))

(declare-fun res!552026 () Bool)

(assert (=> b!807905 (=> (not res!552026) (not e!447262))))

(declare-datatypes ((SeekEntryResult!8641 0))(
  ( (MissingZero!8641 (index!36932 (_ BitVec 32))) (Found!8641 (index!36933 (_ BitVec 32))) (Intermediate!8641 (undefined!9453 Bool) (index!36934 (_ BitVec 32)) (x!67733 (_ BitVec 32))) (Undefined!8641) (MissingVacant!8641 (index!36935 (_ BitVec 32))) )
))
(declare-fun lt!361980 () SeekEntryResult!8641)

(assert (=> b!807905 (= res!552026 (or (= lt!361980 (MissingZero!8641 i!1163)) (= lt!361980 (MissingVacant!8641 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43946 (_ BitVec 32)) SeekEntryResult!8641)

(assert (=> b!807905 (= lt!361980 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807906 () Bool)

(declare-fun res!552023 () Bool)

(assert (=> b!807906 (=> (not res!552023) (not e!447261))))

(assert (=> b!807906 (= res!552023 (and (= (size!21471 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21471 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21471 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807907 () Bool)

(declare-fun res!552022 () Bool)

(assert (=> b!807907 (=> (not res!552022) (not e!447262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43946 (_ BitVec 32)) Bool)

(assert (=> b!807907 (= res!552022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!552028 () Bool)

(assert (=> start!69246 (=> (not res!552028) (not e!447261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69246 (= res!552028 (validMask!0 mask!3266))))

(assert (=> start!69246 e!447261))

(assert (=> start!69246 true))

(declare-fun array_inv!16846 (array!43946) Bool)

(assert (=> start!69246 (array_inv!16846 a!3170)))

(declare-fun b!807904 () Bool)

(declare-fun e!447263 () Bool)

(declare-fun e!447259 () Bool)

(assert (=> b!807904 (= e!447263 e!447259)))

(declare-fun res!552031 () Bool)

(assert (=> b!807904 (=> (not res!552031) (not e!447259))))

(declare-fun lt!361981 () SeekEntryResult!8641)

(declare-fun lt!361983 () SeekEntryResult!8641)

(assert (=> b!807904 (= res!552031 (and (= lt!361983 lt!361981) (= lt!361981 (Found!8641 j!153)) (not (= (select (arr!21050 a!3170) index!1236) (select (arr!21050 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43946 (_ BitVec 32)) SeekEntryResult!8641)

(assert (=> b!807904 (= lt!361981 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21050 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807904 (= lt!361983 (seekEntryOrOpen!0 (select (arr!21050 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807908 () Bool)

(assert (=> b!807908 (= e!447259 false)))

(declare-fun lt!361984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807908 (= lt!361984 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807909 () Bool)

(assert (=> b!807909 (= e!447262 e!447263)))

(declare-fun res!552030 () Bool)

(assert (=> b!807909 (=> (not res!552030) (not e!447263))))

(declare-fun lt!361985 () (_ BitVec 64))

(declare-fun lt!361982 () array!43946)

(assert (=> b!807909 (= res!552030 (= (seekEntryOrOpen!0 lt!361985 lt!361982 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361985 lt!361982 mask!3266)))))

(assert (=> b!807909 (= lt!361985 (select (store (arr!21050 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807909 (= lt!361982 (array!43947 (store (arr!21050 a!3170) i!1163 k!2044) (size!21471 a!3170)))))

(assert (= (and start!69246 res!552028) b!807906))

(assert (= (and b!807906 res!552023) b!807902))

(assert (= (and b!807902 res!552027) b!807899))

(assert (= (and b!807899 res!552025) b!807900))

(assert (= (and b!807900 res!552032) b!807905))

(assert (= (and b!807905 res!552026) b!807907))

(assert (= (and b!807907 res!552022) b!807903))

(assert (= (and b!807903 res!552029) b!807901))

(assert (= (and b!807901 res!552024) b!807909))

(assert (= (and b!807909 res!552030) b!807904))

(assert (= (and b!807904 res!552031) b!807908))

(declare-fun m!750003 () Bool)

(assert (=> b!807909 m!750003))

(declare-fun m!750005 () Bool)

(assert (=> b!807909 m!750005))

(declare-fun m!750007 () Bool)

(assert (=> b!807909 m!750007))

(declare-fun m!750009 () Bool)

(assert (=> b!807909 m!750009))

(declare-fun m!750011 () Bool)

(assert (=> b!807903 m!750011))

(declare-fun m!750013 () Bool)

(assert (=> b!807908 m!750013))

(declare-fun m!750015 () Bool)

(assert (=> b!807904 m!750015))

(declare-fun m!750017 () Bool)

(assert (=> b!807904 m!750017))

(assert (=> b!807904 m!750017))

(declare-fun m!750019 () Bool)

(assert (=> b!807904 m!750019))

(assert (=> b!807904 m!750017))

(declare-fun m!750021 () Bool)

(assert (=> b!807904 m!750021))

(declare-fun m!750023 () Bool)

(assert (=> b!807899 m!750023))

(declare-fun m!750025 () Bool)

(assert (=> b!807907 m!750025))

(declare-fun m!750027 () Bool)

(assert (=> b!807901 m!750027))

(declare-fun m!750029 () Bool)

(assert (=> b!807901 m!750029))

(assert (=> b!807902 m!750017))

(assert (=> b!807902 m!750017))

(declare-fun m!750031 () Bool)

(assert (=> b!807902 m!750031))

(declare-fun m!750033 () Bool)

(assert (=> b!807905 m!750033))

(declare-fun m!750035 () Bool)

(assert (=> start!69246 m!750035))

(declare-fun m!750037 () Bool)

(assert (=> start!69246 m!750037))

(declare-fun m!750039 () Bool)

(assert (=> b!807900 m!750039))

(push 1)

(assert (not b!807904))

(assert (not b!807903))

(assert (not start!69246))

