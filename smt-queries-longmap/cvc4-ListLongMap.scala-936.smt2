; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20716 () Bool)

(assert start!20716)

(declare-fun b_free!5375 () Bool)

(declare-fun b_next!5375 () Bool)

(assert (=> start!20716 (= b_free!5375 (not b_next!5375))))

(declare-fun tp!19156 () Bool)

(declare-fun b_and!12121 () Bool)

(assert (=> start!20716 (= tp!19156 b_and!12121)))

(declare-fun b!207236 () Bool)

(declare-datatypes ((array!9671 0))(
  ( (array!9672 (arr!4586 (Array (_ BitVec 32) (_ BitVec 64))) (size!4911 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9671)

(declare-fun e!135325 () Bool)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun lt!106139 () Bool)

(declare-datatypes ((V!6621 0))(
  ( (V!6622 (val!2660 Int)) )
))
(declare-datatypes ((tuple2!4040 0))(
  ( (tuple2!4041 (_1!2031 (_ BitVec 64)) (_2!2031 V!6621)) )
))
(declare-datatypes ((List!2931 0))(
  ( (Nil!2928) (Cons!2927 (h!3569 tuple2!4040) (t!7862 List!2931)) )
))
(declare-datatypes ((ListLongMap!2953 0))(
  ( (ListLongMap!2954 (toList!1492 List!2931)) )
))
(declare-fun lt!106136 () ListLongMap!2953)

(declare-fun lt!106137 () ListLongMap!2953)

(assert (=> b!207236 (= e!135325 (not (or (and (not lt!106139) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!106139) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!106139) (not (= lt!106136 lt!106137)) (bvsle #b00000000000000000000000000000000 (size!4911 _keys!825)))))))

(assert (=> b!207236 (= lt!106139 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((ValueCell!2272 0))(
  ( (ValueCellFull!2272 (v!4630 V!6621)) (EmptyCell!2272) )
))
(declare-datatypes ((array!9673 0))(
  ( (array!9674 (arr!4587 (Array (_ BitVec 32) ValueCell!2272)) (size!4912 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9673)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun lt!106142 () ListLongMap!2953)

(declare-fun zeroValue!615 () V!6621)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6621)

(declare-fun getCurrentListMap!1059 (array!9671 array!9673 (_ BitVec 32) (_ BitVec 32) V!6621 V!6621 (_ BitVec 32) Int) ListLongMap!2953)

(assert (=> b!207236 (= lt!106142 (getCurrentListMap!1059 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106141 () array!9673)

(assert (=> b!207236 (= lt!106136 (getCurrentListMap!1059 _keys!825 lt!106141 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106140 () ListLongMap!2953)

(assert (=> b!207236 (and (= lt!106137 lt!106140) (= lt!106140 lt!106137))))

(declare-fun lt!106143 () ListLongMap!2953)

(declare-fun v!520 () V!6621)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!519 (ListLongMap!2953 tuple2!4040) ListLongMap!2953)

(assert (=> b!207236 (= lt!106140 (+!519 lt!106143 (tuple2!4041 k!843 v!520)))))

(declare-datatypes ((Unit!6326 0))(
  ( (Unit!6327) )
))
(declare-fun lt!106138 () Unit!6326)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!172 (array!9671 array!9673 (_ BitVec 32) (_ BitVec 32) V!6621 V!6621 (_ BitVec 32) (_ BitVec 64) V!6621 (_ BitVec 32) Int) Unit!6326)

(assert (=> b!207236 (= lt!106138 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!172 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!433 (array!9671 array!9673 (_ BitVec 32) (_ BitVec 32) V!6621 V!6621 (_ BitVec 32) Int) ListLongMap!2953)

(assert (=> b!207236 (= lt!106137 (getCurrentListMapNoExtraKeys!433 _keys!825 lt!106141 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207236 (= lt!106141 (array!9674 (store (arr!4587 _values!649) i!601 (ValueCellFull!2272 v!520)) (size!4912 _values!649)))))

(assert (=> b!207236 (= lt!106143 (getCurrentListMapNoExtraKeys!433 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207237 () Bool)

(declare-fun res!100565 () Bool)

(assert (=> b!207237 (=> (not res!100565) (not e!135325))))

(assert (=> b!207237 (= res!100565 (and (= (size!4912 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4911 _keys!825) (size!4912 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207238 () Bool)

(declare-fun res!100566 () Bool)

(assert (=> b!207238 (=> (not res!100566) (not e!135325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9671 (_ BitVec 32)) Bool)

(assert (=> b!207238 (= res!100566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207239 () Bool)

(declare-fun res!100567 () Bool)

(assert (=> b!207239 (=> (not res!100567) (not e!135325))))

(assert (=> b!207239 (= res!100567 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4911 _keys!825))))))

(declare-fun b!207240 () Bool)

(declare-fun res!100570 () Bool)

(assert (=> b!207240 (=> (not res!100570) (not e!135325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207240 (= res!100570 (validKeyInArray!0 k!843))))

(declare-fun b!207241 () Bool)

(declare-fun res!100564 () Bool)

(assert (=> b!207241 (=> (not res!100564) (not e!135325))))

(assert (=> b!207241 (= res!100564 (= (select (arr!4586 _keys!825) i!601) k!843))))

(declare-fun b!207242 () Bool)

(declare-fun e!135329 () Bool)

(declare-fun tp_is_empty!5231 () Bool)

(assert (=> b!207242 (= e!135329 tp_is_empty!5231)))

(declare-fun mapIsEmpty!8915 () Bool)

(declare-fun mapRes!8915 () Bool)

(assert (=> mapIsEmpty!8915 mapRes!8915))

(declare-fun b!207243 () Bool)

(declare-fun e!135326 () Bool)

(assert (=> b!207243 (= e!135326 tp_is_empty!5231)))

(declare-fun res!100569 () Bool)

(assert (=> start!20716 (=> (not res!100569) (not e!135325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20716 (= res!100569 (validMask!0 mask!1149))))

(assert (=> start!20716 e!135325))

(declare-fun e!135327 () Bool)

(declare-fun array_inv!3037 (array!9673) Bool)

(assert (=> start!20716 (and (array_inv!3037 _values!649) e!135327)))

(assert (=> start!20716 true))

(assert (=> start!20716 tp_is_empty!5231))

(declare-fun array_inv!3038 (array!9671) Bool)

(assert (=> start!20716 (array_inv!3038 _keys!825)))

(assert (=> start!20716 tp!19156))

(declare-fun mapNonEmpty!8915 () Bool)

(declare-fun tp!19157 () Bool)

(assert (=> mapNonEmpty!8915 (= mapRes!8915 (and tp!19157 e!135329))))

(declare-fun mapKey!8915 () (_ BitVec 32))

(declare-fun mapRest!8915 () (Array (_ BitVec 32) ValueCell!2272))

(declare-fun mapValue!8915 () ValueCell!2272)

(assert (=> mapNonEmpty!8915 (= (arr!4587 _values!649) (store mapRest!8915 mapKey!8915 mapValue!8915))))

(declare-fun b!207244 () Bool)

(assert (=> b!207244 (= e!135327 (and e!135326 mapRes!8915))))

(declare-fun condMapEmpty!8915 () Bool)

(declare-fun mapDefault!8915 () ValueCell!2272)

