; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20116 () Bool)

(assert start!20116)

(declare-fun b_free!4771 () Bool)

(declare-fun b_next!4771 () Bool)

(assert (=> start!20116 (= b_free!4771 (not b_next!4771))))

(declare-fun tp!17344 () Bool)

(declare-fun b_and!11531 () Bool)

(assert (=> start!20116 (= tp!17344 b_and!11531)))

(declare-fun b!197161 () Bool)

(declare-fun res!93182 () Bool)

(declare-fun e!129786 () Bool)

(assert (=> b!197161 (=> (not res!93182) (not e!129786))))

(declare-datatypes ((array!8499 0))(
  ( (array!8500 (arr!4000 (Array (_ BitVec 32) (_ BitVec 64))) (size!4325 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8499)

(declare-datatypes ((List!2455 0))(
  ( (Nil!2452) (Cons!2451 (h!3093 (_ BitVec 64)) (t!7378 List!2455)) )
))
(declare-fun arrayNoDuplicates!0 (array!8499 (_ BitVec 32) List!2455) Bool)

(assert (=> b!197161 (= res!93182 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2452))))

(declare-fun b!197162 () Bool)

(declare-fun e!129784 () Bool)

(declare-fun e!129788 () Bool)

(declare-fun mapRes!8009 () Bool)

(assert (=> b!197162 (= e!129784 (and e!129788 mapRes!8009))))

(declare-fun condMapEmpty!8009 () Bool)

(declare-datatypes ((V!5817 0))(
  ( (V!5818 (val!2358 Int)) )
))
(declare-datatypes ((ValueCell!1970 0))(
  ( (ValueCellFull!1970 (v!4329 V!5817)) (EmptyCell!1970) )
))
(declare-datatypes ((array!8501 0))(
  ( (array!8502 (arr!4001 (Array (_ BitVec 32) ValueCell!1970)) (size!4326 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8501)

(declare-fun mapDefault!8009 () ValueCell!1970)

(assert (=> b!197162 (= condMapEmpty!8009 (= (arr!4001 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1970)) mapDefault!8009)))))

(declare-fun b!197163 () Bool)

(assert (=> b!197163 (= e!129786 false)))

(declare-datatypes ((tuple2!3536 0))(
  ( (tuple2!3537 (_1!1779 (_ BitVec 64)) (_2!1779 V!5817)) )
))
(declare-datatypes ((List!2456 0))(
  ( (Nil!2453) (Cons!2452 (h!3094 tuple2!3536) (t!7379 List!2456)) )
))
(declare-datatypes ((ListLongMap!2451 0))(
  ( (ListLongMap!2452 (toList!1241 List!2456)) )
))
(declare-fun lt!97745 () ListLongMap!2451)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5817)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5817)

(declare-fun getCurrentListMapNoExtraKeys!231 (array!8499 array!8501 (_ BitVec 32) (_ BitVec 32) V!5817 V!5817 (_ BitVec 32) Int) ListLongMap!2451)

(assert (=> b!197163 (= lt!97745 (getCurrentListMapNoExtraKeys!231 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197164 () Bool)

(declare-fun res!93186 () Bool)

(assert (=> b!197164 (=> (not res!93186) (not e!129786))))

(assert (=> b!197164 (= res!93186 (and (= (size!4326 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4325 _keys!825) (size!4326 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197165 () Bool)

(declare-fun res!93184 () Bool)

(assert (=> b!197165 (=> (not res!93184) (not e!129786))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197165 (= res!93184 (validKeyInArray!0 k0!843))))

(declare-fun b!197166 () Bool)

(declare-fun res!93187 () Bool)

(assert (=> b!197166 (=> (not res!93187) (not e!129786))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197166 (= res!93187 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4325 _keys!825))))))

(declare-fun mapIsEmpty!8009 () Bool)

(assert (=> mapIsEmpty!8009 mapRes!8009))

(declare-fun b!197168 () Bool)

(declare-fun e!129787 () Bool)

(declare-fun tp_is_empty!4627 () Bool)

(assert (=> b!197168 (= e!129787 tp_is_empty!4627)))

(declare-fun b!197169 () Bool)

(declare-fun res!93185 () Bool)

(assert (=> b!197169 (=> (not res!93185) (not e!129786))))

(assert (=> b!197169 (= res!93185 (= (select (arr!4000 _keys!825) i!601) k0!843))))

(declare-fun b!197170 () Bool)

(assert (=> b!197170 (= e!129788 tp_is_empty!4627)))

(declare-fun mapNonEmpty!8009 () Bool)

(declare-fun tp!17345 () Bool)

(assert (=> mapNonEmpty!8009 (= mapRes!8009 (and tp!17345 e!129787))))

(declare-fun mapRest!8009 () (Array (_ BitVec 32) ValueCell!1970))

(declare-fun mapValue!8009 () ValueCell!1970)

(declare-fun mapKey!8009 () (_ BitVec 32))

(assert (=> mapNonEmpty!8009 (= (arr!4001 _values!649) (store mapRest!8009 mapKey!8009 mapValue!8009))))

(declare-fun b!197167 () Bool)

(declare-fun res!93183 () Bool)

(assert (=> b!197167 (=> (not res!93183) (not e!129786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8499 (_ BitVec 32)) Bool)

(assert (=> b!197167 (= res!93183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!93181 () Bool)

(assert (=> start!20116 (=> (not res!93181) (not e!129786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20116 (= res!93181 (validMask!0 mask!1149))))

(assert (=> start!20116 e!129786))

(declare-fun array_inv!2603 (array!8501) Bool)

(assert (=> start!20116 (and (array_inv!2603 _values!649) e!129784)))

(assert (=> start!20116 true))

(assert (=> start!20116 tp_is_empty!4627))

(declare-fun array_inv!2604 (array!8499) Bool)

(assert (=> start!20116 (array_inv!2604 _keys!825)))

(assert (=> start!20116 tp!17344))

(assert (= (and start!20116 res!93181) b!197164))

(assert (= (and b!197164 res!93186) b!197167))

(assert (= (and b!197167 res!93183) b!197161))

(assert (= (and b!197161 res!93182) b!197166))

(assert (= (and b!197166 res!93187) b!197165))

(assert (= (and b!197165 res!93184) b!197169))

(assert (= (and b!197169 res!93185) b!197163))

(assert (= (and b!197162 condMapEmpty!8009) mapIsEmpty!8009))

(assert (= (and b!197162 (not condMapEmpty!8009)) mapNonEmpty!8009))

(get-info :version)

(assert (= (and mapNonEmpty!8009 ((_ is ValueCellFull!1970) mapValue!8009)) b!197168))

(assert (= (and b!197162 ((_ is ValueCellFull!1970) mapDefault!8009)) b!197170))

(assert (= start!20116 b!197162))

(declare-fun m!224307 () Bool)

(assert (=> b!197167 m!224307))

(declare-fun m!224309 () Bool)

(assert (=> start!20116 m!224309))

(declare-fun m!224311 () Bool)

(assert (=> start!20116 m!224311))

(declare-fun m!224313 () Bool)

(assert (=> start!20116 m!224313))

(declare-fun m!224315 () Bool)

(assert (=> b!197165 m!224315))

(declare-fun m!224317 () Bool)

(assert (=> b!197161 m!224317))

(declare-fun m!224319 () Bool)

(assert (=> mapNonEmpty!8009 m!224319))

(declare-fun m!224321 () Bool)

(assert (=> b!197163 m!224321))

(declare-fun m!224323 () Bool)

(assert (=> b!197169 m!224323))

(check-sat (not mapNonEmpty!8009) b_and!11531 (not b!197161) (not b!197167) tp_is_empty!4627 (not b!197163) (not start!20116) (not b_next!4771) (not b!197165))
(check-sat b_and!11531 (not b_next!4771))
