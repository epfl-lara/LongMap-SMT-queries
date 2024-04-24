; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65268 () Bool)

(assert start!65268)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41311 0))(
  ( (array!41312 (arr!19765 (Array (_ BitVec 32) (_ BitVec 64))) (size!20185 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41311)

(declare-fun e!412142 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!736565 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7321 0))(
  ( (MissingZero!7321 (index!31652 (_ BitVec 32))) (Found!7321 (index!31653 (_ BitVec 32))) (Intermediate!7321 (undefined!8133 Bool) (index!31654 (_ BitVec 32)) (x!62819 (_ BitVec 32))) (Undefined!7321) (MissingVacant!7321 (index!31655 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41311 (_ BitVec 32)) SeekEntryResult!7321)

(assert (=> b!736565 (= e!412142 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) (Found!7321 j!159)))))

(declare-fun b!736566 () Bool)

(declare-fun res!494771 () Bool)

(declare-fun e!412152 () Bool)

(assert (=> b!736566 (=> (not res!494771) (not e!412152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736566 (= res!494771 (validKeyInArray!0 (select (arr!19765 a!3186) j!159)))))

(declare-fun b!736567 () Bool)

(declare-datatypes ((Unit!25057 0))(
  ( (Unit!25058) )
))
(declare-fun e!412150 () Unit!25057)

(declare-fun Unit!25059 () Unit!25057)

(assert (=> b!736567 (= e!412150 Unit!25059)))

(declare-fun lt!326556 () (_ BitVec 32))

(declare-fun lt!326561 () SeekEntryResult!7321)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41311 (_ BitVec 32)) SeekEntryResult!7321)

(assert (=> b!736567 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326556 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326561)))

(declare-fun b!736568 () Bool)

(declare-fun e!412149 () Bool)

(declare-fun e!412145 () Bool)

(assert (=> b!736568 (= e!412149 e!412145)))

(declare-fun res!494769 () Bool)

(assert (=> b!736568 (=> res!494769 e!412145)))

(assert (=> b!736568 (= res!494769 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326556 #b00000000000000000000000000000000) (bvsge lt!326556 (size!20185 a!3186))))))

(declare-fun lt!326562 () Unit!25057)

(assert (=> b!736568 (= lt!326562 e!412150)))

(declare-fun c!81283 () Bool)

(declare-fun lt!326552 () Bool)

(assert (=> b!736568 (= c!81283 lt!326552)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736568 (= lt!326552 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736568 (= lt!326556 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!736569 () Bool)

(declare-fun res!494783 () Bool)

(assert (=> b!736569 (=> (not res!494783) (not e!412152))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!736569 (= res!494783 (validKeyInArray!0 k0!2102))))

(declare-fun b!736570 () Bool)

(declare-fun res!494778 () Bool)

(assert (=> b!736570 (=> res!494778 e!412145)))

(declare-fun e!412151 () Bool)

(assert (=> b!736570 (= res!494778 e!412151)))

(declare-fun c!81282 () Bool)

(assert (=> b!736570 (= c!81282 lt!326552)))

(declare-fun b!736571 () Bool)

(declare-fun e!412144 () Bool)

(assert (=> b!736571 (= e!412144 (not e!412149))))

(declare-fun res!494773 () Bool)

(assert (=> b!736571 (=> res!494773 e!412149)))

(declare-fun lt!326551 () SeekEntryResult!7321)

(get-info :version)

(assert (=> b!736571 (= res!494773 (or (not ((_ is Intermediate!7321) lt!326551)) (bvsge x!1131 (x!62819 lt!326551))))))

(declare-fun lt!326560 () SeekEntryResult!7321)

(assert (=> b!736571 (= lt!326560 (Found!7321 j!159))))

(declare-fun e!412148 () Bool)

(assert (=> b!736571 e!412148))

(declare-fun res!494768 () Bool)

(assert (=> b!736571 (=> (not res!494768) (not e!412148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41311 (_ BitVec 32)) Bool)

(assert (=> b!736571 (= res!494768 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326555 () Unit!25057)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25057)

(assert (=> b!736571 (= lt!326555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736572 () Bool)

(declare-fun e!412147 () Bool)

(assert (=> b!736572 (= e!412152 e!412147)))

(declare-fun res!494776 () Bool)

(assert (=> b!736572 (=> (not res!494776) (not e!412147))))

(declare-fun lt!326554 () SeekEntryResult!7321)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736572 (= res!494776 (or (= lt!326554 (MissingZero!7321 i!1173)) (= lt!326554 (MissingVacant!7321 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41311 (_ BitVec 32)) SeekEntryResult!7321)

(assert (=> b!736572 (= lt!326554 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!494775 () Bool)

(assert (=> start!65268 (=> (not res!494775) (not e!412152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65268 (= res!494775 (validMask!0 mask!3328))))

(assert (=> start!65268 e!412152))

(assert (=> start!65268 true))

(declare-fun array_inv!15624 (array!41311) Bool)

(assert (=> start!65268 (array_inv!15624 a!3186)))

(declare-fun b!736573 () Bool)

(declare-fun res!494779 () Bool)

(assert (=> b!736573 (=> (not res!494779) (not e!412147))))

(assert (=> b!736573 (= res!494779 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20185 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20185 a!3186))))))

(declare-fun b!736574 () Bool)

(declare-fun res!494781 () Bool)

(assert (=> b!736574 (=> (not res!494781) (not e!412152))))

(assert (=> b!736574 (= res!494781 (and (= (size!20185 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20185 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20185 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736575 () Bool)

(assert (=> b!736575 (= e!412145 true)))

(declare-fun lt!326549 () (_ BitVec 64))

(declare-fun lt!326553 () array!41311)

(declare-fun lt!326558 () SeekEntryResult!7321)

(assert (=> b!736575 (= lt!326558 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326556 lt!326549 lt!326553 mask!3328))))

(declare-fun b!736576 () Bool)

(assert (=> b!736576 (= e!412151 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326556 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326560)))))

(declare-fun b!736577 () Bool)

(declare-fun e!412146 () Bool)

(assert (=> b!736577 (= e!412146 e!412144)))

(declare-fun res!494785 () Bool)

(assert (=> b!736577 (=> (not res!494785) (not e!412144))))

(declare-fun lt!326550 () SeekEntryResult!7321)

(assert (=> b!736577 (= res!494785 (= lt!326550 lt!326551))))

(assert (=> b!736577 (= lt!326551 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326549 lt!326553 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736577 (= lt!326550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326549 mask!3328) lt!326549 lt!326553 mask!3328))))

(assert (=> b!736577 (= lt!326549 (select (store (arr!19765 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736577 (= lt!326553 (array!41312 (store (arr!19765 a!3186) i!1173 k0!2102) (size!20185 a!3186)))))

(declare-fun b!736578 () Bool)

(declare-fun e!412141 () Bool)

(assert (=> b!736578 (= e!412148 e!412141)))

(declare-fun res!494770 () Bool)

(assert (=> b!736578 (=> (not res!494770) (not e!412141))))

(declare-fun lt!326557 () SeekEntryResult!7321)

(assert (=> b!736578 (= res!494770 (= (seekEntryOrOpen!0 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326557))))

(assert (=> b!736578 (= lt!326557 (Found!7321 j!159))))

(declare-fun b!736579 () Bool)

(assert (=> b!736579 (= e!412142 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326561))))

(declare-fun b!736580 () Bool)

(declare-fun res!494782 () Bool)

(assert (=> b!736580 (=> (not res!494782) (not e!412147))))

(assert (=> b!736580 (= res!494782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736581 () Bool)

(assert (=> b!736581 (= e!412147 e!412146)))

(declare-fun res!494772 () Bool)

(assert (=> b!736581 (=> (not res!494772) (not e!412146))))

(assert (=> b!736581 (= res!494772 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19765 a!3186) j!159) mask!3328) (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326561))))

(assert (=> b!736581 (= lt!326561 (Intermediate!7321 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736582 () Bool)

(declare-fun res!494777 () Bool)

(assert (=> b!736582 (=> (not res!494777) (not e!412147))))

(declare-datatypes ((List!13674 0))(
  ( (Nil!13671) (Cons!13670 (h!14748 (_ BitVec 64)) (t!19981 List!13674)) )
))
(declare-fun arrayNoDuplicates!0 (array!41311 (_ BitVec 32) List!13674) Bool)

(assert (=> b!736582 (= res!494777 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13671))))

(declare-fun b!736583 () Bool)

(assert (=> b!736583 (= e!412141 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326557))))

(declare-fun b!736584 () Bool)

(declare-fun res!494774 () Bool)

(assert (=> b!736584 (=> (not res!494774) (not e!412152))))

(declare-fun arrayContainsKey!0 (array!41311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736584 (= res!494774 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736585 () Bool)

(declare-fun Unit!25060 () Unit!25057)

(assert (=> b!736585 (= e!412150 Unit!25060)))

(declare-fun lt!326559 () SeekEntryResult!7321)

(assert (=> b!736585 (= lt!326559 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736585 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326556 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326560)))

(declare-fun b!736586 () Bool)

(declare-fun res!494780 () Bool)

(assert (=> b!736586 (=> (not res!494780) (not e!412146))))

(assert (=> b!736586 (= res!494780 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19765 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736587 () Bool)

(declare-fun res!494784 () Bool)

(assert (=> b!736587 (=> (not res!494784) (not e!412146))))

(assert (=> b!736587 (= res!494784 e!412142)))

(declare-fun c!81284 () Bool)

(assert (=> b!736587 (= c!81284 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736588 () Bool)

(assert (=> b!736588 (= e!412151 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326556 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326561)))))

(assert (= (and start!65268 res!494775) b!736574))

(assert (= (and b!736574 res!494781) b!736566))

(assert (= (and b!736566 res!494771) b!736569))

(assert (= (and b!736569 res!494783) b!736584))

(assert (= (and b!736584 res!494774) b!736572))

(assert (= (and b!736572 res!494776) b!736580))

(assert (= (and b!736580 res!494782) b!736582))

(assert (= (and b!736582 res!494777) b!736573))

(assert (= (and b!736573 res!494779) b!736581))

(assert (= (and b!736581 res!494772) b!736586))

(assert (= (and b!736586 res!494780) b!736587))

(assert (= (and b!736587 c!81284) b!736579))

(assert (= (and b!736587 (not c!81284)) b!736565))

(assert (= (and b!736587 res!494784) b!736577))

(assert (= (and b!736577 res!494785) b!736571))

(assert (= (and b!736571 res!494768) b!736578))

(assert (= (and b!736578 res!494770) b!736583))

(assert (= (and b!736571 (not res!494773)) b!736568))

(assert (= (and b!736568 c!81283) b!736567))

(assert (= (and b!736568 (not c!81283)) b!736585))

(assert (= (and b!736568 (not res!494769)) b!736570))

(assert (= (and b!736570 c!81282) b!736588))

(assert (= (and b!736570 (not c!81282)) b!736576))

(assert (= (and b!736570 (not res!494778)) b!736575))

(declare-fun m!689265 () Bool)

(assert (=> b!736582 m!689265))

(declare-fun m!689267 () Bool)

(assert (=> b!736577 m!689267))

(declare-fun m!689269 () Bool)

(assert (=> b!736577 m!689269))

(declare-fun m!689271 () Bool)

(assert (=> b!736577 m!689271))

(assert (=> b!736577 m!689267))

(declare-fun m!689273 () Bool)

(assert (=> b!736577 m!689273))

(declare-fun m!689275 () Bool)

(assert (=> b!736577 m!689275))

(declare-fun m!689277 () Bool)

(assert (=> b!736586 m!689277))

(declare-fun m!689279 () Bool)

(assert (=> b!736568 m!689279))

(declare-fun m!689281 () Bool)

(assert (=> b!736585 m!689281))

(assert (=> b!736585 m!689281))

(declare-fun m!689283 () Bool)

(assert (=> b!736585 m!689283))

(assert (=> b!736585 m!689281))

(declare-fun m!689285 () Bool)

(assert (=> b!736585 m!689285))

(assert (=> b!736565 m!689281))

(assert (=> b!736565 m!689281))

(assert (=> b!736565 m!689283))

(assert (=> b!736588 m!689281))

(assert (=> b!736588 m!689281))

(declare-fun m!689287 () Bool)

(assert (=> b!736588 m!689287))

(assert (=> b!736576 m!689281))

(assert (=> b!736576 m!689281))

(assert (=> b!736576 m!689285))

(declare-fun m!689289 () Bool)

(assert (=> b!736572 m!689289))

(declare-fun m!689291 () Bool)

(assert (=> b!736575 m!689291))

(assert (=> b!736567 m!689281))

(assert (=> b!736567 m!689281))

(assert (=> b!736567 m!689287))

(declare-fun m!689293 () Bool)

(assert (=> b!736584 m!689293))

(assert (=> b!736578 m!689281))

(assert (=> b!736578 m!689281))

(declare-fun m!689295 () Bool)

(assert (=> b!736578 m!689295))

(assert (=> b!736566 m!689281))

(assert (=> b!736566 m!689281))

(declare-fun m!689297 () Bool)

(assert (=> b!736566 m!689297))

(assert (=> b!736583 m!689281))

(assert (=> b!736583 m!689281))

(declare-fun m!689299 () Bool)

(assert (=> b!736583 m!689299))

(declare-fun m!689301 () Bool)

(assert (=> b!736571 m!689301))

(declare-fun m!689303 () Bool)

(assert (=> b!736571 m!689303))

(assert (=> b!736579 m!689281))

(assert (=> b!736579 m!689281))

(declare-fun m!689305 () Bool)

(assert (=> b!736579 m!689305))

(assert (=> b!736581 m!689281))

(assert (=> b!736581 m!689281))

(declare-fun m!689307 () Bool)

(assert (=> b!736581 m!689307))

(assert (=> b!736581 m!689307))

(assert (=> b!736581 m!689281))

(declare-fun m!689309 () Bool)

(assert (=> b!736581 m!689309))

(declare-fun m!689311 () Bool)

(assert (=> start!65268 m!689311))

(declare-fun m!689313 () Bool)

(assert (=> start!65268 m!689313))

(declare-fun m!689315 () Bool)

(assert (=> b!736580 m!689315))

(declare-fun m!689317 () Bool)

(assert (=> b!736569 m!689317))

(check-sat (not b!736580) (not b!736569) (not b!736579) (not b!736567) (not b!736572) (not start!65268) (not b!736566) (not b!736578) (not b!736576) (not b!736588) (not b!736577) (not b!736565) (not b!736581) (not b!736568) (not b!736585) (not b!736571) (not b!736582) (not b!736575) (not b!736584) (not b!736583))
(check-sat)
