; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32378 () Bool)

(assert start!32378)

(declare-fun b!322959 () Bool)

(declare-fun res!176714 () Bool)

(declare-fun e!199738 () Bool)

(assert (=> b!322959 (=> (not res!176714) (not e!199738))))

(declare-datatypes ((array!16530 0))(
  ( (array!16531 (arr!7822 (Array (_ BitVec 32) (_ BitVec 64))) (size!8174 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16530)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2918 0))(
  ( (MissingZero!2918 (index!13848 (_ BitVec 32))) (Found!2918 (index!13849 (_ BitVec 32))) (Intermediate!2918 (undefined!3730 Bool) (index!13850 (_ BitVec 32)) (x!32215 (_ BitVec 32))) (Undefined!2918) (MissingVacant!2918 (index!13851 (_ BitVec 32))) )
))
(declare-fun lt!156575 () SeekEntryResult!2918)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16530 (_ BitVec 32)) SeekEntryResult!2918)

(assert (=> b!322959 (= res!176714 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156575))))

(declare-fun b!322960 () Bool)

(declare-datatypes ((Unit!9903 0))(
  ( (Unit!9904) )
))
(declare-fun e!199740 () Unit!9903)

(declare-fun e!199742 () Unit!9903)

(assert (=> b!322960 (= e!199740 e!199742)))

(declare-fun c!50754 () Bool)

