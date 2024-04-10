; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20728 () Bool)

(assert start!20728)

(declare-fun b_free!5387 () Bool)

(declare-fun b_next!5387 () Bool)

(assert (=> start!20728 (= b_free!5387 (not b_next!5387))))

(declare-fun tp!19192 () Bool)

(declare-fun b_and!12133 () Bool)

(assert (=> start!20728 (= tp!19192 b_and!12133)))

(declare-fun b!207416 () Bool)

(declare-fun res!100695 () Bool)

(declare-fun e!135416 () Bool)

(assert (=> b!207416 (=> (not res!100695) (not e!135416))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9693 0))(
  ( (array!9694 (arr!4597 (Array (_ BitVec 32) (_ BitVec 64))) (size!4922 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9693)

(assert (=> b!207416 (= res!100695 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4922 _keys!825))))))

(declare-fun b!207417 () Bool)

(declare-fun res!100690 () Bool)

(assert (=> b!207417 (=> (not res!100690) (not e!135416))))

(declare-datatypes ((List!2937 0))(
  ( (Nil!2934) (Cons!2933 (h!3575 (_ BitVec 64)) (t!7868 List!2937)) )
))
(declare-fun arrayNoDuplicates!0 (array!9693 (_ BitVec 32) List!2937) Bool)

(assert (=> b!207417 (= res!100690 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2934))))

(declare-fun mapNonEmpty!8933 () Bool)

(declare-fun mapRes!8933 () Bool)

(declare-fun tp!19193 () Bool)

(declare-fun e!135417 () Bool)

(assert (=> mapNonEmpty!8933 (= mapRes!8933 (and tp!19193 e!135417))))

(declare-fun mapKey!8933 () (_ BitVec 32))

(declare-datatypes ((V!6637 0))(
  ( (V!6638 (val!2666 Int)) )
))
(declare-datatypes ((ValueCell!2278 0))(
  ( (ValueCellFull!2278 (v!4636 V!6637)) (EmptyCell!2278) )
))
(declare-datatypes ((array!9695 0))(
  ( (array!9696 (arr!4598 (Array (_ BitVec 32) ValueCell!2278)) (size!4923 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9695)

(declare-fun mapRest!8933 () (Array (_ BitVec 32) ValueCell!2278))

(declare-fun mapValue!8933 () ValueCell!2278)

(assert (=> mapNonEmpty!8933 (= (arr!4598 _values!649) (store mapRest!8933 mapKey!8933 mapValue!8933))))

(declare-fun b!207418 () Bool)

(declare-fun res!100691 () Bool)

(assert (=> b!207418 (=> (not res!100691) (not e!135416))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!207418 (= res!100691 (= (select (arr!4597 _keys!825) i!601) k!843))))

(declare-fun b!207419 () Bool)

(assert (=> b!207419 (= e!135416 (not true))))

(declare-datatypes ((tuple2!4046 0))(
  ( (tuple2!4047 (_1!2034 (_ BitVec 64)) (_2!2034 V!6637)) )
))
(declare-datatypes ((List!2938 0))(
  ( (Nil!2935) (Cons!2934 (h!3576 tuple2!4046) (t!7869 List!2938)) )
))
(declare-datatypes ((ListLongMap!2959 0))(
  ( (ListLongMap!2960 (toList!1495 List!2938)) )
))
(declare-fun lt!106267 () ListLongMap!2959)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6637)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6637)

(declare-fun getCurrentListMap!1062 (array!9693 array!9695 (_ BitVec 32) (_ BitVec 32) V!6637 V!6637 (_ BitVec 32) Int) ListLongMap!2959)

(assert (=> b!207419 (= lt!106267 (getCurrentListMap!1062 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106265 () ListLongMap!2959)

(declare-fun lt!106263 () array!9695)

(assert (=> b!207419 (= lt!106265 (getCurrentListMap!1062 _keys!825 lt!106263 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106264 () ListLongMap!2959)

(declare-fun lt!106266 () ListLongMap!2959)

(assert (=> b!207419 (and (= lt!106264 lt!106266) (= lt!106266 lt!106264))))

(declare-fun lt!106269 () ListLongMap!2959)

(declare-fun v!520 () V!6637)

(declare-fun +!522 (ListLongMap!2959 tuple2!4046) ListLongMap!2959)

(assert (=> b!207419 (= lt!106266 (+!522 lt!106269 (tuple2!4047 k!843 v!520)))))

(declare-datatypes ((Unit!6332 0))(
  ( (Unit!6333) )
))
(declare-fun lt!106268 () Unit!6332)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!175 (array!9693 array!9695 (_ BitVec 32) (_ BitVec 32) V!6637 V!6637 (_ BitVec 32) (_ BitVec 64) V!6637 (_ BitVec 32) Int) Unit!6332)

(assert (=> b!207419 (= lt!106268 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!175 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!436 (array!9693 array!9695 (_ BitVec 32) (_ BitVec 32) V!6637 V!6637 (_ BitVec 32) Int) ListLongMap!2959)

(assert (=> b!207419 (= lt!106264 (getCurrentListMapNoExtraKeys!436 _keys!825 lt!106263 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207419 (= lt!106263 (array!9696 (store (arr!4598 _values!649) i!601 (ValueCellFull!2278 v!520)) (size!4923 _values!649)))))

(assert (=> b!207419 (= lt!106269 (getCurrentListMapNoExtraKeys!436 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207420 () Bool)

(declare-fun tp_is_empty!5243 () Bool)

(assert (=> b!207420 (= e!135417 tp_is_empty!5243)))

(declare-fun b!207421 () Bool)

(declare-fun res!100694 () Bool)

(assert (=> b!207421 (=> (not res!100694) (not e!135416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9693 (_ BitVec 32)) Bool)

(assert (=> b!207421 (= res!100694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207422 () Bool)

(declare-fun e!135419 () Bool)

(assert (=> b!207422 (= e!135419 tp_is_empty!5243)))

(declare-fun res!100696 () Bool)

(assert (=> start!20728 (=> (not res!100696) (not e!135416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20728 (= res!100696 (validMask!0 mask!1149))))

(assert (=> start!20728 e!135416))

(declare-fun e!135415 () Bool)

(declare-fun array_inv!3043 (array!9695) Bool)

(assert (=> start!20728 (and (array_inv!3043 _values!649) e!135415)))

(assert (=> start!20728 true))

(assert (=> start!20728 tp_is_empty!5243))

(declare-fun array_inv!3044 (array!9693) Bool)

(assert (=> start!20728 (array_inv!3044 _keys!825)))

(assert (=> start!20728 tp!19192))

(declare-fun mapIsEmpty!8933 () Bool)

(assert (=> mapIsEmpty!8933 mapRes!8933))

(declare-fun b!207423 () Bool)

(declare-fun res!100693 () Bool)

(assert (=> b!207423 (=> (not res!100693) (not e!135416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207423 (= res!100693 (validKeyInArray!0 k!843))))

(declare-fun b!207424 () Bool)

(declare-fun res!100692 () Bool)

(assert (=> b!207424 (=> (not res!100692) (not e!135416))))

(assert (=> b!207424 (= res!100692 (and (= (size!4923 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4922 _keys!825) (size!4923 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207425 () Bool)

(assert (=> b!207425 (= e!135415 (and e!135419 mapRes!8933))))

(declare-fun condMapEmpty!8933 () Bool)

(declare-fun mapDefault!8933 () ValueCell!2278)

