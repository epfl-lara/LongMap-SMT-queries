; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45782 () Bool)

(assert start!45782)

(declare-fun b!506686 () Bool)

(declare-fun res!307650 () Bool)

(declare-fun e!296551 () Bool)

(assert (=> b!506686 (=> (not res!307650) (not e!296551))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32538 0))(
  ( (array!32539 (arr!15649 (Array (_ BitVec 32) (_ BitVec 64))) (size!16013 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32538)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506686 (= res!307650 (and (= (size!16013 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16013 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16013 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506687 () Bool)

(declare-fun e!296556 () Bool)

(declare-fun e!296552 () Bool)

(assert (=> b!506687 (= e!296556 (not e!296552))))

(declare-fun res!307652 () Bool)

(assert (=> b!506687 (=> res!307652 e!296552)))

(declare-fun lt!231227 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4116 0))(
  ( (MissingZero!4116 (index!18652 (_ BitVec 32))) (Found!4116 (index!18653 (_ BitVec 32))) (Intermediate!4116 (undefined!4928 Bool) (index!18654 (_ BitVec 32)) (x!47653 (_ BitVec 32))) (Undefined!4116) (MissingVacant!4116 (index!18655 (_ BitVec 32))) )
))
(declare-fun lt!231232 () SeekEntryResult!4116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32538 (_ BitVec 32)) SeekEntryResult!4116)

(assert (=> b!506687 (= res!307652 (= lt!231232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231227 (select (store (arr!15649 a!3235) i!1204 k0!2280) j!176) (array!32539 (store (arr!15649 a!3235) i!1204 k0!2280) (size!16013 a!3235)) mask!3524)))))

(declare-fun lt!231231 () (_ BitVec 32))

(assert (=> b!506687 (= lt!231232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231231 (select (arr!15649 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506687 (= lt!231227 (toIndex!0 (select (store (arr!15649 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506687 (= lt!231231 (toIndex!0 (select (arr!15649 a!3235) j!176) mask!3524))))

(declare-fun e!296554 () Bool)

(assert (=> b!506687 e!296554))

(declare-fun res!307646 () Bool)

(assert (=> b!506687 (=> (not res!307646) (not e!296554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32538 (_ BitVec 32)) Bool)

(assert (=> b!506687 (= res!307646 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15520 0))(
  ( (Unit!15521) )
))
(declare-fun lt!231230 () Unit!15520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15520)

(assert (=> b!506687 (= lt!231230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506688 () Bool)

(declare-fun res!307647 () Bool)

(assert (=> b!506688 (=> (not res!307647) (not e!296551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506688 (= res!307647 (validKeyInArray!0 k0!2280))))

(declare-fun b!506690 () Bool)

(declare-fun e!296555 () Bool)

(assert (=> b!506690 (= e!296555 true)))

(assert (=> b!506690 false))

(declare-fun b!506691 () Bool)

(declare-fun res!307648 () Bool)

(assert (=> b!506691 (=> (not res!307648) (not e!296556))))

(assert (=> b!506691 (= res!307648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506692 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32538 (_ BitVec 32)) SeekEntryResult!4116)

(assert (=> b!506692 (= e!296554 (= (seekEntryOrOpen!0 (select (arr!15649 a!3235) j!176) a!3235 mask!3524) (Found!4116 j!176)))))

(declare-fun b!506693 () Bool)

(declare-fun res!307645 () Bool)

(assert (=> b!506693 (=> (not res!307645) (not e!296551))))

(assert (=> b!506693 (= res!307645 (validKeyInArray!0 (select (arr!15649 a!3235) j!176)))))

(declare-fun b!506694 () Bool)

(assert (=> b!506694 (= e!296552 e!296555)))

(declare-fun res!307653 () Bool)

(assert (=> b!506694 (=> res!307653 e!296555)))

(declare-fun lt!231229 () Bool)

(assert (=> b!506694 (= res!307653 (or (and (not lt!231229) (undefined!4928 lt!231232)) (and (not lt!231229) (not (undefined!4928 lt!231232)))))))

(get-info :version)

(assert (=> b!506694 (= lt!231229 (not ((_ is Intermediate!4116) lt!231232)))))

(declare-fun b!506695 () Bool)

(declare-fun res!307655 () Bool)

(assert (=> b!506695 (=> (not res!307655) (not e!296556))))

(declare-datatypes ((List!9807 0))(
  ( (Nil!9804) (Cons!9803 (h!10680 (_ BitVec 64)) (t!16035 List!9807)) )
))
(declare-fun arrayNoDuplicates!0 (array!32538 (_ BitVec 32) List!9807) Bool)

(assert (=> b!506695 (= res!307655 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9804))))

(declare-fun b!506696 () Bool)

(assert (=> b!506696 (= e!296551 e!296556)))

(declare-fun res!307651 () Bool)

(assert (=> b!506696 (=> (not res!307651) (not e!296556))))

(declare-fun lt!231228 () SeekEntryResult!4116)

(assert (=> b!506696 (= res!307651 (or (= lt!231228 (MissingZero!4116 i!1204)) (= lt!231228 (MissingVacant!4116 i!1204))))))

(assert (=> b!506696 (= lt!231228 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!307649 () Bool)

(assert (=> start!45782 (=> (not res!307649) (not e!296551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45782 (= res!307649 (validMask!0 mask!3524))))

(assert (=> start!45782 e!296551))

(assert (=> start!45782 true))

(declare-fun array_inv!11445 (array!32538) Bool)

(assert (=> start!45782 (array_inv!11445 a!3235)))

(declare-fun b!506689 () Bool)

(declare-fun res!307654 () Bool)

(assert (=> b!506689 (=> (not res!307654) (not e!296551))))

(declare-fun arrayContainsKey!0 (array!32538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506689 (= res!307654 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45782 res!307649) b!506686))

(assert (= (and b!506686 res!307650) b!506693))

(assert (= (and b!506693 res!307645) b!506688))

(assert (= (and b!506688 res!307647) b!506689))

(assert (= (and b!506689 res!307654) b!506696))

(assert (= (and b!506696 res!307651) b!506691))

(assert (= (and b!506691 res!307648) b!506695))

(assert (= (and b!506695 res!307655) b!506687))

(assert (= (and b!506687 res!307646) b!506692))

(assert (= (and b!506687 (not res!307652)) b!506694))

(assert (= (and b!506694 (not res!307653)) b!506690))

(declare-fun m!487371 () Bool)

(assert (=> b!506695 m!487371))

(declare-fun m!487373 () Bool)

(assert (=> b!506687 m!487373))

(declare-fun m!487375 () Bool)

(assert (=> b!506687 m!487375))

(declare-fun m!487377 () Bool)

(assert (=> b!506687 m!487377))

(declare-fun m!487379 () Bool)

(assert (=> b!506687 m!487379))

(declare-fun m!487381 () Bool)

(assert (=> b!506687 m!487381))

(assert (=> b!506687 m!487379))

(assert (=> b!506687 m!487379))

(declare-fun m!487383 () Bool)

(assert (=> b!506687 m!487383))

(declare-fun m!487385 () Bool)

(assert (=> b!506687 m!487385))

(assert (=> b!506687 m!487377))

(declare-fun m!487387 () Bool)

(assert (=> b!506687 m!487387))

(assert (=> b!506687 m!487377))

(declare-fun m!487389 () Bool)

(assert (=> b!506687 m!487389))

(declare-fun m!487391 () Bool)

(assert (=> b!506689 m!487391))

(assert (=> b!506693 m!487379))

(assert (=> b!506693 m!487379))

(declare-fun m!487393 () Bool)

(assert (=> b!506693 m!487393))

(declare-fun m!487395 () Bool)

(assert (=> b!506696 m!487395))

(declare-fun m!487397 () Bool)

(assert (=> b!506688 m!487397))

(declare-fun m!487399 () Bool)

(assert (=> b!506691 m!487399))

(assert (=> b!506692 m!487379))

(assert (=> b!506692 m!487379))

(declare-fun m!487401 () Bool)

(assert (=> b!506692 m!487401))

(declare-fun m!487403 () Bool)

(assert (=> start!45782 m!487403))

(declare-fun m!487405 () Bool)

(assert (=> start!45782 m!487405))

(check-sat (not b!506687) (not b!506691) (not b!506693) (not b!506688) (not start!45782) (not b!506692) (not b!506696) (not b!506689) (not b!506695))
(check-sat)
