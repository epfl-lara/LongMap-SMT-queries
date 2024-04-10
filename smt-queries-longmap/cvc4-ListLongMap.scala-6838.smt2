; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86070 () Bool)

(assert start!86070)

(declare-fun b!997061 () Bool)

(declare-fun res!667178 () Bool)

(declare-fun e!562402 () Bool)

(assert (=> b!997061 (=> (not res!667178) (not e!562402))))

(declare-datatypes ((array!63075 0))(
  ( (array!63076 (arr!30369 (Array (_ BitVec 32) (_ BitVec 64))) (size!30871 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63075)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997061 (= res!667178 (validKeyInArray!0 (select (arr!30369 a!3219) j!170)))))

(declare-fun b!997062 () Bool)

(declare-fun res!667177 () Bool)

(declare-fun e!562405 () Bool)

(assert (=> b!997062 (=> (not res!667177) (not e!562405))))

(declare-datatypes ((List!21045 0))(
  ( (Nil!21042) (Cons!21041 (h!22206 (_ BitVec 64)) (t!30046 List!21045)) )
))
(declare-fun arrayNoDuplicates!0 (array!63075 (_ BitVec 32) List!21045) Bool)

(assert (=> b!997062 (= res!667177 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21042))))

(declare-fun b!997063 () Bool)

(declare-fun e!562404 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!997063 (= e!562404 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun res!667181 () Bool)

(assert (=> start!86070 (=> (not res!667181) (not e!562402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86070 (= res!667181 (validMask!0 mask!3464))))

(assert (=> start!86070 e!562402))

(declare-fun array_inv!23493 (array!63075) Bool)

(assert (=> start!86070 (array_inv!23493 a!3219)))

(assert (=> start!86070 true))

(declare-fun b!997064 () Bool)

(assert (=> b!997064 (= e!562405 e!562404)))

(declare-fun res!667184 () Bool)

(assert (=> b!997064 (=> (not res!667184) (not e!562404))))

(declare-datatypes ((SeekEntryResult!9301 0))(
  ( (MissingZero!9301 (index!39575 (_ BitVec 32))) (Found!9301 (index!39576 (_ BitVec 32))) (Intermediate!9301 (undefined!10113 Bool) (index!39577 (_ BitVec 32)) (x!87001 (_ BitVec 32))) (Undefined!9301) (MissingVacant!9301 (index!39578 (_ BitVec 32))) )
))
(declare-fun lt!441338 () SeekEntryResult!9301)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63075 (_ BitVec 32)) SeekEntryResult!9301)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997064 (= res!667184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30369 a!3219) j!170) mask!3464) (select (arr!30369 a!3219) j!170) a!3219 mask!3464) lt!441338))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997064 (= lt!441338 (Intermediate!9301 false resIndex!38 resX!38))))

(declare-fun b!997065 () Bool)

(declare-fun res!667185 () Bool)

(assert (=> b!997065 (=> (not res!667185) (not e!562402))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997065 (= res!667185 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997066 () Bool)

(declare-fun res!667183 () Bool)

(assert (=> b!997066 (=> (not res!667183) (not e!562404))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!997066 (= res!667183 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30369 a!3219) j!170) a!3219 mask!3464) lt!441338))))

(declare-fun b!997067 () Bool)

(declare-fun res!667176 () Bool)

(assert (=> b!997067 (=> (not res!667176) (not e!562402))))

(assert (=> b!997067 (= res!667176 (validKeyInArray!0 k!2224))))

(declare-fun b!997068 () Bool)

(assert (=> b!997068 (= e!562402 e!562405)))

(declare-fun res!667179 () Bool)

(assert (=> b!997068 (=> (not res!667179) (not e!562405))))

(declare-fun lt!441337 () SeekEntryResult!9301)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997068 (= res!667179 (or (= lt!441337 (MissingVacant!9301 i!1194)) (= lt!441337 (MissingZero!9301 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63075 (_ BitVec 32)) SeekEntryResult!9301)

(assert (=> b!997068 (= lt!441337 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997069 () Bool)

(declare-fun res!667175 () Bool)

(assert (=> b!997069 (=> (not res!667175) (not e!562402))))

(assert (=> b!997069 (= res!667175 (and (= (size!30871 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30871 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30871 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997070 () Bool)

(declare-fun res!667182 () Bool)

(assert (=> b!997070 (=> (not res!667182) (not e!562405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63075 (_ BitVec 32)) Bool)

(assert (=> b!997070 (= res!667182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997071 () Bool)

(declare-fun res!667180 () Bool)

(assert (=> b!997071 (=> (not res!667180) (not e!562405))))

(assert (=> b!997071 (= res!667180 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30871 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30871 a!3219))))))

(assert (= (and start!86070 res!667181) b!997069))

(assert (= (and b!997069 res!667175) b!997061))

(assert (= (and b!997061 res!667178) b!997067))

(assert (= (and b!997067 res!667176) b!997065))

(assert (= (and b!997065 res!667185) b!997068))

(assert (= (and b!997068 res!667179) b!997070))

(assert (= (and b!997070 res!667182) b!997062))

(assert (= (and b!997062 res!667177) b!997071))

(assert (= (and b!997071 res!667180) b!997064))

(assert (= (and b!997064 res!667184) b!997066))

(assert (= (and b!997066 res!667183) b!997063))

(declare-fun m!924029 () Bool)

(assert (=> b!997062 m!924029))

(declare-fun m!924031 () Bool)

(assert (=> b!997068 m!924031))

(declare-fun m!924033 () Bool)

(assert (=> b!997065 m!924033))

(declare-fun m!924035 () Bool)

(assert (=> b!997064 m!924035))

(assert (=> b!997064 m!924035))

(declare-fun m!924037 () Bool)

(assert (=> b!997064 m!924037))

(assert (=> b!997064 m!924037))

(assert (=> b!997064 m!924035))

(declare-fun m!924039 () Bool)

(assert (=> b!997064 m!924039))

(declare-fun m!924041 () Bool)

(assert (=> b!997070 m!924041))

(assert (=> b!997061 m!924035))

(assert (=> b!997061 m!924035))

(declare-fun m!924043 () Bool)

(assert (=> b!997061 m!924043))

(declare-fun m!924045 () Bool)

(assert (=> b!997067 m!924045))

(assert (=> b!997066 m!924035))

(assert (=> b!997066 m!924035))

(declare-fun m!924047 () Bool)

(assert (=> b!997066 m!924047))

(declare-fun m!924049 () Bool)

(assert (=> start!86070 m!924049))

(declare-fun m!924051 () Bool)

(assert (=> start!86070 m!924051))

(push 1)

(assert (not b!997064))

(assert (not b!997062))

(assert (not b!997065))

(assert (not b!997061))

(assert (not b!997066))

(assert (not b!997067))

(assert (not b!997068))

(assert (not b!997070))

(assert (not start!86070))

(check-sat)

(pop 1)

