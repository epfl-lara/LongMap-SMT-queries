; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68592 () Bool)

(assert start!68592)

(declare-fun b!798043 () Bool)

(declare-fun res!542570 () Bool)

(declare-fun e!442707 () Bool)

(assert (=> b!798043 (=> (not res!542570) (not e!442707))))

(declare-datatypes ((array!43382 0))(
  ( (array!43383 (arr!20771 (Array (_ BitVec 32) (_ BitVec 64))) (size!21192 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43382)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43382 (_ BitVec 32)) Bool)

(assert (=> b!798043 (= res!542570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798045 () Bool)

(declare-fun e!442705 () Bool)

(assert (=> b!798045 (= e!442707 e!442705)))

(declare-fun res!542562 () Bool)

(assert (=> b!798045 (=> (not res!542562) (not e!442705))))

(declare-datatypes ((SeekEntryResult!8362 0))(
  ( (MissingZero!8362 (index!35816 (_ BitVec 32))) (Found!8362 (index!35817 (_ BitVec 32))) (Intermediate!8362 (undefined!9174 Bool) (index!35818 (_ BitVec 32)) (x!66704 (_ BitVec 32))) (Undefined!8362) (MissingVacant!8362 (index!35819 (_ BitVec 32))) )
))
(declare-fun lt!356162 () SeekEntryResult!8362)

(declare-fun lt!356163 () SeekEntryResult!8362)

(assert (=> b!798045 (= res!542562 (= lt!356162 lt!356163))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356165 () array!43382)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356161 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43382 (_ BitVec 32)) SeekEntryResult!8362)

(assert (=> b!798045 (= lt!356163 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356161 lt!356165 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43382 (_ BitVec 32)) SeekEntryResult!8362)

(assert (=> b!798045 (= lt!356162 (seekEntryOrOpen!0 lt!356161 lt!356165 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798045 (= lt!356161 (select (store (arr!20771 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798045 (= lt!356165 (array!43383 (store (arr!20771 a!3170) i!1163 k!2044) (size!21192 a!3170)))))

(declare-fun b!798046 () Bool)

(declare-fun res!542566 () Bool)

(declare-fun e!442708 () Bool)

(assert (=> b!798046 (=> (not res!542566) (not e!442708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798046 (= res!542566 (validKeyInArray!0 k!2044))))

(declare-fun b!798047 () Bool)

(declare-fun res!542569 () Bool)

(assert (=> b!798047 (=> (not res!542569) (not e!442707))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798047 (= res!542569 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21192 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20771 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21192 a!3170)) (= (select (arr!20771 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798048 () Bool)

(declare-fun res!542564 () Bool)

(assert (=> b!798048 (=> (not res!542564) (not e!442707))))

(declare-datatypes ((List!14734 0))(
  ( (Nil!14731) (Cons!14730 (h!15859 (_ BitVec 64)) (t!21049 List!14734)) )
))
(declare-fun arrayNoDuplicates!0 (array!43382 (_ BitVec 32) List!14734) Bool)

(assert (=> b!798048 (= res!542564 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14731))))

(declare-fun b!798049 () Bool)

(declare-fun res!542567 () Bool)

(assert (=> b!798049 (=> (not res!542567) (not e!442708))))

(assert (=> b!798049 (= res!542567 (validKeyInArray!0 (select (arr!20771 a!3170) j!153)))))

(declare-fun b!798050 () Bool)

(assert (=> b!798050 (= e!442708 e!442707)))

(declare-fun res!542563 () Bool)

(assert (=> b!798050 (=> (not res!542563) (not e!442707))))

(declare-fun lt!356168 () SeekEntryResult!8362)

(assert (=> b!798050 (= res!542563 (or (= lt!356168 (MissingZero!8362 i!1163)) (= lt!356168 (MissingVacant!8362 i!1163))))))

(assert (=> b!798050 (= lt!356168 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun e!442709 () Bool)

(declare-fun b!798051 () Bool)

(declare-fun lt!356166 () SeekEntryResult!8362)

(assert (=> b!798051 (= e!442709 (not (or (not (= lt!356163 lt!356166)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!798051 (= lt!356163 (Found!8362 index!1236))))

(declare-fun b!798052 () Bool)

(declare-fun res!542568 () Bool)

(assert (=> b!798052 (=> (not res!542568) (not e!442708))))

(declare-fun arrayContainsKey!0 (array!43382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798052 (= res!542568 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798053 () Bool)

(declare-fun res!542565 () Bool)

(assert (=> b!798053 (=> (not res!542565) (not e!442708))))

(assert (=> b!798053 (= res!542565 (and (= (size!21192 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21192 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21192 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798054 () Bool)

(declare-fun e!442704 () Bool)

(assert (=> b!798054 (= e!442704 e!442709)))

(declare-fun res!542571 () Bool)

(assert (=> b!798054 (=> (not res!542571) (not e!442709))))

(declare-fun lt!356167 () SeekEntryResult!8362)

(assert (=> b!798054 (= res!542571 (and (= lt!356167 lt!356166) (= (select (arr!20771 a!3170) index!1236) (select (arr!20771 a!3170) j!153))))))

(assert (=> b!798054 (= lt!356166 (Found!8362 j!153))))

(declare-fun b!798044 () Bool)

(assert (=> b!798044 (= e!442705 e!442704)))

(declare-fun res!542573 () Bool)

(assert (=> b!798044 (=> (not res!542573) (not e!442704))))

(declare-fun lt!356164 () SeekEntryResult!8362)

(assert (=> b!798044 (= res!542573 (= lt!356164 lt!356167))))

(assert (=> b!798044 (= lt!356167 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20771 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798044 (= lt!356164 (seekEntryOrOpen!0 (select (arr!20771 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!542572 () Bool)

(assert (=> start!68592 (=> (not res!542572) (not e!442708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68592 (= res!542572 (validMask!0 mask!3266))))

(assert (=> start!68592 e!442708))

(assert (=> start!68592 true))

(declare-fun array_inv!16567 (array!43382) Bool)

(assert (=> start!68592 (array_inv!16567 a!3170)))

(assert (= (and start!68592 res!542572) b!798053))

(assert (= (and b!798053 res!542565) b!798049))

(assert (= (and b!798049 res!542567) b!798046))

(assert (= (and b!798046 res!542566) b!798052))

(assert (= (and b!798052 res!542568) b!798050))

(assert (= (and b!798050 res!542563) b!798043))

(assert (= (and b!798043 res!542570) b!798048))

(assert (= (and b!798048 res!542564) b!798047))

(assert (= (and b!798047 res!542569) b!798045))

(assert (= (and b!798045 res!542562) b!798044))

(assert (= (and b!798044 res!542573) b!798054))

(assert (= (and b!798054 res!542571) b!798051))

(declare-fun m!738923 () Bool)

(assert (=> b!798048 m!738923))

(declare-fun m!738925 () Bool)

(assert (=> b!798047 m!738925))

(declare-fun m!738927 () Bool)

(assert (=> b!798047 m!738927))

(declare-fun m!738929 () Bool)

(assert (=> b!798050 m!738929))

(declare-fun m!738931 () Bool)

(assert (=> b!798043 m!738931))

(declare-fun m!738933 () Bool)

(assert (=> b!798054 m!738933))

(declare-fun m!738935 () Bool)

(assert (=> b!798054 m!738935))

(declare-fun m!738937 () Bool)

(assert (=> b!798045 m!738937))

(declare-fun m!738939 () Bool)

(assert (=> b!798045 m!738939))

(declare-fun m!738941 () Bool)

(assert (=> b!798045 m!738941))

(declare-fun m!738943 () Bool)

(assert (=> b!798045 m!738943))

(declare-fun m!738945 () Bool)

(assert (=> b!798046 m!738945))

(declare-fun m!738947 () Bool)

(assert (=> start!68592 m!738947))

(declare-fun m!738949 () Bool)

(assert (=> start!68592 m!738949))

(assert (=> b!798049 m!738935))

(assert (=> b!798049 m!738935))

(declare-fun m!738951 () Bool)

(assert (=> b!798049 m!738951))

(declare-fun m!738953 () Bool)

(assert (=> b!798052 m!738953))

(assert (=> b!798044 m!738935))

(assert (=> b!798044 m!738935))

(declare-fun m!738955 () Bool)

(assert (=> b!798044 m!738955))

(assert (=> b!798044 m!738935))

(declare-fun m!738957 () Bool)

(assert (=> b!798044 m!738957))

(push 1)

(assert (not b!798043))

(assert (not b!798052))

(assert (not b!798049))

(assert (not b!798048))

(assert (not b!798045))

(assert (not start!68592))

(assert (not b!798046))

(assert (not b!798044))

(assert (not b!798050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

