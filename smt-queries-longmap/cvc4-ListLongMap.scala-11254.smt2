; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131196 () Bool)

(assert start!131196)

(declare-fun b!1539144 () Bool)

(declare-fun res!1056128 () Bool)

(declare-fun e!856153 () Bool)

(assert (=> b!1539144 (=> (not res!1056128) (not e!856153))))

(declare-datatypes ((array!102261 0))(
  ( (array!102262 (arr!49345 (Array (_ BitVec 32) (_ BitVec 64))) (size!49895 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102261)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539144 (= res!1056128 (validKeyInArray!0 (select (arr!49345 a!2792) j!64)))))

(declare-fun res!1056127 () Bool)

(assert (=> start!131196 (=> (not res!1056127) (not e!856153))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131196 (= res!1056127 (validMask!0 mask!2480))))

(assert (=> start!131196 e!856153))

(assert (=> start!131196 true))

(declare-fun array_inv!38373 (array!102261) Bool)

(assert (=> start!131196 (array_inv!38373 a!2792)))

(declare-fun b!1539145 () Bool)

(declare-fun res!1056126 () Bool)

(assert (=> b!1539145 (=> (not res!1056126) (not e!856153))))

(declare-datatypes ((List!35819 0))(
  ( (Nil!35816) (Cons!35815 (h!37260 (_ BitVec 64)) (t!50513 List!35819)) )
))
(declare-fun arrayNoDuplicates!0 (array!102261 (_ BitVec 32) List!35819) Bool)

(assert (=> b!1539145 (= res!1056126 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35816))))

(declare-fun b!1539146 () Bool)

(declare-fun res!1056123 () Bool)

(assert (=> b!1539146 (=> (not res!1056123) (not e!856153))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539146 (= res!1056123 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49895 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49895 a!2792)) (= (select (arr!49345 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539147 () Bool)

(declare-fun res!1056125 () Bool)

(assert (=> b!1539147 (=> (not res!1056125) (not e!856153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102261 (_ BitVec 32)) Bool)

(assert (=> b!1539147 (= res!1056125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539148 () Bool)

(declare-fun res!1056129 () Bool)

(assert (=> b!1539148 (=> (not res!1056129) (not e!856153))))

(assert (=> b!1539148 (= res!1056129 (not (= (select (arr!49345 a!2792) index!463) (select (arr!49345 a!2792) j!64))))))

(declare-fun b!1539149 () Bool)

(declare-fun res!1056122 () Bool)

(assert (=> b!1539149 (=> (not res!1056122) (not e!856153))))

(declare-datatypes ((SeekEntryResult!13471 0))(
  ( (MissingZero!13471 (index!56279 (_ BitVec 32))) (Found!13471 (index!56280 (_ BitVec 32))) (Intermediate!13471 (undefined!14283 Bool) (index!56281 (_ BitVec 32)) (x!138004 (_ BitVec 32))) (Undefined!13471) (MissingVacant!13471 (index!56282 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102261 (_ BitVec 32)) SeekEntryResult!13471)

(assert (=> b!1539149 (= res!1056122 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49345 a!2792) j!64) a!2792 mask!2480) (Found!13471 j!64)))))

(declare-fun b!1539150 () Bool)

(assert (=> b!1539150 (= e!856153 false)))

(declare-fun lt!664978 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539150 (= lt!664978 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539151 () Bool)

(declare-fun res!1056130 () Bool)

(assert (=> b!1539151 (=> (not res!1056130) (not e!856153))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539151 (= res!1056130 (validKeyInArray!0 (select (arr!49345 a!2792) i!951)))))

(declare-fun b!1539152 () Bool)

(declare-fun res!1056124 () Bool)

(assert (=> b!1539152 (=> (not res!1056124) (not e!856153))))

(assert (=> b!1539152 (= res!1056124 (and (= (size!49895 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49895 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49895 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131196 res!1056127) b!1539152))

(assert (= (and b!1539152 res!1056124) b!1539151))

(assert (= (and b!1539151 res!1056130) b!1539144))

(assert (= (and b!1539144 res!1056128) b!1539147))

(assert (= (and b!1539147 res!1056125) b!1539145))

(assert (= (and b!1539145 res!1056126) b!1539146))

(assert (= (and b!1539146 res!1056123) b!1539149))

(assert (= (and b!1539149 res!1056122) b!1539148))

(assert (= (and b!1539148 res!1056129) b!1539150))

(declare-fun m!1421499 () Bool)

(assert (=> b!1539148 m!1421499))

(declare-fun m!1421501 () Bool)

(assert (=> b!1539148 m!1421501))

(declare-fun m!1421503 () Bool)

(assert (=> b!1539151 m!1421503))

(assert (=> b!1539151 m!1421503))

(declare-fun m!1421505 () Bool)

(assert (=> b!1539151 m!1421505))

(declare-fun m!1421507 () Bool)

(assert (=> start!131196 m!1421507))

(declare-fun m!1421509 () Bool)

(assert (=> start!131196 m!1421509))

(assert (=> b!1539144 m!1421501))

(assert (=> b!1539144 m!1421501))

(declare-fun m!1421511 () Bool)

(assert (=> b!1539144 m!1421511))

(declare-fun m!1421513 () Bool)

(assert (=> b!1539150 m!1421513))

(declare-fun m!1421515 () Bool)

(assert (=> b!1539147 m!1421515))

(declare-fun m!1421517 () Bool)

(assert (=> b!1539145 m!1421517))

(assert (=> b!1539149 m!1421501))

(assert (=> b!1539149 m!1421501))

(declare-fun m!1421519 () Bool)

(assert (=> b!1539149 m!1421519))

(declare-fun m!1421521 () Bool)

(assert (=> b!1539146 m!1421521))

(push 1)

(assert (not b!1539144))

(assert (not b!1539149))

(assert (not start!131196))

(assert (not b!1539145))

(assert (not b!1539151))

(assert (not b!1539150))

(assert (not b!1539147))

(check-sat)

(pop 1)

