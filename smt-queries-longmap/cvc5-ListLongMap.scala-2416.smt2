; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38224 () Bool)

(assert start!38224)

(declare-fun b_free!9061 () Bool)

(declare-fun b_next!9061 () Bool)

(assert (=> start!38224 (= b_free!9061 (not b_next!9061))))

(declare-fun tp!31971 () Bool)

(declare-fun b_and!16447 () Bool)

(assert (=> start!38224 (= tp!31971 b_and!16447)))

(declare-fun b!394237 () Bool)

(declare-fun res!225917 () Bool)

(declare-fun e!238663 () Bool)

(assert (=> b!394237 (=> (not res!225917) (not e!238663))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23375 0))(
  ( (array!23376 (arr!11144 (Array (_ BitVec 32) (_ BitVec 64))) (size!11496 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23375)

(assert (=> b!394237 (= res!225917 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11496 _keys!658))))))

(declare-fun mapIsEmpty!16200 () Bool)

(declare-fun mapRes!16200 () Bool)

(assert (=> mapIsEmpty!16200 mapRes!16200))

(declare-fun b!394238 () Bool)

(declare-fun e!238661 () Bool)

(declare-fun e!238664 () Bool)

(assert (=> b!394238 (= e!238661 (not e!238664))))

(declare-fun res!225925 () Bool)

(assert (=> b!394238 (=> res!225925 e!238664)))

(declare-fun lt!186763 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394238 (= res!225925 (or (and (not lt!186763) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186763) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186763)))))

(assert (=> b!394238 (= lt!186763 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!14083 0))(
  ( (V!14084 (val!4911 Int)) )
))
(declare-datatypes ((ValueCell!4523 0))(
  ( (ValueCellFull!4523 (v!7156 V!14083)) (EmptyCell!4523) )
))
(declare-datatypes ((array!23377 0))(
  ( (array!23378 (arr!11145 (Array (_ BitVec 32) ValueCell!4523)) (size!11497 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23377)

(declare-datatypes ((tuple2!6630 0))(
  ( (tuple2!6631 (_1!3326 (_ BitVec 64)) (_2!3326 V!14083)) )
))
(declare-datatypes ((List!6483 0))(
  ( (Nil!6480) (Cons!6479 (h!7335 tuple2!6630) (t!11657 List!6483)) )
))
(declare-datatypes ((ListLongMap!5543 0))(
  ( (ListLongMap!5544 (toList!2787 List!6483)) )
))
(declare-fun lt!186770 () ListLongMap!5543)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14083)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14083)

(declare-fun getCurrentListMap!2126 (array!23375 array!23377 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) Int) ListLongMap!5543)

(assert (=> b!394238 (= lt!186770 (getCurrentListMap!2126 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186767 () ListLongMap!5543)

(declare-fun lt!186765 () array!23377)

(declare-fun lt!186769 () array!23375)

(assert (=> b!394238 (= lt!186767 (getCurrentListMap!2126 lt!186769 lt!186765 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186764 () ListLongMap!5543)

(declare-fun lt!186766 () ListLongMap!5543)

(assert (=> b!394238 (and (= lt!186764 lt!186766) (= lt!186766 lt!186764))))

(declare-fun lt!186768 () ListLongMap!5543)

(declare-fun lt!186762 () tuple2!6630)

(declare-fun +!1080 (ListLongMap!5543 tuple2!6630) ListLongMap!5543)

(assert (=> b!394238 (= lt!186766 (+!1080 lt!186768 lt!186762))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!14083)

(assert (=> b!394238 (= lt!186762 (tuple2!6631 k!778 v!373))))

(declare-datatypes ((Unit!12050 0))(
  ( (Unit!12051) )
))
(declare-fun lt!186771 () Unit!12050)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!290 (array!23375 array!23377 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) (_ BitVec 64) V!14083 (_ BitVec 32) Int) Unit!12050)

(assert (=> b!394238 (= lt!186771 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!290 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1006 (array!23375 array!23377 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) Int) ListLongMap!5543)

(assert (=> b!394238 (= lt!186764 (getCurrentListMapNoExtraKeys!1006 lt!186769 lt!186765 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394238 (= lt!186765 (array!23378 (store (arr!11145 _values!506) i!548 (ValueCellFull!4523 v!373)) (size!11497 _values!506)))))

(assert (=> b!394238 (= lt!186768 (getCurrentListMapNoExtraKeys!1006 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!225918 () Bool)

(assert (=> start!38224 (=> (not res!225918) (not e!238663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38224 (= res!225918 (validMask!0 mask!970))))

(assert (=> start!38224 e!238663))

(declare-fun e!238659 () Bool)

(declare-fun array_inv!8182 (array!23377) Bool)

(assert (=> start!38224 (and (array_inv!8182 _values!506) e!238659)))

(assert (=> start!38224 tp!31971))

(assert (=> start!38224 true))

(declare-fun tp_is_empty!9733 () Bool)

(assert (=> start!38224 tp_is_empty!9733))

(declare-fun array_inv!8183 (array!23375) Bool)

(assert (=> start!38224 (array_inv!8183 _keys!658)))

(declare-fun b!394239 () Bool)

(declare-fun e!238660 () Bool)

(assert (=> b!394239 (= e!238660 tp_is_empty!9733)))

(declare-fun b!394240 () Bool)

(declare-fun e!238658 () Bool)

(assert (=> b!394240 (= e!238659 (and e!238658 mapRes!16200))))

(declare-fun condMapEmpty!16200 () Bool)

(declare-fun mapDefault!16200 () ValueCell!4523)

