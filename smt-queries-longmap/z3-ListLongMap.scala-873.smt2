; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20338 () Bool)

(assert start!20338)

(declare-fun b_free!4993 () Bool)

(declare-fun b_next!4993 () Bool)

(assert (=> start!20338 (= b_free!4993 (not b_next!4993))))

(declare-fun tp!18010 () Bool)

(declare-fun b_and!11753 () Bool)

(assert (=> start!20338 (= tp!18010 b_and!11753)))

(declare-fun b!200549 () Bool)

(declare-fun res!95576 () Bool)

(declare-fun e!131499 () Bool)

(assert (=> b!200549 (=> (not res!95576) (not e!131499))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8923 0))(
  ( (array!8924 (arr!4212 (Array (_ BitVec 32) (_ BitVec 64))) (size!4537 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8923)

(assert (=> b!200549 (= res!95576 (= (select (arr!4212 _keys!825) i!601) k0!843))))

(declare-fun b!200550 () Bool)

(declare-fun e!131504 () Bool)

(declare-fun tp_is_empty!4849 () Bool)

(assert (=> b!200550 (= e!131504 tp_is_empty!4849)))

(declare-fun b!200551 () Bool)

(declare-fun e!131501 () Bool)

(assert (=> b!200551 (= e!131501 tp_is_empty!4849)))

(declare-fun b!200552 () Bool)

(declare-fun res!95574 () Bool)

(assert (=> b!200552 (=> (not res!95574) (not e!131499))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6113 0))(
  ( (V!6114 (val!2469 Int)) )
))
(declare-datatypes ((ValueCell!2081 0))(
  ( (ValueCellFull!2081 (v!4440 V!6113)) (EmptyCell!2081) )
))
(declare-datatypes ((array!8925 0))(
  ( (array!8926 (arr!4213 (Array (_ BitVec 32) ValueCell!2081)) (size!4538 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8925)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200552 (= res!95574 (and (= (size!4538 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4537 _keys!825) (size!4538 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8342 () Bool)

(declare-fun mapRes!8342 () Bool)

(assert (=> mapIsEmpty!8342 mapRes!8342))

(declare-fun b!200553 () Bool)

(declare-fun res!95573 () Bool)

(assert (=> b!200553 (=> (not res!95573) (not e!131499))))

(declare-datatypes ((List!2587 0))(
  ( (Nil!2584) (Cons!2583 (h!3225 (_ BitVec 64)) (t!7510 List!2587)) )
))
(declare-fun arrayNoDuplicates!0 (array!8923 (_ BitVec 32) List!2587) Bool)

(assert (=> b!200553 (= res!95573 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2584))))

(declare-fun b!200554 () Bool)

(declare-fun res!95571 () Bool)

(assert (=> b!200554 (=> (not res!95571) (not e!131499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8923 (_ BitVec 32)) Bool)

(assert (=> b!200554 (= res!95571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200555 () Bool)

(declare-fun res!95575 () Bool)

(assert (=> b!200555 (=> (not res!95575) (not e!131499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200555 (= res!95575 (validKeyInArray!0 k0!843))))

(declare-fun res!95578 () Bool)

(assert (=> start!20338 (=> (not res!95578) (not e!131499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20338 (= res!95578 (validMask!0 mask!1149))))

(assert (=> start!20338 e!131499))

(declare-fun e!131498 () Bool)

(declare-fun array_inv!2749 (array!8925) Bool)

(assert (=> start!20338 (and (array_inv!2749 _values!649) e!131498)))

(assert (=> start!20338 true))

(assert (=> start!20338 tp_is_empty!4849))

(declare-fun array_inv!2750 (array!8923) Bool)

(assert (=> start!20338 (array_inv!2750 _keys!825)))

(assert (=> start!20338 tp!18010))

(declare-fun b!200556 () Bool)

(declare-fun e!131500 () Bool)

(assert (=> b!200556 (= e!131499 (not e!131500))))

(declare-fun res!95570 () Bool)

(assert (=> b!200556 (=> res!95570 e!131500)))

(assert (=> b!200556 (= res!95570 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3668 0))(
  ( (tuple2!3669 (_1!1845 (_ BitVec 64)) (_2!1845 V!6113)) )
))
(declare-datatypes ((List!2588 0))(
  ( (Nil!2585) (Cons!2584 (h!3226 tuple2!3668) (t!7511 List!2588)) )
))
(declare-datatypes ((ListLongMap!2583 0))(
  ( (ListLongMap!2584 (toList!1307 List!2588)) )
))
(declare-fun lt!99185 () ListLongMap!2583)

(declare-fun zeroValue!615 () V!6113)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6113)

(declare-fun getCurrentListMap!902 (array!8923 array!8925 (_ BitVec 32) (_ BitVec 32) V!6113 V!6113 (_ BitVec 32) Int) ListLongMap!2583)

(assert (=> b!200556 (= lt!99185 (getCurrentListMap!902 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99186 () ListLongMap!2583)

(declare-fun lt!99181 () array!8925)

(assert (=> b!200556 (= lt!99186 (getCurrentListMap!902 _keys!825 lt!99181 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99183 () ListLongMap!2583)

(declare-fun lt!99194 () ListLongMap!2583)

(assert (=> b!200556 (and (= lt!99183 lt!99194) (= lt!99194 lt!99183))))

(declare-fun lt!99193 () ListLongMap!2583)

(declare-fun lt!99188 () tuple2!3668)

(declare-fun +!361 (ListLongMap!2583 tuple2!3668) ListLongMap!2583)

(assert (=> b!200556 (= lt!99194 (+!361 lt!99193 lt!99188))))

(declare-fun v!520 () V!6113)

(assert (=> b!200556 (= lt!99188 (tuple2!3669 k0!843 v!520))))

(declare-datatypes ((Unit!6006 0))(
  ( (Unit!6007) )
))
(declare-fun lt!99179 () Unit!6006)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!38 (array!8923 array!8925 (_ BitVec 32) (_ BitVec 32) V!6113 V!6113 (_ BitVec 32) (_ BitVec 64) V!6113 (_ BitVec 32) Int) Unit!6006)

(assert (=> b!200556 (= lt!99179 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!38 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!295 (array!8923 array!8925 (_ BitVec 32) (_ BitVec 32) V!6113 V!6113 (_ BitVec 32) Int) ListLongMap!2583)

(assert (=> b!200556 (= lt!99183 (getCurrentListMapNoExtraKeys!295 _keys!825 lt!99181 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200556 (= lt!99181 (array!8926 (store (arr!4213 _values!649) i!601 (ValueCellFull!2081 v!520)) (size!4538 _values!649)))))

(assert (=> b!200556 (= lt!99193 (getCurrentListMapNoExtraKeys!295 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8342 () Bool)

(declare-fun tp!18011 () Bool)

(assert (=> mapNonEmpty!8342 (= mapRes!8342 (and tp!18011 e!131504))))

(declare-fun mapValue!8342 () ValueCell!2081)

(declare-fun mapKey!8342 () (_ BitVec 32))

(declare-fun mapRest!8342 () (Array (_ BitVec 32) ValueCell!2081))

(assert (=> mapNonEmpty!8342 (= (arr!4213 _values!649) (store mapRest!8342 mapKey!8342 mapValue!8342))))

(declare-fun b!200557 () Bool)

(declare-fun res!95572 () Bool)

(assert (=> b!200557 (=> (not res!95572) (not e!131499))))

(assert (=> b!200557 (= res!95572 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4537 _keys!825))))))

(declare-fun b!200558 () Bool)

(declare-fun e!131502 () Bool)

(assert (=> b!200558 (= e!131502 true)))

(declare-fun lt!99191 () ListLongMap!2583)

(declare-fun lt!99184 () ListLongMap!2583)

(declare-fun lt!99182 () tuple2!3668)

(assert (=> b!200558 (= (+!361 lt!99184 lt!99182) (+!361 lt!99191 lt!99188))))

(declare-fun lt!99190 () Unit!6006)

(declare-fun lt!99187 () ListLongMap!2583)

(declare-fun addCommutativeForDiffKeys!88 (ListLongMap!2583 (_ BitVec 64) V!6113 (_ BitVec 64) V!6113) Unit!6006)

(assert (=> b!200558 (= lt!99190 (addCommutativeForDiffKeys!88 lt!99187 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200559 () Bool)

(assert (=> b!200559 (= e!131500 e!131502)))

(declare-fun res!95577 () Bool)

(assert (=> b!200559 (=> res!95577 e!131502)))

(assert (=> b!200559 (= res!95577 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99180 () ListLongMap!2583)

(assert (=> b!200559 (= lt!99180 lt!99184)))

(assert (=> b!200559 (= lt!99184 (+!361 lt!99187 lt!99188))))

(declare-fun lt!99192 () Unit!6006)

(assert (=> b!200559 (= lt!99192 (addCommutativeForDiffKeys!88 lt!99193 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!200559 (= lt!99186 (+!361 lt!99180 lt!99182))))

(declare-fun lt!99189 () tuple2!3668)

(assert (=> b!200559 (= lt!99180 (+!361 lt!99194 lt!99189))))

(assert (=> b!200559 (= lt!99185 lt!99191)))

(assert (=> b!200559 (= lt!99191 (+!361 lt!99187 lt!99182))))

(assert (=> b!200559 (= lt!99187 (+!361 lt!99193 lt!99189))))

(assert (=> b!200559 (= lt!99186 (+!361 (+!361 lt!99183 lt!99189) lt!99182))))

(assert (=> b!200559 (= lt!99182 (tuple2!3669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200559 (= lt!99189 (tuple2!3669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200560 () Bool)

(assert (=> b!200560 (= e!131498 (and e!131501 mapRes!8342))))

(declare-fun condMapEmpty!8342 () Bool)

(declare-fun mapDefault!8342 () ValueCell!2081)

(assert (=> b!200560 (= condMapEmpty!8342 (= (arr!4213 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2081)) mapDefault!8342)))))

(assert (= (and start!20338 res!95578) b!200552))

(assert (= (and b!200552 res!95574) b!200554))

(assert (= (and b!200554 res!95571) b!200553))

(assert (= (and b!200553 res!95573) b!200557))

(assert (= (and b!200557 res!95572) b!200555))

(assert (= (and b!200555 res!95575) b!200549))

(assert (= (and b!200549 res!95576) b!200556))

(assert (= (and b!200556 (not res!95570)) b!200559))

(assert (= (and b!200559 (not res!95577)) b!200558))

(assert (= (and b!200560 condMapEmpty!8342) mapIsEmpty!8342))

(assert (= (and b!200560 (not condMapEmpty!8342)) mapNonEmpty!8342))

(get-info :version)

(assert (= (and mapNonEmpty!8342 ((_ is ValueCellFull!2081) mapValue!8342)) b!200550))

(assert (= (and b!200560 ((_ is ValueCellFull!2081) mapDefault!8342)) b!200551))

(assert (= start!20338 b!200560))

(declare-fun m!227193 () Bool)

(assert (=> b!200559 m!227193))

(declare-fun m!227195 () Bool)

(assert (=> b!200559 m!227195))

(declare-fun m!227197 () Bool)

(assert (=> b!200559 m!227197))

(declare-fun m!227199 () Bool)

(assert (=> b!200559 m!227199))

(declare-fun m!227201 () Bool)

(assert (=> b!200559 m!227201))

(declare-fun m!227203 () Bool)

(assert (=> b!200559 m!227203))

(declare-fun m!227205 () Bool)

(assert (=> b!200559 m!227205))

(declare-fun m!227207 () Bool)

(assert (=> b!200559 m!227207))

(assert (=> b!200559 m!227201))

(declare-fun m!227209 () Bool)

(assert (=> start!20338 m!227209))

(declare-fun m!227211 () Bool)

(assert (=> start!20338 m!227211))

(declare-fun m!227213 () Bool)

(assert (=> start!20338 m!227213))

(declare-fun m!227215 () Bool)

(assert (=> b!200558 m!227215))

(declare-fun m!227217 () Bool)

(assert (=> b!200558 m!227217))

(declare-fun m!227219 () Bool)

(assert (=> b!200558 m!227219))

(declare-fun m!227221 () Bool)

(assert (=> b!200555 m!227221))

(declare-fun m!227223 () Bool)

(assert (=> mapNonEmpty!8342 m!227223))

(declare-fun m!227225 () Bool)

(assert (=> b!200549 m!227225))

(declare-fun m!227227 () Bool)

(assert (=> b!200554 m!227227))

(declare-fun m!227229 () Bool)

(assert (=> b!200556 m!227229))

(declare-fun m!227231 () Bool)

(assert (=> b!200556 m!227231))

(declare-fun m!227233 () Bool)

(assert (=> b!200556 m!227233))

(declare-fun m!227235 () Bool)

(assert (=> b!200556 m!227235))

(declare-fun m!227237 () Bool)

(assert (=> b!200556 m!227237))

(declare-fun m!227239 () Bool)

(assert (=> b!200556 m!227239))

(declare-fun m!227241 () Bool)

(assert (=> b!200556 m!227241))

(declare-fun m!227243 () Bool)

(assert (=> b!200553 m!227243))

(check-sat (not b!200556) (not mapNonEmpty!8342) (not b!200554) (not b!200558) (not b!200555) b_and!11753 (not start!20338) (not b!200559) (not b_next!4993) (not b!200553) tp_is_empty!4849)
(check-sat b_and!11753 (not b_next!4993))
