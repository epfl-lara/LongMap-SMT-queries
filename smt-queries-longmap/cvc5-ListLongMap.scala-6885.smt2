; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86564 () Bool)

(assert start!86564)

(declare-fun b!1003485 () Bool)

(declare-fun res!672971 () Bool)

(declare-fun e!565195 () Bool)

(assert (=> b!1003485 (=> (not res!672971) (not e!565195))))

(declare-datatypes ((array!63365 0))(
  ( (array!63366 (arr!30508 (Array (_ BitVec 32) (_ BitVec 64))) (size!31010 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63365)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!443700 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9440 0))(
  ( (MissingZero!9440 (index!40131 (_ BitVec 32))) (Found!9440 (index!40132 (_ BitVec 32))) (Intermediate!9440 (undefined!10252 Bool) (index!40133 (_ BitVec 32)) (x!87540 (_ BitVec 32))) (Undefined!9440) (MissingVacant!9440 (index!40134 (_ BitVec 32))) )
))
(declare-fun lt!443704 () SeekEntryResult!9440)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63365 (_ BitVec 32)) SeekEntryResult!9440)

(assert (=> b!1003485 (= res!672971 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443700 (select (arr!30508 a!3219) j!170) a!3219 mask!3464) lt!443704))))

(declare-fun b!1003486 () Bool)

(declare-fun res!672965 () Bool)

(declare-fun e!565192 () Bool)

(assert (=> b!1003486 (=> (not res!672965) (not e!565192))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003486 (= res!672965 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31010 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31010 a!3219))))))

(declare-fun res!672968 () Bool)

(declare-fun e!565191 () Bool)

