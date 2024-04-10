; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37122 () Bool)

(assert start!37122)

(declare-fun b_free!8249 () Bool)

(declare-fun b_next!8249 () Bool)

(assert (=> start!37122 (= b_free!8249 (not b_next!8249))))

(declare-fun tp!29463 () Bool)

(declare-fun b_and!15491 () Bool)

(assert (=> start!37122 (= tp!29463 b_and!15491)))

(declare-fun b!374037 () Bool)

(declare-fun res!210825 () Bool)

(declare-fun e!227985 () Bool)

(assert (=> b!374037 (=> (not res!210825) (not e!227985))))

(declare-datatypes ((array!21733 0))(
  ( (array!21734 (arr!10335 (Array (_ BitVec 32) (_ BitVec 64))) (size!10687 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21733)

(declare-datatypes ((List!5815 0))(
  ( (Nil!5812) (Cons!5811 (h!6667 (_ BitVec 64)) (t!10965 List!5815)) )
))
(declare-fun arrayNoDuplicates!0 (array!21733 (_ BitVec 32) List!5815) Bool)

(assert (=> b!374037 (= res!210825 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5812))))

(declare-fun res!210832 () Bool)

(assert (=> start!37122 (=> (not res!210832) (not e!227985))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37122 (= res!210832 (validMask!0 mask!970))))

(assert (=> start!37122 e!227985))

(declare-datatypes ((V!12967 0))(
  ( (V!12968 (val!4493 Int)) )
))
(declare-datatypes ((ValueCell!4105 0))(
  ( (ValueCellFull!4105 (v!6690 V!12967)) (EmptyCell!4105) )
))
(declare-datatypes ((array!21735 0))(
  ( (array!21736 (arr!10336 (Array (_ BitVec 32) ValueCell!4105)) (size!10688 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21735)

(declare-fun e!227990 () Bool)

(declare-fun array_inv!7620 (array!21735) Bool)

(assert (=> start!37122 (and (array_inv!7620 _values!506) e!227990)))

(assert (=> start!37122 tp!29463))

(assert (=> start!37122 true))

(declare-fun tp_is_empty!8897 () Bool)

(assert (=> start!37122 tp_is_empty!8897))

(declare-fun array_inv!7621 (array!21733) Bool)

(assert (=> start!37122 (array_inv!7621 _keys!658)))

(declare-fun b!374038 () Bool)

(declare-fun e!227984 () Bool)

(assert (=> b!374038 (= e!227984 tp_is_empty!8897)))

(declare-fun mapIsEmpty!14910 () Bool)

(declare-fun mapRes!14910 () Bool)

(assert (=> mapIsEmpty!14910 mapRes!14910))

(declare-fun b!374039 () Bool)

(declare-fun res!210829 () Bool)

(assert (=> b!374039 (=> (not res!210829) (not e!227985))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374039 (= res!210829 (or (= (select (arr!10335 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10335 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374040 () Bool)

(declare-fun res!210823 () Bool)

(declare-fun e!227989 () Bool)

(assert (=> b!374040 (=> (not res!210823) (not e!227989))))

(declare-fun lt!172160 () array!21733)

(assert (=> b!374040 (= res!210823 (arrayNoDuplicates!0 lt!172160 #b00000000000000000000000000000000 Nil!5812))))

(declare-fun b!374041 () Bool)

(declare-fun e!227987 () Bool)

(assert (=> b!374041 (= e!227987 true)))

(declare-datatypes ((tuple2!5970 0))(
  ( (tuple2!5971 (_1!2996 (_ BitVec 64)) (_2!2996 V!12967)) )
))
(declare-fun lt!172170 () tuple2!5970)

(declare-fun lt!172161 () tuple2!5970)

(declare-datatypes ((List!5816 0))(
  ( (Nil!5813) (Cons!5812 (h!6668 tuple2!5970) (t!10966 List!5816)) )
))
(declare-datatypes ((ListLongMap!4883 0))(
  ( (ListLongMap!4884 (toList!2457 List!5816)) )
))
(declare-fun lt!172158 () ListLongMap!4883)

(declare-fun lt!172164 () ListLongMap!4883)

(declare-fun +!803 (ListLongMap!4883 tuple2!5970) ListLongMap!4883)

(assert (=> b!374041 (= (+!803 lt!172158 lt!172170) (+!803 lt!172164 lt!172161))))

(declare-fun v!373 () V!12967)

(declare-fun lt!172165 () ListLongMap!4883)

(declare-datatypes ((Unit!11512 0))(
  ( (Unit!11513) )
))
(declare-fun lt!172155 () Unit!11512)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!12967)

(declare-fun addCommutativeForDiffKeys!227 (ListLongMap!4883 (_ BitVec 64) V!12967 (_ BitVec 64) V!12967) Unit!11512)

(assert (=> b!374041 (= lt!172155 (addCommutativeForDiffKeys!227 lt!172165 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374042 () Bool)

(declare-fun res!210831 () Bool)

(assert (=> b!374042 (=> (not res!210831) (not e!227985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21733 (_ BitVec 32)) Bool)

(assert (=> b!374042 (= res!210831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374043 () Bool)

(declare-fun res!210822 () Bool)

(assert (=> b!374043 (=> (not res!210822) (not e!227985))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374043 (= res!210822 (and (= (size!10688 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10687 _keys!658) (size!10688 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374044 () Bool)

(declare-fun res!210830 () Bool)

(assert (=> b!374044 (=> (not res!210830) (not e!227985))))

(assert (=> b!374044 (= res!210830 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10687 _keys!658))))))

(declare-fun mapNonEmpty!14910 () Bool)

(declare-fun tp!29462 () Bool)

(assert (=> mapNonEmpty!14910 (= mapRes!14910 (and tp!29462 e!227984))))

(declare-fun mapValue!14910 () ValueCell!4105)

(declare-fun mapKey!14910 () (_ BitVec 32))

(declare-fun mapRest!14910 () (Array (_ BitVec 32) ValueCell!4105))

(assert (=> mapNonEmpty!14910 (= (arr!10336 _values!506) (store mapRest!14910 mapKey!14910 mapValue!14910))))

(declare-fun b!374045 () Bool)

(declare-fun res!210826 () Bool)

(assert (=> b!374045 (=> (not res!210826) (not e!227985))))

(declare-fun arrayContainsKey!0 (array!21733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374045 (= res!210826 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!374046 () Bool)

(declare-fun res!210828 () Bool)

(assert (=> b!374046 (=> (not res!210828) (not e!227985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374046 (= res!210828 (validKeyInArray!0 k!778))))

(declare-fun b!374047 () Bool)

(declare-fun e!227983 () Bool)

(assert (=> b!374047 (= e!227989 (not e!227983))))

(declare-fun res!210833 () Bool)

(assert (=> b!374047 (=> res!210833 e!227983)))

(assert (=> b!374047 (= res!210833 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!172157 () ListLongMap!4883)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12967)

(declare-fun getCurrentListMap!1896 (array!21733 array!21735 (_ BitVec 32) (_ BitVec 32) V!12967 V!12967 (_ BitVec 32) Int) ListLongMap!4883)

(assert (=> b!374047 (= lt!172157 (getCurrentListMap!1896 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172159 () array!21735)

(declare-fun lt!172166 () ListLongMap!4883)

(assert (=> b!374047 (= lt!172166 (getCurrentListMap!1896 lt!172160 lt!172159 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172162 () ListLongMap!4883)

(declare-fun lt!172156 () ListLongMap!4883)

(assert (=> b!374047 (and (= lt!172162 lt!172156) (= lt!172156 lt!172162))))

(declare-fun lt!172167 () ListLongMap!4883)

(assert (=> b!374047 (= lt!172156 (+!803 lt!172167 lt!172161))))

(assert (=> b!374047 (= lt!172161 (tuple2!5971 k!778 v!373))))

(declare-fun lt!172154 () Unit!11512)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!54 (array!21733 array!21735 (_ BitVec 32) (_ BitVec 32) V!12967 V!12967 (_ BitVec 32) (_ BitVec 64) V!12967 (_ BitVec 32) Int) Unit!11512)

(assert (=> b!374047 (= lt!172154 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!54 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!730 (array!21733 array!21735 (_ BitVec 32) (_ BitVec 32) V!12967 V!12967 (_ BitVec 32) Int) ListLongMap!4883)

(assert (=> b!374047 (= lt!172162 (getCurrentListMapNoExtraKeys!730 lt!172160 lt!172159 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374047 (= lt!172159 (array!21736 (store (arr!10336 _values!506) i!548 (ValueCellFull!4105 v!373)) (size!10688 _values!506)))))

(assert (=> b!374047 (= lt!172167 (getCurrentListMapNoExtraKeys!730 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374048 () Bool)

(assert (=> b!374048 (= e!227983 e!227987)))

(declare-fun res!210827 () Bool)

(assert (=> b!374048 (=> res!210827 e!227987)))

(assert (=> b!374048 (= res!210827 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172169 () ListLongMap!4883)

(assert (=> b!374048 (= lt!172169 lt!172158)))

(assert (=> b!374048 (= lt!172158 (+!803 lt!172165 lt!172161))))

(declare-fun lt!172163 () Unit!11512)

(assert (=> b!374048 (= lt!172163 (addCommutativeForDiffKeys!227 lt!172167 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374048 (= lt!172166 (+!803 lt!172169 lt!172170))))

(declare-fun lt!172168 () tuple2!5970)

(assert (=> b!374048 (= lt!172169 (+!803 lt!172156 lt!172168))))

(assert (=> b!374048 (= lt!172157 lt!172164)))

(assert (=> b!374048 (= lt!172164 (+!803 lt!172165 lt!172170))))

(assert (=> b!374048 (= lt!172165 (+!803 lt!172167 lt!172168))))

(assert (=> b!374048 (= lt!172166 (+!803 (+!803 lt!172162 lt!172168) lt!172170))))

(assert (=> b!374048 (= lt!172170 (tuple2!5971 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374048 (= lt!172168 (tuple2!5971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374049 () Bool)

(declare-fun e!227988 () Bool)

(assert (=> b!374049 (= e!227990 (and e!227988 mapRes!14910))))

(declare-fun condMapEmpty!14910 () Bool)

(declare-fun mapDefault!14910 () ValueCell!4105)

