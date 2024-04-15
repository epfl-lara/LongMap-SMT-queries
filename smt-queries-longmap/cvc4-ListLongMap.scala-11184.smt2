; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130688 () Bool)

(assert start!130688)

(declare-fun b!1532971 () Bool)

(declare-fun res!1050246 () Bool)

(declare-fun e!853995 () Bool)

(assert (=> b!1532971 (=> (not res!1050246) (not e!853995))))

(declare-datatypes ((array!101784 0))(
  ( (array!101785 (arr!49109 (Array (_ BitVec 32) (_ BitVec 64))) (size!49661 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101784)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532971 (= res!1050246 (and (= (size!49661 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49661 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49661 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532972 () Bool)

(declare-fun res!1050247 () Bool)

(assert (=> b!1532972 (=> (not res!1050247) (not e!853995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532972 (= res!1050247 (validKeyInArray!0 (select (arr!49109 a!2792) j!64)))))

(declare-fun b!1532973 () Bool)

(declare-fun res!1050245 () Bool)

(assert (=> b!1532973 (=> (not res!1050245) (not e!853995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101784 (_ BitVec 32)) Bool)

(assert (=> b!1532973 (= res!1050245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532974 () Bool)

(assert (=> b!1532974 (= e!853995 false)))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13266 0))(
  ( (MissingZero!13266 (index!55459 (_ BitVec 32))) (Found!13266 (index!55460 (_ BitVec 32))) (Intermediate!13266 (undefined!14078 Bool) (index!55461 (_ BitVec 32)) (x!137231 (_ BitVec 32))) (Undefined!13266) (MissingVacant!13266 (index!55462 (_ BitVec 32))) )
))
(declare-fun lt!663504 () SeekEntryResult!13266)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101784 (_ BitVec 32)) SeekEntryResult!13266)

(assert (=> b!1532974 (= lt!663504 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49109 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1532975 () Bool)

(declare-fun res!1050244 () Bool)

(assert (=> b!1532975 (=> (not res!1050244) (not e!853995))))

(assert (=> b!1532975 (= res!1050244 (validKeyInArray!0 (select (arr!49109 a!2792) i!951)))))

(declare-fun b!1532976 () Bool)

(declare-fun res!1050241 () Bool)

(assert (=> b!1532976 (=> (not res!1050241) (not e!853995))))

(declare-datatypes ((List!35661 0))(
  ( (Nil!35658) (Cons!35657 (h!37103 (_ BitVec 64)) (t!50347 List!35661)) )
))
(declare-fun arrayNoDuplicates!0 (array!101784 (_ BitVec 32) List!35661) Bool)

(assert (=> b!1532976 (= res!1050241 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35658))))

(declare-fun b!1532977 () Bool)

(declare-fun res!1050242 () Bool)

(assert (=> b!1532977 (=> (not res!1050242) (not e!853995))))

(assert (=> b!1532977 (= res!1050242 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49661 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49661 a!2792)) (= (select (arr!49109 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1050243 () Bool)

(assert (=> start!130688 (=> (not res!1050243) (not e!853995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130688 (= res!1050243 (validMask!0 mask!2480))))

(assert (=> start!130688 e!853995))

(assert (=> start!130688 true))

(declare-fun array_inv!38342 (array!101784) Bool)

(assert (=> start!130688 (array_inv!38342 a!2792)))

(assert (= (and start!130688 res!1050243) b!1532971))

(assert (= (and b!1532971 res!1050246) b!1532975))

(assert (= (and b!1532975 res!1050244) b!1532972))

(assert (= (and b!1532972 res!1050247) b!1532973))

(assert (= (and b!1532973 res!1050245) b!1532976))

(assert (= (and b!1532976 res!1050241) b!1532977))

(assert (= (and b!1532977 res!1050242) b!1532974))

(declare-fun m!1415095 () Bool)

(assert (=> b!1532976 m!1415095))

(declare-fun m!1415097 () Bool)

(assert (=> b!1532974 m!1415097))

(assert (=> b!1532974 m!1415097))

(declare-fun m!1415099 () Bool)

(assert (=> b!1532974 m!1415099))

(assert (=> b!1532972 m!1415097))

(assert (=> b!1532972 m!1415097))

(declare-fun m!1415101 () Bool)

(assert (=> b!1532972 m!1415101))

(declare-fun m!1415103 () Bool)

(assert (=> start!130688 m!1415103))

(declare-fun m!1415105 () Bool)

(assert (=> start!130688 m!1415105))

(declare-fun m!1415107 () Bool)

(assert (=> b!1532975 m!1415107))

(assert (=> b!1532975 m!1415107))

(declare-fun m!1415109 () Bool)

(assert (=> b!1532975 m!1415109))

(declare-fun m!1415111 () Bool)

(assert (=> b!1532977 m!1415111))

(declare-fun m!1415113 () Bool)

(assert (=> b!1532973 m!1415113))

(push 1)

(assert (not b!1532975))

(assert (not b!1532972))

(assert (not b!1532973))

(assert (not b!1532976))

(assert (not start!130688))

(assert (not b!1532974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

