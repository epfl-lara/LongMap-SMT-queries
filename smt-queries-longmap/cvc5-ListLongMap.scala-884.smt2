; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20400 () Bool)

(assert start!20400)

(declare-fun b_free!5059 () Bool)

(declare-fun b_next!5059 () Bool)

(assert (=> start!20400 (= b_free!5059 (not b_next!5059))))

(declare-fun tp!18208 () Bool)

(declare-fun b_and!11805 () Bool)

(assert (=> start!20400 (= tp!18208 b_and!11805)))

(declare-fun b!201690 () Bool)

(declare-fun res!96447 () Bool)

(declare-fun e!132170 () Bool)

(assert (=> b!201690 (=> (not res!96447) (not e!132170))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201690 (= res!96447 (validKeyInArray!0 k!843))))

(declare-fun b!201691 () Bool)

(declare-fun e!132168 () Bool)

(declare-fun tp_is_empty!4915 () Bool)

(assert (=> b!201691 (= e!132168 tp_is_empty!4915)))

(declare-fun b!201692 () Bool)

(declare-fun res!96443 () Bool)

(assert (=> b!201692 (=> (not res!96443) (not e!132170))))

(declare-datatypes ((array!9059 0))(
  ( (array!9060 (arr!4280 (Array (_ BitVec 32) (_ BitVec 64))) (size!4605 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9059)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6201 0))(
  ( (V!6202 (val!2502 Int)) )
))
(declare-datatypes ((ValueCell!2114 0))(
  ( (ValueCellFull!2114 (v!4472 V!6201)) (EmptyCell!2114) )
))
(declare-datatypes ((array!9061 0))(
  ( (array!9062 (arr!4281 (Array (_ BitVec 32) ValueCell!2114)) (size!4606 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9061)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201692 (= res!96443 (and (= (size!4606 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4605 _keys!825) (size!4606 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201693 () Bool)

(declare-fun res!96441 () Bool)

(assert (=> b!201693 (=> (not res!96441) (not e!132170))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201693 (= res!96441 (= (select (arr!4280 _keys!825) i!601) k!843))))

(declare-fun b!201694 () Bool)

(declare-fun res!96448 () Bool)

(assert (=> b!201694 (=> (not res!96448) (not e!132170))))

(assert (=> b!201694 (= res!96448 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4605 _keys!825))))))

(declare-fun res!96444 () Bool)

(assert (=> start!20400 (=> (not res!96444) (not e!132170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20400 (= res!96444 (validMask!0 mask!1149))))

(assert (=> start!20400 e!132170))

(declare-fun e!132171 () Bool)

(declare-fun array_inv!2825 (array!9061) Bool)

(assert (=> start!20400 (and (array_inv!2825 _values!649) e!132171)))

(assert (=> start!20400 true))

(assert (=> start!20400 tp_is_empty!4915))

(declare-fun array_inv!2826 (array!9059) Bool)

(assert (=> start!20400 (array_inv!2826 _keys!825)))

(assert (=> start!20400 tp!18208))

(declare-fun b!201695 () Bool)

(declare-fun e!132173 () Bool)

(assert (=> b!201695 (= e!132170 (not e!132173))))

(declare-fun res!96440 () Bool)

(assert (=> b!201695 (=> res!96440 e!132173)))

(assert (=> b!201695 (= res!96440 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6201)

(declare-fun zeroValue!615 () V!6201)

(declare-datatypes ((tuple2!3790 0))(
  ( (tuple2!3791 (_1!1906 (_ BitVec 64)) (_2!1906 V!6201)) )
))
(declare-datatypes ((List!2701 0))(
  ( (Nil!2698) (Cons!2697 (h!3339 tuple2!3790) (t!7632 List!2701)) )
))
(declare-datatypes ((ListLongMap!2703 0))(
  ( (ListLongMap!2704 (toList!1367 List!2701)) )
))
(declare-fun lt!100705 () ListLongMap!2703)

(declare-fun getCurrentListMap!954 (array!9059 array!9061 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) Int) ListLongMap!2703)

(assert (=> b!201695 (= lt!100705 (getCurrentListMap!954 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100704 () ListLongMap!2703)

(declare-fun lt!100712 () array!9061)

(assert (=> b!201695 (= lt!100704 (getCurrentListMap!954 _keys!825 lt!100712 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100706 () ListLongMap!2703)

(declare-fun lt!100707 () ListLongMap!2703)

(assert (=> b!201695 (and (= lt!100706 lt!100707) (= lt!100707 lt!100706))))

(declare-fun lt!100716 () ListLongMap!2703)

(declare-fun lt!100714 () tuple2!3790)

(declare-fun +!394 (ListLongMap!2703 tuple2!3790) ListLongMap!2703)

(assert (=> b!201695 (= lt!100707 (+!394 lt!100716 lt!100714))))

(declare-fun v!520 () V!6201)

(assert (=> b!201695 (= lt!100714 (tuple2!3791 k!843 v!520))))

(declare-datatypes ((Unit!6088 0))(
  ( (Unit!6089) )
))
(declare-fun lt!100708 () Unit!6088)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!67 (array!9059 array!9061 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) (_ BitVec 64) V!6201 (_ BitVec 32) Int) Unit!6088)

(assert (=> b!201695 (= lt!100708 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!67 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!328 (array!9059 array!9061 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) Int) ListLongMap!2703)

(assert (=> b!201695 (= lt!100706 (getCurrentListMapNoExtraKeys!328 _keys!825 lt!100712 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201695 (= lt!100712 (array!9062 (store (arr!4281 _values!649) i!601 (ValueCellFull!2114 v!520)) (size!4606 _values!649)))))

(assert (=> b!201695 (= lt!100716 (getCurrentListMapNoExtraKeys!328 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8441 () Bool)

(declare-fun mapRes!8441 () Bool)

(assert (=> mapIsEmpty!8441 mapRes!8441))

(declare-fun b!201696 () Bool)

(declare-fun res!96442 () Bool)

(assert (=> b!201696 (=> (not res!96442) (not e!132170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9059 (_ BitVec 32)) Bool)

(assert (=> b!201696 (= res!96442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201697 () Bool)

(declare-fun res!96445 () Bool)

(assert (=> b!201697 (=> (not res!96445) (not e!132170))))

(declare-datatypes ((List!2702 0))(
  ( (Nil!2699) (Cons!2698 (h!3340 (_ BitVec 64)) (t!7633 List!2702)) )
))
(declare-fun arrayNoDuplicates!0 (array!9059 (_ BitVec 32) List!2702) Bool)

(assert (=> b!201697 (= res!96445 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2699))))

(declare-fun b!201698 () Bool)

(declare-fun e!132172 () Bool)

(assert (=> b!201698 (= e!132172 true)))

(declare-fun lt!100713 () ListLongMap!2703)

(declare-fun lt!100718 () tuple2!3790)

(declare-fun lt!100709 () ListLongMap!2703)

(assert (=> b!201698 (= (+!394 lt!100713 lt!100718) (+!394 lt!100709 lt!100714))))

(declare-fun lt!100711 () ListLongMap!2703)

(declare-fun lt!100719 () Unit!6088)

(declare-fun addCommutativeForDiffKeys!115 (ListLongMap!2703 (_ BitVec 64) V!6201 (_ BitVec 64) V!6201) Unit!6088)

(assert (=> b!201698 (= lt!100719 (addCommutativeForDiffKeys!115 lt!100711 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201699 () Bool)

(assert (=> b!201699 (= e!132173 e!132172)))

(declare-fun res!96446 () Bool)

(assert (=> b!201699 (=> res!96446 e!132172)))

(assert (=> b!201699 (= res!96446 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100717 () ListLongMap!2703)

(assert (=> b!201699 (= lt!100717 lt!100713)))

(assert (=> b!201699 (= lt!100713 (+!394 lt!100711 lt!100714))))

(declare-fun lt!100715 () Unit!6088)

(assert (=> b!201699 (= lt!100715 (addCommutativeForDiffKeys!115 lt!100716 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201699 (= lt!100704 (+!394 lt!100717 lt!100718))))

(declare-fun lt!100710 () tuple2!3790)

(assert (=> b!201699 (= lt!100717 (+!394 lt!100707 lt!100710))))

(assert (=> b!201699 (= lt!100705 lt!100709)))

(assert (=> b!201699 (= lt!100709 (+!394 lt!100711 lt!100718))))

(assert (=> b!201699 (= lt!100711 (+!394 lt!100716 lt!100710))))

(assert (=> b!201699 (= lt!100704 (+!394 (+!394 lt!100706 lt!100710) lt!100718))))

(assert (=> b!201699 (= lt!100718 (tuple2!3791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201699 (= lt!100710 (tuple2!3791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8441 () Bool)

(declare-fun tp!18209 () Bool)

(declare-fun e!132167 () Bool)

(assert (=> mapNonEmpty!8441 (= mapRes!8441 (and tp!18209 e!132167))))

(declare-fun mapRest!8441 () (Array (_ BitVec 32) ValueCell!2114))

(declare-fun mapKey!8441 () (_ BitVec 32))

(declare-fun mapValue!8441 () ValueCell!2114)

(assert (=> mapNonEmpty!8441 (= (arr!4281 _values!649) (store mapRest!8441 mapKey!8441 mapValue!8441))))

(declare-fun b!201700 () Bool)

(assert (=> b!201700 (= e!132167 tp_is_empty!4915)))

(declare-fun b!201701 () Bool)

(assert (=> b!201701 (= e!132171 (and e!132168 mapRes!8441))))

(declare-fun condMapEmpty!8441 () Bool)

(declare-fun mapDefault!8441 () ValueCell!2114)

