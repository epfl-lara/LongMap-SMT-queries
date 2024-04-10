; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20340 () Bool)

(assert start!20340)

(declare-fun b_free!4999 () Bool)

(declare-fun b_next!4999 () Bool)

(assert (=> start!20340 (= b_free!4999 (not b_next!4999))))

(declare-fun tp!18028 () Bool)

(declare-fun b_and!11745 () Bool)

(assert (=> start!20340 (= tp!18028 b_and!11745)))

(declare-fun b!200610 () Bool)

(declare-fun res!95634 () Bool)

(declare-fun e!131538 () Bool)

(assert (=> b!200610 (=> (not res!95634) (not e!131538))))

(declare-datatypes ((array!8941 0))(
  ( (array!8942 (arr!4221 (Array (_ BitVec 32) (_ BitVec 64))) (size!4546 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8941)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6121 0))(
  ( (V!6122 (val!2472 Int)) )
))
(declare-datatypes ((ValueCell!2084 0))(
  ( (ValueCellFull!2084 (v!4442 V!6121)) (EmptyCell!2084) )
))
(declare-datatypes ((array!8943 0))(
  ( (array!8944 (arr!4222 (Array (_ BitVec 32) ValueCell!2084)) (size!4547 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8943)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200610 (= res!95634 (and (= (size!4547 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4546 _keys!825) (size!4547 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!95631 () Bool)

(assert (=> start!20340 (=> (not res!95631) (not e!131538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20340 (= res!95631 (validMask!0 mask!1149))))

(assert (=> start!20340 e!131538))

(declare-fun e!131542 () Bool)

(declare-fun array_inv!2777 (array!8943) Bool)

(assert (=> start!20340 (and (array_inv!2777 _values!649) e!131542)))

(assert (=> start!20340 true))

(declare-fun tp_is_empty!4855 () Bool)

(assert (=> start!20340 tp_is_empty!4855))

(declare-fun array_inv!2778 (array!8941) Bool)

(assert (=> start!20340 (array_inv!2778 _keys!825)))

(assert (=> start!20340 tp!18028))

(declare-fun b!200611 () Bool)

(declare-fun e!131540 () Bool)

(assert (=> b!200611 (= e!131538 (not e!131540))))

(declare-fun res!95635 () Bool)

(assert (=> b!200611 (=> res!95635 e!131540)))

(assert (=> b!200611 (= res!95635 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6121)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3736 0))(
  ( (tuple2!3737 (_1!1879 (_ BitVec 64)) (_2!1879 V!6121)) )
))
(declare-datatypes ((List!2653 0))(
  ( (Nil!2650) (Cons!2649 (h!3291 tuple2!3736) (t!7584 List!2653)) )
))
(declare-datatypes ((ListLongMap!2649 0))(
  ( (ListLongMap!2650 (toList!1340 List!2653)) )
))
(declare-fun lt!99268 () ListLongMap!2649)

(declare-fun minValue!615 () V!6121)

(declare-fun getCurrentListMap!930 (array!8941 array!8943 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) Int) ListLongMap!2649)

(assert (=> b!200611 (= lt!99268 (getCurrentListMap!930 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99271 () array!8943)

(declare-fun lt!99270 () ListLongMap!2649)

(assert (=> b!200611 (= lt!99270 (getCurrentListMap!930 _keys!825 lt!99271 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99279 () ListLongMap!2649)

(declare-fun lt!99269 () ListLongMap!2649)

(assert (=> b!200611 (and (= lt!99279 lt!99269) (= lt!99269 lt!99279))))

(declare-fun lt!99277 () ListLongMap!2649)

(declare-fun lt!99267 () tuple2!3736)

(declare-fun +!367 (ListLongMap!2649 tuple2!3736) ListLongMap!2649)

(assert (=> b!200611 (= lt!99269 (+!367 lt!99277 lt!99267))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6121)

(assert (=> b!200611 (= lt!99267 (tuple2!3737 k!843 v!520))))

(declare-datatypes ((Unit!6034 0))(
  ( (Unit!6035) )
))
(declare-fun lt!99272 () Unit!6034)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!43 (array!8941 array!8943 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) (_ BitVec 64) V!6121 (_ BitVec 32) Int) Unit!6034)

(assert (=> b!200611 (= lt!99272 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!43 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!304 (array!8941 array!8943 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) Int) ListLongMap!2649)

(assert (=> b!200611 (= lt!99279 (getCurrentListMapNoExtraKeys!304 _keys!825 lt!99271 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200611 (= lt!99271 (array!8944 (store (arr!4222 _values!649) i!601 (ValueCellFull!2084 v!520)) (size!4547 _values!649)))))

(assert (=> b!200611 (= lt!99277 (getCurrentListMapNoExtraKeys!304 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200612 () Bool)

(declare-fun res!95630 () Bool)

(assert (=> b!200612 (=> (not res!95630) (not e!131538))))

(assert (=> b!200612 (= res!95630 (= (select (arr!4221 _keys!825) i!601) k!843))))

(declare-fun b!200613 () Bool)

(declare-fun res!95638 () Bool)

(assert (=> b!200613 (=> (not res!95638) (not e!131538))))

(assert (=> b!200613 (= res!95638 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4546 _keys!825))))))

(declare-fun b!200614 () Bool)

(declare-fun res!95636 () Bool)

(assert (=> b!200614 (=> (not res!95636) (not e!131538))))

(declare-datatypes ((List!2654 0))(
  ( (Nil!2651) (Cons!2650 (h!3292 (_ BitVec 64)) (t!7585 List!2654)) )
))
(declare-fun arrayNoDuplicates!0 (array!8941 (_ BitVec 32) List!2654) Bool)

(assert (=> b!200614 (= res!95636 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2651))))

(declare-fun b!200615 () Bool)

(declare-fun res!95637 () Bool)

(assert (=> b!200615 (=> (not res!95637) (not e!131538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8941 (_ BitVec 32)) Bool)

(assert (=> b!200615 (= res!95637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8351 () Bool)

(declare-fun mapRes!8351 () Bool)

(declare-fun tp!18029 () Bool)

(declare-fun e!131541 () Bool)

(assert (=> mapNonEmpty!8351 (= mapRes!8351 (and tp!18029 e!131541))))

(declare-fun mapRest!8351 () (Array (_ BitVec 32) ValueCell!2084))

(declare-fun mapValue!8351 () ValueCell!2084)

(declare-fun mapKey!8351 () (_ BitVec 32))

(assert (=> mapNonEmpty!8351 (= (arr!4222 _values!649) (store mapRest!8351 mapKey!8351 mapValue!8351))))

(declare-fun b!200616 () Bool)

(declare-fun e!131539 () Bool)

(assert (=> b!200616 (= e!131542 (and e!131539 mapRes!8351))))

(declare-fun condMapEmpty!8351 () Bool)

(declare-fun mapDefault!8351 () ValueCell!2084)

