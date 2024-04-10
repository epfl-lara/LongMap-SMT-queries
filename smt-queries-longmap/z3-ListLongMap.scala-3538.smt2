; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48800 () Bool)

(assert start!48800)

(declare-fun b!537080 () Bool)

(declare-fun res!332295 () Bool)

(declare-fun e!311660 () Bool)

(assert (=> b!537080 (=> (not res!332295) (not e!311660))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34012 0))(
  ( (array!34013 (arr!16345 (Array (_ BitVec 32) (_ BitVec 64))) (size!16709 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34012)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537080 (= res!332295 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16709 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16709 a!3154)) (= (select (arr!16345 a!3154) resIndex!32) (select (arr!16345 a!3154) j!147))))))

(declare-fun b!537081 () Bool)

(declare-fun res!332285 () Bool)

(declare-fun e!311662 () Bool)

(assert (=> b!537081 (=> (not res!332285) (not e!311662))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537081 (= res!332285 (and (= (size!16709 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16709 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16709 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537082 () Bool)

(declare-fun res!332296 () Bool)

(declare-fun e!311663 () Bool)

(assert (=> b!537082 (=> (not res!332296) (not e!311663))))

(assert (=> b!537082 (= res!332296 (and (not (= (select (arr!16345 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16345 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16345 a!3154) index!1177) (select (arr!16345 a!3154) j!147)))))))

(declare-fun b!537083 () Bool)

(assert (=> b!537083 (= e!311662 e!311660)))

(declare-fun res!332293 () Bool)

(assert (=> b!537083 (=> (not res!332293) (not e!311660))))

(declare-datatypes ((SeekEntryResult!4803 0))(
  ( (MissingZero!4803 (index!21436 (_ BitVec 32))) (Found!4803 (index!21437 (_ BitVec 32))) (Intermediate!4803 (undefined!5615 Bool) (index!21438 (_ BitVec 32)) (x!50370 (_ BitVec 32))) (Undefined!4803) (MissingVacant!4803 (index!21439 (_ BitVec 32))) )
))
(declare-fun lt!246295 () SeekEntryResult!4803)

(assert (=> b!537083 (= res!332293 (or (= lt!246295 (MissingZero!4803 i!1153)) (= lt!246295 (MissingVacant!4803 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34012 (_ BitVec 32)) SeekEntryResult!4803)

(assert (=> b!537083 (= lt!246295 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537084 () Bool)

(declare-fun res!332291 () Bool)

(assert (=> b!537084 (=> (not res!332291) (not e!311662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537084 (= res!332291 (validKeyInArray!0 k0!1998))))

(declare-fun b!537085 () Bool)

(declare-fun res!332288 () Bool)

(assert (=> b!537085 (=> (not res!332288) (not e!311662))))

(declare-fun arrayContainsKey!0 (array!34012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537085 (= res!332288 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537086 () Bool)

(declare-fun res!332287 () Bool)

(assert (=> b!537086 (=> (not res!332287) (not e!311662))))

(assert (=> b!537086 (= res!332287 (validKeyInArray!0 (select (arr!16345 a!3154) j!147)))))

(declare-fun b!537087 () Bool)

(declare-fun res!332286 () Bool)

(assert (=> b!537087 (=> (not res!332286) (not e!311660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34012 (_ BitVec 32)) Bool)

(assert (=> b!537087 (= res!332286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!332294 () Bool)

(assert (=> start!48800 (=> (not res!332294) (not e!311662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48800 (= res!332294 (validMask!0 mask!3216))))

(assert (=> start!48800 e!311662))

(assert (=> start!48800 true))

(declare-fun array_inv!12141 (array!34012) Bool)

(assert (=> start!48800 (array_inv!12141 a!3154)))

(declare-fun b!537088 () Bool)

(declare-fun res!332297 () Bool)

(assert (=> b!537088 (=> (not res!332297) (not e!311660))))

(declare-datatypes ((List!10464 0))(
  ( (Nil!10461) (Cons!10460 (h!11403 (_ BitVec 64)) (t!16692 List!10464)) )
))
(declare-fun arrayNoDuplicates!0 (array!34012 (_ BitVec 32) List!10464) Bool)

(assert (=> b!537088 (= res!332297 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10461))))

(declare-fun b!537089 () Bool)

(assert (=> b!537089 (= e!311660 e!311663)))

(declare-fun res!332290 () Bool)

(assert (=> b!537089 (=> (not res!332290) (not e!311663))))

(declare-fun lt!246294 () SeekEntryResult!4803)

(assert (=> b!537089 (= res!332290 (= lt!246294 (Intermediate!4803 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34012 (_ BitVec 32)) SeekEntryResult!4803)

(assert (=> b!537089 (= lt!246294 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16345 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537090 () Bool)

(declare-fun e!311664 () Bool)

(assert (=> b!537090 (= e!311663 e!311664)))

(declare-fun res!332292 () Bool)

(assert (=> b!537090 (=> (not res!332292) (not e!311664))))

(declare-fun lt!246293 () (_ BitVec 32))

(assert (=> b!537090 (= res!332292 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246293 #b00000000000000000000000000000000) (bvslt lt!246293 (size!16709 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537090 (= lt!246293 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537091 () Bool)

(assert (=> b!537091 (= e!311664 false)))

(declare-fun lt!246292 () SeekEntryResult!4803)

(assert (=> b!537091 (= lt!246292 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246293 (select (arr!16345 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537092 () Bool)

(declare-fun res!332289 () Bool)

(assert (=> b!537092 (=> (not res!332289) (not e!311663))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537092 (= res!332289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16345 a!3154) j!147) mask!3216) (select (arr!16345 a!3154) j!147) a!3154 mask!3216) lt!246294))))

(assert (= (and start!48800 res!332294) b!537081))

(assert (= (and b!537081 res!332285) b!537086))

(assert (= (and b!537086 res!332287) b!537084))

(assert (= (and b!537084 res!332291) b!537085))

(assert (= (and b!537085 res!332288) b!537083))

(assert (= (and b!537083 res!332293) b!537087))

(assert (= (and b!537087 res!332286) b!537088))

(assert (= (and b!537088 res!332297) b!537080))

(assert (= (and b!537080 res!332295) b!537089))

(assert (= (and b!537089 res!332290) b!537092))

(assert (= (and b!537092 res!332289) b!537082))

(assert (= (and b!537082 res!332296) b!537090))

(assert (= (and b!537090 res!332292) b!537091))

(declare-fun m!516377 () Bool)

(assert (=> b!537089 m!516377))

(assert (=> b!537089 m!516377))

(declare-fun m!516379 () Bool)

(assert (=> b!537089 m!516379))

(declare-fun m!516381 () Bool)

(assert (=> b!537080 m!516381))

(assert (=> b!537080 m!516377))

(assert (=> b!537086 m!516377))

(assert (=> b!537086 m!516377))

(declare-fun m!516383 () Bool)

(assert (=> b!537086 m!516383))

(assert (=> b!537091 m!516377))

(assert (=> b!537091 m!516377))

(declare-fun m!516385 () Bool)

(assert (=> b!537091 m!516385))

(declare-fun m!516387 () Bool)

(assert (=> b!537087 m!516387))

(declare-fun m!516389 () Bool)

(assert (=> b!537082 m!516389))

(assert (=> b!537082 m!516377))

(declare-fun m!516391 () Bool)

(assert (=> b!537084 m!516391))

(declare-fun m!516393 () Bool)

(assert (=> b!537083 m!516393))

(declare-fun m!516395 () Bool)

(assert (=> b!537088 m!516395))

(declare-fun m!516397 () Bool)

(assert (=> b!537090 m!516397))

(declare-fun m!516399 () Bool)

(assert (=> start!48800 m!516399))

(declare-fun m!516401 () Bool)

(assert (=> start!48800 m!516401))

(declare-fun m!516403 () Bool)

(assert (=> b!537085 m!516403))

(assert (=> b!537092 m!516377))

(assert (=> b!537092 m!516377))

(declare-fun m!516405 () Bool)

(assert (=> b!537092 m!516405))

(assert (=> b!537092 m!516405))

(assert (=> b!537092 m!516377))

(declare-fun m!516407 () Bool)

(assert (=> b!537092 m!516407))

(check-sat (not b!537089) (not b!537092) (not b!537084) (not b!537083) (not b!537090) (not b!537086) (not b!537085) (not b!537088) (not b!537091) (not b!537087) (not start!48800))
(check-sat)
