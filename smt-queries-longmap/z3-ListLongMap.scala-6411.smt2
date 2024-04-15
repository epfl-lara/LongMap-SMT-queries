; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82244 () Bool)

(assert start!82244)

(declare-fun b_free!18535 () Bool)

(declare-fun b_next!18535 () Bool)

(assert (=> start!82244 (= b_free!18535 (not b_next!18535))))

(declare-fun tp!64566 () Bool)

(declare-fun b_and!29997 () Bool)

(assert (=> start!82244 (= tp!64566 b_and!29997)))

(declare-fun b!958673 () Bool)

(declare-fun res!641758 () Bool)

(declare-fun e!540436 () Bool)

(assert (=> b!958673 (=> (not res!641758) (not e!540436))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58512 0))(
  ( (array!58513 (arr!28130 (Array (_ BitVec 32) (_ BitVec 64))) (size!28611 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58512)

(declare-datatypes ((V!33305 0))(
  ( (V!33306 (val!10671 Int)) )
))
(declare-datatypes ((ValueCell!10139 0))(
  ( (ValueCellFull!10139 (v!13227 V!33305)) (EmptyCell!10139) )
))
(declare-datatypes ((array!58514 0))(
  ( (array!58515 (arr!28131 (Array (_ BitVec 32) ValueCell!10139)) (size!28612 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58514)

(assert (=> b!958673 (= res!641758 (and (= (size!28612 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28611 _keys!1668) (size!28612 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33841 () Bool)

(declare-fun mapRes!33841 () Bool)

(declare-fun tp!64567 () Bool)

(declare-fun e!540435 () Bool)

(assert (=> mapNonEmpty!33841 (= mapRes!33841 (and tp!64567 e!540435))))

(declare-fun mapKey!33841 () (_ BitVec 32))

(declare-fun mapRest!33841 () (Array (_ BitVec 32) ValueCell!10139))

(declare-fun mapValue!33841 () ValueCell!10139)

(assert (=> mapNonEmpty!33841 (= (arr!28131 _values!1386) (store mapRest!33841 mapKey!33841 mapValue!33841))))

(declare-fun b!958674 () Bool)

(assert (=> b!958674 (= e!540436 (not true))))

(declare-fun minValue!1328 () V!33305)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33305)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13806 0))(
  ( (tuple2!13807 (_1!6914 (_ BitVec 64)) (_2!6914 V!33305)) )
))
(declare-datatypes ((List!19591 0))(
  ( (Nil!19588) (Cons!19587 (h!20749 tuple2!13806) (t!27945 List!19591)) )
))
(declare-datatypes ((ListLongMap!12493 0))(
  ( (ListLongMap!12494 (toList!6262 List!19591)) )
))
(declare-fun contains!5308 (ListLongMap!12493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3424 (array!58512 array!58514 (_ BitVec 32) (_ BitVec 32) V!33305 V!33305 (_ BitVec 32) Int) ListLongMap!12493)

(assert (=> b!958674 (contains!5308 (getCurrentListMap!3424 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28130 _keys!1668) i!793))))

(declare-datatypes ((Unit!32024 0))(
  ( (Unit!32025) )
))
(declare-fun lt!430258 () Unit!32024)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!3 (array!58512 array!58514 (_ BitVec 32) (_ BitVec 32) V!33305 V!33305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32024)

(assert (=> b!958674 (= lt!430258 (lemmaInListMapFromThenInFromSmaller!3 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!958675 () Bool)

(declare-fun e!540437 () Bool)

(declare-fun e!540433 () Bool)

(assert (=> b!958675 (= e!540437 (and e!540433 mapRes!33841))))

(declare-fun condMapEmpty!33841 () Bool)

(declare-fun mapDefault!33841 () ValueCell!10139)

(assert (=> b!958675 (= condMapEmpty!33841 (= (arr!28131 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10139)) mapDefault!33841)))))

(declare-fun b!958676 () Bool)

(declare-fun res!641759 () Bool)

(assert (=> b!958676 (=> (not res!641759) (not e!540436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958676 (= res!641759 (validKeyInArray!0 (select (arr!28130 _keys!1668) i!793)))))

(declare-fun b!958677 () Bool)

(declare-fun tp_is_empty!21241 () Bool)

(assert (=> b!958677 (= e!540435 tp_is_empty!21241)))

(declare-fun res!641754 () Bool)

(assert (=> start!82244 (=> (not res!641754) (not e!540436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82244 (= res!641754 (validMask!0 mask!2088))))

(assert (=> start!82244 e!540436))

(assert (=> start!82244 true))

(assert (=> start!82244 tp_is_empty!21241))

(declare-fun array_inv!21869 (array!58512) Bool)

(assert (=> start!82244 (array_inv!21869 _keys!1668)))

(declare-fun array_inv!21870 (array!58514) Bool)

(assert (=> start!82244 (and (array_inv!21870 _values!1386) e!540437)))

(assert (=> start!82244 tp!64566))

(declare-fun b!958678 () Bool)

(declare-fun res!641757 () Bool)

(assert (=> b!958678 (=> (not res!641757) (not e!540436))))

(assert (=> b!958678 (= res!641757 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28611 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28611 _keys!1668))))))

(declare-fun mapIsEmpty!33841 () Bool)

(assert (=> mapIsEmpty!33841 mapRes!33841))

(declare-fun b!958679 () Bool)

(declare-fun res!641756 () Bool)

(assert (=> b!958679 (=> (not res!641756) (not e!540436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58512 (_ BitVec 32)) Bool)

(assert (=> b!958679 (= res!641756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958680 () Bool)

(assert (=> b!958680 (= e!540433 tp_is_empty!21241)))

(declare-fun b!958681 () Bool)

(declare-fun res!641755 () Bool)

(assert (=> b!958681 (=> (not res!641755) (not e!540436))))

(assert (=> b!958681 (= res!641755 (contains!5308 (getCurrentListMap!3424 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28130 _keys!1668) i!793)))))

(declare-fun b!958682 () Bool)

(declare-fun res!641760 () Bool)

(assert (=> b!958682 (=> (not res!641760) (not e!540436))))

(declare-datatypes ((List!19592 0))(
  ( (Nil!19589) (Cons!19588 (h!20750 (_ BitVec 64)) (t!27946 List!19592)) )
))
(declare-fun arrayNoDuplicates!0 (array!58512 (_ BitVec 32) List!19592) Bool)

(assert (=> b!958682 (= res!641760 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19589))))

(assert (= (and start!82244 res!641754) b!958673))

(assert (= (and b!958673 res!641758) b!958679))

(assert (= (and b!958679 res!641756) b!958682))

(assert (= (and b!958682 res!641760) b!958678))

(assert (= (and b!958678 res!641757) b!958676))

(assert (= (and b!958676 res!641759) b!958681))

(assert (= (and b!958681 res!641755) b!958674))

(assert (= (and b!958675 condMapEmpty!33841) mapIsEmpty!33841))

(assert (= (and b!958675 (not condMapEmpty!33841)) mapNonEmpty!33841))

(get-info :version)

(assert (= (and mapNonEmpty!33841 ((_ is ValueCellFull!10139) mapValue!33841)) b!958677))

(assert (= (and b!958675 ((_ is ValueCellFull!10139) mapDefault!33841)) b!958680))

(assert (= start!82244 b!958675))

(declare-fun m!888717 () Bool)

(assert (=> b!958674 m!888717))

(declare-fun m!888719 () Bool)

(assert (=> b!958674 m!888719))

(assert (=> b!958674 m!888717))

(assert (=> b!958674 m!888719))

(declare-fun m!888721 () Bool)

(assert (=> b!958674 m!888721))

(declare-fun m!888723 () Bool)

(assert (=> b!958674 m!888723))

(declare-fun m!888725 () Bool)

(assert (=> b!958681 m!888725))

(assert (=> b!958681 m!888719))

(assert (=> b!958681 m!888725))

(assert (=> b!958681 m!888719))

(declare-fun m!888727 () Bool)

(assert (=> b!958681 m!888727))

(declare-fun m!888729 () Bool)

(assert (=> b!958679 m!888729))

(declare-fun m!888731 () Bool)

(assert (=> b!958682 m!888731))

(assert (=> b!958676 m!888719))

(assert (=> b!958676 m!888719))

(declare-fun m!888733 () Bool)

(assert (=> b!958676 m!888733))

(declare-fun m!888735 () Bool)

(assert (=> start!82244 m!888735))

(declare-fun m!888737 () Bool)

(assert (=> start!82244 m!888737))

(declare-fun m!888739 () Bool)

(assert (=> start!82244 m!888739))

(declare-fun m!888741 () Bool)

(assert (=> mapNonEmpty!33841 m!888741))

(check-sat (not b!958679) (not b!958674) (not b!958681) tp_is_empty!21241 (not b_next!18535) (not start!82244) b_and!29997 (not b!958682) (not b!958676) (not mapNonEmpty!33841))
(check-sat b_and!29997 (not b_next!18535))
