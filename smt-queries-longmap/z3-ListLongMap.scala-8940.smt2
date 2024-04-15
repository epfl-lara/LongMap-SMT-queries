; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108366 () Bool)

(assert start!108366)

(declare-fun b!1278903 () Bool)

(declare-fun e!730683 () Bool)

(declare-fun tp_is_empty!33553 () Bool)

(assert (=> b!1278903 (= e!730683 tp_is_empty!33553)))

(declare-fun b!1278904 () Bool)

(declare-fun res!849590 () Bool)

(declare-fun e!730685 () Bool)

(assert (=> b!1278904 (=> (not res!849590) (not e!730685))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49841 0))(
  ( (V!49842 (val!16851 Int)) )
))
(declare-datatypes ((ValueCell!15878 0))(
  ( (ValueCellFull!15878 (v!19450 V!49841)) (EmptyCell!15878) )
))
(declare-datatypes ((array!84087 0))(
  ( (array!84088 (arr!40548 (Array (_ BitVec 32) ValueCell!15878)) (size!41100 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84087)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84089 0))(
  ( (array!84090 (arr!40549 (Array (_ BitVec 32) (_ BitVec 64))) (size!41101 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84089)

(assert (=> b!1278904 (= res!849590 (and (= (size!41100 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41101 _keys!1741) (size!41100 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278905 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1278905 (= e!730685 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41101 _keys!1741)) (bvsgt from!2144 (size!41101 _keys!1741))))))

(declare-fun b!1278906 () Bool)

(declare-fun res!849587 () Bool)

(assert (=> b!1278906 (=> (not res!849587) (not e!730685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84089 (_ BitVec 32)) Bool)

(assert (=> b!1278906 (= res!849587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278907 () Bool)

(declare-fun e!730682 () Bool)

(assert (=> b!1278907 (= e!730682 tp_is_empty!33553)))

(declare-fun res!849588 () Bool)

(assert (=> start!108366 (=> (not res!849588) (not e!730685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108366 (= res!849588 (validMask!0 mask!2175))))

(assert (=> start!108366 e!730685))

(assert (=> start!108366 true))

(declare-fun e!730684 () Bool)

(declare-fun array_inv!30949 (array!84087) Bool)

(assert (=> start!108366 (and (array_inv!30949 _values!1445) e!730684)))

(declare-fun array_inv!30950 (array!84089) Bool)

(assert (=> start!108366 (array_inv!30950 _keys!1741)))

(declare-fun b!1278908 () Bool)

(declare-fun res!849589 () Bool)

(assert (=> b!1278908 (=> (not res!849589) (not e!730685))))

(declare-datatypes ((List!28830 0))(
  ( (Nil!28827) (Cons!28826 (h!30035 (_ BitVec 64)) (t!42362 List!28830)) )
))
(declare-fun arrayNoDuplicates!0 (array!84089 (_ BitVec 32) List!28830) Bool)

(assert (=> b!1278908 (= res!849589 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28827))))

(declare-fun mapIsEmpty!51881 () Bool)

(declare-fun mapRes!51881 () Bool)

(assert (=> mapIsEmpty!51881 mapRes!51881))

(declare-fun b!1278909 () Bool)

(assert (=> b!1278909 (= e!730684 (and e!730682 mapRes!51881))))

(declare-fun condMapEmpty!51881 () Bool)

(declare-fun mapDefault!51881 () ValueCell!15878)

(assert (=> b!1278909 (= condMapEmpty!51881 (= (arr!40548 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15878)) mapDefault!51881)))))

(declare-fun mapNonEmpty!51881 () Bool)

(declare-fun tp!98856 () Bool)

(assert (=> mapNonEmpty!51881 (= mapRes!51881 (and tp!98856 e!730683))))

(declare-fun mapKey!51881 () (_ BitVec 32))

(declare-fun mapValue!51881 () ValueCell!15878)

(declare-fun mapRest!51881 () (Array (_ BitVec 32) ValueCell!15878))

(assert (=> mapNonEmpty!51881 (= (arr!40548 _values!1445) (store mapRest!51881 mapKey!51881 mapValue!51881))))

(assert (= (and start!108366 res!849588) b!1278904))

(assert (= (and b!1278904 res!849590) b!1278906))

(assert (= (and b!1278906 res!849587) b!1278908))

(assert (= (and b!1278908 res!849589) b!1278905))

(assert (= (and b!1278909 condMapEmpty!51881) mapIsEmpty!51881))

(assert (= (and b!1278909 (not condMapEmpty!51881)) mapNonEmpty!51881))

(get-info :version)

(assert (= (and mapNonEmpty!51881 ((_ is ValueCellFull!15878) mapValue!51881)) b!1278903))

(assert (= (and b!1278909 ((_ is ValueCellFull!15878) mapDefault!51881)) b!1278907))

(assert (= start!108366 b!1278909))

(declare-fun m!1173597 () Bool)

(assert (=> b!1278906 m!1173597))

(declare-fun m!1173599 () Bool)

(assert (=> start!108366 m!1173599))

(declare-fun m!1173601 () Bool)

(assert (=> start!108366 m!1173601))

(declare-fun m!1173603 () Bool)

(assert (=> start!108366 m!1173603))

(declare-fun m!1173605 () Bool)

(assert (=> b!1278908 m!1173605))

(declare-fun m!1173607 () Bool)

(assert (=> mapNonEmpty!51881 m!1173607))

(check-sat (not b!1278908) (not b!1278906) tp_is_empty!33553 (not mapNonEmpty!51881) (not start!108366))
(check-sat)
