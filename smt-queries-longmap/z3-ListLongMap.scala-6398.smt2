; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82352 () Bool)

(assert start!82352)

(declare-fun b_free!18457 () Bool)

(declare-fun b_next!18457 () Bool)

(assert (=> start!82352 (= b_free!18457 (not b_next!18457))))

(declare-fun tp!64332 () Bool)

(declare-fun b_and!29955 () Bool)

(assert (=> start!82352 (= tp!64332 b_and!29955)))

(declare-fun res!641496 () Bool)

(declare-fun e!540581 () Bool)

(assert (=> start!82352 (=> (not res!641496) (not e!540581))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82352 (= res!641496 (validMask!0 mask!2088))))

(assert (=> start!82352 e!540581))

(assert (=> start!82352 true))

(declare-fun tp_is_empty!21163 () Bool)

(assert (=> start!82352 tp_is_empty!21163))

(declare-datatypes ((array!58456 0))(
  ( (array!58457 (arr!28097 (Array (_ BitVec 32) (_ BitVec 64))) (size!28577 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58456)

(declare-fun array_inv!21867 (array!58456) Bool)

(assert (=> start!82352 (array_inv!21867 _keys!1668)))

(declare-datatypes ((V!33201 0))(
  ( (V!33202 (val!10632 Int)) )
))
(declare-datatypes ((ValueCell!10100 0))(
  ( (ValueCellFull!10100 (v!13186 V!33201)) (EmptyCell!10100) )
))
(declare-datatypes ((array!58458 0))(
  ( (array!58459 (arr!28098 (Array (_ BitVec 32) ValueCell!10100)) (size!28578 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58458)

(declare-fun e!540582 () Bool)

(declare-fun array_inv!21868 (array!58458) Bool)

(assert (=> start!82352 (and (array_inv!21868 _values!1386) e!540582)))

(assert (=> start!82352 tp!64332))

(declare-fun b!958751 () Bool)

(declare-fun e!540579 () Bool)

(declare-fun mapRes!33724 () Bool)

(assert (=> b!958751 (= e!540582 (and e!540579 mapRes!33724))))

(declare-fun condMapEmpty!33724 () Bool)

(declare-fun mapDefault!33724 () ValueCell!10100)

(assert (=> b!958751 (= condMapEmpty!33724 (= (arr!28098 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10100)) mapDefault!33724)))))

(declare-fun b!958752 () Bool)

(declare-fun res!641497 () Bool)

(assert (=> b!958752 (=> (not res!641497) (not e!540581))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958752 (= res!641497 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28577 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28577 _keys!1668))))))

(declare-fun b!958753 () Bool)

(declare-fun e!540578 () Bool)

(assert (=> b!958753 (= e!540578 tp_is_empty!21163)))

(declare-fun b!958754 () Bool)

(assert (=> b!958754 (= e!540581 false)))

(declare-fun minValue!1328 () V!33201)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430738 () Bool)

(declare-fun zeroValue!1328 () V!33201)

(declare-datatypes ((tuple2!13686 0))(
  ( (tuple2!13687 (_1!6854 (_ BitVec 64)) (_2!6854 V!33201)) )
))
(declare-datatypes ((List!19519 0))(
  ( (Nil!19516) (Cons!19515 (h!20683 tuple2!13686) (t!27874 List!19519)) )
))
(declare-datatypes ((ListLongMap!12385 0))(
  ( (ListLongMap!12386 (toList!6208 List!19519)) )
))
(declare-fun contains!5322 (ListLongMap!12385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3441 (array!58456 array!58458 (_ BitVec 32) (_ BitVec 32) V!33201 V!33201 (_ BitVec 32) Int) ListLongMap!12385)

(assert (=> b!958754 (= lt!430738 (contains!5322 (getCurrentListMap!3441 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28097 _keys!1668) i!793)))))

(declare-fun b!958755 () Bool)

(declare-fun res!641495 () Bool)

(assert (=> b!958755 (=> (not res!641495) (not e!540581))))

(declare-datatypes ((List!19520 0))(
  ( (Nil!19517) (Cons!19516 (h!20684 (_ BitVec 64)) (t!27875 List!19520)) )
))
(declare-fun arrayNoDuplicates!0 (array!58456 (_ BitVec 32) List!19520) Bool)

(assert (=> b!958755 (= res!641495 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19517))))

(declare-fun mapNonEmpty!33724 () Bool)

(declare-fun tp!64333 () Bool)

(assert (=> mapNonEmpty!33724 (= mapRes!33724 (and tp!64333 e!540578))))

(declare-fun mapKey!33724 () (_ BitVec 32))

(declare-fun mapValue!33724 () ValueCell!10100)

(declare-fun mapRest!33724 () (Array (_ BitVec 32) ValueCell!10100))

(assert (=> mapNonEmpty!33724 (= (arr!28098 _values!1386) (store mapRest!33724 mapKey!33724 mapValue!33724))))

(declare-fun b!958756 () Bool)

(declare-fun res!641500 () Bool)

(assert (=> b!958756 (=> (not res!641500) (not e!540581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58456 (_ BitVec 32)) Bool)

(assert (=> b!958756 (= res!641500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33724 () Bool)

(assert (=> mapIsEmpty!33724 mapRes!33724))

(declare-fun b!958757 () Bool)

(declare-fun res!641499 () Bool)

(assert (=> b!958757 (=> (not res!641499) (not e!540581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958757 (= res!641499 (validKeyInArray!0 (select (arr!28097 _keys!1668) i!793)))))

(declare-fun b!958758 () Bool)

(declare-fun res!641498 () Bool)

(assert (=> b!958758 (=> (not res!641498) (not e!540581))))

(assert (=> b!958758 (= res!641498 (and (= (size!28578 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28577 _keys!1668) (size!28578 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958759 () Bool)

(assert (=> b!958759 (= e!540579 tp_is_empty!21163)))

(assert (= (and start!82352 res!641496) b!958758))

(assert (= (and b!958758 res!641498) b!958756))

(assert (= (and b!958756 res!641500) b!958755))

(assert (= (and b!958755 res!641495) b!958752))

(assert (= (and b!958752 res!641497) b!958757))

(assert (= (and b!958757 res!641499) b!958754))

(assert (= (and b!958751 condMapEmpty!33724) mapIsEmpty!33724))

(assert (= (and b!958751 (not condMapEmpty!33724)) mapNonEmpty!33724))

(get-info :version)

(assert (= (and mapNonEmpty!33724 ((_ is ValueCellFull!10100) mapValue!33724)) b!958753))

(assert (= (and b!958751 ((_ is ValueCellFull!10100) mapDefault!33724)) b!958759))

(assert (= start!82352 b!958751))

(declare-fun m!889971 () Bool)

(assert (=> b!958757 m!889971))

(assert (=> b!958757 m!889971))

(declare-fun m!889973 () Bool)

(assert (=> b!958757 m!889973))

(declare-fun m!889975 () Bool)

(assert (=> mapNonEmpty!33724 m!889975))

(declare-fun m!889977 () Bool)

(assert (=> b!958756 m!889977))

(declare-fun m!889979 () Bool)

(assert (=> b!958755 m!889979))

(declare-fun m!889981 () Bool)

(assert (=> b!958754 m!889981))

(assert (=> b!958754 m!889971))

(assert (=> b!958754 m!889981))

(assert (=> b!958754 m!889971))

(declare-fun m!889983 () Bool)

(assert (=> b!958754 m!889983))

(declare-fun m!889985 () Bool)

(assert (=> start!82352 m!889985))

(declare-fun m!889987 () Bool)

(assert (=> start!82352 m!889987))

(declare-fun m!889989 () Bool)

(assert (=> start!82352 m!889989))

(check-sat (not b!958754) (not b!958755) b_and!29955 (not b_next!18457) tp_is_empty!21163 (not b!958757) (not mapNonEmpty!33724) (not b!958756) (not start!82352))
(check-sat b_and!29955 (not b_next!18457))
