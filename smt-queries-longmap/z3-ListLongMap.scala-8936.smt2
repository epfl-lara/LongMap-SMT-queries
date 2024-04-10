; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108344 () Bool)

(assert start!108344)

(declare-fun b!1278767 () Bool)

(declare-fun res!849514 () Bool)

(declare-fun e!730547 () Bool)

(assert (=> b!1278767 (=> (not res!849514) (not e!730547))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49811 0))(
  ( (V!49812 (val!16840 Int)) )
))
(declare-datatypes ((ValueCell!15867 0))(
  ( (ValueCellFull!15867 (v!19440 V!49811)) (EmptyCell!15867) )
))
(declare-datatypes ((array!84154 0))(
  ( (array!84155 (arr!40581 (Array (_ BitVec 32) ValueCell!15867)) (size!41131 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84154)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84156 0))(
  ( (array!84157 (arr!40582 (Array (_ BitVec 32) (_ BitVec 64))) (size!41132 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84156)

(assert (=> b!1278767 (= res!849514 (and (= (size!41131 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41132 _keys!1741) (size!41131 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51848 () Bool)

(declare-fun mapRes!51848 () Bool)

(declare-fun tp!98822 () Bool)

(declare-fun e!730548 () Bool)

(assert (=> mapNonEmpty!51848 (= mapRes!51848 (and tp!98822 e!730548))))

(declare-fun mapValue!51848 () ValueCell!15867)

(declare-fun mapKey!51848 () (_ BitVec 32))

(declare-fun mapRest!51848 () (Array (_ BitVec 32) ValueCell!15867))

(assert (=> mapNonEmpty!51848 (= (arr!40581 _values!1445) (store mapRest!51848 mapKey!51848 mapValue!51848))))

(declare-fun res!849515 () Bool)

(assert (=> start!108344 (=> (not res!849515) (not e!730547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108344 (= res!849515 (validMask!0 mask!2175))))

(assert (=> start!108344 e!730547))

(assert (=> start!108344 true))

(declare-fun e!730550 () Bool)

(declare-fun array_inv!30819 (array!84154) Bool)

(assert (=> start!108344 (and (array_inv!30819 _values!1445) e!730550)))

(declare-fun array_inv!30820 (array!84156) Bool)

(assert (=> start!108344 (array_inv!30820 _keys!1741)))

(declare-fun b!1278768 () Bool)

(declare-fun res!849513 () Bool)

(assert (=> b!1278768 (=> (not res!849513) (not e!730547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84156 (_ BitVec 32)) Bool)

(assert (=> b!1278768 (= res!849513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51848 () Bool)

(assert (=> mapIsEmpty!51848 mapRes!51848))

(declare-fun b!1278769 () Bool)

(assert (=> b!1278769 (= e!730547 false)))

(declare-fun lt!575927 () Bool)

(declare-datatypes ((List!28750 0))(
  ( (Nil!28747) (Cons!28746 (h!29955 (_ BitVec 64)) (t!42290 List!28750)) )
))
(declare-fun arrayNoDuplicates!0 (array!84156 (_ BitVec 32) List!28750) Bool)

(assert (=> b!1278769 (= lt!575927 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28747))))

(declare-fun b!1278770 () Bool)

(declare-fun tp_is_empty!33531 () Bool)

(assert (=> b!1278770 (= e!730548 tp_is_empty!33531)))

(declare-fun b!1278771 () Bool)

(declare-fun e!730546 () Bool)

(assert (=> b!1278771 (= e!730546 tp_is_empty!33531)))

(declare-fun b!1278772 () Bool)

(assert (=> b!1278772 (= e!730550 (and e!730546 mapRes!51848))))

(declare-fun condMapEmpty!51848 () Bool)

(declare-fun mapDefault!51848 () ValueCell!15867)

(assert (=> b!1278772 (= condMapEmpty!51848 (= (arr!40581 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15867)) mapDefault!51848)))))

(assert (= (and start!108344 res!849515) b!1278767))

(assert (= (and b!1278767 res!849514) b!1278768))

(assert (= (and b!1278768 res!849513) b!1278769))

(assert (= (and b!1278772 condMapEmpty!51848) mapIsEmpty!51848))

(assert (= (and b!1278772 (not condMapEmpty!51848)) mapNonEmpty!51848))

(get-info :version)

(assert (= (and mapNonEmpty!51848 ((_ is ValueCellFull!15867) mapValue!51848)) b!1278770))

(assert (= (and b!1278772 ((_ is ValueCellFull!15867) mapDefault!51848)) b!1278771))

(assert (= start!108344 b!1278772))

(declare-fun m!1173965 () Bool)

(assert (=> mapNonEmpty!51848 m!1173965))

(declare-fun m!1173967 () Bool)

(assert (=> start!108344 m!1173967))

(declare-fun m!1173969 () Bool)

(assert (=> start!108344 m!1173969))

(declare-fun m!1173971 () Bool)

(assert (=> start!108344 m!1173971))

(declare-fun m!1173973 () Bool)

(assert (=> b!1278768 m!1173973))

(declare-fun m!1173975 () Bool)

(assert (=> b!1278769 m!1173975))

(check-sat tp_is_empty!33531 (not start!108344) (not b!1278769) (not mapNonEmpty!51848) (not b!1278768))
(check-sat)
