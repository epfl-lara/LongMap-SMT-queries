; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64924 () Bool)

(assert start!64924)

(declare-fun b!732753 () Bool)

(declare-fun res!492317 () Bool)

(declare-fun e!410021 () Bool)

(assert (=> b!732753 (=> (not res!492317) (not e!410021))))

(declare-datatypes ((array!41235 0))(
  ( (array!41236 (arr!19734 (Array (_ BitVec 32) (_ BitVec 64))) (size!20155 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41235)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732753 (= res!492317 (validKeyInArray!0 (select (arr!19734 a!3186) j!159)))))

(declare-fun res!492323 () Bool)

(assert (=> start!64924 (=> (not res!492323) (not e!410021))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64924 (= res!492323 (validMask!0 mask!3328))))

(assert (=> start!64924 e!410021))

(assert (=> start!64924 true))

(declare-fun array_inv!15530 (array!41235) Bool)

(assert (=> start!64924 (array_inv!15530 a!3186)))

(declare-fun b!732754 () Bool)

(declare-fun res!492315 () Bool)

(assert (=> b!732754 (=> (not res!492315) (not e!410021))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!732754 (= res!492315 (validKeyInArray!0 k!2102))))

(declare-fun b!732755 () Bool)

(declare-fun e!410024 () Bool)

(declare-fun e!410022 () Bool)

(assert (=> b!732755 (= e!410024 e!410022)))

(declare-fun res!492325 () Bool)

(assert (=> b!732755 (=> (not res!492325) (not e!410022))))

(declare-datatypes ((SeekEntryResult!7334 0))(
  ( (MissingZero!7334 (index!31704 (_ BitVec 32))) (Found!7334 (index!31705 (_ BitVec 32))) (Intermediate!7334 (undefined!8146 Bool) (index!31706 (_ BitVec 32)) (x!62700 (_ BitVec 32))) (Undefined!7334) (MissingVacant!7334 (index!31707 (_ BitVec 32))) )
))
(declare-fun lt!324733 () SeekEntryResult!7334)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41235 (_ BitVec 32)) SeekEntryResult!7334)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732755 (= res!492325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19734 a!3186) j!159) mask!3328) (select (arr!19734 a!3186) j!159) a!3186 mask!3328) lt!324733))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732755 (= lt!324733 (Intermediate!7334 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732756 () Bool)

(declare-fun res!492313 () Bool)

(assert (=> b!732756 (=> (not res!492313) (not e!410021))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732756 (= res!492313 (and (= (size!20155 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20155 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20155 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732757 () Bool)

(declare-fun res!492316 () Bool)

(assert (=> b!732757 (=> (not res!492316) (not e!410024))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!732757 (= res!492316 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20155 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20155 a!3186))))))

(declare-fun b!732758 () Bool)

(declare-fun e!410023 () Bool)

(declare-fun e!410030 () Bool)

(assert (=> b!732758 (= e!410023 e!410030)))

(declare-fun res!492318 () Bool)

(assert (=> b!732758 (=> (not res!492318) (not e!410030))))

(declare-fun lt!324734 () SeekEntryResult!7334)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41235 (_ BitVec 32)) SeekEntryResult!7334)

(assert (=> b!732758 (= res!492318 (= (seekEntryOrOpen!0 (select (arr!19734 a!3186) j!159) a!3186 mask!3328) lt!324734))))

(assert (=> b!732758 (= lt!324734 (Found!7334 j!159))))

(declare-fun b!732759 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41235 (_ BitVec 32)) SeekEntryResult!7334)

(assert (=> b!732759 (= e!410030 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19734 a!3186) j!159) a!3186 mask!3328) lt!324734))))

(declare-fun b!732760 () Bool)

(declare-fun res!492314 () Bool)

(assert (=> b!732760 (=> (not res!492314) (not e!410022))))

