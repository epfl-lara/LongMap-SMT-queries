; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20794 () Bool)

(assert start!20794)

(declare-fun b_free!5443 () Bool)

(declare-fun b_next!5443 () Bool)

(assert (=> start!20794 (= b_free!5443 (not b_next!5443))))

(declare-fun tp!19369 () Bool)

(declare-fun b_and!12163 () Bool)

(assert (=> start!20794 (= tp!19369 b_and!12163)))

(declare-fun mapIsEmpty!9026 () Bool)

(declare-fun mapRes!9026 () Bool)

(assert (=> mapIsEmpty!9026 mapRes!9026))

(declare-fun b!208163 () Bool)

(declare-fun e!135779 () Bool)

(declare-fun tp_is_empty!5305 () Bool)

(assert (=> b!208163 (= e!135779 tp_is_empty!5305)))

(declare-fun mapNonEmpty!9026 () Bool)

(declare-fun tp!19370 () Bool)

(declare-fun e!135782 () Bool)

(assert (=> mapNonEmpty!9026 (= mapRes!9026 (and tp!19370 e!135782))))

(declare-fun mapKey!9026 () (_ BitVec 32))

(declare-datatypes ((V!6721 0))(
  ( (V!6722 (val!2697 Int)) )
))
(declare-datatypes ((ValueCell!2309 0))(
  ( (ValueCellFull!2309 (v!4661 V!6721)) (EmptyCell!2309) )
))
(declare-datatypes ((array!9799 0))(
  ( (array!9800 (arr!4649 (Array (_ BitVec 32) ValueCell!2309)) (size!4975 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9799)

(declare-fun mapRest!9026 () (Array (_ BitVec 32) ValueCell!2309))

(declare-fun mapValue!9026 () ValueCell!2309)

(assert (=> mapNonEmpty!9026 (= (arr!4649 _values!649) (store mapRest!9026 mapKey!9026 mapValue!9026))))

(declare-fun b!208164 () Bool)

(declare-fun res!101215 () Bool)

(declare-fun e!135781 () Bool)

(assert (=> b!208164 (=> (not res!101215) (not e!135781))))

(declare-datatypes ((array!9801 0))(
  ( (array!9802 (arr!4650 (Array (_ BitVec 32) (_ BitVec 64))) (size!4976 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9801)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9801 (_ BitVec 32)) Bool)

(assert (=> b!208164 (= res!101215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208165 () Bool)

(assert (=> b!208165 (= e!135782 tp_is_empty!5305)))

(declare-fun b!208166 () Bool)

(assert (=> b!208166 (= e!135781 false)))

(declare-datatypes ((tuple2!4068 0))(
  ( (tuple2!4069 (_1!2045 (_ BitVec 64)) (_2!2045 V!6721)) )
))
(declare-datatypes ((List!2974 0))(
  ( (Nil!2971) (Cons!2970 (h!3612 tuple2!4068) (t!7896 List!2974)) )
))
(declare-datatypes ((ListLongMap!2971 0))(
  ( (ListLongMap!2972 (toList!1501 List!2974)) )
))
(declare-fun lt!106579 () ListLongMap!2971)

(declare-fun v!520 () V!6721)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6721)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6721)

(declare-fun getCurrentListMapNoExtraKeys!452 (array!9801 array!9799 (_ BitVec 32) (_ BitVec 32) V!6721 V!6721 (_ BitVec 32) Int) ListLongMap!2971)

(assert (=> b!208166 (= lt!106579 (getCurrentListMapNoExtraKeys!452 _keys!825 (array!9800 (store (arr!4649 _values!649) i!601 (ValueCellFull!2309 v!520)) (size!4975 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106580 () ListLongMap!2971)

(assert (=> b!208166 (= lt!106580 (getCurrentListMapNoExtraKeys!452 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208167 () Bool)

(declare-fun e!135780 () Bool)

(assert (=> b!208167 (= e!135780 (and e!135779 mapRes!9026))))

(declare-fun condMapEmpty!9026 () Bool)

(declare-fun mapDefault!9026 () ValueCell!2309)

(assert (=> b!208167 (= condMapEmpty!9026 (= (arr!4649 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2309)) mapDefault!9026)))))

(declare-fun b!208168 () Bool)

(declare-fun res!101212 () Bool)

(assert (=> b!208168 (=> (not res!101212) (not e!135781))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208168 (= res!101212 (validKeyInArray!0 k0!843))))

(declare-fun b!208169 () Bool)

(declare-fun res!101210 () Bool)

(assert (=> b!208169 (=> (not res!101210) (not e!135781))))

(assert (=> b!208169 (= res!101210 (and (= (size!4975 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4976 _keys!825) (size!4975 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208170 () Bool)

(declare-fun res!101213 () Bool)

(assert (=> b!208170 (=> (not res!101213) (not e!135781))))

(assert (=> b!208170 (= res!101213 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4976 _keys!825))))))

(declare-fun b!208171 () Bool)

(declare-fun res!101214 () Bool)

(assert (=> b!208171 (=> (not res!101214) (not e!135781))))

(assert (=> b!208171 (= res!101214 (= (select (arr!4650 _keys!825) i!601) k0!843))))

(declare-fun b!208172 () Bool)

(declare-fun res!101211 () Bool)

(assert (=> b!208172 (=> (not res!101211) (not e!135781))))

(declare-datatypes ((List!2975 0))(
  ( (Nil!2972) (Cons!2971 (h!3613 (_ BitVec 64)) (t!7897 List!2975)) )
))
(declare-fun arrayNoDuplicates!0 (array!9801 (_ BitVec 32) List!2975) Bool)

(assert (=> b!208172 (= res!101211 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2972))))

(declare-fun res!101216 () Bool)

(assert (=> start!20794 (=> (not res!101216) (not e!135781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20794 (= res!101216 (validMask!0 mask!1149))))

(assert (=> start!20794 e!135781))

(declare-fun array_inv!3053 (array!9799) Bool)

(assert (=> start!20794 (and (array_inv!3053 _values!649) e!135780)))

(assert (=> start!20794 true))

(assert (=> start!20794 tp_is_empty!5305))

(declare-fun array_inv!3054 (array!9801) Bool)

(assert (=> start!20794 (array_inv!3054 _keys!825)))

(assert (=> start!20794 tp!19369))

(assert (= (and start!20794 res!101216) b!208169))

(assert (= (and b!208169 res!101210) b!208164))

(assert (= (and b!208164 res!101215) b!208172))

(assert (= (and b!208172 res!101211) b!208170))

(assert (= (and b!208170 res!101213) b!208168))

(assert (= (and b!208168 res!101212) b!208171))

(assert (= (and b!208171 res!101214) b!208166))

(assert (= (and b!208167 condMapEmpty!9026) mapIsEmpty!9026))

(assert (= (and b!208167 (not condMapEmpty!9026)) mapNonEmpty!9026))

(get-info :version)

(assert (= (and mapNonEmpty!9026 ((_ is ValueCellFull!2309) mapValue!9026)) b!208165))

(assert (= (and b!208167 ((_ is ValueCellFull!2309) mapDefault!9026)) b!208163))

(assert (= start!20794 b!208167))

(declare-fun m!235359 () Bool)

(assert (=> mapNonEmpty!9026 m!235359))

(declare-fun m!235361 () Bool)

(assert (=> b!208164 m!235361))

(declare-fun m!235363 () Bool)

(assert (=> b!208172 m!235363))

(declare-fun m!235365 () Bool)

(assert (=> b!208166 m!235365))

(declare-fun m!235367 () Bool)

(assert (=> b!208166 m!235367))

(declare-fun m!235369 () Bool)

(assert (=> b!208166 m!235369))

(declare-fun m!235371 () Bool)

(assert (=> b!208171 m!235371))

(declare-fun m!235373 () Bool)

(assert (=> b!208168 m!235373))

(declare-fun m!235375 () Bool)

(assert (=> start!20794 m!235375))

(declare-fun m!235377 () Bool)

(assert (=> start!20794 m!235377))

(declare-fun m!235379 () Bool)

(assert (=> start!20794 m!235379))

(check-sat (not b!208166) tp_is_empty!5305 (not mapNonEmpty!9026) b_and!12163 (not start!20794) (not b!208168) (not b_next!5443) (not b!208164) (not b!208172))
(check-sat b_and!12163 (not b_next!5443))
