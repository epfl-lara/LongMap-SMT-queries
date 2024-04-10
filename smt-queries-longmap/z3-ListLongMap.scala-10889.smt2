; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127598 () Bool)

(assert start!127598)

(declare-fun b!1499006 () Bool)

(declare-fun res!1020082 () Bool)

(declare-fun e!839173 () Bool)

(assert (=> b!1499006 (=> (not res!1020082) (not e!839173))))

(declare-datatypes ((array!99979 0))(
  ( (array!99980 (arr!48249 (Array (_ BitVec 32) (_ BitVec 64))) (size!48799 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99979)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499006 (= res!1020082 (validKeyInArray!0 (select (arr!48249 a!2850) i!996)))))

(declare-fun b!1499007 () Bool)

(declare-fun res!1020083 () Bool)

(assert (=> b!1499007 (=> (not res!1020083) (not e!839173))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499007 (= res!1020083 (validKeyInArray!0 (select (arr!48249 a!2850) j!87)))))

(declare-fun b!1499008 () Bool)

(declare-fun res!1020086 () Bool)

(assert (=> b!1499008 (=> (not res!1020086) (not e!839173))))

(declare-datatypes ((List!34741 0))(
  ( (Nil!34738) (Cons!34737 (h!36134 (_ BitVec 64)) (t!49435 List!34741)) )
))
(declare-fun arrayNoDuplicates!0 (array!99979 (_ BitVec 32) List!34741) Bool)

(assert (=> b!1499008 (= res!1020086 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34738))))

(declare-fun b!1499009 () Bool)

(assert (=> b!1499009 (= e!839173 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12459 0))(
  ( (MissingZero!12459 (index!52228 (_ BitVec 32))) (Found!12459 (index!52229 (_ BitVec 32))) (Intermediate!12459 (undefined!13271 Bool) (index!52230 (_ BitVec 32)) (x!133917 (_ BitVec 32))) (Undefined!12459) (MissingVacant!12459 (index!52231 (_ BitVec 32))) )
))
(declare-fun lt!652684 () SeekEntryResult!12459)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99979 (_ BitVec 32)) SeekEntryResult!12459)

(assert (=> b!1499009 (= lt!652684 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48249 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1020084 () Bool)

(assert (=> start!127598 (=> (not res!1020084) (not e!839173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127598 (= res!1020084 (validMask!0 mask!2661))))

(assert (=> start!127598 e!839173))

(assert (=> start!127598 true))

(declare-fun array_inv!37277 (array!99979) Bool)

(assert (=> start!127598 (array_inv!37277 a!2850)))

(declare-fun b!1499010 () Bool)

(declare-fun res!1020087 () Bool)

(assert (=> b!1499010 (=> (not res!1020087) (not e!839173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99979 (_ BitVec 32)) Bool)

(assert (=> b!1499010 (= res!1020087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499011 () Bool)

(declare-fun res!1020088 () Bool)

(assert (=> b!1499011 (=> (not res!1020088) (not e!839173))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499011 (= res!1020088 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48799 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48799 a!2850)) (= (select (arr!48249 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48249 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48799 a!2850))))))

(declare-fun b!1499012 () Bool)

(declare-fun res!1020085 () Bool)

(assert (=> b!1499012 (=> (not res!1020085) (not e!839173))))

(assert (=> b!1499012 (= res!1020085 (and (= (size!48799 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48799 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48799 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127598 res!1020084) b!1499012))

(assert (= (and b!1499012 res!1020085) b!1499006))

(assert (= (and b!1499006 res!1020082) b!1499007))

(assert (= (and b!1499007 res!1020083) b!1499010))

(assert (= (and b!1499010 res!1020087) b!1499008))

(assert (= (and b!1499008 res!1020086) b!1499011))

(assert (= (and b!1499011 res!1020088) b!1499009))

(declare-fun m!1382179 () Bool)

(assert (=> b!1499009 m!1382179))

(assert (=> b!1499009 m!1382179))

(declare-fun m!1382181 () Bool)

(assert (=> b!1499009 m!1382181))

(declare-fun m!1382183 () Bool)

(assert (=> b!1499006 m!1382183))

(assert (=> b!1499006 m!1382183))

(declare-fun m!1382185 () Bool)

(assert (=> b!1499006 m!1382185))

(declare-fun m!1382187 () Bool)

(assert (=> b!1499008 m!1382187))

(assert (=> b!1499007 m!1382179))

(assert (=> b!1499007 m!1382179))

(declare-fun m!1382189 () Bool)

(assert (=> b!1499007 m!1382189))

(declare-fun m!1382191 () Bool)

(assert (=> b!1499011 m!1382191))

(declare-fun m!1382193 () Bool)

(assert (=> b!1499011 m!1382193))

(declare-fun m!1382195 () Bool)

(assert (=> b!1499011 m!1382195))

(declare-fun m!1382197 () Bool)

(assert (=> b!1499010 m!1382197))

(declare-fun m!1382199 () Bool)

(assert (=> start!127598 m!1382199))

(declare-fun m!1382201 () Bool)

(assert (=> start!127598 m!1382201))

(check-sat (not b!1499008) (not start!127598) (not b!1499006) (not b!1499007) (not b!1499010) (not b!1499009))
