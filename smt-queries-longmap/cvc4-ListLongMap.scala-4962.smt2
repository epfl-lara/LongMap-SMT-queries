; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68286 () Bool)

(assert start!68286)

(declare-fun b!793278 () Bool)

(declare-fun res!537798 () Bool)

(declare-fun e!440702 () Bool)

(assert (=> b!793278 (=> (not res!537798) (not e!440702))))

(declare-datatypes ((array!43076 0))(
  ( (array!43077 (arr!20618 (Array (_ BitVec 32) (_ BitVec 64))) (size!21039 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43076)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793278 (= res!537798 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793279 () Bool)

(declare-fun res!537802 () Bool)

(assert (=> b!793279 (=> (not res!537802) (not e!440702))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793279 (= res!537802 (and (= (size!21039 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21039 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21039 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793280 () Bool)

(declare-fun e!440700 () Bool)

(assert (=> b!793280 (= e!440700 false)))

(declare-fun lt!353684 () Bool)

(declare-datatypes ((List!14581 0))(
  ( (Nil!14578) (Cons!14577 (h!15706 (_ BitVec 64)) (t!20896 List!14581)) )
))
(declare-fun arrayNoDuplicates!0 (array!43076 (_ BitVec 32) List!14581) Bool)

(assert (=> b!793280 (= lt!353684 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14578))))

(declare-fun b!793281 () Bool)

(declare-fun res!537800 () Bool)

(assert (=> b!793281 (=> (not res!537800) (not e!440702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793281 (= res!537800 (validKeyInArray!0 (select (arr!20618 a!3170) j!153)))))

(declare-fun res!537803 () Bool)

(assert (=> start!68286 (=> (not res!537803) (not e!440702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68286 (= res!537803 (validMask!0 mask!3266))))

(assert (=> start!68286 e!440702))

(assert (=> start!68286 true))

(declare-fun array_inv!16414 (array!43076) Bool)

(assert (=> start!68286 (array_inv!16414 a!3170)))

(declare-fun b!793282 () Bool)

(assert (=> b!793282 (= e!440702 e!440700)))

(declare-fun res!537797 () Bool)

(assert (=> b!793282 (=> (not res!537797) (not e!440700))))

(declare-datatypes ((SeekEntryResult!8209 0))(
  ( (MissingZero!8209 (index!35204 (_ BitVec 32))) (Found!8209 (index!35205 (_ BitVec 32))) (Intermediate!8209 (undefined!9021 Bool) (index!35206 (_ BitVec 32)) (x!66143 (_ BitVec 32))) (Undefined!8209) (MissingVacant!8209 (index!35207 (_ BitVec 32))) )
))
(declare-fun lt!353683 () SeekEntryResult!8209)

(assert (=> b!793282 (= res!537797 (or (= lt!353683 (MissingZero!8209 i!1163)) (= lt!353683 (MissingVacant!8209 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43076 (_ BitVec 32)) SeekEntryResult!8209)

(assert (=> b!793282 (= lt!353683 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793283 () Bool)

(declare-fun res!537801 () Bool)

(assert (=> b!793283 (=> (not res!537801) (not e!440700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43076 (_ BitVec 32)) Bool)

(assert (=> b!793283 (= res!537801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793284 () Bool)

(declare-fun res!537799 () Bool)

(assert (=> b!793284 (=> (not res!537799) (not e!440702))))

(assert (=> b!793284 (= res!537799 (validKeyInArray!0 k!2044))))

(assert (= (and start!68286 res!537803) b!793279))

(assert (= (and b!793279 res!537802) b!793281))

(assert (= (and b!793281 res!537800) b!793284))

(assert (= (and b!793284 res!537799) b!793278))

(assert (= (and b!793278 res!537798) b!793282))

(assert (= (and b!793282 res!537797) b!793283))

(assert (= (and b!793283 res!537801) b!793280))

(declare-fun m!733751 () Bool)

(assert (=> b!793283 m!733751))

(declare-fun m!733753 () Bool)

(assert (=> b!793284 m!733753))

(declare-fun m!733755 () Bool)

(assert (=> b!793281 m!733755))

(assert (=> b!793281 m!733755))

(declare-fun m!733757 () Bool)

(assert (=> b!793281 m!733757))

(declare-fun m!733759 () Bool)

(assert (=> b!793280 m!733759))

(declare-fun m!733761 () Bool)

(assert (=> b!793278 m!733761))

(declare-fun m!733763 () Bool)

(assert (=> b!793282 m!733763))

(declare-fun m!733765 () Bool)

(assert (=> start!68286 m!733765))

(declare-fun m!733767 () Bool)

(assert (=> start!68286 m!733767))

(push 1)

