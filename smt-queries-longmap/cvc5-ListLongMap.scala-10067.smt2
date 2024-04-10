; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118536 () Bool)

(assert start!118536)

(declare-fun b!1385835 () Bool)

(declare-fun e!785174 () Bool)

(assert (=> b!1385835 (= e!785174 false)))

(declare-fun lt!609327 () Bool)

(declare-datatypes ((array!94812 0))(
  ( (array!94813 (arr!45782 (Array (_ BitVec 32) (_ BitVec 64))) (size!46332 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94812)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94812 (_ BitVec 32)) Bool)

(assert (=> b!1385835 (= lt!609327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385834 () Bool)

(declare-fun res!927083 () Bool)

(assert (=> b!1385834 (=> (not res!927083) (not e!785174))))

(declare-datatypes ((List!32310 0))(
  ( (Nil!32307) (Cons!32306 (h!33515 (_ BitVec 64)) (t!47004 List!32310)) )
))
(declare-fun arrayNoDuplicates!0 (array!94812 (_ BitVec 32) List!32310) Bool)

(assert (=> b!1385834 (= res!927083 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32307))))

(declare-fun res!927085 () Bool)

(assert (=> start!118536 (=> (not res!927085) (not e!785174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118536 (= res!927085 (validMask!0 mask!2987))))

(assert (=> start!118536 e!785174))

(assert (=> start!118536 true))

(declare-fun array_inv!34810 (array!94812) Bool)

(assert (=> start!118536 (array_inv!34810 a!2938)))

(declare-fun b!1385832 () Bool)

(declare-fun res!927084 () Bool)

(assert (=> b!1385832 (=> (not res!927084) (not e!785174))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385832 (= res!927084 (and (= (size!46332 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46332 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46332 a!2938))))))

(declare-fun b!1385833 () Bool)

(declare-fun res!927082 () Bool)

(assert (=> b!1385833 (=> (not res!927082) (not e!785174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385833 (= res!927082 (validKeyInArray!0 (select (arr!45782 a!2938) i!1065)))))

(assert (= (and start!118536 res!927085) b!1385832))

(assert (= (and b!1385832 res!927084) b!1385833))

(assert (= (and b!1385833 res!927082) b!1385834))

(assert (= (and b!1385834 res!927083) b!1385835))

(declare-fun m!1271109 () Bool)

(assert (=> b!1385835 m!1271109))

(declare-fun m!1271111 () Bool)

(assert (=> b!1385834 m!1271111))

(declare-fun m!1271113 () Bool)

(assert (=> start!118536 m!1271113))

(declare-fun m!1271115 () Bool)

(assert (=> start!118536 m!1271115))

(declare-fun m!1271117 () Bool)

(assert (=> b!1385833 m!1271117))

(assert (=> b!1385833 m!1271117))

(declare-fun m!1271119 () Bool)

(assert (=> b!1385833 m!1271119))

(push 1)

(assert (not b!1385833))

(assert (not b!1385834))

(assert (not start!118536))

(assert (not b!1385835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

