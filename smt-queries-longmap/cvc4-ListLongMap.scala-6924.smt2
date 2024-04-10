; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87040 () Bool)

(assert start!87040)

(declare-fun res!678106 () Bool)

(declare-fun e!567968 () Bool)

(assert (=> start!87040 (=> (not res!678106) (not e!567968))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87040 (= res!678106 (validMask!0 mask!3464))))

(assert (=> start!87040 e!567968))

(declare-datatypes ((array!63615 0))(
  ( (array!63616 (arr!30627 (Array (_ BitVec 32) (_ BitVec 64))) (size!31129 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63615)

(declare-fun array_inv!23751 (array!63615) Bool)

(assert (=> start!87040 (array_inv!23751 a!3219)))

(assert (=> start!87040 true))

(declare-fun b!1009510 () Bool)

(declare-fun e!567971 () Bool)

(assert (=> b!1009510 (= e!567968 e!567971)))

(declare-fun res!678110 () Bool)

(assert (=> b!1009510 (=> (not res!678110) (not e!567971))))

(declare-datatypes ((SeekEntryResult!9559 0))(
  ( (MissingZero!9559 (index!40607 (_ BitVec 32))) (Found!9559 (index!40608 (_ BitVec 32))) (Intermediate!9559 (undefined!10371 Bool) (index!40609 (_ BitVec 32)) (x!88002 (_ BitVec 32))) (Undefined!9559) (MissingVacant!9559 (index!40610 (_ BitVec 32))) )
))
(declare-fun lt!446177 () SeekEntryResult!9559)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009510 (= res!678110 (or (= lt!446177 (MissingVacant!9559 i!1194)) (= lt!446177 (MissingZero!9559 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63615 (_ BitVec 32)) SeekEntryResult!9559)

(assert (=> b!1009510 (= lt!446177 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1009511 () Bool)

(declare-fun res!678099 () Bool)

(assert (=> b!1009511 (=> (not res!678099) (not e!567971))))

(declare-datatypes ((List!21303 0))(
  ( (Nil!21300) (Cons!21299 (h!22488 (_ BitVec 64)) (t!30304 List!21303)) )
))
(declare-fun arrayNoDuplicates!0 (array!63615 (_ BitVec 32) List!21303) Bool)

(assert (=> b!1009511 (= res!678099 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21300))))

(declare-fun b!1009512 () Bool)

(declare-fun res!678103 () Bool)

(assert (=> b!1009512 (=> (not res!678103) (not e!567968))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1009512 (= res!678103 (and (= (size!31129 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31129 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31129 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009513 () Bool)

(declare-fun res!678105 () Bool)

(assert (=> b!1009513 (=> (not res!678105) (not e!567968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009513 (= res!678105 (validKeyInArray!0 k!2224))))

(declare-fun b!1009514 () Bool)

(declare-fun res!678098 () Bool)

(assert (=> b!1009514 (=> (not res!678098) (not e!567971))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009514 (= res!678098 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31129 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31129 a!3219))))))

(declare-fun b!1009515 () Bool)

(declare-fun res!678107 () Bool)

(assert (=> b!1009515 (=> (not res!678107) (not e!567968))))

(assert (=> b!1009515 (= res!678107 (validKeyInArray!0 (select (arr!30627 a!3219) j!170)))))

(declare-fun b!1009516 () Bool)

(declare-fun res!678104 () Bool)

(assert (=> b!1009516 (=> (not res!678104) (not e!567968))))

(declare-fun arrayContainsKey!0 (array!63615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009516 (= res!678104 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009517 () Bool)

(declare-fun e!567973 () Bool)

(assert (=> b!1009517 (= e!567973 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvslt (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000)))))

(declare-fun lt!446180 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009517 (= lt!446180 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009518 () Bool)

(declare-fun e!567970 () Bool)

(declare-fun e!567969 () Bool)

(assert (=> b!1009518 (= e!567970 e!567969)))

(declare-fun res!678101 () Bool)

(assert (=> b!1009518 (=> (not res!678101) (not e!567969))))

(declare-fun lt!446179 () SeekEntryResult!9559)

(declare-fun lt!446178 () SeekEntryResult!9559)

(assert (=> b!1009518 (= res!678101 (= lt!446179 lt!446178))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63615 (_ BitVec 32)) SeekEntryResult!9559)

(assert (=> b!1009518 (= lt!446179 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30627 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009519 () Bool)

(assert (=> b!1009519 (= e!567971 e!567970)))

(declare-fun res!678109 () Bool)

(assert (=> b!1009519 (=> (not res!678109) (not e!567970))))

(declare-fun lt!446175 () SeekEntryResult!9559)

(assert (=> b!1009519 (= res!678109 (= lt!446175 lt!446178))))

(assert (=> b!1009519 (= lt!446178 (Intermediate!9559 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009519 (= lt!446175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30627 a!3219) j!170) mask!3464) (select (arr!30627 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009520 () Bool)

(declare-fun res!678108 () Bool)

(assert (=> b!1009520 (=> (not res!678108) (not e!567973))))

(assert (=> b!1009520 (= res!678108 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009521 () Bool)

(assert (=> b!1009521 (= e!567969 e!567973)))

(declare-fun res!678102 () Bool)

(assert (=> b!1009521 (=> (not res!678102) (not e!567973))))

(declare-fun lt!446176 () array!63615)

(declare-fun lt!446181 () (_ BitVec 64))

(assert (=> b!1009521 (= res!678102 (not (= lt!446175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446181 mask!3464) lt!446181 lt!446176 mask!3464))))))

(assert (=> b!1009521 (= lt!446181 (select (store (arr!30627 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1009521 (= lt!446176 (array!63616 (store (arr!30627 a!3219) i!1194 k!2224) (size!31129 a!3219)))))

(declare-fun b!1009522 () Bool)

(declare-fun res!678100 () Bool)

(assert (=> b!1009522 (=> (not res!678100) (not e!567973))))

(assert (=> b!1009522 (= res!678100 (not (= lt!446179 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446181 lt!446176 mask!3464))))))

(declare-fun b!1009523 () Bool)

(declare-fun res!678111 () Bool)

(assert (=> b!1009523 (=> (not res!678111) (not e!567971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63615 (_ BitVec 32)) Bool)

(assert (=> b!1009523 (= res!678111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!87040 res!678106) b!1009512))

(assert (= (and b!1009512 res!678103) b!1009515))

(assert (= (and b!1009515 res!678107) b!1009513))

(assert (= (and b!1009513 res!678105) b!1009516))

(assert (= (and b!1009516 res!678104) b!1009510))

(assert (= (and b!1009510 res!678110) b!1009523))

(assert (= (and b!1009523 res!678111) b!1009511))

(assert (= (and b!1009511 res!678099) b!1009514))

(assert (= (and b!1009514 res!678098) b!1009519))

(assert (= (and b!1009519 res!678109) b!1009518))

(assert (= (and b!1009518 res!678101) b!1009521))

(assert (= (and b!1009521 res!678102) b!1009522))

(assert (= (and b!1009522 res!678100) b!1009520))

(assert (= (and b!1009520 res!678108) b!1009517))

(declare-fun m!934053 () Bool)

(assert (=> b!1009511 m!934053))

(declare-fun m!934055 () Bool)

(assert (=> b!1009517 m!934055))

(declare-fun m!934057 () Bool)

(assert (=> b!1009521 m!934057))

(assert (=> b!1009521 m!934057))

(declare-fun m!934059 () Bool)

(assert (=> b!1009521 m!934059))

(declare-fun m!934061 () Bool)

(assert (=> b!1009521 m!934061))

(declare-fun m!934063 () Bool)

(assert (=> b!1009521 m!934063))

(declare-fun m!934065 () Bool)

(assert (=> b!1009516 m!934065))

(declare-fun m!934067 () Bool)

(assert (=> b!1009518 m!934067))

(assert (=> b!1009518 m!934067))

(declare-fun m!934069 () Bool)

(assert (=> b!1009518 m!934069))

(assert (=> b!1009515 m!934067))

(assert (=> b!1009515 m!934067))

(declare-fun m!934071 () Bool)

(assert (=> b!1009515 m!934071))

(declare-fun m!934073 () Bool)

(assert (=> b!1009513 m!934073))

(declare-fun m!934075 () Bool)

(assert (=> b!1009510 m!934075))

(declare-fun m!934077 () Bool)

(assert (=> b!1009523 m!934077))

(declare-fun m!934079 () Bool)

(assert (=> start!87040 m!934079))

(declare-fun m!934081 () Bool)

(assert (=> start!87040 m!934081))

(declare-fun m!934083 () Bool)

(assert (=> b!1009522 m!934083))

(assert (=> b!1009519 m!934067))

(assert (=> b!1009519 m!934067))

(declare-fun m!934085 () Bool)

(assert (=> b!1009519 m!934085))

(assert (=> b!1009519 m!934085))

(assert (=> b!1009519 m!934067))

(declare-fun m!934087 () Bool)

(assert (=> b!1009519 m!934087))

(push 1)

