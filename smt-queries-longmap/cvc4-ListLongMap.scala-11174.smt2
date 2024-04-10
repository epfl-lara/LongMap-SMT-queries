; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130680 () Bool)

(assert start!130680)

(declare-fun res!1049853 () Bool)

(declare-fun e!854020 () Bool)

(assert (=> start!130680 (=> (not res!1049853) (not e!854020))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130680 (= res!1049853 (validMask!0 mask!2480))))

(assert (=> start!130680 e!854020))

(assert (=> start!130680 true))

(declare-datatypes ((array!101778 0))(
  ( (array!101779 (arr!49105 (Array (_ BitVec 32) (_ BitVec 64))) (size!49655 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101778)

(declare-fun array_inv!38133 (array!101778) Bool)

(assert (=> start!130680 (array_inv!38133 a!2792)))

(declare-fun b!1532767 () Bool)

(assert (=> b!1532767 (= e!854020 false)))

(declare-fun lt!663739 () Bool)

(declare-datatypes ((List!35579 0))(
  ( (Nil!35576) (Cons!35575 (h!37020 (_ BitVec 64)) (t!50273 List!35579)) )
))
(declare-fun arrayNoDuplicates!0 (array!101778 (_ BitVec 32) List!35579) Bool)

(assert (=> b!1532767 (= lt!663739 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35576))))

(declare-fun b!1532768 () Bool)

(declare-fun res!1049854 () Bool)

(assert (=> b!1532768 (=> (not res!1049854) (not e!854020))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532768 (= res!1049854 (validKeyInArray!0 (select (arr!49105 a!2792) j!64)))))

(declare-fun b!1532769 () Bool)

(declare-fun res!1049855 () Bool)

(assert (=> b!1532769 (=> (not res!1049855) (not e!854020))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532769 (= res!1049855 (and (= (size!49655 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49655 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49655 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532770 () Bool)

(declare-fun res!1049856 () Bool)

(assert (=> b!1532770 (=> (not res!1049856) (not e!854020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101778 (_ BitVec 32)) Bool)

(assert (=> b!1532770 (= res!1049856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532771 () Bool)

(declare-fun res!1049857 () Bool)

(assert (=> b!1532771 (=> (not res!1049857) (not e!854020))))

(assert (=> b!1532771 (= res!1049857 (validKeyInArray!0 (select (arr!49105 a!2792) i!951)))))

(assert (= (and start!130680 res!1049853) b!1532769))

(assert (= (and b!1532769 res!1049855) b!1532771))

(assert (= (and b!1532771 res!1049857) b!1532768))

(assert (= (and b!1532768 res!1049854) b!1532770))

(assert (= (and b!1532770 res!1049856) b!1532767))

(declare-fun m!1415471 () Bool)

(assert (=> start!130680 m!1415471))

(declare-fun m!1415473 () Bool)

(assert (=> start!130680 m!1415473))

(declare-fun m!1415475 () Bool)

(assert (=> b!1532771 m!1415475))

(assert (=> b!1532771 m!1415475))

(declare-fun m!1415477 () Bool)

(assert (=> b!1532771 m!1415477))

(declare-fun m!1415479 () Bool)

(assert (=> b!1532767 m!1415479))

(declare-fun m!1415481 () Bool)

(assert (=> b!1532768 m!1415481))

(assert (=> b!1532768 m!1415481))

(declare-fun m!1415483 () Bool)

(assert (=> b!1532768 m!1415483))

(declare-fun m!1415485 () Bool)

(assert (=> b!1532770 m!1415485))

(push 1)

(assert (not b!1532771))

(assert (not b!1532768))

(assert (not b!1532767))

(assert (not start!130680))

(assert (not b!1532770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

