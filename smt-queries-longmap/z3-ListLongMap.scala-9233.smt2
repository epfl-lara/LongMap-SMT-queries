; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110748 () Bool)

(assert start!110748)

(declare-fun b_free!29583 () Bool)

(declare-fun b_next!29583 () Bool)

(assert (=> start!110748 (= b_free!29583 (not b_next!29583))))

(declare-fun tp!104071 () Bool)

(declare-fun b_and!47791 () Bool)

(assert (=> start!110748 (= tp!104071 b_and!47791)))

(declare-fun b!1310783 () Bool)

(declare-fun e!747735 () Bool)

(assert (=> b!1310783 (= e!747735 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87614 0))(
  ( (array!87615 (arr!42287 (Array (_ BitVec 32) (_ BitVec 64))) (size!42837 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87614)

(declare-fun lt!585393 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52187 0))(
  ( (V!52188 (val!17731 Int)) )
))
(declare-fun minValue!1296 () V!52187)

(declare-datatypes ((ValueCell!16758 0))(
  ( (ValueCellFull!16758 (v!20358 V!52187)) (EmptyCell!16758) )
))
(declare-datatypes ((array!87616 0))(
  ( (array!87617 (arr!42288 (Array (_ BitVec 32) ValueCell!16758)) (size!42838 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87616)

(declare-fun zeroValue!1296 () V!52187)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22850 0))(
  ( (tuple2!22851 (_1!11436 (_ BitVec 64)) (_2!11436 V!52187)) )
))
(declare-datatypes ((List!29989 0))(
  ( (Nil!29986) (Cons!29985 (h!31194 tuple2!22850) (t!43595 List!29989)) )
))
(declare-datatypes ((ListLongMap!20507 0))(
  ( (ListLongMap!20508 (toList!10269 List!29989)) )
))
(declare-fun contains!8419 (ListLongMap!20507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5282 (array!87614 array!87616 (_ BitVec 32) (_ BitVec 32) V!52187 V!52187 (_ BitVec 32) Int) ListLongMap!20507)

(assert (=> b!1310783 (= lt!585393 (contains!8419 (getCurrentListMap!5282 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310784 () Bool)

(declare-fun res!870203 () Bool)

(assert (=> b!1310784 (=> (not res!870203) (not e!747735))))

(assert (=> b!1310784 (= res!870203 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42837 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310785 () Bool)

(declare-fun e!747736 () Bool)

(declare-fun tp_is_empty!35313 () Bool)

(assert (=> b!1310785 (= e!747736 tp_is_empty!35313)))

(declare-fun b!1310786 () Bool)

(declare-fun e!747734 () Bool)

(assert (=> b!1310786 (= e!747734 tp_is_empty!35313)))

(declare-fun res!870207 () Bool)

(assert (=> start!110748 (=> (not res!870207) (not e!747735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110748 (= res!870207 (validMask!0 mask!2040))))

(assert (=> start!110748 e!747735))

(assert (=> start!110748 tp!104071))

(declare-fun array_inv!31957 (array!87614) Bool)

(assert (=> start!110748 (array_inv!31957 _keys!1628)))

(assert (=> start!110748 true))

(assert (=> start!110748 tp_is_empty!35313))

(declare-fun e!747733 () Bool)

(declare-fun array_inv!31958 (array!87616) Bool)

(assert (=> start!110748 (and (array_inv!31958 _values!1354) e!747733)))

(declare-fun mapNonEmpty!54598 () Bool)

(declare-fun mapRes!54598 () Bool)

(declare-fun tp!104070 () Bool)

(assert (=> mapNonEmpty!54598 (= mapRes!54598 (and tp!104070 e!747736))))

(declare-fun mapRest!54598 () (Array (_ BitVec 32) ValueCell!16758))

(declare-fun mapValue!54598 () ValueCell!16758)

(declare-fun mapKey!54598 () (_ BitVec 32))

(assert (=> mapNonEmpty!54598 (= (arr!42288 _values!1354) (store mapRest!54598 mapKey!54598 mapValue!54598))))

(declare-fun b!1310787 () Bool)

(declare-fun res!870206 () Bool)

(assert (=> b!1310787 (=> (not res!870206) (not e!747735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87614 (_ BitVec 32)) Bool)

(assert (=> b!1310787 (= res!870206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310788 () Bool)

(assert (=> b!1310788 (= e!747733 (and e!747734 mapRes!54598))))

(declare-fun condMapEmpty!54598 () Bool)

(declare-fun mapDefault!54598 () ValueCell!16758)

(assert (=> b!1310788 (= condMapEmpty!54598 (= (arr!42288 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16758)) mapDefault!54598)))))

(declare-fun b!1310789 () Bool)

(declare-fun res!870205 () Bool)

(assert (=> b!1310789 (=> (not res!870205) (not e!747735))))

(declare-datatypes ((List!29990 0))(
  ( (Nil!29987) (Cons!29986 (h!31195 (_ BitVec 64)) (t!43596 List!29990)) )
))
(declare-fun arrayNoDuplicates!0 (array!87614 (_ BitVec 32) List!29990) Bool)

(assert (=> b!1310789 (= res!870205 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29987))))

(declare-fun mapIsEmpty!54598 () Bool)

(assert (=> mapIsEmpty!54598 mapRes!54598))

(declare-fun b!1310790 () Bool)

(declare-fun res!870204 () Bool)

(assert (=> b!1310790 (=> (not res!870204) (not e!747735))))

(assert (=> b!1310790 (= res!870204 (and (= (size!42838 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42837 _keys!1628) (size!42838 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110748 res!870207) b!1310790))

(assert (= (and b!1310790 res!870204) b!1310787))

(assert (= (and b!1310787 res!870206) b!1310789))

(assert (= (and b!1310789 res!870205) b!1310784))

(assert (= (and b!1310784 res!870203) b!1310783))

(assert (= (and b!1310788 condMapEmpty!54598) mapIsEmpty!54598))

(assert (= (and b!1310788 (not condMapEmpty!54598)) mapNonEmpty!54598))

(get-info :version)

(assert (= (and mapNonEmpty!54598 ((_ is ValueCellFull!16758) mapValue!54598)) b!1310785))

(assert (= (and b!1310788 ((_ is ValueCellFull!16758) mapDefault!54598)) b!1310786))

(assert (= start!110748 b!1310788))

(declare-fun m!1200469 () Bool)

(assert (=> start!110748 m!1200469))

(declare-fun m!1200471 () Bool)

(assert (=> start!110748 m!1200471))

(declare-fun m!1200473 () Bool)

(assert (=> start!110748 m!1200473))

(declare-fun m!1200475 () Bool)

(assert (=> b!1310789 m!1200475))

(declare-fun m!1200477 () Bool)

(assert (=> b!1310783 m!1200477))

(assert (=> b!1310783 m!1200477))

(declare-fun m!1200479 () Bool)

(assert (=> b!1310783 m!1200479))

(declare-fun m!1200481 () Bool)

(assert (=> mapNonEmpty!54598 m!1200481))

(declare-fun m!1200483 () Bool)

(assert (=> b!1310787 m!1200483))

(check-sat b_and!47791 (not mapNonEmpty!54598) (not b_next!29583) tp_is_empty!35313 (not b!1310789) (not b!1310783) (not start!110748) (not b!1310787))
(check-sat b_and!47791 (not b_next!29583))
