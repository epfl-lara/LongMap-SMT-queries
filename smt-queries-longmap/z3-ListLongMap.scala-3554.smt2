; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48940 () Bool)

(assert start!48940)

(declare-fun b!539110 () Bool)

(declare-fun e!312608 () Bool)

(assert (=> b!539110 (= e!312608 false)))

(declare-fun lt!247123 () Bool)

(declare-datatypes ((array!34100 0))(
  ( (array!34101 (arr!16387 (Array (_ BitVec 32) (_ BitVec 64))) (size!16751 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34100)

(declare-datatypes ((List!10413 0))(
  ( (Nil!10410) (Cons!10409 (h!11355 (_ BitVec 64)) (t!16633 List!10413)) )
))
(declare-fun arrayNoDuplicates!0 (array!34100 (_ BitVec 32) List!10413) Bool)

(assert (=> b!539110 (= lt!247123 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10410))))

(declare-fun res!334212 () Bool)

(declare-fun e!312609 () Bool)

(assert (=> start!48940 (=> (not res!334212) (not e!312609))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48940 (= res!334212 (validMask!0 mask!3216))))

(assert (=> start!48940 e!312609))

(assert (=> start!48940 true))

(declare-fun array_inv!12246 (array!34100) Bool)

(assert (=> start!48940 (array_inv!12246 a!3154)))

(declare-fun b!539111 () Bool)

(declare-fun res!334216 () Bool)

(assert (=> b!539111 (=> (not res!334216) (not e!312608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34100 (_ BitVec 32)) Bool)

(assert (=> b!539111 (= res!334216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539112 () Bool)

(declare-fun res!334214 () Bool)

(assert (=> b!539112 (=> (not res!334214) (not e!312609))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539112 (= res!334214 (validKeyInArray!0 (select (arr!16387 a!3154) j!147)))))

(declare-fun b!539113 () Bool)

(assert (=> b!539113 (= e!312609 e!312608)))

(declare-fun res!334213 () Bool)

(assert (=> b!539113 (=> (not res!334213) (not e!312608))))

(declare-datatypes ((SeekEntryResult!4801 0))(
  ( (MissingZero!4801 (index!21428 (_ BitVec 32))) (Found!4801 (index!21429 (_ BitVec 32))) (Intermediate!4801 (undefined!5613 Bool) (index!21430 (_ BitVec 32)) (x!50499 (_ BitVec 32))) (Undefined!4801) (MissingVacant!4801 (index!21431 (_ BitVec 32))) )
))
(declare-fun lt!247122 () SeekEntryResult!4801)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539113 (= res!334213 (or (= lt!247122 (MissingZero!4801 i!1153)) (= lt!247122 (MissingVacant!4801 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34100 (_ BitVec 32)) SeekEntryResult!4801)

(assert (=> b!539113 (= lt!247122 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539114 () Bool)

(declare-fun res!334215 () Bool)

(assert (=> b!539114 (=> (not res!334215) (not e!312609))))

(assert (=> b!539114 (= res!334215 (and (= (size!16751 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16751 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16751 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539115 () Bool)

(declare-fun res!334211 () Bool)

(assert (=> b!539115 (=> (not res!334211) (not e!312609))))

(declare-fun arrayContainsKey!0 (array!34100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539115 (= res!334211 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539116 () Bool)

(declare-fun res!334210 () Bool)

(assert (=> b!539116 (=> (not res!334210) (not e!312609))))

(assert (=> b!539116 (= res!334210 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48940 res!334212) b!539114))

(assert (= (and b!539114 res!334215) b!539112))

(assert (= (and b!539112 res!334214) b!539116))

(assert (= (and b!539116 res!334210) b!539115))

(assert (= (and b!539115 res!334211) b!539113))

(assert (= (and b!539113 res!334213) b!539111))

(assert (= (and b!539111 res!334216) b!539110))

(declare-fun m!518353 () Bool)

(assert (=> b!539110 m!518353))

(declare-fun m!518355 () Bool)

(assert (=> b!539116 m!518355))

(declare-fun m!518357 () Bool)

(assert (=> b!539115 m!518357))

(declare-fun m!518359 () Bool)

(assert (=> b!539112 m!518359))

(assert (=> b!539112 m!518359))

(declare-fun m!518361 () Bool)

(assert (=> b!539112 m!518361))

(declare-fun m!518363 () Bool)

(assert (=> b!539111 m!518363))

(declare-fun m!518365 () Bool)

(assert (=> b!539113 m!518365))

(declare-fun m!518367 () Bool)

(assert (=> start!48940 m!518367))

(declare-fun m!518369 () Bool)

(assert (=> start!48940 m!518369))

(check-sat (not b!539111) (not b!539113) (not b!539112) (not b!539110) (not b!539115) (not b!539116) (not start!48940))
(check-sat)
