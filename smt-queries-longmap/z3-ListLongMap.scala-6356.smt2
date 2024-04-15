; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81854 () Bool)

(assert start!81854)

(declare-fun b_free!18367 () Bool)

(declare-fun b_next!18367 () Bool)

(assert (=> start!81854 (= b_free!18367 (not b_next!18367))))

(declare-fun tp!63801 () Bool)

(declare-fun b_and!29827 () Bool)

(assert (=> start!81854 (= tp!63801 b_and!29827)))

(declare-fun b!954593 () Bool)

(declare-fun res!639289 () Bool)

(declare-fun e!537795 () Bool)

(assert (=> b!954593 (=> (not res!639289) (not e!537795))))

(declare-datatypes ((array!57892 0))(
  ( (array!57893 (arr!27826 (Array (_ BitVec 32) (_ BitVec 64))) (size!28307 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57892)

(declare-datatypes ((List!19422 0))(
  ( (Nil!19419) (Cons!19418 (h!20580 (_ BitVec 64)) (t!27774 List!19422)) )
))
(declare-fun arrayNoDuplicates!0 (array!57892 (_ BitVec 32) List!19422) Bool)

(assert (=> b!954593 (= res!639289 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19419))))

(declare-fun mapNonEmpty!33328 () Bool)

(declare-fun mapRes!33328 () Bool)

(declare-fun tp!63802 () Bool)

(declare-fun e!537793 () Bool)

(assert (=> mapNonEmpty!33328 (= mapRes!33328 (and tp!63802 e!537793))))

(declare-datatypes ((V!32865 0))(
  ( (V!32866 (val!10506 Int)) )
))
(declare-datatypes ((ValueCell!9974 0))(
  ( (ValueCellFull!9974 (v!13060 V!32865)) (EmptyCell!9974) )
))
(declare-fun mapRest!33328 () (Array (_ BitVec 32) ValueCell!9974))

(declare-fun mapKey!33328 () (_ BitVec 32))

(declare-datatypes ((array!57894 0))(
  ( (array!57895 (arr!27827 (Array (_ BitVec 32) ValueCell!9974)) (size!28308 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57894)

(declare-fun mapValue!33328 () ValueCell!9974)

(assert (=> mapNonEmpty!33328 (= (arr!27827 _values!1197) (store mapRest!33328 mapKey!33328 mapValue!33328))))

(declare-fun b!954594 () Bool)

(declare-fun res!639290 () Bool)

(assert (=> b!954594 (=> (not res!639290) (not e!537795))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!954594 (= res!639290 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28307 _keys!1441))))))

(declare-fun mapIsEmpty!33328 () Bool)

(assert (=> mapIsEmpty!33328 mapRes!33328))

(declare-fun b!954595 () Bool)

(declare-fun tp_is_empty!20911 () Bool)

(assert (=> b!954595 (= e!537793 tp_is_empty!20911)))

(declare-fun res!639291 () Bool)

(assert (=> start!81854 (=> (not res!639291) (not e!537795))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81854 (= res!639291 (validMask!0 mask!1823))))

(assert (=> start!81854 e!537795))

(assert (=> start!81854 true))

(assert (=> start!81854 tp_is_empty!20911))

(declare-fun array_inv!21659 (array!57892) Bool)

(assert (=> start!81854 (array_inv!21659 _keys!1441)))

(declare-fun e!537791 () Bool)

(declare-fun array_inv!21660 (array!57894) Bool)

(assert (=> start!81854 (and (array_inv!21660 _values!1197) e!537791)))

(assert (=> start!81854 tp!63801))

(declare-fun b!954596 () Bool)

(declare-fun res!639292 () Bool)

(assert (=> b!954596 (=> (not res!639292) (not e!537795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57892 (_ BitVec 32)) Bool)

(assert (=> b!954596 (= res!639292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954597 () Bool)

(declare-fun res!639288 () Bool)

(assert (=> b!954597 (=> (not res!639288) (not e!537795))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954597 (= res!639288 (and (= (size!28308 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28307 _keys!1441) (size!28308 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954598 () Bool)

(declare-fun e!537794 () Bool)

(assert (=> b!954598 (= e!537791 (and e!537794 mapRes!33328))))

(declare-fun condMapEmpty!33328 () Bool)

(declare-fun mapDefault!33328 () ValueCell!9974)

(assert (=> b!954598 (= condMapEmpty!33328 (= (arr!27827 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9974)) mapDefault!33328)))))

(declare-fun b!954599 () Bool)

(assert (=> b!954599 (= e!537794 tp_is_empty!20911)))

(declare-fun b!954600 () Bool)

(assert (=> b!954600 (= e!537795 false)))

(declare-fun zeroValue!1139 () V!32865)

(declare-fun lt!429708 () Bool)

(declare-fun minValue!1139 () V!32865)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13680 0))(
  ( (tuple2!13681 (_1!6851 (_ BitVec 64)) (_2!6851 V!32865)) )
))
(declare-datatypes ((List!19423 0))(
  ( (Nil!19420) (Cons!19419 (h!20581 tuple2!13680) (t!27775 List!19423)) )
))
(declare-datatypes ((ListLongMap!12367 0))(
  ( (ListLongMap!12368 (toList!6199 List!19423)) )
))
(declare-fun contains!5240 (ListLongMap!12367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3361 (array!57892 array!57894 (_ BitVec 32) (_ BitVec 32) V!32865 V!32865 (_ BitVec 32) Int) ListLongMap!12367)

(assert (=> b!954600 (= lt!429708 (contains!5240 (getCurrentListMap!3361 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27826 _keys!1441) i!735)))))

(declare-fun b!954601 () Bool)

(declare-fun res!639287 () Bool)

(assert (=> b!954601 (=> (not res!639287) (not e!537795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954601 (= res!639287 (validKeyInArray!0 (select (arr!27826 _keys!1441) i!735)))))

(assert (= (and start!81854 res!639291) b!954597))

(assert (= (and b!954597 res!639288) b!954596))

(assert (= (and b!954596 res!639292) b!954593))

(assert (= (and b!954593 res!639289) b!954594))

(assert (= (and b!954594 res!639290) b!954601))

(assert (= (and b!954601 res!639287) b!954600))

(assert (= (and b!954598 condMapEmpty!33328) mapIsEmpty!33328))

(assert (= (and b!954598 (not condMapEmpty!33328)) mapNonEmpty!33328))

(get-info :version)

(assert (= (and mapNonEmpty!33328 ((_ is ValueCellFull!9974) mapValue!33328)) b!954595))

(assert (= (and b!954598 ((_ is ValueCellFull!9974) mapDefault!33328)) b!954599))

(assert (= start!81854 b!954598))

(declare-fun m!885705 () Bool)

(assert (=> b!954600 m!885705))

(declare-fun m!885707 () Bool)

(assert (=> b!954600 m!885707))

(assert (=> b!954600 m!885705))

(assert (=> b!954600 m!885707))

(declare-fun m!885709 () Bool)

(assert (=> b!954600 m!885709))

(declare-fun m!885711 () Bool)

(assert (=> b!954593 m!885711))

(declare-fun m!885713 () Bool)

(assert (=> b!954596 m!885713))

(declare-fun m!885715 () Bool)

(assert (=> start!81854 m!885715))

(declare-fun m!885717 () Bool)

(assert (=> start!81854 m!885717))

(declare-fun m!885719 () Bool)

(assert (=> start!81854 m!885719))

(declare-fun m!885721 () Bool)

(assert (=> mapNonEmpty!33328 m!885721))

(assert (=> b!954601 m!885707))

(assert (=> b!954601 m!885707))

(declare-fun m!885723 () Bool)

(assert (=> b!954601 m!885723))

(check-sat (not start!81854) (not b!954601) (not b_next!18367) (not b!954593) b_and!29827 (not b!954596) (not b!954600) (not mapNonEmpty!33328) tp_is_empty!20911)
(check-sat b_and!29827 (not b_next!18367))
