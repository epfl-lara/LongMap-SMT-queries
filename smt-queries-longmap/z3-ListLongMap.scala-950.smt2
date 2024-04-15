; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20800 () Bool)

(assert start!20800)

(declare-fun b_free!5449 () Bool)

(declare-fun b_next!5449 () Bool)

(assert (=> start!20800 (= b_free!5449 (not b_next!5449))))

(declare-fun tp!19387 () Bool)

(declare-fun b_and!12169 () Bool)

(assert (=> start!20800 (= tp!19387 b_and!12169)))

(declare-fun b!208253 () Bool)

(declare-fun res!101274 () Bool)

(declare-fun e!135824 () Bool)

(assert (=> b!208253 (=> (not res!101274) (not e!135824))))

(declare-datatypes ((array!9811 0))(
  ( (array!9812 (arr!4655 (Array (_ BitVec 32) (_ BitVec 64))) (size!4981 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9811)

(declare-datatypes ((List!2978 0))(
  ( (Nil!2975) (Cons!2974 (h!3616 (_ BitVec 64)) (t!7900 List!2978)) )
))
(declare-fun arrayNoDuplicates!0 (array!9811 (_ BitVec 32) List!2978) Bool)

(assert (=> b!208253 (= res!101274 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2975))))

(declare-fun mapNonEmpty!9035 () Bool)

(declare-fun mapRes!9035 () Bool)

(declare-fun tp!19388 () Bool)

(declare-fun e!135826 () Bool)

(assert (=> mapNonEmpty!9035 (= mapRes!9035 (and tp!19388 e!135826))))

(declare-fun mapKey!9035 () (_ BitVec 32))

(declare-datatypes ((V!6729 0))(
  ( (V!6730 (val!2700 Int)) )
))
(declare-datatypes ((ValueCell!2312 0))(
  ( (ValueCellFull!2312 (v!4664 V!6729)) (EmptyCell!2312) )
))
(declare-fun mapValue!9035 () ValueCell!2312)

(declare-datatypes ((array!9813 0))(
  ( (array!9814 (arr!4656 (Array (_ BitVec 32) ValueCell!2312)) (size!4982 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9813)

(declare-fun mapRest!9035 () (Array (_ BitVec 32) ValueCell!2312))

(assert (=> mapNonEmpty!9035 (= (arr!4656 _values!649) (store mapRest!9035 mapKey!9035 mapValue!9035))))

(declare-fun b!208254 () Bool)

(declare-fun res!101278 () Bool)

(assert (=> b!208254 (=> (not res!101278) (not e!135824))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208254 (= res!101278 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4981 _keys!825))))))

(declare-fun b!208255 () Bool)

(assert (=> b!208255 (= e!135824 false)))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6729)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6729)

(declare-fun v!520 () V!6729)

(declare-datatypes ((tuple2!4070 0))(
  ( (tuple2!4071 (_1!2046 (_ BitVec 64)) (_2!2046 V!6729)) )
))
(declare-datatypes ((List!2979 0))(
  ( (Nil!2976) (Cons!2975 (h!3617 tuple2!4070) (t!7901 List!2979)) )
))
(declare-datatypes ((ListLongMap!2973 0))(
  ( (ListLongMap!2974 (toList!1502 List!2979)) )
))
(declare-fun lt!106597 () ListLongMap!2973)

(declare-fun getCurrentListMapNoExtraKeys!453 (array!9811 array!9813 (_ BitVec 32) (_ BitVec 32) V!6729 V!6729 (_ BitVec 32) Int) ListLongMap!2973)

(assert (=> b!208255 (= lt!106597 (getCurrentListMapNoExtraKeys!453 _keys!825 (array!9814 (store (arr!4656 _values!649) i!601 (ValueCellFull!2312 v!520)) (size!4982 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106598 () ListLongMap!2973)

(assert (=> b!208255 (= lt!106598 (getCurrentListMapNoExtraKeys!453 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208256 () Bool)

(declare-fun res!101277 () Bool)

(assert (=> b!208256 (=> (not res!101277) (not e!135824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9811 (_ BitVec 32)) Bool)

(assert (=> b!208256 (= res!101277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208257 () Bool)

(declare-fun res!101275 () Bool)

(assert (=> b!208257 (=> (not res!101275) (not e!135824))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!208257 (= res!101275 (= (select (arr!4655 _keys!825) i!601) k0!843))))

(declare-fun b!208258 () Bool)

(declare-fun res!101273 () Bool)

(assert (=> b!208258 (=> (not res!101273) (not e!135824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208258 (= res!101273 (validKeyInArray!0 k0!843))))

(declare-fun b!208260 () Bool)

(declare-fun res!101279 () Bool)

(assert (=> b!208260 (=> (not res!101279) (not e!135824))))

(assert (=> b!208260 (= res!101279 (and (= (size!4982 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4981 _keys!825) (size!4982 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9035 () Bool)

(assert (=> mapIsEmpty!9035 mapRes!9035))

(declare-fun b!208261 () Bool)

(declare-fun e!135825 () Bool)

(declare-fun e!135827 () Bool)

(assert (=> b!208261 (= e!135825 (and e!135827 mapRes!9035))))

(declare-fun condMapEmpty!9035 () Bool)

(declare-fun mapDefault!9035 () ValueCell!2312)

(assert (=> b!208261 (= condMapEmpty!9035 (= (arr!4656 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2312)) mapDefault!9035)))))

(declare-fun b!208262 () Bool)

(declare-fun tp_is_empty!5311 () Bool)

(assert (=> b!208262 (= e!135827 tp_is_empty!5311)))

(declare-fun b!208259 () Bool)

(assert (=> b!208259 (= e!135826 tp_is_empty!5311)))

(declare-fun res!101276 () Bool)

(assert (=> start!20800 (=> (not res!101276) (not e!135824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20800 (= res!101276 (validMask!0 mask!1149))))

(assert (=> start!20800 e!135824))

(declare-fun array_inv!3059 (array!9813) Bool)

(assert (=> start!20800 (and (array_inv!3059 _values!649) e!135825)))

(assert (=> start!20800 true))

(assert (=> start!20800 tp_is_empty!5311))

(declare-fun array_inv!3060 (array!9811) Bool)

(assert (=> start!20800 (array_inv!3060 _keys!825)))

(assert (=> start!20800 tp!19387))

(assert (= (and start!20800 res!101276) b!208260))

(assert (= (and b!208260 res!101279) b!208256))

(assert (= (and b!208256 res!101277) b!208253))

(assert (= (and b!208253 res!101274) b!208254))

(assert (= (and b!208254 res!101278) b!208258))

(assert (= (and b!208258 res!101273) b!208257))

(assert (= (and b!208257 res!101275) b!208255))

(assert (= (and b!208261 condMapEmpty!9035) mapIsEmpty!9035))

(assert (= (and b!208261 (not condMapEmpty!9035)) mapNonEmpty!9035))

(get-info :version)

(assert (= (and mapNonEmpty!9035 ((_ is ValueCellFull!2312) mapValue!9035)) b!208259))

(assert (= (and b!208261 ((_ is ValueCellFull!2312) mapDefault!9035)) b!208262))

(assert (= start!20800 b!208261))

(declare-fun m!235425 () Bool)

(assert (=> b!208258 m!235425))

(declare-fun m!235427 () Bool)

(assert (=> mapNonEmpty!9035 m!235427))

(declare-fun m!235429 () Bool)

(assert (=> start!20800 m!235429))

(declare-fun m!235431 () Bool)

(assert (=> start!20800 m!235431))

(declare-fun m!235433 () Bool)

(assert (=> start!20800 m!235433))

(declare-fun m!235435 () Bool)

(assert (=> b!208257 m!235435))

(declare-fun m!235437 () Bool)

(assert (=> b!208255 m!235437))

(declare-fun m!235439 () Bool)

(assert (=> b!208255 m!235439))

(declare-fun m!235441 () Bool)

(assert (=> b!208255 m!235441))

(declare-fun m!235443 () Bool)

(assert (=> b!208253 m!235443))

(declare-fun m!235445 () Bool)

(assert (=> b!208256 m!235445))

(check-sat (not start!20800) tp_is_empty!5311 (not b!208253) b_and!12169 (not b!208255) (not mapNonEmpty!9035) (not b!208256) (not b_next!5449) (not b!208258))
(check-sat b_and!12169 (not b_next!5449))
