; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127812 () Bool)

(assert start!127812)

(declare-fun b!1502009 () Bool)

(declare-fun res!1023091 () Bool)

(declare-fun e!840138 () Bool)

(assert (=> b!1502009 (=> (not res!1023091) (not e!840138))))

(declare-datatypes ((array!100193 0))(
  ( (array!100194 (arr!48356 (Array (_ BitVec 32) (_ BitVec 64))) (size!48906 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100193)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502009 (= res!1023091 (validKeyInArray!0 (select (arr!48356 a!2850) i!996)))))

(declare-fun b!1502010 () Bool)

(declare-fun res!1023086 () Bool)

(assert (=> b!1502010 (=> (not res!1023086) (not e!840138))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502010 (= res!1023086 (validKeyInArray!0 (select (arr!48356 a!2850) j!87)))))

(declare-fun b!1502011 () Bool)

(assert (=> b!1502011 (= e!840138 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12554 0))(
  ( (MissingZero!12554 (index!52608 (_ BitVec 32))) (Found!12554 (index!52609 (_ BitVec 32))) (Intermediate!12554 (undefined!13366 Bool) (index!52610 (_ BitVec 32)) (x!134300 (_ BitVec 32))) (Undefined!12554) (MissingVacant!12554 (index!52611 (_ BitVec 32))) )
))
(declare-fun lt!653302 () SeekEntryResult!12554)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100193 (_ BitVec 32)) SeekEntryResult!12554)

(assert (=> b!1502011 (= lt!653302 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48356 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502012 () Bool)

(declare-fun res!1023087 () Bool)

(assert (=> b!1502012 (=> (not res!1023087) (not e!840138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100193 (_ BitVec 32)) Bool)

(assert (=> b!1502012 (= res!1023087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502013 () Bool)

(declare-fun res!1023088 () Bool)

(assert (=> b!1502013 (=> (not res!1023088) (not e!840138))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502013 (= res!1023088 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48906 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48906 a!2850)) (= (select (arr!48356 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48356 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48906 a!2850))))))

(declare-fun b!1502014 () Bool)

(declare-fun res!1023085 () Bool)

(assert (=> b!1502014 (=> (not res!1023085) (not e!840138))))

(declare-datatypes ((List!34848 0))(
  ( (Nil!34845) (Cons!34844 (h!36241 (_ BitVec 64)) (t!49542 List!34848)) )
))
(declare-fun arrayNoDuplicates!0 (array!100193 (_ BitVec 32) List!34848) Bool)

(assert (=> b!1502014 (= res!1023085 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34845))))

(declare-fun res!1023090 () Bool)

(assert (=> start!127812 (=> (not res!1023090) (not e!840138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127812 (= res!1023090 (validMask!0 mask!2661))))

(assert (=> start!127812 e!840138))

(assert (=> start!127812 true))

(declare-fun array_inv!37384 (array!100193) Bool)

(assert (=> start!127812 (array_inv!37384 a!2850)))

(declare-fun b!1502015 () Bool)

(declare-fun res!1023089 () Bool)

(assert (=> b!1502015 (=> (not res!1023089) (not e!840138))))

(assert (=> b!1502015 (= res!1023089 (and (= (size!48906 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48906 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48906 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127812 res!1023090) b!1502015))

(assert (= (and b!1502015 res!1023089) b!1502009))

(assert (= (and b!1502009 res!1023091) b!1502010))

(assert (= (and b!1502010 res!1023086) b!1502012))

(assert (= (and b!1502012 res!1023087) b!1502014))

(assert (= (and b!1502014 res!1023085) b!1502013))

(assert (= (and b!1502013 res!1023088) b!1502011))

(declare-fun m!1385299 () Bool)

(assert (=> b!1502011 m!1385299))

(assert (=> b!1502011 m!1385299))

(declare-fun m!1385301 () Bool)

(assert (=> b!1502011 m!1385301))

(declare-fun m!1385303 () Bool)

(assert (=> b!1502009 m!1385303))

(assert (=> b!1502009 m!1385303))

(declare-fun m!1385305 () Bool)

(assert (=> b!1502009 m!1385305))

(declare-fun m!1385307 () Bool)

(assert (=> start!127812 m!1385307))

(declare-fun m!1385309 () Bool)

(assert (=> start!127812 m!1385309))

(declare-fun m!1385311 () Bool)

(assert (=> b!1502012 m!1385311))

(declare-fun m!1385313 () Bool)

(assert (=> b!1502013 m!1385313))

(declare-fun m!1385315 () Bool)

(assert (=> b!1502013 m!1385315))

(declare-fun m!1385317 () Bool)

(assert (=> b!1502013 m!1385317))

(assert (=> b!1502010 m!1385299))

(assert (=> b!1502010 m!1385299))

(declare-fun m!1385319 () Bool)

(assert (=> b!1502010 m!1385319))

(declare-fun m!1385321 () Bool)

(assert (=> b!1502014 m!1385321))

(push 1)

(assert (not b!1502011))

(assert (not b!1502014))

(assert (not b!1502010))

(assert (not b!1502009))

(assert (not b!1502012))

(assert (not start!127812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

