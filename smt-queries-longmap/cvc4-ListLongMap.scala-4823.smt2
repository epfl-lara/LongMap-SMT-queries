; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66282 () Bool)

(assert start!66282)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42187 0))(
  ( (array!42188 (arr!20201 (Array (_ BitVec 32) (_ BitVec 64))) (size!20622 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42187)

(declare-fun e!425510 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!763834 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7801 0))(
  ( (MissingZero!7801 (index!33572 (_ BitVec 32))) (Found!7801 (index!33573 (_ BitVec 32))) (Intermediate!7801 (undefined!8613 Bool) (index!33574 (_ BitVec 32)) (x!64469 (_ BitVec 32))) (Undefined!7801) (MissingVacant!7801 (index!33575 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42187 (_ BitVec 32)) SeekEntryResult!7801)

(assert (=> b!763834 (= e!425510 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20201 a!3186) j!159) a!3186 mask!3328) (Found!7801 j!159)))))

(declare-fun res!516759 () Bool)

(declare-fun e!425513 () Bool)

(assert (=> start!66282 (=> (not res!516759) (not e!425513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66282 (= res!516759 (validMask!0 mask!3328))))

(assert (=> start!66282 e!425513))

(assert (=> start!66282 true))

(declare-fun array_inv!15997 (array!42187) Bool)

(assert (=> start!66282 (array_inv!15997 a!3186)))

(declare-fun b!763835 () Bool)

(declare-fun e!425512 () Bool)

(assert (=> b!763835 (= e!425512 false)))

(declare-fun lt!339961 () SeekEntryResult!7801)

(declare-fun lt!339960 () (_ BitVec 64))

(declare-fun lt!339963 () array!42187)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42187 (_ BitVec 32)) SeekEntryResult!7801)

(assert (=> b!763835 (= lt!339961 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339960 lt!339963 mask!3328))))

