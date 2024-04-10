; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107790 () Bool)

(assert start!107790)

(declare-fun res!847326 () Bool)

(declare-fun e!727428 () Bool)

(assert (=> start!107790 (=> (not res!847326) (not e!727428))))

(declare-datatypes ((B!2136 0))(
  ( (B!2137 (val!16664 Int)) )
))
(declare-datatypes ((tuple2!21410 0))(
  ( (tuple2!21411 (_1!10716 (_ BitVec 64)) (_2!10716 B!2136)) )
))
(declare-datatypes ((List!28590 0))(
  ( (Nil!28587) (Cons!28586 (h!29795 tuple2!21410) (t!42123 List!28590)) )
))
(declare-fun l!595 () List!28590)

(declare-fun isStrictlySorted!848 (List!28590) Bool)

(assert (=> start!107790 (= res!847326 (isStrictlySorted!848 l!595))))

(assert (=> start!107790 e!727428))

(declare-fun e!727429 () Bool)

(assert (=> start!107790 e!727429))

(assert (=> start!107790 true))

(declare-fun b!1274629 () Bool)

(declare-fun res!847327 () Bool)

(assert (=> b!1274629 (=> (not res!847327) (not e!727428))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274629 (= res!847327 (and (not (= (_1!10716 (h!29795 l!595)) key!173)) (is-Cons!28586 l!595)))))

(declare-fun b!1274630 () Bool)

(assert (=> b!1274630 (= e!727428 false)))

(declare-fun lt!575280 () Bool)

(declare-fun $colon$colon!663 (List!28590 tuple2!21410) List!28590)

(declare-fun removeStrictlySorted!181 (List!28590 (_ BitVec 64)) List!28590)

(assert (=> b!1274630 (= lt!575280 (isStrictlySorted!848 ($colon$colon!663 (removeStrictlySorted!181 (t!42123 l!595) key!173) (h!29795 l!595))))))

(declare-fun b!1274631 () Bool)

(declare-fun tp_is_empty!33179 () Bool)

(declare-fun tp!97982 () Bool)

(assert (=> b!1274631 (= e!727429 (and tp_is_empty!33179 tp!97982))))

(assert (= (and start!107790 res!847326) b!1274629))

(assert (= (and b!1274629 res!847327) b!1274630))

(assert (= (and start!107790 (is-Cons!28586 l!595)) b!1274631))

(declare-fun m!1171301 () Bool)

(assert (=> start!107790 m!1171301))

(declare-fun m!1171303 () Bool)

(assert (=> b!1274630 m!1171303))

(assert (=> b!1274630 m!1171303))

(declare-fun m!1171305 () Bool)

(assert (=> b!1274630 m!1171305))

(assert (=> b!1274630 m!1171305))

(declare-fun m!1171307 () Bool)

(assert (=> b!1274630 m!1171307))

(push 1)

(assert (not b!1274630))

