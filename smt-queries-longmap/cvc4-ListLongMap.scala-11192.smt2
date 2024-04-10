; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130788 () Bool)

(assert start!130788)

(declare-fun b!1533863 () Bool)

(declare-fun e!854344 () Bool)

(assert (=> b!1533863 (= e!854344 false)))

(declare-datatypes ((SeekEntryResult!13291 0))(
  ( (MissingZero!13291 (index!55559 (_ BitVec 32))) (Found!13291 (index!55560 (_ BitVec 32))) (Intermediate!13291 (undefined!14103 Bool) (index!55561 (_ BitVec 32)) (x!137325 (_ BitVec 32))) (Undefined!13291) (MissingVacant!13291 (index!55562 (_ BitVec 32))) )
))
(declare-fun lt!663820 () SeekEntryResult!13291)

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101886 0))(
  ( (array!101887 (arr!49159 (Array (_ BitVec 32) (_ BitVec 64))) (size!49709 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101886)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101886 (_ BitVec 32)) SeekEntryResult!13291)

(assert (=> b!1533863 (= lt!663820 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49159 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533864 () Bool)

(declare-fun res!1050952 () Bool)

(assert (=> b!1533864 (=> (not res!1050952) (not e!854344))))

(assert (=> b!1533864 (= res!1050952 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49709 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49709 a!2792)) (= (select (arr!49159 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1050953 () Bool)

(assert (=> start!130788 (=> (not res!1050953) (not e!854344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130788 (= res!1050953 (validMask!0 mask!2480))))

(assert (=> start!130788 e!854344))

(assert (=> start!130788 true))

(declare-fun array_inv!38187 (array!101886) Bool)

(assert (=> start!130788 (array_inv!38187 a!2792)))

(declare-fun b!1533865 () Bool)

(declare-fun res!1050951 () Bool)

(assert (=> b!1533865 (=> (not res!1050951) (not e!854344))))

(declare-datatypes ((List!35633 0))(
  ( (Nil!35630) (Cons!35629 (h!37074 (_ BitVec 64)) (t!50327 List!35633)) )
))
(declare-fun arrayNoDuplicates!0 (array!101886 (_ BitVec 32) List!35633) Bool)

(assert (=> b!1533865 (= res!1050951 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35630))))

(declare-fun b!1533866 () Bool)

(declare-fun res!1050949 () Bool)

(assert (=> b!1533866 (=> (not res!1050949) (not e!854344))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533866 (= res!1050949 (validKeyInArray!0 (select (arr!49159 a!2792) i!951)))))

(declare-fun b!1533867 () Bool)

(declare-fun res!1050950 () Bool)

(assert (=> b!1533867 (=> (not res!1050950) (not e!854344))))

(assert (=> b!1533867 (= res!1050950 (and (= (size!49709 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49709 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49709 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533868 () Bool)

(declare-fun res!1050954 () Bool)

(assert (=> b!1533868 (=> (not res!1050954) (not e!854344))))

(assert (=> b!1533868 (= res!1050954 (validKeyInArray!0 (select (arr!49159 a!2792) j!64)))))

(declare-fun b!1533869 () Bool)

(declare-fun res!1050955 () Bool)

(assert (=> b!1533869 (=> (not res!1050955) (not e!854344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101886 (_ BitVec 32)) Bool)

(assert (=> b!1533869 (= res!1050955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130788 res!1050953) b!1533867))

(assert (= (and b!1533867 res!1050950) b!1533866))

(assert (= (and b!1533866 res!1050949) b!1533868))

(assert (= (and b!1533868 res!1050954) b!1533869))

(assert (= (and b!1533869 res!1050955) b!1533865))

(assert (= (and b!1533865 res!1050951) b!1533864))

(assert (= (and b!1533864 res!1050952) b!1533863))

(declare-fun m!1416553 () Bool)

(assert (=> start!130788 m!1416553))

(declare-fun m!1416555 () Bool)

(assert (=> start!130788 m!1416555))

(declare-fun m!1416557 () Bool)

(assert (=> b!1533866 m!1416557))

(assert (=> b!1533866 m!1416557))

(declare-fun m!1416559 () Bool)

(assert (=> b!1533866 m!1416559))

(declare-fun m!1416561 () Bool)

(assert (=> b!1533863 m!1416561))

(assert (=> b!1533863 m!1416561))

(declare-fun m!1416563 () Bool)

(assert (=> b!1533863 m!1416563))

(assert (=> b!1533868 m!1416561))

(assert (=> b!1533868 m!1416561))

(declare-fun m!1416565 () Bool)

(assert (=> b!1533868 m!1416565))

(declare-fun m!1416567 () Bool)

(assert (=> b!1533864 m!1416567))

(declare-fun m!1416569 () Bool)

(assert (=> b!1533869 m!1416569))

(declare-fun m!1416571 () Bool)

(assert (=> b!1533865 m!1416571))

(push 1)

(assert (not b!1533868))

(assert (not b!1533865))

(assert (not b!1533863))

(assert (not b!1533869))

(assert (not b!1533866))

(assert (not start!130788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

