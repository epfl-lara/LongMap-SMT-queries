; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66784 () Bool)

(assert start!66784)

(declare-fun b!769916 () Bool)

(declare-fun e!428695 () Bool)

(declare-fun e!428690 () Bool)

(assert (=> b!769916 (= e!428695 e!428690)))

(declare-fun res!520743 () Bool)

(assert (=> b!769916 (=> (not res!520743) (not e!428690))))

(declare-datatypes ((array!42346 0))(
  ( (array!42347 (arr!20273 (Array (_ BitVec 32) (_ BitVec 64))) (size!20694 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42346)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7873 0))(
  ( (MissingZero!7873 (index!33860 (_ BitVec 32))) (Found!7873 (index!33861 (_ BitVec 32))) (Intermediate!7873 (undefined!8685 Bool) (index!33862 (_ BitVec 32)) (x!64788 (_ BitVec 32))) (Undefined!7873) (MissingVacant!7873 (index!33863 (_ BitVec 32))) )
))
(declare-fun lt!342615 () SeekEntryResult!7873)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42346 (_ BitVec 32)) SeekEntryResult!7873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769916 (= res!520743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20273 a!3186) j!159) mask!3328) (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342615))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769916 (= lt!342615 (Intermediate!7873 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769917 () Bool)

(declare-fun e!428697 () Bool)

(declare-fun e!428698 () Bool)

(assert (=> b!769917 (= e!428697 (not e!428698))))

(declare-fun res!520748 () Bool)

(assert (=> b!769917 (=> res!520748 e!428698)))

(declare-fun lt!342609 () SeekEntryResult!7873)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!769917 (= res!520748 (or (not (is-Intermediate!7873 lt!342609)) (bvsge x!1131 (x!64788 lt!342609))))))

(declare-fun e!428691 () Bool)

(assert (=> b!769917 e!428691))

(declare-fun res!520734 () Bool)

