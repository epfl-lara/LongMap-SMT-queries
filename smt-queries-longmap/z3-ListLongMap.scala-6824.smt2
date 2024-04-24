; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86068 () Bool)

(assert start!86068)

(declare-fun b!996471 () Bool)

(declare-fun res!666196 () Bool)

(declare-fun e!562388 () Bool)

(assert (=> b!996471 (=> (not res!666196) (not e!562388))))

(declare-datatypes ((array!63027 0))(
  ( (array!63028 (arr!30343 (Array (_ BitVec 32) (_ BitVec 64))) (size!30846 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63027)

(declare-datatypes ((List!20990 0))(
  ( (Nil!20987) (Cons!20986 (h!22154 (_ BitVec 64)) (t!29983 List!20990)) )
))
(declare-fun arrayNoDuplicates!0 (array!63027 (_ BitVec 32) List!20990) Bool)

(assert (=> b!996471 (= res!666196 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!20987))))

(declare-fun b!996472 () Bool)

(declare-fun res!666200 () Bool)

(declare-fun e!562389 () Bool)

(assert (=> b!996472 (=> (not res!666200) (not e!562389))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996472 (= res!666200 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996473 () Bool)

(declare-fun res!666203 () Bool)

(assert (=> b!996473 (=> (not res!666203) (not e!562389))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996473 (= res!666203 (validKeyInArray!0 (select (arr!30343 a!3219) j!170)))))

(declare-fun b!996474 () Bool)

(declare-fun res!666202 () Bool)

(assert (=> b!996474 (=> (not res!666202) (not e!562388))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63027 (_ BitVec 32)) Bool)

(assert (=> b!996474 (= res!666202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun b!996475 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!996475 (= e!562388 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30846 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30846 a!3219)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!996476 () Bool)

(declare-fun res!666199 () Bool)

(assert (=> b!996476 (=> (not res!666199) (not e!562389))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996476 (= res!666199 (and (= (size!30846 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30846 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30846 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996477 () Bool)

(declare-fun res!666201 () Bool)

(assert (=> b!996477 (=> (not res!666201) (not e!562389))))

(assert (=> b!996477 (= res!666201 (validKeyInArray!0 k0!2224))))

(declare-fun b!996478 () Bool)

(assert (=> b!996478 (= e!562389 e!562388)))

(declare-fun res!666198 () Bool)

(assert (=> b!996478 (=> (not res!666198) (not e!562388))))

(declare-datatypes ((SeekEntryResult!9211 0))(
  ( (MissingZero!9211 (index!39215 (_ BitVec 32))) (Found!9211 (index!39216 (_ BitVec 32))) (Intermediate!9211 (undefined!10023 Bool) (index!39217 (_ BitVec 32)) (x!86810 (_ BitVec 32))) (Undefined!9211) (MissingVacant!9211 (index!39218 (_ BitVec 32))) )
))
(declare-fun lt!441356 () SeekEntryResult!9211)

(assert (=> b!996478 (= res!666198 (or (= lt!441356 (MissingVacant!9211 i!1194)) (= lt!441356 (MissingZero!9211 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63027 (_ BitVec 32)) SeekEntryResult!9211)

(assert (=> b!996478 (= lt!441356 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!666197 () Bool)

(assert (=> start!86068 (=> (not res!666197) (not e!562389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86068 (= res!666197 (validMask!0 mask!3464))))

(assert (=> start!86068 e!562389))

(declare-fun array_inv!23479 (array!63027) Bool)

(assert (=> start!86068 (array_inv!23479 a!3219)))

(assert (=> start!86068 true))

(assert (= (and start!86068 res!666197) b!996476))

(assert (= (and b!996476 res!666199) b!996473))

(assert (= (and b!996473 res!666203) b!996477))

(assert (= (and b!996477 res!666201) b!996472))

(assert (= (and b!996472 res!666200) b!996478))

(assert (= (and b!996478 res!666198) b!996474))

(assert (= (and b!996474 res!666202) b!996471))

(assert (= (and b!996471 res!666196) b!996475))

(declare-fun m!924263 () Bool)

(assert (=> b!996477 m!924263))

(declare-fun m!924265 () Bool)

(assert (=> b!996471 m!924265))

(declare-fun m!924267 () Bool)

(assert (=> b!996478 m!924267))

(declare-fun m!924269 () Bool)

(assert (=> b!996474 m!924269))

(declare-fun m!924271 () Bool)

(assert (=> b!996473 m!924271))

(assert (=> b!996473 m!924271))

(declare-fun m!924273 () Bool)

(assert (=> b!996473 m!924273))

(declare-fun m!924275 () Bool)

(assert (=> start!86068 m!924275))

(declare-fun m!924277 () Bool)

(assert (=> start!86068 m!924277))

(declare-fun m!924279 () Bool)

(assert (=> b!996472 m!924279))

(check-sat (not b!996471) (not b!996477) (not b!996473) (not start!86068) (not b!996472) (not b!996474) (not b!996478))
(check-sat)
