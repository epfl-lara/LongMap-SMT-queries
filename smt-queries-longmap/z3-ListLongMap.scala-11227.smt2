; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131412 () Bool)

(assert start!131412)

(declare-fun res!1054785 () Bool)

(declare-fun e!856874 () Bool)

(assert (=> start!131412 (=> (not res!1054785) (not e!856874))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131412 (= res!1054785 (validMask!0 mask!2480))))

(assert (=> start!131412 e!856874))

(assert (=> start!131412 true))

(declare-datatypes ((array!102214 0))(
  ( (array!102215 (arr!49315 (Array (_ BitVec 32) (_ BitVec 64))) (size!49866 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102214)

(declare-fun array_inv!38596 (array!102214) Bool)

(assert (=> start!131412 (array_inv!38596 a!2792)))

(declare-fun b!1539271 () Bool)

(declare-fun res!1054789 () Bool)

(assert (=> b!1539271 (=> (not res!1054789) (not e!856874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102214 (_ BitVec 32)) Bool)

(assert (=> b!1539271 (= res!1054789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539272 () Bool)

(declare-fun res!1054791 () Bool)

(assert (=> b!1539272 (=> (not res!1054791) (not e!856874))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1539272 (= res!1054791 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49866 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49866 a!2792)) (= (select (arr!49315 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539273 () Bool)

(declare-fun res!1054783 () Bool)

(declare-fun e!856875 () Bool)

(assert (=> b!1539273 (=> (not res!1054783) (not e!856875))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1539273 (= res!1054783 (not (= (select (arr!49315 a!2792) index!463) (select (arr!49315 a!2792) j!64))))))

(declare-fun b!1539274 () Bool)

(declare-fun e!856876 () Bool)

(assert (=> b!1539274 (= e!856875 e!856876)))

(declare-fun res!1054786 () Bool)

(assert (=> b!1539274 (=> (not res!1054786) (not e!856876))))

(declare-fun lt!665407 () (_ BitVec 32))

(assert (=> b!1539274 (= res!1054786 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665407 #b00000000000000000000000000000000) (bvslt lt!665407 (size!49866 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539274 (= lt!665407 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1539275 () Bool)

(declare-fun res!1054784 () Bool)

(assert (=> b!1539275 (=> (not res!1054784) (not e!856874))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539275 (= res!1054784 (validKeyInArray!0 (select (arr!49315 a!2792) i!951)))))

(declare-fun b!1539276 () Bool)

(declare-fun e!856873 () Bool)

(assert (=> b!1539276 (= e!856876 e!856873)))

(declare-fun res!1054788 () Bool)

(assert (=> b!1539276 (=> (not res!1054788) (not e!856873))))

(declare-datatypes ((SeekEntryResult!13342 0))(
  ( (MissingZero!13342 (index!55763 (_ BitVec 32))) (Found!13342 (index!55764 (_ BitVec 32))) (Intermediate!13342 (undefined!14154 Bool) (index!55765 (_ BitVec 32)) (x!137706 (_ BitVec 32))) (Undefined!13342) (MissingVacant!13342 (index!55766 (_ BitVec 32))) )
))
(declare-fun lt!665409 () SeekEntryResult!13342)

(declare-fun lt!665408 () SeekEntryResult!13342)

(assert (=> b!1539276 (= res!1054788 (= lt!665409 lt!665408))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102214 (_ BitVec 32)) SeekEntryResult!13342)

(assert (=> b!1539276 (= lt!665409 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665407 vacantIndex!5 (select (arr!49315 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539277 () Bool)

(assert (=> b!1539277 (= e!856873 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(assert (=> b!1539277 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665407 vacantIndex!5 (select (store (arr!49315 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102215 (store (arr!49315 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49866 a!2792)) mask!2480) lt!665409)))

(declare-datatypes ((Unit!51293 0))(
  ( (Unit!51294) )
))
(declare-fun lt!665406 () Unit!51293)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51293)

(assert (=> b!1539277 (= lt!665406 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665407 vacantIndex!5 mask!2480))))

(declare-fun b!1539278 () Bool)

(declare-fun res!1054787 () Bool)

(assert (=> b!1539278 (=> (not res!1054787) (not e!856874))))

(declare-datatypes ((List!35776 0))(
  ( (Nil!35773) (Cons!35772 (h!37235 (_ BitVec 64)) (t!50462 List!35776)) )
))
(declare-fun arrayNoDuplicates!0 (array!102214 (_ BitVec 32) List!35776) Bool)

(assert (=> b!1539278 (= res!1054787 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35773))))

(declare-fun b!1539279 () Bool)

(declare-fun res!1054782 () Bool)

(assert (=> b!1539279 (=> (not res!1054782) (not e!856874))))

(assert (=> b!1539279 (= res!1054782 (validKeyInArray!0 (select (arr!49315 a!2792) j!64)))))

(declare-fun b!1539280 () Bool)

(declare-fun res!1054790 () Bool)

(assert (=> b!1539280 (=> (not res!1054790) (not e!856874))))

(assert (=> b!1539280 (= res!1054790 (and (= (size!49866 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49866 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49866 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539281 () Bool)

(assert (=> b!1539281 (= e!856874 e!856875)))

(declare-fun res!1054781 () Bool)

(assert (=> b!1539281 (=> (not res!1054781) (not e!856875))))

(assert (=> b!1539281 (= res!1054781 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49315 a!2792) j!64) a!2792 mask!2480) lt!665408))))

(assert (=> b!1539281 (= lt!665408 (Found!13342 j!64))))

(assert (= (and start!131412 res!1054785) b!1539280))

(assert (= (and b!1539280 res!1054790) b!1539275))

(assert (= (and b!1539275 res!1054784) b!1539279))

(assert (= (and b!1539279 res!1054782) b!1539271))

(assert (= (and b!1539271 res!1054789) b!1539278))

(assert (= (and b!1539278 res!1054787) b!1539272))

(assert (= (and b!1539272 res!1054791) b!1539281))

(assert (= (and b!1539281 res!1054781) b!1539273))

(assert (= (and b!1539273 res!1054783) b!1539274))

(assert (= (and b!1539274 res!1054786) b!1539276))

(assert (= (and b!1539276 res!1054788) b!1539277))

(declare-fun m!1421557 () Bool)

(assert (=> b!1539281 m!1421557))

(assert (=> b!1539281 m!1421557))

(declare-fun m!1421559 () Bool)

(assert (=> b!1539281 m!1421559))

(declare-fun m!1421561 () Bool)

(assert (=> start!131412 m!1421561))

(declare-fun m!1421563 () Bool)

(assert (=> start!131412 m!1421563))

(declare-fun m!1421565 () Bool)

(assert (=> b!1539278 m!1421565))

(declare-fun m!1421567 () Bool)

(assert (=> b!1539271 m!1421567))

(declare-fun m!1421569 () Bool)

(assert (=> b!1539275 m!1421569))

(assert (=> b!1539275 m!1421569))

(declare-fun m!1421571 () Bool)

(assert (=> b!1539275 m!1421571))

(declare-fun m!1421573 () Bool)

(assert (=> b!1539272 m!1421573))

(declare-fun m!1421575 () Bool)

(assert (=> b!1539273 m!1421575))

(assert (=> b!1539273 m!1421557))

(declare-fun m!1421577 () Bool)

(assert (=> b!1539274 m!1421577))

(assert (=> b!1539279 m!1421557))

(assert (=> b!1539279 m!1421557))

(declare-fun m!1421579 () Bool)

(assert (=> b!1539279 m!1421579))

(declare-fun m!1421581 () Bool)

(assert (=> b!1539277 m!1421581))

(declare-fun m!1421583 () Bool)

(assert (=> b!1539277 m!1421583))

(assert (=> b!1539277 m!1421583))

(declare-fun m!1421585 () Bool)

(assert (=> b!1539277 m!1421585))

(declare-fun m!1421587 () Bool)

(assert (=> b!1539277 m!1421587))

(assert (=> b!1539276 m!1421557))

(assert (=> b!1539276 m!1421557))

(declare-fun m!1421589 () Bool)

(assert (=> b!1539276 m!1421589))

(check-sat (not b!1539279) (not start!131412) (not b!1539276) (not b!1539275) (not b!1539277) (not b!1539271) (not b!1539281) (not b!1539274) (not b!1539278))
(check-sat)
