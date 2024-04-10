; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70174 () Bool)

(assert start!70174)

(declare-fun b_free!12581 () Bool)

(declare-fun b_next!12581 () Bool)

(assert (=> start!70174 (= b_free!12581 (not b_next!12581))))

(declare-fun tp!44461 () Bool)

(declare-fun b_and!21361 () Bool)

(assert (=> start!70174 (= tp!44461 b_and!21361)))

(declare-fun b!815340 () Bool)

(declare-fun e!452096 () Bool)

(assert (=> b!815340 (= e!452096 (not true))))

(declare-datatypes ((V!24055 0))(
  ( (V!24056 (val!7193 Int)) )
))
(declare-datatypes ((tuple2!9432 0))(
  ( (tuple2!9433 (_1!4727 (_ BitVec 64)) (_2!4727 V!24055)) )
))
(declare-datatypes ((List!15264 0))(
  ( (Nil!15261) (Cons!15260 (h!16389 tuple2!9432) (t!21583 List!15264)) )
))
(declare-datatypes ((ListLongMap!8255 0))(
  ( (ListLongMap!8256 (toList!4143 List!15264)) )
))
(declare-fun lt!365007 () ListLongMap!8255)

(declare-fun lt!365006 () ListLongMap!8255)

(assert (=> b!815340 (= lt!365007 lt!365006)))

(declare-fun zeroValueBefore!34 () V!24055)

(declare-datatypes ((array!44782 0))(
  ( (array!44783 (arr!21450 (Array (_ BitVec 32) (_ BitVec 64))) (size!21871 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44782)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24055)

(declare-fun minValue!754 () V!24055)

(declare-datatypes ((ValueCell!6730 0))(
  ( (ValueCellFull!6730 (v!9620 V!24055)) (EmptyCell!6730) )
))
(declare-datatypes ((array!44784 0))(
  ( (array!44785 (arr!21451 (Array (_ BitVec 32) ValueCell!6730)) (size!21872 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44784)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27784 0))(
  ( (Unit!27785) )
))
(declare-fun lt!365008 () Unit!27784)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!303 (array!44782 array!44784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24055 V!24055 V!24055 V!24055 (_ BitVec 32) Int) Unit!27784)

(assert (=> b!815340 (= lt!365008 (lemmaNoChangeToArrayThenSameMapNoExtras!303 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2193 (array!44782 array!44784 (_ BitVec 32) (_ BitVec 32) V!24055 V!24055 (_ BitVec 32) Int) ListLongMap!8255)

(assert (=> b!815340 (= lt!365006 (getCurrentListMapNoExtraKeys!2193 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815340 (= lt!365007 (getCurrentListMapNoExtraKeys!2193 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23020 () Bool)

(declare-fun mapRes!23020 () Bool)

(declare-fun tp!44460 () Bool)

(declare-fun e!452097 () Bool)

(assert (=> mapNonEmpty!23020 (= mapRes!23020 (and tp!44460 e!452097))))

(declare-fun mapKey!23020 () (_ BitVec 32))

(declare-fun mapValue!23020 () ValueCell!6730)

(declare-fun mapRest!23020 () (Array (_ BitVec 32) ValueCell!6730))

(assert (=> mapNonEmpty!23020 (= (arr!21451 _values!788) (store mapRest!23020 mapKey!23020 mapValue!23020))))

(declare-fun mapIsEmpty!23020 () Bool)

(assert (=> mapIsEmpty!23020 mapRes!23020))

(declare-fun b!815341 () Bool)

(declare-fun res!556774 () Bool)

(assert (=> b!815341 (=> (not res!556774) (not e!452096))))

(declare-datatypes ((List!15265 0))(
  ( (Nil!15262) (Cons!15261 (h!16390 (_ BitVec 64)) (t!21584 List!15265)) )
))
(declare-fun arrayNoDuplicates!0 (array!44782 (_ BitVec 32) List!15265) Bool)

(assert (=> b!815341 (= res!556774 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15262))))

(declare-fun res!556776 () Bool)

(assert (=> start!70174 (=> (not res!556776) (not e!452096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70174 (= res!556776 (validMask!0 mask!1312))))

(assert (=> start!70174 e!452096))

(declare-fun tp_is_empty!14291 () Bool)

(assert (=> start!70174 tp_is_empty!14291))

(declare-fun array_inv!17163 (array!44782) Bool)

(assert (=> start!70174 (array_inv!17163 _keys!976)))

(assert (=> start!70174 true))

(declare-fun e!452098 () Bool)

(declare-fun array_inv!17164 (array!44784) Bool)

(assert (=> start!70174 (and (array_inv!17164 _values!788) e!452098)))

(assert (=> start!70174 tp!44461))

(declare-fun b!815342 () Bool)

(declare-fun res!556777 () Bool)

(assert (=> b!815342 (=> (not res!556777) (not e!452096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44782 (_ BitVec 32)) Bool)

(assert (=> b!815342 (= res!556777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815343 () Bool)

(declare-fun res!556775 () Bool)

(assert (=> b!815343 (=> (not res!556775) (not e!452096))))

(assert (=> b!815343 (= res!556775 (and (= (size!21872 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21871 _keys!976) (size!21872 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815344 () Bool)

(assert (=> b!815344 (= e!452097 tp_is_empty!14291)))

(declare-fun b!815345 () Bool)

(declare-fun e!452095 () Bool)

(assert (=> b!815345 (= e!452098 (and e!452095 mapRes!23020))))

(declare-fun condMapEmpty!23020 () Bool)

(declare-fun mapDefault!23020 () ValueCell!6730)

