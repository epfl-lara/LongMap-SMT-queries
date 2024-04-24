; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48946 () Bool)

(assert start!48946)

(declare-fun b!539173 () Bool)

(declare-fun res!334277 () Bool)

(declare-fun e!312636 () Bool)

(assert (=> b!539173 (=> (not res!334277) (not e!312636))))

(declare-datatypes ((array!34106 0))(
  ( (array!34107 (arr!16390 (Array (_ BitVec 32) (_ BitVec 64))) (size!16754 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34106)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34106 (_ BitVec 32)) Bool)

(assert (=> b!539173 (= res!334277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539174 () Bool)

(declare-fun res!334274 () Bool)

(declare-fun e!312635 () Bool)

(assert (=> b!539174 (=> (not res!334274) (not e!312635))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539174 (= res!334274 (validKeyInArray!0 (select (arr!16390 a!3154) j!147)))))

(declare-fun b!539175 () Bool)

(declare-fun res!334279 () Bool)

(assert (=> b!539175 (=> (not res!334279) (not e!312635))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539175 (= res!334279 (and (= (size!16754 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16754 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16754 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!334276 () Bool)

(assert (=> start!48946 (=> (not res!334276) (not e!312635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48946 (= res!334276 (validMask!0 mask!3216))))

(assert (=> start!48946 e!312635))

(assert (=> start!48946 true))

(declare-fun array_inv!12249 (array!34106) Bool)

(assert (=> start!48946 (array_inv!12249 a!3154)))

(declare-fun b!539176 () Bool)

(assert (=> b!539176 (= e!312635 e!312636)))

(declare-fun res!334278 () Bool)

(assert (=> b!539176 (=> (not res!334278) (not e!312636))))

(declare-datatypes ((SeekEntryResult!4804 0))(
  ( (MissingZero!4804 (index!21440 (_ BitVec 32))) (Found!4804 (index!21441 (_ BitVec 32))) (Intermediate!4804 (undefined!5616 Bool) (index!21442 (_ BitVec 32)) (x!50510 (_ BitVec 32))) (Undefined!4804) (MissingVacant!4804 (index!21443 (_ BitVec 32))) )
))
(declare-fun lt!247141 () SeekEntryResult!4804)

(assert (=> b!539176 (= res!334278 (or (= lt!247141 (MissingZero!4804 i!1153)) (= lt!247141 (MissingVacant!4804 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34106 (_ BitVec 32)) SeekEntryResult!4804)

(assert (=> b!539176 (= lt!247141 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539177 () Bool)

(assert (=> b!539177 (= e!312636 false)))

(declare-fun lt!247140 () Bool)

(declare-datatypes ((List!10416 0))(
  ( (Nil!10413) (Cons!10412 (h!11358 (_ BitVec 64)) (t!16636 List!10416)) )
))
(declare-fun arrayNoDuplicates!0 (array!34106 (_ BitVec 32) List!10416) Bool)

(assert (=> b!539177 (= lt!247140 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10413))))

(declare-fun b!539178 () Bool)

(declare-fun res!334273 () Bool)

(assert (=> b!539178 (=> (not res!334273) (not e!312635))))

(declare-fun arrayContainsKey!0 (array!34106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539178 (= res!334273 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539179 () Bool)

(declare-fun res!334275 () Bool)

(assert (=> b!539179 (=> (not res!334275) (not e!312635))))

(assert (=> b!539179 (= res!334275 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48946 res!334276) b!539175))

(assert (= (and b!539175 res!334279) b!539174))

(assert (= (and b!539174 res!334274) b!539179))

(assert (= (and b!539179 res!334275) b!539178))

(assert (= (and b!539178 res!334273) b!539176))

(assert (= (and b!539176 res!334278) b!539173))

(assert (= (and b!539173 res!334277) b!539177))

(declare-fun m!518407 () Bool)

(assert (=> b!539179 m!518407))

(declare-fun m!518409 () Bool)

(assert (=> start!48946 m!518409))

(declare-fun m!518411 () Bool)

(assert (=> start!48946 m!518411))

(declare-fun m!518413 () Bool)

(assert (=> b!539178 m!518413))

(declare-fun m!518415 () Bool)

(assert (=> b!539173 m!518415))

(declare-fun m!518417 () Bool)

(assert (=> b!539174 m!518417))

(assert (=> b!539174 m!518417))

(declare-fun m!518419 () Bool)

(assert (=> b!539174 m!518419))

(declare-fun m!518421 () Bool)

(assert (=> b!539176 m!518421))

(declare-fun m!518423 () Bool)

(assert (=> b!539177 m!518423))

(check-sat (not b!539178) (not b!539179) (not start!48946) (not b!539174) (not b!539173) (not b!539177) (not b!539176))
(check-sat)
