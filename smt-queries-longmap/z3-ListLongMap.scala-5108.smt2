; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69234 () Bool)

(assert start!69234)

(declare-fun b!807781 () Bool)

(declare-fun e!447166 () Bool)

(declare-fun e!447167 () Bool)

(assert (=> b!807781 (= e!447166 e!447167)))

(declare-fun res!552054 () Bool)

(assert (=> b!807781 (=> (not res!552054) (not e!447167))))

(declare-datatypes ((SeekEntryResult!8641 0))(
  ( (MissingZero!8641 (index!36932 (_ BitVec 32))) (Found!8641 (index!36933 (_ BitVec 32))) (Intermediate!8641 (undefined!9453 Bool) (index!36934 (_ BitVec 32)) (x!67744 (_ BitVec 32))) (Undefined!8641) (MissingVacant!8641 (index!36935 (_ BitVec 32))) )
))
(declare-fun lt!361817 () SeekEntryResult!8641)

(declare-datatypes ((array!43951 0))(
  ( (array!43952 (arr!21053 (Array (_ BitVec 32) (_ BitVec 64))) (size!21474 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43951)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!361812 () SeekEntryResult!8641)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807781 (= res!552054 (and (= lt!361812 lt!361817) (= lt!361817 (Found!8641 j!153)) (not (= (select (arr!21053 a!3170) index!1236) (select (arr!21053 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43951 (_ BitVec 32)) SeekEntryResult!8641)

(assert (=> b!807781 (= lt!361817 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21053 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43951 (_ BitVec 32)) SeekEntryResult!8641)

(assert (=> b!807781 (= lt!361812 (seekEntryOrOpen!0 (select (arr!21053 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807782 () Bool)

(declare-fun res!552052 () Bool)

(declare-fun e!447165 () Bool)

(assert (=> b!807782 (=> (not res!552052) (not e!447165))))

(declare-datatypes ((List!15055 0))(
  ( (Nil!15052) (Cons!15051 (h!16180 (_ BitVec 64)) (t!21361 List!15055)) )
))
(declare-fun arrayNoDuplicates!0 (array!43951 (_ BitVec 32) List!15055) Bool)

(assert (=> b!807782 (= res!552052 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15052))))

(declare-fun b!807783 () Bool)

(declare-fun e!447168 () Bool)

(assert (=> b!807783 (= e!447168 e!447165)))

(declare-fun res!552053 () Bool)

(assert (=> b!807783 (=> (not res!552053) (not e!447165))))

(declare-fun lt!361816 () SeekEntryResult!8641)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807783 (= res!552053 (or (= lt!361816 (MissingZero!8641 i!1163)) (= lt!361816 (MissingVacant!8641 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!807783 (= lt!361816 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807784 () Bool)

(declare-fun res!552046 () Bool)

(assert (=> b!807784 (=> (not res!552046) (not e!447168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807784 (= res!552046 (validKeyInArray!0 k0!2044))))

(declare-fun res!552048 () Bool)

(assert (=> start!69234 (=> (not res!552048) (not e!447168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69234 (= res!552048 (validMask!0 mask!3266))))

(assert (=> start!69234 e!447168))

(assert (=> start!69234 true))

(declare-fun array_inv!16936 (array!43951) Bool)

(assert (=> start!69234 (array_inv!16936 a!3170)))

(declare-fun b!807785 () Bool)

(assert (=> b!807785 (= e!447167 false)))

(declare-fun lt!361814 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807785 (= lt!361814 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807786 () Bool)

(declare-fun res!552044 () Bool)

(assert (=> b!807786 (=> (not res!552044) (not e!447165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43951 (_ BitVec 32)) Bool)

(assert (=> b!807786 (= res!552044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807787 () Bool)

(declare-fun res!552047 () Bool)

(assert (=> b!807787 (=> (not res!552047) (not e!447168))))

(assert (=> b!807787 (= res!552047 (and (= (size!21474 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21474 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21474 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807788 () Bool)

(declare-fun res!552049 () Bool)

(assert (=> b!807788 (=> (not res!552049) (not e!447168))))

(declare-fun arrayContainsKey!0 (array!43951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807788 (= res!552049 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807789 () Bool)

(declare-fun res!552045 () Bool)

(assert (=> b!807789 (=> (not res!552045) (not e!447165))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!807789 (= res!552045 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21474 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21053 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21474 a!3170)) (= (select (arr!21053 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807790 () Bool)

(assert (=> b!807790 (= e!447165 e!447166)))

(declare-fun res!552050 () Bool)

(assert (=> b!807790 (=> (not res!552050) (not e!447166))))

(declare-fun lt!361815 () array!43951)

(declare-fun lt!361813 () (_ BitVec 64))

(assert (=> b!807790 (= res!552050 (= (seekEntryOrOpen!0 lt!361813 lt!361815 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361813 lt!361815 mask!3266)))))

(assert (=> b!807790 (= lt!361813 (select (store (arr!21053 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807790 (= lt!361815 (array!43952 (store (arr!21053 a!3170) i!1163 k0!2044) (size!21474 a!3170)))))

(declare-fun b!807791 () Bool)

(declare-fun res!552051 () Bool)

(assert (=> b!807791 (=> (not res!552051) (not e!447168))))

(assert (=> b!807791 (= res!552051 (validKeyInArray!0 (select (arr!21053 a!3170) j!153)))))

(assert (= (and start!69234 res!552048) b!807787))

(assert (= (and b!807787 res!552047) b!807791))

(assert (= (and b!807791 res!552051) b!807784))

(assert (= (and b!807784 res!552046) b!807788))

(assert (= (and b!807788 res!552049) b!807783))

(assert (= (and b!807783 res!552053) b!807786))

(assert (= (and b!807786 res!552044) b!807782))

(assert (= (and b!807782 res!552052) b!807789))

(assert (= (and b!807789 res!552045) b!807790))

(assert (= (and b!807790 res!552050) b!807781))

(assert (= (and b!807781 res!552054) b!807785))

(declare-fun m!749413 () Bool)

(assert (=> b!807783 m!749413))

(declare-fun m!749415 () Bool)

(assert (=> b!807788 m!749415))

(declare-fun m!749417 () Bool)

(assert (=> b!807785 m!749417))

(declare-fun m!749419 () Bool)

(assert (=> start!69234 m!749419))

(declare-fun m!749421 () Bool)

(assert (=> start!69234 m!749421))

(declare-fun m!749423 () Bool)

(assert (=> b!807789 m!749423))

(declare-fun m!749425 () Bool)

(assert (=> b!807789 m!749425))

(declare-fun m!749427 () Bool)

(assert (=> b!807791 m!749427))

(assert (=> b!807791 m!749427))

(declare-fun m!749429 () Bool)

(assert (=> b!807791 m!749429))

(declare-fun m!749431 () Bool)

(assert (=> b!807790 m!749431))

(declare-fun m!749433 () Bool)

(assert (=> b!807790 m!749433))

(declare-fun m!749435 () Bool)

(assert (=> b!807790 m!749435))

(declare-fun m!749437 () Bool)

(assert (=> b!807790 m!749437))

(declare-fun m!749439 () Bool)

(assert (=> b!807782 m!749439))

(declare-fun m!749441 () Bool)

(assert (=> b!807781 m!749441))

(assert (=> b!807781 m!749427))

(assert (=> b!807781 m!749427))

(declare-fun m!749443 () Bool)

(assert (=> b!807781 m!749443))

(assert (=> b!807781 m!749427))

(declare-fun m!749445 () Bool)

(assert (=> b!807781 m!749445))

(declare-fun m!749447 () Bool)

(assert (=> b!807784 m!749447))

(declare-fun m!749449 () Bool)

(assert (=> b!807786 m!749449))

(check-sat (not b!807786) (not b!807784) (not b!807791) (not b!807790) (not b!807788) (not b!807781) (not b!807785) (not start!69234) (not b!807783) (not b!807782))
(check-sat)