(assert (=> b!769917 (=> (not res!520734) (not e!428691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42346 (_ BitVec 32)) Bool)

(assert (=> b!769917 (= res!520734 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26506 0))(
  ( (Unit!26507) )
))
(declare-fun lt!342614 () Unit!26506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26506)

(assert (=> b!769917 (= lt!342614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769918 () Bool)

(assert (=> b!769918 (= e!428690 e!428697)))

(declare-fun res!520738 () Bool)

(assert (=> b!769918 (=> (not res!520738) (not e!428697))))

(declare-fun lt!342613 () SeekEntryResult!7873)

(assert (=> b!769918 (= res!520738 (= lt!342613 lt!342609))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342616 () (_ BitVec 64))

(declare-fun lt!342612 () array!42346)

(assert (=> b!769918 (= lt!342609 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342616 lt!342612 mask!3328))))

(assert (=> b!769918 (= lt!342613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342616 mask!3328) lt!342616 lt!342612 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!769918 (= lt!342616 (select (store (arr!20273 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769918 (= lt!342612 (array!42347 (store (arr!20273 a!3186) i!1173 k!2102) (size!20694 a!3186)))))

(declare-fun b!769919 () Bool)

(declare-fun res!520736 () Bool)

(declare-fun e!428693 () Bool)

(assert (=> b!769919 (=> (not res!520736) (not e!428693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769919 (= res!520736 (validKeyInArray!0 k!2102))))

(declare-fun b!769920 () Bool)

(declare-fun res!520746 () Bool)

(assert (=> b!769920 (=> (not res!520746) (not e!428690))))

(assert (=> b!769920 (= res!520746 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20273 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769921 () Bool)

(declare-fun e!428699 () Bool)

(assert (=> b!769921 (= e!428699 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342615))))

(declare-fun b!769922 () Bool)

(declare-fun res!520740 () Bool)

(assert (=> b!769922 (=> (not res!520740) (not e!428695))))

(declare-datatypes ((List!14275 0))(
  ( (Nil!14272) (Cons!14271 (h!15370 (_ BitVec 64)) (t!20590 List!14275)) )
))
(declare-fun arrayNoDuplicates!0 (array!42346 (_ BitVec 32) List!14275) Bool)

(assert (=> b!769922 (= res!520740 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14272))))

(declare-fun b!769923 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42346 (_ BitVec 32)) SeekEntryResult!7873)

(assert (=> b!769923 (= e!428699 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) (Found!7873 j!159)))))

(declare-fun b!769924 () Bool)

(declare-fun e!428696 () Unit!26506)

(declare-fun Unit!26508 () Unit!26506)

(assert (=> b!769924 (= e!428696 Unit!26508)))

(declare-fun lt!342607 () SeekEntryResult!7873)

(assert (=> b!769924 (= lt!342607 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20273 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342608 () (_ BitVec 32))

(assert (=> b!769924 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342608 resIntermediateIndex!5 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) (Found!7873 j!159))))

(declare-fun b!769925 () Bool)

(assert (=> b!769925 (= e!428693 e!428695)))

(declare-fun res!520742 () Bool)

(assert (=> b!769925 (=> (not res!520742) (not e!428695))))

(declare-fun lt!342610 () SeekEntryResult!7873)

(assert (=> b!769925 (= res!520742 (or (= lt!342610 (MissingZero!7873 i!1173)) (= lt!342610 (MissingVacant!7873 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42346 (_ BitVec 32)) SeekEntryResult!7873)

(assert (=> b!769925 (= lt!342610 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769926 () Bool)

(assert (=> b!769926 (= e!428698 true)))

(declare-fun lt!342617 () Unit!26506)

(assert (=> b!769926 (= lt!342617 e!428696)))

(declare-fun c!84988 () Bool)

(assert (=> b!769926 (= c!84988 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769926 (= lt!342608 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769927 () Bool)

(declare-fun res!520741 () Bool)

(assert (=> b!769927 (=> (not res!520741) (not e!428693))))

(assert (=> b!769927 (= res!520741 (validKeyInArray!0 (select (arr!20273 a!3186) j!159)))))

(declare-fun b!769928 () Bool)

(declare-fun Unit!26509 () Unit!26506)

(assert (=> b!769928 (= e!428696 Unit!26509)))

(assert (=> b!769928 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342608 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342615)))

(declare-fun b!769929 () Bool)

(declare-fun e!428692 () Bool)

(assert (=> b!769929 (= e!428691 e!428692)))

(declare-fun res!520739 () Bool)

(assert (=> b!769929 (=> (not res!520739) (not e!428692))))

(declare-fun lt!342611 () SeekEntryResult!7873)

(assert (=> b!769929 (= res!520739 (= (seekEntryOrOpen!0 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342611))))

(assert (=> b!769929 (= lt!342611 (Found!7873 j!159))))

(declare-fun b!769930 () Bool)

(declare-fun res!520744 () Bool)

(assert (=> b!769930 (=> (not res!520744) (not e!428693))))

(declare-fun arrayContainsKey!0 (array!42346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769930 (= res!520744 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!520733 () Bool)

(assert (=> start!66784 (=> (not res!520733) (not e!428693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66784 (= res!520733 (validMask!0 mask!3328))))

(assert (=> start!66784 e!428693))

(assert (=> start!66784 true))

(declare-fun array_inv!16069 (array!42346) Bool)

(assert (=> start!66784 (array_inv!16069 a!3186)))

(declare-fun b!769931 () Bool)

(declare-fun res!520735 () Bool)

(assert (=> b!769931 (=> (not res!520735) (not e!428690))))

(assert (=> b!769931 (= res!520735 e!428699)))

(declare-fun c!84987 () Bool)

(assert (=> b!769931 (= c!84987 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769932 () Bool)

(declare-fun res!520737 () Bool)

(assert (=> b!769932 (=> (not res!520737) (not e!428695))))

(assert (=> b!769932 (= res!520737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769933 () Bool)

(declare-fun res!520747 () Bool)

(assert (=> b!769933 (=> (not res!520747) (not e!428693))))

(assert (=> b!769933 (= res!520747 (and (= (size!20694 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20694 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20694 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769934 () Bool)

(assert (=> b!769934 (= e!428692 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20273 a!3186) j!159) a!3186 mask!3328) lt!342611))))

(declare-fun b!769935 () Bool)

(declare-fun res!520745 () Bool)

(assert (=> b!769935 (=> (not res!520745) (not e!428695))))

(assert (=> b!769935 (= res!520745 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20694 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20694 a!3186))))))

(assert (= (and start!66784 res!520733) b!769933))

(assert (= (and b!769933 res!520747) b!769927))

(assert (= (and b!769927 res!520741) b!769919))

(assert (= (and b!769919 res!520736) b!769930))

(assert (= (and b!769930 res!520744) b!769925))

(assert (= (and b!769925 res!520742) b!769932))

(assert (= (and b!769932 res!520737) b!769922))

(assert (= (and b!769922 res!520740) b!769935))

(assert (= (and b!769935 res!520745) b!769916))

(assert (= (and b!769916 res!520743) b!769920))

(assert (= (and b!769920 res!520746) b!769931))

(assert (= (and b!769931 c!84987) b!769921))

(assert (= (and b!769931 (not c!84987)) b!769923))

(assert (= (and b!769931 res!520735) b!769918))

(assert (= (and b!769918 res!520738) b!769917))

(assert (= (and b!769917 res!520734) b!769929))

(assert (= (and b!769929 res!520739) b!769934))

(assert (= (and b!769917 (not res!520748)) b!769926))

(assert (= (and b!769926 c!84988) b!769928))

(assert (= (and b!769926 (not c!84988)) b!769924))

(declare-fun m!715267 () Bool)

(assert (=> b!769920 m!715267))

(declare-fun m!715269 () Bool)

(assert (=> b!769930 m!715269))

(declare-fun m!715271 () Bool)

(assert (=> b!769916 m!715271))

(assert (=> b!769916 m!715271))

(declare-fun m!715273 () Bool)

(assert (=> b!769916 m!715273))

(assert (=> b!769916 m!715273))

(assert (=> b!769916 m!715271))

(declare-fun m!715275 () Bool)

(assert (=> b!769916 m!715275))

(assert (=> b!769928 m!715271))

(assert (=> b!769928 m!715271))

(declare-fun m!715277 () Bool)

(assert (=> b!769928 m!715277))

(assert (=> b!769927 m!715271))

(assert (=> b!769927 m!715271))

(declare-fun m!715279 () Bool)

(assert (=> b!769927 m!715279))

(declare-fun m!715281 () Bool)

(assert (=> b!769917 m!715281))

(declare-fun m!715283 () Bool)

(assert (=> b!769917 m!715283))

(declare-fun m!715285 () Bool)

(assert (=> b!769919 m!715285))

(assert (=> b!769934 m!715271))

(assert (=> b!769934 m!715271))

(declare-fun m!715287 () Bool)

(assert (=> b!769934 m!715287))

(assert (=> b!769929 m!715271))

(assert (=> b!769929 m!715271))

(declare-fun m!715289 () Bool)

(assert (=> b!769929 m!715289))

(declare-fun m!715291 () Bool)

(assert (=> start!66784 m!715291))

(declare-fun m!715293 () Bool)

(assert (=> start!66784 m!715293))

(declare-fun m!715295 () Bool)

(assert (=> b!769932 m!715295))

(assert (=> b!769924 m!715271))

(assert (=> b!769924 m!715271))

(declare-fun m!715297 () Bool)

(assert (=> b!769924 m!715297))

(assert (=> b!769924 m!715271))

(declare-fun m!715299 () Bool)

(assert (=> b!769924 m!715299))

(declare-fun m!715301 () Bool)

(assert (=> b!769926 m!715301))

(assert (=> b!769923 m!715271))

(assert (=> b!769923 m!715271))

(assert (=> b!769923 m!715297))

(declare-fun m!715303 () Bool)

(assert (=> b!769918 m!715303))

(declare-fun m!715305 () Bool)

(assert (=> b!769918 m!715305))

(declare-fun m!715307 () Bool)

(assert (=> b!769918 m!715307))

(declare-fun m!715309 () Bool)

(assert (=> b!769918 m!715309))

(declare-fun m!715311 () Bool)

(assert (=> b!769918 m!715311))

(assert (=> b!769918 m!715307))

(declare-fun m!715313 () Bool)

(assert (=> b!769925 m!715313))

(declare-fun m!715315 () Bool)

(assert (=> b!769922 m!715315))

(assert (=> b!769921 m!715271))

(assert (=> b!769921 m!715271))

(declare-fun m!715317 () Bool)

(assert (=> b!769921 m!715317))

(push 1)

