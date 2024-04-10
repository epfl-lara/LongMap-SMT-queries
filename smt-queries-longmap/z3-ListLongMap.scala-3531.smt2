; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48758 () Bool)

(assert start!48758)

(declare-fun b!536261 () Bool)

(declare-fun res!331472 () Bool)

(declare-fun e!311347 () Bool)

(assert (=> b!536261 (=> (not res!331472) (not e!311347))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536261 (= res!331472 (validKeyInArray!0 k0!1998))))

(declare-fun b!536262 () Bool)

(declare-fun e!311346 () Bool)

(assert (=> b!536262 (= e!311346 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!246040 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4782 0))(
  ( (MissingZero!4782 (index!21352 (_ BitVec 32))) (Found!4782 (index!21353 (_ BitVec 32))) (Intermediate!4782 (undefined!5594 Bool) (index!21354 (_ BitVec 32)) (x!50293 (_ BitVec 32))) (Undefined!4782) (MissingVacant!4782 (index!21355 (_ BitVec 32))) )
))
(declare-fun lt!246043 () SeekEntryResult!4782)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33970 0))(
  ( (array!33971 (arr!16324 (Array (_ BitVec 32) (_ BitVec 64))) (size!16688 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33970)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33970 (_ BitVec 32)) SeekEntryResult!4782)

(assert (=> b!536262 (= lt!246043 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246040 (select (arr!16324 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536263 () Bool)

(declare-fun res!331469 () Bool)

(declare-fun e!311349 () Bool)

(assert (=> b!536263 (=> (not res!331469) (not e!311349))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536263 (= res!331469 (and (not (= (select (arr!16324 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16324 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16324 a!3154) index!1177) (select (arr!16324 a!3154) j!147)))))))

(declare-fun b!536264 () Bool)

(declare-fun res!331471 () Bool)

(assert (=> b!536264 (=> (not res!331471) (not e!311347))))

(assert (=> b!536264 (= res!331471 (validKeyInArray!0 (select (arr!16324 a!3154) j!147)))))

(declare-fun b!536265 () Bool)

(assert (=> b!536265 (= e!311349 e!311346)))

(declare-fun res!331474 () Bool)

(assert (=> b!536265 (=> (not res!331474) (not e!311346))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536265 (= res!331474 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246040 #b00000000000000000000000000000000) (bvslt lt!246040 (size!16688 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536265 (= lt!246040 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!331467 () Bool)

(assert (=> start!48758 (=> (not res!331467) (not e!311347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48758 (= res!331467 (validMask!0 mask!3216))))

(assert (=> start!48758 e!311347))

(assert (=> start!48758 true))

(declare-fun array_inv!12120 (array!33970) Bool)

(assert (=> start!48758 (array_inv!12120 a!3154)))

(declare-fun b!536266 () Bool)

(declare-fun res!331473 () Bool)

(declare-fun e!311348 () Bool)

(assert (=> b!536266 (=> (not res!331473) (not e!311348))))

(declare-datatypes ((List!10443 0))(
  ( (Nil!10440) (Cons!10439 (h!11382 (_ BitVec 64)) (t!16671 List!10443)) )
))
(declare-fun arrayNoDuplicates!0 (array!33970 (_ BitVec 32) List!10443) Bool)

(assert (=> b!536266 (= res!331473 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10440))))

(declare-fun b!536267 () Bool)

(declare-fun res!331477 () Bool)

(assert (=> b!536267 (=> (not res!331477) (not e!311348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33970 (_ BitVec 32)) Bool)

(assert (=> b!536267 (= res!331477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536268 () Bool)

(assert (=> b!536268 (= e!311347 e!311348)))

(declare-fun res!331470 () Bool)

(assert (=> b!536268 (=> (not res!331470) (not e!311348))))

(declare-fun lt!246041 () SeekEntryResult!4782)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536268 (= res!331470 (or (= lt!246041 (MissingZero!4782 i!1153)) (= lt!246041 (MissingVacant!4782 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33970 (_ BitVec 32)) SeekEntryResult!4782)

(assert (=> b!536268 (= lt!246041 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536269 () Bool)

(declare-fun res!331478 () Bool)

(assert (=> b!536269 (=> (not res!331478) (not e!311347))))

(assert (=> b!536269 (= res!331478 (and (= (size!16688 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16688 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16688 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536270 () Bool)

(declare-fun res!331476 () Bool)

(assert (=> b!536270 (=> (not res!331476) (not e!311349))))

(declare-fun lt!246042 () SeekEntryResult!4782)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536270 (= res!331476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16324 a!3154) j!147) mask!3216) (select (arr!16324 a!3154) j!147) a!3154 mask!3216) lt!246042))))

(declare-fun b!536271 () Bool)

(declare-fun res!331466 () Bool)

(assert (=> b!536271 (=> (not res!331466) (not e!311347))))

(declare-fun arrayContainsKey!0 (array!33970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536271 (= res!331466 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536272 () Bool)

(declare-fun res!331475 () Bool)

(assert (=> b!536272 (=> (not res!331475) (not e!311348))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536272 (= res!331475 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16688 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16688 a!3154)) (= (select (arr!16324 a!3154) resIndex!32) (select (arr!16324 a!3154) j!147))))))

(declare-fun b!536273 () Bool)

(assert (=> b!536273 (= e!311348 e!311349)))

(declare-fun res!331468 () Bool)

(assert (=> b!536273 (=> (not res!331468) (not e!311349))))

(assert (=> b!536273 (= res!331468 (= lt!246042 (Intermediate!4782 false resIndex!32 resX!32)))))

(assert (=> b!536273 (= lt!246042 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16324 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48758 res!331467) b!536269))

(assert (= (and b!536269 res!331478) b!536264))

(assert (= (and b!536264 res!331471) b!536261))

(assert (= (and b!536261 res!331472) b!536271))

(assert (= (and b!536271 res!331466) b!536268))

(assert (= (and b!536268 res!331470) b!536267))

(assert (= (and b!536267 res!331477) b!536266))

(assert (= (and b!536266 res!331473) b!536272))

(assert (= (and b!536272 res!331475) b!536273))

(assert (= (and b!536273 res!331468) b!536270))

(assert (= (and b!536270 res!331476) b!536263))

(assert (= (and b!536263 res!331469) b!536265))

(assert (= (and b!536265 res!331474) b!536262))

(declare-fun m!515705 () Bool)

(assert (=> b!536272 m!515705))

(declare-fun m!515707 () Bool)

(assert (=> b!536272 m!515707))

(assert (=> b!536264 m!515707))

(assert (=> b!536264 m!515707))

(declare-fun m!515709 () Bool)

(assert (=> b!536264 m!515709))

(declare-fun m!515711 () Bool)

(assert (=> b!536271 m!515711))

(declare-fun m!515713 () Bool)

(assert (=> b!536266 m!515713))

(declare-fun m!515715 () Bool)

(assert (=> b!536261 m!515715))

(declare-fun m!515717 () Bool)

(assert (=> start!48758 m!515717))

(declare-fun m!515719 () Bool)

(assert (=> start!48758 m!515719))

(assert (=> b!536273 m!515707))

(assert (=> b!536273 m!515707))

(declare-fun m!515721 () Bool)

(assert (=> b!536273 m!515721))

(declare-fun m!515723 () Bool)

(assert (=> b!536267 m!515723))

(assert (=> b!536270 m!515707))

(assert (=> b!536270 m!515707))

(declare-fun m!515725 () Bool)

(assert (=> b!536270 m!515725))

(assert (=> b!536270 m!515725))

(assert (=> b!536270 m!515707))

(declare-fun m!515727 () Bool)

(assert (=> b!536270 m!515727))

(declare-fun m!515729 () Bool)

(assert (=> b!536268 m!515729))

(assert (=> b!536262 m!515707))

(assert (=> b!536262 m!515707))

(declare-fun m!515731 () Bool)

(assert (=> b!536262 m!515731))

(declare-fun m!515733 () Bool)

(assert (=> b!536265 m!515733))

(declare-fun m!515735 () Bool)

(assert (=> b!536263 m!515735))

(assert (=> b!536263 m!515707))

(check-sat (not b!536268) (not b!536262) (not b!536271) (not b!536261) (not b!536270) (not b!536266) (not b!536264) (not b!536265) (not b!536267) (not b!536273) (not start!48758))
(check-sat)
