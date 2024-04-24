; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82206 () Bool)

(assert start!82206)

(declare-fun b_free!18445 () Bool)

(declare-fun b_next!18445 () Bool)

(assert (=> start!82206 (= b_free!18445 (not b_next!18445))))

(declare-fun tp!64146 () Bool)

(declare-fun b_and!29943 () Bool)

(assert (=> start!82206 (= tp!64146 b_and!29943)))

(declare-fun b!957628 () Bool)

(declare-fun e!539721 () Bool)

(declare-fun tp_is_empty!21061 () Bool)

(assert (=> b!957628 (= e!539721 tp_is_empty!21061)))

(declare-fun b!957629 () Bool)

(declare-fun res!640900 () Bool)

(declare-fun e!539722 () Bool)

(assert (=> b!957629 (=> (not res!640900) (not e!539722))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58260 0))(
  ( (array!58261 (arr!28004 (Array (_ BitVec 32) (_ BitVec 64))) (size!28484 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58260)

(declare-datatypes ((V!33065 0))(
  ( (V!33066 (val!10581 Int)) )
))
(declare-datatypes ((ValueCell!10049 0))(
  ( (ValueCellFull!10049 (v!13134 V!33065)) (EmptyCell!10049) )
))
(declare-datatypes ((array!58262 0))(
  ( (array!58263 (arr!28005 (Array (_ BitVec 32) ValueCell!10049)) (size!28485 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58262)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!957629 (= res!640900 (and (= (size!28485 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28484 _keys!1441) (size!28485 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!957630 () Bool)

(declare-fun res!640897 () Bool)

(assert (=> b!957630 (=> (not res!640897) (not e!539722))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!957630 (= res!640897 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28484 _keys!1441))))))

(declare-fun b!957631 () Bool)

(declare-fun res!640899 () Bool)

(assert (=> b!957631 (=> (not res!640899) (not e!539722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58260 (_ BitVec 32)) Bool)

(assert (=> b!957631 (= res!640899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33556 () Bool)

(declare-fun mapRes!33556 () Bool)

(declare-fun tp!64147 () Bool)

(assert (=> mapNonEmpty!33556 (= mapRes!33556 (and tp!64147 e!539721))))

(declare-fun mapKey!33556 () (_ BitVec 32))

(declare-fun mapValue!33556 () ValueCell!10049)

(declare-fun mapRest!33556 () (Array (_ BitVec 32) ValueCell!10049))

(assert (=> mapNonEmpty!33556 (= (arr!28005 _values!1197) (store mapRest!33556 mapKey!33556 mapValue!33556))))

(declare-fun b!957632 () Bool)

(declare-fun e!539718 () Bool)

(assert (=> b!957632 (= e!539718 tp_is_empty!21061)))

(declare-fun b!957633 () Bool)

(declare-fun res!640895 () Bool)

(assert (=> b!957633 (=> (not res!640895) (not e!539722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957633 (= res!640895 (validKeyInArray!0 (select (arr!28004 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33556 () Bool)

(assert (=> mapIsEmpty!33556 mapRes!33556))

(declare-fun res!640898 () Bool)

(assert (=> start!82206 (=> (not res!640898) (not e!539722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82206 (= res!640898 (validMask!0 mask!1823))))

(assert (=> start!82206 e!539722))

(assert (=> start!82206 true))

(assert (=> start!82206 tp_is_empty!21061))

(declare-fun array_inv!21801 (array!58260) Bool)

(assert (=> start!82206 (array_inv!21801 _keys!1441)))

(declare-fun e!539720 () Bool)

(declare-fun array_inv!21802 (array!58262) Bool)

(assert (=> start!82206 (and (array_inv!21802 _values!1197) e!539720)))

(assert (=> start!82206 tp!64146))

(declare-fun b!957634 () Bool)

(assert (=> b!957634 (= e!539722 (not true))))

(declare-fun zeroValue!1139 () V!33065)

(declare-fun minValue!1139 () V!33065)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13678 0))(
  ( (tuple2!13679 (_1!6850 (_ BitVec 64)) (_2!6850 V!33065)) )
))
(declare-datatypes ((List!19487 0))(
  ( (Nil!19484) (Cons!19483 (h!20651 tuple2!13678) (t!27842 List!19487)) )
))
(declare-datatypes ((ListLongMap!12377 0))(
  ( (ListLongMap!12378 (toList!6204 List!19487)) )
))
(declare-fun contains!5314 (ListLongMap!12377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3437 (array!58260 array!58262 (_ BitVec 32) (_ BitVec 32) V!33065 V!33065 (_ BitVec 32) Int) ListLongMap!12377)

(assert (=> b!957634 (contains!5314 (getCurrentListMap!3437 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!28004 _keys!1441) i!735))))

(declare-datatypes ((Unit!32110 0))(
  ( (Unit!32111) )
))
(declare-fun lt!430608 () Unit!32110)

(declare-fun lemmaInListMapFromThenFromZero!18 (array!58260 array!58262 (_ BitVec 32) (_ BitVec 32) V!33065 V!33065 (_ BitVec 32) (_ BitVec 32) Int) Unit!32110)

(assert (=> b!957634 (= lt!430608 (lemmaInListMapFromThenFromZero!18 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!957635 () Bool)

(declare-fun res!640901 () Bool)

(assert (=> b!957635 (=> (not res!640901) (not e!539722))))

(assert (=> b!957635 (= res!640901 (contains!5314 (getCurrentListMap!3437 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!28004 _keys!1441) i!735)))))

(declare-fun b!957636 () Bool)

(assert (=> b!957636 (= e!539720 (and e!539718 mapRes!33556))))

(declare-fun condMapEmpty!33556 () Bool)

(declare-fun mapDefault!33556 () ValueCell!10049)

(assert (=> b!957636 (= condMapEmpty!33556 (= (arr!28005 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10049)) mapDefault!33556)))))

(declare-fun b!957637 () Bool)

(declare-fun res!640896 () Bool)

(assert (=> b!957637 (=> (not res!640896) (not e!539722))))

(declare-datatypes ((List!19488 0))(
  ( (Nil!19485) (Cons!19484 (h!20652 (_ BitVec 64)) (t!27843 List!19488)) )
))
(declare-fun arrayNoDuplicates!0 (array!58260 (_ BitVec 32) List!19488) Bool)

(assert (=> b!957637 (= res!640896 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19485))))

(assert (= (and start!82206 res!640898) b!957629))

(assert (= (and b!957629 res!640900) b!957631))

(assert (= (and b!957631 res!640899) b!957637))

(assert (= (and b!957637 res!640896) b!957630))

(assert (= (and b!957630 res!640897) b!957633))

(assert (= (and b!957633 res!640895) b!957635))

(assert (= (and b!957635 res!640901) b!957634))

(assert (= (and b!957636 condMapEmpty!33556) mapIsEmpty!33556))

(assert (= (and b!957636 (not condMapEmpty!33556)) mapNonEmpty!33556))

(get-info :version)

(assert (= (and mapNonEmpty!33556 ((_ is ValueCellFull!10049) mapValue!33556)) b!957628))

(assert (= (and b!957636 ((_ is ValueCellFull!10049) mapDefault!33556)) b!957632))

(assert (= start!82206 b!957636))

(declare-fun m!889211 () Bool)

(assert (=> b!957637 m!889211))

(declare-fun m!889213 () Bool)

(assert (=> b!957633 m!889213))

(assert (=> b!957633 m!889213))

(declare-fun m!889215 () Bool)

(assert (=> b!957633 m!889215))

(declare-fun m!889217 () Bool)

(assert (=> start!82206 m!889217))

(declare-fun m!889219 () Bool)

(assert (=> start!82206 m!889219))

(declare-fun m!889221 () Bool)

(assert (=> start!82206 m!889221))

(declare-fun m!889223 () Bool)

(assert (=> b!957631 m!889223))

(declare-fun m!889225 () Bool)

(assert (=> mapNonEmpty!33556 m!889225))

(declare-fun m!889227 () Bool)

(assert (=> b!957635 m!889227))

(assert (=> b!957635 m!889213))

(assert (=> b!957635 m!889227))

(assert (=> b!957635 m!889213))

(declare-fun m!889229 () Bool)

(assert (=> b!957635 m!889229))

(declare-fun m!889231 () Bool)

(assert (=> b!957634 m!889231))

(assert (=> b!957634 m!889213))

(assert (=> b!957634 m!889231))

(assert (=> b!957634 m!889213))

(declare-fun m!889233 () Bool)

(assert (=> b!957634 m!889233))

(declare-fun m!889235 () Bool)

(assert (=> b!957634 m!889235))

(check-sat (not start!82206) tp_is_empty!21061 (not mapNonEmpty!33556) (not b_next!18445) (not b!957635) (not b!957631) (not b!957633) (not b!957634) b_and!29943 (not b!957637))
(check-sat b_and!29943 (not b_next!18445))
