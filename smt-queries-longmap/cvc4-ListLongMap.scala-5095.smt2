; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69180 () Bool)

(assert start!69180)

(declare-fun b!806801 () Bool)

(declare-fun e!446759 () Bool)

(declare-fun e!446756 () Bool)

(assert (=> b!806801 (= e!446759 e!446756)))

(declare-fun res!550928 () Bool)

(assert (=> b!806801 (=> (not res!550928) (not e!446756))))

(declare-datatypes ((SeekEntryResult!8608 0))(
  ( (MissingZero!8608 (index!36800 (_ BitVec 32))) (Found!8608 (index!36801 (_ BitVec 32))) (Intermediate!8608 (undefined!9420 Bool) (index!36802 (_ BitVec 32)) (x!67612 (_ BitVec 32))) (Undefined!8608) (MissingVacant!8608 (index!36803 (_ BitVec 32))) )
))
(declare-fun lt!361373 () SeekEntryResult!8608)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806801 (= res!550928 (or (= lt!361373 (MissingZero!8608 i!1163)) (= lt!361373 (MissingVacant!8608 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43880 0))(
  ( (array!43881 (arr!21017 (Array (_ BitVec 32) (_ BitVec 64))) (size!21438 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43880)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43880 (_ BitVec 32)) SeekEntryResult!8608)

(assert (=> b!806801 (= lt!361373 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!550926 () Bool)

(assert (=> start!69180 (=> (not res!550926) (not e!446759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69180 (= res!550926 (validMask!0 mask!3266))))

(assert (=> start!69180 e!446759))

(assert (=> start!69180 true))

(declare-fun array_inv!16813 (array!43880) Bool)

(assert (=> start!69180 (array_inv!16813 a!3170)))

(declare-fun b!806802 () Bool)

(declare-fun res!550929 () Bool)

(assert (=> b!806802 (=> (not res!550929) (not e!446756))))

(declare-datatypes ((List!14980 0))(
  ( (Nil!14977) (Cons!14976 (h!16105 (_ BitVec 64)) (t!21295 List!14980)) )
))
(declare-fun arrayNoDuplicates!0 (array!43880 (_ BitVec 32) List!14980) Bool)

(assert (=> b!806802 (= res!550929 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14977))))

(declare-fun b!806803 () Bool)

(declare-fun res!550931 () Bool)

(assert (=> b!806803 (=> (not res!550931) (not e!446759))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806803 (= res!550931 (and (= (size!21438 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21438 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21438 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806804 () Bool)

(declare-fun res!550932 () Bool)

(assert (=> b!806804 (=> (not res!550932) (not e!446756))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806804 (= res!550932 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21438 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21017 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21438 a!3170)) (= (select (arr!21017 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806805 () Bool)

(declare-fun res!550925 () Bool)

(assert (=> b!806805 (=> (not res!550925) (not e!446759))))

(declare-fun arrayContainsKey!0 (array!43880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806805 (= res!550925 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806806 () Bool)

(declare-fun e!446757 () Bool)

(declare-fun e!446758 () Bool)

(assert (=> b!806806 (= e!446757 e!446758)))

(declare-fun res!550930 () Bool)

(assert (=> b!806806 (=> (not res!550930) (not e!446758))))

(declare-fun lt!361372 () SeekEntryResult!8608)

(declare-fun lt!361367 () SeekEntryResult!8608)

(assert (=> b!806806 (= res!550930 (and (= lt!361372 lt!361367) (= lt!361367 (Found!8608 j!153)) (= (select (arr!21017 a!3170) index!1236) (select (arr!21017 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43880 (_ BitVec 32)) SeekEntryResult!8608)

(assert (=> b!806806 (= lt!361367 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21017 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806806 (= lt!361372 (seekEntryOrOpen!0 (select (arr!21017 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806807 () Bool)

(declare-fun res!550933 () Bool)

(assert (=> b!806807 (=> (not res!550933) (not e!446756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43880 (_ BitVec 32)) Bool)

(assert (=> b!806807 (= res!550933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806808 () Bool)

(assert (=> b!806808 (= e!446756 e!446757)))

(declare-fun res!550934 () Bool)

(assert (=> b!806808 (=> (not res!550934) (not e!446757))))

(declare-fun lt!361371 () SeekEntryResult!8608)

(declare-fun lt!361370 () SeekEntryResult!8608)

(assert (=> b!806808 (= res!550934 (= lt!361371 lt!361370))))

(declare-fun lt!361369 () array!43880)

(declare-fun lt!361368 () (_ BitVec 64))

(assert (=> b!806808 (= lt!361370 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361368 lt!361369 mask!3266))))

(assert (=> b!806808 (= lt!361371 (seekEntryOrOpen!0 lt!361368 lt!361369 mask!3266))))

(assert (=> b!806808 (= lt!361368 (select (store (arr!21017 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806808 (= lt!361369 (array!43881 (store (arr!21017 a!3170) i!1163 k!2044) (size!21438 a!3170)))))

(declare-fun b!806809 () Bool)

(declare-fun res!550924 () Bool)

(assert (=> b!806809 (=> (not res!550924) (not e!446759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806809 (= res!550924 (validKeyInArray!0 k!2044))))

(declare-fun b!806810 () Bool)

(declare-fun res!550927 () Bool)

(assert (=> b!806810 (=> (not res!550927) (not e!446759))))

(assert (=> b!806810 (= res!550927 (validKeyInArray!0 (select (arr!21017 a!3170) j!153)))))

(declare-fun b!806811 () Bool)

(assert (=> b!806811 (= e!446758 (not true))))

(assert (=> b!806811 (= lt!361370 (Found!8608 index!1236))))

(assert (= (and start!69180 res!550926) b!806803))

(assert (= (and b!806803 res!550931) b!806810))

(assert (= (and b!806810 res!550927) b!806809))

(assert (= (and b!806809 res!550924) b!806805))

(assert (= (and b!806805 res!550925) b!806801))

(assert (= (and b!806801 res!550928) b!806807))

(assert (= (and b!806807 res!550933) b!806802))

(assert (= (and b!806802 res!550929) b!806804))

(assert (= (and b!806804 res!550932) b!806808))

(assert (= (and b!806808 res!550934) b!806806))

(assert (= (and b!806806 res!550930) b!806811))

(declare-fun m!748757 () Bool)

(assert (=> b!806802 m!748757))

(declare-fun m!748759 () Bool)

(assert (=> b!806804 m!748759))

(declare-fun m!748761 () Bool)

(assert (=> b!806804 m!748761))

(declare-fun m!748763 () Bool)

(assert (=> b!806808 m!748763))

(declare-fun m!748765 () Bool)

(assert (=> b!806808 m!748765))

(declare-fun m!748767 () Bool)

(assert (=> b!806808 m!748767))

(declare-fun m!748769 () Bool)

(assert (=> b!806808 m!748769))

(declare-fun m!748771 () Bool)

(assert (=> b!806805 m!748771))

(declare-fun m!748773 () Bool)

(assert (=> b!806810 m!748773))

(assert (=> b!806810 m!748773))

(declare-fun m!748775 () Bool)

(assert (=> b!806810 m!748775))

(declare-fun m!748777 () Bool)

(assert (=> b!806806 m!748777))

(assert (=> b!806806 m!748773))

(assert (=> b!806806 m!748773))

(declare-fun m!748779 () Bool)

(assert (=> b!806806 m!748779))

(assert (=> b!806806 m!748773))

(declare-fun m!748781 () Bool)

(assert (=> b!806806 m!748781))

(declare-fun m!748783 () Bool)

(assert (=> b!806807 m!748783))

(declare-fun m!748785 () Bool)

(assert (=> b!806801 m!748785))

(declare-fun m!748787 () Bool)

(assert (=> b!806809 m!748787))

(declare-fun m!748789 () Bool)

(assert (=> start!69180 m!748789))

(declare-fun m!748791 () Bool)

(assert (=> start!69180 m!748791))

(push 1)

