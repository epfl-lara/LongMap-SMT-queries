; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49328 () Bool)

(assert start!49328)

(declare-fun b!543402 () Bool)

(declare-fun res!337956 () Bool)

(declare-fun e!314289 () Bool)

(assert (=> b!543402 (=> (not res!337956) (not e!314289))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34336 0))(
  ( (array!34337 (arr!16501 (Array (_ BitVec 32) (_ BitVec 64))) (size!16865 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34336)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543402 (= res!337956 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16865 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16865 a!3154)) (= (select (arr!16501 a!3154) resIndex!32) (select (arr!16501 a!3154) j!147))))))

(declare-fun b!543403 () Bool)

(declare-fun res!337962 () Bool)

(declare-fun e!314288 () Bool)

(assert (=> b!543403 (=> (not res!337962) (not e!314288))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543403 (= res!337962 (validKeyInArray!0 k0!1998))))

(declare-fun res!337960 () Bool)

(assert (=> start!49328 (=> (not res!337960) (not e!314288))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49328 (= res!337960 (validMask!0 mask!3216))))

(assert (=> start!49328 e!314288))

(assert (=> start!49328 true))

(declare-fun array_inv!12297 (array!34336) Bool)

(assert (=> start!49328 (array_inv!12297 a!3154)))

(declare-fun b!543404 () Bool)

(declare-fun res!337954 () Bool)

(assert (=> b!543404 (=> (not res!337954) (not e!314288))))

(assert (=> b!543404 (= res!337954 (validKeyInArray!0 (select (arr!16501 a!3154) j!147)))))

(declare-fun b!543405 () Bool)

(declare-fun e!314287 () Bool)

(assert (=> b!543405 (= e!314289 e!314287)))

(declare-fun res!337957 () Bool)

(assert (=> b!543405 (=> (not res!337957) (not e!314287))))

(declare-datatypes ((SeekEntryResult!4959 0))(
  ( (MissingZero!4959 (index!22060 (_ BitVec 32))) (Found!4959 (index!22061 (_ BitVec 32))) (Intermediate!4959 (undefined!5771 Bool) (index!22062 (_ BitVec 32)) (x!50966 (_ BitVec 32))) (Undefined!4959) (MissingVacant!4959 (index!22063 (_ BitVec 32))) )
))
(declare-fun lt!248162 () SeekEntryResult!4959)

(assert (=> b!543405 (= res!337957 (= lt!248162 (Intermediate!4959 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34336 (_ BitVec 32)) SeekEntryResult!4959)

(assert (=> b!543405 (= lt!248162 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16501 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543406 () Bool)

(declare-fun res!337953 () Bool)

(assert (=> b!543406 (=> (not res!337953) (not e!314288))))

(declare-fun arrayContainsKey!0 (array!34336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543406 (= res!337953 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543407 () Bool)

(declare-fun res!337961 () Bool)

(assert (=> b!543407 (=> (not res!337961) (not e!314289))))

(declare-datatypes ((List!10620 0))(
  ( (Nil!10617) (Cons!10616 (h!11571 (_ BitVec 64)) (t!16848 List!10620)) )
))
(declare-fun arrayNoDuplicates!0 (array!34336 (_ BitVec 32) List!10620) Bool)

(assert (=> b!543407 (= res!337961 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10617))))

(declare-fun b!543408 () Bool)

(declare-fun res!337963 () Bool)

(assert (=> b!543408 (=> (not res!337963) (not e!314287))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543408 (= res!337963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16501 a!3154) j!147) mask!3216) (select (arr!16501 a!3154) j!147) a!3154 mask!3216) lt!248162))))

(declare-fun b!543409 () Bool)

(assert (=> b!543409 (= e!314287 false)))

(declare-fun lt!248163 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543409 (= lt!248163 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543410 () Bool)

(assert (=> b!543410 (= e!314288 e!314289)))

(declare-fun res!337959 () Bool)

(assert (=> b!543410 (=> (not res!337959) (not e!314289))))

(declare-fun lt!248164 () SeekEntryResult!4959)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543410 (= res!337959 (or (= lt!248164 (MissingZero!4959 i!1153)) (= lt!248164 (MissingVacant!4959 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34336 (_ BitVec 32)) SeekEntryResult!4959)

(assert (=> b!543410 (= lt!248164 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543411 () Bool)

(declare-fun res!337955 () Bool)

(assert (=> b!543411 (=> (not res!337955) (not e!314287))))

(assert (=> b!543411 (= res!337955 (and (not (= (select (arr!16501 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16501 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16501 a!3154) index!1177) (select (arr!16501 a!3154) j!147)))))))

(declare-fun b!543412 () Bool)

(declare-fun res!337958 () Bool)

(assert (=> b!543412 (=> (not res!337958) (not e!314289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34336 (_ BitVec 32)) Bool)

(assert (=> b!543412 (= res!337958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543413 () Bool)

(declare-fun res!337964 () Bool)

(assert (=> b!543413 (=> (not res!337964) (not e!314288))))

(assert (=> b!543413 (= res!337964 (and (= (size!16865 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16865 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16865 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49328 res!337960) b!543413))

(assert (= (and b!543413 res!337964) b!543404))

(assert (= (and b!543404 res!337954) b!543403))

(assert (= (and b!543403 res!337962) b!543406))

(assert (= (and b!543406 res!337953) b!543410))

(assert (= (and b!543410 res!337959) b!543412))

(assert (= (and b!543412 res!337958) b!543407))

(assert (= (and b!543407 res!337961) b!543402))

(assert (= (and b!543402 res!337956) b!543405))

(assert (= (and b!543405 res!337957) b!543408))

(assert (= (and b!543408 res!337963) b!543411))

(assert (= (and b!543411 res!337955) b!543409))

(declare-fun m!521499 () Bool)

(assert (=> b!543412 m!521499))

(declare-fun m!521501 () Bool)

(assert (=> start!49328 m!521501))

(declare-fun m!521503 () Bool)

(assert (=> start!49328 m!521503))

(declare-fun m!521505 () Bool)

(assert (=> b!543403 m!521505))

(declare-fun m!521507 () Bool)

(assert (=> b!543404 m!521507))

(assert (=> b!543404 m!521507))

(declare-fun m!521509 () Bool)

(assert (=> b!543404 m!521509))

(declare-fun m!521511 () Bool)

(assert (=> b!543402 m!521511))

(assert (=> b!543402 m!521507))

(declare-fun m!521513 () Bool)

(assert (=> b!543409 m!521513))

(assert (=> b!543405 m!521507))

(assert (=> b!543405 m!521507))

(declare-fun m!521515 () Bool)

(assert (=> b!543405 m!521515))

(declare-fun m!521517 () Bool)

(assert (=> b!543407 m!521517))

(declare-fun m!521519 () Bool)

(assert (=> b!543410 m!521519))

(declare-fun m!521521 () Bool)

(assert (=> b!543411 m!521521))

(assert (=> b!543411 m!521507))

(declare-fun m!521523 () Bool)

(assert (=> b!543406 m!521523))

(assert (=> b!543408 m!521507))

(assert (=> b!543408 m!521507))

(declare-fun m!521525 () Bool)

(assert (=> b!543408 m!521525))

(assert (=> b!543408 m!521525))

(assert (=> b!543408 m!521507))

(declare-fun m!521527 () Bool)

(assert (=> b!543408 m!521527))

(check-sat (not b!543408) (not b!543412) (not start!49328) (not b!543403) (not b!543410) (not b!543405) (not b!543409) (not b!543404) (not b!543407) (not b!543406))
(check-sat)
