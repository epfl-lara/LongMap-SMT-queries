; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20210 () Bool)

(assert start!20210)

(declare-fun b_free!4869 () Bool)

(declare-fun b_next!4869 () Bool)

(assert (=> start!20210 (= b_free!4869 (not b_next!4869))))

(declare-fun tp!17638 () Bool)

(declare-fun b_and!11615 () Bool)

(assert (=> start!20210 (= tp!17638 b_and!11615)))

(declare-fun b!198584 () Bool)

(declare-fun e!130496 () Bool)

(assert (=> b!198584 (= e!130496 (not true))))

(declare-datatypes ((V!5947 0))(
  ( (V!5948 (val!2407 Int)) )
))
(declare-datatypes ((tuple2!3650 0))(
  ( (tuple2!3651 (_1!1836 (_ BitVec 64)) (_2!1836 V!5947)) )
))
(declare-datatypes ((List!2564 0))(
  ( (Nil!2561) (Cons!2560 (h!3202 tuple2!3650) (t!7495 List!2564)) )
))
(declare-datatypes ((ListLongMap!2563 0))(
  ( (ListLongMap!2564 (toList!1297 List!2564)) )
))
(declare-fun lt!97956 () ListLongMap!2563)

(declare-fun lt!97959 () ListLongMap!2563)

(assert (=> b!198584 (and (= lt!97956 lt!97959) (= lt!97959 lt!97956))))

(declare-fun v!520 () V!5947)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!97957 () ListLongMap!2563)

(declare-fun +!324 (ListLongMap!2563 tuple2!3650) ListLongMap!2563)

(assert (=> b!198584 (= lt!97959 (+!324 lt!97957 (tuple2!3651 k0!843 v!520)))))

