; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65282 () Bool)

(assert start!65282)

(declare-fun res!498694 () Bool)

(declare-fun e!414320 () Bool)

(assert (=> start!65282 (=> (not res!498694) (not e!414320))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65282 (= res!498694 (validMask!0 mask!3328))))

(assert (=> start!65282 e!414320))

(assert (=> start!65282 true))

(declare-datatypes ((array!41472 0))(
  ( (array!41473 (arr!19850 (Array (_ BitVec 32) (_ BitVec 64))) (size!20271 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41472)

(declare-fun array_inv!15733 (array!41472) Bool)

(assert (=> start!65282 (array_inv!15733 a!3186)))

(declare-fun b!741244 () Bool)

(declare-fun res!498692 () Bool)

(declare-fun e!414319 () Bool)

(assert (=> b!741244 (=> (not res!498692) (not e!414319))))

(declare-datatypes ((List!13891 0))(
  ( (Nil!13888) (Cons!13887 (h!14959 (_ BitVec 64)) (t!20197 List!13891)) )
))
(declare-fun arrayNoDuplicates!0 (array!41472 (_ BitVec 32) List!13891) Bool)

(assert (=> b!741244 (= res!498692 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13888))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!414318 () Bool)

(declare-datatypes ((SeekEntryResult!7447 0))(
  ( (MissingZero!7447 (index!32156 (_ BitVec 32))) (Found!7447 (index!32157 (_ BitVec 32))) (Intermediate!7447 (undefined!8259 Bool) (index!32158 (_ BitVec 32)) (x!63144 (_ BitVec 32))) (Undefined!7447) (MissingVacant!7447 (index!32159 (_ BitVec 32))) )
))
(declare-fun lt!329195 () SeekEntryResult!7447)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!741245 () Bool)

(get-info :version)

(assert (=> b!741245 (= e!414318 (not (or (not ((_ is Intermediate!7447) lt!329195)) (not (= x!1131 (x!63144 lt!329195))) (not (= index!1321 (index!32158 lt!329195))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!414324 () Bool)

(assert (=> b!741245 e!414324))

(declare-fun res!498697 () Bool)

(assert (=> b!741245 (=> (not res!498697) (not e!414324))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41472 (_ BitVec 32)) Bool)

(assert (=> b!741245 (= res!498697 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25346 0))(
  ( (Unit!25347) )
))
(declare-fun lt!329188 () Unit!25346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25346)

(assert (=> b!741245 (= lt!329188 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741246 () Bool)

(declare-fun res!498691 () Bool)

(assert (=> b!741246 (=> (not res!498691) (not e!414320))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741246 (= res!498691 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741247 () Bool)

(declare-fun res!498687 () Bool)

(assert (=> b!741247 (=> (not res!498687) (not e!414319))))

(assert (=> b!741247 (= res!498687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!414322 () Bool)

(declare-fun b!741248 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41472 (_ BitVec 32)) SeekEntryResult!7447)

(assert (=> b!741248 (= e!414322 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19850 a!3186) j!159) a!3186 mask!3328) (Found!7447 j!159)))))

(declare-fun b!741249 () Bool)

(declare-fun e!414323 () Bool)

(assert (=> b!741249 (= e!414323 e!414318)))

(declare-fun res!498699 () Bool)

(assert (=> b!741249 (=> (not res!498699) (not e!414318))))

(declare-fun lt!329192 () SeekEntryResult!7447)

(assert (=> b!741249 (= res!498699 (= lt!329192 lt!329195))))

(declare-fun lt!329193 () array!41472)

(declare-fun lt!329189 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41472 (_ BitVec 32)) SeekEntryResult!7447)

(assert (=> b!741249 (= lt!329195 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329189 lt!329193 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741249 (= lt!329192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329189 mask!3328) lt!329189 lt!329193 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741249 (= lt!329189 (select (store (arr!19850 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741249 (= lt!329193 (array!41473 (store (arr!19850 a!3186) i!1173 k0!2102) (size!20271 a!3186)))))

(declare-fun b!741250 () Bool)

(declare-fun res!498695 () Bool)

(assert (=> b!741250 (=> (not res!498695) (not e!414320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741250 (= res!498695 (validKeyInArray!0 (select (arr!19850 a!3186) j!159)))))

(declare-fun b!741251 () Bool)

(declare-fun res!498689 () Bool)

(assert (=> b!741251 (=> (not res!498689) (not e!414323))))

(assert (=> b!741251 (= res!498689 e!414322)))

(declare-fun c!81660 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741251 (= c!81660 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741252 () Bool)

(declare-fun res!498685 () Bool)

(assert (=> b!741252 (=> (not res!498685) (not e!414319))))

(assert (=> b!741252 (= res!498685 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20271 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20271 a!3186))))))

(declare-fun b!741253 () Bool)

(assert (=> b!741253 (= e!414319 e!414323)))

(declare-fun res!498686 () Bool)

(assert (=> b!741253 (=> (not res!498686) (not e!414323))))

(declare-fun lt!329191 () SeekEntryResult!7447)

(assert (=> b!741253 (= res!498686 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19850 a!3186) j!159) mask!3328) (select (arr!19850 a!3186) j!159) a!3186 mask!3328) lt!329191))))

(assert (=> b!741253 (= lt!329191 (Intermediate!7447 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741254 () Bool)

(declare-fun res!498690 () Bool)

(assert (=> b!741254 (=> (not res!498690) (not e!414320))))

(assert (=> b!741254 (= res!498690 (and (= (size!20271 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20271 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20271 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741255 () Bool)

(assert (=> b!741255 (= e!414320 e!414319)))

(declare-fun res!498688 () Bool)

(assert (=> b!741255 (=> (not res!498688) (not e!414319))))

(declare-fun lt!329190 () SeekEntryResult!7447)

(assert (=> b!741255 (= res!498688 (or (= lt!329190 (MissingZero!7447 i!1173)) (= lt!329190 (MissingVacant!7447 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41472 (_ BitVec 32)) SeekEntryResult!7447)

(assert (=> b!741255 (= lt!329190 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741256 () Bool)

(assert (=> b!741256 (= e!414322 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19850 a!3186) j!159) a!3186 mask!3328) lt!329191))))

(declare-fun e!414325 () Bool)

(declare-fun lt!329194 () SeekEntryResult!7447)

(declare-fun b!741257 () Bool)

(assert (=> b!741257 (= e!414325 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19850 a!3186) j!159) a!3186 mask!3328) lt!329194))))

(declare-fun b!741258 () Bool)

(declare-fun res!498698 () Bool)

(assert (=> b!741258 (=> (not res!498698) (not e!414320))))

(assert (=> b!741258 (= res!498698 (validKeyInArray!0 k0!2102))))

(declare-fun b!741259 () Bool)

(declare-fun res!498693 () Bool)

(assert (=> b!741259 (=> (not res!498693) (not e!414323))))

(assert (=> b!741259 (= res!498693 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19850 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741260 () Bool)

(assert (=> b!741260 (= e!414324 e!414325)))

(declare-fun res!498696 () Bool)

(assert (=> b!741260 (=> (not res!498696) (not e!414325))))

(assert (=> b!741260 (= res!498696 (= (seekEntryOrOpen!0 (select (arr!19850 a!3186) j!159) a!3186 mask!3328) lt!329194))))

(assert (=> b!741260 (= lt!329194 (Found!7447 j!159))))

(assert (= (and start!65282 res!498694) b!741254))

(assert (= (and b!741254 res!498690) b!741250))

(assert (= (and b!741250 res!498695) b!741258))

(assert (= (and b!741258 res!498698) b!741246))

(assert (= (and b!741246 res!498691) b!741255))

(assert (= (and b!741255 res!498688) b!741247))

(assert (= (and b!741247 res!498687) b!741244))

(assert (= (and b!741244 res!498692) b!741252))

(assert (= (and b!741252 res!498685) b!741253))

(assert (= (and b!741253 res!498686) b!741259))

(assert (= (and b!741259 res!498693) b!741251))

(assert (= (and b!741251 c!81660) b!741256))

(assert (= (and b!741251 (not c!81660)) b!741248))

(assert (= (and b!741251 res!498689) b!741249))

(assert (= (and b!741249 res!498699) b!741245))

(assert (= (and b!741245 res!498697) b!741260))

(assert (= (and b!741260 res!498696) b!741257))

(declare-fun m!691703 () Bool)

(assert (=> b!741259 m!691703))

(declare-fun m!691705 () Bool)

(assert (=> b!741253 m!691705))

(assert (=> b!741253 m!691705))

(declare-fun m!691707 () Bool)

(assert (=> b!741253 m!691707))

(assert (=> b!741253 m!691707))

(assert (=> b!741253 m!691705))

(declare-fun m!691709 () Bool)

(assert (=> b!741253 m!691709))

(declare-fun m!691711 () Bool)

(assert (=> b!741245 m!691711))

(declare-fun m!691713 () Bool)

(assert (=> b!741245 m!691713))

(assert (=> b!741256 m!691705))

(assert (=> b!741256 m!691705))

(declare-fun m!691715 () Bool)

(assert (=> b!741256 m!691715))

(assert (=> b!741257 m!691705))

(assert (=> b!741257 m!691705))

(declare-fun m!691717 () Bool)

(assert (=> b!741257 m!691717))

(assert (=> b!741250 m!691705))

(assert (=> b!741250 m!691705))

(declare-fun m!691719 () Bool)

(assert (=> b!741250 m!691719))

(declare-fun m!691721 () Bool)

(assert (=> b!741255 m!691721))

(declare-fun m!691723 () Bool)

(assert (=> b!741258 m!691723))

(declare-fun m!691725 () Bool)

(assert (=> b!741246 m!691725))

(declare-fun m!691727 () Bool)

(assert (=> b!741249 m!691727))

(declare-fun m!691729 () Bool)

(assert (=> b!741249 m!691729))

(declare-fun m!691731 () Bool)

(assert (=> b!741249 m!691731))

(declare-fun m!691733 () Bool)

(assert (=> b!741249 m!691733))

(assert (=> b!741249 m!691727))

(declare-fun m!691735 () Bool)

(assert (=> b!741249 m!691735))

(declare-fun m!691737 () Bool)

(assert (=> b!741247 m!691737))

(assert (=> b!741260 m!691705))

(assert (=> b!741260 m!691705))

(declare-fun m!691739 () Bool)

(assert (=> b!741260 m!691739))

(assert (=> b!741248 m!691705))

(assert (=> b!741248 m!691705))

(declare-fun m!691741 () Bool)

(assert (=> b!741248 m!691741))

(declare-fun m!691743 () Bool)

(assert (=> start!65282 m!691743))

(declare-fun m!691745 () Bool)

(assert (=> start!65282 m!691745))

(declare-fun m!691747 () Bool)

(assert (=> b!741244 m!691747))

(check-sat (not b!741250) (not b!741244) (not b!741258) (not b!741249) (not b!741248) (not start!65282) (not b!741253) (not b!741257) (not b!741255) (not b!741256) (not b!741246) (not b!741247) (not b!741260) (not b!741245))
(check-sat)