(assert (=> b!322960 (= c!50754 (or (= (select (arr!7822 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7822 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322961 () Bool)

(declare-fun res!176712 () Bool)

(assert (=> b!322961 (=> (not res!176712) (not e!199738))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322961 (= res!176712 (and (= (select (arr!7822 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8174 a!3305))))))

(declare-fun b!322963 () Bool)

(declare-fun res!176707 () Bool)

(declare-fun e!199743 () Bool)

(assert (=> b!322963 (=> (not res!176707) (not e!199743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16530 (_ BitVec 32)) Bool)

(assert (=> b!322963 (= res!176707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322964 () Bool)

(declare-fun res!176706 () Bool)

(assert (=> b!322964 (=> (not res!176706) (not e!199743))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16530 (_ BitVec 32)) SeekEntryResult!2918)

(assert (=> b!322964 (= res!176706 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2918 i!1250)))))

(declare-fun b!322965 () Bool)

(assert (=> b!322965 (= e!199743 e!199738)))

(declare-fun res!176711 () Bool)

(assert (=> b!322965 (=> (not res!176711) (not e!199738))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322965 (= res!176711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156575))))

(assert (=> b!322965 (= lt!156575 (Intermediate!2918 false resIndex!58 resX!58))))

(declare-fun b!322966 () Bool)

(assert (=> b!322966 false))

(declare-fun lt!156576 () Unit!9903)

(declare-fun e!199739 () Unit!9903)

(assert (=> b!322966 (= lt!156576 e!199739)))

(declare-fun c!50755 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322966 (= c!50755 ((_ is Intermediate!2918) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9905 () Unit!9903)

(assert (=> b!322966 (= e!199742 Unit!9905)))

(declare-fun b!322967 () Bool)

(declare-fun Unit!9906 () Unit!9903)

(assert (=> b!322967 (= e!199739 Unit!9906)))

(declare-fun b!322968 () Bool)

(declare-fun res!176710 () Bool)

(assert (=> b!322968 (=> (not res!176710) (not e!199738))))

(assert (=> b!322968 (= res!176710 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7822 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322969 () Bool)

(declare-fun res!176708 () Bool)

(assert (=> b!322969 (=> (not res!176708) (not e!199743))))

(declare-fun arrayContainsKey!0 (array!16530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322969 (= res!176708 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322970 () Bool)

(assert (=> b!322970 (= e!199738 (not true))))

(assert (=> b!322970 (= index!1840 resIndex!58)))

(declare-fun lt!156574 () Unit!9903)

(assert (=> b!322970 (= lt!156574 e!199740)))

(declare-fun c!50756 () Bool)

(assert (=> b!322970 (= c!50756 (not (= resIndex!58 index!1840)))))

(declare-fun b!322971 () Bool)

(declare-fun res!176715 () Bool)

(assert (=> b!322971 (=> (not res!176715) (not e!199743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322971 (= res!176715 (validKeyInArray!0 k0!2497))))

(declare-fun b!322972 () Bool)

(declare-fun Unit!9907 () Unit!9903)

(assert (=> b!322972 (= e!199739 Unit!9907)))

(assert (=> b!322972 false))

(declare-fun b!322962 () Bool)

(declare-fun Unit!9908 () Unit!9903)

(assert (=> b!322962 (= e!199740 Unit!9908)))

(declare-fun res!176709 () Bool)

(assert (=> start!32378 (=> (not res!176709) (not e!199743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32378 (= res!176709 (validMask!0 mask!3777))))

(assert (=> start!32378 e!199743))

(declare-fun array_inv!5772 (array!16530) Bool)

(assert (=> start!32378 (array_inv!5772 a!3305)))

(assert (=> start!32378 true))

(declare-fun b!322973 () Bool)

(declare-fun res!176713 () Bool)

(assert (=> b!322973 (=> (not res!176713) (not e!199743))))

(assert (=> b!322973 (= res!176713 (and (= (size!8174 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8174 a!3305))))))

(declare-fun b!322974 () Bool)

(assert (=> b!322974 false))

(declare-fun Unit!9909 () Unit!9903)

(assert (=> b!322974 (= e!199742 Unit!9909)))

(assert (= (and start!32378 res!176709) b!322973))

(assert (= (and b!322973 res!176713) b!322971))

(assert (= (and b!322971 res!176715) b!322969))

(assert (= (and b!322969 res!176708) b!322964))

(assert (= (and b!322964 res!176706) b!322963))

(assert (= (and b!322963 res!176707) b!322965))

(assert (= (and b!322965 res!176711) b!322961))

(assert (= (and b!322961 res!176712) b!322959))

(assert (= (and b!322959 res!176714) b!322968))

(assert (= (and b!322968 res!176710) b!322970))

(assert (= (and b!322970 c!50756) b!322960))

(assert (= (and b!322970 (not c!50756)) b!322962))

(assert (= (and b!322960 c!50754) b!322974))

(assert (= (and b!322960 (not c!50754)) b!322966))

(assert (= (and b!322966 c!50755) b!322967))

(assert (= (and b!322966 (not c!50755)) b!322972))

(declare-fun m!330769 () Bool)

(assert (=> b!322961 m!330769))

(declare-fun m!330771 () Bool)

(assert (=> b!322960 m!330771))

(declare-fun m!330773 () Bool)

(assert (=> b!322969 m!330773))

(declare-fun m!330775 () Bool)

(assert (=> b!322963 m!330775))

(declare-fun m!330777 () Bool)

(assert (=> b!322964 m!330777))

(declare-fun m!330779 () Bool)

(assert (=> b!322966 m!330779))

(assert (=> b!322966 m!330779))

(declare-fun m!330781 () Bool)

(assert (=> b!322966 m!330781))

(assert (=> b!322968 m!330771))

(declare-fun m!330783 () Bool)

(assert (=> start!32378 m!330783))

(declare-fun m!330785 () Bool)

(assert (=> start!32378 m!330785))

(declare-fun m!330787 () Bool)

(assert (=> b!322971 m!330787))

(declare-fun m!330789 () Bool)

(assert (=> b!322965 m!330789))

(assert (=> b!322965 m!330789))

(declare-fun m!330791 () Bool)

(assert (=> b!322965 m!330791))

(declare-fun m!330793 () Bool)

(assert (=> b!322959 m!330793))

(check-sat (not b!322971) (not b!322969) (not b!322964) (not b!322965) (not start!32378) (not b!322963) (not b!322966) (not b!322959))
(check-sat)
