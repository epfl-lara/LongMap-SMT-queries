; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64366 () Bool)

(assert start!64366)

(declare-datatypes ((array!40947 0))(
  ( (array!40948 (arr!19596 (Array (_ BitVec 32) (_ BitVec 64))) (size!20017 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40947)

(declare-datatypes ((SeekEntryResult!7196 0))(
  ( (MissingZero!7196 (index!31152 (_ BitVec 32))) (Found!7196 (index!31153 (_ BitVec 32))) (Intermediate!7196 (undefined!8008 Bool) (index!31154 (_ BitVec 32)) (x!62149 (_ BitVec 32))) (Undefined!7196) (MissingVacant!7196 (index!31155 (_ BitVec 32))) )
))
(declare-fun lt!320771 () SeekEntryResult!7196)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!723753 () Bool)

(declare-fun e!405437 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40947 (_ BitVec 32)) SeekEntryResult!7196)

(assert (=> b!723753 (= e!405437 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19596 a!3186) j!159) a!3186 mask!3328) lt!320771))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!723754 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40947 (_ BitVec 32)) SeekEntryResult!7196)

(assert (=> b!723754 (= e!405437 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19596 a!3186) j!159) a!3186 mask!3328) (Found!7196 j!159)))))

(declare-fun b!723755 () Bool)

(declare-fun res!485284 () Bool)

(declare-fun e!405436 () Bool)

