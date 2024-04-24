; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85910 () Bool)

(assert start!85910)

(declare-fun b!995733 () Bool)

(declare-fun e!561969 () Bool)

(assert (=> b!995733 (= e!561969 false)))

(declare-datatypes ((array!62986 0))(
  ( (array!62987 (arr!30327 (Array (_ BitVec 32) (_ BitVec 64))) (size!30830 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62986)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9195 0))(
  ( (MissingZero!9195 (index!39151 (_ BitVec 32))) (Found!9195 (index!39152 (_ BitVec 32))) (Intermediate!9195 (undefined!10007 Bool) (index!39153 (_ BitVec 32)) (x!86746 (_ BitVec 32))) (Undefined!9195) (MissingVacant!9195 (index!39154 (_ BitVec 32))) )
))
(declare-fun lt!441134 () SeekEntryResult!9195)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62986 (_ BitVec 32)) SeekEntryResult!9195)

(assert (=> b!995733 (= lt!441134 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995734 () Bool)

(declare-fun res!665677 () Bool)

(assert (=> b!995734 (=> (not res!665677) (not e!561969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995734 (= res!665677 (validKeyInArray!0 k!2224))))

(declare-fun b!995735 () Bool)

(declare-fun res!665674 () Bool)

(assert (=> b!995735 (=> (not res!665674) (not e!561969))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995735 (= res!665674 (validKeyInArray!0 (select (arr!30327 a!3219) j!170)))))

(declare-fun b!995736 () Bool)

(declare-fun res!665675 () Bool)

(assert (=> b!995736 (=> (not res!665675) (not e!561969))))

(declare-fun arrayContainsKey!0 (array!62986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995736 (= res!665675 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665678 () Bool)

(assert (=> start!85910 (=> (not res!665678) (not e!561969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85910 (= res!665678 (validMask!0 mask!3464))))

(assert (=> start!85910 e!561969))

(declare-fun array_inv!23463 (array!62986) Bool)

(assert (=> start!85910 (array_inv!23463 a!3219)))

(assert (=> start!85910 true))

(declare-fun b!995737 () Bool)

(declare-fun res!665676 () Bool)

(assert (=> b!995737 (=> (not res!665676) (not e!561969))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995737 (= res!665676 (and (= (size!30830 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30830 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30830 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85910 res!665678) b!995737))

(assert (= (and b!995737 res!665676) b!995735))

(assert (= (and b!995735 res!665674) b!995734))

(assert (= (and b!995734 res!665677) b!995736))

(assert (= (and b!995736 res!665675) b!995733))

(declare-fun m!923685 () Bool)

(assert (=> b!995734 m!923685))

(declare-fun m!923687 () Bool)

(assert (=> b!995736 m!923687))

(declare-fun m!923689 () Bool)

(assert (=> b!995735 m!923689))

(assert (=> b!995735 m!923689))

(declare-fun m!923691 () Bool)

(assert (=> b!995735 m!923691))

(declare-fun m!923693 () Bool)

(assert (=> start!85910 m!923693))

(declare-fun m!923695 () Bool)

(assert (=> start!85910 m!923695))

(declare-fun m!923697 () Bool)

(assert (=> b!995733 m!923697))

(push 1)

(assert (not b!995734))

(assert (not b!995733))

(assert (not b!995736))

(assert (not start!85910))

(assert (not b!995735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

