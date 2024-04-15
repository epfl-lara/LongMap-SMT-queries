; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64658 () Bool)

(assert start!64658)

(declare-fun b!728814 () Bool)

(declare-fun e!407922 () Bool)

(declare-fun e!407923 () Bool)

(assert (=> b!728814 (= e!407922 e!407923)))

(declare-fun res!489411 () Bool)

(assert (=> b!728814 (=> (not res!489411) (not e!407923))))

(declare-datatypes ((SeekEntryResult!7279 0))(
  ( (MissingZero!7279 (index!31484 (_ BitVec 32))) (Found!7279 (index!31485 (_ BitVec 32))) (Intermediate!7279 (undefined!8091 Bool) (index!31486 (_ BitVec 32)) (x!62480 (_ BitVec 32))) (Undefined!7279) (MissingVacant!7279 (index!31487 (_ BitVec 32))) )
))
(declare-fun lt!322735 () SeekEntryResult!7279)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728814 (= res!489411 (or (= lt!322735 (MissingZero!7279 i!1173)) (= lt!322735 (MissingVacant!7279 i!1173))))))

(declare-datatypes ((array!41124 0))(
  ( (array!41125 (arr!19682 (Array (_ BitVec 32) (_ BitVec 64))) (size!20103 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41124)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41124 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!728814 (= lt!322735 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!322739 () SeekEntryResult!7279)

(declare-fun e!407929 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!728815 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41124 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!728815 (= e!407929 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19682 a!3186) j!159) a!3186 mask!3328) lt!322739))))

(declare-fun b!728816 () Bool)

(declare-fun res!489405 () Bool)

(assert (=> b!728816 (=> (not res!489405) (not e!407922))))

(assert (=> b!728816 (= res!489405 (and (= (size!20103 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20103 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20103 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!407926 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!322738 () SeekEntryResult!7279)

(declare-fun b!728817 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41124 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!728817 (= e!407926 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19682 a!3186) j!159) a!3186 mask!3328) lt!322738))))

(declare-fun b!728818 () Bool)

(assert (=> b!728818 (= e!407929 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19682 a!3186) j!159) a!3186 mask!3328) (Found!7279 j!159)))))

(declare-fun b!728819 () Bool)

(declare-fun e!407928 () Bool)

(assert (=> b!728819 (= e!407923 e!407928)))

(declare-fun res!489406 () Bool)

(assert (=> b!728819 (=> (not res!489406) (not e!407928))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728819 (= res!489406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19682 a!3186) j!159) mask!3328) (select (arr!19682 a!3186) j!159) a!3186 mask!3328) lt!322739))))

