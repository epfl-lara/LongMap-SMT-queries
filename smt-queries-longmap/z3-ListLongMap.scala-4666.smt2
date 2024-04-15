; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64892 () Bool)

(assert start!64892)

(declare-fun b!732154 () Bool)

(declare-fun res!491887 () Bool)

(declare-fun e!409687 () Bool)

(assert (=> b!732154 (=> (not res!491887) (not e!409687))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41220 0))(
  ( (array!41221 (arr!19727 (Array (_ BitVec 32) (_ BitVec 64))) (size!20148 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41220)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!732154 (= res!491887 (and (= (size!20148 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20148 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20148 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732155 () Bool)

(declare-fun res!491891 () Bool)

(declare-fun e!409692 () Bool)

(assert (=> b!732155 (=> (not res!491891) (not e!409692))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!732155 (= res!491891 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19727 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!409694 () Bool)

(declare-fun b!732157 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7324 0))(
  ( (MissingZero!7324 (index!31664 (_ BitVec 32))) (Found!7324 (index!31665 (_ BitVec 32))) (Intermediate!7324 (undefined!8136 Bool) (index!31666 (_ BitVec 32)) (x!62669 (_ BitVec 32))) (Undefined!7324) (MissingVacant!7324 (index!31667 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41220 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!732157 (= e!409694 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19727 a!3186) j!159) a!3186 mask!3328) (Found!7324 j!159)))))

(declare-fun b!732158 () Bool)

(declare-fun res!491901 () Bool)

(assert (=> b!732158 (=> (not res!491901) (not e!409692))))

(assert (=> b!732158 (= res!491901 e!409694)))

(declare-fun c!80511 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732158 (= c!80511 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732159 () Bool)

(declare-fun e!409696 () Bool)

(assert (=> b!732159 (= e!409687 e!409696)))

(declare-fun res!491890 () Bool)

(assert (=> b!732159 (=> (not res!491890) (not e!409696))))

(declare-fun lt!324316 () SeekEntryResult!7324)

(assert (=> b!732159 (= res!491890 (or (= lt!324316 (MissingZero!7324 i!1173)) (= lt!324316 (MissingVacant!7324 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41220 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!732159 (= lt!324316 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!324319 () SeekEntryResult!7324)

(declare-fun e!409691 () Bool)

(declare-fun b!732160 () Bool)

(assert (=> b!732160 (= e!409691 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19727 a!3186) j!159) a!3186 mask!3328) lt!324319))))

(declare-fun b!732161 () Bool)

(declare-fun e!409689 () Bool)

(assert (=> b!732161 (= e!409689 e!409691)))

(declare-fun res!491897 () Bool)

(assert (=> b!732161 (=> (not res!491897) (not e!409691))))

(assert (=> b!732161 (= res!491897 (= (seekEntryOrOpen!0 (select (arr!19727 a!3186) j!159) a!3186 mask!3328) lt!324319))))

(assert (=> b!732161 (= lt!324319 (Found!7324 j!159))))

(declare-fun b!732162 () Bool)

(declare-fun res!491889 () Bool)

(assert (=> b!732162 (=> (not res!491889) (not e!409696))))

(assert (=> b!732162 (= res!491889 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20148 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20148 a!3186))))))

(declare-fun b!732163 () Bool)

(declare-fun res!491899 () Bool)

(assert (=> b!732163 (=> (not res!491899) (not e!409696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41220 (_ BitVec 32)) Bool)

(assert (=> b!732163 (= res!491899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732164 () Bool)

(declare-fun e!409688 () Bool)

(declare-fun e!409695 () Bool)

(assert (=> b!732164 (= e!409688 e!409695)))

(declare-fun res!491894 () Bool)

(assert (=> b!732164 (=> res!491894 e!409695)))

(assert (=> b!732164 (= res!491894 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324317 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732164 (= lt!324317 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!324315 () SeekEntryResult!7324)

(declare-fun b!732165 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41220 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!732165 (= e!409694 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19727 a!3186) j!159) a!3186 mask!3328) lt!324315))))

(declare-fun b!732166 () Bool)

(declare-fun e!409693 () Bool)

(assert (=> b!732166 (= e!409693 (not e!409688))))

(declare-fun res!491904 () Bool)

(assert (=> b!732166 (=> res!491904 e!409688)))

(declare-fun lt!324322 () SeekEntryResult!7324)

(get-info :version)

(assert (=> b!732166 (= res!491904 (or (not ((_ is Intermediate!7324) lt!324322)) (bvsge x!1131 (x!62669 lt!324322))))))

(assert (=> b!732166 e!409689))

(declare-fun res!491900 () Bool)

(assert (=> b!732166 (=> (not res!491900) (not e!409689))))

(assert (=> b!732166 (= res!491900 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24938 0))(
  ( (Unit!24939) )
))
(declare-fun lt!324321 () Unit!24938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24938)

(assert (=> b!732166 (= lt!324321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732167 () Bool)

(declare-fun res!491902 () Bool)

(assert (=> b!732167 (=> (not res!491902) (not e!409696))))

(declare-datatypes ((List!13768 0))(
  ( (Nil!13765) (Cons!13764 (h!14830 (_ BitVec 64)) (t!20074 List!13768)) )
))
(declare-fun arrayNoDuplicates!0 (array!41220 (_ BitVec 32) List!13768) Bool)

(assert (=> b!732167 (= res!491902 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13765))))

(declare-fun b!732168 () Bool)

(assert (=> b!732168 (= e!409695 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324317 #b00000000000000000000000000000000) (bvsge lt!324317 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!732169 () Bool)

(declare-fun res!491896 () Bool)

(assert (=> b!732169 (=> (not res!491896) (not e!409687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732169 (= res!491896 (validKeyInArray!0 k0!2102))))

(declare-fun b!732170 () Bool)

(declare-fun res!491893 () Bool)

(assert (=> b!732170 (=> (not res!491893) (not e!409687))))

(assert (=> b!732170 (= res!491893 (validKeyInArray!0 (select (arr!19727 a!3186) j!159)))))

(declare-fun b!732156 () Bool)

(declare-fun res!491898 () Bool)

(assert (=> b!732156 (=> res!491898 e!409695)))

(assert (=> b!732156 (= res!491898 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19727 a!3186) j!159) a!3186 mask!3328) (Found!7324 j!159))))))

(declare-fun res!491895 () Bool)

(assert (=> start!64892 (=> (not res!491895) (not e!409687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64892 (= res!491895 (validMask!0 mask!3328))))

(assert (=> start!64892 e!409687))

(assert (=> start!64892 true))

(declare-fun array_inv!15610 (array!41220) Bool)

(assert (=> start!64892 (array_inv!15610 a!3186)))

(declare-fun b!732171 () Bool)

(assert (=> b!732171 (= e!409692 e!409693)))

(declare-fun res!491903 () Bool)

(assert (=> b!732171 (=> (not res!491903) (not e!409693))))

(declare-fun lt!324320 () SeekEntryResult!7324)

(assert (=> b!732171 (= res!491903 (= lt!324320 lt!324322))))

(declare-fun lt!324318 () (_ BitVec 64))

(declare-fun lt!324323 () array!41220)

(assert (=> b!732171 (= lt!324322 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324318 lt!324323 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732171 (= lt!324320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324318 mask!3328) lt!324318 lt!324323 mask!3328))))

(assert (=> b!732171 (= lt!324318 (select (store (arr!19727 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732171 (= lt!324323 (array!41221 (store (arr!19727 a!3186) i!1173 k0!2102) (size!20148 a!3186)))))

(declare-fun b!732172 () Bool)

(declare-fun res!491892 () Bool)

(assert (=> b!732172 (=> (not res!491892) (not e!409687))))

(declare-fun arrayContainsKey!0 (array!41220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732172 (= res!491892 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732173 () Bool)

(assert (=> b!732173 (= e!409696 e!409692)))

(declare-fun res!491888 () Bool)

(assert (=> b!732173 (=> (not res!491888) (not e!409692))))

(assert (=> b!732173 (= res!491888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19727 a!3186) j!159) mask!3328) (select (arr!19727 a!3186) j!159) a!3186 mask!3328) lt!324315))))

(assert (=> b!732173 (= lt!324315 (Intermediate!7324 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64892 res!491895) b!732154))

(assert (= (and b!732154 res!491887) b!732170))

(assert (= (and b!732170 res!491893) b!732169))

(assert (= (and b!732169 res!491896) b!732172))

(assert (= (and b!732172 res!491892) b!732159))

(assert (= (and b!732159 res!491890) b!732163))

(assert (= (and b!732163 res!491899) b!732167))

(assert (= (and b!732167 res!491902) b!732162))

(assert (= (and b!732162 res!491889) b!732173))

(assert (= (and b!732173 res!491888) b!732155))

(assert (= (and b!732155 res!491891) b!732158))

(assert (= (and b!732158 c!80511) b!732165))

(assert (= (and b!732158 (not c!80511)) b!732157))

(assert (= (and b!732158 res!491901) b!732171))

(assert (= (and b!732171 res!491903) b!732166))

(assert (= (and b!732166 res!491900) b!732161))

(assert (= (and b!732161 res!491897) b!732160))

(assert (= (and b!732166 (not res!491904)) b!732164))

(assert (= (and b!732164 (not res!491894)) b!732156))

(assert (= (and b!732156 (not res!491898)) b!732168))

(declare-fun m!684713 () Bool)

(assert (=> b!732159 m!684713))

(declare-fun m!684715 () Bool)

(assert (=> b!732166 m!684715))

(declare-fun m!684717 () Bool)

(assert (=> b!732166 m!684717))

(declare-fun m!684719 () Bool)

(assert (=> b!732163 m!684719))

(declare-fun m!684721 () Bool)

(assert (=> start!64892 m!684721))

(declare-fun m!684723 () Bool)

(assert (=> start!64892 m!684723))

(declare-fun m!684725 () Bool)

(assert (=> b!732167 m!684725))

(declare-fun m!684727 () Bool)

(assert (=> b!732165 m!684727))

(assert (=> b!732165 m!684727))

(declare-fun m!684729 () Bool)

(assert (=> b!732165 m!684729))

(declare-fun m!684731 () Bool)

(assert (=> b!732155 m!684731))

(declare-fun m!684733 () Bool)

(assert (=> b!732172 m!684733))

(assert (=> b!732156 m!684727))

(assert (=> b!732156 m!684727))

(declare-fun m!684735 () Bool)

(assert (=> b!732156 m!684735))

(assert (=> b!732157 m!684727))

(assert (=> b!732157 m!684727))

(assert (=> b!732157 m!684735))

(assert (=> b!732161 m!684727))

(assert (=> b!732161 m!684727))

(declare-fun m!684737 () Bool)

(assert (=> b!732161 m!684737))

(declare-fun m!684739 () Bool)

(assert (=> b!732171 m!684739))

(declare-fun m!684741 () Bool)

(assert (=> b!732171 m!684741))

(declare-fun m!684743 () Bool)

(assert (=> b!732171 m!684743))

(declare-fun m!684745 () Bool)

(assert (=> b!732171 m!684745))

(assert (=> b!732171 m!684739))

(declare-fun m!684747 () Bool)

(assert (=> b!732171 m!684747))

(declare-fun m!684749 () Bool)

(assert (=> b!732164 m!684749))

(assert (=> b!732173 m!684727))

(assert (=> b!732173 m!684727))

(declare-fun m!684751 () Bool)

(assert (=> b!732173 m!684751))

(assert (=> b!732173 m!684751))

(assert (=> b!732173 m!684727))

(declare-fun m!684753 () Bool)

(assert (=> b!732173 m!684753))

(assert (=> b!732170 m!684727))

(assert (=> b!732170 m!684727))

(declare-fun m!684755 () Bool)

(assert (=> b!732170 m!684755))

(assert (=> b!732160 m!684727))

(assert (=> b!732160 m!684727))

(declare-fun m!684757 () Bool)

(assert (=> b!732160 m!684757))

(declare-fun m!684759 () Bool)

(assert (=> b!732169 m!684759))

(check-sat (not b!732156) (not b!732172) (not b!732167) (not b!732161) (not b!732159) (not b!732171) (not start!64892) (not b!732164) (not b!732165) (not b!732169) (not b!732163) (not b!732166) (not b!732160) (not b!732170) (not b!732173) (not b!732157))
(check-sat)
