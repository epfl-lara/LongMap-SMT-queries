; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134572 () Bool)

(assert start!134572)

(declare-fun res!1073403 () Bool)

(declare-fun e!876004 () Bool)

(assert (=> start!134572 (=> (not res!1073403) (not e!876004))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134572 (= res!1073403 (validMask!0 mask!4043))))

(assert (=> start!134572 e!876004))

(assert (=> start!134572 true))

(declare-datatypes ((array!104804 0))(
  ( (array!104805 (arr!50582 (Array (_ BitVec 32) (_ BitVec 64))) (size!51132 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104804)

(declare-fun array_inv!39309 (array!104804) Bool)

(assert (=> start!134572 (array_inv!39309 a!3462)))

(declare-fun b!1571148 () Bool)

(assert (=> b!1571148 (= e!876004 (and (= (size!51132 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)) (bvsgt #b00000000000000000000000000000000 (size!51132 a!3462))))))

(assert (= (and start!134572 res!1073403) b!1571148))

(declare-fun m!1445147 () Bool)

(assert (=> start!134572 m!1445147))

(declare-fun m!1445149 () Bool)

(assert (=> start!134572 m!1445149))

(check-sat (not start!134572))
(check-sat)
(get-model)

(declare-fun d!164475 () Bool)

(assert (=> d!164475 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!134572 d!164475))

(declare-fun d!164481 () Bool)

(assert (=> d!164481 (= (array_inv!39309 a!3462) (bvsge (size!51132 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!134572 d!164481))

(check-sat)
