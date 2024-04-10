; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20392 () Bool)

(assert start!20392)

(declare-fun b_free!5051 () Bool)

(declare-fun b_next!5051 () Bool)

(assert (=> start!20392 (= b_free!5051 (not b_next!5051))))

(declare-fun tp!18184 () Bool)

(declare-fun b_and!11797 () Bool)

(assert (=> start!20392 (= tp!18184 b_and!11797)))

(declare-fun b!201546 () Bool)

(declare-fun e!132084 () Bool)

(declare-fun e!132087 () Bool)

(assert (=> b!201546 (= e!132084 e!132087)))

(declare-fun res!96340 () Bool)

(assert (=> b!201546 (=> res!96340 e!132087)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!201546 (= res!96340 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6189 0))(
  ( (V!6190 (val!2498 Int)) )
))
(declare-datatypes ((tuple2!3782 0))(
  ( (tuple2!3783 (_1!1902 (_ BitVec 64)) (_2!1902 V!6189)) )
))
(declare-datatypes ((List!2694 0))(
  ( (Nil!2691) (Cons!2690 (h!3332 tuple2!3782) (t!7625 List!2694)) )
))
(declare-datatypes ((ListLongMap!2695 0))(
  ( (ListLongMap!2696 (toList!1363 List!2694)) )
))
(declare-fun lt!100524 () ListLongMap!2695)

(declare-fun lt!100525 () ListLongMap!2695)

(assert (=> b!201546 (= lt!100524 lt!100525)))

(declare-fun lt!100520 () ListLongMap!2695)

(declare-fun lt!100518 () tuple2!3782)

(declare-fun +!390 (ListLongMap!2695 tuple2!3782) ListLongMap!2695)

(assert (=> b!201546 (= lt!100525 (+!390 lt!100520 lt!100518))))

(declare-datatypes ((Unit!6080 0))(
  ( (Unit!6081) )
))
(declare-fun lt!100515 () Unit!6080)

(declare-fun v!520 () V!6189)

(declare-fun zeroValue!615 () V!6189)

(declare-fun lt!100523 () ListLongMap!2695)

(declare-fun addCommutativeForDiffKeys!111 (ListLongMap!2695 (_ BitVec 64) V!6189 (_ BitVec 64) V!6189) Unit!6080)

