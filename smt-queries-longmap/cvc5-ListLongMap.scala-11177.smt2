; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130694 () Bool)

(assert start!130694)

(declare-fun b!1532883 () Bool)

(declare-fun res!1049974 () Bool)

(declare-fun e!854062 () Bool)

(assert (=> b!1532883 (=> (not res!1049974) (not e!854062))))

(declare-datatypes ((array!101792 0))(
  ( (array!101793 (arr!49112 (Array (_ BitVec 32) (_ BitVec 64))) (size!49662 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101792)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532883 (= res!1049974 (and (= (size!49662 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49662 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49662 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532885 () Bool)

(declare-fun res!1049973 () Bool)

(assert (=> b!1532885 (=> (not res!1049973) (not e!854062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101792 (_ BitVec 32)) Bool)

(assert (=> b!1532885 (= res!1049973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532886 () Bool)

(declare-fun res!1049972 () Bool)

(assert (=> b!1532886 (=> (not res!1049972) (not e!854062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532886 (= res!1049972 (validKeyInArray!0 (select (arr!49112 a!2792) i!951)))))

(declare-fun b!1532887 () Bool)

(declare-fun res!1049970 () Bool)

(assert (=> b!1532887 (=> (not res!1049970) (not e!854062))))

(declare-datatypes ((List!35586 0))(
  ( (Nil!35583) (Cons!35582 (h!37027 (_ BitVec 64)) (t!50280 List!35586)) )
))
(declare-fun arrayNoDuplicates!0 (array!101792 (_ BitVec 32) List!35586) Bool)

(assert (=> b!1532887 (= res!1049970 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35583))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun b!1532888 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1532888 (= e!854062 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49662 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49662 a!2792)) (= (select (arr!49112 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1532884 () Bool)

(declare-fun res!1049969 () Bool)

(assert (=> b!1532884 (=> (not res!1049969) (not e!854062))))

(assert (=> b!1532884 (= res!1049969 (validKeyInArray!0 (select (arr!49112 a!2792) j!64)))))

(declare-fun res!1049971 () Bool)

(assert (=> start!130694 (=> (not res!1049971) (not e!854062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130694 (= res!1049971 (validMask!0 mask!2480))))

(assert (=> start!130694 e!854062))

(assert (=> start!130694 true))

(declare-fun array_inv!38140 (array!101792) Bool)

(assert (=> start!130694 (array_inv!38140 a!2792)))

(assert (= (and start!130694 res!1049971) b!1532883))

(assert (= (and b!1532883 res!1049974) b!1532886))

(assert (= (and b!1532886 res!1049972) b!1532884))

(assert (= (and b!1532884 res!1049969) b!1532885))

(assert (= (and b!1532885 res!1049973) b!1532887))

(assert (= (and b!1532887 res!1049970) b!1532888))

(declare-fun m!1415589 () Bool)

(assert (=> start!130694 m!1415589))

(declare-fun m!1415591 () Bool)

(assert (=> start!130694 m!1415591))

(declare-fun m!1415593 () Bool)

(assert (=> b!1532884 m!1415593))

(assert (=> b!1532884 m!1415593))

(declare-fun m!1415595 () Bool)

(assert (=> b!1532884 m!1415595))

(declare-fun m!1415597 () Bool)

(assert (=> b!1532885 m!1415597))

(declare-fun m!1415599 () Bool)

(assert (=> b!1532887 m!1415599))

(declare-fun m!1415601 () Bool)

(assert (=> b!1532886 m!1415601))

(assert (=> b!1532886 m!1415601))

(declare-fun m!1415603 () Bool)

(assert (=> b!1532886 m!1415603))

(declare-fun m!1415605 () Bool)

(assert (=> b!1532888 m!1415605))

(push 1)

(assert (not start!130694))

(assert (not b!1532885))

(assert (not b!1532884))

(assert (not b!1532887))

(assert (not b!1532886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

