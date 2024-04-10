; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73342 () Bool)

(assert start!73342)

(declare-fun b_free!14257 () Bool)

(declare-fun b_next!14257 () Bool)

(assert (=> start!73342 (= b_free!14257 (not b_next!14257))))

(declare-fun tp!50275 () Bool)

(declare-fun b_and!23613 () Bool)

(assert (=> start!73342 (= tp!50275 b_and!23613)))

(declare-fun b!855766 () Bool)

(declare-fun res!581199 () Bool)

(declare-fun e!477071 () Bool)

(assert (=> b!855766 (=> (not res!581199) (not e!477071))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48982 0))(
  ( (array!48983 (arr!23522 (Array (_ BitVec 32) (_ BitVec 64))) (size!23962 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48982)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855766 (= res!581199 (and (= (select (arr!23522 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855767 () Bool)

(declare-fun e!477070 () Bool)

(declare-fun tp_is_empty!16393 () Bool)

(assert (=> b!855767 (= e!477070 tp_is_empty!16393)))

(declare-fun b!855768 () Bool)

(declare-fun res!581197 () Bool)

(assert (=> b!855768 (=> (not res!581197) (not e!477071))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26905 0))(
  ( (V!26906 (val!8244 Int)) )
))
(declare-datatypes ((ValueCell!7757 0))(
  ( (ValueCellFull!7757 (v!10669 V!26905)) (EmptyCell!7757) )
))
(declare-datatypes ((array!48984 0))(
  ( (array!48985 (arr!23523 (Array (_ BitVec 32) ValueCell!7757)) (size!23963 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48984)

(assert (=> b!855768 (= res!581197 (and (= (size!23963 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23962 _keys!868) (size!23963 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855769 () Bool)

(declare-fun res!581200 () Bool)

(assert (=> b!855769 (=> (not res!581200) (not e!477071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855769 (= res!581200 (validMask!0 mask!1196))))

(declare-fun b!855770 () Bool)

(assert (=> b!855770 (= e!477071 false)))

(declare-datatypes ((tuple2!10866 0))(
  ( (tuple2!10867 (_1!5444 (_ BitVec 64)) (_2!5444 V!26905)) )
))
(declare-datatypes ((List!16679 0))(
  ( (Nil!16676) (Cons!16675 (h!17806 tuple2!10866) (t!23320 List!16679)) )
))
(declare-datatypes ((ListLongMap!9635 0))(
  ( (ListLongMap!9636 (toList!4833 List!16679)) )
))
(declare-fun lt!385758 () ListLongMap!9635)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26905)

(declare-fun zeroValue!654 () V!26905)

(declare-fun v!557 () V!26905)

(declare-fun getCurrentListMapNoExtraKeys!2814 (array!48982 array!48984 (_ BitVec 32) (_ BitVec 32) V!26905 V!26905 (_ BitVec 32) Int) ListLongMap!9635)

(assert (=> b!855770 (= lt!385758 (getCurrentListMapNoExtraKeys!2814 _keys!868 (array!48985 (store (arr!23523 _values!688) i!612 (ValueCellFull!7757 v!557)) (size!23963 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385759 () ListLongMap!9635)

(assert (=> b!855770 (= lt!385759 (getCurrentListMapNoExtraKeys!2814 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855771 () Bool)

(declare-fun e!477073 () Bool)

(assert (=> b!855771 (= e!477073 tp_is_empty!16393)))

(declare-fun b!855772 () Bool)

(declare-fun res!581198 () Bool)

(assert (=> b!855772 (=> (not res!581198) (not e!477071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855772 (= res!581198 (validKeyInArray!0 k!854))))

(declare-fun b!855773 () Bool)

(declare-fun res!581196 () Bool)

(assert (=> b!855773 (=> (not res!581196) (not e!477071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48982 (_ BitVec 32)) Bool)

(assert (=> b!855773 (= res!581196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855775 () Bool)

(declare-fun res!581201 () Bool)

(assert (=> b!855775 (=> (not res!581201) (not e!477071))))

(declare-datatypes ((List!16680 0))(
  ( (Nil!16677) (Cons!16676 (h!17807 (_ BitVec 64)) (t!23321 List!16680)) )
))
(declare-fun arrayNoDuplicates!0 (array!48982 (_ BitVec 32) List!16680) Bool)

(assert (=> b!855775 (= res!581201 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16677))))

(declare-fun mapIsEmpty!26189 () Bool)

(declare-fun mapRes!26189 () Bool)

(assert (=> mapIsEmpty!26189 mapRes!26189))

(declare-fun mapNonEmpty!26189 () Bool)

(declare-fun tp!50274 () Bool)

(assert (=> mapNonEmpty!26189 (= mapRes!26189 (and tp!50274 e!477070))))

(declare-fun mapRest!26189 () (Array (_ BitVec 32) ValueCell!7757))

(declare-fun mapKey!26189 () (_ BitVec 32))

(declare-fun mapValue!26189 () ValueCell!7757)

(assert (=> mapNonEmpty!26189 (= (arr!23523 _values!688) (store mapRest!26189 mapKey!26189 mapValue!26189))))

(declare-fun b!855776 () Bool)

(declare-fun res!581195 () Bool)

(assert (=> b!855776 (=> (not res!581195) (not e!477071))))

(assert (=> b!855776 (= res!581195 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23962 _keys!868))))))

(declare-fun res!581194 () Bool)

(assert (=> start!73342 (=> (not res!581194) (not e!477071))))

(assert (=> start!73342 (= res!581194 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23962 _keys!868))))))

(assert (=> start!73342 e!477071))

(assert (=> start!73342 tp_is_empty!16393))

(assert (=> start!73342 true))

(assert (=> start!73342 tp!50275))

(declare-fun array_inv!18640 (array!48982) Bool)

(assert (=> start!73342 (array_inv!18640 _keys!868)))

(declare-fun e!477069 () Bool)

(declare-fun array_inv!18641 (array!48984) Bool)

(assert (=> start!73342 (and (array_inv!18641 _values!688) e!477069)))

(declare-fun b!855774 () Bool)

(assert (=> b!855774 (= e!477069 (and e!477073 mapRes!26189))))

(declare-fun condMapEmpty!26189 () Bool)

(declare-fun mapDefault!26189 () ValueCell!7757)

