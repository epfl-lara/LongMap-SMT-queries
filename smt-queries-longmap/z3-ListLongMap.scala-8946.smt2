; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108402 () Bool)

(assert start!108402)

(declare-fun b_free!27949 () Bool)

(declare-fun b_next!27949 () Bool)

(assert (=> start!108402 (= b_free!27949 (not b_next!27949))))

(declare-fun tp!98958 () Bool)

(declare-fun b_and!45991 () Bool)

(assert (=> start!108402 (= tp!98958 b_and!45991)))

(declare-fun b!1279328 () Bool)

(declare-fun e!730953 () Bool)

(assert (=> b!1279328 (= e!730953 false)))

(declare-datatypes ((V!49889 0))(
  ( (V!49890 (val!16869 Int)) )
))
(declare-fun minValue!1387 () V!49889)

(declare-fun zeroValue!1387 () V!49889)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575827 () Bool)

(declare-datatypes ((ValueCell!15896 0))(
  ( (ValueCellFull!15896 (v!19468 V!49889)) (EmptyCell!15896) )
))
(declare-datatypes ((array!84155 0))(
  ( (array!84156 (arr!40582 (Array (_ BitVec 32) ValueCell!15896)) (size!41134 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84155)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84157 0))(
  ( (array!84158 (arr!40583 (Array (_ BitVec 32) (_ BitVec 64))) (size!41135 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84157)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21662 0))(
  ( (tuple2!21663 (_1!10842 (_ BitVec 64)) (_2!10842 V!49889)) )
))
(declare-datatypes ((List!28852 0))(
  ( (Nil!28849) (Cons!28848 (h!30057 tuple2!21662) (t!42384 List!28852)) )
))
(declare-datatypes ((ListLongMap!19319 0))(
  ( (ListLongMap!19320 (toList!9675 List!28852)) )
))
(declare-fun contains!7720 (ListLongMap!19319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4649 (array!84157 array!84155 (_ BitVec 32) (_ BitVec 32) V!49889 V!49889 (_ BitVec 32) Int) ListLongMap!19319)

(assert (=> b!1279328 (= lt!575827 (contains!7720 (getCurrentListMap!4649 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!849850 () Bool)

(assert (=> start!108402 (=> (not res!849850) (not e!730953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108402 (= res!849850 (validMask!0 mask!2175))))

(assert (=> start!108402 e!730953))

(declare-fun tp_is_empty!33589 () Bool)

(assert (=> start!108402 tp_is_empty!33589))

(assert (=> start!108402 true))

(declare-fun e!730956 () Bool)

(declare-fun array_inv!30975 (array!84155) Bool)

(assert (=> start!108402 (and (array_inv!30975 _values!1445) e!730956)))

(declare-fun array_inv!30976 (array!84157) Bool)

(assert (=> start!108402 (array_inv!30976 _keys!1741)))

(assert (=> start!108402 tp!98958))

(declare-fun b!1279329 () Bool)

(declare-fun res!849853 () Bool)

(assert (=> b!1279329 (=> (not res!849853) (not e!730953))))

(assert (=> b!1279329 (= res!849853 (and (= (size!41134 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41135 _keys!1741) (size!41134 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279330 () Bool)

(declare-fun e!730954 () Bool)

(declare-fun mapRes!51935 () Bool)

(assert (=> b!1279330 (= e!730956 (and e!730954 mapRes!51935))))

(declare-fun condMapEmpty!51935 () Bool)

(declare-fun mapDefault!51935 () ValueCell!15896)

(assert (=> b!1279330 (= condMapEmpty!51935 (= (arr!40582 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15896)) mapDefault!51935)))))

(declare-fun b!1279331 () Bool)

(declare-fun res!849852 () Bool)

(assert (=> b!1279331 (=> (not res!849852) (not e!730953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84157 (_ BitVec 32)) Bool)

(assert (=> b!1279331 (= res!849852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51935 () Bool)

(assert (=> mapIsEmpty!51935 mapRes!51935))

(declare-fun mapNonEmpty!51935 () Bool)

(declare-fun tp!98957 () Bool)

(declare-fun e!730955 () Bool)

(assert (=> mapNonEmpty!51935 (= mapRes!51935 (and tp!98957 e!730955))))

(declare-fun mapValue!51935 () ValueCell!15896)

(declare-fun mapKey!51935 () (_ BitVec 32))

(declare-fun mapRest!51935 () (Array (_ BitVec 32) ValueCell!15896))

(assert (=> mapNonEmpty!51935 (= (arr!40582 _values!1445) (store mapRest!51935 mapKey!51935 mapValue!51935))))

(declare-fun b!1279332 () Bool)

(assert (=> b!1279332 (= e!730954 tp_is_empty!33589)))

(declare-fun b!1279333 () Bool)

(assert (=> b!1279333 (= e!730955 tp_is_empty!33589)))

(declare-fun b!1279334 () Bool)

(declare-fun res!849851 () Bool)

(assert (=> b!1279334 (=> (not res!849851) (not e!730953))))

(declare-datatypes ((List!28853 0))(
  ( (Nil!28850) (Cons!28849 (h!30058 (_ BitVec 64)) (t!42385 List!28853)) )
))
(declare-fun arrayNoDuplicates!0 (array!84157 (_ BitVec 32) List!28853) Bool)

(assert (=> b!1279334 (= res!849851 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28850))))

(declare-fun b!1279335 () Bool)

(declare-fun res!849854 () Bool)

(assert (=> b!1279335 (=> (not res!849854) (not e!730953))))

(assert (=> b!1279335 (= res!849854 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41135 _keys!1741))))))

(assert (= (and start!108402 res!849850) b!1279329))

(assert (= (and b!1279329 res!849853) b!1279331))

(assert (= (and b!1279331 res!849852) b!1279334))

(assert (= (and b!1279334 res!849851) b!1279335))

(assert (= (and b!1279335 res!849854) b!1279328))

(assert (= (and b!1279330 condMapEmpty!51935) mapIsEmpty!51935))

(assert (= (and b!1279330 (not condMapEmpty!51935)) mapNonEmpty!51935))

(get-info :version)

(assert (= (and mapNonEmpty!51935 ((_ is ValueCellFull!15896) mapValue!51935)) b!1279333))

(assert (= (and b!1279330 ((_ is ValueCellFull!15896) mapDefault!51935)) b!1279332))

(assert (= start!108402 b!1279330))

(declare-fun m!1173873 () Bool)

(assert (=> b!1279334 m!1173873))

(declare-fun m!1173875 () Bool)

(assert (=> start!108402 m!1173875))

(declare-fun m!1173877 () Bool)

(assert (=> start!108402 m!1173877))

(declare-fun m!1173879 () Bool)

(assert (=> start!108402 m!1173879))

(declare-fun m!1173881 () Bool)

(assert (=> mapNonEmpty!51935 m!1173881))

(declare-fun m!1173883 () Bool)

(assert (=> b!1279331 m!1173883))

(declare-fun m!1173885 () Bool)

(assert (=> b!1279328 m!1173885))

(assert (=> b!1279328 m!1173885))

(declare-fun m!1173887 () Bool)

(assert (=> b!1279328 m!1173887))

(check-sat (not start!108402) (not b!1279334) (not b!1279331) tp_is_empty!33589 (not b_next!27949) (not mapNonEmpty!51935) (not b!1279328) b_and!45991)
(check-sat b_and!45991 (not b_next!27949))
