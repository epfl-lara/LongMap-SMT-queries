; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49342 () Bool)

(assert start!49342)

(declare-fun b!543026 () Bool)

(declare-fun res!337482 () Bool)

(declare-fun e!314223 () Bool)

(assert (=> b!543026 (=> (not res!337482) (not e!314223))))

(declare-datatypes ((array!34298 0))(
  ( (array!34299 (arr!16480 (Array (_ BitVec 32) (_ BitVec 64))) (size!16844 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34298)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34298 (_ BitVec 32)) Bool)

(assert (=> b!543026 (= res!337482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543027 () Bool)

(declare-fun res!337475 () Bool)

(declare-fun e!314224 () Bool)

(assert (=> b!543027 (=> (not res!337475) (not e!314224))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543027 (= res!337475 (and (= (size!16844 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16844 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16844 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543028 () Bool)

(declare-fun res!337483 () Bool)

(assert (=> b!543028 (=> (not res!337483) (not e!314224))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543028 (= res!337483 (validKeyInArray!0 k0!1998))))

(declare-fun res!337472 () Bool)

(assert (=> start!49342 (=> (not res!337472) (not e!314224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49342 (= res!337472 (validMask!0 mask!3216))))

(assert (=> start!49342 e!314224))

(assert (=> start!49342 true))

(declare-fun array_inv!12339 (array!34298) Bool)

(assert (=> start!49342 (array_inv!12339 a!3154)))

(declare-fun b!543029 () Bool)

(declare-fun e!314225 () Bool)

(assert (=> b!543029 (= e!314225 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248128 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543029 (= lt!248128 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!543030 () Bool)

(declare-fun res!337480 () Bool)

(assert (=> b!543030 (=> (not res!337480) (not e!314223))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543030 (= res!337480 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16844 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16844 a!3154)) (= (select (arr!16480 a!3154) resIndex!32) (select (arr!16480 a!3154) j!147))))))

(declare-fun b!543031 () Bool)

(declare-fun res!337478 () Bool)

(assert (=> b!543031 (=> (not res!337478) (not e!314225))))

(assert (=> b!543031 (= res!337478 (and (not (= (select (arr!16480 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16480 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16480 a!3154) index!1177) (select (arr!16480 a!3154) j!147)))))))

(declare-fun b!543032 () Bool)

(declare-fun res!337476 () Bool)

(assert (=> b!543032 (=> (not res!337476) (not e!314225))))

(declare-datatypes ((SeekEntryResult!4894 0))(
  ( (MissingZero!4894 (index!21800 (_ BitVec 32))) (Found!4894 (index!21801 (_ BitVec 32))) (Intermediate!4894 (undefined!5706 Bool) (index!21802 (_ BitVec 32)) (x!50864 (_ BitVec 32))) (Undefined!4894) (MissingVacant!4894 (index!21803 (_ BitVec 32))) )
))
(declare-fun lt!248127 () SeekEntryResult!4894)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34298 (_ BitVec 32)) SeekEntryResult!4894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543032 (= res!337476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16480 a!3154) j!147) mask!3216) (select (arr!16480 a!3154) j!147) a!3154 mask!3216) lt!248127))))

(declare-fun b!543033 () Bool)

(assert (=> b!543033 (= e!314224 e!314223)))

(declare-fun res!337474 () Bool)

(assert (=> b!543033 (=> (not res!337474) (not e!314223))))

(declare-fun lt!248126 () SeekEntryResult!4894)

(assert (=> b!543033 (= res!337474 (or (= lt!248126 (MissingZero!4894 i!1153)) (= lt!248126 (MissingVacant!4894 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34298 (_ BitVec 32)) SeekEntryResult!4894)

(assert (=> b!543033 (= lt!248126 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543034 () Bool)

(declare-fun res!337473 () Bool)

(assert (=> b!543034 (=> (not res!337473) (not e!314224))))

(declare-fun arrayContainsKey!0 (array!34298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543034 (= res!337473 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543035 () Bool)

(declare-fun res!337479 () Bool)

(assert (=> b!543035 (=> (not res!337479) (not e!314223))))

(declare-datatypes ((List!10506 0))(
  ( (Nil!10503) (Cons!10502 (h!11460 (_ BitVec 64)) (t!16726 List!10506)) )
))
(declare-fun arrayNoDuplicates!0 (array!34298 (_ BitVec 32) List!10506) Bool)

(assert (=> b!543035 (= res!337479 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10503))))

(declare-fun b!543036 () Bool)

(declare-fun res!337477 () Bool)

(assert (=> b!543036 (=> (not res!337477) (not e!314224))))

(assert (=> b!543036 (= res!337477 (validKeyInArray!0 (select (arr!16480 a!3154) j!147)))))

(declare-fun b!543037 () Bool)

(assert (=> b!543037 (= e!314223 e!314225)))

(declare-fun res!337481 () Bool)

(assert (=> b!543037 (=> (not res!337481) (not e!314225))))

(assert (=> b!543037 (= res!337481 (= lt!248127 (Intermediate!4894 false resIndex!32 resX!32)))))

(assert (=> b!543037 (= lt!248127 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16480 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49342 res!337472) b!543027))

(assert (= (and b!543027 res!337475) b!543036))

(assert (= (and b!543036 res!337477) b!543028))

(assert (= (and b!543028 res!337483) b!543034))

(assert (= (and b!543034 res!337473) b!543033))

(assert (= (and b!543033 res!337474) b!543026))

(assert (= (and b!543026 res!337482) b!543035))

(assert (= (and b!543035 res!337479) b!543030))

(assert (= (and b!543030 res!337480) b!543037))

(assert (= (and b!543037 res!337481) b!543032))

(assert (= (and b!543032 res!337476) b!543031))

(assert (= (and b!543031 res!337478) b!543029))

(declare-fun m!521341 () Bool)

(assert (=> b!543034 m!521341))

(declare-fun m!521343 () Bool)

(assert (=> b!543029 m!521343))

(declare-fun m!521345 () Bool)

(assert (=> start!49342 m!521345))

(declare-fun m!521347 () Bool)

(assert (=> start!49342 m!521347))

(declare-fun m!521349 () Bool)

(assert (=> b!543032 m!521349))

(assert (=> b!543032 m!521349))

(declare-fun m!521351 () Bool)

(assert (=> b!543032 m!521351))

(assert (=> b!543032 m!521351))

(assert (=> b!543032 m!521349))

(declare-fun m!521353 () Bool)

(assert (=> b!543032 m!521353))

(declare-fun m!521355 () Bool)

(assert (=> b!543033 m!521355))

(declare-fun m!521357 () Bool)

(assert (=> b!543030 m!521357))

(assert (=> b!543030 m!521349))

(declare-fun m!521359 () Bool)

(assert (=> b!543028 m!521359))

(declare-fun m!521361 () Bool)

(assert (=> b!543035 m!521361))

(declare-fun m!521363 () Bool)

(assert (=> b!543026 m!521363))

(declare-fun m!521365 () Bool)

(assert (=> b!543031 m!521365))

(assert (=> b!543031 m!521349))

(assert (=> b!543037 m!521349))

(assert (=> b!543037 m!521349))

(declare-fun m!521367 () Bool)

(assert (=> b!543037 m!521367))

(assert (=> b!543036 m!521349))

(assert (=> b!543036 m!521349))

(declare-fun m!521369 () Bool)

(assert (=> b!543036 m!521369))

(check-sat (not b!543034) (not b!543035) (not b!543029) (not start!49342) (not b!543026) (not b!543032) (not b!543028) (not b!543033) (not b!543037) (not b!543036))
(check-sat)
