; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69192 () Bool)

(assert start!69192)

(declare-fun b!807088 () Bool)

(declare-fun res!551360 () Bool)

(declare-fun e!446852 () Bool)

(assert (=> b!807088 (=> (not res!551360) (not e!446852))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43909 0))(
  ( (array!43910 (arr!21032 (Array (_ BitVec 32) (_ BitVec 64))) (size!21453 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43909)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!807088 (= res!551360 (and (= (size!21453 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21453 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21453 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807089 () Bool)

(declare-fun res!551351 () Bool)

(assert (=> b!807089 (=> (not res!551351) (not e!446852))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807089 (= res!551351 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807090 () Bool)

(declare-fun res!551361 () Bool)

(declare-fun e!446854 () Bool)

(assert (=> b!807090 (=> (not res!551361) (not e!446854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43909 (_ BitVec 32)) Bool)

(assert (=> b!807090 (= res!551361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807091 () Bool)

(assert (=> b!807091 (= e!446852 e!446854)))

(declare-fun res!551359 () Bool)

(assert (=> b!807091 (=> (not res!551359) (not e!446854))))

(declare-datatypes ((SeekEntryResult!8620 0))(
  ( (MissingZero!8620 (index!36848 (_ BitVec 32))) (Found!8620 (index!36849 (_ BitVec 32))) (Intermediate!8620 (undefined!9432 Bool) (index!36850 (_ BitVec 32)) (x!67667 (_ BitVec 32))) (Undefined!8620) (MissingVacant!8620 (index!36851 (_ BitVec 32))) )
))
(declare-fun lt!361436 () SeekEntryResult!8620)

(assert (=> b!807091 (= res!551359 (or (= lt!361436 (MissingZero!8620 i!1163)) (= lt!361436 (MissingVacant!8620 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43909 (_ BitVec 32)) SeekEntryResult!8620)

(assert (=> b!807091 (= lt!361436 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!551352 () Bool)

(assert (=> start!69192 (=> (not res!551352) (not e!446852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69192 (= res!551352 (validMask!0 mask!3266))))

(assert (=> start!69192 e!446852))

(assert (=> start!69192 true))

(declare-fun array_inv!16915 (array!43909) Bool)

(assert (=> start!69192 (array_inv!16915 a!3170)))

(declare-fun b!807092 () Bool)

(declare-fun res!551358 () Bool)

(assert (=> b!807092 (=> (not res!551358) (not e!446852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807092 (= res!551358 (validKeyInArray!0 k0!2044))))

(declare-fun b!807093 () Bool)

(declare-fun res!551357 () Bool)

(assert (=> b!807093 (=> (not res!551357) (not e!446854))))

(declare-datatypes ((List!15034 0))(
  ( (Nil!15031) (Cons!15030 (h!16159 (_ BitVec 64)) (t!21340 List!15034)) )
))
(declare-fun arrayNoDuplicates!0 (array!43909 (_ BitVec 32) List!15034) Bool)

(assert (=> b!807093 (= res!551357 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15031))))

(declare-fun b!807094 () Bool)

(declare-fun e!446850 () Bool)

(assert (=> b!807094 (= e!446850 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361435 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807094 (= lt!361435 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807095 () Bool)

(declare-fun res!551355 () Bool)

(assert (=> b!807095 (=> (not res!551355) (not e!446852))))

(assert (=> b!807095 (= res!551355 (validKeyInArray!0 (select (arr!21032 a!3170) j!153)))))

(declare-fun b!807096 () Bool)

(declare-fun e!446853 () Bool)

(assert (=> b!807096 (= e!446853 e!446850)))

(declare-fun res!551354 () Bool)

(assert (=> b!807096 (=> (not res!551354) (not e!446850))))

(declare-fun lt!361434 () SeekEntryResult!8620)

(declare-fun lt!361439 () SeekEntryResult!8620)

(assert (=> b!807096 (= res!551354 (and (= lt!361439 lt!361434) (= lt!361434 (Found!8620 j!153)) (not (= (select (arr!21032 a!3170) index!1236) (select (arr!21032 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43909 (_ BitVec 32)) SeekEntryResult!8620)

(assert (=> b!807096 (= lt!361434 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21032 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807096 (= lt!361439 (seekEntryOrOpen!0 (select (arr!21032 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807097 () Bool)

(declare-fun res!551353 () Bool)

(assert (=> b!807097 (=> (not res!551353) (not e!446854))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!807097 (= res!551353 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21453 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21032 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21453 a!3170)) (= (select (arr!21032 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807098 () Bool)

(assert (=> b!807098 (= e!446854 e!446853)))

(declare-fun res!551356 () Bool)

(assert (=> b!807098 (=> (not res!551356) (not e!446853))))

(declare-fun lt!361438 () (_ BitVec 64))

(declare-fun lt!361437 () array!43909)

(assert (=> b!807098 (= res!551356 (= (seekEntryOrOpen!0 lt!361438 lt!361437 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361438 lt!361437 mask!3266)))))

(assert (=> b!807098 (= lt!361438 (select (store (arr!21032 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807098 (= lt!361437 (array!43910 (store (arr!21032 a!3170) i!1163 k0!2044) (size!21453 a!3170)))))

(assert (= (and start!69192 res!551352) b!807088))

(assert (= (and b!807088 res!551360) b!807095))

(assert (= (and b!807095 res!551355) b!807092))

(assert (= (and b!807092 res!551358) b!807089))

(assert (= (and b!807089 res!551351) b!807091))

(assert (= (and b!807091 res!551359) b!807090))

(assert (= (and b!807090 res!551361) b!807093))

(assert (= (and b!807093 res!551357) b!807097))

(assert (= (and b!807097 res!551353) b!807098))

(assert (= (and b!807098 res!551356) b!807096))

(assert (= (and b!807096 res!551354) b!807094))

(declare-fun m!748615 () Bool)

(assert (=> b!807093 m!748615))

(declare-fun m!748617 () Bool)

(assert (=> start!69192 m!748617))

(declare-fun m!748619 () Bool)

(assert (=> start!69192 m!748619))

(declare-fun m!748621 () Bool)

(assert (=> b!807094 m!748621))

(declare-fun m!748623 () Bool)

(assert (=> b!807098 m!748623))

(declare-fun m!748625 () Bool)

(assert (=> b!807098 m!748625))

(declare-fun m!748627 () Bool)

(assert (=> b!807098 m!748627))

(declare-fun m!748629 () Bool)

(assert (=> b!807098 m!748629))

(declare-fun m!748631 () Bool)

(assert (=> b!807090 m!748631))

(declare-fun m!748633 () Bool)

(assert (=> b!807089 m!748633))

(declare-fun m!748635 () Bool)

(assert (=> b!807097 m!748635))

(declare-fun m!748637 () Bool)

(assert (=> b!807097 m!748637))

(declare-fun m!748639 () Bool)

(assert (=> b!807092 m!748639))

(declare-fun m!748641 () Bool)

(assert (=> b!807091 m!748641))

(declare-fun m!748643 () Bool)

(assert (=> b!807095 m!748643))

(assert (=> b!807095 m!748643))

(declare-fun m!748645 () Bool)

(assert (=> b!807095 m!748645))

(declare-fun m!748647 () Bool)

(assert (=> b!807096 m!748647))

(assert (=> b!807096 m!748643))

(assert (=> b!807096 m!748643))

(declare-fun m!748649 () Bool)

(assert (=> b!807096 m!748649))

(assert (=> b!807096 m!748643))

(declare-fun m!748651 () Bool)

(assert (=> b!807096 m!748651))

(check-sat (not b!807090) (not b!807096) (not b!807093) (not b!807089) (not b!807098) (not b!807091) (not start!69192) (not b!807094) (not b!807095) (not b!807092))
(check-sat)
