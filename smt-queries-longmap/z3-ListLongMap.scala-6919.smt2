; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86932 () Bool)

(assert start!86932)

(declare-fun b!1008347 () Bool)

(declare-fun res!677245 () Bool)

(declare-fun e!567374 () Bool)

(assert (=> b!1008347 (=> (not res!677245) (not e!567374))))

(declare-datatypes ((array!63580 0))(
  ( (array!63581 (arr!30611 (Array (_ BitVec 32) (_ BitVec 64))) (size!31113 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63580)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1008347 (= res!677245 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31113 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31113 a!3219))))))

(declare-fun res!677240 () Bool)

(declare-fun e!567375 () Bool)

(assert (=> start!86932 (=> (not res!677240) (not e!567375))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86932 (= res!677240 (validMask!0 mask!3464))))

(assert (=> start!86932 e!567375))

(declare-fun array_inv!23735 (array!63580) Bool)

(assert (=> start!86932 (array_inv!23735 a!3219)))

(assert (=> start!86932 true))

(declare-fun b!1008348 () Bool)

(declare-fun res!677253 () Bool)

(assert (=> b!1008348 (=> (not res!677253) (not e!567374))))

(declare-datatypes ((List!21287 0))(
  ( (Nil!21284) (Cons!21283 (h!22469 (_ BitVec 64)) (t!30288 List!21287)) )
))
(declare-fun arrayNoDuplicates!0 (array!63580 (_ BitVec 32) List!21287) Bool)

(assert (=> b!1008348 (= res!677253 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21284))))

(declare-fun b!1008349 () Bool)

(declare-fun e!567379 () Bool)

(declare-fun e!567377 () Bool)

(assert (=> b!1008349 (= e!567379 e!567377)))

(declare-fun res!677242 () Bool)

(assert (=> b!1008349 (=> (not res!677242) (not e!567377))))

(declare-datatypes ((SeekEntryResult!9543 0))(
  ( (MissingZero!9543 (index!40543 (_ BitVec 32))) (Found!9543 (index!40544 (_ BitVec 32))) (Intermediate!9543 (undefined!10355 Bool) (index!40545 (_ BitVec 32)) (x!87933 (_ BitVec 32))) (Undefined!9543) (MissingVacant!9543 (index!40546 (_ BitVec 32))) )
))
(declare-fun lt!445654 () SeekEntryResult!9543)

(declare-fun lt!445657 () SeekEntryResult!9543)

(assert (=> b!1008349 (= res!677242 (= lt!445654 lt!445657))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63580 (_ BitVec 32)) SeekEntryResult!9543)

