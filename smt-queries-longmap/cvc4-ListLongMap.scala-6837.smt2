; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86064 () Bool)

(assert start!86064)

(declare-fun res!667078 () Bool)

(declare-fun e!562369 () Bool)

(assert (=> start!86064 (=> (not res!667078) (not e!562369))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86064 (= res!667078 (validMask!0 mask!3464))))

(assert (=> start!86064 e!562369))

(declare-datatypes ((array!63069 0))(
  ( (array!63070 (arr!30366 (Array (_ BitVec 32) (_ BitVec 64))) (size!30868 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63069)

(declare-fun array_inv!23490 (array!63069) Bool)

(assert (=> start!86064 (array_inv!23490 a!3219)))

(assert (=> start!86064 true))

(declare-fun b!996964 () Bool)

(declare-fun e!562367 () Bool)

(assert (=> b!996964 (= e!562367 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9298 0))(
  ( (MissingZero!9298 (index!39563 (_ BitVec 32))) (Found!9298 (index!39564 (_ BitVec 32))) (Intermediate!9298 (undefined!10110 Bool) (index!39565 (_ BitVec 32)) (x!86990 (_ BitVec 32))) (Undefined!9298) (MissingVacant!9298 (index!39566 (_ BitVec 32))) )
))
(declare-fun lt!441320 () SeekEntryResult!9298)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63069 (_ BitVec 32)) SeekEntryResult!9298)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996964 (= lt!441320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30366 a!3219) j!170) mask!3464) (select (arr!30366 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996965 () Bool)

(declare-fun res!667082 () Bool)

(assert (=> b!996965 (=> (not res!667082) (not e!562369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996965 (= res!667082 (validKeyInArray!0 (select (arr!30366 a!3219) j!170)))))

(declare-fun b!996966 () Bool)

(assert (=> b!996966 (= e!562369 e!562367)))

(declare-fun res!667080 () Bool)

(assert (=> b!996966 (=> (not res!667080) (not e!562367))))

(declare-fun lt!441319 () SeekEntryResult!9298)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996966 (= res!667080 (or (= lt!441319 (MissingVacant!9298 i!1194)) (= lt!441319 (MissingZero!9298 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63069 (_ BitVec 32)) SeekEntryResult!9298)

(assert (=> b!996966 (= lt!441319 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996967 () Bool)

(declare-fun res!667084 () Bool)

(assert (=> b!996967 (=> (not res!667084) (not e!562367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63069 (_ BitVec 32)) Bool)

(assert (=> b!996967 (= res!667084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996968 () Bool)

(declare-fun res!667081 () Bool)

(assert (=> b!996968 (=> (not res!667081) (not e!562367))))

(declare-datatypes ((List!21042 0))(
  ( (Nil!21039) (Cons!21038 (h!22203 (_ BitVec 64)) (t!30043 List!21042)) )
))
(declare-fun arrayNoDuplicates!0 (array!63069 (_ BitVec 32) List!21042) Bool)

(assert (=> b!996968 (= res!667081 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21039))))

(declare-fun b!996969 () Bool)

(declare-fun res!667086 () Bool)

(assert (=> b!996969 (=> (not res!667086) (not e!562369))))

(declare-fun arrayContainsKey!0 (array!63069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996969 (= res!667086 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996970 () Bool)

(declare-fun res!667085 () Bool)

(assert (=> b!996970 (=> (not res!667085) (not e!562369))))

(assert (=> b!996970 (= res!667085 (and (= (size!30868 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30868 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30868 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996971 () Bool)

(declare-fun res!667079 () Bool)

(assert (=> b!996971 (=> (not res!667079) (not e!562367))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996971 (= res!667079 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30868 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30868 a!3219))))))

(declare-fun b!996972 () Bool)

(declare-fun res!667083 () Bool)

(assert (=> b!996972 (=> (not res!667083) (not e!562369))))

(assert (=> b!996972 (= res!667083 (validKeyInArray!0 k!2224))))

(assert (= (and start!86064 res!667078) b!996970))

(assert (= (and b!996970 res!667085) b!996965))

(assert (= (and b!996965 res!667082) b!996972))

(assert (= (and b!996972 res!667083) b!996969))

(assert (= (and b!996969 res!667086) b!996966))

(assert (= (and b!996966 res!667080) b!996967))

(assert (= (and b!996967 res!667084) b!996968))

(assert (= (and b!996968 res!667081) b!996971))

(assert (= (and b!996971 res!667079) b!996964))

(declare-fun m!923959 () Bool)

(assert (=> b!996972 m!923959))

(declare-fun m!923961 () Bool)

(assert (=> b!996964 m!923961))

(assert (=> b!996964 m!923961))

(declare-fun m!923963 () Bool)

(assert (=> b!996964 m!923963))

(assert (=> b!996964 m!923963))

(assert (=> b!996964 m!923961))

(declare-fun m!923965 () Bool)

(assert (=> b!996964 m!923965))

(declare-fun m!923967 () Bool)

(assert (=> start!86064 m!923967))

(declare-fun m!923969 () Bool)

(assert (=> start!86064 m!923969))

(assert (=> b!996965 m!923961))

(assert (=> b!996965 m!923961))

(declare-fun m!923971 () Bool)

(assert (=> b!996965 m!923971))

(declare-fun m!923973 () Bool)

(assert (=> b!996969 m!923973))

(declare-fun m!923975 () Bool)

(assert (=> b!996967 m!923975))

(declare-fun m!923977 () Bool)

(assert (=> b!996966 m!923977))

(declare-fun m!923979 () Bool)

(assert (=> b!996968 m!923979))

(push 1)

(assert (not b!996965))

(assert (not b!996969))

(assert (not b!996972))

(assert (not start!86064))

(assert (not b!996964))

(assert (not b!996968))

(assert (not b!996966))

(assert (not b!996967))

(check-sat)

