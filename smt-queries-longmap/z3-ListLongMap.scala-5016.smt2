; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68586 () Bool)

(assert start!68586)

(declare-fun b!798034 () Bool)

(declare-fun e!442669 () Bool)

(declare-fun e!442666 () Bool)

(assert (=> b!798034 (= e!442669 e!442666)))

(declare-fun res!542702 () Bool)

(assert (=> b!798034 (=> (not res!542702) (not e!442666))))

(declare-datatypes ((SeekEntryResult!8365 0))(
  ( (MissingZero!8365 (index!35828 (_ BitVec 32))) (Found!8365 (index!35829 (_ BitVec 32))) (Intermediate!8365 (undefined!9177 Bool) (index!35830 (_ BitVec 32)) (x!66726 (_ BitVec 32))) (Undefined!8365) (MissingVacant!8365 (index!35831 (_ BitVec 32))) )
))
(declare-fun lt!356081 () SeekEntryResult!8365)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798034 (= res!542702 (or (= lt!356081 (MissingZero!8365 i!1163)) (= lt!356081 (MissingVacant!8365 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43393 0))(
  ( (array!43394 (arr!20777 (Array (_ BitVec 32) (_ BitVec 64))) (size!21198 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43393)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43393 (_ BitVec 32)) SeekEntryResult!8365)

(assert (=> b!798034 (= lt!356081 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798035 () Bool)

(declare-fun e!442665 () Bool)

(declare-fun e!442667 () Bool)

(assert (=> b!798035 (= e!442665 e!442667)))

(declare-fun res!542700 () Bool)

(assert (=> b!798035 (=> (not res!542700) (not e!442667))))

(declare-fun lt!356082 () SeekEntryResult!8365)

(declare-fun lt!356083 () SeekEntryResult!8365)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798035 (= res!542700 (and (= lt!356082 lt!356083) (= lt!356083 (Found!8365 j!153)) (= (select (arr!20777 a!3170) index!1236) (select (arr!20777 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43393 (_ BitVec 32)) SeekEntryResult!8365)

(assert (=> b!798035 (= lt!356083 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20777 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798035 (= lt!356082 (seekEntryOrOpen!0 (select (arr!20777 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798036 () Bool)

(declare-fun res!542696 () Bool)

(assert (=> b!798036 (=> (not res!542696) (not e!442669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798036 (= res!542696 (validKeyInArray!0 k0!2044))))

(declare-fun b!798037 () Bool)

(declare-fun res!542694 () Bool)

(assert (=> b!798037 (=> (not res!542694) (not e!442666))))

(declare-datatypes ((List!14779 0))(
  ( (Nil!14776) (Cons!14775 (h!15904 (_ BitVec 64)) (t!21085 List!14779)) )
))
(declare-fun arrayNoDuplicates!0 (array!43393 (_ BitVec 32) List!14779) Bool)

(assert (=> b!798037 (= res!542694 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14776))))

(declare-fun b!798038 () Bool)

(declare-fun res!542695 () Bool)

(assert (=> b!798038 (=> (not res!542695) (not e!442666))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!798038 (= res!542695 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21198 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20777 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21198 a!3170)) (= (select (arr!20777 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798039 () Bool)

(declare-fun res!542699 () Bool)

(assert (=> b!798039 (=> (not res!542699) (not e!442669))))

(assert (=> b!798039 (= res!542699 (and (= (size!21198 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21198 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21198 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798040 () Bool)

(declare-fun res!542703 () Bool)

(assert (=> b!798040 (=> (not res!542703) (not e!442669))))

(assert (=> b!798040 (= res!542703 (validKeyInArray!0 (select (arr!20777 a!3170) j!153)))))

(declare-fun b!798041 () Bool)

(declare-fun res!542697 () Bool)

(assert (=> b!798041 (=> (not res!542697) (not e!442669))))

(declare-fun arrayContainsKey!0 (array!43393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798041 (= res!542697 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798042 () Bool)

(assert (=> b!798042 (= e!442667 (not true))))

(declare-fun lt!356084 () SeekEntryResult!8365)

(assert (=> b!798042 (= lt!356084 (Found!8365 index!1236))))

(declare-fun res!542698 () Bool)

(assert (=> start!68586 (=> (not res!542698) (not e!442669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68586 (= res!542698 (validMask!0 mask!3266))))

(assert (=> start!68586 e!442669))

(assert (=> start!68586 true))

(declare-fun array_inv!16660 (array!43393) Bool)

(assert (=> start!68586 (array_inv!16660 a!3170)))

(declare-fun b!798043 () Bool)

(declare-fun res!542701 () Bool)

(assert (=> b!798043 (=> (not res!542701) (not e!442666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43393 (_ BitVec 32)) Bool)

(assert (=> b!798043 (= res!542701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798044 () Bool)

(assert (=> b!798044 (= e!442666 e!442665)))

(declare-fun res!542693 () Bool)

(assert (=> b!798044 (=> (not res!542693) (not e!442665))))

(declare-fun lt!356079 () SeekEntryResult!8365)

(assert (=> b!798044 (= res!542693 (= lt!356079 lt!356084))))

(declare-fun lt!356080 () array!43393)

(declare-fun lt!356078 () (_ BitVec 64))

(assert (=> b!798044 (= lt!356084 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356078 lt!356080 mask!3266))))

(assert (=> b!798044 (= lt!356079 (seekEntryOrOpen!0 lt!356078 lt!356080 mask!3266))))

(assert (=> b!798044 (= lt!356078 (select (store (arr!20777 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798044 (= lt!356080 (array!43394 (store (arr!20777 a!3170) i!1163 k0!2044) (size!21198 a!3170)))))

(assert (= (and start!68586 res!542698) b!798039))

(assert (= (and b!798039 res!542699) b!798040))

(assert (= (and b!798040 res!542703) b!798036))

(assert (= (and b!798036 res!542696) b!798041))

(assert (= (and b!798041 res!542697) b!798034))

(assert (= (and b!798034 res!542702) b!798043))

(assert (= (and b!798043 res!542701) b!798037))

(assert (= (and b!798037 res!542694) b!798038))

(assert (= (and b!798038 res!542695) b!798044))

(assert (= (and b!798044 res!542693) b!798035))

(assert (= (and b!798035 res!542700) b!798042))

(declare-fun m!738433 () Bool)

(assert (=> b!798041 m!738433))

(declare-fun m!738435 () Bool)

(assert (=> b!798044 m!738435))

(declare-fun m!738437 () Bool)

(assert (=> b!798044 m!738437))

(declare-fun m!738439 () Bool)

(assert (=> b!798044 m!738439))

(declare-fun m!738441 () Bool)

(assert (=> b!798044 m!738441))

(declare-fun m!738443 () Bool)

(assert (=> start!68586 m!738443))

(declare-fun m!738445 () Bool)

(assert (=> start!68586 m!738445))

(declare-fun m!738447 () Bool)

(assert (=> b!798037 m!738447))

(declare-fun m!738449 () Bool)

(assert (=> b!798035 m!738449))

(declare-fun m!738451 () Bool)

(assert (=> b!798035 m!738451))

(assert (=> b!798035 m!738451))

(declare-fun m!738453 () Bool)

(assert (=> b!798035 m!738453))

(assert (=> b!798035 m!738451))

(declare-fun m!738455 () Bool)

(assert (=> b!798035 m!738455))

(assert (=> b!798040 m!738451))

(assert (=> b!798040 m!738451))

(declare-fun m!738457 () Bool)

(assert (=> b!798040 m!738457))

(declare-fun m!738459 () Bool)

(assert (=> b!798034 m!738459))

(declare-fun m!738461 () Bool)

(assert (=> b!798036 m!738461))

(declare-fun m!738463 () Bool)

(assert (=> b!798038 m!738463))

(declare-fun m!738465 () Bool)

(assert (=> b!798038 m!738465))

(declare-fun m!738467 () Bool)

(assert (=> b!798043 m!738467))

(check-sat (not b!798037) (not b!798035) (not b!798044) (not b!798041) (not start!68586) (not b!798034) (not b!798040) (not b!798036) (not b!798043))
(check-sat)
