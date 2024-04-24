; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87004 () Bool)

(assert start!87004)

(declare-fun b!1007268 () Bool)

(declare-fun res!675600 () Bool)

(declare-fun e!567149 () Bool)

(assert (=> b!1007268 (=> (not res!675600) (not e!567149))))

(declare-datatypes ((array!63522 0))(
  ( (array!63523 (arr!30577 (Array (_ BitVec 32) (_ BitVec 64))) (size!31080 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63522)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007268 (= res!675600 (validKeyInArray!0 (select (arr!30577 a!3219) j!170)))))

(declare-fun b!1007269 () Bool)

(declare-fun res!675597 () Bool)

(declare-fun e!567147 () Bool)

(assert (=> b!1007269 (=> (not res!675597) (not e!567147))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1007269 (= res!675597 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31080 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31080 a!3219))))))

(declare-fun b!1007270 () Bool)

(declare-fun res!675605 () Bool)

(assert (=> b!1007270 (=> (not res!675605) (not e!567147))))

(declare-datatypes ((List!21224 0))(
  ( (Nil!21221) (Cons!21220 (h!22412 (_ BitVec 64)) (t!30217 List!21224)) )
))
(declare-fun arrayNoDuplicates!0 (array!63522 (_ BitVec 32) List!21224) Bool)

(assert (=> b!1007270 (= res!675605 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21221))))

(declare-fun b!1007271 () Bool)

(declare-fun res!675596 () Bool)

(declare-fun e!567150 () Bool)

(assert (=> b!1007271 (=> (not res!675596) (not e!567150))))

(declare-datatypes ((SeekEntryResult!9445 0))(
  ( (MissingZero!9445 (index!40151 (_ BitVec 32))) (Found!9445 (index!40152 (_ BitVec 32))) (Intermediate!9445 (undefined!10257 Bool) (index!40153 (_ BitVec 32)) (x!87713 (_ BitVec 32))) (Undefined!9445) (MissingVacant!9445 (index!40154 (_ BitVec 32))) )
))
(declare-fun lt!445152 () SeekEntryResult!9445)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63522 (_ BitVec 32)) SeekEntryResult!9445)

(assert (=> b!1007271 (= res!675596 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30577 a!3219) j!170) a!3219 mask!3464) lt!445152))))

(declare-fun res!675601 () Bool)

(assert (=> start!87004 (=> (not res!675601) (not e!567149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87004 (= res!675601 (validMask!0 mask!3464))))

(assert (=> start!87004 e!567149))

(declare-fun array_inv!23713 (array!63522) Bool)

(assert (=> start!87004 (array_inv!23713 a!3219)))

(assert (=> start!87004 true))

(declare-fun b!1007272 () Bool)

(declare-fun res!675604 () Bool)

(assert (=> b!1007272 (=> (not res!675604) (not e!567149))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007272 (= res!675604 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007273 () Bool)

(declare-fun res!675603 () Bool)

(assert (=> b!1007273 (=> (not res!675603) (not e!567149))))

(assert (=> b!1007273 (= res!675603 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007274 () Bool)

(declare-fun res!675598 () Bool)

(assert (=> b!1007274 (=> (not res!675598) (not e!567147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63522 (_ BitVec 32)) Bool)

(assert (=> b!1007274 (= res!675598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007275 () Bool)

(assert (=> b!1007275 (= e!567149 e!567147)))

(declare-fun res!675602 () Bool)

(assert (=> b!1007275 (=> (not res!675602) (not e!567147))))

(declare-fun lt!445154 () SeekEntryResult!9445)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007275 (= res!675602 (or (= lt!445154 (MissingVacant!9445 i!1194)) (= lt!445154 (MissingZero!9445 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63522 (_ BitVec 32)) SeekEntryResult!9445)

(assert (=> b!1007275 (= lt!445154 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007276 () Bool)

(assert (=> b!1007276 (= e!567150 false)))

(declare-fun lt!445153 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007276 (= lt!445153 (toIndex!0 (select (store (arr!30577 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!1007277 () Bool)

(assert (=> b!1007277 (= e!567147 e!567150)))

(declare-fun res!675595 () Bool)

(assert (=> b!1007277 (=> (not res!675595) (not e!567150))))

(assert (=> b!1007277 (= res!675595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30577 a!3219) j!170) mask!3464) (select (arr!30577 a!3219) j!170) a!3219 mask!3464) lt!445152))))

(assert (=> b!1007277 (= lt!445152 (Intermediate!9445 false resIndex!38 resX!38))))

(declare-fun b!1007278 () Bool)

(declare-fun res!675599 () Bool)

(assert (=> b!1007278 (=> (not res!675599) (not e!567149))))

(assert (=> b!1007278 (= res!675599 (and (= (size!31080 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31080 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31080 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!87004 res!675601) b!1007278))

(assert (= (and b!1007278 res!675599) b!1007268))

(assert (= (and b!1007268 res!675600) b!1007273))

(assert (= (and b!1007273 res!675603) b!1007272))

(assert (= (and b!1007272 res!675604) b!1007275))

(assert (= (and b!1007275 res!675602) b!1007274))

(assert (= (and b!1007274 res!675598) b!1007270))

(assert (= (and b!1007270 res!675605) b!1007269))

(assert (= (and b!1007269 res!675597) b!1007277))

(assert (= (and b!1007277 res!675595) b!1007271))

(assert (= (and b!1007271 res!675596) b!1007276))

(declare-fun m!932669 () Bool)

(assert (=> b!1007277 m!932669))

(assert (=> b!1007277 m!932669))

(declare-fun m!932671 () Bool)

(assert (=> b!1007277 m!932671))

(assert (=> b!1007277 m!932671))

(assert (=> b!1007277 m!932669))

(declare-fun m!932673 () Bool)

(assert (=> b!1007277 m!932673))

(assert (=> b!1007271 m!932669))

(assert (=> b!1007271 m!932669))

(declare-fun m!932675 () Bool)

(assert (=> b!1007271 m!932675))

(declare-fun m!932677 () Bool)

(assert (=> b!1007275 m!932677))

(declare-fun m!932679 () Bool)

(assert (=> b!1007270 m!932679))

(declare-fun m!932681 () Bool)

(assert (=> start!87004 m!932681))

(declare-fun m!932683 () Bool)

(assert (=> start!87004 m!932683))

(assert (=> b!1007268 m!932669))

(assert (=> b!1007268 m!932669))

(declare-fun m!932685 () Bool)

(assert (=> b!1007268 m!932685))

(declare-fun m!932687 () Bool)

(assert (=> b!1007273 m!932687))

(declare-fun m!932689 () Bool)

(assert (=> b!1007274 m!932689))

(declare-fun m!932691 () Bool)

(assert (=> b!1007272 m!932691))

(declare-fun m!932693 () Bool)

(assert (=> b!1007276 m!932693))

(declare-fun m!932695 () Bool)

(assert (=> b!1007276 m!932695))

(assert (=> b!1007276 m!932695))

(declare-fun m!932697 () Bool)

(assert (=> b!1007276 m!932697))

(check-sat (not start!87004) (not b!1007275) (not b!1007274) (not b!1007270) (not b!1007272) (not b!1007277) (not b!1007276) (not b!1007273) (not b!1007268) (not b!1007271))
(check-sat)
