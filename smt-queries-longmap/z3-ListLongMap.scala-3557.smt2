; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48914 () Bool)

(assert start!48914)

(declare-fun b!539130 () Bool)

(declare-fun res!334339 () Bool)

(declare-fun e!312569 () Bool)

(assert (=> b!539130 (=> (not res!334339) (not e!312569))))

(declare-datatypes ((array!34126 0))(
  ( (array!34127 (arr!16402 (Array (_ BitVec 32) (_ BitVec 64))) (size!16766 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34126)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539130 (= res!334339 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539131 () Bool)

(declare-fun e!312568 () Bool)

(assert (=> b!539131 (= e!312568 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4860 0))(
  ( (MissingZero!4860 (index!21664 (_ BitVec 32))) (Found!4860 (index!21665 (_ BitVec 32))) (Intermediate!4860 (undefined!5672 Bool) (index!21666 (_ BitVec 32)) (x!50579 (_ BitVec 32))) (Undefined!4860) (MissingVacant!4860 (index!21667 (_ BitVec 32))) )
))
(declare-fun lt!247075 () SeekEntryResult!4860)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34126 (_ BitVec 32)) SeekEntryResult!4860)

(assert (=> b!539131 (= lt!247075 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16402 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539132 () Bool)

(declare-fun res!334337 () Bool)

(assert (=> b!539132 (=> (not res!334337) (not e!312568))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539132 (= res!334337 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16766 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16766 a!3154)) (= (select (arr!16402 a!3154) resIndex!32) (select (arr!16402 a!3154) j!147))))))

(declare-fun b!539133 () Bool)

(declare-fun res!334340 () Bool)

(assert (=> b!539133 (=> (not res!334340) (not e!312569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539133 (= res!334340 (validKeyInArray!0 (select (arr!16402 a!3154) j!147)))))

(declare-fun b!539134 () Bool)

(declare-fun res!334336 () Bool)

(assert (=> b!539134 (=> (not res!334336) (not e!312568))))

(declare-datatypes ((List!10521 0))(
  ( (Nil!10518) (Cons!10517 (h!11460 (_ BitVec 64)) (t!16749 List!10521)) )
))
(declare-fun arrayNoDuplicates!0 (array!34126 (_ BitVec 32) List!10521) Bool)

(assert (=> b!539134 (= res!334336 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10518))))

(declare-fun res!334343 () Bool)

(assert (=> start!48914 (=> (not res!334343) (not e!312569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48914 (= res!334343 (validMask!0 mask!3216))))

(assert (=> start!48914 e!312569))

(assert (=> start!48914 true))

(declare-fun array_inv!12198 (array!34126) Bool)

(assert (=> start!48914 (array_inv!12198 a!3154)))

(declare-fun b!539135 () Bool)

(declare-fun res!334341 () Bool)

(assert (=> b!539135 (=> (not res!334341) (not e!312568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34126 (_ BitVec 32)) Bool)

(assert (=> b!539135 (= res!334341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539136 () Bool)

(assert (=> b!539136 (= e!312569 e!312568)))

(declare-fun res!334335 () Bool)

(assert (=> b!539136 (=> (not res!334335) (not e!312568))))

(declare-fun lt!247074 () SeekEntryResult!4860)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539136 (= res!334335 (or (= lt!247074 (MissingZero!4860 i!1153)) (= lt!247074 (MissingVacant!4860 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34126 (_ BitVec 32)) SeekEntryResult!4860)

(assert (=> b!539136 (= lt!247074 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539137 () Bool)

(declare-fun res!334338 () Bool)

(assert (=> b!539137 (=> (not res!334338) (not e!312569))))

(assert (=> b!539137 (= res!334338 (and (= (size!16766 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16766 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16766 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539138 () Bool)

(declare-fun res!334342 () Bool)

(assert (=> b!539138 (=> (not res!334342) (not e!312569))))

(assert (=> b!539138 (= res!334342 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48914 res!334343) b!539137))

(assert (= (and b!539137 res!334338) b!539133))

(assert (= (and b!539133 res!334340) b!539138))

(assert (= (and b!539138 res!334342) b!539130))

(assert (= (and b!539130 res!334339) b!539136))

(assert (= (and b!539136 res!334335) b!539135))

(assert (= (and b!539135 res!334341) b!539134))

(assert (= (and b!539134 res!334336) b!539132))

(assert (= (and b!539132 res!334337) b!539131))

(declare-fun m!518215 () Bool)

(assert (=> b!539135 m!518215))

(declare-fun m!518217 () Bool)

(assert (=> b!539138 m!518217))

(declare-fun m!518219 () Bool)

(assert (=> b!539131 m!518219))

(assert (=> b!539131 m!518219))

(declare-fun m!518221 () Bool)

(assert (=> b!539131 m!518221))

(declare-fun m!518223 () Bool)

(assert (=> start!48914 m!518223))

(declare-fun m!518225 () Bool)

(assert (=> start!48914 m!518225))

(declare-fun m!518227 () Bool)

(assert (=> b!539132 m!518227))

(assert (=> b!539132 m!518219))

(declare-fun m!518229 () Bool)

(assert (=> b!539134 m!518229))

(declare-fun m!518231 () Bool)

(assert (=> b!539136 m!518231))

(assert (=> b!539133 m!518219))

(assert (=> b!539133 m!518219))

(declare-fun m!518233 () Bool)

(assert (=> b!539133 m!518233))

(declare-fun m!518235 () Bool)

(assert (=> b!539130 m!518235))

(check-sat (not b!539134) (not b!539136) (not b!539130) (not b!539138) (not b!539133) (not start!48914) (not b!539135) (not b!539131))
(check-sat)
