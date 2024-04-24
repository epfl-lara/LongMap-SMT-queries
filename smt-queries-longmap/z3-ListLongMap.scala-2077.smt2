; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35616 () Bool)

(assert start!35616)

(declare-fun b_free!7885 () Bool)

(declare-fun b_next!7885 () Bool)

(assert (=> start!35616 (= b_free!7885 (not b_next!7885))))

(declare-fun tp!27639 () Bool)

(declare-fun b_and!15141 () Bool)

(assert (=> start!35616 (= tp!27639 b_and!15141)))

(declare-fun b!357558 () Bool)

(declare-fun e!218914 () Bool)

(declare-fun tp_is_empty!8083 () Bool)

(assert (=> b!357558 (= e!218914 tp_is_empty!8083)))

(declare-fun b!357559 () Bool)

(declare-fun res!198642 () Bool)

(declare-fun e!218913 () Bool)

(assert (=> b!357559 (=> (not res!198642) (not e!218913))))

(declare-datatypes ((array!19716 0))(
  ( (array!19717 (arr!9351 (Array (_ BitVec 32) (_ BitVec 64))) (size!9703 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19716)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!357559 (= res!198642 (not (= (select (arr!9351 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357560 () Bool)

(declare-fun res!198641 () Bool)

(assert (=> b!357560 (=> (not res!198641) (not e!218913))))

(declare-fun arrayContainsKey!0 (array!19716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357560 (= res!198641 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357561 () Bool)

(declare-fun res!198639 () Bool)

(assert (=> b!357561 (=> (not res!198639) (not e!218913))))

(declare-datatypes ((List!5305 0))(
  ( (Nil!5302) (Cons!5301 (h!6157 (_ BitVec 64)) (t!10447 List!5305)) )
))
(declare-fun arrayNoDuplicates!0 (array!19716 (_ BitVec 32) List!5305) Bool)

(assert (=> b!357561 (= res!198639 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5302))))

(declare-fun res!198644 () Bool)

(assert (=> start!35616 (=> (not res!198644) (not e!218913))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35616 (= res!198644 (validMask!0 mask!1842))))

(assert (=> start!35616 e!218913))

(assert (=> start!35616 tp_is_empty!8083))

(assert (=> start!35616 true))

(assert (=> start!35616 tp!27639))

(declare-fun array_inv!6908 (array!19716) Bool)

(assert (=> start!35616 (array_inv!6908 _keys!1456)))

(declare-datatypes ((V!11755 0))(
  ( (V!11756 (val!4086 Int)) )
))
(declare-datatypes ((ValueCell!3698 0))(
  ( (ValueCellFull!3698 (v!6281 V!11755)) (EmptyCell!3698) )
))
(declare-datatypes ((array!19718 0))(
  ( (array!19719 (arr!9352 (Array (_ BitVec 32) ValueCell!3698)) (size!9704 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19718)

(declare-fun e!218912 () Bool)

(declare-fun array_inv!6909 (array!19718) Bool)

(assert (=> start!35616 (and (array_inv!6909 _values!1208) e!218912)))

(declare-fun mapIsEmpty!13632 () Bool)

(declare-fun mapRes!13632 () Bool)

(assert (=> mapIsEmpty!13632 mapRes!13632))

(declare-fun b!357562 () Bool)

(declare-fun res!198645 () Bool)

(assert (=> b!357562 (=> (not res!198645) (not e!218913))))

(assert (=> b!357562 (= res!198645 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9703 _keys!1456))))))

(declare-fun b!357563 () Bool)

(declare-fun res!198646 () Bool)

(assert (=> b!357563 (=> (not res!198646) (not e!218913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19716 (_ BitVec 32)) Bool)

(assert (=> b!357563 (= res!198646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13632 () Bool)

(declare-fun tp!27638 () Bool)

(assert (=> mapNonEmpty!13632 (= mapRes!13632 (and tp!27638 e!218914))))

(declare-fun mapValue!13632 () ValueCell!3698)

(declare-fun mapRest!13632 () (Array (_ BitVec 32) ValueCell!3698))

(declare-fun mapKey!13632 () (_ BitVec 32))

(assert (=> mapNonEmpty!13632 (= (arr!9352 _values!1208) (store mapRest!13632 mapKey!13632 mapValue!13632))))

(declare-fun b!357564 () Bool)

(declare-fun e!218915 () Bool)

(assert (=> b!357564 (= e!218915 tp_is_empty!8083)))

(declare-fun b!357565 () Bool)

(declare-fun e!218917 () Bool)

(assert (=> b!357565 (= e!218917 true)))

(declare-fun minValue!1150 () V!11755)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11755)

(declare-datatypes ((tuple2!5624 0))(
  ( (tuple2!5625 (_1!2823 (_ BitVec 64)) (_2!2823 V!11755)) )
))
(declare-datatypes ((List!5306 0))(
  ( (Nil!5303) (Cons!5302 (h!6158 tuple2!5624) (t!10448 List!5306)) )
))
(declare-datatypes ((ListLongMap!4539 0))(
  ( (ListLongMap!4540 (toList!2285 List!5306)) )
))
(declare-fun contains!2384 (ListLongMap!4539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1813 (array!19716 array!19718 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 32) Int) ListLongMap!4539)

(assert (=> b!357565 (contains!2384 (getCurrentListMap!1813 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11007 0))(
  ( (Unit!11008) )
))
(declare-fun lt!166087 () Unit!11007)

(declare-fun lemmaArrayContainsKeyThenInListMap!352 (array!19716 array!19718 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 64) (_ BitVec 32) Int) Unit!11007)

(assert (=> b!357565 (= lt!166087 (lemmaArrayContainsKeyThenInListMap!352 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357566 () Bool)

(assert (=> b!357566 (= e!218913 (not e!218917))))

(declare-fun res!198640 () Bool)

(assert (=> b!357566 (=> res!198640 e!218917)))

(assert (=> b!357566 (= res!198640 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9703 _keys!1456))))))

(assert (=> b!357566 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166088 () Unit!11007)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!32 (array!19716 array!19718 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 64) (_ BitVec 32)) Unit!11007)

(assert (=> b!357566 (= lt!166088 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!32 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357567 () Bool)

(assert (=> b!357567 (= e!218912 (and e!218915 mapRes!13632))))

(declare-fun condMapEmpty!13632 () Bool)

(declare-fun mapDefault!13632 () ValueCell!3698)

(assert (=> b!357567 (= condMapEmpty!13632 (= (arr!9352 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3698)) mapDefault!13632)))))

(declare-fun b!357568 () Bool)

(declare-fun res!198638 () Bool)

(assert (=> b!357568 (=> (not res!198638) (not e!218913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357568 (= res!198638 (validKeyInArray!0 k0!1077))))

(declare-fun b!357569 () Bool)

(declare-fun res!198643 () Bool)

(assert (=> b!357569 (=> (not res!198643) (not e!218913))))

(assert (=> b!357569 (= res!198643 (and (= (size!9704 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9703 _keys!1456) (size!9704 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35616 res!198644) b!357569))

(assert (= (and b!357569 res!198643) b!357563))

(assert (= (and b!357563 res!198646) b!357561))

(assert (= (and b!357561 res!198639) b!357568))

(assert (= (and b!357568 res!198638) b!357562))

(assert (= (and b!357562 res!198645) b!357560))

(assert (= (and b!357560 res!198641) b!357559))

(assert (= (and b!357559 res!198642) b!357566))

(assert (= (and b!357566 (not res!198640)) b!357565))

(assert (= (and b!357567 condMapEmpty!13632) mapIsEmpty!13632))

(assert (= (and b!357567 (not condMapEmpty!13632)) mapNonEmpty!13632))

(get-info :version)

(assert (= (and mapNonEmpty!13632 ((_ is ValueCellFull!3698) mapValue!13632)) b!357558))

(assert (= (and b!357567 ((_ is ValueCellFull!3698) mapDefault!13632)) b!357564))

(assert (= start!35616 b!357567))

(declare-fun m!355875 () Bool)

(assert (=> b!357566 m!355875))

(declare-fun m!355877 () Bool)

(assert (=> b!357566 m!355877))

(declare-fun m!355879 () Bool)

(assert (=> b!357563 m!355879))

(declare-fun m!355881 () Bool)

(assert (=> b!357559 m!355881))

(declare-fun m!355883 () Bool)

(assert (=> b!357565 m!355883))

(assert (=> b!357565 m!355883))

(declare-fun m!355885 () Bool)

(assert (=> b!357565 m!355885))

(declare-fun m!355887 () Bool)

(assert (=> b!357565 m!355887))

(declare-fun m!355889 () Bool)

(assert (=> b!357568 m!355889))

(declare-fun m!355891 () Bool)

(assert (=> b!357560 m!355891))

(declare-fun m!355893 () Bool)

(assert (=> mapNonEmpty!13632 m!355893))

(declare-fun m!355895 () Bool)

(assert (=> b!357561 m!355895))

(declare-fun m!355897 () Bool)

(assert (=> start!35616 m!355897))

(declare-fun m!355899 () Bool)

(assert (=> start!35616 m!355899))

(declare-fun m!355901 () Bool)

(assert (=> start!35616 m!355901))

(check-sat (not start!35616) (not b!357563) b_and!15141 (not b!357561) tp_is_empty!8083 (not b_next!7885) (not b!357568) (not b!357565) (not mapNonEmpty!13632) (not b!357560) (not b!357566))
(check-sat b_and!15141 (not b_next!7885))
