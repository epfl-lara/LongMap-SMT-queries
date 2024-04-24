; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48544 () Bool)

(assert start!48544)

(declare-fun b!532942 () Bool)

(declare-fun e!310234 () Bool)

(declare-fun e!310235 () Bool)

(assert (=> b!532942 (= e!310234 e!310235)))

(declare-fun res!328203 () Bool)

(assert (=> b!532942 (=> (not res!328203) (not e!310235))))

(declare-datatypes ((SeekEntryResult!4630 0))(
  ( (MissingZero!4630 (index!20744 (_ BitVec 32))) (Found!4630 (index!20745 (_ BitVec 32))) (Intermediate!4630 (undefined!5442 Bool) (index!20746 (_ BitVec 32)) (x!49866 (_ BitVec 32))) (Undefined!4630) (MissingVacant!4630 (index!20747 (_ BitVec 32))) )
))
(declare-fun lt!245380 () SeekEntryResult!4630)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532942 (= res!328203 (or (= lt!245380 (MissingZero!4630 i!1153)) (= lt!245380 (MissingVacant!4630 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33755 0))(
  ( (array!33756 (arr!16216 (Array (_ BitVec 32) (_ BitVec 64))) (size!16580 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33755)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33755 (_ BitVec 32)) SeekEntryResult!4630)

(assert (=> b!532942 (= lt!245380 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532943 () Bool)

(declare-fun res!328202 () Bool)

(assert (=> b!532943 (=> (not res!328202) (not e!310234))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532943 (= res!328202 (validKeyInArray!0 (select (arr!16216 a!3154) j!147)))))

(declare-fun b!532944 () Bool)

(declare-fun res!328206 () Bool)

(assert (=> b!532944 (=> (not res!328206) (not e!310235))))

(declare-datatypes ((List!10242 0))(
  ( (Nil!10239) (Cons!10238 (h!11181 (_ BitVec 64)) (t!16462 List!10242)) )
))
(declare-fun arrayNoDuplicates!0 (array!33755 (_ BitVec 32) List!10242) Bool)

(assert (=> b!532944 (= res!328206 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10239))))

(declare-fun b!532945 () Bool)

(declare-fun res!328201 () Bool)

(assert (=> b!532945 (=> (not res!328201) (not e!310234))))

(assert (=> b!532945 (= res!328201 (validKeyInArray!0 k0!1998))))

(declare-fun b!532946 () Bool)

(declare-fun res!328205 () Bool)

(assert (=> b!532946 (=> (not res!328205) (not e!310234))))

(declare-fun arrayContainsKey!0 (array!33755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532946 (= res!328205 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532947 () Bool)

(declare-fun res!328209 () Bool)

(assert (=> b!532947 (=> (not res!328209) (not e!310235))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532947 (= res!328209 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16580 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16580 a!3154)) (= (select (arr!16216 a!3154) resIndex!32) (select (arr!16216 a!3154) j!147))))))

(declare-fun b!532948 () Bool)

(declare-fun res!328204 () Bool)

(assert (=> b!532948 (=> (not res!328204) (not e!310235))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33755 (_ BitVec 32)) SeekEntryResult!4630)

(assert (=> b!532948 (= res!328204 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16216 a!3154) j!147) a!3154 mask!3216) (Intermediate!4630 false resIndex!32 resX!32)))))

(declare-fun b!532950 () Bool)

(assert (=> b!532950 (= e!310235 false)))

(declare-fun lt!245379 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532950 (= lt!245379 (toIndex!0 (select (arr!16216 a!3154) j!147) mask!3216))))

(declare-fun b!532951 () Bool)

(declare-fun res!328208 () Bool)

(assert (=> b!532951 (=> (not res!328208) (not e!310235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33755 (_ BitVec 32)) Bool)

(assert (=> b!532951 (= res!328208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!328210 () Bool)

(assert (=> start!48544 (=> (not res!328210) (not e!310234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48544 (= res!328210 (validMask!0 mask!3216))))

(assert (=> start!48544 e!310234))

(assert (=> start!48544 true))

(declare-fun array_inv!12075 (array!33755) Bool)

(assert (=> start!48544 (array_inv!12075 a!3154)))

(declare-fun b!532949 () Bool)

(declare-fun res!328207 () Bool)

(assert (=> b!532949 (=> (not res!328207) (not e!310234))))

(assert (=> b!532949 (= res!328207 (and (= (size!16580 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16580 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16580 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48544 res!328210) b!532949))

(assert (= (and b!532949 res!328207) b!532943))

(assert (= (and b!532943 res!328202) b!532945))

(assert (= (and b!532945 res!328201) b!532946))

(assert (= (and b!532946 res!328205) b!532942))

(assert (= (and b!532942 res!328203) b!532951))

(assert (= (and b!532951 res!328208) b!532944))

(assert (= (and b!532944 res!328206) b!532947))

(assert (= (and b!532947 res!328209) b!532948))

(assert (= (and b!532948 res!328204) b!532950))

(declare-fun m!513157 () Bool)

(assert (=> b!532943 m!513157))

(assert (=> b!532943 m!513157))

(declare-fun m!513159 () Bool)

(assert (=> b!532943 m!513159))

(declare-fun m!513161 () Bool)

(assert (=> b!532944 m!513161))

(declare-fun m!513163 () Bool)

(assert (=> b!532946 m!513163))

(assert (=> b!532948 m!513157))

(assert (=> b!532948 m!513157))

(declare-fun m!513165 () Bool)

(assert (=> b!532948 m!513165))

(declare-fun m!513167 () Bool)

(assert (=> start!48544 m!513167))

(declare-fun m!513169 () Bool)

(assert (=> start!48544 m!513169))

(declare-fun m!513171 () Bool)

(assert (=> b!532951 m!513171))

(declare-fun m!513173 () Bool)

(assert (=> b!532945 m!513173))

(declare-fun m!513175 () Bool)

(assert (=> b!532942 m!513175))

(assert (=> b!532950 m!513157))

(assert (=> b!532950 m!513157))

(declare-fun m!513177 () Bool)

(assert (=> b!532950 m!513177))

(declare-fun m!513179 () Bool)

(assert (=> b!532947 m!513179))

(assert (=> b!532947 m!513157))

(check-sat (not b!532944) (not b!532951) (not b!532950) (not b!532948) (not b!532943) (not b!532946) (not start!48544) (not b!532945) (not b!532942))
(check-sat)
