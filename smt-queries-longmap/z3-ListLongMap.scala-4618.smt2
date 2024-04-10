; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64344 () Bool)

(assert start!64344)

(declare-datatypes ((array!40925 0))(
  ( (array!40926 (arr!19585 (Array (_ BitVec 32) (_ BitVec 64))) (size!20006 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40925)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7185 0))(
  ( (MissingZero!7185 (index!31108 (_ BitVec 32))) (Found!7185 (index!31109 (_ BitVec 32))) (Intermediate!7185 (undefined!7997 Bool) (index!31110 (_ BitVec 32)) (x!62106 (_ BitVec 32))) (Undefined!7185) (MissingVacant!7185 (index!31111 (_ BitVec 32))) )
))
(declare-fun lt!320608 () SeekEntryResult!7185)

(declare-fun e!405229 () Bool)

(declare-fun b!723247 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40925 (_ BitVec 32)) SeekEntryResult!7185)

(assert (=> b!723247 (= e!405229 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19585 a!3186) j!159) a!3186 mask!3328) lt!320608))))

(declare-fun res!484855 () Bool)

(declare-fun e!405225 () Bool)

(assert (=> start!64344 (=> (not res!484855) (not e!405225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64344 (= res!484855 (validMask!0 mask!3328))))

(assert (=> start!64344 e!405225))

(assert (=> start!64344 true))

(declare-fun array_inv!15381 (array!40925) Bool)

(assert (=> start!64344 (array_inv!15381 a!3186)))

(declare-fun b!723248 () Bool)

(declare-fun res!484847 () Bool)

(assert (=> b!723248 (=> (not res!484847) (not e!405225))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723248 (= res!484847 (and (= (size!20006 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20006 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20006 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723249 () Bool)

(declare-fun e!405227 () Bool)

(assert (=> b!723249 (= e!405227 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40925 (_ BitVec 32)) Bool)

(assert (=> b!723249 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24688 0))(
  ( (Unit!24689) )
))
(declare-fun lt!320607 () Unit!24688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24688)

(assert (=> b!723249 (= lt!320607 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723250 () Bool)

(declare-fun res!484854 () Bool)

(declare-fun e!405228 () Bool)

(assert (=> b!723250 (=> (not res!484854) (not e!405228))))

(assert (=> b!723250 (= res!484854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723251 () Bool)

(declare-fun res!484849 () Bool)

(assert (=> b!723251 (=> (not res!484849) (not e!405225))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723251 (= res!484849 (validKeyInArray!0 k0!2102))))

(declare-fun b!723252 () Bool)

(declare-fun res!484845 () Bool)

(declare-fun e!405230 () Bool)

(assert (=> b!723252 (=> (not res!484845) (not e!405230))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723252 (= res!484845 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19585 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723253 () Bool)

(declare-fun res!484851 () Bool)

(assert (=> b!723253 (=> (not res!484851) (not e!405228))))

(declare-datatypes ((List!13587 0))(
  ( (Nil!13584) (Cons!13583 (h!14637 (_ BitVec 64)) (t!19902 List!13587)) )
))
(declare-fun arrayNoDuplicates!0 (array!40925 (_ BitVec 32) List!13587) Bool)

(assert (=> b!723253 (= res!484851 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13584))))

(declare-fun b!723254 () Bool)

(declare-fun res!484853 () Bool)

(assert (=> b!723254 (=> (not res!484853) (not e!405228))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723254 (= res!484853 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20006 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20006 a!3186))))))

(declare-fun b!723255 () Bool)

(declare-fun res!484848 () Bool)

(assert (=> b!723255 (=> (not res!484848) (not e!405225))))

(declare-fun arrayContainsKey!0 (array!40925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723255 (= res!484848 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723256 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40925 (_ BitVec 32)) SeekEntryResult!7185)

(assert (=> b!723256 (= e!405229 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19585 a!3186) j!159) a!3186 mask!3328) (Found!7185 j!159)))))

(declare-fun b!723257 () Bool)

(assert (=> b!723257 (= e!405230 e!405227)))

(declare-fun res!484850 () Bool)

(assert (=> b!723257 (=> (not res!484850) (not e!405227))))

(declare-fun lt!320606 () array!40925)

(declare-fun lt!320609 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723257 (= res!484850 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320609 mask!3328) lt!320609 lt!320606 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320609 lt!320606 mask!3328)))))

(assert (=> b!723257 (= lt!320609 (select (store (arr!19585 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723257 (= lt!320606 (array!40926 (store (arr!19585 a!3186) i!1173 k0!2102) (size!20006 a!3186)))))

(declare-fun b!723258 () Bool)

(declare-fun res!484856 () Bool)

(assert (=> b!723258 (=> (not res!484856) (not e!405225))))

(assert (=> b!723258 (= res!484856 (validKeyInArray!0 (select (arr!19585 a!3186) j!159)))))

(declare-fun b!723259 () Bool)

(assert (=> b!723259 (= e!405228 e!405230)))

(declare-fun res!484844 () Bool)

(assert (=> b!723259 (=> (not res!484844) (not e!405230))))

(assert (=> b!723259 (= res!484844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19585 a!3186) j!159) mask!3328) (select (arr!19585 a!3186) j!159) a!3186 mask!3328) lt!320608))))

(assert (=> b!723259 (= lt!320608 (Intermediate!7185 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723260 () Bool)

(assert (=> b!723260 (= e!405225 e!405228)))

(declare-fun res!484852 () Bool)

(assert (=> b!723260 (=> (not res!484852) (not e!405228))))

(declare-fun lt!320605 () SeekEntryResult!7185)

(assert (=> b!723260 (= res!484852 (or (= lt!320605 (MissingZero!7185 i!1173)) (= lt!320605 (MissingVacant!7185 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40925 (_ BitVec 32)) SeekEntryResult!7185)

(assert (=> b!723260 (= lt!320605 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723261 () Bool)

(declare-fun res!484846 () Bool)

(assert (=> b!723261 (=> (not res!484846) (not e!405230))))

(assert (=> b!723261 (= res!484846 e!405229)))

(declare-fun c!79573 () Bool)

(assert (=> b!723261 (= c!79573 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64344 res!484855) b!723248))

(assert (= (and b!723248 res!484847) b!723258))

(assert (= (and b!723258 res!484856) b!723251))

(assert (= (and b!723251 res!484849) b!723255))

(assert (= (and b!723255 res!484848) b!723260))

(assert (= (and b!723260 res!484852) b!723250))

(assert (= (and b!723250 res!484854) b!723253))

(assert (= (and b!723253 res!484851) b!723254))

(assert (= (and b!723254 res!484853) b!723259))

(assert (= (and b!723259 res!484844) b!723252))

(assert (= (and b!723252 res!484845) b!723261))

(assert (= (and b!723261 c!79573) b!723247))

(assert (= (and b!723261 (not c!79573)) b!723256))

(assert (= (and b!723261 res!484846) b!723257))

(assert (= (and b!723257 res!484850) b!723249))

(declare-fun m!677701 () Bool)

(assert (=> b!723253 m!677701))

(declare-fun m!677703 () Bool)

(assert (=> b!723247 m!677703))

(assert (=> b!723247 m!677703))

(declare-fun m!677705 () Bool)

(assert (=> b!723247 m!677705))

(declare-fun m!677707 () Bool)

(assert (=> b!723255 m!677707))

(assert (=> b!723256 m!677703))

(assert (=> b!723256 m!677703))

(declare-fun m!677709 () Bool)

(assert (=> b!723256 m!677709))

(assert (=> b!723259 m!677703))

(assert (=> b!723259 m!677703))

(declare-fun m!677711 () Bool)

(assert (=> b!723259 m!677711))

(assert (=> b!723259 m!677711))

(assert (=> b!723259 m!677703))

(declare-fun m!677713 () Bool)

(assert (=> b!723259 m!677713))

(declare-fun m!677715 () Bool)

(assert (=> b!723257 m!677715))

(declare-fun m!677717 () Bool)

(assert (=> b!723257 m!677717))

(declare-fun m!677719 () Bool)

(assert (=> b!723257 m!677719))

(declare-fun m!677721 () Bool)

(assert (=> b!723257 m!677721))

(assert (=> b!723257 m!677719))

(declare-fun m!677723 () Bool)

(assert (=> b!723257 m!677723))

(assert (=> b!723258 m!677703))

(assert (=> b!723258 m!677703))

(declare-fun m!677725 () Bool)

(assert (=> b!723258 m!677725))

(declare-fun m!677727 () Bool)

(assert (=> b!723250 m!677727))

(declare-fun m!677729 () Bool)

(assert (=> b!723260 m!677729))

(declare-fun m!677731 () Bool)

(assert (=> b!723251 m!677731))

(declare-fun m!677733 () Bool)

(assert (=> b!723249 m!677733))

(declare-fun m!677735 () Bool)

(assert (=> b!723249 m!677735))

(declare-fun m!677737 () Bool)

(assert (=> b!723252 m!677737))

(declare-fun m!677739 () Bool)

(assert (=> start!64344 m!677739))

(declare-fun m!677741 () Bool)

(assert (=> start!64344 m!677741))

(check-sat (not b!723251) (not b!723258) (not b!723257) (not b!723247) (not b!723250) (not b!723253) (not b!723255) (not b!723249) (not start!64344) (not b!723259) (not b!723260) (not b!723256))
(check-sat)
