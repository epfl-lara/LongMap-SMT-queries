; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66820 () Bool)

(assert start!66820)

(declare-fun b!770996 () Bool)

(declare-fun e!429234 () Bool)

(declare-fun e!429237 () Bool)

(assert (=> b!770996 (= e!429234 e!429237)))

(declare-fun res!521601 () Bool)

(assert (=> b!770996 (=> (not res!521601) (not e!429237))))

(declare-datatypes ((array!42382 0))(
  ( (array!42383 (arr!20291 (Array (_ BitVec 32) (_ BitVec 64))) (size!20712 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42382)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7891 0))(
  ( (MissingZero!7891 (index!33932 (_ BitVec 32))) (Found!7891 (index!33933 (_ BitVec 32))) (Intermediate!7891 (undefined!8703 Bool) (index!33934 (_ BitVec 32)) (x!64854 (_ BitVec 32))) (Undefined!7891) (MissingVacant!7891 (index!33935 (_ BitVec 32))) )
))
(declare-fun lt!343202 () SeekEntryResult!7891)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42382 (_ BitVec 32)) SeekEntryResult!7891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770996 (= res!521601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20291 a!3186) j!159) mask!3328) (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!343202))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770996 (= lt!343202 (Intermediate!7891 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770997 () Bool)

(declare-fun e!429233 () Bool)

(declare-fun e!429239 () Bool)

(assert (=> b!770997 (= e!429233 (not e!429239))))

(declare-fun res!521605 () Bool)

(assert (=> b!770997 (=> res!521605 e!429239)))

(declare-fun lt!343211 () SeekEntryResult!7891)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!770997 (= res!521605 (or (not (is-Intermediate!7891 lt!343211)) (bvsge x!1131 (x!64854 lt!343211))))))

(declare-fun e!429236 () Bool)

(assert (=> b!770997 e!429236))

(declare-fun res!521609 () Bool)

(assert (=> b!770997 (=> (not res!521609) (not e!429236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42382 (_ BitVec 32)) Bool)

(assert (=> b!770997 (= res!521609 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26578 0))(
  ( (Unit!26579) )
))
(declare-fun lt!343208 () Unit!26578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26578)

(assert (=> b!770997 (= lt!343208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770998 () Bool)

(declare-fun e!429231 () Bool)

(assert (=> b!770998 (= e!429236 e!429231)))

(declare-fun res!521600 () Bool)

(assert (=> b!770998 (=> (not res!521600) (not e!429231))))

(declare-fun lt!343207 () SeekEntryResult!7891)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42382 (_ BitVec 32)) SeekEntryResult!7891)

(assert (=> b!770998 (= res!521600 (= (seekEntryOrOpen!0 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!343207))))

(assert (=> b!770998 (= lt!343207 (Found!7891 j!159))))

(declare-fun b!770999 () Bool)

(assert (=> b!770999 (= e!429237 e!429233)))

(declare-fun res!521608 () Bool)

(assert (=> b!770999 (=> (not res!521608) (not e!429233))))

(declare-fun lt!343205 () SeekEntryResult!7891)

(assert (=> b!770999 (= res!521608 (= lt!343205 lt!343211))))

(declare-fun lt!343210 () (_ BitVec 64))

(declare-fun lt!343204 () array!42382)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!770999 (= lt!343211 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343210 lt!343204 mask!3328))))

(assert (=> b!770999 (= lt!343205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343210 mask!3328) lt!343210 lt!343204 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!770999 (= lt!343210 (select (store (arr!20291 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770999 (= lt!343204 (array!42383 (store (arr!20291 a!3186) i!1173 k!2102) (size!20712 a!3186)))))

(declare-fun b!771000 () Bool)

(declare-fun e!429230 () Unit!26578)

(declare-fun Unit!26580 () Unit!26578)

(assert (=> b!771000 (= e!429230 Unit!26580)))

(declare-fun lt!343209 () (_ BitVec 32))

(assert (=> b!771000 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343209 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!343202)))

(declare-fun b!771001 () Bool)

(declare-fun res!521607 () Bool)

(assert (=> b!771001 (=> (not res!521607) (not e!429234))))

(assert (=> b!771001 (= res!521607 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20712 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20712 a!3186))))))

