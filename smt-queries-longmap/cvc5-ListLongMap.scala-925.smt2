; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20646 () Bool)

(assert start!20646)

(declare-fun b_free!5305 () Bool)

(declare-fun b_next!5305 () Bool)

(assert (=> start!20646 (= b_free!5305 (not b_next!5305))))

(declare-fun tp!18947 () Bool)

(declare-fun b_and!12051 () Bool)

(assert (=> start!20646 (= tp!18947 b_and!12051)))

(declare-fun b!206136 () Bool)

(declare-fun res!99787 () Bool)

(declare-fun e!134755 () Bool)

(assert (=> b!206136 (=> (not res!99787) (not e!134755))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206136 (= res!99787 (validKeyInArray!0 k!843))))

(declare-fun b!206137 () Bool)

(declare-fun e!134752 () Bool)

(declare-fun tp_is_empty!5161 () Bool)

(assert (=> b!206137 (= e!134752 tp_is_empty!5161)))

(declare-fun res!99786 () Bool)

(assert (=> start!20646 (=> (not res!99786) (not e!134755))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20646 (= res!99786 (validMask!0 mask!1149))))

(assert (=> start!20646 e!134755))

(declare-datatypes ((V!6529 0))(
  ( (V!6530 (val!2625 Int)) )
))
(declare-datatypes ((ValueCell!2237 0))(
  ( (ValueCellFull!2237 (v!4595 V!6529)) (EmptyCell!2237) )
))
(declare-datatypes ((array!9533 0))(
  ( (array!9534 (arr!4517 (Array (_ BitVec 32) ValueCell!2237)) (size!4842 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9533)

(declare-fun e!134756 () Bool)

(declare-fun array_inv!2985 (array!9533) Bool)

(assert (=> start!20646 (and (array_inv!2985 _values!649) e!134756)))

(assert (=> start!20646 true))

(assert (=> start!20646 tp_is_empty!5161))

(declare-datatypes ((array!9535 0))(
  ( (array!9536 (arr!4518 (Array (_ BitVec 32) (_ BitVec 64))) (size!4843 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9535)

(declare-fun array_inv!2986 (array!9535) Bool)

(assert (=> start!20646 (array_inv!2986 _keys!825)))

(assert (=> start!20646 tp!18947))

(declare-fun b!206138 () Bool)

(declare-fun e!134754 () Bool)

(declare-fun e!134753 () Bool)

(assert (=> b!206138 (= e!134754 e!134753)))

(declare-fun res!99782 () Bool)

(assert (=> b!206138 (=> res!99782 e!134753)))

(assert (=> b!206138 (= res!99782 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3986 0))(
  ( (tuple2!3987 (_1!2004 (_ BitVec 64)) (_2!2004 V!6529)) )
))
(declare-datatypes ((List!2878 0))(
  ( (Nil!2875) (Cons!2874 (h!3516 tuple2!3986) (t!7809 List!2878)) )
))
(declare-datatypes ((ListLongMap!2899 0))(
  ( (ListLongMap!2900 (toList!1465 List!2878)) )
))
(declare-fun lt!105268 () ListLongMap!2899)

(declare-fun lt!105270 () ListLongMap!2899)

(assert (=> b!206138 (= lt!105268 lt!105270)))

(declare-fun lt!105278 () ListLongMap!2899)

(declare-fun lt!105273 () tuple2!3986)

(declare-fun +!492 (ListLongMap!2899 tuple2!3986) ListLongMap!2899)

(assert (=> b!206138 (= lt!105270 (+!492 lt!105278 lt!105273))))

(declare-fun lt!105275 () ListLongMap!2899)

(declare-fun lt!105276 () ListLongMap!2899)

(assert (=> b!206138 (= lt!105275 lt!105276)))

(declare-fun lt!105274 () ListLongMap!2899)

(assert (=> b!206138 (= lt!105276 (+!492 lt!105274 lt!105273))))

(declare-fun lt!105272 () ListLongMap!2899)

(assert (=> b!206138 (= lt!105275 (+!492 lt!105272 lt!105273))))

(declare-fun minValue!615 () V!6529)

(assert (=> b!206138 (= lt!105273 (tuple2!3987 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206139 () Bool)

(assert (=> b!206139 (= e!134753 true)))

(declare-fun lt!105269 () tuple2!3986)

(assert (=> b!206139 (= lt!105276 (+!492 lt!105270 lt!105269))))

(declare-datatypes ((Unit!6272 0))(
  ( (Unit!6273) )
))
(declare-fun lt!105277 () Unit!6272)

(declare-fun v!520 () V!6529)

(declare-fun addCommutativeForDiffKeys!190 (ListLongMap!2899 (_ BitVec 64) V!6529 (_ BitVec 64) V!6529) Unit!6272)

(assert (=> b!206139 (= lt!105277 (addCommutativeForDiffKeys!190 lt!105278 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206140 () Bool)

(declare-fun res!99784 () Bool)

(assert (=> b!206140 (=> (not res!99784) (not e!134755))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206140 (= res!99784 (= (select (arr!4518 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8810 () Bool)

(declare-fun mapRes!8810 () Bool)

(declare-fun tp!18946 () Bool)

(assert (=> mapNonEmpty!8810 (= mapRes!8810 (and tp!18946 e!134752))))

(declare-fun mapRest!8810 () (Array (_ BitVec 32) ValueCell!2237))

(declare-fun mapKey!8810 () (_ BitVec 32))

(declare-fun mapValue!8810 () ValueCell!2237)

(assert (=> mapNonEmpty!8810 (= (arr!4517 _values!649) (store mapRest!8810 mapKey!8810 mapValue!8810))))

(declare-fun mapIsEmpty!8810 () Bool)

(assert (=> mapIsEmpty!8810 mapRes!8810))

(declare-fun b!206141 () Bool)

(declare-fun res!99781 () Bool)

(assert (=> b!206141 (=> (not res!99781) (not e!134755))))

(declare-datatypes ((List!2879 0))(
  ( (Nil!2876) (Cons!2875 (h!3517 (_ BitVec 64)) (t!7810 List!2879)) )
))
(declare-fun arrayNoDuplicates!0 (array!9535 (_ BitVec 32) List!2879) Bool)

(assert (=> b!206141 (= res!99781 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2876))))

(declare-fun b!206142 () Bool)

(declare-fun e!134750 () Bool)

(assert (=> b!206142 (= e!134756 (and e!134750 mapRes!8810))))

(declare-fun condMapEmpty!8810 () Bool)

(declare-fun mapDefault!8810 () ValueCell!2237)

