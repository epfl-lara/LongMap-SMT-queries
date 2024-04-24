; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20290 () Bool)

(assert start!20290)

(declare-fun b_free!4945 () Bool)

(declare-fun b_next!4945 () Bool)

(assert (=> start!20290 (= b_free!4945 (not b_next!4945))))

(declare-fun tp!17866 () Bool)

(declare-fun b_and!11705 () Bool)

(assert (=> start!20290 (= tp!17866 b_and!11705)))

(declare-fun b!199771 () Bool)

(declare-fun e!131093 () Bool)

(declare-fun tp_is_empty!4801 () Bool)

(assert (=> b!199771 (= e!131093 tp_is_empty!4801)))

(declare-fun mapNonEmpty!8270 () Bool)

(declare-fun mapRes!8270 () Bool)

(declare-fun tp!17867 () Bool)

(assert (=> mapNonEmpty!8270 (= mapRes!8270 (and tp!17867 e!131093))))

(declare-datatypes ((V!6049 0))(
  ( (V!6050 (val!2445 Int)) )
))
(declare-datatypes ((ValueCell!2057 0))(
  ( (ValueCellFull!2057 (v!4416 V!6049)) (EmptyCell!2057) )
))
(declare-datatypes ((array!8831 0))(
  ( (array!8832 (arr!4166 (Array (_ BitVec 32) ValueCell!2057)) (size!4491 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8831)

(declare-fun mapKey!8270 () (_ BitVec 32))

(declare-fun mapRest!8270 () (Array (_ BitVec 32) ValueCell!2057))

(declare-fun mapValue!8270 () ValueCell!2057)

(assert (=> mapNonEmpty!8270 (= (arr!4166 _values!649) (store mapRest!8270 mapKey!8270 mapValue!8270))))

(declare-fun mapIsEmpty!8270 () Bool)

(assert (=> mapIsEmpty!8270 mapRes!8270))

(declare-fun b!199772 () Bool)

(declare-fun res!95008 () Bool)

(declare-fun e!131089 () Bool)

(assert (=> b!199772 (=> (not res!95008) (not e!131089))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199772 (= res!95008 (validKeyInArray!0 k0!843))))

(declare-fun b!199773 () Bool)

(assert (=> b!199773 (= e!131089 (not true))))

(declare-datatypes ((tuple2!3638 0))(
  ( (tuple2!3639 (_1!1830 (_ BitVec 64)) (_2!1830 V!6049)) )
))
(declare-datatypes ((List!2558 0))(
  ( (Nil!2555) (Cons!2554 (h!3196 tuple2!3638) (t!7481 List!2558)) )
))
(declare-datatypes ((ListLongMap!2553 0))(
  ( (ListLongMap!2554 (toList!1292 List!2558)) )
))
(declare-fun lt!98552 () ListLongMap!2553)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun lt!98548 () array!8831)

(declare-fun zeroValue!615 () V!6049)

(declare-datatypes ((array!8833 0))(
  ( (array!8834 (arr!4167 (Array (_ BitVec 32) (_ BitVec 64))) (size!4492 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8833)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6049)

(declare-fun getCurrentListMap!889 (array!8833 array!8831 (_ BitVec 32) (_ BitVec 32) V!6049 V!6049 (_ BitVec 32) Int) ListLongMap!2553)

(assert (=> b!199773 (= lt!98552 (getCurrentListMap!889 _keys!825 lt!98548 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98547 () ListLongMap!2553)

(declare-fun lt!98551 () ListLongMap!2553)

(assert (=> b!199773 (and (= lt!98547 lt!98551) (= lt!98551 lt!98547))))

(declare-fun lt!98549 () ListLongMap!2553)

(declare-fun v!520 () V!6049)

(declare-fun +!346 (ListLongMap!2553 tuple2!3638) ListLongMap!2553)

(assert (=> b!199773 (= lt!98551 (+!346 lt!98549 (tuple2!3639 k0!843 v!520)))))

(declare-datatypes ((Unit!5978 0))(
  ( (Unit!5979) )
))
(declare-fun lt!98550 () Unit!5978)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!25 (array!8833 array!8831 (_ BitVec 32) (_ BitVec 32) V!6049 V!6049 (_ BitVec 32) (_ BitVec 64) V!6049 (_ BitVec 32) Int) Unit!5978)

(assert (=> b!199773 (= lt!98550 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!25 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!282 (array!8833 array!8831 (_ BitVec 32) (_ BitVec 32) V!6049 V!6049 (_ BitVec 32) Int) ListLongMap!2553)

(assert (=> b!199773 (= lt!98547 (getCurrentListMapNoExtraKeys!282 _keys!825 lt!98548 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199773 (= lt!98548 (array!8832 (store (arr!4166 _values!649) i!601 (ValueCellFull!2057 v!520)) (size!4491 _values!649)))))

(assert (=> b!199773 (= lt!98549 (getCurrentListMapNoExtraKeys!282 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199774 () Bool)

(declare-fun e!131090 () Bool)

(declare-fun e!131092 () Bool)

(assert (=> b!199774 (= e!131090 (and e!131092 mapRes!8270))))

(declare-fun condMapEmpty!8270 () Bool)

(declare-fun mapDefault!8270 () ValueCell!2057)

(assert (=> b!199774 (= condMapEmpty!8270 (= (arr!4166 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2057)) mapDefault!8270)))))

(declare-fun b!199776 () Bool)

(declare-fun res!95011 () Bool)

(assert (=> b!199776 (=> (not res!95011) (not e!131089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8833 (_ BitVec 32)) Bool)

(assert (=> b!199776 (= res!95011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199777 () Bool)

(assert (=> b!199777 (= e!131092 tp_is_empty!4801)))

(declare-fun b!199778 () Bool)

(declare-fun res!95009 () Bool)

(assert (=> b!199778 (=> (not res!95009) (not e!131089))))

(assert (=> b!199778 (= res!95009 (and (= (size!4491 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4492 _keys!825) (size!4491 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199775 () Bool)

(declare-fun res!95010 () Bool)

(assert (=> b!199775 (=> (not res!95010) (not e!131089))))

(assert (=> b!199775 (= res!95010 (= (select (arr!4167 _keys!825) i!601) k0!843))))

(declare-fun res!95013 () Bool)

(assert (=> start!20290 (=> (not res!95013) (not e!131089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20290 (= res!95013 (validMask!0 mask!1149))))

(assert (=> start!20290 e!131089))

(declare-fun array_inv!2715 (array!8831) Bool)

(assert (=> start!20290 (and (array_inv!2715 _values!649) e!131090)))

(assert (=> start!20290 true))

(assert (=> start!20290 tp_is_empty!4801))

(declare-fun array_inv!2716 (array!8833) Bool)

(assert (=> start!20290 (array_inv!2716 _keys!825)))

(assert (=> start!20290 tp!17866))

(declare-fun b!199779 () Bool)

(declare-fun res!95012 () Bool)

(assert (=> b!199779 (=> (not res!95012) (not e!131089))))

(assert (=> b!199779 (= res!95012 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4492 _keys!825))))))

(declare-fun b!199780 () Bool)

(declare-fun res!95014 () Bool)

(assert (=> b!199780 (=> (not res!95014) (not e!131089))))

(declare-datatypes ((List!2559 0))(
  ( (Nil!2556) (Cons!2555 (h!3197 (_ BitVec 64)) (t!7482 List!2559)) )
))
(declare-fun arrayNoDuplicates!0 (array!8833 (_ BitVec 32) List!2559) Bool)

(assert (=> b!199780 (= res!95014 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2556))))

(assert (= (and start!20290 res!95013) b!199778))

(assert (= (and b!199778 res!95009) b!199776))

(assert (= (and b!199776 res!95011) b!199780))

(assert (= (and b!199780 res!95014) b!199779))

(assert (= (and b!199779 res!95012) b!199772))

(assert (= (and b!199772 res!95008) b!199775))

(assert (= (and b!199775 res!95010) b!199773))

(assert (= (and b!199774 condMapEmpty!8270) mapIsEmpty!8270))

(assert (= (and b!199774 (not condMapEmpty!8270)) mapNonEmpty!8270))

(get-info :version)

(assert (= (and mapNonEmpty!8270 ((_ is ValueCellFull!2057) mapValue!8270)) b!199771))

(assert (= (and b!199774 ((_ is ValueCellFull!2057) mapDefault!8270)) b!199777))

(assert (= start!20290 b!199774))

(declare-fun m!226353 () Bool)

(assert (=> mapNonEmpty!8270 m!226353))

(declare-fun m!226355 () Bool)

(assert (=> b!199776 m!226355))

(declare-fun m!226357 () Bool)

(assert (=> b!199780 m!226357))

(declare-fun m!226359 () Bool)

(assert (=> b!199775 m!226359))

(declare-fun m!226361 () Bool)

(assert (=> b!199773 m!226361))

(declare-fun m!226363 () Bool)

(assert (=> b!199773 m!226363))

(declare-fun m!226365 () Bool)

(assert (=> b!199773 m!226365))

(declare-fun m!226367 () Bool)

(assert (=> b!199773 m!226367))

(declare-fun m!226369 () Bool)

(assert (=> b!199773 m!226369))

(declare-fun m!226371 () Bool)

(assert (=> b!199773 m!226371))

(declare-fun m!226373 () Bool)

(assert (=> b!199772 m!226373))

(declare-fun m!226375 () Bool)

(assert (=> start!20290 m!226375))

(declare-fun m!226377 () Bool)

(assert (=> start!20290 m!226377))

(declare-fun m!226379 () Bool)

(assert (=> start!20290 m!226379))

(check-sat (not b!199773) (not b!199780) (not b!199772) b_and!11705 (not mapNonEmpty!8270) (not b_next!4945) tp_is_empty!4801 (not start!20290) (not b!199776))
(check-sat b_and!11705 (not b_next!4945))
