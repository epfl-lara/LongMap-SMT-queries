; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20168 () Bool)

(assert start!20168)

(declare-fun b_free!4827 () Bool)

(declare-fun b_next!4827 () Bool)

(assert (=> start!20168 (= b_free!4827 (not b_next!4827))))

(declare-fun tp!17513 () Bool)

(declare-fun b_and!11573 () Bool)

(assert (=> start!20168 (= tp!17513 b_and!11573)))

(declare-fun b!197954 () Bool)

(declare-fun res!93753 () Bool)

(declare-fun e!130182 () Bool)

(assert (=> b!197954 (=> (not res!93753) (not e!130182))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197954 (= res!93753 (validKeyInArray!0 k0!843))))

(declare-fun b!197955 () Bool)

(declare-fun res!93751 () Bool)

(assert (=> b!197955 (=> (not res!93751) (not e!130182))))

(declare-datatypes ((array!8617 0))(
  ( (array!8618 (arr!4059 (Array (_ BitVec 32) (_ BitVec 64))) (size!4384 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8617)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197955 (= res!93751 (= (select (arr!4059 _keys!825) i!601) k0!843))))

(declare-fun b!197956 () Bool)

(declare-fun e!130184 () Bool)

(declare-fun tp_is_empty!4683 () Bool)

(assert (=> b!197956 (= e!130184 tp_is_empty!4683)))

(declare-fun b!197957 () Bool)

(declare-fun res!93754 () Bool)

(assert (=> b!197957 (=> (not res!93754) (not e!130182))))

(assert (=> b!197957 (= res!93754 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4384 _keys!825))))))

(declare-fun mapIsEmpty!8093 () Bool)

(declare-fun mapRes!8093 () Bool)

(assert (=> mapIsEmpty!8093 mapRes!8093))

(declare-fun res!93752 () Bool)

(assert (=> start!20168 (=> (not res!93752) (not e!130182))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20168 (= res!93752 (validMask!0 mask!1149))))

(assert (=> start!20168 e!130182))

