; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25616 () Bool)

(assert start!25616)

(declare-fun b!265709 () Bool)

(declare-fun res!129984 () Bool)

(declare-fun e!172056 () Bool)

(assert (=> b!265709 (=> (not res!129984) (not e!172056))))

(declare-datatypes ((array!12790 0))(
  ( (array!12791 (arr!6049 (Array (_ BitVec 32) (_ BitVec 64))) (size!6401 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12790)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12790 (_ BitVec 32)) Bool)

(assert (=> b!265709 (= res!129984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!129981 () Bool)

(declare-fun e!172057 () Bool)

(assert (=> start!25616 (=> (not res!129981) (not e!172057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25616 (= res!129981 (validMask!0 mask!4002))))

(assert (=> start!25616 e!172057))

(assert (=> start!25616 true))

(declare-fun array_inv!3999 (array!12790) Bool)

(assert (=> start!25616 (array_inv!3999 a!3436)))

(declare-fun b!265710 () Bool)

(assert (=> b!265710 (= e!172056 false)))

(declare-fun lt!134241 () Bool)

(declare-datatypes ((List!3776 0))(
  ( (Nil!3773) (Cons!3772 (h!4439 (_ BitVec 64)) (t!8850 List!3776)) )
))
(declare-fun arrayNoDuplicates!0 (array!12790 (_ BitVec 32) List!3776) Bool)

(assert (=> b!265710 (= lt!134241 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3773))))

(declare-fun b!265711 () Bool)

(declare-fun res!129979 () Bool)

(assert (=> b!265711 (=> (not res!129979) (not e!172057))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265711 (= res!129979 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265712 () Bool)

(declare-fun res!129982 () Bool)

(assert (=> b!265712 (=> (not res!129982) (not e!172057))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265712 (= res!129982 (and (= (size!6401 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6401 a!3436))))))

(declare-fun b!265713 () Bool)

(assert (=> b!265713 (= e!172057 e!172056)))

(declare-fun res!129980 () Bool)

(assert (=> b!265713 (=> (not res!129980) (not e!172056))))

(declare-datatypes ((SeekEntryResult!1205 0))(
  ( (MissingZero!1205 (index!6990 (_ BitVec 32))) (Found!1205 (index!6991 (_ BitVec 32))) (Intermediate!1205 (undefined!2017 Bool) (index!6992 (_ BitVec 32)) (x!25418 (_ BitVec 32))) (Undefined!1205) (MissingVacant!1205 (index!6993 (_ BitVec 32))) )
))
(declare-fun lt!134240 () SeekEntryResult!1205)

(assert (=> b!265713 (= res!129980 (or (= lt!134240 (MissingZero!1205 i!1355)) (= lt!134240 (MissingVacant!1205 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12790 (_ BitVec 32)) SeekEntryResult!1205)

(assert (=> b!265713 (= lt!134240 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265714 () Bool)

(declare-fun res!129983 () Bool)

(assert (=> b!265714 (=> (not res!129983) (not e!172057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265714 (= res!129983 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25616 res!129981) b!265712))

(assert (= (and b!265712 res!129982) b!265714))

(assert (= (and b!265714 res!129983) b!265711))

(assert (= (and b!265711 res!129979) b!265713))

(assert (= (and b!265713 res!129980) b!265709))

(assert (= (and b!265709 res!129984) b!265710))

(declare-fun m!282623 () Bool)

(assert (=> b!265713 m!282623))

(declare-fun m!282625 () Bool)

(assert (=> b!265711 m!282625))

(declare-fun m!282627 () Bool)

(assert (=> b!265709 m!282627))

(declare-fun m!282629 () Bool)

(assert (=> b!265714 m!282629))

(declare-fun m!282631 () Bool)

(assert (=> start!25616 m!282631))

(declare-fun m!282633 () Bool)

(assert (=> start!25616 m!282633))

(declare-fun m!282635 () Bool)

(assert (=> b!265710 m!282635))

(check-sat (not b!265709) (not b!265710) (not start!25616) (not b!265711) (not b!265714) (not b!265713))
(check-sat)
