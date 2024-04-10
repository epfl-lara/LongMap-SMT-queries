; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32406 () Bool)

(assert start!32406)

(declare-fun b!323348 () Bool)

(declare-fun e!199902 () Bool)

(declare-fun e!199901 () Bool)

(assert (=> b!323348 (= e!199902 e!199901)))

(declare-fun res!176925 () Bool)

(assert (=> b!323348 (=> (not res!176925) (not e!199901))))

(declare-datatypes ((array!16545 0))(
  ( (array!16546 (arr!7830 (Array (_ BitVec 32) (_ BitVec 64))) (size!8182 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16545)

(declare-datatypes ((SeekEntryResult!2961 0))(
  ( (MissingZero!2961 (index!14020 (_ BitVec 32))) (Found!2961 (index!14021 (_ BitVec 32))) (Intermediate!2961 (undefined!3773 Bool) (index!14022 (_ BitVec 32)) (x!32277 (_ BitVec 32))) (Undefined!2961) (MissingVacant!2961 (index!14023 (_ BitVec 32))) )
))
(declare-fun lt!156619 () SeekEntryResult!2961)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16545 (_ BitVec 32)) SeekEntryResult!2961)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323348 (= res!176925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156619))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323348 (= lt!156619 (Intermediate!2961 false resIndex!58 resX!58))))

(declare-fun b!323349 () Bool)

(assert (=> b!323349 false))

(declare-datatypes ((Unit!9990 0))(
  ( (Unit!9991) )
))
(declare-fun e!199903 () Unit!9990)

(declare-fun Unit!9992 () Unit!9990)

