; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65598 () Bool)

(assert start!65598)

(declare-fun b!746894 () Bool)

(declare-fun res!503255 () Bool)

(declare-fun e!417180 () Bool)

(assert (=> b!746894 (=> (not res!503255) (not e!417180))))

(declare-datatypes ((array!41641 0))(
  ( (array!41642 (arr!19930 (Array (_ BitVec 32) (_ BitVec 64))) (size!20350 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41641)

(declare-datatypes ((List!13839 0))(
  ( (Nil!13836) (Cons!13835 (h!14913 (_ BitVec 64)) (t!20146 List!13839)) )
))
(declare-fun arrayNoDuplicates!0 (array!41641 (_ BitVec 32) List!13839) Bool)

(assert (=> b!746894 (= res!503255 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13836))))

(declare-fun res!503264 () Bool)

(declare-fun e!417181 () Bool)

(assert (=> start!65598 (=> (not res!503264) (not e!417181))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65598 (= res!503264 (validMask!0 mask!3328))))

(assert (=> start!65598 e!417181))

(assert (=> start!65598 true))

(declare-fun array_inv!15789 (array!41641) Bool)

(assert (=> start!65598 (array_inv!15789 a!3186)))

(declare-fun b!746895 () Bool)

(declare-fun res!503258 () Bool)

(assert (=> b!746895 (=> (not res!503258) (not e!417180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41641 (_ BitVec 32)) Bool)

(assert (=> b!746895 (= res!503258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7486 0))(
  ( (MissingZero!7486 (index!32312 (_ BitVec 32))) (Found!7486 (index!32313 (_ BitVec 32))) (Intermediate!7486 (undefined!8298 Bool) (index!32314 (_ BitVec 32)) (x!63424 (_ BitVec 32))) (Undefined!7486) (MissingVacant!7486 (index!32315 (_ BitVec 32))) )
))
(declare-fun lt!331878 () SeekEntryResult!7486)

(declare-fun e!417179 () Bool)

(declare-fun b!746896 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41641 (_ BitVec 32)) SeekEntryResult!7486)

(assert (=> b!746896 (= e!417179 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19930 a!3186) j!159) a!3186 mask!3328) lt!331878))))

(declare-fun b!746897 () Bool)

(declare-fun res!503265 () Bool)

