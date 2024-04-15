; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45054 () Bool)

(assert start!45054)

(declare-fun res!297078 () Bool)

(declare-fun e!290090 () Bool)

(assert (=> start!45054 (=> (not res!297078) (not e!290090))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45054 (= res!297078 (validMask!0 mask!3524))))

(assert (=> start!45054 e!290090))

(assert (=> start!45054 true))

(declare-datatypes ((array!32009 0))(
  ( (array!32010 (arr!15389 (Array (_ BitVec 32) (_ BitVec 64))) (size!15754 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32009)

(declare-fun array_inv!11272 (array!32009) Bool)

(assert (=> start!45054 (array_inv!11272 a!3235)))

(declare-fun b!494365 () Bool)

(declare-fun e!290091 () Bool)

(assert (=> b!494365 (= e!290091 true)))

(declare-datatypes ((SeekEntryResult!3853 0))(
  ( (MissingZero!3853 (index!17591 (_ BitVec 32))) (Found!3853 (index!17592 (_ BitVec 32))) (Intermediate!3853 (undefined!4665 Bool) (index!17593 (_ BitVec 32)) (x!46670 (_ BitVec 32))) (Undefined!3853) (MissingVacant!3853 (index!17594 (_ BitVec 32))) )
))
(declare-fun lt!223657 () SeekEntryResult!3853)

(assert (=> b!494365 (= lt!223657 Undefined!3853)))

(declare-fun b!494366 () Bool)

(declare-fun res!297082 () Bool)

(assert (=> b!494366 (=> (not res!297082) (not e!290090))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494366 (= res!297082 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494367 () Bool)

(declare-fun res!297077 () Bool)

(assert (=> b!494367 (=> (not res!297077) (not e!290090))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494367 (= res!297077 (and (= (size!15754 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15754 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15754 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494368 () Bool)

(declare-fun res!297083 () Bool)

(declare-fun e!290088 () Bool)

(assert (=> b!494368 (=> (not res!297083) (not e!290088))))

(declare-datatypes ((List!9586 0))(
  ( (Nil!9583) (Cons!9582 (h!10450 (_ BitVec 64)) (t!15805 List!9586)) )
))
(declare-fun arrayNoDuplicates!0 (array!32009 (_ BitVec 32) List!9586) Bool)

(assert (=> b!494368 (= res!297083 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9583))))

(declare-fun b!494369 () Bool)

(assert (=> b!494369 (= e!290088 (not e!290091))))

(declare-fun res!297080 () Bool)

(assert (=> b!494369 (=> res!297080 e!290091)))

(declare-fun lt!223658 () SeekEntryResult!3853)

(declare-fun lt!223660 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32009 (_ BitVec 32)) SeekEntryResult!3853)

(assert (=> b!494369 (= res!297080 (= lt!223658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223660 (select (store (arr!15389 a!3235) i!1204 k0!2280) j!176) (array!32010 (store (arr!15389 a!3235) i!1204 k0!2280) (size!15754 a!3235)) mask!3524)))))

(declare-fun lt!223659 () (_ BitVec 32))

(assert (=> b!494369 (= lt!223658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223659 (select (arr!15389 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494369 (= lt!223660 (toIndex!0 (select (store (arr!15389 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494369 (= lt!223659 (toIndex!0 (select (arr!15389 a!3235) j!176) mask!3524))))

(assert (=> b!494369 (= lt!223657 (Found!3853 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32009 (_ BitVec 32)) SeekEntryResult!3853)

(assert (=> b!494369 (= lt!223657 (seekEntryOrOpen!0 (select (arr!15389 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32009 (_ BitVec 32)) Bool)

(assert (=> b!494369 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14638 0))(
  ( (Unit!14639) )
))
(declare-fun lt!223655 () Unit!14638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14638)

(assert (=> b!494369 (= lt!223655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494370 () Bool)

(assert (=> b!494370 (= e!290090 e!290088)))

(declare-fun res!297086 () Bool)

(assert (=> b!494370 (=> (not res!297086) (not e!290088))))

(declare-fun lt!223656 () SeekEntryResult!3853)

(assert (=> b!494370 (= res!297086 (or (= lt!223656 (MissingZero!3853 i!1204)) (= lt!223656 (MissingVacant!3853 i!1204))))))

(assert (=> b!494370 (= lt!223656 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494371 () Bool)

(declare-fun res!297085 () Bool)

(assert (=> b!494371 (=> (not res!297085) (not e!290090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494371 (= res!297085 (validKeyInArray!0 k0!2280))))

(declare-fun b!494372 () Bool)

(declare-fun res!297081 () Bool)

(assert (=> b!494372 (=> (not res!297081) (not e!290088))))

(assert (=> b!494372 (= res!297081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494373 () Bool)

(declare-fun res!297084 () Bool)

(assert (=> b!494373 (=> res!297084 e!290091)))

(get-info :version)

(assert (=> b!494373 (= res!297084 (or (not ((_ is Intermediate!3853) lt!223658)) (not (undefined!4665 lt!223658))))))

(declare-fun b!494374 () Bool)

(declare-fun res!297079 () Bool)

(assert (=> b!494374 (=> (not res!297079) (not e!290090))))

(assert (=> b!494374 (= res!297079 (validKeyInArray!0 (select (arr!15389 a!3235) j!176)))))

(assert (= (and start!45054 res!297078) b!494367))

(assert (= (and b!494367 res!297077) b!494374))

(assert (= (and b!494374 res!297079) b!494371))

(assert (= (and b!494371 res!297085) b!494366))

(assert (= (and b!494366 res!297082) b!494370))

(assert (= (and b!494370 res!297086) b!494372))

(assert (= (and b!494372 res!297081) b!494368))

(assert (= (and b!494368 res!297083) b!494369))

(assert (= (and b!494369 (not res!297080)) b!494373))

(assert (= (and b!494373 (not res!297084)) b!494365))

(declare-fun m!474967 () Bool)

(assert (=> b!494371 m!474967))

(declare-fun m!474969 () Bool)

(assert (=> b!494369 m!474969))

(declare-fun m!474971 () Bool)

(assert (=> b!494369 m!474971))

(declare-fun m!474973 () Bool)

(assert (=> b!494369 m!474973))

(declare-fun m!474975 () Bool)

(assert (=> b!494369 m!474975))

(declare-fun m!474977 () Bool)

(assert (=> b!494369 m!474977))

(assert (=> b!494369 m!474975))

(declare-fun m!474979 () Bool)

(assert (=> b!494369 m!474979))

(assert (=> b!494369 m!474975))

(declare-fun m!474981 () Bool)

(assert (=> b!494369 m!474981))

(assert (=> b!494369 m!474975))

(declare-fun m!474983 () Bool)

(assert (=> b!494369 m!474983))

(assert (=> b!494369 m!474973))

(declare-fun m!474985 () Bool)

(assert (=> b!494369 m!474985))

(assert (=> b!494369 m!474973))

(declare-fun m!474987 () Bool)

(assert (=> b!494369 m!474987))

(assert (=> b!494374 m!474975))

(assert (=> b!494374 m!474975))

(declare-fun m!474989 () Bool)

(assert (=> b!494374 m!474989))

(declare-fun m!474991 () Bool)

(assert (=> start!45054 m!474991))

(declare-fun m!474993 () Bool)

(assert (=> start!45054 m!474993))

(declare-fun m!474995 () Bool)

(assert (=> b!494372 m!474995))

(declare-fun m!474997 () Bool)

(assert (=> b!494366 m!474997))

(declare-fun m!474999 () Bool)

(assert (=> b!494370 m!474999))

(declare-fun m!475001 () Bool)

(assert (=> b!494368 m!475001))

(check-sat (not b!494372) (not b!494370) (not b!494371) (not b!494366) (not b!494374) (not b!494369) (not b!494368) (not start!45054))
(check-sat)
