; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130880 () Bool)

(assert start!130880)

(declare-fun b!1535033 () Bool)

(declare-fun res!1052122 () Bool)

(declare-fun e!854675 () Bool)

(assert (=> b!1535033 (=> (not res!1052122) (not e!854675))))

(declare-datatypes ((array!101978 0))(
  ( (array!101979 (arr!49205 (Array (_ BitVec 32) (_ BitVec 64))) (size!49755 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101978)

(declare-datatypes ((List!35679 0))(
  ( (Nil!35676) (Cons!35675 (h!37120 (_ BitVec 64)) (t!50373 List!35679)) )
))
(declare-fun arrayNoDuplicates!0 (array!101978 (_ BitVec 32) List!35679) Bool)

(assert (=> b!1535033 (= res!1052122 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35676))))

(declare-fun b!1535034 () Bool)

(declare-fun e!854677 () Bool)

(assert (=> b!1535034 (= e!854677 false)))

(declare-fun lt!663978 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13337 0))(
  ( (MissingZero!13337 (index!55743 (_ BitVec 32))) (Found!13337 (index!55744 (_ BitVec 32))) (Intermediate!13337 (undefined!14149 Bool) (index!55745 (_ BitVec 32)) (x!137499 (_ BitVec 32))) (Undefined!13337) (MissingVacant!13337 (index!55746 (_ BitVec 32))) )
))
(declare-fun lt!663979 () SeekEntryResult!13337)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101978 (_ BitVec 32)) SeekEntryResult!13337)

(assert (=> b!1535034 (= lt!663979 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663978 vacantIndex!5 (select (arr!49205 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535035 () Bool)

(declare-fun res!1052124 () Bool)

(assert (=> b!1535035 (=> (not res!1052124) (not e!854675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535035 (= res!1052124 (validKeyInArray!0 (select (arr!49205 a!2792) j!64)))))

(declare-fun b!1535036 () Bool)

(declare-fun res!1052128 () Bool)

(assert (=> b!1535036 (=> (not res!1052128) (not e!854675))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535036 (= res!1052128 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49205 a!2792) j!64) a!2792 mask!2480) (Found!13337 j!64)))))

(declare-fun b!1535037 () Bool)

(declare-fun res!1052119 () Bool)

(assert (=> b!1535037 (=> (not res!1052119) (not e!854675))))

(assert (=> b!1535037 (= res!1052119 (not (= (select (arr!49205 a!2792) index!463) (select (arr!49205 a!2792) j!64))))))

(declare-fun b!1535038 () Bool)

(declare-fun res!1052126 () Bool)

(assert (=> b!1535038 (=> (not res!1052126) (not e!854675))))

(assert (=> b!1535038 (= res!1052126 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49755 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49755 a!2792)) (= (select (arr!49205 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535039 () Bool)

(declare-fun res!1052127 () Bool)

(assert (=> b!1535039 (=> (not res!1052127) (not e!854675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101978 (_ BitVec 32)) Bool)

(assert (=> b!1535039 (= res!1052127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535040 () Bool)

(declare-fun res!1052121 () Bool)

(assert (=> b!1535040 (=> (not res!1052121) (not e!854675))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535040 (= res!1052121 (validKeyInArray!0 (select (arr!49205 a!2792) i!951)))))

(declare-fun res!1052120 () Bool)

(assert (=> start!130880 (=> (not res!1052120) (not e!854675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130880 (= res!1052120 (validMask!0 mask!2480))))

(assert (=> start!130880 e!854675))

(assert (=> start!130880 true))

(declare-fun array_inv!38233 (array!101978) Bool)

(assert (=> start!130880 (array_inv!38233 a!2792)))

(declare-fun b!1535041 () Bool)

(declare-fun res!1052123 () Bool)

(assert (=> b!1535041 (=> (not res!1052123) (not e!854675))))

(assert (=> b!1535041 (= res!1052123 (and (= (size!49755 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49755 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49755 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535042 () Bool)

(assert (=> b!1535042 (= e!854675 e!854677)))

(declare-fun res!1052125 () Bool)

(assert (=> b!1535042 (=> (not res!1052125) (not e!854677))))

(assert (=> b!1535042 (= res!1052125 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663978 #b00000000000000000000000000000000) (bvslt lt!663978 (size!49755 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535042 (= lt!663978 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130880 res!1052120) b!1535041))

(assert (= (and b!1535041 res!1052123) b!1535040))

(assert (= (and b!1535040 res!1052121) b!1535035))

(assert (= (and b!1535035 res!1052124) b!1535039))

(assert (= (and b!1535039 res!1052127) b!1535033))

(assert (= (and b!1535033 res!1052122) b!1535038))

(assert (= (and b!1535038 res!1052126) b!1535036))

(assert (= (and b!1535036 res!1052128) b!1535037))

(assert (= (and b!1535037 res!1052119) b!1535042))

(assert (= (and b!1535042 res!1052125) b!1535034))

(declare-fun m!1417605 () Bool)

(assert (=> b!1535035 m!1417605))

(assert (=> b!1535035 m!1417605))

(declare-fun m!1417607 () Bool)

(assert (=> b!1535035 m!1417607))

(assert (=> b!1535036 m!1417605))

(assert (=> b!1535036 m!1417605))

(declare-fun m!1417609 () Bool)

(assert (=> b!1535036 m!1417609))

(declare-fun m!1417611 () Bool)

(assert (=> b!1535037 m!1417611))

(assert (=> b!1535037 m!1417605))

(assert (=> b!1535034 m!1417605))

(assert (=> b!1535034 m!1417605))

(declare-fun m!1417613 () Bool)

(assert (=> b!1535034 m!1417613))

(declare-fun m!1417615 () Bool)

(assert (=> start!130880 m!1417615))

(declare-fun m!1417617 () Bool)

(assert (=> start!130880 m!1417617))

(declare-fun m!1417619 () Bool)

(assert (=> b!1535040 m!1417619))

(assert (=> b!1535040 m!1417619))

(declare-fun m!1417621 () Bool)

(assert (=> b!1535040 m!1417621))

(declare-fun m!1417623 () Bool)

(assert (=> b!1535033 m!1417623))

(declare-fun m!1417625 () Bool)

(assert (=> b!1535038 m!1417625))

(declare-fun m!1417627 () Bool)

(assert (=> b!1535042 m!1417627))

(declare-fun m!1417629 () Bool)

(assert (=> b!1535039 m!1417629))

(push 1)

