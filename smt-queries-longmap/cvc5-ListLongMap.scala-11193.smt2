; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130790 () Bool)

(assert start!130790)

(declare-fun b!1533886 () Bool)

(declare-fun res!1050975 () Bool)

(declare-fun e!854349 () Bool)

(assert (=> b!1533886 (=> (not res!1050975) (not e!854349))))

(declare-datatypes ((array!101888 0))(
  ( (array!101889 (arr!49160 (Array (_ BitVec 32) (_ BitVec 64))) (size!49710 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101888)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533886 (= res!1050975 (validKeyInArray!0 (select (arr!49160 a!2792) i!951)))))

(declare-fun b!1533887 () Bool)

(declare-fun res!1050978 () Bool)

(assert (=> b!1533887 (=> (not res!1050978) (not e!854349))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533887 (= res!1050978 (and (= (size!49710 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49710 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49710 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533888 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533888 (= e!854349 (and (= (select (arr!49160 a!2792) index!463) (select (arr!49160 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1533889 () Bool)

(declare-fun res!1050974 () Bool)

(assert (=> b!1533889 (=> (not res!1050974) (not e!854349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101888 (_ BitVec 32)) Bool)

(assert (=> b!1533889 (= res!1050974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533890 () Bool)

(declare-fun res!1050977 () Bool)

(assert (=> b!1533890 (=> (not res!1050977) (not e!854349))))

(assert (=> b!1533890 (= res!1050977 (validKeyInArray!0 (select (arr!49160 a!2792) j!64)))))

(declare-fun b!1533892 () Bool)

(declare-fun res!1050972 () Bool)

(assert (=> b!1533892 (=> (not res!1050972) (not e!854349))))

(declare-datatypes ((List!35634 0))(
  ( (Nil!35631) (Cons!35630 (h!37075 (_ BitVec 64)) (t!50328 List!35634)) )
))
(declare-fun arrayNoDuplicates!0 (array!101888 (_ BitVec 32) List!35634) Bool)

(assert (=> b!1533892 (= res!1050972 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35631))))

(declare-fun b!1533893 () Bool)

(declare-fun res!1050976 () Bool)

(assert (=> b!1533893 (=> (not res!1050976) (not e!854349))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13292 0))(
  ( (MissingZero!13292 (index!55563 (_ BitVec 32))) (Found!13292 (index!55564 (_ BitVec 32))) (Intermediate!13292 (undefined!14104 Bool) (index!55565 (_ BitVec 32)) (x!137334 (_ BitVec 32))) (Undefined!13292) (MissingVacant!13292 (index!55566 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101888 (_ BitVec 32)) SeekEntryResult!13292)

(assert (=> b!1533893 (= res!1050976 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49160 a!2792) j!64) a!2792 mask!2480) (Found!13292 j!64)))))

(declare-fun res!1050973 () Bool)

(assert (=> start!130790 (=> (not res!1050973) (not e!854349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130790 (= res!1050973 (validMask!0 mask!2480))))

(assert (=> start!130790 e!854349))

(assert (=> start!130790 true))

(declare-fun array_inv!38188 (array!101888) Bool)

(assert (=> start!130790 (array_inv!38188 a!2792)))

(declare-fun b!1533891 () Bool)

(declare-fun res!1050979 () Bool)

(assert (=> b!1533891 (=> (not res!1050979) (not e!854349))))

(assert (=> b!1533891 (= res!1050979 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49710 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49710 a!2792)) (= (select (arr!49160 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130790 res!1050973) b!1533887))

(assert (= (and b!1533887 res!1050978) b!1533886))

(assert (= (and b!1533886 res!1050975) b!1533890))

(assert (= (and b!1533890 res!1050977) b!1533889))

(assert (= (and b!1533889 res!1050974) b!1533892))

(assert (= (and b!1533892 res!1050972) b!1533891))

(assert (= (and b!1533891 res!1050979) b!1533893))

(assert (= (and b!1533893 res!1050976) b!1533888))

(declare-fun m!1416573 () Bool)

(assert (=> start!130790 m!1416573))

(declare-fun m!1416575 () Bool)

(assert (=> start!130790 m!1416575))

(declare-fun m!1416577 () Bool)

(assert (=> b!1533888 m!1416577))

(declare-fun m!1416579 () Bool)

(assert (=> b!1533888 m!1416579))

(declare-fun m!1416581 () Bool)

(assert (=> b!1533889 m!1416581))

(assert (=> b!1533890 m!1416579))

(assert (=> b!1533890 m!1416579))

(declare-fun m!1416583 () Bool)

(assert (=> b!1533890 m!1416583))

(declare-fun m!1416585 () Bool)

(assert (=> b!1533891 m!1416585))

(assert (=> b!1533893 m!1416579))

(assert (=> b!1533893 m!1416579))

(declare-fun m!1416587 () Bool)

(assert (=> b!1533893 m!1416587))

(declare-fun m!1416589 () Bool)

(assert (=> b!1533892 m!1416589))

(declare-fun m!1416591 () Bool)

(assert (=> b!1533886 m!1416591))

(assert (=> b!1533886 m!1416591))

(declare-fun m!1416593 () Bool)

(assert (=> b!1533886 m!1416593))

(push 1)

(assert (not b!1533893))

(assert (not start!130790))

(assert (not b!1533890))

(assert (not b!1533892))

(assert (not b!1533886))

(assert (not b!1533889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

