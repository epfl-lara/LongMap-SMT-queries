; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30930 () Bool)

(assert start!30930)

(declare-fun b!310422 () Bool)

(declare-datatypes ((array!15836 0))(
  ( (array!15837 (arr!7500 (Array (_ BitVec 32) (_ BitVec 64))) (size!7853 (_ BitVec 32))) )
))
(declare-fun lt!151825 () array!15836)

(declare-fun lt!151826 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!193771 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2639 0))(
  ( (MissingZero!2639 (index!12732 (_ BitVec 32))) (Found!2639 (index!12733 (_ BitVec 32))) (Intermediate!2639 (undefined!3451 Bool) (index!12734 (_ BitVec 32)) (x!30975 (_ BitVec 32))) (Undefined!2639) (MissingVacant!2639 (index!12735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15836 (_ BitVec 32)) SeekEntryResult!2639)

(assert (=> b!310422 (= e!193771 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151825 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151826 k0!2441 lt!151825 mask!3709)))))

(declare-fun a!3293 () array!15836)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310422 (= lt!151825 (array!15837 (store (arr!7500 a!3293) i!1240 k0!2441) (size!7853 a!3293)))))

(declare-fun b!310423 () Bool)

(declare-fun res!167031 () Bool)

(declare-fun e!193774 () Bool)

(assert (=> b!310423 (=> (not res!167031) (not e!193774))))

(declare-fun arrayContainsKey!0 (array!15836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310423 (= res!167031 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310424 () Bool)

(declare-fun res!167024 () Bool)

(assert (=> b!310424 (=> (not res!167024) (not e!193774))))

(assert (=> b!310424 (= res!167024 (and (= (size!7853 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7853 a!3293))))))

(declare-fun b!310425 () Bool)

(declare-fun e!193773 () Bool)

(assert (=> b!310425 (= e!193773 (not true))))

(assert (=> b!310425 e!193771))

(declare-fun res!167029 () Bool)

(assert (=> b!310425 (=> (not res!167029) (not e!193771))))

(declare-fun lt!151823 () SeekEntryResult!2639)

(assert (=> b!310425 (= res!167029 (= lt!151823 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151826 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310425 (= lt!151826 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310426 () Bool)

(declare-fun res!167027 () Bool)

(assert (=> b!310426 (=> (not res!167027) (not e!193774))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15836 (_ BitVec 32)) SeekEntryResult!2639)

(assert (=> b!310426 (= res!167027 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2639 i!1240)))))

(declare-fun b!310427 () Bool)

(declare-fun res!167030 () Bool)

(declare-fun e!193772 () Bool)

(assert (=> b!310427 (=> (not res!167030) (not e!193772))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310427 (= res!167030 (and (= (select (arr!7500 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7853 a!3293))))))

(declare-fun b!310429 () Bool)

(assert (=> b!310429 (= e!193772 e!193773)))

(declare-fun res!167026 () Bool)

(assert (=> b!310429 (=> (not res!167026) (not e!193773))))

(declare-fun lt!151824 () SeekEntryResult!2639)

(assert (=> b!310429 (= res!167026 (and (= lt!151823 lt!151824) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7500 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310429 (= lt!151823 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310430 () Bool)

(declare-fun res!167022 () Bool)

(assert (=> b!310430 (=> (not res!167022) (not e!193774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15836 (_ BitVec 32)) Bool)

(assert (=> b!310430 (= res!167022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310431 () Bool)

(declare-fun res!167028 () Bool)

(assert (=> b!310431 (=> (not res!167028) (not e!193774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310431 (= res!167028 (validKeyInArray!0 k0!2441))))

(declare-fun res!167023 () Bool)

(assert (=> start!30930 (=> (not res!167023) (not e!193774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30930 (= res!167023 (validMask!0 mask!3709))))

(assert (=> start!30930 e!193774))

(declare-fun array_inv!5472 (array!15836) Bool)

(assert (=> start!30930 (array_inv!5472 a!3293)))

(assert (=> start!30930 true))

(declare-fun b!310428 () Bool)

(assert (=> b!310428 (= e!193774 e!193772)))

(declare-fun res!167025 () Bool)

(assert (=> b!310428 (=> (not res!167025) (not e!193772))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310428 (= res!167025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151824))))

(assert (=> b!310428 (= lt!151824 (Intermediate!2639 false resIndex!52 resX!52))))

(assert (= (and start!30930 res!167023) b!310424))

(assert (= (and b!310424 res!167024) b!310431))

(assert (= (and b!310431 res!167028) b!310423))

(assert (= (and b!310423 res!167031) b!310426))

(assert (= (and b!310426 res!167027) b!310430))

(assert (= (and b!310430 res!167022) b!310428))

(assert (= (and b!310428 res!167025) b!310427))

(assert (= (and b!310427 res!167030) b!310429))

(assert (= (and b!310429 res!167026) b!310425))

(assert (= (and b!310425 res!167029) b!310422))

(declare-fun m!319891 () Bool)

(assert (=> b!310429 m!319891))

(declare-fun m!319893 () Bool)

(assert (=> b!310429 m!319893))

(declare-fun m!319895 () Bool)

(assert (=> b!310428 m!319895))

(assert (=> b!310428 m!319895))

(declare-fun m!319897 () Bool)

(assert (=> b!310428 m!319897))

(declare-fun m!319899 () Bool)

(assert (=> b!310423 m!319899))

(declare-fun m!319901 () Bool)

(assert (=> b!310426 m!319901))

(declare-fun m!319903 () Bool)

(assert (=> b!310422 m!319903))

(declare-fun m!319905 () Bool)

(assert (=> b!310422 m!319905))

(declare-fun m!319907 () Bool)

(assert (=> b!310422 m!319907))

(declare-fun m!319909 () Bool)

(assert (=> b!310430 m!319909))

(declare-fun m!319911 () Bool)

(assert (=> b!310425 m!319911))

(declare-fun m!319913 () Bool)

(assert (=> b!310425 m!319913))

(declare-fun m!319915 () Bool)

(assert (=> start!30930 m!319915))

(declare-fun m!319917 () Bool)

(assert (=> start!30930 m!319917))

(declare-fun m!319919 () Bool)

(assert (=> b!310431 m!319919))

(declare-fun m!319921 () Bool)

(assert (=> b!310427 m!319921))

(check-sat (not b!310431) (not b!310430) (not start!30930) (not b!310423) (not b!310426) (not b!310422) (not b!310425) (not b!310429) (not b!310428))
(check-sat)
