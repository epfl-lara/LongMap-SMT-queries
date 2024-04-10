; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86426 () Bool)

(assert start!86426)

(declare-fun b!1000424 () Bool)

(declare-fun e!563887 () Bool)

(assert (=> b!1000424 (= e!563887 false)))

(declare-datatypes ((array!63227 0))(
  ( (array!63228 (arr!30439 (Array (_ BitVec 32) (_ BitVec 64))) (size!30941 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63227)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9371 0))(
  ( (MissingZero!9371 (index!39855 (_ BitVec 32))) (Found!9371 (index!39856 (_ BitVec 32))) (Intermediate!9371 (undefined!10183 Bool) (index!39857 (_ BitVec 32)) (x!87287 (_ BitVec 32))) (Undefined!9371) (MissingVacant!9371 (index!39858 (_ BitVec 32))) )
))
(declare-fun lt!442284 () SeekEntryResult!9371)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63227 (_ BitVec 32)) SeekEntryResult!9371)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000424 (= lt!442284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30439 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30439 a!3219) i!1194 k!2224) j!170) (array!63228 (store (arr!30439 a!3219) i!1194 k!2224) (size!30941 a!3219)) mask!3464))))

(declare-fun b!1000425 () Bool)

(declare-fun res!669909 () Bool)

(declare-fun e!563888 () Bool)

(assert (=> b!1000425 (=> (not res!669909) (not e!563888))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000425 (= res!669909 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30941 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30941 a!3219))))))

(declare-fun b!1000426 () Bool)

(declare-fun res!669906 () Bool)

(declare-fun e!563889 () Bool)

(assert (=> b!1000426 (=> (not res!669906) (not e!563889))))

(declare-fun arrayContainsKey!0 (array!63227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000426 (= res!669906 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000427 () Bool)

(declare-fun res!669902 () Bool)

(assert (=> b!1000427 (=> (not res!669902) (not e!563888))))

(declare-datatypes ((List!21115 0))(
  ( (Nil!21112) (Cons!21111 (h!22288 (_ BitVec 64)) (t!30116 List!21115)) )
))
(declare-fun arrayNoDuplicates!0 (array!63227 (_ BitVec 32) List!21115) Bool)

(assert (=> b!1000427 (= res!669902 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21112))))

(declare-fun b!1000428 () Bool)

(declare-fun res!669907 () Bool)

(assert (=> b!1000428 (=> (not res!669907) (not e!563887))))

(declare-fun lt!442285 () SeekEntryResult!9371)

(assert (=> b!1000428 (= res!669907 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30439 a!3219) j!170) a!3219 mask!3464) lt!442285))))

(declare-fun b!1000429 () Bool)

(declare-fun res!669904 () Bool)

(assert (=> b!1000429 (=> (not res!669904) (not e!563889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000429 (= res!669904 (validKeyInArray!0 k!2224))))

(declare-fun b!1000430 () Bool)

(declare-fun res!669911 () Bool)

(assert (=> b!1000430 (=> (not res!669911) (not e!563889))))

(assert (=> b!1000430 (= res!669911 (and (= (size!30941 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30941 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30941 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000431 () Bool)

(declare-fun res!669910 () Bool)

(assert (=> b!1000431 (=> (not res!669910) (not e!563889))))

(assert (=> b!1000431 (= res!669910 (validKeyInArray!0 (select (arr!30439 a!3219) j!170)))))

(declare-fun b!1000432 () Bool)

(assert (=> b!1000432 (= e!563889 e!563888)))

(declare-fun res!669912 () Bool)

(assert (=> b!1000432 (=> (not res!669912) (not e!563888))))

(declare-fun lt!442286 () SeekEntryResult!9371)

(assert (=> b!1000432 (= res!669912 (or (= lt!442286 (MissingVacant!9371 i!1194)) (= lt!442286 (MissingZero!9371 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63227 (_ BitVec 32)) SeekEntryResult!9371)

(assert (=> b!1000432 (= lt!442286 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!669908 () Bool)

(assert (=> start!86426 (=> (not res!669908) (not e!563889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86426 (= res!669908 (validMask!0 mask!3464))))

(assert (=> start!86426 e!563889))

(declare-fun array_inv!23563 (array!63227) Bool)

(assert (=> start!86426 (array_inv!23563 a!3219)))

(assert (=> start!86426 true))

(declare-fun b!1000433 () Bool)

(assert (=> b!1000433 (= e!563888 e!563887)))

(declare-fun res!669903 () Bool)

(assert (=> b!1000433 (=> (not res!669903) (not e!563887))))

(assert (=> b!1000433 (= res!669903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30439 a!3219) j!170) mask!3464) (select (arr!30439 a!3219) j!170) a!3219 mask!3464) lt!442285))))

(assert (=> b!1000433 (= lt!442285 (Intermediate!9371 false resIndex!38 resX!38))))

(declare-fun b!1000434 () Bool)

(declare-fun res!669905 () Bool)

(assert (=> b!1000434 (=> (not res!669905) (not e!563888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63227 (_ BitVec 32)) Bool)

(assert (=> b!1000434 (= res!669905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86426 res!669908) b!1000430))

(assert (= (and b!1000430 res!669911) b!1000431))

(assert (= (and b!1000431 res!669910) b!1000429))

(assert (= (and b!1000429 res!669904) b!1000426))

(assert (= (and b!1000426 res!669906) b!1000432))

(assert (= (and b!1000432 res!669912) b!1000434))

(assert (= (and b!1000434 res!669905) b!1000427))

(assert (= (and b!1000427 res!669902) b!1000425))

(assert (= (and b!1000425 res!669909) b!1000433))

(assert (= (and b!1000433 res!669903) b!1000428))

(assert (= (and b!1000428 res!669907) b!1000424))

(declare-fun m!926591 () Bool)

(assert (=> b!1000433 m!926591))

(assert (=> b!1000433 m!926591))

(declare-fun m!926593 () Bool)

(assert (=> b!1000433 m!926593))

(assert (=> b!1000433 m!926593))

(assert (=> b!1000433 m!926591))

(declare-fun m!926595 () Bool)

(assert (=> b!1000433 m!926595))

(declare-fun m!926597 () Bool)

(assert (=> b!1000434 m!926597))

(declare-fun m!926599 () Bool)

(assert (=> b!1000424 m!926599))

(declare-fun m!926601 () Bool)

(assert (=> b!1000424 m!926601))

(assert (=> b!1000424 m!926601))

(declare-fun m!926603 () Bool)

(assert (=> b!1000424 m!926603))

(assert (=> b!1000424 m!926603))

(assert (=> b!1000424 m!926601))

(declare-fun m!926605 () Bool)

(assert (=> b!1000424 m!926605))

(assert (=> b!1000431 m!926591))

(assert (=> b!1000431 m!926591))

(declare-fun m!926607 () Bool)

(assert (=> b!1000431 m!926607))

(declare-fun m!926609 () Bool)

(assert (=> b!1000432 m!926609))

(declare-fun m!926611 () Bool)

(assert (=> b!1000427 m!926611))

(declare-fun m!926613 () Bool)

(assert (=> b!1000429 m!926613))

(assert (=> b!1000428 m!926591))

(assert (=> b!1000428 m!926591))

(declare-fun m!926615 () Bool)

(assert (=> b!1000428 m!926615))

(declare-fun m!926617 () Bool)

(assert (=> b!1000426 m!926617))

(declare-fun m!926619 () Bool)

(assert (=> start!86426 m!926619))

(declare-fun m!926621 () Bool)

(assert (=> start!86426 m!926621))

(push 1)

