; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70162 () Bool)

(assert start!70162)

(declare-fun b_free!12569 () Bool)

(declare-fun b_next!12569 () Bool)

(assert (=> start!70162 (= b_free!12569 (not b_next!12569))))

(declare-fun tp!44425 () Bool)

(declare-fun b_and!21349 () Bool)

(assert (=> start!70162 (= tp!44425 b_and!21349)))

(declare-fun b!815214 () Bool)

(declare-fun e!452006 () Bool)

(assert (=> b!815214 (= e!452006 (not true))))

(declare-datatypes ((V!24039 0))(
  ( (V!24040 (val!7187 Int)) )
))
(declare-datatypes ((tuple2!9426 0))(
  ( (tuple2!9427 (_1!4724 (_ BitVec 64)) (_2!4724 V!24039)) )
))
(declare-datatypes ((List!15257 0))(
  ( (Nil!15254) (Cons!15253 (h!16382 tuple2!9426) (t!21576 List!15257)) )
))
(declare-datatypes ((ListLongMap!8249 0))(
  ( (ListLongMap!8250 (toList!4140 List!15257)) )
))
(declare-fun lt!364953 () ListLongMap!8249)

(declare-fun lt!364952 () ListLongMap!8249)

(assert (=> b!815214 (= lt!364953 lt!364952)))

(declare-fun zeroValueBefore!34 () V!24039)

(declare-datatypes ((array!44762 0))(
  ( (array!44763 (arr!21440 (Array (_ BitVec 32) (_ BitVec 64))) (size!21861 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44762)

(declare-datatypes ((Unit!27778 0))(
  ( (Unit!27779) )
))
(declare-fun lt!364954 () Unit!27778)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24039)

(declare-fun minValue!754 () V!24039)

(declare-datatypes ((ValueCell!6724 0))(
  ( (ValueCellFull!6724 (v!9614 V!24039)) (EmptyCell!6724) )
))
(declare-datatypes ((array!44764 0))(
  ( (array!44765 (arr!21441 (Array (_ BitVec 32) ValueCell!6724)) (size!21862 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44764)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!300 (array!44762 array!44764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24039 V!24039 V!24039 V!24039 (_ BitVec 32) Int) Unit!27778)

(assert (=> b!815214 (= lt!364954 (lemmaNoChangeToArrayThenSameMapNoExtras!300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2190 (array!44762 array!44764 (_ BitVec 32) (_ BitVec 32) V!24039 V!24039 (_ BitVec 32) Int) ListLongMap!8249)

(assert (=> b!815214 (= lt!364952 (getCurrentListMapNoExtraKeys!2190 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815214 (= lt!364953 (getCurrentListMapNoExtraKeys!2190 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815215 () Bool)

(declare-fun res!556704 () Bool)

(assert (=> b!815215 (=> (not res!556704) (not e!452006))))

(declare-datatypes ((List!15258 0))(
  ( (Nil!15255) (Cons!15254 (h!16383 (_ BitVec 64)) (t!21577 List!15258)) )
))
(declare-fun arrayNoDuplicates!0 (array!44762 (_ BitVec 32) List!15258) Bool)

(assert (=> b!815215 (= res!556704 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15255))))

(declare-fun b!815216 () Bool)

(declare-fun res!556703 () Bool)

(assert (=> b!815216 (=> (not res!556703) (not e!452006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44762 (_ BitVec 32)) Bool)

(assert (=> b!815216 (= res!556703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815217 () Bool)

(declare-fun e!452007 () Bool)

(declare-fun tp_is_empty!14279 () Bool)

(assert (=> b!815217 (= e!452007 tp_is_empty!14279)))

(declare-fun res!556702 () Bool)

(assert (=> start!70162 (=> (not res!556702) (not e!452006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70162 (= res!556702 (validMask!0 mask!1312))))

(assert (=> start!70162 e!452006))

(assert (=> start!70162 tp_is_empty!14279))

(declare-fun array_inv!17155 (array!44762) Bool)

(assert (=> start!70162 (array_inv!17155 _keys!976)))

(assert (=> start!70162 true))

(declare-fun e!452005 () Bool)

(declare-fun array_inv!17156 (array!44764) Bool)

(assert (=> start!70162 (and (array_inv!17156 _values!788) e!452005)))

(assert (=> start!70162 tp!44425))

(declare-fun mapIsEmpty!23002 () Bool)

(declare-fun mapRes!23002 () Bool)

(assert (=> mapIsEmpty!23002 mapRes!23002))

(declare-fun mapNonEmpty!23002 () Bool)

(declare-fun tp!44424 () Bool)

(assert (=> mapNonEmpty!23002 (= mapRes!23002 (and tp!44424 e!452007))))

(declare-fun mapRest!23002 () (Array (_ BitVec 32) ValueCell!6724))

(declare-fun mapKey!23002 () (_ BitVec 32))

(declare-fun mapValue!23002 () ValueCell!6724)

(assert (=> mapNonEmpty!23002 (= (arr!21441 _values!788) (store mapRest!23002 mapKey!23002 mapValue!23002))))

(declare-fun b!815218 () Bool)

(declare-fun e!452008 () Bool)

(assert (=> b!815218 (= e!452008 tp_is_empty!14279)))

(declare-fun b!815219 () Bool)

(declare-fun res!556705 () Bool)

(assert (=> b!815219 (=> (not res!556705) (not e!452006))))

(assert (=> b!815219 (= res!556705 (and (= (size!21862 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21861 _keys!976) (size!21862 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815220 () Bool)

(assert (=> b!815220 (= e!452005 (and e!452008 mapRes!23002))))

(declare-fun condMapEmpty!23002 () Bool)

(declare-fun mapDefault!23002 () ValueCell!6724)

