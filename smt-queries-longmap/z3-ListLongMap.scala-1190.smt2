; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25610 () Bool)

(assert start!25610)

(declare-fun b!265655 () Bool)

(declare-fun res!129929 () Bool)

(declare-fun e!172030 () Bool)

(assert (=> b!265655 (=> (not res!129929) (not e!172030))))

(declare-datatypes ((array!12784 0))(
  ( (array!12785 (arr!6046 (Array (_ BitVec 32) (_ BitVec 64))) (size!6398 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12784)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12784 (_ BitVec 32)) Bool)

(assert (=> b!265655 (= res!129929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!129928 () Bool)

(declare-fun e!172031 () Bool)

(assert (=> start!25610 (=> (not res!129928) (not e!172031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25610 (= res!129928 (validMask!0 mask!4002))))

(assert (=> start!25610 e!172031))

(assert (=> start!25610 true))

(declare-fun array_inv!3996 (array!12784) Bool)

(assert (=> start!25610 (array_inv!3996 a!3436)))

(declare-fun b!265656 () Bool)

(declare-fun res!129927 () Bool)

(assert (=> b!265656 (=> (not res!129927) (not e!172031))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265656 (= res!129927 (and (= (size!6398 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6398 a!3436))))))

(declare-fun b!265657 () Bool)

(assert (=> b!265657 (= e!172030 false)))

(declare-fun lt!134223 () Bool)

(declare-datatypes ((List!3773 0))(
  ( (Nil!3770) (Cons!3769 (h!4436 (_ BitVec 64)) (t!8847 List!3773)) )
))
(declare-fun arrayNoDuplicates!0 (array!12784 (_ BitVec 32) List!3773) Bool)

(assert (=> b!265657 (= lt!134223 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3770))))

(declare-fun b!265658 () Bool)

(declare-fun res!129930 () Bool)

(assert (=> b!265658 (=> (not res!129930) (not e!172031))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265658 (= res!129930 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265659 () Bool)

(declare-fun res!129926 () Bool)

(assert (=> b!265659 (=> (not res!129926) (not e!172031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265659 (= res!129926 (validKeyInArray!0 k0!2698))))

(declare-fun b!265660 () Bool)

(assert (=> b!265660 (= e!172031 e!172030)))

(declare-fun res!129925 () Bool)

(assert (=> b!265660 (=> (not res!129925) (not e!172030))))

(declare-datatypes ((SeekEntryResult!1202 0))(
  ( (MissingZero!1202 (index!6978 (_ BitVec 32))) (Found!1202 (index!6979 (_ BitVec 32))) (Intermediate!1202 (undefined!2014 Bool) (index!6980 (_ BitVec 32)) (x!25407 (_ BitVec 32))) (Undefined!1202) (MissingVacant!1202 (index!6981 (_ BitVec 32))) )
))
(declare-fun lt!134222 () SeekEntryResult!1202)

(assert (=> b!265660 (= res!129925 (or (= lt!134222 (MissingZero!1202 i!1355)) (= lt!134222 (MissingVacant!1202 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12784 (_ BitVec 32)) SeekEntryResult!1202)

(assert (=> b!265660 (= lt!134222 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(assert (= (and start!25610 res!129928) b!265656))

(assert (= (and b!265656 res!129927) b!265659))

(assert (= (and b!265659 res!129926) b!265658))

(assert (= (and b!265658 res!129930) b!265660))

(assert (= (and b!265660 res!129925) b!265655))

(assert (= (and b!265655 res!129929) b!265657))

(declare-fun m!282581 () Bool)

(assert (=> b!265658 m!282581))

(declare-fun m!282583 () Bool)

(assert (=> b!265655 m!282583))

(declare-fun m!282585 () Bool)

(assert (=> start!25610 m!282585))

(declare-fun m!282587 () Bool)

(assert (=> start!25610 m!282587))

(declare-fun m!282589 () Bool)

(assert (=> b!265659 m!282589))

(declare-fun m!282591 () Bool)

(assert (=> b!265660 m!282591))

(declare-fun m!282593 () Bool)

(assert (=> b!265657 m!282593))

(check-sat (not b!265655) (not b!265657) (not start!25610) (not b!265660) (not b!265658) (not b!265659))
(check-sat)
