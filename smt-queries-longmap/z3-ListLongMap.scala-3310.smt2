; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45794 () Bool)

(assert start!45794)

(declare-fun b!506988 () Bool)

(declare-fun e!296713 () Bool)

(assert (=> b!506988 (= e!296713 true)))

(assert (=> b!506988 false))

(declare-fun b!506989 () Bool)

(declare-fun res!308010 () Bool)

(declare-fun e!296710 () Bool)

(assert (=> b!506989 (=> (not res!308010) (not e!296710))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32551 0))(
  ( (array!32552 (arr!15655 (Array (_ BitVec 32) (_ BitVec 64))) (size!16019 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32551)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506989 (= res!308010 (and (= (size!16019 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16019 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16019 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506990 () Bool)

(declare-fun res!308005 () Bool)

(assert (=> b!506990 (=> (not res!308005) (not e!296710))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506990 (= res!308005 (validKeyInArray!0 k0!2280))))

(declare-fun res!308011 () Bool)

(assert (=> start!45794 (=> (not res!308011) (not e!296710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45794 (= res!308011 (validMask!0 mask!3524))))

(assert (=> start!45794 e!296710))

(assert (=> start!45794 true))

(declare-fun array_inv!11514 (array!32551) Bool)

(assert (=> start!45794 (array_inv!11514 a!3235)))

(declare-fun b!506991 () Bool)

(declare-fun res!308008 () Bool)

(declare-fun e!296715 () Bool)

(assert (=> b!506991 (=> (not res!308008) (not e!296715))))

(declare-datatypes ((List!9720 0))(
  ( (Nil!9717) (Cons!9716 (h!10593 (_ BitVec 64)) (t!15940 List!9720)) )
))
(declare-fun arrayNoDuplicates!0 (array!32551 (_ BitVec 32) List!9720) Bool)

(assert (=> b!506991 (= res!308008 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9717))))

(declare-fun b!506992 () Bool)

(declare-fun res!308001 () Bool)

(assert (=> b!506992 (=> (not res!308001) (not e!296710))))

(assert (=> b!506992 (= res!308001 (validKeyInArray!0 (select (arr!15655 a!3235) j!176)))))

(declare-fun b!506993 () Bool)

(declare-fun e!296714 () Bool)

(declare-datatypes ((SeekEntryResult!4078 0))(
  ( (MissingZero!4078 (index!18500 (_ BitVec 32))) (Found!4078 (index!18501 (_ BitVec 32))) (Intermediate!4078 (undefined!4890 Bool) (index!18502 (_ BitVec 32)) (x!47644 (_ BitVec 32))) (Undefined!4078) (MissingVacant!4078 (index!18503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32551 (_ BitVec 32)) SeekEntryResult!4078)

(assert (=> b!506993 (= e!296714 (= (seekEntryOrOpen!0 (select (arr!15655 a!3235) j!176) a!3235 mask!3524) (Found!4078 j!176)))))

(declare-fun b!506994 () Bool)

(declare-fun e!296712 () Bool)

(assert (=> b!506994 (= e!296712 e!296713)))

(declare-fun res!308002 () Bool)

(assert (=> b!506994 (=> res!308002 e!296713)))

(declare-fun lt!231442 () Bool)

(declare-fun lt!231440 () SeekEntryResult!4078)

(assert (=> b!506994 (= res!308002 (or (and (not lt!231442) (undefined!4890 lt!231440)) (and (not lt!231442) (not (undefined!4890 lt!231440)))))))

(get-info :version)

(assert (=> b!506994 (= lt!231442 (not ((_ is Intermediate!4078) lt!231440)))))

(declare-fun b!506995 () Bool)

(declare-fun res!308007 () Bool)

(assert (=> b!506995 (=> (not res!308007) (not e!296710))))

(declare-fun arrayContainsKey!0 (array!32551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506995 (= res!308007 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506996 () Bool)

(declare-fun res!308009 () Bool)

(assert (=> b!506996 (=> (not res!308009) (not e!296715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32551 (_ BitVec 32)) Bool)

(assert (=> b!506996 (= res!308009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506997 () Bool)

(assert (=> b!506997 (= e!296715 (not e!296712))))

(declare-fun res!308003 () Bool)

(assert (=> b!506997 (=> res!308003 e!296712)))

(declare-fun lt!231439 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32551 (_ BitVec 32)) SeekEntryResult!4078)

(assert (=> b!506997 (= res!308003 (= lt!231440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231439 (select (store (arr!15655 a!3235) i!1204 k0!2280) j!176) (array!32552 (store (arr!15655 a!3235) i!1204 k0!2280) (size!16019 a!3235)) mask!3524)))))

(declare-fun lt!231438 () (_ BitVec 32))

(assert (=> b!506997 (= lt!231440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231438 (select (arr!15655 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506997 (= lt!231439 (toIndex!0 (select (store (arr!15655 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506997 (= lt!231438 (toIndex!0 (select (arr!15655 a!3235) j!176) mask!3524))))

(assert (=> b!506997 e!296714))

(declare-fun res!308004 () Bool)

(assert (=> b!506997 (=> (not res!308004) (not e!296714))))

(assert (=> b!506997 (= res!308004 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15505 0))(
  ( (Unit!15506) )
))
(declare-fun lt!231441 () Unit!15505)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15505)

(assert (=> b!506997 (= lt!231441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506998 () Bool)

(assert (=> b!506998 (= e!296710 e!296715)))

(declare-fun res!308006 () Bool)

(assert (=> b!506998 (=> (not res!308006) (not e!296715))))

(declare-fun lt!231437 () SeekEntryResult!4078)

(assert (=> b!506998 (= res!308006 (or (= lt!231437 (MissingZero!4078 i!1204)) (= lt!231437 (MissingVacant!4078 i!1204))))))

(assert (=> b!506998 (= lt!231437 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45794 res!308011) b!506989))

(assert (= (and b!506989 res!308010) b!506992))

(assert (= (and b!506992 res!308001) b!506990))

(assert (= (and b!506990 res!308005) b!506995))

(assert (= (and b!506995 res!308007) b!506998))

(assert (= (and b!506998 res!308006) b!506996))

(assert (= (and b!506996 res!308009) b!506991))

(assert (= (and b!506991 res!308008) b!506997))

(assert (= (and b!506997 res!308004) b!506993))

(assert (= (and b!506997 (not res!308003)) b!506994))

(assert (= (and b!506994 (not res!308002)) b!506988))

(declare-fun m!487951 () Bool)

(assert (=> b!506990 m!487951))

(declare-fun m!487953 () Bool)

(assert (=> b!506992 m!487953))

(assert (=> b!506992 m!487953))

(declare-fun m!487955 () Bool)

(assert (=> b!506992 m!487955))

(declare-fun m!487957 () Bool)

(assert (=> b!506996 m!487957))

(declare-fun m!487959 () Bool)

(assert (=> b!506998 m!487959))

(declare-fun m!487961 () Bool)

(assert (=> b!506995 m!487961))

(declare-fun m!487963 () Bool)

(assert (=> b!506991 m!487963))

(assert (=> b!506993 m!487953))

(assert (=> b!506993 m!487953))

(declare-fun m!487965 () Bool)

(assert (=> b!506993 m!487965))

(declare-fun m!487967 () Bool)

(assert (=> b!506997 m!487967))

(declare-fun m!487969 () Bool)

(assert (=> b!506997 m!487969))

(declare-fun m!487971 () Bool)

(assert (=> b!506997 m!487971))

(declare-fun m!487973 () Bool)

(assert (=> b!506997 m!487973))

(assert (=> b!506997 m!487953))

(declare-fun m!487975 () Bool)

(assert (=> b!506997 m!487975))

(assert (=> b!506997 m!487953))

(declare-fun m!487977 () Bool)

(assert (=> b!506997 m!487977))

(assert (=> b!506997 m!487971))

(declare-fun m!487979 () Bool)

(assert (=> b!506997 m!487979))

(assert (=> b!506997 m!487953))

(declare-fun m!487981 () Bool)

(assert (=> b!506997 m!487981))

(assert (=> b!506997 m!487971))

(declare-fun m!487983 () Bool)

(assert (=> start!45794 m!487983))

(declare-fun m!487985 () Bool)

(assert (=> start!45794 m!487985))

(check-sat (not b!506996) (not b!506997) (not start!45794) (not b!506990) (not b!506992) (not b!506993) (not b!506995) (not b!506991) (not b!506998))
(check-sat)
