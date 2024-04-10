; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67760 () Bool)

(assert start!67760)

(declare-fun b!786932 () Bool)

(declare-fun res!532896 () Bool)

(declare-fun e!437436 () Bool)

(assert (=> b!786932 (=> (not res!532896) (not e!437436))))

(declare-datatypes ((array!42800 0))(
  ( (array!42801 (arr!20488 (Array (_ BitVec 32) (_ BitVec 64))) (size!20909 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42800)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786932 (= res!532896 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786933 () Bool)

(declare-fun res!532895 () Bool)

(assert (=> b!786933 (=> (not res!532895) (not e!437436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786933 (= res!532895 (validKeyInArray!0 k0!2102))))

(declare-fun b!786934 () Bool)

(declare-fun e!437434 () Bool)

(assert (=> b!786934 (= e!437436 e!437434)))

(declare-fun res!532913 () Bool)

(assert (=> b!786934 (=> (not res!532913) (not e!437434))))

(declare-datatypes ((SeekEntryResult!8088 0))(
  ( (MissingZero!8088 (index!34720 (_ BitVec 32))) (Found!8088 (index!34721 (_ BitVec 32))) (Intermediate!8088 (undefined!8900 Bool) (index!34722 (_ BitVec 32)) (x!65660 (_ BitVec 32))) (Undefined!8088) (MissingVacant!8088 (index!34723 (_ BitVec 32))) )
))
(declare-fun lt!350989 () SeekEntryResult!8088)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786934 (= res!532913 (or (= lt!350989 (MissingZero!8088 i!1173)) (= lt!350989 (MissingVacant!8088 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42800 (_ BitVec 32)) SeekEntryResult!8088)

(assert (=> b!786934 (= lt!350989 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786935 () Bool)

(declare-fun e!437439 () Bool)

(declare-fun e!437438 () Bool)

(assert (=> b!786935 (= e!437439 (not e!437438))))

(declare-fun res!532904 () Bool)

(assert (=> b!786935 (=> res!532904 e!437438)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!350988 () SeekEntryResult!8088)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!786935 (= res!532904 (or (not ((_ is Intermediate!8088) lt!350988)) (bvslt x!1131 (x!65660 lt!350988)) (not (= x!1131 (x!65660 lt!350988))) (not (= index!1321 (index!34722 lt!350988)))))))

(declare-fun e!437435 () Bool)

(assert (=> b!786935 e!437435))

(declare-fun res!532912 () Bool)

(assert (=> b!786935 (=> (not res!532912) (not e!437435))))

(declare-fun lt!350994 () SeekEntryResult!8088)

(declare-fun lt!350990 () SeekEntryResult!8088)

(assert (=> b!786935 (= res!532912 (= lt!350994 lt!350990))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!786935 (= lt!350990 (Found!8088 j!159))))

(assert (=> b!786935 (= lt!350994 (seekEntryOrOpen!0 (select (arr!20488 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42800 (_ BitVec 32)) Bool)

(assert (=> b!786935 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27240 0))(
  ( (Unit!27241) )
))
(declare-fun lt!350985 () Unit!27240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27240)

(assert (=> b!786935 (= lt!350985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786936 () Bool)

(declare-fun res!532908 () Bool)

(declare-fun e!437444 () Bool)

(assert (=> b!786936 (=> (not res!532908) (not e!437444))))

(declare-fun e!437437 () Bool)

(assert (=> b!786936 (= res!532908 e!437437)))

(declare-fun c!87427 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786936 (= c!87427 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786937 () Bool)

(declare-fun e!437441 () Unit!27240)

(declare-fun Unit!27242 () Unit!27240)

(assert (=> b!786937 (= e!437441 Unit!27242)))

(declare-fun res!532900 () Bool)

(assert (=> start!67760 (=> (not res!532900) (not e!437436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67760 (= res!532900 (validMask!0 mask!3328))))

(assert (=> start!67760 e!437436))

(assert (=> start!67760 true))

(declare-fun array_inv!16284 (array!42800) Bool)

(assert (=> start!67760 (array_inv!16284 a!3186)))

(declare-fun b!786938 () Bool)

(declare-fun res!532911 () Bool)

(declare-fun e!437433 () Bool)

(assert (=> b!786938 (=> (not res!532911) (not e!437433))))

(declare-fun lt!350986 () (_ BitVec 64))

(declare-fun lt!350995 () array!42800)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42800 (_ BitVec 32)) SeekEntryResult!8088)

(assert (=> b!786938 (= res!532911 (= (seekEntryOrOpen!0 lt!350986 lt!350995 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350986 lt!350995 mask!3328)))))

(declare-fun b!786939 () Bool)

(declare-fun e!437440 () Bool)

(assert (=> b!786939 (= e!437438 e!437440)))

(declare-fun res!532907 () Bool)

(assert (=> b!786939 (=> res!532907 e!437440)))

(declare-fun lt!350996 () SeekEntryResult!8088)

(assert (=> b!786939 (= res!532907 (not (= lt!350996 lt!350990)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!786939 (= lt!350996 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20488 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786940 () Bool)

(declare-fun res!532906 () Bool)

(assert (=> b!786940 (=> (not res!532906) (not e!437436))))

(assert (=> b!786940 (= res!532906 (and (= (size!20909 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20909 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20909 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786941 () Bool)

(declare-fun Unit!27243 () Unit!27240)

(assert (=> b!786941 (= e!437441 Unit!27243)))

(assert (=> b!786941 false))

(declare-fun b!786942 () Bool)

(assert (=> b!786942 (= e!437433 (= lt!350994 lt!350996))))

(declare-fun b!786943 () Bool)

(declare-fun res!532898 () Bool)

(assert (=> b!786943 (=> (not res!532898) (not e!437436))))

(assert (=> b!786943 (= res!532898 (validKeyInArray!0 (select (arr!20488 a!3186) j!159)))))

(declare-fun b!786944 () Bool)

(declare-fun lt!350987 () SeekEntryResult!8088)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42800 (_ BitVec 32)) SeekEntryResult!8088)

(assert (=> b!786944 (= e!437437 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20488 a!3186) j!159) a!3186 mask!3328) lt!350987))))

(declare-fun b!786945 () Bool)

(declare-fun res!532910 () Bool)

(assert (=> b!786945 (=> (not res!532910) (not e!437434))))

(assert (=> b!786945 (= res!532910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786946 () Bool)

(declare-fun res!532909 () Bool)

(assert (=> b!786946 (=> (not res!532909) (not e!437434))))

(declare-datatypes ((List!14490 0))(
  ( (Nil!14487) (Cons!14486 (h!15609 (_ BitVec 64)) (t!20805 List!14490)) )
))
(declare-fun arrayNoDuplicates!0 (array!42800 (_ BitVec 32) List!14490) Bool)

(assert (=> b!786946 (= res!532909 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14487))))

(declare-fun b!786947 () Bool)

(assert (=> b!786947 (= e!437437 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20488 a!3186) j!159) a!3186 mask!3328) (Found!8088 j!159)))))

(declare-fun b!786948 () Bool)

(assert (=> b!786948 (= e!437434 e!437444)))

(declare-fun res!532905 () Bool)

(assert (=> b!786948 (=> (not res!532905) (not e!437444))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786948 (= res!532905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20488 a!3186) j!159) mask!3328) (select (arr!20488 a!3186) j!159) a!3186 mask!3328) lt!350987))))

(assert (=> b!786948 (= lt!350987 (Intermediate!8088 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786949 () Bool)

(assert (=> b!786949 (= e!437444 e!437439)))

(declare-fun res!532901 () Bool)

(assert (=> b!786949 (=> (not res!532901) (not e!437439))))

(declare-fun lt!350991 () SeekEntryResult!8088)

(assert (=> b!786949 (= res!532901 (= lt!350991 lt!350988))))

(assert (=> b!786949 (= lt!350988 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350986 lt!350995 mask!3328))))

(assert (=> b!786949 (= lt!350991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350986 mask!3328) lt!350986 lt!350995 mask!3328))))

(assert (=> b!786949 (= lt!350986 (select (store (arr!20488 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786949 (= lt!350995 (array!42801 (store (arr!20488 a!3186) i!1173 k0!2102) (size!20909 a!3186)))))

(declare-fun b!786950 () Bool)

(assert (=> b!786950 (= e!437435 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20488 a!3186) j!159) a!3186 mask!3328) lt!350990))))

(declare-fun b!786951 () Bool)

(declare-fun res!532903 () Bool)

(assert (=> b!786951 (=> (not res!532903) (not e!437444))))

(assert (=> b!786951 (= res!532903 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20488 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786952 () Bool)

(declare-fun res!532899 () Bool)

(assert (=> b!786952 (=> (not res!532899) (not e!437434))))

(assert (=> b!786952 (= res!532899 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20909 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20909 a!3186))))))

(declare-fun b!786953 () Bool)

(declare-fun e!437442 () Bool)

(assert (=> b!786953 (= e!437442 true)))

(assert (=> b!786953 e!437433))

(declare-fun res!532902 () Bool)

(assert (=> b!786953 (=> (not res!532902) (not e!437433))))

(declare-fun lt!350992 () (_ BitVec 64))

(assert (=> b!786953 (= res!532902 (= lt!350992 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350993 () Unit!27240)

(assert (=> b!786953 (= lt!350993 e!437441)))

(declare-fun c!87426 () Bool)

(assert (=> b!786953 (= c!87426 (= lt!350992 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786954 () Bool)

(assert (=> b!786954 (= e!437440 e!437442)))

(declare-fun res!532897 () Bool)

(assert (=> b!786954 (=> res!532897 e!437442)))

(assert (=> b!786954 (= res!532897 (= lt!350992 lt!350986))))

(assert (=> b!786954 (= lt!350992 (select (store (arr!20488 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!67760 res!532900) b!786940))

(assert (= (and b!786940 res!532906) b!786943))

(assert (= (and b!786943 res!532898) b!786933))

(assert (= (and b!786933 res!532895) b!786932))

(assert (= (and b!786932 res!532896) b!786934))

(assert (= (and b!786934 res!532913) b!786945))

(assert (= (and b!786945 res!532910) b!786946))

(assert (= (and b!786946 res!532909) b!786952))

(assert (= (and b!786952 res!532899) b!786948))

(assert (= (and b!786948 res!532905) b!786951))

(assert (= (and b!786951 res!532903) b!786936))

(assert (= (and b!786936 c!87427) b!786944))

(assert (= (and b!786936 (not c!87427)) b!786947))

(assert (= (and b!786936 res!532908) b!786949))

(assert (= (and b!786949 res!532901) b!786935))

(assert (= (and b!786935 res!532912) b!786950))

(assert (= (and b!786935 (not res!532904)) b!786939))

(assert (= (and b!786939 (not res!532907)) b!786954))

(assert (= (and b!786954 (not res!532897)) b!786953))

(assert (= (and b!786953 c!87426) b!786941))

(assert (= (and b!786953 (not c!87426)) b!786937))

(assert (= (and b!786953 res!532902) b!786938))

(assert (= (and b!786938 res!532911) b!786942))

(declare-fun m!728637 () Bool)

(assert (=> b!786939 m!728637))

(assert (=> b!786939 m!728637))

(declare-fun m!728639 () Bool)

(assert (=> b!786939 m!728639))

(assert (=> b!786944 m!728637))

(assert (=> b!786944 m!728637))

(declare-fun m!728641 () Bool)

(assert (=> b!786944 m!728641))

(declare-fun m!728643 () Bool)

(assert (=> b!786945 m!728643))

(assert (=> b!786950 m!728637))

(assert (=> b!786950 m!728637))

(declare-fun m!728645 () Bool)

(assert (=> b!786950 m!728645))

(declare-fun m!728647 () Bool)

(assert (=> b!786933 m!728647))

(declare-fun m!728649 () Bool)

(assert (=> b!786954 m!728649))

(declare-fun m!728651 () Bool)

(assert (=> b!786954 m!728651))

(declare-fun m!728653 () Bool)

(assert (=> b!786951 m!728653))

(assert (=> b!786943 m!728637))

(assert (=> b!786943 m!728637))

(declare-fun m!728655 () Bool)

(assert (=> b!786943 m!728655))

(declare-fun m!728657 () Bool)

(assert (=> b!786932 m!728657))

(assert (=> b!786947 m!728637))

(assert (=> b!786947 m!728637))

(assert (=> b!786947 m!728639))

(declare-fun m!728659 () Bool)

(assert (=> b!786934 m!728659))

(assert (=> b!786935 m!728637))

(assert (=> b!786935 m!728637))

(declare-fun m!728661 () Bool)

(assert (=> b!786935 m!728661))

(declare-fun m!728663 () Bool)

(assert (=> b!786935 m!728663))

(declare-fun m!728665 () Bool)

(assert (=> b!786935 m!728665))

(declare-fun m!728667 () Bool)

(assert (=> b!786938 m!728667))

(declare-fun m!728669 () Bool)

(assert (=> b!786938 m!728669))

(assert (=> b!786948 m!728637))

(assert (=> b!786948 m!728637))

(declare-fun m!728671 () Bool)

(assert (=> b!786948 m!728671))

(assert (=> b!786948 m!728671))

(assert (=> b!786948 m!728637))

(declare-fun m!728673 () Bool)

(assert (=> b!786948 m!728673))

(declare-fun m!728675 () Bool)

(assert (=> b!786946 m!728675))

(declare-fun m!728677 () Bool)

(assert (=> b!786949 m!728677))

(assert (=> b!786949 m!728677))

(declare-fun m!728679 () Bool)

(assert (=> b!786949 m!728679))

(assert (=> b!786949 m!728649))

(declare-fun m!728681 () Bool)

(assert (=> b!786949 m!728681))

(declare-fun m!728683 () Bool)

(assert (=> b!786949 m!728683))

(declare-fun m!728685 () Bool)

(assert (=> start!67760 m!728685))

(declare-fun m!728687 () Bool)

(assert (=> start!67760 m!728687))

(check-sat (not b!786935) (not b!786938) (not b!786945) (not b!786949) (not b!786948) (not b!786932) (not b!786943) (not b!786946) (not b!786939) (not b!786947) (not b!786950) (not b!786934) (not b!786933) (not b!786944) (not start!67760))
(check-sat)
