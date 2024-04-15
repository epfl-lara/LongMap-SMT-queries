; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64916 () Bool)

(assert start!64916)

(declare-fun b!732847 () Bool)

(declare-fun res!492516 () Bool)

(declare-fun e!410056 () Bool)

(assert (=> b!732847 (=> (not res!492516) (not e!410056))))

(declare-fun e!410054 () Bool)

(assert (=> b!732847 (= res!492516 e!410054)))

(declare-fun c!80547 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732847 (= c!80547 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732848 () Bool)

(declare-fun e!410052 () Bool)

(declare-fun e!410048 () Bool)

(assert (=> b!732848 (= e!410052 e!410048)))

(declare-fun res!492522 () Bool)

(assert (=> b!732848 (=> (not res!492522) (not e!410048))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7336 0))(
  ( (MissingZero!7336 (index!31712 (_ BitVec 32))) (Found!7336 (index!31713 (_ BitVec 32))) (Intermediate!7336 (undefined!8148 Bool) (index!31714 (_ BitVec 32)) (x!62713 (_ BitVec 32))) (Undefined!7336) (MissingVacant!7336 (index!31715 (_ BitVec 32))) )
))
(declare-fun lt!324669 () SeekEntryResult!7336)

(declare-datatypes ((array!41244 0))(
  ( (array!41245 (arr!19739 (Array (_ BitVec 32) (_ BitVec 64))) (size!20160 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41244)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41244 (_ BitVec 32)) SeekEntryResult!7336)

(assert (=> b!732848 (= res!492522 (= (seekEntryOrOpen!0 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) lt!324669))))

(assert (=> b!732848 (= lt!324669 (Found!7336 j!159))))

(declare-fun b!732849 () Bool)

(declare-fun res!492518 () Bool)

(declare-fun e!410049 () Bool)

(assert (=> b!732849 (=> res!492518 e!410049)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41244 (_ BitVec 32)) SeekEntryResult!7336)

(assert (=> b!732849 (= res!492518 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) (Found!7336 j!159)))))

(declare-fun b!732850 () Bool)

(declare-fun e!410053 () Bool)

(assert (=> b!732850 (= e!410053 e!410056)))

(declare-fun res!492514 () Bool)

(assert (=> b!732850 (=> (not res!492514) (not e!410056))))

(declare-fun lt!324667 () SeekEntryResult!7336)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41244 (_ BitVec 32)) SeekEntryResult!7336)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732850 (= res!492514 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19739 a!3186) j!159) mask!3328) (select (arr!19739 a!3186) j!159) a!3186 mask!3328) lt!324667))))

