; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85962 () Bool)

(assert start!85962)

(declare-fun b!996055 () Bool)

(declare-fun res!666264 () Bool)

(declare-fun e!562018 () Bool)

(assert (=> b!996055 (=> (not res!666264) (not e!562018))))

(declare-datatypes ((array!63012 0))(
  ( (array!63013 (arr!30339 (Array (_ BitVec 32) (_ BitVec 64))) (size!30841 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63012)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996055 (= res!666264 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30841 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30841 a!3219))))))

(declare-fun b!996056 () Bool)

(declare-fun res!666259 () Bool)

(assert (=> b!996056 (=> (not res!666259) (not e!562018))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63012 (_ BitVec 32)) Bool)

(assert (=> b!996056 (= res!666259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!666262 () Bool)

(declare-fun e!562017 () Bool)

(assert (=> start!85962 (=> (not res!666262) (not e!562017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85962 (= res!666262 (validMask!0 mask!3464))))

(assert (=> start!85962 e!562017))

(declare-fun array_inv!23463 (array!63012) Bool)

(assert (=> start!85962 (array_inv!23463 a!3219)))

(assert (=> start!85962 true))

(declare-fun b!996057 () Bool)

(declare-fun res!666257 () Bool)

(assert (=> b!996057 (=> (not res!666257) (not e!562017))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996057 (= res!666257 (validKeyInArray!0 (select (arr!30339 a!3219) j!170)))))

(declare-fun b!996058 () Bool)

(declare-fun res!666260 () Bool)

(assert (=> b!996058 (=> (not res!666260) (not e!562017))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996058 (= res!666260 (and (= (size!30841 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30841 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30841 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996059 () Bool)

(declare-fun res!666258 () Bool)

(assert (=> b!996059 (=> (not res!666258) (not e!562018))))

(declare-datatypes ((List!21015 0))(
  ( (Nil!21012) (Cons!21011 (h!22173 (_ BitVec 64)) (t!30016 List!21015)) )
))
(declare-fun arrayNoDuplicates!0 (array!63012 (_ BitVec 32) List!21015) Bool)

(assert (=> b!996059 (= res!666258 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21012))))

(declare-fun b!996060 () Bool)

(declare-fun res!666256 () Bool)

(assert (=> b!996060 (=> (not res!666256) (not e!562017))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!996060 (= res!666256 (validKeyInArray!0 k!2224))))

(declare-fun b!996061 () Bool)

(declare-fun res!666263 () Bool)

(assert (=> b!996061 (=> (not res!666263) (not e!562017))))

(declare-fun arrayContainsKey!0 (array!63012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996061 (= res!666263 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996062 () Bool)

(assert (=> b!996062 (= e!562018 false)))

(declare-fun lt!441113 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996062 (= lt!441113 (toIndex!0 (select (arr!30339 a!3219) j!170) mask!3464))))

(declare-fun b!996063 () Bool)

(assert (=> b!996063 (= e!562017 e!562018)))

(declare-fun res!666261 () Bool)

(assert (=> b!996063 (=> (not res!666261) (not e!562018))))

(declare-datatypes ((SeekEntryResult!9271 0))(
  ( (MissingZero!9271 (index!39455 (_ BitVec 32))) (Found!9271 (index!39456 (_ BitVec 32))) (Intermediate!9271 (undefined!10083 Bool) (index!39457 (_ BitVec 32)) (x!86888 (_ BitVec 32))) (Undefined!9271) (MissingVacant!9271 (index!39458 (_ BitVec 32))) )
))
(declare-fun lt!441112 () SeekEntryResult!9271)

(assert (=> b!996063 (= res!666261 (or (= lt!441112 (MissingVacant!9271 i!1194)) (= lt!441112 (MissingZero!9271 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63012 (_ BitVec 32)) SeekEntryResult!9271)

(assert (=> b!996063 (= lt!441112 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85962 res!666262) b!996058))

(assert (= (and b!996058 res!666260) b!996057))

(assert (= (and b!996057 res!666257) b!996060))

(assert (= (and b!996060 res!666256) b!996061))

(assert (= (and b!996061 res!666263) b!996063))

(assert (= (and b!996063 res!666261) b!996056))

(assert (= (and b!996056 res!666259) b!996059))

(assert (= (and b!996059 res!666258) b!996055))

(assert (= (and b!996055 res!666264) b!996062))

(declare-fun m!923289 () Bool)

(assert (=> b!996056 m!923289))

(declare-fun m!923291 () Bool)

(assert (=> b!996057 m!923291))

(assert (=> b!996057 m!923291))

(declare-fun m!923293 () Bool)

(assert (=> b!996057 m!923293))

(declare-fun m!923295 () Bool)

(assert (=> b!996060 m!923295))

(assert (=> b!996062 m!923291))

(assert (=> b!996062 m!923291))

(declare-fun m!923297 () Bool)

(assert (=> b!996062 m!923297))

(declare-fun m!923299 () Bool)

(assert (=> b!996063 m!923299))

(declare-fun m!923301 () Bool)

(assert (=> b!996061 m!923301))

(declare-fun m!923303 () Bool)

(assert (=> start!85962 m!923303))

(declare-fun m!923305 () Bool)

(assert (=> start!85962 m!923305))

(declare-fun m!923307 () Bool)

(assert (=> b!996059 m!923307))

(push 1)

(assert (not b!996060))

(assert (not start!85962))

(assert (not b!996059))

(assert (not b!996063))

(assert (not b!996061))

(assert (not b!996057))

(assert (not b!996062))

(assert (not b!996056))

(check-sat)

