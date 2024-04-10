; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131180 () Bool)

(assert start!131180)

(declare-fun res!1055912 () Bool)

(declare-fun e!856105 () Bool)

(assert (=> start!131180 (=> (not res!1055912) (not e!856105))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131180 (= res!1055912 (validMask!0 mask!2480))))

(assert (=> start!131180 e!856105))

(assert (=> start!131180 true))

(declare-datatypes ((array!102245 0))(
  ( (array!102246 (arr!49337 (Array (_ BitVec 32) (_ BitVec 64))) (size!49887 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102245)

(declare-fun array_inv!38365 (array!102245) Bool)

(assert (=> start!131180 (array_inv!38365 a!2792)))

(declare-fun b!1538928 () Bool)

(declare-fun res!1055906 () Bool)

(assert (=> b!1538928 (=> (not res!1055906) (not e!856105))))

(declare-datatypes ((List!35811 0))(
  ( (Nil!35808) (Cons!35807 (h!37252 (_ BitVec 64)) (t!50505 List!35811)) )
))
(declare-fun arrayNoDuplicates!0 (array!102245 (_ BitVec 32) List!35811) Bool)

(assert (=> b!1538928 (= res!1055906 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35808))))

(declare-fun b!1538929 () Bool)

(declare-fun res!1055907 () Bool)

(assert (=> b!1538929 (=> (not res!1055907) (not e!856105))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538929 (= res!1055907 (validKeyInArray!0 (select (arr!49337 a!2792) i!951)))))

(declare-fun b!1538930 () Bool)

(declare-fun res!1055913 () Bool)

(assert (=> b!1538930 (=> (not res!1055913) (not e!856105))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538930 (= res!1055913 (not (= (select (arr!49337 a!2792) index!463) (select (arr!49337 a!2792) j!64))))))

(declare-fun b!1538931 () Bool)

(declare-fun res!1055911 () Bool)

(assert (=> b!1538931 (=> (not res!1055911) (not e!856105))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538931 (= res!1055911 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49887 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49887 a!2792)) (= (select (arr!49337 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538932 () Bool)

(declare-fun res!1055908 () Bool)

(assert (=> b!1538932 (=> (not res!1055908) (not e!856105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102245 (_ BitVec 32)) Bool)

(assert (=> b!1538932 (= res!1055908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538933 () Bool)

(declare-fun res!1055914 () Bool)

(assert (=> b!1538933 (=> (not res!1055914) (not e!856105))))

(declare-datatypes ((SeekEntryResult!13463 0))(
  ( (MissingZero!13463 (index!56247 (_ BitVec 32))) (Found!13463 (index!56248 (_ BitVec 32))) (Intermediate!13463 (undefined!14275 Bool) (index!56249 (_ BitVec 32)) (x!137980 (_ BitVec 32))) (Undefined!13463) (MissingVacant!13463 (index!56250 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102245 (_ BitVec 32)) SeekEntryResult!13463)

(assert (=> b!1538933 (= res!1055914 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49337 a!2792) j!64) a!2792 mask!2480) (Found!13463 j!64)))))

(declare-fun b!1538934 () Bool)

(assert (=> b!1538934 (= e!856105 false)))

(declare-fun lt!664954 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538934 (= lt!664954 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538935 () Bool)

(declare-fun res!1055909 () Bool)

(assert (=> b!1538935 (=> (not res!1055909) (not e!856105))))

(assert (=> b!1538935 (= res!1055909 (and (= (size!49887 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49887 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49887 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538936 () Bool)

(declare-fun res!1055910 () Bool)

(assert (=> b!1538936 (=> (not res!1055910) (not e!856105))))

(assert (=> b!1538936 (= res!1055910 (validKeyInArray!0 (select (arr!49337 a!2792) j!64)))))

(assert (= (and start!131180 res!1055912) b!1538935))

(assert (= (and b!1538935 res!1055909) b!1538929))

(assert (= (and b!1538929 res!1055907) b!1538936))

(assert (= (and b!1538936 res!1055910) b!1538932))

(assert (= (and b!1538932 res!1055908) b!1538928))

(assert (= (and b!1538928 res!1055906) b!1538931))

(assert (= (and b!1538931 res!1055911) b!1538933))

(assert (= (and b!1538933 res!1055914) b!1538930))

(assert (= (and b!1538930 res!1055913) b!1538934))

(declare-fun m!1421307 () Bool)

(assert (=> b!1538931 m!1421307))

(declare-fun m!1421309 () Bool)

(assert (=> b!1538936 m!1421309))

(assert (=> b!1538936 m!1421309))

(declare-fun m!1421311 () Bool)

(assert (=> b!1538936 m!1421311))

(declare-fun m!1421313 () Bool)

(assert (=> b!1538928 m!1421313))

(declare-fun m!1421315 () Bool)

(assert (=> start!131180 m!1421315))

(declare-fun m!1421317 () Bool)

(assert (=> start!131180 m!1421317))

(declare-fun m!1421319 () Bool)

(assert (=> b!1538929 m!1421319))

(assert (=> b!1538929 m!1421319))

(declare-fun m!1421321 () Bool)

(assert (=> b!1538929 m!1421321))

(declare-fun m!1421323 () Bool)

(assert (=> b!1538932 m!1421323))

(assert (=> b!1538933 m!1421309))

(assert (=> b!1538933 m!1421309))

(declare-fun m!1421325 () Bool)

(assert (=> b!1538933 m!1421325))

(declare-fun m!1421327 () Bool)

(assert (=> b!1538930 m!1421327))

(assert (=> b!1538930 m!1421309))

(declare-fun m!1421329 () Bool)

(assert (=> b!1538934 m!1421329))

(push 1)

(assert (not b!1538932))

(assert (not start!131180))

(assert (not b!1538936))

(assert (not b!1538934))

(assert (not b!1538928))

(assert (not b!1538933))

(assert (not b!1538929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

