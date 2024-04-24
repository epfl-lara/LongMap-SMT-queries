; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64122 () Bool)

(assert start!64122)

(declare-fun res!482028 () Bool)

(declare-fun e!403930 () Bool)

(assert (=> start!64122 (=> (not res!482028) (not e!403930))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64122 (= res!482028 (validMask!0 mask!3328))))

(assert (=> start!64122 e!403930))

(assert (=> start!64122 true))

(declare-datatypes ((array!40750 0))(
  ( (array!40751 (arr!19498 (Array (_ BitVec 32) (_ BitVec 64))) (size!19918 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40750)

(declare-fun array_inv!15357 (array!40750) Bool)

(assert (=> start!64122 (array_inv!15357 a!3186)))

(declare-fun b!719776 () Bool)

(declare-fun res!482021 () Bool)

(declare-fun e!403932 () Bool)

(assert (=> b!719776 (=> (not res!482021) (not e!403932))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7054 0))(
  ( (MissingZero!7054 (index!30584 (_ BitVec 32))) (Found!7054 (index!30585 (_ BitVec 32))) (Intermediate!7054 (undefined!7866 Bool) (index!30586 (_ BitVec 32)) (x!61744 (_ BitVec 32))) (Undefined!7054) (MissingVacant!7054 (index!30587 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40750 (_ BitVec 32)) SeekEntryResult!7054)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719776 (= res!482021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19498 a!3186) j!159) mask!3328) (select (arr!19498 a!3186) j!159) a!3186 mask!3328) (Intermediate!7054 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719777 () Bool)

(declare-fun res!482020 () Bool)

(assert (=> b!719777 (=> (not res!482020) (not e!403932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40750 (_ BitVec 32)) Bool)

(assert (=> b!719777 (= res!482020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719778 () Bool)

(declare-fun res!482026 () Bool)

(assert (=> b!719778 (=> (not res!482026) (not e!403930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719778 (= res!482026 (validKeyInArray!0 (select (arr!19498 a!3186) j!159)))))

(declare-fun b!719779 () Bool)

(declare-fun res!482027 () Bool)

(assert (=> b!719779 (=> (not res!482027) (not e!403930))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!719779 (= res!482027 (validKeyInArray!0 k0!2102))))

(declare-fun b!719780 () Bool)

(declare-fun res!482029 () Bool)

(assert (=> b!719780 (=> (not res!482029) (not e!403932))))

(declare-datatypes ((List!13407 0))(
  ( (Nil!13404) (Cons!13403 (h!14454 (_ BitVec 64)) (t!19714 List!13407)) )
))
(declare-fun arrayNoDuplicates!0 (array!40750 (_ BitVec 32) List!13407) Bool)

(assert (=> b!719780 (= res!482029 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13404))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun b!719781 () Bool)

(assert (=> b!719781 (= e!403932 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19498 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!719782 () Bool)

(declare-fun res!482022 () Bool)

(assert (=> b!719782 (=> (not res!482022) (not e!403930))))

(declare-fun arrayContainsKey!0 (array!40750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719782 (= res!482022 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719783 () Bool)

(declare-fun res!482024 () Bool)

(assert (=> b!719783 (=> (not res!482024) (not e!403930))))

(assert (=> b!719783 (= res!482024 (and (= (size!19918 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19918 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19918 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719784 () Bool)

(declare-fun res!482023 () Bool)

(assert (=> b!719784 (=> (not res!482023) (not e!403932))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719784 (= res!482023 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19918 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19918 a!3186))))))

(declare-fun b!719785 () Bool)

(assert (=> b!719785 (= e!403930 e!403932)))

(declare-fun res!482025 () Bool)

(assert (=> b!719785 (=> (not res!482025) (not e!403932))))

(declare-fun lt!319731 () SeekEntryResult!7054)

(assert (=> b!719785 (= res!482025 (or (= lt!319731 (MissingZero!7054 i!1173)) (= lt!319731 (MissingVacant!7054 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40750 (_ BitVec 32)) SeekEntryResult!7054)

(assert (=> b!719785 (= lt!319731 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64122 res!482028) b!719783))

(assert (= (and b!719783 res!482024) b!719778))

(assert (= (and b!719778 res!482026) b!719779))

(assert (= (and b!719779 res!482027) b!719782))

(assert (= (and b!719782 res!482022) b!719785))

(assert (= (and b!719785 res!482025) b!719777))

(assert (= (and b!719777 res!482020) b!719780))

(assert (= (and b!719780 res!482029) b!719784))

(assert (= (and b!719784 res!482023) b!719776))

(assert (= (and b!719776 res!482021) b!719781))

(declare-fun m!675699 () Bool)

(assert (=> b!719785 m!675699))

(declare-fun m!675701 () Bool)

(assert (=> b!719780 m!675701))

(declare-fun m!675703 () Bool)

(assert (=> b!719782 m!675703))

(declare-fun m!675705 () Bool)

(assert (=> b!719776 m!675705))

(assert (=> b!719776 m!675705))

(declare-fun m!675707 () Bool)

(assert (=> b!719776 m!675707))

(assert (=> b!719776 m!675707))

(assert (=> b!719776 m!675705))

(declare-fun m!675709 () Bool)

(assert (=> b!719776 m!675709))

(declare-fun m!675711 () Bool)

(assert (=> start!64122 m!675711))

(declare-fun m!675713 () Bool)

(assert (=> start!64122 m!675713))

(declare-fun m!675715 () Bool)

(assert (=> b!719779 m!675715))

(declare-fun m!675717 () Bool)

(assert (=> b!719777 m!675717))

(assert (=> b!719778 m!675705))

(assert (=> b!719778 m!675705))

(declare-fun m!675719 () Bool)

(assert (=> b!719778 m!675719))

(declare-fun m!675721 () Bool)

(assert (=> b!719781 m!675721))

(check-sat (not start!64122) (not b!719778) (not b!719785) (not b!719777) (not b!719780) (not b!719779) (not b!719782) (not b!719776))
(check-sat)
