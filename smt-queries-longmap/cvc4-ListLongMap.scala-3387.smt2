; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46738 () Bool)

(assert start!46738)

(declare-fun b!516040 () Bool)

(declare-fun e!301222 () Bool)

(declare-fun e!301220 () Bool)

(assert (=> b!516040 (= e!301222 e!301220)))

(declare-fun res!315609 () Bool)

(assert (=> b!516040 (=> (not res!315609) (not e!301220))))

(declare-datatypes ((SeekEntryResult!4360 0))(
  ( (MissingZero!4360 (index!19628 (_ BitVec 32))) (Found!4360 (index!19629 (_ BitVec 32))) (Intermediate!4360 (undefined!5172 Bool) (index!19630 (_ BitVec 32)) (x!48587 (_ BitVec 32))) (Undefined!4360) (MissingVacant!4360 (index!19631 (_ BitVec 32))) )
))
(declare-fun lt!236235 () SeekEntryResult!4360)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516040 (= res!315609 (or (= lt!236235 (MissingZero!4360 i!1204)) (= lt!236235 (MissingVacant!4360 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33050 0))(
  ( (array!33051 (arr!15893 (Array (_ BitVec 32) (_ BitVec 64))) (size!16257 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33050)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33050 (_ BitVec 32)) SeekEntryResult!4360)

(assert (=> b!516040 (= lt!236235 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516041 () Bool)

(declare-fun e!301224 () Bool)

(assert (=> b!516041 (= e!301220 (not e!301224))))

(declare-fun res!315608 () Bool)

(assert (=> b!516041 (=> res!315608 e!301224)))

(declare-fun lt!236239 () SeekEntryResult!4360)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!236236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33050 (_ BitVec 32)) SeekEntryResult!4360)

(assert (=> b!516041 (= res!315608 (= lt!236239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236236 (select (store (arr!15893 a!3235) i!1204 k!2280) j!176) (array!33051 (store (arr!15893 a!3235) i!1204 k!2280) (size!16257 a!3235)) mask!3524)))))

(declare-fun lt!236238 () (_ BitVec 32))

(assert (=> b!516041 (= lt!236239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236238 (select (arr!15893 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516041 (= lt!236236 (toIndex!0 (select (store (arr!15893 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516041 (= lt!236238 (toIndex!0 (select (arr!15893 a!3235) j!176) mask!3524))))

(declare-fun e!301221 () Bool)

(assert (=> b!516041 e!301221))

(declare-fun res!315610 () Bool)

(assert (=> b!516041 (=> (not res!315610) (not e!301221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33050 (_ BitVec 32)) Bool)

(assert (=> b!516041 (= res!315610 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15978 0))(
  ( (Unit!15979) )
))
(declare-fun lt!236237 () Unit!15978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15978)

(assert (=> b!516041 (= lt!236237 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516042 () Bool)

(declare-fun res!315612 () Bool)

(assert (=> b!516042 (=> (not res!315612) (not e!301222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516042 (= res!315612 (validKeyInArray!0 k!2280))))

(declare-fun b!516044 () Bool)

(declare-fun res!315606 () Bool)

(assert (=> b!516044 (=> (not res!315606) (not e!301222))))

(assert (=> b!516044 (= res!315606 (and (= (size!16257 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16257 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16257 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516045 () Bool)

(declare-fun res!315613 () Bool)

(assert (=> b!516045 (=> (not res!315613) (not e!301220))))

(declare-datatypes ((List!10051 0))(
  ( (Nil!10048) (Cons!10047 (h!10945 (_ BitVec 64)) (t!16279 List!10051)) )
))
(declare-fun arrayNoDuplicates!0 (array!33050 (_ BitVec 32) List!10051) Bool)

(assert (=> b!516045 (= res!315613 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10048))))

(declare-fun b!516046 () Bool)

(assert (=> b!516046 (= e!301221 (= (seekEntryOrOpen!0 (select (arr!15893 a!3235) j!176) a!3235 mask!3524) (Found!4360 j!176)))))

(declare-fun b!516047 () Bool)

(declare-fun res!315604 () Bool)

(assert (=> b!516047 (=> res!315604 e!301224)))

(assert (=> b!516047 (= res!315604 (or (undefined!5172 lt!236239) (not (is-Intermediate!4360 lt!236239))))))

(declare-fun b!516048 () Bool)

(declare-fun res!315607 () Bool)

(assert (=> b!516048 (=> (not res!315607) (not e!301222))))

(declare-fun arrayContainsKey!0 (array!33050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516048 (= res!315607 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516049 () Bool)

(assert (=> b!516049 (= e!301224 true)))

(assert (=> b!516049 (and (bvslt (x!48587 lt!236239) #b01111111111111111111111111111110) (or (= (select (arr!15893 a!3235) (index!19630 lt!236239)) (select (arr!15893 a!3235) j!176)) (= (select (arr!15893 a!3235) (index!19630 lt!236239)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15893 a!3235) (index!19630 lt!236239)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516050 () Bool)

(declare-fun res!315605 () Bool)

(assert (=> b!516050 (=> (not res!315605) (not e!301222))))

(assert (=> b!516050 (= res!315605 (validKeyInArray!0 (select (arr!15893 a!3235) j!176)))))

(declare-fun res!315614 () Bool)

(assert (=> start!46738 (=> (not res!315614) (not e!301222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46738 (= res!315614 (validMask!0 mask!3524))))

(assert (=> start!46738 e!301222))

(assert (=> start!46738 true))

(declare-fun array_inv!11689 (array!33050) Bool)

(assert (=> start!46738 (array_inv!11689 a!3235)))

(declare-fun b!516043 () Bool)

(declare-fun res!315611 () Bool)

(assert (=> b!516043 (=> (not res!315611) (not e!301220))))

(assert (=> b!516043 (= res!315611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46738 res!315614) b!516044))

(assert (= (and b!516044 res!315606) b!516050))

(assert (= (and b!516050 res!315605) b!516042))

(assert (= (and b!516042 res!315612) b!516048))

(assert (= (and b!516048 res!315607) b!516040))

(assert (= (and b!516040 res!315609) b!516043))

(assert (= (and b!516043 res!315611) b!516045))

(assert (= (and b!516045 res!315613) b!516041))

(assert (= (and b!516041 res!315610) b!516046))

(assert (= (and b!516041 (not res!315608)) b!516047))

(assert (= (and b!516047 (not res!315604)) b!516049))

(declare-fun m!497467 () Bool)

(assert (=> b!516042 m!497467))

(declare-fun m!497469 () Bool)

(assert (=> b!516050 m!497469))

(assert (=> b!516050 m!497469))

(declare-fun m!497471 () Bool)

(assert (=> b!516050 m!497471))

(declare-fun m!497473 () Bool)

(assert (=> b!516049 m!497473))

(assert (=> b!516049 m!497469))

(declare-fun m!497475 () Bool)

(assert (=> b!516048 m!497475))

(declare-fun m!497477 () Bool)

(assert (=> start!46738 m!497477))

(declare-fun m!497479 () Bool)

(assert (=> start!46738 m!497479))

(declare-fun m!497481 () Bool)

(assert (=> b!516041 m!497481))

(declare-fun m!497483 () Bool)

(assert (=> b!516041 m!497483))

(declare-fun m!497485 () Bool)

(assert (=> b!516041 m!497485))

(assert (=> b!516041 m!497469))

(declare-fun m!497487 () Bool)

(assert (=> b!516041 m!497487))

(assert (=> b!516041 m!497469))

(declare-fun m!497489 () Bool)

(assert (=> b!516041 m!497489))

(assert (=> b!516041 m!497485))

(declare-fun m!497491 () Bool)

(assert (=> b!516041 m!497491))

(assert (=> b!516041 m!497469))

(declare-fun m!497493 () Bool)

(assert (=> b!516041 m!497493))

(assert (=> b!516041 m!497485))

(declare-fun m!497495 () Bool)

(assert (=> b!516041 m!497495))

(assert (=> b!516046 m!497469))

(assert (=> b!516046 m!497469))

(declare-fun m!497497 () Bool)

(assert (=> b!516046 m!497497))

(declare-fun m!497499 () Bool)

(assert (=> b!516045 m!497499))

(declare-fun m!497501 () Bool)

(assert (=> b!516043 m!497501))

(declare-fun m!497503 () Bool)

(assert (=> b!516040 m!497503))

(push 1)

