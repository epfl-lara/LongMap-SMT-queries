; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82352 () Bool)

(assert start!82352)

(declare-fun b_free!18637 () Bool)

(declare-fun b_next!18637 () Bool)

(assert (=> start!82352 (= b_free!18637 (not b_next!18637))))

(declare-fun tp!64882 () Bool)

(declare-fun b_and!30099 () Bool)

(assert (=> start!82352 (= tp!64882 b_and!30099)))

(declare-fun b!960183 () Bool)

(declare-fun res!642783 () Bool)

(declare-fun e!541245 () Bool)

(assert (=> b!960183 (=> (not res!642783) (not e!541245))))

(declare-datatypes ((array!58724 0))(
  ( (array!58725 (arr!28236 (Array (_ BitVec 32) (_ BitVec 64))) (size!28717 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58724)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960183 (= res!642783 (validKeyInArray!0 (select (arr!28236 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!34003 () Bool)

(declare-fun mapRes!34003 () Bool)

(assert (=> mapIsEmpty!34003 mapRes!34003))

(declare-fun b!960185 () Bool)

(declare-fun e!541246 () Bool)

(declare-fun tp_is_empty!21349 () Bool)

(assert (=> b!960185 (= e!541246 tp_is_empty!21349)))

(declare-fun b!960186 () Bool)

(declare-fun res!642779 () Bool)

(assert (=> b!960186 (=> (not res!642779) (not e!541245))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33449 0))(
  ( (V!33450 (val!10725 Int)) )
))
(declare-datatypes ((ValueCell!10193 0))(
  ( (ValueCellFull!10193 (v!13281 V!33449)) (EmptyCell!10193) )
))
(declare-datatypes ((array!58726 0))(
  ( (array!58727 (arr!28237 (Array (_ BitVec 32) ValueCell!10193)) (size!28718 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58726)

(assert (=> b!960186 (= res!642779 (and (= (size!28718 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28717 _keys!1668) (size!28718 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34003 () Bool)

(declare-fun tp!64881 () Bool)

(declare-fun e!541243 () Bool)

(assert (=> mapNonEmpty!34003 (= mapRes!34003 (and tp!64881 e!541243))))

(declare-fun mapValue!34003 () ValueCell!10193)

(declare-fun mapRest!34003 () (Array (_ BitVec 32) ValueCell!10193))

(declare-fun mapKey!34003 () (_ BitVec 32))

(assert (=> mapNonEmpty!34003 (= (arr!28237 _values!1386) (store mapRest!34003 mapKey!34003 mapValue!34003))))

(declare-fun b!960187 () Bool)

(assert (=> b!960187 (= e!541245 false)))

(declare-fun minValue!1328 () V!33449)

(declare-fun lt!430411 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33449)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13886 0))(
  ( (tuple2!13887 (_1!6954 (_ BitVec 64)) (_2!6954 V!33449)) )
))
(declare-datatypes ((List!19670 0))(
  ( (Nil!19667) (Cons!19666 (h!20828 tuple2!13886) (t!28024 List!19670)) )
))
(declare-datatypes ((ListLongMap!12573 0))(
  ( (ListLongMap!12574 (toList!6302 List!19670)) )
))
(declare-fun contains!5345 (ListLongMap!12573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3464 (array!58724 array!58726 (_ BitVec 32) (_ BitVec 32) V!33449 V!33449 (_ BitVec 32) Int) ListLongMap!12573)

(assert (=> b!960187 (= lt!430411 (contains!5345 (getCurrentListMap!3464 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28236 _keys!1668) i!793)))))

(declare-fun res!642778 () Bool)

(assert (=> start!82352 (=> (not res!642778) (not e!541245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82352 (= res!642778 (validMask!0 mask!2088))))

(assert (=> start!82352 e!541245))

(assert (=> start!82352 true))

(assert (=> start!82352 tp_is_empty!21349))

(declare-fun array_inv!21945 (array!58724) Bool)

(assert (=> start!82352 (array_inv!21945 _keys!1668)))

(declare-fun e!541247 () Bool)

(declare-fun array_inv!21946 (array!58726) Bool)

(assert (=> start!82352 (and (array_inv!21946 _values!1386) e!541247)))

(assert (=> start!82352 tp!64882))

(declare-fun b!960184 () Bool)

(assert (=> b!960184 (= e!541243 tp_is_empty!21349)))

(declare-fun b!960188 () Bool)

(declare-fun res!642782 () Bool)

(assert (=> b!960188 (=> (not res!642782) (not e!541245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58724 (_ BitVec 32)) Bool)

(assert (=> b!960188 (= res!642782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960189 () Bool)

(assert (=> b!960189 (= e!541247 (and e!541246 mapRes!34003))))

(declare-fun condMapEmpty!34003 () Bool)

(declare-fun mapDefault!34003 () ValueCell!10193)

(assert (=> b!960189 (= condMapEmpty!34003 (= (arr!28237 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10193)) mapDefault!34003)))))

(declare-fun b!960190 () Bool)

(declare-fun res!642780 () Bool)

(assert (=> b!960190 (=> (not res!642780) (not e!541245))))

(declare-datatypes ((List!19671 0))(
  ( (Nil!19668) (Cons!19667 (h!20829 (_ BitVec 64)) (t!28025 List!19671)) )
))
(declare-fun arrayNoDuplicates!0 (array!58724 (_ BitVec 32) List!19671) Bool)

(assert (=> b!960190 (= res!642780 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19668))))

(declare-fun b!960191 () Bool)

(declare-fun res!642781 () Bool)

(assert (=> b!960191 (=> (not res!642781) (not e!541245))))

(assert (=> b!960191 (= res!642781 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28717 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28717 _keys!1668))))))

(assert (= (and start!82352 res!642778) b!960186))

(assert (= (and b!960186 res!642779) b!960188))

(assert (= (and b!960188 res!642782) b!960190))

(assert (= (and b!960190 res!642780) b!960191))

(assert (= (and b!960191 res!642781) b!960183))

(assert (= (and b!960183 res!642783) b!960187))

(assert (= (and b!960189 condMapEmpty!34003) mapIsEmpty!34003))

(assert (= (and b!960189 (not condMapEmpty!34003)) mapNonEmpty!34003))

(get-info :version)

(assert (= (and mapNonEmpty!34003 ((_ is ValueCellFull!10193) mapValue!34003)) b!960184))

(assert (= (and b!960189 ((_ is ValueCellFull!10193) mapDefault!34003)) b!960185))

(assert (= start!82352 b!960189))

(declare-fun m!889911 () Bool)

(assert (=> b!960187 m!889911))

(declare-fun m!889913 () Bool)

(assert (=> b!960187 m!889913))

(assert (=> b!960187 m!889911))

(assert (=> b!960187 m!889913))

(declare-fun m!889915 () Bool)

(assert (=> b!960187 m!889915))

(declare-fun m!889917 () Bool)

(assert (=> start!82352 m!889917))

(declare-fun m!889919 () Bool)

(assert (=> start!82352 m!889919))

(declare-fun m!889921 () Bool)

(assert (=> start!82352 m!889921))

(declare-fun m!889923 () Bool)

(assert (=> mapNonEmpty!34003 m!889923))

(declare-fun m!889925 () Bool)

(assert (=> b!960190 m!889925))

(declare-fun m!889927 () Bool)

(assert (=> b!960188 m!889927))

(assert (=> b!960183 m!889913))

(assert (=> b!960183 m!889913))

(declare-fun m!889929 () Bool)

(assert (=> b!960183 m!889929))

(check-sat (not start!82352) (not b!960187) (not mapNonEmpty!34003) (not b!960188) (not b!960183) b_and!30099 (not b_next!18637) (not b!960190) tp_is_empty!21349)
(check-sat b_and!30099 (not b_next!18637))
