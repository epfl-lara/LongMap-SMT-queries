; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73244 () Bool)

(assert start!73244)

(declare-fun b_free!14159 () Bool)

(declare-fun b_next!14159 () Bool)

(assert (=> start!73244 (= b_free!14159 (not b_next!14159))))

(declare-fun tp!49980 () Bool)

(declare-fun b_and!23477 () Bool)

(assert (=> start!73244 (= tp!49980 b_and!23477)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26773 0))(
  ( (V!26774 (val!8195 Int)) )
))
(declare-datatypes ((ValueCell!7708 0))(
  ( (ValueCellFull!7708 (v!10620 V!26773)) (EmptyCell!7708) )
))
(declare-datatypes ((array!48788 0))(
  ( (array!48789 (arr!23425 (Array (_ BitVec 32) ValueCell!7708)) (size!23865 (_ BitVec 32))) )
))
(declare-fun lt!385025 () array!48788)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10780 0))(
  ( (tuple2!10781 (_1!5401 (_ BitVec 64)) (_2!5401 V!26773)) )
))
(declare-datatypes ((List!16602 0))(
  ( (Nil!16599) (Cons!16598 (h!17729 tuple2!10780) (t!23207 List!16602)) )
))
(declare-datatypes ((ListLongMap!9549 0))(
  ( (ListLongMap!9550 (toList!4790 List!16602)) )
))
(declare-fun call!38332 () ListLongMap!9549)

(declare-datatypes ((array!48790 0))(
  ( (array!48791 (arr!23426 (Array (_ BitVec 32) (_ BitVec 64))) (size!23866 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48790)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26773)

(declare-fun bm!38329 () Bool)

(declare-fun zeroValue!654 () V!26773)

(declare-fun getCurrentListMapNoExtraKeys!2771 (array!48790 array!48788 (_ BitVec 32) (_ BitVec 32) V!26773 V!26773 (_ BitVec 32) Int) ListLongMap!9549)

(assert (=> bm!38329 (= call!38332 (getCurrentListMapNoExtraKeys!2771 _keys!868 lt!385025 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853891 () Bool)

(declare-fun e!476176 () Bool)

(declare-fun tp_is_empty!16295 () Bool)

(assert (=> b!853891 (= e!476176 tp_is_empty!16295)))

(declare-fun b!853892 () Bool)

(declare-fun res!579909 () Bool)

(declare-fun e!476169 () Bool)

(assert (=> b!853892 (=> (not res!579909) (not e!476169))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853892 (= res!579909 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23866 _keys!868))))))

(declare-fun b!853893 () Bool)

(declare-fun e!476170 () Bool)

(declare-fun call!38333 () ListLongMap!9549)

(assert (=> b!853893 (= e!476170 (= call!38332 call!38333))))

(declare-fun b!853894 () Bool)

(declare-fun e!476171 () Bool)

(declare-fun e!476173 () Bool)

(assert (=> b!853894 (= e!476171 (not e!476173))))

(declare-fun res!579917 () Bool)

(assert (=> b!853894 (=> res!579917 e!476173)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853894 (= res!579917 (not (validKeyInArray!0 (select (arr!23426 _keys!868) from!1053))))))

(assert (=> b!853894 e!476170))

(declare-fun c!91909 () Bool)

(assert (=> b!853894 (= c!91909 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26773)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun _values!688 () array!48788)

(declare-datatypes ((Unit!29145 0))(
  ( (Unit!29146) )
))
(declare-fun lt!385031 () Unit!29145)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!404 (array!48790 array!48788 (_ BitVec 32) (_ BitVec 32) V!26773 V!26773 (_ BitVec 32) (_ BitVec 64) V!26773 (_ BitVec 32) Int) Unit!29145)

(assert (=> b!853894 (= lt!385031 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!404 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26042 () Bool)

(declare-fun mapRes!26042 () Bool)

(assert (=> mapIsEmpty!26042 mapRes!26042))

(declare-fun b!853895 () Bool)

(declare-fun res!579916 () Bool)

(assert (=> b!853895 (=> (not res!579916) (not e!476169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853895 (= res!579916 (validMask!0 mask!1196))))

(declare-fun b!853896 () Bool)

(declare-fun res!579915 () Bool)

(assert (=> b!853896 (=> (not res!579915) (not e!476169))))

(assert (=> b!853896 (= res!579915 (and (= (size!23865 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23866 _keys!868) (size!23865 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853897 () Bool)

(declare-fun res!579908 () Bool)

(assert (=> b!853897 (=> (not res!579908) (not e!476169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48790 (_ BitVec 32)) Bool)

(assert (=> b!853897 (= res!579908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853898 () Bool)

(declare-fun e!476175 () Bool)

(declare-fun e!476172 () Bool)

(assert (=> b!853898 (= e!476175 (and e!476172 mapRes!26042))))

(declare-fun condMapEmpty!26042 () Bool)

(declare-fun mapDefault!26042 () ValueCell!7708)