(assert (=> b!746897 (=> (not res!503265) (not e!417181))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746897 (= res!503265 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746898 () Bool)

(declare-fun res!503263 () Bool)

(declare-fun e!417182 () Bool)

(assert (=> b!746898 (=> (not res!503263) (not e!417182))))

(declare-fun e!417176 () Bool)

(assert (=> b!746898 (= res!503263 e!417176)))

(declare-fun c!82205 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!746898 (= c!82205 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746899 () Bool)

(declare-fun res!503253 () Bool)

(assert (=> b!746899 (=> (not res!503253) (not e!417181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746899 (= res!503253 (validKeyInArray!0 k0!2102))))

(declare-fun b!746900 () Bool)

(assert (=> b!746900 (= e!417181 e!417180)))

(declare-fun res!503262 () Bool)

(assert (=> b!746900 (=> (not res!503262) (not e!417180))))

(declare-fun lt!331873 () SeekEntryResult!7486)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746900 (= res!503262 (or (= lt!331873 (MissingZero!7486 i!1173)) (= lt!331873 (MissingVacant!7486 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41641 (_ BitVec 32)) SeekEntryResult!7486)

(assert (=> b!746900 (= lt!331873 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746901 () Bool)

(declare-fun res!503256 () Bool)

(assert (=> b!746901 (=> (not res!503256) (not e!417182))))

(assert (=> b!746901 (= res!503256 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19930 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746902 () Bool)

(declare-fun res!503260 () Bool)

(assert (=> b!746902 (=> (not res!503260) (not e!417181))))

(assert (=> b!746902 (= res!503260 (validKeyInArray!0 (select (arr!19930 a!3186) j!159)))))

(declare-fun b!746903 () Bool)

(declare-fun e!417175 () Bool)

(declare-fun e!417177 () Bool)

(assert (=> b!746903 (= e!417175 (not e!417177))))

(declare-fun res!503257 () Bool)

(assert (=> b!746903 (=> res!503257 e!417177)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331870 () SeekEntryResult!7486)

(get-info :version)

(assert (=> b!746903 (= res!503257 (or (not ((_ is Intermediate!7486) lt!331870)) (bvslt x!1131 (x!63424 lt!331870)) (not (= x!1131 (x!63424 lt!331870))) (not (= index!1321 (index!32314 lt!331870)))))))

(assert (=> b!746903 e!417179))

(declare-fun res!503252 () Bool)

(assert (=> b!746903 (=> (not res!503252) (not e!417179))))

(declare-fun lt!331871 () SeekEntryResult!7486)

(assert (=> b!746903 (= res!503252 (= lt!331871 lt!331878))))

(assert (=> b!746903 (= lt!331878 (Found!7486 j!159))))

(assert (=> b!746903 (= lt!331871 (seekEntryOrOpen!0 (select (arr!19930 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746903 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25531 0))(
  ( (Unit!25532) )
))
(declare-fun lt!331876 () Unit!25531)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25531)

(assert (=> b!746903 (= lt!331876 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746904 () Bool)

(assert (=> b!746904 (= e!417182 e!417175)))

(declare-fun res!503251 () Bool)

(assert (=> b!746904 (=> (not res!503251) (not e!417175))))

(declare-fun lt!331872 () SeekEntryResult!7486)

(assert (=> b!746904 (= res!503251 (= lt!331872 lt!331870))))

(declare-fun lt!331869 () array!41641)

(declare-fun lt!331874 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41641 (_ BitVec 32)) SeekEntryResult!7486)

(assert (=> b!746904 (= lt!331870 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331874 lt!331869 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746904 (= lt!331872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331874 mask!3328) lt!331874 lt!331869 mask!3328))))

(assert (=> b!746904 (= lt!331874 (select (store (arr!19930 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746904 (= lt!331869 (array!41642 (store (arr!19930 a!3186) i!1173 k0!2102) (size!20350 a!3186)))))

(declare-fun b!746905 () Bool)

(declare-fun e!417178 () Bool)

(assert (=> b!746905 (= e!417178 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!331877 () SeekEntryResult!7486)

(assert (=> b!746905 (= lt!331871 lt!331877)))

(declare-fun b!746906 () Bool)

(declare-fun res!503259 () Bool)

(assert (=> b!746906 (=> (not res!503259) (not e!417181))))

(assert (=> b!746906 (= res!503259 (and (= (size!20350 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20350 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20350 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746907 () Bool)

(declare-fun res!503266 () Bool)

(assert (=> b!746907 (=> (not res!503266) (not e!417180))))

(assert (=> b!746907 (= res!503266 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20350 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20350 a!3186))))))

(declare-fun b!746908 () Bool)

(assert (=> b!746908 (= e!417180 e!417182)))

(declare-fun res!503254 () Bool)

(assert (=> b!746908 (=> (not res!503254) (not e!417182))))

(declare-fun lt!331875 () SeekEntryResult!7486)

(assert (=> b!746908 (= res!503254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19930 a!3186) j!159) mask!3328) (select (arr!19930 a!3186) j!159) a!3186 mask!3328) lt!331875))))

(assert (=> b!746908 (= lt!331875 (Intermediate!7486 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746909 () Bool)

(assert (=> b!746909 (= e!417176 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19930 a!3186) j!159) a!3186 mask!3328) lt!331875))))

(declare-fun b!746910 () Bool)

(assert (=> b!746910 (= e!417177 e!417178)))

(declare-fun res!503261 () Bool)

(assert (=> b!746910 (=> res!503261 e!417178)))

(assert (=> b!746910 (= res!503261 (or (not (= lt!331877 lt!331878)) (= (select (store (arr!19930 a!3186) i!1173 k0!2102) index!1321) lt!331874) (not (= (select (store (arr!19930 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746910 (= lt!331877 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19930 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746911 () Bool)

(assert (=> b!746911 (= e!417176 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19930 a!3186) j!159) a!3186 mask!3328) (Found!7486 j!159)))))

(assert (= (and start!65598 res!503264) b!746906))

(assert (= (and b!746906 res!503259) b!746902))

(assert (= (and b!746902 res!503260) b!746899))

(assert (= (and b!746899 res!503253) b!746897))

(assert (= (and b!746897 res!503265) b!746900))

(assert (= (and b!746900 res!503262) b!746895))

(assert (= (and b!746895 res!503258) b!746894))

(assert (= (and b!746894 res!503255) b!746907))

(assert (= (and b!746907 res!503266) b!746908))

(assert (= (and b!746908 res!503254) b!746901))

(assert (= (and b!746901 res!503256) b!746898))

(assert (= (and b!746898 c!82205) b!746909))

(assert (= (and b!746898 (not c!82205)) b!746911))

(assert (= (and b!746898 res!503263) b!746904))

(assert (= (and b!746904 res!503251) b!746903))

(assert (= (and b!746903 res!503252) b!746896))

(assert (= (and b!746903 (not res!503257)) b!746910))

(assert (= (and b!746910 (not res!503261)) b!746905))

(declare-fun m!697599 () Bool)

(assert (=> b!746899 m!697599))

(declare-fun m!697601 () Bool)

(assert (=> b!746897 m!697601))

(declare-fun m!697603 () Bool)

(assert (=> b!746896 m!697603))

(assert (=> b!746896 m!697603))

(declare-fun m!697605 () Bool)

(assert (=> b!746896 m!697605))

(declare-fun m!697607 () Bool)

(assert (=> b!746901 m!697607))

(declare-fun m!697609 () Bool)

(assert (=> start!65598 m!697609))

(declare-fun m!697611 () Bool)

(assert (=> start!65598 m!697611))

(declare-fun m!697613 () Bool)

(assert (=> b!746895 m!697613))

(assert (=> b!746903 m!697603))

(assert (=> b!746903 m!697603))

(declare-fun m!697615 () Bool)

(assert (=> b!746903 m!697615))

(declare-fun m!697617 () Bool)

(assert (=> b!746903 m!697617))

(declare-fun m!697619 () Bool)

(assert (=> b!746903 m!697619))

(declare-fun m!697621 () Bool)

(assert (=> b!746910 m!697621))

(declare-fun m!697623 () Bool)

(assert (=> b!746910 m!697623))

(assert (=> b!746910 m!697603))

(assert (=> b!746910 m!697603))

(declare-fun m!697625 () Bool)

(assert (=> b!746910 m!697625))

(declare-fun m!697627 () Bool)

(assert (=> b!746894 m!697627))

(assert (=> b!746902 m!697603))

(assert (=> b!746902 m!697603))

(declare-fun m!697629 () Bool)

(assert (=> b!746902 m!697629))

(assert (=> b!746909 m!697603))

(assert (=> b!746909 m!697603))

(declare-fun m!697631 () Bool)

(assert (=> b!746909 m!697631))

(declare-fun m!697633 () Bool)

(assert (=> b!746900 m!697633))

(declare-fun m!697635 () Bool)

(assert (=> b!746904 m!697635))

(assert (=> b!746904 m!697621))

(declare-fun m!697637 () Bool)

(assert (=> b!746904 m!697637))

(declare-fun m!697639 () Bool)

(assert (=> b!746904 m!697639))

(assert (=> b!746904 m!697637))

(declare-fun m!697641 () Bool)

(assert (=> b!746904 m!697641))

(assert (=> b!746908 m!697603))

(assert (=> b!746908 m!697603))

(declare-fun m!697643 () Bool)

(assert (=> b!746908 m!697643))

(assert (=> b!746908 m!697643))

(assert (=> b!746908 m!697603))

(declare-fun m!697645 () Bool)

(assert (=> b!746908 m!697645))

(assert (=> b!746911 m!697603))

(assert (=> b!746911 m!697603))

(assert (=> b!746911 m!697625))

(check-sat (not start!65598) (not b!746900) (not b!746908) (not b!746904) (not b!746910) (not b!746894) (not b!746911) (not b!746895) (not b!746896) (not b!746903) (not b!746897) (not b!746899) (not b!746902) (not b!746909))
(check-sat)
