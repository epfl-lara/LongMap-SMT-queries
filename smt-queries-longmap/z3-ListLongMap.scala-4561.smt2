; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63650 () Bool)

(assert start!63650)

(declare-fun b!716769 () Bool)

(declare-fun res!479558 () Bool)

(declare-fun e!402496 () Bool)

(assert (=> b!716769 (=> (not res!479558) (not e!402496))))

(declare-datatypes ((array!40560 0))(
  ( (array!40561 (arr!19414 (Array (_ BitVec 32) (_ BitVec 64))) (size!19835 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40560)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716769 (= res!479558 (and (= (size!19835 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19835 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19835 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!479557 () Bool)

(assert (=> start!63650 (=> (not res!479557) (not e!402496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63650 (= res!479557 (validMask!0 mask!3328))))

(assert (=> start!63650 e!402496))

(declare-fun array_inv!15210 (array!40560) Bool)

(assert (=> start!63650 (array_inv!15210 a!3186)))

(assert (=> start!63650 true))

(declare-fun b!716770 () Bool)

(declare-fun res!479555 () Bool)

(assert (=> b!716770 (=> (not res!479555) (not e!402496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716770 (= res!479555 (validKeyInArray!0 (select (arr!19414 a!3186) j!159)))))

(declare-fun b!716772 () Bool)

(assert (=> b!716772 (= e!402496 (bvsge #b00000000000000000000000000000000 (size!19835 a!3186)))))

(declare-fun b!716771 () Bool)

(declare-fun res!479556 () Bool)

(assert (=> b!716771 (=> (not res!479556) (not e!402496))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!716771 (= res!479556 (validKeyInArray!0 k0!2102))))

(assert (= (and start!63650 res!479557) b!716769))

(assert (= (and b!716769 res!479558) b!716770))

(assert (= (and b!716770 res!479555) b!716771))

(assert (= (and b!716771 res!479556) b!716772))

(declare-fun m!672773 () Bool)

(assert (=> start!63650 m!672773))

(declare-fun m!672775 () Bool)

(assert (=> start!63650 m!672775))

(declare-fun m!672777 () Bool)

(assert (=> b!716770 m!672777))

(assert (=> b!716770 m!672777))

(declare-fun m!672779 () Bool)

(assert (=> b!716770 m!672779))

(declare-fun m!672781 () Bool)

(assert (=> b!716771 m!672781))

(check-sat (not start!63650) (not b!716770) (not b!716771))
(check-sat)
