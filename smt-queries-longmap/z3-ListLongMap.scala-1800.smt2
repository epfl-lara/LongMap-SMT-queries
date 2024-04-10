; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32502 () Bool)

(assert start!32502)

(declare-fun b!324983 () Bool)

(declare-fun res!178316 () Bool)

(declare-fun e!200443 () Bool)

(assert (=> b!324983 (=> (not res!178316) (not e!200443))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324983 (= res!178316 (validKeyInArray!0 k0!2497))))

(declare-fun b!324984 () Bool)

(declare-fun res!178318 () Bool)

(assert (=> b!324984 (=> (not res!178318) (not e!200443))))

(declare-datatypes ((array!16641 0))(
  ( (array!16642 (arr!7878 (Array (_ BitVec 32) (_ BitVec 64))) (size!8230 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16641)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3009 0))(
  ( (MissingZero!3009 (index!14212 (_ BitVec 32))) (Found!3009 (index!14213 (_ BitVec 32))) (Intermediate!3009 (undefined!3821 Bool) (index!14214 (_ BitVec 32)) (x!32453 (_ BitVec 32))) (Undefined!3009) (MissingVacant!3009 (index!14215 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16641 (_ BitVec 32)) SeekEntryResult!3009)

(assert (=> b!324984 (= res!178318 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3009 i!1250)))))

(declare-fun b!324985 () Bool)

(declare-fun res!178321 () Bool)

(assert (=> b!324985 (=> (not res!178321) (not e!200443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16641 (_ BitVec 32)) Bool)

(assert (=> b!324985 (= res!178321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324986 () Bool)

(declare-fun res!178323 () Bool)

(declare-fun e!200441 () Bool)

(assert (=> b!324986 (=> (not res!178323) (not e!200441))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324986 (= res!178323 (and (= (select (arr!7878 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8230 a!3305))))))

(declare-fun b!324987 () Bool)

(declare-fun res!178317 () Bool)

(assert (=> b!324987 (=> (not res!178317) (not e!200443))))

(declare-fun arrayContainsKey!0 (array!16641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324987 (= res!178317 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324988 () Bool)

(assert (=> b!324988 (= e!200441 false)))

(declare-fun lt!156911 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324988 (= lt!156911 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324989 () Bool)

(declare-fun res!178315 () Bool)

(assert (=> b!324989 (=> (not res!178315) (not e!200441))))

(declare-fun lt!156912 () SeekEntryResult!3009)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16641 (_ BitVec 32)) SeekEntryResult!3009)

(assert (=> b!324989 (= res!178315 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156912))))

(declare-fun b!324990 () Bool)

(assert (=> b!324990 (= e!200443 e!200441)))

(declare-fun res!178319 () Bool)

(assert (=> b!324990 (=> (not res!178319) (not e!200441))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324990 (= res!178319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156912))))

(assert (=> b!324990 (= lt!156912 (Intermediate!3009 false resIndex!58 resX!58))))

(declare-fun b!324991 () Bool)

(declare-fun res!178314 () Bool)

(assert (=> b!324991 (=> (not res!178314) (not e!200443))))

(assert (=> b!324991 (= res!178314 (and (= (size!8230 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8230 a!3305))))))

(declare-fun b!324992 () Bool)

(declare-fun res!178322 () Bool)

(assert (=> b!324992 (=> (not res!178322) (not e!200441))))

(assert (=> b!324992 (= res!178322 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7878 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!178320 () Bool)

(assert (=> start!32502 (=> (not res!178320) (not e!200443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32502 (= res!178320 (validMask!0 mask!3777))))

(assert (=> start!32502 e!200443))

(declare-fun array_inv!5841 (array!16641) Bool)

(assert (=> start!32502 (array_inv!5841 a!3305)))

(assert (=> start!32502 true))

(assert (= (and start!32502 res!178320) b!324991))

(assert (= (and b!324991 res!178314) b!324983))

(assert (= (and b!324983 res!178316) b!324987))

(assert (= (and b!324987 res!178317) b!324984))

(assert (= (and b!324984 res!178318) b!324985))

(assert (= (and b!324985 res!178321) b!324990))

(assert (= (and b!324990 res!178319) b!324986))

(assert (= (and b!324986 res!178323) b!324989))

(assert (= (and b!324989 res!178315) b!324992))

(assert (= (and b!324992 res!178322) b!324988))

(declare-fun m!331919 () Bool)

(assert (=> b!324985 m!331919))

(declare-fun m!331921 () Bool)

(assert (=> start!32502 m!331921))

(declare-fun m!331923 () Bool)

(assert (=> start!32502 m!331923))

(declare-fun m!331925 () Bool)

(assert (=> b!324990 m!331925))

(assert (=> b!324990 m!331925))

(declare-fun m!331927 () Bool)

(assert (=> b!324990 m!331927))

(declare-fun m!331929 () Bool)

(assert (=> b!324983 m!331929))

(declare-fun m!331931 () Bool)

(assert (=> b!324987 m!331931))

(declare-fun m!331933 () Bool)

(assert (=> b!324992 m!331933))

(declare-fun m!331935 () Bool)

(assert (=> b!324989 m!331935))

(declare-fun m!331937 () Bool)

(assert (=> b!324984 m!331937))

(declare-fun m!331939 () Bool)

(assert (=> b!324988 m!331939))

(declare-fun m!331941 () Bool)

(assert (=> b!324986 m!331941))

(check-sat (not b!324983) (not b!324985) (not b!324989) (not b!324987) (not b!324990) (not b!324988) (not b!324984) (not start!32502))
(check-sat)
