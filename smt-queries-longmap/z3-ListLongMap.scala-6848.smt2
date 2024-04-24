; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86464 () Bool)

(assert start!86464)

(declare-fun b!999663 () Bool)

(declare-fun e!563814 () Bool)

(declare-fun e!563813 () Bool)

(assert (=> b!999663 (= e!563814 e!563813)))

(declare-fun res!668742 () Bool)

(assert (=> b!999663 (=> (not res!668742) (not e!563813))))

(declare-datatypes ((SeekEntryResult!9283 0))(
  ( (MissingZero!9283 (index!39503 (_ BitVec 32))) (Found!9283 (index!39504 (_ BitVec 32))) (Intermediate!9283 (undefined!10095 Bool) (index!39505 (_ BitVec 32)) (x!87095 (_ BitVec 32))) (Undefined!9283) (MissingVacant!9283 (index!39506 (_ BitVec 32))) )
))
(declare-fun lt!442170 () SeekEntryResult!9283)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999663 (= res!668742 (or (= lt!442170 (MissingVacant!9283 i!1194)) (= lt!442170 (MissingZero!9283 i!1194))))))

(declare-datatypes ((array!63186 0))(
  ( (array!63187 (arr!30415 (Array (_ BitVec 32) (_ BitVec 64))) (size!30918 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63186)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63186 (_ BitVec 32)) SeekEntryResult!9283)

(assert (=> b!999663 (= lt!442170 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999664 () Bool)

(declare-fun e!563811 () Bool)

(assert (=> b!999664 (= e!563813 e!563811)))

(declare-fun res!668734 () Bool)

(assert (=> b!999664 (=> (not res!668734) (not e!563811))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442172 () SeekEntryResult!9283)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63186 (_ BitVec 32)) SeekEntryResult!9283)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999664 (= res!668734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30415 a!3219) j!170) mask!3464) (select (arr!30415 a!3219) j!170) a!3219 mask!3464) lt!442172))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999664 (= lt!442172 (Intermediate!9283 false resIndex!38 resX!38))))

(declare-fun b!999665 () Bool)

(declare-fun res!668739 () Bool)

(assert (=> b!999665 (=> (not res!668739) (not e!563811))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999665 (= res!668739 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30415 a!3219) j!170) a!3219 mask!3464) lt!442172))))

(declare-fun b!999666 () Bool)

(declare-fun res!668736 () Bool)

(assert (=> b!999666 (=> (not res!668736) (not e!563814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999666 (= res!668736 (validKeyInArray!0 k0!2224))))

(declare-fun b!999667 () Bool)

(declare-fun res!668743 () Bool)

(assert (=> b!999667 (=> (not res!668743) (not e!563813))))

(assert (=> b!999667 (= res!668743 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30918 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30918 a!3219))))))

(declare-fun b!999668 () Bool)

(declare-fun res!668741 () Bool)

(assert (=> b!999668 (=> (not res!668741) (not e!563814))))

(assert (=> b!999668 (= res!668741 (validKeyInArray!0 (select (arr!30415 a!3219) j!170)))))

(declare-fun b!999669 () Bool)

(assert (=> b!999669 (= e!563811 false)))

(declare-fun lt!442171 () (_ BitVec 32))

(assert (=> b!999669 (= lt!442171 (toIndex!0 (select (store (arr!30415 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!999670 () Bool)

(declare-fun res!668735 () Bool)

(assert (=> b!999670 (=> (not res!668735) (not e!563813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63186 (_ BitVec 32)) Bool)

(assert (=> b!999670 (= res!668735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999672 () Bool)

(declare-fun res!668744 () Bool)

(assert (=> b!999672 (=> (not res!668744) (not e!563814))))

(declare-fun arrayContainsKey!0 (array!63186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999672 (= res!668744 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999673 () Bool)

(declare-fun res!668740 () Bool)

(assert (=> b!999673 (=> (not res!668740) (not e!563813))))

(declare-datatypes ((List!21062 0))(
  ( (Nil!21059) (Cons!21058 (h!22238 (_ BitVec 64)) (t!30055 List!21062)) )
))
(declare-fun arrayNoDuplicates!0 (array!63186 (_ BitVec 32) List!21062) Bool)

(assert (=> b!999673 (= res!668740 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21059))))

(declare-fun b!999671 () Bool)

(declare-fun res!668738 () Bool)

(assert (=> b!999671 (=> (not res!668738) (not e!563814))))

(assert (=> b!999671 (= res!668738 (and (= (size!30918 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30918 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30918 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!668737 () Bool)

(assert (=> start!86464 (=> (not res!668737) (not e!563814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86464 (= res!668737 (validMask!0 mask!3464))))

(assert (=> start!86464 e!563814))

(declare-fun array_inv!23551 (array!63186) Bool)

(assert (=> start!86464 (array_inv!23551 a!3219)))

(assert (=> start!86464 true))

(assert (= (and start!86464 res!668737) b!999671))

(assert (= (and b!999671 res!668738) b!999668))

(assert (= (and b!999668 res!668741) b!999666))

(assert (= (and b!999666 res!668736) b!999672))

(assert (= (and b!999672 res!668744) b!999663))

(assert (= (and b!999663 res!668742) b!999670))

(assert (= (and b!999670 res!668735) b!999673))

(assert (= (and b!999673 res!668740) b!999667))

(assert (= (and b!999667 res!668743) b!999664))

(assert (= (and b!999664 res!668734) b!999665))

(assert (= (and b!999665 res!668739) b!999669))

(declare-fun m!926471 () Bool)

(assert (=> b!999673 m!926471))

(declare-fun m!926473 () Bool)

(assert (=> b!999670 m!926473))

(declare-fun m!926475 () Bool)

(assert (=> b!999663 m!926475))

(declare-fun m!926477 () Bool)

(assert (=> b!999669 m!926477))

(declare-fun m!926479 () Bool)

(assert (=> b!999669 m!926479))

(assert (=> b!999669 m!926479))

(declare-fun m!926481 () Bool)

(assert (=> b!999669 m!926481))

(declare-fun m!926483 () Bool)

(assert (=> b!999672 m!926483))

(declare-fun m!926485 () Bool)

(assert (=> b!999665 m!926485))

(assert (=> b!999665 m!926485))

(declare-fun m!926487 () Bool)

(assert (=> b!999665 m!926487))

(assert (=> b!999668 m!926485))

(assert (=> b!999668 m!926485))

(declare-fun m!926489 () Bool)

(assert (=> b!999668 m!926489))

(declare-fun m!926491 () Bool)

(assert (=> b!999666 m!926491))

(declare-fun m!926493 () Bool)

(assert (=> start!86464 m!926493))

(declare-fun m!926495 () Bool)

(assert (=> start!86464 m!926495))

(assert (=> b!999664 m!926485))

(assert (=> b!999664 m!926485))

(declare-fun m!926497 () Bool)

(assert (=> b!999664 m!926497))

(assert (=> b!999664 m!926497))

(assert (=> b!999664 m!926485))

(declare-fun m!926499 () Bool)

(assert (=> b!999664 m!926499))

(check-sat (not b!999666) (not b!999672) (not b!999663) (not start!86464) (not b!999665) (not b!999664) (not b!999668) (not b!999673) (not b!999669) (not b!999670))
(check-sat)
