; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65134 () Bool)

(assert start!65134)

(declare-fun b!735604 () Bool)

(declare-datatypes ((Unit!25064 0))(
  ( (Unit!25065) )
))
(declare-fun e!411562 () Unit!25064)

(declare-fun Unit!25066 () Unit!25064)

(assert (=> b!735604 (= e!411562 Unit!25066)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41307 0))(
  ( (array!41308 (arr!19767 (Array (_ BitVec 32) (_ BitVec 64))) (size!20188 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41307)

(declare-datatypes ((SeekEntryResult!7367 0))(
  ( (MissingZero!7367 (index!31836 (_ BitVec 32))) (Found!7367 (index!31837 (_ BitVec 32))) (Intermediate!7367 (undefined!8179 Bool) (index!31838 (_ BitVec 32)) (x!62845 (_ BitVec 32))) (Undefined!7367) (MissingVacant!7367 (index!31839 (_ BitVec 32))) )
))
(declare-fun lt!326118 () SeekEntryResult!7367)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41307 (_ BitVec 32)) SeekEntryResult!7367)

(assert (=> b!735604 (= lt!326118 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19767 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326115 () (_ BitVec 32))

(declare-fun lt!326120 () SeekEntryResult!7367)

(assert (=> b!735604 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326115 resIntermediateIndex!5 (select (arr!19767 a!3186) j!159) a!3186 mask!3328) lt!326120)))

(declare-fun e!411564 () Bool)

(declare-fun b!735605 () Bool)

(declare-fun lt!326123 () SeekEntryResult!7367)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41307 (_ BitVec 32)) SeekEntryResult!7367)

(assert (=> b!735605 (= e!411564 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326115 (select (arr!19767 a!3186) j!159) a!3186 mask!3328) lt!326123)))))

(declare-fun b!735606 () Bool)

(declare-fun e!411565 () Bool)

(declare-fun e!411555 () Bool)

(assert (=> b!735606 (= e!411565 (not e!411555))))

(declare-fun res!494311 () Bool)

(assert (=> b!735606 (=> res!494311 e!411555)))

(declare-fun lt!326110 () SeekEntryResult!7367)

(assert (=> b!735606 (= res!494311 (or (not (is-Intermediate!7367 lt!326110)) (bvsge x!1131 (x!62845 lt!326110))))))

(assert (=> b!735606 (= lt!326120 (Found!7367 j!159))))

(declare-fun e!411558 () Bool)

(assert (=> b!735606 e!411558))

(declare-fun res!494309 () Bool)

