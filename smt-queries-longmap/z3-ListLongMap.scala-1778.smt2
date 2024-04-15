; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32354 () Bool)

(assert start!32354)

(declare-datatypes ((array!16497 0))(
  ( (array!16498 (arr!7806 (Array (_ BitVec 32) (_ BitVec 64))) (size!8159 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16497)

(declare-fun e!199383 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!322161 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!322161 (= e!199383 (not (or (not (= (select (arr!7806 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322161 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!9821 0))(
  ( (Unit!9822) )
))
(declare-fun lt!156213 () Unit!9821)

(declare-fun e!199381 () Unit!9821)

(assert (=> b!322161 (= lt!156213 e!199381)))

(declare-fun c!50600 () Bool)

(assert (=> b!322161 (= c!50600 (not (= resIndex!58 index!1840)))))

(declare-fun b!322162 () Bool)

(declare-fun res!176226 () Bool)

(declare-fun e!199385 () Bool)

(assert (=> b!322162 (=> (not res!176226) (not e!199385))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322162 (= res!176226 (and (= (size!8159 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8159 a!3305))))))

(declare-fun b!322163 () Bool)

(declare-fun Unit!9823 () Unit!9821)

(assert (=> b!322163 (= e!199381 Unit!9823)))

(declare-fun b!322164 () Bool)

(declare-fun res!176225 () Bool)

(assert (=> b!322164 (=> (not res!176225) (not e!199383))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322164 (= res!176225 (and (= (select (arr!7806 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8159 a!3305))))))

(declare-fun b!322165 () Bool)

(declare-fun res!176222 () Bool)

(assert (=> b!322165 (=> (not res!176222) (not e!199385))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322165 (= res!176222 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322167 () Bool)

(declare-fun e!199384 () Unit!9821)

(declare-fun Unit!9824 () Unit!9821)

(assert (=> b!322167 (= e!199384 Unit!9824)))

(assert (=> b!322167 false))

(declare-fun b!322168 () Bool)

(declare-fun res!176221 () Bool)

(assert (=> b!322168 (=> (not res!176221) (not e!199383))))

(assert (=> b!322168 (= res!176221 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7806 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322169 () Bool)

(declare-fun res!176227 () Bool)

(assert (=> b!322169 (=> (not res!176227) (not e!199385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322169 (= res!176227 (validKeyInArray!0 k0!2497))))

(declare-fun b!322170 () Bool)

(declare-fun res!176229 () Bool)

(assert (=> b!322170 (=> (not res!176229) (not e!199383))))

(declare-datatypes ((SeekEntryResult!2936 0))(
  ( (MissingZero!2936 (index!13920 (_ BitVec 32))) (Found!2936 (index!13921 (_ BitVec 32))) (Intermediate!2936 (undefined!3748 Bool) (index!13922 (_ BitVec 32)) (x!32199 (_ BitVec 32))) (Undefined!2936) (MissingVacant!2936 (index!13923 (_ BitVec 32))) )
))
(declare-fun lt!156214 () SeekEntryResult!2936)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16497 (_ BitVec 32)) SeekEntryResult!2936)

(assert (=> b!322170 (= res!176229 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156214))))

(declare-fun b!322171 () Bool)

(assert (=> b!322171 (= e!199385 e!199383)))

(declare-fun res!176220 () Bool)

(assert (=> b!322171 (=> (not res!176220) (not e!199383))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322171 (= res!176220 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156214))))

(assert (=> b!322171 (= lt!156214 (Intermediate!2936 false resIndex!58 resX!58))))

(declare-fun b!322172 () Bool)

(declare-fun res!176223 () Bool)

(assert (=> b!322172 (=> (not res!176223) (not e!199385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16497 (_ BitVec 32)) Bool)

(assert (=> b!322172 (= res!176223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322173 () Bool)

(declare-fun res!176224 () Bool)

(assert (=> b!322173 (=> (not res!176224) (not e!199385))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16497 (_ BitVec 32)) SeekEntryResult!2936)

(assert (=> b!322173 (= res!176224 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2936 i!1250)))))

(declare-fun b!322174 () Bool)

(declare-fun e!199380 () Unit!9821)

(assert (=> b!322174 (= e!199381 e!199380)))

(declare-fun c!50599 () Bool)

(assert (=> b!322174 (= c!50599 (or (= (select (arr!7806 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7806 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322175 () Bool)

(assert (=> b!322175 false))

(declare-fun lt!156215 () Unit!9821)

(assert (=> b!322175 (= lt!156215 e!199384)))

(declare-fun c!50598 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322175 (= c!50598 ((_ is Intermediate!2936) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9825 () Unit!9821)

(assert (=> b!322175 (= e!199380 Unit!9825)))

(declare-fun b!322176 () Bool)

(declare-fun Unit!9826 () Unit!9821)

(assert (=> b!322176 (= e!199384 Unit!9826)))

(declare-fun b!322166 () Bool)

(assert (=> b!322166 false))

(declare-fun Unit!9827 () Unit!9821)

(assert (=> b!322166 (= e!199380 Unit!9827)))

(declare-fun res!176228 () Bool)

(assert (=> start!32354 (=> (not res!176228) (not e!199385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32354 (= res!176228 (validMask!0 mask!3777))))

(assert (=> start!32354 e!199385))

(declare-fun array_inv!5778 (array!16497) Bool)

(assert (=> start!32354 (array_inv!5778 a!3305)))

(assert (=> start!32354 true))

(assert (= (and start!32354 res!176228) b!322162))

(assert (= (and b!322162 res!176226) b!322169))

(assert (= (and b!322169 res!176227) b!322165))

(assert (= (and b!322165 res!176222) b!322173))

(assert (= (and b!322173 res!176224) b!322172))

(assert (= (and b!322172 res!176223) b!322171))

(assert (= (and b!322171 res!176220) b!322164))

(assert (= (and b!322164 res!176225) b!322170))

(assert (= (and b!322170 res!176229) b!322168))

(assert (= (and b!322168 res!176221) b!322161))

(assert (= (and b!322161 c!50600) b!322174))

(assert (= (and b!322161 (not c!50600)) b!322163))

(assert (= (and b!322174 c!50599) b!322166))

(assert (= (and b!322174 (not c!50599)) b!322175))

(assert (= (and b!322175 c!50598) b!322176))

(assert (= (and b!322175 (not c!50598)) b!322167))

(declare-fun m!329545 () Bool)

(assert (=> b!322164 m!329545))

(declare-fun m!329547 () Bool)

(assert (=> b!322174 m!329547))

(assert (=> b!322168 m!329547))

(declare-fun m!329549 () Bool)

(assert (=> b!322169 m!329549))

(declare-fun m!329551 () Bool)

(assert (=> b!322175 m!329551))

(assert (=> b!322175 m!329551))

(declare-fun m!329553 () Bool)

(assert (=> b!322175 m!329553))

(declare-fun m!329555 () Bool)

(assert (=> b!322165 m!329555))

(declare-fun m!329557 () Bool)

(assert (=> b!322170 m!329557))

(assert (=> b!322161 m!329547))

(declare-fun m!329559 () Bool)

(assert (=> b!322172 m!329559))

(declare-fun m!329561 () Bool)

(assert (=> start!32354 m!329561))

(declare-fun m!329563 () Bool)

(assert (=> start!32354 m!329563))

(declare-fun m!329565 () Bool)

(assert (=> b!322173 m!329565))

(declare-fun m!329567 () Bool)

(assert (=> b!322171 m!329567))

(assert (=> b!322171 m!329567))

(declare-fun m!329569 () Bool)

(assert (=> b!322171 m!329569))

(check-sat (not b!322173) (not start!32354) (not b!322169) (not b!322170) (not b!322175) (not b!322165) (not b!322171) (not b!322172))
(check-sat)
