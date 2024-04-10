; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71584 () Bool)

(assert start!71584)

(declare-fun b_free!13505 () Bool)

(declare-fun b_next!13505 () Bool)

(assert (=> start!71584 (= b_free!13505 (not b_next!13505))))

(declare-fun tp!47307 () Bool)

(declare-fun b_and!22563 () Bool)

(assert (=> start!71584 (= tp!47307 b_and!22563)))

(declare-fun res!566100 () Bool)

(declare-fun e!463881 () Bool)

(assert (=> start!71584 (=> (not res!566100) (not e!463881))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71584 (= res!566100 (validMask!0 mask!1312))))

(assert (=> start!71584 e!463881))

(declare-fun tp_is_empty!15215 () Bool)

(assert (=> start!71584 tp_is_empty!15215))

(declare-datatypes ((array!46602 0))(
  ( (array!46603 (arr!22336 (Array (_ BitVec 32) (_ BitVec 64))) (size!22757 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46602)

(declare-fun array_inv!17789 (array!46602) Bool)

(assert (=> start!71584 (array_inv!17789 _keys!976)))

(assert (=> start!71584 true))

(declare-datatypes ((V!25287 0))(
  ( (V!25288 (val!7655 Int)) )
))
(declare-datatypes ((ValueCell!7192 0))(
  ( (ValueCellFull!7192 (v!10100 V!25287)) (EmptyCell!7192) )
))
(declare-datatypes ((array!46604 0))(
  ( (array!46605 (arr!22337 (Array (_ BitVec 32) ValueCell!7192)) (size!22758 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46604)

(declare-fun e!463882 () Bool)

(declare-fun array_inv!17790 (array!46604) Bool)

(assert (=> start!71584 (and (array_inv!17790 _values!788) e!463882)))

(assert (=> start!71584 tp!47307))

(declare-fun b!831825 () Bool)

(declare-fun res!566102 () Bool)

(assert (=> b!831825 (=> (not res!566102) (not e!463881))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!831825 (= res!566102 (and (= (size!22758 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22757 _keys!976) (size!22758 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10158 0))(
  ( (tuple2!10159 (_1!5090 (_ BitVec 64)) (_2!5090 V!25287)) )
))
(declare-datatypes ((List!15951 0))(
  ( (Nil!15948) (Cons!15947 (h!17077 tuple2!10158) (t!22319 List!15951)) )
))
(declare-datatypes ((ListLongMap!8981 0))(
  ( (ListLongMap!8982 (toList!4506 List!15951)) )
))
(declare-fun lt!377446 () ListLongMap!8981)

(declare-fun b!831826 () Bool)

(declare-fun lt!377449 () tuple2!10158)

(declare-fun zeroValueAfter!34 () V!25287)

(declare-fun lt!377448 () ListLongMap!8981)

(declare-fun e!463886 () Bool)

(declare-fun +!1984 (ListLongMap!8981 tuple2!10158) ListLongMap!8981)

(assert (=> b!831826 (= e!463886 (= lt!377446 (+!1984 (+!1984 lt!377448 lt!377449) (tuple2!10159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!463883 () Bool)

(assert (=> b!831826 e!463883))

(declare-fun res!566099 () Bool)

(assert (=> b!831826 (=> (not res!566099) (not e!463883))))

(declare-fun lt!377447 () ListLongMap!8981)

(declare-fun lt!377445 () ListLongMap!8981)

(declare-fun lt!377444 () tuple2!10158)

(assert (=> b!831826 (= res!566099 (= lt!377445 (+!1984 (+!1984 lt!377447 lt!377444) lt!377449)))))

(declare-fun minValue!754 () V!25287)

(assert (=> b!831826 (= lt!377449 (tuple2!10159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun zeroValueBefore!34 () V!25287)

(assert (=> b!831826 (= lt!377444 (tuple2!10159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2602 (array!46602 array!46604 (_ BitVec 32) (_ BitVec 32) V!25287 V!25287 (_ BitVec 32) Int) ListLongMap!8981)

(assert (=> b!831826 (= lt!377446 (getCurrentListMap!2602 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!831826 (= lt!377445 (getCurrentListMap!2602 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831827 () Bool)

(declare-fun res!566097 () Bool)

(assert (=> b!831827 (=> (not res!566097) (not e!463883))))

(assert (=> b!831827 (= res!566097 (= lt!377446 (+!1984 (+!1984 lt!377448 (tuple2!10159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377449)))))

(declare-fun mapNonEmpty!24480 () Bool)

(declare-fun mapRes!24480 () Bool)

(declare-fun tp!47306 () Bool)

(declare-fun e!463880 () Bool)

(assert (=> mapNonEmpty!24480 (= mapRes!24480 (and tp!47306 e!463880))))

(declare-fun mapValue!24480 () ValueCell!7192)

(declare-fun mapKey!24480 () (_ BitVec 32))

(declare-fun mapRest!24480 () (Array (_ BitVec 32) ValueCell!7192))

(assert (=> mapNonEmpty!24480 (= (arr!22337 _values!788) (store mapRest!24480 mapKey!24480 mapValue!24480))))

(declare-fun b!831828 () Bool)

(assert (=> b!831828 (= e!463883 (= lt!377445 (+!1984 (+!1984 lt!377447 lt!377449) lt!377444)))))

(declare-fun b!831829 () Bool)

(declare-fun e!463885 () Bool)

(assert (=> b!831829 (= e!463885 tp_is_empty!15215)))

(declare-fun b!831830 () Bool)

(assert (=> b!831830 (= e!463881 (not e!463886))))

(declare-fun res!566101 () Bool)

(assert (=> b!831830 (=> res!566101 e!463886)))

(assert (=> b!831830 (= res!566101 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!831830 (= lt!377447 lt!377448)))

(declare-datatypes ((Unit!28495 0))(
  ( (Unit!28496) )
))
(declare-fun lt!377443 () Unit!28495)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!593 (array!46602 array!46604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25287 V!25287 V!25287 V!25287 (_ BitVec 32) Int) Unit!28495)

(assert (=> b!831830 (= lt!377443 (lemmaNoChangeToArrayThenSameMapNoExtras!593 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2505 (array!46602 array!46604 (_ BitVec 32) (_ BitVec 32) V!25287 V!25287 (_ BitVec 32) Int) ListLongMap!8981)

(assert (=> b!831830 (= lt!377448 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!831830 (= lt!377447 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831831 () Bool)

(assert (=> b!831831 (= e!463880 tp_is_empty!15215)))

(declare-fun b!831832 () Bool)

(declare-fun res!566098 () Bool)

(assert (=> b!831832 (=> (not res!566098) (not e!463881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46602 (_ BitVec 32)) Bool)

(assert (=> b!831832 (= res!566098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!831833 () Bool)

(declare-fun res!566096 () Bool)

(assert (=> b!831833 (=> (not res!566096) (not e!463881))))

(declare-datatypes ((List!15952 0))(
  ( (Nil!15949) (Cons!15948 (h!17078 (_ BitVec 64)) (t!22320 List!15952)) )
))
(declare-fun arrayNoDuplicates!0 (array!46602 (_ BitVec 32) List!15952) Bool)

(assert (=> b!831833 (= res!566096 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15949))))

(declare-fun b!831834 () Bool)

(assert (=> b!831834 (= e!463882 (and e!463885 mapRes!24480))))

(declare-fun condMapEmpty!24480 () Bool)

(declare-fun mapDefault!24480 () ValueCell!7192)

