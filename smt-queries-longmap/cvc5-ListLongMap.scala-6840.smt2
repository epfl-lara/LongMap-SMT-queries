; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86128 () Bool)

(assert start!86128)

(declare-fun b!997294 () Bool)

(declare-fun res!667377 () Bool)

(declare-fun e!562503 () Bool)

(assert (=> b!997294 (=> (not res!667377) (not e!562503))))

(declare-datatypes ((array!63029 0))(
  ( (array!63030 (arr!30344 (Array (_ BitVec 32) (_ BitVec 64))) (size!30848 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63029)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!997294 (= res!667377 (and (= (size!30848 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30848 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30848 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997295 () Bool)

(declare-fun res!667376 () Bool)

(declare-fun e!562505 () Bool)

(assert (=> b!997295 (=> (not res!667376) (not e!562505))))

(declare-datatypes ((List!21086 0))(
  ( (Nil!21083) (Cons!21082 (h!22250 (_ BitVec 64)) (t!30078 List!21086)) )
))
(declare-fun arrayNoDuplicates!0 (array!63029 (_ BitVec 32) List!21086) Bool)

(assert (=> b!997295 (= res!667376 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21083))))

(declare-fun b!997296 () Bool)

(declare-fun res!667378 () Bool)

(assert (=> b!997296 (=> (not res!667378) (not e!562505))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9301 0))(
  ( (MissingZero!9301 (index!39575 (_ BitVec 32))) (Found!9301 (index!39576 (_ BitVec 32))) (Intermediate!9301 (undefined!10113 Bool) (index!39577 (_ BitVec 32)) (x!87018 (_ BitVec 32))) (Undefined!9301) (MissingVacant!9301 (index!39578 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63029 (_ BitVec 32)) SeekEntryResult!9301)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997296 (= res!667378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30344 a!3219) j!170) mask!3464) (select (arr!30344 a!3219) j!170) a!3219 mask!3464) (Intermediate!9301 false resIndex!38 resX!38)))))

(declare-fun res!667382 () Bool)

(assert (=> start!86128 (=> (not res!667382) (not e!562503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86128 (= res!667382 (validMask!0 mask!3464))))

(assert (=> start!86128 e!562503))

(declare-fun array_inv!23487 (array!63029) Bool)

(assert (=> start!86128 (array_inv!23487 a!3219)))

(assert (=> start!86128 true))

(declare-fun b!997297 () Bool)

(declare-fun res!667380 () Bool)

(assert (=> b!997297 (=> (not res!667380) (not e!562503))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997297 (= res!667380 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997298 () Bool)

(declare-fun res!667374 () Bool)

(assert (=> b!997298 (=> (not res!667374) (not e!562505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63029 (_ BitVec 32)) Bool)

(assert (=> b!997298 (= res!667374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997299 () Bool)

(assert (=> b!997299 (= e!562505 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!441237 () SeekEntryResult!9301)

(assert (=> b!997299 (= lt!441237 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30344 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997300 () Bool)

(declare-fun res!667375 () Bool)

(assert (=> b!997300 (=> (not res!667375) (not e!562505))))

(assert (=> b!997300 (= res!667375 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30848 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30848 a!3219))))))

(declare-fun b!997301 () Bool)

(declare-fun res!667373 () Bool)

(assert (=> b!997301 (=> (not res!667373) (not e!562503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997301 (= res!667373 (validKeyInArray!0 (select (arr!30344 a!3219) j!170)))))

(declare-fun b!997302 () Bool)

(assert (=> b!997302 (= e!562503 e!562505)))

(declare-fun res!667381 () Bool)

(assert (=> b!997302 (=> (not res!667381) (not e!562505))))

(declare-fun lt!441238 () SeekEntryResult!9301)

(assert (=> b!997302 (= res!667381 (or (= lt!441238 (MissingVacant!9301 i!1194)) (= lt!441238 (MissingZero!9301 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63029 (_ BitVec 32)) SeekEntryResult!9301)

(assert (=> b!997302 (= lt!441238 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997303 () Bool)

(declare-fun res!667379 () Bool)

(assert (=> b!997303 (=> (not res!667379) (not e!562503))))

(assert (=> b!997303 (= res!667379 (validKeyInArray!0 k!2224))))

(assert (= (and start!86128 res!667382) b!997294))

(assert (= (and b!997294 res!667377) b!997301))

(assert (= (and b!997301 res!667373) b!997303))

(assert (= (and b!997303 res!667379) b!997297))

(assert (= (and b!997297 res!667380) b!997302))

(assert (= (and b!997302 res!667381) b!997298))

(assert (= (and b!997298 res!667374) b!997295))

(assert (= (and b!997295 res!667376) b!997300))

(assert (= (and b!997300 res!667375) b!997296))

(assert (= (and b!997296 res!667378) b!997299))

(declare-fun m!923587 () Bool)

(assert (=> b!997301 m!923587))

(assert (=> b!997301 m!923587))

(declare-fun m!923589 () Bool)

(assert (=> b!997301 m!923589))

(declare-fun m!923591 () Bool)

(assert (=> b!997298 m!923591))

(assert (=> b!997296 m!923587))

(assert (=> b!997296 m!923587))

(declare-fun m!923593 () Bool)

(assert (=> b!997296 m!923593))

(assert (=> b!997296 m!923593))

(assert (=> b!997296 m!923587))

(declare-fun m!923595 () Bool)

(assert (=> b!997296 m!923595))

(declare-fun m!923597 () Bool)

(assert (=> b!997302 m!923597))

(declare-fun m!923599 () Bool)

(assert (=> b!997303 m!923599))

(assert (=> b!997299 m!923587))

(assert (=> b!997299 m!923587))

(declare-fun m!923601 () Bool)

(assert (=> b!997299 m!923601))

(declare-fun m!923603 () Bool)

(assert (=> b!997297 m!923603))

(declare-fun m!923605 () Bool)

(assert (=> start!86128 m!923605))

(declare-fun m!923607 () Bool)

(assert (=> start!86128 m!923607))

(declare-fun m!923609 () Bool)

(assert (=> b!997295 m!923609))

(push 1)

(assert (not b!997303))

(assert (not b!997299))

(assert (not b!997296))

(assert (not b!997302))

(assert (not b!997295))

(assert (not b!997298))

(assert (not start!86128))

(assert (not b!997301))

(assert (not b!997297))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

