; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70482 () Bool)

(assert start!70482)

(declare-fun b_free!12809 () Bool)

(declare-fun b_next!12809 () Bool)

(assert (=> start!70482 (= b_free!12809 (not b_next!12809))))

(declare-fun tp!45159 () Bool)

(declare-fun b_and!21639 () Bool)

(assert (=> start!70482 (= tp!45159 b_and!21639)))

(declare-fun b!818679 () Bool)

(declare-fun res!558686 () Bool)

(declare-fun e!454490 () Bool)

(assert (=> b!818679 (=> (not res!558686) (not e!454490))))

(declare-datatypes ((array!45236 0))(
  ( (array!45237 (arr!21672 (Array (_ BitVec 32) (_ BitVec 64))) (size!22093 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45236)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24359 0))(
  ( (V!24360 (val!7307 Int)) )
))
(declare-datatypes ((ValueCell!6844 0))(
  ( (ValueCellFull!6844 (v!9736 V!24359)) (EmptyCell!6844) )
))
(declare-datatypes ((array!45238 0))(
  ( (array!45239 (arr!21673 (Array (_ BitVec 32) ValueCell!6844)) (size!22094 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45238)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818679 (= res!558686 (and (= (size!22094 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22093 _keys!976) (size!22094 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun zeroValueAfter!34 () V!24359)

(declare-datatypes ((tuple2!9602 0))(
  ( (tuple2!9603 (_1!4812 (_ BitVec 64)) (_2!4812 V!24359)) )
))
(declare-datatypes ((List!15436 0))(
  ( (Nil!15433) (Cons!15432 (h!16561 tuple2!9602) (t!21765 List!15436)) )
))
(declare-datatypes ((ListLongMap!8425 0))(
  ( (ListLongMap!8426 (toList!4228 List!15436)) )
))
(declare-fun lt!366929 () ListLongMap!8425)

(declare-fun lt!366931 () ListLongMap!8425)

(declare-fun e!454493 () Bool)

(declare-fun b!818680 () Bool)

(declare-fun +!1825 (ListLongMap!8425 tuple2!9602) ListLongMap!8425)

(assert (=> b!818680 (= e!454493 (= lt!366929 (+!1825 lt!366931 (tuple2!9603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!818681 () Bool)

(declare-fun res!558685 () Bool)

(assert (=> b!818681 (=> (not res!558685) (not e!454490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45236 (_ BitVec 32)) Bool)

(assert (=> b!818681 (= res!558685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23377 () Bool)

(declare-fun mapRes!23377 () Bool)

(assert (=> mapIsEmpty!23377 mapRes!23377))

(declare-fun b!818682 () Bool)

(declare-fun e!454489 () Bool)

(declare-fun tp_is_empty!14519 () Bool)

(assert (=> b!818682 (= e!454489 tp_is_empty!14519)))

(declare-fun mapNonEmpty!23377 () Bool)

(declare-fun tp!45160 () Bool)

(assert (=> mapNonEmpty!23377 (= mapRes!23377 (and tp!45160 e!454489))))

(declare-fun mapValue!23377 () ValueCell!6844)

(declare-fun mapRest!23377 () (Array (_ BitVec 32) ValueCell!6844))

(declare-fun mapKey!23377 () (_ BitVec 32))

(assert (=> mapNonEmpty!23377 (= (arr!21673 _values!788) (store mapRest!23377 mapKey!23377 mapValue!23377))))

(declare-fun res!558687 () Bool)

(assert (=> start!70482 (=> (not res!558687) (not e!454490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70482 (= res!558687 (validMask!0 mask!1312))))

(assert (=> start!70482 e!454490))

(assert (=> start!70482 tp_is_empty!14519))

(declare-fun array_inv!17329 (array!45236) Bool)

(assert (=> start!70482 (array_inv!17329 _keys!976)))

(assert (=> start!70482 true))

(declare-fun e!454488 () Bool)

(declare-fun array_inv!17330 (array!45238) Bool)

(assert (=> start!70482 (and (array_inv!17330 _values!788) e!454488)))

(assert (=> start!70482 tp!45159))

(declare-fun b!818683 () Bool)

(declare-fun res!558688 () Bool)

(assert (=> b!818683 (=> (not res!558688) (not e!454490))))

(declare-datatypes ((List!15437 0))(
  ( (Nil!15434) (Cons!15433 (h!16562 (_ BitVec 64)) (t!21766 List!15437)) )
))
(declare-fun arrayNoDuplicates!0 (array!45236 (_ BitVec 32) List!15437) Bool)

(assert (=> b!818683 (= res!558688 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15434))))

(declare-fun b!818684 () Bool)

(declare-fun e!454487 () Bool)

(assert (=> b!818684 (= e!454487 tp_is_empty!14519)))

(declare-fun b!818685 () Bool)

(assert (=> b!818685 (= e!454488 (and e!454487 mapRes!23377))))

(declare-fun condMapEmpty!23377 () Bool)

(declare-fun mapDefault!23377 () ValueCell!6844)