(declare-datatypes ((V!5891 0))(
  ( (V!5892 (val!2386 Int)) )
))
(declare-datatypes ((ValueCell!1998 0))(
  ( (ValueCellFull!1998 (v!4356 V!5891)) (EmptyCell!1998) )
))
(declare-datatypes ((array!8619 0))(
  ( (array!8620 (arr!4060 (Array (_ BitVec 32) ValueCell!1998)) (size!4385 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8619)

(declare-fun e!130183 () Bool)

(declare-fun array_inv!2653 (array!8619) Bool)

(assert (=> start!20168 (and (array_inv!2653 _values!649) e!130183)))

(assert (=> start!20168 true))

(assert (=> start!20168 tp_is_empty!4683))

(declare-fun array_inv!2654 (array!8617) Bool)

(assert (=> start!20168 (array_inv!2654 _keys!825)))

(assert (=> start!20168 tp!17513))

(declare-fun b!197958 () Bool)

(declare-fun e!130181 () Bool)

(assert (=> b!197958 (= e!130181 tp_is_empty!4683)))

(declare-fun b!197959 () Bool)

(assert (=> b!197959 (= e!130183 (and e!130184 mapRes!8093))))

(declare-fun condMapEmpty!8093 () Bool)

(declare-fun mapDefault!8093 () ValueCell!1998)

(assert (=> b!197959 (= condMapEmpty!8093 (= (arr!4060 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1998)) mapDefault!8093)))))

(declare-fun b!197960 () Bool)

(declare-fun res!93750 () Bool)

(assert (=> b!197960 (=> (not res!93750) (not e!130182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8617 (_ BitVec 32)) Bool)

(assert (=> b!197960 (= res!93750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197961 () Bool)

(declare-fun res!93749 () Bool)

(assert (=> b!197961 (=> (not res!93749) (not e!130182))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197961 (= res!93749 (and (= (size!4385 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4384 _keys!825) (size!4385 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197962 () Bool)

(assert (=> b!197962 (= e!130182 false)))

(declare-datatypes ((tuple2!3620 0))(
  ( (tuple2!3621 (_1!1821 (_ BitVec 64)) (_2!1821 V!5891)) )
))
(declare-datatypes ((List!2534 0))(
  ( (Nil!2531) (Cons!2530 (h!3172 tuple2!3620) (t!7465 List!2534)) )
))
(declare-datatypes ((ListLongMap!2533 0))(
  ( (ListLongMap!2534 (toList!1282 List!2534)) )
))
(declare-fun lt!97821 () ListLongMap!2533)

(declare-fun v!520 () V!5891)

(declare-fun zeroValue!615 () V!5891)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5891)

(declare-fun getCurrentListMapNoExtraKeys!247 (array!8617 array!8619 (_ BitVec 32) (_ BitVec 32) V!5891 V!5891 (_ BitVec 32) Int) ListLongMap!2533)

(assert (=> b!197962 (= lt!97821 (getCurrentListMapNoExtraKeys!247 _keys!825 (array!8620 (store (arr!4060 _values!649) i!601 (ValueCellFull!1998 v!520)) (size!4385 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97820 () ListLongMap!2533)

(assert (=> b!197962 (= lt!97820 (getCurrentListMapNoExtraKeys!247 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8093 () Bool)

(declare-fun tp!17512 () Bool)

(assert (=> mapNonEmpty!8093 (= mapRes!8093 (and tp!17512 e!130181))))

(declare-fun mapRest!8093 () (Array (_ BitVec 32) ValueCell!1998))

(declare-fun mapValue!8093 () ValueCell!1998)

(declare-fun mapKey!8093 () (_ BitVec 32))

(assert (=> mapNonEmpty!8093 (= (arr!4060 _values!649) (store mapRest!8093 mapKey!8093 mapValue!8093))))

(declare-fun b!197963 () Bool)

(declare-fun res!93748 () Bool)

(assert (=> b!197963 (=> (not res!93748) (not e!130182))))

(declare-datatypes ((List!2535 0))(
  ( (Nil!2532) (Cons!2531 (h!3173 (_ BitVec 64)) (t!7466 List!2535)) )
))
(declare-fun arrayNoDuplicates!0 (array!8617 (_ BitVec 32) List!2535) Bool)

(assert (=> b!197963 (= res!93748 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2532))))

(assert (= (and start!20168 res!93752) b!197961))

(assert (= (and b!197961 res!93749) b!197960))

(assert (= (and b!197960 res!93750) b!197963))

(assert (= (and b!197963 res!93748) b!197957))

(assert (= (and b!197957 res!93754) b!197954))

(assert (= (and b!197954 res!93753) b!197955))

(assert (= (and b!197955 res!93751) b!197962))

(assert (= (and b!197959 condMapEmpty!8093) mapIsEmpty!8093))

(assert (= (and b!197959 (not condMapEmpty!8093)) mapNonEmpty!8093))

(get-info :version)

(assert (= (and mapNonEmpty!8093 ((_ is ValueCellFull!1998) mapValue!8093)) b!197958))

(assert (= (and b!197959 ((_ is ValueCellFull!1998) mapDefault!8093)) b!197956))

(assert (= start!20168 b!197959))

(declare-fun m!224693 () Bool)

(assert (=> b!197960 m!224693))

(declare-fun m!224695 () Bool)

(assert (=> b!197963 m!224695))

(declare-fun m!224697 () Bool)

(assert (=> b!197955 m!224697))

(declare-fun m!224699 () Bool)

(assert (=> mapNonEmpty!8093 m!224699))

(declare-fun m!224701 () Bool)

(assert (=> start!20168 m!224701))

(declare-fun m!224703 () Bool)

(assert (=> start!20168 m!224703))

(declare-fun m!224705 () Bool)

(assert (=> start!20168 m!224705))

(declare-fun m!224707 () Bool)

(assert (=> b!197954 m!224707))

(declare-fun m!224709 () Bool)

(assert (=> b!197962 m!224709))

(declare-fun m!224711 () Bool)

(assert (=> b!197962 m!224711))

(declare-fun m!224713 () Bool)

(assert (=> b!197962 m!224713))

(check-sat (not b!197962) (not start!20168) tp_is_empty!4683 (not b!197960) (not b!197963) (not mapNonEmpty!8093) (not b!197954) b_and!11573 (not b_next!4827))
(check-sat b_and!11573 (not b_next!4827))
