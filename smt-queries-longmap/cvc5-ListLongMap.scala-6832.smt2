; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86030 () Bool)

(assert start!86030)

(declare-fun res!666592 () Bool)

(declare-fun e!562214 () Bool)

(assert (=> start!86030 (=> (not res!666592) (not e!562214))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86030 (= res!666592 (validMask!0 mask!3464))))

(assert (=> start!86030 e!562214))

(declare-datatypes ((array!63035 0))(
  ( (array!63036 (arr!30349 (Array (_ BitVec 32) (_ BitVec 64))) (size!30851 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63035)

(declare-fun array_inv!23473 (array!63035) Bool)

(assert (=> start!86030 (array_inv!23473 a!3219)))

(assert (=> start!86030 true))

(declare-fun b!996478 () Bool)

(declare-fun res!666600 () Bool)

(assert (=> b!996478 (=> (not res!666600) (not e!562214))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996478 (= res!666600 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996479 () Bool)

(declare-fun res!666599 () Bool)

(declare-fun e!562215 () Bool)

(assert (=> b!996479 (=> (not res!666599) (not e!562215))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996479 (= res!666599 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30851 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30851 a!3219))))))

(declare-fun b!996480 () Bool)

(declare-fun res!666594 () Bool)

(assert (=> b!996480 (=> (not res!666594) (not e!562214))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996480 (= res!666594 (validKeyInArray!0 (select (arr!30349 a!3219) j!170)))))

(declare-fun b!996481 () Bool)

(assert (=> b!996481 (= e!562214 e!562215)))

(declare-fun res!666596 () Bool)

(assert (=> b!996481 (=> (not res!666596) (not e!562215))))

(declare-datatypes ((SeekEntryResult!9281 0))(
  ( (MissingZero!9281 (index!39495 (_ BitVec 32))) (Found!9281 (index!39496 (_ BitVec 32))) (Intermediate!9281 (undefined!10093 Bool) (index!39497 (_ BitVec 32)) (x!86933 (_ BitVec 32))) (Undefined!9281) (MissingVacant!9281 (index!39498 (_ BitVec 32))) )
))
(declare-fun lt!441244 () SeekEntryResult!9281)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996481 (= res!666596 (or (= lt!441244 (MissingVacant!9281 i!1194)) (= lt!441244 (MissingZero!9281 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63035 (_ BitVec 32)) SeekEntryResult!9281)

(assert (=> b!996481 (= lt!441244 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996482 () Bool)

(assert (=> b!996482 (= e!562215 false)))

(declare-fun lt!441245 () SeekEntryResult!9281)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63035 (_ BitVec 32)) SeekEntryResult!9281)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996482 (= lt!441245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30349 a!3219) j!170) mask!3464) (select (arr!30349 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996483 () Bool)

(declare-fun res!666593 () Bool)

(assert (=> b!996483 (=> (not res!666593) (not e!562215))))

(declare-datatypes ((List!21025 0))(
  ( (Nil!21022) (Cons!21021 (h!22186 (_ BitVec 64)) (t!30026 List!21025)) )
))
(declare-fun arrayNoDuplicates!0 (array!63035 (_ BitVec 32) List!21025) Bool)

(assert (=> b!996483 (= res!666593 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21022))))

(declare-fun b!996484 () Bool)

(declare-fun res!666598 () Bool)

(assert (=> b!996484 (=> (not res!666598) (not e!562214))))

(assert (=> b!996484 (= res!666598 (and (= (size!30851 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30851 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30851 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996485 () Bool)

(declare-fun res!666595 () Bool)

(assert (=> b!996485 (=> (not res!666595) (not e!562215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63035 (_ BitVec 32)) Bool)

(assert (=> b!996485 (= res!666595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996486 () Bool)

(declare-fun res!666597 () Bool)

(assert (=> b!996486 (=> (not res!666597) (not e!562214))))

(assert (=> b!996486 (= res!666597 (validKeyInArray!0 k!2224))))

(assert (= (and start!86030 res!666592) b!996484))

(assert (= (and b!996484 res!666598) b!996480))

(assert (= (and b!996480 res!666594) b!996486))

(assert (= (and b!996486 res!666597) b!996478))

(assert (= (and b!996478 res!666600) b!996481))

(assert (= (and b!996481 res!666596) b!996485))

(assert (= (and b!996485 res!666595) b!996483))

(assert (= (and b!996483 res!666593) b!996479))

(assert (= (and b!996479 res!666599) b!996482))

(declare-fun m!923585 () Bool)

(assert (=> b!996485 m!923585))

(declare-fun m!923587 () Bool)

(assert (=> b!996482 m!923587))

(assert (=> b!996482 m!923587))

(declare-fun m!923589 () Bool)

(assert (=> b!996482 m!923589))

(assert (=> b!996482 m!923589))

(assert (=> b!996482 m!923587))

(declare-fun m!923591 () Bool)

(assert (=> b!996482 m!923591))

(declare-fun m!923593 () Bool)

(assert (=> b!996486 m!923593))

(declare-fun m!923595 () Bool)

(assert (=> start!86030 m!923595))

(declare-fun m!923597 () Bool)

(assert (=> start!86030 m!923597))

(declare-fun m!923599 () Bool)

(assert (=> b!996481 m!923599))

(declare-fun m!923601 () Bool)

(assert (=> b!996483 m!923601))

(assert (=> b!996480 m!923587))

(assert (=> b!996480 m!923587))

(declare-fun m!923603 () Bool)

(assert (=> b!996480 m!923603))

(declare-fun m!923605 () Bool)

(assert (=> b!996478 m!923605))

(push 1)

