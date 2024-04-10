; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65498 () Bool)

(assert start!65498)

(declare-fun b!746905 () Bool)

(declare-fun e!417075 () Bool)

(declare-fun e!417083 () Bool)

(assert (=> b!746905 (= e!417075 e!417083)))

(declare-fun res!503624 () Bool)

(assert (=> b!746905 (=> (not res!503624) (not e!417083))))

(declare-datatypes ((SeekEntryResult!7549 0))(
  ( (MissingZero!7549 (index!32564 (_ BitVec 32))) (Found!7549 (index!32565 (_ BitVec 32))) (Intermediate!7549 (undefined!8361 Bool) (index!32566 (_ BitVec 32)) (x!63507 (_ BitVec 32))) (Undefined!7549) (MissingVacant!7549 (index!32567 (_ BitVec 32))) )
))
(declare-fun lt!331980 () SeekEntryResult!7549)

(declare-fun lt!331983 () SeekEntryResult!7549)

(assert (=> b!746905 (= res!503624 (= lt!331980 lt!331983))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!331985 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41671 0))(
  ( (array!41672 (arr!19949 (Array (_ BitVec 32) (_ BitVec 64))) (size!20370 (_ BitVec 32))) )
))
(declare-fun lt!331976 () array!41671)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41671 (_ BitVec 32)) SeekEntryResult!7549)

(assert (=> b!746905 (= lt!331983 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331985 lt!331976 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746905 (= lt!331980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331985 mask!3328) lt!331985 lt!331976 mask!3328))))

(declare-fun a!3186 () array!41671)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!746905 (= lt!331985 (select (store (arr!19949 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746905 (= lt!331976 (array!41672 (store (arr!19949 a!3186) i!1173 k!2102) (size!20370 a!3186)))))

(declare-fun e!417076 () Bool)

(declare-fun b!746906 () Bool)

(declare-fun lt!331979 () SeekEntryResult!7549)

(assert (=> b!746906 (= e!417076 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19949 a!3186) j!159) a!3186 mask!3328) lt!331979))))

(declare-fun b!746907 () Bool)

(declare-fun res!503631 () Bool)

(declare-fun e!417078 () Bool)

(assert (=> b!746907 (=> (not res!503631) (not e!417078))))

(assert (=> b!746907 (= res!503631 (and (= (size!20370 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20370 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20370 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746909 () Bool)

(declare-fun e!417077 () Bool)

(assert (=> b!746909 (= e!417077 e!417075)))

(declare-fun res!503623 () Bool)

(assert (=> b!746909 (=> (not res!503623) (not e!417075))))

(assert (=> b!746909 (= res!503623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19949 a!3186) j!159) mask!3328) (select (arr!19949 a!3186) j!159) a!3186 mask!3328) lt!331979))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746909 (= lt!331979 (Intermediate!7549 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746910 () Bool)

(declare-fun res!503626 () Bool)

(assert (=> b!746910 (=> (not res!503626) (not e!417077))))

(assert (=> b!746910 (= res!503626 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20370 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20370 a!3186))))))

(declare-fun lt!331977 () SeekEntryResult!7549)

(declare-fun b!746911 () Bool)

(declare-fun e!417081 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41671 (_ BitVec 32)) SeekEntryResult!7549)

(assert (=> b!746911 (= e!417081 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19949 a!3186) j!159) a!3186 mask!3328) lt!331977))))

(declare-fun b!746912 () Bool)

(declare-fun e!417082 () Bool)

(assert (=> b!746912 (= e!417083 (not e!417082))))

(declare-fun res!503628 () Bool)

(assert (=> b!746912 (=> res!503628 e!417082)))

(assert (=> b!746912 (= res!503628 (or (not (is-Intermediate!7549 lt!331983)) (bvslt x!1131 (x!63507 lt!331983)) (not (= x!1131 (x!63507 lt!331983))) (not (= index!1321 (index!32566 lt!331983)))))))

(assert (=> b!746912 e!417081))

(declare-fun res!503618 () Bool)

(assert (=> b!746912 (=> (not res!503618) (not e!417081))))

