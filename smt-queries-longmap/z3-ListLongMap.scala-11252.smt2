; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131182 () Bool)

(assert start!131182)

(declare-fun b!1538955 () Bool)

(declare-fun res!1055940 () Bool)

(declare-fun e!856111 () Bool)

(assert (=> b!1538955 (=> (not res!1055940) (not e!856111))))

(declare-datatypes ((array!102247 0))(
  ( (array!102248 (arr!49338 (Array (_ BitVec 32) (_ BitVec 64))) (size!49888 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102247)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538955 (= res!1055940 (and (= (size!49888 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49888 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49888 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538956 () Bool)

(assert (=> b!1538956 (= e!856111 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664957 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538956 (= lt!664957 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538957 () Bool)

(declare-fun res!1055936 () Bool)

(assert (=> b!1538957 (=> (not res!1055936) (not e!856111))))

(assert (=> b!1538957 (= res!1055936 (not (= (select (arr!49338 a!2792) index!463) (select (arr!49338 a!2792) j!64))))))

(declare-fun b!1538958 () Bool)

(declare-fun res!1055933 () Bool)

(assert (=> b!1538958 (=> (not res!1055933) (not e!856111))))

(declare-datatypes ((List!35812 0))(
  ( (Nil!35809) (Cons!35808 (h!37253 (_ BitVec 64)) (t!50506 List!35812)) )
))
(declare-fun arrayNoDuplicates!0 (array!102247 (_ BitVec 32) List!35812) Bool)

(assert (=> b!1538958 (= res!1055933 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35809))))

(declare-fun b!1538959 () Bool)

(declare-fun res!1055935 () Bool)

(assert (=> b!1538959 (=> (not res!1055935) (not e!856111))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13464 0))(
  ( (MissingZero!13464 (index!56251 (_ BitVec 32))) (Found!13464 (index!56252 (_ BitVec 32))) (Intermediate!13464 (undefined!14276 Bool) (index!56253 (_ BitVec 32)) (x!137981 (_ BitVec 32))) (Undefined!13464) (MissingVacant!13464 (index!56254 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102247 (_ BitVec 32)) SeekEntryResult!13464)

(assert (=> b!1538959 (= res!1055935 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49338 a!2792) j!64) a!2792 mask!2480) (Found!13464 j!64)))))

(declare-fun b!1538960 () Bool)

(declare-fun res!1055937 () Bool)

(assert (=> b!1538960 (=> (not res!1055937) (not e!856111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102247 (_ BitVec 32)) Bool)

(assert (=> b!1538960 (= res!1055937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538962 () Bool)

(declare-fun res!1055938 () Bool)

(assert (=> b!1538962 (=> (not res!1055938) (not e!856111))))

(assert (=> b!1538962 (= res!1055938 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49888 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49888 a!2792)) (= (select (arr!49338 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538963 () Bool)

(declare-fun res!1055941 () Bool)

(assert (=> b!1538963 (=> (not res!1055941) (not e!856111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538963 (= res!1055941 (validKeyInArray!0 (select (arr!49338 a!2792) i!951)))))

(declare-fun b!1538961 () Bool)

(declare-fun res!1055939 () Bool)

(assert (=> b!1538961 (=> (not res!1055939) (not e!856111))))

(assert (=> b!1538961 (= res!1055939 (validKeyInArray!0 (select (arr!49338 a!2792) j!64)))))

(declare-fun res!1055934 () Bool)

(assert (=> start!131182 (=> (not res!1055934) (not e!856111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131182 (= res!1055934 (validMask!0 mask!2480))))

(assert (=> start!131182 e!856111))

(assert (=> start!131182 true))

(declare-fun array_inv!38366 (array!102247) Bool)

(assert (=> start!131182 (array_inv!38366 a!2792)))

(assert (= (and start!131182 res!1055934) b!1538955))

(assert (= (and b!1538955 res!1055940) b!1538963))

(assert (= (and b!1538963 res!1055941) b!1538961))

(assert (= (and b!1538961 res!1055939) b!1538960))

(assert (= (and b!1538960 res!1055937) b!1538958))

(assert (= (and b!1538958 res!1055933) b!1538962))

(assert (= (and b!1538962 res!1055938) b!1538959))

(assert (= (and b!1538959 res!1055935) b!1538957))

(assert (= (and b!1538957 res!1055936) b!1538956))

(declare-fun m!1421331 () Bool)

(assert (=> b!1538961 m!1421331))

(assert (=> b!1538961 m!1421331))

(declare-fun m!1421333 () Bool)

(assert (=> b!1538961 m!1421333))

(declare-fun m!1421335 () Bool)

(assert (=> b!1538963 m!1421335))

(assert (=> b!1538963 m!1421335))

(declare-fun m!1421337 () Bool)

(assert (=> b!1538963 m!1421337))

(declare-fun m!1421339 () Bool)

(assert (=> start!131182 m!1421339))

(declare-fun m!1421341 () Bool)

(assert (=> start!131182 m!1421341))

(assert (=> b!1538959 m!1421331))

(assert (=> b!1538959 m!1421331))

(declare-fun m!1421343 () Bool)

(assert (=> b!1538959 m!1421343))

(declare-fun m!1421345 () Bool)

(assert (=> b!1538958 m!1421345))

(declare-fun m!1421347 () Bool)

(assert (=> b!1538960 m!1421347))

(declare-fun m!1421349 () Bool)

(assert (=> b!1538957 m!1421349))

(assert (=> b!1538957 m!1421331))

(declare-fun m!1421351 () Bool)

(assert (=> b!1538956 m!1421351))

(declare-fun m!1421353 () Bool)

(assert (=> b!1538962 m!1421353))

(check-sat (not b!1538963) (not b!1538959) (not b!1538956) (not b!1538958) (not b!1538960) (not start!131182) (not b!1538961))
