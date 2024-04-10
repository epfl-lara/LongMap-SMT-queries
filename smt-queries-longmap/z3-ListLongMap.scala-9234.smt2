; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110754 () Bool)

(assert start!110754)

(declare-fun b_free!29589 () Bool)

(declare-fun b_next!29589 () Bool)

(assert (=> start!110754 (= b_free!29589 (not b_next!29589))))

(declare-fun tp!104089 () Bool)

(declare-fun b_and!47797 () Bool)

(assert (=> start!110754 (= tp!104089 b_and!47797)))

(declare-fun b!1310855 () Bool)

(declare-fun res!870248 () Bool)

(declare-fun e!747782 () Bool)

(assert (=> b!1310855 (=> (not res!870248) (not e!747782))))

(declare-datatypes ((array!87626 0))(
  ( (array!87627 (arr!42293 (Array (_ BitVec 32) (_ BitVec 64))) (size!42843 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87626)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87626 (_ BitVec 32)) Bool)

(assert (=> b!1310855 (= res!870248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310856 () Bool)

(declare-fun e!747779 () Bool)

(declare-fun tp_is_empty!35319 () Bool)

(assert (=> b!1310856 (= e!747779 tp_is_empty!35319)))

(declare-fun mapIsEmpty!54607 () Bool)

(declare-fun mapRes!54607 () Bool)

(assert (=> mapIsEmpty!54607 mapRes!54607))

(declare-fun b!1310857 () Bool)

(declare-fun e!747780 () Bool)

(assert (=> b!1310857 (= e!747780 tp_is_empty!35319)))

(declare-fun b!1310858 () Bool)

(declare-fun res!870251 () Bool)

(assert (=> b!1310858 (=> (not res!870251) (not e!747782))))

(declare-datatypes ((List!29994 0))(
  ( (Nil!29991) (Cons!29990 (h!31199 (_ BitVec 64)) (t!43600 List!29994)) )
))
(declare-fun arrayNoDuplicates!0 (array!87626 (_ BitVec 32) List!29994) Bool)

(assert (=> b!1310858 (= res!870251 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29991))))

(declare-fun mapNonEmpty!54607 () Bool)

(declare-fun tp!104088 () Bool)

(assert (=> mapNonEmpty!54607 (= mapRes!54607 (and tp!104088 e!747779))))

(declare-datatypes ((V!52195 0))(
  ( (V!52196 (val!17734 Int)) )
))
(declare-datatypes ((ValueCell!16761 0))(
  ( (ValueCellFull!16761 (v!20361 V!52195)) (EmptyCell!16761) )
))
(declare-fun mapRest!54607 () (Array (_ BitVec 32) ValueCell!16761))

(declare-fun mapValue!54607 () ValueCell!16761)

(declare-datatypes ((array!87628 0))(
  ( (array!87629 (arr!42294 (Array (_ BitVec 32) ValueCell!16761)) (size!42844 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87628)

(declare-fun mapKey!54607 () (_ BitVec 32))

(assert (=> mapNonEmpty!54607 (= (arr!42294 _values!1354) (store mapRest!54607 mapKey!54607 mapValue!54607))))

(declare-fun b!1310859 () Bool)

(declare-fun e!747781 () Bool)

(assert (=> b!1310859 (= e!747781 (and e!747780 mapRes!54607))))

(declare-fun condMapEmpty!54607 () Bool)

(declare-fun mapDefault!54607 () ValueCell!16761)

(assert (=> b!1310859 (= condMapEmpty!54607 (= (arr!42294 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16761)) mapDefault!54607)))))

(declare-fun b!1310861 () Bool)

(declare-fun res!870250 () Bool)

(assert (=> b!1310861 (=> (not res!870250) (not e!747782))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310861 (= res!870250 (and (= (size!42844 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42843 _keys!1628) (size!42844 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310862 () Bool)

(declare-fun res!870249 () Bool)

(assert (=> b!1310862 (=> (not res!870249) (not e!747782))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310862 (= res!870249 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42843 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!870252 () Bool)

(assert (=> start!110754 (=> (not res!870252) (not e!747782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110754 (= res!870252 (validMask!0 mask!2040))))

(assert (=> start!110754 e!747782))

(assert (=> start!110754 tp!104089))

(declare-fun array_inv!31961 (array!87626) Bool)

(assert (=> start!110754 (array_inv!31961 _keys!1628)))

(assert (=> start!110754 true))

(assert (=> start!110754 tp_is_empty!35319))

(declare-fun array_inv!31962 (array!87628) Bool)

(assert (=> start!110754 (and (array_inv!31962 _values!1354) e!747781)))

(declare-fun b!1310860 () Bool)

(assert (=> b!1310860 (= e!747782 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun zeroValue!1296 () V!52195)

(declare-fun minValue!1296 () V!52195)

(declare-fun lt!585402 () Bool)

(declare-datatypes ((tuple2!22854 0))(
  ( (tuple2!22855 (_1!11438 (_ BitVec 64)) (_2!11438 V!52195)) )
))
(declare-datatypes ((List!29995 0))(
  ( (Nil!29992) (Cons!29991 (h!31200 tuple2!22854) (t!43601 List!29995)) )
))
(declare-datatypes ((ListLongMap!20511 0))(
  ( (ListLongMap!20512 (toList!10271 List!29995)) )
))
(declare-fun contains!8421 (ListLongMap!20511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5284 (array!87626 array!87628 (_ BitVec 32) (_ BitVec 32) V!52195 V!52195 (_ BitVec 32) Int) ListLongMap!20511)

(assert (=> b!1310860 (= lt!585402 (contains!8421 (getCurrentListMap!5284 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110754 res!870252) b!1310861))

(assert (= (and b!1310861 res!870250) b!1310855))

(assert (= (and b!1310855 res!870248) b!1310858))

(assert (= (and b!1310858 res!870251) b!1310862))

(assert (= (and b!1310862 res!870249) b!1310860))

(assert (= (and b!1310859 condMapEmpty!54607) mapIsEmpty!54607))

(assert (= (and b!1310859 (not condMapEmpty!54607)) mapNonEmpty!54607))

(get-info :version)

(assert (= (and mapNonEmpty!54607 ((_ is ValueCellFull!16761) mapValue!54607)) b!1310856))

(assert (= (and b!1310859 ((_ is ValueCellFull!16761) mapDefault!54607)) b!1310857))

(assert (= start!110754 b!1310859))

(declare-fun m!1200517 () Bool)

(assert (=> mapNonEmpty!54607 m!1200517))

(declare-fun m!1200519 () Bool)

(assert (=> b!1310860 m!1200519))

(assert (=> b!1310860 m!1200519))

(declare-fun m!1200521 () Bool)

(assert (=> b!1310860 m!1200521))

(declare-fun m!1200523 () Bool)

(assert (=> start!110754 m!1200523))

(declare-fun m!1200525 () Bool)

(assert (=> start!110754 m!1200525))

(declare-fun m!1200527 () Bool)

(assert (=> start!110754 m!1200527))

(declare-fun m!1200529 () Bool)

(assert (=> b!1310858 m!1200529))

(declare-fun m!1200531 () Bool)

(assert (=> b!1310855 m!1200531))

(check-sat tp_is_empty!35319 (not b!1310860) (not b!1310855) (not mapNonEmpty!54607) (not b!1310858) (not start!110754) (not b_next!29589) b_and!47797)
(check-sat b_and!47797 (not b_next!29589))
