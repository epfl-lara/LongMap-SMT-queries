; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111030 () Bool)

(assert start!111030)

(declare-fun b_free!29641 () Bool)

(declare-fun b_next!29641 () Bool)

(assert (=> start!111030 (= b_free!29641 (not b_next!29641))))

(declare-fun tp!104245 () Bool)

(declare-fun b_and!47851 () Bool)

(assert (=> start!111030 (= tp!104245 b_and!47851)))

(declare-fun b!1312778 () Bool)

(declare-fun res!871157 () Bool)

(declare-fun e!749012 () Bool)

(assert (=> b!1312778 (=> (not res!871157) (not e!749012))))

(declare-datatypes ((array!87779 0))(
  ( (array!87780 (arr!42365 (Array (_ BitVec 32) (_ BitVec 64))) (size!42916 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87779)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52265 0))(
  ( (V!52266 (val!17760 Int)) )
))
(declare-datatypes ((ValueCell!16787 0))(
  ( (ValueCellFull!16787 (v!20382 V!52265)) (EmptyCell!16787) )
))
(declare-datatypes ((array!87781 0))(
  ( (array!87782 (arr!42366 (Array (_ BitVec 32) ValueCell!16787)) (size!42917 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87781)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312778 (= res!871157 (and (= (size!42917 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42916 _keys!1628) (size!42917 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!871158 () Bool)

(assert (=> start!111030 (=> (not res!871158) (not e!749012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111030 (= res!871158 (validMask!0 mask!2040))))

(assert (=> start!111030 e!749012))

(assert (=> start!111030 tp!104245))

(declare-fun array_inv!32275 (array!87779) Bool)

(assert (=> start!111030 (array_inv!32275 _keys!1628)))

(assert (=> start!111030 true))

(declare-fun tp_is_empty!35371 () Bool)

(assert (=> start!111030 tp_is_empty!35371))

(declare-fun e!749011 () Bool)

(declare-fun array_inv!32276 (array!87781) Bool)

(assert (=> start!111030 (and (array_inv!32276 _values!1354) e!749011)))

(declare-fun b!1312779 () Bool)

(assert (=> b!1312779 (= e!749012 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun lt!585956 () Bool)

(declare-fun minValue!1296 () V!52265)

(declare-fun zeroValue!1296 () V!52265)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22922 0))(
  ( (tuple2!22923 (_1!11472 (_ BitVec 64)) (_2!11472 V!52265)) )
))
(declare-datatypes ((List!30076 0))(
  ( (Nil!30073) (Cons!30072 (h!31290 tuple2!22922) (t!43674 List!30076)) )
))
(declare-datatypes ((ListLongMap!20587 0))(
  ( (ListLongMap!20588 (toList!10309 List!30076)) )
))
(declare-fun contains!8471 (ListLongMap!20587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5313 (array!87779 array!87781 (_ BitVec 32) (_ BitVec 32) V!52265 V!52265 (_ BitVec 32) Int) ListLongMap!20587)

(assert (=> b!1312779 (= lt!585956 (contains!8471 (getCurrentListMap!5313 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312780 () Bool)

(declare-fun e!749013 () Bool)

(assert (=> b!1312780 (= e!749013 tp_is_empty!35371)))

(declare-fun mapIsEmpty!54685 () Bool)

(declare-fun mapRes!54685 () Bool)

(assert (=> mapIsEmpty!54685 mapRes!54685))

(declare-fun mapNonEmpty!54685 () Bool)

(declare-fun tp!104244 () Bool)

(declare-fun e!749014 () Bool)

(assert (=> mapNonEmpty!54685 (= mapRes!54685 (and tp!104244 e!749014))))

(declare-fun mapValue!54685 () ValueCell!16787)

(declare-fun mapKey!54685 () (_ BitVec 32))

(declare-fun mapRest!54685 () (Array (_ BitVec 32) ValueCell!16787))

(assert (=> mapNonEmpty!54685 (= (arr!42366 _values!1354) (store mapRest!54685 mapKey!54685 mapValue!54685))))

(declare-fun b!1312781 () Bool)

(declare-fun res!871156 () Bool)

(assert (=> b!1312781 (=> (not res!871156) (not e!749012))))

(assert (=> b!1312781 (= res!871156 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42916 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312782 () Bool)

(assert (=> b!1312782 (= e!749011 (and e!749013 mapRes!54685))))

(declare-fun condMapEmpty!54685 () Bool)

(declare-fun mapDefault!54685 () ValueCell!16787)

(assert (=> b!1312782 (= condMapEmpty!54685 (= (arr!42366 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16787)) mapDefault!54685)))))

(declare-fun b!1312783 () Bool)

(assert (=> b!1312783 (= e!749014 tp_is_empty!35371)))

(declare-fun b!1312784 () Bool)

(declare-fun res!871160 () Bool)

(assert (=> b!1312784 (=> (not res!871160) (not e!749012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87779 (_ BitVec 32)) Bool)

(assert (=> b!1312784 (= res!871160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312785 () Bool)

(declare-fun res!871159 () Bool)

(assert (=> b!1312785 (=> (not res!871159) (not e!749012))))

(declare-datatypes ((List!30077 0))(
  ( (Nil!30074) (Cons!30073 (h!31291 (_ BitVec 64)) (t!43675 List!30077)) )
))
(declare-fun arrayNoDuplicates!0 (array!87779 (_ BitVec 32) List!30077) Bool)

(assert (=> b!1312785 (= res!871159 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30074))))

(assert (= (and start!111030 res!871158) b!1312778))

(assert (= (and b!1312778 res!871157) b!1312784))

(assert (= (and b!1312784 res!871160) b!1312785))

(assert (= (and b!1312785 res!871159) b!1312781))

(assert (= (and b!1312781 res!871156) b!1312779))

(assert (= (and b!1312782 condMapEmpty!54685) mapIsEmpty!54685))

(assert (= (and b!1312782 (not condMapEmpty!54685)) mapNonEmpty!54685))

(get-info :version)

(assert (= (and mapNonEmpty!54685 ((_ is ValueCellFull!16787) mapValue!54685)) b!1312783))

(assert (= (and b!1312782 ((_ is ValueCellFull!16787) mapDefault!54685)) b!1312780))

(assert (= start!111030 b!1312782))

(declare-fun m!1202531 () Bool)

(assert (=> mapNonEmpty!54685 m!1202531))

(declare-fun m!1202533 () Bool)

(assert (=> start!111030 m!1202533))

(declare-fun m!1202535 () Bool)

(assert (=> start!111030 m!1202535))

(declare-fun m!1202537 () Bool)

(assert (=> start!111030 m!1202537))

(declare-fun m!1202539 () Bool)

(assert (=> b!1312785 m!1202539))

(declare-fun m!1202541 () Bool)

(assert (=> b!1312779 m!1202541))

(assert (=> b!1312779 m!1202541))

(declare-fun m!1202543 () Bool)

(assert (=> b!1312779 m!1202543))

(declare-fun m!1202545 () Bool)

(assert (=> b!1312784 m!1202545))

(check-sat (not b_next!29641) (not b!1312785) b_and!47851 (not start!111030) (not b!1312779) (not mapNonEmpty!54685) (not b!1312784) tp_is_empty!35371)
(check-sat b_and!47851 (not b_next!29641))
