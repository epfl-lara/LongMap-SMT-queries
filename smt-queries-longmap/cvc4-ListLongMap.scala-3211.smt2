; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45016 () Bool)

(assert start!45016)

(declare-fun b!493886 () Bool)

(declare-fun res!296465 () Bool)

(declare-fun e!289963 () Bool)

(assert (=> b!493886 (=> res!296465 e!289963)))

(declare-datatypes ((SeekEntryResult!3832 0))(
  ( (MissingZero!3832 (index!17507 (_ BitVec 32))) (Found!3832 (index!17508 (_ BitVec 32))) (Intermediate!3832 (undefined!4644 Bool) (index!17509 (_ BitVec 32)) (x!46582 (_ BitVec 32))) (Undefined!3832) (MissingVacant!3832 (index!17510 (_ BitVec 32))) )
))
(declare-fun lt!223444 () SeekEntryResult!3832)

(assert (=> b!493886 (= res!296465 (or (not (is-Intermediate!3832 lt!223444)) (not (undefined!4644 lt!223444))))))

(declare-fun b!493887 () Bool)

(declare-fun res!296460 () Bool)

(declare-fun e!289964 () Bool)

(assert (=> b!493887 (=> (not res!296460) (not e!289964))))

(declare-datatypes ((array!31961 0))(
  ( (array!31962 (arr!15365 (Array (_ BitVec 32) (_ BitVec 64))) (size!15729 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31961)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493887 (= res!296460 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493888 () Bool)

(declare-fun e!289962 () Bool)

(assert (=> b!493888 (= e!289962 (not e!289963))))

(declare-fun res!296459 () Bool)

(assert (=> b!493888 (=> res!296459 e!289963)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223441 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31961 (_ BitVec 32)) SeekEntryResult!3832)

(assert (=> b!493888 (= res!296459 (= lt!223444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223441 (select (store (arr!15365 a!3235) i!1204 k!2280) j!176) (array!31962 (store (arr!15365 a!3235) i!1204 k!2280) (size!15729 a!3235)) mask!3524)))))

(declare-fun lt!223439 () (_ BitVec 32))

(assert (=> b!493888 (= lt!223444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223439 (select (arr!15365 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493888 (= lt!223441 (toIndex!0 (select (store (arr!15365 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493888 (= lt!223439 (toIndex!0 (select (arr!15365 a!3235) j!176) mask!3524))))

(declare-fun lt!223443 () SeekEntryResult!3832)

(assert (=> b!493888 (= lt!223443 (Found!3832 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31961 (_ BitVec 32)) SeekEntryResult!3832)

(assert (=> b!493888 (= lt!223443 (seekEntryOrOpen!0 (select (arr!15365 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31961 (_ BitVec 32)) Bool)

(assert (=> b!493888 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14610 0))(
  ( (Unit!14611) )
))
(declare-fun lt!223440 () Unit!14610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14610)

(assert (=> b!493888 (= lt!223440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493889 () Bool)

(declare-fun res!296464 () Bool)

(assert (=> b!493889 (=> (not res!296464) (not e!289964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493889 (= res!296464 (validKeyInArray!0 k!2280))))

(declare-fun b!493890 () Bool)

(declare-fun res!296462 () Bool)

(assert (=> b!493890 (=> (not res!296462) (not e!289964))))

(assert (=> b!493890 (= res!296462 (and (= (size!15729 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15729 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15729 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493891 () Bool)

(declare-fun res!296458 () Bool)

(assert (=> b!493891 (=> (not res!296458) (not e!289964))))

(assert (=> b!493891 (= res!296458 (validKeyInArray!0 (select (arr!15365 a!3235) j!176)))))

(declare-fun b!493892 () Bool)

(declare-fun res!296456 () Bool)

(assert (=> b!493892 (=> (not res!296456) (not e!289962))))

(assert (=> b!493892 (= res!296456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493893 () Bool)

(assert (=> b!493893 (= e!289963 true)))

(assert (=> b!493893 (= lt!223443 Undefined!3832)))

(declare-fun b!493894 () Bool)

(declare-fun res!296461 () Bool)

(assert (=> b!493894 (=> (not res!296461) (not e!289962))))

(declare-datatypes ((List!9523 0))(
  ( (Nil!9520) (Cons!9519 (h!10387 (_ BitVec 64)) (t!15751 List!9523)) )
))
(declare-fun arrayNoDuplicates!0 (array!31961 (_ BitVec 32) List!9523) Bool)

(assert (=> b!493894 (= res!296461 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9520))))

(declare-fun b!493895 () Bool)

(assert (=> b!493895 (= e!289964 e!289962)))

(declare-fun res!296463 () Bool)

(assert (=> b!493895 (=> (not res!296463) (not e!289962))))

(declare-fun lt!223442 () SeekEntryResult!3832)

(assert (=> b!493895 (= res!296463 (or (= lt!223442 (MissingZero!3832 i!1204)) (= lt!223442 (MissingVacant!3832 i!1204))))))

(assert (=> b!493895 (= lt!223442 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!296457 () Bool)

(assert (=> start!45016 (=> (not res!296457) (not e!289964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45016 (= res!296457 (validMask!0 mask!3524))))

(assert (=> start!45016 e!289964))

(assert (=> start!45016 true))

(declare-fun array_inv!11161 (array!31961) Bool)

(assert (=> start!45016 (array_inv!11161 a!3235)))

(assert (= (and start!45016 res!296457) b!493890))

(assert (= (and b!493890 res!296462) b!493891))

(assert (= (and b!493891 res!296458) b!493889))

(assert (= (and b!493889 res!296464) b!493887))

(assert (= (and b!493887 res!296460) b!493895))

(assert (= (and b!493895 res!296463) b!493892))

(assert (= (and b!493892 res!296456) b!493894))

(assert (= (and b!493894 res!296461) b!493888))

(assert (= (and b!493888 (not res!296459)) b!493886))

(assert (= (and b!493886 (not res!296465)) b!493893))

(declare-fun m!474819 () Bool)

(assert (=> start!45016 m!474819))

(declare-fun m!474821 () Bool)

(assert (=> start!45016 m!474821))

(declare-fun m!474823 () Bool)

(assert (=> b!493889 m!474823))

(declare-fun m!474825 () Bool)

(assert (=> b!493888 m!474825))

(declare-fun m!474827 () Bool)

(assert (=> b!493888 m!474827))

(declare-fun m!474829 () Bool)

(assert (=> b!493888 m!474829))

(declare-fun m!474831 () Bool)

(assert (=> b!493888 m!474831))

(assert (=> b!493888 m!474829))

(declare-fun m!474833 () Bool)

(assert (=> b!493888 m!474833))

(assert (=> b!493888 m!474829))

(declare-fun m!474835 () Bool)

(assert (=> b!493888 m!474835))

(assert (=> b!493888 m!474827))

(declare-fun m!474837 () Bool)

(assert (=> b!493888 m!474837))

(assert (=> b!493888 m!474829))

(declare-fun m!474839 () Bool)

(assert (=> b!493888 m!474839))

(assert (=> b!493888 m!474827))

(declare-fun m!474841 () Bool)

(assert (=> b!493888 m!474841))

(declare-fun m!474843 () Bool)

(assert (=> b!493888 m!474843))

(declare-fun m!474845 () Bool)

(assert (=> b!493892 m!474845))

(assert (=> b!493891 m!474829))

(assert (=> b!493891 m!474829))

(declare-fun m!474847 () Bool)

(assert (=> b!493891 m!474847))

(declare-fun m!474849 () Bool)

(assert (=> b!493887 m!474849))

(declare-fun m!474851 () Bool)

(assert (=> b!493895 m!474851))

(declare-fun m!474853 () Bool)

(assert (=> b!493894 m!474853))

(push 1)

