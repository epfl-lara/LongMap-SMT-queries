; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20266 () Bool)

(assert start!20266)

(declare-fun b_free!4921 () Bool)

(declare-fun b_next!4921 () Bool)

(assert (=> start!20266 (= b_free!4921 (not b_next!4921))))

(declare-fun tp!17795 () Bool)

(declare-fun b_and!11641 () Bool)

(assert (=> start!20266 (= tp!17795 b_and!11641)))

(declare-fun mapIsEmpty!8234 () Bool)

(declare-fun mapRes!8234 () Bool)

(assert (=> mapIsEmpty!8234 mapRes!8234))

(declare-fun res!94646 () Bool)

(declare-fun e!130788 () Bool)

(assert (=> start!20266 (=> (not res!94646) (not e!130788))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20266 (= res!94646 (validMask!0 mask!1149))))

(assert (=> start!20266 e!130788))

(declare-datatypes ((V!6017 0))(
  ( (V!6018 (val!2433 Int)) )
))
(declare-datatypes ((ValueCell!2045 0))(
  ( (ValueCellFull!2045 (v!4397 V!6017)) (EmptyCell!2045) )
))
(declare-datatypes ((array!8775 0))(
  ( (array!8776 (arr!4137 (Array (_ BitVec 32) ValueCell!2045)) (size!4463 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8775)

(declare-fun e!130786 () Bool)

(declare-fun array_inv!2701 (array!8775) Bool)

(assert (=> start!20266 (and (array_inv!2701 _values!649) e!130786)))

(assert (=> start!20266 true))

(declare-fun tp_is_empty!4777 () Bool)

(assert (=> start!20266 tp_is_empty!4777))

(declare-datatypes ((array!8777 0))(
  ( (array!8778 (arr!4138 (Array (_ BitVec 32) (_ BitVec 64))) (size!4464 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8777)

(declare-fun array_inv!2702 (array!8777) Bool)

(assert (=> start!20266 (array_inv!2702 _keys!825)))

(assert (=> start!20266 tp!17795))

(declare-fun b!199217 () Bool)

(declare-fun res!94643 () Bool)

(assert (=> b!199217 (=> (not res!94643) (not e!130788))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199217 (= res!94643 (validKeyInArray!0 k0!843))))

(declare-fun b!199218 () Bool)

(declare-fun e!130784 () Bool)

(assert (=> b!199218 (= e!130786 (and e!130784 mapRes!8234))))

(declare-fun condMapEmpty!8234 () Bool)

(declare-fun mapDefault!8234 () ValueCell!2045)

(assert (=> b!199218 (= condMapEmpty!8234 (= (arr!4137 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2045)) mapDefault!8234)))))

(declare-fun mapNonEmpty!8234 () Bool)

(declare-fun tp!17794 () Bool)

(declare-fun e!130787 () Bool)

(assert (=> mapNonEmpty!8234 (= mapRes!8234 (and tp!17794 e!130787))))

(declare-fun mapValue!8234 () ValueCell!2045)

(declare-fun mapKey!8234 () (_ BitVec 32))

(declare-fun mapRest!8234 () (Array (_ BitVec 32) ValueCell!2045))

(assert (=> mapNonEmpty!8234 (= (arr!4137 _values!649) (store mapRest!8234 mapKey!8234 mapValue!8234))))

(declare-fun b!199219 () Bool)

(declare-fun res!94642 () Bool)

(assert (=> b!199219 (=> (not res!94642) (not e!130788))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199219 (= res!94642 (= (select (arr!4138 _keys!825) i!601) k0!843))))

(declare-fun b!199220 () Bool)

(assert (=> b!199220 (= e!130787 tp_is_empty!4777)))

(declare-fun b!199221 () Bool)

(declare-fun res!94640 () Bool)

(assert (=> b!199221 (=> (not res!94640) (not e!130788))))

(declare-datatypes ((List!2580 0))(
  ( (Nil!2577) (Cons!2576 (h!3218 (_ BitVec 64)) (t!7502 List!2580)) )
))
(declare-fun arrayNoDuplicates!0 (array!8777 (_ BitVec 32) List!2580) Bool)

(assert (=> b!199221 (= res!94640 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2577))))

(declare-fun b!199222 () Bool)

(assert (=> b!199222 (= e!130784 tp_is_empty!4777)))

(declare-fun b!199223 () Bool)

(declare-fun res!94645 () Bool)

(assert (=> b!199223 (=> (not res!94645) (not e!130788))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199223 (= res!94645 (and (= (size!4463 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4464 _keys!825) (size!4463 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199224 () Bool)

(declare-fun res!94641 () Bool)

(assert (=> b!199224 (=> (not res!94641) (not e!130788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8777 (_ BitVec 32)) Bool)

(assert (=> b!199224 (= res!94641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199225 () Bool)

(assert (=> b!199225 (= e!130788 (not true))))

(declare-fun lt!98095 () array!8775)

(declare-datatypes ((tuple2!3650 0))(
  ( (tuple2!3651 (_1!1836 (_ BitVec 64)) (_2!1836 V!6017)) )
))
(declare-datatypes ((List!2581 0))(
  ( (Nil!2578) (Cons!2577 (h!3219 tuple2!3650) (t!7503 List!2581)) )
))
(declare-datatypes ((ListLongMap!2553 0))(
  ( (ListLongMap!2554 (toList!1292 List!2581)) )
))
(declare-fun lt!98094 () ListLongMap!2553)

(declare-fun zeroValue!615 () V!6017)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6017)

(declare-fun getCurrentListMap!862 (array!8777 array!8775 (_ BitVec 32) (_ BitVec 32) V!6017 V!6017 (_ BitVec 32) Int) ListLongMap!2553)

(assert (=> b!199225 (= lt!98094 (getCurrentListMap!862 _keys!825 lt!98095 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98093 () ListLongMap!2553)

(declare-fun lt!98096 () ListLongMap!2553)

(assert (=> b!199225 (and (= lt!98093 lt!98096) (= lt!98096 lt!98093))))

(declare-fun lt!98091 () ListLongMap!2553)

(declare-fun v!520 () V!6017)

(declare-fun +!341 (ListLongMap!2553 tuple2!3650) ListLongMap!2553)

(assert (=> b!199225 (= lt!98096 (+!341 lt!98091 (tuple2!3651 k0!843 v!520)))))

(declare-datatypes ((Unit!5934 0))(
  ( (Unit!5935) )
))
(declare-fun lt!98092 () Unit!5934)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!21 (array!8777 array!8775 (_ BitVec 32) (_ BitVec 32) V!6017 V!6017 (_ BitVec 32) (_ BitVec 64) V!6017 (_ BitVec 32) Int) Unit!5934)

(assert (=> b!199225 (= lt!98092 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!21 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!272 (array!8777 array!8775 (_ BitVec 32) (_ BitVec 32) V!6017 V!6017 (_ BitVec 32) Int) ListLongMap!2553)

(assert (=> b!199225 (= lt!98093 (getCurrentListMapNoExtraKeys!272 _keys!825 lt!98095 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199225 (= lt!98095 (array!8776 (store (arr!4137 _values!649) i!601 (ValueCellFull!2045 v!520)) (size!4463 _values!649)))))

(assert (=> b!199225 (= lt!98091 (getCurrentListMapNoExtraKeys!272 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199226 () Bool)

(declare-fun res!94644 () Bool)

(assert (=> b!199226 (=> (not res!94644) (not e!130788))))

(assert (=> b!199226 (= res!94644 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4464 _keys!825))))))

(assert (= (and start!20266 res!94646) b!199223))

(assert (= (and b!199223 res!94645) b!199224))

(assert (= (and b!199224 res!94641) b!199221))

(assert (= (and b!199221 res!94640) b!199226))

(assert (= (and b!199226 res!94644) b!199217))

(assert (= (and b!199217 res!94643) b!199219))

(assert (= (and b!199219 res!94642) b!199225))

(assert (= (and b!199218 condMapEmpty!8234) mapIsEmpty!8234))

(assert (= (and b!199218 (not condMapEmpty!8234)) mapNonEmpty!8234))

(get-info :version)

(assert (= (and mapNonEmpty!8234 ((_ is ValueCellFull!2045) mapValue!8234)) b!199220))

(assert (= (and b!199218 ((_ is ValueCellFull!2045) mapDefault!8234)) b!199222))

(assert (= start!20266 b!199218))

(declare-fun m!225219 () Bool)

(assert (=> b!199219 m!225219))

(declare-fun m!225221 () Bool)

(assert (=> b!199217 m!225221))

(declare-fun m!225223 () Bool)

(assert (=> mapNonEmpty!8234 m!225223))

(declare-fun m!225225 () Bool)

(assert (=> b!199225 m!225225))

(declare-fun m!225227 () Bool)

(assert (=> b!199225 m!225227))

(declare-fun m!225229 () Bool)

(assert (=> b!199225 m!225229))

(declare-fun m!225231 () Bool)

(assert (=> b!199225 m!225231))

(declare-fun m!225233 () Bool)

(assert (=> b!199225 m!225233))

(declare-fun m!225235 () Bool)

(assert (=> b!199225 m!225235))

(declare-fun m!225237 () Bool)

(assert (=> b!199221 m!225237))

(declare-fun m!225239 () Bool)

(assert (=> start!20266 m!225239))

(declare-fun m!225241 () Bool)

(assert (=> start!20266 m!225241))

(declare-fun m!225243 () Bool)

(assert (=> start!20266 m!225243))

(declare-fun m!225245 () Bool)

(assert (=> b!199224 m!225245))

(check-sat (not b_next!4921) (not mapNonEmpty!8234) (not b!199224) (not b!199225) b_and!11641 (not start!20266) (not b!199217) tp_is_empty!4777 (not b!199221))
(check-sat b_and!11641 (not b_next!4921))
