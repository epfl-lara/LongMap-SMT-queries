; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63738 () Bool)

(assert start!63738)

(declare-fun b!717159 () Bool)

(declare-fun res!479799 () Bool)

(declare-fun e!402752 () Bool)

(assert (=> b!717159 (=> (not res!479799) (not e!402752))))

(declare-datatypes ((array!40567 0))(
  ( (array!40568 (arr!19414 (Array (_ BitVec 32) (_ BitVec 64))) (size!19834 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40567)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717159 (= res!479799 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717160 () Bool)

(declare-fun res!479800 () Bool)

(assert (=> b!717160 (=> (not res!479800) (not e!402752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717160 (= res!479800 (validKeyInArray!0 k0!2102))))

(declare-fun b!717161 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717161 (= e!402752 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun res!479796 () Bool)

(assert (=> start!63738 (=> (not res!479796) (not e!402752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63738 (= res!479796 (validMask!0 mask!3328))))

(assert (=> start!63738 e!402752))

(declare-fun array_inv!15273 (array!40567) Bool)

(assert (=> start!63738 (array_inv!15273 a!3186)))

(assert (=> start!63738 true))

(declare-fun b!717162 () Bool)

(declare-fun res!479798 () Bool)

(assert (=> b!717162 (=> (not res!479798) (not e!402752))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717162 (= res!479798 (validKeyInArray!0 (select (arr!19414 a!3186) j!159)))))

(declare-fun b!717163 () Bool)

(declare-fun res!479797 () Bool)

(assert (=> b!717163 (=> (not res!479797) (not e!402752))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717163 (= res!479797 (and (= (size!19834 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19834 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19834 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63738 res!479796) b!717163))

(assert (= (and b!717163 res!479797) b!717162))

(assert (= (and b!717162 res!479798) b!717160))

(assert (= (and b!717160 res!479800) b!717159))

(assert (= (and b!717159 res!479799) b!717161))

(declare-fun m!673671 () Bool)

(assert (=> b!717159 m!673671))

(declare-fun m!673673 () Bool)

(assert (=> b!717160 m!673673))

(declare-fun m!673675 () Bool)

(assert (=> start!63738 m!673675))

(declare-fun m!673677 () Bool)

(assert (=> start!63738 m!673677))

(declare-fun m!673679 () Bool)

(assert (=> b!717162 m!673679))

(assert (=> b!717162 m!673679))

(declare-fun m!673681 () Bool)

(assert (=> b!717162 m!673681))

(check-sat (not b!717160) (not b!717159) (not start!63738) (not b!717162))
(check-sat)
