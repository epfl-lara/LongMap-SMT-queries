; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20862 () Bool)

(assert start!20862)

(declare-fun b_free!5515 () Bool)

(declare-fun b_next!5515 () Bool)

(assert (=> start!20862 (= b_free!5515 (not b_next!5515))))

(declare-fun tp!19586 () Bool)

(declare-fun b_and!12261 () Bool)

(assert (=> start!20862 (= tp!19586 b_and!12261)))

(declare-fun b!209390 () Bool)

(declare-fun res!102062 () Bool)

(declare-fun e!136422 () Bool)

(assert (=> b!209390 (=> (not res!102062) (not e!136422))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209390 (= res!102062 (validKeyInArray!0 k!843))))

(declare-fun b!209391 () Bool)

(declare-fun res!102063 () Bool)

(assert (=> b!209391 (=> (not res!102063) (not e!136422))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9951 0))(
  ( (array!9952 (arr!4726 (Array (_ BitVec 32) (_ BitVec 64))) (size!5051 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9951)

(assert (=> b!209391 (= res!102063 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5051 _keys!825))))))

(declare-fun b!209392 () Bool)

(declare-fun res!102065 () Bool)

(assert (=> b!209392 (=> (not res!102065) (not e!136422))))

(declare-datatypes ((List!3025 0))(
  ( (Nil!3022) (Cons!3021 (h!3663 (_ BitVec 64)) (t!7956 List!3025)) )
))
(declare-fun arrayNoDuplicates!0 (array!9951 (_ BitVec 32) List!3025) Bool)

(assert (=> b!209392 (= res!102065 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3022))))

(declare-fun mapNonEmpty!9134 () Bool)

(declare-fun mapRes!9134 () Bool)

(declare-fun tp!19585 () Bool)

(declare-fun e!136423 () Bool)

(assert (=> mapNonEmpty!9134 (= mapRes!9134 (and tp!19585 e!136423))))

(declare-datatypes ((V!6817 0))(
  ( (V!6818 (val!2733 Int)) )
))
(declare-datatypes ((ValueCell!2345 0))(
  ( (ValueCellFull!2345 (v!4703 V!6817)) (EmptyCell!2345) )
))
(declare-fun mapRest!9134 () (Array (_ BitVec 32) ValueCell!2345))

(declare-datatypes ((array!9953 0))(
  ( (array!9954 (arr!4727 (Array (_ BitVec 32) ValueCell!2345)) (size!5052 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9953)

(declare-fun mapValue!9134 () ValueCell!2345)

(declare-fun mapKey!9134 () (_ BitVec 32))

(assert (=> mapNonEmpty!9134 (= (arr!4727 _values!649) (store mapRest!9134 mapKey!9134 mapValue!9134))))

(declare-fun b!209393 () Bool)

(declare-fun e!136420 () Bool)

(declare-fun tp_is_empty!5377 () Bool)

(assert (=> b!209393 (= e!136420 tp_is_empty!5377)))

(declare-fun res!102067 () Bool)

(assert (=> start!20862 (=> (not res!102067) (not e!136422))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20862 (= res!102067 (validMask!0 mask!1149))))

(assert (=> start!20862 e!136422))

(declare-fun e!136421 () Bool)

(declare-fun array_inv!3129 (array!9953) Bool)

(assert (=> start!20862 (and (array_inv!3129 _values!649) e!136421)))

(assert (=> start!20862 true))

(assert (=> start!20862 tp_is_empty!5377))

(declare-fun array_inv!3130 (array!9951) Bool)

(assert (=> start!20862 (array_inv!3130 _keys!825)))

(assert (=> start!20862 tp!19586))

(declare-fun b!209394 () Bool)

(declare-fun res!102066 () Bool)

(assert (=> b!209394 (=> (not res!102066) (not e!136422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9951 (_ BitVec 32)) Bool)

(assert (=> b!209394 (= res!102066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209395 () Bool)

(declare-fun res!102064 () Bool)

(assert (=> b!209395 (=> (not res!102064) (not e!136422))))

(assert (=> b!209395 (= res!102064 (= (select (arr!4726 _keys!825) i!601) k!843))))

(declare-fun b!209396 () Bool)

(assert (=> b!209396 (= e!136422 (not (bvslt i!601 (size!5052 _values!649))))))

(declare-datatypes ((tuple2!4130 0))(
  ( (tuple2!4131 (_1!2076 (_ BitVec 64)) (_2!2076 V!6817)) )
))
(declare-datatypes ((List!3026 0))(
  ( (Nil!3023) (Cons!3022 (h!3664 tuple2!4130) (t!7957 List!3026)) )
))
(declare-datatypes ((ListLongMap!3043 0))(
  ( (ListLongMap!3044 (toList!1537 List!3026)) )
))
(declare-fun lt!106999 () ListLongMap!3043)

(declare-fun lt!106998 () ListLongMap!3043)

(assert (=> b!209396 (and (= lt!106999 lt!106998) (= lt!106998 lt!106999))))

(declare-fun v!520 () V!6817)

(declare-fun lt!107000 () ListLongMap!3043)

(declare-fun +!540 (ListLongMap!3043 tuple2!4130) ListLongMap!3043)

(assert (=> b!209396 (= lt!106998 (+!540 lt!107000 (tuple2!4131 k!843 v!520)))))

(declare-datatypes ((Unit!6368 0))(
  ( (Unit!6369) )
))
(declare-fun lt!107001 () Unit!6368)

(declare-fun zeroValue!615 () V!6817)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6817)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!193 (array!9951 array!9953 (_ BitVec 32) (_ BitVec 32) V!6817 V!6817 (_ BitVec 32) (_ BitVec 64) V!6817 (_ BitVec 32) Int) Unit!6368)

(assert (=> b!209396 (= lt!107001 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!193 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!478 (array!9951 array!9953 (_ BitVec 32) (_ BitVec 32) V!6817 V!6817 (_ BitVec 32) Int) ListLongMap!3043)

(assert (=> b!209396 (= lt!106999 (getCurrentListMapNoExtraKeys!478 _keys!825 (array!9954 (store (arr!4727 _values!649) i!601 (ValueCellFull!2345 v!520)) (size!5052 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209396 (= lt!107000 (getCurrentListMapNoExtraKeys!478 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209397 () Bool)

(assert (=> b!209397 (= e!136421 (and e!136420 mapRes!9134))))

(declare-fun condMapEmpty!9134 () Bool)

(declare-fun mapDefault!9134 () ValueCell!2345)

