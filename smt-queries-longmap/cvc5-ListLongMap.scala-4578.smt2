; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63934 () Bool)

(assert start!63934)

(declare-fun b!718222 () Bool)

(declare-fun e!403246 () Bool)

(assert (=> b!718222 (= e!403246 false)))

(declare-datatypes ((array!40674 0))(
  ( (array!40675 (arr!19464 (Array (_ BitVec 32) (_ BitVec 64))) (size!19885 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40674)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319316 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718222 (= lt!319316 (toIndex!0 (select (arr!19464 a!3186) j!159) mask!3328))))

(declare-fun b!718223 () Bool)

(declare-fun res!480706 () Bool)

(declare-fun e!403245 () Bool)

(assert (=> b!718223 (=> (not res!480706) (not e!403245))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718223 (= res!480706 (validKeyInArray!0 k!2102))))

(declare-fun b!718224 () Bool)

(declare-fun res!480707 () Bool)

(assert (=> b!718224 (=> (not res!480707) (not e!403245))))

(assert (=> b!718224 (= res!480707 (validKeyInArray!0 (select (arr!19464 a!3186) j!159)))))

(declare-fun b!718225 () Bool)

(declare-fun res!480704 () Bool)

(assert (=> b!718225 (=> (not res!480704) (not e!403245))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718225 (= res!480704 (and (= (size!19885 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19885 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19885 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!480710 () Bool)

(assert (=> start!63934 (=> (not res!480710) (not e!403245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63934 (= res!480710 (validMask!0 mask!3328))))

(assert (=> start!63934 e!403245))

(assert (=> start!63934 true))

(declare-fun array_inv!15260 (array!40674) Bool)

(assert (=> start!63934 (array_inv!15260 a!3186)))

(declare-fun b!718226 () Bool)

(declare-fun res!480708 () Bool)

(assert (=> b!718226 (=> (not res!480708) (not e!403246))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!718226 (= res!480708 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19885 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19885 a!3186))))))

(declare-fun b!718227 () Bool)

(declare-fun res!480709 () Bool)

(assert (=> b!718227 (=> (not res!480709) (not e!403245))))

(declare-fun arrayContainsKey!0 (array!40674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718227 (= res!480709 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718228 () Bool)

(assert (=> b!718228 (= e!403245 e!403246)))

(declare-fun res!480702 () Bool)

(assert (=> b!718228 (=> (not res!480702) (not e!403246))))

(declare-datatypes ((SeekEntryResult!7064 0))(
  ( (MissingZero!7064 (index!30624 (_ BitVec 32))) (Found!7064 (index!30625 (_ BitVec 32))) (Intermediate!7064 (undefined!7876 Bool) (index!30626 (_ BitVec 32)) (x!61644 (_ BitVec 32))) (Undefined!7064) (MissingVacant!7064 (index!30627 (_ BitVec 32))) )
))
(declare-fun lt!319315 () SeekEntryResult!7064)

(assert (=> b!718228 (= res!480702 (or (= lt!319315 (MissingZero!7064 i!1173)) (= lt!319315 (MissingVacant!7064 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40674 (_ BitVec 32)) SeekEntryResult!7064)

(assert (=> b!718228 (= lt!319315 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718229 () Bool)

(declare-fun res!480703 () Bool)

(assert (=> b!718229 (=> (not res!480703) (not e!403246))))

(declare-datatypes ((List!13466 0))(
  ( (Nil!13463) (Cons!13462 (h!14507 (_ BitVec 64)) (t!19781 List!13466)) )
))
(declare-fun arrayNoDuplicates!0 (array!40674 (_ BitVec 32) List!13466) Bool)

(assert (=> b!718229 (= res!480703 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13463))))

(declare-fun b!718230 () Bool)

(declare-fun res!480705 () Bool)

(assert (=> b!718230 (=> (not res!480705) (not e!403246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40674 (_ BitVec 32)) Bool)

(assert (=> b!718230 (= res!480705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63934 res!480710) b!718225))

(assert (= (and b!718225 res!480704) b!718224))

(assert (= (and b!718224 res!480707) b!718223))

(assert (= (and b!718223 res!480706) b!718227))

(assert (= (and b!718227 res!480709) b!718228))

(assert (= (and b!718228 res!480702) b!718230))

(assert (= (and b!718230 res!480705) b!718229))

(assert (= (and b!718229 res!480703) b!718226))

(assert (= (and b!718226 res!480708) b!718222))

(declare-fun m!673921 () Bool)

(assert (=> b!718230 m!673921))

(declare-fun m!673923 () Bool)

(assert (=> start!63934 m!673923))

(declare-fun m!673925 () Bool)

(assert (=> start!63934 m!673925))

(declare-fun m!673927 () Bool)

(assert (=> b!718223 m!673927))

(declare-fun m!673929 () Bool)

(assert (=> b!718222 m!673929))

(assert (=> b!718222 m!673929))

(declare-fun m!673931 () Bool)

(assert (=> b!718222 m!673931))

(declare-fun m!673933 () Bool)

(assert (=> b!718229 m!673933))

(assert (=> b!718224 m!673929))

(assert (=> b!718224 m!673929))

(declare-fun m!673935 () Bool)

(assert (=> b!718224 m!673935))

(declare-fun m!673937 () Bool)

(assert (=> b!718228 m!673937))

(declare-fun m!673939 () Bool)

(assert (=> b!718227 m!673939))

(push 1)

(assert (not b!718223))

(assert (not b!718230))

(assert (not b!718228))

(assert (not b!718222))

(assert (not b!718229))

(assert (not start!63934))

(assert (not b!718224))

(assert (not b!718227))

(check-sat)

