; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86934 () Bool)

(assert start!86934)

(declare-fun b!1008389 () Bool)

(declare-fun res!677283 () Bool)

(declare-fun e!567397 () Bool)

(assert (=> b!1008389 (=> (not res!677283) (not e!567397))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9544 0))(
  ( (MissingZero!9544 (index!40547 (_ BitVec 32))) (Found!9544 (index!40548 (_ BitVec 32))) (Intermediate!9544 (undefined!10356 Bool) (index!40549 (_ BitVec 32)) (x!87934 (_ BitVec 32))) (Undefined!9544) (MissingVacant!9544 (index!40550 (_ BitVec 32))) )
))
(declare-fun lt!445674 () SeekEntryResult!9544)

(declare-datatypes ((array!63582 0))(
  ( (array!63583 (arr!30612 (Array (_ BitVec 32) (_ BitVec 64))) (size!31114 (_ BitVec 32))) )
))
(declare-fun lt!445675 () array!63582)

(declare-fun lt!445678 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63582 (_ BitVec 32)) SeekEntryResult!9544)

(assert (=> b!1008389 (= res!677283 (not (= lt!445674 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445678 lt!445675 mask!3464))))))

(declare-fun b!1008390 () Bool)

(declare-fun e!567392 () Bool)

(declare-fun e!567396 () Bool)

(assert (=> b!1008390 (= e!567392 e!567396)))

(declare-fun res!677293 () Bool)

(assert (=> b!1008390 (=> (not res!677293) (not e!567396))))

(declare-fun lt!445679 () SeekEntryResult!9544)

(declare-fun lt!445677 () SeekEntryResult!9544)

(assert (=> b!1008390 (= res!677293 (= lt!445679 lt!445677))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008390 (= lt!445677 (Intermediate!9544 false resIndex!38 resX!38))))

