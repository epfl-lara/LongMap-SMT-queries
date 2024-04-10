; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20686 () Bool)

(assert start!20686)

(declare-fun b_free!5345 () Bool)

(declare-fun b_next!5345 () Bool)

(assert (=> start!20686 (= b_free!5345 (not b_next!5345))))

(declare-fun tp!19066 () Bool)

(declare-fun b_and!12091 () Bool)

(assert (=> start!20686 (= tp!19066 b_and!12091)))

(declare-fun mapNonEmpty!8870 () Bool)

(declare-fun mapRes!8870 () Bool)

(declare-fun tp!19067 () Bool)

(declare-fun e!135101 () Bool)

(assert (=> mapNonEmpty!8870 (= mapRes!8870 (and tp!19067 e!135101))))

(declare-datatypes ((V!6581 0))(
  ( (V!6582 (val!2645 Int)) )
))
(declare-datatypes ((ValueCell!2257 0))(
  ( (ValueCellFull!2257 (v!4615 V!6581)) (EmptyCell!2257) )
))
(declare-datatypes ((array!9611 0))(
  ( (array!9612 (arr!4556 (Array (_ BitVec 32) ValueCell!2257)) (size!4881 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9611)

(declare-fun mapRest!8870 () (Array (_ BitVec 32) ValueCell!2257))

(declare-fun mapValue!8870 () ValueCell!2257)

(declare-fun mapKey!8870 () (_ BitVec 32))

(assert (=> mapNonEmpty!8870 (= (arr!4556 _values!649) (store mapRest!8870 mapKey!8870 mapValue!8870))))

(declare-fun b!206786 () Bool)

(declare-fun tp_is_empty!5201 () Bool)

(assert (=> b!206786 (= e!135101 tp_is_empty!5201)))

(declare-fun res!100250 () Bool)

(declare-fun e!135100 () Bool)

(assert (=> start!20686 (=> (not res!100250) (not e!135100))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20686 (= res!100250 (validMask!0 mask!1149))))

(assert (=> start!20686 e!135100))

(declare-fun e!135102 () Bool)

(declare-fun array_inv!3013 (array!9611) Bool)

(assert (=> start!20686 (and (array_inv!3013 _values!649) e!135102)))

(assert (=> start!20686 true))

(assert (=> start!20686 tp_is_empty!5201))

(declare-datatypes ((array!9613 0))(
  ( (array!9614 (arr!4557 (Array (_ BitVec 32) (_ BitVec 64))) (size!4882 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9613)

(declare-fun array_inv!3014 (array!9613) Bool)

(assert (=> start!20686 (array_inv!3014 _keys!825)))

(assert (=> start!20686 tp!19066))

(declare-fun b!206787 () Bool)

(declare-fun res!100251 () Bool)

(assert (=> b!206787 (=> (not res!100251) (not e!135100))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!206787 (= res!100251 (= (select (arr!4557 _keys!825) i!601) k!843))))

(declare-fun b!206788 () Bool)

(assert (=> b!206788 (= e!135100 (not true))))

(declare-fun zeroValue!615 () V!6581)

(declare-datatypes ((tuple2!4016 0))(
  ( (tuple2!4017 (_1!2019 (_ BitVec 64)) (_2!2019 V!6581)) )
))
(declare-datatypes ((List!2907 0))(
  ( (Nil!2904) (Cons!2903 (h!3545 tuple2!4016) (t!7838 List!2907)) )
))
(declare-datatypes ((ListLongMap!2929 0))(
  ( (ListLongMap!2930 (toList!1480 List!2907)) )
))
(declare-fun lt!105817 () ListLongMap!2929)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6581)

(declare-fun getCurrentListMap!1047 (array!9613 array!9611 (_ BitVec 32) (_ BitVec 32) V!6581 V!6581 (_ BitVec 32) Int) ListLongMap!2929)

(assert (=> b!206788 (= lt!105817 (getCurrentListMap!1047 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105818 () ListLongMap!2929)

(declare-fun lt!105819 () array!9611)

(assert (=> b!206788 (= lt!105818 (getCurrentListMap!1047 _keys!825 lt!105819 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105813 () ListLongMap!2929)

(declare-fun lt!105815 () ListLongMap!2929)

(assert (=> b!206788 (and (= lt!105813 lt!105815) (= lt!105815 lt!105813))))

(declare-fun lt!105816 () ListLongMap!2929)

(declare-fun v!520 () V!6581)

(declare-fun +!507 (ListLongMap!2929 tuple2!4016) ListLongMap!2929)

(assert (=> b!206788 (= lt!105815 (+!507 lt!105816 (tuple2!4017 k!843 v!520)))))

(declare-datatypes ((Unit!6302 0))(
  ( (Unit!6303) )
))
(declare-fun lt!105814 () Unit!6302)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!160 (array!9613 array!9611 (_ BitVec 32) (_ BitVec 32) V!6581 V!6581 (_ BitVec 32) (_ BitVec 64) V!6581 (_ BitVec 32) Int) Unit!6302)

(assert (=> b!206788 (= lt!105814 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!160 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!421 (array!9613 array!9611 (_ BitVec 32) (_ BitVec 32) V!6581 V!6581 (_ BitVec 32) Int) ListLongMap!2929)

(assert (=> b!206788 (= lt!105813 (getCurrentListMapNoExtraKeys!421 _keys!825 lt!105819 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206788 (= lt!105819 (array!9612 (store (arr!4556 _values!649) i!601 (ValueCellFull!2257 v!520)) (size!4881 _values!649)))))

(assert (=> b!206788 (= lt!105816 (getCurrentListMapNoExtraKeys!421 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206789 () Bool)

(declare-fun e!135104 () Bool)

(assert (=> b!206789 (= e!135102 (and e!135104 mapRes!8870))))

(declare-fun condMapEmpty!8870 () Bool)

(declare-fun mapDefault!8870 () ValueCell!2257)

