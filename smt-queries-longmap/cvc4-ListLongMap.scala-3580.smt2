; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49270 () Bool)

(assert start!49270)

(declare-fun b!542358 () Bool)

(declare-fun res!336920 () Bool)

(declare-fun e!313940 () Bool)

(assert (=> b!542358 (=> (not res!336920) (not e!313940))))

(declare-datatypes ((array!34278 0))(
  ( (array!34279 (arr!16472 (Array (_ BitVec 32) (_ BitVec 64))) (size!16836 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34278)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34278 (_ BitVec 32)) Bool)

(assert (=> b!542358 (= res!336920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542359 () Bool)

(declare-fun res!336919 () Bool)

(declare-fun e!313941 () Bool)

(assert (=> b!542359 (=> (not res!336919) (not e!313941))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!542359 (= res!336919 (and (not (= (select (arr!16472 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16472 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16472 a!3154) index!1177) (select (arr!16472 a!3154) j!147)))))))

(declare-fun b!542360 () Bool)

(declare-fun res!336915 () Bool)

(declare-fun e!313938 () Bool)

(assert (=> b!542360 (=> (not res!336915) (not e!313938))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542360 (= res!336915 (validKeyInArray!0 k!1998))))

(declare-fun b!542361 () Bool)

(declare-fun res!336911 () Bool)

(assert (=> b!542361 (=> (not res!336911) (not e!313940))))

(declare-datatypes ((List!10591 0))(
  ( (Nil!10588) (Cons!10587 (h!11542 (_ BitVec 64)) (t!16819 List!10591)) )
))
(declare-fun arrayNoDuplicates!0 (array!34278 (_ BitVec 32) List!10591) Bool)

(assert (=> b!542361 (= res!336911 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10588))))

(declare-fun b!542362 () Bool)

(assert (=> b!542362 (= e!313941 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!247903 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542362 (= lt!247903 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542363 () Bool)

(declare-fun res!336917 () Bool)

(assert (=> b!542363 (=> (not res!336917) (not e!313938))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542363 (= res!336917 (and (= (size!16836 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16836 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16836 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542364 () Bool)

(declare-fun res!336910 () Bool)

(assert (=> b!542364 (=> (not res!336910) (not e!313941))))

(declare-datatypes ((SeekEntryResult!4930 0))(
  ( (MissingZero!4930 (index!21944 (_ BitVec 32))) (Found!4930 (index!21945 (_ BitVec 32))) (Intermediate!4930 (undefined!5742 Bool) (index!21946 (_ BitVec 32)) (x!50857 (_ BitVec 32))) (Undefined!4930) (MissingVacant!4930 (index!21947 (_ BitVec 32))) )
))
(declare-fun lt!247902 () SeekEntryResult!4930)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34278 (_ BitVec 32)) SeekEntryResult!4930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542364 (= res!336910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16472 a!3154) j!147) mask!3216) (select (arr!16472 a!3154) j!147) a!3154 mask!3216) lt!247902))))

(declare-fun b!542365 () Bool)

(declare-fun res!336909 () Bool)

(assert (=> b!542365 (=> (not res!336909) (not e!313938))))

(declare-fun arrayContainsKey!0 (array!34278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542365 (= res!336909 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336918 () Bool)

(assert (=> start!49270 (=> (not res!336918) (not e!313938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49270 (= res!336918 (validMask!0 mask!3216))))

(assert (=> start!49270 e!313938))

(assert (=> start!49270 true))

(declare-fun array_inv!12268 (array!34278) Bool)

(assert (=> start!49270 (array_inv!12268 a!3154)))

(declare-fun b!542366 () Bool)

(declare-fun res!336914 () Bool)

(assert (=> b!542366 (=> (not res!336914) (not e!313938))))

(assert (=> b!542366 (= res!336914 (validKeyInArray!0 (select (arr!16472 a!3154) j!147)))))

(declare-fun b!542367 () Bool)

(assert (=> b!542367 (= e!313938 e!313940)))

(declare-fun res!336912 () Bool)

(assert (=> b!542367 (=> (not res!336912) (not e!313940))))

(declare-fun lt!247901 () SeekEntryResult!4930)

(assert (=> b!542367 (= res!336912 (or (= lt!247901 (MissingZero!4930 i!1153)) (= lt!247901 (MissingVacant!4930 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34278 (_ BitVec 32)) SeekEntryResult!4930)

(assert (=> b!542367 (= lt!247901 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542368 () Bool)

(assert (=> b!542368 (= e!313940 e!313941)))

(declare-fun res!336913 () Bool)

(assert (=> b!542368 (=> (not res!336913) (not e!313941))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542368 (= res!336913 (= lt!247902 (Intermediate!4930 false resIndex!32 resX!32)))))

(assert (=> b!542368 (= lt!247902 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16472 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542369 () Bool)

(declare-fun res!336916 () Bool)

(assert (=> b!542369 (=> (not res!336916) (not e!313940))))

(assert (=> b!542369 (= res!336916 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16836 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16836 a!3154)) (= (select (arr!16472 a!3154) resIndex!32) (select (arr!16472 a!3154) j!147))))))

(assert (= (and start!49270 res!336918) b!542363))

(assert (= (and b!542363 res!336917) b!542366))

(assert (= (and b!542366 res!336914) b!542360))

(assert (= (and b!542360 res!336915) b!542365))

(assert (= (and b!542365 res!336909) b!542367))

(assert (= (and b!542367 res!336912) b!542358))

(assert (= (and b!542358 res!336920) b!542361))

(assert (= (and b!542361 res!336911) b!542369))

(assert (= (and b!542369 res!336916) b!542368))

(assert (= (and b!542368 res!336913) b!542364))

(assert (= (and b!542364 res!336910) b!542359))

(assert (= (and b!542359 res!336919) b!542362))

(declare-fun m!520629 () Bool)

(assert (=> b!542359 m!520629))

(declare-fun m!520631 () Bool)

(assert (=> b!542359 m!520631))

(declare-fun m!520633 () Bool)

(assert (=> b!542362 m!520633))

(declare-fun m!520635 () Bool)

(assert (=> b!542361 m!520635))

(declare-fun m!520637 () Bool)

(assert (=> b!542367 m!520637))

(declare-fun m!520639 () Bool)

(assert (=> b!542360 m!520639))

(declare-fun m!520641 () Bool)

(assert (=> b!542358 m!520641))

(declare-fun m!520643 () Bool)

(assert (=> start!49270 m!520643))

(declare-fun m!520645 () Bool)

(assert (=> start!49270 m!520645))

(declare-fun m!520647 () Bool)

(assert (=> b!542365 m!520647))

(assert (=> b!542364 m!520631))

(assert (=> b!542364 m!520631))

(declare-fun m!520649 () Bool)

(assert (=> b!542364 m!520649))

(assert (=> b!542364 m!520649))

(assert (=> b!542364 m!520631))

(declare-fun m!520651 () Bool)

(assert (=> b!542364 m!520651))

(declare-fun m!520653 () Bool)

(assert (=> b!542369 m!520653))

(assert (=> b!542369 m!520631))

(assert (=> b!542366 m!520631))

(assert (=> b!542366 m!520631))

(declare-fun m!520655 () Bool)

(assert (=> b!542366 m!520655))

(assert (=> b!542368 m!520631))

(assert (=> b!542368 m!520631))

(declare-fun m!520657 () Bool)

(assert (=> b!542368 m!520657))

(push 1)

(assert (not b!542360))

(assert (not b!542358))

(assert (not b!542366))

(assert (not start!49270))

(assert (not b!542364))

