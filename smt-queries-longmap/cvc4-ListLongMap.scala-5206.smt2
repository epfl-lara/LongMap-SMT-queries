; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70272 () Bool)

(assert start!70272)

(declare-fun b_free!12647 () Bool)

(declare-fun b_next!12647 () Bool)

(assert (=> start!70272 (= b_free!12647 (not b_next!12647))))

(declare-fun tp!44665 () Bool)

(declare-fun b_and!21447 () Bool)

(assert (=> start!70272 (= tp!44665 b_and!21447)))

(declare-fun b!816391 () Bool)

(declare-fun e!452847 () Bool)

(declare-fun tp_is_empty!14357 () Bool)

(assert (=> b!816391 (= e!452847 tp_is_empty!14357)))

(declare-fun b!816392 () Bool)

(declare-fun res!557372 () Bool)

(declare-fun e!452848 () Bool)

(assert (=> b!816392 (=> (not res!557372) (not e!452848))))

(declare-datatypes ((array!44916 0))(
  ( (array!44917 (arr!21515 (Array (_ BitVec 32) (_ BitVec 64))) (size!21936 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44916)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44916 (_ BitVec 32)) Bool)

(assert (=> b!816392 (= res!557372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23125 () Bool)

(declare-fun mapRes!23125 () Bool)

(assert (=> mapIsEmpty!23125 mapRes!23125))

(declare-fun res!557373 () Bool)

(assert (=> start!70272 (=> (not res!557373) (not e!452848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70272 (= res!557373 (validMask!0 mask!1312))))

(assert (=> start!70272 e!452848))

(assert (=> start!70272 tp_is_empty!14357))

(declare-fun array_inv!17215 (array!44916) Bool)

(assert (=> start!70272 (array_inv!17215 _keys!976)))

(assert (=> start!70272 true))

(declare-datatypes ((V!24143 0))(
  ( (V!24144 (val!7226 Int)) )
))
(declare-datatypes ((ValueCell!6763 0))(
  ( (ValueCellFull!6763 (v!9654 V!24143)) (EmptyCell!6763) )
))
(declare-datatypes ((array!44918 0))(
  ( (array!44919 (arr!21516 (Array (_ BitVec 32) ValueCell!6763)) (size!21937 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44918)

(declare-fun e!452846 () Bool)

(declare-fun array_inv!17216 (array!44918) Bool)

(assert (=> start!70272 (and (array_inv!17216 _values!788) e!452846)))

(assert (=> start!70272 tp!44665))

(declare-fun b!816393 () Bool)

(declare-fun e!452845 () Bool)

(assert (=> b!816393 (= e!452845 tp_is_empty!14357)))

(declare-fun b!816394 () Bool)

(declare-fun e!452843 () Bool)

(assert (=> b!816394 (= e!452843 true)))

(declare-fun zeroValueAfter!34 () V!24143)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun minValue!754 () V!24143)

(declare-datatypes ((tuple2!9492 0))(
  ( (tuple2!9493 (_1!4757 (_ BitVec 64)) (_2!4757 V!24143)) )
))
(declare-datatypes ((List!15321 0))(
  ( (Nil!15318) (Cons!15317 (h!16446 tuple2!9492) (t!21644 List!15321)) )
))
(declare-datatypes ((ListLongMap!8315 0))(
  ( (ListLongMap!8316 (toList!4173 List!15321)) )
))
(declare-fun lt!365646 () ListLongMap!8315)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2399 (array!44916 array!44918 (_ BitVec 32) (_ BitVec 32) V!24143 V!24143 (_ BitVec 32) Int) ListLongMap!8315)

(assert (=> b!816394 (= lt!365646 (getCurrentListMap!2399 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24143)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365644 () ListLongMap!8315)

(declare-fun +!1805 (ListLongMap!8315 tuple2!9492) ListLongMap!8315)

(assert (=> b!816394 (= lt!365644 (+!1805 (getCurrentListMap!2399 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapNonEmpty!23125 () Bool)

(declare-fun tp!44664 () Bool)

(assert (=> mapNonEmpty!23125 (= mapRes!23125 (and tp!44664 e!452845))))

(declare-fun mapRest!23125 () (Array (_ BitVec 32) ValueCell!6763))

(declare-fun mapKey!23125 () (_ BitVec 32))

(declare-fun mapValue!23125 () ValueCell!6763)

(assert (=> mapNonEmpty!23125 (= (arr!21516 _values!788) (store mapRest!23125 mapKey!23125 mapValue!23125))))

(declare-fun b!816395 () Bool)

(declare-fun res!557376 () Bool)

(assert (=> b!816395 (=> (not res!557376) (not e!452848))))

(declare-datatypes ((List!15322 0))(
  ( (Nil!15319) (Cons!15318 (h!16447 (_ BitVec 64)) (t!21645 List!15322)) )
))
(declare-fun arrayNoDuplicates!0 (array!44916 (_ BitVec 32) List!15322) Bool)

(assert (=> b!816395 (= res!557376 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15319))))

(declare-fun b!816396 () Bool)

(assert (=> b!816396 (= e!452846 (and e!452847 mapRes!23125))))

(declare-fun condMapEmpty!23125 () Bool)

(declare-fun mapDefault!23125 () ValueCell!6763)

