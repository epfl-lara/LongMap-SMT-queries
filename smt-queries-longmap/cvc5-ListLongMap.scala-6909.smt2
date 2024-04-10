; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86816 () Bool)

(assert start!86816)

(declare-fun res!675832 () Bool)

(declare-fun e!566621 () Bool)

(assert (=> start!86816 (=> (not res!675832) (not e!566621))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86816 (= res!675832 (validMask!0 mask!3464))))

(assert (=> start!86816 e!566621))

(declare-datatypes ((array!63515 0))(
  ( (array!63516 (arr!30580 (Array (_ BitVec 32) (_ BitVec 64))) (size!31082 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63515)

(declare-fun array_inv!23704 (array!63515) Bool)

(assert (=> start!86816 (array_inv!23704 a!3219)))

(assert (=> start!86816 true))

(declare-fun b!1006737 () Bool)

(declare-fun res!675834 () Bool)

(declare-fun e!566619 () Bool)

(assert (=> b!1006737 (=> (not res!675834) (not e!566619))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006737 (= res!675834 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31082 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31082 a!3219))))))

(declare-fun b!1006738 () Bool)

(declare-fun res!675827 () Bool)

(assert (=> b!1006738 (=> (not res!675827) (not e!566621))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006738 (= res!675827 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006739 () Bool)

(declare-fun res!675835 () Bool)

(declare-fun e!566623 () Bool)

(assert (=> b!1006739 (=> (not res!675835) (not e!566623))))

(declare-datatypes ((SeekEntryResult!9512 0))(
  ( (MissingZero!9512 (index!40419 (_ BitVec 32))) (Found!9512 (index!40420 (_ BitVec 32))) (Intermediate!9512 (undefined!10324 Bool) (index!40421 (_ BitVec 32)) (x!87816 (_ BitVec 32))) (Undefined!9512) (MissingVacant!9512 (index!40422 (_ BitVec 32))) )
))
(declare-fun lt!444897 () SeekEntryResult!9512)

(declare-fun lt!444898 () (_ BitVec 64))

(declare-fun lt!444894 () array!63515)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63515 (_ BitVec 32)) SeekEntryResult!9512)

(assert (=> b!1006739 (= res!675835 (not (= lt!444897 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444898 lt!444894 mask!3464))))))

(declare-fun b!1006740 () Bool)

(assert (=> b!1006740 (= e!566621 e!566619)))

(declare-fun res!675830 () Bool)

(assert (=> b!1006740 (=> (not res!675830) (not e!566619))))

