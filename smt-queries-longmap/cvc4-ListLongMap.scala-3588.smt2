; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49318 () Bool)

(assert start!49318)

(declare-fun b!543222 () Bool)

(declare-fun e!314229 () Bool)

(assert (=> b!543222 (= e!314229 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248119 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543222 (= lt!248119 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543223 () Bool)

(declare-fun e!314227 () Bool)

(declare-fun e!314228 () Bool)

(assert (=> b!543223 (= e!314227 e!314228)))

(declare-fun res!337780 () Bool)

(assert (=> b!543223 (=> (not res!337780) (not e!314228))))

(declare-datatypes ((SeekEntryResult!4954 0))(
  ( (MissingZero!4954 (index!22040 (_ BitVec 32))) (Found!4954 (index!22041 (_ BitVec 32))) (Intermediate!4954 (undefined!5766 Bool) (index!22042 (_ BitVec 32)) (x!50945 (_ BitVec 32))) (Undefined!4954) (MissingVacant!4954 (index!22043 (_ BitVec 32))) )
))
(declare-fun lt!248118 () SeekEntryResult!4954)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543223 (= res!337780 (or (= lt!248118 (MissingZero!4954 i!1153)) (= lt!248118 (MissingVacant!4954 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34326 0))(
  ( (array!34327 (arr!16496 (Array (_ BitVec 32) (_ BitVec 64))) (size!16860 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34326)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34326 (_ BitVec 32)) SeekEntryResult!4954)

(assert (=> b!543223 (= lt!248118 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543224 () Bool)

(declare-fun res!337781 () Bool)

(assert (=> b!543224 (=> (not res!337781) (not e!314227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543224 (= res!337781 (validKeyInArray!0 k!1998))))

(declare-fun b!543225 () Bool)

(declare-fun res!337776 () Bool)

(assert (=> b!543225 (=> (not res!337776) (not e!314228))))

(declare-datatypes ((List!10615 0))(
  ( (Nil!10612) (Cons!10611 (h!11566 (_ BitVec 64)) (t!16843 List!10615)) )
))
(declare-fun arrayNoDuplicates!0 (array!34326 (_ BitVec 32) List!10615) Bool)

(assert (=> b!543225 (= res!337776 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10612))))

(declare-fun res!337775 () Bool)

(assert (=> start!49318 (=> (not res!337775) (not e!314227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49318 (= res!337775 (validMask!0 mask!3216))))

(assert (=> start!49318 e!314227))

(assert (=> start!49318 true))

(declare-fun array_inv!12292 (array!34326) Bool)

(assert (=> start!49318 (array_inv!12292 a!3154)))

(declare-fun b!543226 () Bool)

(declare-fun res!337783 () Bool)

(assert (=> b!543226 (=> (not res!337783) (not e!314227))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!543226 (= res!337783 (validKeyInArray!0 (select (arr!16496 a!3154) j!147)))))

(declare-fun b!543227 () Bool)

(declare-fun res!337782 () Bool)

(assert (=> b!543227 (=> (not res!337782) (not e!314228))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543227 (= res!337782 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16860 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16860 a!3154)) (= (select (arr!16496 a!3154) resIndex!32) (select (arr!16496 a!3154) j!147))))))

(declare-fun b!543228 () Bool)

(declare-fun res!337784 () Bool)

(assert (=> b!543228 (=> (not res!337784) (not e!314229))))

(declare-fun lt!248117 () SeekEntryResult!4954)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34326 (_ BitVec 32)) SeekEntryResult!4954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543228 (= res!337784 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16496 a!3154) j!147) mask!3216) (select (arr!16496 a!3154) j!147) a!3154 mask!3216) lt!248117))))

(declare-fun b!543229 () Bool)

(declare-fun res!337777 () Bool)

(assert (=> b!543229 (=> (not res!337777) (not e!314228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34326 (_ BitVec 32)) Bool)

(assert (=> b!543229 (= res!337777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543230 () Bool)

(declare-fun res!337779 () Bool)

(assert (=> b!543230 (=> (not res!337779) (not e!314229))))

(assert (=> b!543230 (= res!337779 (and (not (= (select (arr!16496 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16496 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16496 a!3154) index!1177) (select (arr!16496 a!3154) j!147)))))))

(declare-fun b!543231 () Bool)

(assert (=> b!543231 (= e!314228 e!314229)))

(declare-fun res!337774 () Bool)

(assert (=> b!543231 (=> (not res!337774) (not e!314229))))

(assert (=> b!543231 (= res!337774 (= lt!248117 (Intermediate!4954 false resIndex!32 resX!32)))))

(assert (=> b!543231 (= lt!248117 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16496 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543232 () Bool)

(declare-fun res!337778 () Bool)

(assert (=> b!543232 (=> (not res!337778) (not e!314227))))

(declare-fun arrayContainsKey!0 (array!34326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543232 (= res!337778 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543233 () Bool)

(declare-fun res!337773 () Bool)

(assert (=> b!543233 (=> (not res!337773) (not e!314227))))

(assert (=> b!543233 (= res!337773 (and (= (size!16860 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16860 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16860 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49318 res!337775) b!543233))

(assert (= (and b!543233 res!337773) b!543226))

(assert (= (and b!543226 res!337783) b!543224))

(assert (= (and b!543224 res!337781) b!543232))

(assert (= (and b!543232 res!337778) b!543223))

(assert (= (and b!543223 res!337780) b!543229))

(assert (= (and b!543229 res!337777) b!543225))

(assert (= (and b!543225 res!337776) b!543227))

(assert (= (and b!543227 res!337782) b!543231))

(assert (= (and b!543231 res!337774) b!543228))

(assert (= (and b!543228 res!337784) b!543230))

(assert (= (and b!543230 res!337779) b!543222))

(declare-fun m!521349 () Bool)

(assert (=> b!543231 m!521349))

(assert (=> b!543231 m!521349))

(declare-fun m!521351 () Bool)

(assert (=> b!543231 m!521351))

(declare-fun m!521353 () Bool)

(assert (=> b!543230 m!521353))

(assert (=> b!543230 m!521349))

(declare-fun m!521355 () Bool)

(assert (=> b!543229 m!521355))

(declare-fun m!521357 () Bool)

(assert (=> b!543223 m!521357))

(assert (=> b!543228 m!521349))

(assert (=> b!543228 m!521349))

(declare-fun m!521359 () Bool)

(assert (=> b!543228 m!521359))

(assert (=> b!543228 m!521359))

(assert (=> b!543228 m!521349))

(declare-fun m!521361 () Bool)

(assert (=> b!543228 m!521361))

(declare-fun m!521363 () Bool)

(assert (=> b!543225 m!521363))

(declare-fun m!521365 () Bool)

(assert (=> b!543232 m!521365))

(declare-fun m!521367 () Bool)

(assert (=> b!543227 m!521367))

(assert (=> b!543227 m!521349))

(declare-fun m!521369 () Bool)

(assert (=> start!49318 m!521369))

(declare-fun m!521371 () Bool)

(assert (=> start!49318 m!521371))

(assert (=> b!543226 m!521349))

(assert (=> b!543226 m!521349))

(declare-fun m!521373 () Bool)

(assert (=> b!543226 m!521373))

(declare-fun m!521375 () Bool)

(assert (=> b!543222 m!521375))

(declare-fun m!521377 () Bool)

(assert (=> b!543224 m!521377))

(push 1)

(assert (not b!543222))

(assert (not start!49318))

(assert (not b!543229))

(assert (not b!543225))