(assert (=> b!735606 (=> (not res!494309) (not e!411558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41307 (_ BitVec 32)) Bool)

(assert (=> b!735606 (= res!494309 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326119 () Unit!25064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25064)

(assert (=> b!735606 (= lt!326119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735607 () Bool)

(declare-fun res!494317 () Bool)

(declare-fun e!411556 () Bool)

(assert (=> b!735607 (=> (not res!494317) (not e!411556))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735607 (= res!494317 (validKeyInArray!0 k!2102))))

(declare-fun b!735608 () Bool)

(declare-fun e!411566 () Bool)

(assert (=> b!735608 (= e!411555 e!411566)))

(declare-fun res!494316 () Bool)

(assert (=> b!735608 (=> res!494316 e!411566)))

(assert (=> b!735608 (= res!494316 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326115 #b00000000000000000000000000000000) (bvsge lt!326115 (size!20188 a!3186))))))

(declare-fun lt!326116 () Unit!25064)

(assert (=> b!735608 (= lt!326116 e!411562)))

(declare-fun c!81034 () Bool)

(declare-fun lt!326112 () Bool)

(assert (=> b!735608 (= c!81034 lt!326112)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735608 (= lt!326112 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735608 (= lt!326115 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735609 () Bool)

(declare-fun e!411557 () Bool)

(declare-fun e!411561 () Bool)

(assert (=> b!735609 (= e!411557 e!411561)))

(declare-fun res!494307 () Bool)

(assert (=> b!735609 (=> (not res!494307) (not e!411561))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735609 (= res!494307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19767 a!3186) j!159) mask!3328) (select (arr!19767 a!3186) j!159) a!3186 mask!3328) lt!326123))))

(assert (=> b!735609 (= lt!326123 (Intermediate!7367 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735610 () Bool)

(declare-fun res!494302 () Bool)

(assert (=> b!735610 (=> (not res!494302) (not e!411557))))

(assert (=> b!735610 (= res!494302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735611 () Bool)

(declare-fun res!494305 () Bool)

(assert (=> b!735611 (=> (not res!494305) (not e!411556))))

(declare-fun arrayContainsKey!0 (array!41307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735611 (= res!494305 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735612 () Bool)

(declare-fun e!411563 () Bool)

(assert (=> b!735612 (= e!411558 e!411563)))

(declare-fun res!494301 () Bool)

(assert (=> b!735612 (=> (not res!494301) (not e!411563))))

(declare-fun lt!326117 () SeekEntryResult!7367)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41307 (_ BitVec 32)) SeekEntryResult!7367)

(assert (=> b!735612 (= res!494301 (= (seekEntryOrOpen!0 (select (arr!19767 a!3186) j!159) a!3186 mask!3328) lt!326117))))

(assert (=> b!735612 (= lt!326117 (Found!7367 j!159))))

(declare-fun b!735613 () Bool)

(assert (=> b!735613 (= e!411563 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19767 a!3186) j!159) a!3186 mask!3328) lt!326117))))

(declare-fun b!735614 () Bool)

(assert (=> b!735614 (= e!411566 true)))

(declare-fun lt!326111 () SeekEntryResult!7367)

(declare-fun lt!326114 () array!41307)

(declare-fun lt!326122 () (_ BitVec 64))

(assert (=> b!735614 (= lt!326111 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326115 lt!326122 lt!326114 mask!3328))))

(declare-fun b!735615 () Bool)

(assert (=> b!735615 (= e!411561 e!411565)))

(declare-fun res!494303 () Bool)

(assert (=> b!735615 (=> (not res!494303) (not e!411565))))

(declare-fun lt!326121 () SeekEntryResult!7367)

(assert (=> b!735615 (= res!494303 (= lt!326121 lt!326110))))

(assert (=> b!735615 (= lt!326110 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326122 lt!326114 mask!3328))))

(assert (=> b!735615 (= lt!326121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326122 mask!3328) lt!326122 lt!326114 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735615 (= lt!326122 (select (store (arr!19767 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735615 (= lt!326114 (array!41308 (store (arr!19767 a!3186) i!1173 k!2102) (size!20188 a!3186)))))

(declare-fun b!735616 () Bool)

(declare-fun res!494313 () Bool)

(assert (=> b!735616 (=> (not res!494313) (not e!411557))))

(declare-datatypes ((List!13769 0))(
  ( (Nil!13766) (Cons!13765 (h!14837 (_ BitVec 64)) (t!20084 List!13769)) )
))
(declare-fun arrayNoDuplicates!0 (array!41307 (_ BitVec 32) List!13769) Bool)

(assert (=> b!735616 (= res!494313 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13766))))

(declare-fun res!494306 () Bool)

(assert (=> start!65134 (=> (not res!494306) (not e!411556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65134 (= res!494306 (validMask!0 mask!3328))))

(assert (=> start!65134 e!411556))

(assert (=> start!65134 true))

(declare-fun array_inv!15563 (array!41307) Bool)

(assert (=> start!65134 (array_inv!15563 a!3186)))

(declare-fun b!735617 () Bool)

(declare-fun res!494308 () Bool)

(assert (=> b!735617 (=> (not res!494308) (not e!411561))))

(assert (=> b!735617 (= res!494308 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19767 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735618 () Bool)

(declare-fun res!494314 () Bool)

(assert (=> b!735618 (=> (not res!494314) (not e!411556))))

(assert (=> b!735618 (= res!494314 (validKeyInArray!0 (select (arr!19767 a!3186) j!159)))))

(declare-fun e!411559 () Bool)

(declare-fun b!735619 () Bool)

(assert (=> b!735619 (= e!411559 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19767 a!3186) j!159) a!3186 mask!3328) lt!326123))))

(declare-fun b!735620 () Bool)

(declare-fun res!494310 () Bool)

(assert (=> b!735620 (=> res!494310 e!411566)))

(assert (=> b!735620 (= res!494310 e!411564)))

(declare-fun c!81033 () Bool)

(assert (=> b!735620 (= c!81033 lt!326112)))

(declare-fun b!735621 () Bool)

(declare-fun Unit!25067 () Unit!25064)

(assert (=> b!735621 (= e!411562 Unit!25067)))

(assert (=> b!735621 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326115 (select (arr!19767 a!3186) j!159) a!3186 mask!3328) lt!326123)))

(declare-fun b!735622 () Bool)

(assert (=> b!735622 (= e!411564 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326115 resIntermediateIndex!5 (select (arr!19767 a!3186) j!159) a!3186 mask!3328) lt!326120)))))

(declare-fun b!735623 () Bool)

(declare-fun res!494304 () Bool)

(assert (=> b!735623 (=> (not res!494304) (not e!411561))))

(assert (=> b!735623 (= res!494304 e!411559)))

(declare-fun c!81032 () Bool)

(assert (=> b!735623 (= c!81032 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735624 () Bool)

(assert (=> b!735624 (= e!411559 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19767 a!3186) j!159) a!3186 mask!3328) (Found!7367 j!159)))))

(declare-fun b!735625 () Bool)

(assert (=> b!735625 (= e!411556 e!411557)))

(declare-fun res!494318 () Bool)

(assert (=> b!735625 (=> (not res!494318) (not e!411557))))

(declare-fun lt!326113 () SeekEntryResult!7367)

(assert (=> b!735625 (= res!494318 (or (= lt!326113 (MissingZero!7367 i!1173)) (= lt!326113 (MissingVacant!7367 i!1173))))))

(assert (=> b!735625 (= lt!326113 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!735626 () Bool)

(declare-fun res!494315 () Bool)

(assert (=> b!735626 (=> (not res!494315) (not e!411556))))

(assert (=> b!735626 (= res!494315 (and (= (size!20188 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20188 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20188 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735627 () Bool)

(declare-fun res!494312 () Bool)

(assert (=> b!735627 (=> (not res!494312) (not e!411557))))

(assert (=> b!735627 (= res!494312 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20188 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20188 a!3186))))))

(assert (= (and start!65134 res!494306) b!735626))

(assert (= (and b!735626 res!494315) b!735618))

(assert (= (and b!735618 res!494314) b!735607))

(assert (= (and b!735607 res!494317) b!735611))

(assert (= (and b!735611 res!494305) b!735625))

(assert (= (and b!735625 res!494318) b!735610))

(assert (= (and b!735610 res!494302) b!735616))

(assert (= (and b!735616 res!494313) b!735627))

(assert (= (and b!735627 res!494312) b!735609))

(assert (= (and b!735609 res!494307) b!735617))

(assert (= (and b!735617 res!494308) b!735623))

(assert (= (and b!735623 c!81032) b!735619))

(assert (= (and b!735623 (not c!81032)) b!735624))

(assert (= (and b!735623 res!494304) b!735615))

(assert (= (and b!735615 res!494303) b!735606))

(assert (= (and b!735606 res!494309) b!735612))

(assert (= (and b!735612 res!494301) b!735613))

(assert (= (and b!735606 (not res!494311)) b!735608))

(assert (= (and b!735608 c!81034) b!735621))

(assert (= (and b!735608 (not c!81034)) b!735604))

(assert (= (and b!735608 (not res!494316)) b!735620))

(assert (= (and b!735620 c!81033) b!735605))

(assert (= (and b!735620 (not c!81033)) b!735622))

(assert (= (and b!735620 (not res!494310)) b!735614))

(declare-fun m!687943 () Bool)

(assert (=> b!735615 m!687943))

(declare-fun m!687945 () Bool)

(assert (=> b!735615 m!687945))

(declare-fun m!687947 () Bool)

(assert (=> b!735615 m!687947))

(declare-fun m!687949 () Bool)

(assert (=> b!735615 m!687949))

(assert (=> b!735615 m!687943))

(declare-fun m!687951 () Bool)

(assert (=> b!735615 m!687951))

(declare-fun m!687953 () Bool)

(assert (=> b!735614 m!687953))

(declare-fun m!687955 () Bool)

(assert (=> b!735604 m!687955))

(assert (=> b!735604 m!687955))

(declare-fun m!687957 () Bool)

(assert (=> b!735604 m!687957))

(assert (=> b!735604 m!687955))

(declare-fun m!687959 () Bool)

(assert (=> b!735604 m!687959))

(assert (=> b!735619 m!687955))

(assert (=> b!735619 m!687955))

(declare-fun m!687961 () Bool)

(assert (=> b!735619 m!687961))

(declare-fun m!687963 () Bool)

(assert (=> b!735616 m!687963))

(assert (=> b!735618 m!687955))

(assert (=> b!735618 m!687955))

(declare-fun m!687965 () Bool)

(assert (=> b!735618 m!687965))

(declare-fun m!687967 () Bool)

(assert (=> b!735611 m!687967))

(assert (=> b!735605 m!687955))

(assert (=> b!735605 m!687955))

(declare-fun m!687969 () Bool)

(assert (=> b!735605 m!687969))

(assert (=> b!735624 m!687955))

(assert (=> b!735624 m!687955))

(assert (=> b!735624 m!687957))

(assert (=> b!735621 m!687955))

(assert (=> b!735621 m!687955))

(assert (=> b!735621 m!687969))

(declare-fun m!687971 () Bool)

(assert (=> b!735625 m!687971))

(declare-fun m!687973 () Bool)

(assert (=> b!735617 m!687973))

(declare-fun m!687975 () Bool)

(assert (=> b!735606 m!687975))

(declare-fun m!687977 () Bool)

(assert (=> b!735606 m!687977))

(assert (=> b!735609 m!687955))

(assert (=> b!735609 m!687955))

(declare-fun m!687979 () Bool)

(assert (=> b!735609 m!687979))

(assert (=> b!735609 m!687979))

(assert (=> b!735609 m!687955))

(declare-fun m!687981 () Bool)

(assert (=> b!735609 m!687981))

(declare-fun m!687983 () Bool)

(assert (=> b!735608 m!687983))

(assert (=> b!735612 m!687955))

(assert (=> b!735612 m!687955))

(declare-fun m!687985 () Bool)

(assert (=> b!735612 m!687985))

(declare-fun m!687987 () Bool)

(assert (=> b!735607 m!687987))

(assert (=> b!735613 m!687955))

(assert (=> b!735613 m!687955))

(declare-fun m!687989 () Bool)

(assert (=> b!735613 m!687989))

(declare-fun m!687991 () Bool)

(assert (=> start!65134 m!687991))

(declare-fun m!687993 () Bool)

(assert (=> start!65134 m!687993))

(assert (=> b!735622 m!687955))

(assert (=> b!735622 m!687955))

(assert (=> b!735622 m!687959))

(declare-fun m!687995 () Bool)

(assert (=> b!735610 m!687995))

(push 1)

