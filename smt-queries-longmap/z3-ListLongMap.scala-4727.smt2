; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65424 () Bool)

(assert start!65424)

(declare-fun b!744894 () Bool)

(declare-fun res!501831 () Bool)

(declare-fun e!416079 () Bool)

(assert (=> b!744894 (=> (not res!501831) (not e!416079))))

(declare-fun e!416077 () Bool)

(assert (=> b!744894 (= res!501831 e!416077)))

(declare-fun c!81913 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744894 (= c!81913 (bvsle x!1131 resIntermediateX!5))))

(declare-datatypes ((array!41597 0))(
  ( (array!41598 (arr!19912 (Array (_ BitVec 32) (_ BitVec 64))) (size!20333 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41597)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun b!744895 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!416084 () Bool)

(declare-fun lt!330920 () (_ BitVec 64))

(assert (=> b!744895 (= e!416084 (or (= (select (store (arr!19912 a!3186) i!1173 k0!2102) index!1321) lt!330920) (not (= (select (store (arr!19912 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!744896 () Bool)

(declare-fun e!416082 () Bool)

(declare-fun e!416081 () Bool)

(assert (=> b!744896 (= e!416082 e!416081)))

(declare-fun res!501841 () Bool)

(assert (=> b!744896 (=> (not res!501841) (not e!416081))))

(declare-datatypes ((SeekEntryResult!7512 0))(
  ( (MissingZero!7512 (index!32416 (_ BitVec 32))) (Found!7512 (index!32417 (_ BitVec 32))) (Intermediate!7512 (undefined!8324 Bool) (index!32418 (_ BitVec 32)) (x!63374 (_ BitVec 32))) (Undefined!7512) (MissingVacant!7512 (index!32419 (_ BitVec 32))) )
))
(declare-fun lt!330926 () SeekEntryResult!7512)

(assert (=> b!744896 (= res!501841 (or (= lt!330926 (MissingZero!7512 i!1173)) (= lt!330926 (MissingVacant!7512 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41597 (_ BitVec 32)) SeekEntryResult!7512)

(assert (=> b!744896 (= lt!330926 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!744898 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41597 (_ BitVec 32)) SeekEntryResult!7512)

(assert (=> b!744898 (= e!416077 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) (Found!7512 j!159)))))

(declare-fun b!744899 () Bool)

(declare-fun e!416080 () Bool)

(assert (=> b!744899 (= e!416079 e!416080)))

(declare-fun res!501842 () Bool)

(assert (=> b!744899 (=> (not res!501842) (not e!416080))))

(declare-fun lt!330921 () SeekEntryResult!7512)

(declare-fun lt!330919 () SeekEntryResult!7512)

(assert (=> b!744899 (= res!501842 (= lt!330921 lt!330919))))

(declare-fun lt!330925 () array!41597)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41597 (_ BitVec 32)) SeekEntryResult!7512)

(assert (=> b!744899 (= lt!330919 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330920 lt!330925 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744899 (= lt!330921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330920 mask!3328) lt!330920 lt!330925 mask!3328))))

(assert (=> b!744899 (= lt!330920 (select (store (arr!19912 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744899 (= lt!330925 (array!41598 (store (arr!19912 a!3186) i!1173 k0!2102) (size!20333 a!3186)))))

(declare-fun e!416083 () Bool)

(declare-fun b!744900 () Bool)

(declare-fun lt!330922 () SeekEntryResult!7512)

(assert (=> b!744900 (= e!416083 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) lt!330922))))

(declare-fun b!744901 () Bool)

(declare-fun res!501838 () Bool)

(assert (=> b!744901 (=> (not res!501838) (not e!416081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41597 (_ BitVec 32)) Bool)

(assert (=> b!744901 (= res!501838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744902 () Bool)

(declare-fun res!501840 () Bool)

(assert (=> b!744902 (=> (not res!501840) (not e!416081))))

(assert (=> b!744902 (= res!501840 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20333 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20333 a!3186))))))

(declare-fun b!744903 () Bool)

(declare-fun res!501844 () Bool)

(assert (=> b!744903 (=> (not res!501844) (not e!416081))))

(declare-datatypes ((List!13914 0))(
  ( (Nil!13911) (Cons!13910 (h!14982 (_ BitVec 64)) (t!20229 List!13914)) )
))
(declare-fun arrayNoDuplicates!0 (array!41597 (_ BitVec 32) List!13914) Bool)

(assert (=> b!744903 (= res!501844 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13911))))

(declare-fun b!744904 () Bool)

(assert (=> b!744904 (= e!416081 e!416079)))

(declare-fun res!501835 () Bool)

(assert (=> b!744904 (=> (not res!501835) (not e!416079))))

(declare-fun lt!330923 () SeekEntryResult!7512)

(assert (=> b!744904 (= res!501835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19912 a!3186) j!159) mask!3328) (select (arr!19912 a!3186) j!159) a!3186 mask!3328) lt!330923))))

(assert (=> b!744904 (= lt!330923 (Intermediate!7512 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744905 () Bool)

(assert (=> b!744905 (= e!416080 (not e!416084))))

(declare-fun res!501830 () Bool)

(assert (=> b!744905 (=> res!501830 e!416084)))

(get-info :version)

(assert (=> b!744905 (= res!501830 (or (not ((_ is Intermediate!7512) lt!330919)) (bvslt x!1131 (x!63374 lt!330919)) (not (= x!1131 (x!63374 lt!330919))) (not (= index!1321 (index!32418 lt!330919)))))))

(declare-fun e!416078 () Bool)

(assert (=> b!744905 e!416078))

(declare-fun res!501843 () Bool)

(assert (=> b!744905 (=> (not res!501843) (not e!416078))))

(assert (=> b!744905 (= res!501843 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25504 0))(
  ( (Unit!25505) )
))
(declare-fun lt!330924 () Unit!25504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25504)

(assert (=> b!744905 (= lt!330924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744906 () Bool)

(declare-fun res!501829 () Bool)

(assert (=> b!744906 (=> res!501829 e!416084)))

(assert (=> b!744906 (= res!501829 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) (Found!7512 j!159))))))

(declare-fun b!744907 () Bool)

(declare-fun res!501834 () Bool)

(assert (=> b!744907 (=> (not res!501834) (not e!416082))))

(assert (=> b!744907 (= res!501834 (and (= (size!20333 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20333 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20333 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744908 () Bool)

(declare-fun res!501839 () Bool)

(assert (=> b!744908 (=> (not res!501839) (not e!416082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744908 (= res!501839 (validKeyInArray!0 k0!2102))))

(declare-fun b!744909 () Bool)

(declare-fun res!501833 () Bool)

(assert (=> b!744909 (=> (not res!501833) (not e!416082))))

(declare-fun arrayContainsKey!0 (array!41597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744909 (= res!501833 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744910 () Bool)

(declare-fun res!501832 () Bool)

(assert (=> b!744910 (=> (not res!501832) (not e!416082))))

(assert (=> b!744910 (= res!501832 (validKeyInArray!0 (select (arr!19912 a!3186) j!159)))))

(declare-fun b!744911 () Bool)

(assert (=> b!744911 (= e!416078 e!416083)))

(declare-fun res!501845 () Bool)

(assert (=> b!744911 (=> (not res!501845) (not e!416083))))

(assert (=> b!744911 (= res!501845 (= (seekEntryOrOpen!0 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) lt!330922))))

(assert (=> b!744911 (= lt!330922 (Found!7512 j!159))))

(declare-fun b!744912 () Bool)

(assert (=> b!744912 (= e!416077 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) lt!330923))))

(declare-fun res!501837 () Bool)

(assert (=> start!65424 (=> (not res!501837) (not e!416082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65424 (= res!501837 (validMask!0 mask!3328))))

(assert (=> start!65424 e!416082))

(assert (=> start!65424 true))

(declare-fun array_inv!15708 (array!41597) Bool)

(assert (=> start!65424 (array_inv!15708 a!3186)))

(declare-fun b!744897 () Bool)

(declare-fun res!501836 () Bool)

(assert (=> b!744897 (=> (not res!501836) (not e!416079))))

(assert (=> b!744897 (= res!501836 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19912 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65424 res!501837) b!744907))

(assert (= (and b!744907 res!501834) b!744910))

(assert (= (and b!744910 res!501832) b!744908))

(assert (= (and b!744908 res!501839) b!744909))

(assert (= (and b!744909 res!501833) b!744896))

(assert (= (and b!744896 res!501841) b!744901))

(assert (= (and b!744901 res!501838) b!744903))

(assert (= (and b!744903 res!501844) b!744902))

(assert (= (and b!744902 res!501840) b!744904))

(assert (= (and b!744904 res!501835) b!744897))

(assert (= (and b!744897 res!501836) b!744894))

(assert (= (and b!744894 c!81913) b!744912))

(assert (= (and b!744894 (not c!81913)) b!744898))

(assert (= (and b!744894 res!501831) b!744899))

(assert (= (and b!744899 res!501842) b!744905))

(assert (= (and b!744905 res!501843) b!744911))

(assert (= (and b!744911 res!501845) b!744900))

(assert (= (and b!744905 (not res!501830)) b!744906))

(assert (= (and b!744906 (not res!501829)) b!744895))

(declare-fun m!695353 () Bool)

(assert (=> b!744897 m!695353))

(declare-fun m!695355 () Bool)

(assert (=> b!744896 m!695355))

(declare-fun m!695357 () Bool)

(assert (=> b!744906 m!695357))

(assert (=> b!744906 m!695357))

(declare-fun m!695359 () Bool)

(assert (=> b!744906 m!695359))

(assert (=> b!744900 m!695357))

(assert (=> b!744900 m!695357))

(declare-fun m!695361 () Bool)

(assert (=> b!744900 m!695361))

(assert (=> b!744911 m!695357))

(assert (=> b!744911 m!695357))

(declare-fun m!695363 () Bool)

(assert (=> b!744911 m!695363))

(assert (=> b!744912 m!695357))

(assert (=> b!744912 m!695357))

(declare-fun m!695365 () Bool)

(assert (=> b!744912 m!695365))

(declare-fun m!695367 () Bool)

(assert (=> b!744905 m!695367))

(declare-fun m!695369 () Bool)

(assert (=> b!744905 m!695369))

(declare-fun m!695371 () Bool)

(assert (=> b!744903 m!695371))

(assert (=> b!744910 m!695357))

(assert (=> b!744910 m!695357))

(declare-fun m!695373 () Bool)

(assert (=> b!744910 m!695373))

(declare-fun m!695375 () Bool)

(assert (=> b!744908 m!695375))

(declare-fun m!695377 () Bool)

(assert (=> b!744901 m!695377))

(declare-fun m!695379 () Bool)

(assert (=> b!744895 m!695379))

(declare-fun m!695381 () Bool)

(assert (=> b!744895 m!695381))

(declare-fun m!695383 () Bool)

(assert (=> b!744909 m!695383))

(declare-fun m!695385 () Bool)

(assert (=> start!65424 m!695385))

(declare-fun m!695387 () Bool)

(assert (=> start!65424 m!695387))

(assert (=> b!744898 m!695357))

(assert (=> b!744898 m!695357))

(assert (=> b!744898 m!695359))

(assert (=> b!744904 m!695357))

(assert (=> b!744904 m!695357))

(declare-fun m!695389 () Bool)

(assert (=> b!744904 m!695389))

(assert (=> b!744904 m!695389))

(assert (=> b!744904 m!695357))

(declare-fun m!695391 () Bool)

(assert (=> b!744904 m!695391))

(declare-fun m!695393 () Bool)

(assert (=> b!744899 m!695393))

(declare-fun m!695395 () Bool)

(assert (=> b!744899 m!695395))

(assert (=> b!744899 m!695379))

(declare-fun m!695397 () Bool)

(assert (=> b!744899 m!695397))

(assert (=> b!744899 m!695395))

(declare-fun m!695399 () Bool)

(assert (=> b!744899 m!695399))

(check-sat (not b!744898) (not b!744904) (not b!744899) (not b!744901) (not b!744900) (not b!744910) (not b!744905) (not b!744911) (not b!744896) (not start!65424) (not b!744908) (not b!744909) (not b!744912) (not b!744903) (not b!744906))
(check-sat)