(assert (=> b!1008349 (= lt!445654 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30611 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008350 () Bool)

(assert (=> b!1008350 (= e!567375 e!567374)))

(declare-fun res!677243 () Bool)

(assert (=> b!1008350 (=> (not res!677243) (not e!567374))))

(declare-fun lt!445658 () SeekEntryResult!9543)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008350 (= res!677243 (or (= lt!445658 (MissingVacant!9543 i!1194)) (= lt!445658 (MissingZero!9543 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63580 (_ BitVec 32)) SeekEntryResult!9543)

(assert (=> b!1008350 (= lt!445658 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008351 () Bool)

(assert (=> b!1008351 (= e!567374 e!567379)))

(declare-fun res!677248 () Bool)

(assert (=> b!1008351 (=> (not res!677248) (not e!567379))))

(declare-fun lt!445653 () SeekEntryResult!9543)

(assert (=> b!1008351 (= res!677248 (= lt!445653 lt!445657))))

(assert (=> b!1008351 (= lt!445657 (Intermediate!9543 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008351 (= lt!445653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30611 a!3219) j!170) mask!3464) (select (arr!30611 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008352 () Bool)

(declare-fun res!677250 () Bool)

(assert (=> b!1008352 (=> (not res!677250) (not e!567375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008352 (= res!677250 (validKeyInArray!0 (select (arr!30611 a!3219) j!170)))))

(declare-fun b!1008353 () Bool)

(declare-fun res!677241 () Bool)

(assert (=> b!1008353 (=> (not res!677241) (not e!567375))))

(assert (=> b!1008353 (= res!677241 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008354 () Bool)

(declare-fun res!677246 () Bool)

(assert (=> b!1008354 (=> (not res!677246) (not e!567375))))

(assert (=> b!1008354 (= res!677246 (and (= (size!31113 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31113 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31113 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008355 () Bool)

(declare-fun e!567376 () Bool)

(assert (=> b!1008355 (= e!567377 e!567376)))

(declare-fun res!677251 () Bool)

(assert (=> b!1008355 (=> (not res!677251) (not e!567376))))

(declare-fun lt!445652 () (_ BitVec 64))

(declare-fun lt!445656 () array!63580)

(assert (=> b!1008355 (= res!677251 (not (= lt!445653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445652 mask!3464) lt!445652 lt!445656 mask!3464))))))

(assert (=> b!1008355 (= lt!445652 (select (store (arr!30611 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008355 (= lt!445656 (array!63581 (store (arr!30611 a!3219) i!1194 k0!2224) (size!31113 a!3219)))))

(declare-fun b!1008356 () Bool)

(declare-fun res!677244 () Bool)

(assert (=> b!1008356 (=> (not res!677244) (not e!567374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63580 (_ BitVec 32)) Bool)

(assert (=> b!1008356 (= res!677244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008357 () Bool)

(assert (=> b!1008357 (= e!567376 false)))

(declare-fun lt!445655 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008357 (= lt!445655 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008358 () Bool)

(declare-fun res!677252 () Bool)

(assert (=> b!1008358 (=> (not res!677252) (not e!567375))))

(declare-fun arrayContainsKey!0 (array!63580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008358 (= res!677252 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008359 () Bool)

(declare-fun res!677247 () Bool)

(assert (=> b!1008359 (=> (not res!677247) (not e!567376))))

(assert (=> b!1008359 (= res!677247 (not (= lt!445654 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445652 lt!445656 mask!3464))))))

(declare-fun b!1008360 () Bool)

(declare-fun res!677249 () Bool)

(assert (=> b!1008360 (=> (not res!677249) (not e!567376))))

(assert (=> b!1008360 (= res!677249 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86932 res!677240) b!1008354))

(assert (= (and b!1008354 res!677246) b!1008352))

(assert (= (and b!1008352 res!677250) b!1008353))

(assert (= (and b!1008353 res!677241) b!1008358))

(assert (= (and b!1008358 res!677252) b!1008350))

(assert (= (and b!1008350 res!677243) b!1008356))

(assert (= (and b!1008356 res!677244) b!1008348))

(assert (= (and b!1008348 res!677253) b!1008347))

(assert (= (and b!1008347 res!677245) b!1008351))

(assert (= (and b!1008351 res!677248) b!1008349))

(assert (= (and b!1008349 res!677242) b!1008355))

(assert (= (and b!1008355 res!677251) b!1008359))

(assert (= (and b!1008359 res!677247) b!1008360))

(assert (= (and b!1008360 res!677249) b!1008357))

(declare-fun m!933107 () Bool)

(assert (=> b!1008353 m!933107))

(declare-fun m!933109 () Bool)

(assert (=> b!1008356 m!933109))

(declare-fun m!933111 () Bool)

(assert (=> b!1008359 m!933111))

(declare-fun m!933113 () Bool)

(assert (=> b!1008348 m!933113))

(declare-fun m!933115 () Bool)

(assert (=> b!1008351 m!933115))

(assert (=> b!1008351 m!933115))

(declare-fun m!933117 () Bool)

(assert (=> b!1008351 m!933117))

(assert (=> b!1008351 m!933117))

(assert (=> b!1008351 m!933115))

(declare-fun m!933119 () Bool)

(assert (=> b!1008351 m!933119))

(assert (=> b!1008352 m!933115))

(assert (=> b!1008352 m!933115))

(declare-fun m!933121 () Bool)

(assert (=> b!1008352 m!933121))

(declare-fun m!933123 () Bool)

(assert (=> b!1008358 m!933123))

(declare-fun m!933125 () Bool)

(assert (=> start!86932 m!933125))

(declare-fun m!933127 () Bool)

(assert (=> start!86932 m!933127))

(declare-fun m!933129 () Bool)

(assert (=> b!1008355 m!933129))

(assert (=> b!1008355 m!933129))

(declare-fun m!933131 () Bool)

(assert (=> b!1008355 m!933131))

(declare-fun m!933133 () Bool)

(assert (=> b!1008355 m!933133))

(declare-fun m!933135 () Bool)

(assert (=> b!1008355 m!933135))

(declare-fun m!933137 () Bool)

(assert (=> b!1008357 m!933137))

(assert (=> b!1008349 m!933115))

(assert (=> b!1008349 m!933115))

(declare-fun m!933139 () Bool)

(assert (=> b!1008349 m!933139))

(declare-fun m!933141 () Bool)

(assert (=> b!1008350 m!933141))

(check-sat (not b!1008357) (not b!1008358) (not b!1008350) (not b!1008355) (not b!1008352) (not b!1008348) (not b!1008356) (not b!1008359) (not start!86932) (not b!1008353) (not b!1008349) (not b!1008351))
(check-sat)
