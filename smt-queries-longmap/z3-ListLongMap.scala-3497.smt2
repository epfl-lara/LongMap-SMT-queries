; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48554 () Bool)

(assert start!48554)

(declare-fun res!328244 () Bool)

(declare-fun e!310284 () Bool)

(assert (=> start!48554 (=> (not res!328244) (not e!310284))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48554 (= res!328244 (validMask!0 mask!3216))))

(assert (=> start!48554 e!310284))

(assert (=> start!48554 true))

(declare-datatypes ((array!33766 0))(
  ( (array!33767 (arr!16222 (Array (_ BitVec 32) (_ BitVec 64))) (size!16586 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33766)

(declare-fun array_inv!12018 (array!33766) Bool)

(assert (=> start!48554 (array_inv!12018 a!3154)))

(declare-fun b!533033 () Bool)

(declare-fun res!328238 () Bool)

(declare-fun e!310283 () Bool)

(assert (=> b!533033 (=> (not res!328238) (not e!310283))))

(declare-datatypes ((List!10341 0))(
  ( (Nil!10338) (Cons!10337 (h!11280 (_ BitVec 64)) (t!16569 List!10341)) )
))
(declare-fun arrayNoDuplicates!0 (array!33766 (_ BitVec 32) List!10341) Bool)

(assert (=> b!533033 (= res!328238 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10338))))

(declare-fun b!533034 () Bool)

(assert (=> b!533034 (= e!310283 false)))

(declare-fun lt!245373 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533034 (= lt!245373 (toIndex!0 (select (arr!16222 a!3154) j!147) mask!3216))))

(declare-fun b!533035 () Bool)

(declare-fun res!328241 () Bool)

(assert (=> b!533035 (=> (not res!328241) (not e!310283))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533035 (= res!328241 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16586 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16586 a!3154)) (= (select (arr!16222 a!3154) resIndex!32) (select (arr!16222 a!3154) j!147))))))

(declare-fun b!533036 () Bool)

(declare-fun res!328246 () Bool)

(assert (=> b!533036 (=> (not res!328246) (not e!310284))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533036 (= res!328246 (and (= (size!16586 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16586 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16586 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533037 () Bool)

(declare-fun res!328240 () Bool)

(assert (=> b!533037 (=> (not res!328240) (not e!310284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533037 (= res!328240 (validKeyInArray!0 (select (arr!16222 a!3154) j!147)))))

(declare-fun b!533038 () Bool)

(declare-fun res!328242 () Bool)

(assert (=> b!533038 (=> (not res!328242) (not e!310284))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533038 (= res!328242 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533039 () Bool)

(declare-fun res!328247 () Bool)

(assert (=> b!533039 (=> (not res!328247) (not e!310283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33766 (_ BitVec 32)) Bool)

(assert (=> b!533039 (= res!328247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533040 () Bool)

(assert (=> b!533040 (= e!310284 e!310283)))

(declare-fun res!328239 () Bool)

(assert (=> b!533040 (=> (not res!328239) (not e!310283))))

(declare-datatypes ((SeekEntryResult!4680 0))(
  ( (MissingZero!4680 (index!20944 (_ BitVec 32))) (Found!4680 (index!20945 (_ BitVec 32))) (Intermediate!4680 (undefined!5492 Bool) (index!20946 (_ BitVec 32)) (x!49919 (_ BitVec 32))) (Undefined!4680) (MissingVacant!4680 (index!20947 (_ BitVec 32))) )
))
(declare-fun lt!245374 () SeekEntryResult!4680)

(assert (=> b!533040 (= res!328239 (or (= lt!245374 (MissingZero!4680 i!1153)) (= lt!245374 (MissingVacant!4680 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33766 (_ BitVec 32)) SeekEntryResult!4680)

(assert (=> b!533040 (= lt!245374 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533041 () Bool)

(declare-fun res!328245 () Bool)

(assert (=> b!533041 (=> (not res!328245) (not e!310284))))

(assert (=> b!533041 (= res!328245 (validKeyInArray!0 k0!1998))))

(declare-fun b!533042 () Bool)

(declare-fun res!328243 () Bool)

(assert (=> b!533042 (=> (not res!328243) (not e!310283))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33766 (_ BitVec 32)) SeekEntryResult!4680)

(assert (=> b!533042 (= res!328243 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16222 a!3154) j!147) a!3154 mask!3216) (Intermediate!4680 false resIndex!32 resX!32)))))

(assert (= (and start!48554 res!328244) b!533036))

(assert (= (and b!533036 res!328246) b!533037))

(assert (= (and b!533037 res!328240) b!533041))

(assert (= (and b!533041 res!328245) b!533038))

(assert (= (and b!533038 res!328242) b!533040))

(assert (= (and b!533040 res!328239) b!533039))

(assert (= (and b!533039 res!328247) b!533033))

(assert (= (and b!533033 res!328238) b!533035))

(assert (= (and b!533035 res!328241) b!533042))

(assert (= (and b!533042 res!328243) b!533034))

(declare-fun m!512997 () Bool)

(assert (=> b!533042 m!512997))

(assert (=> b!533042 m!512997))

(declare-fun m!512999 () Bool)

(assert (=> b!533042 m!512999))

(assert (=> b!533037 m!512997))

(assert (=> b!533037 m!512997))

(declare-fun m!513001 () Bool)

(assert (=> b!533037 m!513001))

(declare-fun m!513003 () Bool)

(assert (=> b!533039 m!513003))

(declare-fun m!513005 () Bool)

(assert (=> b!533040 m!513005))

(declare-fun m!513007 () Bool)

(assert (=> b!533035 m!513007))

(assert (=> b!533035 m!512997))

(declare-fun m!513009 () Bool)

(assert (=> start!48554 m!513009))

(declare-fun m!513011 () Bool)

(assert (=> start!48554 m!513011))

(declare-fun m!513013 () Bool)

(assert (=> b!533041 m!513013))

(declare-fun m!513015 () Bool)

(assert (=> b!533033 m!513015))

(declare-fun m!513017 () Bool)

(assert (=> b!533038 m!513017))

(assert (=> b!533034 m!512997))

(assert (=> b!533034 m!512997))

(declare-fun m!513019 () Bool)

(assert (=> b!533034 m!513019))

(check-sat (not b!533040) (not b!533039) (not b!533038) (not b!533033) (not b!533034) (not b!533041) (not start!48554) (not b!533037) (not b!533042))
(check-sat)
