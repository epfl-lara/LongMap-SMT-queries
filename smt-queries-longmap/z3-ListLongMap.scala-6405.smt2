; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82394 () Bool)

(assert start!82394)

(declare-fun b_free!18499 () Bool)

(declare-fun b_next!18499 () Bool)

(assert (=> start!82394 (= b_free!18499 (not b_next!18499))))

(declare-fun tp!64458 () Bool)

(declare-fun b_and!29997 () Bool)

(assert (=> start!82394 (= tp!64458 b_and!29997)))

(declare-fun b!959318 () Bool)

(declare-fun res!641877 () Bool)

(declare-fun e!540896 () Bool)

(assert (=> b!959318 (=> (not res!641877) (not e!540896))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58540 0))(
  ( (array!58541 (arr!28139 (Array (_ BitVec 32) (_ BitVec 64))) (size!28619 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58540)

(declare-datatypes ((V!33257 0))(
  ( (V!33258 (val!10653 Int)) )
))
(declare-datatypes ((ValueCell!10121 0))(
  ( (ValueCellFull!10121 (v!13207 V!33257)) (EmptyCell!10121) )
))
(declare-datatypes ((array!58542 0))(
  ( (array!58543 (arr!28140 (Array (_ BitVec 32) ValueCell!10121)) (size!28620 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58542)

(assert (=> b!959318 (= res!641877 (and (= (size!28620 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28619 _keys!1668) (size!28620 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959319 () Bool)

(declare-fun res!641878 () Bool)

(assert (=> b!959319 (=> (not res!641878) (not e!540896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58540 (_ BitVec 32)) Bool)

(assert (=> b!959319 (= res!641878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33787 () Bool)

(declare-fun mapRes!33787 () Bool)

(assert (=> mapIsEmpty!33787 mapRes!33787))

(declare-fun b!959320 () Bool)

(declare-fun res!641874 () Bool)

(assert (=> b!959320 (=> (not res!641874) (not e!540896))))

(declare-datatypes ((List!19549 0))(
  ( (Nil!19546) (Cons!19545 (h!20713 (_ BitVec 64)) (t!27904 List!19549)) )
))
(declare-fun arrayNoDuplicates!0 (array!58540 (_ BitVec 32) List!19549) Bool)

(assert (=> b!959320 (= res!641874 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19546))))

(declare-fun b!959321 () Bool)

(declare-fun e!540897 () Bool)

(declare-fun tp_is_empty!21205 () Bool)

(assert (=> b!959321 (= e!540897 tp_is_empty!21205)))

(declare-fun b!959322 () Bool)

(declare-fun e!540893 () Bool)

(assert (=> b!959322 (= e!540893 (and e!540897 mapRes!33787))))

(declare-fun condMapEmpty!33787 () Bool)

(declare-fun mapDefault!33787 () ValueCell!10121)

(assert (=> b!959322 (= condMapEmpty!33787 (= (arr!28140 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10121)) mapDefault!33787)))))

(declare-fun b!959323 () Bool)

(declare-fun res!641873 () Bool)

(assert (=> b!959323 (=> (not res!641873) (not e!540896))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959323 (= res!641873 (validKeyInArray!0 (select (arr!28139 _keys!1668) i!793)))))

(declare-fun b!959324 () Bool)

(assert (=> b!959324 (= e!540896 false)))

(declare-fun minValue!1328 () V!33257)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33257)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430801 () Bool)

(declare-datatypes ((tuple2!13716 0))(
  ( (tuple2!13717 (_1!6869 (_ BitVec 64)) (_2!6869 V!33257)) )
))
(declare-datatypes ((List!19550 0))(
  ( (Nil!19547) (Cons!19546 (h!20714 tuple2!13716) (t!27905 List!19550)) )
))
(declare-datatypes ((ListLongMap!12415 0))(
  ( (ListLongMap!12416 (toList!6223 List!19550)) )
))
(declare-fun contains!5337 (ListLongMap!12415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3456 (array!58540 array!58542 (_ BitVec 32) (_ BitVec 32) V!33257 V!33257 (_ BitVec 32) Int) ListLongMap!12415)

(assert (=> b!959324 (= lt!430801 (contains!5337 (getCurrentListMap!3456 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28139 _keys!1668) i!793)))))

(declare-fun b!959325 () Bool)

(declare-fun e!540895 () Bool)

(assert (=> b!959325 (= e!540895 tp_is_empty!21205)))

(declare-fun b!959326 () Bool)

(declare-fun res!641875 () Bool)

(assert (=> b!959326 (=> (not res!641875) (not e!540896))))

(assert (=> b!959326 (= res!641875 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28619 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28619 _keys!1668))))))

(declare-fun mapNonEmpty!33787 () Bool)

(declare-fun tp!64459 () Bool)

(assert (=> mapNonEmpty!33787 (= mapRes!33787 (and tp!64459 e!540895))))

(declare-fun mapKey!33787 () (_ BitVec 32))

(declare-fun mapRest!33787 () (Array (_ BitVec 32) ValueCell!10121))

(declare-fun mapValue!33787 () ValueCell!10121)

(assert (=> mapNonEmpty!33787 (= (arr!28140 _values!1386) (store mapRest!33787 mapKey!33787 mapValue!33787))))

(declare-fun res!641876 () Bool)

(assert (=> start!82394 (=> (not res!641876) (not e!540896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82394 (= res!641876 (validMask!0 mask!2088))))

(assert (=> start!82394 e!540896))

(assert (=> start!82394 true))

(assert (=> start!82394 tp_is_empty!21205))

(declare-fun array_inv!21901 (array!58540) Bool)

(assert (=> start!82394 (array_inv!21901 _keys!1668)))

(declare-fun array_inv!21902 (array!58542) Bool)

(assert (=> start!82394 (and (array_inv!21902 _values!1386) e!540893)))

(assert (=> start!82394 tp!64458))

(assert (= (and start!82394 res!641876) b!959318))

(assert (= (and b!959318 res!641877) b!959319))

(assert (= (and b!959319 res!641878) b!959320))

(assert (= (and b!959320 res!641874) b!959326))

(assert (= (and b!959326 res!641875) b!959323))

(assert (= (and b!959323 res!641873) b!959324))

(assert (= (and b!959322 condMapEmpty!33787) mapIsEmpty!33787))

(assert (= (and b!959322 (not condMapEmpty!33787)) mapNonEmpty!33787))

(get-info :version)

(assert (= (and mapNonEmpty!33787 ((_ is ValueCellFull!10121) mapValue!33787)) b!959325))

(assert (= (and b!959322 ((_ is ValueCellFull!10121) mapDefault!33787)) b!959321))

(assert (= start!82394 b!959322))

(declare-fun m!890391 () Bool)

(assert (=> b!959323 m!890391))

(assert (=> b!959323 m!890391))

(declare-fun m!890393 () Bool)

(assert (=> b!959323 m!890393))

(declare-fun m!890395 () Bool)

(assert (=> mapNonEmpty!33787 m!890395))

(declare-fun m!890397 () Bool)

(assert (=> b!959320 m!890397))

(declare-fun m!890399 () Bool)

(assert (=> start!82394 m!890399))

(declare-fun m!890401 () Bool)

(assert (=> start!82394 m!890401))

(declare-fun m!890403 () Bool)

(assert (=> start!82394 m!890403))

(declare-fun m!890405 () Bool)

(assert (=> b!959319 m!890405))

(declare-fun m!890407 () Bool)

(assert (=> b!959324 m!890407))

(assert (=> b!959324 m!890391))

(assert (=> b!959324 m!890407))

(assert (=> b!959324 m!890391))

(declare-fun m!890409 () Bool)

(assert (=> b!959324 m!890409))

(check-sat (not b!959324) (not start!82394) (not b!959323) (not mapNonEmpty!33787) (not b!959320) (not b_next!18499) (not b!959319) b_and!29997 tp_is_empty!21205)
(check-sat b_and!29997 (not b_next!18499))
