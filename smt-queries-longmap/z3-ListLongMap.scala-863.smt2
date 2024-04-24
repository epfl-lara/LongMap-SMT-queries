; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20278 () Bool)

(assert start!20278)

(declare-fun b_free!4933 () Bool)

(declare-fun b_next!4933 () Bool)

(assert (=> start!20278 (= b_free!4933 (not b_next!4933))))

(declare-fun tp!17831 () Bool)

(declare-fun b_and!11693 () Bool)

(assert (=> start!20278 (= tp!17831 b_and!11693)))

(declare-fun b!199591 () Bool)

(declare-fun e!131000 () Bool)

(declare-fun tp_is_empty!4789 () Bool)

(assert (=> b!199591 (= e!131000 tp_is_empty!4789)))

(declare-fun mapIsEmpty!8252 () Bool)

(declare-fun mapRes!8252 () Bool)

(assert (=> mapIsEmpty!8252 mapRes!8252))

(declare-fun b!199592 () Bool)

(declare-fun res!94882 () Bool)

(declare-fun e!130999 () Bool)

(assert (=> b!199592 (=> (not res!94882) (not e!130999))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199592 (= res!94882 (validKeyInArray!0 k0!843))))

(declare-fun b!199593 () Bool)

(declare-fun res!94884 () Bool)

(assert (=> b!199593 (=> (not res!94884) (not e!130999))))

