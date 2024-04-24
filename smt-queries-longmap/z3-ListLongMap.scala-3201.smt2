; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44942 () Bool)

(assert start!44942)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31888 0))(
  ( (array!31889 (arr!15328 (Array (_ BitVec 32) (_ BitVec 64))) (size!15692 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31888)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!492899 () Bool)

(declare-fun e!289533 () Bool)

(declare-datatypes ((SeekEntryResult!3751 0))(
  ( (MissingZero!3751 (index!17183 (_ BitVec 32))) (Found!3751 (index!17184 (_ BitVec 32))) (Intermediate!3751 (undefined!4563 Bool) (index!17185 (_ BitVec 32)) (x!46418 (_ BitVec 32))) (Undefined!3751) (MissingVacant!3751 (index!17186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31888 (_ BitVec 32)) SeekEntryResult!3751)

(assert (=> b!492899 (= e!289533 (= (seekEntryOrOpen!0 (select (arr!15328 a!3235) j!176) a!3235 mask!3524) (Found!3751 j!176)))))

(declare-fun b!492900 () Bool)

(declare-fun res!295526 () Bool)

(declare-fun e!289531 () Bool)

(assert (=> b!492900 (=> (not res!295526) (not e!289531))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492900 (= res!295526 (validKeyInArray!0 k0!2280))))

(declare-fun b!492901 () Bool)

(declare-fun res!295528 () Bool)

(declare-fun e!289530 () Bool)

(assert (=> b!492901 (=> (not res!295528) (not e!289530))))

(declare-datatypes ((List!9393 0))(
  ( (Nil!9390) (Cons!9389 (h!10257 (_ BitVec 64)) (t!15613 List!9393)) )
))
(declare-fun arrayNoDuplicates!0 (array!31888 (_ BitVec 32) List!9393) Bool)

(assert (=> b!492901 (= res!295528 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9390))))

(declare-fun b!492902 () Bool)

(assert (=> b!492902 (= e!289531 e!289530)))

(declare-fun res!295527 () Bool)

(assert (=> b!492902 (=> (not res!295527) (not e!289530))))

(declare-fun lt!222887 () SeekEntryResult!3751)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492902 (= res!295527 (or (= lt!222887 (MissingZero!3751 i!1204)) (= lt!222887 (MissingVacant!3751 i!1204))))))

(assert (=> b!492902 (= lt!222887 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492903 () Bool)

(assert (=> b!492903 (= e!289530 (not true))))

(declare-fun lt!222884 () (_ BitVec 32))

(declare-fun lt!222889 () SeekEntryResult!3751)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31888 (_ BitVec 32)) SeekEntryResult!3751)

(assert (=> b!492903 (= lt!222889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222884 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) (array!31889 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235)) mask!3524))))

(declare-fun lt!222888 () SeekEntryResult!3751)

(declare-fun lt!222885 () (_ BitVec 32))

(assert (=> b!492903 (= lt!222888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222885 (select (arr!15328 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492903 (= lt!222884 (toIndex!0 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492903 (= lt!222885 (toIndex!0 (select (arr!15328 a!3235) j!176) mask!3524))))

(assert (=> b!492903 e!289533))

(declare-fun res!295530 () Bool)

(assert (=> b!492903 (=> (not res!295530) (not e!289533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31888 (_ BitVec 32)) Bool)

(assert (=> b!492903 (= res!295530 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14509 0))(
  ( (Unit!14510) )
))
(declare-fun lt!222886 () Unit!14509)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14509)

(assert (=> b!492903 (= lt!222886 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!295524 () Bool)

(assert (=> start!44942 (=> (not res!295524) (not e!289531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44942 (= res!295524 (validMask!0 mask!3524))))

(assert (=> start!44942 e!289531))

(assert (=> start!44942 true))

(declare-fun array_inv!11187 (array!31888) Bool)

(assert (=> start!44942 (array_inv!11187 a!3235)))

(declare-fun b!492904 () Bool)

(declare-fun res!295531 () Bool)

(assert (=> b!492904 (=> (not res!295531) (not e!289531))))

(declare-fun arrayContainsKey!0 (array!31888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492904 (= res!295531 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492905 () Bool)

(declare-fun res!295525 () Bool)

(assert (=> b!492905 (=> (not res!295525) (not e!289531))))

(assert (=> b!492905 (= res!295525 (validKeyInArray!0 (select (arr!15328 a!3235) j!176)))))

(declare-fun b!492906 () Bool)

(declare-fun res!295523 () Bool)

(assert (=> b!492906 (=> (not res!295523) (not e!289531))))

(assert (=> b!492906 (= res!295523 (and (= (size!15692 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15692 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15692 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492907 () Bool)

(declare-fun res!295529 () Bool)

(assert (=> b!492907 (=> (not res!295529) (not e!289530))))

(assert (=> b!492907 (= res!295529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44942 res!295524) b!492906))

(assert (= (and b!492906 res!295523) b!492905))

(assert (= (and b!492905 res!295525) b!492900))

(assert (= (and b!492900 res!295526) b!492904))

(assert (= (and b!492904 res!295531) b!492902))

(assert (= (and b!492902 res!295527) b!492907))

(assert (= (and b!492907 res!295529) b!492901))

(assert (= (and b!492901 res!295528) b!492903))

(assert (= (and b!492903 res!295530) b!492899))

(declare-fun m!473851 () Bool)

(assert (=> b!492900 m!473851))

(declare-fun m!473853 () Bool)

(assert (=> b!492903 m!473853))

(declare-fun m!473855 () Bool)

(assert (=> b!492903 m!473855))

(declare-fun m!473857 () Bool)

(assert (=> b!492903 m!473857))

(assert (=> b!492903 m!473857))

(declare-fun m!473859 () Bool)

(assert (=> b!492903 m!473859))

(declare-fun m!473861 () Bool)

(assert (=> b!492903 m!473861))

(declare-fun m!473863 () Bool)

(assert (=> b!492903 m!473863))

(assert (=> b!492903 m!473861))

(declare-fun m!473865 () Bool)

(assert (=> b!492903 m!473865))

(assert (=> b!492903 m!473861))

(declare-fun m!473867 () Bool)

(assert (=> b!492903 m!473867))

(assert (=> b!492903 m!473857))

(declare-fun m!473869 () Bool)

(assert (=> b!492903 m!473869))

(declare-fun m!473871 () Bool)

(assert (=> b!492907 m!473871))

(declare-fun m!473873 () Bool)

(assert (=> b!492904 m!473873))

(assert (=> b!492899 m!473861))

(assert (=> b!492899 m!473861))

(declare-fun m!473875 () Bool)

(assert (=> b!492899 m!473875))

(declare-fun m!473877 () Bool)

(assert (=> b!492901 m!473877))

(declare-fun m!473879 () Bool)

(assert (=> start!44942 m!473879))

(declare-fun m!473881 () Bool)

(assert (=> start!44942 m!473881))

(declare-fun m!473883 () Bool)

(assert (=> b!492902 m!473883))

(assert (=> b!492905 m!473861))

(assert (=> b!492905 m!473861))

(declare-fun m!473885 () Bool)

(assert (=> b!492905 m!473885))

(check-sat (not b!492901) (not b!492903) (not b!492899) (not b!492904) (not b!492902) (not start!44942) (not b!492907) (not b!492905) (not b!492900))
(check-sat)
