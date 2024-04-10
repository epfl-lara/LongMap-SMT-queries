; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67788 () Bool)

(assert start!67788)

(declare-fun b!787898 () Bool)

(declare-fun res!533708 () Bool)

(declare-fun e!437943 () Bool)

(assert (=> b!787898 (=> (not res!533708) (not e!437943))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787898 (= res!533708 (validKeyInArray!0 k!2102))))

(declare-fun b!787899 () Bool)

(declare-fun res!533694 () Bool)

(declare-fun e!437942 () Bool)

(assert (=> b!787899 (=> (not res!533694) (not e!437942))))

(declare-fun e!437946 () Bool)

(assert (=> b!787899 (= res!533694 e!437946)))

(declare-fun c!87511 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787899 (= c!87511 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787901 () Bool)

(declare-fun e!437944 () Bool)

(declare-fun e!437938 () Bool)

(assert (=> b!787901 (= e!437944 e!437938)))

(declare-fun res!533705 () Bool)

(assert (=> b!787901 (=> res!533705 e!437938)))

(declare-datatypes ((SeekEntryResult!8102 0))(
  ( (MissingZero!8102 (index!34776 (_ BitVec 32))) (Found!8102 (index!34777 (_ BitVec 32))) (Intermediate!8102 (undefined!8914 Bool) (index!34778 (_ BitVec 32)) (x!65714 (_ BitVec 32))) (Undefined!8102) (MissingVacant!8102 (index!34779 (_ BitVec 32))) )
))
(declare-fun lt!351492 () SeekEntryResult!8102)

(declare-fun lt!351496 () SeekEntryResult!8102)

(assert (=> b!787901 (= res!533705 (not (= lt!351492 lt!351496)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42828 0))(
  ( (array!42829 (arr!20502 (Array (_ BitVec 32) (_ BitVec 64))) (size!20923 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42828)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42828 (_ BitVec 32)) SeekEntryResult!8102)

(assert (=> b!787901 (= lt!351492 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20502 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787902 () Bool)

(declare-fun e!437941 () Bool)

(assert (=> b!787902 (= e!437941 e!437942)))

(declare-fun res!533693 () Bool)

(assert (=> b!787902 (=> (not res!533693) (not e!437942))))

(declare-fun lt!351494 () SeekEntryResult!8102)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42828 (_ BitVec 32)) SeekEntryResult!8102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787902 (= res!533693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20502 a!3186) j!159) mask!3328) (select (arr!20502 a!3186) j!159) a!3186 mask!3328) lt!351494))))

