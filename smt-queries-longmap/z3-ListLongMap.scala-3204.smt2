; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44972 () Bool)

(assert start!44972)

(declare-fun b!493239 () Bool)

(declare-fun res!295811 () Bool)

(declare-fun e!289700 () Bool)

(assert (=> b!493239 (=> (not res!295811) (not e!289700))))

(declare-datatypes ((array!31917 0))(
  ( (array!31918 (arr!15343 (Array (_ BitVec 32) (_ BitVec 64))) (size!15707 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31917)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493239 (= res!295811 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493240 () Bool)

(declare-fun res!295816 () Bool)

(assert (=> b!493240 (=> (not res!295816) (not e!289700))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493240 (= res!295816 (and (= (size!15707 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15707 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15707 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493241 () Bool)

(declare-fun res!295814 () Bool)

(declare-fun e!289701 () Bool)

(assert (=> b!493241 (=> (not res!295814) (not e!289701))))

(declare-datatypes ((List!9501 0))(
  ( (Nil!9498) (Cons!9497 (h!10365 (_ BitVec 64)) (t!15729 List!9501)) )
))
(declare-fun arrayNoDuplicates!0 (array!31917 (_ BitVec 32) List!9501) Bool)

(assert (=> b!493241 (= res!295814 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9498))))

(declare-fun b!493242 () Bool)

(declare-fun e!289699 () Bool)

(declare-datatypes ((SeekEntryResult!3810 0))(
  ( (MissingZero!3810 (index!17419 (_ BitVec 32))) (Found!3810 (index!17420 (_ BitVec 32))) (Intermediate!3810 (undefined!4622 Bool) (index!17421 (_ BitVec 32)) (x!46504 (_ BitVec 32))) (Undefined!3810) (MissingVacant!3810 (index!17422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31917 (_ BitVec 32)) SeekEntryResult!3810)

(assert (=> b!493242 (= e!289699 (= (seekEntryOrOpen!0 (select (arr!15343 a!3235) j!176) a!3235 mask!3524) (Found!3810 j!176)))))

(declare-fun res!295809 () Bool)

(assert (=> start!44972 (=> (not res!295809) (not e!289700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44972 (= res!295809 (validMask!0 mask!3524))))

(assert (=> start!44972 e!289700))

(assert (=> start!44972 true))

(declare-fun array_inv!11139 (array!31917) Bool)

(assert (=> start!44972 (array_inv!11139 a!3235)))

(declare-fun b!493243 () Bool)

(declare-fun res!295812 () Bool)

(assert (=> b!493243 (=> (not res!295812) (not e!289701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31917 (_ BitVec 32)) Bool)

(assert (=> b!493243 (= res!295812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493244 () Bool)

(assert (=> b!493244 (= e!289701 (not true))))

(declare-fun lt!223043 () (_ BitVec 32))

(declare-fun lt!223044 () SeekEntryResult!3810)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31917 (_ BitVec 32)) SeekEntryResult!3810)

(assert (=> b!493244 (= lt!223044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223043 (select (store (arr!15343 a!3235) i!1204 k0!2280) j!176) (array!31918 (store (arr!15343 a!3235) i!1204 k0!2280) (size!15707 a!3235)) mask!3524))))

(declare-fun lt!223048 () SeekEntryResult!3810)

(declare-fun lt!223046 () (_ BitVec 32))

(assert (=> b!493244 (= lt!223048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223046 (select (arr!15343 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493244 (= lt!223043 (toIndex!0 (select (store (arr!15343 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493244 (= lt!223046 (toIndex!0 (select (arr!15343 a!3235) j!176) mask!3524))))

(assert (=> b!493244 e!289699))

(declare-fun res!295815 () Bool)

(assert (=> b!493244 (=> (not res!295815) (not e!289699))))

(assert (=> b!493244 (= res!295815 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14566 0))(
  ( (Unit!14567) )
))
(declare-fun lt!223045 () Unit!14566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14566)

(assert (=> b!493244 (= lt!223045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493245 () Bool)

(declare-fun res!295817 () Bool)

(assert (=> b!493245 (=> (not res!295817) (not e!289700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493245 (= res!295817 (validKeyInArray!0 (select (arr!15343 a!3235) j!176)))))

(declare-fun b!493246 () Bool)

(declare-fun res!295810 () Bool)

(assert (=> b!493246 (=> (not res!295810) (not e!289700))))

(assert (=> b!493246 (= res!295810 (validKeyInArray!0 k0!2280))))

(declare-fun b!493247 () Bool)

(assert (=> b!493247 (= e!289700 e!289701)))

(declare-fun res!295813 () Bool)

(assert (=> b!493247 (=> (not res!295813) (not e!289701))))

(declare-fun lt!223047 () SeekEntryResult!3810)

(assert (=> b!493247 (= res!295813 (or (= lt!223047 (MissingZero!3810 i!1204)) (= lt!223047 (MissingVacant!3810 i!1204))))))

(assert (=> b!493247 (= lt!223047 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44972 res!295809) b!493240))

(assert (= (and b!493240 res!295816) b!493245))

(assert (= (and b!493245 res!295817) b!493246))

(assert (= (and b!493246 res!295810) b!493239))

(assert (= (and b!493239 res!295811) b!493247))

(assert (= (and b!493247 res!295813) b!493243))

(assert (= (and b!493243 res!295812) b!493241))

(assert (= (and b!493241 res!295814) b!493244))

(assert (= (and b!493244 res!295815) b!493242))

(declare-fun m!474027 () Bool)

(assert (=> b!493241 m!474027))

(declare-fun m!474029 () Bool)

(assert (=> b!493243 m!474029))

(declare-fun m!474031 () Bool)

(assert (=> start!44972 m!474031))

(declare-fun m!474033 () Bool)

(assert (=> start!44972 m!474033))

(declare-fun m!474035 () Bool)

(assert (=> b!493242 m!474035))

(assert (=> b!493242 m!474035))

(declare-fun m!474037 () Bool)

(assert (=> b!493242 m!474037))

(declare-fun m!474039 () Bool)

(assert (=> b!493239 m!474039))

(assert (=> b!493245 m!474035))

(assert (=> b!493245 m!474035))

(declare-fun m!474041 () Bool)

(assert (=> b!493245 m!474041))

(declare-fun m!474043 () Bool)

(assert (=> b!493247 m!474043))

(declare-fun m!474045 () Bool)

(assert (=> b!493244 m!474045))

(assert (=> b!493244 m!474035))

(declare-fun m!474047 () Bool)

(assert (=> b!493244 m!474047))

(declare-fun m!474049 () Bool)

(assert (=> b!493244 m!474049))

(declare-fun m!474051 () Bool)

(assert (=> b!493244 m!474051))

(assert (=> b!493244 m!474051))

(declare-fun m!474053 () Bool)

(assert (=> b!493244 m!474053))

(assert (=> b!493244 m!474035))

(declare-fun m!474055 () Bool)

(assert (=> b!493244 m!474055))

(assert (=> b!493244 m!474035))

(declare-fun m!474057 () Bool)

(assert (=> b!493244 m!474057))

(assert (=> b!493244 m!474051))

(declare-fun m!474059 () Bool)

(assert (=> b!493244 m!474059))

(declare-fun m!474061 () Bool)

(assert (=> b!493246 m!474061))

(check-sat (not start!44972) (not b!493243) (not b!493244) (not b!493245) (not b!493247) (not b!493246) (not b!493239) (not b!493241) (not b!493242))
(check-sat)
