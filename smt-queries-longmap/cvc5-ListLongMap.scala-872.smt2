; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20328 () Bool)

(assert start!20328)

(declare-fun b_free!4987 () Bool)

(declare-fun b_next!4987 () Bool)

(assert (=> start!20328 (= b_free!4987 (not b_next!4987))))

(declare-fun tp!17992 () Bool)

(declare-fun b_and!11733 () Bool)

(assert (=> start!20328 (= tp!17992 b_and!11733)))

(declare-fun b!200394 () Bool)

(declare-fun e!131415 () Bool)

(declare-fun e!131413 () Bool)

(assert (=> b!200394 (= e!131415 (not e!131413))))

(declare-fun res!95470 () Bool)

(assert (=> b!200394 (=> res!95470 e!131413)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200394 (= res!95470 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6105 0))(
  ( (V!6106 (val!2466 Int)) )
))
(declare-datatypes ((tuple2!3726 0))(
  ( (tuple2!3727 (_1!1874 (_ BitVec 64)) (_2!1874 V!6105)) )
))
(declare-datatypes ((List!2642 0))(
  ( (Nil!2639) (Cons!2638 (h!3280 tuple2!3726) (t!7573 List!2642)) )
))
(declare-datatypes ((ListLongMap!2639 0))(
  ( (ListLongMap!2640 (toList!1335 List!2642)) )
))
(declare-fun lt!98989 () ListLongMap!2639)