(assert (=> b!732850 (= lt!324667 (Intermediate!7336 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732851 () Bool)

(declare-fun res!492517 () Bool)

(assert (=> b!732851 (=> (not res!492517) (not e!410056))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732851 (= res!492517 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19739 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732852 () Bool)

(declare-fun e!410055 () Bool)

(assert (=> b!732852 (= e!410055 e!410053)))

(declare-fun res!492508 () Bool)

(assert (=> b!732852 (=> (not res!492508) (not e!410053))))

(declare-fun lt!324670 () SeekEntryResult!7336)

(assert (=> b!732852 (= res!492508 (or (= lt!324670 (MissingZero!7336 i!1173)) (= lt!324670 (MissingVacant!7336 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!732852 (= lt!324670 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732853 () Bool)

(declare-fun e!410047 () Bool)

(assert (=> b!732853 (= e!410047 e!410049)))

(declare-fun res!492520 () Bool)

(assert (=> b!732853 (=> res!492520 e!410049)))

(assert (=> b!732853 (= res!492520 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324671 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732853 (= lt!324671 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732854 () Bool)

(declare-fun res!492524 () Bool)

(assert (=> b!732854 (=> (not res!492524) (not e!410055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732854 (= res!492524 (validKeyInArray!0 k0!2102))))

(declare-fun b!732855 () Bool)

(assert (=> b!732855 (= e!410048 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) lt!324669))))

(declare-fun res!492521 () Bool)

(assert (=> start!64916 (=> (not res!492521) (not e!410055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64916 (= res!492521 (validMask!0 mask!3328))))

(assert (=> start!64916 e!410055))

(assert (=> start!64916 true))

(declare-fun array_inv!15622 (array!41244) Bool)

(assert (=> start!64916 (array_inv!15622 a!3186)))

(declare-fun b!732856 () Bool)

(declare-fun e!410051 () Bool)

(assert (=> b!732856 (= e!410056 e!410051)))

(declare-fun res!492515 () Bool)

(assert (=> b!732856 (=> (not res!492515) (not e!410051))))

(declare-fun lt!324672 () SeekEntryResult!7336)

(declare-fun lt!324668 () SeekEntryResult!7336)

(assert (=> b!732856 (= res!492515 (= lt!324672 lt!324668))))

(declare-fun lt!324673 () array!41244)

(declare-fun lt!324674 () (_ BitVec 64))

(assert (=> b!732856 (= lt!324668 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324674 lt!324673 mask!3328))))

(assert (=> b!732856 (= lt!324672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324674 mask!3328) lt!324674 lt!324673 mask!3328))))

(assert (=> b!732856 (= lt!324674 (select (store (arr!19739 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732856 (= lt!324673 (array!41245 (store (arr!19739 a!3186) i!1173 k0!2102) (size!20160 a!3186)))))

(declare-fun b!732857 () Bool)

(assert (=> b!732857 (= e!410054 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) lt!324667))))

(declare-fun b!732858 () Bool)

(declare-fun res!492525 () Bool)

(assert (=> b!732858 (=> (not res!492525) (not e!410055))))

(declare-fun arrayContainsKey!0 (array!41244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732858 (= res!492525 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732859 () Bool)

(declare-fun res!492512 () Bool)

(assert (=> b!732859 (=> (not res!492512) (not e!410053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41244 (_ BitVec 32)) Bool)

(assert (=> b!732859 (= res!492512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732860 () Bool)

(assert (=> b!732860 (= e!410054 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) (Found!7336 j!159)))))

(declare-fun b!732861 () Bool)

(assert (=> b!732861 (= e!410049 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!732862 () Bool)

(declare-fun res!492510 () Bool)

(assert (=> b!732862 (=> (not res!492510) (not e!410055))))

(assert (=> b!732862 (= res!492510 (validKeyInArray!0 (select (arr!19739 a!3186) j!159)))))

(declare-fun b!732863 () Bool)

(declare-fun res!492513 () Bool)

(assert (=> b!732863 (=> (not res!492513) (not e!410055))))

(assert (=> b!732863 (= res!492513 (and (= (size!20160 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20160 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20160 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732864 () Bool)

(declare-fun res!492509 () Bool)

(assert (=> b!732864 (=> (not res!492509) (not e!410053))))

(assert (=> b!732864 (= res!492509 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20160 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20160 a!3186))))))

(declare-fun b!732865 () Bool)

(declare-fun res!492511 () Bool)

(assert (=> b!732865 (=> (not res!492511) (not e!410053))))

(declare-datatypes ((List!13780 0))(
  ( (Nil!13777) (Cons!13776 (h!14842 (_ BitVec 64)) (t!20086 List!13780)) )
))
(declare-fun arrayNoDuplicates!0 (array!41244 (_ BitVec 32) List!13780) Bool)

(assert (=> b!732865 (= res!492511 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13777))))

(declare-fun b!732866 () Bool)

(assert (=> b!732866 (= e!410051 (not e!410047))))

(declare-fun res!492519 () Bool)

(assert (=> b!732866 (=> res!492519 e!410047)))

(get-info :version)

(assert (=> b!732866 (= res!492519 (or (not ((_ is Intermediate!7336) lt!324668)) (bvsge x!1131 (x!62713 lt!324668))))))

(assert (=> b!732866 e!410052))

(declare-fun res!492523 () Bool)

(assert (=> b!732866 (=> (not res!492523) (not e!410052))))

(assert (=> b!732866 (= res!492523 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24962 0))(
  ( (Unit!24963) )
))
(declare-fun lt!324666 () Unit!24962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24962)

(assert (=> b!732866 (= lt!324666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64916 res!492521) b!732863))

(assert (= (and b!732863 res!492513) b!732862))

(assert (= (and b!732862 res!492510) b!732854))

(assert (= (and b!732854 res!492524) b!732858))

(assert (= (and b!732858 res!492525) b!732852))

(assert (= (and b!732852 res!492508) b!732859))

(assert (= (and b!732859 res!492512) b!732865))

(assert (= (and b!732865 res!492511) b!732864))

(assert (= (and b!732864 res!492509) b!732850))

(assert (= (and b!732850 res!492514) b!732851))

(assert (= (and b!732851 res!492517) b!732847))

(assert (= (and b!732847 c!80547) b!732857))

(assert (= (and b!732847 (not c!80547)) b!732860))

(assert (= (and b!732847 res!492516) b!732856))

(assert (= (and b!732856 res!492515) b!732866))

(assert (= (and b!732866 res!492523) b!732848))

(assert (= (and b!732848 res!492522) b!732855))

(assert (= (and b!732866 (not res!492519)) b!732853))

(assert (= (and b!732853 (not res!492520)) b!732849))

(assert (= (and b!732849 (not res!492518)) b!732861))

(declare-fun m!685289 () Bool)

(assert (=> b!732852 m!685289))

(declare-fun m!685291 () Bool)

(assert (=> b!732859 m!685291))

(declare-fun m!685293 () Bool)

(assert (=> b!732850 m!685293))

(assert (=> b!732850 m!685293))

(declare-fun m!685295 () Bool)

(assert (=> b!732850 m!685295))

(assert (=> b!732850 m!685295))

(assert (=> b!732850 m!685293))

(declare-fun m!685297 () Bool)

(assert (=> b!732850 m!685297))

(declare-fun m!685299 () Bool)

(assert (=> b!732858 m!685299))

(declare-fun m!685301 () Bool)

(assert (=> b!732856 m!685301))

(declare-fun m!685303 () Bool)

(assert (=> b!732856 m!685303))

(assert (=> b!732856 m!685301))

(declare-fun m!685305 () Bool)

(assert (=> b!732856 m!685305))

(declare-fun m!685307 () Bool)

(assert (=> b!732856 m!685307))

(declare-fun m!685309 () Bool)

(assert (=> b!732856 m!685309))

(declare-fun m!685311 () Bool)

(assert (=> b!732865 m!685311))

(declare-fun m!685313 () Bool)

(assert (=> b!732851 m!685313))

(declare-fun m!685315 () Bool)

(assert (=> b!732854 m!685315))

(declare-fun m!685317 () Bool)

(assert (=> b!732853 m!685317))

(assert (=> b!732849 m!685293))

(assert (=> b!732849 m!685293))

(declare-fun m!685319 () Bool)

(assert (=> b!732849 m!685319))

(assert (=> b!732848 m!685293))

(assert (=> b!732848 m!685293))

(declare-fun m!685321 () Bool)

(assert (=> b!732848 m!685321))

(assert (=> b!732855 m!685293))

(assert (=> b!732855 m!685293))

(declare-fun m!685323 () Bool)

(assert (=> b!732855 m!685323))

(assert (=> b!732862 m!685293))

(assert (=> b!732862 m!685293))

(declare-fun m!685325 () Bool)

(assert (=> b!732862 m!685325))

(declare-fun m!685327 () Bool)

(assert (=> b!732866 m!685327))

(declare-fun m!685329 () Bool)

(assert (=> b!732866 m!685329))

(assert (=> b!732860 m!685293))

(assert (=> b!732860 m!685293))

(assert (=> b!732860 m!685319))

(declare-fun m!685331 () Bool)

(assert (=> start!64916 m!685331))

(declare-fun m!685333 () Bool)

(assert (=> start!64916 m!685333))

(assert (=> b!732857 m!685293))

(assert (=> b!732857 m!685293))

(declare-fun m!685335 () Bool)

(assert (=> b!732857 m!685335))

(check-sat (not b!732849) (not b!732852) (not b!732848) (not b!732859) (not b!732854) (not b!732862) (not b!732850) (not b!732855) (not b!732860) (not b!732853) (not start!64916) (not b!732858) (not b!732857) (not b!732856) (not b!732865) (not b!732866))
(check-sat)
