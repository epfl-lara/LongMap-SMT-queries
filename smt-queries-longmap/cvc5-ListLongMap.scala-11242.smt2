; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131084 () Bool)

(assert start!131084)

(declare-fun b!1537988 () Bool)

(declare-fun res!1055074 () Bool)

(declare-fun e!855816 () Bool)

(assert (=> b!1537988 (=> (not res!1055074) (not e!855816))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102182 0))(
  ( (array!102183 (arr!49307 (Array (_ BitVec 32) (_ BitVec 64))) (size!49857 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102182)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537988 (= res!1055074 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49857 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49857 a!2792)) (= (select (arr!49307 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537989 () Bool)

(assert (=> b!1537989 (= e!855816 false)))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13433 0))(
  ( (MissingZero!13433 (index!56127 (_ BitVec 32))) (Found!13433 (index!56128 (_ BitVec 32))) (Intermediate!13433 (undefined!14245 Bool) (index!56129 (_ BitVec 32)) (x!137867 (_ BitVec 32))) (Undefined!13433) (MissingVacant!13433 (index!56130 (_ BitVec 32))) )
))
(declare-fun lt!664813 () SeekEntryResult!13433)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102182 (_ BitVec 32)) SeekEntryResult!13433)

(assert (=> b!1537989 (= lt!664813 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49307 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537991 () Bool)

(declare-fun res!1055076 () Bool)

(assert (=> b!1537991 (=> (not res!1055076) (not e!855816))))

(declare-datatypes ((List!35781 0))(
  ( (Nil!35778) (Cons!35777 (h!37222 (_ BitVec 64)) (t!50475 List!35781)) )
))
(declare-fun arrayNoDuplicates!0 (array!102182 (_ BitVec 32) List!35781) Bool)

(assert (=> b!1537991 (= res!1055076 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35778))))

(declare-fun b!1537992 () Bool)

(declare-fun res!1055075 () Bool)

(assert (=> b!1537992 (=> (not res!1055075) (not e!855816))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537992 (= res!1055075 (and (= (size!49857 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49857 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49857 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537993 () Bool)

(declare-fun res!1055077 () Bool)

(assert (=> b!1537993 (=> (not res!1055077) (not e!855816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537993 (= res!1055077 (validKeyInArray!0 (select (arr!49307 a!2792) i!951)))))

(declare-fun b!1537994 () Bool)

(declare-fun res!1055079 () Bool)

(assert (=> b!1537994 (=> (not res!1055079) (not e!855816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102182 (_ BitVec 32)) Bool)

(assert (=> b!1537994 (= res!1055079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1055078 () Bool)

(assert (=> start!131084 (=> (not res!1055078) (not e!855816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131084 (= res!1055078 (validMask!0 mask!2480))))

(assert (=> start!131084 e!855816))

(assert (=> start!131084 true))

(declare-fun array_inv!38335 (array!102182) Bool)

(assert (=> start!131084 (array_inv!38335 a!2792)))

(declare-fun b!1537990 () Bool)

(declare-fun res!1055080 () Bool)

(assert (=> b!1537990 (=> (not res!1055080) (not e!855816))))

(assert (=> b!1537990 (= res!1055080 (validKeyInArray!0 (select (arr!49307 a!2792) j!64)))))

(assert (= (and start!131084 res!1055078) b!1537992))

(assert (= (and b!1537992 res!1055075) b!1537993))

(assert (= (and b!1537993 res!1055077) b!1537990))

(assert (= (and b!1537990 res!1055080) b!1537994))

(assert (= (and b!1537994 res!1055079) b!1537991))

(assert (= (and b!1537991 res!1055076) b!1537988))

(assert (= (and b!1537988 res!1055074) b!1537989))

(declare-fun m!1420491 () Bool)

(assert (=> b!1537994 m!1420491))

(declare-fun m!1420493 () Bool)

(assert (=> b!1537989 m!1420493))

(assert (=> b!1537989 m!1420493))

(declare-fun m!1420495 () Bool)

(assert (=> b!1537989 m!1420495))

(assert (=> b!1537990 m!1420493))

(assert (=> b!1537990 m!1420493))

(declare-fun m!1420497 () Bool)

(assert (=> b!1537990 m!1420497))

(declare-fun m!1420499 () Bool)

(assert (=> b!1537988 m!1420499))

(declare-fun m!1420501 () Bool)

(assert (=> b!1537993 m!1420501))

(assert (=> b!1537993 m!1420501))

(declare-fun m!1420503 () Bool)

(assert (=> b!1537993 m!1420503))

(declare-fun m!1420505 () Bool)

(assert (=> start!131084 m!1420505))

(declare-fun m!1420507 () Bool)

(assert (=> start!131084 m!1420507))

(declare-fun m!1420509 () Bool)

(assert (=> b!1537991 m!1420509))

(push 1)

(assert (not b!1537994))

(assert (not b!1537990))

(assert (not b!1537989))

(assert (not b!1537993))

(assert (not b!1537991))

(assert (not start!131084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

