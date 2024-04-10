; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86928 () Bool)

(assert start!86928)

(declare-fun b!1008263 () Bool)

(declare-fun res!677164 () Bool)

(declare-fun e!567339 () Bool)

(assert (=> b!1008263 (=> (not res!677164) (not e!567339))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((array!63576 0))(
  ( (array!63577 (arr!30609 (Array (_ BitVec 32) (_ BitVec 64))) (size!31111 (_ BitVec 32))) )
))
(declare-fun lt!445616 () array!63576)

(declare-datatypes ((SeekEntryResult!9541 0))(
  ( (MissingZero!9541 (index!40535 (_ BitVec 32))) (Found!9541 (index!40536 (_ BitVec 32))) (Intermediate!9541 (undefined!10353 Bool) (index!40537 (_ BitVec 32)) (x!87923 (_ BitVec 32))) (Undefined!9541) (MissingVacant!9541 (index!40538 (_ BitVec 32))) )
))
(declare-fun lt!445613 () SeekEntryResult!9541)

(declare-fun lt!445612 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63576 (_ BitVec 32)) SeekEntryResult!9541)

(assert (=> b!1008263 (= res!677164 (not (= lt!445613 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445612 lt!445616 mask!3464))))))

(declare-fun b!1008264 () Bool)

(declare-fun res!677165 () Bool)

(assert (=> b!1008264 (=> (not res!677165) (not e!567339))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1008264 (= res!677165 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008265 () Bool)

(declare-fun e!567343 () Bool)

(declare-fun e!567338 () Bool)

(assert (=> b!1008265 (= e!567343 e!567338)))

(declare-fun res!677168 () Bool)

(assert (=> b!1008265 (=> (not res!677168) (not e!567338))))

(declare-fun lt!445610 () SeekEntryResult!9541)

(assert (=> b!1008265 (= res!677168 (= lt!445613 lt!445610))))

(declare-fun a!3219 () array!63576)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1008265 (= lt!445613 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30609 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008266 () Bool)

(declare-fun res!677160 () Bool)

(declare-fun e!567342 () Bool)

(assert (=> b!1008266 (=> (not res!677160) (not e!567342))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008266 (= res!677160 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31111 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31111 a!3219))))))

(declare-fun b!1008267 () Bool)

(declare-fun res!677159 () Bool)

(assert (=> b!1008267 (=> (not res!677159) (not e!567342))))

(declare-datatypes ((List!21285 0))(
  ( (Nil!21282) (Cons!21281 (h!22467 (_ BitVec 64)) (t!30286 List!21285)) )
))
(declare-fun arrayNoDuplicates!0 (array!63576 (_ BitVec 32) List!21285) Bool)

(assert (=> b!1008267 (= res!677159 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21282))))

(declare-fun b!1008268 () Bool)

(assert (=> b!1008268 (= e!567339 false)))

