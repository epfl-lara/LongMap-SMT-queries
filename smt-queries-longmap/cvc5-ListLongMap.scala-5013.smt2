; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68588 () Bool)

(assert start!68588)

(declare-fun b!797972 () Bool)

(declare-fun e!442672 () Bool)

(declare-fun e!442669 () Bool)

(assert (=> b!797972 (= e!442672 e!442669)))

(declare-fun res!542497 () Bool)

(assert (=> b!797972 (=> (not res!542497) (not e!442669))))

(declare-datatypes ((SeekEntryResult!8360 0))(
  ( (MissingZero!8360 (index!35808 (_ BitVec 32))) (Found!8360 (index!35809 (_ BitVec 32))) (Intermediate!8360 (undefined!9172 Bool) (index!35810 (_ BitVec 32)) (x!66702 (_ BitVec 32))) (Undefined!8360) (MissingVacant!8360 (index!35811 (_ BitVec 32))) )
))
(declare-fun lt!356114 () SeekEntryResult!8360)

(declare-fun lt!356116 () SeekEntryResult!8360)

(assert (=> b!797972 (= res!542497 (= lt!356114 lt!356116))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43378 0))(
  ( (array!43379 (arr!20769 (Array (_ BitVec 32) (_ BitVec 64))) (size!21190 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43378)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43378 (_ BitVec 32)) SeekEntryResult!8360)

(assert (=> b!797972 (= lt!356116 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20769 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43378 (_ BitVec 32)) SeekEntryResult!8360)

(assert (=> b!797972 (= lt!356114 (seekEntryOrOpen!0 (select (arr!20769 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797973 () Bool)

(declare-fun res!542501 () Bool)

(declare-fun e!442670 () Bool)

(assert (=> b!797973 (=> (not res!542501) (not e!442670))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797973 (= res!542501 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797974 () Bool)

(declare-fun res!542499 () Bool)

(assert (=> b!797974 (=> (not res!542499) (not e!442670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797974 (= res!542499 (validKeyInArray!0 k!2044))))

(declare-fun b!797975 () Bool)

(declare-fun e!442673 () Bool)

(assert (=> b!797975 (= e!442670 e!442673)))

(declare-fun res!542493 () Bool)

(assert (=> b!797975 (=> (not res!542493) (not e!442673))))

(declare-fun lt!356119 () SeekEntryResult!8360)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797975 (= res!542493 (or (= lt!356119 (MissingZero!8360 i!1163)) (= lt!356119 (MissingVacant!8360 i!1163))))))

(assert (=> b!797975 (= lt!356119 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun e!442668 () Bool)

(declare-fun lt!356117 () SeekEntryResult!8360)

(declare-fun lt!356118 () SeekEntryResult!8360)

(declare-fun b!797976 () Bool)

(assert (=> b!797976 (= e!442668 (not (or (not (= lt!356118 lt!356117)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797976 (= lt!356118 (Found!8360 index!1236))))

(declare-fun b!797971 () Bool)

(declare-fun res!542496 () Bool)

(assert (=> b!797971 (=> (not res!542496) (not e!442673))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!797971 (= res!542496 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21190 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20769 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21190 a!3170)) (= (select (arr!20769 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!542492 () Bool)

(assert (=> start!68588 (=> (not res!542492) (not e!442670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68588 (= res!542492 (validMask!0 mask!3266))))

(assert (=> start!68588 e!442670))

(assert (=> start!68588 true))

(declare-fun array_inv!16565 (array!43378) Bool)

(assert (=> start!68588 (array_inv!16565 a!3170)))

(declare-fun b!797977 () Bool)

(declare-fun res!542490 () Bool)

(assert (=> b!797977 (=> (not res!542490) (not e!442670))))

(assert (=> b!797977 (= res!542490 (and (= (size!21190 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21190 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21190 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797978 () Bool)

(declare-fun res!542498 () Bool)

(assert (=> b!797978 (=> (not res!542498) (not e!442673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43378 (_ BitVec 32)) Bool)

(assert (=> b!797978 (= res!542498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797979 () Bool)

(declare-fun res!542495 () Bool)

(assert (=> b!797979 (=> (not res!542495) (not e!442673))))

(declare-datatypes ((List!14732 0))(
  ( (Nil!14729) (Cons!14728 (h!15857 (_ BitVec 64)) (t!21047 List!14732)) )
))
(declare-fun arrayNoDuplicates!0 (array!43378 (_ BitVec 32) List!14732) Bool)

(assert (=> b!797979 (= res!542495 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14729))))

(declare-fun b!797980 () Bool)

(assert (=> b!797980 (= e!442673 e!442672)))

(declare-fun res!542494 () Bool)

(assert (=> b!797980 (=> (not res!542494) (not e!442672))))

(declare-fun lt!356113 () SeekEntryResult!8360)

(assert (=> b!797980 (= res!542494 (= lt!356113 lt!356118))))

(declare-fun lt!356120 () array!43378)

(declare-fun lt!356115 () (_ BitVec 64))

(assert (=> b!797980 (= lt!356118 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356115 lt!356120 mask!3266))))

(assert (=> b!797980 (= lt!356113 (seekEntryOrOpen!0 lt!356115 lt!356120 mask!3266))))

(assert (=> b!797980 (= lt!356115 (select (store (arr!20769 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797980 (= lt!356120 (array!43379 (store (arr!20769 a!3170) i!1163 k!2044) (size!21190 a!3170)))))

(declare-fun b!797981 () Bool)

(declare-fun res!542500 () Bool)

(assert (=> b!797981 (=> (not res!542500) (not e!442670))))

(assert (=> b!797981 (= res!542500 (validKeyInArray!0 (select (arr!20769 a!3170) j!153)))))

(declare-fun b!797982 () Bool)

(assert (=> b!797982 (= e!442669 e!442668)))

(declare-fun res!542491 () Bool)

(assert (=> b!797982 (=> (not res!542491) (not e!442668))))

(assert (=> b!797982 (= res!542491 (and (= lt!356116 lt!356117) (= (select (arr!20769 a!3170) index!1236) (select (arr!20769 a!3170) j!153))))))

(assert (=> b!797982 (= lt!356117 (Found!8360 j!153))))

(assert (= (and start!68588 res!542492) b!797977))

(assert (= (and b!797977 res!542490) b!797981))

(assert (= (and b!797981 res!542500) b!797974))

(assert (= (and b!797974 res!542499) b!797973))

(assert (= (and b!797973 res!542501) b!797975))

(assert (= (and b!797975 res!542493) b!797978))

(assert (= (and b!797978 res!542498) b!797979))

(assert (= (and b!797979 res!542495) b!797971))

(assert (= (and b!797971 res!542496) b!797980))

(assert (= (and b!797980 res!542494) b!797972))

(assert (= (and b!797972 res!542497) b!797982))

(assert (= (and b!797982 res!542491) b!797976))

(declare-fun m!738851 () Bool)

(assert (=> b!797978 m!738851))

(declare-fun m!738853 () Bool)

(assert (=> start!68588 m!738853))

(declare-fun m!738855 () Bool)

(assert (=> start!68588 m!738855))

(declare-fun m!738857 () Bool)

(assert (=> b!797982 m!738857))

(declare-fun m!738859 () Bool)

(assert (=> b!797982 m!738859))

(assert (=> b!797972 m!738859))

(assert (=> b!797972 m!738859))

(declare-fun m!738861 () Bool)

(assert (=> b!797972 m!738861))

(assert (=> b!797972 m!738859))

(declare-fun m!738863 () Bool)

(assert (=> b!797972 m!738863))

(assert (=> b!797981 m!738859))

(assert (=> b!797981 m!738859))

(declare-fun m!738865 () Bool)

(assert (=> b!797981 m!738865))

(declare-fun m!738867 () Bool)

(assert (=> b!797973 m!738867))

(declare-fun m!738869 () Bool)

(assert (=> b!797980 m!738869))

(declare-fun m!738871 () Bool)

(assert (=> b!797980 m!738871))

(declare-fun m!738873 () Bool)

(assert (=> b!797980 m!738873))

(declare-fun m!738875 () Bool)

(assert (=> b!797980 m!738875))

(declare-fun m!738877 () Bool)

(assert (=> b!797975 m!738877))

(declare-fun m!738879 () Bool)

(assert (=> b!797974 m!738879))

(declare-fun m!738881 () Bool)

(assert (=> b!797979 m!738881))

(declare-fun m!738883 () Bool)

(assert (=> b!797971 m!738883))

(declare-fun m!738885 () Bool)

(assert (=> b!797971 m!738885))

(push 1)

(assert (not b!797979))

(assert (not b!797981))

(assert (not b!797973))

(assert (not start!68588))

(assert (not b!797975))

(assert (not b!797980))

(assert (not b!797978))

(assert (not b!797972))

(assert (not b!797974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

