; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68912 () Bool)

(assert start!68912)

(declare-fun b!801723 () Bool)

(declare-fun res!545700 () Bool)

(declare-fun e!444546 () Bool)

(assert (=> b!801723 (=> (not res!545700) (not e!444546))))

(declare-datatypes ((array!43534 0))(
  ( (array!43535 (arr!20842 (Array (_ BitVec 32) (_ BitVec 64))) (size!21262 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43534)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801723 (= res!545700 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801724 () Bool)

(declare-fun res!545694 () Bool)

(assert (=> b!801724 (=> (not res!545694) (not e!444546))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801724 (= res!545694 (validKeyInArray!0 (select (arr!20842 a!3170) j!153)))))

(declare-fun b!801725 () Bool)

(declare-fun res!545697 () Bool)

(assert (=> b!801725 (=> (not res!545697) (not e!444546))))

(assert (=> b!801725 (= res!545697 (validKeyInArray!0 k0!2044))))

(declare-fun b!801726 () Bool)

(declare-fun e!444547 () Bool)

(assert (=> b!801726 (= e!444547 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8389 0))(
  ( (MissingZero!8389 (index!35924 (_ BitVec 32))) (Found!8389 (index!35925 (_ BitVec 32))) (Intermediate!8389 (undefined!9201 Bool) (index!35926 (_ BitVec 32)) (x!66953 (_ BitVec 32))) (Undefined!8389) (MissingVacant!8389 (index!35927 (_ BitVec 32))) )
))
(declare-fun lt!358207 () SeekEntryResult!8389)

(declare-fun lt!358211 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43534 (_ BitVec 32)) SeekEntryResult!8389)

(assert (=> b!801726 (= lt!358207 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358211 vacantBefore!23 (select (arr!20842 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801727 () Bool)

(declare-fun res!545705 () Bool)

(assert (=> b!801727 (=> (not res!545705) (not e!444546))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801727 (= res!545705 (and (= (size!21262 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21262 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21262 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801728 () Bool)

(declare-fun res!545701 () Bool)

(declare-fun e!444548 () Bool)

(assert (=> b!801728 (=> (not res!545701) (not e!444548))))

(declare-datatypes ((List!14712 0))(
  ( (Nil!14709) (Cons!14708 (h!15843 (_ BitVec 64)) (t!21019 List!14712)) )
))
(declare-fun arrayNoDuplicates!0 (array!43534 (_ BitVec 32) List!14712) Bool)

(assert (=> b!801728 (= res!545701 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14709))))

(declare-fun b!801729 () Bool)

(declare-fun res!545698 () Bool)

(assert (=> b!801729 (=> (not res!545698) (not e!444548))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801729 (= res!545698 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21262 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20842 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21262 a!3170)) (= (select (arr!20842 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801730 () Bool)

(declare-fun e!444545 () Bool)

(assert (=> b!801730 (= e!444548 e!444545)))

(declare-fun res!545702 () Bool)

(assert (=> b!801730 (=> (not res!545702) (not e!444545))))

(declare-fun lt!358210 () (_ BitVec 64))

(declare-fun lt!358214 () array!43534)

(declare-fun lt!358213 () SeekEntryResult!8389)

(assert (=> b!801730 (= res!545702 (= lt!358213 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358210 lt!358214 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43534 (_ BitVec 32)) SeekEntryResult!8389)

(assert (=> b!801730 (= lt!358213 (seekEntryOrOpen!0 lt!358210 lt!358214 mask!3266))))

(assert (=> b!801730 (= lt!358210 (select (store (arr!20842 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801730 (= lt!358214 (array!43535 (store (arr!20842 a!3170) i!1163 k0!2044) (size!21262 a!3170)))))

(declare-fun res!545696 () Bool)

(assert (=> start!68912 (=> (not res!545696) (not e!444546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68912 (= res!545696 (validMask!0 mask!3266))))

(assert (=> start!68912 e!444546))

(assert (=> start!68912 true))

(declare-fun array_inv!16701 (array!43534) Bool)

(assert (=> start!68912 (array_inv!16701 a!3170)))

(declare-fun b!801731 () Bool)

(declare-fun e!444550 () Bool)

(assert (=> b!801731 (= e!444545 e!444550)))

(declare-fun res!545703 () Bool)

(assert (=> b!801731 (=> (not res!545703) (not e!444550))))

(declare-fun lt!358212 () SeekEntryResult!8389)

(declare-fun lt!358208 () SeekEntryResult!8389)

(assert (=> b!801731 (= res!545703 (and (= lt!358208 lt!358212) (= lt!358212 (Found!8389 j!153)) (not (= (select (arr!20842 a!3170) index!1236) (select (arr!20842 a!3170) j!153)))))))

(assert (=> b!801731 (= lt!358212 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20842 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801731 (= lt!358208 (seekEntryOrOpen!0 (select (arr!20842 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801732 () Bool)

(declare-fun res!545704 () Bool)

(assert (=> b!801732 (=> (not res!545704) (not e!444548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43534 (_ BitVec 32)) Bool)

(assert (=> b!801732 (= res!545704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801733 () Bool)

(declare-fun res!545695 () Bool)

(assert (=> b!801733 (=> (not res!545695) (not e!444547))))

(assert (=> b!801733 (= res!545695 (= lt!358213 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358211 vacantAfter!23 lt!358210 lt!358214 mask!3266)))))

(declare-fun b!801734 () Bool)

(assert (=> b!801734 (= e!444550 e!444547)))

(declare-fun res!545706 () Bool)

(assert (=> b!801734 (=> (not res!545706) (not e!444547))))

(assert (=> b!801734 (= res!545706 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358211 #b00000000000000000000000000000000) (bvslt lt!358211 (size!21262 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801734 (= lt!358211 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801735 () Bool)

(assert (=> b!801735 (= e!444546 e!444548)))

(declare-fun res!545699 () Bool)

(assert (=> b!801735 (=> (not res!545699) (not e!444548))))

(declare-fun lt!358209 () SeekEntryResult!8389)

(assert (=> b!801735 (= res!545699 (or (= lt!358209 (MissingZero!8389 i!1163)) (= lt!358209 (MissingVacant!8389 i!1163))))))

(assert (=> b!801735 (= lt!358209 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68912 res!545696) b!801727))

(assert (= (and b!801727 res!545705) b!801724))

(assert (= (and b!801724 res!545694) b!801725))

(assert (= (and b!801725 res!545697) b!801723))

(assert (= (and b!801723 res!545700) b!801735))

(assert (= (and b!801735 res!545699) b!801732))

(assert (= (and b!801732 res!545704) b!801728))

(assert (= (and b!801728 res!545701) b!801729))

(assert (= (and b!801729 res!545698) b!801730))

(assert (= (and b!801730 res!545702) b!801731))

(assert (= (and b!801731 res!545703) b!801734))

(assert (= (and b!801734 res!545706) b!801733))

(assert (= (and b!801733 res!545695) b!801726))

(declare-fun m!743209 () Bool)

(assert (=> b!801723 m!743209))

(declare-fun m!743211 () Bool)

(assert (=> b!801731 m!743211))

(declare-fun m!743213 () Bool)

(assert (=> b!801731 m!743213))

(assert (=> b!801731 m!743213))

(declare-fun m!743215 () Bool)

(assert (=> b!801731 m!743215))

(assert (=> b!801731 m!743213))

(declare-fun m!743217 () Bool)

(assert (=> b!801731 m!743217))

(declare-fun m!743219 () Bool)

(assert (=> b!801733 m!743219))

(declare-fun m!743221 () Bool)

(assert (=> b!801734 m!743221))

(declare-fun m!743223 () Bool)

(assert (=> b!801729 m!743223))

(declare-fun m!743225 () Bool)

(assert (=> b!801729 m!743225))

(declare-fun m!743227 () Bool)

(assert (=> b!801728 m!743227))

(declare-fun m!743229 () Bool)

(assert (=> b!801730 m!743229))

(declare-fun m!743231 () Bool)

(assert (=> b!801730 m!743231))

(declare-fun m!743233 () Bool)

(assert (=> b!801730 m!743233))

(declare-fun m!743235 () Bool)

(assert (=> b!801730 m!743235))

(declare-fun m!743237 () Bool)

(assert (=> b!801735 m!743237))

(assert (=> b!801724 m!743213))

(assert (=> b!801724 m!743213))

(declare-fun m!743239 () Bool)

(assert (=> b!801724 m!743239))

(declare-fun m!743241 () Bool)

(assert (=> start!68912 m!743241))

(declare-fun m!743243 () Bool)

(assert (=> start!68912 m!743243))

(assert (=> b!801726 m!743213))

(assert (=> b!801726 m!743213))

(declare-fun m!743245 () Bool)

(assert (=> b!801726 m!743245))

(declare-fun m!743247 () Bool)

(assert (=> b!801725 m!743247))

(declare-fun m!743249 () Bool)

(assert (=> b!801732 m!743249))

(check-sat (not b!801723) (not b!801733) (not b!801728) (not b!801735) (not b!801724) (not start!68912) (not b!801732) (not b!801731) (not b!801725) (not b!801726) (not b!801734) (not b!801730))
(check-sat)
