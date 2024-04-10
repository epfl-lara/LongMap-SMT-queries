; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130786 () Bool)

(assert start!130786)

(declare-fun res!1050932 () Bool)

(declare-fun e!854338 () Bool)

(assert (=> start!130786 (=> (not res!1050932) (not e!854338))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130786 (= res!1050932 (validMask!0 mask!2480))))

(assert (=> start!130786 e!854338))

(assert (=> start!130786 true))

(declare-datatypes ((array!101884 0))(
  ( (array!101885 (arr!49158 (Array (_ BitVec 32) (_ BitVec 64))) (size!49708 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101884)

(declare-fun array_inv!38186 (array!101884) Bool)

(assert (=> start!130786 (array_inv!38186 a!2792)))

(declare-fun b!1533842 () Bool)

(declare-fun res!1050931 () Bool)

(assert (=> b!1533842 (=> (not res!1050931) (not e!854338))))

(declare-datatypes ((List!35632 0))(
  ( (Nil!35629) (Cons!35628 (h!37073 (_ BitVec 64)) (t!50326 List!35632)) )
))
(declare-fun arrayNoDuplicates!0 (array!101884 (_ BitVec 32) List!35632) Bool)

(assert (=> b!1533842 (= res!1050931 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35629))))

(declare-fun b!1533843 () Bool)

(declare-fun res!1050933 () Bool)

(assert (=> b!1533843 (=> (not res!1050933) (not e!854338))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533843 (= res!1050933 (validKeyInArray!0 (select (arr!49158 a!2792) i!951)))))

(declare-fun b!1533844 () Bool)

(declare-fun res!1050928 () Bool)

(assert (=> b!1533844 (=> (not res!1050928) (not e!854338))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533844 (= res!1050928 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49708 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49708 a!2792)) (= (select (arr!49158 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533845 () Bool)

(declare-fun res!1050930 () Bool)

(assert (=> b!1533845 (=> (not res!1050930) (not e!854338))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533845 (= res!1050930 (and (= (size!49708 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49708 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49708 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533846 () Bool)

(assert (=> b!1533846 (= e!854338 false)))

(declare-datatypes ((SeekEntryResult!13290 0))(
  ( (MissingZero!13290 (index!55555 (_ BitVec 32))) (Found!13290 (index!55556 (_ BitVec 32))) (Intermediate!13290 (undefined!14102 Bool) (index!55557 (_ BitVec 32)) (x!137324 (_ BitVec 32))) (Undefined!13290) (MissingVacant!13290 (index!55558 (_ BitVec 32))) )
))
(declare-fun lt!663817 () SeekEntryResult!13290)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101884 (_ BitVec 32)) SeekEntryResult!13290)

(assert (=> b!1533846 (= lt!663817 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49158 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533847 () Bool)

(declare-fun res!1050929 () Bool)

(assert (=> b!1533847 (=> (not res!1050929) (not e!854338))))

(assert (=> b!1533847 (= res!1050929 (validKeyInArray!0 (select (arr!49158 a!2792) j!64)))))

(declare-fun b!1533848 () Bool)

(declare-fun res!1050934 () Bool)

(assert (=> b!1533848 (=> (not res!1050934) (not e!854338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101884 (_ BitVec 32)) Bool)

(assert (=> b!1533848 (= res!1050934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130786 res!1050932) b!1533845))

(assert (= (and b!1533845 res!1050930) b!1533843))

(assert (= (and b!1533843 res!1050933) b!1533847))

(assert (= (and b!1533847 res!1050929) b!1533848))

(assert (= (and b!1533848 res!1050934) b!1533842))

(assert (= (and b!1533842 res!1050931) b!1533844))

(assert (= (and b!1533844 res!1050928) b!1533846))

(declare-fun m!1416533 () Bool)

(assert (=> b!1533844 m!1416533))

(declare-fun m!1416535 () Bool)

(assert (=> b!1533847 m!1416535))

(assert (=> b!1533847 m!1416535))

(declare-fun m!1416537 () Bool)

(assert (=> b!1533847 m!1416537))

(declare-fun m!1416539 () Bool)

(assert (=> start!130786 m!1416539))

(declare-fun m!1416541 () Bool)

(assert (=> start!130786 m!1416541))

(declare-fun m!1416543 () Bool)

(assert (=> b!1533848 m!1416543))

(declare-fun m!1416545 () Bool)

(assert (=> b!1533843 m!1416545))

(assert (=> b!1533843 m!1416545))

(declare-fun m!1416547 () Bool)

(assert (=> b!1533843 m!1416547))

(assert (=> b!1533846 m!1416535))

(assert (=> b!1533846 m!1416535))

(declare-fun m!1416549 () Bool)

(assert (=> b!1533846 m!1416549))

(declare-fun m!1416551 () Bool)

(assert (=> b!1533842 m!1416551))

(check-sat (not b!1533843) (not b!1533848) (not b!1533842) (not b!1533847) (not start!130786) (not b!1533846))
