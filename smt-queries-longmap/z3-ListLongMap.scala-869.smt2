; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20314 () Bool)

(assert start!20314)

(declare-fun b_free!4969 () Bool)

(declare-fun b_next!4969 () Bool)

(assert (=> start!20314 (= b_free!4969 (not b_next!4969))))

(declare-fun tp!17938 () Bool)

(declare-fun b_and!11729 () Bool)

(assert (=> start!20314 (= tp!17938 b_and!11729)))

(declare-fun b!200131 () Bool)

(declare-fun e!131269 () Bool)

(declare-fun e!131271 () Bool)

(declare-fun mapRes!8306 () Bool)

(assert (=> b!200131 (= e!131269 (and e!131271 mapRes!8306))))

(declare-fun condMapEmpty!8306 () Bool)

(declare-datatypes ((V!6081 0))(
  ( (V!6082 (val!2457 Int)) )
))
(declare-datatypes ((ValueCell!2069 0))(
  ( (ValueCellFull!2069 (v!4428 V!6081)) (EmptyCell!2069) )
))
(declare-datatypes ((array!8877 0))(
  ( (array!8878 (arr!4189 (Array (_ BitVec 32) ValueCell!2069)) (size!4514 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8877)

(declare-fun mapDefault!8306 () ValueCell!2069)

(assert (=> b!200131 (= condMapEmpty!8306 (= (arr!4189 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2069)) mapDefault!8306)))))

(declare-fun b!200132 () Bool)

(declare-fun res!95262 () Bool)

(declare-fun e!131272 () Bool)

(assert (=> b!200132 (=> (not res!95262) (not e!131272))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8879 0))(
  ( (array!8880 (arr!4190 (Array (_ BitVec 32) (_ BitVec 64))) (size!4515 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8879)

(assert (=> b!200132 (= res!95262 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4515 _keys!825))))))

(declare-fun b!200133 () Bool)

(assert (=> b!200133 (= e!131272 (not (bvsle #b00000000000000000000000000000000 (size!4515 _keys!825))))))

(declare-datatypes ((tuple2!3650 0))(
  ( (tuple2!3651 (_1!1836 (_ BitVec 64)) (_2!1836 V!6081)) )
))
(declare-datatypes ((List!2571 0))(
  ( (Nil!2568) (Cons!2567 (h!3209 tuple2!3650) (t!7494 List!2571)) )
))
(declare-datatypes ((ListLongMap!2565 0))(
  ( (ListLongMap!2566 (toList!1298 List!2571)) )
))
(declare-fun lt!98763 () ListLongMap!2565)

(declare-fun lt!98765 () array!8877)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6081)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6081)

(declare-fun getCurrentListMap!895 (array!8879 array!8877 (_ BitVec 32) (_ BitVec 32) V!6081 V!6081 (_ BitVec 32) Int) ListLongMap!2565)

(assert (=> b!200133 (= lt!98763 (getCurrentListMap!895 _keys!825 lt!98765 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98768 () ListLongMap!2565)

(declare-fun lt!98766 () ListLongMap!2565)

(assert (=> b!200133 (and (= lt!98768 lt!98766) (= lt!98766 lt!98768))))

(declare-fun lt!98767 () ListLongMap!2565)

(declare-fun v!520 () V!6081)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!352 (ListLongMap!2565 tuple2!3650) ListLongMap!2565)

(assert (=> b!200133 (= lt!98766 (+!352 lt!98767 (tuple2!3651 k0!843 v!520)))))

(declare-datatypes ((Unit!5990 0))(
  ( (Unit!5991) )
))
(declare-fun lt!98764 () Unit!5990)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!31 (array!8879 array!8877 (_ BitVec 32) (_ BitVec 32) V!6081 V!6081 (_ BitVec 32) (_ BitVec 64) V!6081 (_ BitVec 32) Int) Unit!5990)

(assert (=> b!200133 (= lt!98764 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!31 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!288 (array!8879 array!8877 (_ BitVec 32) (_ BitVec 32) V!6081 V!6081 (_ BitVec 32) Int) ListLongMap!2565)

(assert (=> b!200133 (= lt!98768 (getCurrentListMapNoExtraKeys!288 _keys!825 lt!98765 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200133 (= lt!98765 (array!8878 (store (arr!4189 _values!649) i!601 (ValueCellFull!2069 v!520)) (size!4514 _values!649)))))

(assert (=> b!200133 (= lt!98767 (getCurrentListMapNoExtraKeys!288 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200135 () Bool)

(declare-fun res!95261 () Bool)

(assert (=> b!200135 (=> (not res!95261) (not e!131272))))

(assert (=> b!200135 (= res!95261 (= (select (arr!4190 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8306 () Bool)

(declare-fun tp!17939 () Bool)

(declare-fun e!131273 () Bool)

(assert (=> mapNonEmpty!8306 (= mapRes!8306 (and tp!17939 e!131273))))

(declare-fun mapValue!8306 () ValueCell!2069)

(declare-fun mapRest!8306 () (Array (_ BitVec 32) ValueCell!2069))

(declare-fun mapKey!8306 () (_ BitVec 32))

(assert (=> mapNonEmpty!8306 (= (arr!4189 _values!649) (store mapRest!8306 mapKey!8306 mapValue!8306))))

(declare-fun b!200136 () Bool)

(declare-fun tp_is_empty!4825 () Bool)

(assert (=> b!200136 (= e!131273 tp_is_empty!4825)))

(declare-fun b!200137 () Bool)

(declare-fun res!95263 () Bool)

(assert (=> b!200137 (=> (not res!95263) (not e!131272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8879 (_ BitVec 32)) Bool)

(assert (=> b!200137 (= res!95263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200138 () Bool)

(assert (=> b!200138 (= e!131271 tp_is_empty!4825)))

(declare-fun b!200139 () Bool)

(declare-fun res!95264 () Bool)

(assert (=> b!200139 (=> (not res!95264) (not e!131272))))

(assert (=> b!200139 (= res!95264 (and (= (size!4514 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4515 _keys!825) (size!4514 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200140 () Bool)

(declare-fun res!95266 () Bool)

(assert (=> b!200140 (=> (not res!95266) (not e!131272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200140 (= res!95266 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8306 () Bool)

(assert (=> mapIsEmpty!8306 mapRes!8306))

(declare-fun b!200134 () Bool)

(declare-fun res!95265 () Bool)

(assert (=> b!200134 (=> (not res!95265) (not e!131272))))

(declare-datatypes ((List!2572 0))(
  ( (Nil!2569) (Cons!2568 (h!3210 (_ BitVec 64)) (t!7495 List!2572)) )
))
(declare-fun arrayNoDuplicates!0 (array!8879 (_ BitVec 32) List!2572) Bool)

(assert (=> b!200134 (= res!95265 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2569))))

(declare-fun res!95260 () Bool)

(assert (=> start!20314 (=> (not res!95260) (not e!131272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20314 (= res!95260 (validMask!0 mask!1149))))

(assert (=> start!20314 e!131272))

(declare-fun array_inv!2733 (array!8877) Bool)

(assert (=> start!20314 (and (array_inv!2733 _values!649) e!131269)))

(assert (=> start!20314 true))

(assert (=> start!20314 tp_is_empty!4825))

(declare-fun array_inv!2734 (array!8879) Bool)

(assert (=> start!20314 (array_inv!2734 _keys!825)))

(assert (=> start!20314 tp!17938))

(assert (= (and start!20314 res!95260) b!200139))

(assert (= (and b!200139 res!95264) b!200137))

(assert (= (and b!200137 res!95263) b!200134))

(assert (= (and b!200134 res!95265) b!200132))

(assert (= (and b!200132 res!95262) b!200140))

(assert (= (and b!200140 res!95266) b!200135))

(assert (= (and b!200135 res!95261) b!200133))

(assert (= (and b!200131 condMapEmpty!8306) mapIsEmpty!8306))

(assert (= (and b!200131 (not condMapEmpty!8306)) mapNonEmpty!8306))

(get-info :version)

(assert (= (and mapNonEmpty!8306 ((_ is ValueCellFull!2069) mapValue!8306)) b!200136))

(assert (= (and b!200131 ((_ is ValueCellFull!2069) mapDefault!8306)) b!200138))

(assert (= start!20314 b!200131))

(declare-fun m!226689 () Bool)

(assert (=> b!200134 m!226689))

(declare-fun m!226691 () Bool)

(assert (=> b!200135 m!226691))

(declare-fun m!226693 () Bool)

(assert (=> b!200133 m!226693))

(declare-fun m!226695 () Bool)

(assert (=> b!200133 m!226695))

(declare-fun m!226697 () Bool)

(assert (=> b!200133 m!226697))

(declare-fun m!226699 () Bool)

(assert (=> b!200133 m!226699))

(declare-fun m!226701 () Bool)

(assert (=> b!200133 m!226701))

(declare-fun m!226703 () Bool)

(assert (=> b!200133 m!226703))

(declare-fun m!226705 () Bool)

(assert (=> b!200140 m!226705))

(declare-fun m!226707 () Bool)

(assert (=> b!200137 m!226707))

(declare-fun m!226709 () Bool)

(assert (=> start!20314 m!226709))

(declare-fun m!226711 () Bool)

(assert (=> start!20314 m!226711))

(declare-fun m!226713 () Bool)

(assert (=> start!20314 m!226713))

(declare-fun m!226715 () Bool)

(assert (=> mapNonEmpty!8306 m!226715))

(check-sat (not b_next!4969) (not b!200134) (not b!200133) (not b!200140) (not b!200137) b_and!11729 (not mapNonEmpty!8306) tp_is_empty!4825 (not start!20314))
(check-sat b_and!11729 (not b_next!4969))
