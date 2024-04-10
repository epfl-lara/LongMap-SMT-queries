; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65652 () Bool)

(assert start!65652)

(declare-fun b!751907 () Bool)

(declare-fun e!419438 () Bool)

(declare-fun e!419430 () Bool)

(assert (=> b!751907 (= e!419438 e!419430)))

(declare-fun res!507710 () Bool)

(assert (=> b!751907 (=> res!507710 e!419430)))

(declare-fun lt!334432 () (_ BitVec 64))

(declare-fun lt!334422 () (_ BitVec 64))

(assert (=> b!751907 (= res!507710 (= lt!334432 lt!334422))))

(declare-datatypes ((array!41825 0))(
  ( (array!41826 (arr!20026 (Array (_ BitVec 32) (_ BitVec 64))) (size!20447 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41825)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!751907 (= lt!334432 (select (store (arr!20026 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751908 () Bool)

(declare-fun res!507714 () Bool)

(declare-fun e!419435 () Bool)

(assert (=> b!751908 (=> (not res!507714) (not e!419435))))

(declare-fun arrayContainsKey!0 (array!41825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751908 (= res!507714 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751909 () Bool)

(declare-datatypes ((Unit!25884 0))(
  ( (Unit!25885) )
))
(declare-fun e!419436 () Unit!25884)

(declare-fun Unit!25886 () Unit!25884)

(assert (=> b!751909 (= e!419436 Unit!25886)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!419434 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!751910 () Bool)

(declare-datatypes ((SeekEntryResult!7626 0))(
  ( (MissingZero!7626 (index!32872 (_ BitVec 32))) (Found!7626 (index!32873 (_ BitVec 32))) (Intermediate!7626 (undefined!8438 Bool) (index!32874 (_ BitVec 32)) (x!63792 (_ BitVec 32))) (Undefined!7626) (MissingVacant!7626 (index!32875 (_ BitVec 32))) )
))
(declare-fun lt!334429 () SeekEntryResult!7626)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41825 (_ BitVec 32)) SeekEntryResult!7626)

(assert (=> b!751910 (= e!419434 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20026 a!3186) j!159) a!3186 mask!3328) lt!334429))))

(declare-fun res!507709 () Bool)

(assert (=> start!65652 (=> (not res!507709) (not e!419435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65652 (= res!507709 (validMask!0 mask!3328))))

(assert (=> start!65652 e!419435))

(assert (=> start!65652 true))

(declare-fun array_inv!15822 (array!41825) Bool)

(assert (=> start!65652 (array_inv!15822 a!3186)))

(declare-fun b!751911 () Bool)

(assert (=> b!751911 (= e!419430 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun e!419440 () Bool)

(assert (=> b!751911 e!419440))

(declare-fun res!507701 () Bool)

(assert (=> b!751911 (=> (not res!507701) (not e!419440))))

(assert (=> b!751911 (= res!507701 (= lt!334432 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334430 () Unit!25884)

(assert (=> b!751911 (= lt!334430 e!419436)))

(declare-fun c!82485 () Bool)

(assert (=> b!751911 (= c!82485 (= lt!334432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751912 () Bool)

(declare-fun res!507700 () Bool)

(assert (=> b!751912 (=> (not res!507700) (not e!419435))))

(assert (=> b!751912 (= res!507700 (and (= (size!20447 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20447 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20447 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751913 () Bool)

(declare-fun e!419432 () Bool)

(declare-fun e!419439 () Bool)

(assert (=> b!751913 (= e!419432 e!419439)))

(declare-fun res!507698 () Bool)

(assert (=> b!751913 (=> (not res!507698) (not e!419439))))

(declare-fun lt!334433 () SeekEntryResult!7626)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41825 (_ BitVec 32)) SeekEntryResult!7626)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751913 (= res!507698 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20026 a!3186) j!159) mask!3328) (select (arr!20026 a!3186) j!159) a!3186 mask!3328) lt!334433))))

(assert (=> b!751913 (= lt!334433 (Intermediate!7626 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751914 () Bool)

(declare-fun lt!334431 () SeekEntryResult!7626)

(declare-fun lt!334426 () SeekEntryResult!7626)

(assert (=> b!751914 (= e!419440 (= lt!334431 lt!334426))))

(declare-fun b!751915 () Bool)

(declare-fun res!507705 () Bool)

(assert (=> b!751915 (=> (not res!507705) (not e!419432))))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!751915 (= res!507705 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20447 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20447 a!3186))))))

(declare-fun b!751916 () Bool)

(declare-fun res!507712 () Bool)

(assert (=> b!751916 (=> (not res!507712) (not e!419440))))

(declare-fun lt!334425 () array!41825)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41825 (_ BitVec 32)) SeekEntryResult!7626)

(assert (=> b!751916 (= res!507712 (= (seekEntryOrOpen!0 lt!334422 lt!334425 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334422 lt!334425 mask!3328)))))

(declare-fun b!751917 () Bool)

(declare-fun res!507708 () Bool)

(assert (=> b!751917 (=> (not res!507708) (not e!419439))))

(declare-fun e!419441 () Bool)

(assert (=> b!751917 (= res!507708 e!419441)))

(declare-fun c!82486 () Bool)

(assert (=> b!751917 (= c!82486 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751918 () Bool)

(assert (=> b!751918 (= e!419441 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20026 a!3186) j!159) a!3186 mask!3328) lt!334433))))

(declare-fun b!751919 () Bool)

(declare-fun e!419431 () Bool)

(assert (=> b!751919 (= e!419439 e!419431)))

(declare-fun res!507716 () Bool)

(assert (=> b!751919 (=> (not res!507716) (not e!419431))))

(declare-fun lt!334427 () SeekEntryResult!7626)

(declare-fun lt!334424 () SeekEntryResult!7626)

(assert (=> b!751919 (= res!507716 (= lt!334427 lt!334424))))

(assert (=> b!751919 (= lt!334424 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334422 lt!334425 mask!3328))))

(assert (=> b!751919 (= lt!334427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334422 mask!3328) lt!334422 lt!334425 mask!3328))))

(assert (=> b!751919 (= lt!334422 (select (store (arr!20026 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751919 (= lt!334425 (array!41826 (store (arr!20026 a!3186) i!1173 k0!2102) (size!20447 a!3186)))))

(declare-fun b!751920 () Bool)

(assert (=> b!751920 (= e!419435 e!419432)))

(declare-fun res!507704 () Bool)

(assert (=> b!751920 (=> (not res!507704) (not e!419432))))

(declare-fun lt!334428 () SeekEntryResult!7626)

(assert (=> b!751920 (= res!507704 (or (= lt!334428 (MissingZero!7626 i!1173)) (= lt!334428 (MissingVacant!7626 i!1173))))))

(assert (=> b!751920 (= lt!334428 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751921 () Bool)

(declare-fun e!419433 () Bool)

(assert (=> b!751921 (= e!419431 (not e!419433))))

(declare-fun res!507699 () Bool)

(assert (=> b!751921 (=> res!507699 e!419433)))

(get-info :version)

(assert (=> b!751921 (= res!507699 (or (not ((_ is Intermediate!7626) lt!334424)) (bvslt x!1131 (x!63792 lt!334424)) (not (= x!1131 (x!63792 lt!334424))) (not (= index!1321 (index!32874 lt!334424)))))))

(assert (=> b!751921 e!419434))

(declare-fun res!507703 () Bool)

(assert (=> b!751921 (=> (not res!507703) (not e!419434))))

(assert (=> b!751921 (= res!507703 (= lt!334431 lt!334429))))

(assert (=> b!751921 (= lt!334429 (Found!7626 j!159))))

(assert (=> b!751921 (= lt!334431 (seekEntryOrOpen!0 (select (arr!20026 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41825 (_ BitVec 32)) Bool)

(assert (=> b!751921 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334423 () Unit!25884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25884)

(assert (=> b!751921 (= lt!334423 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751922 () Bool)

(declare-fun res!507706 () Bool)

(assert (=> b!751922 (=> (not res!507706) (not e!419435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751922 (= res!507706 (validKeyInArray!0 k0!2102))))

(declare-fun b!751923 () Bool)

(declare-fun res!507715 () Bool)

(assert (=> b!751923 (=> (not res!507715) (not e!419439))))

(assert (=> b!751923 (= res!507715 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20026 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751924 () Bool)

(assert (=> b!751924 (= e!419433 e!419438)))

(declare-fun res!507707 () Bool)

(assert (=> b!751924 (=> res!507707 e!419438)))

(assert (=> b!751924 (= res!507707 (not (= lt!334426 lt!334429)))))

(assert (=> b!751924 (= lt!334426 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20026 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751925 () Bool)

(declare-fun Unit!25887 () Unit!25884)

(assert (=> b!751925 (= e!419436 Unit!25887)))

(assert (=> b!751925 false))

(declare-fun b!751926 () Bool)

(assert (=> b!751926 (= e!419441 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20026 a!3186) j!159) a!3186 mask!3328) (Found!7626 j!159)))))

(declare-fun b!751927 () Bool)

(declare-fun res!507702 () Bool)

(assert (=> b!751927 (=> (not res!507702) (not e!419432))))

(assert (=> b!751927 (= res!507702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751928 () Bool)

(declare-fun res!507713 () Bool)

(assert (=> b!751928 (=> (not res!507713) (not e!419435))))

(assert (=> b!751928 (= res!507713 (validKeyInArray!0 (select (arr!20026 a!3186) j!159)))))

(declare-fun b!751929 () Bool)

(declare-fun res!507711 () Bool)

(assert (=> b!751929 (=> (not res!507711) (not e!419432))))

(declare-datatypes ((List!14028 0))(
  ( (Nil!14025) (Cons!14024 (h!15096 (_ BitVec 64)) (t!20343 List!14028)) )
))
(declare-fun arrayNoDuplicates!0 (array!41825 (_ BitVec 32) List!14028) Bool)

(assert (=> b!751929 (= res!507711 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14025))))

(assert (= (and start!65652 res!507709) b!751912))

(assert (= (and b!751912 res!507700) b!751928))

(assert (= (and b!751928 res!507713) b!751922))

(assert (= (and b!751922 res!507706) b!751908))

(assert (= (and b!751908 res!507714) b!751920))

(assert (= (and b!751920 res!507704) b!751927))

(assert (= (and b!751927 res!507702) b!751929))

(assert (= (and b!751929 res!507711) b!751915))

(assert (= (and b!751915 res!507705) b!751913))

(assert (= (and b!751913 res!507698) b!751923))

(assert (= (and b!751923 res!507715) b!751917))

(assert (= (and b!751917 c!82486) b!751918))

(assert (= (and b!751917 (not c!82486)) b!751926))

(assert (= (and b!751917 res!507708) b!751919))

(assert (= (and b!751919 res!507716) b!751921))

(assert (= (and b!751921 res!507703) b!751910))

(assert (= (and b!751921 (not res!507699)) b!751924))

(assert (= (and b!751924 (not res!507707)) b!751907))

(assert (= (and b!751907 (not res!507710)) b!751911))

(assert (= (and b!751911 c!82485) b!751925))

(assert (= (and b!751911 (not c!82485)) b!751909))

(assert (= (and b!751911 res!507701) b!751916))

(assert (= (and b!751916 res!507712) b!751914))

(declare-fun m!700979 () Bool)

(assert (=> b!751918 m!700979))

(assert (=> b!751918 m!700979))

(declare-fun m!700981 () Bool)

(assert (=> b!751918 m!700981))

(declare-fun m!700983 () Bool)

(assert (=> b!751929 m!700983))

(declare-fun m!700985 () Bool)

(assert (=> b!751908 m!700985))

(assert (=> b!751910 m!700979))

(assert (=> b!751910 m!700979))

(declare-fun m!700987 () Bool)

(assert (=> b!751910 m!700987))

(declare-fun m!700989 () Bool)

(assert (=> b!751907 m!700989))

(declare-fun m!700991 () Bool)

(assert (=> b!751907 m!700991))

(declare-fun m!700993 () Bool)

(assert (=> b!751927 m!700993))

(declare-fun m!700995 () Bool)

(assert (=> b!751916 m!700995))

(declare-fun m!700997 () Bool)

(assert (=> b!751916 m!700997))

(declare-fun m!700999 () Bool)

(assert (=> b!751920 m!700999))

(declare-fun m!701001 () Bool)

(assert (=> start!65652 m!701001))

(declare-fun m!701003 () Bool)

(assert (=> start!65652 m!701003))

(assert (=> b!751921 m!700979))

(assert (=> b!751921 m!700979))

(declare-fun m!701005 () Bool)

(assert (=> b!751921 m!701005))

(declare-fun m!701007 () Bool)

(assert (=> b!751921 m!701007))

(declare-fun m!701009 () Bool)

(assert (=> b!751921 m!701009))

(declare-fun m!701011 () Bool)

(assert (=> b!751923 m!701011))

(assert (=> b!751928 m!700979))

(assert (=> b!751928 m!700979))

(declare-fun m!701013 () Bool)

(assert (=> b!751928 m!701013))

(declare-fun m!701015 () Bool)

(assert (=> b!751922 m!701015))

(declare-fun m!701017 () Bool)

(assert (=> b!751919 m!701017))

(declare-fun m!701019 () Bool)

(assert (=> b!751919 m!701019))

(declare-fun m!701021 () Bool)

(assert (=> b!751919 m!701021))

(declare-fun m!701023 () Bool)

(assert (=> b!751919 m!701023))

(assert (=> b!751919 m!700989))

(assert (=> b!751919 m!701021))

(assert (=> b!751924 m!700979))

(assert (=> b!751924 m!700979))

(declare-fun m!701025 () Bool)

(assert (=> b!751924 m!701025))

(assert (=> b!751913 m!700979))

(assert (=> b!751913 m!700979))

(declare-fun m!701027 () Bool)

(assert (=> b!751913 m!701027))

(assert (=> b!751913 m!701027))

(assert (=> b!751913 m!700979))

(declare-fun m!701029 () Bool)

(assert (=> b!751913 m!701029))

(assert (=> b!751926 m!700979))

(assert (=> b!751926 m!700979))

(assert (=> b!751926 m!701025))

(check-sat (not b!751919) (not b!751921) (not b!751916) (not b!751927) (not b!751926) (not b!751922) (not b!751929) (not b!751910) (not b!751918) (not b!751908) (not b!751913) (not b!751924) (not b!751920) (not b!751928) (not start!65652))
(check-sat)