(assert (=> b!787902 (= lt!351494 (Intermediate!8102 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787903 () Bool)

(declare-fun e!437947 () Bool)

(assert (=> b!787903 (= e!437938 e!437947)))

(declare-fun res!533695 () Bool)

(assert (=> b!787903 (=> res!533695 e!437947)))

(declare-fun lt!351497 () (_ BitVec 64))

(declare-fun lt!351500 () (_ BitVec 64))

(assert (=> b!787903 (= res!533695 (= lt!351497 lt!351500))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787903 (= lt!351497 (select (store (arr!20502 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787904 () Bool)

(declare-datatypes ((Unit!27296 0))(
  ( (Unit!27297) )
))
(declare-fun e!437939 () Unit!27296)

(declare-fun Unit!27298 () Unit!27296)

(assert (=> b!787904 (= e!437939 Unit!27298)))

(declare-fun b!787905 () Bool)

(declare-fun e!437940 () Bool)

(assert (=> b!787905 (= e!437940 (not e!437944))))

(declare-fun res!533709 () Bool)

(assert (=> b!787905 (=> res!533709 e!437944)))

(declare-fun lt!351491 () SeekEntryResult!8102)

(assert (=> b!787905 (= res!533709 (or (not (is-Intermediate!8102 lt!351491)) (bvslt x!1131 (x!65714 lt!351491)) (not (= x!1131 (x!65714 lt!351491))) (not (= index!1321 (index!34778 lt!351491)))))))

(declare-fun e!437937 () Bool)

(assert (=> b!787905 e!437937))

(declare-fun res!533710 () Bool)

(assert (=> b!787905 (=> (not res!533710) (not e!437937))))

(declare-fun lt!351489 () SeekEntryResult!8102)

(assert (=> b!787905 (= res!533710 (= lt!351489 lt!351496))))

(assert (=> b!787905 (= lt!351496 (Found!8102 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42828 (_ BitVec 32)) SeekEntryResult!8102)

(assert (=> b!787905 (= lt!351489 (seekEntryOrOpen!0 (select (arr!20502 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42828 (_ BitVec 32)) Bool)

(assert (=> b!787905 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351498 () Unit!27296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27296)

(assert (=> b!787905 (= lt!351498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787906 () Bool)

(assert (=> b!787906 (= e!437946 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20502 a!3186) j!159) a!3186 mask!3328) lt!351494))))

(declare-fun res!533700 () Bool)

(assert (=> start!67788 (=> (not res!533700) (not e!437943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67788 (= res!533700 (validMask!0 mask!3328))))

(assert (=> start!67788 e!437943))

(assert (=> start!67788 true))

(declare-fun array_inv!16298 (array!42828) Bool)

(assert (=> start!67788 (array_inv!16298 a!3186)))

(declare-fun b!787900 () Bool)

(declare-fun e!437948 () Bool)

(assert (=> b!787900 (= e!437948 (= lt!351489 lt!351492))))

(declare-fun b!787907 () Bool)

(assert (=> b!787907 (= e!437937 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20502 a!3186) j!159) a!3186 mask!3328) lt!351496))))

(declare-fun b!787908 () Bool)

(assert (=> b!787908 (= e!437946 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20502 a!3186) j!159) a!3186 mask!3328) (Found!8102 j!159)))))

(declare-fun b!787909 () Bool)

(assert (=> b!787909 (= e!437943 e!437941)))

(declare-fun res!533702 () Bool)

(assert (=> b!787909 (=> (not res!533702) (not e!437941))))

(declare-fun lt!351490 () SeekEntryResult!8102)

(assert (=> b!787909 (= res!533702 (or (= lt!351490 (MissingZero!8102 i!1173)) (= lt!351490 (MissingVacant!8102 i!1173))))))

(assert (=> b!787909 (= lt!351490 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787910 () Bool)

(declare-fun res!533707 () Bool)

(assert (=> b!787910 (=> (not res!533707) (not e!437943))))

(assert (=> b!787910 (= res!533707 (validKeyInArray!0 (select (arr!20502 a!3186) j!159)))))

(declare-fun b!787911 () Bool)

(declare-fun res!533704 () Bool)

(assert (=> b!787911 (=> (not res!533704) (not e!437941))))

(assert (=> b!787911 (= res!533704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787912 () Bool)

(declare-fun res!533706 () Bool)

(assert (=> b!787912 (=> (not res!533706) (not e!437942))))

(assert (=> b!787912 (= res!533706 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20502 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787913 () Bool)

(declare-fun res!533698 () Bool)

(assert (=> b!787913 (=> (not res!533698) (not e!437941))))

(assert (=> b!787913 (= res!533698 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20923 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20923 a!3186))))))

(declare-fun b!787914 () Bool)

(declare-fun res!533711 () Bool)

(assert (=> b!787914 (=> (not res!533711) (not e!437943))))

(assert (=> b!787914 (= res!533711 (and (= (size!20923 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20923 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20923 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787915 () Bool)

(declare-fun res!533701 () Bool)

(assert (=> b!787915 (=> (not res!533701) (not e!437941))))

(declare-datatypes ((List!14504 0))(
  ( (Nil!14501) (Cons!14500 (h!15623 (_ BitVec 64)) (t!20819 List!14504)) )
))
(declare-fun arrayNoDuplicates!0 (array!42828 (_ BitVec 32) List!14504) Bool)

(assert (=> b!787915 (= res!533701 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14501))))

(declare-fun b!787916 () Bool)

(declare-fun res!533703 () Bool)

(assert (=> b!787916 (=> (not res!533703) (not e!437948))))

(declare-fun lt!351495 () array!42828)

(assert (=> b!787916 (= res!533703 (= (seekEntryOrOpen!0 lt!351500 lt!351495 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351500 lt!351495 mask!3328)))))

(declare-fun b!787917 () Bool)

(assert (=> b!787917 (= e!437947 true)))

(assert (=> b!787917 e!437948))

(declare-fun res!533696 () Bool)

(assert (=> b!787917 (=> (not res!533696) (not e!437948))))

(assert (=> b!787917 (= res!533696 (= lt!351497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351499 () Unit!27296)

(assert (=> b!787917 (= lt!351499 e!437939)))

(declare-fun c!87510 () Bool)

(assert (=> b!787917 (= c!87510 (= lt!351497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787918 () Bool)

(declare-fun res!533699 () Bool)

(assert (=> b!787918 (=> (not res!533699) (not e!437943))))

(declare-fun arrayContainsKey!0 (array!42828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787918 (= res!533699 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787919 () Bool)

(declare-fun Unit!27299 () Unit!27296)

(assert (=> b!787919 (= e!437939 Unit!27299)))

(assert (=> b!787919 false))

(declare-fun b!787920 () Bool)

(assert (=> b!787920 (= e!437942 e!437940)))

(declare-fun res!533697 () Bool)

(assert (=> b!787920 (=> (not res!533697) (not e!437940))))

(declare-fun lt!351493 () SeekEntryResult!8102)

(assert (=> b!787920 (= res!533697 (= lt!351493 lt!351491))))

(assert (=> b!787920 (= lt!351491 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351500 lt!351495 mask!3328))))

(assert (=> b!787920 (= lt!351493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351500 mask!3328) lt!351500 lt!351495 mask!3328))))

(assert (=> b!787920 (= lt!351500 (select (store (arr!20502 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787920 (= lt!351495 (array!42829 (store (arr!20502 a!3186) i!1173 k!2102) (size!20923 a!3186)))))

(assert (= (and start!67788 res!533700) b!787914))

(assert (= (and b!787914 res!533711) b!787910))

(assert (= (and b!787910 res!533707) b!787898))

(assert (= (and b!787898 res!533708) b!787918))

(assert (= (and b!787918 res!533699) b!787909))

(assert (= (and b!787909 res!533702) b!787911))

(assert (= (and b!787911 res!533704) b!787915))

(assert (= (and b!787915 res!533701) b!787913))

(assert (= (and b!787913 res!533698) b!787902))

(assert (= (and b!787902 res!533693) b!787912))

(assert (= (and b!787912 res!533706) b!787899))

(assert (= (and b!787899 c!87511) b!787906))

(assert (= (and b!787899 (not c!87511)) b!787908))

(assert (= (and b!787899 res!533694) b!787920))

(assert (= (and b!787920 res!533697) b!787905))

(assert (= (and b!787905 res!533710) b!787907))

(assert (= (and b!787905 (not res!533709)) b!787901))

(assert (= (and b!787901 (not res!533705)) b!787903))

(assert (= (and b!787903 (not res!533695)) b!787917))

(assert (= (and b!787917 c!87510) b!787919))

(assert (= (and b!787917 (not c!87510)) b!787904))

(assert (= (and b!787917 res!533696) b!787916))

(assert (= (and b!787916 res!533703) b!787900))

(declare-fun m!729365 () Bool)

(assert (=> b!787916 m!729365))

(declare-fun m!729367 () Bool)

(assert (=> b!787916 m!729367))

(declare-fun m!729369 () Bool)

(assert (=> b!787902 m!729369))

(assert (=> b!787902 m!729369))

(declare-fun m!729371 () Bool)

(assert (=> b!787902 m!729371))

(assert (=> b!787902 m!729371))

(assert (=> b!787902 m!729369))

(declare-fun m!729373 () Bool)

(assert (=> b!787902 m!729373))

(declare-fun m!729375 () Bool)

(assert (=> b!787909 m!729375))

(assert (=> b!787906 m!729369))

(assert (=> b!787906 m!729369))

(declare-fun m!729377 () Bool)

(assert (=> b!787906 m!729377))

(declare-fun m!729379 () Bool)

(assert (=> b!787903 m!729379))

(declare-fun m!729381 () Bool)

(assert (=> b!787903 m!729381))

(declare-fun m!729383 () Bool)

(assert (=> b!787912 m!729383))

(declare-fun m!729385 () Bool)

(assert (=> b!787898 m!729385))

(assert (=> b!787908 m!729369))

(assert (=> b!787908 m!729369))

(declare-fun m!729387 () Bool)

(assert (=> b!787908 m!729387))

(declare-fun m!729389 () Bool)

(assert (=> b!787911 m!729389))

(assert (=> b!787905 m!729369))

(assert (=> b!787905 m!729369))

(declare-fun m!729391 () Bool)

(assert (=> b!787905 m!729391))

(declare-fun m!729393 () Bool)

(assert (=> b!787905 m!729393))

(declare-fun m!729395 () Bool)

(assert (=> b!787905 m!729395))

(declare-fun m!729397 () Bool)

(assert (=> start!67788 m!729397))

(declare-fun m!729399 () Bool)

(assert (=> start!67788 m!729399))

(declare-fun m!729401 () Bool)

(assert (=> b!787915 m!729401))

(assert (=> b!787910 m!729369))

(assert (=> b!787910 m!729369))

(declare-fun m!729403 () Bool)

(assert (=> b!787910 m!729403))

(assert (=> b!787901 m!729369))

(assert (=> b!787901 m!729369))

(assert (=> b!787901 m!729387))

(assert (=> b!787907 m!729369))

(assert (=> b!787907 m!729369))

(declare-fun m!729405 () Bool)

(assert (=> b!787907 m!729405))

(declare-fun m!729407 () Bool)

(assert (=> b!787920 m!729407))

(declare-fun m!729409 () Bool)

(assert (=> b!787920 m!729409))

(assert (=> b!787920 m!729379))

(assert (=> b!787920 m!729407))

(declare-fun m!729411 () Bool)

(assert (=> b!787920 m!729411))

(declare-fun m!729413 () Bool)

(assert (=> b!787920 m!729413))

(declare-fun m!729415 () Bool)

(assert (=> b!787918 m!729415))

(push 1)

