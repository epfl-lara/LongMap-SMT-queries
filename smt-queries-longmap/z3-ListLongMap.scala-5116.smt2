; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69578 () Bool)

(assert start!69578)

(declare-fun b!810233 () Bool)

(declare-fun res!553415 () Bool)

(declare-fun e!448576 () Bool)

(assert (=> b!810233 (=> (not res!553415) (not e!448576))))

(declare-datatypes ((array!44008 0))(
  ( (array!44009 (arr!21073 (Array (_ BitVec 32) (_ BitVec 64))) (size!21493 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44008)

(declare-datatypes ((List!14943 0))(
  ( (Nil!14940) (Cons!14939 (h!16074 (_ BitVec 64)) (t!21250 List!14943)) )
))
(declare-fun arrayNoDuplicates!0 (array!44008 (_ BitVec 32) List!14943) Bool)

(assert (=> b!810233 (= res!553415 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14940))))

(declare-fun b!810234 () Bool)

(declare-fun e!448578 () Bool)

(assert (=> b!810234 (= e!448578 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363056 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810234 (= lt!363056 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!810235 () Bool)

(declare-fun e!448575 () Bool)

(assert (=> b!810235 (= e!448576 e!448575)))

(declare-fun res!553421 () Bool)

(assert (=> b!810235 (=> (not res!553421) (not e!448575))))

(declare-fun lt!363052 () (_ BitVec 64))

(declare-fun lt!363054 () array!44008)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8620 0))(
  ( (MissingZero!8620 (index!36848 (_ BitVec 32))) (Found!8620 (index!36849 (_ BitVec 32))) (Intermediate!8620 (undefined!9432 Bool) (index!36850 (_ BitVec 32)) (x!67818 (_ BitVec 32))) (Undefined!8620) (MissingVacant!8620 (index!36851 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44008 (_ BitVec 32)) SeekEntryResult!8620)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44008 (_ BitVec 32)) SeekEntryResult!8620)

(assert (=> b!810235 (= res!553421 (= (seekEntryOrOpen!0 lt!363052 lt!363054 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363052 lt!363054 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810235 (= lt!363052 (select (store (arr!21073 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810235 (= lt!363054 (array!44009 (store (arr!21073 a!3170) i!1163 k0!2044) (size!21493 a!3170)))))

(declare-fun b!810236 () Bool)

(declare-fun res!553416 () Bool)

(declare-fun e!448577 () Bool)

(assert (=> b!810236 (=> (not res!553416) (not e!448577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810236 (= res!553416 (validKeyInArray!0 k0!2044))))

(declare-fun b!810237 () Bool)

(declare-fun res!553418 () Bool)

(assert (=> b!810237 (=> (not res!553418) (not e!448577))))

(declare-fun arrayContainsKey!0 (array!44008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810237 (= res!553418 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810238 () Bool)

(declare-fun res!553412 () Bool)

(assert (=> b!810238 (=> (not res!553412) (not e!448577))))

(assert (=> b!810238 (= res!553412 (and (= (size!21493 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21493 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21493 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810239 () Bool)

(assert (=> b!810239 (= e!448575 e!448578)))

(declare-fun res!553419 () Bool)

(assert (=> b!810239 (=> (not res!553419) (not e!448578))))

(declare-fun lt!363051 () SeekEntryResult!8620)

(declare-fun lt!363055 () SeekEntryResult!8620)

(assert (=> b!810239 (= res!553419 (and (= lt!363051 lt!363055) (= lt!363055 (Found!8620 j!153)) (not (= (select (arr!21073 a!3170) index!1236) (select (arr!21073 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810239 (= lt!363055 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21073 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810239 (= lt!363051 (seekEntryOrOpen!0 (select (arr!21073 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810240 () Bool)

(declare-fun res!553422 () Bool)

(assert (=> b!810240 (=> (not res!553422) (not e!448576))))

(assert (=> b!810240 (= res!553422 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21493 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21073 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21493 a!3170)) (= (select (arr!21073 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!553414 () Bool)

(assert (=> start!69578 (=> (not res!553414) (not e!448577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69578 (= res!553414 (validMask!0 mask!3266))))

(assert (=> start!69578 e!448577))

(assert (=> start!69578 true))

(declare-fun array_inv!16932 (array!44008) Bool)

(assert (=> start!69578 (array_inv!16932 a!3170)))

(declare-fun b!810241 () Bool)

(declare-fun res!553417 () Bool)

(assert (=> b!810241 (=> (not res!553417) (not e!448576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44008 (_ BitVec 32)) Bool)

(assert (=> b!810241 (= res!553417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810242 () Bool)

(declare-fun res!553413 () Bool)

(assert (=> b!810242 (=> (not res!553413) (not e!448577))))

(assert (=> b!810242 (= res!553413 (validKeyInArray!0 (select (arr!21073 a!3170) j!153)))))

(declare-fun b!810243 () Bool)

(assert (=> b!810243 (= e!448577 e!448576)))

(declare-fun res!553420 () Bool)

(assert (=> b!810243 (=> (not res!553420) (not e!448576))))

(declare-fun lt!363053 () SeekEntryResult!8620)

(assert (=> b!810243 (= res!553420 (or (= lt!363053 (MissingZero!8620 i!1163)) (= lt!363053 (MissingVacant!8620 i!1163))))))

(assert (=> b!810243 (= lt!363053 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69578 res!553414) b!810238))

(assert (= (and b!810238 res!553412) b!810242))

(assert (= (and b!810242 res!553413) b!810236))

(assert (= (and b!810236 res!553416) b!810237))

(assert (= (and b!810237 res!553418) b!810243))

(assert (= (and b!810243 res!553420) b!810241))

(assert (= (and b!810241 res!553417) b!810233))

(assert (= (and b!810233 res!553415) b!810240))

(assert (= (and b!810240 res!553422) b!810235))

(assert (= (and b!810235 res!553421) b!810239))

(assert (= (and b!810239 res!553419) b!810234))

(declare-fun m!752791 () Bool)

(assert (=> b!810243 m!752791))

(declare-fun m!752793 () Bool)

(assert (=> start!69578 m!752793))

(declare-fun m!752795 () Bool)

(assert (=> start!69578 m!752795))

(declare-fun m!752797 () Bool)

(assert (=> b!810240 m!752797))

(declare-fun m!752799 () Bool)

(assert (=> b!810240 m!752799))

(declare-fun m!752801 () Bool)

(assert (=> b!810233 m!752801))

(declare-fun m!752803 () Bool)

(assert (=> b!810235 m!752803))

(declare-fun m!752805 () Bool)

(assert (=> b!810235 m!752805))

(declare-fun m!752807 () Bool)

(assert (=> b!810235 m!752807))

(declare-fun m!752809 () Bool)

(assert (=> b!810235 m!752809))

(declare-fun m!752811 () Bool)

(assert (=> b!810237 m!752811))

(declare-fun m!752813 () Bool)

(assert (=> b!810242 m!752813))

(assert (=> b!810242 m!752813))

(declare-fun m!752815 () Bool)

(assert (=> b!810242 m!752815))

(declare-fun m!752817 () Bool)

(assert (=> b!810234 m!752817))

(declare-fun m!752819 () Bool)

(assert (=> b!810241 m!752819))

(declare-fun m!752821 () Bool)

(assert (=> b!810236 m!752821))

(declare-fun m!752823 () Bool)

(assert (=> b!810239 m!752823))

(assert (=> b!810239 m!752813))

(assert (=> b!810239 m!752813))

(declare-fun m!752825 () Bool)

(assert (=> b!810239 m!752825))

(assert (=> b!810239 m!752813))

(declare-fun m!752827 () Bool)

(assert (=> b!810239 m!752827))

(check-sat (not b!810236) (not b!810241) (not b!810235) (not b!810243) (not b!810242) (not b!810239) (not b!810237) (not b!810233) (not b!810234) (not start!69578))
(check-sat)