(declare-fun lt!331978 () SeekEntryResult!7549)

(assert (=> b!746912 (= res!503618 (= lt!331978 lt!331977))))

(assert (=> b!746912 (= lt!331977 (Found!7549 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41671 (_ BitVec 32)) SeekEntryResult!7549)

(assert (=> b!746912 (= lt!331978 (seekEntryOrOpen!0 (select (arr!19949 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41671 (_ BitVec 32)) Bool)

(assert (=> b!746912 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25578 0))(
  ( (Unit!25579) )
))
(declare-fun lt!331984 () Unit!25578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25578)

(assert (=> b!746912 (= lt!331984 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746913 () Bool)

(declare-fun res!503620 () Bool)

(assert (=> b!746913 (=> (not res!503620) (not e!417077))))

(declare-datatypes ((List!13951 0))(
  ( (Nil!13948) (Cons!13947 (h!15019 (_ BitVec 64)) (t!20266 List!13951)) )
))
(declare-fun arrayNoDuplicates!0 (array!41671 (_ BitVec 32) List!13951) Bool)

(assert (=> b!746913 (= res!503620 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13948))))

(declare-fun b!746914 () Bool)

(declare-fun res!503622 () Bool)

(assert (=> b!746914 (=> (not res!503622) (not e!417075))))

(assert (=> b!746914 (= res!503622 e!417076)))

(declare-fun c!82024 () Bool)

(assert (=> b!746914 (= c!82024 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746915 () Bool)

(declare-fun e!417080 () Bool)

(assert (=> b!746915 (= e!417080 true)))

(declare-fun lt!331981 () SeekEntryResult!7549)

(assert (=> b!746915 (= lt!331978 lt!331981)))

(declare-fun b!746916 () Bool)

(assert (=> b!746916 (= e!417078 e!417077)))

(declare-fun res!503632 () Bool)

(assert (=> b!746916 (=> (not res!503632) (not e!417077))))

(declare-fun lt!331982 () SeekEntryResult!7549)

(assert (=> b!746916 (= res!503632 (or (= lt!331982 (MissingZero!7549 i!1173)) (= lt!331982 (MissingVacant!7549 i!1173))))))

(assert (=> b!746916 (= lt!331982 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746917 () Bool)

(declare-fun res!503629 () Bool)

(assert (=> b!746917 (=> (not res!503629) (not e!417077))))

(assert (=> b!746917 (= res!503629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746918 () Bool)

(assert (=> b!746918 (= e!417082 e!417080)))

(declare-fun res!503630 () Bool)

(assert (=> b!746918 (=> res!503630 e!417080)))

(assert (=> b!746918 (= res!503630 (or (not (= lt!331981 lt!331977)) (= (select (store (arr!19949 a!3186) i!1173 k!2102) index!1321) lt!331985) (not (= (select (store (arr!19949 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746918 (= lt!331981 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19949 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746908 () Bool)

(declare-fun res!503621 () Bool)

(assert (=> b!746908 (=> (not res!503621) (not e!417078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746908 (= res!503621 (validKeyInArray!0 k!2102))))

(declare-fun res!503625 () Bool)

(assert (=> start!65498 (=> (not res!503625) (not e!417078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65498 (= res!503625 (validMask!0 mask!3328))))

(assert (=> start!65498 e!417078))

(assert (=> start!65498 true))

(declare-fun array_inv!15745 (array!41671) Bool)

(assert (=> start!65498 (array_inv!15745 a!3186)))

(declare-fun b!746919 () Bool)

(declare-fun res!503627 () Bool)

(assert (=> b!746919 (=> (not res!503627) (not e!417075))))

(assert (=> b!746919 (= res!503627 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19949 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746920 () Bool)

(declare-fun res!503619 () Bool)

(assert (=> b!746920 (=> (not res!503619) (not e!417078))))

(declare-fun arrayContainsKey!0 (array!41671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746920 (= res!503619 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746921 () Bool)

(assert (=> b!746921 (= e!417076 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19949 a!3186) j!159) a!3186 mask!3328) (Found!7549 j!159)))))

(declare-fun b!746922 () Bool)

(declare-fun res!503633 () Bool)

(assert (=> b!746922 (=> (not res!503633) (not e!417078))))

(assert (=> b!746922 (= res!503633 (validKeyInArray!0 (select (arr!19949 a!3186) j!159)))))

(assert (= (and start!65498 res!503625) b!746907))

(assert (= (and b!746907 res!503631) b!746922))

(assert (= (and b!746922 res!503633) b!746908))

(assert (= (and b!746908 res!503621) b!746920))

(assert (= (and b!746920 res!503619) b!746916))

(assert (= (and b!746916 res!503632) b!746917))

(assert (= (and b!746917 res!503629) b!746913))

(assert (= (and b!746913 res!503620) b!746910))

(assert (= (and b!746910 res!503626) b!746909))

(assert (= (and b!746909 res!503623) b!746919))

(assert (= (and b!746919 res!503627) b!746914))

(assert (= (and b!746914 c!82024) b!746906))

(assert (= (and b!746914 (not c!82024)) b!746921))

(assert (= (and b!746914 res!503622) b!746905))

(assert (= (and b!746905 res!503624) b!746912))

(assert (= (and b!746912 res!503618) b!746911))

(assert (= (and b!746912 (not res!503628)) b!746918))

(assert (= (and b!746918 (not res!503630)) b!746915))

(declare-fun m!697111 () Bool)

(assert (=> b!746916 m!697111))

(declare-fun m!697113 () Bool)

(assert (=> b!746911 m!697113))

(assert (=> b!746911 m!697113))

(declare-fun m!697115 () Bool)

(assert (=> b!746911 m!697115))

(declare-fun m!697117 () Bool)

(assert (=> b!746918 m!697117))

(declare-fun m!697119 () Bool)

(assert (=> b!746918 m!697119))

(assert (=> b!746918 m!697113))

(assert (=> b!746918 m!697113))

(declare-fun m!697121 () Bool)

(assert (=> b!746918 m!697121))

(declare-fun m!697123 () Bool)

(assert (=> b!746908 m!697123))

(declare-fun m!697125 () Bool)

(assert (=> b!746919 m!697125))

(declare-fun m!697127 () Bool)

(assert (=> start!65498 m!697127))

(declare-fun m!697129 () Bool)

(assert (=> start!65498 m!697129))

(assert (=> b!746922 m!697113))

(assert (=> b!746922 m!697113))

(declare-fun m!697131 () Bool)

(assert (=> b!746922 m!697131))

(assert (=> b!746921 m!697113))

(assert (=> b!746921 m!697113))

(assert (=> b!746921 m!697121))

(assert (=> b!746912 m!697113))

(assert (=> b!746912 m!697113))

(declare-fun m!697133 () Bool)

(assert (=> b!746912 m!697133))

(declare-fun m!697135 () Bool)

(assert (=> b!746912 m!697135))

(declare-fun m!697137 () Bool)

(assert (=> b!746912 m!697137))

(declare-fun m!697139 () Bool)

(assert (=> b!746920 m!697139))

(declare-fun m!697141 () Bool)

(assert (=> b!746913 m!697141))

(declare-fun m!697143 () Bool)

(assert (=> b!746905 m!697143))

(declare-fun m!697145 () Bool)

(assert (=> b!746905 m!697145))

(declare-fun m!697147 () Bool)

(assert (=> b!746905 m!697147))

(declare-fun m!697149 () Bool)

(assert (=> b!746905 m!697149))

(assert (=> b!746905 m!697145))

(assert (=> b!746905 m!697117))

(assert (=> b!746909 m!697113))

(assert (=> b!746909 m!697113))

(declare-fun m!697151 () Bool)

(assert (=> b!746909 m!697151))

(assert (=> b!746909 m!697151))

(assert (=> b!746909 m!697113))

(declare-fun m!697153 () Bool)

(assert (=> b!746909 m!697153))

(assert (=> b!746906 m!697113))

(assert (=> b!746906 m!697113))

(declare-fun m!697155 () Bool)

(assert (=> b!746906 m!697155))

(declare-fun m!697157 () Bool)

(assert (=> b!746917 m!697157))

(push 1)

