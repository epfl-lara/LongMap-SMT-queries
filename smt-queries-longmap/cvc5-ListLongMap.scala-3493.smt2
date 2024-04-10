; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48474 () Bool)

(assert start!48474)

(declare-fun res!327762 () Bool)

(declare-fun e!310014 () Bool)

(assert (=> start!48474 (=> (not res!327762) (not e!310014))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48474 (= res!327762 (validMask!0 mask!3216))))

(assert (=> start!48474 e!310014))

(assert (=> start!48474 true))

(declare-datatypes ((array!33737 0))(
  ( (array!33738 (arr!16209 (Array (_ BitVec 32) (_ BitVec 64))) (size!16573 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33737)

(declare-fun array_inv!12005 (array!33737) Bool)

(assert (=> start!48474 (array_inv!12005 a!3154)))

(declare-fun b!532409 () Bool)

(declare-fun res!327757 () Bool)

(declare-fun e!310013 () Bool)

(assert (=> b!532409 (=> (not res!327757) (not e!310013))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532409 (= res!327757 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16573 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16573 a!3154)) (= (select (arr!16209 a!3154) resIndex!32) (select (arr!16209 a!3154) j!147))))))

(declare-fun b!532410 () Bool)

(declare-fun res!327756 () Bool)

(assert (=> b!532410 (=> (not res!327756) (not e!310014))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532410 (= res!327756 (validKeyInArray!0 k!1998))))

(declare-fun b!532411 () Bool)

(declare-fun res!327761 () Bool)

(assert (=> b!532411 (=> (not res!327761) (not e!310013))))

(declare-datatypes ((List!10328 0))(
  ( (Nil!10325) (Cons!10324 (h!11264 (_ BitVec 64)) (t!16556 List!10328)) )
))
(declare-fun arrayNoDuplicates!0 (array!33737 (_ BitVec 32) List!10328) Bool)

(assert (=> b!532411 (= res!327761 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10325))))

(declare-fun b!532412 () Bool)

(declare-fun res!327758 () Bool)

(assert (=> b!532412 (=> (not res!327758) (not e!310013))))

(declare-datatypes ((SeekEntryResult!4667 0))(
  ( (MissingZero!4667 (index!20892 (_ BitVec 32))) (Found!4667 (index!20893 (_ BitVec 32))) (Intermediate!4667 (undefined!5479 Bool) (index!20894 (_ BitVec 32)) (x!49868 (_ BitVec 32))) (Undefined!4667) (MissingVacant!4667 (index!20895 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33737 (_ BitVec 32)) SeekEntryResult!4667)

(assert (=> b!532412 (= res!327758 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16209 a!3154) j!147) a!3154 mask!3216) (Intermediate!4667 false resIndex!32 resX!32)))))

(declare-fun b!532413 () Bool)

(declare-fun res!327759 () Bool)

(assert (=> b!532413 (=> (not res!327759) (not e!310013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33737 (_ BitVec 32)) Bool)

(assert (=> b!532413 (= res!327759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532414 () Bool)

(declare-fun res!327760 () Bool)

(assert (=> b!532414 (=> (not res!327760) (not e!310014))))

(declare-fun arrayContainsKey!0 (array!33737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532414 (= res!327760 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532415 () Bool)

(assert (=> b!532415 (= e!310014 e!310013)))

(declare-fun res!327763 () Bool)

(assert (=> b!532415 (=> (not res!327763) (not e!310013))))

(declare-fun lt!245205 () SeekEntryResult!4667)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532415 (= res!327763 (or (= lt!245205 (MissingZero!4667 i!1153)) (= lt!245205 (MissingVacant!4667 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33737 (_ BitVec 32)) SeekEntryResult!4667)

(assert (=> b!532415 (= lt!245205 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532416 () Bool)

(declare-fun res!327755 () Bool)

(assert (=> b!532416 (=> (not res!327755) (not e!310014))))

(assert (=> b!532416 (= res!327755 (validKeyInArray!0 (select (arr!16209 a!3154) j!147)))))

(declare-fun b!532417 () Bool)

(assert (=> b!532417 (= e!310013 false)))

(declare-fun lt!245206 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532417 (= lt!245206 (toIndex!0 (select (arr!16209 a!3154) j!147) mask!3216))))

(declare-fun b!532418 () Bool)

(declare-fun res!327764 () Bool)

(assert (=> b!532418 (=> (not res!327764) (not e!310014))))

(assert (=> b!532418 (= res!327764 (and (= (size!16573 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16573 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16573 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48474 res!327762) b!532418))

(assert (= (and b!532418 res!327764) b!532416))

(assert (= (and b!532416 res!327755) b!532410))

(assert (= (and b!532410 res!327756) b!532414))

(assert (= (and b!532414 res!327760) b!532415))

(assert (= (and b!532415 res!327763) b!532413))

(assert (= (and b!532413 res!327759) b!532411))

(assert (= (and b!532411 res!327761) b!532409))

(assert (= (and b!532409 res!327757) b!532412))

(assert (= (and b!532412 res!327758) b!532417))

(declare-fun m!512565 () Bool)

(assert (=> b!532409 m!512565))

(declare-fun m!512567 () Bool)

(assert (=> b!532409 m!512567))

(assert (=> b!532417 m!512567))

(assert (=> b!532417 m!512567))

(declare-fun m!512569 () Bool)

(assert (=> b!532417 m!512569))

(assert (=> b!532416 m!512567))

(assert (=> b!532416 m!512567))

(declare-fun m!512571 () Bool)

(assert (=> b!532416 m!512571))

(declare-fun m!512573 () Bool)

(assert (=> b!532415 m!512573))

(declare-fun m!512575 () Bool)

(assert (=> b!532413 m!512575))

(assert (=> b!532412 m!512567))

(assert (=> b!532412 m!512567))

(declare-fun m!512577 () Bool)

(assert (=> b!532412 m!512577))

(declare-fun m!512579 () Bool)

(assert (=> b!532410 m!512579))

(declare-fun m!512581 () Bool)

(assert (=> b!532411 m!512581))

(declare-fun m!512583 () Bool)

(assert (=> b!532414 m!512583))

(declare-fun m!512585 () Bool)

(assert (=> start!48474 m!512585))

(declare-fun m!512587 () Bool)

(assert (=> start!48474 m!512587))

(push 1)

