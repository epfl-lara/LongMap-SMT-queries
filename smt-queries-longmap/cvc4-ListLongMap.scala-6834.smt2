; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86046 () Bool)

(assert start!86046)

(declare-fun b!996703 () Bool)

(declare-fun res!666823 () Bool)

(declare-fun e!562286 () Bool)

(assert (=> b!996703 (=> (not res!666823) (not e!562286))))

(declare-datatypes ((array!63051 0))(
  ( (array!63052 (arr!30357 (Array (_ BitVec 32) (_ BitVec 64))) (size!30859 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63051)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996703 (= res!666823 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30859 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30859 a!3219))))))

(declare-fun b!996704 () Bool)

(declare-fun res!666821 () Bool)

(assert (=> b!996704 (=> (not res!666821) (not e!562286))))

(declare-datatypes ((List!21033 0))(
  ( (Nil!21030) (Cons!21029 (h!22194 (_ BitVec 64)) (t!30034 List!21033)) )
))
(declare-fun arrayNoDuplicates!0 (array!63051 (_ BitVec 32) List!21033) Bool)

(assert (=> b!996704 (= res!666821 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21030))))

(declare-fun b!996705 () Bool)

(declare-fun res!666820 () Bool)

(declare-fun e!562287 () Bool)

(assert (=> b!996705 (=> (not res!666820) (not e!562287))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996705 (= res!666820 (and (= (size!30859 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30859 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30859 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!666822 () Bool)

(assert (=> start!86046 (=> (not res!666822) (not e!562287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86046 (= res!666822 (validMask!0 mask!3464))))

(assert (=> start!86046 e!562287))

(declare-fun array_inv!23481 (array!63051) Bool)

(assert (=> start!86046 (array_inv!23481 a!3219)))

(assert (=> start!86046 true))

(declare-fun b!996706 () Bool)

(declare-fun res!666819 () Bool)

(assert (=> b!996706 (=> (not res!666819) (not e!562286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63051 (_ BitVec 32)) Bool)

(assert (=> b!996706 (= res!666819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996707 () Bool)

(assert (=> b!996707 (= e!562286 false)))

(declare-datatypes ((SeekEntryResult!9289 0))(
  ( (MissingZero!9289 (index!39527 (_ BitVec 32))) (Found!9289 (index!39528 (_ BitVec 32))) (Intermediate!9289 (undefined!10101 Bool) (index!39529 (_ BitVec 32)) (x!86957 (_ BitVec 32))) (Undefined!9289) (MissingVacant!9289 (index!39530 (_ BitVec 32))) )
))
(declare-fun lt!441283 () SeekEntryResult!9289)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63051 (_ BitVec 32)) SeekEntryResult!9289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996707 (= lt!441283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30357 a!3219) j!170) mask!3464) (select (arr!30357 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996708 () Bool)

(declare-fun res!666824 () Bool)

(assert (=> b!996708 (=> (not res!666824) (not e!562287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996708 (= res!666824 (validKeyInArray!0 (select (arr!30357 a!3219) j!170)))))

(declare-fun b!996709 () Bool)

(declare-fun res!666818 () Bool)

(assert (=> b!996709 (=> (not res!666818) (not e!562287))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!996709 (= res!666818 (validKeyInArray!0 k!2224))))

(declare-fun b!996710 () Bool)

(declare-fun res!666817 () Bool)

(assert (=> b!996710 (=> (not res!666817) (not e!562287))))

(declare-fun arrayContainsKey!0 (array!63051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996710 (= res!666817 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996711 () Bool)

(assert (=> b!996711 (= e!562287 e!562286)))

(declare-fun res!666825 () Bool)

(assert (=> b!996711 (=> (not res!666825) (not e!562286))))

(declare-fun lt!441284 () SeekEntryResult!9289)

(assert (=> b!996711 (= res!666825 (or (= lt!441284 (MissingVacant!9289 i!1194)) (= lt!441284 (MissingZero!9289 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63051 (_ BitVec 32)) SeekEntryResult!9289)

(assert (=> b!996711 (= lt!441284 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86046 res!666822) b!996705))

(assert (= (and b!996705 res!666820) b!996708))

(assert (= (and b!996708 res!666824) b!996709))

(assert (= (and b!996709 res!666818) b!996710))

(assert (= (and b!996710 res!666817) b!996711))

(assert (= (and b!996711 res!666825) b!996706))

(assert (= (and b!996706 res!666819) b!996704))

(assert (= (and b!996704 res!666821) b!996703))

(assert (= (and b!996703 res!666823) b!996707))

(declare-fun m!923761 () Bool)

(assert (=> b!996708 m!923761))

(assert (=> b!996708 m!923761))

(declare-fun m!923763 () Bool)

(assert (=> b!996708 m!923763))

(declare-fun m!923765 () Bool)

(assert (=> b!996704 m!923765))

(assert (=> b!996707 m!923761))

(assert (=> b!996707 m!923761))

(declare-fun m!923767 () Bool)

(assert (=> b!996707 m!923767))

(assert (=> b!996707 m!923767))

(assert (=> b!996707 m!923761))

(declare-fun m!923769 () Bool)

(assert (=> b!996707 m!923769))

(declare-fun m!923771 () Bool)

(assert (=> b!996709 m!923771))

(declare-fun m!923773 () Bool)

(assert (=> b!996711 m!923773))

(declare-fun m!923775 () Bool)

(assert (=> b!996710 m!923775))

(declare-fun m!923777 () Bool)

(assert (=> start!86046 m!923777))

(declare-fun m!923779 () Bool)

(assert (=> start!86046 m!923779))

(declare-fun m!923781 () Bool)

(assert (=> b!996706 m!923781))

(push 1)

(assert (not b!996709))

(assert (not b!996711))

(assert (not b!996710))

(assert (not b!996708))

(assert (not start!86046))

(assert (not b!996704))

(assert (not b!996706))

(assert (not b!996707))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

