; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69392 () Bool)

(assert start!69392)

(declare-fun b!809048 () Bool)

(declare-fun res!552776 () Bool)

(declare-fun e!447869 () Bool)

(assert (=> b!809048 (=> (not res!552776) (not e!447869))))

(declare-datatypes ((array!43990 0))(
  ( (array!43991 (arr!21069 (Array (_ BitVec 32) (_ BitVec 64))) (size!21490 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43990)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809048 (= res!552776 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809049 () Bool)

(declare-fun e!447868 () Bool)

(assert (=> b!809049 (= e!447869 e!447868)))

(declare-fun res!552782 () Bool)

(assert (=> b!809049 (=> (not res!552782) (not e!447868))))

(declare-datatypes ((SeekEntryResult!8660 0))(
  ( (MissingZero!8660 (index!37008 (_ BitVec 32))) (Found!8660 (index!37009 (_ BitVec 32))) (Intermediate!8660 (undefined!9472 Bool) (index!37010 (_ BitVec 32)) (x!67820 (_ BitVec 32))) (Undefined!8660) (MissingVacant!8660 (index!37011 (_ BitVec 32))) )
))
(declare-fun lt!362536 () SeekEntryResult!8660)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809049 (= res!552782 (or (= lt!362536 (MissingZero!8660 i!1163)) (= lt!362536 (MissingVacant!8660 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43990 (_ BitVec 32)) SeekEntryResult!8660)

(assert (=> b!809049 (= lt!362536 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!552778 () Bool)

(assert (=> start!69392 (=> (not res!552778) (not e!447869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69392 (= res!552778 (validMask!0 mask!3266))))

(assert (=> start!69392 e!447869))

(assert (=> start!69392 true))

(declare-fun array_inv!16865 (array!43990) Bool)

(assert (=> start!69392 (array_inv!16865 a!3170)))

(declare-fun b!809050 () Bool)

(declare-fun res!552785 () Bool)

(assert (=> b!809050 (=> (not res!552785) (not e!447869))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809050 (= res!552785 (and (= (size!21490 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21490 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21490 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809051 () Bool)

(declare-fun res!552781 () Bool)

(assert (=> b!809051 (=> (not res!552781) (not e!447869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809051 (= res!552781 (validKeyInArray!0 k!2044))))

(declare-fun b!809052 () Bool)

(declare-fun e!447871 () Bool)

(assert (=> b!809052 (= e!447868 e!447871)))

(declare-fun res!552777 () Bool)

(assert (=> b!809052 (=> (not res!552777) (not e!447871))))

(declare-fun lt!362535 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362532 () array!43990)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43990 (_ BitVec 32)) SeekEntryResult!8660)

(assert (=> b!809052 (= res!552777 (= (seekEntryOrOpen!0 lt!362535 lt!362532 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362535 lt!362532 mask!3266)))))

(assert (=> b!809052 (= lt!362535 (select (store (arr!21069 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809052 (= lt!362532 (array!43991 (store (arr!21069 a!3170) i!1163 k!2044) (size!21490 a!3170)))))

(declare-fun b!809053 () Bool)

(declare-fun res!552780 () Bool)

(assert (=> b!809053 (=> (not res!552780) (not e!447868))))

(declare-datatypes ((List!15032 0))(
  ( (Nil!15029) (Cons!15028 (h!16157 (_ BitVec 64)) (t!21347 List!15032)) )
))
(declare-fun arrayNoDuplicates!0 (array!43990 (_ BitVec 32) List!15032) Bool)

(assert (=> b!809053 (= res!552780 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15029))))

(declare-fun b!809054 () Bool)

(declare-fun e!447872 () Bool)

(assert (=> b!809054 (= e!447871 e!447872)))

(declare-fun res!552783 () Bool)

(assert (=> b!809054 (=> (not res!552783) (not e!447872))))

(declare-fun lt!362534 () SeekEntryResult!8660)

(declare-fun lt!362533 () SeekEntryResult!8660)

(assert (=> b!809054 (= res!552783 (and (= lt!362534 lt!362533) (= lt!362533 (Found!8660 j!153)) (not (= (select (arr!21069 a!3170) index!1236) (select (arr!21069 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809054 (= lt!362533 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21069 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809054 (= lt!362534 (seekEntryOrOpen!0 (select (arr!21069 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809055 () Bool)

(assert (=> b!809055 (= e!447872 false)))

(declare-fun lt!362537 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809055 (= lt!362537 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809056 () Bool)

(declare-fun res!552775 () Bool)

(assert (=> b!809056 (=> (not res!552775) (not e!447868))))

(assert (=> b!809056 (= res!552775 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21490 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21069 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21490 a!3170)) (= (select (arr!21069 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809057 () Bool)

(declare-fun res!552779 () Bool)

(assert (=> b!809057 (=> (not res!552779) (not e!447869))))

(assert (=> b!809057 (= res!552779 (validKeyInArray!0 (select (arr!21069 a!3170) j!153)))))

(declare-fun b!809058 () Bool)

(declare-fun res!552784 () Bool)

(assert (=> b!809058 (=> (not res!552784) (not e!447868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43990 (_ BitVec 32)) Bool)

(assert (=> b!809058 (= res!552784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69392 res!552778) b!809050))

(assert (= (and b!809050 res!552785) b!809057))

(assert (= (and b!809057 res!552779) b!809051))

(assert (= (and b!809051 res!552781) b!809048))

(assert (= (and b!809048 res!552776) b!809049))

(assert (= (and b!809049 res!552782) b!809058))

(assert (= (and b!809058 res!552784) b!809053))

(assert (= (and b!809053 res!552780) b!809056))

(assert (= (and b!809056 res!552775) b!809052))

(assert (= (and b!809052 res!552777) b!809054))

(assert (= (and b!809054 res!552783) b!809055))

(declare-fun m!751181 () Bool)

(assert (=> b!809048 m!751181))

(declare-fun m!751183 () Bool)

(assert (=> b!809049 m!751183))

(declare-fun m!751185 () Bool)

(assert (=> b!809051 m!751185))

(declare-fun m!751187 () Bool)

(assert (=> b!809058 m!751187))

(declare-fun m!751189 () Bool)

(assert (=> b!809057 m!751189))

(assert (=> b!809057 m!751189))

(declare-fun m!751191 () Bool)

(assert (=> b!809057 m!751191))

(declare-fun m!751193 () Bool)

(assert (=> start!69392 m!751193))

(declare-fun m!751195 () Bool)

(assert (=> start!69392 m!751195))

(declare-fun m!751197 () Bool)

(assert (=> b!809053 m!751197))

(declare-fun m!751199 () Bool)

(assert (=> b!809056 m!751199))

(declare-fun m!751201 () Bool)

(assert (=> b!809056 m!751201))

(declare-fun m!751203 () Bool)

(assert (=> b!809052 m!751203))

(declare-fun m!751205 () Bool)

(assert (=> b!809052 m!751205))

(declare-fun m!751207 () Bool)

(assert (=> b!809052 m!751207))

(declare-fun m!751209 () Bool)

(assert (=> b!809052 m!751209))

(declare-fun m!751211 () Bool)

(assert (=> b!809054 m!751211))

(assert (=> b!809054 m!751189))

(assert (=> b!809054 m!751189))

(declare-fun m!751213 () Bool)

(assert (=> b!809054 m!751213))

(assert (=> b!809054 m!751189))

(declare-fun m!751215 () Bool)

(assert (=> b!809054 m!751215))

(declare-fun m!751217 () Bool)

(assert (=> b!809055 m!751217))

(push 1)

