; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33652 () Bool)

(assert start!33652)

(declare-fun b_free!6901 () Bool)

(declare-fun b_next!6901 () Bool)

(assert (=> start!33652 (= b_free!6901 (not b_next!6901))))

(declare-fun tp!24206 () Bool)

(declare-fun b_and!14055 () Bool)

(assert (=> start!33652 (= tp!24206 b_and!14055)))

(declare-fun mapIsEmpty!11676 () Bool)

(declare-fun mapRes!11676 () Bool)

(assert (=> mapIsEmpty!11676 mapRes!11676))

(declare-fun b!334096 () Bool)

(declare-fun e!205086 () Bool)

(declare-fun tp_is_empty!6853 () Bool)

(assert (=> b!334096 (= e!205086 tp_is_empty!6853)))

(declare-fun res!184201 () Bool)

(declare-fun e!205085 () Bool)

(assert (=> start!33652 (=> (not res!184201) (not e!205085))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33652 (= res!184201 (validMask!0 mask!2385))))

(assert (=> start!33652 e!205085))

(assert (=> start!33652 true))

(assert (=> start!33652 tp_is_empty!6853))

(assert (=> start!33652 tp!24206))

(declare-datatypes ((V!10115 0))(
  ( (V!10116 (val!3471 Int)) )
))
(declare-datatypes ((ValueCell!3083 0))(
  ( (ValueCellFull!3083 (v!5627 V!10115)) (EmptyCell!3083) )
))
(declare-datatypes ((array!17279 0))(
  ( (array!17280 (arr!8170 (Array (_ BitVec 32) ValueCell!3083)) (size!8523 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17279)

(declare-fun e!205084 () Bool)

(declare-fun array_inv!6094 (array!17279) Bool)

(assert (=> start!33652 (and (array_inv!6094 _values!1525) e!205084)))

(declare-datatypes ((array!17281 0))(
  ( (array!17282 (arr!8171 (Array (_ BitVec 32) (_ BitVec 64))) (size!8524 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17281)

(declare-fun array_inv!6095 (array!17281) Bool)

(assert (=> start!33652 (array_inv!6095 _keys!1895)))

(declare-fun b!334097 () Bool)

(declare-fun res!184195 () Bool)

(assert (=> b!334097 (=> (not res!184195) (not e!205085))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334097 (= res!184195 (and (= (size!8523 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8524 _keys!1895) (size!8523 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334098 () Bool)

(declare-fun res!184202 () Bool)

(assert (=> b!334098 (=> (not res!184202) (not e!205085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17281 (_ BitVec 32)) Bool)

(assert (=> b!334098 (= res!184202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334099 () Bool)

(declare-fun e!205083 () Bool)

(assert (=> b!334099 (= e!205083 tp_is_empty!6853)))

(declare-fun b!334100 () Bool)

(assert (=> b!334100 (= e!205084 (and e!205086 mapRes!11676))))

(declare-fun condMapEmpty!11676 () Bool)

(declare-fun mapDefault!11676 () ValueCell!3083)

(assert (=> b!334100 (= condMapEmpty!11676 (= (arr!8170 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3083)) mapDefault!11676)))))

(declare-fun b!334101 () Bool)

(declare-fun res!184197 () Bool)

(assert (=> b!334101 (=> (not res!184197) (not e!205085))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10115)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10115)

(declare-datatypes ((tuple2!4986 0))(
  ( (tuple2!4987 (_1!2504 (_ BitVec 64)) (_2!2504 V!10115)) )
))
(declare-datatypes ((List!4626 0))(
  ( (Nil!4623) (Cons!4622 (h!5478 tuple2!4986) (t!9705 List!4626)) )
))
(declare-datatypes ((ListLongMap!3889 0))(
  ( (ListLongMap!3890 (toList!1960 List!4626)) )
))
(declare-fun contains!2015 (ListLongMap!3889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1469 (array!17281 array!17279 (_ BitVec 32) (_ BitVec 32) V!10115 V!10115 (_ BitVec 32) Int) ListLongMap!3889)

(assert (=> b!334101 (= res!184197 (not (contains!2015 (getCurrentListMap!1469 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334102 () Bool)

(declare-fun e!205087 () Bool)

(assert (=> b!334102 (= e!205087 (not true))))

(declare-fun arrayContainsKey!0 (array!17281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334102 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10378 0))(
  ( (Unit!10379) )
))
(declare-fun lt!159275 () Unit!10378)

(declare-datatypes ((SeekEntryResult!3158 0))(
  ( (MissingZero!3158 (index!14811 (_ BitVec 32))) (Found!3158 (index!14812 (_ BitVec 32))) (Intermediate!3158 (undefined!3970 Bool) (index!14813 (_ BitVec 32)) (x!33311 (_ BitVec 32))) (Undefined!3158) (MissingVacant!3158 (index!14814 (_ BitVec 32))) )
))
(declare-fun lt!159276 () SeekEntryResult!3158)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17281 (_ BitVec 64) (_ BitVec 32)) Unit!10378)

(assert (=> b!334102 (= lt!159275 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14812 lt!159276)))))

(declare-fun mapNonEmpty!11676 () Bool)

(declare-fun tp!24207 () Bool)

(assert (=> mapNonEmpty!11676 (= mapRes!11676 (and tp!24207 e!205083))))

(declare-fun mapKey!11676 () (_ BitVec 32))

(declare-fun mapValue!11676 () ValueCell!3083)

(declare-fun mapRest!11676 () (Array (_ BitVec 32) ValueCell!3083))

(assert (=> mapNonEmpty!11676 (= (arr!8170 _values!1525) (store mapRest!11676 mapKey!11676 mapValue!11676))))

(declare-fun b!334103 () Bool)

(declare-fun res!184199 () Bool)

(assert (=> b!334103 (=> (not res!184199) (not e!205085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334103 (= res!184199 (validKeyInArray!0 k0!1348))))

(declare-fun b!334104 () Bool)

(declare-fun res!184200 () Bool)

(assert (=> b!334104 (=> (not res!184200) (not e!205087))))

(assert (=> b!334104 (= res!184200 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14812 lt!159276)))))

(declare-fun b!334105 () Bool)

(assert (=> b!334105 (= e!205085 e!205087)))

(declare-fun res!184198 () Bool)

(assert (=> b!334105 (=> (not res!184198) (not e!205087))))

(get-info :version)

(assert (=> b!334105 (= res!184198 (and ((_ is Found!3158) lt!159276) (= (select (arr!8171 _keys!1895) (index!14812 lt!159276)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17281 (_ BitVec 32)) SeekEntryResult!3158)

(assert (=> b!334105 (= lt!159276 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334106 () Bool)

(declare-fun res!184196 () Bool)

(assert (=> b!334106 (=> (not res!184196) (not e!205085))))

(declare-datatypes ((List!4627 0))(
  ( (Nil!4624) (Cons!4623 (h!5479 (_ BitVec 64)) (t!9706 List!4627)) )
))
(declare-fun arrayNoDuplicates!0 (array!17281 (_ BitVec 32) List!4627) Bool)

(assert (=> b!334106 (= res!184196 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4624))))

(assert (= (and start!33652 res!184201) b!334097))

(assert (= (and b!334097 res!184195) b!334098))

(assert (= (and b!334098 res!184202) b!334106))

(assert (= (and b!334106 res!184196) b!334103))

(assert (= (and b!334103 res!184199) b!334101))

(assert (= (and b!334101 res!184197) b!334105))

(assert (= (and b!334105 res!184198) b!334104))

(assert (= (and b!334104 res!184200) b!334102))

(assert (= (and b!334100 condMapEmpty!11676) mapIsEmpty!11676))

(assert (= (and b!334100 (not condMapEmpty!11676)) mapNonEmpty!11676))

(assert (= (and mapNonEmpty!11676 ((_ is ValueCellFull!3083) mapValue!11676)) b!334099))

(assert (= (and b!334100 ((_ is ValueCellFull!3083) mapDefault!11676)) b!334096))

(assert (= start!33652 b!334100))

(declare-fun m!337715 () Bool)

(assert (=> b!334101 m!337715))

(assert (=> b!334101 m!337715))

(declare-fun m!337717 () Bool)

(assert (=> b!334101 m!337717))

(declare-fun m!337719 () Bool)

(assert (=> b!334106 m!337719))

(declare-fun m!337721 () Bool)

(assert (=> b!334103 m!337721))

(declare-fun m!337723 () Bool)

(assert (=> b!334105 m!337723))

(declare-fun m!337725 () Bool)

(assert (=> b!334105 m!337725))

(declare-fun m!337727 () Bool)

(assert (=> b!334098 m!337727))

(declare-fun m!337729 () Bool)

(assert (=> start!33652 m!337729))

(declare-fun m!337731 () Bool)

(assert (=> start!33652 m!337731))

(declare-fun m!337733 () Bool)

(assert (=> start!33652 m!337733))

(declare-fun m!337735 () Bool)

(assert (=> b!334102 m!337735))

(declare-fun m!337737 () Bool)

(assert (=> b!334102 m!337737))

(declare-fun m!337739 () Bool)

(assert (=> b!334104 m!337739))

(declare-fun m!337741 () Bool)

(assert (=> mapNonEmpty!11676 m!337741))

(check-sat (not b!334105) (not b!334104) (not b_next!6901) (not b!334101) (not b!334102) b_and!14055 (not b!334106) tp_is_empty!6853 (not mapNonEmpty!11676) (not b!334103) (not start!33652) (not b!334098))
(check-sat b_and!14055 (not b_next!6901))
