; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108176 () Bool)

(assert start!108176)

(declare-fun b_free!27871 () Bool)

(declare-fun b_next!27871 () Bool)

(assert (=> start!108176 (= b_free!27871 (not b_next!27871))))

(declare-fun tp!98570 () Bool)

(declare-fun b_and!45929 () Bool)

(assert (=> start!108176 (= tp!98570 b_and!45929)))

(declare-fun res!848835 () Bool)

(declare-fun e!729548 () Bool)

(assert (=> start!108176 (=> (not res!848835) (not e!729548))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108176 (= res!848835 (validMask!0 mask!1805))))

(assert (=> start!108176 e!729548))

(assert (=> start!108176 true))

(assert (=> start!108176 tp!98570))

(declare-fun tp_is_empty!33421 () Bool)

(assert (=> start!108176 tp_is_empty!33421))

(declare-datatypes ((V!49665 0))(
  ( (V!49666 (val!16785 Int)) )
))
(declare-datatypes ((ValueCell!15812 0))(
  ( (ValueCellFull!15812 (v!19383 V!49665)) (EmptyCell!15812) )
))
(declare-datatypes ((array!83936 0))(
  ( (array!83937 (arr!40478 (Array (_ BitVec 32) ValueCell!15812)) (size!41028 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83936)

(declare-fun e!729549 () Bool)

(declare-fun array_inv!30755 (array!83936) Bool)

(assert (=> start!108176 (and (array_inv!30755 _values!1187) e!729549)))

(declare-datatypes ((array!83938 0))(
  ( (array!83939 (arr!40479 (Array (_ BitVec 32) (_ BitVec 64))) (size!41029 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83938)

(declare-fun array_inv!30756 (array!83938) Bool)

(assert (=> start!108176 (array_inv!30756 _keys!1427)))

(declare-fun b!1277445 () Bool)

(declare-fun e!729547 () Bool)

(assert (=> b!1277445 (= e!729547 tp_is_empty!33421)))

(declare-fun b!1277446 () Bool)

(declare-fun res!848832 () Bool)

(assert (=> b!1277446 (=> (not res!848832) (not e!729548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83938 (_ BitVec 32)) Bool)

(assert (=> b!1277446 (= res!848832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277447 () Bool)

(assert (=> b!1277447 (= e!729548 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49665)

(declare-fun lt!575698 () Bool)

(declare-fun zeroValue!1129 () V!49665)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((tuple2!21530 0))(
  ( (tuple2!21531 (_1!10776 (_ BitVec 64)) (_2!10776 V!49665)) )
))
(declare-datatypes ((List!28707 0))(
  ( (Nil!28704) (Cons!28703 (h!29912 tuple2!21530) (t!42245 List!28707)) )
))
(declare-datatypes ((ListLongMap!19187 0))(
  ( (ListLongMap!19188 (toList!9609 List!28707)) )
))
(declare-fun contains!7719 (ListLongMap!19187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4693 (array!83938 array!83936 (_ BitVec 32) (_ BitVec 32) V!49665 V!49665 (_ BitVec 32) Int) ListLongMap!19187)

(assert (=> b!1277447 (= lt!575698 (contains!7719 (getCurrentListMap!4693 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277448 () Bool)

(declare-fun e!729545 () Bool)

(assert (=> b!1277448 (= e!729545 tp_is_empty!33421)))

(declare-fun mapIsEmpty!51665 () Bool)

(declare-fun mapRes!51665 () Bool)

(assert (=> mapIsEmpty!51665 mapRes!51665))

(declare-fun b!1277449 () Bool)

(declare-fun res!848834 () Bool)

(assert (=> b!1277449 (=> (not res!848834) (not e!729548))))

(declare-datatypes ((List!28708 0))(
  ( (Nil!28705) (Cons!28704 (h!29913 (_ BitVec 64)) (t!42246 List!28708)) )
))
(declare-fun arrayNoDuplicates!0 (array!83938 (_ BitVec 32) List!28708) Bool)

(assert (=> b!1277449 (= res!848834 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28705))))

(declare-fun mapNonEmpty!51665 () Bool)

(declare-fun tp!98569 () Bool)

(assert (=> mapNonEmpty!51665 (= mapRes!51665 (and tp!98569 e!729547))))

(declare-fun mapKey!51665 () (_ BitVec 32))

(declare-fun mapRest!51665 () (Array (_ BitVec 32) ValueCell!15812))

(declare-fun mapValue!51665 () ValueCell!15812)

(assert (=> mapNonEmpty!51665 (= (arr!40478 _values!1187) (store mapRest!51665 mapKey!51665 mapValue!51665))))

(declare-fun b!1277450 () Bool)

(declare-fun res!848833 () Bool)

(assert (=> b!1277450 (=> (not res!848833) (not e!729548))))

(assert (=> b!1277450 (= res!848833 (and (= (size!41028 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41029 _keys!1427) (size!41028 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277451 () Bool)

(assert (=> b!1277451 (= e!729549 (and e!729545 mapRes!51665))))

(declare-fun condMapEmpty!51665 () Bool)

(declare-fun mapDefault!51665 () ValueCell!15812)

