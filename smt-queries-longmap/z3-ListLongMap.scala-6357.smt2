; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82046 () Bool)

(assert start!82046)

(declare-fun b_free!18373 () Bool)

(declare-fun b_next!18373 () Bool)

(assert (=> start!82046 (= b_free!18373 (not b_next!18373))))

(declare-fun tp!63819 () Bool)

(declare-fun b_and!29869 () Bool)

(assert (=> start!82046 (= tp!63819 b_and!29869)))

(declare-fun b!955816 () Bool)

(declare-fun res!639796 () Bool)

(declare-fun e!538570 () Bool)

(assert (=> b!955816 (=> (not res!639796) (not e!538570))))

(declare-datatypes ((array!57992 0))(
  ( (array!57993 (arr!27871 (Array (_ BitVec 32) (_ BitVec 64))) (size!28351 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57992)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955816 (= res!639796 (validKeyInArray!0 (select (arr!27871 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33337 () Bool)

(declare-fun mapRes!33337 () Bool)

(declare-fun tp!63820 () Bool)

(declare-fun e!538569 () Bool)

(assert (=> mapNonEmpty!33337 (= mapRes!33337 (and tp!63820 e!538569))))

(declare-datatypes ((V!32873 0))(
  ( (V!32874 (val!10509 Int)) )
))
(declare-datatypes ((ValueCell!9977 0))(
  ( (ValueCellFull!9977 (v!13061 V!32873)) (EmptyCell!9977) )
))
(declare-datatypes ((array!57994 0))(
  ( (array!57995 (arr!27872 (Array (_ BitVec 32) ValueCell!9977)) (size!28352 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57994)

(declare-fun mapKey!33337 () (_ BitVec 32))

(declare-fun mapValue!33337 () ValueCell!9977)

(declare-fun mapRest!33337 () (Array (_ BitVec 32) ValueCell!9977))

(assert (=> mapNonEmpty!33337 (= (arr!27872 _values!1197) (store mapRest!33337 mapKey!33337 mapValue!33337))))

(declare-fun b!955817 () Bool)

(declare-fun res!639800 () Bool)

(assert (=> b!955817 (=> (not res!639800) (not e!538570))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955817 (= res!639800 (and (= (size!28352 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28351 _keys!1441) (size!28352 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955818 () Bool)

(declare-fun e!538567 () Bool)

(declare-fun tp_is_empty!20917 () Bool)

(assert (=> b!955818 (= e!538567 tp_is_empty!20917)))

(declare-fun mapIsEmpty!33337 () Bool)

(assert (=> mapIsEmpty!33337 mapRes!33337))

(declare-fun b!955819 () Bool)

(declare-fun res!639798 () Bool)

(assert (=> b!955819 (=> (not res!639798) (not e!538570))))

(assert (=> b!955819 (= res!639798 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28351 _keys!1441))))))

(declare-fun b!955821 () Bool)

(assert (=> b!955821 (= e!538570 false)))

(declare-fun zeroValue!1139 () V!32873)

(declare-fun lt!430314 () Bool)

(declare-fun minValue!1139 () V!32873)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13628 0))(
  ( (tuple2!13629 (_1!6825 (_ BitVec 64)) (_2!6825 V!32873)) )
))
(declare-datatypes ((List!19414 0))(
  ( (Nil!19411) (Cons!19410 (h!20578 tuple2!13628) (t!27767 List!19414)) )
))
(declare-datatypes ((ListLongMap!12327 0))(
  ( (ListLongMap!12328 (toList!6179 List!19414)) )
))
(declare-fun contains!5288 (ListLongMap!12327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3412 (array!57992 array!57994 (_ BitVec 32) (_ BitVec 32) V!32873 V!32873 (_ BitVec 32) Int) ListLongMap!12327)

(assert (=> b!955821 (= lt!430314 (contains!5288 (getCurrentListMap!3412 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27871 _keys!1441) i!735)))))

(declare-fun b!955822 () Bool)

(declare-fun res!639799 () Bool)

(assert (=> b!955822 (=> (not res!639799) (not e!538570))))

(declare-datatypes ((List!19415 0))(
  ( (Nil!19412) (Cons!19411 (h!20579 (_ BitVec 64)) (t!27768 List!19415)) )
))
(declare-fun arrayNoDuplicates!0 (array!57992 (_ BitVec 32) List!19415) Bool)

(assert (=> b!955822 (= res!639799 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19412))))

(declare-fun b!955823 () Bool)

(declare-fun e!538566 () Bool)

(assert (=> b!955823 (= e!538566 (and e!538567 mapRes!33337))))

(declare-fun condMapEmpty!33337 () Bool)

(declare-fun mapDefault!33337 () ValueCell!9977)

(assert (=> b!955823 (= condMapEmpty!33337 (= (arr!27872 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9977)) mapDefault!33337)))))

(declare-fun b!955824 () Bool)

(declare-fun res!639795 () Bool)

(assert (=> b!955824 (=> (not res!639795) (not e!538570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57992 (_ BitVec 32)) Bool)

(assert (=> b!955824 (= res!639795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955820 () Bool)

(assert (=> b!955820 (= e!538569 tp_is_empty!20917)))

(declare-fun res!639797 () Bool)

(assert (=> start!82046 (=> (not res!639797) (not e!538570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82046 (= res!639797 (validMask!0 mask!1823))))

(assert (=> start!82046 e!538570))

(assert (=> start!82046 true))

(assert (=> start!82046 tp_is_empty!20917))

(declare-fun array_inv!21713 (array!57992) Bool)

(assert (=> start!82046 (array_inv!21713 _keys!1441)))

(declare-fun array_inv!21714 (array!57994) Bool)

(assert (=> start!82046 (and (array_inv!21714 _values!1197) e!538566)))

(assert (=> start!82046 tp!63819))

(assert (= (and start!82046 res!639797) b!955817))

(assert (= (and b!955817 res!639800) b!955824))

(assert (= (and b!955824 res!639795) b!955822))

(assert (= (and b!955822 res!639799) b!955819))

(assert (= (and b!955819 res!639798) b!955816))

(assert (= (and b!955816 res!639796) b!955821))

(assert (= (and b!955823 condMapEmpty!33337) mapIsEmpty!33337))

(assert (= (and b!955823 (not condMapEmpty!33337)) mapNonEmpty!33337))

(get-info :version)

(assert (= (and mapNonEmpty!33337 ((_ is ValueCellFull!9977) mapValue!33337)) b!955820))

(assert (= (and b!955823 ((_ is ValueCellFull!9977) mapDefault!33337)) b!955818))

(assert (= start!82046 b!955823))

(declare-fun m!887817 () Bool)

(assert (=> b!955824 m!887817))

(declare-fun m!887819 () Bool)

(assert (=> mapNonEmpty!33337 m!887819))

(declare-fun m!887821 () Bool)

(assert (=> start!82046 m!887821))

(declare-fun m!887823 () Bool)

(assert (=> start!82046 m!887823))

(declare-fun m!887825 () Bool)

(assert (=> start!82046 m!887825))

(declare-fun m!887827 () Bool)

(assert (=> b!955822 m!887827))

(declare-fun m!887829 () Bool)

(assert (=> b!955821 m!887829))

(declare-fun m!887831 () Bool)

(assert (=> b!955821 m!887831))

(assert (=> b!955821 m!887829))

(assert (=> b!955821 m!887831))

(declare-fun m!887833 () Bool)

(assert (=> b!955821 m!887833))

(assert (=> b!955816 m!887831))

(assert (=> b!955816 m!887831))

(declare-fun m!887835 () Bool)

(assert (=> b!955816 m!887835))

(check-sat tp_is_empty!20917 (not start!82046) (not b_next!18373) (not b!955824) (not b!955816) (not b!955822) b_and!29869 (not b!955821) (not mapNonEmpty!33337))
(check-sat b_and!29869 (not b_next!18373))
