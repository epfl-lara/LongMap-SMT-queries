; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82376 () Bool)

(assert start!82376)

(declare-fun b_free!18481 () Bool)

(declare-fun b_next!18481 () Bool)

(assert (=> start!82376 (= b_free!18481 (not b_next!18481))))

(declare-fun tp!64404 () Bool)

(declare-fun b_and!29979 () Bool)

(assert (=> start!82376 (= tp!64404 b_and!29979)))

(declare-fun b!959075 () Bool)

(declare-fun res!641716 () Bool)

(declare-fun e!540759 () Bool)

(assert (=> b!959075 (=> (not res!641716) (not e!540759))))

(declare-datatypes ((array!58504 0))(
  ( (array!58505 (arr!28121 (Array (_ BitVec 32) (_ BitVec 64))) (size!28601 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58504)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959075 (= res!641716 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28601 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28601 _keys!1668))))))

(declare-fun mapNonEmpty!33760 () Bool)

(declare-fun mapRes!33760 () Bool)

(declare-fun tp!64405 () Bool)

(declare-fun e!540762 () Bool)

(assert (=> mapNonEmpty!33760 (= mapRes!33760 (and tp!64405 e!540762))))

(declare-datatypes ((V!33233 0))(
  ( (V!33234 (val!10644 Int)) )
))
(declare-datatypes ((ValueCell!10112 0))(
  ( (ValueCellFull!10112 (v!13198 V!33233)) (EmptyCell!10112) )
))
(declare-fun mapRest!33760 () (Array (_ BitVec 32) ValueCell!10112))

