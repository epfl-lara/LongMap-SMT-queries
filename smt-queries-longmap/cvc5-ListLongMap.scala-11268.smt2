; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131450 () Bool)

(assert start!131450)

(declare-fun b!1540853 () Bool)

(declare-fun res!1057401 () Bool)

(declare-fun e!856969 () Bool)

(assert (=> b!1540853 (=> (not res!1057401) (not e!856969))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102353 0))(
  ( (array!102354 (arr!49385 (Array (_ BitVec 32) (_ BitVec 64))) (size!49935 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102353)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540853 (= res!1057401 (and (= (size!49935 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49935 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49935 a!3920))))))

(declare-fun b!1540854 () Bool)

(declare-fun res!1057402 () Bool)

(assert (=> b!1540854 (=> (not res!1057402) (not e!856969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102353 (_ BitVec 32)) Bool)

(assert (=> b!1540854 (= res!1057402 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057399 () Bool)

(assert (=> start!131450 (=> (not res!1057399) (not e!856969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131450 (= res!1057399 (validMask!0 mask!4052))))

(assert (=> start!131450 e!856969))

(assert (=> start!131450 true))

(declare-fun array_inv!38413 (array!102353) Bool)

(assert (=> start!131450 (array_inv!38413 a!3920)))

(declare-fun b!1540856 () Bool)

(assert (=> b!1540856 (= e!856969 false)))

(declare-fun lt!665527 () Bool)

(assert (=> b!1540856 (= lt!665527 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540855 () Bool)

(declare-fun res!1057400 () Bool)

(assert (=> b!1540855 (=> (not res!1057400) (not e!856969))))

(assert (=> b!1540855 (= res!1057400 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49935 a!3920))))))

(assert (= (and start!131450 res!1057399) b!1540853))

(assert (= (and b!1540853 res!1057401) b!1540854))

(assert (= (and b!1540854 res!1057402) b!1540855))

(assert (= (and b!1540855 res!1057400) b!1540856))

(declare-fun m!1422939 () Bool)

(assert (=> b!1540854 m!1422939))

(declare-fun m!1422941 () Bool)

(assert (=> start!131450 m!1422941))

(declare-fun m!1422943 () Bool)

(assert (=> start!131450 m!1422943))

(declare-fun m!1422945 () Bool)

(assert (=> b!1540856 m!1422945))

(push 1)

(assert (not b!1540854))

(assert (not start!131450))

(assert (not b!1540856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

