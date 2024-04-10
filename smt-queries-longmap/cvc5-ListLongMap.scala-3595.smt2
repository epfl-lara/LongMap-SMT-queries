; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49440 () Bool)

(assert start!49440)

(declare-fun b!544377 () Bool)

(declare-fun res!338642 () Bool)

(declare-fun e!314757 () Bool)

(assert (=> b!544377 (=> (not res!338642) (not e!314757))))

(declare-datatypes ((array!34367 0))(
  ( (array!34368 (arr!16515 (Array (_ BitVec 32) (_ BitVec 64))) (size!16879 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34367)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544377 (= res!338642 (validKeyInArray!0 (select (arr!16515 a!3154) j!147)))))

(declare-fun b!544378 () Bool)

(declare-fun res!338649 () Bool)

(declare-fun e!314754 () Bool)

(assert (=> b!544378 (=> (not res!338649) (not e!314754))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544378 (= res!338649 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16879 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16879 a!3154)) (= (select (arr!16515 a!3154) resIndex!32) (select (arr!16515 a!3154) j!147))))))

(declare-fun b!544379 () Bool)

(declare-fun res!338650 () Bool)

(assert (=> b!544379 (=> (not res!338650) (not e!314757))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544379 (= res!338650 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544380 () Bool)

(declare-fun res!338647 () Bool)

(declare-fun e!314756 () Bool)

(assert (=> b!544380 (=> (not res!338647) (not e!314756))))

(assert (=> b!544380 (= res!338647 (and (not (= (select (arr!16515 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16515 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16515 a!3154) index!1177) (select (arr!16515 a!3154) j!147)))))))

(declare-fun res!338641 () Bool)

(assert (=> start!49440 (=> (not res!338641) (not e!314757))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49440 (= res!338641 (validMask!0 mask!3216))))

(assert (=> start!49440 e!314757))

(assert (=> start!49440 true))

(declare-fun array_inv!12311 (array!34367) Bool)

(assert (=> start!49440 (array_inv!12311 a!3154)))

(declare-fun b!544381 () Bool)

(assert (=> b!544381 (= e!314757 e!314754)))

(declare-fun res!338640 () Bool)

(assert (=> b!544381 (=> (not res!338640) (not e!314754))))

(declare-datatypes ((SeekEntryResult!4973 0))(
  ( (MissingZero!4973 (index!22116 (_ BitVec 32))) (Found!4973 (index!22117 (_ BitVec 32))) (Intermediate!4973 (undefined!5785 Bool) (index!22118 (_ BitVec 32)) (x!51035 (_ BitVec 32))) (Undefined!4973) (MissingVacant!4973 (index!22119 (_ BitVec 32))) )
))
(declare-fun lt!248476 () SeekEntryResult!4973)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544381 (= res!338640 (or (= lt!248476 (MissingZero!4973 i!1153)) (= lt!248476 (MissingVacant!4973 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34367 (_ BitVec 32)) SeekEntryResult!4973)

(assert (=> b!544381 (= lt!248476 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!544382 () Bool)

(assert (=> b!544382 (= e!314756 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvslt (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000)))))

(declare-fun lt!248474 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544382 (= lt!248474 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544383 () Bool)

(declare-fun res!338644 () Bool)

(assert (=> b!544383 (=> (not res!338644) (not e!314756))))

(declare-fun lt!248475 () SeekEntryResult!4973)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34367 (_ BitVec 32)) SeekEntryResult!4973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544383 (= res!338644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16515 a!3154) j!147) mask!3216) (select (arr!16515 a!3154) j!147) a!3154 mask!3216) lt!248475))))

(declare-fun b!544384 () Bool)

(declare-fun res!338646 () Bool)

(assert (=> b!544384 (=> (not res!338646) (not e!314757))))

(assert (=> b!544384 (= res!338646 (validKeyInArray!0 k!1998))))

(declare-fun b!544385 () Bool)

(declare-fun res!338645 () Bool)

(assert (=> b!544385 (=> (not res!338645) (not e!314754))))

(declare-datatypes ((List!10634 0))(
  ( (Nil!10631) (Cons!10630 (h!11588 (_ BitVec 64)) (t!16862 List!10634)) )
))
(declare-fun arrayNoDuplicates!0 (array!34367 (_ BitVec 32) List!10634) Bool)

(assert (=> b!544385 (= res!338645 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10631))))

(declare-fun b!544386 () Bool)

(assert (=> b!544386 (= e!314754 e!314756)))

(declare-fun res!338648 () Bool)

(assert (=> b!544386 (=> (not res!338648) (not e!314756))))

(assert (=> b!544386 (= res!338648 (= lt!248475 (Intermediate!4973 false resIndex!32 resX!32)))))

(assert (=> b!544386 (= lt!248475 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16515 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544387 () Bool)

(declare-fun res!338643 () Bool)

(assert (=> b!544387 (=> (not res!338643) (not e!314754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34367 (_ BitVec 32)) Bool)

(assert (=> b!544387 (= res!338643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544388 () Bool)

(declare-fun res!338651 () Bool)

(assert (=> b!544388 (=> (not res!338651) (not e!314757))))

(assert (=> b!544388 (= res!338651 (and (= (size!16879 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16879 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16879 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49440 res!338641) b!544388))

(assert (= (and b!544388 res!338651) b!544377))

(assert (= (and b!544377 res!338642) b!544384))

(assert (= (and b!544384 res!338646) b!544379))

(assert (= (and b!544379 res!338650) b!544381))

(assert (= (and b!544381 res!338640) b!544387))

(assert (= (and b!544387 res!338643) b!544385))

(assert (= (and b!544385 res!338645) b!544378))

(assert (= (and b!544378 res!338649) b!544386))

(assert (= (and b!544386 res!338648) b!544383))

(assert (= (and b!544383 res!338644) b!544380))

(assert (= (and b!544380 res!338647) b!544382))

(declare-fun m!522285 () Bool)

(assert (=> b!544378 m!522285))

(declare-fun m!522287 () Bool)

(assert (=> b!544378 m!522287))

(declare-fun m!522289 () Bool)

(assert (=> b!544380 m!522289))

(assert (=> b!544380 m!522287))

(declare-fun m!522291 () Bool)

(assert (=> b!544384 m!522291))

(declare-fun m!522293 () Bool)

(assert (=> b!544379 m!522293))

(assert (=> b!544383 m!522287))

(assert (=> b!544383 m!522287))

(declare-fun m!522295 () Bool)

(assert (=> b!544383 m!522295))

(assert (=> b!544383 m!522295))

(assert (=> b!544383 m!522287))

(declare-fun m!522297 () Bool)

(assert (=> b!544383 m!522297))

(assert (=> b!544386 m!522287))

(assert (=> b!544386 m!522287))

(declare-fun m!522299 () Bool)

(assert (=> b!544386 m!522299))

(declare-fun m!522301 () Bool)

(assert (=> b!544382 m!522301))

(declare-fun m!522303 () Bool)

(assert (=> b!544385 m!522303))

(assert (=> b!544377 m!522287))

(assert (=> b!544377 m!522287))

(declare-fun m!522305 () Bool)

(assert (=> b!544377 m!522305))

(declare-fun m!522307 () Bool)

(assert (=> b!544381 m!522307))

(declare-fun m!522309 () Bool)

(assert (=> start!49440 m!522309))

(declare-fun m!522311 () Bool)

(assert (=> start!49440 m!522311))

(declare-fun m!522313 () Bool)

(assert (=> b!544387 m!522313))

(push 1)

