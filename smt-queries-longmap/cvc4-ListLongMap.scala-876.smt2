; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20356 () Bool)

(assert start!20356)

(declare-fun b_free!5015 () Bool)

(declare-fun b_next!5015 () Bool)

(assert (=> start!20356 (= b_free!5015 (not b_next!5015))))

(declare-fun tp!18077 () Bool)

(declare-fun b_and!11761 () Bool)

(assert (=> start!20356 (= tp!18077 b_and!11761)))

(declare-fun b!200898 () Bool)

(declare-fun res!95854 () Bool)

(declare-fun e!131710 () Bool)

(assert (=> b!200898 (=> (not res!95854) (not e!131710))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200898 (= res!95854 (validKeyInArray!0 k!843))))

(declare-fun b!200899 () Bool)

(declare-fun res!95851 () Bool)

(assert (=> b!200899 (=> (not res!95851) (not e!131710))))

(declare-datatypes ((array!8973 0))(
  ( (array!8974 (arr!4237 (Array (_ BitVec 32) (_ BitVec 64))) (size!4562 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8973)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200899 (= res!95851 (= (select (arr!4237 _keys!825) i!601) k!843))))

(declare-fun b!200900 () Bool)

(declare-fun e!131709 () Bool)

(declare-fun e!131706 () Bool)

(assert (=> b!200900 (= e!131709 e!131706)))

(declare-fun res!95853 () Bool)

(assert (=> b!200900 (=> res!95853 e!131706)))

(assert (=> b!200900 (= res!95853 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6141 0))(
  ( (V!6142 (val!2480 Int)) )
))
(declare-datatypes ((tuple2!3752 0))(
  ( (tuple2!3753 (_1!1887 (_ BitVec 64)) (_2!1887 V!6141)) )
))
(declare-datatypes ((List!2668 0))(
  ( (Nil!2665) (Cons!2664 (h!3306 tuple2!3752) (t!7599 List!2668)) )
))
(declare-datatypes ((ListLongMap!2665 0))(
  ( (ListLongMap!2666 (toList!1348 List!2668)) )
))
(declare-fun lt!99654 () ListLongMap!2665)

(declare-fun lt!99656 () ListLongMap!2665)

(assert (=> b!200900 (= lt!99654 lt!99656)))

(declare-fun lt!99657 () ListLongMap!2665)

(declare-fun lt!99661 () tuple2!3752)

(declare-fun +!375 (ListLongMap!2665 tuple2!3752) ListLongMap!2665)

(assert (=> b!200900 (= lt!99656 (+!375 lt!99657 lt!99661))))

(declare-fun lt!99660 () ListLongMap!2665)

(declare-datatypes ((Unit!6050 0))(
  ( (Unit!6051) )
))
(declare-fun lt!99662 () Unit!6050)

(declare-fun v!520 () V!6141)

(declare-fun zeroValue!615 () V!6141)

(declare-fun addCommutativeForDiffKeys!96 (ListLongMap!2665 (_ BitVec 64) V!6141 (_ BitVec 64) V!6141) Unit!6050)

(assert (=> b!200900 (= lt!99662 (addCommutativeForDiffKeys!96 lt!99660 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99648 () ListLongMap!2665)

(declare-fun lt!99653 () tuple2!3752)

(assert (=> b!200900 (= lt!99648 (+!375 lt!99654 lt!99653))))

(declare-fun lt!99659 () ListLongMap!2665)

(declare-fun lt!99649 () tuple2!3752)

(assert (=> b!200900 (= lt!99654 (+!375 lt!99659 lt!99649))))

(declare-fun lt!99655 () ListLongMap!2665)

(declare-fun lt!99663 () ListLongMap!2665)

(assert (=> b!200900 (= lt!99655 lt!99663)))

(assert (=> b!200900 (= lt!99663 (+!375 lt!99657 lt!99653))))

(assert (=> b!200900 (= lt!99657 (+!375 lt!99660 lt!99649))))

(declare-fun lt!99658 () ListLongMap!2665)

(assert (=> b!200900 (= lt!99648 (+!375 (+!375 lt!99658 lt!99649) lt!99653))))

(declare-fun minValue!615 () V!6141)

(assert (=> b!200900 (= lt!99653 (tuple2!3753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200900 (= lt!99649 (tuple2!3753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200901 () Bool)

(assert (=> b!200901 (= e!131710 (not e!131709))))

(declare-fun res!95848 () Bool)

(assert (=> b!200901 (=> res!95848 e!131709)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200901 (= res!95848 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2092 0))(
  ( (ValueCellFull!2092 (v!4450 V!6141)) (EmptyCell!2092) )
))
(declare-datatypes ((array!8975 0))(
  ( (array!8976 (arr!4238 (Array (_ BitVec 32) ValueCell!2092)) (size!4563 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8975)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!937 (array!8973 array!8975 (_ BitVec 32) (_ BitVec 32) V!6141 V!6141 (_ BitVec 32) Int) ListLongMap!2665)

(assert (=> b!200901 (= lt!99655 (getCurrentListMap!937 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99651 () array!8975)

(assert (=> b!200901 (= lt!99648 (getCurrentListMap!937 _keys!825 lt!99651 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200901 (and (= lt!99658 lt!99659) (= lt!99659 lt!99658))))

(assert (=> b!200901 (= lt!99659 (+!375 lt!99660 lt!99661))))

(assert (=> b!200901 (= lt!99661 (tuple2!3753 k!843 v!520))))

(declare-fun lt!99652 () Unit!6050)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!50 (array!8973 array!8975 (_ BitVec 32) (_ BitVec 32) V!6141 V!6141 (_ BitVec 32) (_ BitVec 64) V!6141 (_ BitVec 32) Int) Unit!6050)

(assert (=> b!200901 (= lt!99652 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!50 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!311 (array!8973 array!8975 (_ BitVec 32) (_ BitVec 32) V!6141 V!6141 (_ BitVec 32) Int) ListLongMap!2665)

(assert (=> b!200901 (= lt!99658 (getCurrentListMapNoExtraKeys!311 _keys!825 lt!99651 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200901 (= lt!99651 (array!8976 (store (arr!4238 _values!649) i!601 (ValueCellFull!2092 v!520)) (size!4563 _values!649)))))

(assert (=> b!200901 (= lt!99660 (getCurrentListMapNoExtraKeys!311 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200902 () Bool)

(declare-fun res!95846 () Bool)

(assert (=> b!200902 (=> (not res!95846) (not e!131710))))

(assert (=> b!200902 (= res!95846 (and (= (size!4563 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4562 _keys!825) (size!4563 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200903 () Bool)

(declare-fun res!95852 () Bool)

(assert (=> b!200903 (=> (not res!95852) (not e!131710))))

(assert (=> b!200903 (= res!95852 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4562 _keys!825))))))

(declare-fun b!200904 () Bool)

(declare-fun res!95850 () Bool)

(assert (=> b!200904 (=> (not res!95850) (not e!131710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8973 (_ BitVec 32)) Bool)

(assert (=> b!200904 (= res!95850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8375 () Bool)

(declare-fun mapRes!8375 () Bool)

(declare-fun tp!18076 () Bool)

(declare-fun e!131711 () Bool)

(assert (=> mapNonEmpty!8375 (= mapRes!8375 (and tp!18076 e!131711))))

(declare-fun mapKey!8375 () (_ BitVec 32))

(declare-fun mapRest!8375 () (Array (_ BitVec 32) ValueCell!2092))

(declare-fun mapValue!8375 () ValueCell!2092)

(assert (=> mapNonEmpty!8375 (= (arr!4238 _values!649) (store mapRest!8375 mapKey!8375 mapValue!8375))))

(declare-fun b!200905 () Bool)

(declare-fun e!131705 () Bool)

(declare-fun tp_is_empty!4871 () Bool)

(assert (=> b!200905 (= e!131705 tp_is_empty!4871)))

(declare-fun mapIsEmpty!8375 () Bool)

(assert (=> mapIsEmpty!8375 mapRes!8375))

(declare-fun b!200907 () Bool)

(assert (=> b!200907 (= e!131711 tp_is_empty!4871)))

(declare-fun b!200908 () Bool)

(declare-fun res!95849 () Bool)

(assert (=> b!200908 (=> (not res!95849) (not e!131710))))

(declare-datatypes ((List!2669 0))(
  ( (Nil!2666) (Cons!2665 (h!3307 (_ BitVec 64)) (t!7600 List!2669)) )
))
(declare-fun arrayNoDuplicates!0 (array!8973 (_ BitVec 32) List!2669) Bool)

(assert (=> b!200908 (= res!95849 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2666))))

(declare-fun b!200909 () Bool)

(assert (=> b!200909 (= e!131706 true)))

(assert (=> b!200909 (= (+!375 lt!99656 lt!99653) (+!375 lt!99663 lt!99661))))

(declare-fun lt!99650 () Unit!6050)

(assert (=> b!200909 (= lt!99650 (addCommutativeForDiffKeys!96 lt!99657 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200906 () Bool)

(declare-fun e!131707 () Bool)

(assert (=> b!200906 (= e!131707 (and e!131705 mapRes!8375))))

(declare-fun condMapEmpty!8375 () Bool)

(declare-fun mapDefault!8375 () ValueCell!2092)

