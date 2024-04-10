; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66256 () Bool)

(assert start!66256)

(declare-fun b!763301 () Bool)

(declare-fun res!516294 () Bool)

(declare-fun e!425316 () Bool)

(assert (=> b!763301 (=> (not res!516294) (not e!425316))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42161 0))(
  ( (array!42162 (arr!20188 (Array (_ BitVec 32) (_ BitVec 64))) (size!20609 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42161)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763301 (= res!516294 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20609 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20609 a!3186))))))

(declare-fun res!516298 () Bool)

(declare-fun e!425315 () Bool)

(assert (=> start!66256 (=> (not res!516298) (not e!425315))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66256 (= res!516298 (validMask!0 mask!3328))))

(assert (=> start!66256 e!425315))

(assert (=> start!66256 true))

(declare-fun array_inv!15984 (array!42161) Bool)

(assert (=> start!66256 (array_inv!15984 a!3186)))

(declare-fun e!425318 () Bool)

(declare-fun b!763302 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7788 0))(
  ( (MissingZero!7788 (index!33520 (_ BitVec 32))) (Found!7788 (index!33521 (_ BitVec 32))) (Intermediate!7788 (undefined!8600 Bool) (index!33522 (_ BitVec 32)) (x!64424 (_ BitVec 32))) (Undefined!7788) (MissingVacant!7788 (index!33523 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42161 (_ BitVec 32)) SeekEntryResult!7788)

(assert (=> b!763302 (= e!425318 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20188 a!3186) j!159) a!3186 mask!3328) (Found!7788 j!159))))))

(declare-fun lt!339766 () SeekEntryResult!7788)

(declare-fun b!763303 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42161 (_ BitVec 32)) SeekEntryResult!7788)

(assert (=> b!763303 (= e!425318 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20188 a!3186) j!159) a!3186 mask!3328) lt!339766)))))

(declare-fun b!763304 () Bool)

(declare-fun e!425317 () Bool)

(assert (=> b!763304 (= e!425317 false)))

(declare-fun lt!339765 () Bool)

(assert (=> b!763304 (= lt!339765 e!425318)))

(declare-fun c!83890 () Bool)

(assert (=> b!763304 (= c!83890 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763305 () Bool)

(declare-fun res!516297 () Bool)

(assert (=> b!763305 (=> (not res!516297) (not e!425315))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763305 (= res!516297 (validKeyInArray!0 k0!2102))))

(declare-fun b!763306 () Bool)

(declare-fun res!516299 () Bool)

(assert (=> b!763306 (=> (not res!516299) (not e!425316))))

(declare-datatypes ((List!14190 0))(
  ( (Nil!14187) (Cons!14186 (h!15270 (_ BitVec 64)) (t!20505 List!14190)) )
))
(declare-fun arrayNoDuplicates!0 (array!42161 (_ BitVec 32) List!14190) Bool)

(assert (=> b!763306 (= res!516299 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14187))))

(declare-fun b!763307 () Bool)

(declare-fun res!516303 () Bool)

(assert (=> b!763307 (=> (not res!516303) (not e!425317))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763307 (= res!516303 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20188 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763308 () Bool)

(declare-fun res!516301 () Bool)

(assert (=> b!763308 (=> (not res!516301) (not e!425315))))

(assert (=> b!763308 (= res!516301 (validKeyInArray!0 (select (arr!20188 a!3186) j!159)))))

(declare-fun b!763309 () Bool)

(declare-fun res!516300 () Bool)

(assert (=> b!763309 (=> (not res!516300) (not e!425315))))

(assert (=> b!763309 (= res!516300 (and (= (size!20609 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20609 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20609 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763310 () Bool)

(declare-fun res!516304 () Bool)

(assert (=> b!763310 (=> (not res!516304) (not e!425316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42161 (_ BitVec 32)) Bool)

(assert (=> b!763310 (= res!516304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763311 () Bool)

(assert (=> b!763311 (= e!425315 e!425316)))

(declare-fun res!516295 () Bool)

(assert (=> b!763311 (=> (not res!516295) (not e!425316))))

(declare-fun lt!339767 () SeekEntryResult!7788)

(assert (=> b!763311 (= res!516295 (or (= lt!339767 (MissingZero!7788 i!1173)) (= lt!339767 (MissingVacant!7788 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42161 (_ BitVec 32)) SeekEntryResult!7788)

(assert (=> b!763311 (= lt!339767 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763312 () Bool)

(assert (=> b!763312 (= e!425316 e!425317)))

(declare-fun res!516296 () Bool)

(assert (=> b!763312 (=> (not res!516296) (not e!425317))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763312 (= res!516296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20188 a!3186) j!159) mask!3328) (select (arr!20188 a!3186) j!159) a!3186 mask!3328) lt!339766))))

(assert (=> b!763312 (= lt!339766 (Intermediate!7788 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763313 () Bool)

(declare-fun res!516302 () Bool)

(assert (=> b!763313 (=> (not res!516302) (not e!425315))))

(declare-fun arrayContainsKey!0 (array!42161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763313 (= res!516302 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66256 res!516298) b!763309))

(assert (= (and b!763309 res!516300) b!763308))

(assert (= (and b!763308 res!516301) b!763305))

(assert (= (and b!763305 res!516297) b!763313))

(assert (= (and b!763313 res!516302) b!763311))

(assert (= (and b!763311 res!516295) b!763310))

(assert (= (and b!763310 res!516304) b!763306))

(assert (= (and b!763306 res!516299) b!763301))

(assert (= (and b!763301 res!516294) b!763312))

(assert (= (and b!763312 res!516296) b!763307))

(assert (= (and b!763307 res!516303) b!763304))

(assert (= (and b!763304 c!83890) b!763303))

(assert (= (and b!763304 (not c!83890)) b!763302))

(declare-fun m!709831 () Bool)

(assert (=> start!66256 m!709831))

(declare-fun m!709833 () Bool)

(assert (=> start!66256 m!709833))

(declare-fun m!709835 () Bool)

(assert (=> b!763312 m!709835))

(assert (=> b!763312 m!709835))

(declare-fun m!709837 () Bool)

(assert (=> b!763312 m!709837))

(assert (=> b!763312 m!709837))

(assert (=> b!763312 m!709835))

(declare-fun m!709839 () Bool)

(assert (=> b!763312 m!709839))

(declare-fun m!709841 () Bool)

(assert (=> b!763311 m!709841))

(declare-fun m!709843 () Bool)

(assert (=> b!763313 m!709843))

(declare-fun m!709845 () Bool)

(assert (=> b!763306 m!709845))

(declare-fun m!709847 () Bool)

(assert (=> b!763305 m!709847))

(assert (=> b!763308 m!709835))

(assert (=> b!763308 m!709835))

(declare-fun m!709849 () Bool)

(assert (=> b!763308 m!709849))

(declare-fun m!709851 () Bool)

(assert (=> b!763307 m!709851))

(assert (=> b!763302 m!709835))

(assert (=> b!763302 m!709835))

(declare-fun m!709853 () Bool)

(assert (=> b!763302 m!709853))

(declare-fun m!709855 () Bool)

(assert (=> b!763310 m!709855))

(assert (=> b!763303 m!709835))

(assert (=> b!763303 m!709835))

(declare-fun m!709857 () Bool)

(assert (=> b!763303 m!709857))

(check-sat (not b!763313) (not b!763312) (not b!763308) (not b!763305) (not b!763302) (not b!763311) (not b!763303) (not b!763310) (not b!763306) (not start!66256))
(check-sat)
