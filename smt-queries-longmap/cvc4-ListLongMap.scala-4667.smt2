; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64922 () Bool)

(assert start!64922)

(declare-fun b!732697 () Bool)

(declare-fun res!492269 () Bool)

(declare-fun e!409995 () Bool)

(assert (=> b!732697 (=> (not res!492269) (not e!409995))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41233 0))(
  ( (array!41234 (arr!19733 (Array (_ BitVec 32) (_ BitVec 64))) (size!20154 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41233)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732697 (= res!492269 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19733 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732698 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!409998 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7333 0))(
  ( (MissingZero!7333 (index!31700 (_ BitVec 32))) (Found!7333 (index!31701 (_ BitVec 32))) (Intermediate!7333 (undefined!8145 Bool) (index!31702 (_ BitVec 32)) (x!62691 (_ BitVec 32))) (Undefined!7333) (MissingVacant!7333 (index!31703 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41233 (_ BitVec 32)) SeekEntryResult!7333)

(assert (=> b!732698 (= e!409998 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19733 a!3186) j!159) a!3186 mask!3328) (Found!7333 j!159)))))

(declare-fun lt!324706 () SeekEntryResult!7333)

(declare-fun b!732699 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!409992 () Bool)

(assert (=> b!732699 (= e!409992 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19733 a!3186) j!159) a!3186 mask!3328) lt!324706))))

(declare-fun b!732700 () Bool)

(declare-fun e!410000 () Bool)

(declare-fun e!409997 () Bool)

(assert (=> b!732700 (= e!410000 e!409997)))

(declare-fun res!492275 () Bool)

(assert (=> b!732700 (=> (not res!492275) (not e!409997))))

(declare-fun lt!324703 () SeekEntryResult!7333)

