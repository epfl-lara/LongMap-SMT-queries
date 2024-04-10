; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86066 () Bool)

(assert start!86066)

(declare-fun b!996995 () Bool)

(declare-fun res!667109 () Bool)

(declare-fun e!562380 () Bool)

(assert (=> b!996995 (=> (not res!667109) (not e!562380))))

(declare-datatypes ((array!63071 0))(
  ( (array!63072 (arr!30367 (Array (_ BitVec 32) (_ BitVec 64))) (size!30869 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63071)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996995 (= res!667109 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30869 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30869 a!3219))))))

(declare-fun b!996996 () Bool)

(declare-fun res!667112 () Bool)

(assert (=> b!996996 (=> (not res!667112) (not e!562380))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63071 (_ BitVec 32)) Bool)

(assert (=> b!996996 (= res!667112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996997 () Bool)

(declare-fun e!562381 () Bool)

(assert (=> b!996997 (= e!562381 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun res!667113 () Bool)

(declare-fun e!562378 () Bool)

(assert (=> start!86066 (=> (not res!667113) (not e!562378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86066 (= res!667113 (validMask!0 mask!3464))))

(assert (=> start!86066 e!562378))

(declare-fun array_inv!23491 (array!63071) Bool)

(assert (=> start!86066 (array_inv!23491 a!3219)))

(assert (=> start!86066 true))

(declare-fun b!996998 () Bool)

(declare-fun res!667118 () Bool)

(assert (=> b!996998 (=> (not res!667118) (not e!562378))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996998 (= res!667118 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996999 () Bool)

(declare-fun res!667116 () Bool)

(assert (=> b!996999 (=> (not res!667116) (not e!562378))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996999 (= res!667116 (and (= (size!30869 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30869 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30869 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997000 () Bool)

(declare-fun res!667114 () Bool)

(assert (=> b!997000 (=> (not res!667114) (not e!562378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997000 (= res!667114 (validKeyInArray!0 (select (arr!30367 a!3219) j!170)))))

(declare-fun b!997001 () Bool)

(assert (=> b!997001 (= e!562380 e!562381)))

(declare-fun res!667110 () Bool)

(assert (=> b!997001 (=> (not res!667110) (not e!562381))))

(declare-datatypes ((SeekEntryResult!9299 0))(
  ( (MissingZero!9299 (index!39567 (_ BitVec 32))) (Found!9299 (index!39568 (_ BitVec 32))) (Intermediate!9299 (undefined!10111 Bool) (index!39569 (_ BitVec 32)) (x!86999 (_ BitVec 32))) (Undefined!9299) (MissingVacant!9299 (index!39570 (_ BitVec 32))) )
))
(declare-fun lt!441325 () SeekEntryResult!9299)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63071 (_ BitVec 32)) SeekEntryResult!9299)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997001 (= res!667110 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30367 a!3219) j!170) mask!3464) (select (arr!30367 a!3219) j!170) a!3219 mask!3464) lt!441325))))

(assert (=> b!997001 (= lt!441325 (Intermediate!9299 false resIndex!38 resX!38))))

(declare-fun b!997002 () Bool)

(declare-fun res!667119 () Bool)

(assert (=> b!997002 (=> (not res!667119) (not e!562381))))

(assert (=> b!997002 (= res!667119 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30367 a!3219) j!170) a!3219 mask!3464) lt!441325))))

(declare-fun b!997003 () Bool)

(declare-fun res!667111 () Bool)

(assert (=> b!997003 (=> (not res!667111) (not e!562378))))

(assert (=> b!997003 (= res!667111 (validKeyInArray!0 k!2224))))

(declare-fun b!997004 () Bool)

(declare-fun res!667117 () Bool)

(assert (=> b!997004 (=> (not res!667117) (not e!562380))))

(declare-datatypes ((List!21043 0))(
  ( (Nil!21040) (Cons!21039 (h!22204 (_ BitVec 64)) (t!30044 List!21043)) )
))
(declare-fun arrayNoDuplicates!0 (array!63071 (_ BitVec 32) List!21043) Bool)

(assert (=> b!997004 (= res!667117 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21040))))

(declare-fun b!997005 () Bool)

(assert (=> b!997005 (= e!562378 e!562380)))

(declare-fun res!667115 () Bool)

(assert (=> b!997005 (=> (not res!667115) (not e!562380))))

(declare-fun lt!441326 () SeekEntryResult!9299)

(assert (=> b!997005 (= res!667115 (or (= lt!441326 (MissingVacant!9299 i!1194)) (= lt!441326 (MissingZero!9299 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63071 (_ BitVec 32)) SeekEntryResult!9299)

(assert (=> b!997005 (= lt!441326 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86066 res!667113) b!996999))

(assert (= (and b!996999 res!667116) b!997000))

(assert (= (and b!997000 res!667114) b!997003))

(assert (= (and b!997003 res!667111) b!996998))

(assert (= (and b!996998 res!667118) b!997005))

(assert (= (and b!997005 res!667115) b!996996))

(assert (= (and b!996996 res!667112) b!997004))

(assert (= (and b!997004 res!667117) b!996995))

(assert (= (and b!996995 res!667109) b!997001))

(assert (= (and b!997001 res!667110) b!997002))

(assert (= (and b!997002 res!667119) b!996997))

(declare-fun m!923981 () Bool)

(assert (=> b!997004 m!923981))

(declare-fun m!923983 () Bool)

(assert (=> start!86066 m!923983))

(declare-fun m!923985 () Bool)

(assert (=> start!86066 m!923985))

(declare-fun m!923987 () Bool)

(assert (=> b!997000 m!923987))

(assert (=> b!997000 m!923987))

(declare-fun m!923989 () Bool)

(assert (=> b!997000 m!923989))

(declare-fun m!923991 () Bool)

(assert (=> b!997005 m!923991))

(declare-fun m!923993 () Bool)

(assert (=> b!997003 m!923993))

(assert (=> b!997001 m!923987))

(assert (=> b!997001 m!923987))

(declare-fun m!923995 () Bool)

(assert (=> b!997001 m!923995))

(assert (=> b!997001 m!923995))

(assert (=> b!997001 m!923987))

(declare-fun m!923997 () Bool)

(assert (=> b!997001 m!923997))

(assert (=> b!997002 m!923987))

(assert (=> b!997002 m!923987))

(declare-fun m!923999 () Bool)

(assert (=> b!997002 m!923999))

(declare-fun m!924001 () Bool)

(assert (=> b!996996 m!924001))

(declare-fun m!924003 () Bool)

(assert (=> b!996998 m!924003))

(push 1)

