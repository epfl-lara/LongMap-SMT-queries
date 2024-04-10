; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32424 () Bool)

(assert start!32424)

(declare-fun b!323780 () Bool)

(declare-fun res!177195 () Bool)

(declare-fun e!200060 () Bool)

(assert (=> b!323780 (=> (not res!177195) (not e!200060))))

(declare-datatypes ((array!16563 0))(
  ( (array!16564 (arr!7839 (Array (_ BitVec 32) (_ BitVec 64))) (size!8191 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16563)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323780 (= res!177195 (and (= (size!8191 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8191 a!3305))))))

(declare-fun b!323781 () Bool)

(declare-fun res!177193 () Bool)

(declare-fun e!200064 () Bool)

(assert (=> b!323781 (=> (not res!177193) (not e!200064))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323781 (= res!177193 (and (= (select (arr!7839 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8191 a!3305))))))

(declare-fun b!323782 () Bool)

(declare-fun res!177189 () Bool)

(assert (=> b!323782 (=> (not res!177189) (not e!200060))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323782 (= res!177189 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323783 () Bool)

(declare-fun res!177198 () Bool)

(assert (=> b!323783 (=> (not res!177198) (not e!200064))))

(declare-datatypes ((SeekEntryResult!2970 0))(
  ( (MissingZero!2970 (index!14056 (_ BitVec 32))) (Found!2970 (index!14057 (_ BitVec 32))) (Intermediate!2970 (undefined!3782 Bool) (index!14058 (_ BitVec 32)) (x!32310 (_ BitVec 32))) (Undefined!2970) (MissingVacant!2970 (index!14059 (_ BitVec 32))) )
))
(declare-fun lt!156702 () SeekEntryResult!2970)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16563 (_ BitVec 32)) SeekEntryResult!2970)

(assert (=> b!323783 (= res!177198 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156702))))

(declare-fun b!323784 () Bool)

(declare-fun res!177194 () Bool)

(assert (=> b!323784 (=> (not res!177194) (not e!200060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323784 (= res!177194 (validKeyInArray!0 k0!2497))))

(declare-fun b!323785 () Bool)

(assert (=> b!323785 (= e!200060 e!200064)))

(declare-fun res!177197 () Bool)

(assert (=> b!323785 (=> (not res!177197) (not e!200064))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323785 (= res!177197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156702))))

(assert (=> b!323785 (= lt!156702 (Intermediate!2970 false resIndex!58 resX!58))))

(declare-fun b!323786 () Bool)

(declare-datatypes ((Unit!10053 0))(
  ( (Unit!10054) )
))
(declare-fun e!200061 () Unit!10053)

(declare-fun Unit!10055 () Unit!10053)

(assert (=> b!323786 (= e!200061 Unit!10055)))

(declare-fun b!323787 () Bool)

(declare-fun e!200065 () Unit!10053)

(declare-fun e!200062 () Unit!10053)

(assert (=> b!323787 (= e!200065 e!200062)))

(declare-fun c!50925 () Bool)

(assert (=> b!323787 (= c!50925 (or (= (select (arr!7839 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7839 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323788 () Bool)

(declare-fun res!177192 () Bool)

(assert (=> b!323788 (=> (not res!177192) (not e!200064))))

(assert (=> b!323788 (= res!177192 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7839 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323789 () Bool)

(assert (=> b!323789 false))

(declare-fun lt!156700 () Unit!10053)

(assert (=> b!323789 (= lt!156700 e!200061)))

(declare-fun c!50923 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323789 (= c!50923 ((_ is Intermediate!2970) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10056 () Unit!10053)

(assert (=> b!323789 (= e!200062 Unit!10056)))

(declare-fun b!323790 () Bool)

(declare-fun Unit!10057 () Unit!10053)

(assert (=> b!323790 (= e!200061 Unit!10057)))

(assert (=> b!323790 false))

(declare-fun b!323791 () Bool)

(declare-fun res!177196 () Bool)

(assert (=> b!323791 (=> (not res!177196) (not e!200060))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16563 (_ BitVec 32)) SeekEntryResult!2970)

(assert (=> b!323791 (= res!177196 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2970 i!1250)))))

(declare-fun b!323792 () Bool)

(assert (=> b!323792 (= e!200064 (not (or (not (= (select (arr!7839 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(assert (=> b!323792 (= index!1840 resIndex!58)))

(declare-fun lt!156701 () Unit!10053)

(assert (=> b!323792 (= lt!156701 e!200065)))

(declare-fun c!50924 () Bool)

(assert (=> b!323792 (= c!50924 (not (= resIndex!58 index!1840)))))

(declare-fun b!323793 () Bool)

(assert (=> b!323793 false))

(declare-fun Unit!10058 () Unit!10053)

(assert (=> b!323793 (= e!200062 Unit!10058)))

(declare-fun b!323794 () Bool)

(declare-fun res!177191 () Bool)

(assert (=> b!323794 (=> (not res!177191) (not e!200060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16563 (_ BitVec 32)) Bool)

(assert (=> b!323794 (= res!177191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!177190 () Bool)

(assert (=> start!32424 (=> (not res!177190) (not e!200060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32424 (= res!177190 (validMask!0 mask!3777))))

(assert (=> start!32424 e!200060))

(declare-fun array_inv!5802 (array!16563) Bool)

(assert (=> start!32424 (array_inv!5802 a!3305)))

(assert (=> start!32424 true))

(declare-fun b!323795 () Bool)

(declare-fun Unit!10059 () Unit!10053)

(assert (=> b!323795 (= e!200065 Unit!10059)))

(assert (= (and start!32424 res!177190) b!323780))

(assert (= (and b!323780 res!177195) b!323784))

(assert (= (and b!323784 res!177194) b!323782))

(assert (= (and b!323782 res!177189) b!323791))

(assert (= (and b!323791 res!177196) b!323794))

(assert (= (and b!323794 res!177191) b!323785))

(assert (= (and b!323785 res!177197) b!323781))

(assert (= (and b!323781 res!177193) b!323783))

(assert (= (and b!323783 res!177198) b!323788))

(assert (= (and b!323788 res!177192) b!323792))

(assert (= (and b!323792 c!50924) b!323787))

(assert (= (and b!323792 (not c!50924)) b!323795))

(assert (= (and b!323787 c!50925) b!323793))

(assert (= (and b!323787 (not c!50925)) b!323789))

(assert (= (and b!323789 c!50923) b!323786))

(assert (= (and b!323789 (not c!50923)) b!323790))

(declare-fun m!331003 () Bool)

(assert (=> b!323789 m!331003))

(assert (=> b!323789 m!331003))

(declare-fun m!331005 () Bool)

(assert (=> b!323789 m!331005))

(declare-fun m!331007 () Bool)

(assert (=> b!323783 m!331007))

(declare-fun m!331009 () Bool)

(assert (=> b!323788 m!331009))

(declare-fun m!331011 () Bool)

(assert (=> start!32424 m!331011))

(declare-fun m!331013 () Bool)

(assert (=> start!32424 m!331013))

(declare-fun m!331015 () Bool)

(assert (=> b!323791 m!331015))

(assert (=> b!323787 m!331009))

(declare-fun m!331017 () Bool)

(assert (=> b!323794 m!331017))

(declare-fun m!331019 () Bool)

(assert (=> b!323781 m!331019))

(declare-fun m!331021 () Bool)

(assert (=> b!323782 m!331021))

(declare-fun m!331023 () Bool)

(assert (=> b!323784 m!331023))

(assert (=> b!323792 m!331009))

(declare-fun m!331025 () Bool)

(assert (=> b!323785 m!331025))

(assert (=> b!323785 m!331025))

(declare-fun m!331027 () Bool)

(assert (=> b!323785 m!331027))

(check-sat (not b!323783) (not b!323785) (not start!32424) (not b!323789) (not b!323782) (not b!323791) (not b!323794) (not b!323784))
(check-sat)
