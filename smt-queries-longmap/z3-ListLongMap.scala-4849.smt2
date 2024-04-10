; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66794 () Bool)

(assert start!66794)

(declare-fun b!770216 () Bool)

(declare-fun e!428840 () Bool)

(declare-fun e!428849 () Bool)

(assert (=> b!770216 (= e!428840 e!428849)))

(declare-fun res!520988 () Bool)

(assert (=> b!770216 (=> (not res!520988) (not e!428849))))

(declare-datatypes ((SeekEntryResult!7878 0))(
  ( (MissingZero!7878 (index!33880 (_ BitVec 32))) (Found!7878 (index!33881 (_ BitVec 32))) (Intermediate!7878 (undefined!8690 Bool) (index!33882 (_ BitVec 32)) (x!64809 (_ BitVec 32))) (Undefined!7878) (MissingVacant!7878 (index!33883 (_ BitVec 32))) )
))
(declare-fun lt!342781 () SeekEntryResult!7878)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770216 (= res!520988 (or (= lt!342781 (MissingZero!7878 i!1173)) (= lt!342781 (MissingVacant!7878 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42356 0))(
  ( (array!42357 (arr!20278 (Array (_ BitVec 32) (_ BitVec 64))) (size!20699 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42356)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42356 (_ BitVec 32)) SeekEntryResult!7878)

(assert (=> b!770216 (= lt!342781 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770217 () Bool)

(declare-fun res!520985 () Bool)

(assert (=> b!770217 (=> (not res!520985) (not e!428840))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770217 (= res!520985 (validKeyInArray!0 (select (arr!20278 a!3186) j!159)))))

(declare-fun b!770218 () Bool)

(declare-fun res!520978 () Bool)

(declare-fun e!428845 () Bool)

(assert (=> b!770218 (=> (not res!520978) (not e!428845))))

(declare-fun e!428848 () Bool)

(assert (=> b!770218 (= res!520978 e!428848)))

(declare-fun c!85018 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770218 (= c!85018 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!770219 () Bool)

(declare-fun lt!342782 () SeekEntryResult!7878)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42356 (_ BitVec 32)) SeekEntryResult!7878)

(assert (=> b!770219 (= e!428848 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!342782))))

(declare-fun b!770220 () Bool)

(declare-fun e!428843 () Bool)

(declare-fun e!428847 () Bool)

(assert (=> b!770220 (= e!428843 (not e!428847))))

(declare-fun res!520974 () Bool)

(assert (=> b!770220 (=> res!520974 e!428847)))

(declare-fun lt!342778 () SeekEntryResult!7878)

(get-info :version)

(assert (=> b!770220 (= res!520974 (or (not ((_ is Intermediate!7878) lt!342778)) (bvsge x!1131 (x!64809 lt!342778))))))

(declare-fun e!428844 () Bool)

(assert (=> b!770220 e!428844))

(declare-fun res!520980 () Bool)

(assert (=> b!770220 (=> (not res!520980) (not e!428844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42356 (_ BitVec 32)) Bool)

(assert (=> b!770220 (= res!520980 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26526 0))(
  ( (Unit!26527) )
))
(declare-fun lt!342780 () Unit!26526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26526)

(assert (=> b!770220 (= lt!342780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770221 () Bool)

(assert (=> b!770221 (= e!428847 true)))

(declare-fun lt!342773 () Unit!26526)

(declare-fun e!428841 () Unit!26526)

(assert (=> b!770221 (= lt!342773 e!428841)))

(declare-fun c!85017 () Bool)

(assert (=> b!770221 (= c!85017 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342777 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770221 (= lt!342777 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770222 () Bool)

(declare-fun res!520983 () Bool)

(assert (=> b!770222 (=> (not res!520983) (not e!428849))))

(assert (=> b!770222 (= res!520983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770223 () Bool)

(declare-fun res!520975 () Bool)

(assert (=> b!770223 (=> (not res!520975) (not e!428840))))

(assert (=> b!770223 (= res!520975 (validKeyInArray!0 k0!2102))))

(declare-fun b!770224 () Bool)

(declare-fun e!428842 () Bool)

(assert (=> b!770224 (= e!428844 e!428842)))

(declare-fun res!520979 () Bool)

(assert (=> b!770224 (=> (not res!520979) (not e!428842))))

(declare-fun lt!342775 () SeekEntryResult!7878)

(assert (=> b!770224 (= res!520979 (= (seekEntryOrOpen!0 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!342775))))

(assert (=> b!770224 (= lt!342775 (Found!7878 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!770225 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42356 (_ BitVec 32)) SeekEntryResult!7878)

(assert (=> b!770225 (= e!428842 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!342775))))

(declare-fun res!520986 () Bool)

(assert (=> start!66794 (=> (not res!520986) (not e!428840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66794 (= res!520986 (validMask!0 mask!3328))))

(assert (=> start!66794 e!428840))

(assert (=> start!66794 true))

(declare-fun array_inv!16074 (array!42356) Bool)

(assert (=> start!66794 (array_inv!16074 a!3186)))

(declare-fun b!770226 () Bool)

(assert (=> b!770226 (= e!428848 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) (Found!7878 j!159)))))

(declare-fun b!770227 () Bool)

(declare-fun Unit!26528 () Unit!26526)

(assert (=> b!770227 (= e!428841 Unit!26528)))

(declare-fun lt!342776 () SeekEntryResult!7878)

(assert (=> b!770227 (= lt!342776 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20278 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770227 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342777 resIntermediateIndex!5 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) (Found!7878 j!159))))

(declare-fun b!770228 () Bool)

(declare-fun res!520984 () Bool)

(assert (=> b!770228 (=> (not res!520984) (not e!428849))))

(declare-datatypes ((List!14280 0))(
  ( (Nil!14277) (Cons!14276 (h!15375 (_ BitVec 64)) (t!20595 List!14280)) )
))
(declare-fun arrayNoDuplicates!0 (array!42356 (_ BitVec 32) List!14280) Bool)

(assert (=> b!770228 (= res!520984 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14277))))

(declare-fun b!770229 () Bool)

(assert (=> b!770229 (= e!428849 e!428845)))

(declare-fun res!520982 () Bool)

(assert (=> b!770229 (=> (not res!520982) (not e!428845))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770229 (= res!520982 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20278 a!3186) j!159) mask!3328) (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!342782))))

(assert (=> b!770229 (= lt!342782 (Intermediate!7878 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770230 () Bool)

(declare-fun Unit!26529 () Unit!26526)

(assert (=> b!770230 (= e!428841 Unit!26529)))

(assert (=> b!770230 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342777 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!342782)))

(declare-fun b!770231 () Bool)

(declare-fun res!520987 () Bool)

(assert (=> b!770231 (=> (not res!520987) (not e!428845))))

(assert (=> b!770231 (= res!520987 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20278 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770232 () Bool)

(declare-fun res!520981 () Bool)

(assert (=> b!770232 (=> (not res!520981) (not e!428849))))

(assert (=> b!770232 (= res!520981 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20699 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20699 a!3186))))))

(declare-fun b!770233 () Bool)

(assert (=> b!770233 (= e!428845 e!428843)))

(declare-fun res!520977 () Bool)

(assert (=> b!770233 (=> (not res!520977) (not e!428843))))

(declare-fun lt!342774 () SeekEntryResult!7878)

(assert (=> b!770233 (= res!520977 (= lt!342774 lt!342778))))

(declare-fun lt!342772 () (_ BitVec 64))

(declare-fun lt!342779 () array!42356)

(assert (=> b!770233 (= lt!342778 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342772 lt!342779 mask!3328))))

(assert (=> b!770233 (= lt!342774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342772 mask!3328) lt!342772 lt!342779 mask!3328))))

(assert (=> b!770233 (= lt!342772 (select (store (arr!20278 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770233 (= lt!342779 (array!42357 (store (arr!20278 a!3186) i!1173 k0!2102) (size!20699 a!3186)))))

(declare-fun b!770234 () Bool)

(declare-fun res!520976 () Bool)

(assert (=> b!770234 (=> (not res!520976) (not e!428840))))

(assert (=> b!770234 (= res!520976 (and (= (size!20699 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20699 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20699 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770235 () Bool)

(declare-fun res!520973 () Bool)

(assert (=> b!770235 (=> (not res!520973) (not e!428840))))

(declare-fun arrayContainsKey!0 (array!42356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770235 (= res!520973 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66794 res!520986) b!770234))

(assert (= (and b!770234 res!520976) b!770217))

(assert (= (and b!770217 res!520985) b!770223))

(assert (= (and b!770223 res!520975) b!770235))

(assert (= (and b!770235 res!520973) b!770216))

(assert (= (and b!770216 res!520988) b!770222))

(assert (= (and b!770222 res!520983) b!770228))

(assert (= (and b!770228 res!520984) b!770232))

(assert (= (and b!770232 res!520981) b!770229))

(assert (= (and b!770229 res!520982) b!770231))

(assert (= (and b!770231 res!520987) b!770218))

(assert (= (and b!770218 c!85018) b!770219))

(assert (= (and b!770218 (not c!85018)) b!770226))

(assert (= (and b!770218 res!520978) b!770233))

(assert (= (and b!770233 res!520977) b!770220))

(assert (= (and b!770220 res!520980) b!770224))

(assert (= (and b!770224 res!520979) b!770225))

(assert (= (and b!770220 (not res!520974)) b!770221))

(assert (= (and b!770221 c!85017) b!770230))

(assert (= (and b!770221 (not c!85017)) b!770227))

(declare-fun m!715527 () Bool)

(assert (=> b!770224 m!715527))

(assert (=> b!770224 m!715527))

(declare-fun m!715529 () Bool)

(assert (=> b!770224 m!715529))

(declare-fun m!715531 () Bool)

(assert (=> b!770222 m!715531))

(assert (=> b!770230 m!715527))

(assert (=> b!770230 m!715527))

(declare-fun m!715533 () Bool)

(assert (=> b!770230 m!715533))

(declare-fun m!715535 () Bool)

(assert (=> b!770233 m!715535))

(declare-fun m!715537 () Bool)

(assert (=> b!770233 m!715537))

(declare-fun m!715539 () Bool)

(assert (=> b!770233 m!715539))

(assert (=> b!770233 m!715535))

(declare-fun m!715541 () Bool)

(assert (=> b!770233 m!715541))

(declare-fun m!715543 () Bool)

(assert (=> b!770233 m!715543))

(declare-fun m!715545 () Bool)

(assert (=> b!770220 m!715545))

(declare-fun m!715547 () Bool)

(assert (=> b!770220 m!715547))

(assert (=> b!770217 m!715527))

(assert (=> b!770217 m!715527))

(declare-fun m!715549 () Bool)

(assert (=> b!770217 m!715549))

(declare-fun m!715551 () Bool)

(assert (=> b!770228 m!715551))

(declare-fun m!715553 () Bool)

(assert (=> b!770231 m!715553))

(declare-fun m!715555 () Bool)

(assert (=> start!66794 m!715555))

(declare-fun m!715557 () Bool)

(assert (=> start!66794 m!715557))

(assert (=> b!770219 m!715527))

(assert (=> b!770219 m!715527))

(declare-fun m!715559 () Bool)

(assert (=> b!770219 m!715559))

(declare-fun m!715561 () Bool)

(assert (=> b!770216 m!715561))

(declare-fun m!715563 () Bool)

(assert (=> b!770235 m!715563))

(assert (=> b!770226 m!715527))

(assert (=> b!770226 m!715527))

(declare-fun m!715565 () Bool)

(assert (=> b!770226 m!715565))

(assert (=> b!770229 m!715527))

(assert (=> b!770229 m!715527))

(declare-fun m!715567 () Bool)

(assert (=> b!770229 m!715567))

(assert (=> b!770229 m!715567))

(assert (=> b!770229 m!715527))

(declare-fun m!715569 () Bool)

(assert (=> b!770229 m!715569))

(assert (=> b!770225 m!715527))

(assert (=> b!770225 m!715527))

(declare-fun m!715571 () Bool)

(assert (=> b!770225 m!715571))

(declare-fun m!715573 () Bool)

(assert (=> b!770223 m!715573))

(assert (=> b!770227 m!715527))

(assert (=> b!770227 m!715527))

(assert (=> b!770227 m!715565))

(assert (=> b!770227 m!715527))

(declare-fun m!715575 () Bool)

(assert (=> b!770227 m!715575))

(declare-fun m!715577 () Bool)

(assert (=> b!770221 m!715577))

(check-sat (not b!770223) (not b!770230) (not b!770220) (not b!770221) (not b!770224) (not b!770217) (not b!770233) (not b!770229) (not b!770228) (not start!66794) (not b!770235) (not b!770227) (not b!770219) (not b!770225) (not b!770222) (not b!770216) (not b!770226))
(check-sat)
