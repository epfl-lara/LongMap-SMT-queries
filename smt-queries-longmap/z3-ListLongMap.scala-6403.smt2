; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82382 () Bool)

(assert start!82382)

(declare-fun b_free!18487 () Bool)

(declare-fun b_next!18487 () Bool)

(assert (=> start!82382 (= b_free!18487 (not b_next!18487))))

(declare-fun tp!64422 () Bool)

(declare-fun b_and!29985 () Bool)

(assert (=> start!82382 (= tp!64422 b_and!29985)))

(declare-fun b!959156 () Bool)

(declare-fun e!540803 () Bool)

(declare-fun e!540807 () Bool)

(declare-fun mapRes!33769 () Bool)

(assert (=> b!959156 (= e!540803 (and e!540807 mapRes!33769))))

(declare-fun condMapEmpty!33769 () Bool)

(declare-datatypes ((V!33241 0))(
  ( (V!33242 (val!10647 Int)) )
))
(declare-datatypes ((ValueCell!10115 0))(
  ( (ValueCellFull!10115 (v!13201 V!33241)) (EmptyCell!10115) )
))
(declare-datatypes ((array!58516 0))(
  ( (array!58517 (arr!28127 (Array (_ BitVec 32) ValueCell!10115)) (size!28607 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58516)

(declare-fun mapDefault!33769 () ValueCell!10115)

(assert (=> b!959156 (= condMapEmpty!33769 (= (arr!28127 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10115)) mapDefault!33769)))))

(declare-fun b!959157 () Bool)

(declare-fun res!641767 () Bool)

(declare-fun e!540806 () Bool)

(assert (=> b!959157 (=> (not res!641767) (not e!540806))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58518 0))(
  ( (array!58519 (arr!28128 (Array (_ BitVec 32) (_ BitVec 64))) (size!28608 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58518)

(assert (=> b!959157 (= res!641767 (and (= (size!28607 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28608 _keys!1668) (size!28607 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959158 () Bool)

(declare-fun tp_is_empty!21193 () Bool)

(assert (=> b!959158 (= e!540807 tp_is_empty!21193)))

(declare-fun mapIsEmpty!33769 () Bool)

(assert (=> mapIsEmpty!33769 mapRes!33769))

(declare-fun mapNonEmpty!33769 () Bool)

(declare-fun tp!64423 () Bool)

(declare-fun e!540805 () Bool)

(assert (=> mapNonEmpty!33769 (= mapRes!33769 (and tp!64423 e!540805))))

(declare-fun mapValue!33769 () ValueCell!10115)

(declare-fun mapKey!33769 () (_ BitVec 32))

(declare-fun mapRest!33769 () (Array (_ BitVec 32) ValueCell!10115))

(assert (=> mapNonEmpty!33769 (= (arr!28127 _values!1386) (store mapRest!33769 mapKey!33769 mapValue!33769))))

(declare-fun b!959160 () Bool)

(assert (=> b!959160 (= e!540805 tp_is_empty!21193)))

(declare-fun b!959161 () Bool)

(declare-fun res!641770 () Bool)

(assert (=> b!959161 (=> (not res!641770) (not e!540806))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959161 (= res!641770 (validKeyInArray!0 (select (arr!28128 _keys!1668) i!793)))))

(declare-fun b!959162 () Bool)

(declare-fun res!641768 () Bool)

(assert (=> b!959162 (=> (not res!641768) (not e!540806))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959162 (= res!641768 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28608 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28608 _keys!1668))))))

(declare-fun b!959163 () Bool)

(declare-fun res!641765 () Bool)

(assert (=> b!959163 (=> (not res!641765) (not e!540806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58518 (_ BitVec 32)) Bool)

(assert (=> b!959163 (= res!641765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959164 () Bool)

(declare-fun res!641769 () Bool)

(assert (=> b!959164 (=> (not res!641769) (not e!540806))))

(declare-datatypes ((List!19542 0))(
  ( (Nil!19539) (Cons!19538 (h!20706 (_ BitVec 64)) (t!27897 List!19542)) )
))
(declare-fun arrayNoDuplicates!0 (array!58518 (_ BitVec 32) List!19542) Bool)

(assert (=> b!959164 (= res!641769 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19539))))

(declare-fun res!641766 () Bool)

(assert (=> start!82382 (=> (not res!641766) (not e!540806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82382 (= res!641766 (validMask!0 mask!2088))))

(assert (=> start!82382 e!540806))

(assert (=> start!82382 true))

(assert (=> start!82382 tp_is_empty!21193))

(declare-fun array_inv!21889 (array!58518) Bool)

(assert (=> start!82382 (array_inv!21889 _keys!1668)))

(declare-fun array_inv!21890 (array!58516) Bool)

(assert (=> start!82382 (and (array_inv!21890 _values!1386) e!540803)))

(assert (=> start!82382 tp!64422))

(declare-fun b!959159 () Bool)

(assert (=> b!959159 (= e!540806 false)))

(declare-fun minValue!1328 () V!33241)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33241)

(declare-fun lt!430783 () Bool)

(declare-datatypes ((tuple2!13710 0))(
  ( (tuple2!13711 (_1!6866 (_ BitVec 64)) (_2!6866 V!33241)) )
))
(declare-datatypes ((List!19543 0))(
  ( (Nil!19540) (Cons!19539 (h!20707 tuple2!13710) (t!27898 List!19543)) )
))
(declare-datatypes ((ListLongMap!12409 0))(
  ( (ListLongMap!12410 (toList!6220 List!19543)) )
))
(declare-fun contains!5334 (ListLongMap!12409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3453 (array!58518 array!58516 (_ BitVec 32) (_ BitVec 32) V!33241 V!33241 (_ BitVec 32) Int) ListLongMap!12409)

(assert (=> b!959159 (= lt!430783 (contains!5334 (getCurrentListMap!3453 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28128 _keys!1668) i!793)))))

(assert (= (and start!82382 res!641766) b!959157))

(assert (= (and b!959157 res!641767) b!959163))

(assert (= (and b!959163 res!641765) b!959164))

(assert (= (and b!959164 res!641769) b!959162))

(assert (= (and b!959162 res!641768) b!959161))

(assert (= (and b!959161 res!641770) b!959159))

(assert (= (and b!959156 condMapEmpty!33769) mapIsEmpty!33769))

(assert (= (and b!959156 (not condMapEmpty!33769)) mapNonEmpty!33769))

(get-info :version)

(assert (= (and mapNonEmpty!33769 ((_ is ValueCellFull!10115) mapValue!33769)) b!959160))

(assert (= (and b!959156 ((_ is ValueCellFull!10115) mapDefault!33769)) b!959158))

(assert (= start!82382 b!959156))

(declare-fun m!890271 () Bool)

(assert (=> b!959161 m!890271))

(assert (=> b!959161 m!890271))

(declare-fun m!890273 () Bool)

(assert (=> b!959161 m!890273))

(declare-fun m!890275 () Bool)

(assert (=> mapNonEmpty!33769 m!890275))

(declare-fun m!890277 () Bool)

(assert (=> start!82382 m!890277))

(declare-fun m!890279 () Bool)

(assert (=> start!82382 m!890279))

(declare-fun m!890281 () Bool)

(assert (=> start!82382 m!890281))

(declare-fun m!890283 () Bool)

(assert (=> b!959163 m!890283))

(declare-fun m!890285 () Bool)

(assert (=> b!959164 m!890285))

(declare-fun m!890287 () Bool)

(assert (=> b!959159 m!890287))

(assert (=> b!959159 m!890271))

(assert (=> b!959159 m!890287))

(assert (=> b!959159 m!890271))

(declare-fun m!890289 () Bool)

(assert (=> b!959159 m!890289))

(check-sat (not b!959164) (not b!959161) (not b!959159) (not start!82382) (not mapNonEmpty!33769) (not b_next!18487) tp_is_empty!21193 (not b!959163) b_and!29985)
(check-sat b_and!29985 (not b_next!18487))