(assert (=> b!732760 (= res!492314 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19734 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732761 () Bool)

(declare-fun e!410028 () Bool)

(assert (=> b!732761 (= e!410022 e!410028)))

(declare-fun res!492326 () Bool)

(assert (=> b!732761 (=> (not res!492326) (not e!410028))))

(declare-fun lt!324736 () SeekEntryResult!7334)

(declare-fun lt!324732 () SeekEntryResult!7334)

(assert (=> b!732761 (= res!492326 (= lt!324736 lt!324732))))

(declare-fun lt!324737 () (_ BitVec 64))

(declare-fun lt!324730 () array!41235)

(assert (=> b!732761 (= lt!324732 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324737 lt!324730 mask!3328))))

(assert (=> b!732761 (= lt!324736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324737 mask!3328) lt!324737 lt!324730 mask!3328))))

(assert (=> b!732761 (= lt!324737 (select (store (arr!19734 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!732761 (= lt!324730 (array!41236 (store (arr!19734 a!3186) i!1173 k!2102) (size!20155 a!3186)))))

(declare-fun b!732762 () Bool)

(declare-fun res!492319 () Bool)

(assert (=> b!732762 (=> (not res!492319) (not e!410021))))

(declare-fun arrayContainsKey!0 (array!41235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732762 (= res!492319 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732763 () Bool)

(declare-fun res!492320 () Bool)

(assert (=> b!732763 (=> (not res!492320) (not e!410024))))

(declare-datatypes ((List!13736 0))(
  ( (Nil!13733) (Cons!13732 (h!14798 (_ BitVec 64)) (t!20051 List!13736)) )
))
(declare-fun arrayNoDuplicates!0 (array!41235 (_ BitVec 32) List!13736) Bool)

(assert (=> b!732763 (= res!492320 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13733))))

(declare-fun b!732764 () Bool)

(assert (=> b!732764 (= e!410021 e!410024)))

(declare-fun res!492321 () Bool)

(assert (=> b!732764 (=> (not res!492321) (not e!410024))))

(declare-fun lt!324729 () SeekEntryResult!7334)

(assert (=> b!732764 (= res!492321 (or (= lt!324729 (MissingZero!7334 i!1173)) (= lt!324729 (MissingVacant!7334 i!1173))))))

(assert (=> b!732764 (= lt!324729 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!732765 () Bool)

(declare-fun e!410026 () Bool)

(assert (=> b!732765 (= e!410028 (not e!410026))))

(declare-fun res!492311 () Bool)

(assert (=> b!732765 (=> res!492311 e!410026)))

(assert (=> b!732765 (= res!492311 (or (not (is-Intermediate!7334 lt!324732)) (bvsge x!1131 (x!62700 lt!324732))))))

(assert (=> b!732765 e!410023))

(declare-fun res!492312 () Bool)

(assert (=> b!732765 (=> (not res!492312) (not e!410023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41235 (_ BitVec 32)) Bool)

(assert (=> b!732765 (= res!492312 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24986 0))(
  ( (Unit!24987) )
))
(declare-fun lt!324728 () Unit!24986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24986)

(assert (=> b!732765 (= lt!324728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732766 () Bool)

(declare-fun e!410027 () Bool)

(assert (=> b!732766 (= e!410026 e!410027)))

(declare-fun res!492324 () Bool)

(assert (=> b!732766 (=> res!492324 e!410027)))

(assert (=> b!732766 (= res!492324 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324731 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732766 (= lt!324731 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732767 () Bool)

(declare-fun e!410025 () Bool)

(assert (=> b!732767 (= e!410025 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19734 a!3186) j!159) a!3186 mask!3328) (Found!7334 j!159)))))

(declare-fun b!732768 () Bool)

(assert (=> b!732768 (= e!410025 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19734 a!3186) j!159) a!3186 mask!3328) lt!324733))))

(declare-fun b!732769 () Bool)

(declare-fun res!492322 () Bool)

(assert (=> b!732769 (=> (not res!492322) (not e!410024))))

(assert (=> b!732769 (= res!492322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732770 () Bool)

(assert (=> b!732770 (= e!410027 true)))

(declare-fun lt!324735 () SeekEntryResult!7334)

(assert (=> b!732770 (= lt!324735 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19734 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732771 () Bool)

(declare-fun res!492310 () Bool)

(assert (=> b!732771 (=> (not res!492310) (not e!410022))))

(assert (=> b!732771 (= res!492310 e!410025)))

(declare-fun c!80599 () Bool)

(assert (=> b!732771 (= c!80599 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64924 res!492323) b!732756))

(assert (= (and b!732756 res!492313) b!732753))

(assert (= (and b!732753 res!492317) b!732754))

(assert (= (and b!732754 res!492315) b!732762))

(assert (= (and b!732762 res!492319) b!732764))

(assert (= (and b!732764 res!492321) b!732769))

(assert (= (and b!732769 res!492322) b!732763))

(assert (= (and b!732763 res!492320) b!732757))

(assert (= (and b!732757 res!492316) b!732755))

(assert (= (and b!732755 res!492325) b!732760))

(assert (= (and b!732760 res!492314) b!732771))

(assert (= (and b!732771 c!80599) b!732768))

(assert (= (and b!732771 (not c!80599)) b!732767))

(assert (= (and b!732771 res!492310) b!732761))

(assert (= (and b!732761 res!492326) b!732765))

(assert (= (and b!732765 res!492312) b!732758))

(assert (= (and b!732758 res!492318) b!732759))

(assert (= (and b!732765 (not res!492311)) b!732766))

(assert (= (and b!732766 (not res!492324)) b!732770))

(declare-fun m!685759 () Bool)

(assert (=> b!732758 m!685759))

(assert (=> b!732758 m!685759))

(declare-fun m!685761 () Bool)

(assert (=> b!732758 m!685761))

(declare-fun m!685763 () Bool)

(assert (=> b!732760 m!685763))

(declare-fun m!685765 () Bool)

(assert (=> b!732761 m!685765))

(assert (=> b!732761 m!685765))

(declare-fun m!685767 () Bool)

(assert (=> b!732761 m!685767))

(declare-fun m!685769 () Bool)

(assert (=> b!732761 m!685769))

(declare-fun m!685771 () Bool)

(assert (=> b!732761 m!685771))

(declare-fun m!685773 () Bool)

(assert (=> b!732761 m!685773))

(assert (=> b!732767 m!685759))

(assert (=> b!732767 m!685759))

(declare-fun m!685775 () Bool)

(assert (=> b!732767 m!685775))

(declare-fun m!685777 () Bool)

(assert (=> start!64924 m!685777))

(declare-fun m!685779 () Bool)

(assert (=> start!64924 m!685779))

(declare-fun m!685781 () Bool)

(assert (=> b!732754 m!685781))

(declare-fun m!685783 () Bool)

(assert (=> b!732763 m!685783))

(assert (=> b!732768 m!685759))

(assert (=> b!732768 m!685759))

(declare-fun m!685785 () Bool)

(assert (=> b!732768 m!685785))

(declare-fun m!685787 () Bool)

(assert (=> b!732769 m!685787))

(assert (=> b!732759 m!685759))

(assert (=> b!732759 m!685759))

(declare-fun m!685789 () Bool)

(assert (=> b!732759 m!685789))

(declare-fun m!685791 () Bool)

(assert (=> b!732766 m!685791))

(declare-fun m!685793 () Bool)

(assert (=> b!732764 m!685793))

(declare-fun m!685795 () Bool)

(assert (=> b!732762 m!685795))

(assert (=> b!732755 m!685759))

(assert (=> b!732755 m!685759))

(declare-fun m!685797 () Bool)

(assert (=> b!732755 m!685797))

(assert (=> b!732755 m!685797))

(assert (=> b!732755 m!685759))

(declare-fun m!685799 () Bool)

(assert (=> b!732755 m!685799))

(assert (=> b!732770 m!685759))

(assert (=> b!732770 m!685759))

(assert (=> b!732770 m!685775))

(assert (=> b!732753 m!685759))

(assert (=> b!732753 m!685759))

(declare-fun m!685801 () Bool)

(assert (=> b!732753 m!685801))

(declare-fun m!685803 () Bool)

(assert (=> b!732765 m!685803))

(declare-fun m!685805 () Bool)

(assert (=> b!732765 m!685805))

(push 1)