(assert (=> b!732700 (= res!492275 (or (= lt!324703 (MissingZero!7333 i!1173)) (= lt!324703 (MissingVacant!7333 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41233 (_ BitVec 32)) SeekEntryResult!7333)

(assert (=> b!732700 (= lt!324703 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!324702 () SeekEntryResult!7333)

(declare-fun b!732701 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41233 (_ BitVec 32)) SeekEntryResult!7333)

(assert (=> b!732701 (= e!409998 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19733 a!3186) j!159) a!3186 mask!3328) lt!324702))))

(declare-fun b!732702 () Bool)

(declare-fun res!492262 () Bool)

(assert (=> b!732702 (=> (not res!492262) (not e!410000))))

(declare-fun arrayContainsKey!0 (array!41233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732702 (= res!492262 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732703 () Bool)

(declare-fun res!492268 () Bool)

(assert (=> b!732703 (=> (not res!492268) (not e!409997))))

(declare-datatypes ((List!13735 0))(
  ( (Nil!13732) (Cons!13731 (h!14797 (_ BitVec 64)) (t!20050 List!13735)) )
))
(declare-fun arrayNoDuplicates!0 (array!41233 (_ BitVec 32) List!13735) Bool)

(assert (=> b!732703 (= res!492268 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13732))))

(declare-fun b!732704 () Bool)

(declare-fun res!492260 () Bool)

(assert (=> b!732704 (=> (not res!492260) (not e!410000))))

(assert (=> b!732704 (= res!492260 (and (= (size!20154 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20154 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20154 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732705 () Bool)

(declare-fun e!409996 () Bool)

(assert (=> b!732705 (= e!409996 e!409992)))

(declare-fun res!492264 () Bool)

(assert (=> b!732705 (=> (not res!492264) (not e!409992))))

(assert (=> b!732705 (= res!492264 (= (seekEntryOrOpen!0 (select (arr!19733 a!3186) j!159) a!3186 mask!3328) lt!324706))))

(assert (=> b!732705 (= lt!324706 (Found!7333 j!159))))

(declare-fun b!732706 () Bool)

(declare-fun res!492271 () Bool)

(assert (=> b!732706 (=> (not res!492271) (not e!410000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732706 (= res!492271 (validKeyInArray!0 (select (arr!19733 a!3186) j!159)))))

(declare-fun b!732707 () Bool)

(declare-fun e!409999 () Bool)

(declare-fun e!409993 () Bool)

(assert (=> b!732707 (= e!409999 e!409993)))

(declare-fun res!492261 () Bool)

(assert (=> b!732707 (=> res!492261 e!409993)))

(assert (=> b!732707 (= res!492261 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324698 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732707 (= lt!324698 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732696 () Bool)

(declare-fun res!492272 () Bool)

(assert (=> b!732696 (=> (not res!492272) (not e!410000))))

(assert (=> b!732696 (= res!492272 (validKeyInArray!0 k!2102))))

(declare-fun res!492266 () Bool)

(assert (=> start!64922 (=> (not res!492266) (not e!410000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64922 (= res!492266 (validMask!0 mask!3328))))

(assert (=> start!64922 e!410000))

(assert (=> start!64922 true))

(declare-fun array_inv!15529 (array!41233) Bool)

(assert (=> start!64922 (array_inv!15529 a!3186)))

(declare-fun b!732708 () Bool)

(assert (=> b!732708 (= e!409993 true)))

(declare-fun lt!324700 () SeekEntryResult!7333)

(assert (=> b!732708 (= lt!324700 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19733 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732709 () Bool)

(declare-fun res!492274 () Bool)

(assert (=> b!732709 (=> (not res!492274) (not e!409995))))

(assert (=> b!732709 (= res!492274 e!409998)))

(declare-fun c!80596 () Bool)

(assert (=> b!732709 (= c!80596 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732710 () Bool)

(declare-fun e!409994 () Bool)

(assert (=> b!732710 (= e!409994 (not e!409999))))

(declare-fun res!492270 () Bool)

(assert (=> b!732710 (=> res!492270 e!409999)))

(declare-fun lt!324707 () SeekEntryResult!7333)

(assert (=> b!732710 (= res!492270 (or (not (is-Intermediate!7333 lt!324707)) (bvsge x!1131 (x!62691 lt!324707))))))

(assert (=> b!732710 e!409996))

(declare-fun res!492267 () Bool)

(assert (=> b!732710 (=> (not res!492267) (not e!409996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41233 (_ BitVec 32)) Bool)

(assert (=> b!732710 (= res!492267 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24984 0))(
  ( (Unit!24985) )
))
(declare-fun lt!324699 () Unit!24984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24984)

(assert (=> b!732710 (= lt!324699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732711 () Bool)

(declare-fun res!492265 () Bool)

(assert (=> b!732711 (=> (not res!492265) (not e!409997))))

(assert (=> b!732711 (= res!492265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732712 () Bool)

(assert (=> b!732712 (= e!409997 e!409995)))

(declare-fun res!492273 () Bool)

(assert (=> b!732712 (=> (not res!492273) (not e!409995))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732712 (= res!492273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19733 a!3186) j!159) mask!3328) (select (arr!19733 a!3186) j!159) a!3186 mask!3328) lt!324702))))

(assert (=> b!732712 (= lt!324702 (Intermediate!7333 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732713 () Bool)

(declare-fun res!492259 () Bool)

(assert (=> b!732713 (=> (not res!492259) (not e!409997))))

(assert (=> b!732713 (= res!492259 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20154 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20154 a!3186))))))

(declare-fun b!732714 () Bool)

(assert (=> b!732714 (= e!409995 e!409994)))

(declare-fun res!492263 () Bool)

(assert (=> b!732714 (=> (not res!492263) (not e!409994))))

(declare-fun lt!324704 () SeekEntryResult!7333)

(assert (=> b!732714 (= res!492263 (= lt!324704 lt!324707))))

(declare-fun lt!324705 () array!41233)

(declare-fun lt!324701 () (_ BitVec 64))

(assert (=> b!732714 (= lt!324707 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324701 lt!324705 mask!3328))))

(assert (=> b!732714 (= lt!324704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324701 mask!3328) lt!324701 lt!324705 mask!3328))))

(assert (=> b!732714 (= lt!324701 (select (store (arr!19733 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!732714 (= lt!324705 (array!41234 (store (arr!19733 a!3186) i!1173 k!2102) (size!20154 a!3186)))))

(assert (= (and start!64922 res!492266) b!732704))

(assert (= (and b!732704 res!492260) b!732706))

(assert (= (and b!732706 res!492271) b!732696))

(assert (= (and b!732696 res!492272) b!732702))

(assert (= (and b!732702 res!492262) b!732700))

(assert (= (and b!732700 res!492275) b!732711))

(assert (= (and b!732711 res!492265) b!732703))

(assert (= (and b!732703 res!492268) b!732713))

(assert (= (and b!732713 res!492259) b!732712))

(assert (= (and b!732712 res!492273) b!732697))

(assert (= (and b!732697 res!492269) b!732709))

(assert (= (and b!732709 c!80596) b!732701))

(assert (= (and b!732709 (not c!80596)) b!732698))

(assert (= (and b!732709 res!492274) b!732714))

(assert (= (and b!732714 res!492263) b!732710))

(assert (= (and b!732710 res!492267) b!732705))

(assert (= (and b!732705 res!492264) b!732699))

(assert (= (and b!732710 (not res!492270)) b!732707))

(assert (= (and b!732707 (not res!492261)) b!732708))

(declare-fun m!685711 () Bool)

(assert (=> start!64922 m!685711))

(declare-fun m!685713 () Bool)

(assert (=> start!64922 m!685713))

(declare-fun m!685715 () Bool)

(assert (=> b!732700 m!685715))

(declare-fun m!685717 () Bool)

(assert (=> b!732703 m!685717))

(declare-fun m!685719 () Bool)

(assert (=> b!732699 m!685719))

(assert (=> b!732699 m!685719))

(declare-fun m!685721 () Bool)

(assert (=> b!732699 m!685721))

(declare-fun m!685723 () Bool)

(assert (=> b!732696 m!685723))

(assert (=> b!732701 m!685719))

(assert (=> b!732701 m!685719))

(declare-fun m!685725 () Bool)

(assert (=> b!732701 m!685725))

(declare-fun m!685727 () Bool)

(assert (=> b!732711 m!685727))

(assert (=> b!732705 m!685719))

(assert (=> b!732705 m!685719))

(declare-fun m!685729 () Bool)

(assert (=> b!732705 m!685729))

(declare-fun m!685731 () Bool)

(assert (=> b!732710 m!685731))

(declare-fun m!685733 () Bool)

(assert (=> b!732710 m!685733))

(assert (=> b!732706 m!685719))

(assert (=> b!732706 m!685719))

(declare-fun m!685735 () Bool)

(assert (=> b!732706 m!685735))

(assert (=> b!732708 m!685719))

(assert (=> b!732708 m!685719))

(declare-fun m!685737 () Bool)

(assert (=> b!732708 m!685737))

(declare-fun m!685739 () Bool)

(assert (=> b!732714 m!685739))

(declare-fun m!685741 () Bool)

(assert (=> b!732714 m!685741))

(declare-fun m!685743 () Bool)

(assert (=> b!732714 m!685743))

(assert (=> b!732714 m!685739))

(declare-fun m!685745 () Bool)

(assert (=> b!732714 m!685745))

(declare-fun m!685747 () Bool)

(assert (=> b!732714 m!685747))

(assert (=> b!732698 m!685719))

(assert (=> b!732698 m!685719))

(assert (=> b!732698 m!685737))

(assert (=> b!732712 m!685719))

(assert (=> b!732712 m!685719))

(declare-fun m!685749 () Bool)

(assert (=> b!732712 m!685749))

(assert (=> b!732712 m!685749))

(assert (=> b!732712 m!685719))

(declare-fun m!685751 () Bool)

(assert (=> b!732712 m!685751))

(declare-fun m!685753 () Bool)

(assert (=> b!732707 m!685753))

(declare-fun m!685755 () Bool)

(assert (=> b!732697 m!685755))

(declare-fun m!685757 () Bool)

(assert (=> b!732702 m!685757))

(push 1)

