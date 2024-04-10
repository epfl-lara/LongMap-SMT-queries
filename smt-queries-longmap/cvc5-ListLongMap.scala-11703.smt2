; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136838 () Bool)

(assert start!136838)

(declare-fun res!1078767 () Bool)

(declare-fun e!880675 () Bool)

(assert (=> start!136838 (=> (not res!1078767) (not e!880675))))

(declare-datatypes ((B!2558 0))(
  ( (B!2559 (val!19641 Int)) )
))
(declare-datatypes ((tuple2!25384 0))(
  ( (tuple2!25385 (_1!12703 (_ BitVec 64)) (_2!12703 B!2558)) )
))
(declare-datatypes ((List!36761 0))(
  ( (Nil!36758) (Cons!36757 (h!38300 tuple2!25384) (t!51675 List!36761)) )
))
(declare-datatypes ((ListLongMap!22723 0))(
  ( (ListLongMap!22724 (toList!11377 List!36761)) )
))
(declare-fun lm!251 () ListLongMap!22723)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun contains!10433 (ListLongMap!22723 (_ BitVec 64)) Bool)

(assert (=> start!136838 (= res!1078767 (not (contains!10433 lm!251 a0!51)))))

(assert (=> start!136838 e!880675))

(declare-fun e!880676 () Bool)

(declare-fun inv!58912 (ListLongMap!22723) Bool)

(assert (=> start!136838 (and (inv!58912 lm!251) e!880676)))

(assert (=> start!136838 true))

(declare-fun b!1578830 () Bool)

(assert (=> b!1578830 (= e!880675 false)))

(declare-fun b!1578831 () Bool)

(declare-fun tp!114252 () Bool)

(assert (=> b!1578831 (= e!880676 tp!114252)))

(assert (= (and start!136838 res!1078767) b!1578830))

(assert (= start!136838 b!1578831))

(declare-fun m!1450873 () Bool)

(assert (=> start!136838 m!1450873))

(declare-fun m!1450875 () Bool)

(assert (=> start!136838 m!1450875))

(push 1)

(assert (not start!136838))

(assert (not b!1578831))

(check-sat)

(pop 1)

