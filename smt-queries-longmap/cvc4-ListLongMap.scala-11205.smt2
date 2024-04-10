; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130866 () Bool)

(assert start!130866)

(declare-fun b!1534823 () Bool)

(declare-fun res!1051910 () Bool)

(declare-fun e!854612 () Bool)

(assert (=> b!1534823 (=> (not res!1051910) (not e!854612))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101964 0))(
  ( (array!101965 (arr!49198 (Array (_ BitVec 32) (_ BitVec 64))) (size!49748 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101964)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534823 (= res!1051910 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49748 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49748 a!2792)) (= (select (arr!49198 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534824 () Bool)

(declare-fun e!854614 () Bool)

(assert (=> b!1534824 (= e!854612 e!854614)))

(declare-fun res!1051913 () Bool)

(assert (=> b!1534824 (=> (not res!1051913) (not e!854614))))

(declare-fun lt!663936 () (_ BitVec 32))

(assert (=> b!1534824 (= res!1051913 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663936 #b00000000000000000000000000000000) (bvslt lt!663936 (size!49748 a!2792))))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534824 (= lt!663936 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534825 () Bool)

(declare-fun res!1051909 () Bool)

(assert (=> b!1534825 (=> (not res!1051909) (not e!854612))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534825 (= res!1051909 (and (= (size!49748 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49748 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49748 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534826 () Bool)

(declare-fun res!1051917 () Bool)

(assert (=> b!1534826 (=> (not res!1051917) (not e!854612))))

(assert (=> b!1534826 (= res!1051917 (not (= (select (arr!49198 a!2792) index!463) (select (arr!49198 a!2792) j!64))))))

(declare-fun b!1534827 () Bool)

(declare-fun res!1051918 () Bool)

(assert (=> b!1534827 (=> (not res!1051918) (not e!854612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534827 (= res!1051918 (validKeyInArray!0 (select (arr!49198 a!2792) i!951)))))

(declare-fun b!1534828 () Bool)

(declare-fun res!1051911 () Bool)

(assert (=> b!1534828 (=> (not res!1051911) (not e!854612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101964 (_ BitVec 32)) Bool)

(assert (=> b!1534828 (= res!1051911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534829 () Bool)

(declare-fun res!1051915 () Bool)

(assert (=> b!1534829 (=> (not res!1051915) (not e!854612))))

(declare-datatypes ((List!35672 0))(
  ( (Nil!35669) (Cons!35668 (h!37113 (_ BitVec 64)) (t!50366 List!35672)) )
))
(declare-fun arrayNoDuplicates!0 (array!101964 (_ BitVec 32) List!35672) Bool)

(assert (=> b!1534829 (= res!1051915 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35669))))

(declare-fun b!1534830 () Bool)

(declare-fun res!1051916 () Bool)

(assert (=> b!1534830 (=> (not res!1051916) (not e!854612))))

(declare-datatypes ((SeekEntryResult!13330 0))(
  ( (MissingZero!13330 (index!55715 (_ BitVec 32))) (Found!13330 (index!55716 (_ BitVec 32))) (Intermediate!13330 (undefined!14142 Bool) (index!55717 (_ BitVec 32)) (x!137468 (_ BitVec 32))) (Undefined!13330) (MissingVacant!13330 (index!55718 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101964 (_ BitVec 32)) SeekEntryResult!13330)

(assert (=> b!1534830 (= res!1051916 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49198 a!2792) j!64) a!2792 mask!2480) (Found!13330 j!64)))))

(declare-fun res!1051912 () Bool)

(assert (=> start!130866 (=> (not res!1051912) (not e!854612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130866 (= res!1051912 (validMask!0 mask!2480))))

(assert (=> start!130866 e!854612))

(assert (=> start!130866 true))

(declare-fun array_inv!38226 (array!101964) Bool)

(assert (=> start!130866 (array_inv!38226 a!2792)))

(declare-fun b!1534831 () Bool)

(declare-fun res!1051914 () Bool)

(assert (=> b!1534831 (=> (not res!1051914) (not e!854612))))

(assert (=> b!1534831 (= res!1051914 (validKeyInArray!0 (select (arr!49198 a!2792) j!64)))))

(declare-fun b!1534832 () Bool)

(assert (=> b!1534832 (= e!854614 false)))

(declare-fun lt!663937 () SeekEntryResult!13330)

(assert (=> b!1534832 (= lt!663937 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663936 vacantIndex!5 (select (arr!49198 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130866 res!1051912) b!1534825))

(assert (= (and b!1534825 res!1051909) b!1534827))

(assert (= (and b!1534827 res!1051918) b!1534831))

(assert (= (and b!1534831 res!1051914) b!1534828))

(assert (= (and b!1534828 res!1051911) b!1534829))

(assert (= (and b!1534829 res!1051915) b!1534823))

(assert (= (and b!1534823 res!1051910) b!1534830))

(assert (= (and b!1534830 res!1051916) b!1534826))

(assert (= (and b!1534826 res!1051917) b!1534824))

(assert (= (and b!1534824 res!1051913) b!1534832))

(declare-fun m!1417423 () Bool)

(assert (=> b!1534832 m!1417423))

(assert (=> b!1534832 m!1417423))

(declare-fun m!1417425 () Bool)

(assert (=> b!1534832 m!1417425))

(declare-fun m!1417427 () Bool)

(assert (=> b!1534828 m!1417427))

(declare-fun m!1417429 () Bool)

(assert (=> b!1534826 m!1417429))

(assert (=> b!1534826 m!1417423))

(declare-fun m!1417431 () Bool)

(assert (=> b!1534827 m!1417431))

(assert (=> b!1534827 m!1417431))

(declare-fun m!1417433 () Bool)

(assert (=> b!1534827 m!1417433))

(declare-fun m!1417435 () Bool)

(assert (=> b!1534829 m!1417435))

(assert (=> b!1534830 m!1417423))

(assert (=> b!1534830 m!1417423))

(declare-fun m!1417437 () Bool)

(assert (=> b!1534830 m!1417437))

(declare-fun m!1417439 () Bool)

(assert (=> b!1534823 m!1417439))

(declare-fun m!1417441 () Bool)

(assert (=> b!1534824 m!1417441))

(assert (=> b!1534831 m!1417423))

(assert (=> b!1534831 m!1417423))

(declare-fun m!1417443 () Bool)

(assert (=> b!1534831 m!1417443))

(declare-fun m!1417445 () Bool)

(assert (=> start!130866 m!1417445))

(declare-fun m!1417447 () Bool)

(assert (=> start!130866 m!1417447))

(push 1)

(assert (not b!1534831))

(assert (not b!1534829))

(assert (not b!1534832))

(assert (not start!130866))

(assert (not b!1534827))

(assert (not b!1534824))

(assert (not b!1534830))

(assert (not b!1534828))

(check-sat)

