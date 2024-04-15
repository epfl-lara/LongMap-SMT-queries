; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20302 () Bool)

(assert start!20302)

(declare-fun b_free!4957 () Bool)

(declare-fun b_next!4957 () Bool)

(assert (=> start!20302 (= b_free!4957 (not b_next!4957))))

(declare-fun tp!17902 () Bool)

(declare-fun b_and!11677 () Bool)

(assert (=> start!20302 (= tp!17902 b_and!11677)))

(declare-fun b!199757 () Bool)

(declare-fun res!95018 () Bool)

(declare-fun e!131054 () Bool)

(assert (=> b!199757 (=> (not res!95018) (not e!131054))))

(declare-datatypes ((array!8847 0))(
  ( (array!8848 (arr!4173 (Array (_ BitVec 32) (_ BitVec 64))) (size!4499 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8847)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199757 (= res!95018 (= (select (arr!4173 _keys!825) i!601) k0!843))))

(declare-fun b!199758 () Bool)

(declare-fun res!95019 () Bool)

(assert (=> b!199758 (=> (not res!95019) (not e!131054))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8847 (_ BitVec 32)) Bool)

(assert (=> b!199758 (= res!95019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199760 () Bool)

(assert (=> b!199760 (= e!131054 (not true))))

(declare-datatypes ((V!6065 0))(
  ( (V!6066 (val!2451 Int)) )
))
(declare-datatypes ((tuple2!3676 0))(
  ( (tuple2!3677 (_1!1849 (_ BitVec 64)) (_2!1849 V!6065)) )
))
(declare-datatypes ((List!2604 0))(
  ( (Nil!2601) (Cons!2600 (h!3242 tuple2!3676) (t!7526 List!2604)) )
))
(declare-datatypes ((ListLongMap!2579 0))(
  ( (ListLongMap!2580 (toList!1305 List!2604)) )
))
(declare-fun lt!98418 () ListLongMap!2579)

(declare-datatypes ((ValueCell!2063 0))(
  ( (ValueCellFull!2063 (v!4415 V!6065)) (EmptyCell!2063) )
))
(declare-datatypes ((array!8849 0))(
  ( (array!8850 (arr!4174 (Array (_ BitVec 32) ValueCell!2063)) (size!4500 (_ BitVec 32))) )
))
(declare-fun lt!98417 () array!8849)

(declare-fun zeroValue!615 () V!6065)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6065)

(declare-fun getCurrentListMap!875 (array!8847 array!8849 (_ BitVec 32) (_ BitVec 32) V!6065 V!6065 (_ BitVec 32) Int) ListLongMap!2579)

(assert (=> b!199760 (= lt!98418 (getCurrentListMap!875 _keys!825 lt!98417 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98420 () ListLongMap!2579)

(declare-fun lt!98416 () ListLongMap!2579)

(assert (=> b!199760 (and (= lt!98420 lt!98416) (= lt!98416 lt!98420))))

(declare-fun v!520 () V!6065)

(declare-fun lt!98415 () ListLongMap!2579)

(declare-fun +!354 (ListLongMap!2579 tuple2!3676) ListLongMap!2579)

(assert (=> b!199760 (= lt!98416 (+!354 lt!98415 (tuple2!3677 k0!843 v!520)))))

(declare-datatypes ((Unit!5960 0))(
  ( (Unit!5961) )
))
(declare-fun lt!98419 () Unit!5960)

(declare-fun _values!649 () array!8849)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!34 (array!8847 array!8849 (_ BitVec 32) (_ BitVec 32) V!6065 V!6065 (_ BitVec 32) (_ BitVec 64) V!6065 (_ BitVec 32) Int) Unit!5960)

(assert (=> b!199760 (= lt!98419 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!34 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!285 (array!8847 array!8849 (_ BitVec 32) (_ BitVec 32) V!6065 V!6065 (_ BitVec 32) Int) ListLongMap!2579)

(assert (=> b!199760 (= lt!98420 (getCurrentListMapNoExtraKeys!285 _keys!825 lt!98417 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199760 (= lt!98417 (array!8850 (store (arr!4174 _values!649) i!601 (ValueCellFull!2063 v!520)) (size!4500 _values!649)))))

(assert (=> b!199760 (= lt!98415 (getCurrentListMapNoExtraKeys!285 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199761 () Bool)

(declare-fun res!95021 () Bool)

(assert (=> b!199761 (=> (not res!95021) (not e!131054))))

(declare-datatypes ((List!2605 0))(
  ( (Nil!2602) (Cons!2601 (h!3243 (_ BitVec 64)) (t!7527 List!2605)) )
))
(declare-fun arrayNoDuplicates!0 (array!8847 (_ BitVec 32) List!2605) Bool)

(assert (=> b!199761 (= res!95021 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2602))))

(declare-fun b!199762 () Bool)

(declare-fun e!131056 () Bool)

(declare-fun tp_is_empty!4813 () Bool)

(assert (=> b!199762 (= e!131056 tp_is_empty!4813)))

(declare-fun b!199763 () Bool)

(declare-fun res!95022 () Bool)

(assert (=> b!199763 (=> (not res!95022) (not e!131054))))

(assert (=> b!199763 (= res!95022 (and (= (size!4500 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4499 _keys!825) (size!4500 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199764 () Bool)

(declare-fun e!131057 () Bool)

(declare-fun e!131055 () Bool)

(declare-fun mapRes!8288 () Bool)

(assert (=> b!199764 (= e!131057 (and e!131055 mapRes!8288))))

(declare-fun condMapEmpty!8288 () Bool)

(declare-fun mapDefault!8288 () ValueCell!2063)

(assert (=> b!199764 (= condMapEmpty!8288 (= (arr!4174 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2063)) mapDefault!8288)))))

(declare-fun mapIsEmpty!8288 () Bool)

(assert (=> mapIsEmpty!8288 mapRes!8288))

(declare-fun mapNonEmpty!8288 () Bool)

(declare-fun tp!17903 () Bool)

(assert (=> mapNonEmpty!8288 (= mapRes!8288 (and tp!17903 e!131056))))

(declare-fun mapKey!8288 () (_ BitVec 32))

(declare-fun mapRest!8288 () (Array (_ BitVec 32) ValueCell!2063))

(declare-fun mapValue!8288 () ValueCell!2063)

(assert (=> mapNonEmpty!8288 (= (arr!4174 _values!649) (store mapRest!8288 mapKey!8288 mapValue!8288))))

(declare-fun b!199759 () Bool)

(assert (=> b!199759 (= e!131055 tp_is_empty!4813)))

(declare-fun res!95023 () Bool)

(assert (=> start!20302 (=> (not res!95023) (not e!131054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20302 (= res!95023 (validMask!0 mask!1149))))

(assert (=> start!20302 e!131054))

(declare-fun array_inv!2723 (array!8849) Bool)

(assert (=> start!20302 (and (array_inv!2723 _values!649) e!131057)))

(assert (=> start!20302 true))

(assert (=> start!20302 tp_is_empty!4813))

(declare-fun array_inv!2724 (array!8847) Bool)

(assert (=> start!20302 (array_inv!2724 _keys!825)))

(assert (=> start!20302 tp!17902))

(declare-fun b!199765 () Bool)

(declare-fun res!95024 () Bool)

(assert (=> b!199765 (=> (not res!95024) (not e!131054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199765 (= res!95024 (validKeyInArray!0 k0!843))))

(declare-fun b!199766 () Bool)

(declare-fun res!95020 () Bool)

(assert (=> b!199766 (=> (not res!95020) (not e!131054))))

(assert (=> b!199766 (= res!95020 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4499 _keys!825))))))

(assert (= (and start!20302 res!95023) b!199763))

(assert (= (and b!199763 res!95022) b!199758))

(assert (= (and b!199758 res!95019) b!199761))

(assert (= (and b!199761 res!95021) b!199766))

(assert (= (and b!199766 res!95020) b!199765))

(assert (= (and b!199765 res!95024) b!199757))

(assert (= (and b!199757 res!95018) b!199760))

(assert (= (and b!199764 condMapEmpty!8288) mapIsEmpty!8288))

(assert (= (and b!199764 (not condMapEmpty!8288)) mapNonEmpty!8288))

(get-info :version)

(assert (= (and mapNonEmpty!8288 ((_ is ValueCellFull!2063) mapValue!8288)) b!199762))

(assert (= (and b!199764 ((_ is ValueCellFull!2063) mapDefault!8288)) b!199759))

(assert (= start!20302 b!199764))

(declare-fun m!225723 () Bool)

(assert (=> b!199758 m!225723))

(declare-fun m!225725 () Bool)

(assert (=> mapNonEmpty!8288 m!225725))

(declare-fun m!225727 () Bool)

(assert (=> b!199760 m!225727))

(declare-fun m!225729 () Bool)

(assert (=> b!199760 m!225729))

(declare-fun m!225731 () Bool)

(assert (=> b!199760 m!225731))

(declare-fun m!225733 () Bool)

(assert (=> b!199760 m!225733))

(declare-fun m!225735 () Bool)

(assert (=> b!199760 m!225735))

(declare-fun m!225737 () Bool)

(assert (=> b!199760 m!225737))

(declare-fun m!225739 () Bool)

(assert (=> start!20302 m!225739))

(declare-fun m!225741 () Bool)

(assert (=> start!20302 m!225741))

(declare-fun m!225743 () Bool)

(assert (=> start!20302 m!225743))

(declare-fun m!225745 () Bool)

(assert (=> b!199765 m!225745))

(declare-fun m!225747 () Bool)

(assert (=> b!199757 m!225747))

(declare-fun m!225749 () Bool)

(assert (=> b!199761 m!225749))

(check-sat (not b!199765) (not b!199758) (not b_next!4957) (not b!199760) tp_is_empty!4813 (not mapNonEmpty!8288) (not b!199761) (not start!20302) b_and!11677)
(check-sat b_and!11677 (not b_next!4957))
