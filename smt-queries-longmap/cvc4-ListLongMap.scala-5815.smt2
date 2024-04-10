; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74996 () Bool)

(assert start!74996)

(declare-fun b_free!15485 () Bool)

(declare-fun b_next!15485 () Bool)

(assert (=> start!74996 (= b_free!15485 (not b_next!15485))))

(declare-fun tp!54161 () Bool)

(declare-fun b_and!25675 () Bool)

(assert (=> start!74996 (= tp!54161 b_and!25675)))

(declare-fun b!884711 () Bool)

(declare-fun res!601011 () Bool)

(declare-fun e!492350 () Bool)

(assert (=> b!884711 (=> (not res!601011) (not e!492350))))

(declare-datatypes ((array!51582 0))(
  ( (array!51583 (arr!24809 (Array (_ BitVec 32) (_ BitVec 64))) (size!25249 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51582)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51582 (_ BitVec 32)) Bool)

(assert (=> b!884711 (= res!601011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884712 () Bool)

(declare-fun res!601015 () Bool)

(assert (=> b!884712 (=> (not res!601015) (not e!492350))))

(declare-datatypes ((List!17625 0))(
  ( (Nil!17622) (Cons!17621 (h!18752 (_ BitVec 64)) (t!24900 List!17625)) )
))
(declare-fun arrayNoDuplicates!0 (array!51582 (_ BitVec 32) List!17625) Bool)

(assert (=> b!884712 (= res!601015 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17622))))

(declare-fun b!884713 () Bool)

(declare-fun e!492351 () Bool)

(declare-fun tp_is_empty!17729 () Bool)

(assert (=> b!884713 (= e!492351 tp_is_empty!17729)))

(declare-fun mapIsEmpty!28233 () Bool)

(declare-fun mapRes!28233 () Bool)

(assert (=> mapIsEmpty!28233 mapRes!28233))

(declare-fun b!884714 () Bool)

(declare-fun e!492352 () Bool)

(assert (=> b!884714 (= e!492352 tp_is_empty!17729)))

(declare-fun b!884715 () Bool)

(declare-fun res!601013 () Bool)

(assert (=> b!884715 (=> (not res!601013) (not e!492350))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28685 0))(
  ( (V!28686 (val!8912 Int)) )
))
(declare-datatypes ((ValueCell!8425 0))(
  ( (ValueCellFull!8425 (v!11385 V!28685)) (EmptyCell!8425) )
))
(declare-datatypes ((array!51584 0))(
  ( (array!51585 (arr!24810 (Array (_ BitVec 32) ValueCell!8425)) (size!25250 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51584)

(assert (=> b!884715 (= res!601013 (and (= (size!25250 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25249 _keys!868) (size!25250 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884716 () Bool)

(declare-fun res!601009 () Bool)

(assert (=> b!884716 (=> (not res!601009) (not e!492350))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884716 (= res!601009 (and (= (select (arr!24809 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!884717 () Bool)

(declare-fun res!601010 () Bool)

(assert (=> b!884717 (=> (not res!601010) (not e!492350))))

(assert (=> b!884717 (= res!601010 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25249 _keys!868))))))

(declare-fun b!884718 () Bool)

(declare-fun e!492353 () Bool)

(assert (=> b!884718 (= e!492350 e!492353)))

(declare-fun res!601012 () Bool)

(assert (=> b!884718 (=> (not res!601012) (not e!492353))))

(assert (=> b!884718 (= res!601012 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28685)

(declare-fun zeroValue!654 () V!28685)

(declare-fun lt!400764 () array!51584)

(declare-datatypes ((tuple2!11818 0))(
  ( (tuple2!11819 (_1!5920 (_ BitVec 64)) (_2!5920 V!28685)) )
))
(declare-datatypes ((List!17626 0))(
  ( (Nil!17623) (Cons!17622 (h!18753 tuple2!11818) (t!24901 List!17626)) )
))
(declare-datatypes ((ListLongMap!10587 0))(
  ( (ListLongMap!10588 (toList!5309 List!17626)) )
))
(declare-fun lt!400762 () ListLongMap!10587)

(declare-fun getCurrentListMapNoExtraKeys!3268 (array!51582 array!51584 (_ BitVec 32) (_ BitVec 32) V!28685 V!28685 (_ BitVec 32) Int) ListLongMap!10587)

(assert (=> b!884718 (= lt!400762 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!400764 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28685)

(assert (=> b!884718 (= lt!400764 (array!51585 (store (arr!24810 _values!688) i!612 (ValueCellFull!8425 v!557)) (size!25250 _values!688)))))

(declare-fun lt!400761 () ListLongMap!10587)

(assert (=> b!884718 (= lt!400761 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884719 () Bool)

(declare-fun res!601008 () Bool)

(assert (=> b!884719 (=> (not res!601008) (not e!492350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884719 (= res!601008 (validMask!0 mask!1196))))

(declare-fun b!884720 () Bool)

(declare-fun res!601016 () Bool)

(assert (=> b!884720 (=> (not res!601016) (not e!492350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884720 (= res!601016 (validKeyInArray!0 k!854))))

(declare-fun res!601014 () Bool)

(assert (=> start!74996 (=> (not res!601014) (not e!492350))))

(assert (=> start!74996 (= res!601014 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25249 _keys!868))))))

(assert (=> start!74996 e!492350))

(assert (=> start!74996 tp_is_empty!17729))

(assert (=> start!74996 true))

(assert (=> start!74996 tp!54161))

(declare-fun array_inv!19532 (array!51582) Bool)

(assert (=> start!74996 (array_inv!19532 _keys!868)))

(declare-fun e!492348 () Bool)

(declare-fun array_inv!19533 (array!51584) Bool)

(assert (=> start!74996 (and (array_inv!19533 _values!688) e!492348)))

(declare-fun mapNonEmpty!28233 () Bool)

(declare-fun tp!54160 () Bool)

(assert (=> mapNonEmpty!28233 (= mapRes!28233 (and tp!54160 e!492351))))

(declare-fun mapKey!28233 () (_ BitVec 32))

(declare-fun mapValue!28233 () ValueCell!8425)

(declare-fun mapRest!28233 () (Array (_ BitVec 32) ValueCell!8425))

(assert (=> mapNonEmpty!28233 (= (arr!24810 _values!688) (store mapRest!28233 mapKey!28233 mapValue!28233))))

(declare-fun b!884721 () Bool)

(assert (=> b!884721 (= e!492348 (and e!492352 mapRes!28233))))

(declare-fun condMapEmpty!28233 () Bool)

(declare-fun mapDefault!28233 () ValueCell!8425)