(declare-fun lt!444895 () SeekEntryResult!9512)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006740 (= res!675830 (or (= lt!444895 (MissingVacant!9512 i!1194)) (= lt!444895 (MissingZero!9512 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63515 (_ BitVec 32)) SeekEntryResult!9512)

(assert (=> b!1006740 (= lt!444895 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006741 () Bool)

(declare-fun res!675826 () Bool)

(assert (=> b!1006741 (=> (not res!675826) (not e!566621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006741 (= res!675826 (validKeyInArray!0 k!2224))))

(declare-fun b!1006742 () Bool)

(declare-fun e!566618 () Bool)

(assert (=> b!1006742 (= e!566619 e!566618)))

(declare-fun res!675837 () Bool)

(assert (=> b!1006742 (=> (not res!675837) (not e!566618))))

(declare-fun lt!444896 () SeekEntryResult!9512)

(declare-fun lt!444899 () SeekEntryResult!9512)

(assert (=> b!1006742 (= res!675837 (= lt!444896 lt!444899))))

(assert (=> b!1006742 (= lt!444899 (Intermediate!9512 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006742 (= lt!444896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30580 a!3219) j!170) mask!3464) (select (arr!30580 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006743 () Bool)

(assert (=> b!1006743 (= e!566623 (and (= index!1507 resIndex!38) (= x!1245 resX!38) (not (= resIndex!38 i!1194))))))

(declare-fun b!1006744 () Bool)

(declare-fun res!675831 () Bool)

(assert (=> b!1006744 (=> (not res!675831) (not e!566619))))

(declare-datatypes ((List!21256 0))(
  ( (Nil!21253) (Cons!21252 (h!22435 (_ BitVec 64)) (t!30257 List!21256)) )
))
(declare-fun arrayNoDuplicates!0 (array!63515 (_ BitVec 32) List!21256) Bool)

(assert (=> b!1006744 (= res!675831 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21253))))

(declare-fun b!1006745 () Bool)

(declare-fun res!675825 () Bool)

(assert (=> b!1006745 (=> (not res!675825) (not e!566619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63515 (_ BitVec 32)) Bool)

(assert (=> b!1006745 (= res!675825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006746 () Bool)

(declare-fun res!675829 () Bool)

(assert (=> b!1006746 (=> (not res!675829) (not e!566621))))

(assert (=> b!1006746 (= res!675829 (validKeyInArray!0 (select (arr!30580 a!3219) j!170)))))

(declare-fun b!1006747 () Bool)

(declare-fun e!566622 () Bool)

(assert (=> b!1006747 (= e!566622 e!566623)))

(declare-fun res!675833 () Bool)

(assert (=> b!1006747 (=> (not res!675833) (not e!566623))))

(assert (=> b!1006747 (= res!675833 (not (= lt!444896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444898 mask!3464) lt!444898 lt!444894 mask!3464))))))

(assert (=> b!1006747 (= lt!444898 (select (store (arr!30580 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1006747 (= lt!444894 (array!63516 (store (arr!30580 a!3219) i!1194 k!2224) (size!31082 a!3219)))))

(declare-fun b!1006748 () Bool)

(declare-fun res!675828 () Bool)

(assert (=> b!1006748 (=> (not res!675828) (not e!566621))))

(assert (=> b!1006748 (= res!675828 (and (= (size!31082 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31082 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31082 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006749 () Bool)

(assert (=> b!1006749 (= e!566618 e!566622)))

(declare-fun res!675836 () Bool)

(assert (=> b!1006749 (=> (not res!675836) (not e!566622))))

(assert (=> b!1006749 (= res!675836 (= lt!444897 lt!444899))))

(assert (=> b!1006749 (= lt!444897 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30580 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86816 res!675832) b!1006748))

(assert (= (and b!1006748 res!675828) b!1006746))

(assert (= (and b!1006746 res!675829) b!1006741))

(assert (= (and b!1006741 res!675826) b!1006738))

(assert (= (and b!1006738 res!675827) b!1006740))

(assert (= (and b!1006740 res!675830) b!1006745))

(assert (= (and b!1006745 res!675825) b!1006744))

(assert (= (and b!1006744 res!675831) b!1006737))

(assert (= (and b!1006737 res!675834) b!1006742))

(assert (= (and b!1006742 res!675837) b!1006749))

(assert (= (and b!1006749 res!675836) b!1006747))

(assert (= (and b!1006747 res!675833) b!1006739))

(assert (= (and b!1006739 res!675835) b!1006743))

(declare-fun m!931811 () Bool)

(assert (=> b!1006749 m!931811))

(assert (=> b!1006749 m!931811))

(declare-fun m!931813 () Bool)

(assert (=> b!1006749 m!931813))

(declare-fun m!931815 () Bool)

(assert (=> b!1006747 m!931815))

(assert (=> b!1006747 m!931815))

(declare-fun m!931817 () Bool)

(assert (=> b!1006747 m!931817))

(declare-fun m!931819 () Bool)

(assert (=> b!1006747 m!931819))

(declare-fun m!931821 () Bool)

(assert (=> b!1006747 m!931821))

(declare-fun m!931823 () Bool)

(assert (=> b!1006741 m!931823))

(declare-fun m!931825 () Bool)

(assert (=> b!1006740 m!931825))

(assert (=> b!1006742 m!931811))

(assert (=> b!1006742 m!931811))

(declare-fun m!931827 () Bool)

(assert (=> b!1006742 m!931827))

(assert (=> b!1006742 m!931827))

(assert (=> b!1006742 m!931811))

(declare-fun m!931829 () Bool)

(assert (=> b!1006742 m!931829))

(declare-fun m!931831 () Bool)

(assert (=> b!1006738 m!931831))

(declare-fun m!931833 () Bool)

(assert (=> b!1006739 m!931833))

(declare-fun m!931835 () Bool)

(assert (=> b!1006745 m!931835))

(declare-fun m!931837 () Bool)

(assert (=> b!1006744 m!931837))

(assert (=> b!1006746 m!931811))

(assert (=> b!1006746 m!931811))

(declare-fun m!931839 () Bool)

(assert (=> b!1006746 m!931839))

(declare-fun m!931841 () Bool)

(assert (=> start!86816 m!931841))

(declare-fun m!931843 () Bool)

(assert (=> start!86816 m!931843))

(push 1)

(assert (not b!1006742))

(assert (not b!1006749))

(assert (not b!1006744))

(assert (not b!1006746))

(assert (not b!1006738))

(assert (not b!1006740))

(assert (not b!1006739))

(assert (not b!1006745))

(assert (not b!1006741))

(assert (not start!86816))

(assert (not b!1006747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1006908 () Bool)

(declare-fun lt!444971 () SeekEntryResult!9512)

(assert (=> b!1006908 (and (bvsge (index!40421 lt!444971) #b00000000000000000000000000000000) (bvslt (index!40421 lt!444971) (size!31082 a!3219)))))

(declare-fun res!675937 () Bool)

(assert (=> b!1006908 (= res!675937 (= (select (arr!30580 a!3219) (index!40421 lt!444971)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566703 () Bool)

(assert (=> b!1006908 (=> res!675937 e!566703)))

(declare-fun b!1006909 () Bool)

(declare-fun e!566707 () SeekEntryResult!9512)

(declare-fun e!566706 () SeekEntryResult!9512)

(assert (=> b!1006909 (= e!566707 e!566706)))

(declare-fun lt!444972 () (_ BitVec 64))

(declare-fun c!101640 () Bool)

(assert (=> b!1006909 (= c!101640 (or (= lt!444972 (select (arr!30580 a!3219) j!170)) (= (bvadd lt!444972 lt!444972) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006910 () Bool)

(assert (=> b!1006910 (= e!566707 (Intermediate!9512 true (toIndex!0 (select (arr!30580 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006911 () Bool)

(assert (=> b!1006911 (= e!566706 (Intermediate!9512 false (toIndex!0 (select (arr!30580 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006912 () Bool)

(declare-fun e!566704 () Bool)

(declare-fun e!566705 () Bool)

(assert (=> b!1006912 (= e!566704 e!566705)))

(declare-fun res!675936 () Bool)

(assert (=> b!1006912 (= res!675936 (and (is-Intermediate!9512 lt!444971) (not (undefined!10324 lt!444971)) (bvslt (x!87816 lt!444971) #b01111111111111111111111111111110) (bvsge (x!87816 lt!444971) #b00000000000000000000000000000000) (bvsge (x!87816 lt!444971) #b00000000000000000000000000000000)))))

(assert (=> b!1006912 (=> (not res!675936) (not e!566705))))

(declare-fun b!1006914 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006914 (= e!566706 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30580 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30580 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006915 () Bool)

(assert (=> b!1006915 (= e!566704 (bvsge (x!87816 lt!444971) #b01111111111111111111111111111110))))

(declare-fun b!1006916 () Bool)

(assert (=> b!1006916 (and (bvsge (index!40421 lt!444971) #b00000000000000000000000000000000) (bvslt (index!40421 lt!444971) (size!31082 a!3219)))))

(declare-fun res!675935 () Bool)

(assert (=> b!1006916 (= res!675935 (= (select (arr!30580 a!3219) (index!40421 lt!444971)) (select (arr!30580 a!3219) j!170)))))

(assert (=> b!1006916 (=> res!675935 e!566703)))

(assert (=> b!1006916 (= e!566705 e!566703)))

(declare-fun b!1006913 () Bool)

(assert (=> b!1006913 (and (bvsge (index!40421 lt!444971) #b00000000000000000000000000000000) (bvslt (index!40421 lt!444971) (size!31082 a!3219)))))

(assert (=> b!1006913 (= e!566703 (= (select (arr!30580 a!3219) (index!40421 lt!444971)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119619 () Bool)

(assert (=> d!119619 e!566704))

(declare-fun c!101639 () Bool)

(assert (=> d!119619 (= c!101639 (and (is-Intermediate!9512 lt!444971) (undefined!10324 lt!444971)))))

(assert (=> d!119619 (= lt!444971 e!566707)))

(declare-fun c!101638 () Bool)

(assert (=> d!119619 (= c!101638 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119619 (= lt!444972 (select (arr!30580 a!3219) (toIndex!0 (select (arr!30580 a!3219) j!170) mask!3464)))))

(assert (=> d!119619 (validMask!0 mask!3464)))

(assert (=> d!119619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30580 a!3219) j!170) mask!3464) (select (arr!30580 a!3219) j!170) a!3219 mask!3464) lt!444971)))

(assert (= (and d!119619 c!101638) b!1006910))

(assert (= (and d!119619 (not c!101638)) b!1006909))

(assert (= (and b!1006909 c!101640) b!1006911))

(assert (= (and b!1006909 (not c!101640)) b!1006914))

(assert (= (and d!119619 c!101639) b!1006915))

(assert (= (and d!119619 (not c!101639)) b!1006912))

(assert (= (and b!1006912 res!675936) b!1006916))

(assert (= (and b!1006916 (not res!675935)) b!1006908))

(assert (= (and b!1006908 (not res!675937)) b!1006913))

(declare-fun m!931943 () Bool)

(assert (=> b!1006916 m!931943))

(assert (=> d!119619 m!931827))

(declare-fun m!931945 () Bool)

(assert (=> d!119619 m!931945))

(assert (=> d!119619 m!931841))

(assert (=> b!1006914 m!931827))

(declare-fun m!931947 () Bool)

(assert (=> b!1006914 m!931947))

(assert (=> b!1006914 m!931947))

(assert (=> b!1006914 m!931811))

(declare-fun m!931949 () Bool)

(assert (=> b!1006914 m!931949))

(assert (=> b!1006913 m!931943))

(assert (=> b!1006908 m!931943))

(assert (=> b!1006742 d!119619))

(declare-fun d!119633 () Bool)

(declare-fun lt!444983 () (_ BitVec 32))

(declare-fun lt!444982 () (_ BitVec 32))

(assert (=> d!119633 (= lt!444983 (bvmul (bvxor lt!444982 (bvlshr lt!444982 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119633 (= lt!444982 ((_ extract 31 0) (bvand (bvxor (select (arr!30580 a!3219) j!170) (bvlshr (select (arr!30580 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119633 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!675938 (let ((h!22439 ((_ extract 31 0) (bvand (bvxor (select (arr!30580 a!3219) j!170) (bvlshr (select (arr!30580 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87822 (bvmul (bvxor h!22439 (bvlshr h!22439 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87822 (bvlshr x!87822 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!675938 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!675938 #b00000000000000000000000000000000))))))

(assert (=> d!119633 (= (toIndex!0 (select (arr!30580 a!3219) j!170) mask!3464) (bvand (bvxor lt!444983 (bvlshr lt!444983 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006742 d!119633))

(declare-fun d!119637 () Bool)

(assert (=> d!119637 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86816 d!119637))

(declare-fun d!119643 () Bool)

(assert (=> d!119643 (= (array_inv!23704 a!3219) (bvsge (size!31082 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86816 d!119643))

(declare-fun b!1006984 () Bool)

(declare-fun lt!444990 () SeekEntryResult!9512)

(assert (=> b!1006984 (and (bvsge (index!40421 lt!444990) #b00000000000000000000000000000000) (bvslt (index!40421 lt!444990) (size!31082 lt!444894)))))

(declare-fun res!675968 () Bool)

(assert (=> b!1006984 (= res!675968 (= (select (arr!30580 lt!444894) (index!40421 lt!444990)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566751 () Bool)

(assert (=> b!1006984 (=> res!675968 e!566751)))

(declare-fun b!1006985 () Bool)

(declare-fun e!566755 () SeekEntryResult!9512)

(declare-fun e!566754 () SeekEntryResult!9512)

(assert (=> b!1006985 (= e!566755 e!566754)))

(declare-fun c!101663 () Bool)

(declare-fun lt!444991 () (_ BitVec 64))

(assert (=> b!1006985 (= c!101663 (or (= lt!444991 lt!444898) (= (bvadd lt!444991 lt!444991) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006986 () Bool)

(assert (=> b!1006986 (= e!566755 (Intermediate!9512 true (toIndex!0 lt!444898 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006987 () Bool)

(assert (=> b!1006987 (= e!566754 (Intermediate!9512 false (toIndex!0 lt!444898 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006988 () Bool)

(declare-fun e!566752 () Bool)

(declare-fun e!566753 () Bool)

(assert (=> b!1006988 (= e!566752 e!566753)))

(declare-fun res!675967 () Bool)

(assert (=> b!1006988 (= res!675967 (and (is-Intermediate!9512 lt!444990) (not (undefined!10324 lt!444990)) (bvslt (x!87816 lt!444990) #b01111111111111111111111111111110) (bvsge (x!87816 lt!444990) #b00000000000000000000000000000000) (bvsge (x!87816 lt!444990) #b00000000000000000000000000000000)))))

(assert (=> b!1006988 (=> (not res!675967) (not e!566753))))

(declare-fun b!1006990 () Bool)

(assert (=> b!1006990 (= e!566754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444898 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444898 lt!444894 mask!3464))))

(declare-fun b!1006991 () Bool)

(assert (=> b!1006991 (= e!566752 (bvsge (x!87816 lt!444990) #b01111111111111111111111111111110))))

(declare-fun b!1006992 () Bool)

(assert (=> b!1006992 (and (bvsge (index!40421 lt!444990) #b00000000000000000000000000000000) (bvslt (index!40421 lt!444990) (size!31082 lt!444894)))))

(declare-fun res!675966 () Bool)

(assert (=> b!1006992 (= res!675966 (= (select (arr!30580 lt!444894) (index!40421 lt!444990)) lt!444898))))

(assert (=> b!1006992 (=> res!675966 e!566751)))

(assert (=> b!1006992 (= e!566753 e!566751)))

(declare-fun b!1006989 () Bool)

(assert (=> b!1006989 (and (bvsge (index!40421 lt!444990) #b00000000000000000000000000000000) (bvslt (index!40421 lt!444990) (size!31082 lt!444894)))))

(assert (=> b!1006989 (= e!566751 (= (select (arr!30580 lt!444894) (index!40421 lt!444990)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119647 () Bool)

(assert (=> d!119647 e!566752))

(declare-fun c!101662 () Bool)

(assert (=> d!119647 (= c!101662 (and (is-Intermediate!9512 lt!444990) (undefined!10324 lt!444990)))))

(assert (=> d!119647 (= lt!444990 e!566755)))

(declare-fun c!101661 () Bool)

(assert (=> d!119647 (= c!101661 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119647 (= lt!444991 (select (arr!30580 lt!444894) (toIndex!0 lt!444898 mask!3464)))))

(assert (=> d!119647 (validMask!0 mask!3464)))

(assert (=> d!119647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444898 mask!3464) lt!444898 lt!444894 mask!3464) lt!444990)))

(assert (= (and d!119647 c!101661) b!1006986))

(assert (= (and d!119647 (not c!101661)) b!1006985))

(assert (= (and b!1006985 c!101663) b!1006987))

(assert (= (and b!1006985 (not c!101663)) b!1006990))

(assert (= (and d!119647 c!101662) b!1006991))

(assert (= (and d!119647 (not c!101662)) b!1006988))

(assert (= (and b!1006988 res!675967) b!1006992))

(assert (= (and b!1006992 (not res!675966)) b!1006984))

(assert (= (and b!1006984 (not res!675968)) b!1006989))

(declare-fun m!931989 () Bool)

(assert (=> b!1006992 m!931989))

(assert (=> d!119647 m!931815))

(declare-fun m!931991 () Bool)

(assert (=> d!119647 m!931991))

(assert (=> d!119647 m!931841))

(assert (=> b!1006990 m!931815))

(declare-fun m!931993 () Bool)

(assert (=> b!1006990 m!931993))

(assert (=> b!1006990 m!931993))

(declare-fun m!931995 () Bool)

(assert (=> b!1006990 m!931995))

(assert (=> b!1006989 m!931989))

(assert (=> b!1006984 m!931989))

(assert (=> b!1006747 d!119647))

(declare-fun d!119651 () Bool)

(declare-fun lt!444993 () (_ BitVec 32))

(declare-fun lt!444992 () (_ BitVec 32))

(assert (=> d!119651 (= lt!444993 (bvmul (bvxor lt!444992 (bvlshr lt!444992 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119651 (= lt!444992 ((_ extract 31 0) (bvand (bvxor lt!444898 (bvlshr lt!444898 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119651 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!675938 (let ((h!22439 ((_ extract 31 0) (bvand (bvxor lt!444898 (bvlshr lt!444898 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87822 (bvmul (bvxor h!22439 (bvlshr h!22439 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87822 (bvlshr x!87822 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!675938 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!675938 #b00000000000000000000000000000000))))))

(assert (=> d!119651 (= (toIndex!0 lt!444898 mask!3464) (bvand (bvxor lt!444993 (bvlshr lt!444993 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006747 d!119651))

(declare-fun d!119653 () Bool)

(assert (=> d!119653 (= (validKeyInArray!0 (select (arr!30580 a!3219) j!170)) (and (not (= (select (arr!30580 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30580 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006746 d!119653))

(declare-fun d!119657 () Bool)

(assert (=> d!119657 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006741 d!119657))

(declare-fun b!1007053 () Bool)

(declare-fun c!101684 () Bool)

(declare-fun lt!445028 () (_ BitVec 64))

(assert (=> b!1007053 (= c!101684 (= lt!445028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566796 () SeekEntryResult!9512)

(declare-fun e!566797 () SeekEntryResult!9512)

(assert (=> b!1007053 (= e!566796 e!566797)))

(declare-fun b!1007054 () Bool)

(declare-fun e!566798 () SeekEntryResult!9512)

(assert (=> b!1007054 (= e!566798 e!566796)))

(declare-fun lt!445030 () SeekEntryResult!9512)

(assert (=> b!1007054 (= lt!445028 (select (arr!30580 a!3219) (index!40421 lt!445030)))))

(declare-fun c!101682 () Bool)

(assert (=> b!1007054 (= c!101682 (= lt!445028 k!2224))))

(declare-fun b!1007055 () Bool)

(assert (=> b!1007055 (= e!566797 (MissingZero!9512 (index!40421 lt!445030)))))

(declare-fun d!119659 () Bool)

(declare-fun lt!445029 () SeekEntryResult!9512)

(assert (=> d!119659 (and (or (is-Undefined!9512 lt!445029) (not (is-Found!9512 lt!445029)) (and (bvsge (index!40420 lt!445029) #b00000000000000000000000000000000) (bvslt (index!40420 lt!445029) (size!31082 a!3219)))) (or (is-Undefined!9512 lt!445029) (is-Found!9512 lt!445029) (not (is-MissingZero!9512 lt!445029)) (and (bvsge (index!40419 lt!445029) #b00000000000000000000000000000000) (bvslt (index!40419 lt!445029) (size!31082 a!3219)))) (or (is-Undefined!9512 lt!445029) (is-Found!9512 lt!445029) (is-MissingZero!9512 lt!445029) (not (is-MissingVacant!9512 lt!445029)) (and (bvsge (index!40422 lt!445029) #b00000000000000000000000000000000) (bvslt (index!40422 lt!445029) (size!31082 a!3219)))) (or (is-Undefined!9512 lt!445029) (ite (is-Found!9512 lt!445029) (= (select (arr!30580 a!3219) (index!40420 lt!445029)) k!2224) (ite (is-MissingZero!9512 lt!445029) (= (select (arr!30580 a!3219) (index!40419 lt!445029)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9512 lt!445029) (= (select (arr!30580 a!3219) (index!40422 lt!445029)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119659 (= lt!445029 e!566798)))

(declare-fun c!101683 () Bool)

(assert (=> d!119659 (= c!101683 (and (is-Intermediate!9512 lt!445030) (undefined!10324 lt!445030)))))

(assert (=> d!119659 (= lt!445030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119659 (validMask!0 mask!3464)))

(assert (=> d!119659 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!445029)))

(declare-fun b!1007056 () Bool)

(assert (=> b!1007056 (= e!566798 Undefined!9512)))

(declare-fun b!1007057 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63515 (_ BitVec 32)) SeekEntryResult!9512)

(assert (=> b!1007057 (= e!566797 (seekKeyOrZeroReturnVacant!0 (x!87816 lt!445030) (index!40421 lt!445030) (index!40421 lt!445030) k!2224 a!3219 mask!3464))))

(declare-fun b!1007058 () Bool)

(assert (=> b!1007058 (= e!566796 (Found!9512 (index!40421 lt!445030)))))

(assert (= (and d!119659 c!101683) b!1007056))

(assert (= (and d!119659 (not c!101683)) b!1007054))

(assert (= (and b!1007054 c!101682) b!1007058))

(assert (= (and b!1007054 (not c!101682)) b!1007053))

(assert (= (and b!1007053 c!101684) b!1007055))

(assert (= (and b!1007053 (not c!101684)) b!1007057))

(declare-fun m!932033 () Bool)

(assert (=> b!1007054 m!932033))

(declare-fun m!932035 () Bool)

(assert (=> d!119659 m!932035))

(declare-fun m!932037 () Bool)

(assert (=> d!119659 m!932037))

(assert (=> d!119659 m!932035))

(declare-fun m!932039 () Bool)

(assert (=> d!119659 m!932039))

(declare-fun m!932041 () Bool)

(assert (=> d!119659 m!932041))

(assert (=> d!119659 m!931841))

(declare-fun m!932043 () Bool)

(assert (=> d!119659 m!932043))

(declare-fun m!932045 () Bool)

(assert (=> b!1007057 m!932045))

(assert (=> b!1006740 d!119659))

(declare-fun b!1007085 () Bool)

(declare-fun e!566817 () Bool)

(declare-fun call!42362 () Bool)

(assert (=> b!1007085 (= e!566817 call!42362)))

(declare-fun b!1007086 () Bool)

(declare-fun e!566818 () Bool)

(assert (=> b!1007086 (= e!566818 e!566817)))

(declare-fun lt!445040 () (_ BitVec 64))

(assert (=> b!1007086 (= lt!445040 (select (arr!30580 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33012 0))(
  ( (Unit!33013) )
))
(declare-fun lt!445041 () Unit!33012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63515 (_ BitVec 64) (_ BitVec 32)) Unit!33012)

(assert (=> b!1007086 (= lt!445041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445040 #b00000000000000000000000000000000))))

(assert (=> b!1007086 (arrayContainsKey!0 a!3219 lt!445040 #b00000000000000000000000000000000)))

(declare-fun lt!445039 () Unit!33012)

(assert (=> b!1007086 (= lt!445039 lt!445041)))

(declare-fun res!676004 () Bool)

(assert (=> b!1007086 (= res!676004 (= (seekEntryOrOpen!0 (select (arr!30580 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9512 #b00000000000000000000000000000000)))))

(assert (=> b!1007086 (=> (not res!676004) (not e!566817))))

(declare-fun b!1007087 () Bool)

(assert (=> b!1007087 (= e!566818 call!42362)))

(declare-fun d!119669 () Bool)

(declare-fun res!676005 () Bool)

(declare-fun e!566816 () Bool)

(assert (=> d!119669 (=> res!676005 e!566816)))

(assert (=> d!119669 (= res!676005 (bvsge #b00000000000000000000000000000000 (size!31082 a!3219)))))

(assert (=> d!119669 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566816)))

(declare-fun b!1007088 () Bool)

(assert (=> b!1007088 (= e!566816 e!566818)))

(declare-fun c!101693 () Bool)

(assert (=> b!1007088 (= c!101693 (validKeyInArray!0 (select (arr!30580 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42359 () Bool)

(assert (=> bm!42359 (= call!42362 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119669 (not res!676005)) b!1007088))

(assert (= (and b!1007088 c!101693) b!1007086))

(assert (= (and b!1007088 (not c!101693)) b!1007087))

(assert (= (and b!1007086 res!676004) b!1007085))

(assert (= (or b!1007085 b!1007087) bm!42359))

(declare-fun m!932057 () Bool)

(assert (=> b!1007086 m!932057))

(declare-fun m!932059 () Bool)

(assert (=> b!1007086 m!932059))

(declare-fun m!932061 () Bool)

(assert (=> b!1007086 m!932061))

(assert (=> b!1007086 m!932057))

(declare-fun m!932063 () Bool)

(assert (=> b!1007086 m!932063))

(assert (=> b!1007088 m!932057))

(assert (=> b!1007088 m!932057))

(declare-fun m!932065 () Bool)

(assert (=> b!1007088 m!932065))

(declare-fun m!932067 () Bool)

(assert (=> bm!42359 m!932067))

(assert (=> b!1006745 d!119669))

(declare-fun b!1007089 () Bool)

(declare-fun lt!445042 () SeekEntryResult!9512)

(assert (=> b!1007089 (and (bvsge (index!40421 lt!445042) #b00000000000000000000000000000000) (bvslt (index!40421 lt!445042) (size!31082 lt!444894)))))

(declare-fun res!676008 () Bool)

(assert (=> b!1007089 (= res!676008 (= (select (arr!30580 lt!444894) (index!40421 lt!445042)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566819 () Bool)

(assert (=> b!1007089 (=> res!676008 e!566819)))

(declare-fun b!1007090 () Bool)

(declare-fun e!566823 () SeekEntryResult!9512)

(declare-fun e!566822 () SeekEntryResult!9512)

(assert (=> b!1007090 (= e!566823 e!566822)))

(declare-fun c!101696 () Bool)

(declare-fun lt!445043 () (_ BitVec 64))

(assert (=> b!1007090 (= c!101696 (or (= lt!445043 lt!444898) (= (bvadd lt!445043 lt!445043) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1007091 () Bool)

(assert (=> b!1007091 (= e!566823 (Intermediate!9512 true index!1507 x!1245))))

(declare-fun b!1007092 () Bool)

(assert (=> b!1007092 (= e!566822 (Intermediate!9512 false index!1507 x!1245))))

(declare-fun b!1007093 () Bool)

(declare-fun e!566820 () Bool)

(declare-fun e!566821 () Bool)

(assert (=> b!1007093 (= e!566820 e!566821)))

(declare-fun res!676007 () Bool)

(assert (=> b!1007093 (= res!676007 (and (is-Intermediate!9512 lt!445042) (not (undefined!10324 lt!445042)) (bvslt (x!87816 lt!445042) #b01111111111111111111111111111110) (bvsge (x!87816 lt!445042) #b00000000000000000000000000000000) (bvsge (x!87816 lt!445042) x!1245)))))

(assert (=> b!1007093 (=> (not res!676007) (not e!566821))))

(declare-fun b!1007095 () Bool)

(assert (=> b!1007095 (= e!566822 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444898 lt!444894 mask!3464))))

(declare-fun b!1007096 () Bool)

(assert (=> b!1007096 (= e!566820 (bvsge (x!87816 lt!445042) #b01111111111111111111111111111110))))

(declare-fun b!1007097 () Bool)

(assert (=> b!1007097 (and (bvsge (index!40421 lt!445042) #b00000000000000000000000000000000) (bvslt (index!40421 lt!445042) (size!31082 lt!444894)))))

(declare-fun res!676006 () Bool)

(assert (=> b!1007097 (= res!676006 (= (select (arr!30580 lt!444894) (index!40421 lt!445042)) lt!444898))))

(assert (=> b!1007097 (=> res!676006 e!566819)))

(assert (=> b!1007097 (= e!566821 e!566819)))

(declare-fun b!1007094 () Bool)

(assert (=> b!1007094 (and (bvsge (index!40421 lt!445042) #b00000000000000000000000000000000) (bvslt (index!40421 lt!445042) (size!31082 lt!444894)))))

(assert (=> b!1007094 (= e!566819 (= (select (arr!30580 lt!444894) (index!40421 lt!445042)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119677 () Bool)

(assert (=> d!119677 e!566820))

(declare-fun c!101695 () Bool)

(assert (=> d!119677 (= c!101695 (and (is-Intermediate!9512 lt!445042) (undefined!10324 lt!445042)))))

(assert (=> d!119677 (= lt!445042 e!566823)))

(declare-fun c!101694 () Bool)

(assert (=> d!119677 (= c!101694 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119677 (= lt!445043 (select (arr!30580 lt!444894) index!1507))))

(assert (=> d!119677 (validMask!0 mask!3464)))

(assert (=> d!119677 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444898 lt!444894 mask!3464) lt!445042)))

(assert (= (and d!119677 c!101694) b!1007091))

(assert (= (and d!119677 (not c!101694)) b!1007090))

(assert (= (and b!1007090 c!101696) b!1007092))

(assert (= (and b!1007090 (not c!101696)) b!1007095))

(assert (= (and d!119677 c!101695) b!1007096))

(assert (= (and d!119677 (not c!101695)) b!1007093))

(assert (= (and b!1007093 res!676007) b!1007097))

(assert (= (and b!1007097 (not res!676006)) b!1007089))

(assert (= (and b!1007089 (not res!676008)) b!1007094))

(declare-fun m!932069 () Bool)

(assert (=> b!1007097 m!932069))

(declare-fun m!932071 () Bool)

(assert (=> d!119677 m!932071))

(assert (=> d!119677 m!931841))

(declare-fun m!932073 () Bool)

(assert (=> b!1007095 m!932073))

(assert (=> b!1007095 m!932073))

(declare-fun m!932075 () Bool)

(assert (=> b!1007095 m!932075))

(assert (=> b!1007094 m!932069))

(assert (=> b!1007089 m!932069))

(assert (=> b!1006739 d!119677))

(declare-fun d!119679 () Bool)

(declare-fun res!676023 () Bool)

(declare-fun e!566840 () Bool)

(assert (=> d!119679 (=> res!676023 e!566840)))

(assert (=> d!119679 (= res!676023 (bvsge #b00000000000000000000000000000000 (size!31082 a!3219)))))

(assert (=> d!119679 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21253) e!566840)))

(declare-fun bm!42362 () Bool)

(declare-fun call!42365 () Bool)

(declare-fun c!101699 () Bool)

(assert (=> bm!42362 (= call!42365 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101699 (Cons!21252 (select (arr!30580 a!3219) #b00000000000000000000000000000000) Nil!21253) Nil!21253)))))

(declare-fun b!1007114 () Bool)

(declare-fun e!566841 () Bool)

(assert (=> b!1007114 (= e!566841 call!42365)))

(declare-fun b!1007115 () Bool)

(assert (=> b!1007115 (= e!566841 call!42365)))

(declare-fun b!1007116 () Bool)

(declare-fun e!566839 () Bool)

(assert (=> b!1007116 (= e!566840 e!566839)))

(declare-fun res!676022 () Bool)

(assert (=> b!1007116 (=> (not res!676022) (not e!566839))))

(declare-fun e!566838 () Bool)

(assert (=> b!1007116 (= res!676022 (not e!566838))))

(declare-fun res!676021 () Bool)

(assert (=> b!1007116 (=> (not res!676021) (not e!566838))))

(assert (=> b!1007116 (= res!676021 (validKeyInArray!0 (select (arr!30580 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1007117 () Bool)

(declare-fun contains!5888 (List!21256 (_ BitVec 64)) Bool)

(assert (=> b!1007117 (= e!566838 (contains!5888 Nil!21253 (select (arr!30580 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1007118 () Bool)

(assert (=> b!1007118 (= e!566839 e!566841)))

(assert (=> b!1007118 (= c!101699 (validKeyInArray!0 (select (arr!30580 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119679 (not res!676023)) b!1007116))

(assert (= (and b!1007116 res!676021) b!1007117))

(assert (= (and b!1007116 res!676022) b!1007118))

(assert (= (and b!1007118 c!101699) b!1007115))

(assert (= (and b!1007118 (not c!101699)) b!1007114))

(assert (= (or b!1007115 b!1007114) bm!42362))

(assert (=> bm!42362 m!932057))

(declare-fun m!932079 () Bool)

(assert (=> bm!42362 m!932079))

(assert (=> b!1007116 m!932057))

(assert (=> b!1007116 m!932057))

(assert (=> b!1007116 m!932065))

(assert (=> b!1007117 m!932057))

(assert (=> b!1007117 m!932057))

(declare-fun m!932081 () Bool)

(assert (=> b!1007117 m!932081))

(assert (=> b!1007118 m!932057))

(assert (=> b!1007118 m!932057))

(assert (=> b!1007118 m!932065))

(assert (=> b!1006744 d!119679))

(declare-fun d!119687 () Bool)

(declare-fun res!676031 () Bool)

(declare-fun e!566851 () Bool)

(assert (=> d!119687 (=> res!676031 e!566851)))

(assert (=> d!119687 (= res!676031 (= (select (arr!30580 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119687 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!566851)))

(declare-fun b!1007132 () Bool)

(declare-fun e!566852 () Bool)

(assert (=> b!1007132 (= e!566851 e!566852)))

(declare-fun res!676032 () Bool)

(assert (=> b!1007132 (=> (not res!676032) (not e!566852))))

(assert (=> b!1007132 (= res!676032 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31082 a!3219)))))

(declare-fun b!1007133 () Bool)

(assert (=> b!1007133 (= e!566852 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119687 (not res!676031)) b!1007132))

(assert (= (and b!1007132 res!676032) b!1007133))

(assert (=> d!119687 m!932057))

(declare-fun m!932091 () Bool)

(assert (=> b!1007133 m!932091))

(assert (=> b!1006738 d!119687))

(declare-fun b!1007134 () Bool)

(declare-fun lt!445048 () SeekEntryResult!9512)

(assert (=> b!1007134 (and (bvsge (index!40421 lt!445048) #b00000000000000000000000000000000) (bvslt (index!40421 lt!445048) (size!31082 a!3219)))))

(declare-fun res!676035 () Bool)

(assert (=> b!1007134 (= res!676035 (= (select (arr!30580 a!3219) (index!40421 lt!445048)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566853 () Bool)

(assert (=> b!1007134 (=> res!676035 e!566853)))

(declare-fun b!1007135 () Bool)

(declare-fun e!566857 () SeekEntryResult!9512)

(declare-fun e!566856 () SeekEntryResult!9512)

(assert (=> b!1007135 (= e!566857 e!566856)))

(declare-fun c!101705 () Bool)

(declare-fun lt!445049 () (_ BitVec 64))

(assert (=> b!1007135 (= c!101705 (or (= lt!445049 (select (arr!30580 a!3219) j!170)) (= (bvadd lt!445049 lt!445049) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1007136 () Bool)

(assert (=> b!1007136 (= e!566857 (Intermediate!9512 true index!1507 x!1245))))

(declare-fun b!1007137 () Bool)

(assert (=> b!1007137 (= e!566856 (Intermediate!9512 false index!1507 x!1245))))

(declare-fun b!1007138 () Bool)

(declare-fun e!566854 () Bool)

(declare-fun e!566855 () Bool)

(assert (=> b!1007138 (= e!566854 e!566855)))

(declare-fun res!676034 () Bool)

(assert (=> b!1007138 (= res!676034 (and (is-Intermediate!9512 lt!445048) (not (undefined!10324 lt!445048)) (bvslt (x!87816 lt!445048) #b01111111111111111111111111111110) (bvsge (x!87816 lt!445048) #b00000000000000000000000000000000) (bvsge (x!87816 lt!445048) x!1245)))))

(assert (=> b!1007138 (=> (not res!676034) (not e!566855))))

(declare-fun b!1007140 () Bool)

(assert (=> b!1007140 (= e!566856 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30580 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007141 () Bool)

(assert (=> b!1007141 (= e!566854 (bvsge (x!87816 lt!445048) #b01111111111111111111111111111110))))

(declare-fun b!1007142 () Bool)

(assert (=> b!1007142 (and (bvsge (index!40421 lt!445048) #b00000000000000000000000000000000) (bvslt (index!40421 lt!445048) (size!31082 a!3219)))))

(declare-fun res!676033 () Bool)

(assert (=> b!1007142 (= res!676033 (= (select (arr!30580 a!3219) (index!40421 lt!445048)) (select (arr!30580 a!3219) j!170)))))

(assert (=> b!1007142 (=> res!676033 e!566853)))

(assert (=> b!1007142 (= e!566855 e!566853)))

(declare-fun b!1007139 () Bool)

(assert (=> b!1007139 (and (bvsge (index!40421 lt!445048) #b00000000000000000000000000000000) (bvslt (index!40421 lt!445048) (size!31082 a!3219)))))

(assert (=> b!1007139 (= e!566853 (= (select (arr!30580 a!3219) (index!40421 lt!445048)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119691 () Bool)

(assert (=> d!119691 e!566854))

(declare-fun c!101704 () Bool)

(assert (=> d!119691 (= c!101704 (and (is-Intermediate!9512 lt!445048) (undefined!10324 lt!445048)))))

(assert (=> d!119691 (= lt!445048 e!566857)))

(declare-fun c!101703 () Bool)

(assert (=> d!119691 (= c!101703 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119691 (= lt!445049 (select (arr!30580 a!3219) index!1507))))

(assert (=> d!119691 (validMask!0 mask!3464)))

(assert (=> d!119691 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30580 a!3219) j!170) a!3219 mask!3464) lt!445048)))

(assert (= (and d!119691 c!101703) b!1007136))

(assert (= (and d!119691 (not c!101703)) b!1007135))

(assert (= (and b!1007135 c!101705) b!1007137))

(assert (= (and b!1007135 (not c!101705)) b!1007140))

(assert (= (and d!119691 c!101704) b!1007141))

(assert (= (and d!119691 (not c!101704)) b!1007138))

(assert (= (and b!1007138 res!676034) b!1007142))

(assert (= (and b!1007142 (not res!676033)) b!1007134))

(assert (= (and b!1007134 (not res!676035)) b!1007139))

(declare-fun m!932093 () Bool)

(assert (=> b!1007142 m!932093))

(declare-fun m!932095 () Bool)

(assert (=> d!119691 m!932095))

(assert (=> d!119691 m!931841))

(assert (=> b!1007140 m!932073))

(assert (=> b!1007140 m!932073))

(assert (=> b!1007140 m!931811))

(declare-fun m!932097 () Bool)

(assert (=> b!1007140 m!932097))

(assert (=> b!1007139 m!932093))

(assert (=> b!1007134 m!932093))

(assert (=> b!1006749 d!119691))

(push 1)

(assert (not b!1007116))

(assert (not d!119647))

(assert (not d!119659))

(assert (not b!1007086))

(assert (not b!1007057))

(assert (not b!1006914))

(assert (not d!119691))

(assert (not b!1007088))

(assert (not b!1007133))

(assert (not d!119619))

(assert (not b!1007117))

(assert (not b!1007118))

(assert (not bm!42359))

(assert (not b!1007140))

(assert (not bm!42362))

(assert (not d!119677))

(assert (not b!1007095))

(assert (not b!1006990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

