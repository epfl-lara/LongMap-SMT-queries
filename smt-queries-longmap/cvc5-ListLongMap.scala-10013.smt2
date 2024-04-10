; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118128 () Bool)

(assert start!118128)

(declare-fun res!924368 () Bool)

(declare-fun e!783727 () Bool)

(assert (=> start!118128 (=> (not res!924368) (not e!783727))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118128 (= res!924368 (validMask!0 mask!2987))))

(assert (=> start!118128 e!783727))

(assert (=> start!118128 true))

(declare-datatypes ((array!94479 0))(
  ( (array!94480 (arr!45620 (Array (_ BitVec 32) (_ BitVec 64))) (size!46170 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94479)

(declare-fun array_inv!34648 (array!94479) Bool)

(assert (=> start!118128 (array_inv!34648 a!2938)))

(declare-fun b!1382778 () Bool)

(declare-datatypes ((List!32148 0))(
  ( (Nil!32145) (Cons!32144 (h!33353 (_ BitVec 64)) (t!46842 List!32148)) )
))
(declare-fun noDuplicate!2594 (List!32148) Bool)

(assert (=> b!1382778 (= e!783727 (not (noDuplicate!2594 Nil!32145)))))

(declare-fun b!1382775 () Bool)

(declare-fun res!924369 () Bool)

(assert (=> b!1382775 (=> (not res!924369) (not e!783727))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382775 (= res!924369 (and (= (size!46170 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46170 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46170 a!2938))))))

(declare-fun b!1382777 () Bool)

(declare-fun res!924370 () Bool)

(assert (=> b!1382777 (=> (not res!924370) (not e!783727))))

(assert (=> b!1382777 (= res!924370 (and (bvsle #b00000000000000000000000000000000 (size!46170 a!2938)) (bvslt (size!46170 a!2938) #b01111111111111111111111111111111)))))

(declare-fun b!1382776 () Bool)

(declare-fun res!924367 () Bool)

(assert (=> b!1382776 (=> (not res!924367) (not e!783727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382776 (= res!924367 (validKeyInArray!0 (select (arr!45620 a!2938) i!1065)))))

(assert (= (and start!118128 res!924368) b!1382775))

(assert (= (and b!1382775 res!924369) b!1382776))

(assert (= (and b!1382776 res!924367) b!1382777))

(assert (= (and b!1382777 res!924370) b!1382778))

(declare-fun m!1267899 () Bool)

(assert (=> start!118128 m!1267899))

(declare-fun m!1267901 () Bool)

(assert (=> start!118128 m!1267901))

(declare-fun m!1267903 () Bool)

(assert (=> b!1382778 m!1267903))

(declare-fun m!1267905 () Bool)

(assert (=> b!1382776 m!1267905))

(assert (=> b!1382776 m!1267905))

(declare-fun m!1267907 () Bool)

(assert (=> b!1382776 m!1267907))

(push 1)

(assert (not b!1382778))

(assert (not b!1382776))

(assert (not start!118128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149221 () Bool)

(declare-fun res!924399 () Bool)

(declare-fun e!783745 () Bool)

(assert (=> d!149221 (=> res!924399 e!783745)))

(assert (=> d!149221 (= res!924399 (is-Nil!32145 Nil!32145))))

