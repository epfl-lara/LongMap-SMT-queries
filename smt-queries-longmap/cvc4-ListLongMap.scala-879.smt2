; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20374 () Bool)

(assert start!20374)

(declare-fun b_free!5033 () Bool)

(declare-fun b_next!5033 () Bool)

(assert (=> start!20374 (= b_free!5033 (not b_next!5033))))

(declare-fun tp!18131 () Bool)

(declare-fun b_and!11779 () Bool)

(assert (=> start!20374 (= tp!18131 b_and!11779)))

(declare-fun b!201222 () Bool)

(declare-fun res!96091 () Bool)

(declare-fun e!131896 () Bool)

(assert (=> b!201222 (=> (not res!96091) (not e!131896))))

(declare-datatypes ((array!9007 0))(
  ( (array!9008 (arr!4254 (Array (_ BitVec 32) (_ BitVec 64))) (size!4579 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9007)

(declare-datatypes ((List!2682 0))(
  ( (Nil!2679) (Cons!2678 (h!3320 (_ BitVec 64)) (t!7613 List!2682)) )
))
(declare-fun arrayNoDuplicates!0 (array!9007 (_ BitVec 32) List!2682) Bool)

(assert (=> b!201222 (= res!96091 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2679))))

(declare-fun res!96097 () Bool)

(assert (=> start!20374 (=> (not res!96097) (not e!131896))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20374 (= res!96097 (validMask!0 mask!1149))))

(assert (=> start!20374 e!131896))

(declare-datatypes ((V!6165 0))(
  ( (V!6166 (val!2489 Int)) )
))
(declare-datatypes ((ValueCell!2101 0))(
  ( (ValueCellFull!2101 (v!4459 V!6165)) (EmptyCell!2101) )
))
(declare-datatypes ((array!9009 0))(
  ( (array!9010 (arr!4255 (Array (_ BitVec 32) ValueCell!2101)) (size!4580 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9009)

(declare-fun e!131900 () Bool)

(declare-fun array_inv!2803 (array!9009) Bool)

(assert (=> start!20374 (and (array_inv!2803 _values!649) e!131900)))

(assert (=> start!20374 true))

(declare-fun tp_is_empty!4889 () Bool)

(assert (=> start!20374 tp_is_empty!4889))

(declare-fun array_inv!2804 (array!9007) Bool)

(assert (=> start!20374 (array_inv!2804 _keys!825)))

(assert (=> start!20374 tp!18131))

(declare-fun b!201223 () Bool)

(declare-fun res!96095 () Bool)

(assert (=> b!201223 (=> (not res!96095) (not e!131896))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201223 (= res!96095 (validKeyInArray!0 k!843))))

(declare-fun b!201224 () Bool)

(declare-fun res!96092 () Bool)

(assert (=> b!201224 (=> (not res!96092) (not e!131896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9007 (_ BitVec 32)) Bool)

(assert (=> b!201224 (= res!96092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201225 () Bool)

(declare-fun e!131894 () Bool)

(assert (=> b!201225 (= e!131894 true)))

(declare-datatypes ((tuple2!3766 0))(
  ( (tuple2!3767 (_1!1894 (_ BitVec 64)) (_2!1894 V!6165)) )
))
(declare-fun lt!100080 () tuple2!3766)

(declare-datatypes ((List!2683 0))(
  ( (Nil!2680) (Cons!2679 (h!3321 tuple2!3766) (t!7614 List!2683)) )
))
(declare-datatypes ((ListLongMap!2679 0))(
  ( (ListLongMap!2680 (toList!1355 List!2683)) )
))
(declare-fun lt!100091 () ListLongMap!2679)

(declare-fun lt!100089 () tuple2!3766)

(declare-fun lt!100081 () ListLongMap!2679)

(declare-fun +!382 (ListLongMap!2679 tuple2!3766) ListLongMap!2679)

(assert (=> b!201225 (= (+!382 lt!100091 lt!100089) (+!382 lt!100081 lt!100080))))

(declare-fun minValue!615 () V!6165)

(declare-fun v!520 () V!6165)

(declare-fun lt!100082 () ListLongMap!2679)

(declare-datatypes ((Unit!6064 0))(
  ( (Unit!6065) )
))
(declare-fun lt!100094 () Unit!6064)

(declare-fun addCommutativeForDiffKeys!103 (ListLongMap!2679 (_ BitVec 64) V!6165 (_ BitVec 64) V!6165) Unit!6064)

(assert (=> b!201225 (= lt!100094 (addCommutativeForDiffKeys!103 lt!100082 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201226 () Bool)

(declare-fun res!96090 () Bool)

(assert (=> b!201226 (=> (not res!96090) (not e!131896))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201226 (= res!96090 (and (= (size!4580 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4579 _keys!825) (size!4580 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201227 () Bool)

(declare-fun e!131895 () Bool)

(assert (=> b!201227 (= e!131895 e!131894)))

(declare-fun res!96093 () Bool)

(assert (=> b!201227 (=> res!96093 e!131894)))

(assert (=> b!201227 (= res!96093 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100095 () ListLongMap!2679)

(assert (=> b!201227 (= lt!100095 lt!100091)))

(assert (=> b!201227 (= lt!100091 (+!382 lt!100082 lt!100080))))

(declare-fun lt!100084 () ListLongMap!2679)

(declare-fun lt!100088 () Unit!6064)

(declare-fun zeroValue!615 () V!6165)

(assert (=> b!201227 (= lt!100088 (addCommutativeForDiffKeys!103 lt!100084 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100090 () ListLongMap!2679)

(assert (=> b!201227 (= lt!100090 (+!382 lt!100095 lt!100089))))

(declare-fun lt!100085 () ListLongMap!2679)

(declare-fun lt!100087 () tuple2!3766)

(assert (=> b!201227 (= lt!100095 (+!382 lt!100085 lt!100087))))

(declare-fun lt!100083 () ListLongMap!2679)

(assert (=> b!201227 (= lt!100083 lt!100081)))

(assert (=> b!201227 (= lt!100081 (+!382 lt!100082 lt!100089))))

(assert (=> b!201227 (= lt!100082 (+!382 lt!100084 lt!100087))))

(declare-fun lt!100092 () ListLongMap!2679)

(assert (=> b!201227 (= lt!100090 (+!382 (+!382 lt!100092 lt!100087) lt!100089))))

(assert (=> b!201227 (= lt!100089 (tuple2!3767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201227 (= lt!100087 (tuple2!3767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201228 () Bool)

(declare-fun res!96094 () Bool)

(assert (=> b!201228 (=> (not res!96094) (not e!131896))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201228 (= res!96094 (= (select (arr!4254 _keys!825) i!601) k!843))))

(declare-fun b!201229 () Bool)

(declare-fun res!96096 () Bool)

(assert (=> b!201229 (=> (not res!96096) (not e!131896))))

(assert (=> b!201229 (= res!96096 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4579 _keys!825))))))

(declare-fun mapIsEmpty!8402 () Bool)

(declare-fun mapRes!8402 () Bool)

(assert (=> mapIsEmpty!8402 mapRes!8402))

(declare-fun b!201230 () Bool)

(assert (=> b!201230 (= e!131896 (not e!131895))))

(declare-fun res!96089 () Bool)

(assert (=> b!201230 (=> res!96089 e!131895)))

(assert (=> b!201230 (= res!96089 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!944 (array!9007 array!9009 (_ BitVec 32) (_ BitVec 32) V!6165 V!6165 (_ BitVec 32) Int) ListLongMap!2679)

(assert (=> b!201230 (= lt!100083 (getCurrentListMap!944 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100086 () array!9009)

(assert (=> b!201230 (= lt!100090 (getCurrentListMap!944 _keys!825 lt!100086 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201230 (and (= lt!100092 lt!100085) (= lt!100085 lt!100092))))

(assert (=> b!201230 (= lt!100085 (+!382 lt!100084 lt!100080))))

(assert (=> b!201230 (= lt!100080 (tuple2!3767 k!843 v!520))))

(declare-fun lt!100093 () Unit!6064)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!57 (array!9007 array!9009 (_ BitVec 32) (_ BitVec 32) V!6165 V!6165 (_ BitVec 32) (_ BitVec 64) V!6165 (_ BitVec 32) Int) Unit!6064)

(assert (=> b!201230 (= lt!100093 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!57 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!318 (array!9007 array!9009 (_ BitVec 32) (_ BitVec 32) V!6165 V!6165 (_ BitVec 32) Int) ListLongMap!2679)

(assert (=> b!201230 (= lt!100092 (getCurrentListMapNoExtraKeys!318 _keys!825 lt!100086 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201230 (= lt!100086 (array!9010 (store (arr!4255 _values!649) i!601 (ValueCellFull!2101 v!520)) (size!4580 _values!649)))))

(assert (=> b!201230 (= lt!100084 (getCurrentListMapNoExtraKeys!318 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201231 () Bool)

(declare-fun e!131898 () Bool)

(assert (=> b!201231 (= e!131900 (and e!131898 mapRes!8402))))

(declare-fun condMapEmpty!8402 () Bool)

(declare-fun mapDefault!8402 () ValueCell!2101)