(declare-fun lt!445615 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008268 (= lt!445615 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008269 () Bool)

(declare-fun res!677162 () Bool)

(assert (=> b!1008269 (=> (not res!677162) (not e!567342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63576 (_ BitVec 32)) Bool)

(assert (=> b!1008269 (= res!677162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008270 () Bool)

(declare-fun e!567340 () Bool)

(assert (=> b!1008270 (= e!567340 e!567342)))

(declare-fun res!677169 () Bool)

(assert (=> b!1008270 (=> (not res!677169) (not e!567342))))

(declare-fun lt!445614 () SeekEntryResult!9541)

(assert (=> b!1008270 (= res!677169 (or (= lt!445614 (MissingVacant!9541 i!1194)) (= lt!445614 (MissingZero!9541 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63576 (_ BitVec 32)) SeekEntryResult!9541)

(assert (=> b!1008270 (= lt!445614 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008271 () Bool)

(declare-fun res!677157 () Bool)

(assert (=> b!1008271 (=> (not res!677157) (not e!567340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008271 (= res!677157 (validKeyInArray!0 k!2224))))

(declare-fun b!1008272 () Bool)

(assert (=> b!1008272 (= e!567338 e!567339)))

(declare-fun res!677167 () Bool)

(assert (=> b!1008272 (=> (not res!677167) (not e!567339))))

(declare-fun lt!445611 () SeekEntryResult!9541)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008272 (= res!677167 (not (= lt!445611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445612 mask!3464) lt!445612 lt!445616 mask!3464))))))

(assert (=> b!1008272 (= lt!445612 (select (store (arr!30609 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008272 (= lt!445616 (array!63577 (store (arr!30609 a!3219) i!1194 k!2224) (size!31111 a!3219)))))

(declare-fun b!1008273 () Bool)

(assert (=> b!1008273 (= e!567342 e!567343)))

(declare-fun res!677161 () Bool)

(assert (=> b!1008273 (=> (not res!677161) (not e!567343))))

(assert (=> b!1008273 (= res!677161 (= lt!445611 lt!445610))))

(assert (=> b!1008273 (= lt!445610 (Intermediate!9541 false resIndex!38 resX!38))))

(assert (=> b!1008273 (= lt!445611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30609 a!3219) j!170) mask!3464) (select (arr!30609 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008274 () Bool)

(declare-fun res!677158 () Bool)

(assert (=> b!1008274 (=> (not res!677158) (not e!567340))))

(assert (=> b!1008274 (= res!677158 (validKeyInArray!0 (select (arr!30609 a!3219) j!170)))))

(declare-fun b!1008275 () Bool)

(declare-fun res!677166 () Bool)

(assert (=> b!1008275 (=> (not res!677166) (not e!567340))))

(assert (=> b!1008275 (= res!677166 (and (= (size!31111 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31111 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31111 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008276 () Bool)

(declare-fun res!677156 () Bool)

(assert (=> b!1008276 (=> (not res!677156) (not e!567340))))

(declare-fun arrayContainsKey!0 (array!63576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008276 (= res!677156 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!677163 () Bool)

(assert (=> start!86928 (=> (not res!677163) (not e!567340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86928 (= res!677163 (validMask!0 mask!3464))))

(assert (=> start!86928 e!567340))

(declare-fun array_inv!23733 (array!63576) Bool)

(assert (=> start!86928 (array_inv!23733 a!3219)))

(assert (=> start!86928 true))

(assert (= (and start!86928 res!677163) b!1008275))

(assert (= (and b!1008275 res!677166) b!1008274))

(assert (= (and b!1008274 res!677158) b!1008271))

(assert (= (and b!1008271 res!677157) b!1008276))

(assert (= (and b!1008276 res!677156) b!1008270))

(assert (= (and b!1008270 res!677169) b!1008269))

(assert (= (and b!1008269 res!677162) b!1008267))

(assert (= (and b!1008267 res!677159) b!1008266))

(assert (= (and b!1008266 res!677160) b!1008273))

(assert (= (and b!1008273 res!677161) b!1008265))

(assert (= (and b!1008265 res!677168) b!1008272))

(assert (= (and b!1008272 res!677167) b!1008263))

(assert (= (and b!1008263 res!677164) b!1008264))

(assert (= (and b!1008264 res!677165) b!1008268))

(declare-fun m!933035 () Bool)

(assert (=> b!1008270 m!933035))

(declare-fun m!933037 () Bool)

(assert (=> b!1008276 m!933037))

(declare-fun m!933039 () Bool)

(assert (=> start!86928 m!933039))

(declare-fun m!933041 () Bool)

(assert (=> start!86928 m!933041))

(declare-fun m!933043 () Bool)

(assert (=> b!1008267 m!933043))

(declare-fun m!933045 () Bool)

(assert (=> b!1008274 m!933045))

(assert (=> b!1008274 m!933045))

(declare-fun m!933047 () Bool)

(assert (=> b!1008274 m!933047))

(declare-fun m!933049 () Bool)

(assert (=> b!1008271 m!933049))

(declare-fun m!933051 () Bool)

(assert (=> b!1008263 m!933051))

(declare-fun m!933053 () Bool)

(assert (=> b!1008269 m!933053))

(assert (=> b!1008273 m!933045))

(assert (=> b!1008273 m!933045))

(declare-fun m!933055 () Bool)

(assert (=> b!1008273 m!933055))

(assert (=> b!1008273 m!933055))

(assert (=> b!1008273 m!933045))

(declare-fun m!933057 () Bool)

(assert (=> b!1008273 m!933057))

(assert (=> b!1008265 m!933045))

(assert (=> b!1008265 m!933045))

(declare-fun m!933059 () Bool)

(assert (=> b!1008265 m!933059))

(declare-fun m!933061 () Bool)

(assert (=> b!1008268 m!933061))

(declare-fun m!933063 () Bool)

(assert (=> b!1008272 m!933063))

(assert (=> b!1008272 m!933063))

(declare-fun m!933065 () Bool)

(assert (=> b!1008272 m!933065))

(declare-fun m!933067 () Bool)

(assert (=> b!1008272 m!933067))

(declare-fun m!933069 () Bool)

(assert (=> b!1008272 m!933069))

(push 1)

