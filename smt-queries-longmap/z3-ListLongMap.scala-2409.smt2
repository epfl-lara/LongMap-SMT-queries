; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38140 () Bool)

(assert start!38140)

(declare-fun b_free!9021 () Bool)

(declare-fun b_next!9021 () Bool)

(assert (=> start!38140 (= b_free!9021 (not b_next!9021))))

(declare-fun tp!31845 () Bool)

(declare-fun b_and!16383 () Bool)

(assert (=> start!38140 (= tp!31845 b_and!16383)))

(declare-fun b!392984 () Bool)

(declare-fun res!225072 () Bool)

(declare-fun e!237969 () Bool)

(assert (=> b!392984 (=> (not res!225072) (not e!237969))))

(declare-datatypes ((array!23295 0))(
  ( (array!23296 (arr!11106 (Array (_ BitVec 32) (_ BitVec 64))) (size!11458 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23295)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392984 (= res!225072 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!225074 () Bool)

(assert (=> start!38140 (=> (not res!225074) (not e!237969))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38140 (= res!225074 (validMask!0 mask!970))))

(assert (=> start!38140 e!237969))

(declare-datatypes ((V!14029 0))(
  ( (V!14030 (val!4891 Int)) )
))
(declare-datatypes ((ValueCell!4503 0))(
  ( (ValueCellFull!4503 (v!7128 V!14029)) (EmptyCell!4503) )
))
(declare-datatypes ((array!23297 0))(
  ( (array!23298 (arr!11107 (Array (_ BitVec 32) ValueCell!4503)) (size!11459 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23297)

(declare-fun e!237971 () Bool)

(declare-fun array_inv!8158 (array!23297) Bool)

(assert (=> start!38140 (and (array_inv!8158 _values!506) e!237971)))

(assert (=> start!38140 tp!31845))

(assert (=> start!38140 true))

(declare-fun tp_is_empty!9693 () Bool)

(assert (=> start!38140 tp_is_empty!9693))

(declare-fun array_inv!8159 (array!23295) Bool)

(assert (=> start!38140 (array_inv!8159 _keys!658)))

(declare-fun b!392985 () Bool)

(declare-fun res!225077 () Bool)

(assert (=> b!392985 (=> (not res!225077) (not e!237969))))

(declare-datatypes ((List!6451 0))(
  ( (Nil!6448) (Cons!6447 (h!7303 (_ BitVec 64)) (t!11621 List!6451)) )
))
(declare-fun arrayNoDuplicates!0 (array!23295 (_ BitVec 32) List!6451) Bool)

(assert (=> b!392985 (= res!225077 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6448))))

(declare-fun b!392986 () Bool)

(declare-fun res!225071 () Bool)

(assert (=> b!392986 (=> (not res!225071) (not e!237969))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392986 (= res!225071 (or (= (select (arr!11106 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11106 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392987 () Bool)

(declare-fun e!237973 () Bool)

(assert (=> b!392987 (= e!237973 tp_is_empty!9693)))

(declare-fun mapNonEmpty!16134 () Bool)

(declare-fun mapRes!16134 () Bool)

(declare-fun tp!31844 () Bool)

(declare-fun e!237967 () Bool)

(assert (=> mapNonEmpty!16134 (= mapRes!16134 (and tp!31844 e!237967))))

(declare-fun mapKey!16134 () (_ BitVec 32))

(declare-fun mapValue!16134 () ValueCell!4503)

(declare-fun mapRest!16134 () (Array (_ BitVec 32) ValueCell!4503))

(assert (=> mapNonEmpty!16134 (= (arr!11107 _values!506) (store mapRest!16134 mapKey!16134 mapValue!16134))))

(declare-fun b!392988 () Bool)

(declare-fun res!225073 () Bool)

(declare-fun e!237966 () Bool)

(assert (=> b!392988 (=> (not res!225073) (not e!237966))))

(declare-fun lt!185834 () array!23295)

(assert (=> b!392988 (= res!225073 (arrayNoDuplicates!0 lt!185834 #b00000000000000000000000000000000 Nil!6448))))

(declare-fun b!392989 () Bool)

(declare-fun res!225075 () Bool)

(assert (=> b!392989 (=> (not res!225075) (not e!237969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392989 (= res!225075 (validKeyInArray!0 k0!778))))

(declare-fun b!392990 () Bool)

(declare-fun e!237968 () Bool)

(assert (=> b!392990 (= e!237966 (not e!237968))))

(declare-fun res!225069 () Bool)

(assert (=> b!392990 (=> res!225069 e!237968)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392990 (= res!225069 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14029)

(declare-datatypes ((tuple2!6598 0))(
  ( (tuple2!6599 (_1!3310 (_ BitVec 64)) (_2!3310 V!14029)) )
))
(declare-datatypes ((List!6452 0))(
  ( (Nil!6449) (Cons!6448 (h!7304 tuple2!6598) (t!11622 List!6452)) )
))
(declare-datatypes ((ListLongMap!5511 0))(
  ( (ListLongMap!5512 (toList!2771 List!6452)) )
))
(declare-fun lt!185837 () ListLongMap!5511)

(declare-fun minValue!472 () V!14029)

(declare-fun getCurrentListMap!2113 (array!23295 array!23297 (_ BitVec 32) (_ BitVec 32) V!14029 V!14029 (_ BitVec 32) Int) ListLongMap!5511)

(assert (=> b!392990 (= lt!185837 (getCurrentListMap!2113 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185835 () ListLongMap!5511)

(declare-fun lt!185839 () array!23297)

(assert (=> b!392990 (= lt!185835 (getCurrentListMap!2113 lt!185834 lt!185839 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185836 () ListLongMap!5511)

(declare-fun lt!185842 () ListLongMap!5511)

(assert (=> b!392990 (and (= lt!185836 lt!185842) (= lt!185842 lt!185836))))

(declare-fun lt!185832 () ListLongMap!5511)

(declare-fun lt!185830 () tuple2!6598)

(declare-fun +!1066 (ListLongMap!5511 tuple2!6598) ListLongMap!5511)

(assert (=> b!392990 (= lt!185842 (+!1066 lt!185832 lt!185830))))

(declare-fun v!373 () V!14029)

(assert (=> b!392990 (= lt!185830 (tuple2!6599 k0!778 v!373))))

(declare-datatypes ((Unit!12020 0))(
  ( (Unit!12021) )
))
(declare-fun lt!185838 () Unit!12020)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!277 (array!23295 array!23297 (_ BitVec 32) (_ BitVec 32) V!14029 V!14029 (_ BitVec 32) (_ BitVec 64) V!14029 (_ BitVec 32) Int) Unit!12020)

(assert (=> b!392990 (= lt!185838 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!277 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!993 (array!23295 array!23297 (_ BitVec 32) (_ BitVec 32) V!14029 V!14029 (_ BitVec 32) Int) ListLongMap!5511)

(assert (=> b!392990 (= lt!185836 (getCurrentListMapNoExtraKeys!993 lt!185834 lt!185839 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392990 (= lt!185839 (array!23298 (store (arr!11107 _values!506) i!548 (ValueCellFull!4503 v!373)) (size!11459 _values!506)))))

(assert (=> b!392990 (= lt!185832 (getCurrentListMapNoExtraKeys!993 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392991 () Bool)

(assert (=> b!392991 (= e!237967 tp_is_empty!9693)))

(declare-fun b!392992 () Bool)

(assert (=> b!392992 (= e!237971 (and e!237973 mapRes!16134))))

(declare-fun condMapEmpty!16134 () Bool)

(declare-fun mapDefault!16134 () ValueCell!4503)

(assert (=> b!392992 (= condMapEmpty!16134 (= (arr!11107 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4503)) mapDefault!16134)))))

(declare-fun mapIsEmpty!16134 () Bool)

(assert (=> mapIsEmpty!16134 mapRes!16134))

(declare-fun b!392993 () Bool)

(declare-fun e!237972 () Bool)

(assert (=> b!392993 (= e!237968 e!237972)))

(declare-fun res!225070 () Bool)

(assert (=> b!392993 (=> res!225070 e!237972)))

(assert (=> b!392993 (= res!225070 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!185833 () ListLongMap!5511)

(assert (=> b!392993 (= lt!185837 lt!185833)))

(declare-fun lt!185840 () tuple2!6598)

(assert (=> b!392993 (= lt!185833 (+!1066 lt!185832 lt!185840))))

(declare-fun lt!185831 () ListLongMap!5511)

(assert (=> b!392993 (= lt!185835 lt!185831)))

(assert (=> b!392993 (= lt!185831 (+!1066 lt!185842 lt!185840))))

(assert (=> b!392993 (= lt!185835 (+!1066 lt!185836 lt!185840))))

(assert (=> b!392993 (= lt!185840 (tuple2!6599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392994 () Bool)

(declare-fun res!225068 () Bool)

(assert (=> b!392994 (=> (not res!225068) (not e!237969))))

(assert (=> b!392994 (= res!225068 (and (= (size!11459 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11458 _keys!658) (size!11459 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392995 () Bool)

(declare-fun res!225078 () Bool)

(assert (=> b!392995 (=> (not res!225078) (not e!237969))))

(assert (=> b!392995 (= res!225078 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11458 _keys!658))))))

(declare-fun b!392996 () Bool)

(assert (=> b!392996 (= e!237969 e!237966)))

(declare-fun res!225067 () Bool)

(assert (=> b!392996 (=> (not res!225067) (not e!237966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23295 (_ BitVec 32)) Bool)

(assert (=> b!392996 (= res!225067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185834 mask!970))))

(assert (=> b!392996 (= lt!185834 (array!23296 (store (arr!11106 _keys!658) i!548 k0!778) (size!11458 _keys!658)))))

(declare-fun b!392997 () Bool)

(assert (=> b!392997 (= e!237972 true)))

(assert (=> b!392997 (= lt!185831 (+!1066 lt!185833 lt!185830))))

(declare-fun lt!185841 () Unit!12020)

(declare-fun addCommutativeForDiffKeys!344 (ListLongMap!5511 (_ BitVec 64) V!14029 (_ BitVec 64) V!14029) Unit!12020)

(assert (=> b!392997 (= lt!185841 (addCommutativeForDiffKeys!344 lt!185832 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392998 () Bool)

(declare-fun res!225076 () Bool)

(assert (=> b!392998 (=> (not res!225076) (not e!237969))))

(assert (=> b!392998 (= res!225076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!38140 res!225074) b!392994))

(assert (= (and b!392994 res!225068) b!392998))

(assert (= (and b!392998 res!225076) b!392985))

(assert (= (and b!392985 res!225077) b!392995))

(assert (= (and b!392995 res!225078) b!392989))

(assert (= (and b!392989 res!225075) b!392986))

(assert (= (and b!392986 res!225071) b!392984))

(assert (= (and b!392984 res!225072) b!392996))

(assert (= (and b!392996 res!225067) b!392988))

(assert (= (and b!392988 res!225073) b!392990))

(assert (= (and b!392990 (not res!225069)) b!392993))

(assert (= (and b!392993 (not res!225070)) b!392997))

(assert (= (and b!392992 condMapEmpty!16134) mapIsEmpty!16134))

(assert (= (and b!392992 (not condMapEmpty!16134)) mapNonEmpty!16134))

(get-info :version)

(assert (= (and mapNonEmpty!16134 ((_ is ValueCellFull!4503) mapValue!16134)) b!392991))

(assert (= (and b!392992 ((_ is ValueCellFull!4503) mapDefault!16134)) b!392987))

(assert (= start!38140 b!392992))

(declare-fun m!389423 () Bool)

(assert (=> b!392990 m!389423))

(declare-fun m!389425 () Bool)

(assert (=> b!392990 m!389425))

(declare-fun m!389427 () Bool)

(assert (=> b!392990 m!389427))

(declare-fun m!389429 () Bool)

(assert (=> b!392990 m!389429))

(declare-fun m!389431 () Bool)

(assert (=> b!392990 m!389431))

(declare-fun m!389433 () Bool)

(assert (=> b!392990 m!389433))

(declare-fun m!389435 () Bool)

(assert (=> b!392990 m!389435))

(declare-fun m!389437 () Bool)

(assert (=> b!392993 m!389437))

(declare-fun m!389439 () Bool)

(assert (=> b!392993 m!389439))

(declare-fun m!389441 () Bool)

(assert (=> b!392993 m!389441))

(declare-fun m!389443 () Bool)

(assert (=> b!392998 m!389443))

(declare-fun m!389445 () Bool)

(assert (=> b!392989 m!389445))

(declare-fun m!389447 () Bool)

(assert (=> start!38140 m!389447))

(declare-fun m!389449 () Bool)

(assert (=> start!38140 m!389449))

(declare-fun m!389451 () Bool)

(assert (=> start!38140 m!389451))

(declare-fun m!389453 () Bool)

(assert (=> b!392997 m!389453))

(declare-fun m!389455 () Bool)

(assert (=> b!392997 m!389455))

(declare-fun m!389457 () Bool)

(assert (=> mapNonEmpty!16134 m!389457))

(declare-fun m!389459 () Bool)

(assert (=> b!392988 m!389459))

(declare-fun m!389461 () Bool)

(assert (=> b!392996 m!389461))

(declare-fun m!389463 () Bool)

(assert (=> b!392996 m!389463))

(declare-fun m!389465 () Bool)

(assert (=> b!392985 m!389465))

(declare-fun m!389467 () Bool)

(assert (=> b!392984 m!389467))

(declare-fun m!389469 () Bool)

(assert (=> b!392986 m!389469))

(check-sat (not b!392984) (not b!392989) (not b!392993) (not b!392988) tp_is_empty!9693 (not b!392996) (not start!38140) (not b!392985) (not b!392990) (not b!392997) (not mapNonEmpty!16134) b_and!16383 (not b!392998) (not b_next!9021))
(check-sat b_and!16383 (not b_next!9021))
