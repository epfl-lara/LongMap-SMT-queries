; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64386 () Bool)

(assert start!64386)

(declare-fun b!723142 () Bool)

(declare-fun e!405290 () Bool)

(declare-fun e!405288 () Bool)

(assert (=> b!723142 (= e!405290 e!405288)))

(declare-fun res!484659 () Bool)

(assert (=> b!723142 (=> (not res!484659) (not e!405288))))

(declare-datatypes ((array!40900 0))(
  ( (array!40901 (arr!19570 (Array (_ BitVec 32) (_ BitVec 64))) (size!19990 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40900)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7126 0))(
  ( (MissingZero!7126 (index!30872 (_ BitVec 32))) (Found!7126 (index!30873 (_ BitVec 32))) (Intermediate!7126 (undefined!7938 Bool) (index!30874 (_ BitVec 32)) (x!62026 (_ BitVec 32))) (Undefined!7126) (MissingVacant!7126 (index!30875 (_ BitVec 32))) )
))
(declare-fun lt!320574 () SeekEntryResult!7126)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40900 (_ BitVec 32)) SeekEntryResult!7126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723142 (= res!484659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19570 a!3186) j!159) mask!3328) (select (arr!19570 a!3186) j!159) a!3186 mask!3328) lt!320574))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723142 (= lt!320574 (Intermediate!7126 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723143 () Bool)

(declare-fun res!484660 () Bool)

(assert (=> b!723143 (=> (not res!484660) (not e!405290))))

(declare-datatypes ((List!13479 0))(
  ( (Nil!13476) (Cons!13475 (h!14532 (_ BitVec 64)) (t!19786 List!13479)) )
))
(declare-fun arrayNoDuplicates!0 (array!40900 (_ BitVec 32) List!13479) Bool)

(assert (=> b!723143 (= res!484660 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13476))))

(declare-fun b!723144 () Bool)

(declare-fun e!405287 () Bool)

(assert (=> b!723144 (= e!405287 e!405290)))

(declare-fun res!484652 () Bool)

(assert (=> b!723144 (=> (not res!484652) (not e!405290))))

(declare-fun lt!320570 () SeekEntryResult!7126)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723144 (= res!484652 (or (= lt!320570 (MissingZero!7126 i!1173)) (= lt!320570 (MissingVacant!7126 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40900 (_ BitVec 32)) SeekEntryResult!7126)

(assert (=> b!723144 (= lt!320570 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723145 () Bool)

(declare-fun res!484654 () Bool)

(assert (=> b!723145 (=> (not res!484654) (not e!405287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723145 (= res!484654 (validKeyInArray!0 (select (arr!19570 a!3186) j!159)))))

(declare-fun b!723146 () Bool)

(declare-fun res!484656 () Bool)

(assert (=> b!723146 (=> (not res!484656) (not e!405288))))

(assert (=> b!723146 (= res!484656 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19570 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723147 () Bool)

(declare-fun res!484651 () Bool)

(assert (=> b!723147 (=> (not res!484651) (not e!405290))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!723147 (= res!484651 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19990 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19990 a!3186))))))

(declare-fun b!723141 () Bool)

(declare-fun res!484649 () Bool)

(assert (=> b!723141 (=> (not res!484649) (not e!405288))))

(declare-fun e!405289 () Bool)

(assert (=> b!723141 (= res!484649 e!405289)))

(declare-fun c!79619 () Bool)

(assert (=> b!723141 (= c!79619 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!484650 () Bool)

(assert (=> start!64386 (=> (not res!484650) (not e!405287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64386 (= res!484650 (validMask!0 mask!3328))))

(assert (=> start!64386 e!405287))

(assert (=> start!64386 true))

(declare-fun array_inv!15429 (array!40900) Bool)

(assert (=> start!64386 (array_inv!15429 a!3186)))

(declare-fun b!723148 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40900 (_ BitVec 32)) SeekEntryResult!7126)

(assert (=> b!723148 (= e!405289 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19570 a!3186) j!159) a!3186 mask!3328) (Found!7126 j!159)))))

(declare-fun b!723149 () Bool)

(declare-fun res!484657 () Bool)

(assert (=> b!723149 (=> (not res!484657) (not e!405287))))

(assert (=> b!723149 (= res!484657 (validKeyInArray!0 k0!2102))))

(declare-fun b!723150 () Bool)

(assert (=> b!723150 (= e!405289 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19570 a!3186) j!159) a!3186 mask!3328) lt!320574))))

(declare-fun b!723151 () Bool)

