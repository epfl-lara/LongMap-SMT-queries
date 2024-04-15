; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63640 () Bool)

(assert start!63640)

(declare-fun b!716520 () Bool)

(declare-fun res!479448 () Bool)

(declare-fun e!402348 () Bool)

(assert (=> b!716520 (=> (not res!479448) (not e!402348))))

(declare-datatypes ((array!40557 0))(
  ( (array!40558 (arr!19412 (Array (_ BitVec 32) (_ BitVec 64))) (size!19833 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40557)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716520 (= res!479448 (validKeyInArray!0 (select (arr!19412 a!3186) j!159)))))

(declare-fun b!716521 () Bool)

(declare-fun res!479447 () Bool)

(assert (=> b!716521 (=> (not res!479447) (not e!402348))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!716521 (= res!479447 (validKeyInArray!0 k0!2102))))

(declare-fun res!479445 () Bool)

(assert (=> start!63640 (=> (not res!479445) (not e!402348))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63640 (= res!479445 (validMask!0 mask!3328))))

(assert (=> start!63640 e!402348))

(declare-fun array_inv!15295 (array!40557) Bool)

(assert (=> start!63640 (array_inv!15295 a!3186)))

(assert (=> start!63640 true))

(declare-fun b!716522 () Bool)

(assert (=> b!716522 (= e!402348 (bvsge #b00000000000000000000000000000000 (size!19833 a!3186)))))

(declare-fun b!716519 () Bool)

(declare-fun res!479446 () Bool)

(assert (=> b!716519 (=> (not res!479446) (not e!402348))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716519 (= res!479446 (and (= (size!19833 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19833 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19833 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63640 res!479445) b!716519))

(assert (= (and b!716519 res!479446) b!716520))

(assert (= (and b!716520 res!479448) b!716521))

(assert (= (and b!716521 res!479447) b!716522))

(declare-fun m!672063 () Bool)

(assert (=> b!716520 m!672063))

(assert (=> b!716520 m!672063))

(declare-fun m!672065 () Bool)

(assert (=> b!716520 m!672065))

(declare-fun m!672067 () Bool)

(assert (=> b!716521 m!672067))

(declare-fun m!672069 () Bool)

(assert (=> start!63640 m!672069))

(declare-fun m!672071 () Bool)

(assert (=> start!63640 m!672071))

(check-sat (not b!716520) (not b!716521) (not start!63640))
(check-sat)
