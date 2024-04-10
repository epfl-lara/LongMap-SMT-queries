; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20930 () Bool)

(assert start!20930)

(declare-fun b_free!5543 () Bool)

(declare-fun b_next!5543 () Bool)

(assert (=> start!20930 (= b_free!5543 (not b_next!5543))))

(declare-fun tp!19675 () Bool)

(declare-fun b_and!12313 () Bool)

(assert (=> start!20930 (= tp!19675 b_and!12313)))

(declare-fun b!210250 () Bool)

(declare-fun res!102580 () Bool)

(declare-fun e!136921 () Bool)

(assert (=> b!210250 (=> (not res!102580) (not e!136921))))

(declare-datatypes ((V!6853 0))(
  ( (V!6854 (val!2747 Int)) )
))
(declare-datatypes ((tuple2!4154 0))(
  ( (tuple2!4155 (_1!2088 (_ BitVec 64)) (_2!2088 V!6853)) )
))
(declare-fun lt!107634 () tuple2!4154)

(declare-fun lt!107635 () tuple2!4154)

(declare-datatypes ((List!3047 0))(
  ( (Nil!3044) (Cons!3043 (h!3685 tuple2!4154) (t!7982 List!3047)) )
))
(declare-datatypes ((ListLongMap!3067 0))(
  ( (ListLongMap!3068 (toList!1549 List!3047)) )
))
(declare-fun lt!107633 () ListLongMap!3067)

(declare-fun lt!107628 () ListLongMap!3067)

(declare-fun +!552 (ListLongMap!3067 tuple2!4154) ListLongMap!3067)

(assert (=> b!210250 (= res!102580 (= lt!107633 (+!552 (+!552 lt!107628 lt!107635) lt!107634)))))

(declare-fun b!210251 () Bool)

(declare-fun res!102581 () Bool)

(declare-fun e!136925 () Bool)

(assert (=> b!210251 (=> (not res!102581) (not e!136925))))

(declare-datatypes ((array!10009 0))(
  ( (array!10010 (arr!4753 (Array (_ BitVec 32) (_ BitVec 64))) (size!5078 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10009)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10009 (_ BitVec 32)) Bool)

(assert (=> b!210251 (= res!102581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210252 () Bool)

(declare-fun res!102588 () Bool)

(assert (=> b!210252 (=> (not res!102588) (not e!136925))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2359 0))(
  ( (ValueCellFull!2359 (v!4725 V!6853)) (EmptyCell!2359) )
))
(declare-datatypes ((array!10011 0))(
  ( (array!10012 (arr!4754 (Array (_ BitVec 32) ValueCell!2359)) (size!5079 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10011)

(assert (=> b!210252 (= res!102588 (and (= (size!5079 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5078 _keys!825) (size!5079 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210253 () Bool)

(declare-fun res!102586 () Bool)

(assert (=> b!210253 (=> (not res!102586) (not e!136925))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210253 (= res!102586 (= (select (arr!4753 _keys!825) i!601) k!843))))

(declare-fun b!210254 () Bool)

(declare-fun e!136924 () Bool)

(assert (=> b!210254 (= e!136925 (not e!136924))))

(declare-fun res!102585 () Bool)

(assert (=> b!210254 (=> res!102585 e!136924)))

(assert (=> b!210254 (= res!102585 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6853)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6853)

(declare-fun getCurrentListMap!1085 (array!10009 array!10011 (_ BitVec 32) (_ BitVec 32) V!6853 V!6853 (_ BitVec 32) Int) ListLongMap!3067)

(assert (=> b!210254 (= lt!107633 (getCurrentListMap!1085 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107630 () ListLongMap!3067)

(declare-fun lt!107627 () array!10011)

(assert (=> b!210254 (= lt!107630 (getCurrentListMap!1085 _keys!825 lt!107627 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107631 () ListLongMap!3067)

(declare-fun lt!107632 () ListLongMap!3067)

(assert (=> b!210254 (and (= lt!107631 lt!107632) (= lt!107632 lt!107631))))

(declare-fun v!520 () V!6853)

(assert (=> b!210254 (= lt!107632 (+!552 lt!107628 (tuple2!4155 k!843 v!520)))))

(declare-datatypes ((Unit!6390 0))(
  ( (Unit!6391) )
))
(declare-fun lt!107629 () Unit!6390)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!202 (array!10009 array!10011 (_ BitVec 32) (_ BitVec 32) V!6853 V!6853 (_ BitVec 32) (_ BitVec 64) V!6853 (_ BitVec 32) Int) Unit!6390)

(assert (=> b!210254 (= lt!107629 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!202 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!487 (array!10009 array!10011 (_ BitVec 32) (_ BitVec 32) V!6853 V!6853 (_ BitVec 32) Int) ListLongMap!3067)

(assert (=> b!210254 (= lt!107631 (getCurrentListMapNoExtraKeys!487 _keys!825 lt!107627 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210254 (= lt!107627 (array!10012 (store (arr!4754 _values!649) i!601 (ValueCellFull!2359 v!520)) (size!5079 _values!649)))))

(assert (=> b!210254 (= lt!107628 (getCurrentListMapNoExtraKeys!487 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210255 () Bool)

(declare-fun e!136922 () Bool)

(declare-fun e!136926 () Bool)

(declare-fun mapRes!9182 () Bool)

(assert (=> b!210255 (= e!136922 (and e!136926 mapRes!9182))))

(declare-fun condMapEmpty!9182 () Bool)

(declare-fun mapDefault!9182 () ValueCell!2359)

