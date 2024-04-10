; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49022 () Bool)

(assert start!49022)

(declare-fun b!540206 () Bool)

(declare-fun e!312998 () Bool)

(declare-fun e!312997 () Bool)

(assert (=> b!540206 (= e!312998 e!312997)))

(declare-fun res!335261 () Bool)

(assert (=> b!540206 (=> (not res!335261) (not e!312997))))

(declare-datatypes ((SeekEntryResult!4887 0))(
  ( (MissingZero!4887 (index!21772 (_ BitVec 32))) (Found!4887 (index!21773 (_ BitVec 32))) (Intermediate!4887 (undefined!5699 Bool) (index!21774 (_ BitVec 32)) (x!50684 (_ BitVec 32))) (Undefined!4887) (MissingVacant!4887 (index!21775 (_ BitVec 32))) )
))
(declare-fun lt!247332 () SeekEntryResult!4887)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540206 (= res!335261 (or (= lt!247332 (MissingZero!4887 i!1153)) (= lt!247332 (MissingVacant!4887 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34183 0))(
  ( (array!34184 (arr!16429 (Array (_ BitVec 32) (_ BitVec 64))) (size!16793 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34183)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34183 (_ BitVec 32)) SeekEntryResult!4887)

(assert (=> b!540206 (= lt!247332 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540207 () Bool)

(declare-fun res!335255 () Bool)

(assert (=> b!540207 (=> (not res!335255) (not e!312998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540207 (= res!335255 (validKeyInArray!0 k0!1998))))

(declare-fun b!540208 () Bool)

(declare-fun res!335253 () Bool)

(assert (=> b!540208 (=> (not res!335253) (not e!312998))))

(declare-fun arrayContainsKey!0 (array!34183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540208 (= res!335253 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540209 () Bool)

(declare-fun res!335258 () Bool)

(assert (=> b!540209 (=> (not res!335258) (not e!312997))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!540209 (= res!335258 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16793 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16793 a!3154)) (= (select (arr!16429 a!3154) resIndex!32) (select (arr!16429 a!3154) j!147))))))

(declare-fun b!540210 () Bool)

(declare-fun res!335254 () Bool)

(assert (=> b!540210 (=> (not res!335254) (not e!312997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34183 (_ BitVec 32)) Bool)

(assert (=> b!540210 (= res!335254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540212 () Bool)

(assert (=> b!540212 (= e!312997 false)))

(declare-fun lt!247333 () SeekEntryResult!4887)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34183 (_ BitVec 32)) SeekEntryResult!4887)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540212 (= lt!247333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16429 a!3154) j!147) mask!3216) (select (arr!16429 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540213 () Bool)

(declare-fun res!335260 () Bool)

(assert (=> b!540213 (=> (not res!335260) (not e!312997))))

(declare-datatypes ((List!10548 0))(
  ( (Nil!10545) (Cons!10544 (h!11490 (_ BitVec 64)) (t!16776 List!10548)) )
))
(declare-fun arrayNoDuplicates!0 (array!34183 (_ BitVec 32) List!10548) Bool)

(assert (=> b!540213 (= res!335260 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10545))))

(declare-fun res!335257 () Bool)

(assert (=> start!49022 (=> (not res!335257) (not e!312998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49022 (= res!335257 (validMask!0 mask!3216))))

(assert (=> start!49022 e!312998))

(assert (=> start!49022 true))

(declare-fun array_inv!12225 (array!34183) Bool)

(assert (=> start!49022 (array_inv!12225 a!3154)))

(declare-fun b!540211 () Bool)

(declare-fun res!335256 () Bool)

(assert (=> b!540211 (=> (not res!335256) (not e!312998))))

(assert (=> b!540211 (= res!335256 (and (= (size!16793 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16793 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16793 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540214 () Bool)

(declare-fun res!335259 () Bool)

(assert (=> b!540214 (=> (not res!335259) (not e!312997))))

(assert (=> b!540214 (= res!335259 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16429 a!3154) j!147) a!3154 mask!3216) (Intermediate!4887 false resIndex!32 resX!32)))))

(declare-fun b!540215 () Bool)

(declare-fun res!335252 () Bool)

(assert (=> b!540215 (=> (not res!335252) (not e!312998))))

(assert (=> b!540215 (= res!335252 (validKeyInArray!0 (select (arr!16429 a!3154) j!147)))))

(assert (= (and start!49022 res!335257) b!540211))

(assert (= (and b!540211 res!335256) b!540215))

(assert (= (and b!540215 res!335252) b!540207))

(assert (= (and b!540207 res!335255) b!540208))

(assert (= (and b!540208 res!335253) b!540206))

(assert (= (and b!540206 res!335261) b!540210))

(assert (= (and b!540210 res!335254) b!540213))

(assert (= (and b!540213 res!335260) b!540209))

(assert (= (and b!540209 res!335258) b!540214))

(assert (= (and b!540214 res!335259) b!540212))

(declare-fun m!519035 () Bool)

(assert (=> b!540213 m!519035))

(declare-fun m!519037 () Bool)

(assert (=> b!540214 m!519037))

(assert (=> b!540214 m!519037))

(declare-fun m!519039 () Bool)

(assert (=> b!540214 m!519039))

(declare-fun m!519041 () Bool)

(assert (=> b!540206 m!519041))

(declare-fun m!519043 () Bool)

(assert (=> b!540207 m!519043))

(assert (=> b!540215 m!519037))

(assert (=> b!540215 m!519037))

(declare-fun m!519045 () Bool)

(assert (=> b!540215 m!519045))

(declare-fun m!519047 () Bool)

(assert (=> start!49022 m!519047))

(declare-fun m!519049 () Bool)

(assert (=> start!49022 m!519049))

(assert (=> b!540212 m!519037))

(assert (=> b!540212 m!519037))

(declare-fun m!519051 () Bool)

(assert (=> b!540212 m!519051))

(assert (=> b!540212 m!519051))

(assert (=> b!540212 m!519037))

(declare-fun m!519053 () Bool)

(assert (=> b!540212 m!519053))

(declare-fun m!519055 () Bool)

(assert (=> b!540210 m!519055))

(declare-fun m!519057 () Bool)

(assert (=> b!540208 m!519057))

(declare-fun m!519059 () Bool)

(assert (=> b!540209 m!519059))

(assert (=> b!540209 m!519037))

(check-sat (not b!540213) (not b!540208) (not b!540215) (not b!540207) (not b!540210) (not b!540206) (not start!49022) (not b!540212) (not b!540214))
(check-sat)
