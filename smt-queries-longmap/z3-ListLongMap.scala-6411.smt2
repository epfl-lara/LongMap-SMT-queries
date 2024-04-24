; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82430 () Bool)

(assert start!82430)

(declare-fun b_free!18535 () Bool)

(declare-fun b_next!18535 () Bool)

(assert (=> start!82430 (= b_free!18535 (not b_next!18535))))

(declare-fun tp!64567 () Bool)

(declare-fun b_and!30033 () Bool)

(assert (=> start!82430 (= tp!64567 b_and!30033)))

(declare-fun b!959816 () Bool)

(declare-fun res!642210 () Bool)

(declare-fun e!541164 () Bool)

(assert (=> b!959816 (=> (not res!642210) (not e!541164))))

(declare-datatypes ((array!58610 0))(
  ( (array!58611 (arr!28174 (Array (_ BitVec 32) (_ BitVec 64))) (size!28654 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58610)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959816 (= res!642210 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28654 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28654 _keys!1668))))))

(declare-fun b!959817 () Bool)

(declare-fun e!541166 () Bool)

(declare-fun tp_is_empty!21241 () Bool)

(assert (=> b!959817 (= e!541166 tp_is_empty!21241)))

(declare-fun b!959818 () Bool)

(declare-fun e!541163 () Bool)

(declare-fun mapRes!33841 () Bool)

(assert (=> b!959818 (= e!541163 (and e!541166 mapRes!33841))))

(declare-fun condMapEmpty!33841 () Bool)

