; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71162 () Bool)

(assert start!71162)

(declare-fun b_free!13329 () Bool)

(declare-fun b_next!13329 () Bool)

(assert (=> start!71162 (= b_free!13329 (not b_next!13329))))

(declare-fun tp!46747 () Bool)

(declare-fun b_and!22255 () Bool)

(assert (=> start!71162 (= tp!46747 b_and!22255)))

(declare-datatypes ((V!25053 0))(
  ( (V!25054 (val!7567 Int)) )
))
(declare-datatypes ((tuple2!10026 0))(
  ( (tuple2!10027 (_1!5024 (_ BitVec 64)) (_2!5024 V!25053)) )
))
(declare-fun lt!374196 () tuple2!10026)

(declare-datatypes ((List!15823 0))(
  ( (Nil!15820) (Cons!15819 (h!16948 tuple2!10026) (t!22170 List!15823)) )
))
(declare-datatypes ((ListLongMap!8849 0))(
  ( (ListLongMap!8850 (toList!4440 List!15823)) )
))
(declare-fun lt!374200 () ListLongMap!8849)

(declare-fun lt!374197 () ListLongMap!8849)

(declare-fun b!826604 () Bool)

(declare-fun e!460332 () Bool)

(declare-fun lt!374194 () tuple2!10026)

(declare-fun +!1947 (ListLongMap!8849 tuple2!10026) ListLongMap!8849)

(assert (=> b!826604 (= e!460332 (= lt!374200 (+!1947 (+!1947 lt!374197 lt!374196) lt!374194)))))

(declare-fun b!826605 () Bool)

(declare-fun e!460339 () Bool)

(declare-fun tp_is_empty!15039 () Bool)

(assert (=> b!826605 (= e!460339 tp_is_empty!15039)))

(declare-fun b!826606 () Bool)

(declare-fun e!460334 () Bool)

(assert (=> b!826606 (= e!460334 true)))

(declare-fun lt!374201 () ListLongMap!8849)

(declare-fun lt!374206 () ListLongMap!8849)

(assert (=> b!826606 (= lt!374206 (+!1947 (+!1947 lt!374201 lt!374194) lt!374196))))

(declare-fun lt!374198 () ListLongMap!8849)

(declare-fun lt!374205 () ListLongMap!8849)

(assert (=> b!826606 (and (= lt!374198 lt!374205) (= lt!374200 lt!374205) (= lt!374200 lt!374198))))

(declare-fun lt!374199 () ListLongMap!8849)

(assert (=> b!826606 (= lt!374205 (+!1947 lt!374199 lt!374194))))

(declare-fun lt!374193 () ListLongMap!8849)

(assert (=> b!826606 (= lt!374198 (+!1947 lt!374193 lt!374194))))

(declare-fun zeroValueBefore!34 () V!25053)

(declare-fun zeroValueAfter!34 () V!25053)

(declare-datatypes ((Unit!28341 0))(
  ( (Unit!28342) )
))
(declare-fun lt!374204 () Unit!28341)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!229 (ListLongMap!8849 (_ BitVec 64) V!25053 V!25053) Unit!28341)

