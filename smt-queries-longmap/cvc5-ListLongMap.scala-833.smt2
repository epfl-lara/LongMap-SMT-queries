; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20094 () Bool)

(assert start!20094)

(declare-fun b_free!4753 () Bool)

(declare-fun b_next!4753 () Bool)

(assert (=> start!20094 (= b_free!4753 (not b_next!4753))))

(declare-fun tp!17290 () Bool)

(declare-fun b_and!11499 () Bool)

(assert (=> start!20094 (= tp!17290 b_and!11499)))

(declare-fun b!196844 () Bool)

(declare-fun res!92972 () Bool)

(declare-fun e!129627 () Bool)

(assert (=> b!196844 (=> (not res!92972) (not e!129627))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196844 (= res!92972 (validKeyInArray!0 k!843))))

(declare-fun res!92974 () Bool)

(assert (=> start!20094 (=> (not res!92974) (not e!129627))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20094 (= res!92974 (validMask!0 mask!1149))))

(assert (=> start!20094 e!129627))

(declare-datatypes ((V!5793 0))(
  ( (V!5794 (val!2349 Int)) )
))
(declare-datatypes ((ValueCell!1961 0))(
  ( (ValueCellFull!1961 (v!4319 V!5793)) (EmptyCell!1961) )
))
(declare-datatypes ((array!8473 0))(
  ( (array!8474 (arr!3987 (Array (_ BitVec 32) ValueCell!1961)) (size!4312 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8473)

(declare-fun e!129626 () Bool)

(declare-fun array_inv!2601 (array!8473) Bool)

(assert (=> start!20094 (and (array_inv!2601 _values!649) e!129626)))

(assert (=> start!20094 true))

(declare-fun tp_is_empty!4609 () Bool)

(assert (=> start!20094 tp_is_empty!4609))

(declare-datatypes ((array!8475 0))(
  ( (array!8476 (arr!3988 (Array (_ BitVec 32) (_ BitVec 64))) (size!4313 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8475)

(declare-fun array_inv!2602 (array!8475) Bool)

(assert (=> start!20094 (array_inv!2602 _keys!825)))

(assert (=> start!20094 tp!17290))

(declare-fun b!196845 () Bool)

(declare-fun res!92973 () Bool)

(assert (=> b!196845 (=> (not res!92973) (not e!129627))))

(declare-datatypes ((List!2490 0))(
  ( (Nil!2487) (Cons!2486 (h!3128 (_ BitVec 64)) (t!7421 List!2490)) )
))
(declare-fun arrayNoDuplicates!0 (array!8475 (_ BitVec 32) List!2490) Bool)

(assert (=> b!196845 (= res!92973 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2487))))

(declare-fun mapNonEmpty!7982 () Bool)

(declare-fun mapRes!7982 () Bool)

(declare-fun tp!17291 () Bool)

(declare-fun e!129628 () Bool)

(assert (=> mapNonEmpty!7982 (= mapRes!7982 (and tp!17291 e!129628))))

(declare-fun mapKey!7982 () (_ BitVec 32))

(declare-fun mapRest!7982 () (Array (_ BitVec 32) ValueCell!1961))

(declare-fun mapValue!7982 () ValueCell!1961)

(assert (=> mapNonEmpty!7982 (= (arr!3987 _values!649) (store mapRest!7982 mapKey!7982 mapValue!7982))))

(declare-fun b!196846 () Bool)

(declare-fun e!129629 () Bool)

(assert (=> b!196846 (= e!129629 tp_is_empty!4609)))

(declare-fun b!196847 () Bool)

(assert (=> b!196847 (= e!129628 tp_is_empty!4609)))

(declare-fun b!196848 () Bool)

(declare-fun res!92976 () Bool)

(assert (=> b!196848 (=> (not res!92976) (not e!129627))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196848 (= res!92976 (and (= (size!4312 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4313 _keys!825) (size!4312 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7982 () Bool)

(assert (=> mapIsEmpty!7982 mapRes!7982))

(declare-fun b!196849 () Bool)

(assert (=> b!196849 (= e!129627 false)))

(declare-datatypes ((tuple2!3578 0))(
  ( (tuple2!3579 (_1!1800 (_ BitVec 64)) (_2!1800 V!5793)) )
))
(declare-datatypes ((List!2491 0))(
  ( (Nil!2488) (Cons!2487 (h!3129 tuple2!3578) (t!7422 List!2491)) )
))
(declare-datatypes ((ListLongMap!2491 0))(
  ( (ListLongMap!2492 (toList!1261 List!2491)) )
))
(declare-fun lt!97659 () ListLongMap!2491)

(declare-fun zeroValue!615 () V!5793)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5793)

(declare-fun getCurrentListMapNoExtraKeys!226 (array!8475 array!8473 (_ BitVec 32) (_ BitVec 32) V!5793 V!5793 (_ BitVec 32) Int) ListLongMap!2491)

(assert (=> b!196849 (= lt!97659 (getCurrentListMapNoExtraKeys!226 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196850 () Bool)

(declare-fun res!92971 () Bool)

(assert (=> b!196850 (=> (not res!92971) (not e!129627))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196850 (= res!92971 (= (select (arr!3988 _keys!825) i!601) k!843))))

(declare-fun b!196851 () Bool)

(declare-fun res!92975 () Bool)

(assert (=> b!196851 (=> (not res!92975) (not e!129627))))

(assert (=> b!196851 (= res!92975 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4313 _keys!825))))))

(declare-fun b!196852 () Bool)

(assert (=> b!196852 (= e!129626 (and e!129629 mapRes!7982))))

(declare-fun condMapEmpty!7982 () Bool)

(declare-fun mapDefault!7982 () ValueCell!1961)

