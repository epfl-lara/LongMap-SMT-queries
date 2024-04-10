; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70704 () Bool)

(assert start!70704)

(declare-fun b_free!12977 () Bool)

(declare-fun b_next!12977 () Bool)

(assert (=> start!70704 (= b_free!12977 (not b_next!12977))))

(declare-fun tp!45673 () Bool)

(declare-fun b_and!21839 () Bool)

(assert (=> start!70704 (= tp!45673 b_and!21839)))

(declare-fun b!821241 () Bool)

(declare-fun res!560234 () Bool)

(declare-fun e!456380 () Bool)

(assert (=> b!821241 (=> (not res!560234) (not e!456380))))

(declare-datatypes ((array!45570 0))(
  ( (array!45571 (arr!21836 (Array (_ BitVec 32) (_ BitVec 64))) (size!22257 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45570)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45570 (_ BitVec 32)) Bool)

(assert (=> b!821241 (= res!560234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23638 () Bool)

(declare-fun mapRes!23638 () Bool)

(declare-fun tp!45672 () Bool)

(declare-fun e!456377 () Bool)

(assert (=> mapNonEmpty!23638 (= mapRes!23638 (and tp!45672 e!456377))))

(declare-fun mapKey!23638 () (_ BitVec 32))

(declare-datatypes ((V!24583 0))(
  ( (V!24584 (val!7391 Int)) )
))
(declare-datatypes ((ValueCell!6928 0))(
  ( (ValueCellFull!6928 (v!9822 V!24583)) (EmptyCell!6928) )
))
(declare-datatypes ((array!45572 0))(
  ( (array!45573 (arr!21837 (Array (_ BitVec 32) ValueCell!6928)) (size!22258 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45572)

(declare-fun mapValue!23638 () ValueCell!6928)

(declare-fun mapRest!23638 () (Array (_ BitVec 32) ValueCell!6928))

(assert (=> mapNonEmpty!23638 (= (arr!21837 _values!788) (store mapRest!23638 mapKey!23638 mapValue!23638))))

(declare-fun b!821242 () Bool)

(declare-fun e!456379 () Bool)

(assert (=> b!821242 (= e!456380 (not e!456379))))

(declare-fun res!560237 () Bool)

(assert (=> b!821242 (=> res!560237 e!456379)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821242 (= res!560237 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9748 0))(
  ( (tuple2!9749 (_1!4885 (_ BitVec 64)) (_2!4885 V!24583)) )
))
(declare-datatypes ((List!15567 0))(
  ( (Nil!15564) (Cons!15563 (h!16692 tuple2!9748) (t!21902 List!15567)) )
))
(declare-datatypes ((ListLongMap!8571 0))(
  ( (ListLongMap!8572 (toList!4301 List!15567)) )
))
(declare-fun lt!369122 () ListLongMap!8571)

(declare-fun lt!369123 () ListLongMap!8571)

(assert (=> b!821242 (= lt!369122 lt!369123)))

(declare-fun zeroValueBefore!34 () V!24583)

(declare-fun zeroValueAfter!34 () V!24583)

(declare-fun minValue!754 () V!24583)

(declare-datatypes ((Unit!28079 0))(
  ( (Unit!28080) )
))
(declare-fun lt!369124 () Unit!28079)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!437 (array!45570 array!45572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24583 V!24583 V!24583 V!24583 (_ BitVec 32) Int) Unit!28079)

(assert (=> b!821242 (= lt!369124 (lemmaNoChangeToArrayThenSameMapNoExtras!437 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2327 (array!45570 array!45572 (_ BitVec 32) (_ BitVec 32) V!24583 V!24583 (_ BitVec 32) Int) ListLongMap!8571)

(assert (=> b!821242 (= lt!369123 (getCurrentListMapNoExtraKeys!2327 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821242 (= lt!369122 (getCurrentListMapNoExtraKeys!2327 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821243 () Bool)

(declare-fun tp_is_empty!14687 () Bool)

(assert (=> b!821243 (= e!456377 tp_is_empty!14687)))

(declare-fun mapIsEmpty!23638 () Bool)

(assert (=> mapIsEmpty!23638 mapRes!23638))

(declare-fun b!821244 () Bool)

(declare-fun e!456375 () Bool)

(assert (=> b!821244 (= e!456375 tp_is_empty!14687)))

(declare-fun b!821245 () Bool)

(declare-fun e!456376 () Bool)

(assert (=> b!821245 (= e!456376 (and e!456375 mapRes!23638))))

(declare-fun condMapEmpty!23638 () Bool)

(declare-fun mapDefault!23638 () ValueCell!6928)

