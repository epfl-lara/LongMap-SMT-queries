; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64084 () Bool)

(assert start!64084)

(declare-fun b!719790 () Bool)

(declare-fun res!482187 () Bool)

(declare-fun e!403813 () Bool)

(assert (=> b!719790 (=> (not res!482187) (not e!403813))))

(declare-datatypes ((array!40779 0))(
  ( (array!40780 (arr!19515 (Array (_ BitVec 32) (_ BitVec 64))) (size!19936 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40779)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40779 (_ BitVec 32)) Bool)

(assert (=> b!719790 (= res!482187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719791 () Bool)

(declare-fun res!482183 () Bool)

(assert (=> b!719791 (=> (not res!482183) (not e!403813))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719791 (= res!482183 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19936 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19936 a!3186))))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun b!719792 () Bool)

(assert (=> b!719792 (= e!403813 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19515 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun res!482189 () Bool)

(declare-fun e!403814 () Bool)

(assert (=> start!64084 (=> (not res!482189) (not e!403814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64084 (= res!482189 (validMask!0 mask!3328))))

(assert (=> start!64084 e!403814))

(assert (=> start!64084 true))

(declare-fun array_inv!15311 (array!40779) Bool)

(assert (=> start!64084 (array_inv!15311 a!3186)))

(declare-fun b!719793 () Bool)

(declare-fun res!482186 () Bool)

(assert (=> b!719793 (=> (not res!482186) (not e!403813))))

(declare-datatypes ((List!13517 0))(
  ( (Nil!13514) (Cons!13513 (h!14561 (_ BitVec 64)) (t!19832 List!13517)) )
))
(declare-fun arrayNoDuplicates!0 (array!40779 (_ BitVec 32) List!13517) Bool)

(assert (=> b!719793 (= res!482186 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13514))))

(declare-fun b!719794 () Bool)

(declare-fun res!482184 () Bool)

(assert (=> b!719794 (=> (not res!482184) (not e!403814))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719794 (= res!482184 (validKeyInArray!0 (select (arr!19515 a!3186) j!159)))))

(declare-fun b!719795 () Bool)

(assert (=> b!719795 (= e!403814 e!403813)))

(declare-fun res!482191 () Bool)

(assert (=> b!719795 (=> (not res!482191) (not e!403813))))

(declare-datatypes ((SeekEntryResult!7115 0))(
  ( (MissingZero!7115 (index!30828 (_ BitVec 32))) (Found!7115 (index!30829 (_ BitVec 32))) (Intermediate!7115 (undefined!7927 Bool) (index!30830 (_ BitVec 32)) (x!61834 (_ BitVec 32))) (Undefined!7115) (MissingVacant!7115 (index!30831 (_ BitVec 32))) )
))
(declare-fun lt!319655 () SeekEntryResult!7115)

(assert (=> b!719795 (= res!482191 (or (= lt!319655 (MissingZero!7115 i!1173)) (= lt!319655 (MissingVacant!7115 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40779 (_ BitVec 32)) SeekEntryResult!7115)

(assert (=> b!719795 (= lt!319655 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719796 () Bool)

(declare-fun res!482185 () Bool)

(assert (=> b!719796 (=> (not res!482185) (not e!403814))))

(declare-fun arrayContainsKey!0 (array!40779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719796 (= res!482185 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719797 () Bool)

(declare-fun res!482188 () Bool)

(assert (=> b!719797 (=> (not res!482188) (not e!403814))))

(assert (=> b!719797 (= res!482188 (validKeyInArray!0 k!2102))))

(declare-fun b!719798 () Bool)

(declare-fun res!482192 () Bool)

(assert (=> b!719798 (=> (not res!482192) (not e!403813))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40779 (_ BitVec 32)) SeekEntryResult!7115)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719798 (= res!482192 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19515 a!3186) j!159) mask!3328) (select (arr!19515 a!3186) j!159) a!3186 mask!3328) (Intermediate!7115 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719799 () Bool)

(declare-fun res!482190 () Bool)

(assert (=> b!719799 (=> (not res!482190) (not e!403814))))

(assert (=> b!719799 (= res!482190 (and (= (size!19936 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19936 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19936 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64084 res!482189) b!719799))

(assert (= (and b!719799 res!482190) b!719794))

(assert (= (and b!719794 res!482184) b!719797))

(assert (= (and b!719797 res!482188) b!719796))

(assert (= (and b!719796 res!482185) b!719795))

(assert (= (and b!719795 res!482191) b!719790))

(assert (= (and b!719790 res!482187) b!719793))

(assert (= (and b!719793 res!482186) b!719791))

(assert (= (and b!719791 res!482183) b!719798))

(assert (= (and b!719798 res!482192) b!719792))

(declare-fun m!675127 () Bool)

(assert (=> b!719794 m!675127))

(assert (=> b!719794 m!675127))

(declare-fun m!675129 () Bool)

(assert (=> b!719794 m!675129))

(assert (=> b!719798 m!675127))

(assert (=> b!719798 m!675127))

(declare-fun m!675131 () Bool)

(assert (=> b!719798 m!675131))

(assert (=> b!719798 m!675131))

(assert (=> b!719798 m!675127))

(declare-fun m!675133 () Bool)

(assert (=> b!719798 m!675133))

(declare-fun m!675135 () Bool)

(assert (=> b!719790 m!675135))

(declare-fun m!675137 () Bool)

(assert (=> b!719796 m!675137))

(declare-fun m!675139 () Bool)

(assert (=> b!719792 m!675139))

(declare-fun m!675141 () Bool)

(assert (=> b!719797 m!675141))

(declare-fun m!675143 () Bool)

(assert (=> b!719795 m!675143))

(declare-fun m!675145 () Bool)

(assert (=> b!719793 m!675145))

(declare-fun m!675147 () Bool)

(assert (=> start!64084 m!675147))

(declare-fun m!675149 () Bool)

(assert (=> start!64084 m!675149))

(push 1)

(assert (not start!64084))

(assert (not b!719793))

(assert (not b!719798))

(assert (not b!719796))

(assert (not b!719797))

(assert (not b!719795))

(assert (not b!719794))

(assert (not b!719790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

