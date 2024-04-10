; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66252 () Bool)

(assert start!66252)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42157 0))(
  ( (array!42158 (arr!20186 (Array (_ BitVec 32) (_ BitVec 64))) (size!20607 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42157)

(declare-fun e!425286 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!763222 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7786 0))(
  ( (MissingZero!7786 (index!33512 (_ BitVec 32))) (Found!7786 (index!33513 (_ BitVec 32))) (Intermediate!7786 (undefined!8598 Bool) (index!33514 (_ BitVec 32)) (x!64414 (_ BitVec 32))) (Undefined!7786) (MissingVacant!7786 (index!33515 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42157 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!763222 (= e!425286 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20186 a!3186) j!159) a!3186 mask!3328) (Found!7786 j!159)))))

(declare-fun b!763223 () Bool)

(declare-fun res!516230 () Bool)

(declare-fun e!425287 () Bool)

(assert (=> b!763223 (=> (not res!516230) (not e!425287))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763223 (= res!516230 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20607 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20607 a!3186))))))

(declare-fun b!763224 () Bool)

(declare-fun e!425289 () Bool)

(assert (=> b!763224 (= e!425289 false)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!339747 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763224 (= lt!339747 (toIndex!0 (select (store (arr!20186 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!763225 () Bool)

(declare-fun res!516234 () Bool)

(declare-fun e!425288 () Bool)

(assert (=> b!763225 (=> (not res!516234) (not e!425288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763225 (= res!516234 (validKeyInArray!0 k!2102))))

(declare-fun b!763226 () Bool)

(declare-fun res!516236 () Bool)

(assert (=> b!763226 (=> (not res!516236) (not e!425287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42157 (_ BitVec 32)) Bool)

(assert (=> b!763226 (= res!516236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!339749 () SeekEntryResult!7786)

(declare-fun b!763227 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42157 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!763227 (= e!425286 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20186 a!3186) j!159) a!3186 mask!3328) lt!339749))))

(declare-fun res!516229 () Bool)

(assert (=> start!66252 (=> (not res!516229) (not e!425288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66252 (= res!516229 (validMask!0 mask!3328))))

(assert (=> start!66252 e!425288))

(assert (=> start!66252 true))

(declare-fun array_inv!15982 (array!42157) Bool)

(assert (=> start!66252 (array_inv!15982 a!3186)))

(declare-fun b!763228 () Bool)

(declare-fun res!516235 () Bool)

(assert (=> b!763228 (=> (not res!516235) (not e!425289))))

(assert (=> b!763228 (= res!516235 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20186 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763229 () Bool)

(assert (=> b!763229 (= e!425287 e!425289)))

(declare-fun res!516232 () Bool)

(assert (=> b!763229 (=> (not res!516232) (not e!425289))))

(assert (=> b!763229 (= res!516232 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20186 a!3186) j!159) mask!3328) (select (arr!20186 a!3186) j!159) a!3186 mask!3328) lt!339749))))

(assert (=> b!763229 (= lt!339749 (Intermediate!7786 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763230 () Bool)

(declare-fun res!516237 () Bool)

(assert (=> b!763230 (=> (not res!516237) (not e!425288))))

(declare-fun arrayContainsKey!0 (array!42157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763230 (= res!516237 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763231 () Bool)

(declare-fun res!516227 () Bool)

(assert (=> b!763231 (=> (not res!516227) (not e!425289))))

(assert (=> b!763231 (= res!516227 e!425286)))

(declare-fun c!83884 () Bool)

(assert (=> b!763231 (= c!83884 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763232 () Bool)

(declare-fun res!516238 () Bool)

(assert (=> b!763232 (=> (not res!516238) (not e!425287))))

(declare-datatypes ((List!14188 0))(
  ( (Nil!14185) (Cons!14184 (h!15268 (_ BitVec 64)) (t!20503 List!14188)) )
))
(declare-fun arrayNoDuplicates!0 (array!42157 (_ BitVec 32) List!14188) Bool)

(assert (=> b!763232 (= res!516238 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14185))))

(declare-fun b!763233 () Bool)

(declare-fun res!516228 () Bool)

(assert (=> b!763233 (=> (not res!516228) (not e!425288))))

(assert (=> b!763233 (= res!516228 (and (= (size!20607 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20607 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20607 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763234 () Bool)

(assert (=> b!763234 (= e!425288 e!425287)))

(declare-fun res!516233 () Bool)

(assert (=> b!763234 (=> (not res!516233) (not e!425287))))

(declare-fun lt!339748 () SeekEntryResult!7786)

(assert (=> b!763234 (= res!516233 (or (= lt!339748 (MissingZero!7786 i!1173)) (= lt!339748 (MissingVacant!7786 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42157 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!763234 (= lt!339748 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763235 () Bool)

(declare-fun res!516231 () Bool)

(assert (=> b!763235 (=> (not res!516231) (not e!425288))))

(assert (=> b!763235 (= res!516231 (validKeyInArray!0 (select (arr!20186 a!3186) j!159)))))

(assert (= (and start!66252 res!516229) b!763233))

(assert (= (and b!763233 res!516228) b!763235))

(assert (= (and b!763235 res!516231) b!763225))

(assert (= (and b!763225 res!516234) b!763230))

(assert (= (and b!763230 res!516237) b!763234))

(assert (= (and b!763234 res!516233) b!763226))

(assert (= (and b!763226 res!516236) b!763232))

(assert (= (and b!763232 res!516238) b!763223))

(assert (= (and b!763223 res!516230) b!763229))

(assert (= (and b!763229 res!516232) b!763228))

(assert (= (and b!763228 res!516235) b!763231))

(assert (= (and b!763231 c!83884) b!763227))

(assert (= (and b!763231 (not c!83884)) b!763222))

(assert (= (and b!763231 res!516227) b!763224))

(declare-fun m!709769 () Bool)

(assert (=> b!763222 m!709769))

(assert (=> b!763222 m!709769))

(declare-fun m!709771 () Bool)

(assert (=> b!763222 m!709771))

(declare-fun m!709773 () Bool)

(assert (=> b!763224 m!709773))

(declare-fun m!709775 () Bool)

(assert (=> b!763224 m!709775))

(assert (=> b!763224 m!709775))

(declare-fun m!709777 () Bool)

(assert (=> b!763224 m!709777))

(declare-fun m!709779 () Bool)

(assert (=> b!763232 m!709779))

(assert (=> b!763227 m!709769))

(assert (=> b!763227 m!709769))

(declare-fun m!709781 () Bool)

(assert (=> b!763227 m!709781))

(declare-fun m!709783 () Bool)

(assert (=> b!763225 m!709783))

(declare-fun m!709785 () Bool)

(assert (=> b!763230 m!709785))

(assert (=> b!763235 m!709769))

(assert (=> b!763235 m!709769))

(declare-fun m!709787 () Bool)

(assert (=> b!763235 m!709787))

(assert (=> b!763229 m!709769))

(assert (=> b!763229 m!709769))

(declare-fun m!709789 () Bool)

(assert (=> b!763229 m!709789))

(assert (=> b!763229 m!709789))

(assert (=> b!763229 m!709769))

(declare-fun m!709791 () Bool)

(assert (=> b!763229 m!709791))

(declare-fun m!709793 () Bool)

(assert (=> b!763226 m!709793))

(declare-fun m!709795 () Bool)

(assert (=> b!763228 m!709795))

(declare-fun m!709797 () Bool)

(assert (=> b!763234 m!709797))

(declare-fun m!709799 () Bool)

(assert (=> start!66252 m!709799))

(declare-fun m!709801 () Bool)

(assert (=> start!66252 m!709801))

(push 1)