(assert (=> b!723755 (=> (not res!485284) (not e!405436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723755 (= res!485284 (validKeyInArray!0 (select (arr!19596 a!3186) j!159)))))

(declare-fun b!723756 () Bool)

(declare-fun res!485290 () Bool)

(assert (=> b!723756 (=> (not res!485290) (not e!405436))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723756 (= res!485290 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723757 () Bool)

(declare-fun e!405434 () Bool)

(declare-fun e!405440 () Bool)

(assert (=> b!723757 (= e!405434 e!405440)))

(declare-fun res!485289 () Bool)

(assert (=> b!723757 (=> (not res!485289) (not e!405440))))

(declare-fun lt!320772 () (_ BitVec 64))

(declare-fun lt!320770 () array!40947)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723757 (= res!485289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320772 mask!3328) lt!320772 lt!320770 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320772 lt!320770 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723757 (= lt!320772 (select (store (arr!19596 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723757 (= lt!320770 (array!40948 (store (arr!19596 a!3186) i!1173 k!2102) (size!20017 a!3186)))))

(declare-fun b!723758 () Bool)

(assert (=> b!723758 (= e!405440 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun e!405438 () Bool)

(assert (=> b!723758 e!405438))

(declare-fun res!485296 () Bool)

(assert (=> b!723758 (=> (not res!485296) (not e!405438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40947 (_ BitVec 32)) Bool)

(assert (=> b!723758 (= res!485296 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24710 0))(
  ( (Unit!24711) )
))
(declare-fun lt!320773 () Unit!24710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24710)

(assert (=> b!723758 (= lt!320773 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723759 () Bool)

(declare-fun res!485292 () Bool)

(assert (=> b!723759 (=> (not res!485292) (not e!405434))))

(assert (=> b!723759 (= res!485292 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19596 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723760 () Bool)

(declare-fun res!485291 () Bool)

(assert (=> b!723760 (=> (not res!485291) (not e!405436))))

(assert (=> b!723760 (= res!485291 (and (= (size!20017 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20017 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20017 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723762 () Bool)

(declare-fun res!485294 () Bool)

(declare-fun e!405435 () Bool)

(assert (=> b!723762 (=> (not res!485294) (not e!405435))))

(declare-datatypes ((List!13598 0))(
  ( (Nil!13595) (Cons!13594 (h!14648 (_ BitVec 64)) (t!19913 List!13598)) )
))
(declare-fun arrayNoDuplicates!0 (array!40947 (_ BitVec 32) List!13598) Bool)

(assert (=> b!723762 (= res!485294 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13595))))

(declare-fun b!723763 () Bool)

(declare-fun res!485295 () Bool)

(assert (=> b!723763 (=> (not res!485295) (not e!405436))))

(assert (=> b!723763 (= res!485295 (validKeyInArray!0 k!2102))))

(declare-fun b!723764 () Bool)

(declare-fun res!485287 () Bool)

(assert (=> b!723764 (=> (not res!485287) (not e!405435))))

(assert (=> b!723764 (= res!485287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723765 () Bool)

(assert (=> b!723765 (= e!405435 e!405434)))

(declare-fun res!485297 () Bool)

(assert (=> b!723765 (=> (not res!485297) (not e!405434))))

(assert (=> b!723765 (= res!485297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19596 a!3186) j!159) mask!3328) (select (arr!19596 a!3186) j!159) a!3186 mask!3328) lt!320771))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723765 (= lt!320771 (Intermediate!7196 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723766 () Bool)

(declare-fun res!485286 () Bool)

(assert (=> b!723766 (=> (not res!485286) (not e!405434))))

(assert (=> b!723766 (= res!485286 e!405437)))

(declare-fun c!79606 () Bool)

(assert (=> b!723766 (= c!79606 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723767 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40947 (_ BitVec 32)) SeekEntryResult!7196)

(assert (=> b!723767 (= e!405438 (= (seekEntryOrOpen!0 (select (arr!19596 a!3186) j!159) a!3186 mask!3328) (Found!7196 j!159)))))

(declare-fun b!723768 () Bool)

(declare-fun res!485293 () Bool)

(assert (=> b!723768 (=> (not res!485293) (not e!405435))))

(assert (=> b!723768 (= res!485293 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20017 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20017 a!3186))))))

(declare-fun b!723761 () Bool)

(assert (=> b!723761 (= e!405436 e!405435)))

(declare-fun res!485285 () Bool)

(assert (=> b!723761 (=> (not res!485285) (not e!405435))))

(declare-fun lt!320774 () SeekEntryResult!7196)

(assert (=> b!723761 (= res!485285 (or (= lt!320774 (MissingZero!7196 i!1173)) (= lt!320774 (MissingVacant!7196 i!1173))))))

(assert (=> b!723761 (= lt!320774 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!485288 () Bool)

(assert (=> start!64366 (=> (not res!485288) (not e!405436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64366 (= res!485288 (validMask!0 mask!3328))))

(assert (=> start!64366 e!405436))

(assert (=> start!64366 true))

(declare-fun array_inv!15392 (array!40947) Bool)

(assert (=> start!64366 (array_inv!15392 a!3186)))

(assert (= (and start!64366 res!485288) b!723760))

(assert (= (and b!723760 res!485291) b!723755))

(assert (= (and b!723755 res!485284) b!723763))

(assert (= (and b!723763 res!485295) b!723756))

(assert (= (and b!723756 res!485290) b!723761))

(assert (= (and b!723761 res!485285) b!723764))

(assert (= (and b!723764 res!485287) b!723762))

(assert (= (and b!723762 res!485294) b!723768))

(assert (= (and b!723768 res!485293) b!723765))

(assert (= (and b!723765 res!485297) b!723759))

(assert (= (and b!723759 res!485292) b!723766))

(assert (= (and b!723766 c!79606) b!723753))

(assert (= (and b!723766 (not c!79606)) b!723754))

(assert (= (and b!723766 res!485286) b!723757))

(assert (= (and b!723757 res!485289) b!723758))

(assert (= (and b!723758 res!485296) b!723767))

(declare-fun m!678169 () Bool)

(assert (=> b!723755 m!678169))

(assert (=> b!723755 m!678169))

(declare-fun m!678171 () Bool)

(assert (=> b!723755 m!678171))

(declare-fun m!678173 () Bool)

(assert (=> start!64366 m!678173))

(declare-fun m!678175 () Bool)

(assert (=> start!64366 m!678175))

(declare-fun m!678177 () Bool)

(assert (=> b!723764 m!678177))

(assert (=> b!723767 m!678169))

(assert (=> b!723767 m!678169))

(declare-fun m!678179 () Bool)

(assert (=> b!723767 m!678179))

(assert (=> b!723753 m!678169))

(assert (=> b!723753 m!678169))

(declare-fun m!678181 () Bool)

(assert (=> b!723753 m!678181))

(declare-fun m!678183 () Bool)

(assert (=> b!723757 m!678183))

(declare-fun m!678185 () Bool)

(assert (=> b!723757 m!678185))

(declare-fun m!678187 () Bool)

(assert (=> b!723757 m!678187))

(declare-fun m!678189 () Bool)

(assert (=> b!723757 m!678189))

(declare-fun m!678191 () Bool)

(assert (=> b!723757 m!678191))

(assert (=> b!723757 m!678189))

(declare-fun m!678193 () Bool)

(assert (=> b!723762 m!678193))

(assert (=> b!723765 m!678169))

(assert (=> b!723765 m!678169))

(declare-fun m!678195 () Bool)

(assert (=> b!723765 m!678195))

(assert (=> b!723765 m!678195))

(assert (=> b!723765 m!678169))

(declare-fun m!678197 () Bool)

(assert (=> b!723765 m!678197))

(declare-fun m!678199 () Bool)

(assert (=> b!723759 m!678199))

(declare-fun m!678201 () Bool)

(assert (=> b!723761 m!678201))

(declare-fun m!678203 () Bool)

(assert (=> b!723758 m!678203))

(declare-fun m!678205 () Bool)

(assert (=> b!723758 m!678205))

(declare-fun m!678207 () Bool)

(assert (=> b!723763 m!678207))

(declare-fun m!678209 () Bool)

(assert (=> b!723756 m!678209))

(assert (=> b!723754 m!678169))

(assert (=> b!723754 m!678169))

(declare-fun m!678211 () Bool)

(assert (=> b!723754 m!678211))

(push 1)

