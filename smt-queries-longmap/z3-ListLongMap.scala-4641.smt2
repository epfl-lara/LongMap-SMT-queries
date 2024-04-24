; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64674 () Bool)

(assert start!64674)

(declare-fun b!727772 () Bool)

(declare-fun e!407499 () Bool)

(assert (=> b!727772 (= e!407499 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322307 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727772 (= lt!322307 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!727773 () Bool)

(declare-fun e!407491 () Bool)

(declare-fun e!407493 () Bool)

(assert (=> b!727773 (= e!407491 e!407493)))

(declare-fun res!488253 () Bool)

(assert (=> b!727773 (=> (not res!488253) (not e!407493))))

(declare-datatypes ((array!41062 0))(
  ( (array!41063 (arr!19648 (Array (_ BitVec 32) (_ BitVec 64))) (size!20068 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41062)

(declare-datatypes ((SeekEntryResult!7204 0))(
  ( (MissingZero!7204 (index!31184 (_ BitVec 32))) (Found!7204 (index!31185 (_ BitVec 32))) (Intermediate!7204 (undefined!8016 Bool) (index!31186 (_ BitVec 32)) (x!62330 (_ BitVec 32))) (Undefined!7204) (MissingVacant!7204 (index!31187 (_ BitVec 32))) )
))
(declare-fun lt!322310 () SeekEntryResult!7204)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41062 (_ BitVec 32)) SeekEntryResult!7204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727773 (= res!488253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19648 a!3186) j!159) mask!3328) (select (arr!19648 a!3186) j!159) a!3186 mask!3328) lt!322310))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727773 (= lt!322310 (Intermediate!7204 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!488261 () Bool)

(declare-fun e!407497 () Bool)

(assert (=> start!64674 (=> (not res!488261) (not e!407497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64674 (= res!488261 (validMask!0 mask!3328))))

(assert (=> start!64674 e!407497))

(assert (=> start!64674 true))

(declare-fun array_inv!15507 (array!41062) Bool)

(assert (=> start!64674 (array_inv!15507 a!3186)))

(declare-fun b!727774 () Bool)

(declare-fun res!488263 () Bool)

(assert (=> b!727774 (=> (not res!488263) (not e!407497))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727774 (= res!488263 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727775 () Bool)

(declare-fun res!488262 () Bool)

(assert (=> b!727775 (=> (not res!488262) (not e!407493))))

(declare-fun e!407496 () Bool)

(assert (=> b!727775 (= res!488262 e!407496)))

(declare-fun c!80138 () Bool)

(assert (=> b!727775 (= c!80138 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727776 () Bool)

(declare-fun res!488252 () Bool)

(assert (=> b!727776 (=> (not res!488252) (not e!407491))))

(assert (=> b!727776 (= res!488252 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20068 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20068 a!3186))))))

(declare-fun b!727777 () Bool)

(declare-fun e!407494 () Bool)

(declare-fun e!407495 () Bool)

(assert (=> b!727777 (= e!407494 e!407495)))

(declare-fun res!488249 () Bool)

(assert (=> b!727777 (=> (not res!488249) (not e!407495))))

(declare-fun lt!322309 () SeekEntryResult!7204)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41062 (_ BitVec 32)) SeekEntryResult!7204)

(assert (=> b!727777 (= res!488249 (= (seekEntryOrOpen!0 (select (arr!19648 a!3186) j!159) a!3186 mask!3328) lt!322309))))

(assert (=> b!727777 (= lt!322309 (Found!7204 j!159))))

(declare-fun b!727778 () Bool)

(assert (=> b!727778 (= e!407497 e!407491)))

(declare-fun res!488257 () Bool)

(assert (=> b!727778 (=> (not res!488257) (not e!407491))))

(declare-fun lt!322308 () SeekEntryResult!7204)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727778 (= res!488257 (or (= lt!322308 (MissingZero!7204 i!1173)) (= lt!322308 (MissingVacant!7204 i!1173))))))

(assert (=> b!727778 (= lt!322308 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727779 () Bool)

(declare-fun res!488256 () Bool)

(assert (=> b!727779 (=> (not res!488256) (not e!407491))))

(declare-datatypes ((List!13557 0))(
  ( (Nil!13554) (Cons!13553 (h!14616 (_ BitVec 64)) (t!19864 List!13557)) )
))
(declare-fun arrayNoDuplicates!0 (array!41062 (_ BitVec 32) List!13557) Bool)

(assert (=> b!727779 (= res!488256 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13554))))

(declare-fun b!727780 () Bool)

(declare-fun res!488250 () Bool)

(assert (=> b!727780 (=> (not res!488250) (not e!407497))))

(assert (=> b!727780 (= res!488250 (and (= (size!20068 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20068 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20068 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727781 () Bool)

(declare-fun res!488258 () Bool)

(assert (=> b!727781 (=> (not res!488258) (not e!407497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727781 (= res!488258 (validKeyInArray!0 k0!2102))))

(declare-fun b!727782 () Bool)

(declare-fun res!488255 () Bool)

(assert (=> b!727782 (=> (not res!488255) (not e!407493))))

(assert (=> b!727782 (= res!488255 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19648 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727783 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41062 (_ BitVec 32)) SeekEntryResult!7204)

(assert (=> b!727783 (= e!407495 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19648 a!3186) j!159) a!3186 mask!3328) lt!322309))))

(declare-fun b!727784 () Bool)

(assert (=> b!727784 (= e!407496 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19648 a!3186) j!159) a!3186 mask!3328) lt!322310))))

(declare-fun b!727785 () Bool)

(declare-fun e!407492 () Bool)

(assert (=> b!727785 (= e!407492 (not e!407499))))

(declare-fun res!488254 () Bool)

(assert (=> b!727785 (=> res!488254 e!407499)))

(declare-fun lt!322306 () SeekEntryResult!7204)

(get-info :version)

(assert (=> b!727785 (= res!488254 (or (not ((_ is Intermediate!7204) lt!322306)) (bvsge x!1131 (x!62330 lt!322306))))))

(assert (=> b!727785 e!407494))

(declare-fun res!488251 () Bool)

(assert (=> b!727785 (=> (not res!488251) (not e!407494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41062 (_ BitVec 32)) Bool)

(assert (=> b!727785 (= res!488251 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24805 0))(
  ( (Unit!24806) )
))
(declare-fun lt!322304 () Unit!24805)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24805)

(assert (=> b!727785 (= lt!322304 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727786 () Bool)

(assert (=> b!727786 (= e!407493 e!407492)))

(declare-fun res!488259 () Bool)

(assert (=> b!727786 (=> (not res!488259) (not e!407492))))

(declare-fun lt!322305 () SeekEntryResult!7204)

(assert (=> b!727786 (= res!488259 (= lt!322305 lt!322306))))

(declare-fun lt!322303 () array!41062)

(declare-fun lt!322311 () (_ BitVec 64))

(assert (=> b!727786 (= lt!322306 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322311 lt!322303 mask!3328))))

(assert (=> b!727786 (= lt!322305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322311 mask!3328) lt!322311 lt!322303 mask!3328))))

(assert (=> b!727786 (= lt!322311 (select (store (arr!19648 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727786 (= lt!322303 (array!41063 (store (arr!19648 a!3186) i!1173 k0!2102) (size!20068 a!3186)))))

(declare-fun b!727787 () Bool)

(assert (=> b!727787 (= e!407496 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19648 a!3186) j!159) a!3186 mask!3328) (Found!7204 j!159)))))

(declare-fun b!727788 () Bool)

(declare-fun res!488248 () Bool)

(assert (=> b!727788 (=> (not res!488248) (not e!407491))))

(assert (=> b!727788 (= res!488248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727789 () Bool)

(declare-fun res!488260 () Bool)

(assert (=> b!727789 (=> (not res!488260) (not e!407497))))

(assert (=> b!727789 (= res!488260 (validKeyInArray!0 (select (arr!19648 a!3186) j!159)))))

(assert (= (and start!64674 res!488261) b!727780))

(assert (= (and b!727780 res!488250) b!727789))

(assert (= (and b!727789 res!488260) b!727781))

(assert (= (and b!727781 res!488258) b!727774))

(assert (= (and b!727774 res!488263) b!727778))

(assert (= (and b!727778 res!488257) b!727788))

(assert (= (and b!727788 res!488248) b!727779))

(assert (= (and b!727779 res!488256) b!727776))

(assert (= (and b!727776 res!488252) b!727773))

(assert (= (and b!727773 res!488253) b!727782))

(assert (= (and b!727782 res!488255) b!727775))

(assert (= (and b!727775 c!80138) b!727784))

(assert (= (and b!727775 (not c!80138)) b!727787))

(assert (= (and b!727775 res!488262) b!727786))

(assert (= (and b!727786 res!488259) b!727785))

(assert (= (and b!727785 res!488251) b!727777))

(assert (= (and b!727777 res!488249) b!727783))

(assert (= (and b!727785 (not res!488254)) b!727772))

(declare-fun m!682155 () Bool)

(assert (=> b!727772 m!682155))

(declare-fun m!682157 () Bool)

(assert (=> b!727777 m!682157))

(assert (=> b!727777 m!682157))

(declare-fun m!682159 () Bool)

(assert (=> b!727777 m!682159))

(assert (=> b!727789 m!682157))

(assert (=> b!727789 m!682157))

(declare-fun m!682161 () Bool)

(assert (=> b!727789 m!682161))

(assert (=> b!727787 m!682157))

(assert (=> b!727787 m!682157))

(declare-fun m!682163 () Bool)

(assert (=> b!727787 m!682163))

(assert (=> b!727773 m!682157))

(assert (=> b!727773 m!682157))

(declare-fun m!682165 () Bool)

(assert (=> b!727773 m!682165))

(assert (=> b!727773 m!682165))

(assert (=> b!727773 m!682157))

(declare-fun m!682167 () Bool)

(assert (=> b!727773 m!682167))

(declare-fun m!682169 () Bool)

(assert (=> b!727782 m!682169))

(declare-fun m!682171 () Bool)

(assert (=> b!727779 m!682171))

(declare-fun m!682173 () Bool)

(assert (=> b!727778 m!682173))

(declare-fun m!682175 () Bool)

(assert (=> b!727774 m!682175))

(declare-fun m!682177 () Bool)

(assert (=> b!727786 m!682177))

(declare-fun m!682179 () Bool)

(assert (=> b!727786 m!682179))

(declare-fun m!682181 () Bool)

(assert (=> b!727786 m!682181))

(declare-fun m!682183 () Bool)

(assert (=> b!727786 m!682183))

(assert (=> b!727786 m!682177))

(declare-fun m!682185 () Bool)

(assert (=> b!727786 m!682185))

(assert (=> b!727784 m!682157))

(assert (=> b!727784 m!682157))

(declare-fun m!682187 () Bool)

(assert (=> b!727784 m!682187))

(declare-fun m!682189 () Bool)

(assert (=> b!727781 m!682189))

(assert (=> b!727783 m!682157))

(assert (=> b!727783 m!682157))

(declare-fun m!682191 () Bool)

(assert (=> b!727783 m!682191))

(declare-fun m!682193 () Bool)

(assert (=> b!727788 m!682193))

(declare-fun m!682195 () Bool)

(assert (=> b!727785 m!682195))

(declare-fun m!682197 () Bool)

(assert (=> b!727785 m!682197))

(declare-fun m!682199 () Bool)

(assert (=> start!64674 m!682199))

(declare-fun m!682201 () Bool)

(assert (=> start!64674 m!682201))

(check-sat (not b!727779) (not b!727785) (not b!727789) (not b!727777) (not b!727786) (not b!727773) (not b!727788) (not start!64674) (not b!727784) (not b!727774) (not b!727783) (not b!727778) (not b!727781) (not b!727787) (not b!727772))
(check-sat)
