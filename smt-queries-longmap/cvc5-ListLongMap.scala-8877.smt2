; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107786 () Bool)

(assert start!107786)

(declare-fun res!847315 () Bool)

(declare-fun e!727416 () Bool)

(assert (=> start!107786 (=> (not res!847315) (not e!727416))))

(declare-datatypes ((B!2132 0))(
  ( (B!2133 (val!16662 Int)) )
))
(declare-datatypes ((tuple2!21406 0))(
  ( (tuple2!21407 (_1!10714 (_ BitVec 64)) (_2!10714 B!2132)) )
))
(declare-datatypes ((List!28588 0))(
  ( (Nil!28585) (Cons!28584 (h!29793 tuple2!21406) (t!42121 List!28588)) )
))
(declare-fun l!595 () List!28588)

(declare-fun isStrictlySorted!846 (List!28588) Bool)

(assert (=> start!107786 (= res!847315 (isStrictlySorted!846 l!595))))

(assert (=> start!107786 e!727416))

(declare-fun e!727417 () Bool)

(assert (=> start!107786 e!727417))

(assert (=> start!107786 true))

(declare-fun b!1274611 () Bool)

(declare-fun res!847314 () Bool)

(assert (=> b!1274611 (=> (not res!847314) (not e!727416))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274611 (= res!847314 (and (not (= (_1!10714 (h!29793 l!595)) key!173)) (is-Cons!28584 l!595)))))

(declare-fun b!1274612 () Bool)

(assert (=> b!1274612 (= e!727416 false)))

(declare-fun lt!575274 () Bool)

(declare-fun $colon$colon!661 (List!28588 tuple2!21406) List!28588)

(declare-fun removeStrictlySorted!179 (List!28588 (_ BitVec 64)) List!28588)

(assert (=> b!1274612 (= lt!575274 (isStrictlySorted!846 ($colon$colon!661 (removeStrictlySorted!179 (t!42121 l!595) key!173) (h!29793 l!595))))))

(declare-fun b!1274613 () Bool)

(declare-fun tp_is_empty!33175 () Bool)

(declare-fun tp!97976 () Bool)

(assert (=> b!1274613 (= e!727417 (and tp_is_empty!33175 tp!97976))))

(assert (= (and start!107786 res!847315) b!1274611))

(assert (= (and b!1274611 res!847314) b!1274612))

(assert (= (and start!107786 (is-Cons!28584 l!595)) b!1274613))

(declare-fun m!1171285 () Bool)

(assert (=> start!107786 m!1171285))

(declare-fun m!1171287 () Bool)

(assert (=> b!1274612 m!1171287))

(assert (=> b!1274612 m!1171287))

(declare-fun m!1171289 () Bool)

(assert (=> b!1274612 m!1171289))

(assert (=> b!1274612 m!1171289))

(declare-fun m!1171291 () Bool)

(assert (=> b!1274612 m!1171291))

(push 1)

(assert (not start!107786))

(assert (not b!1274612))

(assert (not b!1274613))

(assert tp_is_empty!33175)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

