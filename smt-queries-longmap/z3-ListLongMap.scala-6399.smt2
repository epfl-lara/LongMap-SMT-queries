; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82172 () Bool)

(assert start!82172)

(declare-fun b_free!18463 () Bool)

(declare-fun b_next!18463 () Bool)

(assert (=> start!82172 (= b_free!18463 (not b_next!18463))))

(declare-fun tp!64350 () Bool)

(declare-fun b_and!29925 () Bool)

(assert (=> start!82172 (= tp!64350 b_and!29925)))

(declare-fun b!957690 () Bool)

(declare-fun e!539895 () Bool)

(declare-fun tp_is_empty!21169 () Bool)

(assert (=> b!957690 (= e!539895 tp_is_empty!21169)))

(declare-fun mapNonEmpty!33733 () Bool)

(declare-fun mapRes!33733 () Bool)

(declare-fun tp!64351 () Bool)

(assert (=> mapNonEmpty!33733 (= mapRes!33733 (and tp!64351 e!539895))))

(declare-datatypes ((V!33209 0))(
  ( (V!33210 (val!10635 Int)) )
))
(declare-datatypes ((ValueCell!10103 0))(
  ( (ValueCellFull!10103 (v!13191 V!33209)) (EmptyCell!10103) )
))
(declare-fun mapValue!33733 () ValueCell!10103)