(assert (=> b!201546 (= lt!100515 (addCommutativeForDiffKeys!111 lt!100523 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100517 () ListLongMap!2695)

(declare-fun lt!100521 () tuple2!3782)

(assert (=> b!201546 (= lt!100517 (+!390 lt!100524 lt!100521))))

(declare-fun lt!100513 () ListLongMap!2695)

(declare-fun lt!100527 () tuple2!3782)

(assert (=> b!201546 (= lt!100524 (+!390 lt!100513 lt!100527))))

(declare-fun lt!100514 () ListLongMap!2695)

(declare-fun lt!100519 () ListLongMap!2695)

(assert (=> b!201546 (= lt!100514 lt!100519)))

(assert (=> b!201546 (= lt!100519 (+!390 lt!100520 lt!100521))))

(assert (=> b!201546 (= lt!100520 (+!390 lt!100523 lt!100527))))

(declare-fun lt!100522 () ListLongMap!2695)

(assert (=> b!201546 (= lt!100517 (+!390 (+!390 lt!100522 lt!100527) lt!100521))))

(declare-fun minValue!615 () V!6189)

(assert (=> b!201546 (= lt!100521 (tuple2!3783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201546 (= lt!100527 (tuple2!3783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201547 () Bool)

(declare-fun res!96335 () Bool)

(declare-fun e!132083 () Bool)

(assert (=> b!201547 (=> (not res!96335) (not e!132083))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9043 0))(
  ( (array!9044 (arr!4272 (Array (_ BitVec 32) (_ BitVec 64))) (size!4597 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9043)

(assert (=> b!201547 (= res!96335 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4597 _keys!825))))))

(declare-fun b!201548 () Bool)

(declare-fun res!96334 () Bool)

(assert (=> b!201548 (=> (not res!96334) (not e!132083))))

(declare-datatypes ((List!2695 0))(
  ( (Nil!2692) (Cons!2691 (h!3333 (_ BitVec 64)) (t!7626 List!2695)) )
))
(declare-fun arrayNoDuplicates!0 (array!9043 (_ BitVec 32) List!2695) Bool)

(assert (=> b!201548 (= res!96334 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2692))))

(declare-fun b!201549 () Bool)

(declare-fun res!96333 () Bool)

(assert (=> b!201549 (=> (not res!96333) (not e!132083))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2110 0))(
  ( (ValueCellFull!2110 (v!4468 V!6189)) (EmptyCell!2110) )
))
(declare-datatypes ((array!9045 0))(
  ( (array!9046 (arr!4273 (Array (_ BitVec 32) ValueCell!2110)) (size!4598 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9045)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201549 (= res!96333 (and (= (size!4598 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4597 _keys!825) (size!4598 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8429 () Bool)

(declare-fun mapRes!8429 () Bool)

(assert (=> mapIsEmpty!8429 mapRes!8429))

(declare-fun b!201550 () Bool)

(assert (=> b!201550 (= e!132087 true)))

(assert (=> b!201550 (= (+!390 lt!100525 lt!100521) (+!390 lt!100519 lt!100518))))

(declare-fun lt!100512 () Unit!6080)

(assert (=> b!201550 (= lt!100512 (addCommutativeForDiffKeys!111 lt!100520 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201551 () Bool)

(assert (=> b!201551 (= e!132083 (not e!132084))))

(declare-fun res!96338 () Bool)

(assert (=> b!201551 (=> res!96338 e!132084)))

(assert (=> b!201551 (= res!96338 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!951 (array!9043 array!9045 (_ BitVec 32) (_ BitVec 32) V!6189 V!6189 (_ BitVec 32) Int) ListLongMap!2695)

(assert (=> b!201551 (= lt!100514 (getCurrentListMap!951 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100526 () array!9045)

(assert (=> b!201551 (= lt!100517 (getCurrentListMap!951 _keys!825 lt!100526 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201551 (and (= lt!100522 lt!100513) (= lt!100513 lt!100522))))

(assert (=> b!201551 (= lt!100513 (+!390 lt!100523 lt!100518))))

(assert (=> b!201551 (= lt!100518 (tuple2!3783 k!843 v!520))))

(declare-fun lt!100516 () Unit!6080)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!64 (array!9043 array!9045 (_ BitVec 32) (_ BitVec 32) V!6189 V!6189 (_ BitVec 32) (_ BitVec 64) V!6189 (_ BitVec 32) Int) Unit!6080)

(assert (=> b!201551 (= lt!100516 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!64 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!325 (array!9043 array!9045 (_ BitVec 32) (_ BitVec 32) V!6189 V!6189 (_ BitVec 32) Int) ListLongMap!2695)

(assert (=> b!201551 (= lt!100522 (getCurrentListMapNoExtraKeys!325 _keys!825 lt!100526 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201551 (= lt!100526 (array!9046 (store (arr!4273 _values!649) i!601 (ValueCellFull!2110 v!520)) (size!4598 _values!649)))))

(assert (=> b!201551 (= lt!100523 (getCurrentListMapNoExtraKeys!325 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201553 () Bool)

(declare-fun e!132085 () Bool)

(declare-fun tp_is_empty!4907 () Bool)

(assert (=> b!201553 (= e!132085 tp_is_empty!4907)))

(declare-fun b!201554 () Bool)

(declare-fun res!96332 () Bool)

(assert (=> b!201554 (=> (not res!96332) (not e!132083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201554 (= res!96332 (validKeyInArray!0 k!843))))

(declare-fun b!201555 () Bool)

(declare-fun res!96339 () Bool)

(assert (=> b!201555 (=> (not res!96339) (not e!132083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9043 (_ BitVec 32)) Bool)

(assert (=> b!201555 (= res!96339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8429 () Bool)

(declare-fun tp!18185 () Bool)

(declare-fun e!132086 () Bool)

(assert (=> mapNonEmpty!8429 (= mapRes!8429 (and tp!18185 e!132086))))

(declare-fun mapKey!8429 () (_ BitVec 32))

(declare-fun mapRest!8429 () (Array (_ BitVec 32) ValueCell!2110))

(declare-fun mapValue!8429 () ValueCell!2110)

(assert (=> mapNonEmpty!8429 (= (arr!4273 _values!649) (store mapRest!8429 mapKey!8429 mapValue!8429))))

(declare-fun res!96336 () Bool)

(assert (=> start!20392 (=> (not res!96336) (not e!132083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20392 (= res!96336 (validMask!0 mask!1149))))

(assert (=> start!20392 e!132083))

(declare-fun e!132088 () Bool)

(declare-fun array_inv!2819 (array!9045) Bool)

(assert (=> start!20392 (and (array_inv!2819 _values!649) e!132088)))

(assert (=> start!20392 true))

(assert (=> start!20392 tp_is_empty!4907))

(declare-fun array_inv!2820 (array!9043) Bool)

(assert (=> start!20392 (array_inv!2820 _keys!825)))

(assert (=> start!20392 tp!18184))

(declare-fun b!201552 () Bool)

(assert (=> b!201552 (= e!132088 (and e!132085 mapRes!8429))))

(declare-fun condMapEmpty!8429 () Bool)

(declare-fun mapDefault!8429 () ValueCell!2110)

