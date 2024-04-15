; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25670 () Bool)

(assert start!25670)

(declare-fun res!130349 () Bool)

(declare-fun e!172174 () Bool)

(assert (=> start!25670 (=> (not res!130349) (not e!172174))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25670 (= res!130349 (validMask!0 mask!4002))))

(assert (=> start!25670 e!172174))

(assert (=> start!25670 true))

(declare-datatypes ((array!12837 0))(
  ( (array!12838 (arr!6072 (Array (_ BitVec 32) (_ BitVec 64))) (size!6425 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12837)

(declare-fun array_inv!4044 (array!12837) Bool)

(assert (=> start!25670 (array_inv!4044 a!3436)))

(declare-fun b!266001 () Bool)

(declare-fun res!130354 () Bool)

(assert (=> b!266001 (=> (not res!130354) (not e!172174))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266001 (= res!130354 (and (= (size!6425 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6425 a!3436))))))

(declare-fun b!266002 () Bool)

(declare-fun res!130350 () Bool)

(declare-fun e!172175 () Bool)

(assert (=> b!266002 (=> (not res!130350) (not e!172175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12837 (_ BitVec 32)) Bool)

(assert (=> b!266002 (= res!130350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266003 () Bool)

(declare-fun res!130351 () Bool)

(assert (=> b!266003 (=> (not res!130351) (not e!172174))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266003 (= res!130351 (validKeyInArray!0 k0!2698))))

(declare-fun b!266004 () Bool)

(declare-fun res!130353 () Bool)

(assert (=> b!266004 (=> (not res!130353) (not e!172174))))

(declare-fun arrayContainsKey!0 (array!12837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266004 (= res!130353 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266005 () Bool)

(assert (=> b!266005 (= e!172174 e!172175)))

(declare-fun res!130352 () Bool)

(assert (=> b!266005 (=> (not res!130352) (not e!172175))))

(declare-datatypes ((SeekEntryResult!1262 0))(
  ( (MissingZero!1262 (index!7218 (_ BitVec 32))) (Found!1262 (index!7219 (_ BitVec 32))) (Intermediate!1262 (undefined!2074 Bool) (index!7220 (_ BitVec 32)) (x!25546 (_ BitVec 32))) (Undefined!1262) (MissingVacant!1262 (index!7221 (_ BitVec 32))) )
))
(declare-fun lt!134162 () SeekEntryResult!1262)

(assert (=> b!266005 (= res!130352 (or (= lt!134162 (MissingZero!1262 i!1355)) (= lt!134162 (MissingVacant!1262 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12837 (_ BitVec 32)) SeekEntryResult!1262)

(assert (=> b!266005 (= lt!134162 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266006 () Bool)

(assert (=> b!266006 (= e!172175 false)))

(declare-fun lt!134163 () Bool)

(declare-datatypes ((List!3859 0))(
  ( (Nil!3856) (Cons!3855 (h!4522 (_ BitVec 64)) (t!8932 List!3859)) )
))
(declare-fun arrayNoDuplicates!0 (array!12837 (_ BitVec 32) List!3859) Bool)

(assert (=> b!266006 (= lt!134163 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3856))))

(assert (= (and start!25670 res!130349) b!266001))

(assert (= (and b!266001 res!130354) b!266003))

(assert (= (and b!266003 res!130351) b!266004))

(assert (= (and b!266004 res!130353) b!266005))

(assert (= (and b!266005 res!130352) b!266002))

(assert (= (and b!266002 res!130350) b!266006))

(declare-fun m!282203 () Bool)

(assert (=> start!25670 m!282203))

(declare-fun m!282205 () Bool)

(assert (=> start!25670 m!282205))

(declare-fun m!282207 () Bool)

(assert (=> b!266002 m!282207))

(declare-fun m!282209 () Bool)

(assert (=> b!266004 m!282209))

(declare-fun m!282211 () Bool)

(assert (=> b!266005 m!282211))

(declare-fun m!282213 () Bool)

(assert (=> b!266003 m!282213))

(declare-fun m!282215 () Bool)

(assert (=> b!266006 m!282215))

(check-sat (not start!25670) (not b!266002) (not b!266005) (not b!266004) (not b!266003) (not b!266006))
(check-sat)
