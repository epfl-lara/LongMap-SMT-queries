; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131400 () Bool)

(assert start!131400)

(declare-fun b!1539066 () Bool)

(declare-fun e!856776 () Bool)

(declare-fun lt!665328 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539066 (= e!856776 (validKeyInArray!0 lt!665328))))

(declare-fun b!1539067 () Bool)

(declare-fun e!856775 () Bool)

(declare-fun e!856780 () Bool)

(assert (=> b!1539067 (= e!856775 e!856780)))

(declare-fun res!1054576 () Bool)

(assert (=> b!1539067 (=> (not res!1054576) (not e!856780))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665330 () (_ BitVec 32))

(declare-datatypes ((array!102202 0))(
  ( (array!102203 (arr!49309 (Array (_ BitVec 32) (_ BitVec 64))) (size!49860 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102202)

(assert (=> b!1539067 (= res!1054576 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665330 #b00000000000000000000000000000000) (bvslt lt!665330 (size!49860 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539067 (= lt!665330 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1539068 () Bool)

(declare-fun res!1054577 () Bool)

(declare-fun e!856778 () Bool)

(assert (=> b!1539068 (=> (not res!1054577) (not e!856778))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1539068 (= res!1054577 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49860 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49860 a!2792)) (= (select (arr!49309 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539069 () Bool)

(declare-fun res!1054580 () Bool)

(assert (=> b!1539069 (=> (not res!1054580) (not e!856778))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539069 (= res!1054580 (validKeyInArray!0 (select (arr!49309 a!2792) i!951)))))

(declare-fun res!1054578 () Bool)

(assert (=> start!131400 (=> (not res!1054578) (not e!856778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131400 (= res!1054578 (validMask!0 mask!2480))))

(assert (=> start!131400 e!856778))

(assert (=> start!131400 true))

(declare-fun array_inv!38590 (array!102202) Bool)

(assert (=> start!131400 (array_inv!38590 a!2792)))

(declare-fun b!1539070 () Bool)

(declare-fun res!1054582 () Bool)

(assert (=> b!1539070 (=> (not res!1054582) (not e!856775))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1539070 (= res!1054582 (not (= (select (arr!49309 a!2792) index!463) (select (arr!49309 a!2792) j!64))))))

(declare-fun b!1539071 () Bool)

(declare-fun e!856777 () Bool)

(assert (=> b!1539071 (= e!856780 e!856777)))

(declare-fun res!1054586 () Bool)

(assert (=> b!1539071 (=> (not res!1054586) (not e!856777))))

(declare-datatypes ((SeekEntryResult!13336 0))(
  ( (MissingZero!13336 (index!55739 (_ BitVec 32))) (Found!13336 (index!55740 (_ BitVec 32))) (Intermediate!13336 (undefined!14148 Bool) (index!55741 (_ BitVec 32)) (x!137684 (_ BitVec 32))) (Undefined!13336) (MissingVacant!13336 (index!55742 (_ BitVec 32))) )
))
(declare-fun lt!665331 () SeekEntryResult!13336)

(declare-fun lt!665327 () SeekEntryResult!13336)

(assert (=> b!1539071 (= res!1054586 (= lt!665331 lt!665327))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102202 (_ BitVec 32)) SeekEntryResult!13336)

(assert (=> b!1539071 (= lt!665331 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665330 vacantIndex!5 (select (arr!49309 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539072 () Bool)

(assert (=> b!1539072 (= e!856777 (not e!856776))))

(declare-fun res!1054587 () Bool)

(assert (=> b!1539072 (=> res!1054587 e!856776)))

(assert (=> b!1539072 (= res!1054587 (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49309 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539072 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665330 vacantIndex!5 lt!665328 (array!102203 (store (arr!49309 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49860 a!2792)) mask!2480) lt!665331)))

(assert (=> b!1539072 (= lt!665328 (select (store (arr!49309 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(declare-datatypes ((Unit!51281 0))(
  ( (Unit!51282) )
))
(declare-fun lt!665329 () Unit!51281)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51281)

(assert (=> b!1539072 (= lt!665329 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665330 vacantIndex!5 mask!2480))))

(declare-fun b!1539073 () Bool)

(declare-fun res!1054585 () Bool)

(assert (=> b!1539073 (=> (not res!1054585) (not e!856778))))

(assert (=> b!1539073 (= res!1054585 (validKeyInArray!0 (select (arr!49309 a!2792) j!64)))))

(declare-fun b!1539074 () Bool)

(declare-fun res!1054579 () Bool)

(assert (=> b!1539074 (=> (not res!1054579) (not e!856778))))

(declare-datatypes ((List!35770 0))(
  ( (Nil!35767) (Cons!35766 (h!37229 (_ BitVec 64)) (t!50456 List!35770)) )
))
(declare-fun arrayNoDuplicates!0 (array!102202 (_ BitVec 32) List!35770) Bool)

(assert (=> b!1539074 (= res!1054579 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35767))))

(declare-fun b!1539075 () Bool)

(declare-fun res!1054583 () Bool)

(assert (=> b!1539075 (=> (not res!1054583) (not e!856778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102202 (_ BitVec 32)) Bool)

(assert (=> b!1539075 (= res!1054583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539076 () Bool)

(assert (=> b!1539076 (= e!856778 e!856775)))

(declare-fun res!1054581 () Bool)

(assert (=> b!1539076 (=> (not res!1054581) (not e!856775))))

(assert (=> b!1539076 (= res!1054581 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49309 a!2792) j!64) a!2792 mask!2480) lt!665327))))

(assert (=> b!1539076 (= lt!665327 (Found!13336 j!64))))

(declare-fun b!1539077 () Bool)

(declare-fun res!1054584 () Bool)

(assert (=> b!1539077 (=> (not res!1054584) (not e!856778))))

(assert (=> b!1539077 (= res!1054584 (and (= (size!49860 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49860 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49860 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131400 res!1054578) b!1539077))

(assert (= (and b!1539077 res!1054584) b!1539069))

(assert (= (and b!1539069 res!1054580) b!1539073))

(assert (= (and b!1539073 res!1054585) b!1539075))

(assert (= (and b!1539075 res!1054583) b!1539074))

(assert (= (and b!1539074 res!1054579) b!1539068))

(assert (= (and b!1539068 res!1054577) b!1539076))

(assert (= (and b!1539076 res!1054581) b!1539070))

(assert (= (and b!1539070 res!1054582) b!1539067))

(assert (= (and b!1539067 res!1054576) b!1539071))

(assert (= (and b!1539071 res!1054586) b!1539072))

(assert (= (and b!1539072 (not res!1054587)) b!1539066))

(declare-fun m!1421341 () Bool)

(assert (=> b!1539069 m!1421341))

(assert (=> b!1539069 m!1421341))

(declare-fun m!1421343 () Bool)

(assert (=> b!1539069 m!1421343))

(declare-fun m!1421345 () Bool)

(assert (=> b!1539070 m!1421345))

(declare-fun m!1421347 () Bool)

(assert (=> b!1539070 m!1421347))

(declare-fun m!1421349 () Bool)

(assert (=> b!1539068 m!1421349))

(declare-fun m!1421351 () Bool)

(assert (=> b!1539075 m!1421351))

(assert (=> b!1539073 m!1421347))

(assert (=> b!1539073 m!1421347))

(declare-fun m!1421353 () Bool)

(assert (=> b!1539073 m!1421353))

(assert (=> b!1539076 m!1421347))

(assert (=> b!1539076 m!1421347))

(declare-fun m!1421355 () Bool)

(assert (=> b!1539076 m!1421355))

(declare-fun m!1421357 () Bool)

(assert (=> b!1539066 m!1421357))

(assert (=> b!1539071 m!1421347))

(assert (=> b!1539071 m!1421347))

(declare-fun m!1421359 () Bool)

(assert (=> b!1539071 m!1421359))

(declare-fun m!1421361 () Bool)

(assert (=> start!131400 m!1421361))

(declare-fun m!1421363 () Bool)

(assert (=> start!131400 m!1421363))

(declare-fun m!1421365 () Bool)

(assert (=> b!1539074 m!1421365))

(declare-fun m!1421367 () Bool)

(assert (=> b!1539072 m!1421367))

(declare-fun m!1421369 () Bool)

(assert (=> b!1539072 m!1421369))

(declare-fun m!1421371 () Bool)

(assert (=> b!1539072 m!1421371))

(declare-fun m!1421373 () Bool)

(assert (=> b!1539072 m!1421373))

(declare-fun m!1421375 () Bool)

(assert (=> b!1539072 m!1421375))

(declare-fun m!1421377 () Bool)

(assert (=> b!1539067 m!1421377))

(check-sat (not b!1539067) (not b!1539072) (not b!1539074) (not b!1539066) (not b!1539076) (not b!1539075) (not b!1539071) (not start!131400) (not b!1539069) (not b!1539073))
(check-sat)
