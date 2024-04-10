; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20872 () Bool)

(assert start!20872)

(declare-fun b_free!5525 () Bool)

(declare-fun b_next!5525 () Bool)

(assert (=> start!20872 (= b_free!5525 (not b_next!5525))))

(declare-fun tp!19616 () Bool)

(declare-fun b_and!12271 () Bool)

(assert (=> start!20872 (= tp!19616 b_and!12271)))

(declare-fun b!209548 () Bool)

(declare-fun res!102180 () Bool)

(declare-fun e!136508 () Bool)

(assert (=> b!209548 (=> (not res!102180) (not e!136508))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209548 (= res!102180 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!9149 () Bool)

(declare-fun mapRes!9149 () Bool)

(declare-fun tp!19615 () Bool)

(declare-fun e!136504 () Bool)

(assert (=> mapNonEmpty!9149 (= mapRes!9149 (and tp!19615 e!136504))))

(declare-datatypes ((V!6829 0))(
  ( (V!6830 (val!2738 Int)) )
))
(declare-datatypes ((ValueCell!2350 0))(
  ( (ValueCellFull!2350 (v!4708 V!6829)) (EmptyCell!2350) )
))
(declare-datatypes ((array!9971 0))(
  ( (array!9972 (arr!4736 (Array (_ BitVec 32) ValueCell!2350)) (size!5061 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9971)

(declare-fun mapValue!9149 () ValueCell!2350)

(declare-fun mapKey!9149 () (_ BitVec 32))

(declare-fun mapRest!9149 () (Array (_ BitVec 32) ValueCell!2350))

(assert (=> mapNonEmpty!9149 (= (arr!4736 _values!649) (store mapRest!9149 mapKey!9149 mapValue!9149))))

(declare-fun b!209549 () Bool)

(declare-fun res!102178 () Bool)

(assert (=> b!209549 (=> (not res!102178) (not e!136508))))

(declare-datatypes ((array!9973 0))(
  ( (array!9974 (arr!4737 (Array (_ BitVec 32) (_ BitVec 64))) (size!5062 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9973)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209549 (= res!102178 (= (select (arr!4737 _keys!825) i!601) k!843))))

(declare-fun b!209550 () Bool)

(declare-fun tp_is_empty!5387 () Bool)

(assert (=> b!209550 (= e!136504 tp_is_empty!5387)))

(declare-fun b!209551 () Bool)

(declare-fun e!136506 () Bool)

(assert (=> b!209551 (= e!136506 tp_is_empty!5387)))

(declare-fun b!209552 () Bool)

(declare-fun res!102181 () Bool)

(assert (=> b!209552 (=> (not res!102181) (not e!136508))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!209552 (= res!102181 (and (= (size!5061 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5062 _keys!825) (size!5061 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!4138 0))(
  ( (tuple2!4139 (_1!2080 (_ BitVec 64)) (_2!2080 V!6829)) )
))
(declare-datatypes ((List!3034 0))(
  ( (Nil!3031) (Cons!3030 (h!3672 tuple2!4138) (t!7965 List!3034)) )
))
(declare-datatypes ((ListLongMap!3051 0))(
  ( (ListLongMap!3052 (toList!1541 List!3034)) )
))
(declare-fun lt!107085 () ListLongMap!3051)

(declare-fun minValue!615 () V!6829)

(declare-fun b!209553 () Bool)

(declare-fun e!136507 () Bool)

(declare-fun zeroValue!615 () V!6829)

(declare-fun lt!107083 () ListLongMap!3051)

(declare-fun +!544 (ListLongMap!3051 tuple2!4138) ListLongMap!3051)

(assert (=> b!209553 (= e!136507 (= lt!107085 (+!544 (+!544 lt!107083 (tuple2!4139 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!209555 () Bool)

(declare-fun res!102179 () Bool)

(assert (=> b!209555 (=> (not res!102179) (not e!136508))))

(declare-datatypes ((List!3035 0))(
  ( (Nil!3032) (Cons!3031 (h!3673 (_ BitVec 64)) (t!7966 List!3035)) )
))
(declare-fun arrayNoDuplicates!0 (array!9973 (_ BitVec 32) List!3035) Bool)

(assert (=> b!209555 (= res!102179 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3032))))

(declare-fun b!209556 () Bool)

(assert (=> b!209556 (= e!136508 (not e!136507))))

(declare-fun res!102177 () Bool)

(assert (=> b!209556 (=> res!102177 e!136507)))

(assert (=> b!209556 (= res!102177 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!107087 () ListLongMap!3051)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1079 (array!9973 array!9971 (_ BitVec 32) (_ BitVec 32) V!6829 V!6829 (_ BitVec 32) Int) ListLongMap!3051)

(assert (=> b!209556 (= lt!107087 (getCurrentListMap!1079 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107084 () array!9971)

(assert (=> b!209556 (= lt!107085 (getCurrentListMap!1079 _keys!825 lt!107084 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107082 () ListLongMap!3051)

(assert (=> b!209556 (and (= lt!107083 lt!107082) (= lt!107082 lt!107083))))

(declare-fun lt!107086 () ListLongMap!3051)

(declare-fun v!520 () V!6829)

(assert (=> b!209556 (= lt!107082 (+!544 lt!107086 (tuple2!4139 k!843 v!520)))))

(declare-datatypes ((Unit!6374 0))(
  ( (Unit!6375) )
))
(declare-fun lt!107088 () Unit!6374)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!196 (array!9973 array!9971 (_ BitVec 32) (_ BitVec 32) V!6829 V!6829 (_ BitVec 32) (_ BitVec 64) V!6829 (_ BitVec 32) Int) Unit!6374)

(assert (=> b!209556 (= lt!107088 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!196 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!481 (array!9973 array!9971 (_ BitVec 32) (_ BitVec 32) V!6829 V!6829 (_ BitVec 32) Int) ListLongMap!3051)

(assert (=> b!209556 (= lt!107083 (getCurrentListMapNoExtraKeys!481 _keys!825 lt!107084 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209556 (= lt!107084 (array!9972 (store (arr!4736 _values!649) i!601 (ValueCellFull!2350 v!520)) (size!5061 _values!649)))))

(assert (=> b!209556 (= lt!107086 (getCurrentListMapNoExtraKeys!481 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209557 () Bool)

(declare-fun res!102174 () Bool)

(assert (=> b!209557 (=> (not res!102174) (not e!136508))))

(assert (=> b!209557 (= res!102174 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5062 _keys!825))))))

(declare-fun b!209558 () Bool)

(declare-fun e!136503 () Bool)

(assert (=> b!209558 (= e!136503 (and e!136506 mapRes!9149))))

(declare-fun condMapEmpty!9149 () Bool)

(declare-fun mapDefault!9149 () ValueCell!2350)

