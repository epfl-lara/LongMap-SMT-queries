; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44608 () Bool)

(assert start!44608)

(declare-fun b!489299 () Bool)

(declare-fun res!292238 () Bool)

(declare-fun e!287801 () Bool)

(assert (=> b!489299 (=> (not res!292238) (not e!287801))))

(declare-datatypes ((array!31667 0))(
  ( (array!31668 (arr!15221 (Array (_ BitVec 32) (_ BitVec 64))) (size!15585 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31667)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31667 (_ BitVec 32)) Bool)

(assert (=> b!489299 (= res!292238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489300 () Bool)

(declare-fun e!287799 () Bool)

(assert (=> b!489300 (= e!287801 (not e!287799))))

(declare-fun res!292242 () Bool)

(assert (=> b!489300 (=> res!292242 e!287799)))

(declare-fun lt!220738 () (_ BitVec 32))

(assert (=> b!489300 (= res!292242 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvslt lt!220738 #b00000000000000000000000000000000) (bvsge lt!220738 (bvadd #b00000000000000000000000000000001 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489300 (= lt!220738 (toIndex!0 (select (store (arr!15221 a!3235) i!1204 k!2280) j!176) mask!3524))))

(declare-fun e!287802 () Bool)

(assert (=> b!489300 e!287802))

(declare-fun res!292235 () Bool)

(assert (=> b!489300 (=> (not res!292235) (not e!287802))))

(assert (=> b!489300 (= res!292235 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14322 0))(
  ( (Unit!14323) )
))
(declare-fun lt!220736 () Unit!14322)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14322)

(assert (=> b!489300 (= lt!220736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489301 () Bool)

(declare-fun res!292237 () Bool)

(declare-fun e!287800 () Bool)

(assert (=> b!489301 (=> (not res!292237) (not e!287800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489301 (= res!292237 (validKeyInArray!0 (select (arr!15221 a!3235) j!176)))))

(declare-fun b!489302 () Bool)

(assert (=> b!489302 (= e!287799 (validKeyInArray!0 (select (store (arr!15221 a!3235) i!1204 k!2280) j!176)))))

(declare-fun b!489303 () Bool)

(declare-fun res!292240 () Bool)

(assert (=> b!489303 (=> (not res!292240) (not e!287800))))

(assert (=> b!489303 (= res!292240 (validKeyInArray!0 k!2280))))

(declare-fun b!489304 () Bool)

(declare-datatypes ((SeekEntryResult!3688 0))(
  ( (MissingZero!3688 (index!16931 (_ BitVec 32))) (Found!3688 (index!16932 (_ BitVec 32))) (Intermediate!3688 (undefined!4500 Bool) (index!16933 (_ BitVec 32)) (x!46042 (_ BitVec 32))) (Undefined!3688) (MissingVacant!3688 (index!16934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31667 (_ BitVec 32)) SeekEntryResult!3688)

(assert (=> b!489304 (= e!287802 (= (seekEntryOrOpen!0 (select (arr!15221 a!3235) j!176) a!3235 mask!3524) (Found!3688 j!176)))))

(declare-fun b!489305 () Bool)

(declare-fun res!292244 () Bool)

(assert (=> b!489305 (=> (not res!292244) (not e!287800))))

(assert (=> b!489305 (= res!292244 (and (= (size!15585 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15585 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15585 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!292239 () Bool)

(assert (=> start!44608 (=> (not res!292239) (not e!287800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44608 (= res!292239 (validMask!0 mask!3524))))

(assert (=> start!44608 e!287800))

(assert (=> start!44608 true))

(declare-fun array_inv!11017 (array!31667) Bool)

(assert (=> start!44608 (array_inv!11017 a!3235)))

(declare-fun b!489306 () Bool)

(assert (=> b!489306 (= e!287800 e!287801)))

(declare-fun res!292236 () Bool)

(assert (=> b!489306 (=> (not res!292236) (not e!287801))))

(declare-fun lt!220737 () SeekEntryResult!3688)

(assert (=> b!489306 (= res!292236 (or (= lt!220737 (MissingZero!3688 i!1204)) (= lt!220737 (MissingVacant!3688 i!1204))))))

(assert (=> b!489306 (= lt!220737 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489307 () Bool)

(declare-fun res!292241 () Bool)

(assert (=> b!489307 (=> (not res!292241) (not e!287801))))

(declare-datatypes ((List!9379 0))(
  ( (Nil!9376) (Cons!9375 (h!10237 (_ BitVec 64)) (t!15607 List!9379)) )
))
(declare-fun arrayNoDuplicates!0 (array!31667 (_ BitVec 32) List!9379) Bool)

(assert (=> b!489307 (= res!292241 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9376))))

(declare-fun b!489308 () Bool)

(declare-fun res!292243 () Bool)

(assert (=> b!489308 (=> (not res!292243) (not e!287800))))

(declare-fun arrayContainsKey!0 (array!31667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489308 (= res!292243 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44608 res!292239) b!489305))

(assert (= (and b!489305 res!292244) b!489301))

(assert (= (and b!489301 res!292237) b!489303))

(assert (= (and b!489303 res!292240) b!489308))

(assert (= (and b!489308 res!292243) b!489306))

(assert (= (and b!489306 res!292236) b!489299))

(assert (= (and b!489299 res!292238) b!489307))

(assert (= (and b!489307 res!292241) b!489300))

(assert (= (and b!489300 res!292235) b!489304))

(assert (= (and b!489300 (not res!292242)) b!489302))

(declare-fun m!469033 () Bool)

(assert (=> b!489300 m!469033))

(declare-fun m!469035 () Bool)

(assert (=> b!489300 m!469035))

(declare-fun m!469037 () Bool)

(assert (=> b!489300 m!469037))

(declare-fun m!469039 () Bool)

(assert (=> b!489300 m!469039))

(assert (=> b!489300 m!469037))

(declare-fun m!469041 () Bool)

(assert (=> b!489300 m!469041))

(declare-fun m!469043 () Bool)

(assert (=> start!44608 m!469043))

(declare-fun m!469045 () Bool)

(assert (=> start!44608 m!469045))

(declare-fun m!469047 () Bool)

(assert (=> b!489301 m!469047))

(assert (=> b!489301 m!469047))

(declare-fun m!469049 () Bool)

(assert (=> b!489301 m!469049))

(declare-fun m!469051 () Bool)

(assert (=> b!489299 m!469051))

(declare-fun m!469053 () Bool)

(assert (=> b!489307 m!469053))

(assert (=> b!489302 m!469033))

(assert (=> b!489302 m!469037))

(assert (=> b!489302 m!469037))

(declare-fun m!469055 () Bool)

(assert (=> b!489302 m!469055))

(declare-fun m!469057 () Bool)

(assert (=> b!489306 m!469057))

(declare-fun m!469059 () Bool)

(assert (=> b!489303 m!469059))

(assert (=> b!489304 m!469047))

(assert (=> b!489304 m!469047))

(declare-fun m!469061 () Bool)

(assert (=> b!489304 m!469061))

(declare-fun m!469063 () Bool)

(assert (=> b!489308 m!469063))

(push 1)

(assert (not b!489307))

