; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87036 () Bool)

(assert start!87036)

(declare-fun b!1009426 () Bool)

(declare-fun res!678021 () Bool)

(declare-fun e!567935 () Bool)

(assert (=> b!1009426 (=> (not res!678021) (not e!567935))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009426 (= res!678021 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009427 () Bool)

(declare-fun res!678015 () Bool)

(declare-fun e!567936 () Bool)

(assert (=> b!1009427 (=> (not res!678015) (not e!567936))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009427 (= res!678015 (validKeyInArray!0 k!2224))))

(declare-fun b!1009428 () Bool)

(declare-fun res!678023 () Bool)

(assert (=> b!1009428 (=> (not res!678023) (not e!567935))))

(declare-fun lt!446139 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9557 0))(
  ( (MissingZero!9557 (index!40599 (_ BitVec 32))) (Found!9557 (index!40600 (_ BitVec 32))) (Intermediate!9557 (undefined!10369 Bool) (index!40601 (_ BitVec 32)) (x!88000 (_ BitVec 32))) (Undefined!9557) (MissingVacant!9557 (index!40602 (_ BitVec 32))) )
))
(declare-fun lt!446136 () SeekEntryResult!9557)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((array!63611 0))(
  ( (array!63612 (arr!30625 (Array (_ BitVec 32) (_ BitVec 64))) (size!31127 (_ BitVec 32))) )
))
(declare-fun lt!446138 () array!63611)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63611 (_ BitVec 32)) SeekEntryResult!9557)

(assert (=> b!1009428 (= res!678023 (not (= lt!446136 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446139 lt!446138 mask!3464))))))

(declare-fun res!678014 () Bool)

