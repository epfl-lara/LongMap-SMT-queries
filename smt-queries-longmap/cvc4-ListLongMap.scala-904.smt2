; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20524 () Bool)

(assert start!20524)

(declare-fun b_free!5183 () Bool)

(declare-fun b_next!5183 () Bool)

(assert (=> start!20524 (= b_free!5183 (not b_next!5183))))

(declare-fun tp!18581 () Bool)

(declare-fun b_and!11929 () Bool)

(assert (=> start!20524 (= tp!18581 b_and!11929)))

(declare-fun b!203931 () Bool)

(declare-fun res!98125 () Bool)

(declare-fun e!133472 () Bool)

(assert (=> b!203931 (=> (not res!98125) (not e!133472))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203931 (= res!98125 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!8627 () Bool)

(declare-fun mapRes!8627 () Bool)

(assert (=> mapIsEmpty!8627 mapRes!8627))

(declare-fun b!203932 () Bool)

(declare-fun res!98128 () Bool)

(assert (=> b!203932 (=> (not res!98128) (not e!133472))))

(declare-datatypes ((array!9297 0))(
  ( (array!9298 (arr!4399 (Array (_ BitVec 32) (_ BitVec 64))) (size!4724 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9297)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9297 (_ BitVec 32)) Bool)

(assert (=> b!203932 (= res!98128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8627 () Bool)

(declare-fun tp!18580 () Bool)

(declare-fun e!133473 () Bool)

(assert (=> mapNonEmpty!8627 (= mapRes!8627 (and tp!18580 e!133473))))

(declare-datatypes ((V!6365 0))(
  ( (V!6366 (val!2564 Int)) )
))
(declare-datatypes ((ValueCell!2176 0))(
  ( (ValueCellFull!2176 (v!4534 V!6365)) (EmptyCell!2176) )
))
(declare-fun mapValue!8627 () ValueCell!2176)

(declare-fun mapRest!8627 () (Array (_ BitVec 32) ValueCell!2176))

(declare-datatypes ((array!9299 0))(
  ( (array!9300 (arr!4400 (Array (_ BitVec 32) ValueCell!2176)) (size!4725 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9299)

(declare-fun mapKey!8627 () (_ BitVec 32))

(assert (=> mapNonEmpty!8627 (= (arr!4400 _values!649) (store mapRest!8627 mapKey!8627 mapValue!8627))))

(declare-fun res!98129 () Bool)

(assert (=> start!20524 (=> (not res!98129) (not e!133472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20524 (= res!98129 (validMask!0 mask!1149))))

(assert (=> start!20524 e!133472))

(declare-fun e!133475 () Bool)

(declare-fun array_inv!2905 (array!9299) Bool)

(assert (=> start!20524 (and (array_inv!2905 _values!649) e!133475)))

(assert (=> start!20524 true))

(declare-fun tp_is_empty!5039 () Bool)

(assert (=> start!20524 tp_is_empty!5039))

(declare-fun array_inv!2906 (array!9297) Bool)

(assert (=> start!20524 (array_inv!2906 _keys!825)))

(assert (=> start!20524 tp!18581))

(declare-fun b!203933 () Bool)

(declare-fun res!98123 () Bool)

(assert (=> b!203933 (=> (not res!98123) (not e!133472))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203933 (= res!98123 (= (select (arr!4399 _keys!825) i!601) k!843))))

(declare-fun b!203934 () Bool)

(declare-fun res!98131 () Bool)

(assert (=> b!203934 (=> (not res!98131) (not e!133472))))

(declare-datatypes ((List!2788 0))(
  ( (Nil!2785) (Cons!2784 (h!3426 (_ BitVec 64)) (t!7719 List!2788)) )
))
(declare-fun arrayNoDuplicates!0 (array!9297 (_ BitVec 32) List!2788) Bool)

(assert (=> b!203934 (= res!98131 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2785))))

(declare-fun b!203935 () Bool)

(declare-fun e!133471 () Bool)

(declare-fun e!133474 () Bool)

(assert (=> b!203935 (= e!133471 e!133474)))

(declare-fun res!98130 () Bool)

(assert (=> b!203935 (=> res!98130 e!133474)))

(assert (=> b!203935 (= res!98130 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3888 0))(
  ( (tuple2!3889 (_1!1955 (_ BitVec 64)) (_2!1955 V!6365)) )
))
(declare-datatypes ((List!2789 0))(
  ( (Nil!2786) (Cons!2785 (h!3427 tuple2!3888) (t!7720 List!2789)) )
))
(declare-datatypes ((ListLongMap!2801 0))(
  ( (ListLongMap!2802 (toList!1416 List!2789)) )
))
(declare-fun lt!103115 () ListLongMap!2801)

(declare-fun lt!103111 () ListLongMap!2801)

(assert (=> b!203935 (= lt!103115 lt!103111)))

(declare-fun lt!103108 () ListLongMap!2801)

(declare-fun lt!103118 () tuple2!3888)

(declare-fun +!443 (ListLongMap!2801 tuple2!3888) ListLongMap!2801)

(assert (=> b!203935 (= lt!103111 (+!443 lt!103108 lt!103118))))

(declare-fun lt!103112 () ListLongMap!2801)

(declare-fun lt!103116 () ListLongMap!2801)

(assert (=> b!203935 (= lt!103112 lt!103116)))

(declare-fun lt!103119 () ListLongMap!2801)

(assert (=> b!203935 (= lt!103116 (+!443 lt!103119 lt!103118))))

(declare-fun lt!103110 () ListLongMap!2801)

(assert (=> b!203935 (= lt!103115 (+!443 lt!103110 lt!103118))))

(declare-fun zeroValue!615 () V!6365)

(assert (=> b!203935 (= lt!103118 (tuple2!3889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203936 () Bool)

(declare-fun res!98124 () Bool)

(assert (=> b!203936 (=> (not res!98124) (not e!133472))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203936 (= res!98124 (and (= (size!4725 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4724 _keys!825) (size!4725 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203937 () Bool)

(assert (=> b!203937 (= e!133473 tp_is_empty!5039)))

(declare-fun b!203938 () Bool)

(assert (=> b!203938 (= e!133472 (not e!133471))))

(declare-fun res!98126 () Bool)

(assert (=> b!203938 (=> res!98126 e!133471)))

(assert (=> b!203938 (= res!98126 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6365)

(declare-fun getCurrentListMap!990 (array!9297 array!9299 (_ BitVec 32) (_ BitVec 32) V!6365 V!6365 (_ BitVec 32) Int) ListLongMap!2801)

(assert (=> b!203938 (= lt!103112 (getCurrentListMap!990 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103117 () array!9299)

(assert (=> b!203938 (= lt!103115 (getCurrentListMap!990 _keys!825 lt!103117 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203938 (and (= lt!103110 lt!103108) (= lt!103108 lt!103110))))

(declare-fun lt!103114 () tuple2!3888)

(assert (=> b!203938 (= lt!103108 (+!443 lt!103119 lt!103114))))

(declare-fun v!520 () V!6365)

(assert (=> b!203938 (= lt!103114 (tuple2!3889 k!843 v!520))))

(declare-datatypes ((Unit!6180 0))(
  ( (Unit!6181) )
))
(declare-fun lt!103113 () Unit!6180)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!103 (array!9297 array!9299 (_ BitVec 32) (_ BitVec 32) V!6365 V!6365 (_ BitVec 32) (_ BitVec 64) V!6365 (_ BitVec 32) Int) Unit!6180)

(assert (=> b!203938 (= lt!103113 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!103 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!364 (array!9297 array!9299 (_ BitVec 32) (_ BitVec 32) V!6365 V!6365 (_ BitVec 32) Int) ListLongMap!2801)

(assert (=> b!203938 (= lt!103110 (getCurrentListMapNoExtraKeys!364 _keys!825 lt!103117 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203938 (= lt!103117 (array!9300 (store (arr!4400 _values!649) i!601 (ValueCellFull!2176 v!520)) (size!4725 _values!649)))))

(assert (=> b!203938 (= lt!103119 (getCurrentListMapNoExtraKeys!364 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203939 () Bool)

(declare-fun e!133469 () Bool)

(assert (=> b!203939 (= e!133475 (and e!133469 mapRes!8627))))

(declare-fun condMapEmpty!8627 () Bool)

(declare-fun mapDefault!8627 () ValueCell!2176)