(declare-datatypes ((ValueCell!2019 0))(
  ( (ValueCellFull!2019 (v!4377 V!5947)) (EmptyCell!2019) )
))
(declare-datatypes ((array!8697 0))(
  ( (array!8698 (arr!4099 (Array (_ BitVec 32) ValueCell!2019)) (size!4424 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8697)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5947)

(declare-datatypes ((array!8699 0))(
  ( (array!8700 (arr!4100 (Array (_ BitVec 32) (_ BitVec 64))) (size!4425 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8699)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((Unit!5950 0))(
  ( (Unit!5951) )
))
(declare-fun lt!97958 () Unit!5950)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5947)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!1 (array!8699 array!8697 (_ BitVec 32) (_ BitVec 32) V!5947 V!5947 (_ BitVec 32) (_ BitVec 64) V!5947 (_ BitVec 32) Int) Unit!5950)

(assert (=> b!198584 (= lt!97958 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!1 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!262 (array!8699 array!8697 (_ BitVec 32) (_ BitVec 32) V!5947 V!5947 (_ BitVec 32) Int) ListLongMap!2563)

(assert (=> b!198584 (= lt!97956 (getCurrentListMapNoExtraKeys!262 _keys!825 (array!8698 (store (arr!4099 _values!649) i!601 (ValueCellFull!2019 v!520)) (size!4424 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198584 (= lt!97957 (getCurrentListMapNoExtraKeys!262 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!94195 () Bool)

(assert (=> start!20210 (=> (not res!94195) (not e!130496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20210 (= res!94195 (validMask!0 mask!1149))))

(assert (=> start!20210 e!130496))

(declare-fun e!130497 () Bool)

(declare-fun array_inv!2685 (array!8697) Bool)

(assert (=> start!20210 (and (array_inv!2685 _values!649) e!130497)))

(assert (=> start!20210 true))

(declare-fun tp_is_empty!4725 () Bool)

(assert (=> start!20210 tp_is_empty!4725))

(declare-fun array_inv!2686 (array!8699) Bool)

(assert (=> start!20210 (array_inv!2686 _keys!825)))

(assert (=> start!20210 tp!17638))

(declare-fun b!198585 () Bool)

(declare-fun e!130495 () Bool)

(declare-fun mapRes!8156 () Bool)

(assert (=> b!198585 (= e!130497 (and e!130495 mapRes!8156))))

(declare-fun condMapEmpty!8156 () Bool)

(declare-fun mapDefault!8156 () ValueCell!2019)

(assert (=> b!198585 (= condMapEmpty!8156 (= (arr!4099 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2019)) mapDefault!8156)))))

(declare-fun b!198586 () Bool)

(declare-fun res!94189 () Bool)

(assert (=> b!198586 (=> (not res!94189) (not e!130496))))

(assert (=> b!198586 (= res!94189 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4425 _keys!825))))))

(declare-fun b!198587 () Bool)

(declare-fun res!94190 () Bool)

(assert (=> b!198587 (=> (not res!94190) (not e!130496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198587 (= res!94190 (validKeyInArray!0 k0!843))))

(declare-fun b!198588 () Bool)

(declare-fun res!94194 () Bool)

(assert (=> b!198588 (=> (not res!94194) (not e!130496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8699 (_ BitVec 32)) Bool)

(assert (=> b!198588 (= res!94194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8156 () Bool)

(declare-fun tp!17639 () Bool)

(declare-fun e!130498 () Bool)

(assert (=> mapNonEmpty!8156 (= mapRes!8156 (and tp!17639 e!130498))))

(declare-fun mapValue!8156 () ValueCell!2019)

(declare-fun mapRest!8156 () (Array (_ BitVec 32) ValueCell!2019))

(declare-fun mapKey!8156 () (_ BitVec 32))

(assert (=> mapNonEmpty!8156 (= (arr!4099 _values!649) (store mapRest!8156 mapKey!8156 mapValue!8156))))

(declare-fun b!198589 () Bool)

(assert (=> b!198589 (= e!130495 tp_is_empty!4725)))

(declare-fun b!198590 () Bool)

(declare-fun res!94193 () Bool)

(assert (=> b!198590 (=> (not res!94193) (not e!130496))))

(declare-datatypes ((List!2565 0))(
  ( (Nil!2562) (Cons!2561 (h!3203 (_ BitVec 64)) (t!7496 List!2565)) )
))
(declare-fun arrayNoDuplicates!0 (array!8699 (_ BitVec 32) List!2565) Bool)

(assert (=> b!198590 (= res!94193 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2562))))

(declare-fun b!198591 () Bool)

(assert (=> b!198591 (= e!130498 tp_is_empty!4725)))

(declare-fun mapIsEmpty!8156 () Bool)

(assert (=> mapIsEmpty!8156 mapRes!8156))

(declare-fun b!198592 () Bool)

(declare-fun res!94192 () Bool)

(assert (=> b!198592 (=> (not res!94192) (not e!130496))))

(assert (=> b!198592 (= res!94192 (= (select (arr!4100 _keys!825) i!601) k0!843))))

(declare-fun b!198593 () Bool)

(declare-fun res!94191 () Bool)

(assert (=> b!198593 (=> (not res!94191) (not e!130496))))

(assert (=> b!198593 (= res!94191 (and (= (size!4424 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4425 _keys!825) (size!4424 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20210 res!94195) b!198593))

(assert (= (and b!198593 res!94191) b!198588))

(assert (= (and b!198588 res!94194) b!198590))

(assert (= (and b!198590 res!94193) b!198586))

(assert (= (and b!198586 res!94189) b!198587))

(assert (= (and b!198587 res!94190) b!198592))

(assert (= (and b!198592 res!94192) b!198584))

(assert (= (and b!198585 condMapEmpty!8156) mapIsEmpty!8156))

(assert (= (and b!198585 (not condMapEmpty!8156)) mapNonEmpty!8156))

(get-info :version)

(assert (= (and mapNonEmpty!8156 ((_ is ValueCellFull!2019) mapValue!8156)) b!198591))

(assert (= (and b!198585 ((_ is ValueCellFull!2019) mapDefault!8156)) b!198589))

(assert (= start!20210 b!198585))

(declare-fun m!225159 () Bool)

(assert (=> start!20210 m!225159))

(declare-fun m!225161 () Bool)

(assert (=> start!20210 m!225161))

(declare-fun m!225163 () Bool)

(assert (=> start!20210 m!225163))

(declare-fun m!225165 () Bool)

(assert (=> b!198592 m!225165))

(declare-fun m!225167 () Bool)

(assert (=> b!198587 m!225167))

(declare-fun m!225169 () Bool)

(assert (=> mapNonEmpty!8156 m!225169))

(declare-fun m!225171 () Bool)

(assert (=> b!198584 m!225171))

(declare-fun m!225173 () Bool)

(assert (=> b!198584 m!225173))

(declare-fun m!225175 () Bool)

(assert (=> b!198584 m!225175))

(declare-fun m!225177 () Bool)

(assert (=> b!198584 m!225177))

(declare-fun m!225179 () Bool)

(assert (=> b!198584 m!225179))

(declare-fun m!225181 () Bool)

(assert (=> b!198588 m!225181))

(declare-fun m!225183 () Bool)

(assert (=> b!198590 m!225183))

(check-sat (not start!20210) (not b!198587) (not b!198590) (not b!198584) tp_is_empty!4725 (not b_next!4869) (not b!198588) b_and!11615 (not mapNonEmpty!8156))
(check-sat b_and!11615 (not b_next!4869))
