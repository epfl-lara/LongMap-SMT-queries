; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20490 () Bool)

(assert start!20490)

(declare-fun b_free!5149 () Bool)

(declare-fun b_next!5149 () Bool)

(assert (=> start!20490 (= b_free!5149 (not b_next!5149))))

(declare-fun tp!18478 () Bool)

(declare-fun b_and!11895 () Bool)

(assert (=> start!20490 (= tp!18478 b_and!11895)))

(declare-fun res!97672 () Bool)

(declare-fun e!133117 () Bool)

(assert (=> start!20490 (=> (not res!97672) (not e!133117))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20490 (= res!97672 (validMask!0 mask!1149))))

(assert (=> start!20490 e!133117))

(declare-datatypes ((V!6321 0))(
  ( (V!6322 (val!2547 Int)) )
))
(declare-datatypes ((ValueCell!2159 0))(
  ( (ValueCellFull!2159 (v!4517 V!6321)) (EmptyCell!2159) )
))
(declare-datatypes ((array!9233 0))(
  ( (array!9234 (arr!4367 (Array (_ BitVec 32) ValueCell!2159)) (size!4692 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9233)

(declare-fun e!133112 () Bool)

(declare-fun array_inv!2887 (array!9233) Bool)

(assert (=> start!20490 (and (array_inv!2887 _values!649) e!133112)))

(assert (=> start!20490 true))

(declare-fun tp_is_empty!5005 () Bool)

(assert (=> start!20490 tp_is_empty!5005))

(declare-datatypes ((array!9235 0))(
  ( (array!9236 (arr!4368 (Array (_ BitVec 32) (_ BitVec 64))) (size!4693 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9235)

(declare-fun array_inv!2888 (array!9235) Bool)

(assert (=> start!20490 (array_inv!2888 _keys!825)))

(assert (=> start!20490 tp!18478))

(declare-fun b!203319 () Bool)

(declare-fun res!97667 () Bool)

(assert (=> b!203319 (=> (not res!97667) (not e!133117))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203319 (= res!97667 (and (= (size!4692 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4693 _keys!825) (size!4692 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203320 () Bool)

(declare-fun res!97668 () Bool)

(assert (=> b!203320 (=> (not res!97668) (not e!133117))))

(declare-datatypes ((List!2766 0))(
  ( (Nil!2763) (Cons!2762 (h!3404 (_ BitVec 64)) (t!7697 List!2766)) )
))
(declare-fun arrayNoDuplicates!0 (array!9235 (_ BitVec 32) List!2766) Bool)

(assert (=> b!203320 (= res!97668 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2763))))

(declare-fun b!203321 () Bool)

(declare-fun res!97671 () Bool)

(assert (=> b!203321 (=> (not res!97671) (not e!133117))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203321 (= res!97671 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4693 _keys!825))))))

(declare-fun b!203322 () Bool)

(declare-fun res!97664 () Bool)

(assert (=> b!203322 (=> (not res!97664) (not e!133117))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203322 (= res!97664 (validKeyInArray!0 k!843))))

(declare-fun b!203323 () Bool)

(declare-fun e!133113 () Bool)

(assert (=> b!203323 (= e!133113 tp_is_empty!5005)))

(declare-fun b!203324 () Bool)

(declare-fun res!97666 () Bool)

(assert (=> b!203324 (=> (not res!97666) (not e!133117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9235 (_ BitVec 32)) Bool)

(assert (=> b!203324 (= res!97666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203325 () Bool)

(declare-fun e!133118 () Bool)

(assert (=> b!203325 (= e!133117 (not e!133118))))

(declare-fun res!97665 () Bool)

(assert (=> b!203325 (=> res!97665 e!133118)))

(assert (=> b!203325 (= res!97665 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3864 0))(
  ( (tuple2!3865 (_1!1943 (_ BitVec 64)) (_2!1943 V!6321)) )
))
(declare-datatypes ((List!2767 0))(
  ( (Nil!2764) (Cons!2763 (h!3405 tuple2!3864) (t!7698 List!2767)) )
))
(declare-datatypes ((ListLongMap!2777 0))(
  ( (ListLongMap!2778 (toList!1404 List!2767)) )
))
(declare-fun lt!102506 () ListLongMap!2777)

(declare-fun zeroValue!615 () V!6321)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6321)

(declare-fun getCurrentListMap!979 (array!9235 array!9233 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) Int) ListLongMap!2777)

(assert (=> b!203325 (= lt!102506 (getCurrentListMap!979 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102499 () ListLongMap!2777)

(declare-fun lt!102496 () array!9233)

(assert (=> b!203325 (= lt!102499 (getCurrentListMap!979 _keys!825 lt!102496 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102501 () ListLongMap!2777)

(declare-fun lt!102505 () ListLongMap!2777)

(assert (=> b!203325 (and (= lt!102501 lt!102505) (= lt!102505 lt!102501))))

(declare-fun lt!102503 () ListLongMap!2777)

(declare-fun lt!102500 () tuple2!3864)

(declare-fun +!431 (ListLongMap!2777 tuple2!3864) ListLongMap!2777)

(assert (=> b!203325 (= lt!102505 (+!431 lt!102503 lt!102500))))

(declare-fun v!520 () V!6321)

(assert (=> b!203325 (= lt!102500 (tuple2!3865 k!843 v!520))))

(declare-datatypes ((Unit!6156 0))(
  ( (Unit!6157) )
))
(declare-fun lt!102502 () Unit!6156)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!92 (array!9235 array!9233 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) (_ BitVec 64) V!6321 (_ BitVec 32) Int) Unit!6156)

(assert (=> b!203325 (= lt!102502 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!92 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!353 (array!9235 array!9233 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) Int) ListLongMap!2777)

(assert (=> b!203325 (= lt!102501 (getCurrentListMapNoExtraKeys!353 _keys!825 lt!102496 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203325 (= lt!102496 (array!9234 (store (arr!4367 _values!649) i!601 (ValueCellFull!2159 v!520)) (size!4692 _values!649)))))

(assert (=> b!203325 (= lt!102503 (getCurrentListMapNoExtraKeys!353 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203326 () Bool)

(declare-fun e!133116 () Bool)

(assert (=> b!203326 (= e!133118 e!133116)))

(declare-fun res!97670 () Bool)

(assert (=> b!203326 (=> res!97670 e!133116)))

(assert (=> b!203326 (= res!97670 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102497 () ListLongMap!2777)

(assert (=> b!203326 (= lt!102499 lt!102497)))

(declare-fun lt!102498 () tuple2!3864)

(assert (=> b!203326 (= lt!102497 (+!431 lt!102505 lt!102498))))

(declare-fun lt!102504 () ListLongMap!2777)

(assert (=> b!203326 (= lt!102506 lt!102504)))

(assert (=> b!203326 (= lt!102504 (+!431 lt!102503 lt!102498))))

(assert (=> b!203326 (= lt!102499 (+!431 lt!102501 lt!102498))))

(assert (=> b!203326 (= lt!102498 (tuple2!3865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8576 () Bool)

(declare-fun mapRes!8576 () Bool)

(declare-fun tp!18479 () Bool)

(declare-fun e!133115 () Bool)

(assert (=> mapNonEmpty!8576 (= mapRes!8576 (and tp!18479 e!133115))))

(declare-fun mapRest!8576 () (Array (_ BitVec 32) ValueCell!2159))

(declare-fun mapKey!8576 () (_ BitVec 32))

(declare-fun mapValue!8576 () ValueCell!2159)

(assert (=> mapNonEmpty!8576 (= (arr!4367 _values!649) (store mapRest!8576 mapKey!8576 mapValue!8576))))

(declare-fun b!203327 () Bool)

(assert (=> b!203327 (= e!133115 tp_is_empty!5005)))

(declare-fun b!203328 () Bool)

(assert (=> b!203328 (= e!133112 (and e!133113 mapRes!8576))))

(declare-fun condMapEmpty!8576 () Bool)

(declare-fun mapDefault!8576 () ValueCell!2159)

