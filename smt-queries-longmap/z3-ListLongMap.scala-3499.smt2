; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48566 () Bool)

(assert start!48566)

(declare-fun b!533208 () Bool)

(declare-fun res!328416 () Bool)

(declare-fun e!310336 () Bool)

(assert (=> b!533208 (=> (not res!328416) (not e!310336))))

(declare-datatypes ((array!33778 0))(
  ( (array!33779 (arr!16228 (Array (_ BitVec 32) (_ BitVec 64))) (size!16592 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33778)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533208 (= res!328416 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!328415 () Bool)

(assert (=> start!48566 (=> (not res!328415) (not e!310336))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48566 (= res!328415 (validMask!0 mask!3216))))

(assert (=> start!48566 e!310336))

(assert (=> start!48566 true))

(declare-fun array_inv!12024 (array!33778) Bool)

(assert (=> start!48566 (array_inv!12024 a!3154)))

(declare-fun b!533209 () Bool)

(declare-fun e!310338 () Bool)

(assert (=> b!533209 (= e!310338 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4686 0))(
  ( (MissingZero!4686 (index!20968 (_ BitVec 32))) (Found!4686 (index!20969 (_ BitVec 32))) (Intermediate!4686 (undefined!5498 Bool) (index!20970 (_ BitVec 32)) (x!49941 (_ BitVec 32))) (Undefined!4686) (MissingVacant!4686 (index!20971 (_ BitVec 32))) )
))
(declare-fun lt!245410 () SeekEntryResult!4686)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33778 (_ BitVec 32)) SeekEntryResult!4686)

(assert (=> b!533209 (= lt!245410 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16228 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533210 () Bool)

(declare-fun res!328413 () Bool)

(assert (=> b!533210 (=> (not res!328413) (not e!310338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33778 (_ BitVec 32)) Bool)

(assert (=> b!533210 (= res!328413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533211 () Bool)

(declare-fun res!328418 () Bool)

(assert (=> b!533211 (=> (not res!328418) (not e!310336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533211 (= res!328418 (validKeyInArray!0 (select (arr!16228 a!3154) j!147)))))

(declare-fun b!533212 () Bool)

(declare-fun res!328420 () Bool)

(assert (=> b!533212 (=> (not res!328420) (not e!310336))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533212 (= res!328420 (and (= (size!16592 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16592 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16592 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533213 () Bool)

(assert (=> b!533213 (= e!310336 e!310338)))

(declare-fun res!328414 () Bool)

(assert (=> b!533213 (=> (not res!328414) (not e!310338))))

(declare-fun lt!245409 () SeekEntryResult!4686)

(assert (=> b!533213 (= res!328414 (or (= lt!245409 (MissingZero!4686 i!1153)) (= lt!245409 (MissingVacant!4686 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33778 (_ BitVec 32)) SeekEntryResult!4686)

(assert (=> b!533213 (= lt!245409 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533214 () Bool)

(declare-fun res!328417 () Bool)

(assert (=> b!533214 (=> (not res!328417) (not e!310338))))

(declare-datatypes ((List!10347 0))(
  ( (Nil!10344) (Cons!10343 (h!11286 (_ BitVec 64)) (t!16575 List!10347)) )
))
(declare-fun arrayNoDuplicates!0 (array!33778 (_ BitVec 32) List!10347) Bool)

(assert (=> b!533214 (= res!328417 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10344))))

(declare-fun b!533215 () Bool)

(declare-fun res!328419 () Bool)

(assert (=> b!533215 (=> (not res!328419) (not e!310336))))

(assert (=> b!533215 (= res!328419 (validKeyInArray!0 k0!1998))))

(declare-fun b!533216 () Bool)

(declare-fun res!328421 () Bool)

(assert (=> b!533216 (=> (not res!328421) (not e!310338))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533216 (= res!328421 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16592 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16592 a!3154)) (= (select (arr!16228 a!3154) resIndex!32) (select (arr!16228 a!3154) j!147))))))

(assert (= (and start!48566 res!328415) b!533212))

(assert (= (and b!533212 res!328420) b!533211))

(assert (= (and b!533211 res!328418) b!533215))

(assert (= (and b!533215 res!328419) b!533208))

(assert (= (and b!533208 res!328416) b!533213))

(assert (= (and b!533213 res!328414) b!533210))

(assert (= (and b!533210 res!328413) b!533214))

(assert (= (and b!533214 res!328417) b!533216))

(assert (= (and b!533216 res!328421) b!533209))

(declare-fun m!513139 () Bool)

(assert (=> b!533213 m!513139))

(declare-fun m!513141 () Bool)

(assert (=> b!533215 m!513141))

(declare-fun m!513143 () Bool)

(assert (=> b!533210 m!513143))

(declare-fun m!513145 () Bool)

(assert (=> b!533214 m!513145))

(declare-fun m!513147 () Bool)

(assert (=> b!533216 m!513147))

(declare-fun m!513149 () Bool)

(assert (=> b!533216 m!513149))

(assert (=> b!533211 m!513149))

(assert (=> b!533211 m!513149))

(declare-fun m!513151 () Bool)

(assert (=> b!533211 m!513151))

(assert (=> b!533209 m!513149))

(assert (=> b!533209 m!513149))

(declare-fun m!513153 () Bool)

(assert (=> b!533209 m!513153))

(declare-fun m!513155 () Bool)

(assert (=> start!48566 m!513155))

(declare-fun m!513157 () Bool)

(assert (=> start!48566 m!513157))

(declare-fun m!513159 () Bool)

(assert (=> b!533208 m!513159))

(check-sat (not b!533213) (not b!533215) (not b!533209) (not start!48566) (not b!533211) (not b!533208) (not b!533210) (not b!533214))
(check-sat)
