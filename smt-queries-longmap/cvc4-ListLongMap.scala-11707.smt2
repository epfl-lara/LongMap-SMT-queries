; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136944 () Bool)

(assert start!136944)

(declare-fun res!1079042 () Bool)

(declare-fun e!880987 () Bool)

(assert (=> start!136944 (=> (not res!1079042) (not e!880987))))

(declare-datatypes ((B!2586 0))(
  ( (B!2587 (val!19655 Int)) )
))
(declare-datatypes ((tuple2!25412 0))(
  ( (tuple2!25413 (_1!12717 (_ BitVec 64)) (_2!12717 B!2586)) )
))
(declare-datatypes ((List!36775 0))(
  ( (Nil!36772) (Cons!36771 (h!38314 tuple2!25412) (t!51689 List!36775)) )
))
(declare-fun lt!676495 () List!36775)

(declare-fun isStrictlySorted!1036 (List!36775) Bool)

(assert (=> start!136944 (= res!1079042 (isStrictlySorted!1036 lt!676495))))

(declare-datatypes ((ListLongMap!22751 0))(
  ( (ListLongMap!22752 (toList!11391 List!36775)) )
))
(declare-fun thiss!201 () ListLongMap!22751)

(declare-fun keyValue!4 () tuple2!25412)

(declare-fun insertStrictlySorted!607 (List!36775 (_ BitVec 64) B!2586) List!36775)

(assert (=> start!136944 (= lt!676495 (insertStrictlySorted!607 (toList!11391 thiss!201) (_1!12717 keyValue!4) (_2!12717 keyValue!4)))))

(assert (=> start!136944 e!880987))

(declare-fun e!880988 () Bool)

(declare-fun inv!58946 (ListLongMap!22751) Bool)

(assert (=> start!136944 (and (inv!58946 thiss!201) e!880988)))

(declare-fun tp_is_empty!39131 () Bool)

(assert (=> start!136944 tp_is_empty!39131))

(declare-fun b!1579306 () Bool)

(declare-fun res!1079043 () Bool)

(assert (=> b!1579306 (=> (not res!1079043) (not e!880987))))

(declare-fun containsKey!882 (List!36775 (_ BitVec 64)) Bool)

(assert (=> b!1579306 (= res!1079043 (containsKey!882 lt!676495 (_1!12717 keyValue!4)))))

(declare-fun b!1579307 () Bool)

(assert (=> b!1579307 (= e!880987 false)))

(declare-fun lt!676494 () Bool)

(declare-fun contains!10447 (List!36775 tuple2!25412) Bool)

(assert (=> b!1579307 (= lt!676494 (contains!10447 lt!676495 keyValue!4))))

(declare-fun b!1579308 () Bool)

(declare-fun tp!114321 () Bool)

(assert (=> b!1579308 (= e!880988 tp!114321)))

(assert (= (and start!136944 res!1079042) b!1579306))

(assert (= (and b!1579306 res!1079043) b!1579307))

(assert (= start!136944 b!1579308))

(declare-fun m!1451163 () Bool)

(assert (=> start!136944 m!1451163))

(declare-fun m!1451165 () Bool)

(assert (=> start!136944 m!1451165))

(declare-fun m!1451167 () Bool)

(assert (=> start!136944 m!1451167))

(declare-fun m!1451169 () Bool)

(assert (=> b!1579306 m!1451169))

(declare-fun m!1451171 () Bool)

(assert (=> b!1579307 m!1451171))

(push 1)

(assert (not b!1579307))

(assert (not start!136944))

(assert tp_is_empty!39131)

(assert (not b!1579308))

(assert (not b!1579306))

(check-sat)

(pop 1)

