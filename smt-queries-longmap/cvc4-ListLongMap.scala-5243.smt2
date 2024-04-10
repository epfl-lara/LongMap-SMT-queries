; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70562 () Bool)

(assert start!70562)

(declare-fun b_free!12869 () Bool)

(declare-fun b_next!12869 () Bool)

(assert (=> start!70562 (= b_free!12869 (not b_next!12869))))

(declare-fun tp!45343 () Bool)

(declare-fun b_and!21711 () Bool)

(assert (=> start!70562 (= tp!45343 b_and!21711)))

(declare-fun b!819683 () Bool)

(declare-fun res!559320 () Bool)

(declare-fun e!455245 () Bool)

(assert (=> b!819683 (=> (not res!559320) (not e!455245))))

(declare-datatypes ((array!45356 0))(
  ( (array!45357 (arr!21731 (Array (_ BitVec 32) (_ BitVec 64))) (size!22152 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45356)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24439 0))(
  ( (V!24440 (val!7337 Int)) )
))
(declare-datatypes ((ValueCell!6874 0))(
  ( (ValueCellFull!6874 (v!9767 V!24439)) (EmptyCell!6874) )
))
(declare-datatypes ((array!45358 0))(
  ( (array!45359 (arr!21732 (Array (_ BitVec 32) ValueCell!6874)) (size!22153 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45358)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819683 (= res!559320 (and (= (size!22153 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22152 _keys!976) (size!22153 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!559317 () Bool)

(assert (=> start!70562 (=> (not res!559317) (not e!455245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70562 (= res!559317 (validMask!0 mask!1312))))

(assert (=> start!70562 e!455245))

(declare-fun tp_is_empty!14579 () Bool)

(assert (=> start!70562 tp_is_empty!14579))

(declare-fun array_inv!17369 (array!45356) Bool)

(assert (=> start!70562 (array_inv!17369 _keys!976)))

(assert (=> start!70562 true))

(declare-fun e!455246 () Bool)

(declare-fun array_inv!17370 (array!45358) Bool)

(assert (=> start!70562 (and (array_inv!17370 _values!788) e!455246)))

(assert (=> start!70562 tp!45343))

(declare-fun b!819684 () Bool)

(declare-fun zeroValueAfter!34 () V!24439)

(declare-datatypes ((tuple2!9658 0))(
  ( (tuple2!9659 (_1!4840 (_ BitVec 64)) (_2!4840 V!24439)) )
))
(declare-datatypes ((List!15484 0))(
  ( (Nil!15481) (Cons!15480 (h!16609 tuple2!9658) (t!21815 List!15484)) )
))
(declare-datatypes ((ListLongMap!8481 0))(
  ( (ListLongMap!8482 (toList!4256 List!15484)) )
))
(declare-fun lt!367979 () ListLongMap!8481)

(declare-fun lt!367985 () ListLongMap!8481)

(declare-fun e!455241 () Bool)

(declare-fun +!1852 (ListLongMap!8481 tuple2!9658) ListLongMap!8481)

(assert (=> b!819684 (= e!455241 (= lt!367985 (+!1852 lt!367979 (tuple2!9659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819685 () Bool)

(declare-fun e!455247 () Bool)

(assert (=> b!819685 (= e!455245 (not e!455247))))

(declare-fun res!559322 () Bool)

(assert (=> b!819685 (=> res!559322 e!455247)))

(assert (=> b!819685 (= res!559322 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!367984 () ListLongMap!8481)

(assert (=> b!819685 (= lt!367984 lt!367979)))

(declare-fun zeroValueBefore!34 () V!24439)

(declare-fun minValue!754 () V!24439)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27991 0))(
  ( (Unit!27992) )
))
(declare-fun lt!367977 () Unit!27991)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!397 (array!45356 array!45358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24439 V!24439 V!24439 V!24439 (_ BitVec 32) Int) Unit!27991)

(assert (=> b!819685 (= lt!367977 (lemmaNoChangeToArrayThenSameMapNoExtras!397 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2287 (array!45356 array!45358 (_ BitVec 32) (_ BitVec 32) V!24439 V!24439 (_ BitVec 32) Int) ListLongMap!8481)

(assert (=> b!819685 (= lt!367979 (getCurrentListMapNoExtraKeys!2287 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819685 (= lt!367984 (getCurrentListMapNoExtraKeys!2287 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819686 () Bool)

(declare-fun e!455243 () Bool)

(declare-fun mapRes!23470 () Bool)

(assert (=> b!819686 (= e!455246 (and e!455243 mapRes!23470))))

(declare-fun condMapEmpty!23470 () Bool)

(declare-fun mapDefault!23470 () ValueCell!6874)