(assert (=> start!86564 (=> (not res!672968) (not e!565191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86564 (= res!672968 (validMask!0 mask!3464))))

(assert (=> start!86564 e!565191))

(declare-fun array_inv!23632 (array!63365) Bool)

(assert (=> start!86564 (array_inv!23632 a!3219)))

(assert (=> start!86564 true))

(declare-fun b!1003487 () Bool)

(declare-fun res!672963 () Bool)

(declare-fun e!565189 () Bool)

(assert (=> b!1003487 (=> (not res!672963) (not e!565189))))

(declare-fun lt!443703 () (_ BitVec 64))

(declare-fun lt!443698 () SeekEntryResult!9440)

(declare-fun lt!443701 () array!63365)

(assert (=> b!1003487 (= res!672963 (not (= lt!443698 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443703 lt!443701 mask!3464))))))

(declare-fun b!1003488 () Bool)

(assert (=> b!1003488 (= e!565191 e!565192)))

(declare-fun res!672970 () Bool)

(assert (=> b!1003488 (=> (not res!672970) (not e!565192))))

(declare-fun lt!443702 () SeekEntryResult!9440)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003488 (= res!672970 (or (= lt!443702 (MissingVacant!9440 i!1194)) (= lt!443702 (MissingZero!9440 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63365 (_ BitVec 32)) SeekEntryResult!9440)

(assert (=> b!1003488 (= lt!443702 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003489 () Bool)

(declare-fun res!672967 () Bool)

(assert (=> b!1003489 (=> (not res!672967) (not e!565192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63365 (_ BitVec 32)) Bool)

(assert (=> b!1003489 (= res!672967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003490 () Bool)

(declare-fun e!565190 () Bool)

(assert (=> b!1003490 (= e!565190 e!565189)))

(declare-fun res!672977 () Bool)

(assert (=> b!1003490 (=> (not res!672977) (not e!565189))))

(declare-fun lt!443705 () SeekEntryResult!9440)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003490 (= res!672977 (not (= lt!443705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443703 mask!3464) lt!443703 lt!443701 mask!3464))))))

(assert (=> b!1003490 (= lt!443703 (select (store (arr!30508 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003490 (= lt!443701 (array!63366 (store (arr!30508 a!3219) i!1194 k!2224) (size!31010 a!3219)))))

(declare-fun b!1003491 () Bool)

(declare-fun res!672974 () Bool)

(assert (=> b!1003491 (=> (not res!672974) (not e!565191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003491 (= res!672974 (validKeyInArray!0 k!2224))))

(declare-fun b!1003492 () Bool)

(declare-fun e!565193 () Bool)

(assert (=> b!1003492 (= e!565193 e!565190)))

(declare-fun res!672976 () Bool)

(assert (=> b!1003492 (=> (not res!672976) (not e!565190))))

(assert (=> b!1003492 (= res!672976 (= lt!443698 lt!443704))))

(assert (=> b!1003492 (= lt!443698 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30508 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003493 () Bool)

(declare-fun res!672969 () Bool)

(assert (=> b!1003493 (=> (not res!672969) (not e!565191))))

(declare-fun arrayContainsKey!0 (array!63365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003493 (= res!672969 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003494 () Bool)

(declare-fun res!672964 () Bool)

(assert (=> b!1003494 (=> (not res!672964) (not e!565189))))

(assert (=> b!1003494 (= res!672964 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003495 () Bool)

(assert (=> b!1003495 (= e!565192 e!565193)))

(declare-fun res!672972 () Bool)

(assert (=> b!1003495 (=> (not res!672972) (not e!565193))))

(assert (=> b!1003495 (= res!672972 (= lt!443705 lt!443704))))

(assert (=> b!1003495 (= lt!443704 (Intermediate!9440 false resIndex!38 resX!38))))

(assert (=> b!1003495 (= lt!443705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30508 a!3219) j!170) mask!3464) (select (arr!30508 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003496 () Bool)

(declare-fun res!672975 () Bool)

(assert (=> b!1003496 (=> (not res!672975) (not e!565192))))

(declare-datatypes ((List!21184 0))(
  ( (Nil!21181) (Cons!21180 (h!22357 (_ BitVec 64)) (t!30185 List!21184)) )
))
(declare-fun arrayNoDuplicates!0 (array!63365 (_ BitVec 32) List!21184) Bool)

(assert (=> b!1003496 (= res!672975 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21181))))

(declare-fun b!1003497 () Bool)

(assert (=> b!1003497 (= e!565189 e!565195)))

(declare-fun res!672973 () Bool)

(assert (=> b!1003497 (=> (not res!672973) (not e!565195))))

(assert (=> b!1003497 (= res!672973 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443700 #b00000000000000000000000000000000) (bvslt lt!443700 (size!31010 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003497 (= lt!443700 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003498 () Bool)

(assert (=> b!1003498 (= e!565195 false)))

(declare-fun lt!443699 () SeekEntryResult!9440)

(assert (=> b!1003498 (= lt!443699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443700 lt!443703 lt!443701 mask!3464))))

(declare-fun b!1003499 () Bool)

(declare-fun res!672966 () Bool)

(assert (=> b!1003499 (=> (not res!672966) (not e!565191))))

(assert (=> b!1003499 (= res!672966 (and (= (size!31010 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31010 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31010 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003500 () Bool)

(declare-fun res!672978 () Bool)

(assert (=> b!1003500 (=> (not res!672978) (not e!565191))))

(assert (=> b!1003500 (= res!672978 (validKeyInArray!0 (select (arr!30508 a!3219) j!170)))))

(assert (= (and start!86564 res!672968) b!1003499))

(assert (= (and b!1003499 res!672966) b!1003500))

(assert (= (and b!1003500 res!672978) b!1003491))

(assert (= (and b!1003491 res!672974) b!1003493))

(assert (= (and b!1003493 res!672969) b!1003488))

(assert (= (and b!1003488 res!672970) b!1003489))

(assert (= (and b!1003489 res!672967) b!1003496))

(assert (= (and b!1003496 res!672975) b!1003486))

(assert (= (and b!1003486 res!672965) b!1003495))

(assert (= (and b!1003495 res!672972) b!1003492))

(assert (= (and b!1003492 res!672976) b!1003490))

(assert (= (and b!1003490 res!672977) b!1003487))

(assert (= (and b!1003487 res!672963) b!1003494))

(assert (= (and b!1003494 res!672964) b!1003497))

(assert (= (and b!1003497 res!672973) b!1003485))

(assert (= (and b!1003485 res!672971) b!1003498))

(declare-fun m!929189 () Bool)

(assert (=> b!1003492 m!929189))

(assert (=> b!1003492 m!929189))

(declare-fun m!929191 () Bool)

(assert (=> b!1003492 m!929191))

(declare-fun m!929193 () Bool)

(assert (=> b!1003491 m!929193))

(declare-fun m!929195 () Bool)

(assert (=> b!1003497 m!929195))

(declare-fun m!929197 () Bool)

(assert (=> b!1003498 m!929197))

(declare-fun m!929199 () Bool)

(assert (=> b!1003493 m!929199))

(declare-fun m!929201 () Bool)

(assert (=> b!1003487 m!929201))

(declare-fun m!929203 () Bool)

(assert (=> b!1003488 m!929203))

(declare-fun m!929205 () Bool)

(assert (=> start!86564 m!929205))

(declare-fun m!929207 () Bool)

(assert (=> start!86564 m!929207))

(declare-fun m!929209 () Bool)

(assert (=> b!1003489 m!929209))

(assert (=> b!1003500 m!929189))

(assert (=> b!1003500 m!929189))

(declare-fun m!929211 () Bool)

(assert (=> b!1003500 m!929211))

(assert (=> b!1003495 m!929189))

(assert (=> b!1003495 m!929189))

(declare-fun m!929213 () Bool)

(assert (=> b!1003495 m!929213))

(assert (=> b!1003495 m!929213))

(assert (=> b!1003495 m!929189))

(declare-fun m!929215 () Bool)

(assert (=> b!1003495 m!929215))

(declare-fun m!929217 () Bool)

(assert (=> b!1003496 m!929217))

(assert (=> b!1003485 m!929189))

(assert (=> b!1003485 m!929189))

(declare-fun m!929219 () Bool)

(assert (=> b!1003485 m!929219))

(declare-fun m!929221 () Bool)

(assert (=> b!1003490 m!929221))

(assert (=> b!1003490 m!929221))

(declare-fun m!929223 () Bool)

(assert (=> b!1003490 m!929223))

(declare-fun m!929225 () Bool)

(assert (=> b!1003490 m!929225))

(declare-fun m!929227 () Bool)

(assert (=> b!1003490 m!929227))

(push 1)

