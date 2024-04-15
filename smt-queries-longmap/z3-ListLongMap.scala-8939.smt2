; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108360 () Bool)

(assert start!108360)

(declare-fun b!1278847 () Bool)

(declare-fun res!849558 () Bool)

(declare-fun e!730640 () Bool)

(assert (=> b!1278847 (=> (not res!849558) (not e!730640))))

(declare-datatypes ((array!84075 0))(
  ( (array!84076 (arr!40542 (Array (_ BitVec 32) (_ BitVec 64))) (size!41094 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84075)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84075 (_ BitVec 32)) Bool)

(assert (=> b!1278847 (= res!849558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51872 () Bool)

(declare-fun mapRes!51872 () Bool)

(declare-fun tp!98847 () Bool)

(declare-fun e!730637 () Bool)

(assert (=> mapNonEmpty!51872 (= mapRes!51872 (and tp!98847 e!730637))))

(declare-datatypes ((V!49833 0))(
  ( (V!49834 (val!16848 Int)) )
))
(declare-datatypes ((ValueCell!15875 0))(
  ( (ValueCellFull!15875 (v!19447 V!49833)) (EmptyCell!15875) )
))
(declare-fun mapValue!51872 () ValueCell!15875)

(declare-fun mapRest!51872 () (Array (_ BitVec 32) ValueCell!15875))

(declare-datatypes ((array!84077 0))(
  ( (array!84078 (arr!40543 (Array (_ BitVec 32) ValueCell!15875)) (size!41095 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84077)

(declare-fun mapKey!51872 () (_ BitVec 32))

(assert (=> mapNonEmpty!51872 (= (arr!40543 _values!1445) (store mapRest!51872 mapKey!51872 mapValue!51872))))

(declare-fun b!1278848 () Bool)

(declare-fun tp_is_empty!33547 () Bool)

(assert (=> b!1278848 (= e!730637 tp_is_empty!33547)))

(declare-fun b!1278849 () Bool)

(assert (=> b!1278849 (= e!730640 false)))

(declare-fun lt!575773 () Bool)

(declare-datatypes ((List!28828 0))(
  ( (Nil!28825) (Cons!28824 (h!30033 (_ BitVec 64)) (t!42360 List!28828)) )
))
(declare-fun arrayNoDuplicates!0 (array!84075 (_ BitVec 32) List!28828) Bool)

(assert (=> b!1278849 (= lt!575773 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28825))))

(declare-fun mapIsEmpty!51872 () Bool)

(assert (=> mapIsEmpty!51872 mapRes!51872))

(declare-fun res!849560 () Bool)

(assert (=> start!108360 (=> (not res!849560) (not e!730640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108360 (= res!849560 (validMask!0 mask!2175))))

(assert (=> start!108360 e!730640))

(assert (=> start!108360 true))

(declare-fun e!730639 () Bool)

(declare-fun array_inv!30947 (array!84077) Bool)

(assert (=> start!108360 (and (array_inv!30947 _values!1445) e!730639)))

(declare-fun array_inv!30948 (array!84075) Bool)

(assert (=> start!108360 (array_inv!30948 _keys!1741)))

(declare-fun b!1278850 () Bool)

(declare-fun e!730641 () Bool)

(assert (=> b!1278850 (= e!730639 (and e!730641 mapRes!51872))))

(declare-fun condMapEmpty!51872 () Bool)

(declare-fun mapDefault!51872 () ValueCell!15875)

(assert (=> b!1278850 (= condMapEmpty!51872 (= (arr!40543 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15875)) mapDefault!51872)))))

(declare-fun b!1278851 () Bool)

(declare-fun res!849559 () Bool)

(assert (=> b!1278851 (=> (not res!849559) (not e!730640))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278851 (= res!849559 (and (= (size!41095 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41094 _keys!1741) (size!41095 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278852 () Bool)

(assert (=> b!1278852 (= e!730641 tp_is_empty!33547)))

(assert (= (and start!108360 res!849560) b!1278851))

(assert (= (and b!1278851 res!849559) b!1278847))

(assert (= (and b!1278847 res!849558) b!1278849))

(assert (= (and b!1278850 condMapEmpty!51872) mapIsEmpty!51872))

(assert (= (and b!1278850 (not condMapEmpty!51872)) mapNonEmpty!51872))

(get-info :version)

(assert (= (and mapNonEmpty!51872 ((_ is ValueCellFull!15875) mapValue!51872)) b!1278848))

(assert (= (and b!1278850 ((_ is ValueCellFull!15875) mapDefault!51872)) b!1278852))

(assert (= start!108360 b!1278850))

(declare-fun m!1173561 () Bool)

(assert (=> b!1278847 m!1173561))

(declare-fun m!1173563 () Bool)

(assert (=> mapNonEmpty!51872 m!1173563))

(declare-fun m!1173565 () Bool)

(assert (=> b!1278849 m!1173565))

(declare-fun m!1173567 () Bool)

(assert (=> start!108360 m!1173567))

(declare-fun m!1173569 () Bool)

(assert (=> start!108360 m!1173569))

(declare-fun m!1173571 () Bool)

(assert (=> start!108360 m!1173571))

(check-sat (not start!108360) (not b!1278847) tp_is_empty!33547 (not mapNonEmpty!51872) (not b!1278849))
(check-sat)