(declare-fun lt!339965 () SeekEntryResult!7801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763835 (= lt!339965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339960 mask!3328) lt!339960 lt!339963 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!763835 (= lt!339960 (select (store (arr!20201 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!763835 (= lt!339963 (array!42188 (store (arr!20201 a!3186) i!1173 k!2102) (size!20622 a!3186)))))

(declare-fun b!763836 () Bool)

(declare-fun res!516752 () Bool)

(declare-fun e!425511 () Bool)

(assert (=> b!763836 (=> (not res!516752) (not e!425511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42187 (_ BitVec 32)) Bool)

(assert (=> b!763836 (= res!516752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763837 () Bool)

(declare-fun res!516751 () Bool)

(assert (=> b!763837 (=> (not res!516751) (not e!425512))))

(assert (=> b!763837 (= res!516751 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20201 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!339964 () SeekEntryResult!7801)

(declare-fun b!763838 () Bool)

(assert (=> b!763838 (= e!425510 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20201 a!3186) j!159) a!3186 mask!3328) lt!339964))))

(declare-fun b!763839 () Bool)

(declare-fun res!516758 () Bool)

(assert (=> b!763839 (=> (not res!516758) (not e!425513))))

(declare-fun arrayContainsKey!0 (array!42187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763839 (= res!516758 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763840 () Bool)

(assert (=> b!763840 (= e!425511 e!425512)))

(declare-fun res!516760 () Bool)

(assert (=> b!763840 (=> (not res!516760) (not e!425512))))

(assert (=> b!763840 (= res!516760 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20201 a!3186) j!159) mask!3328) (select (arr!20201 a!3186) j!159) a!3186 mask!3328) lt!339964))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763840 (= lt!339964 (Intermediate!7801 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763841 () Bool)

(declare-fun res!516755 () Bool)

(assert (=> b!763841 (=> (not res!516755) (not e!425513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763841 (= res!516755 (validKeyInArray!0 k!2102))))

(declare-fun b!763842 () Bool)

(declare-fun res!516750 () Bool)

(assert (=> b!763842 (=> (not res!516750) (not e!425511))))

(assert (=> b!763842 (= res!516750 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20622 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20622 a!3186))))))

(declare-fun b!763843 () Bool)

(declare-fun res!516754 () Bool)

(assert (=> b!763843 (=> (not res!516754) (not e!425513))))

(assert (=> b!763843 (= res!516754 (validKeyInArray!0 (select (arr!20201 a!3186) j!159)))))

(declare-fun b!763844 () Bool)

(declare-fun res!516749 () Bool)

(assert (=> b!763844 (=> (not res!516749) (not e!425512))))

(assert (=> b!763844 (= res!516749 e!425510)))

(declare-fun c!83929 () Bool)

(assert (=> b!763844 (= c!83929 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763845 () Bool)

(declare-fun res!516756 () Bool)

(assert (=> b!763845 (=> (not res!516756) (not e!425513))))

(assert (=> b!763845 (= res!516756 (and (= (size!20622 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20622 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20622 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763846 () Bool)

(assert (=> b!763846 (= e!425513 e!425511)))

(declare-fun res!516757 () Bool)

(assert (=> b!763846 (=> (not res!516757) (not e!425511))))

(declare-fun lt!339962 () SeekEntryResult!7801)

(assert (=> b!763846 (= res!516757 (or (= lt!339962 (MissingZero!7801 i!1173)) (= lt!339962 (MissingVacant!7801 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42187 (_ BitVec 32)) SeekEntryResult!7801)

(assert (=> b!763846 (= lt!339962 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763847 () Bool)

(declare-fun res!516753 () Bool)

(assert (=> b!763847 (=> (not res!516753) (not e!425511))))

(declare-datatypes ((List!14203 0))(
  ( (Nil!14200) (Cons!14199 (h!15283 (_ BitVec 64)) (t!20518 List!14203)) )
))
(declare-fun arrayNoDuplicates!0 (array!42187 (_ BitVec 32) List!14203) Bool)

(assert (=> b!763847 (= res!516753 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14200))))

(assert (= (and start!66282 res!516759) b!763845))

(assert (= (and b!763845 res!516756) b!763843))

(assert (= (and b!763843 res!516754) b!763841))

(assert (= (and b!763841 res!516755) b!763839))

(assert (= (and b!763839 res!516758) b!763846))

(assert (= (and b!763846 res!516757) b!763836))

(assert (= (and b!763836 res!516752) b!763847))

(assert (= (and b!763847 res!516753) b!763842))

(assert (= (and b!763842 res!516750) b!763840))

(assert (= (and b!763840 res!516760) b!763837))

(assert (= (and b!763837 res!516751) b!763844))

(assert (= (and b!763844 c!83929) b!763838))

(assert (= (and b!763844 (not c!83929)) b!763834))

(assert (= (and b!763844 res!516749) b!763835))

(declare-fun m!710275 () Bool)

(assert (=> b!763836 m!710275))

(declare-fun m!710277 () Bool)

(assert (=> b!763838 m!710277))

(assert (=> b!763838 m!710277))

(declare-fun m!710279 () Bool)

(assert (=> b!763838 m!710279))

(declare-fun m!710281 () Bool)

(assert (=> b!763846 m!710281))

(assert (=> b!763840 m!710277))

(assert (=> b!763840 m!710277))

(declare-fun m!710283 () Bool)

(assert (=> b!763840 m!710283))

(assert (=> b!763840 m!710283))

(assert (=> b!763840 m!710277))

(declare-fun m!710285 () Bool)

(assert (=> b!763840 m!710285))

(declare-fun m!710287 () Bool)

(assert (=> b!763837 m!710287))

(declare-fun m!710289 () Bool)

(assert (=> start!66282 m!710289))

(declare-fun m!710291 () Bool)

(assert (=> start!66282 m!710291))

(declare-fun m!710293 () Bool)

(assert (=> b!763847 m!710293))

(assert (=> b!763834 m!710277))

(assert (=> b!763834 m!710277))

(declare-fun m!710295 () Bool)

(assert (=> b!763834 m!710295))

(declare-fun m!710297 () Bool)

(assert (=> b!763835 m!710297))

(declare-fun m!710299 () Bool)

(assert (=> b!763835 m!710299))

(declare-fun m!710301 () Bool)

(assert (=> b!763835 m!710301))

(declare-fun m!710303 () Bool)

(assert (=> b!763835 m!710303))

(declare-fun m!710305 () Bool)

(assert (=> b!763835 m!710305))

(assert (=> b!763835 m!710297))

(assert (=> b!763843 m!710277))

(assert (=> b!763843 m!710277))

(declare-fun m!710307 () Bool)

(assert (=> b!763843 m!710307))

(declare-fun m!710309 () Bool)

(assert (=> b!763839 m!710309))

(declare-fun m!710311 () Bool)

(assert (=> b!763841 m!710311))

(push 1)

(assert (not b!763841))

(assert (not b!763838))

(assert (not b!763846))

(assert (not b!763834))

