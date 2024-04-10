; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107776 () Bool)

(assert start!107776)

(declare-fun res!847279 () Bool)

(declare-fun e!727372 () Bool)

(assert (=> start!107776 (=> (not res!847279) (not e!727372))))

(declare-datatypes ((B!2128 0))(
  ( (B!2129 (val!16660 Int)) )
))
(declare-datatypes ((tuple2!21402 0))(
  ( (tuple2!21403 (_1!10712 (_ BitVec 64)) (_2!10712 B!2128)) )
))
(declare-datatypes ((List!28586 0))(
  ( (Nil!28583) (Cons!28582 (h!29791 tuple2!21402) (t!42119 List!28586)) )
))
(declare-fun l!595 () List!28586)

(declare-fun isStrictlySorted!844 (List!28586) Bool)

(assert (=> start!107776 (= res!847279 (isStrictlySorted!844 l!595))))

(assert (=> start!107776 e!727372))

(declare-fun e!727371 () Bool)

(assert (=> start!107776 e!727371))

(assert (=> start!107776 true))

(declare-fun b!1274554 () Bool)

(declare-fun res!847278 () Bool)

(assert (=> b!1274554 (=> (not res!847278) (not e!727372))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1274554 (= res!847278 (and (not (= (_1!10712 (h!29791 l!595)) key!173)) ((_ is Cons!28582) l!595)))))

(declare-fun b!1274555 () Bool)

(assert (=> b!1274555 (= e!727372 (not (isStrictlySorted!844 (t!42119 l!595))))))

(declare-fun b!1274556 () Bool)

(declare-fun tp_is_empty!33171 () Bool)

(declare-fun tp!97961 () Bool)

(assert (=> b!1274556 (= e!727371 (and tp_is_empty!33171 tp!97961))))

(assert (= (and start!107776 res!847279) b!1274554))

(assert (= (and b!1274554 res!847278) b!1274555))

(assert (= (and start!107776 ((_ is Cons!28582) l!595)) b!1274556))

(declare-fun m!1171271 () Bool)

(assert (=> start!107776 m!1171271))

(declare-fun m!1171273 () Bool)

(assert (=> b!1274555 m!1171273))

(check-sat (not start!107776) (not b!1274555) (not b!1274556) tp_is_empty!33171)
(check-sat)
(get-model)

(declare-fun d!140171 () Bool)

(declare-fun res!847302 () Bool)

(declare-fun e!727397 () Bool)

(assert (=> d!140171 (=> res!847302 e!727397)))

(assert (=> d!140171 (= res!847302 (or ((_ is Nil!28583) l!595) ((_ is Nil!28583) (t!42119 l!595))))))

(assert (=> d!140171 (= (isStrictlySorted!844 l!595) e!727397)))

(declare-fun b!1274586 () Bool)

(declare-fun e!727398 () Bool)

(assert (=> b!1274586 (= e!727397 e!727398)))

(declare-fun res!847303 () Bool)

(assert (=> b!1274586 (=> (not res!847303) (not e!727398))))

(assert (=> b!1274586 (= res!847303 (bvslt (_1!10712 (h!29791 l!595)) (_1!10712 (h!29791 (t!42119 l!595)))))))

(declare-fun b!1274587 () Bool)

(assert (=> b!1274587 (= e!727398 (isStrictlySorted!844 (t!42119 l!595)))))

(assert (= (and d!140171 (not res!847302)) b!1274586))

(assert (= (and b!1274586 res!847303) b!1274587))

(assert (=> b!1274587 m!1171273))

(assert (=> start!107776 d!140171))

(declare-fun d!140179 () Bool)

(declare-fun res!847304 () Bool)

(declare-fun e!727400 () Bool)

(assert (=> d!140179 (=> res!847304 e!727400)))

(assert (=> d!140179 (= res!847304 (or ((_ is Nil!28583) (t!42119 l!595)) ((_ is Nil!28583) (t!42119 (t!42119 l!595)))))))

(assert (=> d!140179 (= (isStrictlySorted!844 (t!42119 l!595)) e!727400)))

(declare-fun b!1274589 () Bool)

(declare-fun e!727401 () Bool)

(assert (=> b!1274589 (= e!727400 e!727401)))

(declare-fun res!847305 () Bool)

(assert (=> b!1274589 (=> (not res!847305) (not e!727401))))

(assert (=> b!1274589 (= res!847305 (bvslt (_1!10712 (h!29791 (t!42119 l!595))) (_1!10712 (h!29791 (t!42119 (t!42119 l!595))))))))

(declare-fun b!1274590 () Bool)

(assert (=> b!1274590 (= e!727401 (isStrictlySorted!844 (t!42119 (t!42119 l!595))))))

(assert (= (and d!140179 (not res!847304)) b!1274589))

(assert (= (and b!1274589 res!847305) b!1274590))

(declare-fun m!1171281 () Bool)

(assert (=> b!1274590 m!1171281))

(assert (=> b!1274555 d!140179))

(declare-fun b!1274597 () Bool)

(declare-fun e!727406 () Bool)

(declare-fun tp!97970 () Bool)

(assert (=> b!1274597 (= e!727406 (and tp_is_empty!33171 tp!97970))))

(assert (=> b!1274556 (= tp!97961 e!727406)))

(assert (= (and b!1274556 ((_ is Cons!28582) (t!42119 l!595))) b!1274597))

(check-sat (not b!1274587) (not b!1274590) (not b!1274597) tp_is_empty!33171)
(check-sat)
