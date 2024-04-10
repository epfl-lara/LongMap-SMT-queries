; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68532 () Bool)

(assert start!68532)

(declare-fun b!796990 () Bool)

(declare-fun res!541518 () Bool)

(declare-fun e!442194 () Bool)

(assert (=> b!796990 (=> (not res!541518) (not e!442194))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43322 0))(
  ( (array!43323 (arr!20741 (Array (_ BitVec 32) (_ BitVec 64))) (size!21162 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43322)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!796990 (= res!541518 (and (= (size!21162 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21162 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21162 a!3170)) (not (= i!1163 j!153))))))

(declare-datatypes ((SeekEntryResult!8332 0))(
  ( (MissingZero!8332 (index!35696 (_ BitVec 32))) (Found!8332 (index!35697 (_ BitVec 32))) (Intermediate!8332 (undefined!9144 Bool) (index!35698 (_ BitVec 32)) (x!66594 (_ BitVec 32))) (Undefined!8332) (MissingVacant!8332 (index!35699 (_ BitVec 32))) )
))
(declare-fun lt!355479 () SeekEntryResult!8332)

(declare-fun b!796991 () Bool)

(declare-fun e!442192 () Bool)

(declare-fun lt!355478 () SeekEntryResult!8332)

(assert (=> b!796991 (= e!442192 (not (or (not (= lt!355478 lt!355479)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796991 (= lt!355478 (Found!8332 index!1236))))

(declare-fun b!796992 () Bool)

(declare-fun e!442191 () Bool)

(declare-fun e!442196 () Bool)

(assert (=> b!796992 (= e!442191 e!442196)))

(declare-fun res!541515 () Bool)

(assert (=> b!796992 (=> (not res!541515) (not e!442196))))

(declare-fun lt!355477 () SeekEntryResult!8332)

(assert (=> b!796992 (= res!541515 (= lt!355477 lt!355478))))

(declare-fun lt!355483 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355480 () array!43322)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43322 (_ BitVec 32)) SeekEntryResult!8332)

(assert (=> b!796992 (= lt!355478 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355483 lt!355480 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43322 (_ BitVec 32)) SeekEntryResult!8332)

(assert (=> b!796992 (= lt!355477 (seekEntryOrOpen!0 lt!355483 lt!355480 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!796992 (= lt!355483 (select (store (arr!20741 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796992 (= lt!355480 (array!43323 (store (arr!20741 a!3170) i!1163 k!2044) (size!21162 a!3170)))))

(declare-fun b!796993 () Bool)

(declare-fun res!541519 () Bool)

(assert (=> b!796993 (=> (not res!541519) (not e!442194))))

(declare-fun arrayContainsKey!0 (array!43322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796993 (= res!541519 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796994 () Bool)

(declare-fun e!442195 () Bool)

(assert (=> b!796994 (= e!442195 e!442192)))

(declare-fun res!541514 () Bool)

(assert (=> b!796994 (=> (not res!541514) (not e!442192))))

(declare-fun lt!355481 () SeekEntryResult!8332)

(assert (=> b!796994 (= res!541514 (and (= lt!355481 lt!355479) (= (select (arr!20741 a!3170) index!1236) (select (arr!20741 a!3170) j!153))))))

(assert (=> b!796994 (= lt!355479 (Found!8332 j!153))))

(declare-fun b!796995 () Bool)

(assert (=> b!796995 (= e!442194 e!442191)))

(declare-fun res!541516 () Bool)

(assert (=> b!796995 (=> (not res!541516) (not e!442191))))

(declare-fun lt!355484 () SeekEntryResult!8332)

(assert (=> b!796995 (= res!541516 (or (= lt!355484 (MissingZero!8332 i!1163)) (= lt!355484 (MissingVacant!8332 i!1163))))))

(assert (=> b!796995 (= lt!355484 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796996 () Bool)

(declare-fun res!541509 () Bool)

(assert (=> b!796996 (=> (not res!541509) (not e!442191))))

(declare-datatypes ((List!14704 0))(
  ( (Nil!14701) (Cons!14700 (h!15829 (_ BitVec 64)) (t!21019 List!14704)) )
))
(declare-fun arrayNoDuplicates!0 (array!43322 (_ BitVec 32) List!14704) Bool)

(assert (=> b!796996 (= res!541509 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14701))))

(declare-fun b!796997 () Bool)

(assert (=> b!796997 (= e!442196 e!442195)))

(declare-fun res!541520 () Bool)

(assert (=> b!796997 (=> (not res!541520) (not e!442195))))

(declare-fun lt!355482 () SeekEntryResult!8332)

(assert (=> b!796997 (= res!541520 (= lt!355482 lt!355481))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796997 (= lt!355481 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20741 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796997 (= lt!355482 (seekEntryOrOpen!0 (select (arr!20741 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796998 () Bool)

(declare-fun res!541517 () Bool)

(assert (=> b!796998 (=> (not res!541517) (not e!442191))))

(assert (=> b!796998 (= res!541517 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21162 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20741 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21162 a!3170)) (= (select (arr!20741 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796999 () Bool)

(declare-fun res!541513 () Bool)

(assert (=> b!796999 (=> (not res!541513) (not e!442194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796999 (= res!541513 (validKeyInArray!0 (select (arr!20741 a!3170) j!153)))))

(declare-fun res!541512 () Bool)

(assert (=> start!68532 (=> (not res!541512) (not e!442194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68532 (= res!541512 (validMask!0 mask!3266))))

(assert (=> start!68532 e!442194))

(assert (=> start!68532 true))

(declare-fun array_inv!16537 (array!43322) Bool)

(assert (=> start!68532 (array_inv!16537 a!3170)))

(declare-fun b!797000 () Bool)

(declare-fun res!541510 () Bool)

(assert (=> b!797000 (=> (not res!541510) (not e!442191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43322 (_ BitVec 32)) Bool)

(assert (=> b!797000 (= res!541510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797001 () Bool)

(declare-fun res!541511 () Bool)

(assert (=> b!797001 (=> (not res!541511) (not e!442194))))

(assert (=> b!797001 (= res!541511 (validKeyInArray!0 k!2044))))

(assert (= (and start!68532 res!541512) b!796990))

(assert (= (and b!796990 res!541518) b!796999))

(assert (= (and b!796999 res!541513) b!797001))

(assert (= (and b!797001 res!541511) b!796993))

(assert (= (and b!796993 res!541519) b!796995))

(assert (= (and b!796995 res!541516) b!797000))

(assert (= (and b!797000 res!541510) b!796996))

(assert (= (and b!796996 res!541509) b!796998))

(assert (= (and b!796998 res!541517) b!796992))

(assert (= (and b!796992 res!541515) b!796997))

(assert (= (and b!796997 res!541520) b!796994))

(assert (= (and b!796994 res!541514) b!796991))

(declare-fun m!737825 () Bool)

(assert (=> b!796997 m!737825))

(assert (=> b!796997 m!737825))

(declare-fun m!737827 () Bool)

(assert (=> b!796997 m!737827))

(assert (=> b!796997 m!737825))

(declare-fun m!737829 () Bool)

(assert (=> b!796997 m!737829))

(declare-fun m!737831 () Bool)

(assert (=> b!796993 m!737831))

(declare-fun m!737833 () Bool)

(assert (=> b!796995 m!737833))

(declare-fun m!737835 () Bool)

(assert (=> b!796996 m!737835))

(declare-fun m!737837 () Bool)

(assert (=> start!68532 m!737837))

(declare-fun m!737839 () Bool)

(assert (=> start!68532 m!737839))

(declare-fun m!737841 () Bool)

(assert (=> b!796994 m!737841))

(assert (=> b!796994 m!737825))

(declare-fun m!737843 () Bool)

(assert (=> b!797001 m!737843))

(declare-fun m!737845 () Bool)

(assert (=> b!796998 m!737845))

(declare-fun m!737847 () Bool)

(assert (=> b!796998 m!737847))

(assert (=> b!796999 m!737825))

(assert (=> b!796999 m!737825))

(declare-fun m!737849 () Bool)

(assert (=> b!796999 m!737849))

(declare-fun m!737851 () Bool)

(assert (=> b!797000 m!737851))

(declare-fun m!737853 () Bool)

(assert (=> b!796992 m!737853))

(declare-fun m!737855 () Bool)

(assert (=> b!796992 m!737855))

(declare-fun m!737857 () Bool)

(assert (=> b!796992 m!737857))

(declare-fun m!737859 () Bool)

(assert (=> b!796992 m!737859))

(push 1)

(assert (not b!796993))

(assert (not b!797000))

(assert (not b!796999))

