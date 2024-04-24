; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131098 () Bool)

(assert start!131098)

(declare-fun b!1535356 () Bool)

(declare-fun res!1050957 () Bool)

(declare-fun e!855546 () Bool)

(assert (=> b!1535356 (=> (not res!1050957) (not e!855546))))

(declare-datatypes ((array!101933 0))(
  ( (array!101934 (arr!49176 (Array (_ BitVec 32) (_ BitVec 64))) (size!49727 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101933)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101933 (_ BitVec 32)) Bool)

(assert (=> b!1535356 (= res!1050957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535358 () Bool)

(declare-fun res!1050958 () Bool)

(assert (=> b!1535358 (=> (not res!1050958) (not e!855546))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535358 (= res!1050958 (validKeyInArray!0 (select (arr!49176 a!2792) j!64)))))

(declare-fun b!1535359 () Bool)

(assert (=> b!1535359 (= e!855546 false)))

(declare-fun lt!664641 () Bool)

(declare-datatypes ((List!35637 0))(
  ( (Nil!35634) (Cons!35633 (h!37096 (_ BitVec 64)) (t!50323 List!35637)) )
))
(declare-fun arrayNoDuplicates!0 (array!101933 (_ BitVec 32) List!35637) Bool)

(assert (=> b!1535359 (= lt!664641 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35634))))

(declare-fun b!1535360 () Bool)

(declare-fun res!1050956 () Bool)

(assert (=> b!1535360 (=> (not res!1050956) (not e!855546))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535360 (= res!1050956 (validKeyInArray!0 (select (arr!49176 a!2792) i!951)))))

(declare-fun res!1050960 () Bool)

(assert (=> start!131098 (=> (not res!1050960) (not e!855546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131098 (= res!1050960 (validMask!0 mask!2480))))

(assert (=> start!131098 e!855546))

(assert (=> start!131098 true))

(declare-fun array_inv!38457 (array!101933) Bool)

(assert (=> start!131098 (array_inv!38457 a!2792)))

(declare-fun b!1535357 () Bool)

(declare-fun res!1050959 () Bool)

(assert (=> b!1535357 (=> (not res!1050959) (not e!855546))))

(assert (=> b!1535357 (= res!1050959 (and (= (size!49727 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49727 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49727 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131098 res!1050960) b!1535357))

(assert (= (and b!1535357 res!1050959) b!1535360))

(assert (= (and b!1535360 res!1050956) b!1535358))

(assert (= (and b!1535358 res!1050958) b!1535356))

(assert (= (and b!1535356 res!1050957) b!1535359))

(declare-fun m!1417935 () Bool)

(assert (=> b!1535360 m!1417935))

(assert (=> b!1535360 m!1417935))

(declare-fun m!1417937 () Bool)

(assert (=> b!1535360 m!1417937))

(declare-fun m!1417939 () Bool)

(assert (=> start!131098 m!1417939))

(declare-fun m!1417941 () Bool)

(assert (=> start!131098 m!1417941))

(declare-fun m!1417943 () Bool)

(assert (=> b!1535356 m!1417943))

(declare-fun m!1417945 () Bool)

(assert (=> b!1535359 m!1417945))

(declare-fun m!1417947 () Bool)

(assert (=> b!1535358 m!1417947))

(assert (=> b!1535358 m!1417947))

(declare-fun m!1417949 () Bool)

(assert (=> b!1535358 m!1417949))

(push 1)

(assert (not b!1535360))

(assert (not start!131098))

(assert (not b!1535358))

(assert (not b!1535359))

(assert (not b!1535356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

