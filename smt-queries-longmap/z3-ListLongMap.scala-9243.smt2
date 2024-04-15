; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110806 () Bool)

(assert start!110806)

(declare-fun b_free!29641 () Bool)

(declare-fun b_next!29641 () Bool)

(assert (=> start!110806 (= b_free!29641 (not b_next!29641))))

(declare-fun tp!104246 () Bool)

(declare-fun b_and!47831 () Bool)

(assert (=> start!110806 (= tp!104246 b_and!47831)))

(declare-fun mapNonEmpty!54685 () Bool)

(declare-fun mapRes!54685 () Bool)

(declare-fun tp!104245 () Bool)

(declare-fun e!748136 () Bool)

(assert (=> mapNonEmpty!54685 (= mapRes!54685 (and tp!104245 e!748136))))

(declare-datatypes ((V!52265 0))(
  ( (V!52266 (val!17760 Int)) )
))
(declare-datatypes ((ValueCell!16787 0))(
  ( (ValueCellFull!16787 (v!20386 V!52265)) (EmptyCell!16787) )
))
(declare-fun mapRest!54685 () (Array (_ BitVec 32) ValueCell!16787))

(declare-fun mapValue!54685 () ValueCell!16787)

(declare-fun mapKey!54685 () (_ BitVec 32))

(declare-datatypes ((array!87637 0))(
  ( (array!87638 (arr!42299 (Array (_ BitVec 32) ValueCell!16787)) (size!42851 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87637)

(assert (=> mapNonEmpty!54685 (= (arr!42299 _values!1354) (store mapRest!54685 mapKey!54685 mapValue!54685))))

(declare-fun b!1311409 () Bool)

(declare-fun res!870609 () Bool)

(declare-fun e!748135 () Bool)

(assert (=> b!1311409 (=> (not res!870609) (not e!748135))))

(declare-datatypes ((array!87639 0))(
  ( (array!87640 (arr!42300 (Array (_ BitVec 32) (_ BitVec 64))) (size!42852 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87639)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311409 (= res!870609 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42852 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311410 () Bool)

(declare-fun res!870611 () Bool)

(assert (=> b!1311410 (=> (not res!870611) (not e!748135))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87639 (_ BitVec 32)) Bool)

(assert (=> b!1311410 (= res!870611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311411 () Bool)

(declare-fun tp_is_empty!35371 () Bool)

(assert (=> b!1311411 (= e!748136 tp_is_empty!35371)))

(declare-fun b!1311412 () Bool)

(assert (=> b!1311412 (= e!748135 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585294 () Bool)

(declare-fun minValue!1296 () V!52265)

(declare-fun zeroValue!1296 () V!52265)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22974 0))(
  ( (tuple2!22975 (_1!11498 (_ BitVec 64)) (_2!11498 V!52265)) )
))
(declare-datatypes ((List!30095 0))(
  ( (Nil!30092) (Cons!30091 (h!31300 tuple2!22974) (t!43693 List!30095)) )
))
(declare-datatypes ((ListLongMap!20631 0))(
  ( (ListLongMap!20632 (toList!10331 List!30095)) )
))
(declare-fun contains!8408 (ListLongMap!20631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5226 (array!87639 array!87637 (_ BitVec 32) (_ BitVec 32) V!52265 V!52265 (_ BitVec 32) Int) ListLongMap!20631)

(assert (=> b!1311412 (= lt!585294 (contains!8408 (getCurrentListMap!5226 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311414 () Bool)

(declare-fun res!870612 () Bool)

(assert (=> b!1311414 (=> (not res!870612) (not e!748135))))

(assert (=> b!1311414 (= res!870612 (and (= (size!42851 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42852 _keys!1628) (size!42851 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54685 () Bool)

(assert (=> mapIsEmpty!54685 mapRes!54685))

(declare-fun b!1311413 () Bool)

(declare-fun e!748138 () Bool)

(declare-fun e!748139 () Bool)

(assert (=> b!1311413 (= e!748138 (and e!748139 mapRes!54685))))

(declare-fun condMapEmpty!54685 () Bool)

(declare-fun mapDefault!54685 () ValueCell!16787)

(assert (=> b!1311413 (= condMapEmpty!54685 (= (arr!42299 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16787)) mapDefault!54685)))))

(declare-fun res!870610 () Bool)

(assert (=> start!110806 (=> (not res!870610) (not e!748135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110806 (= res!870610 (validMask!0 mask!2040))))

(assert (=> start!110806 e!748135))

(assert (=> start!110806 tp!104246))

(declare-fun array_inv!32147 (array!87639) Bool)

(assert (=> start!110806 (array_inv!32147 _keys!1628)))

(assert (=> start!110806 true))

(assert (=> start!110806 tp_is_empty!35371))

(declare-fun array_inv!32148 (array!87637) Bool)

(assert (=> start!110806 (and (array_inv!32148 _values!1354) e!748138)))

(declare-fun b!1311415 () Bool)

(declare-fun res!870613 () Bool)

(assert (=> b!1311415 (=> (not res!870613) (not e!748135))))

(declare-datatypes ((List!30096 0))(
  ( (Nil!30093) (Cons!30092 (h!31301 (_ BitVec 64)) (t!43694 List!30096)) )
))
(declare-fun arrayNoDuplicates!0 (array!87639 (_ BitVec 32) List!30096) Bool)

(assert (=> b!1311415 (= res!870613 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30093))))

(declare-fun b!1311416 () Bool)

(assert (=> b!1311416 (= e!748139 tp_is_empty!35371)))

(assert (= (and start!110806 res!870610) b!1311414))

(assert (= (and b!1311414 res!870612) b!1311410))

(assert (= (and b!1311410 res!870611) b!1311415))

(assert (= (and b!1311415 res!870613) b!1311409))

(assert (= (and b!1311409 res!870609) b!1311412))

(assert (= (and b!1311413 condMapEmpty!54685) mapIsEmpty!54685))

(assert (= (and b!1311413 (not condMapEmpty!54685)) mapNonEmpty!54685))

(get-info :version)

(assert (= (and mapNonEmpty!54685 ((_ is ValueCellFull!16787) mapValue!54685)) b!1311411))

(assert (= (and b!1311413 ((_ is ValueCellFull!16787) mapDefault!54685)) b!1311416))

(assert (= start!110806 b!1311413))

(declare-fun m!1200417 () Bool)

(assert (=> b!1311410 m!1200417))

(declare-fun m!1200419 () Bool)

(assert (=> b!1311412 m!1200419))

(assert (=> b!1311412 m!1200419))

(declare-fun m!1200421 () Bool)

(assert (=> b!1311412 m!1200421))

(declare-fun m!1200423 () Bool)

(assert (=> start!110806 m!1200423))

(declare-fun m!1200425 () Bool)

(assert (=> start!110806 m!1200425))

(declare-fun m!1200427 () Bool)

(assert (=> start!110806 m!1200427))

(declare-fun m!1200429 () Bool)

(assert (=> b!1311415 m!1200429))

(declare-fun m!1200431 () Bool)

(assert (=> mapNonEmpty!54685 m!1200431))

(check-sat (not start!110806) (not mapNonEmpty!54685) b_and!47831 tp_is_empty!35371 (not b_next!29641) (not b!1311410) (not b!1311412) (not b!1311415))
(check-sat b_and!47831 (not b_next!29641))
