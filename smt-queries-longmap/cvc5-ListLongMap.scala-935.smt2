; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20706 () Bool)

(assert start!20706)

(declare-fun b_free!5365 () Bool)

(declare-fun b_next!5365 () Bool)

(assert (=> start!20706 (= b_free!5365 (not b_next!5365))))

(declare-fun tp!19127 () Bool)

(declare-fun b_and!12111 () Bool)

(assert (=> start!20706 (= tp!19127 b_and!12111)))

(declare-fun b!207086 () Bool)

(declare-fun res!100459 () Bool)

(declare-fun e!135254 () Bool)

(assert (=> b!207086 (=> (not res!100459) (not e!135254))))

(declare-datatypes ((array!9651 0))(
  ( (array!9652 (arr!4576 (Array (_ BitVec 32) (_ BitVec 64))) (size!4901 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9651)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207086 (= res!100459 (= (select (arr!4576 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8900 () Bool)

(declare-fun mapRes!8900 () Bool)

(declare-fun tp!19126 () Bool)

(declare-fun e!135250 () Bool)

(assert (=> mapNonEmpty!8900 (= mapRes!8900 (and tp!19126 e!135250))))

(declare-datatypes ((V!6609 0))(
  ( (V!6610 (val!2655 Int)) )
))
(declare-datatypes ((ValueCell!2267 0))(
  ( (ValueCellFull!2267 (v!4625 V!6609)) (EmptyCell!2267) )
))
(declare-fun mapRest!8900 () (Array (_ BitVec 32) ValueCell!2267))

(declare-fun mapKey!8900 () (_ BitVec 32))

(declare-datatypes ((array!9653 0))(
  ( (array!9654 (arr!4577 (Array (_ BitVec 32) ValueCell!2267)) (size!4902 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9653)

(declare-fun mapValue!8900 () ValueCell!2267)

(assert (=> mapNonEmpty!8900 (= (arr!4577 _values!649) (store mapRest!8900 mapKey!8900 mapValue!8900))))

(declare-fun b!207087 () Bool)

(assert (=> b!207087 (= e!135254 (not true))))

(declare-datatypes ((tuple2!4030 0))(
  ( (tuple2!4031 (_1!2026 (_ BitVec 64)) (_2!2026 V!6609)) )
))
(declare-datatypes ((List!2921 0))(
  ( (Nil!2918) (Cons!2917 (h!3559 tuple2!4030) (t!7852 List!2921)) )
))
(declare-datatypes ((ListLongMap!2943 0))(
  ( (ListLongMap!2944 (toList!1487 List!2921)) )
))
(declare-fun lt!106029 () ListLongMap!2943)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6609)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6609)

(declare-fun getCurrentListMap!1054 (array!9651 array!9653 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) Int) ListLongMap!2943)

(assert (=> b!207087 (= lt!106029 (getCurrentListMap!1054 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106027 () ListLongMap!2943)

(declare-fun lt!106025 () array!9653)

(assert (=> b!207087 (= lt!106027 (getCurrentListMap!1054 _keys!825 lt!106025 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106024 () ListLongMap!2943)

(declare-fun lt!106026 () ListLongMap!2943)

(assert (=> b!207087 (and (= lt!106024 lt!106026) (= lt!106026 lt!106024))))

(declare-fun lt!106028 () ListLongMap!2943)

(declare-fun v!520 () V!6609)

(declare-fun +!514 (ListLongMap!2943 tuple2!4030) ListLongMap!2943)

(assert (=> b!207087 (= lt!106026 (+!514 lt!106028 (tuple2!4031 k!843 v!520)))))

(declare-datatypes ((Unit!6316 0))(
  ( (Unit!6317) )
))
(declare-fun lt!106023 () Unit!6316)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!167 (array!9651 array!9653 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) (_ BitVec 64) V!6609 (_ BitVec 32) Int) Unit!6316)

(assert (=> b!207087 (= lt!106023 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!167 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!428 (array!9651 array!9653 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) Int) ListLongMap!2943)

(assert (=> b!207087 (= lt!106024 (getCurrentListMapNoExtraKeys!428 _keys!825 lt!106025 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207087 (= lt!106025 (array!9654 (store (arr!4577 _values!649) i!601 (ValueCellFull!2267 v!520)) (size!4902 _values!649)))))

(assert (=> b!207087 (= lt!106028 (getCurrentListMapNoExtraKeys!428 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207088 () Bool)

(declare-fun e!135253 () Bool)

(declare-fun tp_is_empty!5221 () Bool)

(assert (=> b!207088 (= e!135253 tp_is_empty!5221)))

(declare-fun b!207089 () Bool)

(declare-fun res!100464 () Bool)

(assert (=> b!207089 (=> (not res!100464) (not e!135254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9651 (_ BitVec 32)) Bool)

(assert (=> b!207089 (= res!100464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207090 () Bool)

(declare-fun res!100462 () Bool)

(assert (=> b!207090 (=> (not res!100462) (not e!135254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207090 (= res!100462 (validKeyInArray!0 k!843))))

(declare-fun res!100460 () Bool)

(assert (=> start!20706 (=> (not res!100460) (not e!135254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20706 (= res!100460 (validMask!0 mask!1149))))

(assert (=> start!20706 e!135254))

(declare-fun e!135252 () Bool)

(declare-fun array_inv!3029 (array!9653) Bool)

(assert (=> start!20706 (and (array_inv!3029 _values!649) e!135252)))

(assert (=> start!20706 true))

(assert (=> start!20706 tp_is_empty!5221))

(declare-fun array_inv!3030 (array!9651) Bool)

(assert (=> start!20706 (array_inv!3030 _keys!825)))

(assert (=> start!20706 tp!19127))

(declare-fun mapIsEmpty!8900 () Bool)

(assert (=> mapIsEmpty!8900 mapRes!8900))

(declare-fun b!207091 () Bool)

(declare-fun res!100465 () Bool)

(assert (=> b!207091 (=> (not res!100465) (not e!135254))))

(assert (=> b!207091 (= res!100465 (and (= (size!4902 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4901 _keys!825) (size!4902 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207092 () Bool)

(assert (=> b!207092 (= e!135250 tp_is_empty!5221)))

(declare-fun b!207093 () Bool)

(declare-fun res!100461 () Bool)

(assert (=> b!207093 (=> (not res!100461) (not e!135254))))

(declare-datatypes ((List!2922 0))(
  ( (Nil!2919) (Cons!2918 (h!3560 (_ BitVec 64)) (t!7853 List!2922)) )
))
(declare-fun arrayNoDuplicates!0 (array!9651 (_ BitVec 32) List!2922) Bool)

(assert (=> b!207093 (= res!100461 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2919))))

(declare-fun b!207094 () Bool)

(assert (=> b!207094 (= e!135252 (and e!135253 mapRes!8900))))

(declare-fun condMapEmpty!8900 () Bool)

(declare-fun mapDefault!8900 () ValueCell!2267)

