; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66314 () Bool)

(assert start!66314)

(declare-fun b!762855 () Bool)

(declare-fun res!515593 () Bool)

(declare-fun e!425335 () Bool)

(assert (=> b!762855 (=> (not res!515593) (not e!425335))))

(declare-datatypes ((array!42097 0))(
  ( (array!42098 (arr!20152 (Array (_ BitVec 32) (_ BitVec 64))) (size!20572 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42097)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762855 (= res!515593 (validKeyInArray!0 (select (arr!20152 a!3186) j!159)))))

(declare-fun b!762856 () Bool)

(declare-fun e!425334 () Bool)

(assert (=> b!762856 (= e!425334 false)))

(declare-fun lt!339792 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762856 (= lt!339792 (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328))))

(declare-fun res!515595 () Bool)

(assert (=> start!66314 (=> (not res!515595) (not e!425335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66314 (= res!515595 (validMask!0 mask!3328))))

(assert (=> start!66314 e!425335))

(assert (=> start!66314 true))

(declare-fun array_inv!16011 (array!42097) Bool)

(assert (=> start!66314 (array_inv!16011 a!3186)))

(declare-fun b!762857 () Bool)

(declare-fun res!515594 () Bool)

(assert (=> b!762857 (=> (not res!515594) (not e!425334))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762857 (= res!515594 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20572 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20572 a!3186))))))

(declare-fun b!762858 () Bool)

(declare-fun res!515597 () Bool)

(assert (=> b!762858 (=> (not res!515597) (not e!425335))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762858 (= res!515597 (and (= (size!20572 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20572 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20572 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762859 () Bool)

(declare-fun res!515596 () Bool)

(assert (=> b!762859 (=> (not res!515596) (not e!425334))))

(declare-datatypes ((List!14061 0))(
  ( (Nil!14058) (Cons!14057 (h!15147 (_ BitVec 64)) (t!20368 List!14061)) )
))
(declare-fun arrayNoDuplicates!0 (array!42097 (_ BitVec 32) List!14061) Bool)

(assert (=> b!762859 (= res!515596 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14058))))

(declare-fun b!762860 () Bool)

(assert (=> b!762860 (= e!425335 e!425334)))

(declare-fun res!515599 () Bool)

(assert (=> b!762860 (=> (not res!515599) (not e!425334))))

(declare-datatypes ((SeekEntryResult!7708 0))(
  ( (MissingZero!7708 (index!33200 (_ BitVec 32))) (Found!7708 (index!33201 (_ BitVec 32))) (Intermediate!7708 (undefined!8520 Bool) (index!33202 (_ BitVec 32)) (x!64275 (_ BitVec 32))) (Undefined!7708) (MissingVacant!7708 (index!33203 (_ BitVec 32))) )
))
(declare-fun lt!339791 () SeekEntryResult!7708)

(assert (=> b!762860 (= res!515599 (or (= lt!339791 (MissingZero!7708 i!1173)) (= lt!339791 (MissingVacant!7708 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42097 (_ BitVec 32)) SeekEntryResult!7708)

(assert (=> b!762860 (= lt!339791 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762861 () Bool)

(declare-fun res!515598 () Bool)

(assert (=> b!762861 (=> (not res!515598) (not e!425335))))

(declare-fun arrayContainsKey!0 (array!42097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762861 (= res!515598 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762862 () Bool)

(declare-fun res!515592 () Bool)

(assert (=> b!762862 (=> (not res!515592) (not e!425334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42097 (_ BitVec 32)) Bool)

(assert (=> b!762862 (= res!515592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762863 () Bool)

(declare-fun res!515600 () Bool)

(assert (=> b!762863 (=> (not res!515600) (not e!425335))))

(assert (=> b!762863 (= res!515600 (validKeyInArray!0 k0!2102))))

(assert (= (and start!66314 res!515595) b!762858))

(assert (= (and b!762858 res!515597) b!762855))

(assert (= (and b!762855 res!515593) b!762863))

(assert (= (and b!762863 res!515600) b!762861))

(assert (= (and b!762861 res!515598) b!762860))

(assert (= (and b!762860 res!515599) b!762862))

(assert (= (and b!762862 res!515592) b!762859))

(assert (= (and b!762859 res!515596) b!762857))

(assert (= (and b!762857 res!515594) b!762856))

(declare-fun m!710029 () Bool)

(assert (=> b!762856 m!710029))

(assert (=> b!762856 m!710029))

(declare-fun m!710031 () Bool)

(assert (=> b!762856 m!710031))

(declare-fun m!710033 () Bool)

(assert (=> b!762863 m!710033))

(declare-fun m!710035 () Bool)

(assert (=> start!66314 m!710035))

(declare-fun m!710037 () Bool)

(assert (=> start!66314 m!710037))

(declare-fun m!710039 () Bool)

(assert (=> b!762861 m!710039))

(declare-fun m!710041 () Bool)

(assert (=> b!762860 m!710041))

(declare-fun m!710043 () Bool)

(assert (=> b!762862 m!710043))

(declare-fun m!710045 () Bool)

(assert (=> b!762859 m!710045))

(assert (=> b!762855 m!710029))

(assert (=> b!762855 m!710029))

(declare-fun m!710047 () Bool)

(assert (=> b!762855 m!710047))

(check-sat (not b!762859) (not b!762862) (not b!762855) (not b!762861) (not b!762863) (not b!762856) (not start!66314) (not b!762860))
(check-sat)