(assert (=> start!87036 (=> (not res!678014) (not e!567936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87036 (= res!678014 (validMask!0 mask!3464))))

(assert (=> start!87036 e!567936))

(declare-fun a!3219 () array!63611)

(declare-fun array_inv!23749 (array!63611) Bool)

(assert (=> start!87036 (array_inv!23749 a!3219)))

(assert (=> start!87036 true))

(declare-fun b!1009429 () Bool)

(declare-fun e!567934 () Bool)

(declare-fun e!567933 () Bool)

(assert (=> b!1009429 (= e!567934 e!567933)))

(declare-fun res!678019 () Bool)

(assert (=> b!1009429 (=> (not res!678019) (not e!567933))))

(declare-fun lt!446135 () SeekEntryResult!9557)

(declare-fun lt!446137 () SeekEntryResult!9557)

(assert (=> b!1009429 (= res!678019 (= lt!446135 lt!446137))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009429 (= lt!446137 (Intermediate!9557 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009429 (= lt!446135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30625 a!3219) j!170) mask!3464) (select (arr!30625 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009430 () Bool)

(declare-fun res!678027 () Bool)

(assert (=> b!1009430 (=> (not res!678027) (not e!567934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63611 (_ BitVec 32)) Bool)

(assert (=> b!1009430 (= res!678027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009431 () Bool)

(declare-fun res!678018 () Bool)

(assert (=> b!1009431 (=> (not res!678018) (not e!567936))))

(assert (=> b!1009431 (= res!678018 (and (= (size!31127 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31127 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31127 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009432 () Bool)

(assert (=> b!1009432 (= e!567935 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvslt (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000)))))

(declare-fun lt!446133 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009432 (= lt!446133 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009433 () Bool)

(declare-fun e!567932 () Bool)

(assert (=> b!1009433 (= e!567932 e!567935)))

(declare-fun res!678017 () Bool)

(assert (=> b!1009433 (=> (not res!678017) (not e!567935))))

(assert (=> b!1009433 (= res!678017 (not (= lt!446135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446139 mask!3464) lt!446139 lt!446138 mask!3464))))))

(assert (=> b!1009433 (= lt!446139 (select (store (arr!30625 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1009433 (= lt!446138 (array!63612 (store (arr!30625 a!3219) i!1194 k!2224) (size!31127 a!3219)))))

(declare-fun b!1009434 () Bool)

(assert (=> b!1009434 (= e!567936 e!567934)))

(declare-fun res!678022 () Bool)

(assert (=> b!1009434 (=> (not res!678022) (not e!567934))))

(declare-fun lt!446134 () SeekEntryResult!9557)

(assert (=> b!1009434 (= res!678022 (or (= lt!446134 (MissingVacant!9557 i!1194)) (= lt!446134 (MissingZero!9557 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63611 (_ BitVec 32)) SeekEntryResult!9557)

(assert (=> b!1009434 (= lt!446134 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1009435 () Bool)

(declare-fun res!678026 () Bool)

(assert (=> b!1009435 (=> (not res!678026) (not e!567936))))

(declare-fun arrayContainsKey!0 (array!63611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009435 (= res!678026 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009436 () Bool)

(declare-fun res!678024 () Bool)

(assert (=> b!1009436 (=> (not res!678024) (not e!567934))))

(declare-datatypes ((List!21301 0))(
  ( (Nil!21298) (Cons!21297 (h!22486 (_ BitVec 64)) (t!30302 List!21301)) )
))
(declare-fun arrayNoDuplicates!0 (array!63611 (_ BitVec 32) List!21301) Bool)

(assert (=> b!1009436 (= res!678024 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21298))))

(declare-fun b!1009437 () Bool)

(declare-fun res!678025 () Bool)

(assert (=> b!1009437 (=> (not res!678025) (not e!567936))))

(assert (=> b!1009437 (= res!678025 (validKeyInArray!0 (select (arr!30625 a!3219) j!170)))))

(declare-fun b!1009438 () Bool)

(declare-fun res!678016 () Bool)

(assert (=> b!1009438 (=> (not res!678016) (not e!567934))))

(assert (=> b!1009438 (= res!678016 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31127 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31127 a!3219))))))

(declare-fun b!1009439 () Bool)

(assert (=> b!1009439 (= e!567933 e!567932)))

(declare-fun res!678020 () Bool)

(assert (=> b!1009439 (=> (not res!678020) (not e!567932))))

(assert (=> b!1009439 (= res!678020 (= lt!446136 lt!446137))))

(assert (=> b!1009439 (= lt!446136 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30625 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87036 res!678014) b!1009431))

(assert (= (and b!1009431 res!678018) b!1009437))

(assert (= (and b!1009437 res!678025) b!1009427))

(assert (= (and b!1009427 res!678015) b!1009435))

(assert (= (and b!1009435 res!678026) b!1009434))

(assert (= (and b!1009434 res!678022) b!1009430))

(assert (= (and b!1009430 res!678027) b!1009436))

(assert (= (and b!1009436 res!678024) b!1009438))

(assert (= (and b!1009438 res!678016) b!1009429))

(assert (= (and b!1009429 res!678019) b!1009439))

(assert (= (and b!1009439 res!678020) b!1009433))

(assert (= (and b!1009433 res!678017) b!1009428))

(assert (= (and b!1009428 res!678023) b!1009426))

(assert (= (and b!1009426 res!678021) b!1009432))

(declare-fun m!933981 () Bool)

(assert (=> b!1009433 m!933981))

(assert (=> b!1009433 m!933981))

(declare-fun m!933983 () Bool)

(assert (=> b!1009433 m!933983))

(declare-fun m!933985 () Bool)

(assert (=> b!1009433 m!933985))

(declare-fun m!933987 () Bool)

(assert (=> b!1009433 m!933987))

(declare-fun m!933989 () Bool)

(assert (=> b!1009427 m!933989))

(declare-fun m!933991 () Bool)

(assert (=> b!1009435 m!933991))

(declare-fun m!933993 () Bool)

(assert (=> b!1009437 m!933993))

(assert (=> b!1009437 m!933993))

(declare-fun m!933995 () Bool)

(assert (=> b!1009437 m!933995))

(declare-fun m!933997 () Bool)

(assert (=> b!1009428 m!933997))

(assert (=> b!1009429 m!933993))

(assert (=> b!1009429 m!933993))

(declare-fun m!933999 () Bool)

(assert (=> b!1009429 m!933999))

(assert (=> b!1009429 m!933999))

(assert (=> b!1009429 m!933993))

(declare-fun m!934001 () Bool)

(assert (=> b!1009429 m!934001))

(declare-fun m!934003 () Bool)

(assert (=> b!1009432 m!934003))

(declare-fun m!934005 () Bool)

(assert (=> start!87036 m!934005))

(declare-fun m!934007 () Bool)

(assert (=> start!87036 m!934007))

(assert (=> b!1009439 m!933993))

(assert (=> b!1009439 m!933993))

(declare-fun m!934009 () Bool)

(assert (=> b!1009439 m!934009))

(declare-fun m!934011 () Bool)

(assert (=> b!1009430 m!934011))

(declare-fun m!934013 () Bool)

(assert (=> b!1009434 m!934013))

(declare-fun m!934015 () Bool)

(assert (=> b!1009436 m!934015))

(push 1)

