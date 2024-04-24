; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131560 () Bool)

(assert start!131560)

(declare-fun b!1540851 () Bool)

(declare-fun res!1056258 () Bool)

(declare-fun e!857499 () Bool)

(assert (=> b!1540851 (=> (not res!1056258) (not e!857499))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102329 0))(
  ( (array!102330 (arr!49371 (Array (_ BitVec 32) (_ BitVec 64))) (size!49922 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102329)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13392 0))(
  ( (MissingZero!13392 (index!55963 (_ BitVec 32))) (Found!13392 (index!55964 (_ BitVec 32))) (Intermediate!13392 (undefined!14204 Bool) (index!55965 (_ BitVec 32)) (x!137903 (_ BitVec 32))) (Undefined!13392) (MissingVacant!13392 (index!55966 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102329 (_ BitVec 32)) SeekEntryResult!13392)

(assert (=> b!1540851 (= res!1056258 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49371 a!2792) j!64) a!2792 mask!2480) (Found!13392 j!64)))))

(declare-fun b!1540852 () Bool)

(declare-fun res!1056260 () Bool)

(assert (=> b!1540852 (=> (not res!1056260) (not e!857499))))

(assert (=> b!1540852 (= res!1056260 (not (= (select (arr!49371 a!2792) index!463) (select (arr!49371 a!2792) j!64))))))

(declare-fun b!1540853 () Bool)

(declare-fun res!1056259 () Bool)

(assert (=> b!1540853 (=> (not res!1056259) (not e!857499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540853 (= res!1056259 (validKeyInArray!0 (select (arr!49371 a!2792) j!64)))))

(declare-fun b!1540854 () Bool)

(declare-fun res!1056253 () Bool)

(assert (=> b!1540854 (=> (not res!1056253) (not e!857499))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540854 (= res!1056253 (validKeyInArray!0 (select (arr!49371 a!2792) i!951)))))

(declare-fun b!1540855 () Bool)

(declare-fun res!1056255 () Bool)

(assert (=> b!1540855 (=> (not res!1056255) (not e!857499))))

(assert (=> b!1540855 (= res!1056255 (and (= (size!49922 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49922 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49922 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540856 () Bool)

(assert (=> b!1540856 (= e!857499 false)))

(declare-fun lt!665808 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540856 (= lt!665808 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1540857 () Bool)

(declare-fun res!1056254 () Bool)

(assert (=> b!1540857 (=> (not res!1056254) (not e!857499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102329 (_ BitVec 32)) Bool)

(assert (=> b!1540857 (= res!1056254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1056256 () Bool)

(assert (=> start!131560 (=> (not res!1056256) (not e!857499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131560 (= res!1056256 (validMask!0 mask!2480))))

(assert (=> start!131560 e!857499))

(assert (=> start!131560 true))

(declare-fun array_inv!38652 (array!102329) Bool)

(assert (=> start!131560 (array_inv!38652 a!2792)))

(declare-fun b!1540858 () Bool)

(declare-fun res!1056257 () Bool)

(assert (=> b!1540858 (=> (not res!1056257) (not e!857499))))

(declare-datatypes ((List!35832 0))(
  ( (Nil!35829) (Cons!35828 (h!37291 (_ BitVec 64)) (t!50518 List!35832)) )
))
(declare-fun arrayNoDuplicates!0 (array!102329 (_ BitVec 32) List!35832) Bool)

(assert (=> b!1540858 (= res!1056257 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35829))))

(declare-fun b!1540859 () Bool)

(declare-fun res!1056261 () Bool)

(assert (=> b!1540859 (=> (not res!1056261) (not e!857499))))

(assert (=> b!1540859 (= res!1056261 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49922 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49922 a!2792)) (= (select (arr!49371 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131560 res!1056256) b!1540855))

(assert (= (and b!1540855 res!1056255) b!1540854))

(assert (= (and b!1540854 res!1056253) b!1540853))

(assert (= (and b!1540853 res!1056259) b!1540857))

(assert (= (and b!1540857 res!1056254) b!1540858))

(assert (= (and b!1540858 res!1056257) b!1540859))

(assert (= (and b!1540859 res!1056261) b!1540851))

(assert (= (and b!1540851 res!1056258) b!1540852))

(assert (= (and b!1540852 res!1056260) b!1540856))

(declare-fun m!1423087 () Bool)

(assert (=> b!1540854 m!1423087))

(assert (=> b!1540854 m!1423087))

(declare-fun m!1423089 () Bool)

(assert (=> b!1540854 m!1423089))

(declare-fun m!1423091 () Bool)

(assert (=> b!1540857 m!1423091))

(declare-fun m!1423093 () Bool)

(assert (=> b!1540859 m!1423093))

(declare-fun m!1423095 () Bool)

(assert (=> b!1540853 m!1423095))

(assert (=> b!1540853 m!1423095))

(declare-fun m!1423097 () Bool)

(assert (=> b!1540853 m!1423097))

(assert (=> b!1540851 m!1423095))

(assert (=> b!1540851 m!1423095))

(declare-fun m!1423099 () Bool)

(assert (=> b!1540851 m!1423099))

(declare-fun m!1423101 () Bool)

(assert (=> start!131560 m!1423101))

(declare-fun m!1423103 () Bool)

(assert (=> start!131560 m!1423103))

(declare-fun m!1423105 () Bool)

(assert (=> b!1540856 m!1423105))

(declare-fun m!1423107 () Bool)

(assert (=> b!1540852 m!1423107))

(assert (=> b!1540852 m!1423095))

(declare-fun m!1423109 () Bool)

(assert (=> b!1540858 m!1423109))

(push 1)

(assert (not b!1540858))

(assert (not b!1540856))

(assert (not b!1540851))

(assert (not start!131560))

(assert (not b!1540857))

(assert (not b!1540854))

(assert (not b!1540853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

