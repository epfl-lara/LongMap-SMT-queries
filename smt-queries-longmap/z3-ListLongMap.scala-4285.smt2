; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59704 () Bool)

(assert start!59704)

(declare-fun b!659714 () Bool)

(declare-fun e!379045 () Bool)

(declare-datatypes ((List!12627 0))(
  ( (Nil!12624) (Cons!12623 (h!13668 (_ BitVec 64)) (t!18855 List!12627)) )
))
(declare-fun acc!681 () List!12627)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3204 (List!12627 (_ BitVec 64)) Bool)

(assert (=> b!659714 (= e!379045 (contains!3204 acc!681 k0!2843))))

(declare-fun b!659715 () Bool)

(declare-fun e!379046 () Bool)

(assert (=> b!659715 (= e!379046 (not (contains!3204 acc!681 k0!2843)))))

(declare-fun b!659716 () Bool)

(declare-fun res!427781 () Bool)

(declare-fun e!379047 () Bool)

(assert (=> b!659716 (=> (not res!427781) (not e!379047))))

(declare-fun noDuplicate!451 (List!12627) Bool)

(assert (=> b!659716 (= res!427781 (noDuplicate!451 acc!681))))

(declare-fun b!659717 () Bool)

(assert (=> b!659717 (= e!379047 false)))

(declare-fun lt!308707 () Bool)

(declare-fun e!379044 () Bool)

(assert (=> b!659717 (= lt!308707 e!379044)))

(declare-fun res!427780 () Bool)

(assert (=> b!659717 (=> res!427780 e!379044)))

(assert (=> b!659717 (= res!427780 e!379045)))

(declare-fun res!427782 () Bool)

(assert (=> b!659717 (=> (not res!427782) (not e!379045))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659717 (= res!427782 (bvsgt from!3004 i!1382))))

(declare-fun b!659718 () Bool)

(declare-fun res!427783 () Bool)

(assert (=> b!659718 (=> (not res!427783) (not e!379047))))

(assert (=> b!659718 (= res!427783 (not (contains!3204 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!427778 () Bool)

(assert (=> start!59704 (=> (not res!427778) (not e!379047))))

(declare-datatypes ((array!38781 0))(
  ( (array!38782 (arr!18586 (Array (_ BitVec 32) (_ BitVec 64))) (size!18950 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38781)

(assert (=> start!59704 (= res!427778 (and (bvslt (size!18950 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18950 a!3626))))))

(assert (=> start!59704 e!379047))

(assert (=> start!59704 true))

(declare-fun array_inv!14382 (array!38781) Bool)

(assert (=> start!59704 (array_inv!14382 a!3626)))

(declare-fun b!659719 () Bool)

(assert (=> b!659719 (= e!379044 e!379046)))

(declare-fun res!427779 () Bool)

(assert (=> b!659719 (=> (not res!427779) (not e!379046))))

(assert (=> b!659719 (= res!427779 (bvsle from!3004 i!1382))))

(declare-fun b!659720 () Bool)

(declare-fun res!427784 () Bool)

(assert (=> b!659720 (=> (not res!427784) (not e!379047))))

(assert (=> b!659720 (= res!427784 (not (contains!3204 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59704 res!427778) b!659716))

(assert (= (and b!659716 res!427781) b!659718))

(assert (= (and b!659718 res!427783) b!659720))

(assert (= (and b!659720 res!427784) b!659717))

(assert (= (and b!659717 res!427782) b!659714))

(assert (= (and b!659717 (not res!427780)) b!659719))

(assert (= (and b!659719 res!427779) b!659715))

(declare-fun m!632667 () Bool)

(assert (=> b!659720 m!632667))

(declare-fun m!632669 () Bool)

(assert (=> b!659714 m!632669))

(declare-fun m!632671 () Bool)

(assert (=> b!659718 m!632671))

(declare-fun m!632673 () Bool)

(assert (=> b!659716 m!632673))

(assert (=> b!659715 m!632669))

(declare-fun m!632675 () Bool)

(assert (=> start!59704 m!632675))

(check-sat (not b!659714) (not b!659718) (not b!659716) (not start!59704) (not b!659715) (not b!659720))
