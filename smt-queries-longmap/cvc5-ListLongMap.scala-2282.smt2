; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37154 () Bool)

(assert start!37154)

(declare-fun b_free!8281 () Bool)

(declare-fun b_next!8281 () Bool)

(assert (=> start!37154 (= b_free!8281 (not b_next!8281))))

(declare-fun tp!29559 () Bool)

(declare-fun b_and!15523 () Bool)

(assert (=> start!37154 (= tp!29559 b_and!15523)))

(declare-fun b!374757 () Bool)

(declare-fun e!228370 () Bool)

(declare-fun e!228372 () Bool)

(assert (=> b!374757 (= e!228370 e!228372)))

(declare-fun res!211407 () Bool)

(assert (=> b!374757 (=> (not res!211407) (not e!228372))))

(declare-datatypes ((array!21797 0))(
  ( (array!21798 (arr!10367 (Array (_ BitVec 32) (_ BitVec 64))) (size!10719 (_ BitVec 32))) )
))
(declare-fun lt!172973 () array!21797)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21797 (_ BitVec 32)) Bool)

(assert (=> b!374757 (= res!211407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172973 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21797)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374757 (= lt!172973 (array!21798 (store (arr!10367 _keys!658) i!548 k!778) (size!10719 _keys!658)))))

(declare-fun b!374758 () Bool)

(declare-fun e!228374 () Bool)

(assert (=> b!374758 (= e!228372 (not e!228374))))

(declare-fun res!211402 () Bool)

(assert (=> b!374758 (=> res!211402 e!228374)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374758 (= res!211402 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13011 0))(
  ( (V!13012 (val!4509 Int)) )
))
(declare-datatypes ((ValueCell!4121 0))(
  ( (ValueCellFull!4121 (v!6706 V!13011)) (EmptyCell!4121) )
))
(declare-datatypes ((array!21799 0))(
  ( (array!21800 (arr!10368 (Array (_ BitVec 32) ValueCell!4121)) (size!10720 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21799)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5998 0))(
  ( (tuple2!5999 (_1!3010 (_ BitVec 64)) (_2!3010 V!13011)) )
))
(declare-datatypes ((List!5842 0))(
  ( (Nil!5839) (Cons!5838 (h!6694 tuple2!5998) (t!10992 List!5842)) )
))
(declare-datatypes ((ListLongMap!4911 0))(
  ( (ListLongMap!4912 (toList!2471 List!5842)) )
))
(declare-fun lt!172983 () ListLongMap!4911)

(declare-fun zeroValue!472 () V!13011)

(declare-fun minValue!472 () V!13011)

(declare-fun getCurrentListMap!1908 (array!21797 array!21799 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) Int) ListLongMap!4911)

