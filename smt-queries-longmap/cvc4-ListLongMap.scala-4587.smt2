; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64040 () Bool)

(assert start!64040)

(declare-fun b!719175 () Bool)

(declare-fun res!481572 () Bool)

(declare-fun e!403616 () Bool)

(assert (=> b!719175 (=> (not res!481572) (not e!403616))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40735 0))(
  ( (array!40736 (arr!19493 (Array (_ BitVec 32) (_ BitVec 64))) (size!19914 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40735)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719175 (= res!481572 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19914 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19914 a!3186))))))

(declare-fun b!719176 () Bool)

(declare-fun res!481570 () Bool)

(declare-fun e!403614 () Bool)

(assert (=> b!719176 (=> (not res!481570) (not e!403614))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719176 (= res!481570 (and (= (size!19914 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19914 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19914 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719177 () Bool)

(declare-fun res!481574 () Bool)

(assert (=> b!719177 (=> (not res!481574) (not e!403616))))

(declare-datatypes ((List!13495 0))(
  ( (Nil!13492) (Cons!13491 (h!14539 (_ BitVec 64)) (t!19810 List!13495)) )
))
(declare-fun arrayNoDuplicates!0 (array!40735 (_ BitVec 32) List!13495) Bool)

(assert (=> b!719177 (= res!481574 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13492))))

(declare-fun b!719178 () Bool)

(declare-fun res!481576 () Bool)

(assert (=> b!719178 (=> (not res!481576) (not e!403614))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719178 (= res!481576 (validKeyInArray!0 k!2102))))

(declare-fun b!719179 () Bool)

(assert (=> b!719179 (= e!403616 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19493 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719180 () Bool)

(assert (=> b!719180 (= e!403614 e!403616)))

(declare-fun res!481573 () Bool)

(assert (=> b!719180 (=> (not res!481573) (not e!403616))))

(declare-datatypes ((SeekEntryResult!7093 0))(
  ( (MissingZero!7093 (index!30740 (_ BitVec 32))) (Found!7093 (index!30741 (_ BitVec 32))) (Intermediate!7093 (undefined!7905 Bool) (index!30742 (_ BitVec 32)) (x!61748 (_ BitVec 32))) (Undefined!7093) (MissingVacant!7093 (index!30743 (_ BitVec 32))) )
))
(declare-fun lt!319544 () SeekEntryResult!7093)

(assert (=> b!719180 (= res!481573 (or (= lt!319544 (MissingZero!7093 i!1173)) (= lt!319544 (MissingVacant!7093 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40735 (_ BitVec 32)) SeekEntryResult!7093)

(assert (=> b!719180 (= lt!319544 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719181 () Bool)

(declare-fun res!481568 () Bool)

(assert (=> b!719181 (=> (not res!481568) (not e!403614))))

(assert (=> b!719181 (= res!481568 (validKeyInArray!0 (select (arr!19493 a!3186) j!159)))))

(declare-fun b!719182 () Bool)

(declare-fun res!481571 () Bool)

(assert (=> b!719182 (=> (not res!481571) (not e!403614))))

(declare-fun arrayContainsKey!0 (array!40735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719182 (= res!481571 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719183 () Bool)

(declare-fun res!481577 () Bool)

(assert (=> b!719183 (=> (not res!481577) (not e!403616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40735 (_ BitVec 32)) Bool)

(assert (=> b!719183 (= res!481577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719184 () Bool)

(declare-fun res!481575 () Bool)

(assert (=> b!719184 (=> (not res!481575) (not e!403616))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40735 (_ BitVec 32)) SeekEntryResult!7093)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719184 (= res!481575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19493 a!3186) j!159) mask!3328) (select (arr!19493 a!3186) j!159) a!3186 mask!3328) (Intermediate!7093 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun res!481569 () Bool)

(assert (=> start!64040 (=> (not res!481569) (not e!403614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64040 (= res!481569 (validMask!0 mask!3328))))

(assert (=> start!64040 e!403614))

(assert (=> start!64040 true))

(declare-fun array_inv!15289 (array!40735) Bool)

(assert (=> start!64040 (array_inv!15289 a!3186)))

(assert (= (and start!64040 res!481569) b!719176))

(assert (= (and b!719176 res!481570) b!719181))

(assert (= (and b!719181 res!481568) b!719178))

(assert (= (and b!719178 res!481576) b!719182))

(assert (= (and b!719182 res!481571) b!719180))

(assert (= (and b!719180 res!481573) b!719183))

(assert (= (and b!719183 res!481577) b!719177))

(assert (= (and b!719177 res!481574) b!719175))

(assert (= (and b!719175 res!481572) b!719184))

(assert (= (and b!719184 res!481575) b!719179))

(declare-fun m!674629 () Bool)

(assert (=> start!64040 m!674629))

(declare-fun m!674631 () Bool)

(assert (=> start!64040 m!674631))

(declare-fun m!674633 () Bool)

(assert (=> b!719184 m!674633))

(assert (=> b!719184 m!674633))

(declare-fun m!674635 () Bool)

(assert (=> b!719184 m!674635))

(assert (=> b!719184 m!674635))

(assert (=> b!719184 m!674633))

(declare-fun m!674637 () Bool)

(assert (=> b!719184 m!674637))

(declare-fun m!674639 () Bool)

(assert (=> b!719179 m!674639))

(declare-fun m!674641 () Bool)

(assert (=> b!719178 m!674641))

(declare-fun m!674643 () Bool)

(assert (=> b!719182 m!674643))

(declare-fun m!674645 () Bool)

(assert (=> b!719183 m!674645))

(declare-fun m!674647 () Bool)

(assert (=> b!719180 m!674647))

(assert (=> b!719181 m!674633))

(assert (=> b!719181 m!674633))

(declare-fun m!674649 () Bool)

(assert (=> b!719181 m!674649))

(declare-fun m!674651 () Bool)

(assert (=> b!719177 m!674651))

(push 1)

(assert (not b!719180))

(assert (not b!719182))

(assert (not b!719178))

(assert (not b!719183))

(assert (not b!719177))

(assert (not start!64040))

(assert (not b!719181))

(assert (not b!719184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