(assert (=> b!323349 (= e!199903 Unit!9992)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!323350 () Bool)

(assert (=> b!323350 (= e!199901 (not (or (not (= (select (arr!7830 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(assert (=> b!323350 (= index!1840 resIndex!58)))

(declare-fun lt!156620 () Unit!9990)

(declare-fun e!199898 () Unit!9990)

(assert (=> b!323350 (= lt!156620 e!199898)))

(declare-fun c!50844 () Bool)

(assert (=> b!323350 (= c!50844 (not (= resIndex!58 index!1840)))))

(declare-fun b!323351 () Bool)

(declare-fun res!176921 () Bool)

(assert (=> b!323351 (=> (not res!176921) (not e!199902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16545 (_ BitVec 32)) Bool)

(assert (=> b!323351 (= res!176921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323352 () Bool)

(declare-fun res!176928 () Bool)

(assert (=> b!323352 (=> (not res!176928) (not e!199901))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323352 (= res!176928 (and (= (select (arr!7830 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8182 a!3305))))))

(declare-fun b!323353 () Bool)

(declare-fun res!176924 () Bool)

(assert (=> b!323353 (=> (not res!176924) (not e!199902))))

(declare-fun arrayContainsKey!0 (array!16545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323353 (= res!176924 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323354 () Bool)

(declare-fun res!176919 () Bool)

(assert (=> b!323354 (=> (not res!176919) (not e!199901))))

(assert (=> b!323354 (= res!176919 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156619))))

(declare-fun res!176927 () Bool)

(assert (=> start!32406 (=> (not res!176927) (not e!199902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32406 (= res!176927 (validMask!0 mask!3777))))

(assert (=> start!32406 e!199902))

(declare-fun array_inv!5793 (array!16545) Bool)

(assert (=> start!32406 (array_inv!5793 a!3305)))

(assert (=> start!32406 true))

(declare-fun b!323355 () Bool)

(assert (=> b!323355 false))

(declare-fun lt!156621 () Unit!9990)

(declare-fun e!199899 () Unit!9990)

(assert (=> b!323355 (= lt!156621 e!199899)))

(declare-fun c!50843 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323355 (= c!50843 ((_ is Intermediate!2961) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9993 () Unit!9990)

(assert (=> b!323355 (= e!199903 Unit!9993)))

(declare-fun b!323356 () Bool)

(declare-fun Unit!9994 () Unit!9990)

(assert (=> b!323356 (= e!199898 Unit!9994)))

(declare-fun b!323357 () Bool)

(assert (=> b!323357 (= e!199898 e!199903)))

(declare-fun c!50842 () Bool)

(assert (=> b!323357 (= c!50842 (or (= (select (arr!7830 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7830 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323358 () Bool)

(declare-fun res!176922 () Bool)

(assert (=> b!323358 (=> (not res!176922) (not e!199901))))

(assert (=> b!323358 (= res!176922 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7830 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323359 () Bool)

(declare-fun res!176926 () Bool)

(assert (=> b!323359 (=> (not res!176926) (not e!199902))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16545 (_ BitVec 32)) SeekEntryResult!2961)

(assert (=> b!323359 (= res!176926 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2961 i!1250)))))

(declare-fun b!323360 () Bool)

(declare-fun Unit!9995 () Unit!9990)

(assert (=> b!323360 (= e!199899 Unit!9995)))

(declare-fun b!323361 () Bool)

(declare-fun res!176920 () Bool)

(assert (=> b!323361 (=> (not res!176920) (not e!199902))))

(assert (=> b!323361 (= res!176920 (and (= (size!8182 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8182 a!3305))))))

(declare-fun b!323362 () Bool)

(declare-fun res!176923 () Bool)

(assert (=> b!323362 (=> (not res!176923) (not e!199902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323362 (= res!176923 (validKeyInArray!0 k0!2497))))

(declare-fun b!323363 () Bool)

(declare-fun Unit!9996 () Unit!9990)

(assert (=> b!323363 (= e!199899 Unit!9996)))

(assert (=> b!323363 false))

(assert (= (and start!32406 res!176927) b!323361))

(assert (= (and b!323361 res!176920) b!323362))

(assert (= (and b!323362 res!176923) b!323353))

(assert (= (and b!323353 res!176924) b!323359))

(assert (= (and b!323359 res!176926) b!323351))

(assert (= (and b!323351 res!176921) b!323348))

(assert (= (and b!323348 res!176925) b!323352))

(assert (= (and b!323352 res!176928) b!323354))

(assert (= (and b!323354 res!176919) b!323358))

(assert (= (and b!323358 res!176922) b!323350))

(assert (= (and b!323350 c!50844) b!323357))

(assert (= (and b!323350 (not c!50844)) b!323356))

(assert (= (and b!323357 c!50842) b!323349))

(assert (= (and b!323357 (not c!50842)) b!323355))

(assert (= (and b!323355 c!50843) b!323360))

(assert (= (and b!323355 (not c!50843)) b!323363))

(declare-fun m!330769 () Bool)

(assert (=> start!32406 m!330769))

(declare-fun m!330771 () Bool)

(assert (=> start!32406 m!330771))

(declare-fun m!330773 () Bool)

(assert (=> b!323348 m!330773))

(assert (=> b!323348 m!330773))

(declare-fun m!330775 () Bool)

(assert (=> b!323348 m!330775))

(declare-fun m!330777 () Bool)

(assert (=> b!323355 m!330777))

(assert (=> b!323355 m!330777))

(declare-fun m!330779 () Bool)

(assert (=> b!323355 m!330779))

(declare-fun m!330781 () Bool)

(assert (=> b!323351 m!330781))

(declare-fun m!330783 () Bool)

(assert (=> b!323362 m!330783))

(declare-fun m!330785 () Bool)

(assert (=> b!323359 m!330785))

(declare-fun m!330787 () Bool)

(assert (=> b!323353 m!330787))

(declare-fun m!330789 () Bool)

(assert (=> b!323357 m!330789))

(declare-fun m!330791 () Bool)

(assert (=> b!323352 m!330791))

(assert (=> b!323350 m!330789))

(assert (=> b!323358 m!330789))

(declare-fun m!330793 () Bool)

(assert (=> b!323354 m!330793))

(check-sat (not b!323362) (not b!323355) (not b!323354) (not b!323348) (not b!323359) (not b!323351) (not b!323353) (not start!32406))
(check-sat)
