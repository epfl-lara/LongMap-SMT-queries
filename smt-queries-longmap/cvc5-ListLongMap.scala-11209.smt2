; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130886 () Bool)

(assert start!130886)

(declare-fun b!1535123 () Bool)

(declare-fun res!1052210 () Bool)

(declare-fun e!854702 () Bool)

(assert (=> b!1535123 (=> (not res!1052210) (not e!854702))))

(declare-datatypes ((array!101984 0))(
  ( (array!101985 (arr!49208 (Array (_ BitVec 32) (_ BitVec 64))) (size!49758 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101984)

(declare-datatypes ((List!35682 0))(
  ( (Nil!35679) (Cons!35678 (h!37123 (_ BitVec 64)) (t!50376 List!35682)) )
))
(declare-fun arrayNoDuplicates!0 (array!101984 (_ BitVec 32) List!35682) Bool)

(assert (=> b!1535123 (= res!1052210 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35679))))

(declare-fun b!1535124 () Bool)

(declare-fun res!1052218 () Bool)

(assert (=> b!1535124 (=> (not res!1052218) (not e!854702))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535124 (= res!1052218 (validKeyInArray!0 (select (arr!49208 a!2792) i!951)))))

(declare-fun b!1535125 () Bool)

(declare-fun res!1052214 () Bool)

(assert (=> b!1535125 (=> (not res!1052214) (not e!854702))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101984 (_ BitVec 32)) Bool)

(assert (=> b!1535125 (= res!1052214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535126 () Bool)

(declare-fun e!854704 () Bool)

(assert (=> b!1535126 (= e!854702 e!854704)))

(declare-fun res!1052217 () Bool)

(assert (=> b!1535126 (=> (not res!1052217) (not e!854704))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!663996 () (_ BitVec 32))

(assert (=> b!1535126 (= res!1052217 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663996 #b00000000000000000000000000000000) (bvslt lt!663996 (size!49758 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535126 (= lt!663996 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535127 () Bool)

(declare-fun res!1052211 () Bool)

(assert (=> b!1535127 (=> (not res!1052211) (not e!854702))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13340 0))(
  ( (MissingZero!13340 (index!55755 (_ BitVec 32))) (Found!13340 (index!55756 (_ BitVec 32))) (Intermediate!13340 (undefined!14152 Bool) (index!55757 (_ BitVec 32)) (x!137510 (_ BitVec 32))) (Undefined!13340) (MissingVacant!13340 (index!55758 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101984 (_ BitVec 32)) SeekEntryResult!13340)

(assert (=> b!1535127 (= res!1052211 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49208 a!2792) j!64) a!2792 mask!2480) (Found!13340 j!64)))))

(declare-fun b!1535128 () Bool)

(declare-fun res!1052212 () Bool)

(assert (=> b!1535128 (=> (not res!1052212) (not e!854702))))

(assert (=> b!1535128 (= res!1052212 (validKeyInArray!0 (select (arr!49208 a!2792) j!64)))))

(declare-fun b!1535129 () Bool)

(assert (=> b!1535129 (= e!854704 false)))

(declare-fun lt!663997 () SeekEntryResult!13340)

(assert (=> b!1535129 (= lt!663997 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663996 vacantIndex!5 (select (arr!49208 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1052216 () Bool)

(assert (=> start!130886 (=> (not res!1052216) (not e!854702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130886 (= res!1052216 (validMask!0 mask!2480))))

(assert (=> start!130886 e!854702))

(assert (=> start!130886 true))

(declare-fun array_inv!38236 (array!101984) Bool)

(assert (=> start!130886 (array_inv!38236 a!2792)))

(declare-fun b!1535130 () Bool)

(declare-fun res!1052215 () Bool)

(assert (=> b!1535130 (=> (not res!1052215) (not e!854702))))

(assert (=> b!1535130 (= res!1052215 (not (= (select (arr!49208 a!2792) index!463) (select (arr!49208 a!2792) j!64))))))

(declare-fun b!1535131 () Bool)

(declare-fun res!1052209 () Bool)

(assert (=> b!1535131 (=> (not res!1052209) (not e!854702))))

(assert (=> b!1535131 (= res!1052209 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49758 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49758 a!2792)) (= (select (arr!49208 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535132 () Bool)

(declare-fun res!1052213 () Bool)

(assert (=> b!1535132 (=> (not res!1052213) (not e!854702))))

(assert (=> b!1535132 (= res!1052213 (and (= (size!49758 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49758 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49758 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130886 res!1052216) b!1535132))

(assert (= (and b!1535132 res!1052213) b!1535124))

(assert (= (and b!1535124 res!1052218) b!1535128))

(assert (= (and b!1535128 res!1052212) b!1535125))

(assert (= (and b!1535125 res!1052214) b!1535123))

(assert (= (and b!1535123 res!1052210) b!1535131))

(assert (= (and b!1535131 res!1052209) b!1535127))

(assert (= (and b!1535127 res!1052211) b!1535130))

(assert (= (and b!1535130 res!1052215) b!1535126))

(assert (= (and b!1535126 res!1052217) b!1535129))

(declare-fun m!1417683 () Bool)

(assert (=> b!1535126 m!1417683))

(declare-fun m!1417685 () Bool)

(assert (=> b!1535130 m!1417685))

(declare-fun m!1417687 () Bool)

(assert (=> b!1535130 m!1417687))

(assert (=> b!1535128 m!1417687))

(assert (=> b!1535128 m!1417687))

(declare-fun m!1417689 () Bool)

(assert (=> b!1535128 m!1417689))

(assert (=> b!1535127 m!1417687))

(assert (=> b!1535127 m!1417687))

(declare-fun m!1417691 () Bool)

(assert (=> b!1535127 m!1417691))

(declare-fun m!1417693 () Bool)

(assert (=> b!1535124 m!1417693))

(assert (=> b!1535124 m!1417693))

(declare-fun m!1417695 () Bool)

(assert (=> b!1535124 m!1417695))

(declare-fun m!1417697 () Bool)

(assert (=> start!130886 m!1417697))

(declare-fun m!1417699 () Bool)

(assert (=> start!130886 m!1417699))

(declare-fun m!1417701 () Bool)

(assert (=> b!1535131 m!1417701))

(declare-fun m!1417703 () Bool)

(assert (=> b!1535123 m!1417703))

(assert (=> b!1535129 m!1417687))

(assert (=> b!1535129 m!1417687))

(declare-fun m!1417705 () Bool)

(assert (=> b!1535129 m!1417705))

(declare-fun m!1417707 () Bool)

(assert (=> b!1535125 m!1417707))

(push 1)

