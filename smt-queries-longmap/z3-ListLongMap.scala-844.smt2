; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20164 () Bool)

(assert start!20164)

(declare-fun b_free!4819 () Bool)

(declare-fun b_next!4819 () Bool)

(assert (=> start!20164 (= b_free!4819 (not b_next!4819))))

(declare-fun tp!17488 () Bool)

(declare-fun b_and!11539 () Bool)

(assert (=> start!20164 (= tp!17488 b_and!11539)))

(declare-fun b!197687 () Bool)

(declare-fun e!130023 () Bool)

(declare-fun tp_is_empty!4675 () Bool)

(assert (=> b!197687 (= e!130023 tp_is_empty!4675)))

(declare-fun b!197688 () Bool)

(declare-fun res!93569 () Bool)

(declare-fun e!130020 () Bool)

(assert (=> b!197688 (=> (not res!93569) (not e!130020))))

(declare-datatypes ((array!8579 0))(
  ( (array!8580 (arr!4039 (Array (_ BitVec 32) (_ BitVec 64))) (size!4365 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8579)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197688 (= res!93569 (= (select (arr!4039 _keys!825) i!601) k0!843))))

(declare-fun b!197689 () Bool)

(declare-fun e!130021 () Bool)

(declare-fun mapRes!8081 () Bool)

(assert (=> b!197689 (= e!130021 (and e!130023 mapRes!8081))))

(declare-fun condMapEmpty!8081 () Bool)

(declare-datatypes ((V!5881 0))(
  ( (V!5882 (val!2382 Int)) )
))
(declare-datatypes ((ValueCell!1994 0))(
  ( (ValueCellFull!1994 (v!4346 V!5881)) (EmptyCell!1994) )
))
(declare-datatypes ((array!8581 0))(
  ( (array!8582 (arr!4040 (Array (_ BitVec 32) ValueCell!1994)) (size!4366 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8581)

(declare-fun mapDefault!8081 () ValueCell!1994)

(assert (=> b!197689 (= condMapEmpty!8081 (= (arr!4040 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1994)) mapDefault!8081)))))

(declare-fun b!197690 () Bool)

(assert (=> b!197690 (= e!130020 false)))

(declare-datatypes ((tuple2!3582 0))(
  ( (tuple2!3583 (_1!1802 (_ BitVec 64)) (_2!1802 V!5881)) )
))
(declare-datatypes ((List!2515 0))(
  ( (Nil!2512) (Cons!2511 (h!3153 tuple2!3582) (t!7437 List!2515)) )
))
(declare-datatypes ((ListLongMap!2485 0))(
  ( (ListLongMap!2486 (toList!1258 List!2515)) )
))
(declare-fun lt!97615 () ListLongMap!2485)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5881)

(declare-fun zeroValue!615 () V!5881)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5881)

(declare-fun getCurrentListMapNoExtraKeys!238 (array!8579 array!8581 (_ BitVec 32) (_ BitVec 32) V!5881 V!5881 (_ BitVec 32) Int) ListLongMap!2485)

(assert (=> b!197690 (= lt!97615 (getCurrentListMapNoExtraKeys!238 _keys!825 (array!8582 (store (arr!4040 _values!649) i!601 (ValueCellFull!1994 v!520)) (size!4366 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97616 () ListLongMap!2485)

(assert (=> b!197690 (= lt!97616 (getCurrentListMapNoExtraKeys!238 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197691 () Bool)

(declare-fun res!93570 () Bool)

(assert (=> b!197691 (=> (not res!93570) (not e!130020))))

(declare-datatypes ((List!2516 0))(
  ( (Nil!2513) (Cons!2512 (h!3154 (_ BitVec 64)) (t!7438 List!2516)) )
))
(declare-fun arrayNoDuplicates!0 (array!8579 (_ BitVec 32) List!2516) Bool)

(assert (=> b!197691 (= res!93570 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2513))))

(declare-fun b!197692 () Bool)

(declare-fun res!93575 () Bool)

(assert (=> b!197692 (=> (not res!93575) (not e!130020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197692 (= res!93575 (validKeyInArray!0 k0!843))))

(declare-fun res!93572 () Bool)

(assert (=> start!20164 (=> (not res!93572) (not e!130020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20164 (= res!93572 (validMask!0 mask!1149))))

(assert (=> start!20164 e!130020))

(declare-fun array_inv!2631 (array!8581) Bool)

(assert (=> start!20164 (and (array_inv!2631 _values!649) e!130021)))

(assert (=> start!20164 true))

(assert (=> start!20164 tp_is_empty!4675))

(declare-fun array_inv!2632 (array!8579) Bool)

(assert (=> start!20164 (array_inv!2632 _keys!825)))

(assert (=> start!20164 tp!17488))

(declare-fun b!197693 () Bool)

(declare-fun res!93573 () Bool)

(assert (=> b!197693 (=> (not res!93573) (not e!130020))))

(assert (=> b!197693 (= res!93573 (and (= (size!4366 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4365 _keys!825) (size!4366 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8081 () Bool)

(assert (=> mapIsEmpty!8081 mapRes!8081))

(declare-fun mapNonEmpty!8081 () Bool)

(declare-fun tp!17489 () Bool)

(declare-fun e!130019 () Bool)

(assert (=> mapNonEmpty!8081 (= mapRes!8081 (and tp!17489 e!130019))))

(declare-fun mapKey!8081 () (_ BitVec 32))

(declare-fun mapValue!8081 () ValueCell!1994)

(declare-fun mapRest!8081 () (Array (_ BitVec 32) ValueCell!1994))

(assert (=> mapNonEmpty!8081 (= (arr!4040 _values!649) (store mapRest!8081 mapKey!8081 mapValue!8081))))

(declare-fun b!197694 () Bool)

(declare-fun res!93574 () Bool)

(assert (=> b!197694 (=> (not res!93574) (not e!130020))))

(assert (=> b!197694 (= res!93574 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4365 _keys!825))))))

(declare-fun b!197695 () Bool)

(declare-fun res!93571 () Bool)

(assert (=> b!197695 (=> (not res!93571) (not e!130020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8579 (_ BitVec 32)) Bool)

(assert (=> b!197695 (= res!93571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197696 () Bool)

(assert (=> b!197696 (= e!130019 tp_is_empty!4675)))

(assert (= (and start!20164 res!93572) b!197693))

(assert (= (and b!197693 res!93573) b!197695))

(assert (= (and b!197695 res!93571) b!197691))

(assert (= (and b!197691 res!93570) b!197694))

(assert (= (and b!197694 res!93574) b!197692))

(assert (= (and b!197692 res!93575) b!197688))

(assert (= (and b!197688 res!93569) b!197690))

(assert (= (and b!197689 condMapEmpty!8081) mapIsEmpty!8081))

(assert (= (and b!197689 (not condMapEmpty!8081)) mapNonEmpty!8081))

(get-info :version)

(assert (= (and mapNonEmpty!8081 ((_ is ValueCellFull!1994) mapValue!8081)) b!197696))

(assert (= (and b!197689 ((_ is ValueCellFull!1994) mapDefault!8081)) b!197687))

(assert (= start!20164 b!197689))

(declare-fun m!223989 () Bool)

(assert (=> b!197690 m!223989))

(declare-fun m!223991 () Bool)

(assert (=> b!197690 m!223991))

(declare-fun m!223993 () Bool)

(assert (=> b!197690 m!223993))

(declare-fun m!223995 () Bool)

(assert (=> mapNonEmpty!8081 m!223995))

(declare-fun m!223997 () Bool)

(assert (=> b!197688 m!223997))

(declare-fun m!223999 () Bool)

(assert (=> start!20164 m!223999))

(declare-fun m!224001 () Bool)

(assert (=> start!20164 m!224001))

(declare-fun m!224003 () Bool)

(assert (=> start!20164 m!224003))

(declare-fun m!224005 () Bool)

(assert (=> b!197692 m!224005))

(declare-fun m!224007 () Bool)

(assert (=> b!197691 m!224007))

(declare-fun m!224009 () Bool)

(assert (=> b!197695 m!224009))

(check-sat (not start!20164) (not b!197695) (not b!197691) (not mapNonEmpty!8081) (not b_next!4819) (not b!197690) tp_is_empty!4675 (not b!197692) b_and!11539)
(check-sat b_and!11539 (not b_next!4819))