(declare-fun res!484655 () Bool)

(assert (=> b!723151 (=> (not res!484655) (not e!405287))))

(assert (=> b!723151 (= res!484655 (and (= (size!19990 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19990 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19990 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723152 () Bool)

(declare-fun res!484658 () Bool)

(assert (=> b!723152 (=> (not res!484658) (not e!405287))))

(declare-fun arrayContainsKey!0 (array!40900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723152 (= res!484658 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723153 () Bool)

(declare-fun res!484653 () Bool)

(assert (=> b!723153 (=> (not res!484653) (not e!405290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40900 (_ BitVec 32)) Bool)

(assert (=> b!723153 (= res!484653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723154 () Bool)

(assert (=> b!723154 (= e!405288 false)))

(declare-fun lt!320572 () (_ BitVec 64))

(declare-fun lt!320571 () array!40900)

(declare-fun lt!320573 () SeekEntryResult!7126)

(assert (=> b!723154 (= lt!320573 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320572 lt!320571 mask!3328))))

(declare-fun lt!320569 () SeekEntryResult!7126)

(assert (=> b!723154 (= lt!320569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320572 mask!3328) lt!320572 lt!320571 mask!3328))))

(assert (=> b!723154 (= lt!320572 (select (store (arr!19570 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723154 (= lt!320571 (array!40901 (store (arr!19570 a!3186) i!1173 k0!2102) (size!19990 a!3186)))))

(assert (= (and start!64386 res!484650) b!723151))

(assert (= (and b!723151 res!484655) b!723145))

(assert (= (and b!723145 res!484654) b!723149))

(assert (= (and b!723149 res!484657) b!723152))

(assert (= (and b!723152 res!484658) b!723144))

(assert (= (and b!723144 res!484652) b!723153))

(assert (= (and b!723153 res!484653) b!723143))

(assert (= (and b!723143 res!484660) b!723147))

(assert (= (and b!723147 res!484651) b!723142))

(assert (= (and b!723142 res!484659) b!723146))

(assert (= (and b!723146 res!484656) b!723141))

(assert (= (and b!723141 c!79619) b!723150))

(assert (= (and b!723141 (not c!79619)) b!723148))

(assert (= (and b!723141 res!484649) b!723154))

(declare-fun m!678153 () Bool)

(assert (=> start!64386 m!678153))

(declare-fun m!678155 () Bool)

(assert (=> start!64386 m!678155))

(declare-fun m!678157 () Bool)

(assert (=> b!723143 m!678157))

(declare-fun m!678159 () Bool)

(assert (=> b!723153 m!678159))

(declare-fun m!678161 () Bool)

(assert (=> b!723146 m!678161))

(declare-fun m!678163 () Bool)

(assert (=> b!723149 m!678163))

(declare-fun m!678165 () Bool)

(assert (=> b!723154 m!678165))

(declare-fun m!678167 () Bool)

(assert (=> b!723154 m!678167))

(declare-fun m!678169 () Bool)

(assert (=> b!723154 m!678169))

(declare-fun m!678171 () Bool)

(assert (=> b!723154 m!678171))

(assert (=> b!723154 m!678165))

(declare-fun m!678173 () Bool)

(assert (=> b!723154 m!678173))

(declare-fun m!678175 () Bool)

(assert (=> b!723144 m!678175))

(declare-fun m!678177 () Bool)

(assert (=> b!723148 m!678177))

(assert (=> b!723148 m!678177))

(declare-fun m!678179 () Bool)

(assert (=> b!723148 m!678179))

(assert (=> b!723142 m!678177))

(assert (=> b!723142 m!678177))

(declare-fun m!678181 () Bool)

(assert (=> b!723142 m!678181))

(assert (=> b!723142 m!678181))

(assert (=> b!723142 m!678177))

(declare-fun m!678183 () Bool)

(assert (=> b!723142 m!678183))

(assert (=> b!723145 m!678177))

(assert (=> b!723145 m!678177))

(declare-fun m!678185 () Bool)

(assert (=> b!723145 m!678185))

(declare-fun m!678187 () Bool)

(assert (=> b!723152 m!678187))

(assert (=> b!723150 m!678177))

(assert (=> b!723150 m!678177))

(declare-fun m!678189 () Bool)

(assert (=> b!723150 m!678189))

(check-sat (not b!723143) (not b!723152) (not b!723145) (not b!723142) (not b!723150) (not start!64386) (not b!723144) (not b!723154) (not b!723148) (not b!723149) (not b!723153))
(check-sat)