(declare-datatypes ((array!8807 0))(
  ( (array!8808 (arr!4154 (Array (_ BitVec 32) (_ BitVec 64))) (size!4479 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8807)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8807 (_ BitVec 32)) Bool)

(assert (=> b!199593 (= res!94884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199594 () Bool)

(declare-fun res!94885 () Bool)

(assert (=> b!199594 (=> (not res!94885) (not e!130999))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6033 0))(
  ( (V!6034 (val!2439 Int)) )
))
(declare-datatypes ((ValueCell!2051 0))(
  ( (ValueCellFull!2051 (v!4410 V!6033)) (EmptyCell!2051) )
))
(declare-datatypes ((array!8809 0))(
  ( (array!8810 (arr!4155 (Array (_ BitVec 32) ValueCell!2051)) (size!4480 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8809)

(assert (=> b!199594 (= res!94885 (and (= (size!4480 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4479 _keys!825) (size!4480 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199595 () Bool)

(declare-fun res!94888 () Bool)

(assert (=> b!199595 (=> (not res!94888) (not e!130999))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199595 (= res!94888 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4479 _keys!825))))))

(declare-fun mapNonEmpty!8252 () Bool)

(declare-fun tp!17830 () Bool)

(assert (=> mapNonEmpty!8252 (= mapRes!8252 (and tp!17830 e!131000))))

(declare-fun mapRest!8252 () (Array (_ BitVec 32) ValueCell!2051))

(declare-fun mapKey!8252 () (_ BitVec 32))

(declare-fun mapValue!8252 () ValueCell!2051)

(assert (=> mapNonEmpty!8252 (= (arr!4155 _values!649) (store mapRest!8252 mapKey!8252 mapValue!8252))))

(declare-fun b!199596 () Bool)

(assert (=> b!199596 (= e!130999 (not true))))

(declare-fun lt!98441 () array!8809)

(declare-datatypes ((tuple2!3630 0))(
  ( (tuple2!3631 (_1!1826 (_ BitVec 64)) (_2!1826 V!6033)) )
))
(declare-datatypes ((List!2550 0))(
  ( (Nil!2547) (Cons!2546 (h!3188 tuple2!3630) (t!7473 List!2550)) )
))
(declare-datatypes ((ListLongMap!2545 0))(
  ( (ListLongMap!2546 (toList!1288 List!2550)) )
))
(declare-fun lt!98442 () ListLongMap!2545)

(declare-fun zeroValue!615 () V!6033)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6033)

(declare-fun getCurrentListMap!885 (array!8807 array!8809 (_ BitVec 32) (_ BitVec 32) V!6033 V!6033 (_ BitVec 32) Int) ListLongMap!2545)

(assert (=> b!199596 (= lt!98442 (getCurrentListMap!885 _keys!825 lt!98441 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98439 () ListLongMap!2545)

(declare-fun lt!98444 () ListLongMap!2545)

(assert (=> b!199596 (and (= lt!98439 lt!98444) (= lt!98444 lt!98439))))

(declare-fun lt!98443 () ListLongMap!2545)

(declare-fun v!520 () V!6033)

(declare-fun +!342 (ListLongMap!2545 tuple2!3630) ListLongMap!2545)

(assert (=> b!199596 (= lt!98444 (+!342 lt!98443 (tuple2!3631 k0!843 v!520)))))

(declare-datatypes ((Unit!5970 0))(
  ( (Unit!5971) )
))
(declare-fun lt!98440 () Unit!5970)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!21 (array!8807 array!8809 (_ BitVec 32) (_ BitVec 32) V!6033 V!6033 (_ BitVec 32) (_ BitVec 64) V!6033 (_ BitVec 32) Int) Unit!5970)

(assert (=> b!199596 (= lt!98440 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!21 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!278 (array!8807 array!8809 (_ BitVec 32) (_ BitVec 32) V!6033 V!6033 (_ BitVec 32) Int) ListLongMap!2545)

(assert (=> b!199596 (= lt!98439 (getCurrentListMapNoExtraKeys!278 _keys!825 lt!98441 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199596 (= lt!98441 (array!8810 (store (arr!4155 _values!649) i!601 (ValueCellFull!2051 v!520)) (size!4480 _values!649)))))

(assert (=> b!199596 (= lt!98443 (getCurrentListMapNoExtraKeys!278 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199597 () Bool)

(declare-fun e!131001 () Bool)

(declare-fun e!131003 () Bool)

(assert (=> b!199597 (= e!131001 (and e!131003 mapRes!8252))))

(declare-fun condMapEmpty!8252 () Bool)

(declare-fun mapDefault!8252 () ValueCell!2051)

(assert (=> b!199597 (= condMapEmpty!8252 (= (arr!4155 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2051)) mapDefault!8252)))))

(declare-fun b!199598 () Bool)

(declare-fun res!94883 () Bool)

(assert (=> b!199598 (=> (not res!94883) (not e!130999))))

(declare-datatypes ((List!2551 0))(
  ( (Nil!2548) (Cons!2547 (h!3189 (_ BitVec 64)) (t!7474 List!2551)) )
))
(declare-fun arrayNoDuplicates!0 (array!8807 (_ BitVec 32) List!2551) Bool)

(assert (=> b!199598 (= res!94883 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2548))))

(declare-fun res!94887 () Bool)

(assert (=> start!20278 (=> (not res!94887) (not e!130999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20278 (= res!94887 (validMask!0 mask!1149))))

(assert (=> start!20278 e!130999))

(declare-fun array_inv!2709 (array!8809) Bool)

(assert (=> start!20278 (and (array_inv!2709 _values!649) e!131001)))

(assert (=> start!20278 true))

(assert (=> start!20278 tp_is_empty!4789))

(declare-fun array_inv!2710 (array!8807) Bool)

(assert (=> start!20278 (array_inv!2710 _keys!825)))

(assert (=> start!20278 tp!17831))

(declare-fun b!199599 () Bool)

(assert (=> b!199599 (= e!131003 tp_is_empty!4789)))

(declare-fun b!199600 () Bool)

(declare-fun res!94886 () Bool)

(assert (=> b!199600 (=> (not res!94886) (not e!130999))))

(assert (=> b!199600 (= res!94886 (= (select (arr!4154 _keys!825) i!601) k0!843))))

(assert (= (and start!20278 res!94887) b!199594))

(assert (= (and b!199594 res!94885) b!199593))

(assert (= (and b!199593 res!94884) b!199598))

(assert (= (and b!199598 res!94883) b!199595))

(assert (= (and b!199595 res!94888) b!199592))

(assert (= (and b!199592 res!94882) b!199600))

(assert (= (and b!199600 res!94886) b!199596))

(assert (= (and b!199597 condMapEmpty!8252) mapIsEmpty!8252))

(assert (= (and b!199597 (not condMapEmpty!8252)) mapNonEmpty!8252))

(get-info :version)

(assert (= (and mapNonEmpty!8252 ((_ is ValueCellFull!2051) mapValue!8252)) b!199591))

(assert (= (and b!199597 ((_ is ValueCellFull!2051) mapDefault!8252)) b!199599))

(assert (= start!20278 b!199597))

(declare-fun m!226185 () Bool)

(assert (=> b!199596 m!226185))

(declare-fun m!226187 () Bool)

(assert (=> b!199596 m!226187))

(declare-fun m!226189 () Bool)

(assert (=> b!199596 m!226189))

(declare-fun m!226191 () Bool)

(assert (=> b!199596 m!226191))

(declare-fun m!226193 () Bool)

(assert (=> b!199596 m!226193))

(declare-fun m!226195 () Bool)

(assert (=> b!199596 m!226195))

(declare-fun m!226197 () Bool)

(assert (=> b!199592 m!226197))

(declare-fun m!226199 () Bool)

(assert (=> start!20278 m!226199))

(declare-fun m!226201 () Bool)

(assert (=> start!20278 m!226201))

(declare-fun m!226203 () Bool)

(assert (=> start!20278 m!226203))

(declare-fun m!226205 () Bool)

(assert (=> mapNonEmpty!8252 m!226205))

(declare-fun m!226207 () Bool)

(assert (=> b!199600 m!226207))

(declare-fun m!226209 () Bool)

(assert (=> b!199598 m!226209))

(declare-fun m!226211 () Bool)

(assert (=> b!199593 m!226211))

(check-sat (not b_next!4933) (not b!199592) (not mapNonEmpty!8252) (not b!199596) (not start!20278) (not b!199593) tp_is_empty!4789 (not b!199598) b_and!11693)
(check-sat b_and!11693 (not b_next!4933))