(assert (=> b!728819 (= lt!322739 (Intermediate!7279 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728820 () Bool)

(declare-fun res!489400 () Bool)

(assert (=> b!728820 (=> (not res!489400) (not e!407923))))

(declare-datatypes ((List!13723 0))(
  ( (Nil!13720) (Cons!13719 (h!14779 (_ BitVec 64)) (t!20029 List!13723)) )
))
(declare-fun arrayNoDuplicates!0 (array!41124 (_ BitVec 32) List!13723) Bool)

(assert (=> b!728820 (= res!489400 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13720))))

(declare-fun b!728821 () Bool)

(declare-fun res!489409 () Bool)

(assert (=> b!728821 (=> (not res!489409) (not e!407922))))

(declare-fun arrayContainsKey!0 (array!41124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728821 (= res!489409 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728822 () Bool)

(declare-fun res!489401 () Bool)

(assert (=> b!728822 (=> (not res!489401) (not e!407928))))

(assert (=> b!728822 (= res!489401 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19682 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728823 () Bool)

(declare-fun res!489402 () Bool)

(assert (=> b!728823 (=> (not res!489402) (not e!407922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728823 (= res!489402 (validKeyInArray!0 (select (arr!19682 a!3186) j!159)))))

(declare-fun b!728824 () Bool)

(declare-fun e!407921 () Bool)

(assert (=> b!728824 (= e!407921 e!407926)))

(declare-fun res!489403 () Bool)

(assert (=> b!728824 (=> (not res!489403) (not e!407926))))

(assert (=> b!728824 (= res!489403 (= (seekEntryOrOpen!0 (select (arr!19682 a!3186) j!159) a!3186 mask!3328) lt!322738))))

(assert (=> b!728824 (= lt!322738 (Found!7279 j!159))))

(declare-fun b!728825 () Bool)

(declare-fun res!489414 () Bool)

(assert (=> b!728825 (=> (not res!489414) (not e!407923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41124 (_ BitVec 32)) Bool)

(assert (=> b!728825 (= res!489414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728826 () Bool)

(declare-fun e!407924 () Bool)

(declare-fun e!407925 () Bool)

(assert (=> b!728826 (= e!407924 (not e!407925))))

(declare-fun res!489408 () Bool)

(assert (=> b!728826 (=> res!489408 e!407925)))

(declare-fun lt!322740 () SeekEntryResult!7279)

(get-info :version)

(assert (=> b!728826 (= res!489408 (or (not ((_ is Intermediate!7279) lt!322740)) (bvsge x!1131 (x!62480 lt!322740))))))

(assert (=> b!728826 e!407921))

(declare-fun res!489410 () Bool)

(assert (=> b!728826 (=> (not res!489410) (not e!407921))))

(assert (=> b!728826 (= res!489410 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24848 0))(
  ( (Unit!24849) )
))
(declare-fun lt!322742 () Unit!24848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24848)

(assert (=> b!728826 (= lt!322742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728827 () Bool)

(declare-fun res!489412 () Bool)

(assert (=> b!728827 (=> (not res!489412) (not e!407923))))

(assert (=> b!728827 (= res!489412 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20103 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20103 a!3186))))))

(declare-fun b!728828 () Bool)

(declare-fun res!489399 () Bool)

(assert (=> b!728828 (=> (not res!489399) (not e!407928))))

(assert (=> b!728828 (= res!489399 e!407929)))

(declare-fun c!80082 () Bool)

(assert (=> b!728828 (= c!80082 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728829 () Bool)

(declare-fun res!489407 () Bool)

(assert (=> b!728829 (=> (not res!489407) (not e!407922))))

(assert (=> b!728829 (= res!489407 (validKeyInArray!0 k0!2102))))

(declare-fun res!489404 () Bool)

(assert (=> start!64658 (=> (not res!489404) (not e!407922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64658 (= res!489404 (validMask!0 mask!3328))))

(assert (=> start!64658 e!407922))

(assert (=> start!64658 true))

(declare-fun array_inv!15565 (array!41124) Bool)

(assert (=> start!64658 (array_inv!15565 a!3186)))

(declare-fun b!728830 () Bool)

(assert (=> b!728830 (= e!407925 true)))

(declare-fun lt!322734 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728830 (= lt!322734 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728831 () Bool)

(assert (=> b!728831 (= e!407928 e!407924)))

(declare-fun res!489413 () Bool)

(assert (=> b!728831 (=> (not res!489413) (not e!407924))))

(declare-fun lt!322737 () SeekEntryResult!7279)

(assert (=> b!728831 (= res!489413 (= lt!322737 lt!322740))))

(declare-fun lt!322736 () (_ BitVec 64))

(declare-fun lt!322741 () array!41124)

(assert (=> b!728831 (= lt!322740 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322736 lt!322741 mask!3328))))

(assert (=> b!728831 (= lt!322737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322736 mask!3328) lt!322736 lt!322741 mask!3328))))

(assert (=> b!728831 (= lt!322736 (select (store (arr!19682 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728831 (= lt!322741 (array!41125 (store (arr!19682 a!3186) i!1173 k0!2102) (size!20103 a!3186)))))

(assert (= (and start!64658 res!489404) b!728816))

(assert (= (and b!728816 res!489405) b!728823))

(assert (= (and b!728823 res!489402) b!728829))

(assert (= (and b!728829 res!489407) b!728821))

(assert (= (and b!728821 res!489409) b!728814))

(assert (= (and b!728814 res!489411) b!728825))

(assert (= (and b!728825 res!489414) b!728820))

(assert (= (and b!728820 res!489400) b!728827))

(assert (= (and b!728827 res!489412) b!728819))

(assert (= (and b!728819 res!489406) b!728822))

(assert (= (and b!728822 res!489401) b!728828))

(assert (= (and b!728828 c!80082) b!728815))

(assert (= (and b!728828 (not c!80082)) b!728818))

(assert (= (and b!728828 res!489399) b!728831))

(assert (= (and b!728831 res!489413) b!728826))

(assert (= (and b!728826 res!489410) b!728824))

(assert (= (and b!728824 res!489403) b!728817))

(assert (= (and b!728826 (not res!489408)) b!728830))

(declare-fun m!681989 () Bool)

(assert (=> b!728821 m!681989))

(declare-fun m!681991 () Bool)

(assert (=> b!728820 m!681991))

(declare-fun m!681993 () Bool)

(assert (=> b!728825 m!681993))

(declare-fun m!681995 () Bool)

(assert (=> b!728814 m!681995))

(declare-fun m!681997 () Bool)

(assert (=> b!728824 m!681997))

(assert (=> b!728824 m!681997))

(declare-fun m!681999 () Bool)

(assert (=> b!728824 m!681999))

(declare-fun m!682001 () Bool)

(assert (=> b!728826 m!682001))

(declare-fun m!682003 () Bool)

(assert (=> b!728826 m!682003))

(assert (=> b!728823 m!681997))

(assert (=> b!728823 m!681997))

(declare-fun m!682005 () Bool)

(assert (=> b!728823 m!682005))

(assert (=> b!728815 m!681997))

(assert (=> b!728815 m!681997))

(declare-fun m!682007 () Bool)

(assert (=> b!728815 m!682007))

(declare-fun m!682009 () Bool)

(assert (=> start!64658 m!682009))

(declare-fun m!682011 () Bool)

(assert (=> start!64658 m!682011))

(declare-fun m!682013 () Bool)

(assert (=> b!728829 m!682013))

(assert (=> b!728817 m!681997))

(assert (=> b!728817 m!681997))

(declare-fun m!682015 () Bool)

(assert (=> b!728817 m!682015))

(declare-fun m!682017 () Bool)

(assert (=> b!728822 m!682017))

(declare-fun m!682019 () Bool)

(assert (=> b!728830 m!682019))

(assert (=> b!728819 m!681997))

(assert (=> b!728819 m!681997))

(declare-fun m!682021 () Bool)

(assert (=> b!728819 m!682021))

(assert (=> b!728819 m!682021))

(assert (=> b!728819 m!681997))

(declare-fun m!682023 () Bool)

(assert (=> b!728819 m!682023))

(declare-fun m!682025 () Bool)

(assert (=> b!728831 m!682025))

(declare-fun m!682027 () Bool)

(assert (=> b!728831 m!682027))

(declare-fun m!682029 () Bool)

(assert (=> b!728831 m!682029))

(declare-fun m!682031 () Bool)

(assert (=> b!728831 m!682031))

(declare-fun m!682033 () Bool)

(assert (=> b!728831 m!682033))

(assert (=> b!728831 m!682025))

(assert (=> b!728818 m!681997))

(assert (=> b!728818 m!681997))

(declare-fun m!682035 () Bool)

(assert (=> b!728818 m!682035))

(check-sat (not b!728823) (not b!728819) (not b!728830) (not b!728817) (not b!728814) (not b!728818) (not b!728829) (not b!728815) (not b!728826) (not b!728821) (not b!728825) (not b!728831) (not start!64658) (not b!728820) (not b!728824))
(check-sat)
