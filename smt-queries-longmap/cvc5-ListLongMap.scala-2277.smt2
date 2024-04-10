; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37124 () Bool)

(assert start!37124)

(declare-fun b_free!8251 () Bool)

(declare-fun b_next!8251 () Bool)

(assert (=> start!37124 (= b_free!8251 (not b_next!8251))))

(declare-fun tp!29468 () Bool)

(declare-fun b_and!15493 () Bool)

(assert (=> start!37124 (= tp!29468 b_and!15493)))

(declare-fun b!374082 () Bool)

(declare-fun res!210860 () Bool)

(declare-fun e!228010 () Bool)

(assert (=> b!374082 (=> (not res!210860) (not e!228010))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12971 0))(
  ( (V!12972 (val!4494 Int)) )
))
(declare-datatypes ((ValueCell!4106 0))(
  ( (ValueCellFull!4106 (v!6691 V!12971)) (EmptyCell!4106) )
))
(declare-datatypes ((array!21737 0))(
  ( (array!21738 (arr!10337 (Array (_ BitVec 32) ValueCell!4106)) (size!10689 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21737)

(declare-datatypes ((array!21739 0))(
  ( (array!21740 (arr!10338 (Array (_ BitVec 32) (_ BitVec 64))) (size!10690 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21739)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!374082 (= res!210860 (and (= (size!10689 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10690 _keys!658) (size!10689 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374083 () Bool)

(declare-fun res!210864 () Bool)

(assert (=> b!374083 (=> (not res!210864) (not e!228010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21739 (_ BitVec 32)) Bool)

(assert (=> b!374083 (= res!210864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374084 () Bool)

(declare-fun e!228008 () Bool)

(declare-fun e!228014 () Bool)

(assert (=> b!374084 (= e!228008 (not e!228014))))

(declare-fun res!210863 () Bool)

(assert (=> b!374084 (=> res!210863 e!228014)))

(assert (=> b!374084 (= res!210863 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5972 0))(
  ( (tuple2!5973 (_1!2997 (_ BitVec 64)) (_2!2997 V!12971)) )
))
(declare-datatypes ((List!5817 0))(
  ( (Nil!5814) (Cons!5813 (h!6669 tuple2!5972) (t!10967 List!5817)) )
))
(declare-datatypes ((ListLongMap!4885 0))(
  ( (ListLongMap!4886 (toList!2458 List!5817)) )
))
(declare-fun lt!172206 () ListLongMap!4885)

(declare-fun zeroValue!472 () V!12971)

(declare-fun minValue!472 () V!12971)

(declare-fun getCurrentListMap!1897 (array!21739 array!21737 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) Int) ListLongMap!4885)

(assert (=> b!374084 (= lt!172206 (getCurrentListMap!1897 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172208 () array!21739)

(declare-fun lt!172212 () array!21737)

(declare-fun lt!172210 () ListLongMap!4885)

(assert (=> b!374084 (= lt!172210 (getCurrentListMap!1897 lt!172208 lt!172212 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172217 () ListLongMap!4885)

(declare-fun lt!172205 () ListLongMap!4885)

(assert (=> b!374084 (and (= lt!172217 lt!172205) (= lt!172205 lt!172217))))

(declare-fun lt!172215 () ListLongMap!4885)

(declare-fun lt!172219 () tuple2!5972)

(declare-fun +!804 (ListLongMap!4885 tuple2!5972) ListLongMap!4885)

(assert (=> b!374084 (= lt!172205 (+!804 lt!172215 lt!172219))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!12971)

(assert (=> b!374084 (= lt!172219 (tuple2!5973 k!778 v!373))))

(declare-datatypes ((Unit!11514 0))(
  ( (Unit!11515) )
))
(declare-fun lt!172209 () Unit!11514)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!55 (array!21739 array!21737 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) (_ BitVec 64) V!12971 (_ BitVec 32) Int) Unit!11514)

(assert (=> b!374084 (= lt!172209 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!55 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!731 (array!21739 array!21737 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) Int) ListLongMap!4885)

(assert (=> b!374084 (= lt!172217 (getCurrentListMapNoExtraKeys!731 lt!172208 lt!172212 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374084 (= lt!172212 (array!21738 (store (arr!10337 _values!506) i!548 (ValueCellFull!4106 v!373)) (size!10689 _values!506)))))

(assert (=> b!374084 (= lt!172215 (getCurrentListMapNoExtraKeys!731 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!210859 () Bool)

(assert (=> start!37124 (=> (not res!210859) (not e!228010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37124 (= res!210859 (validMask!0 mask!970))))

(assert (=> start!37124 e!228010))

(declare-fun e!228009 () Bool)

(declare-fun array_inv!7622 (array!21737) Bool)

(assert (=> start!37124 (and (array_inv!7622 _values!506) e!228009)))

(assert (=> start!37124 tp!29468))

(assert (=> start!37124 true))

(declare-fun tp_is_empty!8899 () Bool)

(assert (=> start!37124 tp_is_empty!8899))

(declare-fun array_inv!7623 (array!21739) Bool)

(assert (=> start!37124 (array_inv!7623 _keys!658)))

(declare-fun b!374085 () Bool)

(declare-fun res!210869 () Bool)

(assert (=> b!374085 (=> (not res!210869) (not e!228010))))

(assert (=> b!374085 (= res!210869 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10690 _keys!658))))))

(declare-fun b!374086 () Bool)

(declare-fun res!210867 () Bool)

(assert (=> b!374086 (=> (not res!210867) (not e!228008))))

(declare-datatypes ((List!5818 0))(
  ( (Nil!5815) (Cons!5814 (h!6670 (_ BitVec 64)) (t!10968 List!5818)) )
))
(declare-fun arrayNoDuplicates!0 (array!21739 (_ BitVec 32) List!5818) Bool)

(assert (=> b!374086 (= res!210867 (arrayNoDuplicates!0 lt!172208 #b00000000000000000000000000000000 Nil!5815))))

(declare-fun b!374087 () Bool)

(assert (=> b!374087 (= e!228010 e!228008)))

(declare-fun res!210861 () Bool)

(assert (=> b!374087 (=> (not res!210861) (not e!228008))))

(assert (=> b!374087 (= res!210861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172208 mask!970))))

(assert (=> b!374087 (= lt!172208 (array!21740 (store (arr!10338 _keys!658) i!548 k!778) (size!10690 _keys!658)))))

(declare-fun mapNonEmpty!14913 () Bool)

(declare-fun mapRes!14913 () Bool)

(declare-fun tp!29469 () Bool)

(declare-fun e!228011 () Bool)

(assert (=> mapNonEmpty!14913 (= mapRes!14913 (and tp!29469 e!228011))))

(declare-fun mapKey!14913 () (_ BitVec 32))

(declare-fun mapValue!14913 () ValueCell!4106)

(declare-fun mapRest!14913 () (Array (_ BitVec 32) ValueCell!4106))

(assert (=> mapNonEmpty!14913 (= (arr!10337 _values!506) (store mapRest!14913 mapKey!14913 mapValue!14913))))

(declare-fun b!374088 () Bool)

(declare-fun res!210865 () Bool)

(assert (=> b!374088 (=> (not res!210865) (not e!228010))))

(assert (=> b!374088 (= res!210865 (or (= (select (arr!10338 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10338 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374089 () Bool)

(assert (=> b!374089 (= e!228011 tp_is_empty!8899)))

(declare-fun b!374090 () Bool)

(declare-fun e!228013 () Bool)

(assert (=> b!374090 (= e!228013 true)))

(declare-fun lt!172216 () tuple2!5972)

(declare-fun lt!172211 () ListLongMap!4885)

(declare-fun lt!172220 () ListLongMap!4885)

(assert (=> b!374090 (= (+!804 lt!172220 lt!172216) (+!804 lt!172211 lt!172219))))

(declare-fun lt!172221 () ListLongMap!4885)

(declare-fun lt!172207 () Unit!11514)

(declare-fun addCommutativeForDiffKeys!228 (ListLongMap!4885 (_ BitVec 64) V!12971 (_ BitVec 64) V!12971) Unit!11514)

(assert (=> b!374090 (= lt!172207 (addCommutativeForDiffKeys!228 lt!172221 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374091 () Bool)

(declare-fun res!210868 () Bool)

(assert (=> b!374091 (=> (not res!210868) (not e!228010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374091 (= res!210868 (validKeyInArray!0 k!778))))

(declare-fun b!374092 () Bool)

(assert (=> b!374092 (= e!228014 e!228013)))

(declare-fun res!210862 () Bool)

(assert (=> b!374092 (=> res!210862 e!228013)))

(assert (=> b!374092 (= res!210862 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172214 () ListLongMap!4885)

(assert (=> b!374092 (= lt!172214 lt!172220)))

(assert (=> b!374092 (= lt!172220 (+!804 lt!172221 lt!172219))))

(declare-fun lt!172213 () Unit!11514)

(assert (=> b!374092 (= lt!172213 (addCommutativeForDiffKeys!228 lt!172215 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374092 (= lt!172210 (+!804 lt!172214 lt!172216))))

(declare-fun lt!172218 () tuple2!5972)

(assert (=> b!374092 (= lt!172214 (+!804 lt!172205 lt!172218))))

(assert (=> b!374092 (= lt!172206 lt!172211)))

(assert (=> b!374092 (= lt!172211 (+!804 lt!172221 lt!172216))))

(assert (=> b!374092 (= lt!172221 (+!804 lt!172215 lt!172218))))

(assert (=> b!374092 (= lt!172210 (+!804 (+!804 lt!172217 lt!172218) lt!172216))))

(assert (=> b!374092 (= lt!172216 (tuple2!5973 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374092 (= lt!172218 (tuple2!5973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374093 () Bool)

(declare-fun res!210858 () Bool)

(assert (=> b!374093 (=> (not res!210858) (not e!228010))))

(declare-fun arrayContainsKey!0 (array!21739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374093 (= res!210858 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!374094 () Bool)

(declare-fun res!210866 () Bool)

(assert (=> b!374094 (=> (not res!210866) (not e!228010))))

(assert (=> b!374094 (= res!210866 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5815))))

(declare-fun b!374095 () Bool)

(declare-fun e!228007 () Bool)

(assert (=> b!374095 (= e!228007 tp_is_empty!8899)))

(declare-fun mapIsEmpty!14913 () Bool)

(assert (=> mapIsEmpty!14913 mapRes!14913))

(declare-fun b!374096 () Bool)

(assert (=> b!374096 (= e!228009 (and e!228007 mapRes!14913))))

(declare-fun condMapEmpty!14913 () Bool)

(declare-fun mapDefault!14913 () ValueCell!4106)

