; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40700 () Bool)

(assert start!40700)

(declare-fun b_free!10711 () Bool)

(declare-fun b_next!10711 () Bool)

(assert (=> start!40700 (= b_free!10711 (not b_next!10711))))

(declare-fun tp!37953 () Bool)

(declare-fun b_and!18719 () Bool)

(assert (=> start!40700 (= tp!37953 b_and!18719)))

(declare-datatypes ((V!17171 0))(
  ( (V!17172 (val!6069 Int)) )
))
(declare-fun minValue!515 () V!17171)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5681 0))(
  ( (ValueCellFull!5681 (v!8324 V!17171)) (EmptyCell!5681) )
))
(declare-datatypes ((array!27905 0))(
  ( (array!27906 (arr!13398 (Array (_ BitVec 32) ValueCell!5681)) (size!13750 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27905)

(declare-fun zeroValue!515 () V!17171)

(declare-fun bm!29722 () Bool)

(declare-datatypes ((array!27907 0))(
  ( (array!27908 (arr!13399 (Array (_ BitVec 32) (_ BitVec 64))) (size!13751 (_ BitVec 32))) )
))
(declare-fun lt!204555 () array!27907)

(declare-datatypes ((tuple2!7968 0))(
  ( (tuple2!7969 (_1!3995 (_ BitVec 64)) (_2!3995 V!17171)) )
))
(declare-datatypes ((List!8037 0))(
  ( (Nil!8034) (Cons!8033 (h!8889 tuple2!7968) (t!13799 List!8037)) )
))
(declare-datatypes ((ListLongMap!6881 0))(
  ( (ListLongMap!6882 (toList!3456 List!8037)) )
))
(declare-fun call!29725 () ListLongMap!6881)

(declare-fun c!55973 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27907)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!204554 () array!27905)

(declare-fun getCurrentListMapNoExtraKeys!1642 (array!27907 array!27905 (_ BitVec 32) (_ BitVec 32) V!17171 V!17171 (_ BitVec 32) Int) ListLongMap!6881)

(assert (=> bm!29722 (= call!29725 (getCurrentListMapNoExtraKeys!1642 (ite c!55973 lt!204555 _keys!709) (ite c!55973 lt!204554 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450229 () Bool)

(declare-fun res!267942 () Bool)

(declare-fun e!263861 () Bool)

(assert (=> b!450229 (=> (not res!267942) (not e!263861))))

(assert (=> b!450229 (= res!267942 (and (= (size!13750 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13751 _keys!709) (size!13750 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450230 () Bool)

(declare-fun e!263864 () Bool)

(declare-fun tp_is_empty!12049 () Bool)

(assert (=> b!450230 (= e!263864 tp_is_empty!12049)))

(declare-fun b!450231 () Bool)

(declare-fun res!267938 () Bool)

(declare-fun e!263866 () Bool)

(assert (=> b!450231 (=> (not res!267938) (not e!263866))))

(declare-datatypes ((List!8038 0))(
  ( (Nil!8035) (Cons!8034 (h!8890 (_ BitVec 64)) (t!13800 List!8038)) )
))
(declare-fun arrayNoDuplicates!0 (array!27907 (_ BitVec 32) List!8038) Bool)

(assert (=> b!450231 (= res!267938 (arrayNoDuplicates!0 lt!204555 #b00000000000000000000000000000000 Nil!8035))))

(declare-fun b!450232 () Bool)

(declare-fun res!267949 () Bool)

(assert (=> b!450232 (=> (not res!267949) (not e!263861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27907 (_ BitVec 32)) Bool)

(assert (=> b!450232 (= res!267949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19707 () Bool)

(declare-fun mapRes!19707 () Bool)

(declare-fun tp!37952 () Bool)

(declare-fun e!263860 () Bool)

(assert (=> mapNonEmpty!19707 (= mapRes!19707 (and tp!37952 e!263860))))

(declare-fun mapRest!19707 () (Array (_ BitVec 32) ValueCell!5681))

(declare-fun mapValue!19707 () ValueCell!5681)

(declare-fun mapKey!19707 () (_ BitVec 32))

(assert (=> mapNonEmpty!19707 (= (arr!13398 _values!549) (store mapRest!19707 mapKey!19707 mapValue!19707))))

(declare-fun b!450233 () Bool)

(declare-fun res!267943 () Bool)

(assert (=> b!450233 (=> (not res!267943) (not e!263861))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450233 (= res!267943 (or (= (select (arr!13399 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13399 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450234 () Bool)

(declare-fun e!263865 () Bool)

(assert (=> b!450234 (= e!263865 (and e!263864 mapRes!19707))))

(declare-fun condMapEmpty!19707 () Bool)

(declare-fun mapDefault!19707 () ValueCell!5681)

