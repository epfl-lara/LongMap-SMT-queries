; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130806 () Bool)

(assert start!130806)

(declare-fun b!1534360 () Bool)

(declare-fun res!1051637 () Bool)

(declare-fun e!854370 () Bool)

(assert (=> b!1534360 (=> (not res!1051637) (not e!854370))))

(declare-datatypes ((array!101902 0))(
  ( (array!101903 (arr!49168 (Array (_ BitVec 32) (_ BitVec 64))) (size!49720 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101902)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101902 (_ BitVec 32)) Bool)

(assert (=> b!1534360 (= res!1051637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534361 () Bool)

(declare-fun res!1051632 () Bool)

(assert (=> b!1534361 (=> (not res!1051632) (not e!854370))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534361 (= res!1051632 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49720 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49720 a!2792)) (= (select (arr!49168 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534362 () Bool)

(declare-fun e!854369 () Bool)

(assert (=> b!1534362 (= e!854369 false)))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13325 0))(
  ( (MissingZero!13325 (index!55695 (_ BitVec 32))) (Found!13325 (index!55696 (_ BitVec 32))) (Intermediate!13325 (undefined!14137 Bool) (index!55697 (_ BitVec 32)) (x!137450 (_ BitVec 32))) (Undefined!13325) (MissingVacant!13325 (index!55698 (_ BitVec 32))) )
))
(declare-fun lt!663620 () SeekEntryResult!13325)

(declare-fun lt!663621 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101902 (_ BitVec 32)) SeekEntryResult!13325)

(assert (=> b!1534362 (= lt!663620 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663621 vacantIndex!5 (select (arr!49168 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534364 () Bool)

(declare-fun res!1051634 () Bool)

(assert (=> b!1534364 (=> (not res!1051634) (not e!854370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534364 (= res!1051634 (validKeyInArray!0 (select (arr!49168 a!2792) j!64)))))

(declare-fun b!1534365 () Bool)

(declare-fun res!1051631 () Bool)

(assert (=> b!1534365 (=> (not res!1051631) (not e!854370))))

(assert (=> b!1534365 (= res!1051631 (not (= (select (arr!49168 a!2792) index!463) (select (arr!49168 a!2792) j!64))))))

(declare-fun b!1534363 () Bool)

(declare-fun res!1051633 () Bool)

(assert (=> b!1534363 (=> (not res!1051633) (not e!854370))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534363 (= res!1051633 (and (= (size!49720 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49720 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49720 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1051636 () Bool)

(assert (=> start!130806 (=> (not res!1051636) (not e!854370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130806 (= res!1051636 (validMask!0 mask!2480))))

(assert (=> start!130806 e!854370))

(assert (=> start!130806 true))

(declare-fun array_inv!38401 (array!101902) Bool)

(assert (=> start!130806 (array_inv!38401 a!2792)))

(declare-fun b!1534366 () Bool)

(declare-fun res!1051638 () Bool)

(assert (=> b!1534366 (=> (not res!1051638) (not e!854370))))

(assert (=> b!1534366 (= res!1051638 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49168 a!2792) j!64) a!2792 mask!2480) (Found!13325 j!64)))))

(declare-fun b!1534367 () Bool)

(assert (=> b!1534367 (= e!854370 e!854369)))

(declare-fun res!1051630 () Bool)

(assert (=> b!1534367 (=> (not res!1051630) (not e!854369))))

(assert (=> b!1534367 (= res!1051630 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663621 #b00000000000000000000000000000000) (bvslt lt!663621 (size!49720 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534367 (= lt!663621 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534368 () Bool)

(declare-fun res!1051635 () Bool)

(assert (=> b!1534368 (=> (not res!1051635) (not e!854370))))

(declare-datatypes ((List!35720 0))(
  ( (Nil!35717) (Cons!35716 (h!37162 (_ BitVec 64)) (t!50406 List!35720)) )
))
(declare-fun arrayNoDuplicates!0 (array!101902 (_ BitVec 32) List!35720) Bool)

(assert (=> b!1534368 (= res!1051635 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35717))))

(declare-fun b!1534369 () Bool)

(declare-fun res!1051639 () Bool)

(assert (=> b!1534369 (=> (not res!1051639) (not e!854370))))

(assert (=> b!1534369 (= res!1051639 (validKeyInArray!0 (select (arr!49168 a!2792) i!951)))))

(assert (= (and start!130806 res!1051636) b!1534363))

(assert (= (and b!1534363 res!1051633) b!1534369))

(assert (= (and b!1534369 res!1051639) b!1534364))

(assert (= (and b!1534364 res!1051634) b!1534360))

(assert (= (and b!1534360 res!1051637) b!1534368))

(assert (= (and b!1534368 res!1051635) b!1534361))

(assert (= (and b!1534361 res!1051632) b!1534366))

(assert (= (and b!1534366 res!1051638) b!1534365))

(assert (= (and b!1534365 res!1051631) b!1534367))

(assert (= (and b!1534367 res!1051630) b!1534362))

(declare-fun m!1416401 () Bool)

(assert (=> b!1534360 m!1416401))

(declare-fun m!1416403 () Bool)

(assert (=> b!1534365 m!1416403))

(declare-fun m!1416405 () Bool)

(assert (=> b!1534365 m!1416405))

(declare-fun m!1416407 () Bool)

(assert (=> b!1534369 m!1416407))

(assert (=> b!1534369 m!1416407))

(declare-fun m!1416409 () Bool)

(assert (=> b!1534369 m!1416409))

(assert (=> b!1534362 m!1416405))

(assert (=> b!1534362 m!1416405))

(declare-fun m!1416411 () Bool)

(assert (=> b!1534362 m!1416411))

(declare-fun m!1416413 () Bool)

(assert (=> b!1534368 m!1416413))

(declare-fun m!1416415 () Bool)

(assert (=> b!1534361 m!1416415))

(declare-fun m!1416417 () Bool)

(assert (=> start!130806 m!1416417))

(declare-fun m!1416419 () Bool)

(assert (=> start!130806 m!1416419))

(declare-fun m!1416421 () Bool)

(assert (=> b!1534367 m!1416421))

(assert (=> b!1534364 m!1416405))

(assert (=> b!1534364 m!1416405))

(declare-fun m!1416423 () Bool)

(assert (=> b!1534364 m!1416423))

(assert (=> b!1534366 m!1416405))

(assert (=> b!1534366 m!1416405))

(declare-fun m!1416425 () Bool)

(assert (=> b!1534366 m!1416425))

(check-sat (not b!1534360) (not b!1534366) (not start!130806) (not b!1534368) (not b!1534364) (not b!1534362) (not b!1534367) (not b!1534369))
(check-sat)
