; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131158 () Bool)

(assert start!131158)

(declare-fun b!1538631 () Bool)

(declare-fun res!1055615 () Bool)

(declare-fun e!856038 () Bool)

(assert (=> b!1538631 (=> (not res!1055615) (not e!856038))))

(declare-datatypes ((array!102223 0))(
  ( (array!102224 (arr!49326 (Array (_ BitVec 32) (_ BitVec 64))) (size!49876 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102223)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538631 (= res!1055615 (and (= (size!49876 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49876 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49876 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538632 () Bool)

(declare-fun res!1055614 () Bool)

(assert (=> b!1538632 (=> (not res!1055614) (not e!856038))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538632 (= res!1055614 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49876 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49876 a!2792)) (= (select (arr!49326 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1055609 () Bool)

(assert (=> start!131158 (=> (not res!1055609) (not e!856038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131158 (= res!1055609 (validMask!0 mask!2480))))

(assert (=> start!131158 e!856038))

(assert (=> start!131158 true))

(declare-fun array_inv!38354 (array!102223) Bool)

(assert (=> start!131158 (array_inv!38354 a!2792)))

(declare-fun b!1538633 () Bool)

(declare-fun res!1055612 () Bool)

(assert (=> b!1538633 (=> (not res!1055612) (not e!856038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538633 (= res!1055612 (validKeyInArray!0 (select (arr!49326 a!2792) j!64)))))

(declare-fun b!1538634 () Bool)

(declare-fun res!1055617 () Bool)

(assert (=> b!1538634 (=> (not res!1055617) (not e!856038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102223 (_ BitVec 32)) Bool)

(assert (=> b!1538634 (= res!1055617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538635 () Bool)

(declare-fun res!1055616 () Bool)

(assert (=> b!1538635 (=> (not res!1055616) (not e!856038))))

(declare-datatypes ((SeekEntryResult!13452 0))(
  ( (MissingZero!13452 (index!56203 (_ BitVec 32))) (Found!13452 (index!56204 (_ BitVec 32))) (Intermediate!13452 (undefined!14264 Bool) (index!56205 (_ BitVec 32)) (x!137937 (_ BitVec 32))) (Undefined!13452) (MissingVacant!13452 (index!56206 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102223 (_ BitVec 32)) SeekEntryResult!13452)

(assert (=> b!1538635 (= res!1055616 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49326 a!2792) j!64) a!2792 mask!2480) (Found!13452 j!64)))))

(declare-fun b!1538636 () Bool)

(declare-fun res!1055613 () Bool)

(assert (=> b!1538636 (=> (not res!1055613) (not e!856038))))

(declare-datatypes ((List!35800 0))(
  ( (Nil!35797) (Cons!35796 (h!37241 (_ BitVec 64)) (t!50494 List!35800)) )
))
(declare-fun arrayNoDuplicates!0 (array!102223 (_ BitVec 32) List!35800) Bool)

(assert (=> b!1538636 (= res!1055613 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35797))))

(declare-fun b!1538637 () Bool)

(declare-fun res!1055611 () Bool)

(assert (=> b!1538637 (=> (not res!1055611) (not e!856038))))

(assert (=> b!1538637 (= res!1055611 (not (= (select (arr!49326 a!2792) index!463) (select (arr!49326 a!2792) j!64))))))

(declare-fun b!1538638 () Bool)

(declare-fun res!1055610 () Bool)

(assert (=> b!1538638 (=> (not res!1055610) (not e!856038))))

(assert (=> b!1538638 (= res!1055610 (validKeyInArray!0 (select (arr!49326 a!2792) i!951)))))

(declare-fun b!1538639 () Bool)

(assert (=> b!1538639 (= e!856038 false)))

(declare-fun lt!664921 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538639 (= lt!664921 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131158 res!1055609) b!1538631))

(assert (= (and b!1538631 res!1055615) b!1538638))

(assert (= (and b!1538638 res!1055610) b!1538633))

(assert (= (and b!1538633 res!1055612) b!1538634))

(assert (= (and b!1538634 res!1055617) b!1538636))

(assert (= (and b!1538636 res!1055613) b!1538632))

(assert (= (and b!1538632 res!1055614) b!1538635))

(assert (= (and b!1538635 res!1055616) b!1538637))

(assert (= (and b!1538637 res!1055611) b!1538639))

(declare-fun m!1421043 () Bool)

(assert (=> b!1538635 m!1421043))

(assert (=> b!1538635 m!1421043))

(declare-fun m!1421045 () Bool)

(assert (=> b!1538635 m!1421045))

(declare-fun m!1421047 () Bool)

(assert (=> b!1538632 m!1421047))

(declare-fun m!1421049 () Bool)

(assert (=> b!1538637 m!1421049))

(assert (=> b!1538637 m!1421043))

(declare-fun m!1421051 () Bool)

(assert (=> b!1538638 m!1421051))

(assert (=> b!1538638 m!1421051))

(declare-fun m!1421053 () Bool)

(assert (=> b!1538638 m!1421053))

(declare-fun m!1421055 () Bool)

(assert (=> b!1538636 m!1421055))

(assert (=> b!1538633 m!1421043))

(assert (=> b!1538633 m!1421043))

(declare-fun m!1421057 () Bool)

(assert (=> b!1538633 m!1421057))

(declare-fun m!1421059 () Bool)

(assert (=> b!1538634 m!1421059))

(declare-fun m!1421061 () Bool)

(assert (=> b!1538639 m!1421061))

(declare-fun m!1421063 () Bool)

(assert (=> start!131158 m!1421063))

(declare-fun m!1421065 () Bool)

(assert (=> start!131158 m!1421065))

(check-sat (not b!1538633) (not b!1538635) (not b!1538638) (not start!131158) (not b!1538636) (not b!1538634) (not b!1538639))
