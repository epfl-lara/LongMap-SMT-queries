; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93950 () Bool)

(assert start!93950)

(declare-fun b_free!21199 () Bool)

(declare-fun b_next!21199 () Bool)

(assert (=> start!93950 (= b_free!21199 (not b_next!21199))))

(declare-fun tp!75017 () Bool)

(declare-fun b_and!33919 () Bool)

(assert (=> start!93950 (= tp!75017 b_and!33919)))

(declare-fun b!1061405 () Bool)

(declare-fun e!604334 () Bool)

(assert (=> b!1061405 (= e!604334 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38481 0))(
  ( (V!38482 (val!12555 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38481)

(declare-datatypes ((ValueCell!11801 0))(
  ( (ValueCellFull!11801 (v!15161 V!38481)) (EmptyCell!11801) )
))
(declare-datatypes ((array!67087 0))(
  ( (array!67088 (arr!32246 (Array (_ BitVec 32) ValueCell!11801)) (size!32783 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67087)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38481)

(declare-datatypes ((tuple2!15858 0))(
  ( (tuple2!15859 (_1!7940 (_ BitVec 64)) (_2!7940 V!38481)) )
))
(declare-datatypes ((List!22441 0))(
  ( (Nil!22438) (Cons!22437 (h!23655 tuple2!15858) (t!31740 List!22441)) )
))
(declare-datatypes ((ListLongMap!13835 0))(
  ( (ListLongMap!13836 (toList!6933 List!22441)) )
))
(declare-fun lt!467733 () ListLongMap!13835)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67089 0))(
  ( (array!67090 (arr!32247 (Array (_ BitVec 32) (_ BitVec 64))) (size!32784 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67089)

(declare-fun getCurrentListMapNoExtraKeys!3581 (array!67089 array!67087 (_ BitVec 32) (_ BitVec 32) V!38481 V!38481 (_ BitVec 32) Int) ListLongMap!13835)

(assert (=> b!1061405 (= lt!467733 (getCurrentListMapNoExtraKeys!3581 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061406 () Bool)

(declare-fun res!708583 () Bool)

(assert (=> b!1061406 (=> (not res!708583) (not e!604334))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1061406 (= res!708583 (and (= (size!32783 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32784 _keys!1163) (size!32783 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061407 () Bool)

(declare-fun res!708580 () Bool)

(assert (=> b!1061407 (=> (not res!708580) (not e!604334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67089 (_ BitVec 32)) Bool)

(assert (=> b!1061407 (= res!708580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708581 () Bool)

(assert (=> start!93950 (=> (not res!708581) (not e!604334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93950 (= res!708581 (validMask!0 mask!1515))))

(assert (=> start!93950 e!604334))

(assert (=> start!93950 true))

(declare-fun tp_is_empty!25009 () Bool)

(assert (=> start!93950 tp_is_empty!25009))

(declare-fun e!604335 () Bool)

(declare-fun array_inv!25002 (array!67087) Bool)

(assert (=> start!93950 (and (array_inv!25002 _values!955) e!604335)))

(assert (=> start!93950 tp!75017))

(declare-fun array_inv!25003 (array!67089) Bool)

(assert (=> start!93950 (array_inv!25003 _keys!1163)))

(declare-fun mapNonEmpty!39181 () Bool)

(declare-fun mapRes!39181 () Bool)

(declare-fun tp!75016 () Bool)

(declare-fun e!604332 () Bool)

(assert (=> mapNonEmpty!39181 (= mapRes!39181 (and tp!75016 e!604332))))

(declare-fun mapValue!39181 () ValueCell!11801)

(declare-fun mapKey!39181 () (_ BitVec 32))

(declare-fun mapRest!39181 () (Array (_ BitVec 32) ValueCell!11801))

(assert (=> mapNonEmpty!39181 (= (arr!32246 _values!955) (store mapRest!39181 mapKey!39181 mapValue!39181))))

(declare-fun b!1061408 () Bool)

(assert (=> b!1061408 (= e!604332 tp_is_empty!25009)))

(declare-fun b!1061409 () Bool)

(declare-fun e!604331 () Bool)

(assert (=> b!1061409 (= e!604335 (and e!604331 mapRes!39181))))

(declare-fun condMapEmpty!39181 () Bool)

(declare-fun mapDefault!39181 () ValueCell!11801)

(assert (=> b!1061409 (= condMapEmpty!39181 (= (arr!32246 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11801)) mapDefault!39181)))))

(declare-fun mapIsEmpty!39181 () Bool)

(assert (=> mapIsEmpty!39181 mapRes!39181))

(declare-fun b!1061410 () Bool)

(declare-fun res!708582 () Bool)

(assert (=> b!1061410 (=> (not res!708582) (not e!604334))))

(declare-datatypes ((List!22442 0))(
  ( (Nil!22439) (Cons!22438 (h!23656 (_ BitVec 64)) (t!31741 List!22442)) )
))
(declare-fun arrayNoDuplicates!0 (array!67089 (_ BitVec 32) List!22442) Bool)

(assert (=> b!1061410 (= res!708582 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22439))))

(declare-fun b!1061411 () Bool)

(assert (=> b!1061411 (= e!604331 tp_is_empty!25009)))

(assert (= (and start!93950 res!708581) b!1061406))

(assert (= (and b!1061406 res!708583) b!1061407))

(assert (= (and b!1061407 res!708580) b!1061410))

(assert (= (and b!1061410 res!708582) b!1061405))

(assert (= (and b!1061409 condMapEmpty!39181) mapIsEmpty!39181))

(assert (= (and b!1061409 (not condMapEmpty!39181)) mapNonEmpty!39181))

(get-info :version)

(assert (= (and mapNonEmpty!39181 ((_ is ValueCellFull!11801) mapValue!39181)) b!1061408))

(assert (= (and b!1061409 ((_ is ValueCellFull!11801) mapDefault!39181)) b!1061411))

(assert (= start!93950 b!1061409))

(declare-fun m!980951 () Bool)

(assert (=> b!1061405 m!980951))

(declare-fun m!980953 () Bool)

(assert (=> b!1061407 m!980953))

(declare-fun m!980955 () Bool)

(assert (=> mapNonEmpty!39181 m!980955))

(declare-fun m!980957 () Bool)

(assert (=> b!1061410 m!980957))

(declare-fun m!980959 () Bool)

(assert (=> start!93950 m!980959))

(declare-fun m!980961 () Bool)

(assert (=> start!93950 m!980961))

(declare-fun m!980963 () Bool)

(assert (=> start!93950 m!980963))

(check-sat b_and!33919 (not b!1061410) (not b_next!21199) (not start!93950) (not mapNonEmpty!39181) (not b!1061405) tp_is_empty!25009 (not b!1061407))
(check-sat b_and!33919 (not b_next!21199))
