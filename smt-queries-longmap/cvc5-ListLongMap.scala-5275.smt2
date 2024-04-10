; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70800 () Bool)

(assert start!70800)

(declare-fun b_free!13057 () Bool)

(declare-fun b_next!13057 () Bool)

(assert (=> start!70800 (= b_free!13057 (not b_next!13057))))

(declare-fun tp!45916 () Bool)

(declare-fun b_and!21929 () Bool)

(assert (=> start!70800 (= tp!45916 b_and!21929)))

(declare-fun b!822358 () Bool)

(declare-fun e!457203 () Bool)

(declare-fun tp_is_empty!14767 () Bool)

(assert (=> b!822358 (= e!457203 tp_is_empty!14767)))

(declare-fun b!822359 () Bool)

(declare-fun e!457202 () Bool)

(declare-fun e!457200 () Bool)

(assert (=> b!822359 (= e!457202 (not e!457200))))

(declare-fun res!560900 () Bool)

(assert (=> b!822359 (=> res!560900 e!457200)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822359 (= res!560900 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24691 0))(
  ( (V!24692 (val!7431 Int)) )
))
(declare-datatypes ((tuple2!9812 0))(
  ( (tuple2!9813 (_1!4917 (_ BitVec 64)) (_2!4917 V!24691)) )
))
(declare-datatypes ((List!15628 0))(
  ( (Nil!15625) (Cons!15624 (h!16753 tuple2!9812) (t!21965 List!15628)) )
))
(declare-datatypes ((ListLongMap!8635 0))(
  ( (ListLongMap!8636 (toList!4333 List!15628)) )
))
(declare-fun lt!370011 () ListLongMap!8635)

(declare-fun lt!370008 () ListLongMap!8635)

(assert (=> b!822359 (= lt!370011 lt!370008)))

(declare-fun zeroValueBefore!34 () V!24691)

(declare-datatypes ((array!45726 0))(
  ( (array!45727 (arr!21913 (Array (_ BitVec 32) (_ BitVec 64))) (size!22334 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45726)

(declare-fun zeroValueAfter!34 () V!24691)

(declare-fun minValue!754 () V!24691)

(declare-datatypes ((ValueCell!6968 0))(
  ( (ValueCellFull!6968 (v!9862 V!24691)) (EmptyCell!6968) )
))
(declare-datatypes ((array!45728 0))(
  ( (array!45729 (arr!21914 (Array (_ BitVec 32) ValueCell!6968)) (size!22335 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45728)

(declare-datatypes ((Unit!28130 0))(
  ( (Unit!28131) )
))
(declare-fun lt!370014 () Unit!28130)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!462 (array!45726 array!45728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24691 V!24691 V!24691 V!24691 (_ BitVec 32) Int) Unit!28130)

(assert (=> b!822359 (= lt!370014 (lemmaNoChangeToArrayThenSameMapNoExtras!462 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2352 (array!45726 array!45728 (_ BitVec 32) (_ BitVec 32) V!24691 V!24691 (_ BitVec 32) Int) ListLongMap!8635)

(assert (=> b!822359 (= lt!370008 (getCurrentListMapNoExtraKeys!2352 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822359 (= lt!370011 (getCurrentListMapNoExtraKeys!2352 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822360 () Bool)

(declare-fun res!560903 () Bool)

(assert (=> b!822360 (=> (not res!560903) (not e!457202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45726 (_ BitVec 32)) Bool)

(assert (=> b!822360 (= res!560903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822361 () Bool)

(declare-fun e!457201 () Bool)

(declare-fun e!457198 () Bool)

(declare-fun mapRes!23761 () Bool)

(assert (=> b!822361 (= e!457201 (and e!457198 mapRes!23761))))

(declare-fun condMapEmpty!23761 () Bool)

(declare-fun mapDefault!23761 () ValueCell!6968)