(assert (=> b!374758 (= lt!172983 (getCurrentListMap!1908 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172977 () array!21799)

(declare-fun lt!172970 () ListLongMap!4911)

(assert (=> b!374758 (= lt!172970 (getCurrentListMap!1908 lt!172973 lt!172977 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172976 () ListLongMap!4911)

(declare-fun lt!172972 () ListLongMap!4911)

(assert (=> b!374758 (and (= lt!172976 lt!172972) (= lt!172972 lt!172976))))

(declare-fun lt!172985 () ListLongMap!4911)

(declare-fun lt!172978 () tuple2!5998)

(declare-fun +!817 (ListLongMap!4911 tuple2!5998) ListLongMap!4911)

(assert (=> b!374758 (= lt!172972 (+!817 lt!172985 lt!172978))))

(declare-fun v!373 () V!13011)

(assert (=> b!374758 (= lt!172978 (tuple2!5999 k!778 v!373))))

(declare-datatypes ((Unit!11540 0))(
  ( (Unit!11541) )
))
(declare-fun lt!172984 () Unit!11540)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!66 (array!21797 array!21799 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) (_ BitVec 64) V!13011 (_ BitVec 32) Int) Unit!11540)

(assert (=> b!374758 (= lt!172984 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!66 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!742 (array!21797 array!21799 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) Int) ListLongMap!4911)

(assert (=> b!374758 (= lt!172976 (getCurrentListMapNoExtraKeys!742 lt!172973 lt!172977 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374758 (= lt!172977 (array!21800 (store (arr!10368 _values!506) i!548 (ValueCellFull!4121 v!373)) (size!10720 _values!506)))))

(assert (=> b!374758 (= lt!172985 (getCurrentListMapNoExtraKeys!742 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374759 () Bool)

(declare-fun e!228373 () Bool)

(assert (=> b!374759 (= e!228373 true)))

(declare-fun lt!172971 () tuple2!5998)

(declare-fun lt!172980 () ListLongMap!4911)

(declare-fun lt!172974 () ListLongMap!4911)

(assert (=> b!374759 (= (+!817 lt!172974 lt!172971) (+!817 lt!172980 lt!172978))))

(declare-fun lt!172986 () Unit!11540)

(declare-fun lt!172981 () ListLongMap!4911)

(declare-fun addCommutativeForDiffKeys!239 (ListLongMap!4911 (_ BitVec 64) V!13011 (_ BitVec 64) V!13011) Unit!11540)

(assert (=> b!374759 (= lt!172986 (addCommutativeForDiffKeys!239 lt!172981 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!14958 () Bool)

(declare-fun mapRes!14958 () Bool)

(declare-fun tp!29558 () Bool)

(declare-fun e!228368 () Bool)

(assert (=> mapNonEmpty!14958 (= mapRes!14958 (and tp!29558 e!228368))))

(declare-fun mapKey!14958 () (_ BitVec 32))

(declare-fun mapValue!14958 () ValueCell!4121)

(declare-fun mapRest!14958 () (Array (_ BitVec 32) ValueCell!4121))

(assert (=> mapNonEmpty!14958 (= (arr!10368 _values!506) (store mapRest!14958 mapKey!14958 mapValue!14958))))

(declare-fun res!211403 () Bool)

(assert (=> start!37154 (=> (not res!211403) (not e!228370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37154 (= res!211403 (validMask!0 mask!970))))

(assert (=> start!37154 e!228370))

(declare-fun e!228369 () Bool)

(declare-fun array_inv!7646 (array!21799) Bool)

(assert (=> start!37154 (and (array_inv!7646 _values!506) e!228369)))

(assert (=> start!37154 tp!29559))

(assert (=> start!37154 true))

(declare-fun tp_is_empty!8929 () Bool)

(assert (=> start!37154 tp_is_empty!8929))

(declare-fun array_inv!7647 (array!21797) Bool)

(assert (=> start!37154 (array_inv!7647 _keys!658)))

(declare-fun b!374760 () Bool)

(declare-fun res!211406 () Bool)

(assert (=> b!374760 (=> (not res!211406) (not e!228370))))

(declare-datatypes ((List!5843 0))(
  ( (Nil!5840) (Cons!5839 (h!6695 (_ BitVec 64)) (t!10993 List!5843)) )
))
(declare-fun arrayNoDuplicates!0 (array!21797 (_ BitVec 32) List!5843) Bool)

(assert (=> b!374760 (= res!211406 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5840))))

(declare-fun mapIsEmpty!14958 () Bool)

(assert (=> mapIsEmpty!14958 mapRes!14958))

(declare-fun b!374761 () Bool)

(declare-fun e!228367 () Bool)

(assert (=> b!374761 (= e!228367 tp_is_empty!8929)))

(declare-fun b!374762 () Bool)

(assert (=> b!374762 (= e!228368 tp_is_empty!8929)))

(declare-fun b!374763 () Bool)

(declare-fun res!211401 () Bool)

(assert (=> b!374763 (=> (not res!211401) (not e!228370))))

(assert (=> b!374763 (= res!211401 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10719 _keys!658))))))

(declare-fun b!374764 () Bool)

(declare-fun res!211398 () Bool)

(assert (=> b!374764 (=> (not res!211398) (not e!228372))))

(assert (=> b!374764 (= res!211398 (arrayNoDuplicates!0 lt!172973 #b00000000000000000000000000000000 Nil!5840))))

(declare-fun b!374765 () Bool)

(assert (=> b!374765 (= e!228374 e!228373)))

(declare-fun res!211400 () Bool)

(assert (=> b!374765 (=> res!211400 e!228373)))

(assert (=> b!374765 (= res!211400 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172979 () ListLongMap!4911)

(assert (=> b!374765 (= lt!172979 lt!172974)))

(assert (=> b!374765 (= lt!172974 (+!817 lt!172981 lt!172978))))

(declare-fun lt!172975 () Unit!11540)

(assert (=> b!374765 (= lt!172975 (addCommutativeForDiffKeys!239 lt!172985 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374765 (= lt!172970 (+!817 lt!172979 lt!172971))))

(declare-fun lt!172982 () tuple2!5998)

(assert (=> b!374765 (= lt!172979 (+!817 lt!172972 lt!172982))))

(assert (=> b!374765 (= lt!172983 lt!172980)))

(assert (=> b!374765 (= lt!172980 (+!817 lt!172981 lt!172971))))

(assert (=> b!374765 (= lt!172981 (+!817 lt!172985 lt!172982))))

(assert (=> b!374765 (= lt!172970 (+!817 (+!817 lt!172976 lt!172982) lt!172971))))

(assert (=> b!374765 (= lt!172971 (tuple2!5999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374765 (= lt!172982 (tuple2!5999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374766 () Bool)

(declare-fun res!211409 () Bool)

(assert (=> b!374766 (=> (not res!211409) (not e!228370))))

(assert (=> b!374766 (= res!211409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374767 () Bool)

(declare-fun res!211405 () Bool)

(assert (=> b!374767 (=> (not res!211405) (not e!228370))))

(declare-fun arrayContainsKey!0 (array!21797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374767 (= res!211405 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!374768 () Bool)

(assert (=> b!374768 (= e!228369 (and e!228367 mapRes!14958))))

(declare-fun condMapEmpty!14958 () Bool)

(declare-fun mapDefault!14958 () ValueCell!4121)

