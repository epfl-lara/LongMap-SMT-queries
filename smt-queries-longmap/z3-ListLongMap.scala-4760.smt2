; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65622 () Bool)

(assert start!65622)

(declare-fun b!750903 () Bool)

(declare-fun e!418922 () Bool)

(assert (=> b!750903 (= e!418922 true)))

(declare-fun e!418924 () Bool)

(assert (=> b!750903 e!418924))

(declare-fun res!506881 () Bool)

(assert (=> b!750903 (=> (not res!506881) (not e!418924))))

(declare-fun lt!333920 () (_ BitVec 64))

(assert (=> b!750903 (= res!506881 (= lt!333920 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25824 0))(
  ( (Unit!25825) )
))
(declare-fun lt!333914 () Unit!25824)

(declare-fun e!418921 () Unit!25824)

(assert (=> b!750903 (= lt!333914 e!418921)))

(declare-fun c!82395 () Bool)

(assert (=> b!750903 (= c!82395 (= lt!333920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750904 () Bool)

(declare-fun res!506890 () Bool)

(declare-fun e!418931 () Bool)

(assert (=> b!750904 (=> (not res!506890) (not e!418931))))

(declare-datatypes ((array!41795 0))(
  ( (array!41796 (arr!20011 (Array (_ BitVec 32) (_ BitVec 64))) (size!20432 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41795)

(declare-datatypes ((List!14013 0))(
  ( (Nil!14010) (Cons!14009 (h!15081 (_ BitVec 64)) (t!20328 List!14013)) )
))
(declare-fun arrayNoDuplicates!0 (array!41795 (_ BitVec 32) List!14013) Bool)

(assert (=> b!750904 (= res!506890 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14010))))

(declare-fun b!750906 () Bool)

(declare-fun res!506891 () Bool)

(declare-fun e!418927 () Bool)

(assert (=> b!750906 (=> (not res!506891) (not e!418927))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750906 (= res!506891 (validKeyInArray!0 k0!2102))))

(declare-fun b!750907 () Bool)

(declare-fun e!418923 () Bool)

(declare-fun e!418928 () Bool)

(assert (=> b!750907 (= e!418923 (not e!418928))))

(declare-fun res!506875 () Bool)

(assert (=> b!750907 (=> res!506875 e!418928)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7611 0))(
  ( (MissingZero!7611 (index!32812 (_ BitVec 32))) (Found!7611 (index!32813 (_ BitVec 32))) (Intermediate!7611 (undefined!8423 Bool) (index!32814 (_ BitVec 32)) (x!63737 (_ BitVec 32))) (Undefined!7611) (MissingVacant!7611 (index!32815 (_ BitVec 32))) )
))
(declare-fun lt!333913 () SeekEntryResult!7611)

(get-info :version)

(assert (=> b!750907 (= res!506875 (or (not ((_ is Intermediate!7611) lt!333913)) (bvslt x!1131 (x!63737 lt!333913)) (not (= x!1131 (x!63737 lt!333913))) (not (= index!1321 (index!32814 lt!333913)))))))

(declare-fun e!418925 () Bool)

(assert (=> b!750907 e!418925))

(declare-fun res!506888 () Bool)

(assert (=> b!750907 (=> (not res!506888) (not e!418925))))

(declare-fun lt!333915 () SeekEntryResult!7611)

(declare-fun lt!333916 () SeekEntryResult!7611)

(assert (=> b!750907 (= res!506888 (= lt!333915 lt!333916))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!750907 (= lt!333916 (Found!7611 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41795 (_ BitVec 32)) SeekEntryResult!7611)

(assert (=> b!750907 (= lt!333915 (seekEntryOrOpen!0 (select (arr!20011 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41795 (_ BitVec 32)) Bool)

(assert (=> b!750907 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333923 () Unit!25824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25824)

(assert (=> b!750907 (= lt!333923 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750908 () Bool)

(declare-fun res!506884 () Bool)

(assert (=> b!750908 (=> res!506884 e!418928)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41795 (_ BitVec 32)) SeekEntryResult!7611)

(assert (=> b!750908 (= res!506884 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20011 a!3186) j!159) a!3186 mask!3328) lt!333916)))))

(declare-fun b!750909 () Bool)

(declare-fun res!506874 () Bool)

(assert (=> b!750909 (=> (not res!506874) (not e!418931))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750909 (= res!506874 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20432 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20432 a!3186))))))

(declare-fun b!750910 () Bool)

(assert (=> b!750910 (= e!418928 e!418922)))

(declare-fun res!506878 () Bool)

(assert (=> b!750910 (=> res!506878 e!418922)))

(declare-fun lt!333918 () (_ BitVec 64))

(assert (=> b!750910 (= res!506878 (= lt!333920 lt!333918))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750910 (= lt!333920 (select (store (arr!20011 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750911 () Bool)

(assert (=> b!750911 (= e!418927 e!418931)))

(declare-fun res!506883 () Bool)

(assert (=> b!750911 (=> (not res!506883) (not e!418931))))

(declare-fun lt!333921 () SeekEntryResult!7611)

(assert (=> b!750911 (= res!506883 (or (= lt!333921 (MissingZero!7611 i!1173)) (= lt!333921 (MissingVacant!7611 i!1173))))))

(assert (=> b!750911 (= lt!333921 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!333917 () SeekEntryResult!7611)

(declare-fun e!418930 () Bool)

(declare-fun b!750912 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41795 (_ BitVec 32)) SeekEntryResult!7611)

(assert (=> b!750912 (= e!418930 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20011 a!3186) j!159) a!3186 mask!3328) lt!333917))))

(declare-fun res!506879 () Bool)

(assert (=> start!65622 (=> (not res!506879) (not e!418927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65622 (= res!506879 (validMask!0 mask!3328))))

(assert (=> start!65622 e!418927))

(assert (=> start!65622 true))

(declare-fun array_inv!15807 (array!41795) Bool)

(assert (=> start!65622 (array_inv!15807 a!3186)))

(declare-fun b!750905 () Bool)

(declare-fun Unit!25826 () Unit!25824)

(assert (=> b!750905 (= e!418921 Unit!25826)))

(declare-fun b!750913 () Bool)

(declare-fun lt!333922 () array!41795)

(assert (=> b!750913 (= e!418924 (= (seekEntryOrOpen!0 lt!333918 lt!333922 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333918 lt!333922 mask!3328)))))

(declare-fun b!750914 () Bool)

(declare-fun res!506877 () Bool)

(assert (=> b!750914 (=> (not res!506877) (not e!418927))))

(assert (=> b!750914 (= res!506877 (validKeyInArray!0 (select (arr!20011 a!3186) j!159)))))

(declare-fun b!750915 () Bool)

(assert (=> b!750915 (= e!418925 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20011 a!3186) j!159) a!3186 mask!3328) lt!333916))))

(declare-fun b!750916 () Bool)

(assert (=> b!750916 (= e!418930 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20011 a!3186) j!159) a!3186 mask!3328) (Found!7611 j!159)))))

(declare-fun b!750917 () Bool)

(declare-fun res!506886 () Bool)

(assert (=> b!750917 (=> (not res!506886) (not e!418927))))

(assert (=> b!750917 (= res!506886 (and (= (size!20432 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20432 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20432 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750918 () Bool)

(declare-fun e!418929 () Bool)

(assert (=> b!750918 (= e!418929 e!418923)))

(declare-fun res!506880 () Bool)

(assert (=> b!750918 (=> (not res!506880) (not e!418923))))

(declare-fun lt!333919 () SeekEntryResult!7611)

(assert (=> b!750918 (= res!506880 (= lt!333919 lt!333913))))

(assert (=> b!750918 (= lt!333913 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333918 lt!333922 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750918 (= lt!333919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333918 mask!3328) lt!333918 lt!333922 mask!3328))))

(assert (=> b!750918 (= lt!333918 (select (store (arr!20011 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750918 (= lt!333922 (array!41796 (store (arr!20011 a!3186) i!1173 k0!2102) (size!20432 a!3186)))))

(declare-fun b!750919 () Bool)

(assert (=> b!750919 (= e!418931 e!418929)))

(declare-fun res!506882 () Bool)

(assert (=> b!750919 (=> (not res!506882) (not e!418929))))

(assert (=> b!750919 (= res!506882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20011 a!3186) j!159) mask!3328) (select (arr!20011 a!3186) j!159) a!3186 mask!3328) lt!333917))))

(assert (=> b!750919 (= lt!333917 (Intermediate!7611 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750920 () Bool)

(declare-fun res!506885 () Bool)

(assert (=> b!750920 (=> (not res!506885) (not e!418927))))

(declare-fun arrayContainsKey!0 (array!41795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750920 (= res!506885 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750921 () Bool)

(declare-fun Unit!25827 () Unit!25824)

(assert (=> b!750921 (= e!418921 Unit!25827)))

(assert (=> b!750921 false))

(declare-fun b!750922 () Bool)

(declare-fun res!506887 () Bool)

(assert (=> b!750922 (=> (not res!506887) (not e!418929))))

(assert (=> b!750922 (= res!506887 e!418930)))

(declare-fun c!82396 () Bool)

(assert (=> b!750922 (= c!82396 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750923 () Bool)

(declare-fun res!506876 () Bool)

(assert (=> b!750923 (=> (not res!506876) (not e!418931))))

(assert (=> b!750923 (= res!506876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750924 () Bool)

(declare-fun res!506889 () Bool)

(assert (=> b!750924 (=> (not res!506889) (not e!418929))))

(assert (=> b!750924 (= res!506889 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20011 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65622 res!506879) b!750917))

(assert (= (and b!750917 res!506886) b!750914))

(assert (= (and b!750914 res!506877) b!750906))

(assert (= (and b!750906 res!506891) b!750920))

(assert (= (and b!750920 res!506885) b!750911))

(assert (= (and b!750911 res!506883) b!750923))

(assert (= (and b!750923 res!506876) b!750904))

(assert (= (and b!750904 res!506890) b!750909))

(assert (= (and b!750909 res!506874) b!750919))

(assert (= (and b!750919 res!506882) b!750924))

(assert (= (and b!750924 res!506889) b!750922))

(assert (= (and b!750922 c!82396) b!750912))

(assert (= (and b!750922 (not c!82396)) b!750916))

(assert (= (and b!750922 res!506887) b!750918))

(assert (= (and b!750918 res!506880) b!750907))

(assert (= (and b!750907 res!506888) b!750915))

(assert (= (and b!750907 (not res!506875)) b!750908))

(assert (= (and b!750908 (not res!506884)) b!750910))

(assert (= (and b!750910 (not res!506878)) b!750903))

(assert (= (and b!750903 c!82395) b!750921))

(assert (= (and b!750903 (not c!82395)) b!750905))

(assert (= (and b!750903 res!506881) b!750913))

(declare-fun m!700199 () Bool)

(assert (=> b!750910 m!700199))

(declare-fun m!700201 () Bool)

(assert (=> b!750910 m!700201))

(declare-fun m!700203 () Bool)

(assert (=> b!750911 m!700203))

(declare-fun m!700205 () Bool)

(assert (=> b!750918 m!700205))

(declare-fun m!700207 () Bool)

(assert (=> b!750918 m!700207))

(declare-fun m!700209 () Bool)

(assert (=> b!750918 m!700209))

(assert (=> b!750918 m!700205))

(declare-fun m!700211 () Bool)

(assert (=> b!750918 m!700211))

(assert (=> b!750918 m!700199))

(declare-fun m!700213 () Bool)

(assert (=> b!750919 m!700213))

(assert (=> b!750919 m!700213))

(declare-fun m!700215 () Bool)

(assert (=> b!750919 m!700215))

(assert (=> b!750919 m!700215))

(assert (=> b!750919 m!700213))

(declare-fun m!700217 () Bool)

(assert (=> b!750919 m!700217))

(assert (=> b!750914 m!700213))

(assert (=> b!750914 m!700213))

(declare-fun m!700219 () Bool)

(assert (=> b!750914 m!700219))

(assert (=> b!750908 m!700213))

(assert (=> b!750908 m!700213))

(declare-fun m!700221 () Bool)

(assert (=> b!750908 m!700221))

(declare-fun m!700223 () Bool)

(assert (=> b!750923 m!700223))

(declare-fun m!700225 () Bool)

(assert (=> b!750913 m!700225))

(declare-fun m!700227 () Bool)

(assert (=> b!750913 m!700227))

(declare-fun m!700229 () Bool)

(assert (=> b!750920 m!700229))

(assert (=> b!750907 m!700213))

(assert (=> b!750907 m!700213))

(declare-fun m!700231 () Bool)

(assert (=> b!750907 m!700231))

(declare-fun m!700233 () Bool)

(assert (=> b!750907 m!700233))

(declare-fun m!700235 () Bool)

(assert (=> b!750907 m!700235))

(declare-fun m!700237 () Bool)

(assert (=> b!750924 m!700237))

(assert (=> b!750916 m!700213))

(assert (=> b!750916 m!700213))

(assert (=> b!750916 m!700221))

(assert (=> b!750912 m!700213))

(assert (=> b!750912 m!700213))

(declare-fun m!700239 () Bool)

(assert (=> b!750912 m!700239))

(assert (=> b!750915 m!700213))

(assert (=> b!750915 m!700213))

(declare-fun m!700241 () Bool)

(assert (=> b!750915 m!700241))

(declare-fun m!700243 () Bool)

(assert (=> start!65622 m!700243))

(declare-fun m!700245 () Bool)

(assert (=> start!65622 m!700245))

(declare-fun m!700247 () Bool)

(assert (=> b!750906 m!700247))

(declare-fun m!700249 () Bool)

(assert (=> b!750904 m!700249))

(check-sat (not b!750920) (not b!750915) (not b!750913) (not b!750918) (not b!750904) (not start!65622) (not b!750914) (not b!750923) (not b!750906) (not b!750916) (not b!750919) (not b!750907) (not b!750911) (not b!750912) (not b!750908))
(check-sat)