(declare-fun b!771002 () Bool)

(declare-fun res!521610 () Bool)

(declare-fun e!429232 () Bool)

(assert (=> b!771002 (=> (not res!521610) (not e!429232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771002 (= res!521610 (validKeyInArray!0 k!2102))))

(declare-fun b!771004 () Bool)

(declare-fun res!521604 () Bool)

(assert (=> b!771004 (=> (not res!521604) (not e!429237))))

(assert (=> b!771004 (= res!521604 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20291 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771005 () Bool)

(declare-fun e!429238 () Bool)

(assert (=> b!771005 (= e!429238 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!343202))))

(declare-fun b!771006 () Bool)

(declare-fun res!521599 () Bool)

(assert (=> b!771006 (=> (not res!521599) (not e!429232))))

(declare-fun arrayContainsKey!0 (array!42382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771006 (= res!521599 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771007 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42382 (_ BitVec 32)) SeekEntryResult!7891)

(assert (=> b!771007 (= e!429231 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!343207))))

(declare-fun b!771008 () Bool)

(declare-fun res!521606 () Bool)

(assert (=> b!771008 (=> (not res!521606) (not e!429232))))

(assert (=> b!771008 (= res!521606 (validKeyInArray!0 (select (arr!20291 a!3186) j!159)))))

(declare-fun b!771009 () Bool)

(declare-fun res!521598 () Bool)

(assert (=> b!771009 (=> (not res!521598) (not e!429232))))

(assert (=> b!771009 (= res!521598 (and (= (size!20712 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20712 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20712 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771010 () Bool)

(declare-fun res!521602 () Bool)

(assert (=> b!771010 (=> (not res!521602) (not e!429234))))

(declare-datatypes ((List!14293 0))(
  ( (Nil!14290) (Cons!14289 (h!15388 (_ BitVec 64)) (t!20608 List!14293)) )
))
(declare-fun arrayNoDuplicates!0 (array!42382 (_ BitVec 32) List!14293) Bool)

(assert (=> b!771010 (= res!521602 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14290))))

(declare-fun b!771011 () Bool)

(declare-fun Unit!26581 () Unit!26578)

(assert (=> b!771011 (= e!429230 Unit!26581)))

(declare-fun lt!343201 () SeekEntryResult!7891)

(assert (=> b!771011 (= lt!343201 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20291 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771011 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343209 resIntermediateIndex!5 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) (Found!7891 j!159))))

(declare-fun b!771003 () Bool)

(declare-fun res!521603 () Bool)

(assert (=> b!771003 (=> (not res!521603) (not e!429234))))

(assert (=> b!771003 (= res!521603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!521611 () Bool)

(assert (=> start!66820 (=> (not res!521611) (not e!429232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66820 (= res!521611 (validMask!0 mask!3328))))

(assert (=> start!66820 e!429232))

(assert (=> start!66820 true))

(declare-fun array_inv!16087 (array!42382) Bool)

(assert (=> start!66820 (array_inv!16087 a!3186)))

(declare-fun b!771012 () Bool)

(assert (=> b!771012 (= e!429239 true)))

(declare-fun lt!343203 () Unit!26578)

(assert (=> b!771012 (= lt!343203 e!429230)))

(declare-fun c!85095 () Bool)

(assert (=> b!771012 (= c!85095 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771012 (= lt!343209 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771013 () Bool)

(declare-fun res!521612 () Bool)

(assert (=> b!771013 (=> (not res!521612) (not e!429237))))

(assert (=> b!771013 (= res!521612 e!429238)))

(declare-fun c!85096 () Bool)

(assert (=> b!771013 (= c!85096 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771014 () Bool)

(assert (=> b!771014 (= e!429238 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) (Found!7891 j!159)))))

(declare-fun b!771015 () Bool)

(assert (=> b!771015 (= e!429232 e!429234)))

(declare-fun res!521597 () Bool)

(assert (=> b!771015 (=> (not res!521597) (not e!429234))))

(declare-fun lt!343206 () SeekEntryResult!7891)

(assert (=> b!771015 (= res!521597 (or (= lt!343206 (MissingZero!7891 i!1173)) (= lt!343206 (MissingVacant!7891 i!1173))))))

(assert (=> b!771015 (= lt!343206 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!66820 res!521611) b!771009))

(assert (= (and b!771009 res!521598) b!771008))

(assert (= (and b!771008 res!521606) b!771002))

(assert (= (and b!771002 res!521610) b!771006))

(assert (= (and b!771006 res!521599) b!771015))

(assert (= (and b!771015 res!521597) b!771003))

(assert (= (and b!771003 res!521603) b!771010))

(assert (= (and b!771010 res!521602) b!771001))

(assert (= (and b!771001 res!521607) b!770996))

(assert (= (and b!770996 res!521601) b!771004))

(assert (= (and b!771004 res!521604) b!771013))

(assert (= (and b!771013 c!85096) b!771005))

(assert (= (and b!771013 (not c!85096)) b!771014))

(assert (= (and b!771013 res!521612) b!770999))

(assert (= (and b!770999 res!521608) b!770997))

(assert (= (and b!770997 res!521609) b!770998))

(assert (= (and b!770998 res!521600) b!771007))

(assert (= (and b!770997 (not res!521605)) b!771012))

(assert (= (and b!771012 c!85095) b!771000))

(assert (= (and b!771012 (not c!85095)) b!771011))

(declare-fun m!716203 () Bool)

(assert (=> b!771011 m!716203))

(assert (=> b!771011 m!716203))

(declare-fun m!716205 () Bool)

(assert (=> b!771011 m!716205))

(assert (=> b!771011 m!716203))

(declare-fun m!716207 () Bool)

(assert (=> b!771011 m!716207))

(declare-fun m!716209 () Bool)

(assert (=> b!771015 m!716209))

(declare-fun m!716211 () Bool)

(assert (=> b!771010 m!716211))

(assert (=> b!770996 m!716203))

(assert (=> b!770996 m!716203))

(declare-fun m!716213 () Bool)

(assert (=> b!770996 m!716213))

(assert (=> b!770996 m!716213))

(assert (=> b!770996 m!716203))

(declare-fun m!716215 () Bool)

(assert (=> b!770996 m!716215))

(assert (=> b!771008 m!716203))

(assert (=> b!771008 m!716203))

(declare-fun m!716217 () Bool)

(assert (=> b!771008 m!716217))

(assert (=> b!771007 m!716203))

(assert (=> b!771007 m!716203))

(declare-fun m!716219 () Bool)

(assert (=> b!771007 m!716219))

(declare-fun m!716221 () Bool)

(assert (=> b!770997 m!716221))

(declare-fun m!716223 () Bool)

(assert (=> b!770997 m!716223))

(assert (=> b!770998 m!716203))

(assert (=> b!770998 m!716203))

(declare-fun m!716225 () Bool)

(assert (=> b!770998 m!716225))

(declare-fun m!716227 () Bool)

(assert (=> b!771004 m!716227))

(declare-fun m!716229 () Bool)

(assert (=> b!771012 m!716229))

(declare-fun m!716231 () Bool)

(assert (=> b!771003 m!716231))

(assert (=> b!771014 m!716203))

(assert (=> b!771014 m!716203))

(assert (=> b!771014 m!716205))

(declare-fun m!716233 () Bool)

(assert (=> b!771002 m!716233))

(assert (=> b!771000 m!716203))

(assert (=> b!771000 m!716203))

(declare-fun m!716235 () Bool)

(assert (=> b!771000 m!716235))

(declare-fun m!716237 () Bool)

(assert (=> b!771006 m!716237))

(declare-fun m!716239 () Bool)

(assert (=> start!66820 m!716239))

(declare-fun m!716241 () Bool)

(assert (=> start!66820 m!716241))

(declare-fun m!716243 () Bool)

(assert (=> b!770999 m!716243))

(declare-fun m!716245 () Bool)

(assert (=> b!770999 m!716245))

(assert (=> b!770999 m!716243))

(declare-fun m!716247 () Bool)

(assert (=> b!770999 m!716247))

(declare-fun m!716249 () Bool)

(assert (=> b!770999 m!716249))

(declare-fun m!716251 () Bool)

(assert (=> b!770999 m!716251))

(assert (=> b!771005 m!716203))

(assert (=> b!771005 m!716203))

(declare-fun m!716253 () Bool)

(assert (=> b!771005 m!716253))

(push 1)

