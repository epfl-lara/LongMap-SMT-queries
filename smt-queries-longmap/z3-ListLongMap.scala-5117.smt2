; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69584 () Bool)

(assert start!69584)

(declare-fun b!810332 () Bool)

(declare-fun e!448620 () Bool)

(assert (=> b!810332 (= e!448620 false)))

(declare-fun lt!363107 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810332 (= lt!363107 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!810333 () Bool)

(declare-fun res!553521 () Bool)

(declare-fun e!448622 () Bool)

(assert (=> b!810333 (=> (not res!553521) (not e!448622))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44014 0))(
  ( (array!44015 (arr!21076 (Array (_ BitVec 32) (_ BitVec 64))) (size!21496 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44014)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810333 (= res!553521 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21496 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21076 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21496 a!3170)) (= (select (arr!21076 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810334 () Bool)

(declare-fun e!448624 () Bool)

(assert (=> b!810334 (= e!448622 e!448624)))

(declare-fun res!553512 () Bool)

(assert (=> b!810334 (=> (not res!553512) (not e!448624))))

(declare-fun lt!363106 () array!44014)

(declare-fun lt!363109 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8623 0))(
  ( (MissingZero!8623 (index!36860 (_ BitVec 32))) (Found!8623 (index!36861 (_ BitVec 32))) (Intermediate!8623 (undefined!9435 Bool) (index!36862 (_ BitVec 32)) (x!67829 (_ BitVec 32))) (Undefined!8623) (MissingVacant!8623 (index!36863 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44014 (_ BitVec 32)) SeekEntryResult!8623)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44014 (_ BitVec 32)) SeekEntryResult!8623)

(assert (=> b!810334 (= res!553512 (= (seekEntryOrOpen!0 lt!363109 lt!363106 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363109 lt!363106 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810334 (= lt!363109 (select (store (arr!21076 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810334 (= lt!363106 (array!44015 (store (arr!21076 a!3170) i!1163 k0!2044) (size!21496 a!3170)))))

(declare-fun b!810335 () Bool)

(assert (=> b!810335 (= e!448624 e!448620)))

(declare-fun res!553514 () Bool)

(assert (=> b!810335 (=> (not res!553514) (not e!448620))))

(declare-fun lt!363110 () SeekEntryResult!8623)

(declare-fun lt!363105 () SeekEntryResult!8623)

(assert (=> b!810335 (= res!553514 (and (= lt!363105 lt!363110) (= lt!363110 (Found!8623 j!153)) (not (= (select (arr!21076 a!3170) index!1236) (select (arr!21076 a!3170) j!153)))))))

(assert (=> b!810335 (= lt!363110 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21076 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810335 (= lt!363105 (seekEntryOrOpen!0 (select (arr!21076 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810336 () Bool)

(declare-fun res!553519 () Bool)

(declare-fun e!448623 () Bool)

(assert (=> b!810336 (=> (not res!553519) (not e!448623))))

(assert (=> b!810336 (= res!553519 (and (= (size!21496 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21496 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21496 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810337 () Bool)

(declare-fun res!553515 () Bool)

(assert (=> b!810337 (=> (not res!553515) (not e!448623))))

(declare-fun arrayContainsKey!0 (array!44014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810337 (= res!553515 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810339 () Bool)

(declare-fun res!553517 () Bool)

(assert (=> b!810339 (=> (not res!553517) (not e!448622))))

(declare-datatypes ((List!14946 0))(
  ( (Nil!14943) (Cons!14942 (h!16077 (_ BitVec 64)) (t!21253 List!14946)) )
))
(declare-fun arrayNoDuplicates!0 (array!44014 (_ BitVec 32) List!14946) Bool)

(assert (=> b!810339 (= res!553517 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14943))))

(declare-fun b!810340 () Bool)

(declare-fun res!553520 () Bool)

(assert (=> b!810340 (=> (not res!553520) (not e!448623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810340 (= res!553520 (validKeyInArray!0 (select (arr!21076 a!3170) j!153)))))

(declare-fun b!810341 () Bool)

(declare-fun res!553518 () Bool)

(assert (=> b!810341 (=> (not res!553518) (not e!448622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44014 (_ BitVec 32)) Bool)

(assert (=> b!810341 (= res!553518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810342 () Bool)

(assert (=> b!810342 (= e!448623 e!448622)))

(declare-fun res!553516 () Bool)

(assert (=> b!810342 (=> (not res!553516) (not e!448622))))

(declare-fun lt!363108 () SeekEntryResult!8623)

(assert (=> b!810342 (= res!553516 (or (= lt!363108 (MissingZero!8623 i!1163)) (= lt!363108 (MissingVacant!8623 i!1163))))))

(assert (=> b!810342 (= lt!363108 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!553513 () Bool)

(assert (=> start!69584 (=> (not res!553513) (not e!448623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69584 (= res!553513 (validMask!0 mask!3266))))

(assert (=> start!69584 e!448623))

(assert (=> start!69584 true))

(declare-fun array_inv!16935 (array!44014) Bool)

(assert (=> start!69584 (array_inv!16935 a!3170)))

(declare-fun b!810338 () Bool)

(declare-fun res!553511 () Bool)

(assert (=> b!810338 (=> (not res!553511) (not e!448623))))

(assert (=> b!810338 (= res!553511 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69584 res!553513) b!810336))

(assert (= (and b!810336 res!553519) b!810340))

(assert (= (and b!810340 res!553520) b!810338))

(assert (= (and b!810338 res!553511) b!810337))

(assert (= (and b!810337 res!553515) b!810342))

(assert (= (and b!810342 res!553516) b!810341))

(assert (= (and b!810341 res!553518) b!810339))

(assert (= (and b!810339 res!553517) b!810333))

(assert (= (and b!810333 res!553521) b!810334))

(assert (= (and b!810334 res!553512) b!810335))

(assert (= (and b!810335 res!553514) b!810332))

(declare-fun m!752905 () Bool)

(assert (=> start!69584 m!752905))

(declare-fun m!752907 () Bool)

(assert (=> start!69584 m!752907))

(declare-fun m!752909 () Bool)

(assert (=> b!810342 m!752909))

(declare-fun m!752911 () Bool)

(assert (=> b!810338 m!752911))

(declare-fun m!752913 () Bool)

(assert (=> b!810341 m!752913))

(declare-fun m!752915 () Bool)

(assert (=> b!810332 m!752915))

(declare-fun m!752917 () Bool)

(assert (=> b!810339 m!752917))

(declare-fun m!752919 () Bool)

(assert (=> b!810333 m!752919))

(declare-fun m!752921 () Bool)

(assert (=> b!810333 m!752921))

(declare-fun m!752923 () Bool)

(assert (=> b!810337 m!752923))

(declare-fun m!752925 () Bool)

(assert (=> b!810335 m!752925))

(declare-fun m!752927 () Bool)

(assert (=> b!810335 m!752927))

(assert (=> b!810335 m!752927))

(declare-fun m!752929 () Bool)

(assert (=> b!810335 m!752929))

(assert (=> b!810335 m!752927))

(declare-fun m!752931 () Bool)

(assert (=> b!810335 m!752931))

(declare-fun m!752933 () Bool)

(assert (=> b!810334 m!752933))

(declare-fun m!752935 () Bool)

(assert (=> b!810334 m!752935))

(declare-fun m!752937 () Bool)

(assert (=> b!810334 m!752937))

(declare-fun m!752939 () Bool)

(assert (=> b!810334 m!752939))

(assert (=> b!810340 m!752927))

(assert (=> b!810340 m!752927))

(declare-fun m!752941 () Bool)

(assert (=> b!810340 m!752941))

(check-sat (not b!810335) (not b!810337) (not b!810332) (not start!69584) (not b!810341) (not b!810342) (not b!810334) (not b!810340) (not b!810338) (not b!810339))
(check-sat)
