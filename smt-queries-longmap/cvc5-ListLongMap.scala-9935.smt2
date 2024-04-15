; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117432 () Bool)

(assert start!117432)

(declare-fun res!922318 () Bool)

(declare-fun e!781923 () Bool)

(assert (=> start!117432 (=> (not res!922318) (not e!781923))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93937 0))(
  ( (array!93938 (arr!45363 (Array (_ BitVec 32) (_ BitVec 64))) (size!45915 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93937)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117432 (= res!922318 (and (bvslt (size!45915 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45915 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117432 e!781923))

(assert (=> start!117432 true))

(declare-fun array_inv!34596 (array!93937) Bool)

(assert (=> start!117432 (array_inv!34596 a!3985)))

(declare-fun b!1380005 () Bool)

(declare-fun res!922319 () Bool)

(assert (=> b!1380005 (=> (not res!922319) (not e!781923))))

(declare-fun isPivot!0 (array!93937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380005 (= res!922319 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380006 () Bool)

(assert (=> b!1380006 (= e!781923 (and (not (= knownPivot!5 pivot!40)) (or (bvsle to!159 from!3363) (bvsge knownPivot!5 (bvsub to!159 #b00000000000000000000000000000001)))))))

(assert (= (and start!117432 res!922318) b!1380005))

(assert (= (and b!1380005 res!922319) b!1380006))

(declare-fun m!1264781 () Bool)

(assert (=> start!117432 m!1264781))

(declare-fun m!1264783 () Bool)

(assert (=> b!1380005 m!1264783))

(push 1)

(assert (not b!1380005))

(assert (not start!117432))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

