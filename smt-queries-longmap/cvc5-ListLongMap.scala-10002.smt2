; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118050 () Bool)

(assert start!118050)

(declare-fun res!923942 () Bool)

(declare-fun e!783510 () Bool)

(assert (=> start!118050 (=> (not res!923942) (not e!783510))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118050 (= res!923942 (validMask!0 mask!3034))))

(assert (=> start!118050 e!783510))

(assert (=> start!118050 true))

(declare-datatypes ((array!94366 0))(
  ( (array!94367 (arr!45564 (Array (_ BitVec 32) (_ BitVec 64))) (size!46116 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94366)

(declare-fun array_inv!34797 (array!94366) Bool)

(assert (=> start!118050 (array_inv!34797 a!2971)))

(declare-fun b!1382308 () Bool)

(declare-fun res!923943 () Bool)

(assert (=> b!1382308 (=> (not res!923943) (not e!783510))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382308 (= res!923943 (validKeyInArray!0 (select (arr!45564 a!2971) i!1094)))))

(declare-fun b!1382307 () Bool)

(declare-fun res!923945 () Bool)

(assert (=> b!1382307 (=> (not res!923945) (not e!783510))))

(assert (=> b!1382307 (= res!923945 (and (= (size!46116 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46116 a!2971))))))

(declare-fun b!1382310 () Bool)

(assert (=> b!1382310 (= e!783510 false)))

(declare-fun lt!608228 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94366 (_ BitVec 32)) Bool)

(assert (=> b!1382310 (= lt!608228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382309 () Bool)

(declare-fun res!923944 () Bool)

(assert (=> b!1382309 (=> (not res!923944) (not e!783510))))

(declare-datatypes ((List!32176 0))(
  ( (Nil!32173) (Cons!32172 (h!33381 (_ BitVec 64)) (t!46862 List!32176)) )
))
(declare-fun arrayNoDuplicates!0 (array!94366 (_ BitVec 32) List!32176) Bool)

(assert (=> b!1382309 (= res!923944 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32173))))

(assert (= (and start!118050 res!923942) b!1382307))

(assert (= (and b!1382307 res!923945) b!1382308))

(assert (= (and b!1382308 res!923943) b!1382309))

(assert (= (and b!1382309 res!923944) b!1382310))

(declare-fun m!1267011 () Bool)

(assert (=> start!118050 m!1267011))

(declare-fun m!1267013 () Bool)

(assert (=> start!118050 m!1267013))

(declare-fun m!1267015 () Bool)

(assert (=> b!1382308 m!1267015))

(assert (=> b!1382308 m!1267015))

(declare-fun m!1267017 () Bool)

(assert (=> b!1382308 m!1267017))

(declare-fun m!1267019 () Bool)

(assert (=> b!1382310 m!1267019))

(declare-fun m!1267021 () Bool)

(assert (=> b!1382309 m!1267021))

(push 1)

(assert (not b!1382308))

(assert (not start!118050))

(assert (not b!1382309))

(assert (not b!1382310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

