; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93520 () Bool)

(assert start!93520)

(declare-fun res!707352 () Bool)

(declare-fun e!602395 () Bool)

(assert (=> start!93520 (=> (not res!707352) (not e!602395))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66753 0))(
  ( (array!66754 (arr!32093 (Array (_ BitVec 32) (_ BitVec 64))) (size!32631 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66753)

(assert (=> start!93520 (= res!707352 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32631 a!3475)) (bvslt (size!32631 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93520 e!602395))

(assert (=> start!93520 true))

(declare-fun array_inv!24876 (array!66753) Bool)

(assert (=> start!93520 (array_inv!24876 a!3475)))

(declare-fun b!1058694 () Bool)

(declare-fun res!707353 () Bool)

(assert (=> b!1058694 (=> (not res!707353) (not e!602395))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058694 (= res!707353 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058695 () Bool)

(declare-fun res!707354 () Bool)

(assert (=> b!1058695 (=> (not res!707354) (not e!602395))))

(assert (=> b!1058695 (= res!707354 (not (= (select (arr!32093 a!3475) from!2850) k!2741)))))

(declare-fun b!1058696 () Bool)

(assert (=> b!1058696 (= e!602395 false)))

(declare-fun lt!466849 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!66753 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058696 (= lt!466849 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93520 res!707352) b!1058694))

(assert (= (and b!1058694 res!707353) b!1058695))

(assert (= (and b!1058695 res!707354) b!1058696))

(declare-fun m!977855 () Bool)

(assert (=> start!93520 m!977855))

(declare-fun m!977857 () Bool)

(assert (=> b!1058694 m!977857))

(declare-fun m!977859 () Bool)

(assert (=> b!1058695 m!977859))

(declare-fun m!977861 () Bool)

(assert (=> b!1058696 m!977861))

(push 1)

(assert (not b!1058696))

(assert (not start!93520))

(assert (not b!1058694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

