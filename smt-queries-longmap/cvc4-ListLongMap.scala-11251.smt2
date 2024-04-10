; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131178 () Bool)

(assert start!131178)

(declare-fun b!1538901 () Bool)

(declare-fun res!1055879 () Bool)

(declare-fun e!856099 () Bool)

(assert (=> b!1538901 (=> (not res!1055879) (not e!856099))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102243 0))(
  ( (array!102244 (arr!49336 (Array (_ BitVec 32) (_ BitVec 64))) (size!49886 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102243)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13462 0))(
  ( (MissingZero!13462 (index!56243 (_ BitVec 32))) (Found!13462 (index!56244 (_ BitVec 32))) (Intermediate!13462 (undefined!14274 Bool) (index!56245 (_ BitVec 32)) (x!137971 (_ BitVec 32))) (Undefined!13462) (MissingVacant!13462 (index!56246 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102243 (_ BitVec 32)) SeekEntryResult!13462)

(assert (=> b!1538901 (= res!1055879 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49336 a!2792) j!64) a!2792 mask!2480) (Found!13462 j!64)))))

(declare-fun b!1538902 () Bool)

(declare-fun res!1055884 () Bool)

(assert (=> b!1538902 (=> (not res!1055884) (not e!856099))))

(assert (=> b!1538902 (= res!1055884 (not (= (select (arr!49336 a!2792) index!463) (select (arr!49336 a!2792) j!64))))))

(declare-fun b!1538903 () Bool)

(declare-fun res!1055885 () Bool)

(assert (=> b!1538903 (=> (not res!1055885) (not e!856099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538903 (= res!1055885 (validKeyInArray!0 (select (arr!49336 a!2792) j!64)))))

(declare-fun res!1055880 () Bool)

(assert (=> start!131178 (=> (not res!1055880) (not e!856099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131178 (= res!1055880 (validMask!0 mask!2480))))

(assert (=> start!131178 e!856099))

(assert (=> start!131178 true))

(declare-fun array_inv!38364 (array!102243) Bool)

(assert (=> start!131178 (array_inv!38364 a!2792)))

(declare-fun b!1538904 () Bool)

(declare-fun res!1055886 () Bool)

(assert (=> b!1538904 (=> (not res!1055886) (not e!856099))))

(declare-datatypes ((List!35810 0))(
  ( (Nil!35807) (Cons!35806 (h!37251 (_ BitVec 64)) (t!50504 List!35810)) )
))
(declare-fun arrayNoDuplicates!0 (array!102243 (_ BitVec 32) List!35810) Bool)

(assert (=> b!1538904 (= res!1055886 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35807))))

(declare-fun b!1538905 () Bool)

(declare-fun res!1055883 () Bool)

(assert (=> b!1538905 (=> (not res!1055883) (not e!856099))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538905 (= res!1055883 (validKeyInArray!0 (select (arr!49336 a!2792) i!951)))))

(declare-fun b!1538906 () Bool)

(assert (=> b!1538906 (= e!856099 false)))

(declare-fun lt!664951 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538906 (= lt!664951 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538907 () Bool)

(declare-fun res!1055881 () Bool)

(assert (=> b!1538907 (=> (not res!1055881) (not e!856099))))

(assert (=> b!1538907 (= res!1055881 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49886 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49886 a!2792)) (= (select (arr!49336 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538908 () Bool)

(declare-fun res!1055887 () Bool)

(assert (=> b!1538908 (=> (not res!1055887) (not e!856099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102243 (_ BitVec 32)) Bool)

(assert (=> b!1538908 (= res!1055887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538909 () Bool)

(declare-fun res!1055882 () Bool)

(assert (=> b!1538909 (=> (not res!1055882) (not e!856099))))

(assert (=> b!1538909 (= res!1055882 (and (= (size!49886 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49886 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49886 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131178 res!1055880) b!1538909))

(assert (= (and b!1538909 res!1055882) b!1538905))

(assert (= (and b!1538905 res!1055883) b!1538903))

(assert (= (and b!1538903 res!1055885) b!1538908))

(assert (= (and b!1538908 res!1055887) b!1538904))

(assert (= (and b!1538904 res!1055886) b!1538907))

(assert (= (and b!1538907 res!1055881) b!1538901))

(assert (= (and b!1538901 res!1055879) b!1538902))

(assert (= (and b!1538902 res!1055884) b!1538906))

(declare-fun m!1421283 () Bool)

(assert (=> b!1538904 m!1421283))

(declare-fun m!1421285 () Bool)

(assert (=> b!1538901 m!1421285))

(assert (=> b!1538901 m!1421285))

(declare-fun m!1421287 () Bool)

(assert (=> b!1538901 m!1421287))

(declare-fun m!1421289 () Bool)

(assert (=> b!1538902 m!1421289))

(assert (=> b!1538902 m!1421285))

(assert (=> b!1538903 m!1421285))

(assert (=> b!1538903 m!1421285))

(declare-fun m!1421291 () Bool)

(assert (=> b!1538903 m!1421291))

(declare-fun m!1421293 () Bool)

(assert (=> b!1538907 m!1421293))

(declare-fun m!1421295 () Bool)

(assert (=> b!1538908 m!1421295))

(declare-fun m!1421297 () Bool)

(assert (=> start!131178 m!1421297))

(declare-fun m!1421299 () Bool)

(assert (=> start!131178 m!1421299))

(declare-fun m!1421301 () Bool)

(assert (=> b!1538906 m!1421301))

(declare-fun m!1421303 () Bool)

(assert (=> b!1538905 m!1421303))

(assert (=> b!1538905 m!1421303))

(declare-fun m!1421305 () Bool)

(assert (=> b!1538905 m!1421305))

(push 1)

(assert (not b!1538903))

(assert (not b!1538906))

(assert (not b!1538904))

(assert (not b!1538901))

(assert (not b!1538905))

(assert (not b!1538908))

(assert (not start!131178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

