; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107216 () Bool)

(assert start!107216)

(declare-fun b!1270903 () Bool)

(declare-fun e!724594 () Bool)

(declare-fun tp_is_empty!32905 () Bool)

(assert (=> b!1270903 (= e!724594 tp_is_empty!32905)))

(declare-fun b!1270904 () Bool)

(declare-fun res!845649 () Bool)

(declare-fun e!724592 () Bool)

(assert (=> b!1270904 (=> (not res!845649) (not e!724592))))

(declare-datatypes ((array!82979 0))(
  ( (array!82980 (arr!40027 (Array (_ BitVec 32) (_ BitVec 64))) (size!40565 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82979)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82979 (_ BitVec 32)) Bool)

(assert (=> b!1270904 (= res!845649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50938 () Bool)

(declare-fun mapRes!50938 () Bool)

(assert (=> mapIsEmpty!50938 mapRes!50938))

(declare-fun res!845650 () Bool)

(assert (=> start!107216 (=> (not res!845650) (not e!724592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107216 (= res!845650 (validMask!0 mask!1730))))

(assert (=> start!107216 e!724592))

(declare-datatypes ((V!49067 0))(
  ( (V!49068 (val!16527 Int)) )
))
(declare-datatypes ((ValueCell!15599 0))(
  ( (ValueCellFull!15599 (v!19163 V!49067)) (EmptyCell!15599) )
))
(declare-datatypes ((array!82981 0))(
  ( (array!82982 (arr!40028 (Array (_ BitVec 32) ValueCell!15599)) (size!40566 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82981)

(declare-fun e!724593 () Bool)

(declare-fun array_inv!30605 (array!82981) Bool)

(assert (=> start!107216 (and (array_inv!30605 _values!1134) e!724593)))

(assert (=> start!107216 true))

(declare-fun array_inv!30606 (array!82979) Bool)

(assert (=> start!107216 (array_inv!30606 _keys!1364)))

(declare-fun b!1270905 () Bool)

(declare-fun e!724590 () Bool)

(assert (=> b!1270905 (= e!724590 tp_is_empty!32905)))

(declare-fun b!1270906 () Bool)

(assert (=> b!1270906 (= e!724593 (and e!724590 mapRes!50938))))

(declare-fun condMapEmpty!50938 () Bool)

(declare-fun mapDefault!50938 () ValueCell!15599)

(assert (=> b!1270906 (= condMapEmpty!50938 (= (arr!40028 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15599)) mapDefault!50938)))))

(declare-fun mapNonEmpty!50938 () Bool)

(declare-fun tp!97280 () Bool)

(assert (=> mapNonEmpty!50938 (= mapRes!50938 (and tp!97280 e!724594))))

(declare-fun mapValue!50938 () ValueCell!15599)

(declare-fun mapKey!50938 () (_ BitVec 32))

(declare-fun mapRest!50938 () (Array (_ BitVec 32) ValueCell!15599))

(assert (=> mapNonEmpty!50938 (= (arr!40028 _values!1134) (store mapRest!50938 mapKey!50938 mapValue!50938))))

(declare-fun b!1270907 () Bool)

(declare-fun res!845651 () Bool)

(assert (=> b!1270907 (=> (not res!845651) (not e!724592))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270907 (= res!845651 (and (= (size!40566 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40565 _keys!1364) (size!40566 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270908 () Bool)

(assert (=> b!1270908 (= e!724592 false)))

(declare-fun lt!574616 () Bool)

(declare-datatypes ((List!28586 0))(
  ( (Nil!28583) (Cons!28582 (h!29791 (_ BitVec 64)) (t!42107 List!28586)) )
))
(declare-fun arrayNoDuplicates!0 (array!82979 (_ BitVec 32) List!28586) Bool)

(assert (=> b!1270908 (= lt!574616 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28583))))

(assert (= (and start!107216 res!845650) b!1270907))

(assert (= (and b!1270907 res!845651) b!1270904))

(assert (= (and b!1270904 res!845649) b!1270908))

(assert (= (and b!1270906 condMapEmpty!50938) mapIsEmpty!50938))

(assert (= (and b!1270906 (not condMapEmpty!50938)) mapNonEmpty!50938))

(get-info :version)

(assert (= (and mapNonEmpty!50938 ((_ is ValueCellFull!15599) mapValue!50938)) b!1270903))

(assert (= (and b!1270906 ((_ is ValueCellFull!15599) mapDefault!50938)) b!1270905))

(assert (= start!107216 b!1270906))

(declare-fun m!1168575 () Bool)

(assert (=> b!1270904 m!1168575))

(declare-fun m!1168577 () Bool)

(assert (=> start!107216 m!1168577))

(declare-fun m!1168579 () Bool)

(assert (=> start!107216 m!1168579))

(declare-fun m!1168581 () Bool)

(assert (=> start!107216 m!1168581))

(declare-fun m!1168583 () Bool)

(assert (=> mapNonEmpty!50938 m!1168583))

(declare-fun m!1168585 () Bool)

(assert (=> b!1270908 m!1168585))

(check-sat tp_is_empty!32905 (not start!107216) (not b!1270904) (not mapNonEmpty!50938) (not b!1270908))
(check-sat)
