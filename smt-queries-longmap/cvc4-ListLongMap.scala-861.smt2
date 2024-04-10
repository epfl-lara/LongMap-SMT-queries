; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20266 () Bool)

(assert start!20266)

(declare-fun b_free!4925 () Bool)

(declare-fun b_next!4925 () Bool)

(assert (=> start!20266 (= b_free!4925 (not b_next!4925))))

(declare-fun tp!17807 () Bool)

(declare-fun b_and!11671 () Bool)

(assert (=> start!20266 (= tp!17807 b_and!11671)))

(declare-fun b!199424 () Bool)

(declare-fun e!130917 () Bool)

(declare-fun tp_is_empty!4781 () Bool)

(assert (=> b!199424 (= e!130917 tp_is_empty!4781)))

(declare-fun b!199425 () Bool)

(declare-fun res!94777 () Bool)

(declare-fun e!130918 () Bool)

(assert (=> b!199425 (=> (not res!94777) (not e!130918))))

(declare-datatypes ((array!8803 0))(
  ( (array!8804 (arr!4152 (Array (_ BitVec 32) (_ BitVec 64))) (size!4477 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8803)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8803 (_ BitVec 32)) Bool)

(assert (=> b!199425 (= res!94777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199426 () Bool)

(assert (=> b!199426 (= e!130918 (not true))))

(declare-datatypes ((V!6021 0))(
  ( (V!6022 (val!2435 Int)) )
))
(declare-datatypes ((ValueCell!2047 0))(
  ( (ValueCellFull!2047 (v!4405 V!6021)) (EmptyCell!2047) )
))
(declare-datatypes ((array!8805 0))(
  ( (array!8806 (arr!4153 (Array (_ BitVec 32) ValueCell!2047)) (size!4478 (_ BitVec 32))) )
))
(declare-fun lt!98309 () array!8805)

(declare-fun zeroValue!615 () V!6021)

(declare-datatypes ((tuple2!3684 0))(
  ( (tuple2!3685 (_1!1853 (_ BitVec 64)) (_2!1853 V!6021)) )
))
(declare-datatypes ((List!2602 0))(
  ( (Nil!2599) (Cons!2598 (h!3240 tuple2!3684) (t!7533 List!2602)) )
))
(declare-datatypes ((ListLongMap!2597 0))(
  ( (ListLongMap!2598 (toList!1314 List!2602)) )
))
(declare-fun lt!98313 () ListLongMap!2597)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6021)

(declare-fun getCurrentListMap!905 (array!8803 array!8805 (_ BitVec 32) (_ BitVec 32) V!6021 V!6021 (_ BitVec 32) Int) ListLongMap!2597)

(assert (=> b!199426 (= lt!98313 (getCurrentListMap!905 _keys!825 lt!98309 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98311 () ListLongMap!2597)

(declare-fun lt!98312 () ListLongMap!2597)

(assert (=> b!199426 (and (= lt!98311 lt!98312) (= lt!98312 lt!98311))))

(declare-fun lt!98308 () ListLongMap!2597)

(declare-fun v!520 () V!6021)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!341 (ListLongMap!2597 tuple2!3684) ListLongMap!2597)

(assert (=> b!199426 (= lt!98312 (+!341 lt!98308 (tuple2!3685 k!843 v!520)))))

(declare-datatypes ((Unit!5984 0))(
  ( (Unit!5985) )
))
(declare-fun lt!98310 () Unit!5984)

(declare-fun _values!649 () array!8805)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!18 (array!8803 array!8805 (_ BitVec 32) (_ BitVec 32) V!6021 V!6021 (_ BitVec 32) (_ BitVec 64) V!6021 (_ BitVec 32) Int) Unit!5984)

(assert (=> b!199426 (= lt!98310 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!18 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!279 (array!8803 array!8805 (_ BitVec 32) (_ BitVec 32) V!6021 V!6021 (_ BitVec 32) Int) ListLongMap!2597)

(assert (=> b!199426 (= lt!98311 (getCurrentListMapNoExtraKeys!279 _keys!825 lt!98309 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199426 (= lt!98309 (array!8806 (store (arr!4153 _values!649) i!601 (ValueCellFull!2047 v!520)) (size!4478 _values!649)))))

(assert (=> b!199426 (= lt!98308 (getCurrentListMapNoExtraKeys!279 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199427 () Bool)

(declare-fun res!94783 () Bool)

(assert (=> b!199427 (=> (not res!94783) (not e!130918))))

(assert (=> b!199427 (= res!94783 (and (= (size!4478 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4477 _keys!825) (size!4478 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!94778 () Bool)

(assert (=> start!20266 (=> (not res!94778) (not e!130918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20266 (= res!94778 (validMask!0 mask!1149))))

(assert (=> start!20266 e!130918))

(declare-fun e!130919 () Bool)

(declare-fun array_inv!2725 (array!8805) Bool)

(assert (=> start!20266 (and (array_inv!2725 _values!649) e!130919)))

(assert (=> start!20266 true))

(assert (=> start!20266 tp_is_empty!4781))

(declare-fun array_inv!2726 (array!8803) Bool)

(assert (=> start!20266 (array_inv!2726 _keys!825)))

(assert (=> start!20266 tp!17807))

(declare-fun b!199428 () Bool)

(declare-fun res!94782 () Bool)

(assert (=> b!199428 (=> (not res!94782) (not e!130918))))

(assert (=> b!199428 (= res!94782 (= (select (arr!4152 _keys!825) i!601) k!843))))

(declare-fun b!199429 () Bool)

(declare-fun e!130916 () Bool)

(declare-fun mapRes!8240 () Bool)

(assert (=> b!199429 (= e!130919 (and e!130916 mapRes!8240))))

(declare-fun condMapEmpty!8240 () Bool)

(declare-fun mapDefault!8240 () ValueCell!2047)