(assert (=> b!826606 (= lt!374204 (addSameAsAddTwiceSameKeyDiffValues!229 lt!374193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826606 e!460332))

(declare-fun res!563477 () Bool)

(assert (=> b!826606 (=> (not res!563477) (not e!460332))))

(declare-fun lt!374202 () ListLongMap!8849)

(assert (=> b!826606 (= res!563477 (= lt!374202 lt!374199))))

(declare-fun lt!374203 () tuple2!10026)

(assert (=> b!826606 (= lt!374199 (+!1947 lt!374193 lt!374203))))

(assert (=> b!826606 (= lt!374193 (+!1947 lt!374201 lt!374196))))

(assert (=> b!826606 (= lt!374194 (tuple2!10027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460338 () Bool)

(assert (=> b!826606 e!460338))

(declare-fun res!563472 () Bool)

(assert (=> b!826606 (=> (not res!563472) (not e!460338))))

(assert (=> b!826606 (= res!563472 (= lt!374202 (+!1947 (+!1947 lt!374201 lt!374203) lt!374196)))))

(declare-fun minValue!754 () V!25053)

(assert (=> b!826606 (= lt!374196 (tuple2!10027 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826606 (= lt!374203 (tuple2!10027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46256 0))(
  ( (array!46257 (arr!22173 (Array (_ BitVec 32) (_ BitVec 64))) (size!22594 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46256)

(declare-datatypes ((ValueCell!7104 0))(
  ( (ValueCellFull!7104 (v!10001 V!25053)) (EmptyCell!7104) )
))
(declare-datatypes ((array!46258 0))(
  ( (array!46259 (arr!22174 (Array (_ BitVec 32) ValueCell!7104)) (size!22595 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46258)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2569 (array!46256 array!46258 (_ BitVec 32) (_ BitVec 32) V!25053 V!25053 (_ BitVec 32) Int) ListLongMap!8849)

(assert (=> b!826606 (= lt!374200 (getCurrentListMap!2569 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826606 (= lt!374202 (getCurrentListMap!2569 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24184 () Bool)

(declare-fun mapRes!24184 () Bool)

(assert (=> mapIsEmpty!24184 mapRes!24184))

(declare-fun b!826607 () Bool)

(declare-fun e!460333 () Bool)

(assert (=> b!826607 (= e!460333 (not e!460334))))

(declare-fun res!563474 () Bool)

(assert (=> b!826607 (=> res!563474 e!460334)))

(assert (=> b!826607 (= res!563474 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826607 (= lt!374201 lt!374197)))

(declare-fun lt!374195 () Unit!28341)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!555 (array!46256 array!46258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25053 V!25053 V!25053 V!25053 (_ BitVec 32) Int) Unit!28341)

(assert (=> b!826607 (= lt!374195 (lemmaNoChangeToArrayThenSameMapNoExtras!555 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2445 (array!46256 array!46258 (_ BitVec 32) (_ BitVec 32) V!25053 V!25053 (_ BitVec 32) Int) ListLongMap!8849)

(assert (=> b!826607 (= lt!374197 (getCurrentListMapNoExtraKeys!2445 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826607 (= lt!374201 (getCurrentListMapNoExtraKeys!2445 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826608 () Bool)

(declare-fun e!460337 () Bool)

(assert (=> b!826608 (= e!460337 tp_is_empty!15039)))

(declare-fun b!826609 () Bool)

(declare-fun res!563473 () Bool)

(assert (=> b!826609 (=> (not res!563473) (not e!460333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46256 (_ BitVec 32)) Bool)

(assert (=> b!826609 (= res!563473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826610 () Bool)

(declare-fun res!563478 () Bool)

(assert (=> b!826610 (=> (not res!563478) (not e!460333))))

(assert (=> b!826610 (= res!563478 (and (= (size!22595 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22594 _keys!976) (size!22595 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826611 () Bool)

(assert (=> b!826611 (= e!460338 (= lt!374200 (+!1947 (+!1947 lt!374197 (tuple2!10027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374196)))))

(declare-fun b!826612 () Bool)

(declare-fun e!460336 () Bool)

(assert (=> b!826612 (= e!460336 (and e!460337 mapRes!24184))))

(declare-fun condMapEmpty!24184 () Bool)

(declare-fun mapDefault!24184 () ValueCell!7104)

(assert (=> b!826612 (= condMapEmpty!24184 (= (arr!22174 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7104)) mapDefault!24184)))))

(declare-fun res!563475 () Bool)

(assert (=> start!71162 (=> (not res!563475) (not e!460333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71162 (= res!563475 (validMask!0 mask!1312))))

(assert (=> start!71162 e!460333))

(assert (=> start!71162 tp_is_empty!15039))

(declare-fun array_inv!17673 (array!46256) Bool)

(assert (=> start!71162 (array_inv!17673 _keys!976)))

(assert (=> start!71162 true))

(declare-fun array_inv!17674 (array!46258) Bool)

(assert (=> start!71162 (and (array_inv!17674 _values!788) e!460336)))

(assert (=> start!71162 tp!46747))

(declare-fun b!826613 () Bool)

(declare-fun res!563476 () Bool)

(assert (=> b!826613 (=> (not res!563476) (not e!460333))))

(declare-datatypes ((List!15824 0))(
  ( (Nil!15821) (Cons!15820 (h!16949 (_ BitVec 64)) (t!22171 List!15824)) )
))
(declare-fun arrayNoDuplicates!0 (array!46256 (_ BitVec 32) List!15824) Bool)

(assert (=> b!826613 (= res!563476 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15821))))

(declare-fun mapNonEmpty!24184 () Bool)

(declare-fun tp!46746 () Bool)

(assert (=> mapNonEmpty!24184 (= mapRes!24184 (and tp!46746 e!460339))))

(declare-fun mapValue!24184 () ValueCell!7104)

(declare-fun mapRest!24184 () (Array (_ BitVec 32) ValueCell!7104))

(declare-fun mapKey!24184 () (_ BitVec 32))

(assert (=> mapNonEmpty!24184 (= (arr!22174 _values!788) (store mapRest!24184 mapKey!24184 mapValue!24184))))

(assert (= (and start!71162 res!563475) b!826610))

(assert (= (and b!826610 res!563478) b!826609))

(assert (= (and b!826609 res!563473) b!826613))

(assert (= (and b!826613 res!563476) b!826607))

(assert (= (and b!826607 (not res!563474)) b!826606))

(assert (= (and b!826606 res!563472) b!826611))

(assert (= (and b!826606 res!563477) b!826604))

(assert (= (and b!826612 condMapEmpty!24184) mapIsEmpty!24184))

(assert (= (and b!826612 (not condMapEmpty!24184)) mapNonEmpty!24184))

(get-info :version)

(assert (= (and mapNonEmpty!24184 ((_ is ValueCellFull!7104) mapValue!24184)) b!826605))

(assert (= (and b!826612 ((_ is ValueCellFull!7104) mapDefault!24184)) b!826608))

(assert (= start!71162 b!826612))

(declare-fun m!769443 () Bool)

(assert (=> start!71162 m!769443))

(declare-fun m!769445 () Bool)

(assert (=> start!71162 m!769445))

(declare-fun m!769447 () Bool)

(assert (=> start!71162 m!769447))

(declare-fun m!769449 () Bool)

(assert (=> b!826613 m!769449))

(declare-fun m!769451 () Bool)

(assert (=> mapNonEmpty!24184 m!769451))

(declare-fun m!769453 () Bool)

(assert (=> b!826611 m!769453))

(assert (=> b!826611 m!769453))

(declare-fun m!769455 () Bool)

(assert (=> b!826611 m!769455))

(declare-fun m!769457 () Bool)

(assert (=> b!826604 m!769457))

(assert (=> b!826604 m!769457))

(declare-fun m!769459 () Bool)

(assert (=> b!826604 m!769459))

(declare-fun m!769461 () Bool)

(assert (=> b!826607 m!769461))

(declare-fun m!769463 () Bool)

(assert (=> b!826607 m!769463))

(declare-fun m!769465 () Bool)

(assert (=> b!826607 m!769465))

(declare-fun m!769467 () Bool)

(assert (=> b!826606 m!769467))

(declare-fun m!769469 () Bool)

(assert (=> b!826606 m!769469))

(assert (=> b!826606 m!769467))

(declare-fun m!769471 () Bool)

(assert (=> b!826606 m!769471))

(declare-fun m!769473 () Bool)

(assert (=> b!826606 m!769473))

(declare-fun m!769475 () Bool)

(assert (=> b!826606 m!769475))

(declare-fun m!769477 () Bool)

(assert (=> b!826606 m!769477))

(declare-fun m!769479 () Bool)

(assert (=> b!826606 m!769479))

(declare-fun m!769481 () Bool)

(assert (=> b!826606 m!769481))

(declare-fun m!769483 () Bool)

(assert (=> b!826606 m!769483))

(assert (=> b!826606 m!769479))

(declare-fun m!769485 () Bool)

(assert (=> b!826606 m!769485))

(declare-fun m!769487 () Bool)

(assert (=> b!826606 m!769487))

(declare-fun m!769489 () Bool)

(assert (=> b!826609 m!769489))

(check-sat b_and!22255 (not b!826613) tp_is_empty!15039 (not start!71162) (not b!826606) (not b_next!13329) (not b!826611) (not b!826607) (not b!826609) (not b!826604) (not mapNonEmpty!24184))
(check-sat b_and!22255 (not b_next!13329))