(declare-datatypes ((array!58506 0))(
  ( (array!58507 (arr!28122 (Array (_ BitVec 32) ValueCell!10112)) (size!28602 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58506)

(declare-fun mapKey!33760 () (_ BitVec 32))

(declare-fun mapValue!33760 () ValueCell!10112)

(assert (=> mapNonEmpty!33760 (= (arr!28122 _values!1386) (store mapRest!33760 mapKey!33760 mapValue!33760))))

(declare-fun b!959077 () Bool)

(declare-fun tp_is_empty!21187 () Bool)

(assert (=> b!959077 (= e!540762 tp_is_empty!21187)))

(declare-fun b!959078 () Bool)

(declare-fun res!641714 () Bool)

(assert (=> b!959078 (=> (not res!641714) (not e!540759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959078 (= res!641714 (validKeyInArray!0 (select (arr!28121 _keys!1668) i!793)))))

(declare-fun b!959079 () Bool)

(declare-fun e!540760 () Bool)

(declare-fun e!540761 () Bool)

(assert (=> b!959079 (= e!540760 (and e!540761 mapRes!33760))))

(declare-fun condMapEmpty!33760 () Bool)

(declare-fun mapDefault!33760 () ValueCell!10112)

(assert (=> b!959079 (= condMapEmpty!33760 (= (arr!28122 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10112)) mapDefault!33760)))))

(declare-fun mapIsEmpty!33760 () Bool)

(assert (=> mapIsEmpty!33760 mapRes!33760))

(declare-fun b!959076 () Bool)

(assert (=> b!959076 (= e!540759 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33233)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430774 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33233)

(declare-datatypes ((tuple2!13706 0))(
  ( (tuple2!13707 (_1!6864 (_ BitVec 64)) (_2!6864 V!33233)) )
))
(declare-datatypes ((List!19538 0))(
  ( (Nil!19535) (Cons!19534 (h!20702 tuple2!13706) (t!27893 List!19538)) )
))
(declare-datatypes ((ListLongMap!12405 0))(
  ( (ListLongMap!12406 (toList!6218 List!19538)) )
))
(declare-fun contains!5332 (ListLongMap!12405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3451 (array!58504 array!58506 (_ BitVec 32) (_ BitVec 32) V!33233 V!33233 (_ BitVec 32) Int) ListLongMap!12405)

(assert (=> b!959076 (= lt!430774 (contains!5332 (getCurrentListMap!3451 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28121 _keys!1668) i!793)))))

(declare-fun res!641715 () Bool)

(assert (=> start!82376 (=> (not res!641715) (not e!540759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82376 (= res!641715 (validMask!0 mask!2088))))

(assert (=> start!82376 e!540759))

(assert (=> start!82376 true))

(assert (=> start!82376 tp_is_empty!21187))

(declare-fun array_inv!21885 (array!58504) Bool)

(assert (=> start!82376 (array_inv!21885 _keys!1668)))

(declare-fun array_inv!21886 (array!58506) Bool)

(assert (=> start!82376 (and (array_inv!21886 _values!1386) e!540760)))

(assert (=> start!82376 tp!64404))

(declare-fun b!959080 () Bool)

(assert (=> b!959080 (= e!540761 tp_is_empty!21187)))

(declare-fun b!959081 () Bool)

(declare-fun res!641712 () Bool)

(assert (=> b!959081 (=> (not res!641712) (not e!540759))))

(assert (=> b!959081 (= res!641712 (and (= (size!28602 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28601 _keys!1668) (size!28602 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959082 () Bool)

(declare-fun res!641713 () Bool)

(assert (=> b!959082 (=> (not res!641713) (not e!540759))))

(declare-datatypes ((List!19539 0))(
  ( (Nil!19536) (Cons!19535 (h!20703 (_ BitVec 64)) (t!27894 List!19539)) )
))
(declare-fun arrayNoDuplicates!0 (array!58504 (_ BitVec 32) List!19539) Bool)

(assert (=> b!959082 (= res!641713 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19536))))

(declare-fun b!959083 () Bool)

(declare-fun res!641711 () Bool)

(assert (=> b!959083 (=> (not res!641711) (not e!540759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58504 (_ BitVec 32)) Bool)

(assert (=> b!959083 (= res!641711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82376 res!641715) b!959081))

(assert (= (and b!959081 res!641712) b!959083))

(assert (= (and b!959083 res!641711) b!959082))

(assert (= (and b!959082 res!641713) b!959075))

(assert (= (and b!959075 res!641716) b!959078))

(assert (= (and b!959078 res!641714) b!959076))

(assert (= (and b!959079 condMapEmpty!33760) mapIsEmpty!33760))

(assert (= (and b!959079 (not condMapEmpty!33760)) mapNonEmpty!33760))

(get-info :version)

(assert (= (and mapNonEmpty!33760 ((_ is ValueCellFull!10112) mapValue!33760)) b!959077))

(assert (= (and b!959079 ((_ is ValueCellFull!10112) mapDefault!33760)) b!959080))

(assert (= start!82376 b!959079))

(declare-fun m!890211 () Bool)

(assert (=> b!959076 m!890211))

(declare-fun m!890213 () Bool)

(assert (=> b!959076 m!890213))

(assert (=> b!959076 m!890211))

(assert (=> b!959076 m!890213))

(declare-fun m!890215 () Bool)

(assert (=> b!959076 m!890215))

(declare-fun m!890217 () Bool)

(assert (=> b!959082 m!890217))

(declare-fun m!890219 () Bool)

(assert (=> start!82376 m!890219))

(declare-fun m!890221 () Bool)

(assert (=> start!82376 m!890221))

(declare-fun m!890223 () Bool)

(assert (=> start!82376 m!890223))

(assert (=> b!959078 m!890213))

(assert (=> b!959078 m!890213))

(declare-fun m!890225 () Bool)

(assert (=> b!959078 m!890225))

(declare-fun m!890227 () Bool)

(assert (=> b!959083 m!890227))

(declare-fun m!890229 () Bool)

(assert (=> mapNonEmpty!33760 m!890229))

(check-sat (not b_next!18481) (not b!959082) (not b!959083) (not b!959078) tp_is_empty!21187 (not start!82376) b_and!29979 (not mapNonEmpty!33760) (not b!959076))
(check-sat b_and!29979 (not b_next!18481))
