; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32344 () Bool)

(assert start!32344)

(declare-fun b!322167 () Bool)

(declare-fun res!176203 () Bool)

(declare-fun e!199445 () Bool)

(assert (=> b!322167 (=> (not res!176203) (not e!199445))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322167 (= res!176203 (validKeyInArray!0 k!2497))))

(declare-fun b!322168 () Bool)

(declare-fun res!176202 () Bool)

(assert (=> b!322168 (=> (not res!176202) (not e!199445))))

(declare-datatypes ((array!16496 0))(
  ( (array!16497 (arr!7805 (Array (_ BitVec 32) (_ BitVec 64))) (size!8157 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16496)

(declare-fun arrayContainsKey!0 (array!16496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322168 (= res!176202 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322169 () Bool)

(declare-fun res!176196 () Bool)

(declare-fun e!199446 () Bool)

(assert (=> b!322169 (=> (not res!176196) (not e!199446))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!322169 (= res!176196 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7805 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7805 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7805 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322171 () Bool)

(declare-fun res!176205 () Bool)

(assert (=> b!322171 (=> (not res!176205) (not e!199445))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16496 (_ BitVec 32)) Bool)

(assert (=> b!322171 (= res!176205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322172 () Bool)

(assert (=> b!322172 (= e!199445 e!199446)))

(declare-fun res!176197 () Bool)

(assert (=> b!322172 (=> (not res!176197) (not e!199446))))

(declare-datatypes ((SeekEntryResult!2901 0))(
  ( (MissingZero!2901 (index!13780 (_ BitVec 32))) (Found!2901 (index!13781 (_ BitVec 32))) (Intermediate!2901 (undefined!3713 Bool) (index!13782 (_ BitVec 32)) (x!32150 (_ BitVec 32))) (Undefined!2901) (MissingVacant!2901 (index!13783 (_ BitVec 32))) )
))
(declare-fun lt!156425 () SeekEntryResult!2901)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16496 (_ BitVec 32)) SeekEntryResult!2901)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322172 (= res!176197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156425))))

(assert (=> b!322172 (= lt!156425 (Intermediate!2901 false resIndex!58 resX!58))))

(declare-fun b!322173 () Bool)

(assert (=> b!322173 (= e!199446 false)))

(declare-fun lt!156426 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322173 (= lt!156426 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun res!176201 () Bool)

(assert (=> start!32344 (=> (not res!176201) (not e!199445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32344 (= res!176201 (validMask!0 mask!3777))))

(assert (=> start!32344 e!199445))

(declare-fun array_inv!5755 (array!16496) Bool)

(assert (=> start!32344 (array_inv!5755 a!3305)))

(assert (=> start!32344 true))

(declare-fun b!322170 () Bool)

(declare-fun res!176199 () Bool)

(assert (=> b!322170 (=> (not res!176199) (not e!199446))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322170 (= res!176199 (and (= (select (arr!7805 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8157 a!3305))))))

(declare-fun b!322174 () Bool)

(declare-fun res!176198 () Bool)

(assert (=> b!322174 (=> (not res!176198) (not e!199445))))

(assert (=> b!322174 (= res!176198 (and (= (size!8157 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8157 a!3305))))))

(declare-fun b!322175 () Bool)

(declare-fun res!176204 () Bool)

(assert (=> b!322175 (=> (not res!176204) (not e!199446))))

(assert (=> b!322175 (= res!176204 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156425))))

(declare-fun b!322176 () Bool)

(declare-fun res!176200 () Bool)

(assert (=> b!322176 (=> (not res!176200) (not e!199445))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16496 (_ BitVec 32)) SeekEntryResult!2901)

(assert (=> b!322176 (= res!176200 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2901 i!1250)))))

(assert (= (and start!32344 res!176201) b!322174))

(assert (= (and b!322174 res!176198) b!322167))

(assert (= (and b!322167 res!176203) b!322168))

(assert (= (and b!322168 res!176202) b!322176))

(assert (= (and b!322176 res!176200) b!322171))

(assert (= (and b!322171 res!176205) b!322172))

(assert (= (and b!322172 res!176197) b!322170))

(assert (= (and b!322170 res!176199) b!322175))

(assert (= (and b!322175 res!176204) b!322169))

(assert (= (and b!322169 res!176196) b!322173))

(declare-fun m!330331 () Bool)

(assert (=> b!322168 m!330331))

(declare-fun m!330333 () Bool)

(assert (=> b!322167 m!330333))

(declare-fun m!330335 () Bool)

(assert (=> b!322170 m!330335))

(declare-fun m!330337 () Bool)

(assert (=> b!322172 m!330337))

(assert (=> b!322172 m!330337))

(declare-fun m!330339 () Bool)

(assert (=> b!322172 m!330339))

(declare-fun m!330341 () Bool)

(assert (=> b!322173 m!330341))

(declare-fun m!330343 () Bool)

(assert (=> b!322176 m!330343))

(declare-fun m!330345 () Bool)

(assert (=> b!322169 m!330345))

(declare-fun m!330347 () Bool)

(assert (=> b!322175 m!330347))

(declare-fun m!330349 () Bool)

(assert (=> start!32344 m!330349))

(declare-fun m!330351 () Bool)

(assert (=> start!32344 m!330351))

(declare-fun m!330353 () Bool)

(assert (=> b!322171 m!330353))

(push 1)

(assert (not b!322176))

(assert (not b!322172))

(assert (not b!322175))

(assert (not b!322171))

(assert (not start!32344))

(assert (not b!322168))

(assert (not b!322173))

(assert (not b!322167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

