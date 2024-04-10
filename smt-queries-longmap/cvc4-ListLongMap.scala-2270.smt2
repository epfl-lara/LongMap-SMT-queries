; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37086 () Bool)

(assert start!37086)

(declare-fun b_free!8213 () Bool)

(declare-fun b_next!8213 () Bool)

(assert (=> start!37086 (= b_free!8213 (not b_next!8213))))

(declare-fun tp!29355 () Bool)

(declare-fun b_and!15455 () Bool)

(assert (=> start!37086 (= tp!29355 b_and!15455)))

(declare-fun b!373228 () Bool)

(declare-fun res!210179 () Bool)

(declare-fun e!227556 () Bool)

(assert (=> b!373228 (=> (not res!210179) (not e!227556))))

(declare-datatypes ((array!21663 0))(
  ( (array!21664 (arr!10300 (Array (_ BitVec 32) (_ BitVec 64))) (size!10652 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21663)

(declare-datatypes ((List!5784 0))(
  ( (Nil!5781) (Cons!5780 (h!6636 (_ BitVec 64)) (t!10934 List!5784)) )
))
(declare-fun arrayNoDuplicates!0 (array!21663 (_ BitVec 32) List!5784) Bool)

(assert (=> b!373228 (= res!210179 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5781))))

(declare-fun b!373230 () Bool)

(declare-fun e!227552 () Bool)

(declare-fun e!227558 () Bool)

(assert (=> b!373230 (= e!227552 (not e!227558))))

(declare-fun res!210183 () Bool)

(assert (=> b!373230 (=> res!210183 e!227558)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373230 (= res!210183 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!12919 0))(
  ( (V!12920 (val!4475 Int)) )
))
(declare-datatypes ((tuple2!5938 0))(
  ( (tuple2!5939 (_1!2980 (_ BitVec 64)) (_2!2980 V!12919)) )
))
(declare-datatypes ((List!5785 0))(
  ( (Nil!5782) (Cons!5781 (h!6637 tuple2!5938) (t!10935 List!5785)) )
))
(declare-datatypes ((ListLongMap!4851 0))(
  ( (ListLongMap!4852 (toList!2441 List!5785)) )
))
(declare-fun lt!171251 () ListLongMap!4851)

(declare-datatypes ((ValueCell!4087 0))(
  ( (ValueCellFull!4087 (v!6672 V!12919)) (EmptyCell!4087) )
))
(declare-datatypes ((array!21665 0))(
  ( (array!21666 (arr!10301 (Array (_ BitVec 32) ValueCell!4087)) (size!10653 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21665)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12919)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12919)

(declare-fun getCurrentListMap!1884 (array!21663 array!21665 (_ BitVec 32) (_ BitVec 32) V!12919 V!12919 (_ BitVec 32) Int) ListLongMap!4851)

(assert (=> b!373230 (= lt!171251 (getCurrentListMap!1884 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171239 () array!21663)

(declare-fun lt!171244 () array!21665)

(declare-fun lt!171248 () ListLongMap!4851)

(assert (=> b!373230 (= lt!171248 (getCurrentListMap!1884 lt!171239 lt!171244 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171252 () ListLongMap!4851)

(declare-fun lt!171242 () ListLongMap!4851)

(assert (=> b!373230 (and (= lt!171252 lt!171242) (= lt!171242 lt!171252))))

(declare-fun lt!171250 () ListLongMap!4851)

(declare-fun lt!171241 () tuple2!5938)

(declare-fun +!787 (ListLongMap!4851 tuple2!5938) ListLongMap!4851)

(assert (=> b!373230 (= lt!171242 (+!787 lt!171250 lt!171241))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!12919)

(assert (=> b!373230 (= lt!171241 (tuple2!5939 k!778 v!373))))

(declare-datatypes ((Unit!11480 0))(
  ( (Unit!11481) )
))
(declare-fun lt!171247 () Unit!11480)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!42 (array!21663 array!21665 (_ BitVec 32) (_ BitVec 32) V!12919 V!12919 (_ BitVec 32) (_ BitVec 64) V!12919 (_ BitVec 32) Int) Unit!11480)

(assert (=> b!373230 (= lt!171247 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!42 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!718 (array!21663 array!21665 (_ BitVec 32) (_ BitVec 32) V!12919 V!12919 (_ BitVec 32) Int) ListLongMap!4851)

(assert (=> b!373230 (= lt!171252 (getCurrentListMapNoExtraKeys!718 lt!171239 lt!171244 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373230 (= lt!171244 (array!21666 (store (arr!10301 _values!506) i!548 (ValueCellFull!4087 v!373)) (size!10653 _values!506)))))

(assert (=> b!373230 (= lt!171250 (getCurrentListMapNoExtraKeys!718 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373231 () Bool)

(declare-fun res!210185 () Bool)

(assert (=> b!373231 (=> (not res!210185) (not e!227556))))

(declare-fun arrayContainsKey!0 (array!21663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373231 (= res!210185 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!373232 () Bool)

(assert (=> b!373232 (= e!227558 true)))

(declare-fun lt!171249 () ListLongMap!4851)

(declare-fun lt!171246 () ListLongMap!4851)

(assert (=> b!373232 (= lt!171249 (+!787 lt!171246 lt!171241))))

(declare-fun lt!171245 () Unit!11480)

(declare-fun addCommutativeForDiffKeys!213 (ListLongMap!4851 (_ BitVec 64) V!12919 (_ BitVec 64) V!12919) Unit!11480)

(assert (=> b!373232 (= lt!171245 (addCommutativeForDiffKeys!213 lt!171250 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171240 () tuple2!5938)

(assert (=> b!373232 (= lt!171248 (+!787 lt!171249 lt!171240))))

(declare-fun lt!171243 () tuple2!5938)

(assert (=> b!373232 (= lt!171249 (+!787 lt!171242 lt!171243))))

(assert (=> b!373232 (= lt!171251 (+!787 lt!171246 lt!171240))))

(assert (=> b!373232 (= lt!171246 (+!787 lt!171250 lt!171243))))

(assert (=> b!373232 (= lt!171248 (+!787 (+!787 lt!171252 lt!171243) lt!171240))))

(assert (=> b!373232 (= lt!171240 (tuple2!5939 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373232 (= lt!171243 (tuple2!5939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373233 () Bool)

(declare-fun res!210175 () Bool)

(assert (=> b!373233 (=> (not res!210175) (not e!227556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373233 (= res!210175 (validKeyInArray!0 k!778))))

(declare-fun b!373234 () Bool)

(declare-fun e!227555 () Bool)

(declare-fun tp_is_empty!8861 () Bool)

(assert (=> b!373234 (= e!227555 tp_is_empty!8861)))

(declare-fun b!373235 () Bool)

(declare-fun res!210176 () Bool)

(assert (=> b!373235 (=> (not res!210176) (not e!227552))))

(assert (=> b!373235 (= res!210176 (arrayNoDuplicates!0 lt!171239 #b00000000000000000000000000000000 Nil!5781))))

(declare-fun b!373236 () Bool)

(assert (=> b!373236 (= e!227556 e!227552)))

(declare-fun res!210177 () Bool)

(assert (=> b!373236 (=> (not res!210177) (not e!227552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21663 (_ BitVec 32)) Bool)

(assert (=> b!373236 (= res!210177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171239 mask!970))))

(assert (=> b!373236 (= lt!171239 (array!21664 (store (arr!10300 _keys!658) i!548 k!778) (size!10652 _keys!658)))))

(declare-fun mapNonEmpty!14856 () Bool)

(declare-fun mapRes!14856 () Bool)

(declare-fun tp!29354 () Bool)

(assert (=> mapNonEmpty!14856 (= mapRes!14856 (and tp!29354 e!227555))))

(declare-fun mapKey!14856 () (_ BitVec 32))

(declare-fun mapValue!14856 () ValueCell!4087)

(declare-fun mapRest!14856 () (Array (_ BitVec 32) ValueCell!4087))

(assert (=> mapNonEmpty!14856 (= (arr!10301 _values!506) (store mapRest!14856 mapKey!14856 mapValue!14856))))

(declare-fun b!373237 () Bool)

(declare-fun res!210178 () Bool)

(assert (=> b!373237 (=> (not res!210178) (not e!227556))))

(assert (=> b!373237 (= res!210178 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10652 _keys!658))))))

(declare-fun b!373238 () Bool)

(declare-fun e!227554 () Bool)

(declare-fun e!227557 () Bool)

(assert (=> b!373238 (= e!227554 (and e!227557 mapRes!14856))))

(declare-fun condMapEmpty!14856 () Bool)

(declare-fun mapDefault!14856 () ValueCell!4087)

