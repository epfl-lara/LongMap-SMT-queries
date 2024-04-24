; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82568 () Bool)

(assert start!82568)

(declare-fun b_free!18667 () Bool)

(declare-fun b_next!18667 () Bool)

(assert (=> start!82568 (= b_free!18667 (not b_next!18667))))

(declare-fun tp!64972 () Bool)

(declare-fun b_and!30165 () Bool)

(assert (=> start!82568 (= tp!64972 b_and!30165)))

(declare-fun mapIsEmpty!34048 () Bool)

(declare-fun mapRes!34048 () Bool)

(assert (=> mapIsEmpty!34048 mapRes!34048))

(declare-fun b!961741 () Bool)

(declare-fun res!643518 () Bool)

(declare-fun e!542199 () Bool)

(assert (=> b!961741 (=> (not res!643518) (not e!542199))))

(declare-datatypes ((array!58878 0))(
  ( (array!58879 (arr!28308 (Array (_ BitVec 32) (_ BitVec 64))) (size!28788 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58878)

(declare-datatypes ((List!19658 0))(
  ( (Nil!19655) (Cons!19654 (h!20822 (_ BitVec 64)) (t!28013 List!19658)) )
))
(declare-fun arrayNoDuplicates!0 (array!58878 (_ BitVec 32) List!19658) Bool)

(assert (=> b!961741 (= res!643518 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19655))))

(declare-fun mapNonEmpty!34048 () Bool)

(declare-fun tp!64971 () Bool)

(declare-fun e!542201 () Bool)

(assert (=> mapNonEmpty!34048 (= mapRes!34048 (and tp!64971 e!542201))))

(declare-fun mapKey!34048 () (_ BitVec 32))

(declare-datatypes ((V!33489 0))(
  ( (V!33490 (val!10740 Int)) )
))
(declare-datatypes ((ValueCell!10208 0))(
  ( (ValueCellFull!10208 (v!13294 V!33489)) (EmptyCell!10208) )
))
(declare-datatypes ((array!58880 0))(
  ( (array!58881 (arr!28309 (Array (_ BitVec 32) ValueCell!10208)) (size!28789 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58880)

(declare-fun mapRest!34048 () (Array (_ BitVec 32) ValueCell!10208))

(declare-fun mapValue!34048 () ValueCell!10208)

(assert (=> mapNonEmpty!34048 (= (arr!28309 _values!1386) (store mapRest!34048 mapKey!34048 mapValue!34048))))

(declare-fun b!961742 () Bool)

(declare-fun tp_is_empty!21379 () Bool)

(assert (=> b!961742 (= e!542201 tp_is_empty!21379)))

(declare-fun b!961743 () Bool)

(declare-fun res!643516 () Bool)

(assert (=> b!961743 (=> (not res!643516) (not e!542199))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58878 (_ BitVec 32)) Bool)

(assert (=> b!961743 (= res!643516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!961744 () Bool)

(declare-fun res!643515 () Bool)

(assert (=> b!961744 (=> (not res!643515) (not e!542199))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33489)

(declare-fun zeroValue!1328 () V!33489)

(declare-datatypes ((tuple2!13826 0))(
  ( (tuple2!13827 (_1!6924 (_ BitVec 64)) (_2!6924 V!33489)) )
))
(declare-datatypes ((List!19659 0))(
  ( (Nil!19656) (Cons!19655 (h!20823 tuple2!13826) (t!28014 List!19659)) )
))
(declare-datatypes ((ListLongMap!12525 0))(
  ( (ListLongMap!12526 (toList!6278 List!19659)) )
))
(declare-fun contains!5390 (ListLongMap!12525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3511 (array!58878 array!58880 (_ BitVec 32) (_ BitVec 32) V!33489 V!33489 (_ BitVec 32) Int) ListLongMap!12525)

(assert (=> b!961744 (= res!643515 (contains!5390 (getCurrentListMap!3511 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28308 _keys!1668) i!793)))))

(declare-fun res!643517 () Bool)

(assert (=> start!82568 (=> (not res!643517) (not e!542199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82568 (= res!643517 (validMask!0 mask!2088))))

(assert (=> start!82568 e!542199))

(assert (=> start!82568 true))

(assert (=> start!82568 tp_is_empty!21379))

(declare-fun array_inv!22019 (array!58878) Bool)

(assert (=> start!82568 (array_inv!22019 _keys!1668)))

(declare-fun e!542200 () Bool)

(declare-fun array_inv!22020 (array!58880) Bool)

(assert (=> start!82568 (and (array_inv!22020 _values!1386) e!542200)))

(assert (=> start!82568 tp!64972))

(declare-fun b!961745 () Bool)

(declare-fun res!643514 () Bool)

(assert (=> b!961745 (=> (not res!643514) (not e!542199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961745 (= res!643514 (validKeyInArray!0 (select (arr!28308 _keys!1668) i!793)))))

(declare-fun b!961746 () Bool)

(declare-fun res!643513 () Bool)

(assert (=> b!961746 (=> (not res!643513) (not e!542199))))

(assert (=> b!961746 (= res!643513 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28788 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28788 _keys!1668))))))

(declare-fun b!961747 () Bool)

(assert (=> b!961747 (= e!542199 (not true))))

(assert (=> b!961747 (contains!5390 (getCurrentListMap!3511 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28308 _keys!1668) i!793))))

(declare-datatypes ((Unit!32160 0))(
  ( (Unit!32161) )
))
(declare-fun lt!431053 () Unit!32160)

(declare-fun lemmaInListMapFromThenInFromSmaller!18 (array!58878 array!58880 (_ BitVec 32) (_ BitVec 32) V!33489 V!33489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32160)

(assert (=> b!961747 (= lt!431053 (lemmaInListMapFromThenInFromSmaller!18 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!961748 () Bool)

(declare-fun res!643519 () Bool)

(assert (=> b!961748 (=> (not res!643519) (not e!542199))))

(assert (=> b!961748 (= res!643519 (and (= (size!28789 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28788 _keys!1668) (size!28789 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!961749 () Bool)

(declare-fun e!542202 () Bool)

(assert (=> b!961749 (= e!542202 tp_is_empty!21379)))

(declare-fun b!961750 () Bool)

(assert (=> b!961750 (= e!542200 (and e!542202 mapRes!34048))))

(declare-fun condMapEmpty!34048 () Bool)

(declare-fun mapDefault!34048 () ValueCell!10208)

(assert (=> b!961750 (= condMapEmpty!34048 (= (arr!28309 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10208)) mapDefault!34048)))))

(assert (= (and start!82568 res!643517) b!961748))

(assert (= (and b!961748 res!643519) b!961743))

(assert (= (and b!961743 res!643516) b!961741))

(assert (= (and b!961741 res!643518) b!961746))

(assert (= (and b!961746 res!643513) b!961745))

(assert (= (and b!961745 res!643514) b!961744))

(assert (= (and b!961744 res!643515) b!961747))

(assert (= (and b!961750 condMapEmpty!34048) mapIsEmpty!34048))

(assert (= (and b!961750 (not condMapEmpty!34048)) mapNonEmpty!34048))

(get-info :version)

(assert (= (and mapNonEmpty!34048 ((_ is ValueCellFull!10208) mapValue!34048)) b!961742))

(assert (= (and b!961750 ((_ is ValueCellFull!10208) mapDefault!34048)) b!961749))

(assert (= start!82568 b!961750))

(declare-fun m!892281 () Bool)

(assert (=> b!961744 m!892281))

(declare-fun m!892283 () Bool)

(assert (=> b!961744 m!892283))

(assert (=> b!961744 m!892281))

(assert (=> b!961744 m!892283))

(declare-fun m!892285 () Bool)

(assert (=> b!961744 m!892285))

(declare-fun m!892287 () Bool)

(assert (=> mapNonEmpty!34048 m!892287))

(assert (=> b!961745 m!892283))

(assert (=> b!961745 m!892283))

(declare-fun m!892289 () Bool)

(assert (=> b!961745 m!892289))

(declare-fun m!892291 () Bool)

(assert (=> b!961741 m!892291))

(declare-fun m!892293 () Bool)

(assert (=> b!961747 m!892293))

(assert (=> b!961747 m!892283))

(assert (=> b!961747 m!892293))

(assert (=> b!961747 m!892283))

(declare-fun m!892295 () Bool)

(assert (=> b!961747 m!892295))

(declare-fun m!892297 () Bool)

(assert (=> b!961747 m!892297))

(declare-fun m!892299 () Bool)

(assert (=> b!961743 m!892299))

(declare-fun m!892301 () Bool)

(assert (=> start!82568 m!892301))

(declare-fun m!892303 () Bool)

(assert (=> start!82568 m!892303))

(declare-fun m!892305 () Bool)

(assert (=> start!82568 m!892305))

(check-sat (not b!961744) (not b_next!18667) (not b!961745) (not b!961741) (not b!961747) (not b!961743) (not mapNonEmpty!34048) tp_is_empty!21379 b_and!30165 (not start!82568))
(check-sat b_and!30165 (not b_next!18667))
