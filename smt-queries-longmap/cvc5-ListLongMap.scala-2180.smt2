; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36414 () Bool)

(assert start!36414)

(declare-fun b!364210 () Bool)

(declare-fun e!222990 () Bool)

(assert (=> b!364210 (= e!222990 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!168432 () (_ BitVec 32))

(declare-datatypes ((array!20694 0))(
  ( (array!20695 (arr!9826 (Array (_ BitVec 32) (_ BitVec 64))) (size!10178 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20694)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20694 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364210 (= lt!168432 (arrayCountValidKeys!0 (array!20695 (store (arr!9826 a!4289) i!1472 k!2974) (size!10178 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168433 () (_ BitVec 32))

(assert (=> b!364210 (= lt!168433 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364208 () Bool)

(declare-fun res!203370 () Bool)

(assert (=> b!364208 (=> (not res!203370) (not e!222990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364208 (= res!203370 (validKeyInArray!0 k!2974))))

(declare-fun b!364209 () Bool)

(declare-fun res!203368 () Bool)

(assert (=> b!364209 (=> (not res!203368) (not e!222990))))

(assert (=> b!364209 (= res!203368 (and (bvslt (size!10178 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10178 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203369 () Bool)

(assert (=> start!36414 (=> (not res!203369) (not e!222990))))

(assert (=> start!36414 (= res!203369 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10178 a!4289))))))

(assert (=> start!36414 e!222990))

(assert (=> start!36414 true))

(declare-fun array_inv!7268 (array!20694) Bool)

(assert (=> start!36414 (array_inv!7268 a!4289)))

(declare-fun b!364207 () Bool)

(declare-fun res!203371 () Bool)

(assert (=> b!364207 (=> (not res!203371) (not e!222990))))

(assert (=> b!364207 (= res!203371 (not (validKeyInArray!0 (select (arr!9826 a!4289) i!1472))))))

(assert (= (and start!36414 res!203369) b!364207))

(assert (= (and b!364207 res!203371) b!364208))

(assert (= (and b!364208 res!203370) b!364209))

(assert (= (and b!364209 res!203368) b!364210))

(declare-fun m!361703 () Bool)

(assert (=> b!364210 m!361703))

(declare-fun m!361705 () Bool)

(assert (=> b!364210 m!361705))

(declare-fun m!361707 () Bool)

(assert (=> b!364210 m!361707))

(declare-fun m!361709 () Bool)

(assert (=> b!364208 m!361709))

(declare-fun m!361711 () Bool)

(assert (=> start!36414 m!361711))

(declare-fun m!361713 () Bool)

(assert (=> b!364207 m!361713))

(assert (=> b!364207 m!361713))

(declare-fun m!361715 () Bool)

(assert (=> b!364207 m!361715))

(push 1)

(assert (not b!364208))

(assert (not b!364207))

(assert (not start!36414))

(assert (not b!364210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

