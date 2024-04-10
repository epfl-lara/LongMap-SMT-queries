; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130796 () Bool)

(assert start!130796)

(declare-fun b!1533956 () Bool)

(declare-fun res!1051043 () Bool)

(declare-fun e!854368 () Bool)

(assert (=> b!1533956 (=> (not res!1051043) (not e!854368))))

(declare-datatypes ((array!101894 0))(
  ( (array!101895 (arr!49163 (Array (_ BitVec 32) (_ BitVec 64))) (size!49713 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101894)

(declare-datatypes ((List!35637 0))(
  ( (Nil!35634) (Cons!35633 (h!37078 (_ BitVec 64)) (t!50331 List!35637)) )
))
(declare-fun arrayNoDuplicates!0 (array!101894 (_ BitVec 32) List!35637) Bool)

(assert (=> b!1533956 (= res!1051043 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35634))))

(declare-fun b!1533957 () Bool)

(declare-fun res!1051046 () Bool)

(assert (=> b!1533957 (=> (not res!1051046) (not e!854368))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533957 (= res!1051046 (and (= (size!49713 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49713 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49713 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533958 () Bool)

(assert (=> b!1533958 (= e!854368 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13295 0))(
  ( (MissingZero!13295 (index!55575 (_ BitVec 32))) (Found!13295 (index!55576 (_ BitVec 32))) (Intermediate!13295 (undefined!14107 Bool) (index!55577 (_ BitVec 32)) (x!137345 (_ BitVec 32))) (Undefined!13295) (MissingVacant!13295 (index!55578 (_ BitVec 32))) )
))
(declare-fun lt!663823 () SeekEntryResult!13295)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101894 (_ BitVec 32)) SeekEntryResult!13295)

(assert (=> b!1533958 (= lt!663823 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49163 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533959 () Bool)

(declare-fun res!1051042 () Bool)

(assert (=> b!1533959 (=> (not res!1051042) (not e!854368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101894 (_ BitVec 32)) Bool)

(assert (=> b!1533959 (= res!1051042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533960 () Bool)

(declare-fun res!1051044 () Bool)

(assert (=> b!1533960 (=> (not res!1051044) (not e!854368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533960 (= res!1051044 (validKeyInArray!0 (select (arr!49163 a!2792) i!951)))))

(declare-fun b!1533961 () Bool)

(declare-fun res!1051045 () Bool)

(assert (=> b!1533961 (=> (not res!1051045) (not e!854368))))

(assert (=> b!1533961 (= res!1051045 (validKeyInArray!0 (select (arr!49163 a!2792) j!64)))))

(declare-fun res!1051047 () Bool)

(assert (=> start!130796 (=> (not res!1051047) (not e!854368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130796 (= res!1051047 (validMask!0 mask!2480))))

(assert (=> start!130796 e!854368))

(assert (=> start!130796 true))

(declare-fun array_inv!38191 (array!101894) Bool)

(assert (=> start!130796 (array_inv!38191 a!2792)))

(declare-fun b!1533962 () Bool)

(declare-fun res!1051048 () Bool)

(assert (=> b!1533962 (=> (not res!1051048) (not e!854368))))

(assert (=> b!1533962 (= res!1051048 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49713 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49713 a!2792)) (= (select (arr!49163 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130796 res!1051047) b!1533957))

(assert (= (and b!1533957 res!1051046) b!1533960))

(assert (= (and b!1533960 res!1051044) b!1533961))

(assert (= (and b!1533961 res!1051045) b!1533959))

(assert (= (and b!1533959 res!1051042) b!1533956))

(assert (= (and b!1533956 res!1051043) b!1533962))

(assert (= (and b!1533962 res!1051048) b!1533958))

(declare-fun m!1416639 () Bool)

(assert (=> b!1533958 m!1416639))

(assert (=> b!1533958 m!1416639))

(declare-fun m!1416641 () Bool)

(assert (=> b!1533958 m!1416641))

(declare-fun m!1416643 () Bool)

(assert (=> b!1533956 m!1416643))

(assert (=> b!1533961 m!1416639))

(assert (=> b!1533961 m!1416639))

(declare-fun m!1416645 () Bool)

(assert (=> b!1533961 m!1416645))

(declare-fun m!1416647 () Bool)

(assert (=> start!130796 m!1416647))

(declare-fun m!1416649 () Bool)

(assert (=> start!130796 m!1416649))

(declare-fun m!1416651 () Bool)

(assert (=> b!1533959 m!1416651))

(declare-fun m!1416653 () Bool)

(assert (=> b!1533962 m!1416653))

(declare-fun m!1416655 () Bool)

(assert (=> b!1533960 m!1416655))

(assert (=> b!1533960 m!1416655))

(declare-fun m!1416657 () Bool)

(assert (=> b!1533960 m!1416657))

(push 1)

(assert (not b!1533959))

(assert (not b!1533961))

(assert (not b!1533956))

(assert (not b!1533958))

(assert (not start!130796))

(assert (not b!1533960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

