; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37524 () Bool)

(assert start!37524)

(declare-fun b_free!8651 () Bool)

(declare-fun b_next!8651 () Bool)

(assert (=> start!37524 (= b_free!8651 (not b_next!8651))))

(declare-fun tp!30669 () Bool)

(declare-fun b_and!15893 () Bool)

(assert (=> start!37524 (= tp!30669 b_and!15893)))

(declare-fun b!382948 () Bool)

(declare-fun res!217933 () Bool)

(declare-fun e!232660 () Bool)

(assert (=> b!382948 (=> (not res!217933) (not e!232660))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382948 (= res!217933 (validKeyInArray!0 k!778))))

(declare-fun b!382949 () Bool)

(declare-fun e!232655 () Bool)

(declare-fun tp_is_empty!9299 () Bool)

(assert (=> b!382949 (= e!232655 tp_is_empty!9299)))

(declare-fun b!382950 () Bool)

(declare-fun res!217927 () Bool)

(assert (=> b!382950 (=> (not res!217927) (not e!232660))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13503 0))(
  ( (V!13504 (val!4694 Int)) )
))
(declare-datatypes ((ValueCell!4306 0))(
  ( (ValueCellFull!4306 (v!6891 V!13503)) (EmptyCell!4306) )
))
(declare-datatypes ((array!22507 0))(
  ( (array!22508 (arr!10722 (Array (_ BitVec 32) ValueCell!4306)) (size!11074 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22507)

(declare-datatypes ((array!22509 0))(
  ( (array!22510 (arr!10723 (Array (_ BitVec 32) (_ BitVec 64))) (size!11075 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22509)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382950 (= res!217927 (and (= (size!11074 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11075 _keys!658) (size!11074 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382951 () Bool)

(declare-fun res!217926 () Bool)

(assert (=> b!382951 (=> (not res!217926) (not e!232660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22509 (_ BitVec 32)) Bool)

(assert (=> b!382951 (= res!217926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!217934 () Bool)

(assert (=> start!37524 (=> (not res!217934) (not e!232660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37524 (= res!217934 (validMask!0 mask!970))))

(assert (=> start!37524 e!232660))

(declare-fun e!232657 () Bool)

(declare-fun array_inv!7894 (array!22507) Bool)

(assert (=> start!37524 (and (array_inv!7894 _values!506) e!232657)))

(assert (=> start!37524 tp!30669))

(assert (=> start!37524 true))

(assert (=> start!37524 tp_is_empty!9299))

(declare-fun array_inv!7895 (array!22509) Bool)

(assert (=> start!37524 (array_inv!7895 _keys!658)))

(declare-fun b!382952 () Bool)

(declare-fun res!217929 () Bool)

(declare-fun e!232661 () Bool)

(assert (=> b!382952 (=> (not res!217929) (not e!232661))))

(declare-fun lt!179755 () array!22509)

(declare-datatypes ((List!6146 0))(
  ( (Nil!6143) (Cons!6142 (h!6998 (_ BitVec 64)) (t!11296 List!6146)) )
))
(declare-fun arrayNoDuplicates!0 (array!22509 (_ BitVec 32) List!6146) Bool)

(assert (=> b!382952 (= res!217929 (arrayNoDuplicates!0 lt!179755 #b00000000000000000000000000000000 Nil!6143))))

(declare-fun b!382953 () Bool)

(declare-fun res!217924 () Bool)

(assert (=> b!382953 (=> (not res!217924) (not e!232660))))

(declare-fun arrayContainsKey!0 (array!22509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382953 (= res!217924 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382954 () Bool)

(assert (=> b!382954 (= e!232660 e!232661)))

(declare-fun res!217932 () Bool)

(assert (=> b!382954 (=> (not res!217932) (not e!232661))))

(assert (=> b!382954 (= res!217932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179755 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382954 (= lt!179755 (array!22510 (store (arr!10723 _keys!658) i!548 k!778) (size!11075 _keys!658)))))

(declare-fun b!382955 () Bool)

(declare-fun e!232659 () Bool)

(assert (=> b!382955 (= e!232661 (not e!232659))))

(declare-fun res!217928 () Bool)

(assert (=> b!382955 (=> res!217928 e!232659)))

(declare-fun lt!179749 () Bool)

(assert (=> b!382955 (= res!217928 (or (and (not lt!179749) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179749) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179749)))))

(assert (=> b!382955 (= lt!179749 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13503)

(declare-datatypes ((tuple2!6314 0))(
  ( (tuple2!6315 (_1!3168 (_ BitVec 64)) (_2!3168 V!13503)) )
))
(declare-datatypes ((List!6147 0))(
  ( (Nil!6144) (Cons!6143 (h!6999 tuple2!6314) (t!11297 List!6147)) )
))
(declare-datatypes ((ListLongMap!5227 0))(
  ( (ListLongMap!5228 (toList!2629 List!6147)) )
))
(declare-fun lt!179753 () ListLongMap!5227)

(declare-fun minValue!472 () V!13503)

(declare-fun getCurrentListMap!2034 (array!22509 array!22507 (_ BitVec 32) (_ BitVec 32) V!13503 V!13503 (_ BitVec 32) Int) ListLongMap!5227)

(assert (=> b!382955 (= lt!179753 (getCurrentListMap!2034 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179751 () ListLongMap!5227)

(declare-fun lt!179754 () array!22507)

(assert (=> b!382955 (= lt!179751 (getCurrentListMap!2034 lt!179755 lt!179754 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179756 () ListLongMap!5227)

(declare-fun lt!179752 () ListLongMap!5227)

(assert (=> b!382955 (and (= lt!179756 lt!179752) (= lt!179752 lt!179756))))

(declare-fun v!373 () V!13503)

(declare-fun lt!179750 () ListLongMap!5227)

(declare-fun +!964 (ListLongMap!5227 tuple2!6314) ListLongMap!5227)

(assert (=> b!382955 (= lt!179752 (+!964 lt!179750 (tuple2!6315 k!778 v!373)))))

(declare-datatypes ((Unit!11822 0))(
  ( (Unit!11823) )
))
(declare-fun lt!179757 () Unit!11822)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!192 (array!22509 array!22507 (_ BitVec 32) (_ BitVec 32) V!13503 V!13503 (_ BitVec 32) (_ BitVec 64) V!13503 (_ BitVec 32) Int) Unit!11822)

(assert (=> b!382955 (= lt!179757 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!192 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!868 (array!22509 array!22507 (_ BitVec 32) (_ BitVec 32) V!13503 V!13503 (_ BitVec 32) Int) ListLongMap!5227)

(assert (=> b!382955 (= lt!179756 (getCurrentListMapNoExtraKeys!868 lt!179755 lt!179754 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382955 (= lt!179754 (array!22508 (store (arr!10722 _values!506) i!548 (ValueCellFull!4306 v!373)) (size!11074 _values!506)))))

(assert (=> b!382955 (= lt!179750 (getCurrentListMapNoExtraKeys!868 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382956 () Bool)

(declare-fun res!217925 () Bool)

(assert (=> b!382956 (=> (not res!217925) (not e!232660))))

(assert (=> b!382956 (= res!217925 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11075 _keys!658))))))

(declare-fun b!382957 () Bool)

(assert (=> b!382957 (= e!232659 true)))

(assert (=> b!382957 (= lt!179751 lt!179756)))

(declare-fun b!382958 () Bool)

(declare-fun e!232658 () Bool)

(assert (=> b!382958 (= e!232658 tp_is_empty!9299)))

(declare-fun mapIsEmpty!15513 () Bool)

(declare-fun mapRes!15513 () Bool)

(assert (=> mapIsEmpty!15513 mapRes!15513))

(declare-fun b!382959 () Bool)

(declare-fun res!217931 () Bool)

(assert (=> b!382959 (=> (not res!217931) (not e!232660))))

(assert (=> b!382959 (= res!217931 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6143))))

(declare-fun mapNonEmpty!15513 () Bool)

(declare-fun tp!30668 () Bool)

(assert (=> mapNonEmpty!15513 (= mapRes!15513 (and tp!30668 e!232658))))

(declare-fun mapRest!15513 () (Array (_ BitVec 32) ValueCell!4306))

(declare-fun mapKey!15513 () (_ BitVec 32))

(declare-fun mapValue!15513 () ValueCell!4306)

(assert (=> mapNonEmpty!15513 (= (arr!10722 _values!506) (store mapRest!15513 mapKey!15513 mapValue!15513))))

(declare-fun b!382960 () Bool)

(declare-fun res!217930 () Bool)

(assert (=> b!382960 (=> (not res!217930) (not e!232660))))

(assert (=> b!382960 (= res!217930 (or (= (select (arr!10723 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10723 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382961 () Bool)

(assert (=> b!382961 (= e!232657 (and e!232655 mapRes!15513))))

(declare-fun condMapEmpty!15513 () Bool)

(declare-fun mapDefault!15513 () ValueCell!4306)