(declare-datatypes ((ValueCell!2078 0))(
  ( (ValueCellFull!2078 (v!4436 V!6105)) (EmptyCell!2078) )
))
(declare-datatypes ((array!8917 0))(
  ( (array!8918 (arr!4209 (Array (_ BitVec 32) ValueCell!2078)) (size!4534 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8917)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6105)

(declare-datatypes ((array!8919 0))(
  ( (array!8920 (arr!4210 (Array (_ BitVec 32) (_ BitVec 64))) (size!4535 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8919)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6105)

(declare-fun getCurrentListMap!925 (array!8919 array!8917 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) Int) ListLongMap!2639)

(assert (=> b!200394 (= lt!98989 (getCurrentListMap!925 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98985 () ListLongMap!2639)

(declare-fun lt!98987 () array!8917)

(assert (=> b!200394 (= lt!98985 (getCurrentListMap!925 _keys!825 lt!98987 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98978 () ListLongMap!2639)

(declare-fun lt!98988 () ListLongMap!2639)

(assert (=> b!200394 (and (= lt!98978 lt!98988) (= lt!98988 lt!98978))))

(declare-fun lt!98991 () ListLongMap!2639)

(declare-fun lt!98990 () tuple2!3726)

(declare-fun +!362 (ListLongMap!2639 tuple2!3726) ListLongMap!2639)

(assert (=> b!200394 (= lt!98988 (+!362 lt!98991 lt!98990))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6105)

(assert (=> b!200394 (= lt!98990 (tuple2!3727 k!843 v!520))))

(declare-datatypes ((Unit!6024 0))(
  ( (Unit!6025) )
))
(declare-fun lt!98983 () Unit!6024)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!38 (array!8919 array!8917 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) (_ BitVec 64) V!6105 (_ BitVec 32) Int) Unit!6024)

(assert (=> b!200394 (= lt!98983 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!38 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!299 (array!8919 array!8917 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) Int) ListLongMap!2639)

(assert (=> b!200394 (= lt!98978 (getCurrentListMapNoExtraKeys!299 _keys!825 lt!98987 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200394 (= lt!98987 (array!8918 (store (arr!4209 _values!649) i!601 (ValueCellFull!2078 v!520)) (size!4534 _values!649)))))

(assert (=> b!200394 (= lt!98991 (getCurrentListMapNoExtraKeys!299 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!95476 () Bool)

(assert (=> start!20328 (=> (not res!95476) (not e!131415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20328 (= res!95476 (validMask!0 mask!1149))))

(assert (=> start!20328 e!131415))

(declare-fun e!131412 () Bool)

(declare-fun array_inv!2769 (array!8917) Bool)

(assert (=> start!20328 (and (array_inv!2769 _values!649) e!131412)))

(assert (=> start!20328 true))

(declare-fun tp_is_empty!4843 () Bool)

(assert (=> start!20328 tp_is_empty!4843))

(declare-fun array_inv!2770 (array!8919) Bool)

(assert (=> start!20328 (array_inv!2770 _keys!825)))

(assert (=> start!20328 tp!17992))

(declare-fun b!200395 () Bool)

(declare-fun e!131411 () Bool)

(assert (=> b!200395 (= e!131411 true)))

(declare-fun lt!98977 () tuple2!3726)

(declare-fun lt!98980 () ListLongMap!2639)

(declare-fun lt!98982 () ListLongMap!2639)

(assert (=> b!200395 (= (+!362 lt!98982 lt!98977) (+!362 lt!98980 lt!98990))))

(declare-fun lt!98986 () ListLongMap!2639)

(declare-fun lt!98981 () Unit!6024)

(declare-fun addCommutativeForDiffKeys!86 (ListLongMap!2639 (_ BitVec 64) V!6105 (_ BitVec 64) V!6105) Unit!6024)

(assert (=> b!200395 (= lt!98981 (addCommutativeForDiffKeys!86 lt!98986 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200396 () Bool)

(declare-fun res!95468 () Bool)

(assert (=> b!200396 (=> (not res!95468) (not e!131415))))

(declare-datatypes ((List!2643 0))(
  ( (Nil!2640) (Cons!2639 (h!3281 (_ BitVec 64)) (t!7574 List!2643)) )
))
(declare-fun arrayNoDuplicates!0 (array!8919 (_ BitVec 32) List!2643) Bool)

(assert (=> b!200396 (= res!95468 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2640))))

(declare-fun mapIsEmpty!8333 () Bool)

(declare-fun mapRes!8333 () Bool)

(assert (=> mapIsEmpty!8333 mapRes!8333))

(declare-fun mapNonEmpty!8333 () Bool)

(declare-fun tp!17993 () Bool)

(declare-fun e!131414 () Bool)

(assert (=> mapNonEmpty!8333 (= mapRes!8333 (and tp!17993 e!131414))))

(declare-fun mapKey!8333 () (_ BitVec 32))

(declare-fun mapRest!8333 () (Array (_ BitVec 32) ValueCell!2078))

(declare-fun mapValue!8333 () ValueCell!2078)

(assert (=> mapNonEmpty!8333 (= (arr!4209 _values!649) (store mapRest!8333 mapKey!8333 mapValue!8333))))

(declare-fun b!200397 () Bool)

(assert (=> b!200397 (= e!131413 e!131411)))

(declare-fun res!95473 () Bool)

(assert (=> b!200397 (=> res!95473 e!131411)))

(assert (=> b!200397 (= res!95473 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!98976 () ListLongMap!2639)

(assert (=> b!200397 (= lt!98976 lt!98982)))

(assert (=> b!200397 (= lt!98982 (+!362 lt!98986 lt!98990))))

(declare-fun lt!98984 () Unit!6024)

(assert (=> b!200397 (= lt!98984 (addCommutativeForDiffKeys!86 lt!98991 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!200397 (= lt!98985 (+!362 lt!98976 lt!98977))))

(declare-fun lt!98979 () tuple2!3726)

(assert (=> b!200397 (= lt!98976 (+!362 lt!98988 lt!98979))))

(assert (=> b!200397 (= lt!98989 lt!98980)))

(assert (=> b!200397 (= lt!98980 (+!362 lt!98986 lt!98977))))

(assert (=> b!200397 (= lt!98986 (+!362 lt!98991 lt!98979))))

(assert (=> b!200397 (= lt!98985 (+!362 (+!362 lt!98978 lt!98979) lt!98977))))

(assert (=> b!200397 (= lt!98977 (tuple2!3727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200397 (= lt!98979 (tuple2!3727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200398 () Bool)

(assert (=> b!200398 (= e!131414 tp_is_empty!4843)))

(declare-fun b!200399 () Bool)

(declare-fun res!95474 () Bool)

(assert (=> b!200399 (=> (not res!95474) (not e!131415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200399 (= res!95474 (validKeyInArray!0 k!843))))

(declare-fun b!200400 () Bool)

(declare-fun e!131416 () Bool)

(assert (=> b!200400 (= e!131416 tp_is_empty!4843)))

(declare-fun b!200401 () Bool)

(declare-fun res!95469 () Bool)

(assert (=> b!200401 (=> (not res!95469) (not e!131415))))

(assert (=> b!200401 (= res!95469 (= (select (arr!4210 _keys!825) i!601) k!843))))

(declare-fun b!200402 () Bool)

(declare-fun res!95475 () Bool)

(assert (=> b!200402 (=> (not res!95475) (not e!131415))))

(assert (=> b!200402 (= res!95475 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4535 _keys!825))))))

(declare-fun b!200403 () Bool)

(declare-fun res!95471 () Bool)

(assert (=> b!200403 (=> (not res!95471) (not e!131415))))

(assert (=> b!200403 (= res!95471 (and (= (size!4534 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4535 _keys!825) (size!4534 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200404 () Bool)

(assert (=> b!200404 (= e!131412 (and e!131416 mapRes!8333))))

(declare-fun condMapEmpty!8333 () Bool)

(declare-fun mapDefault!8333 () ValueCell!2078)

