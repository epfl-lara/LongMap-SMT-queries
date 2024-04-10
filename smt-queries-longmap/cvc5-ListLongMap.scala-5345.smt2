; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71432 () Bool)

(assert start!71432)

(declare-fun b_free!13477 () Bool)

(declare-fun b_next!13477 () Bool)

(assert (=> start!71432 (= b_free!13477 (not b_next!13477))))

(declare-fun tp!47211 () Bool)

(declare-fun b_and!22483 () Bool)

(assert (=> start!71432 (= tp!47211 b_and!22483)))

(declare-fun mapNonEmpty!24427 () Bool)

(declare-fun mapRes!24427 () Bool)

(declare-fun tp!47212 () Bool)

(declare-fun e!462433 () Bool)

(assert (=> mapNonEmpty!24427 (= mapRes!24427 (and tp!47212 e!462433))))

(declare-datatypes ((V!25251 0))(
  ( (V!25252 (val!7641 Int)) )
))
(declare-datatypes ((ValueCell!7178 0))(
  ( (ValueCellFull!7178 (v!10081 V!25251)) (EmptyCell!7178) )
))
(declare-fun mapRest!24427 () (Array (_ BitVec 32) ValueCell!7178))

(declare-fun mapValue!24427 () ValueCell!7178)

(declare-datatypes ((array!46540 0))(
  ( (array!46541 (arr!22308 (Array (_ BitVec 32) ValueCell!7178)) (size!22729 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46540)

(declare-fun mapKey!24427 () (_ BitVec 32))

(assert (=> mapNonEmpty!24427 (= (arr!22308 _values!788) (store mapRest!24427 mapKey!24427 mapValue!24427))))

(declare-fun res!565114 () Bool)

(declare-fun e!462431 () Bool)

(assert (=> start!71432 (=> (not res!565114) (not e!462431))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71432 (= res!565114 (validMask!0 mask!1312))))

(assert (=> start!71432 e!462431))

(declare-fun tp_is_empty!15187 () Bool)

(assert (=> start!71432 tp_is_empty!15187))

(declare-datatypes ((array!46542 0))(
  ( (array!46543 (arr!22309 (Array (_ BitVec 32) (_ BitVec 64))) (size!22730 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46542)

(declare-fun array_inv!17767 (array!46542) Bool)

(assert (=> start!71432 (array_inv!17767 _keys!976)))

(assert (=> start!71432 true))

(declare-fun e!462430 () Bool)

(declare-fun array_inv!17768 (array!46540) Bool)

(assert (=> start!71432 (and (array_inv!17768 _values!788) e!462430)))

(assert (=> start!71432 tp!47211))

(declare-fun b!829578 () Bool)

(declare-fun res!565115 () Bool)

(assert (=> b!829578 (=> (not res!565115) (not e!462431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46542 (_ BitVec 32)) Bool)

(assert (=> b!829578 (= res!565115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829579 () Bool)

(declare-fun res!565116 () Bool)

(assert (=> b!829579 (=> (not res!565116) (not e!462431))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829579 (= res!565116 (and (= (size!22729 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22730 _keys!976) (size!22729 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829580 () Bool)

(declare-fun e!462432 () Bool)

(assert (=> b!829580 (= e!462431 (not e!462432))))

(declare-fun res!565117 () Bool)

(assert (=> b!829580 (=> res!565117 e!462432)))

(assert (=> b!829580 (= res!565117 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10134 0))(
  ( (tuple2!10135 (_1!5078 (_ BitVec 64)) (_2!5078 V!25251)) )
))
(declare-datatypes ((List!15927 0))(
  ( (Nil!15924) (Cons!15923 (h!17052 tuple2!10134) (t!22288 List!15927)) )
))
(declare-datatypes ((ListLongMap!8957 0))(
  ( (ListLongMap!8958 (toList!4494 List!15927)) )
))
(declare-fun lt!376215 () ListLongMap!8957)

(declare-fun lt!376217 () ListLongMap!8957)

(assert (=> b!829580 (= lt!376215 lt!376217)))

(declare-fun zeroValueBefore!34 () V!25251)

(declare-fun zeroValueAfter!34 () V!25251)

(declare-fun minValue!754 () V!25251)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28409 0))(
  ( (Unit!28410) )
))
(declare-fun lt!376216 () Unit!28409)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!581 (array!46542 array!46540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25251 V!25251 V!25251 V!25251 (_ BitVec 32) Int) Unit!28409)

(assert (=> b!829580 (= lt!376216 (lemmaNoChangeToArrayThenSameMapNoExtras!581 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2493 (array!46542 array!46540 (_ BitVec 32) (_ BitVec 32) V!25251 V!25251 (_ BitVec 32) Int) ListLongMap!8957)

(assert (=> b!829580 (= lt!376217 (getCurrentListMapNoExtraKeys!2493 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829580 (= lt!376215 (getCurrentListMapNoExtraKeys!2493 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829581 () Bool)

(declare-fun res!565118 () Bool)

(assert (=> b!829581 (=> (not res!565118) (not e!462431))))

(declare-datatypes ((List!15928 0))(
  ( (Nil!15925) (Cons!15924 (h!17053 (_ BitVec 64)) (t!22289 List!15928)) )
))
(declare-fun arrayNoDuplicates!0 (array!46542 (_ BitVec 32) List!15928) Bool)

(assert (=> b!829581 (= res!565118 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15925))))

(declare-fun b!829582 () Bool)

(assert (=> b!829582 (= e!462433 tp_is_empty!15187)))

(declare-fun b!829583 () Bool)

(declare-fun e!462429 () Bool)

(assert (=> b!829583 (= e!462429 tp_is_empty!15187)))

(declare-fun mapIsEmpty!24427 () Bool)

(assert (=> mapIsEmpty!24427 mapRes!24427))

(declare-fun b!829584 () Bool)

(assert (=> b!829584 (= e!462430 (and e!462429 mapRes!24427))))

(declare-fun condMapEmpty!24427 () Bool)

(declare-fun mapDefault!24427 () ValueCell!7178)

