; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69336 () Bool)

(assert start!69336)

(declare-fun b!808755 () Bool)

(declare-fun res!552679 () Bool)

(declare-fun e!447693 () Bool)

(assert (=> b!808755 (=> (not res!552679) (not e!447693))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43985 0))(
  ( (array!43986 (arr!21068 (Array (_ BitVec 32) (_ BitVec 64))) (size!21489 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43985)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808755 (= res!552679 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21489 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21068 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21489 a!3170)) (= (select (arr!21068 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808756 () Bool)

(declare-fun e!447692 () Bool)

(declare-fun e!447694 () Bool)

(assert (=> b!808756 (= e!447692 e!447694)))

(declare-fun res!552683 () Bool)

(assert (=> b!808756 (=> (not res!552683) (not e!447694))))

(declare-datatypes ((SeekEntryResult!8659 0))(
  ( (MissingZero!8659 (index!37004 (_ BitVec 32))) (Found!8659 (index!37005 (_ BitVec 32))) (Intermediate!8659 (undefined!9471 Bool) (index!37006 (_ BitVec 32)) (x!67805 (_ BitVec 32))) (Undefined!8659) (MissingVacant!8659 (index!37007 (_ BitVec 32))) )
))
(declare-fun lt!362409 () SeekEntryResult!8659)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!362413 () SeekEntryResult!8659)

(assert (=> b!808756 (= res!552683 (and (= lt!362413 lt!362409) (= lt!362409 (Found!8659 j!153)) (not (= (select (arr!21068 a!3170) index!1236) (select (arr!21068 a!3170) j!153)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43985 (_ BitVec 32)) SeekEntryResult!8659)

(assert (=> b!808756 (= lt!362409 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21068 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43985 (_ BitVec 32)) SeekEntryResult!8659)

(assert (=> b!808756 (= lt!362413 (seekEntryOrOpen!0 (select (arr!21068 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808757 () Bool)

(assert (=> b!808757 (= e!447693 e!447692)))

(declare-fun res!552689 () Bool)

(assert (=> b!808757 (=> (not res!552689) (not e!447692))))

(declare-fun lt!362411 () (_ BitVec 64))

(declare-fun lt!362414 () array!43985)

(assert (=> b!808757 (= res!552689 (= (seekEntryOrOpen!0 lt!362411 lt!362414 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362411 lt!362414 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!808757 (= lt!362411 (select (store (arr!21068 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808757 (= lt!362414 (array!43986 (store (arr!21068 a!3170) i!1163 k!2044) (size!21489 a!3170)))))

(declare-fun b!808758 () Bool)

(declare-fun res!552682 () Bool)

(assert (=> b!808758 (=> (not res!552682) (not e!447693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43985 (_ BitVec 32)) Bool)

(assert (=> b!808758 (= res!552682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808759 () Bool)

(declare-fun res!552684 () Bool)

(declare-fun e!447691 () Bool)

(assert (=> b!808759 (=> (not res!552684) (not e!447691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808759 (= res!552684 (validKeyInArray!0 (select (arr!21068 a!3170) j!153)))))

(declare-fun b!808760 () Bool)

(declare-fun res!552681 () Bool)

(assert (=> b!808760 (=> (not res!552681) (not e!447691))))

(declare-fun arrayContainsKey!0 (array!43985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808760 (= res!552681 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!552688 () Bool)

(assert (=> start!69336 (=> (not res!552688) (not e!447691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69336 (= res!552688 (validMask!0 mask!3266))))

(assert (=> start!69336 e!447691))

(assert (=> start!69336 true))

(declare-fun array_inv!16864 (array!43985) Bool)

(assert (=> start!69336 (array_inv!16864 a!3170)))

(declare-fun b!808754 () Bool)

(declare-fun lt!362412 () (_ BitVec 32))

(assert (=> b!808754 (= e!447694 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (or (bvslt lt!362412 #b00000000000000000000000000000000) (bvsge lt!362412 (size!21489 a!3170)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808754 (= lt!362412 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808761 () Bool)

(declare-fun res!552685 () Bool)

(assert (=> b!808761 (=> (not res!552685) (not e!447691))))

(assert (=> b!808761 (= res!552685 (and (= (size!21489 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21489 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21489 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808762 () Bool)

(assert (=> b!808762 (= e!447691 e!447693)))

(declare-fun res!552680 () Bool)

(assert (=> b!808762 (=> (not res!552680) (not e!447693))))

(declare-fun lt!362410 () SeekEntryResult!8659)

(assert (=> b!808762 (= res!552680 (or (= lt!362410 (MissingZero!8659 i!1163)) (= lt!362410 (MissingVacant!8659 i!1163))))))

(assert (=> b!808762 (= lt!362410 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808763 () Bool)

(declare-fun res!552686 () Bool)

(assert (=> b!808763 (=> (not res!552686) (not e!447693))))

(declare-datatypes ((List!15031 0))(
  ( (Nil!15028) (Cons!15027 (h!16156 (_ BitVec 64)) (t!21346 List!15031)) )
))
(declare-fun arrayNoDuplicates!0 (array!43985 (_ BitVec 32) List!15031) Bool)

(assert (=> b!808763 (= res!552686 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15028))))

(declare-fun b!808764 () Bool)

(declare-fun res!552687 () Bool)

(assert (=> b!808764 (=> (not res!552687) (not e!447691))))

(assert (=> b!808764 (= res!552687 (validKeyInArray!0 k!2044))))

(assert (= (and start!69336 res!552688) b!808761))

(assert (= (and b!808761 res!552685) b!808759))

(assert (= (and b!808759 res!552684) b!808764))

(assert (= (and b!808764 res!552687) b!808760))

(assert (= (and b!808760 res!552681) b!808762))

(assert (= (and b!808762 res!552680) b!808758))

(assert (= (and b!808758 res!552682) b!808763))

(assert (= (and b!808763 res!552686) b!808755))

(assert (= (and b!808755 res!552679) b!808757))

(assert (= (and b!808757 res!552689) b!808756))

(assert (= (and b!808756 res!552683) b!808754))

(declare-fun m!750915 () Bool)

(assert (=> b!808764 m!750915))

(declare-fun m!750917 () Bool)

(assert (=> start!69336 m!750917))

(declare-fun m!750919 () Bool)

(assert (=> start!69336 m!750919))

(declare-fun m!750921 () Bool)

(assert (=> b!808762 m!750921))

(declare-fun m!750923 () Bool)

(assert (=> b!808755 m!750923))

(declare-fun m!750925 () Bool)

(assert (=> b!808755 m!750925))

(declare-fun m!750927 () Bool)

(assert (=> b!808758 m!750927))

(declare-fun m!750929 () Bool)

(assert (=> b!808763 m!750929))

(declare-fun m!750931 () Bool)

(assert (=> b!808757 m!750931))

(declare-fun m!750933 () Bool)

(assert (=> b!808757 m!750933))

(declare-fun m!750935 () Bool)

(assert (=> b!808757 m!750935))

(declare-fun m!750937 () Bool)

(assert (=> b!808757 m!750937))

(declare-fun m!750939 () Bool)

(assert (=> b!808754 m!750939))

(declare-fun m!750941 () Bool)

(assert (=> b!808756 m!750941))

(declare-fun m!750943 () Bool)

(assert (=> b!808756 m!750943))

(assert (=> b!808756 m!750943))

(declare-fun m!750945 () Bool)

(assert (=> b!808756 m!750945))

(assert (=> b!808756 m!750943))

(declare-fun m!750947 () Bool)

(assert (=> b!808756 m!750947))

(declare-fun m!750949 () Bool)

(assert (=> b!808760 m!750949))

(assert (=> b!808759 m!750943))

(assert (=> b!808759 m!750943))

(declare-fun m!750951 () Bool)

(assert (=> b!808759 m!750951))

(push 1)

(assert (not b!808762))

(assert (not b!808759))

(assert (not b!808760))

(assert (not b!808763))

(assert (not b!808754))

(assert (not b!808756))

(assert (not b!808764))

(assert (not b!808757))

(assert (not b!808758))

(assert (not start!69336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!35406 () Bool)

(declare-fun call!35409 () Bool)

(assert (=> bm!35406 (= call!35409 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!808837 () Bool)

(declare-fun e!447742 () Bool)

(assert (=> b!808837 (= e!447742 call!35409)))

(declare-fun b!808838 () Bool)

(declare-fun e!447741 () Bool)

(assert (=> b!808838 (= e!447741 e!447742)))

(declare-fun lt!362450 () (_ BitVec 64))

(assert (=> b!808838 (= lt!362450 (select (arr!21068 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27622 0))(
  ( (Unit!27623) )
))
(declare-fun lt!362448 () Unit!27622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43985 (_ BitVec 64) (_ BitVec 32)) Unit!27622)

(assert (=> b!808838 (= lt!362448 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362450 #b00000000000000000000000000000000))))

(assert (=> b!808838 (arrayContainsKey!0 a!3170 lt!362450 #b00000000000000000000000000000000)))

(declare-fun lt!362449 () Unit!27622)

(assert (=> b!808838 (= lt!362449 lt!362448)))

(declare-fun res!552709 () Bool)

(assert (=> b!808838 (= res!552709 (= (seekEntryOrOpen!0 (select (arr!21068 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8659 #b00000000000000000000000000000000)))))

(assert (=> b!808838 (=> (not res!552709) (not e!447742))))

(declare-fun b!808839 () Bool)

(assert (=> b!808839 (= e!447741 call!35409)))

(declare-fun b!808836 () Bool)

(declare-fun e!447743 () Bool)

(assert (=> b!808836 (= e!447743 e!447741)))

(declare-fun c!88474 () Bool)

(assert (=> b!808836 (= c!88474 (validKeyInArray!0 (select (arr!21068 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103833 () Bool)

(declare-fun res!552710 () Bool)

(assert (=> d!103833 (=> res!552710 e!447743)))

(assert (=> d!103833 (= res!552710 (bvsge #b00000000000000000000000000000000 (size!21489 a!3170)))))

(assert (=> d!103833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!447743)))

(assert (= (and d!103833 (not res!552710)) b!808836))

(assert (= (and b!808836 c!88474) b!808838))

(assert (= (and b!808836 (not c!88474)) b!808839))

(assert (= (and b!808838 res!552709) b!808837))

(assert (= (or b!808837 b!808839) bm!35406))

(declare-fun m!750993 () Bool)

(assert (=> bm!35406 m!750993))

(declare-fun m!750995 () Bool)

(assert (=> b!808838 m!750995))

(declare-fun m!750997 () Bool)

(assert (=> b!808838 m!750997))

(declare-fun m!750999 () Bool)

(assert (=> b!808838 m!750999))

(assert (=> b!808838 m!750995))

(declare-fun m!751001 () Bool)

(assert (=> b!808838 m!751001))

(assert (=> b!808836 m!750995))

(assert (=> b!808836 m!750995))

(declare-fun m!751003 () Bool)

(assert (=> b!808836 m!751003))

(assert (=> b!808758 d!103833))

(declare-fun d!103843 () Bool)

(declare-fun res!552725 () Bool)

(declare-fun e!447776 () Bool)

(assert (=> d!103843 (=> res!552725 e!447776)))

(assert (=> d!103843 (= res!552725 (bvsge #b00000000000000000000000000000000 (size!21489 a!3170)))))

(assert (=> d!103843 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15028) e!447776)))

(declare-fun bm!35409 () Bool)

(declare-fun call!35412 () Bool)

(declare-fun c!88492 () Bool)

(assert (=> bm!35409 (= call!35412 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88492 (Cons!15027 (select (arr!21068 a!3170) #b00000000000000000000000000000000) Nil!15028) Nil!15028)))))

(declare-fun b!808886 () Bool)

(declare-fun e!447773 () Bool)

(assert (=> b!808886 (= e!447776 e!447773)))

(declare-fun res!552724 () Bool)

(assert (=> b!808886 (=> (not res!552724) (not e!447773))))

(declare-fun e!447775 () Bool)

(assert (=> b!808886 (= res!552724 (not e!447775))))

(declare-fun res!552723 () Bool)

(assert (=> b!808886 (=> (not res!552723) (not e!447775))))

(assert (=> b!808886 (= res!552723 (validKeyInArray!0 (select (arr!21068 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808887 () Bool)

(declare-fun e!447774 () Bool)

(assert (=> b!808887 (= e!447774 call!35412)))

(declare-fun b!808888 () Bool)

(declare-fun contains!4129 (List!15031 (_ BitVec 64)) Bool)

(assert (=> b!808888 (= e!447775 (contains!4129 Nil!15028 (select (arr!21068 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808889 () Bool)

(assert (=> b!808889 (= e!447773 e!447774)))

(assert (=> b!808889 (= c!88492 (validKeyInArray!0 (select (arr!21068 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808890 () Bool)

(assert (=> b!808890 (= e!447774 call!35412)))

(assert (= (and d!103843 (not res!552725)) b!808886))

(assert (= (and b!808886 res!552723) b!808888))

(assert (= (and b!808886 res!552724) b!808889))

(assert (= (and b!808889 c!88492) b!808887))

(assert (= (and b!808889 (not c!88492)) b!808890))

(assert (= (or b!808887 b!808890) bm!35409))

(assert (=> bm!35409 m!750995))

(declare-fun m!751041 () Bool)

(assert (=> bm!35409 m!751041))

(assert (=> b!808886 m!750995))

(assert (=> b!808886 m!750995))

(assert (=> b!808886 m!751003))

(assert (=> b!808888 m!750995))

(assert (=> b!808888 m!750995))

(declare-fun m!751043 () Bool)

(assert (=> b!808888 m!751043))

(assert (=> b!808889 m!750995))

(assert (=> b!808889 m!750995))

(assert (=> b!808889 m!751003))

(assert (=> b!808763 d!103843))

(declare-fun d!103855 () Bool)

(assert (=> d!103855 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808764 d!103855))

(declare-fun b!808922 () Bool)

(declare-fun e!447793 () SeekEntryResult!8659)

(declare-fun lt!362478 () SeekEntryResult!8659)

(assert (=> b!808922 (= e!447793 (Found!8659 (index!37006 lt!362478)))))

(declare-fun b!808923 () Bool)

(declare-fun e!447794 () SeekEntryResult!8659)

(assert (=> b!808923 (= e!447794 Undefined!8659)))

(declare-fun b!808924 () Bool)

(declare-fun c!88509 () Bool)

(declare-fun lt!362479 () (_ BitVec 64))

(assert (=> b!808924 (= c!88509 (= lt!362479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447792 () SeekEntryResult!8659)

(assert (=> b!808924 (= e!447793 e!447792)))

(declare-fun b!808925 () Bool)

(assert (=> b!808925 (= e!447794 e!447793)))

(assert (=> b!808925 (= lt!362479 (select (arr!21068 a!3170) (index!37006 lt!362478)))))

(declare-fun c!88508 () Bool)

(assert (=> b!808925 (= c!88508 (= lt!362479 k!2044))))

(declare-fun b!808926 () Bool)

(assert (=> b!808926 (= e!447792 (seekKeyOrZeroReturnVacant!0 (x!67805 lt!362478) (index!37006 lt!362478) (index!37006 lt!362478) k!2044 a!3170 mask!3266))))

(declare-fun b!808921 () Bool)

(assert (=> b!808921 (= e!447792 (MissingZero!8659 (index!37006 lt!362478)))))

(declare-fun d!103857 () Bool)

(declare-fun lt!362477 () SeekEntryResult!8659)

(assert (=> d!103857 (and (or (is-Undefined!8659 lt!362477) (not (is-Found!8659 lt!362477)) (and (bvsge (index!37005 lt!362477) #b00000000000000000000000000000000) (bvslt (index!37005 lt!362477) (size!21489 a!3170)))) (or (is-Undefined!8659 lt!362477) (is-Found!8659 lt!362477) (not (is-MissingZero!8659 lt!362477)) (and (bvsge (index!37004 lt!362477) #b00000000000000000000000000000000) (bvslt (index!37004 lt!362477) (size!21489 a!3170)))) (or (is-Undefined!8659 lt!362477) (is-Found!8659 lt!362477) (is-MissingZero!8659 lt!362477) (not (is-MissingVacant!8659 lt!362477)) (and (bvsge (index!37007 lt!362477) #b00000000000000000000000000000000) (bvslt (index!37007 lt!362477) (size!21489 a!3170)))) (or (is-Undefined!8659 lt!362477) (ite (is-Found!8659 lt!362477) (= (select (arr!21068 a!3170) (index!37005 lt!362477)) k!2044) (ite (is-MissingZero!8659 lt!362477) (= (select (arr!21068 a!3170) (index!37004 lt!362477)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8659 lt!362477) (= (select (arr!21068 a!3170) (index!37007 lt!362477)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103857 (= lt!362477 e!447794)))

(declare-fun c!88510 () Bool)

(assert (=> d!103857 (= c!88510 (and (is-Intermediate!8659 lt!362478) (undefined!9471 lt!362478)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43985 (_ BitVec 32)) SeekEntryResult!8659)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103857 (= lt!362478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103857 (validMask!0 mask!3266)))

(assert (=> d!103857 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!362477)))

(assert (= (and d!103857 c!88510) b!808923))

(assert (= (and d!103857 (not c!88510)) b!808925))

(assert (= (and b!808925 c!88508) b!808922))

(assert (= (and b!808925 (not c!88508)) b!808924))

(assert (= (and b!808924 c!88509) b!808921))

(assert (= (and b!808924 (not c!88509)) b!808926))

(declare-fun m!751051 () Bool)

(assert (=> b!808925 m!751051))

(declare-fun m!751053 () Bool)

(assert (=> b!808926 m!751053))

(assert (=> d!103857 m!750917))

(declare-fun m!751055 () Bool)

(assert (=> d!103857 m!751055))

(declare-fun m!751057 () Bool)

(assert (=> d!103857 m!751057))

(declare-fun m!751059 () Bool)

(assert (=> d!103857 m!751059))

(declare-fun m!751061 () Bool)

(assert (=> d!103857 m!751061))

(assert (=> d!103857 m!751059))

(declare-fun m!751063 () Bool)

(assert (=> d!103857 m!751063))

(assert (=> b!808762 d!103857))

(declare-fun b!808928 () Bool)

(declare-fun e!447796 () SeekEntryResult!8659)

(declare-fun lt!362481 () SeekEntryResult!8659)

(assert (=> b!808928 (= e!447796 (Found!8659 (index!37006 lt!362481)))))

(declare-fun b!808929 () Bool)

(declare-fun e!447797 () SeekEntryResult!8659)

(assert (=> b!808929 (= e!447797 Undefined!8659)))

(declare-fun b!808930 () Bool)

(declare-fun c!88512 () Bool)

(declare-fun lt!362482 () (_ BitVec 64))

(assert (=> b!808930 (= c!88512 (= lt!362482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447795 () SeekEntryResult!8659)

(assert (=> b!808930 (= e!447796 e!447795)))

(declare-fun b!808931 () Bool)

(assert (=> b!808931 (= e!447797 e!447796)))

(assert (=> b!808931 (= lt!362482 (select (arr!21068 lt!362414) (index!37006 lt!362481)))))

(declare-fun c!88511 () Bool)

(assert (=> b!808931 (= c!88511 (= lt!362482 lt!362411))))

(declare-fun b!808932 () Bool)

(assert (=> b!808932 (= e!447795 (seekKeyOrZeroReturnVacant!0 (x!67805 lt!362481) (index!37006 lt!362481) (index!37006 lt!362481) lt!362411 lt!362414 mask!3266))))

(declare-fun b!808927 () Bool)

(assert (=> b!808927 (= e!447795 (MissingZero!8659 (index!37006 lt!362481)))))

(declare-fun d!103863 () Bool)

(declare-fun lt!362480 () SeekEntryResult!8659)

