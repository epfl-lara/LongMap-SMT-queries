; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32358 () Bool)

(assert start!32358)

(declare-fun b!322220 () Bool)

(declare-fun res!176203 () Bool)

(declare-fun e!199478 () Bool)

(assert (=> b!322220 (=> (not res!176203) (not e!199478))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((array!16497 0))(
  ( (array!16498 (arr!7806 (Array (_ BitVec 32) (_ BitVec 64))) (size!8158 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16497)

(assert (=> b!322220 (= res!176203 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7806 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7806 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7806 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322221 () Bool)

(declare-fun res!176206 () Bool)

(declare-fun e!199480 () Bool)

(assert (=> b!322221 (=> (not res!176206) (not e!199480))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322221 (= res!176206 (and (= (size!8158 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8158 a!3305))))))

(declare-fun b!322222 () Bool)

(declare-fun res!176207 () Bool)

(assert (=> b!322222 (=> (not res!176207) (not e!199478))))

(declare-datatypes ((SeekEntryResult!2937 0))(
  ( (MissingZero!2937 (index!13924 (_ BitVec 32))) (Found!2937 (index!13925 (_ BitVec 32))) (Intermediate!2937 (undefined!3749 Bool) (index!13926 (_ BitVec 32)) (x!32189 (_ BitVec 32))) (Undefined!2937) (MissingVacant!2937 (index!13927 (_ BitVec 32))) )
))
(declare-fun lt!156407 () SeekEntryResult!2937)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16497 (_ BitVec 32)) SeekEntryResult!2937)

(assert (=> b!322222 (= res!176207 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156407))))

(declare-fun res!176199 () Bool)

(assert (=> start!32358 (=> (not res!176199) (not e!199480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32358 (= res!176199 (validMask!0 mask!3777))))

(assert (=> start!32358 e!199480))

(declare-fun array_inv!5769 (array!16497) Bool)

(assert (=> start!32358 (array_inv!5769 a!3305)))

(assert (=> start!32358 true))

(declare-fun b!322223 () Bool)

(declare-fun res!176204 () Bool)

(assert (=> b!322223 (=> (not res!176204) (not e!199480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16497 (_ BitVec 32)) Bool)

(assert (=> b!322223 (= res!176204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322224 () Bool)

(assert (=> b!322224 (= e!199478 false)))

(declare-fun lt!156408 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322224 (= lt!156408 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!322225 () Bool)

(declare-fun res!176201 () Bool)

(assert (=> b!322225 (=> (not res!176201) (not e!199480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322225 (= res!176201 (validKeyInArray!0 k0!2497))))

(declare-fun b!322226 () Bool)

(assert (=> b!322226 (= e!199480 e!199478)))

(declare-fun res!176205 () Bool)

(assert (=> b!322226 (=> (not res!176205) (not e!199478))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322226 (= res!176205 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156407))))

(assert (=> b!322226 (= lt!156407 (Intermediate!2937 false resIndex!58 resX!58))))

(declare-fun b!322227 () Bool)

(declare-fun res!176208 () Bool)

(assert (=> b!322227 (=> (not res!176208) (not e!199480))))

(declare-fun arrayContainsKey!0 (array!16497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322227 (= res!176208 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322228 () Bool)

(declare-fun res!176200 () Bool)

(assert (=> b!322228 (=> (not res!176200) (not e!199480))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16497 (_ BitVec 32)) SeekEntryResult!2937)

(assert (=> b!322228 (= res!176200 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2937 i!1250)))))

(declare-fun b!322229 () Bool)

(declare-fun res!176202 () Bool)

(assert (=> b!322229 (=> (not res!176202) (not e!199478))))

(assert (=> b!322229 (= res!176202 (and (= (select (arr!7806 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8158 a!3305))))))

(assert (= (and start!32358 res!176199) b!322221))

(assert (= (and b!322221 res!176206) b!322225))

(assert (= (and b!322225 res!176201) b!322227))

(assert (= (and b!322227 res!176208) b!322228))

(assert (= (and b!322228 res!176200) b!322223))

(assert (= (and b!322223 res!176204) b!322226))

(assert (= (and b!322226 res!176205) b!322229))

(assert (= (and b!322229 res!176202) b!322222))

(assert (= (and b!322222 res!176207) b!322220))

(assert (= (and b!322220 res!176203) b!322224))

(declare-fun m!330149 () Bool)

(assert (=> b!322229 m!330149))

(declare-fun m!330151 () Bool)

(assert (=> b!322224 m!330151))

(declare-fun m!330153 () Bool)

(assert (=> start!32358 m!330153))

(declare-fun m!330155 () Bool)

(assert (=> start!32358 m!330155))

(declare-fun m!330157 () Bool)

(assert (=> b!322222 m!330157))

(declare-fun m!330159 () Bool)

(assert (=> b!322226 m!330159))

(assert (=> b!322226 m!330159))

(declare-fun m!330161 () Bool)

(assert (=> b!322226 m!330161))

(declare-fun m!330163 () Bool)

(assert (=> b!322220 m!330163))

(declare-fun m!330165 () Bool)

(assert (=> b!322223 m!330165))

(declare-fun m!330167 () Bool)

(assert (=> b!322228 m!330167))

(declare-fun m!330169 () Bool)

(assert (=> b!322225 m!330169))

(declare-fun m!330171 () Bool)

(assert (=> b!322227 m!330171))

(check-sat (not b!322228) (not b!322226) (not b!322223) (not b!322225) (not b!322227) (not start!32358) (not b!322224) (not b!322222))
(check-sat)
