; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117426 () Bool)

(assert start!117426)

(declare-fun res!922321 () Bool)

(declare-fun e!781924 () Bool)

(assert (=> start!117426 (=> (not res!922321) (not e!781924))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93977 0))(
  ( (array!93978 (arr!45383 (Array (_ BitVec 32) (_ BitVec 64))) (size!45933 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93977)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun knownPivot!5 () (_ BitVec 32))

(assert (=> start!117426 (= res!922321 (and (bvslt (size!45933 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45933 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117426 e!781924))

(assert (=> start!117426 true))

(declare-fun array_inv!34411 (array!93977) Bool)

(assert (=> start!117426 (array_inv!34411 a!3985)))

(declare-fun b!1380051 () Bool)

(assert (=> b!1380051 (= e!781924 false)))

(declare-fun lt!607842 () Bool)

(declare-fun isPivot!0 (array!93977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380051 (= lt!607842 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117426 res!922321) b!1380051))

(declare-fun m!1265265 () Bool)

(assert (=> start!117426 m!1265265))

(declare-fun m!1265267 () Bool)

(assert (=> b!1380051 m!1265267))

(push 1)

(assert (not start!117426))

(assert (not b!1380051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

