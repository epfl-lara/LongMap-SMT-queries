; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50318 () Bool)

(assert start!50318)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!550411 () Bool)

(declare-fun e!317703 () Bool)

(declare-datatypes ((array!34723 0))(
  ( (array!34724 (arr!16676 (Array (_ BitVec 32) (_ BitVec 64))) (size!17041 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34723)

(declare-datatypes ((SeekEntryResult!5122 0))(
  ( (MissingZero!5122 (index!22715 (_ BitVec 32))) (Found!5122 (index!22716 (_ BitVec 32))) (Intermediate!5122 (undefined!5934 Bool) (index!22717 (_ BitVec 32)) (x!51653 (_ BitVec 32))) (Undefined!5122) (MissingVacant!5122 (index!22718 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34723 (_ BitVec 32)) SeekEntryResult!5122)

(assert (=> b!550411 (= e!317703 (= (seekEntryOrOpen!0 (select (arr!16676 a!3118) j!142) a!3118 mask!3119) (Found!5122 j!142)))))

(declare-fun b!550412 () Bool)

(declare-fun e!317704 () Bool)

(assert (=> b!550412 (= e!317704 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!550412 e!317703))

(declare-fun res!343522 () Bool)

(assert (=> b!550412 (=> (not res!343522) (not e!317703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34723 (_ BitVec 32)) Bool)

(assert (=> b!550412 (= res!343522 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17004 0))(
  ( (Unit!17005) )
))
(declare-fun lt!250366 () Unit!17004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17004)

(assert (=> b!550412 (= lt!250366 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!343523 () Bool)

(declare-fun e!317706 () Bool)

(assert (=> start!50318 (=> (not res!343523) (not e!317706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50318 (= res!343523 (validMask!0 mask!3119))))

(assert (=> start!50318 e!317706))

(assert (=> start!50318 true))

(declare-fun array_inv!12559 (array!34723) Bool)

(assert (=> start!50318 (array_inv!12559 a!3118)))

(declare-fun b!550413 () Bool)

(declare-fun res!343516 () Bool)

(assert (=> b!550413 (=> (not res!343516) (not e!317706))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550413 (= res!343516 (validKeyInArray!0 k0!1914))))

(declare-fun b!550414 () Bool)

(assert (=> b!550414 (= e!317706 e!317704)))

(declare-fun res!343515 () Bool)

(assert (=> b!550414 (=> (not res!343515) (not e!317704))))

(declare-fun lt!250365 () SeekEntryResult!5122)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550414 (= res!343515 (or (= lt!250365 (MissingZero!5122 i!1132)) (= lt!250365 (MissingVacant!5122 i!1132))))))

(assert (=> b!550414 (= lt!250365 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550415 () Bool)

(declare-fun res!343520 () Bool)

(assert (=> b!550415 (=> (not res!343520) (not e!317706))))

(assert (=> b!550415 (= res!343520 (validKeyInArray!0 (select (arr!16676 a!3118) j!142)))))

(declare-fun b!550416 () Bool)

(declare-fun res!343518 () Bool)

(assert (=> b!550416 (=> (not res!343518) (not e!317704))))

(declare-datatypes ((List!10795 0))(
  ( (Nil!10792) (Cons!10791 (h!11767 (_ BitVec 64)) (t!17014 List!10795)) )
))
(declare-fun arrayNoDuplicates!0 (array!34723 (_ BitVec 32) List!10795) Bool)

(assert (=> b!550416 (= res!343518 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10792))))

(declare-fun b!550417 () Bool)

(declare-fun res!343517 () Bool)

(assert (=> b!550417 (=> (not res!343517) (not e!317706))))

(declare-fun arrayContainsKey!0 (array!34723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550417 (= res!343517 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550418 () Bool)

(declare-fun res!343519 () Bool)

(assert (=> b!550418 (=> (not res!343519) (not e!317706))))

(assert (=> b!550418 (= res!343519 (and (= (size!17041 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17041 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17041 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550419 () Bool)

(declare-fun res!343521 () Bool)

(assert (=> b!550419 (=> (not res!343521) (not e!317704))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34723 (_ BitVec 32)) SeekEntryResult!5122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550419 (= res!343521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16676 a!3118) j!142) mask!3119) (select (arr!16676 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16676 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16676 a!3118) i!1132 k0!1914) j!142) (array!34724 (store (arr!16676 a!3118) i!1132 k0!1914) (size!17041 a!3118)) mask!3119)))))

(declare-fun b!550420 () Bool)

(declare-fun res!343514 () Bool)

(assert (=> b!550420 (=> (not res!343514) (not e!317704))))

(assert (=> b!550420 (= res!343514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50318 res!343523) b!550418))

(assert (= (and b!550418 res!343519) b!550415))

(assert (= (and b!550415 res!343520) b!550413))

(assert (= (and b!550413 res!343516) b!550417))

(assert (= (and b!550417 res!343517) b!550414))

(assert (= (and b!550414 res!343515) b!550420))

(assert (= (and b!550420 res!343514) b!550416))

(assert (= (and b!550416 res!343518) b!550419))

(assert (= (and b!550419 res!343521) b!550412))

(assert (= (and b!550412 res!343522) b!550411))

(declare-fun m!526889 () Bool)

(assert (=> b!550416 m!526889))

(declare-fun m!526891 () Bool)

(assert (=> b!550412 m!526891))

(declare-fun m!526893 () Bool)

(assert (=> b!550412 m!526893))

(declare-fun m!526895 () Bool)

(assert (=> b!550414 m!526895))

(declare-fun m!526897 () Bool)

(assert (=> b!550415 m!526897))

(assert (=> b!550415 m!526897))

(declare-fun m!526899 () Bool)

(assert (=> b!550415 m!526899))

(declare-fun m!526901 () Bool)

(assert (=> start!50318 m!526901))

(declare-fun m!526903 () Bool)

(assert (=> start!50318 m!526903))

(declare-fun m!526905 () Bool)

(assert (=> b!550420 m!526905))

(assert (=> b!550411 m!526897))

(assert (=> b!550411 m!526897))

(declare-fun m!526907 () Bool)

(assert (=> b!550411 m!526907))

(assert (=> b!550419 m!526897))

(declare-fun m!526909 () Bool)

(assert (=> b!550419 m!526909))

(assert (=> b!550419 m!526897))

(declare-fun m!526911 () Bool)

(assert (=> b!550419 m!526911))

(declare-fun m!526913 () Bool)

(assert (=> b!550419 m!526913))

(assert (=> b!550419 m!526911))

(declare-fun m!526915 () Bool)

(assert (=> b!550419 m!526915))

(assert (=> b!550419 m!526909))

(assert (=> b!550419 m!526897))

(declare-fun m!526917 () Bool)

(assert (=> b!550419 m!526917))

(declare-fun m!526919 () Bool)

(assert (=> b!550419 m!526919))

(assert (=> b!550419 m!526911))

(assert (=> b!550419 m!526913))

(declare-fun m!526921 () Bool)

(assert (=> b!550417 m!526921))

(declare-fun m!526923 () Bool)

(assert (=> b!550413 m!526923))

(check-sat (not b!550411) (not b!550414) (not b!550420) (not b!550415) (not b!550416) (not b!550417) (not b!550419) (not b!550413) (not b!550412) (not start!50318))
(check-sat)
