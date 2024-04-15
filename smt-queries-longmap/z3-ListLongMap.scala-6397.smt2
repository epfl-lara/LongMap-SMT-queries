; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82160 () Bool)

(assert start!82160)

(declare-fun b!957528 () Bool)

(declare-fun res!640992 () Bool)

(declare-fun e!539806 () Bool)

(assert (=> b!957528 (=> (not res!640992) (not e!539806))))

(declare-datatypes ((array!58354 0))(
  ( (array!58355 (arr!28051 (Array (_ BitVec 32) (_ BitVec 64))) (size!28532 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58354)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58354 (_ BitVec 32)) Bool)

(assert (=> b!957528 (= res!640992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957529 () Bool)

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!957529 (= e!539806 (bvsgt from!2064 (size!28532 _keys!1668)))))

(declare-fun b!957530 () Bool)

(declare-fun res!640990 () Bool)

(assert (=> b!957530 (=> (not res!640990) (not e!539806))))

(declare-datatypes ((List!19535 0))(
  ( (Nil!19532) (Cons!19531 (h!20693 (_ BitVec 64)) (t!27889 List!19535)) )
))
(declare-fun arrayNoDuplicates!0 (array!58354 (_ BitVec 32) List!19535) Bool)

(assert (=> b!957530 (= res!640990 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19532))))

(declare-fun mapNonEmpty!33715 () Bool)

(declare-fun mapRes!33715 () Bool)

(declare-fun tp!64321 () Bool)

(declare-fun e!539803 () Bool)

(assert (=> mapNonEmpty!33715 (= mapRes!33715 (and tp!64321 e!539803))))

(declare-datatypes ((V!33193 0))(
  ( (V!33194 (val!10629 Int)) )
))
(declare-datatypes ((ValueCell!10097 0))(
  ( (ValueCellFull!10097 (v!13185 V!33193)) (EmptyCell!10097) )
))
(declare-fun mapRest!33715 () (Array (_ BitVec 32) ValueCell!10097))

(declare-datatypes ((array!58356 0))(
  ( (array!58357 (arr!28052 (Array (_ BitVec 32) ValueCell!10097)) (size!28533 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58356)

(declare-fun mapKey!33715 () (_ BitVec 32))

(declare-fun mapValue!33715 () ValueCell!10097)

(assert (=> mapNonEmpty!33715 (= (arr!28052 _values!1386) (store mapRest!33715 mapKey!33715 mapValue!33715))))

(declare-fun b!957531 () Bool)

(declare-fun e!539805 () Bool)

(declare-fun e!539807 () Bool)

(assert (=> b!957531 (= e!539805 (and e!539807 mapRes!33715))))

(declare-fun condMapEmpty!33715 () Bool)

(declare-fun mapDefault!33715 () ValueCell!10097)

(assert (=> b!957531 (= condMapEmpty!33715 (= (arr!28052 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10097)) mapDefault!33715)))))

(declare-fun b!957532 () Bool)

(declare-fun res!640988 () Bool)

(assert (=> b!957532 (=> (not res!640988) (not e!539806))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957532 (= res!640988 (and (= (size!28533 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28532 _keys!1668) (size!28533 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957533 () Bool)

(declare-fun tp_is_empty!21157 () Bool)

(assert (=> b!957533 (= e!539803 tp_is_empty!21157)))

(declare-fun b!957534 () Bool)

(declare-fun res!640987 () Bool)

(assert (=> b!957534 (=> (not res!640987) (not e!539806))))

(declare-fun i!793 () (_ BitVec 32))

(assert (=> b!957534 (= res!640987 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28532 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28532 _keys!1668))))))

(declare-fun b!957535 () Bool)

(declare-fun res!640991 () Bool)

(assert (=> b!957535 (=> (not res!640991) (not e!539806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957535 (= res!640991 (validKeyInArray!0 (select (arr!28051 _keys!1668) i!793)))))

(declare-fun b!957536 () Bool)

(assert (=> b!957536 (= e!539807 tp_is_empty!21157)))

(declare-fun mapIsEmpty!33715 () Bool)

(assert (=> mapIsEmpty!33715 mapRes!33715))

(declare-fun res!640989 () Bool)

(assert (=> start!82160 (=> (not res!640989) (not e!539806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82160 (= res!640989 (validMask!0 mask!2088))))

(assert (=> start!82160 e!539806))

(assert (=> start!82160 true))

(declare-fun array_inv!21817 (array!58354) Bool)

(assert (=> start!82160 (array_inv!21817 _keys!1668)))

(declare-fun array_inv!21818 (array!58356) Bool)

(assert (=> start!82160 (and (array_inv!21818 _values!1386) e!539805)))

(assert (= (and start!82160 res!640989) b!957532))

(assert (= (and b!957532 res!640988) b!957528))

(assert (= (and b!957528 res!640992) b!957530))

(assert (= (and b!957530 res!640990) b!957534))

(assert (= (and b!957534 res!640987) b!957535))

(assert (= (and b!957535 res!640991) b!957529))

(assert (= (and b!957531 condMapEmpty!33715) mapIsEmpty!33715))

(assert (= (and b!957531 (not condMapEmpty!33715)) mapNonEmpty!33715))

(get-info :version)

(assert (= (and mapNonEmpty!33715 ((_ is ValueCellFull!10097) mapValue!33715)) b!957533))

(assert (= (and b!957531 ((_ is ValueCellFull!10097) mapDefault!33715)) b!957536))

(assert (= start!82160 b!957531))

(declare-fun m!887871 () Bool)

(assert (=> b!957528 m!887871))

(declare-fun m!887873 () Bool)

(assert (=> b!957535 m!887873))

(assert (=> b!957535 m!887873))

(declare-fun m!887875 () Bool)

(assert (=> b!957535 m!887875))

(declare-fun m!887877 () Bool)

(assert (=> mapNonEmpty!33715 m!887877))

(declare-fun m!887879 () Bool)

(assert (=> start!82160 m!887879))

(declare-fun m!887881 () Bool)

(assert (=> start!82160 m!887881))

(declare-fun m!887883 () Bool)

(assert (=> start!82160 m!887883))

(declare-fun m!887885 () Bool)

(assert (=> b!957530 m!887885))

(check-sat (not start!82160) (not mapNonEmpty!33715) (not b!957530) tp_is_empty!21157 (not b!957535) (not b!957528))
(check-sat)