(declare-datatypes ((array!58378 0))(
  ( (array!58379 (arr!28063 (Array (_ BitVec 32) ValueCell!10103)) (size!28544 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58378)

(declare-fun mapKey!33733 () (_ BitVec 32))

(declare-fun mapRest!33733 () (Array (_ BitVec 32) ValueCell!10103))

(assert (=> mapNonEmpty!33733 (= (arr!28063 _values!1386) (store mapRest!33733 mapKey!33733 mapValue!33733))))

(declare-fun b!957691 () Bool)

(declare-fun e!539893 () Bool)

(assert (=> b!957691 (= e!539893 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33209)

(declare-datatypes ((array!58380 0))(
  ( (array!58381 (arr!28064 (Array (_ BitVec 32) (_ BitVec 64))) (size!28545 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58380)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33209)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430150 () Bool)

(declare-datatypes ((tuple2!13758 0))(
  ( (tuple2!13759 (_1!6890 (_ BitVec 64)) (_2!6890 V!33209)) )
))
(declare-datatypes ((List!19543 0))(
  ( (Nil!19540) (Cons!19539 (h!20701 tuple2!13758) (t!27897 List!19543)) )
))
(declare-datatypes ((ListLongMap!12445 0))(
  ( (ListLongMap!12446 (toList!6238 List!19543)) )
))
(declare-fun contains!5284 (ListLongMap!12445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3400 (array!58380 array!58378 (_ BitVec 32) (_ BitVec 32) V!33209 V!33209 (_ BitVec 32) Int) ListLongMap!12445)

(assert (=> b!957691 (= lt!430150 (contains!5284 (getCurrentListMap!3400 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28064 _keys!1668) i!793)))))

(declare-fun b!957692 () Bool)

(declare-fun res!641095 () Bool)

(assert (=> b!957692 (=> (not res!641095) (not e!539893))))

(declare-datatypes ((List!19544 0))(
  ( (Nil!19541) (Cons!19540 (h!20702 (_ BitVec 64)) (t!27898 List!19544)) )
))
(declare-fun arrayNoDuplicates!0 (array!58380 (_ BitVec 32) List!19544) Bool)

(assert (=> b!957692 (= res!641095 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19541))))

(declare-fun b!957693 () Bool)

(declare-fun res!641100 () Bool)

(assert (=> b!957693 (=> (not res!641100) (not e!539893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957693 (= res!641100 (validKeyInArray!0 (select (arr!28064 _keys!1668) i!793)))))

(declare-fun b!957694 () Bool)

(declare-fun res!641096 () Bool)

(assert (=> b!957694 (=> (not res!641096) (not e!539893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58380 (_ BitVec 32)) Bool)

(assert (=> b!957694 (= res!641096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33733 () Bool)

(assert (=> mapIsEmpty!33733 mapRes!33733))

(declare-fun b!957695 () Bool)

(declare-fun res!641099 () Bool)

(assert (=> b!957695 (=> (not res!641099) (not e!539893))))

(assert (=> b!957695 (= res!641099 (and (= (size!28544 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28545 _keys!1668) (size!28544 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!641098 () Bool)

(assert (=> start!82172 (=> (not res!641098) (not e!539893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82172 (= res!641098 (validMask!0 mask!2088))))

(assert (=> start!82172 e!539893))

(assert (=> start!82172 true))

(assert (=> start!82172 tp_is_empty!21169))

(declare-fun array_inv!21825 (array!58380) Bool)

(assert (=> start!82172 (array_inv!21825 _keys!1668)))

(declare-fun e!539896 () Bool)

(declare-fun array_inv!21826 (array!58378) Bool)

(assert (=> start!82172 (and (array_inv!21826 _values!1386) e!539896)))

(assert (=> start!82172 tp!64350))

(declare-fun b!957696 () Bool)

(declare-fun e!539897 () Bool)

(assert (=> b!957696 (= e!539897 tp_is_empty!21169)))

(declare-fun b!957697 () Bool)

(declare-fun res!641097 () Bool)

(assert (=> b!957697 (=> (not res!641097) (not e!539893))))

(assert (=> b!957697 (= res!641097 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28545 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28545 _keys!1668))))))

(declare-fun b!957698 () Bool)

(assert (=> b!957698 (= e!539896 (and e!539897 mapRes!33733))))

(declare-fun condMapEmpty!33733 () Bool)

(declare-fun mapDefault!33733 () ValueCell!10103)

(assert (=> b!957698 (= condMapEmpty!33733 (= (arr!28063 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10103)) mapDefault!33733)))))

(assert (= (and start!82172 res!641098) b!957695))

(assert (= (and b!957695 res!641099) b!957694))

(assert (= (and b!957694 res!641096) b!957692))

(assert (= (and b!957692 res!641095) b!957697))

(assert (= (and b!957697 res!641097) b!957693))

(assert (= (and b!957693 res!641100) b!957691))

(assert (= (and b!957698 condMapEmpty!33733) mapIsEmpty!33733))

(assert (= (and b!957698 (not condMapEmpty!33733)) mapNonEmpty!33733))

(get-info :version)

(assert (= (and mapNonEmpty!33733 ((_ is ValueCellFull!10103) mapValue!33733)) b!957690))

(assert (= (and b!957698 ((_ is ValueCellFull!10103) mapDefault!33733)) b!957696))

(assert (= start!82172 b!957698))

(declare-fun m!887979 () Bool)

(assert (=> start!82172 m!887979))

(declare-fun m!887981 () Bool)

(assert (=> start!82172 m!887981))

(declare-fun m!887983 () Bool)

(assert (=> start!82172 m!887983))

(declare-fun m!887985 () Bool)

(assert (=> b!957692 m!887985))

(declare-fun m!887987 () Bool)

(assert (=> b!957691 m!887987))

(declare-fun m!887989 () Bool)

(assert (=> b!957691 m!887989))

(assert (=> b!957691 m!887987))

(assert (=> b!957691 m!887989))

(declare-fun m!887991 () Bool)

(assert (=> b!957691 m!887991))

(assert (=> b!957693 m!887989))

(assert (=> b!957693 m!887989))

(declare-fun m!887993 () Bool)

(assert (=> b!957693 m!887993))

(declare-fun m!887995 () Bool)

(assert (=> b!957694 m!887995))

(declare-fun m!887997 () Bool)

(assert (=> mapNonEmpty!33733 m!887997))

(check-sat (not mapNonEmpty!33733) (not b!957694) (not b!957691) tp_is_empty!21169 (not b!957693) (not b_next!18463) b_and!29925 (not start!82172) (not b!957692))
(check-sat b_and!29925 (not b_next!18463))
