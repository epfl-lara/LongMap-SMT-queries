; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130698 () Bool)

(assert start!130698)

(declare-fun b!1532919 () Bool)

(declare-fun res!1050009 () Bool)

(declare-fun e!854074 () Bool)

(assert (=> b!1532919 (=> (not res!1050009) (not e!854074))))

(declare-datatypes ((array!101796 0))(
  ( (array!101797 (arr!49114 (Array (_ BitVec 32) (_ BitVec 64))) (size!49664 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101796)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101796 (_ BitVec 32)) Bool)

(assert (=> b!1532919 (= res!1050009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532920 () Bool)

(declare-fun res!1050008 () Bool)

(assert (=> b!1532920 (=> (not res!1050008) (not e!854074))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532920 (= res!1050008 (validKeyInArray!0 (select (arr!49114 a!2792) j!64)))))

(declare-fun b!1532921 () Bool)

(declare-fun res!1050007 () Bool)

(assert (=> b!1532921 (=> (not res!1050007) (not e!854074))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532921 (= res!1050007 (validKeyInArray!0 (select (arr!49114 a!2792) i!951)))))

(declare-fun b!1532922 () Bool)

(declare-fun res!1050006 () Bool)

(assert (=> b!1532922 (=> (not res!1050006) (not e!854074))))

(declare-datatypes ((List!35588 0))(
  ( (Nil!35585) (Cons!35584 (h!37029 (_ BitVec 64)) (t!50282 List!35588)) )
))
(declare-fun arrayNoDuplicates!0 (array!101796 (_ BitVec 32) List!35588) Bool)

(assert (=> b!1532922 (= res!1050006 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35585))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1532923 () Bool)

(assert (=> b!1532923 (= e!854074 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49664 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49664 a!2792)) (= (select (arr!49114 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun res!1050005 () Bool)

(assert (=> start!130698 (=> (not res!1050005) (not e!854074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130698 (= res!1050005 (validMask!0 mask!2480))))

(assert (=> start!130698 e!854074))

(assert (=> start!130698 true))

(declare-fun array_inv!38142 (array!101796) Bool)

(assert (=> start!130698 (array_inv!38142 a!2792)))

(declare-fun b!1532924 () Bool)

(declare-fun res!1050010 () Bool)

(assert (=> b!1532924 (=> (not res!1050010) (not e!854074))))

(assert (=> b!1532924 (= res!1050010 (and (= (size!49664 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49664 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49664 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130698 res!1050005) b!1532924))

(assert (= (and b!1532924 res!1050010) b!1532921))

(assert (= (and b!1532921 res!1050007) b!1532920))

(assert (= (and b!1532920 res!1050008) b!1532919))

(assert (= (and b!1532919 res!1050009) b!1532922))

(assert (= (and b!1532922 res!1050006) b!1532923))

(declare-fun m!1415625 () Bool)

(assert (=> b!1532921 m!1415625))

(assert (=> b!1532921 m!1415625))

(declare-fun m!1415627 () Bool)

(assert (=> b!1532921 m!1415627))

(declare-fun m!1415629 () Bool)

(assert (=> b!1532920 m!1415629))

(assert (=> b!1532920 m!1415629))

(declare-fun m!1415631 () Bool)

(assert (=> b!1532920 m!1415631))

(declare-fun m!1415633 () Bool)

(assert (=> start!130698 m!1415633))

(declare-fun m!1415635 () Bool)

(assert (=> start!130698 m!1415635))

(declare-fun m!1415637 () Bool)

(assert (=> b!1532922 m!1415637))

(declare-fun m!1415639 () Bool)

(assert (=> b!1532919 m!1415639))

(declare-fun m!1415641 () Bool)

(assert (=> b!1532923 m!1415641))

(push 1)

(assert (not start!130698))

(assert (not b!1532922))

(assert (not b!1532919))

(assert (not b!1532921))

(assert (not b!1532920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

