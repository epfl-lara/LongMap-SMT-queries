; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20114 () Bool)

(assert start!20114)

(declare-fun b_free!4773 () Bool)

(declare-fun b_next!4773 () Bool)

(assert (=> start!20114 (= b_free!4773 (not b_next!4773))))

(declare-fun tp!17350 () Bool)

(declare-fun b_and!11519 () Bool)

(assert (=> start!20114 (= tp!17350 b_and!11519)))

(declare-fun mapIsEmpty!8012 () Bool)

(declare-fun mapRes!8012 () Bool)

(assert (=> mapIsEmpty!8012 mapRes!8012))

(declare-fun b!197144 () Bool)

(declare-fun res!93183 () Bool)

(declare-fun e!129776 () Bool)

(assert (=> b!197144 (=> (not res!93183) (not e!129776))))

(declare-datatypes ((array!8511 0))(
  ( (array!8512 (arr!4006 (Array (_ BitVec 32) (_ BitVec 64))) (size!4331 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8511)

(declare-datatypes ((List!2500 0))(
  ( (Nil!2497) (Cons!2496 (h!3138 (_ BitVec 64)) (t!7431 List!2500)) )
))
(declare-fun arrayNoDuplicates!0 (array!8511 (_ BitVec 32) List!2500) Bool)

(assert (=> b!197144 (= res!93183 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2497))))

(declare-fun res!93186 () Bool)

(assert (=> start!20114 (=> (not res!93186) (not e!129776))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20114 (= res!93186 (validMask!0 mask!1149))))

(assert (=> start!20114 e!129776))

(declare-datatypes ((V!5819 0))(
  ( (V!5820 (val!2359 Int)) )
))
(declare-datatypes ((ValueCell!1971 0))(
  ( (ValueCellFull!1971 (v!4329 V!5819)) (EmptyCell!1971) )
))
(declare-datatypes ((array!8513 0))(
  ( (array!8514 (arr!4007 (Array (_ BitVec 32) ValueCell!1971)) (size!4332 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8513)

(declare-fun e!129777 () Bool)

(declare-fun array_inv!2615 (array!8513) Bool)

(assert (=> start!20114 (and (array_inv!2615 _values!649) e!129777)))

(assert (=> start!20114 true))

(declare-fun tp_is_empty!4629 () Bool)

(assert (=> start!20114 tp_is_empty!4629))

(declare-fun array_inv!2616 (array!8511) Bool)

(assert (=> start!20114 (array_inv!2616 _keys!825)))

(assert (=> start!20114 tp!17350))

(declare-fun b!197145 () Bool)

(declare-fun e!129775 () Bool)

(assert (=> b!197145 (= e!129775 tp_is_empty!4629)))

(declare-fun b!197146 () Bool)

(assert (=> b!197146 (= e!129777 (and e!129775 mapRes!8012))))

(declare-fun condMapEmpty!8012 () Bool)

(declare-fun mapDefault!8012 () ValueCell!1971)

(assert (=> b!197146 (= condMapEmpty!8012 (= (arr!4007 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1971)) mapDefault!8012)))))

(declare-fun b!197147 () Bool)

(declare-fun e!129779 () Bool)

(assert (=> b!197147 (= e!129779 tp_is_empty!4629)))

(declare-fun b!197148 () Bool)

(declare-fun res!93182 () Bool)

(assert (=> b!197148 (=> (not res!93182) (not e!129776))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197148 (= res!93182 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4331 _keys!825))))))

(declare-fun b!197149 () Bool)

(declare-fun res!93187 () Bool)

(assert (=> b!197149 (=> (not res!93187) (not e!129776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8511 (_ BitVec 32)) Bool)

(assert (=> b!197149 (= res!93187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197150 () Bool)

(assert (=> b!197150 (= e!129776 false)))

(declare-datatypes ((tuple2!3588 0))(
  ( (tuple2!3589 (_1!1805 (_ BitVec 64)) (_2!1805 V!5819)) )
))
(declare-datatypes ((List!2501 0))(
  ( (Nil!2498) (Cons!2497 (h!3139 tuple2!3588) (t!7432 List!2501)) )
))
(declare-datatypes ((ListLongMap!2501 0))(
  ( (ListLongMap!2502 (toList!1266 List!2501)) )
))
(declare-fun lt!97689 () ListLongMap!2501)

(declare-fun zeroValue!615 () V!5819)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5819)

(declare-fun getCurrentListMapNoExtraKeys!231 (array!8511 array!8513 (_ BitVec 32) (_ BitVec 32) V!5819 V!5819 (_ BitVec 32) Int) ListLongMap!2501)

(assert (=> b!197150 (= lt!97689 (getCurrentListMapNoExtraKeys!231 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197151 () Bool)

(declare-fun res!93185 () Bool)

(assert (=> b!197151 (=> (not res!93185) (not e!129776))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197151 (= res!93185 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8012 () Bool)

(declare-fun tp!17351 () Bool)

(assert (=> mapNonEmpty!8012 (= mapRes!8012 (and tp!17351 e!129779))))

(declare-fun mapKey!8012 () (_ BitVec 32))

(declare-fun mapValue!8012 () ValueCell!1971)

(declare-fun mapRest!8012 () (Array (_ BitVec 32) ValueCell!1971))

(assert (=> mapNonEmpty!8012 (= (arr!4007 _values!649) (store mapRest!8012 mapKey!8012 mapValue!8012))))

(declare-fun b!197152 () Bool)

(declare-fun res!93181 () Bool)

(assert (=> b!197152 (=> (not res!93181) (not e!129776))))

(assert (=> b!197152 (= res!93181 (= (select (arr!4006 _keys!825) i!601) k0!843))))

(declare-fun b!197153 () Bool)

(declare-fun res!93184 () Bool)

(assert (=> b!197153 (=> (not res!93184) (not e!129776))))

(assert (=> b!197153 (= res!93184 (and (= (size!4332 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4331 _keys!825) (size!4332 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20114 res!93186) b!197153))

(assert (= (and b!197153 res!93184) b!197149))

(assert (= (and b!197149 res!93187) b!197144))

(assert (= (and b!197144 res!93183) b!197148))

(assert (= (and b!197148 res!93182) b!197151))

(assert (= (and b!197151 res!93185) b!197152))

(assert (= (and b!197152 res!93181) b!197150))

(assert (= (and b!197146 condMapEmpty!8012) mapIsEmpty!8012))

(assert (= (and b!197146 (not condMapEmpty!8012)) mapNonEmpty!8012))

(get-info :version)

(assert (= (and mapNonEmpty!8012 ((_ is ValueCellFull!1971) mapValue!8012)) b!197147))

(assert (= (and b!197146 ((_ is ValueCellFull!1971) mapDefault!8012)) b!197145))

(assert (= start!20114 b!197146))

(declare-fun m!224143 () Bool)

(assert (=> b!197152 m!224143))

(declare-fun m!224145 () Bool)

(assert (=> b!197150 m!224145))

(declare-fun m!224147 () Bool)

(assert (=> b!197144 m!224147))

(declare-fun m!224149 () Bool)

(assert (=> start!20114 m!224149))

(declare-fun m!224151 () Bool)

(assert (=> start!20114 m!224151))

(declare-fun m!224153 () Bool)

(assert (=> start!20114 m!224153))

(declare-fun m!224155 () Bool)

(assert (=> mapNonEmpty!8012 m!224155))

(declare-fun m!224157 () Bool)

(assert (=> b!197151 m!224157))

(declare-fun m!224159 () Bool)

(assert (=> b!197149 m!224159))

(check-sat b_and!11519 tp_is_empty!4629 (not b!197150) (not start!20114) (not b!197151) (not mapNonEmpty!8012) (not b!197144) (not b_next!4773) (not b!197149))
(check-sat b_and!11519 (not b_next!4773))
