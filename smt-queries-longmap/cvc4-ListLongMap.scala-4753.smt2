; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65582 () Bool)

(assert start!65582)

(declare-fun b!749583 () Bool)

(declare-fun res!505796 () Bool)

(declare-fun e!418265 () Bool)

(assert (=> b!749583 (=> (not res!505796) (not e!418265))))

(declare-datatypes ((array!41755 0))(
  ( (array!41756 (arr!19991 (Array (_ BitVec 32) (_ BitVec 64))) (size!20412 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41755)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!749583 (= res!505796 (and (= (size!20412 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20412 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20412 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749584 () Bool)

(declare-fun e!418267 () Bool)

(declare-fun e!418270 () Bool)

(assert (=> b!749584 (= e!418267 (not e!418270))))

(declare-fun res!505807 () Bool)

(assert (=> b!749584 (=> res!505807 e!418270)))

(declare-datatypes ((SeekEntryResult!7591 0))(
  ( (MissingZero!7591 (index!32732 (_ BitVec 32))) (Found!7591 (index!32733 (_ BitVec 32))) (Intermediate!7591 (undefined!8403 Bool) (index!32734 (_ BitVec 32)) (x!63661 (_ BitVec 32))) (Undefined!7591) (MissingVacant!7591 (index!32735 (_ BitVec 32))) )
))
(declare-fun lt!333257 () SeekEntryResult!7591)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!749584 (= res!505807 (or (not (is-Intermediate!7591 lt!333257)) (bvslt x!1131 (x!63661 lt!333257)) (not (= x!1131 (x!63661 lt!333257))) (not (= index!1321 (index!32734 lt!333257)))))))

(declare-fun e!418261 () Bool)

(assert (=> b!749584 e!418261))

(declare-fun res!505808 () Bool)

(assert (=> b!749584 (=> (not res!505808) (not e!418261))))

(declare-fun lt!333261 () SeekEntryResult!7591)

(declare-fun lt!333263 () SeekEntryResult!7591)

(assert (=> b!749584 (= res!505808 (= lt!333261 lt!333263))))

(assert (=> b!749584 (= lt!333263 (Found!7591 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41755 (_ BitVec 32)) SeekEntryResult!7591)

(assert (=> b!749584 (= lt!333261 (seekEntryOrOpen!0 (select (arr!19991 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41755 (_ BitVec 32)) Bool)

(assert (=> b!749584 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25744 0))(
  ( (Unit!25745) )
))
(declare-fun lt!333253 () Unit!25744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25744)

(assert (=> b!749584 (= lt!333253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!505806 () Bool)

(assert (=> start!65582 (=> (not res!505806) (not e!418265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65582 (= res!505806 (validMask!0 mask!3328))))

(assert (=> start!65582 e!418265))

(assert (=> start!65582 true))

(declare-fun array_inv!15787 (array!41755) Bool)

(assert (=> start!65582 (array_inv!15787 a!3186)))

(declare-fun b!749585 () Bool)

(declare-fun res!505803 () Bool)

(declare-fun e!418271 () Bool)

(assert (=> b!749585 (=> (not res!505803) (not e!418271))))

(declare-datatypes ((List!13993 0))(
  ( (Nil!13990) (Cons!13989 (h!15061 (_ BitVec 64)) (t!20308 List!13993)) )
))
(declare-fun arrayNoDuplicates!0 (array!41755 (_ BitVec 32) List!13993) Bool)

(assert (=> b!749585 (= res!505803 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13990))))

(declare-fun b!749586 () Bool)

(declare-fun res!505802 () Bool)

(assert (=> b!749586 (=> (not res!505802) (not e!418271))))

(assert (=> b!749586 (= res!505802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!333254 () array!41755)

(declare-fun b!749587 () Bool)

(declare-fun lt!333259 () (_ BitVec 64))

(declare-fun e!418266 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41755 (_ BitVec 32)) SeekEntryResult!7591)

(assert (=> b!749587 (= e!418266 (= (seekEntryOrOpen!0 lt!333259 lt!333254 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333259 lt!333254 mask!3328)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!749588 () Bool)

(declare-fun e!418269 () Bool)

(assert (=> b!749588 (= e!418269 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19991 a!3186) j!159) a!3186 mask!3328) (Found!7591 j!159)))))

(declare-fun b!749589 () Bool)

(assert (=> b!749589 (= e!418265 e!418271)))

(declare-fun res!505799 () Bool)

(assert (=> b!749589 (=> (not res!505799) (not e!418271))))

(declare-fun lt!333260 () SeekEntryResult!7591)

(assert (=> b!749589 (= res!505799 (or (= lt!333260 (MissingZero!7591 i!1173)) (= lt!333260 (MissingVacant!7591 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!749589 (= lt!333260 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749590 () Bool)

(declare-fun e!418264 () Unit!25744)

(declare-fun Unit!25746 () Unit!25744)

(assert (=> b!749590 (= e!418264 Unit!25746)))

(assert (=> b!749590 false))

(declare-fun b!749591 () Bool)

(declare-fun res!505809 () Bool)

(assert (=> b!749591 (=> (not res!505809) (not e!418265))))

(declare-fun arrayContainsKey!0 (array!41755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749591 (= res!505809 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749592 () Bool)

(declare-fun e!418262 () Bool)

(assert (=> b!749592 (= e!418262 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!749592 e!418266))

(declare-fun res!505798 () Bool)

(assert (=> b!749592 (=> (not res!505798) (not e!418266))))

(declare-fun lt!333262 () (_ BitVec 64))

(assert (=> b!749592 (= res!505798 (= lt!333262 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333256 () Unit!25744)

(assert (=> b!749592 (= lt!333256 e!418264)))

(declare-fun c!82276 () Bool)

(assert (=> b!749592 (= c!82276 (= lt!333262 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749593 () Bool)

(declare-fun res!505805 () Bool)

(declare-fun e!418268 () Bool)

(assert (=> b!749593 (=> (not res!505805) (not e!418268))))

(assert (=> b!749593 (= res!505805 e!418269)))

(declare-fun c!82275 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749593 (= c!82275 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749594 () Bool)

(declare-fun res!505804 () Bool)

(assert (=> b!749594 (=> (not res!505804) (not e!418271))))

(assert (=> b!749594 (= res!505804 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20412 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20412 a!3186))))))

(declare-fun b!749595 () Bool)

(assert (=> b!749595 (= e!418270 e!418262)))

(declare-fun res!505800 () Bool)

(assert (=> b!749595 (=> res!505800 e!418262)))

(assert (=> b!749595 (= res!505800 (= lt!333262 lt!333259))))

(assert (=> b!749595 (= lt!333262 (select (store (arr!19991 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!749596 () Bool)

(declare-fun res!505801 () Bool)

(assert (=> b!749596 (=> res!505801 e!418270)))

(assert (=> b!749596 (= res!505801 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19991 a!3186) j!159) a!3186 mask!3328) lt!333263)))))

(declare-fun b!749597 () Bool)

(assert (=> b!749597 (= e!418271 e!418268)))

(declare-fun res!505810 () Bool)

(assert (=> b!749597 (=> (not res!505810) (not e!418268))))

(declare-fun lt!333255 () SeekEntryResult!7591)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41755 (_ BitVec 32)) SeekEntryResult!7591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749597 (= res!505810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19991 a!3186) j!159) mask!3328) (select (arr!19991 a!3186) j!159) a!3186 mask!3328) lt!333255))))

(assert (=> b!749597 (= lt!333255 (Intermediate!7591 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749598 () Bool)

(declare-fun res!505811 () Bool)

(assert (=> b!749598 (=> (not res!505811) (not e!418265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749598 (= res!505811 (validKeyInArray!0 (select (arr!19991 a!3186) j!159)))))

(declare-fun b!749599 () Bool)

(declare-fun res!505795 () Bool)

(assert (=> b!749599 (=> (not res!505795) (not e!418265))))

(assert (=> b!749599 (= res!505795 (validKeyInArray!0 k!2102))))

(declare-fun b!749600 () Bool)

(assert (=> b!749600 (= e!418261 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19991 a!3186) j!159) a!3186 mask!3328) lt!333263))))

(declare-fun b!749601 () Bool)

(assert (=> b!749601 (= e!418269 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19991 a!3186) j!159) a!3186 mask!3328) lt!333255))))

(declare-fun b!749602 () Bool)

(declare-fun Unit!25747 () Unit!25744)

(assert (=> b!749602 (= e!418264 Unit!25747)))

(declare-fun b!749603 () Bool)

(assert (=> b!749603 (= e!418268 e!418267)))

(declare-fun res!505797 () Bool)

(assert (=> b!749603 (=> (not res!505797) (not e!418267))))

(declare-fun lt!333258 () SeekEntryResult!7591)

(assert (=> b!749603 (= res!505797 (= lt!333258 lt!333257))))

(assert (=> b!749603 (= lt!333257 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333259 lt!333254 mask!3328))))

(assert (=> b!749603 (= lt!333258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333259 mask!3328) lt!333259 lt!333254 mask!3328))))

(assert (=> b!749603 (= lt!333259 (select (store (arr!19991 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749603 (= lt!333254 (array!41756 (store (arr!19991 a!3186) i!1173 k!2102) (size!20412 a!3186)))))

(declare-fun b!749604 () Bool)

(declare-fun res!505794 () Bool)

(assert (=> b!749604 (=> (not res!505794) (not e!418268))))

(assert (=> b!749604 (= res!505794 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19991 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65582 res!505806) b!749583))

(assert (= (and b!749583 res!505796) b!749598))

(assert (= (and b!749598 res!505811) b!749599))

(assert (= (and b!749599 res!505795) b!749591))

(assert (= (and b!749591 res!505809) b!749589))

(assert (= (and b!749589 res!505799) b!749586))

(assert (= (and b!749586 res!505802) b!749585))

(assert (= (and b!749585 res!505803) b!749594))

(assert (= (and b!749594 res!505804) b!749597))

(assert (= (and b!749597 res!505810) b!749604))

(assert (= (and b!749604 res!505794) b!749593))

(assert (= (and b!749593 c!82275) b!749601))

(assert (= (and b!749593 (not c!82275)) b!749588))

(assert (= (and b!749593 res!505805) b!749603))

(assert (= (and b!749603 res!505797) b!749584))

(assert (= (and b!749584 res!505808) b!749600))

(assert (= (and b!749584 (not res!505807)) b!749596))

(assert (= (and b!749596 (not res!505801)) b!749595))

(assert (= (and b!749595 (not res!505800)) b!749592))

(assert (= (and b!749592 c!82276) b!749590))

(assert (= (and b!749592 (not c!82276)) b!749602))

(assert (= (and b!749592 res!505798) b!749587))

(declare-fun m!699159 () Bool)

(assert (=> b!749589 m!699159))

(declare-fun m!699161 () Bool)

(assert (=> b!749587 m!699161))

(declare-fun m!699163 () Bool)

(assert (=> b!749587 m!699163))

(declare-fun m!699165 () Bool)

(assert (=> b!749588 m!699165))

(assert (=> b!749588 m!699165))

(declare-fun m!699167 () Bool)

(assert (=> b!749588 m!699167))

(assert (=> b!749598 m!699165))

(assert (=> b!749598 m!699165))

(declare-fun m!699169 () Bool)

(assert (=> b!749598 m!699169))

(declare-fun m!699171 () Bool)

(assert (=> b!749591 m!699171))

(assert (=> b!749584 m!699165))

(assert (=> b!749584 m!699165))

(declare-fun m!699173 () Bool)

(assert (=> b!749584 m!699173))

(declare-fun m!699175 () Bool)

(assert (=> b!749584 m!699175))

(declare-fun m!699177 () Bool)

(assert (=> b!749584 m!699177))

(declare-fun m!699179 () Bool)

(assert (=> start!65582 m!699179))

(declare-fun m!699181 () Bool)

(assert (=> start!65582 m!699181))

(assert (=> b!749597 m!699165))

(assert (=> b!749597 m!699165))

(declare-fun m!699183 () Bool)

(assert (=> b!749597 m!699183))

(assert (=> b!749597 m!699183))

(assert (=> b!749597 m!699165))

(declare-fun m!699185 () Bool)

(assert (=> b!749597 m!699185))

(declare-fun m!699187 () Bool)

(assert (=> b!749599 m!699187))

(declare-fun m!699189 () Bool)

(assert (=> b!749595 m!699189))

(declare-fun m!699191 () Bool)

(assert (=> b!749595 m!699191))

(assert (=> b!749596 m!699165))

(assert (=> b!749596 m!699165))

(assert (=> b!749596 m!699167))

(assert (=> b!749600 m!699165))

(assert (=> b!749600 m!699165))

(declare-fun m!699193 () Bool)

(assert (=> b!749600 m!699193))

(declare-fun m!699195 () Bool)

(assert (=> b!749604 m!699195))

(declare-fun m!699197 () Bool)

(assert (=> b!749585 m!699197))

(assert (=> b!749601 m!699165))

(assert (=> b!749601 m!699165))

(declare-fun m!699199 () Bool)

(assert (=> b!749601 m!699199))

(declare-fun m!699201 () Bool)

(assert (=> b!749603 m!699201))

(declare-fun m!699203 () Bool)

(assert (=> b!749603 m!699203))

(assert (=> b!749603 m!699189))

(assert (=> b!749603 m!699201))

(declare-fun m!699205 () Bool)

(assert (=> b!749603 m!699205))

(declare-fun m!699207 () Bool)

(assert (=> b!749603 m!699207))

(declare-fun m!699209 () Bool)

(assert (=> b!749586 m!699209))

(push 1)

