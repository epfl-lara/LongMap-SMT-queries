; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37118 () Bool)

(assert start!37118)

(declare-fun b_free!8245 () Bool)

(declare-fun b_next!8245 () Bool)

(assert (=> start!37118 (= b_free!8245 (not b_next!8245))))

(declare-fun tp!29451 () Bool)

(declare-fun b_and!15487 () Bool)

(assert (=> start!37118 (= tp!29451 b_and!15487)))

(declare-fun b!373947 () Bool)

(declare-fun e!227942 () Bool)

(declare-fun tp_is_empty!8893 () Bool)

(assert (=> b!373947 (= e!227942 tp_is_empty!8893)))

(declare-fun b!373948 () Bool)

(declare-fun res!210760 () Bool)

(declare-fun e!227941 () Bool)

(assert (=> b!373948 (=> (not res!210760) (not e!227941))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12963 0))(
  ( (V!12964 (val!4491 Int)) )
))
(declare-datatypes ((ValueCell!4103 0))(
  ( (ValueCellFull!4103 (v!6688 V!12963)) (EmptyCell!4103) )
))
(declare-datatypes ((array!21725 0))(
  ( (array!21726 (arr!10331 (Array (_ BitVec 32) ValueCell!4103)) (size!10683 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21725)

(declare-datatypes ((array!21727 0))(
  ( (array!21728 (arr!10332 (Array (_ BitVec 32) (_ BitVec 64))) (size!10684 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21727)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!373948 (= res!210760 (and (= (size!10683 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10684 _keys!658) (size!10683 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373949 () Bool)

(declare-fun res!210761 () Bool)

(assert (=> b!373949 (=> (not res!210761) (not e!227941))))

(declare-datatypes ((List!5811 0))(
  ( (Nil!5808) (Cons!5807 (h!6663 (_ BitVec 64)) (t!10961 List!5811)) )
))
(declare-fun arrayNoDuplicates!0 (array!21727 (_ BitVec 32) List!5811) Bool)

(assert (=> b!373949 (= res!210761 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5808))))

(declare-fun b!373950 () Bool)

(declare-fun e!227938 () Bool)

(declare-fun e!227935 () Bool)

(assert (=> b!373950 (= e!227938 (not e!227935))))

(declare-fun res!210756 () Bool)

(assert (=> b!373950 (=> res!210756 e!227935)))

(assert (=> b!373950 (= res!210756 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5966 0))(
  ( (tuple2!5967 (_1!2994 (_ BitVec 64)) (_2!2994 V!12963)) )
))
(declare-datatypes ((List!5812 0))(
  ( (Nil!5809) (Cons!5808 (h!6664 tuple2!5966) (t!10962 List!5812)) )
))
(declare-datatypes ((ListLongMap!4879 0))(
  ( (ListLongMap!4880 (toList!2455 List!5812)) )
))
(declare-fun lt!172067 () ListLongMap!4879)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12963)

(declare-fun minValue!472 () V!12963)

(declare-fun getCurrentListMap!1894 (array!21727 array!21725 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) Int) ListLongMap!4879)

(assert (=> b!373950 (= lt!172067 (getCurrentListMap!1894 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172057 () ListLongMap!4879)

(declare-fun lt!172056 () array!21725)

(declare-fun lt!172055 () array!21727)

(assert (=> b!373950 (= lt!172057 (getCurrentListMap!1894 lt!172055 lt!172056 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172054 () ListLongMap!4879)

(declare-fun lt!172052 () ListLongMap!4879)

(assert (=> b!373950 (and (= lt!172054 lt!172052) (= lt!172052 lt!172054))))

(declare-fun lt!172062 () ListLongMap!4879)

(declare-fun lt!172064 () tuple2!5966)

(declare-fun +!801 (ListLongMap!4879 tuple2!5966) ListLongMap!4879)

(assert (=> b!373950 (= lt!172052 (+!801 lt!172062 lt!172064))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!12963)

(assert (=> b!373950 (= lt!172064 (tuple2!5967 k!778 v!373))))

(declare-datatypes ((Unit!11508 0))(
  ( (Unit!11509) )
))
(declare-fun lt!172065 () Unit!11508)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!52 (array!21727 array!21725 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) (_ BitVec 64) V!12963 (_ BitVec 32) Int) Unit!11508)

(assert (=> b!373950 (= lt!172065 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!52 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!728 (array!21727 array!21725 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) Int) ListLongMap!4879)

(assert (=> b!373950 (= lt!172054 (getCurrentListMapNoExtraKeys!728 lt!172055 lt!172056 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373950 (= lt!172056 (array!21726 (store (arr!10331 _values!506) i!548 (ValueCellFull!4103 v!373)) (size!10683 _values!506)))))

(assert (=> b!373950 (= lt!172062 (getCurrentListMapNoExtraKeys!728 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373951 () Bool)

(declare-fun res!210757 () Bool)

(assert (=> b!373951 (=> (not res!210757) (not e!227941))))

(assert (=> b!373951 (= res!210757 (or (= (select (arr!10332 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10332 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14904 () Bool)

(declare-fun mapRes!14904 () Bool)

(assert (=> mapIsEmpty!14904 mapRes!14904))

(declare-fun res!210753 () Bool)

(assert (=> start!37118 (=> (not res!210753) (not e!227941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37118 (= res!210753 (validMask!0 mask!970))))

(assert (=> start!37118 e!227941))

(declare-fun e!227939 () Bool)

(declare-fun array_inv!7616 (array!21725) Bool)

(assert (=> start!37118 (and (array_inv!7616 _values!506) e!227939)))

(assert (=> start!37118 tp!29451))

(assert (=> start!37118 true))

(assert (=> start!37118 tp_is_empty!8893))

(declare-fun array_inv!7617 (array!21727) Bool)

(assert (=> start!37118 (array_inv!7617 _keys!658)))

(declare-fun b!373952 () Bool)

(declare-fun res!210751 () Bool)

(assert (=> b!373952 (=> (not res!210751) (not e!227941))))

(assert (=> b!373952 (= res!210751 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10684 _keys!658))))))

(declare-fun b!373953 () Bool)

(declare-fun res!210750 () Bool)

(assert (=> b!373953 (=> (not res!210750) (not e!227938))))

(assert (=> b!373953 (= res!210750 (arrayNoDuplicates!0 lt!172055 #b00000000000000000000000000000000 Nil!5808))))

(declare-fun b!373954 () Bool)

(declare-fun res!210755 () Bool)

(assert (=> b!373954 (=> (not res!210755) (not e!227941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373954 (= res!210755 (validKeyInArray!0 k!778))))

(declare-fun b!373955 () Bool)

(declare-fun res!210754 () Bool)

(assert (=> b!373955 (=> (not res!210754) (not e!227941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21727 (_ BitVec 32)) Bool)

(assert (=> b!373955 (= res!210754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373956 () Bool)

(declare-fun e!227936 () Bool)

(assert (=> b!373956 (= e!227936 true)))

(declare-fun lt!172066 () ListLongMap!4879)

(declare-fun lt!172061 () ListLongMap!4879)

(declare-fun lt!172068 () tuple2!5966)

(assert (=> b!373956 (= (+!801 lt!172066 lt!172068) (+!801 lt!172061 lt!172064))))

(declare-fun lt!172060 () Unit!11508)

(declare-fun lt!172059 () ListLongMap!4879)

(declare-fun addCommutativeForDiffKeys!225 (ListLongMap!4879 (_ BitVec 64) V!12963 (_ BitVec 64) V!12963) Unit!11508)

(assert (=> b!373956 (= lt!172060 (addCommutativeForDiffKeys!225 lt!172059 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373957 () Bool)

(declare-fun e!227937 () Bool)

(assert (=> b!373957 (= e!227939 (and e!227937 mapRes!14904))))

(declare-fun condMapEmpty!14904 () Bool)

(declare-fun mapDefault!14904 () ValueCell!4103)

