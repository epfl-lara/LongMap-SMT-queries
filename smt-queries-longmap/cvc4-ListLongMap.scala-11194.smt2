; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130800 () Bool)

(assert start!130800)

(declare-fun b!1533998 () Bool)

(declare-fun res!1051090 () Bool)

(declare-fun e!854379 () Bool)

(assert (=> b!1533998 (=> (not res!1051090) (not e!854379))))

(declare-datatypes ((array!101898 0))(
  ( (array!101899 (arr!49165 (Array (_ BitVec 32) (_ BitVec 64))) (size!49715 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101898)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101898 (_ BitVec 32)) Bool)

(assert (=> b!1533998 (= res!1051090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534000 () Bool)

(declare-fun res!1051087 () Bool)

(assert (=> b!1534000 (=> (not res!1051087) (not e!854379))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534000 (= res!1051087 (and (= (size!49715 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49715 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49715 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534001 () Bool)

(declare-fun res!1051088 () Bool)

(assert (=> b!1534001 (=> (not res!1051088) (not e!854379))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534001 (= res!1051088 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49715 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49715 a!2792)) (= (select (arr!49165 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534002 () Bool)

(assert (=> b!1534002 (= e!854379 false)))

(declare-datatypes ((SeekEntryResult!13297 0))(
  ( (MissingZero!13297 (index!55583 (_ BitVec 32))) (Found!13297 (index!55584 (_ BitVec 32))) (Intermediate!13297 (undefined!14109 Bool) (index!55585 (_ BitVec 32)) (x!137347 (_ BitVec 32))) (Undefined!13297) (MissingVacant!13297 (index!55586 (_ BitVec 32))) )
))
(declare-fun lt!663829 () SeekEntryResult!13297)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101898 (_ BitVec 32)) SeekEntryResult!13297)

(assert (=> b!1534002 (= lt!663829 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49165 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533999 () Bool)

(declare-fun res!1051084 () Bool)

(assert (=> b!1533999 (=> (not res!1051084) (not e!854379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533999 (= res!1051084 (validKeyInArray!0 (select (arr!49165 a!2792) j!64)))))

(declare-fun res!1051089 () Bool)

(assert (=> start!130800 (=> (not res!1051089) (not e!854379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130800 (= res!1051089 (validMask!0 mask!2480))))

(assert (=> start!130800 e!854379))

(assert (=> start!130800 true))

(declare-fun array_inv!38193 (array!101898) Bool)

(assert (=> start!130800 (array_inv!38193 a!2792)))

(declare-fun b!1534003 () Bool)

(declare-fun res!1051085 () Bool)

(assert (=> b!1534003 (=> (not res!1051085) (not e!854379))))

(declare-datatypes ((List!35639 0))(
  ( (Nil!35636) (Cons!35635 (h!37080 (_ BitVec 64)) (t!50333 List!35639)) )
))
(declare-fun arrayNoDuplicates!0 (array!101898 (_ BitVec 32) List!35639) Bool)

(assert (=> b!1534003 (= res!1051085 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35636))))

(declare-fun b!1534004 () Bool)

(declare-fun res!1051086 () Bool)

(assert (=> b!1534004 (=> (not res!1051086) (not e!854379))))

(assert (=> b!1534004 (= res!1051086 (validKeyInArray!0 (select (arr!49165 a!2792) i!951)))))

(assert (= (and start!130800 res!1051089) b!1534000))

(assert (= (and b!1534000 res!1051087) b!1534004))

(assert (= (and b!1534004 res!1051086) b!1533999))

(assert (= (and b!1533999 res!1051084) b!1533998))

(assert (= (and b!1533998 res!1051090) b!1534003))

(assert (= (and b!1534003 res!1051085) b!1534001))

(assert (= (and b!1534001 res!1051088) b!1534002))

(declare-fun m!1416679 () Bool)

(assert (=> b!1534004 m!1416679))

(assert (=> b!1534004 m!1416679))

(declare-fun m!1416681 () Bool)

(assert (=> b!1534004 m!1416681))

(declare-fun m!1416683 () Bool)

(assert (=> b!1534001 m!1416683))

(declare-fun m!1416685 () Bool)

(assert (=> start!130800 m!1416685))

(declare-fun m!1416687 () Bool)

(assert (=> start!130800 m!1416687))

(declare-fun m!1416689 () Bool)

(assert (=> b!1533999 m!1416689))

(assert (=> b!1533999 m!1416689))

(declare-fun m!1416691 () Bool)

(assert (=> b!1533999 m!1416691))

(assert (=> b!1534002 m!1416689))

(assert (=> b!1534002 m!1416689))

(declare-fun m!1416693 () Bool)

(assert (=> b!1534002 m!1416693))

(declare-fun m!1416695 () Bool)

(assert (=> b!1533998 m!1416695))

(declare-fun m!1416697 () Bool)

(assert (=> b!1534003 m!1416697))

(push 1)

(assert (not b!1534002))

(assert (not b!1534003))

(assert (not b!1533998))

(assert (not b!1533999))

(assert (not b!1534004))

(assert (not start!130800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

