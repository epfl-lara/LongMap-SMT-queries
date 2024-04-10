; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20376 () Bool)

(assert start!20376)

(declare-fun b_free!5035 () Bool)

(declare-fun b_next!5035 () Bool)

(assert (=> start!20376 (= b_free!5035 (not b_next!5035))))

(declare-fun tp!18137 () Bool)

(declare-fun b_and!11781 () Bool)

(assert (=> start!20376 (= tp!18137 b_and!11781)))

(declare-fun res!96118 () Bool)

(declare-fun e!131915 () Bool)

(assert (=> start!20376 (=> (not res!96118) (not e!131915))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20376 (= res!96118 (validMask!0 mask!1149))))

(assert (=> start!20376 e!131915))

(declare-datatypes ((V!6169 0))(
  ( (V!6170 (val!2490 Int)) )
))
(declare-datatypes ((ValueCell!2102 0))(
  ( (ValueCellFull!2102 (v!4460 V!6169)) (EmptyCell!2102) )
))
(declare-datatypes ((array!9011 0))(
  ( (array!9012 (arr!4256 (Array (_ BitVec 32) ValueCell!2102)) (size!4581 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9011)

(declare-fun e!131918 () Bool)

(declare-fun array_inv!2805 (array!9011) Bool)

(assert (=> start!20376 (and (array_inv!2805 _values!649) e!131918)))

(assert (=> start!20376 true))

(declare-fun tp_is_empty!4891 () Bool)

(assert (=> start!20376 tp_is_empty!4891))

(declare-datatypes ((array!9013 0))(
  ( (array!9014 (arr!4257 (Array (_ BitVec 32) (_ BitVec 64))) (size!4582 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9013)

(declare-fun array_inv!2806 (array!9013) Bool)

(assert (=> start!20376 (array_inv!2806 _keys!825)))

(assert (=> start!20376 tp!18137))

(declare-fun b!201258 () Bool)

(declare-fun res!96124 () Bool)

(assert (=> b!201258 (=> (not res!96124) (not e!131915))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201258 (= res!96124 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4582 _keys!825))))))

(declare-fun mapNonEmpty!8405 () Bool)

(declare-fun mapRes!8405 () Bool)

(declare-fun tp!18136 () Bool)

(declare-fun e!131921 () Bool)

(assert (=> mapNonEmpty!8405 (= mapRes!8405 (and tp!18136 e!131921))))

(declare-fun mapRest!8405 () (Array (_ BitVec 32) ValueCell!2102))

(declare-fun mapValue!8405 () ValueCell!2102)

(declare-fun mapKey!8405 () (_ BitVec 32))

(assert (=> mapNonEmpty!8405 (= (arr!4256 _values!649) (store mapRest!8405 mapKey!8405 mapValue!8405))))

(declare-fun b!201259 () Bool)

(declare-fun e!131919 () Bool)

(assert (=> b!201259 (= e!131915 (not e!131919))))

(declare-fun res!96122 () Bool)

(assert (=> b!201259 (=> res!96122 e!131919)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201259 (= res!96122 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3768 0))(
  ( (tuple2!3769 (_1!1895 (_ BitVec 64)) (_2!1895 V!6169)) )
))
(declare-datatypes ((List!2684 0))(
  ( (Nil!2681) (Cons!2680 (h!3322 tuple2!3768) (t!7615 List!2684)) )
))
(declare-datatypes ((ListLongMap!2681 0))(
  ( (ListLongMap!2682 (toList!1356 List!2684)) )
))
(declare-fun lt!100139 () ListLongMap!2681)

(declare-fun zeroValue!615 () V!6169)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6169)

(declare-fun getCurrentListMap!945 (array!9013 array!9011 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) Int) ListLongMap!2681)

(assert (=> b!201259 (= lt!100139 (getCurrentListMap!945 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100129 () array!9011)

(declare-fun lt!100136 () ListLongMap!2681)

(assert (=> b!201259 (= lt!100136 (getCurrentListMap!945 _keys!825 lt!100129 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100143 () ListLongMap!2681)

(declare-fun lt!100130 () ListLongMap!2681)

(assert (=> b!201259 (and (= lt!100143 lt!100130) (= lt!100130 lt!100143))))

(declare-fun lt!100133 () ListLongMap!2681)

(declare-fun lt!100132 () tuple2!3768)

(declare-fun +!383 (ListLongMap!2681 tuple2!3768) ListLongMap!2681)

(assert (=> b!201259 (= lt!100130 (+!383 lt!100133 lt!100132))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6169)

(assert (=> b!201259 (= lt!100132 (tuple2!3769 k!843 v!520))))

(declare-datatypes ((Unit!6066 0))(
  ( (Unit!6067) )
))
(declare-fun lt!100138 () Unit!6066)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!58 (array!9013 array!9011 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) (_ BitVec 64) V!6169 (_ BitVec 32) Int) Unit!6066)

(assert (=> b!201259 (= lt!100138 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!58 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!319 (array!9013 array!9011 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) Int) ListLongMap!2681)

(assert (=> b!201259 (= lt!100143 (getCurrentListMapNoExtraKeys!319 _keys!825 lt!100129 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201259 (= lt!100129 (array!9012 (store (arr!4256 _values!649) i!601 (ValueCellFull!2102 v!520)) (size!4581 _values!649)))))

(assert (=> b!201259 (= lt!100133 (getCurrentListMapNoExtraKeys!319 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201260 () Bool)

(assert (=> b!201260 (= e!131921 tp_is_empty!4891)))

(declare-fun b!201261 () Bool)

(declare-fun res!96116 () Bool)

(assert (=> b!201261 (=> (not res!96116) (not e!131915))))

(assert (=> b!201261 (= res!96116 (= (select (arr!4257 _keys!825) i!601) k!843))))

(declare-fun b!201262 () Bool)

(declare-fun res!96121 () Bool)

(assert (=> b!201262 (=> (not res!96121) (not e!131915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201262 (= res!96121 (validKeyInArray!0 k!843))))

(declare-fun b!201263 () Bool)

(declare-fun res!96119 () Bool)

(assert (=> b!201263 (=> (not res!96119) (not e!131915))))

(assert (=> b!201263 (= res!96119 (and (= (size!4581 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4582 _keys!825) (size!4581 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201264 () Bool)

(declare-fun res!96117 () Bool)

(assert (=> b!201264 (=> (not res!96117) (not e!131915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9013 (_ BitVec 32)) Bool)

(assert (=> b!201264 (= res!96117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201265 () Bool)

(declare-fun e!131917 () Bool)

(assert (=> b!201265 (= e!131919 e!131917)))

(declare-fun res!96123 () Bool)

(assert (=> b!201265 (=> res!96123 e!131917)))

(assert (=> b!201265 (= res!96123 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100128 () ListLongMap!2681)

(declare-fun lt!100131 () ListLongMap!2681)

(assert (=> b!201265 (= lt!100128 lt!100131)))

(declare-fun lt!100141 () ListLongMap!2681)

(assert (=> b!201265 (= lt!100131 (+!383 lt!100141 lt!100132))))

(declare-fun lt!100142 () Unit!6066)

(declare-fun addCommutativeForDiffKeys!104 (ListLongMap!2681 (_ BitVec 64) V!6169 (_ BitVec 64) V!6169) Unit!6066)

(assert (=> b!201265 (= lt!100142 (addCommutativeForDiffKeys!104 lt!100133 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100134 () tuple2!3768)

(assert (=> b!201265 (= lt!100136 (+!383 lt!100128 lt!100134))))

(declare-fun lt!100140 () tuple2!3768)

(assert (=> b!201265 (= lt!100128 (+!383 lt!100130 lt!100140))))

(declare-fun lt!100137 () ListLongMap!2681)

(assert (=> b!201265 (= lt!100139 lt!100137)))

(assert (=> b!201265 (= lt!100137 (+!383 lt!100141 lt!100134))))

(assert (=> b!201265 (= lt!100141 (+!383 lt!100133 lt!100140))))

(assert (=> b!201265 (= lt!100136 (+!383 (+!383 lt!100143 lt!100140) lt!100134))))

(assert (=> b!201265 (= lt!100134 (tuple2!3769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201265 (= lt!100140 (tuple2!3769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201266 () Bool)

(assert (=> b!201266 (= e!131917 (bvsle #b00000000000000000000000000000000 (size!4582 _keys!825)))))

(assert (=> b!201266 (= (+!383 lt!100131 lt!100134) (+!383 lt!100137 lt!100132))))

(declare-fun lt!100135 () Unit!6066)

(assert (=> b!201266 (= lt!100135 (addCommutativeForDiffKeys!104 lt!100141 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201267 () Bool)

(declare-fun e!131916 () Bool)

(assert (=> b!201267 (= e!131918 (and e!131916 mapRes!8405))))

(declare-fun condMapEmpty!8405 () Bool)

(declare-fun mapDefault!8405 () ValueCell!2102)

