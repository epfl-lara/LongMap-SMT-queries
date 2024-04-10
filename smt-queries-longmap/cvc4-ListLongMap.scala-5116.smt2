; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69414 () Bool)

(assert start!69414)

(declare-fun b!809411 () Bool)

(declare-fun res!553142 () Bool)

(declare-fun e!448034 () Bool)

(assert (=> b!809411 (=> (not res!553142) (not e!448034))))

(declare-datatypes ((array!44012 0))(
  ( (array!44013 (arr!21080 (Array (_ BitVec 32) (_ BitVec 64))) (size!21501 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44012)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44012 (_ BitVec 32)) Bool)

(assert (=> b!809411 (= res!553142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809412 () Bool)

(declare-fun res!553139 () Bool)

(assert (=> b!809412 (=> (not res!553139) (not e!448034))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809412 (= res!553139 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21501 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21080 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21501 a!3170)) (= (select (arr!21080 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809413 () Bool)

(declare-fun res!553147 () Bool)

(declare-fun e!448035 () Bool)

(assert (=> b!809413 (=> (not res!553147) (not e!448035))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809413 (= res!553147 (validKeyInArray!0 (select (arr!21080 a!3170) j!153)))))

(declare-fun b!809414 () Bool)

(assert (=> b!809414 (= e!448035 e!448034)))

(declare-fun res!553140 () Bool)

(assert (=> b!809414 (=> (not res!553140) (not e!448034))))

(declare-datatypes ((SeekEntryResult!8671 0))(
  ( (MissingZero!8671 (index!37052 (_ BitVec 32))) (Found!8671 (index!37053 (_ BitVec 32))) (Intermediate!8671 (undefined!9483 Bool) (index!37054 (_ BitVec 32)) (x!67855 (_ BitVec 32))) (Undefined!8671) (MissingVacant!8671 (index!37055 (_ BitVec 32))) )
))
(declare-fun lt!362735 () SeekEntryResult!8671)

(assert (=> b!809414 (= res!553140 (or (= lt!362735 (MissingZero!8671 i!1163)) (= lt!362735 (MissingVacant!8671 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44012 (_ BitVec 32)) SeekEntryResult!8671)

(assert (=> b!809414 (= lt!362735 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809415 () Bool)

(declare-fun res!553146 () Bool)

(assert (=> b!809415 (=> (not res!553146) (not e!448035))))

(assert (=> b!809415 (= res!553146 (validKeyInArray!0 k!2044))))

(declare-fun b!809416 () Bool)

(declare-fun e!448036 () Bool)

(declare-fun e!448033 () Bool)

(assert (=> b!809416 (= e!448036 e!448033)))

(declare-fun res!553144 () Bool)

(assert (=> b!809416 (=> (not res!553144) (not e!448033))))

(declare-fun lt!362734 () SeekEntryResult!8671)

(declare-fun lt!362730 () SeekEntryResult!8671)

(assert (=> b!809416 (= res!553144 (and (= lt!362734 lt!362730) (= lt!362730 (Found!8671 j!153)) (not (= (select (arr!21080 a!3170) index!1236) (select (arr!21080 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44012 (_ BitVec 32)) SeekEntryResult!8671)

(assert (=> b!809416 (= lt!362730 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21080 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809416 (= lt!362734 (seekEntryOrOpen!0 (select (arr!21080 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!553138 () Bool)

(assert (=> start!69414 (=> (not res!553138) (not e!448035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69414 (= res!553138 (validMask!0 mask!3266))))

(assert (=> start!69414 e!448035))

(assert (=> start!69414 true))

(declare-fun array_inv!16876 (array!44012) Bool)

(assert (=> start!69414 (array_inv!16876 a!3170)))

(declare-fun b!809417 () Bool)

(declare-fun res!553141 () Bool)

(assert (=> b!809417 (=> (not res!553141) (not e!448035))))

(declare-fun arrayContainsKey!0 (array!44012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809417 (= res!553141 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809418 () Bool)

(assert (=> b!809418 (= e!448034 e!448036)))

(declare-fun res!553148 () Bool)

(assert (=> b!809418 (=> (not res!553148) (not e!448036))))

(declare-fun lt!362732 () array!44012)

(declare-fun lt!362731 () (_ BitVec 64))

(assert (=> b!809418 (= res!553148 (= (seekEntryOrOpen!0 lt!362731 lt!362732 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362731 lt!362732 mask!3266)))))

(assert (=> b!809418 (= lt!362731 (select (store (arr!21080 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809418 (= lt!362732 (array!44013 (store (arr!21080 a!3170) i!1163 k!2044) (size!21501 a!3170)))))

(declare-fun b!809419 () Bool)

(declare-fun res!553145 () Bool)

(assert (=> b!809419 (=> (not res!553145) (not e!448034))))

(declare-datatypes ((List!15043 0))(
  ( (Nil!15040) (Cons!15039 (h!16168 (_ BitVec 64)) (t!21358 List!15043)) )
))
(declare-fun arrayNoDuplicates!0 (array!44012 (_ BitVec 32) List!15043) Bool)

(assert (=> b!809419 (= res!553145 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15040))))

(declare-fun b!809420 () Bool)

(assert (=> b!809420 (= e!448033 false)))

(declare-fun lt!362733 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809420 (= lt!362733 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809421 () Bool)

(declare-fun res!553143 () Bool)

(assert (=> b!809421 (=> (not res!553143) (not e!448035))))

(assert (=> b!809421 (= res!553143 (and (= (size!21501 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21501 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21501 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69414 res!553138) b!809421))

(assert (= (and b!809421 res!553143) b!809413))

(assert (= (and b!809413 res!553147) b!809415))

(assert (= (and b!809415 res!553146) b!809417))

(assert (= (and b!809417 res!553141) b!809414))

(assert (= (and b!809414 res!553140) b!809411))

(assert (= (and b!809411 res!553142) b!809419))

(assert (= (and b!809419 res!553145) b!809412))

(assert (= (and b!809412 res!553139) b!809418))

(assert (= (and b!809418 res!553148) b!809416))

(assert (= (and b!809416 res!553144) b!809420))

(declare-fun m!751599 () Bool)

(assert (=> b!809413 m!751599))

(assert (=> b!809413 m!751599))

(declare-fun m!751601 () Bool)

(assert (=> b!809413 m!751601))

(declare-fun m!751603 () Bool)

(assert (=> b!809414 m!751603))

(declare-fun m!751605 () Bool)

(assert (=> b!809415 m!751605))

(declare-fun m!751607 () Bool)

(assert (=> b!809420 m!751607))

(declare-fun m!751609 () Bool)

(assert (=> b!809416 m!751609))

(assert (=> b!809416 m!751599))

(assert (=> b!809416 m!751599))

(declare-fun m!751611 () Bool)

(assert (=> b!809416 m!751611))

(assert (=> b!809416 m!751599))

(declare-fun m!751613 () Bool)

(assert (=> b!809416 m!751613))

(declare-fun m!751615 () Bool)

(assert (=> b!809418 m!751615))

(declare-fun m!751617 () Bool)

(assert (=> b!809418 m!751617))

(declare-fun m!751619 () Bool)

(assert (=> b!809418 m!751619))

(declare-fun m!751621 () Bool)

(assert (=> b!809418 m!751621))

(declare-fun m!751623 () Bool)

(assert (=> b!809419 m!751623))

(declare-fun m!751625 () Bool)

(assert (=> b!809417 m!751625))

(declare-fun m!751627 () Bool)

(assert (=> start!69414 m!751627))

(declare-fun m!751629 () Bool)

(assert (=> start!69414 m!751629))

(declare-fun m!751631 () Bool)

(assert (=> b!809411 m!751631))

(declare-fun m!751633 () Bool)

(assert (=> b!809412 m!751633))

(declare-fun m!751635 () Bool)

(assert (=> b!809412 m!751635))

(push 1)

(assert (not b!809417))

(assert (not b!809420))

(assert (not start!69414))

(assert (not b!809418))

(assert (not b!809413))

