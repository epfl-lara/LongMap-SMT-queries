; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86022 () Bool)

(assert start!86022)

(declare-fun b!996370 () Bool)

(declare-fun e!562180 () Bool)

(declare-fun e!562178 () Bool)

(assert (=> b!996370 (= e!562180 e!562178)))

(declare-fun res!666486 () Bool)

(assert (=> b!996370 (=> (not res!666486) (not e!562178))))

(declare-datatypes ((SeekEntryResult!9277 0))(
  ( (MissingZero!9277 (index!39479 (_ BitVec 32))) (Found!9277 (index!39480 (_ BitVec 32))) (Intermediate!9277 (undefined!10089 Bool) (index!39481 (_ BitVec 32)) (x!86913 (_ BitVec 32))) (Undefined!9277) (MissingVacant!9277 (index!39482 (_ BitVec 32))) )
))
(declare-fun lt!441220 () SeekEntryResult!9277)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996370 (= res!666486 (or (= lt!441220 (MissingVacant!9277 i!1194)) (= lt!441220 (MissingZero!9277 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((array!63027 0))(
  ( (array!63028 (arr!30345 (Array (_ BitVec 32) (_ BitVec 64))) (size!30847 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63027)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63027 (_ BitVec 32)) SeekEntryResult!9277)

(assert (=> b!996370 (= lt!441220 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996372 () Bool)

(declare-fun res!666484 () Bool)

(assert (=> b!996372 (=> (not res!666484) (not e!562178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63027 (_ BitVec 32)) Bool)

(assert (=> b!996372 (= res!666484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996373 () Bool)

(assert (=> b!996373 (= e!562178 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441221 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996373 (= lt!441221 (toIndex!0 (select (arr!30345 a!3219) j!170) mask!3464))))

(declare-fun b!996374 () Bool)

(declare-fun res!666491 () Bool)

(assert (=> b!996374 (=> (not res!666491) (not e!562180))))

(declare-fun arrayContainsKey!0 (array!63027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996374 (= res!666491 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996375 () Bool)

(declare-fun res!666488 () Bool)

(assert (=> b!996375 (=> (not res!666488) (not e!562178))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996375 (= res!666488 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30847 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30847 a!3219))))))

(declare-fun b!996376 () Bool)

(declare-fun res!666487 () Bool)

(assert (=> b!996376 (=> (not res!666487) (not e!562180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996376 (= res!666487 (validKeyInArray!0 (select (arr!30345 a!3219) j!170)))))

(declare-fun b!996371 () Bool)

(declare-fun res!666485 () Bool)

(assert (=> b!996371 (=> (not res!666485) (not e!562180))))

(assert (=> b!996371 (= res!666485 (and (= (size!30847 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30847 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30847 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!666492 () Bool)

(assert (=> start!86022 (=> (not res!666492) (not e!562180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86022 (= res!666492 (validMask!0 mask!3464))))

(assert (=> start!86022 e!562180))

(declare-fun array_inv!23469 (array!63027) Bool)

(assert (=> start!86022 (array_inv!23469 a!3219)))

(assert (=> start!86022 true))

(declare-fun b!996377 () Bool)

(declare-fun res!666489 () Bool)

(assert (=> b!996377 (=> (not res!666489) (not e!562180))))

(assert (=> b!996377 (= res!666489 (validKeyInArray!0 k!2224))))

(declare-fun b!996378 () Bool)

(declare-fun res!666490 () Bool)

(assert (=> b!996378 (=> (not res!666490) (not e!562178))))

(declare-datatypes ((List!21021 0))(
  ( (Nil!21018) (Cons!21017 (h!22182 (_ BitVec 64)) (t!30022 List!21021)) )
))
(declare-fun arrayNoDuplicates!0 (array!63027 (_ BitVec 32) List!21021) Bool)

(assert (=> b!996378 (= res!666490 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21018))))

(assert (= (and start!86022 res!666492) b!996371))

(assert (= (and b!996371 res!666485) b!996376))

(assert (= (and b!996376 res!666487) b!996377))

(assert (= (and b!996377 res!666489) b!996374))

(assert (= (and b!996374 res!666491) b!996370))

(assert (= (and b!996370 res!666486) b!996372))

(assert (= (and b!996372 res!666484) b!996378))

(assert (= (and b!996378 res!666490) b!996375))

(assert (= (and b!996375 res!666488) b!996373))

(declare-fun m!923505 () Bool)

(assert (=> b!996373 m!923505))

(assert (=> b!996373 m!923505))

(declare-fun m!923507 () Bool)

(assert (=> b!996373 m!923507))

(declare-fun m!923509 () Bool)

(assert (=> b!996374 m!923509))

(assert (=> b!996376 m!923505))

(assert (=> b!996376 m!923505))

(declare-fun m!923511 () Bool)

(assert (=> b!996376 m!923511))

(declare-fun m!923513 () Bool)

(assert (=> b!996370 m!923513))

(declare-fun m!923515 () Bool)

(assert (=> b!996372 m!923515))

(declare-fun m!923517 () Bool)

(assert (=> start!86022 m!923517))

(declare-fun m!923519 () Bool)

(assert (=> start!86022 m!923519))

(declare-fun m!923521 () Bool)

(assert (=> b!996378 m!923521))

(declare-fun m!923523 () Bool)

(assert (=> b!996377 m!923523))

(push 1)

(assert (not b!996374))

(assert (not b!996370))

(assert (not b!996376))

(assert (not b!996377))

(assert (not b!996378))

(assert (not b!996373))

(assert (not start!86022))

(assert (not b!996372))

(check-sat)