(declare-datatypes ((V!33305 0))(
  ( (V!33306 (val!10671 Int)) )
))
(declare-datatypes ((ValueCell!10139 0))(
  ( (ValueCellFull!10139 (v!13225 V!33305)) (EmptyCell!10139) )
))
(declare-datatypes ((array!58612 0))(
  ( (array!58613 (arr!28175 (Array (_ BitVec 32) ValueCell!10139)) (size!28655 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58612)

(declare-fun mapDefault!33841 () ValueCell!10139)

(assert (=> b!959818 (= condMapEmpty!33841 (= (arr!28175 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10139)) mapDefault!33841)))))

(declare-fun mapIsEmpty!33841 () Bool)

(assert (=> mapIsEmpty!33841 mapRes!33841))

(declare-fun b!959819 () Bool)

(declare-fun res!642211 () Bool)

(assert (=> b!959819 (=> (not res!642211) (not e!541164))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!959819 (= res!642211 (and (= (size!28655 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28654 _keys!1668) (size!28655 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959820 () Bool)

(declare-fun res!642209 () Bool)

(assert (=> b!959820 (=> (not res!642209) (not e!541164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58610 (_ BitVec 32)) Bool)

(assert (=> b!959820 (= res!642209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959821 () Bool)

(assert (=> b!959821 (= e!541164 (not true))))

(declare-fun minValue!1328 () V!33305)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33305)

(declare-datatypes ((tuple2!13744 0))(
  ( (tuple2!13745 (_1!6883 (_ BitVec 64)) (_2!6883 V!33305)) )
))
(declare-datatypes ((List!19575 0))(
  ( (Nil!19572) (Cons!19571 (h!20739 tuple2!13744) (t!27930 List!19575)) )
))
(declare-datatypes ((ListLongMap!12443 0))(
  ( (ListLongMap!12444 (toList!6237 List!19575)) )
))
(declare-fun contains!5351 (ListLongMap!12443 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3470 (array!58610 array!58612 (_ BitVec 32) (_ BitVec 32) V!33305 V!33305 (_ BitVec 32) Int) ListLongMap!12443)

(assert (=> b!959821 (contains!5351 (getCurrentListMap!3470 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28174 _keys!1668) i!793))))

(declare-datatypes ((Unit!32130 0))(
  ( (Unit!32131) )
))
(declare-fun lt!430855 () Unit!32130)

(declare-fun lemmaInListMapFromThenInFromSmaller!3 (array!58610 array!58612 (_ BitVec 32) (_ BitVec 32) V!33305 V!33305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32130)

(assert (=> b!959821 (= lt!430855 (lemmaInListMapFromThenInFromSmaller!3 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun mapNonEmpty!33841 () Bool)

(declare-fun tp!64566 () Bool)

(declare-fun e!541167 () Bool)

(assert (=> mapNonEmpty!33841 (= mapRes!33841 (and tp!64566 e!541167))))

(declare-fun mapValue!33841 () ValueCell!10139)

(declare-fun mapRest!33841 () (Array (_ BitVec 32) ValueCell!10139))

(declare-fun mapKey!33841 () (_ BitVec 32))

(assert (=> mapNonEmpty!33841 (= (arr!28175 _values!1386) (store mapRest!33841 mapKey!33841 mapValue!33841))))

(declare-fun b!959822 () Bool)

(declare-fun res!642213 () Bool)

(assert (=> b!959822 (=> (not res!642213) (not e!541164))))

(declare-datatypes ((List!19576 0))(
  ( (Nil!19573) (Cons!19572 (h!20740 (_ BitVec 64)) (t!27931 List!19576)) )
))
(declare-fun arrayNoDuplicates!0 (array!58610 (_ BitVec 32) List!19576) Bool)

(assert (=> b!959822 (= res!642213 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19573))))

(declare-fun b!959823 () Bool)

(declare-fun res!642214 () Bool)

(assert (=> b!959823 (=> (not res!642214) (not e!541164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959823 (= res!642214 (validKeyInArray!0 (select (arr!28174 _keys!1668) i!793)))))

(declare-fun b!959824 () Bool)

(assert (=> b!959824 (= e!541167 tp_is_empty!21241)))

(declare-fun b!959815 () Bool)

(declare-fun res!642208 () Bool)

(assert (=> b!959815 (=> (not res!642208) (not e!541164))))

(assert (=> b!959815 (= res!642208 (contains!5351 (getCurrentListMap!3470 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28174 _keys!1668) i!793)))))

(declare-fun res!642212 () Bool)

(assert (=> start!82430 (=> (not res!642212) (not e!541164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82430 (= res!642212 (validMask!0 mask!2088))))

(assert (=> start!82430 e!541164))

(assert (=> start!82430 true))

(assert (=> start!82430 tp_is_empty!21241))

(declare-fun array_inv!21923 (array!58610) Bool)

(assert (=> start!82430 (array_inv!21923 _keys!1668)))

(declare-fun array_inv!21924 (array!58612) Bool)

(assert (=> start!82430 (and (array_inv!21924 _values!1386) e!541163)))

(assert (=> start!82430 tp!64567))

(assert (= (and start!82430 res!642212) b!959819))

(assert (= (and b!959819 res!642211) b!959820))

(assert (= (and b!959820 res!642209) b!959822))

(assert (= (and b!959822 res!642213) b!959816))

(assert (= (and b!959816 res!642210) b!959823))

(assert (= (and b!959823 res!642214) b!959815))

(assert (= (and b!959815 res!642208) b!959821))

(assert (= (and b!959818 condMapEmpty!33841) mapIsEmpty!33841))

(assert (= (and b!959818 (not condMapEmpty!33841)) mapNonEmpty!33841))

(get-info :version)

(assert (= (and mapNonEmpty!33841 ((_ is ValueCellFull!10139) mapValue!33841)) b!959824))

(assert (= (and b!959818 ((_ is ValueCellFull!10139) mapDefault!33841)) b!959817))

(assert (= start!82430 b!959818))

(declare-fun m!890769 () Bool)

(assert (=> b!959820 m!890769))

(declare-fun m!890771 () Bool)

(assert (=> mapNonEmpty!33841 m!890771))

(declare-fun m!890773 () Bool)

(assert (=> b!959823 m!890773))

(assert (=> b!959823 m!890773))

(declare-fun m!890775 () Bool)

(assert (=> b!959823 m!890775))

(declare-fun m!890777 () Bool)

(assert (=> b!959821 m!890777))

(assert (=> b!959821 m!890773))

(assert (=> b!959821 m!890777))

(assert (=> b!959821 m!890773))

(declare-fun m!890779 () Bool)

(assert (=> b!959821 m!890779))

(declare-fun m!890781 () Bool)

(assert (=> b!959821 m!890781))

(declare-fun m!890783 () Bool)

(assert (=> b!959815 m!890783))

(assert (=> b!959815 m!890773))

(assert (=> b!959815 m!890783))

(assert (=> b!959815 m!890773))

(declare-fun m!890785 () Bool)

(assert (=> b!959815 m!890785))

(declare-fun m!890787 () Bool)

(assert (=> b!959822 m!890787))

(declare-fun m!890789 () Bool)

(assert (=> start!82430 m!890789))

(declare-fun m!890791 () Bool)

(assert (=> start!82430 m!890791))

(declare-fun m!890793 () Bool)

(assert (=> start!82430 m!890793))

(check-sat (not b_next!18535) (not b!959815) b_and!30033 (not b!959821) (not start!82430) tp_is_empty!21241 (not b!959822) (not mapNonEmpty!33841) (not b!959820) (not b!959823))
(check-sat b_and!30033 (not b_next!18535))
