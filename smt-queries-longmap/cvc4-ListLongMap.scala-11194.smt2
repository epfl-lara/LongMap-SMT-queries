; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130748 () Bool)

(assert start!130748)

(declare-fun b!1533664 () Bool)

(declare-fun res!1050936 () Bool)

(declare-fun e!854176 () Bool)

(assert (=> b!1533664 (=> (not res!1050936) (not e!854176))))

(declare-datatypes ((array!101844 0))(
  ( (array!101845 (arr!49139 (Array (_ BitVec 32) (_ BitVec 64))) (size!49691 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101844)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533664 (= res!1050936 (validKeyInArray!0 (select (arr!49139 a!2792) i!951)))))

(declare-fun b!1533665 () Bool)

(declare-fun res!1050937 () Bool)

(assert (=> b!1533665 (=> (not res!1050937) (not e!854176))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533665 (= res!1050937 (and (= (size!49691 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49691 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49691 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533666 () Bool)

(declare-fun res!1050940 () Bool)

(assert (=> b!1533666 (=> (not res!1050940) (not e!854176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101844 (_ BitVec 32)) Bool)

(assert (=> b!1533666 (= res!1050940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533667 () Bool)

(assert (=> b!1533667 (= e!854176 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13296 0))(
  ( (MissingZero!13296 (index!55579 (_ BitVec 32))) (Found!13296 (index!55580 (_ BitVec 32))) (Intermediate!13296 (undefined!14108 Bool) (index!55581 (_ BitVec 32)) (x!137341 (_ BitVec 32))) (Undefined!13296) (MissingVacant!13296 (index!55582 (_ BitVec 32))) )
))
(declare-fun lt!663540 () SeekEntryResult!13296)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101844 (_ BitVec 32)) SeekEntryResult!13296)

(assert (=> b!1533667 (= lt!663540 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49139 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533668 () Bool)

(declare-fun res!1050938 () Bool)

(assert (=> b!1533668 (=> (not res!1050938) (not e!854176))))

(assert (=> b!1533668 (= res!1050938 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49691 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49691 a!2792)) (= (select (arr!49139 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533669 () Bool)

(declare-fun res!1050934 () Bool)

(assert (=> b!1533669 (=> (not res!1050934) (not e!854176))))

(assert (=> b!1533669 (= res!1050934 (validKeyInArray!0 (select (arr!49139 a!2792) j!64)))))

(declare-fun res!1050939 () Bool)

(assert (=> start!130748 (=> (not res!1050939) (not e!854176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130748 (= res!1050939 (validMask!0 mask!2480))))

(assert (=> start!130748 e!854176))

(assert (=> start!130748 true))

(declare-fun array_inv!38372 (array!101844) Bool)

(assert (=> start!130748 (array_inv!38372 a!2792)))

(declare-fun b!1533670 () Bool)

(declare-fun res!1050935 () Bool)

(assert (=> b!1533670 (=> (not res!1050935) (not e!854176))))

(declare-datatypes ((List!35691 0))(
  ( (Nil!35688) (Cons!35687 (h!37133 (_ BitVec 64)) (t!50377 List!35691)) )
))
(declare-fun arrayNoDuplicates!0 (array!101844 (_ BitVec 32) List!35691) Bool)

(assert (=> b!1533670 (= res!1050935 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35688))))

(assert (= (and start!130748 res!1050939) b!1533665))

(assert (= (and b!1533665 res!1050937) b!1533664))

(assert (= (and b!1533664 res!1050936) b!1533669))

(assert (= (and b!1533669 res!1050934) b!1533666))

(assert (= (and b!1533666 res!1050940) b!1533670))

(assert (= (and b!1533670 res!1050935) b!1533668))

(assert (= (and b!1533668 res!1050938) b!1533667))

(declare-fun m!1415767 () Bool)

(assert (=> start!130748 m!1415767))

(declare-fun m!1415769 () Bool)

(assert (=> start!130748 m!1415769))

(declare-fun m!1415771 () Bool)

(assert (=> b!1533670 m!1415771))

(declare-fun m!1415773 () Bool)

(assert (=> b!1533669 m!1415773))

(assert (=> b!1533669 m!1415773))

(declare-fun m!1415775 () Bool)

(assert (=> b!1533669 m!1415775))

(declare-fun m!1415777 () Bool)

(assert (=> b!1533666 m!1415777))

(assert (=> b!1533667 m!1415773))

(assert (=> b!1533667 m!1415773))

(declare-fun m!1415779 () Bool)

(assert (=> b!1533667 m!1415779))

(declare-fun m!1415781 () Bool)

(assert (=> b!1533664 m!1415781))

(assert (=> b!1533664 m!1415781))

(declare-fun m!1415783 () Bool)

(assert (=> b!1533664 m!1415783))

(declare-fun m!1415785 () Bool)

(assert (=> b!1533668 m!1415785))

(push 1)

(assert (not b!1533664))

(assert (not b!1533667))

(assert (not b!1533669))

(assert (not b!1533670))

(assert (not b!1533666))

(assert (not start!130748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

