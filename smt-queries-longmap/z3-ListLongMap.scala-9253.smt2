; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110868 () Bool)

(assert start!110868)

(declare-fun b_free!29703 () Bool)

(declare-fun b_next!29703 () Bool)

(assert (=> start!110868 (= b_free!29703 (not b_next!29703))))

(declare-fun tp!104430 () Bool)

(declare-fun b_and!47911 () Bool)

(assert (=> start!110868 (= tp!104430 b_and!47911)))

(declare-fun mapIsEmpty!54778 () Bool)

(declare-fun mapRes!54778 () Bool)

(assert (=> mapIsEmpty!54778 mapRes!54778))

(declare-fun res!871428 () Bool)

(declare-fun e!748633 () Bool)

(assert (=> start!110868 (=> (not res!871428) (not e!748633))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110868 (= res!871428 (validMask!0 mask!2040))))

(assert (=> start!110868 e!748633))

(assert (=> start!110868 tp!104430))

(declare-datatypes ((array!87852 0))(
  ( (array!87853 (arr!42406 (Array (_ BitVec 32) (_ BitVec 64))) (size!42956 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87852)

(declare-fun array_inv!32041 (array!87852) Bool)

(assert (=> start!110868 (array_inv!32041 _keys!1628)))

(assert (=> start!110868 true))

(declare-fun tp_is_empty!35433 () Bool)

(assert (=> start!110868 tp_is_empty!35433))

(declare-datatypes ((V!52347 0))(
  ( (V!52348 (val!17791 Int)) )
))
(declare-datatypes ((ValueCell!16818 0))(
  ( (ValueCellFull!16818 (v!20418 V!52347)) (EmptyCell!16818) )
))
(declare-datatypes ((array!87854 0))(
  ( (array!87855 (arr!42407 (Array (_ BitVec 32) ValueCell!16818)) (size!42957 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87854)

(declare-fun e!748636 () Bool)

(declare-fun array_inv!32042 (array!87854) Bool)

(assert (=> start!110868 (and (array_inv!32042 _values!1354) e!748636)))

(declare-fun b!1312547 () Bool)

(declare-fun e!748634 () Bool)

(assert (=> b!1312547 (= e!748634 tp_is_empty!35433)))

(declare-fun b!1312548 () Bool)

(declare-fun res!871431 () Bool)

(assert (=> b!1312548 (=> (not res!871431) (not e!748633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87852 (_ BitVec 32)) Bool)

(assert (=> b!1312548 (= res!871431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312549 () Bool)

(declare-fun res!871427 () Bool)

(assert (=> b!1312549 (=> (not res!871427) (not e!748633))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312549 (= res!871427 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42956 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312550 () Bool)

(declare-fun e!748635 () Bool)

(assert (=> b!1312550 (= e!748635 tp_is_empty!35433)))

(declare-fun b!1312551 () Bool)

(assert (=> b!1312551 (= e!748633 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52347)

(declare-fun zeroValue!1296 () V!52347)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585573 () Bool)

(declare-datatypes ((tuple2!22934 0))(
  ( (tuple2!22935 (_1!11478 (_ BitVec 64)) (_2!11478 V!52347)) )
))
(declare-datatypes ((List!30072 0))(
  ( (Nil!30069) (Cons!30068 (h!31277 tuple2!22934) (t!43678 List!30072)) )
))
(declare-datatypes ((ListLongMap!20591 0))(
  ( (ListLongMap!20592 (toList!10311 List!30072)) )
))
(declare-fun contains!8461 (ListLongMap!20591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5324 (array!87852 array!87854 (_ BitVec 32) (_ BitVec 32) V!52347 V!52347 (_ BitVec 32) Int) ListLongMap!20591)

(assert (=> b!1312551 (= lt!585573 (contains!8461 (getCurrentListMap!5324 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312552 () Bool)

(declare-fun res!871429 () Bool)

(assert (=> b!1312552 (=> (not res!871429) (not e!748633))))

(declare-datatypes ((List!30073 0))(
  ( (Nil!30070) (Cons!30069 (h!31278 (_ BitVec 64)) (t!43679 List!30073)) )
))
(declare-fun arrayNoDuplicates!0 (array!87852 (_ BitVec 32) List!30073) Bool)

(assert (=> b!1312552 (= res!871429 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30070))))

(declare-fun b!1312553 () Bool)

(declare-fun res!871430 () Bool)

(assert (=> b!1312553 (=> (not res!871430) (not e!748633))))

(assert (=> b!1312553 (= res!871430 (and (= (size!42957 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42956 _keys!1628) (size!42957 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312554 () Bool)

(assert (=> b!1312554 (= e!748636 (and e!748635 mapRes!54778))))

(declare-fun condMapEmpty!54778 () Bool)

(declare-fun mapDefault!54778 () ValueCell!16818)

(assert (=> b!1312554 (= condMapEmpty!54778 (= (arr!42407 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16818)) mapDefault!54778)))))

(declare-fun mapNonEmpty!54778 () Bool)

(declare-fun tp!104431 () Bool)

(assert (=> mapNonEmpty!54778 (= mapRes!54778 (and tp!104431 e!748634))))

(declare-fun mapKey!54778 () (_ BitVec 32))

(declare-fun mapRest!54778 () (Array (_ BitVec 32) ValueCell!16818))

(declare-fun mapValue!54778 () ValueCell!16818)

(assert (=> mapNonEmpty!54778 (= (arr!42407 _values!1354) (store mapRest!54778 mapKey!54778 mapValue!54778))))

(assert (= (and start!110868 res!871428) b!1312553))

(assert (= (and b!1312553 res!871430) b!1312548))

(assert (= (and b!1312548 res!871431) b!1312552))

(assert (= (and b!1312552 res!871429) b!1312549))

(assert (= (and b!1312549 res!871427) b!1312551))

(assert (= (and b!1312554 condMapEmpty!54778) mapIsEmpty!54778))

(assert (= (and b!1312554 (not condMapEmpty!54778)) mapNonEmpty!54778))

(get-info :version)

(assert (= (and mapNonEmpty!54778 ((_ is ValueCellFull!16818) mapValue!54778)) b!1312547))

(assert (= (and b!1312554 ((_ is ValueCellFull!16818) mapDefault!54778)) b!1312550))

(assert (= start!110868 b!1312554))

(declare-fun m!1201699 () Bool)

(assert (=> b!1312551 m!1201699))

(assert (=> b!1312551 m!1201699))

(declare-fun m!1201701 () Bool)

(assert (=> b!1312551 m!1201701))

(declare-fun m!1201703 () Bool)

(assert (=> b!1312552 m!1201703))

(declare-fun m!1201705 () Bool)

(assert (=> b!1312548 m!1201705))

(declare-fun m!1201707 () Bool)

(assert (=> mapNonEmpty!54778 m!1201707))

(declare-fun m!1201709 () Bool)

(assert (=> start!110868 m!1201709))

(declare-fun m!1201711 () Bool)

(assert (=> start!110868 m!1201711))

(declare-fun m!1201713 () Bool)

(assert (=> start!110868 m!1201713))

(check-sat (not start!110868) (not b_next!29703) tp_is_empty!35433 (not b!1312548) b_and!47911 (not b!1312551) (not b!1312552) (not mapNonEmpty!54778))
(check-sat b_and!47911 (not b_next!29703))
