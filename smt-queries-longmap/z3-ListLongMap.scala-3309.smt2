; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45788 () Bool)

(assert start!45788)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!296657 () Bool)

(declare-datatypes ((array!32545 0))(
  ( (array!32546 (arr!15652 (Array (_ BitVec 32) (_ BitVec 64))) (size!16016 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32545)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!506889 () Bool)

(declare-datatypes ((SeekEntryResult!4075 0))(
  ( (MissingZero!4075 (index!18488 (_ BitVec 32))) (Found!4075 (index!18489 (_ BitVec 32))) (Intermediate!4075 (undefined!4887 Bool) (index!18490 (_ BitVec 32)) (x!47633 (_ BitVec 32))) (Undefined!4075) (MissingVacant!4075 (index!18491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32545 (_ BitVec 32)) SeekEntryResult!4075)

(assert (=> b!506889 (= e!296657 (= (seekEntryOrOpen!0 (select (arr!15652 a!3235) j!176) a!3235 mask!3524) (Found!4075 j!176)))))

(declare-fun res!307911 () Bool)

(declare-fun e!296661 () Bool)

(assert (=> start!45788 (=> (not res!307911) (not e!296661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45788 (= res!307911 (validMask!0 mask!3524))))

(assert (=> start!45788 e!296661))

(assert (=> start!45788 true))

(declare-fun array_inv!11511 (array!32545) Bool)

(assert (=> start!45788 (array_inv!11511 a!3235)))

(declare-fun b!506890 () Bool)

(declare-fun e!296660 () Bool)

(declare-fun e!296659 () Bool)

(assert (=> b!506890 (= e!296660 (not e!296659))))

(declare-fun res!307904 () Bool)

(assert (=> b!506890 (=> res!307904 e!296659)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!231388 () (_ BitVec 32))

(declare-fun lt!231385 () SeekEntryResult!4075)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32545 (_ BitVec 32)) SeekEntryResult!4075)

(assert (=> b!506890 (= res!307904 (= lt!231385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231388 (select (store (arr!15652 a!3235) i!1204 k0!2280) j!176) (array!32546 (store (arr!15652 a!3235) i!1204 k0!2280) (size!16016 a!3235)) mask!3524)))))

(declare-fun lt!231386 () (_ BitVec 32))

(assert (=> b!506890 (= lt!231385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231386 (select (arr!15652 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506890 (= lt!231388 (toIndex!0 (select (store (arr!15652 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506890 (= lt!231386 (toIndex!0 (select (arr!15652 a!3235) j!176) mask!3524))))

(assert (=> b!506890 e!296657))

(declare-fun res!307907 () Bool)

(assert (=> b!506890 (=> (not res!307907) (not e!296657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32545 (_ BitVec 32)) Bool)

(assert (=> b!506890 (= res!307907 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15499 0))(
  ( (Unit!15500) )
))
(declare-fun lt!231384 () Unit!15499)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15499)

(assert (=> b!506890 (= lt!231384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506891 () Bool)

(declare-fun e!296658 () Bool)

(assert (=> b!506891 (= e!296659 e!296658)))

(declare-fun res!307910 () Bool)

(assert (=> b!506891 (=> res!307910 e!296658)))

(declare-fun lt!231387 () Bool)

(assert (=> b!506891 (= res!307910 (or (and (not lt!231387) (undefined!4887 lt!231385)) (and (not lt!231387) (not (undefined!4887 lt!231385)))))))

(get-info :version)

(assert (=> b!506891 (= lt!231387 (not ((_ is Intermediate!4075) lt!231385)))))

(declare-fun b!506892 () Bool)

(declare-fun res!307905 () Bool)

(assert (=> b!506892 (=> (not res!307905) (not e!296661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506892 (= res!307905 (validKeyInArray!0 k0!2280))))

(declare-fun b!506893 () Bool)

(declare-fun res!307906 () Bool)

(assert (=> b!506893 (=> (not res!307906) (not e!296661))))

(declare-fun arrayContainsKey!0 (array!32545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506893 (= res!307906 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506894 () Bool)

(declare-fun res!307908 () Bool)

(assert (=> b!506894 (=> (not res!307908) (not e!296661))))

(assert (=> b!506894 (= res!307908 (validKeyInArray!0 (select (arr!15652 a!3235) j!176)))))

(declare-fun b!506895 () Bool)

(declare-fun res!307902 () Bool)

(assert (=> b!506895 (=> (not res!307902) (not e!296661))))

(assert (=> b!506895 (= res!307902 (and (= (size!16016 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16016 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16016 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506896 () Bool)

(declare-fun res!307912 () Bool)

(assert (=> b!506896 (=> (not res!307912) (not e!296660))))

(declare-datatypes ((List!9717 0))(
  ( (Nil!9714) (Cons!9713 (h!10590 (_ BitVec 64)) (t!15937 List!9717)) )
))
(declare-fun arrayNoDuplicates!0 (array!32545 (_ BitVec 32) List!9717) Bool)

(assert (=> b!506896 (= res!307912 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9714))))

(declare-fun b!506897 () Bool)

(assert (=> b!506897 (= e!296658 true)))

(assert (=> b!506897 false))

(declare-fun b!506898 () Bool)

(declare-fun res!307909 () Bool)

(assert (=> b!506898 (=> (not res!307909) (not e!296660))))

(assert (=> b!506898 (= res!307909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506899 () Bool)

(assert (=> b!506899 (= e!296661 e!296660)))

(declare-fun res!307903 () Bool)

(assert (=> b!506899 (=> (not res!307903) (not e!296660))))

(declare-fun lt!231383 () SeekEntryResult!4075)

(assert (=> b!506899 (= res!307903 (or (= lt!231383 (MissingZero!4075 i!1204)) (= lt!231383 (MissingVacant!4075 i!1204))))))

(assert (=> b!506899 (= lt!231383 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45788 res!307911) b!506895))

(assert (= (and b!506895 res!307902) b!506894))

(assert (= (and b!506894 res!307908) b!506892))

(assert (= (and b!506892 res!307905) b!506893))

(assert (= (and b!506893 res!307906) b!506899))

(assert (= (and b!506899 res!307903) b!506898))

(assert (= (and b!506898 res!307909) b!506896))

(assert (= (and b!506896 res!307912) b!506890))

(assert (= (and b!506890 res!307907) b!506889))

(assert (= (and b!506890 (not res!307904)) b!506891))

(assert (= (and b!506891 (not res!307910)) b!506897))

(declare-fun m!487843 () Bool)

(assert (=> b!506893 m!487843))

(declare-fun m!487845 () Bool)

(assert (=> b!506898 m!487845))

(declare-fun m!487847 () Bool)

(assert (=> start!45788 m!487847))

(declare-fun m!487849 () Bool)

(assert (=> start!45788 m!487849))

(declare-fun m!487851 () Bool)

(assert (=> b!506896 m!487851))

(declare-fun m!487853 () Bool)

(assert (=> b!506894 m!487853))

(assert (=> b!506894 m!487853))

(declare-fun m!487855 () Bool)

(assert (=> b!506894 m!487855))

(declare-fun m!487857 () Bool)

(assert (=> b!506890 m!487857))

(declare-fun m!487859 () Bool)

(assert (=> b!506890 m!487859))

(declare-fun m!487861 () Bool)

(assert (=> b!506890 m!487861))

(assert (=> b!506890 m!487861))

(declare-fun m!487863 () Bool)

(assert (=> b!506890 m!487863))

(assert (=> b!506890 m!487853))

(declare-fun m!487865 () Bool)

(assert (=> b!506890 m!487865))

(assert (=> b!506890 m!487861))

(declare-fun m!487867 () Bool)

(assert (=> b!506890 m!487867))

(assert (=> b!506890 m!487853))

(declare-fun m!487869 () Bool)

(assert (=> b!506890 m!487869))

(assert (=> b!506890 m!487853))

(declare-fun m!487871 () Bool)

(assert (=> b!506890 m!487871))

(declare-fun m!487873 () Bool)

(assert (=> b!506892 m!487873))

(assert (=> b!506889 m!487853))

(assert (=> b!506889 m!487853))

(declare-fun m!487875 () Bool)

(assert (=> b!506889 m!487875))

(declare-fun m!487877 () Bool)

(assert (=> b!506899 m!487877))

(check-sat (not b!506896) (not b!506892) (not b!506899) (not b!506893) (not b!506889) (not start!45788) (not b!506898) (not b!506890) (not b!506894))
(check-sat)