(declare-fun a!3219 () array!63582)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008390 (= lt!445679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30612 a!3219) j!170) mask!3464) (select (arr!30612 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008391 () Bool)

(declare-fun res!677291 () Bool)

(assert (=> b!1008391 (=> (not res!677291) (not e!567392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63582 (_ BitVec 32)) Bool)

(assert (=> b!1008391 (= res!677291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008392 () Bool)

(declare-fun res!677292 () Bool)

(assert (=> b!1008392 (=> (not res!677292) (not e!567397))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008392 (= res!677292 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008393 () Bool)

(declare-fun res!677290 () Bool)

(declare-fun e!567393 () Bool)

(assert (=> b!1008393 (=> (not res!677290) (not e!567393))))

(assert (=> b!1008393 (= res!677290 (and (= (size!31114 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31114 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31114 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008394 () Bool)

(declare-fun res!677285 () Bool)

(assert (=> b!1008394 (=> (not res!677285) (not e!567393))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008394 (= res!677285 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008395 () Bool)

(declare-fun e!567394 () Bool)

(assert (=> b!1008395 (= e!567396 e!567394)))

(declare-fun res!677282 () Bool)

(assert (=> b!1008395 (=> (not res!677282) (not e!567394))))

(assert (=> b!1008395 (= res!677282 (= lt!445674 lt!445677))))

(assert (=> b!1008395 (= lt!445674 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30612 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008396 () Bool)

(declare-fun res!677286 () Bool)

(assert (=> b!1008396 (=> (not res!677286) (not e!567393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008396 (= res!677286 (validKeyInArray!0 (select (arr!30612 a!3219) j!170)))))

(declare-fun res!677287 () Bool)

(assert (=> start!86934 (=> (not res!677287) (not e!567393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86934 (= res!677287 (validMask!0 mask!3464))))

(assert (=> start!86934 e!567393))

(declare-fun array_inv!23736 (array!63582) Bool)

(assert (=> start!86934 (array_inv!23736 a!3219)))

(assert (=> start!86934 true))

(declare-fun b!1008397 () Bool)

(declare-fun res!677294 () Bool)

(assert (=> b!1008397 (=> (not res!677294) (not e!567392))))

(declare-datatypes ((List!21288 0))(
  ( (Nil!21285) (Cons!21284 (h!22470 (_ BitVec 64)) (t!30289 List!21288)) )
))
(declare-fun arrayNoDuplicates!0 (array!63582 (_ BitVec 32) List!21288) Bool)

(assert (=> b!1008397 (= res!677294 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21285))))

(declare-fun b!1008398 () Bool)

(assert (=> b!1008398 (= e!567397 false)))

(declare-fun lt!445676 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008398 (= lt!445676 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008399 () Bool)

(declare-fun res!677284 () Bool)

(assert (=> b!1008399 (=> (not res!677284) (not e!567393))))

(assert (=> b!1008399 (= res!677284 (validKeyInArray!0 k!2224))))

(declare-fun b!1008400 () Bool)

(assert (=> b!1008400 (= e!567393 e!567392)))

(declare-fun res!677288 () Bool)

(assert (=> b!1008400 (=> (not res!677288) (not e!567392))))

(declare-fun lt!445673 () SeekEntryResult!9544)

(assert (=> b!1008400 (= res!677288 (or (= lt!445673 (MissingVacant!9544 i!1194)) (= lt!445673 (MissingZero!9544 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63582 (_ BitVec 32)) SeekEntryResult!9544)

(assert (=> b!1008400 (= lt!445673 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008401 () Bool)

(declare-fun res!677295 () Bool)

(assert (=> b!1008401 (=> (not res!677295) (not e!567392))))

(assert (=> b!1008401 (= res!677295 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31114 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31114 a!3219))))))

(declare-fun b!1008402 () Bool)

(assert (=> b!1008402 (= e!567394 e!567397)))

(declare-fun res!677289 () Bool)

(assert (=> b!1008402 (=> (not res!677289) (not e!567397))))

(assert (=> b!1008402 (= res!677289 (not (= lt!445679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445678 mask!3464) lt!445678 lt!445675 mask!3464))))))

(assert (=> b!1008402 (= lt!445678 (select (store (arr!30612 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008402 (= lt!445675 (array!63583 (store (arr!30612 a!3219) i!1194 k!2224) (size!31114 a!3219)))))

(assert (= (and start!86934 res!677287) b!1008393))

(assert (= (and b!1008393 res!677290) b!1008396))

(assert (= (and b!1008396 res!677286) b!1008399))

(assert (= (and b!1008399 res!677284) b!1008394))

(assert (= (and b!1008394 res!677285) b!1008400))

(assert (= (and b!1008400 res!677288) b!1008391))

(assert (= (and b!1008391 res!677291) b!1008397))

(assert (= (and b!1008397 res!677294) b!1008401))

(assert (= (and b!1008401 res!677295) b!1008390))

(assert (= (and b!1008390 res!677293) b!1008395))

(assert (= (and b!1008395 res!677282) b!1008402))

(assert (= (and b!1008402 res!677289) b!1008389))

(assert (= (and b!1008389 res!677283) b!1008392))

(assert (= (and b!1008392 res!677292) b!1008398))

(declare-fun m!933143 () Bool)

(assert (=> b!1008400 m!933143))

(declare-fun m!933145 () Bool)

(assert (=> b!1008394 m!933145))

(declare-fun m!933147 () Bool)

(assert (=> b!1008397 m!933147))

(declare-fun m!933149 () Bool)

(assert (=> b!1008390 m!933149))

(assert (=> b!1008390 m!933149))

(declare-fun m!933151 () Bool)

(assert (=> b!1008390 m!933151))

(assert (=> b!1008390 m!933151))

(assert (=> b!1008390 m!933149))

(declare-fun m!933153 () Bool)

(assert (=> b!1008390 m!933153))

(declare-fun m!933155 () Bool)

(assert (=> start!86934 m!933155))

(declare-fun m!933157 () Bool)

(assert (=> start!86934 m!933157))

(declare-fun m!933159 () Bool)

(assert (=> b!1008398 m!933159))

(assert (=> b!1008396 m!933149))

(assert (=> b!1008396 m!933149))

(declare-fun m!933161 () Bool)

(assert (=> b!1008396 m!933161))

(declare-fun m!933163 () Bool)

(assert (=> b!1008402 m!933163))

(assert (=> b!1008402 m!933163))

(declare-fun m!933165 () Bool)

(assert (=> b!1008402 m!933165))

(declare-fun m!933167 () Bool)

(assert (=> b!1008402 m!933167))

(declare-fun m!933169 () Bool)

(assert (=> b!1008402 m!933169))

(declare-fun m!933171 () Bool)

(assert (=> b!1008389 m!933171))

(assert (=> b!1008395 m!933149))

(assert (=> b!1008395 m!933149))

(declare-fun m!933173 () Bool)

(assert (=> b!1008395 m!933173))

(declare-fun m!933175 () Bool)

(assert (=> b!1008391 m!933175))

(declare-fun m!933177 () Bool)

(assert (=> b!1008399 m!933177))

(push 1)

