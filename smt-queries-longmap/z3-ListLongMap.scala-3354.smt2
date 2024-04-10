; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46118 () Bool)

(assert start!46118)

(declare-fun b!510891 () Bool)

(declare-fun res!311743 () Bool)

(declare-fun e!298569 () Bool)

(assert (=> b!510891 (=> (not res!311743) (not e!298569))))

(declare-datatypes ((array!32829 0))(
  ( (array!32830 (arr!15793 (Array (_ BitVec 32) (_ BitVec 64))) (size!16157 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32829)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32829 (_ BitVec 32)) Bool)

(assert (=> b!510891 (= res!311743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510892 () Bool)

(declare-fun e!298567 () Bool)

(assert (=> b!510892 (= e!298567 e!298569)))

(declare-fun res!311738 () Bool)

(assert (=> b!510892 (=> (not res!311738) (not e!298569))))

(declare-datatypes ((SeekEntryResult!4260 0))(
  ( (MissingZero!4260 (index!19228 (_ BitVec 32))) (Found!4260 (index!19229 (_ BitVec 32))) (Intermediate!4260 (undefined!5072 Bool) (index!19230 (_ BitVec 32)) (x!48181 (_ BitVec 32))) (Undefined!4260) (MissingVacant!4260 (index!19231 (_ BitVec 32))) )
))
(declare-fun lt!233685 () SeekEntryResult!4260)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510892 (= res!311738 (or (= lt!233685 (MissingZero!4260 i!1204)) (= lt!233685 (MissingVacant!4260 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32829 (_ BitVec 32)) SeekEntryResult!4260)

(assert (=> b!510892 (= lt!233685 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510893 () Bool)

(assert (=> b!510893 (= e!298569 (not true))))

(declare-fun lt!233689 () SeekEntryResult!4260)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32829 (_ BitVec 32)) SeekEntryResult!4260)

(assert (=> b!510893 (= lt!233689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233687 (select (store (arr!15793 a!3235) i!1204 k0!2280) j!176) (array!32830 (store (arr!15793 a!3235) i!1204 k0!2280) (size!16157 a!3235)) mask!3524))))

(declare-fun lt!233688 () SeekEntryResult!4260)

(declare-fun lt!233686 () (_ BitVec 32))

(assert (=> b!510893 (= lt!233688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233686 (select (arr!15793 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510893 (= lt!233687 (toIndex!0 (select (store (arr!15793 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510893 (= lt!233686 (toIndex!0 (select (arr!15793 a!3235) j!176) mask!3524))))

(declare-fun e!298568 () Bool)

(assert (=> b!510893 e!298568))

(declare-fun res!311741 () Bool)

(assert (=> b!510893 (=> (not res!311741) (not e!298568))))

(assert (=> b!510893 (= res!311741 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15778 0))(
  ( (Unit!15779) )
))
(declare-fun lt!233684 () Unit!15778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15778)

(assert (=> b!510893 (= lt!233684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510894 () Bool)

(declare-fun res!311740 () Bool)

(assert (=> b!510894 (=> (not res!311740) (not e!298569))))

(declare-datatypes ((List!9951 0))(
  ( (Nil!9948) (Cons!9947 (h!10824 (_ BitVec 64)) (t!16179 List!9951)) )
))
(declare-fun arrayNoDuplicates!0 (array!32829 (_ BitVec 32) List!9951) Bool)

(assert (=> b!510894 (= res!311740 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9948))))

(declare-fun b!510895 () Bool)

(declare-fun res!311736 () Bool)

(assert (=> b!510895 (=> (not res!311736) (not e!298567))))

(assert (=> b!510895 (= res!311736 (and (= (size!16157 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16157 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16157 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510897 () Bool)

(declare-fun res!311739 () Bool)

(assert (=> b!510897 (=> (not res!311739) (not e!298567))))

(declare-fun arrayContainsKey!0 (array!32829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510897 (= res!311739 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510898 () Bool)

(declare-fun res!311742 () Bool)

(assert (=> b!510898 (=> (not res!311742) (not e!298567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510898 (= res!311742 (validKeyInArray!0 k0!2280))))

(declare-fun b!510899 () Bool)

(assert (=> b!510899 (= e!298568 (= (seekEntryOrOpen!0 (select (arr!15793 a!3235) j!176) a!3235 mask!3524) (Found!4260 j!176)))))

(declare-fun res!311744 () Bool)

(assert (=> start!46118 (=> (not res!311744) (not e!298567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46118 (= res!311744 (validMask!0 mask!3524))))

(assert (=> start!46118 e!298567))

(assert (=> start!46118 true))

(declare-fun array_inv!11589 (array!32829) Bool)

(assert (=> start!46118 (array_inv!11589 a!3235)))

(declare-fun b!510896 () Bool)

(declare-fun res!311737 () Bool)

(assert (=> b!510896 (=> (not res!311737) (not e!298567))))

(assert (=> b!510896 (= res!311737 (validKeyInArray!0 (select (arr!15793 a!3235) j!176)))))

(assert (= (and start!46118 res!311744) b!510895))

(assert (= (and b!510895 res!311736) b!510896))

(assert (= (and b!510896 res!311737) b!510898))

(assert (= (and b!510898 res!311742) b!510897))

(assert (= (and b!510897 res!311739) b!510892))

(assert (= (and b!510892 res!311738) b!510891))

(assert (= (and b!510891 res!311743) b!510894))

(assert (= (and b!510894 res!311740) b!510893))

(assert (= (and b!510893 res!311741) b!510899))

(declare-fun m!492357 () Bool)

(assert (=> b!510894 m!492357))

(declare-fun m!492359 () Bool)

(assert (=> b!510892 m!492359))

(declare-fun m!492361 () Bool)

(assert (=> b!510899 m!492361))

(assert (=> b!510899 m!492361))

(declare-fun m!492363 () Bool)

(assert (=> b!510899 m!492363))

(declare-fun m!492365 () Bool)

(assert (=> b!510897 m!492365))

(assert (=> b!510896 m!492361))

(assert (=> b!510896 m!492361))

(declare-fun m!492367 () Bool)

(assert (=> b!510896 m!492367))

(declare-fun m!492369 () Bool)

(assert (=> b!510898 m!492369))

(declare-fun m!492371 () Bool)

(assert (=> start!46118 m!492371))

(declare-fun m!492373 () Bool)

(assert (=> start!46118 m!492373))

(declare-fun m!492375 () Bool)

(assert (=> b!510891 m!492375))

(declare-fun m!492377 () Bool)

(assert (=> b!510893 m!492377))

(declare-fun m!492379 () Bool)

(assert (=> b!510893 m!492379))

(declare-fun m!492381 () Bool)

(assert (=> b!510893 m!492381))

(assert (=> b!510893 m!492361))

(declare-fun m!492383 () Bool)

(assert (=> b!510893 m!492383))

(assert (=> b!510893 m!492381))

(declare-fun m!492385 () Bool)

(assert (=> b!510893 m!492385))

(assert (=> b!510893 m!492361))

(declare-fun m!492387 () Bool)

(assert (=> b!510893 m!492387))

(assert (=> b!510893 m!492361))

(declare-fun m!492389 () Bool)

(assert (=> b!510893 m!492389))

(assert (=> b!510893 m!492381))

(declare-fun m!492391 () Bool)

(assert (=> b!510893 m!492391))

(check-sat (not b!510899) (not b!510896) (not b!510894) (not b!510892) (not b!510893) (not b!510891) (not b!510898) (not b!510897) (not start!46118))
(check-sat)
