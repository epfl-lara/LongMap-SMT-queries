; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131162 () Bool)

(assert start!131162)

(declare-fun b!1538685 () Bool)

(declare-fun res!1055671 () Bool)

(declare-fun e!856050 () Bool)

(assert (=> b!1538685 (=> (not res!1055671) (not e!856050))))

(declare-datatypes ((array!102227 0))(
  ( (array!102228 (arr!49328 (Array (_ BitVec 32) (_ BitVec 64))) (size!49878 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102227)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538685 (= res!1055671 (validKeyInArray!0 (select (arr!49328 a!2792) i!951)))))

(declare-fun b!1538686 () Bool)

(declare-fun res!1055669 () Bool)

(assert (=> b!1538686 (=> (not res!1055669) (not e!856050))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538686 (= res!1055669 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49878 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49878 a!2792)) (= (select (arr!49328 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538687 () Bool)

(declare-fun res!1055665 () Bool)

(assert (=> b!1538687 (=> (not res!1055665) (not e!856050))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538687 (= res!1055665 (validKeyInArray!0 (select (arr!49328 a!2792) j!64)))))

(declare-fun b!1538688 () Bool)

(declare-fun res!1055664 () Bool)

(assert (=> b!1538688 (=> (not res!1055664) (not e!856050))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102227 (_ BitVec 32)) Bool)

(assert (=> b!1538688 (= res!1055664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538689 () Bool)

(declare-fun res!1055670 () Bool)

(assert (=> b!1538689 (=> (not res!1055670) (not e!856050))))

(declare-datatypes ((SeekEntryResult!13454 0))(
  ( (MissingZero!13454 (index!56211 (_ BitVec 32))) (Found!13454 (index!56212 (_ BitVec 32))) (Intermediate!13454 (undefined!14266 Bool) (index!56213 (_ BitVec 32)) (x!137947 (_ BitVec 32))) (Undefined!13454) (MissingVacant!13454 (index!56214 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102227 (_ BitVec 32)) SeekEntryResult!13454)

(assert (=> b!1538689 (= res!1055670 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49328 a!2792) j!64) a!2792 mask!2480) (Found!13454 j!64)))))

(declare-fun b!1538690 () Bool)

(declare-fun res!1055663 () Bool)

(assert (=> b!1538690 (=> (not res!1055663) (not e!856050))))

(assert (=> b!1538690 (= res!1055663 (not (= (select (arr!49328 a!2792) index!463) (select (arr!49328 a!2792) j!64))))))

(declare-fun res!1055667 () Bool)

(assert (=> start!131162 (=> (not res!1055667) (not e!856050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131162 (= res!1055667 (validMask!0 mask!2480))))

(assert (=> start!131162 e!856050))

(assert (=> start!131162 true))

(declare-fun array_inv!38356 (array!102227) Bool)

(assert (=> start!131162 (array_inv!38356 a!2792)))

(declare-fun b!1538691 () Bool)

(assert (=> b!1538691 (= e!856050 false)))

(declare-fun lt!664927 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538691 (= lt!664927 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538692 () Bool)

(declare-fun res!1055668 () Bool)

(assert (=> b!1538692 (=> (not res!1055668) (not e!856050))))

(assert (=> b!1538692 (= res!1055668 (and (= (size!49878 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49878 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49878 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538693 () Bool)

(declare-fun res!1055666 () Bool)

(assert (=> b!1538693 (=> (not res!1055666) (not e!856050))))

(declare-datatypes ((List!35802 0))(
  ( (Nil!35799) (Cons!35798 (h!37243 (_ BitVec 64)) (t!50496 List!35802)) )
))
(declare-fun arrayNoDuplicates!0 (array!102227 (_ BitVec 32) List!35802) Bool)

(assert (=> b!1538693 (= res!1055666 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35799))))

(assert (= (and start!131162 res!1055667) b!1538692))

(assert (= (and b!1538692 res!1055668) b!1538685))

(assert (= (and b!1538685 res!1055671) b!1538687))

(assert (= (and b!1538687 res!1055665) b!1538688))

(assert (= (and b!1538688 res!1055664) b!1538693))

(assert (= (and b!1538693 res!1055666) b!1538686))

(assert (= (and b!1538686 res!1055669) b!1538689))

(assert (= (and b!1538689 res!1055670) b!1538690))

(assert (= (and b!1538690 res!1055663) b!1538691))

(declare-fun m!1421091 () Bool)

(assert (=> b!1538693 m!1421091))

(declare-fun m!1421093 () Bool)

(assert (=> b!1538687 m!1421093))

(assert (=> b!1538687 m!1421093))

(declare-fun m!1421095 () Bool)

(assert (=> b!1538687 m!1421095))

(declare-fun m!1421097 () Bool)

(assert (=> b!1538691 m!1421097))

(declare-fun m!1421099 () Bool)

(assert (=> b!1538690 m!1421099))

(assert (=> b!1538690 m!1421093))

(declare-fun m!1421101 () Bool)

(assert (=> b!1538688 m!1421101))

(declare-fun m!1421103 () Bool)

(assert (=> b!1538686 m!1421103))

(assert (=> b!1538689 m!1421093))

(assert (=> b!1538689 m!1421093))

(declare-fun m!1421105 () Bool)

(assert (=> b!1538689 m!1421105))

(declare-fun m!1421107 () Bool)

(assert (=> b!1538685 m!1421107))

(assert (=> b!1538685 m!1421107))

(declare-fun m!1421109 () Bool)

(assert (=> b!1538685 m!1421109))

(declare-fun m!1421111 () Bool)

(assert (=> start!131162 m!1421111))

(declare-fun m!1421113 () Bool)

(assert (=> start!131162 m!1421113))

(push 1)

(assert (not b!1538687))

(assert (not b!1538688))

(assert (not b!1538693))

(assert (not b!1538691))

(assert (not start!131162))

(assert (not b!1538689))

(assert (not b!1538685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

