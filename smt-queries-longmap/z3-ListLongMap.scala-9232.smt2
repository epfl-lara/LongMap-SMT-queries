; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110742 () Bool)

(assert start!110742)

(declare-fun b_free!29577 () Bool)

(declare-fun b_next!29577 () Bool)

(assert (=> start!110742 (= b_free!29577 (not b_next!29577))))

(declare-fun tp!104052 () Bool)

(declare-fun b_and!47785 () Bool)

(assert (=> start!110742 (= tp!104052 b_and!47785)))

(declare-fun b!1310711 () Bool)

(declare-fun res!870159 () Bool)

(declare-fun e!747692 () Bool)

(assert (=> b!1310711 (=> (not res!870159) (not e!747692))))

(declare-datatypes ((array!87602 0))(
  ( (array!87603 (arr!42281 (Array (_ BitVec 32) (_ BitVec 64))) (size!42831 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87602)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52179 0))(
  ( (V!52180 (val!17728 Int)) )
))
(declare-datatypes ((ValueCell!16755 0))(
  ( (ValueCellFull!16755 (v!20355 V!52179)) (EmptyCell!16755) )
))
(declare-datatypes ((array!87604 0))(
  ( (array!87605 (arr!42282 (Array (_ BitVec 32) ValueCell!16755)) (size!42832 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87604)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310711 (= res!870159 (and (= (size!42832 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42831 _keys!1628) (size!42832 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310712 () Bool)

(declare-fun res!870158 () Bool)

(assert (=> b!1310712 (=> (not res!870158) (not e!747692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87602 (_ BitVec 32)) Bool)

(assert (=> b!1310712 (= res!870158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54589 () Bool)

(declare-fun mapRes!54589 () Bool)

(assert (=> mapIsEmpty!54589 mapRes!54589))

(declare-fun b!1310713 () Bool)

(assert (=> b!1310713 (= e!747692 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun zeroValue!1296 () V!52179)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52179)

(declare-fun lt!585384 () Bool)

(declare-datatypes ((tuple2!22844 0))(
  ( (tuple2!22845 (_1!11433 (_ BitVec 64)) (_2!11433 V!52179)) )
))
(declare-datatypes ((List!29983 0))(
  ( (Nil!29980) (Cons!29979 (h!31188 tuple2!22844) (t!43589 List!29983)) )
))
(declare-datatypes ((ListLongMap!20501 0))(
  ( (ListLongMap!20502 (toList!10266 List!29983)) )
))
(declare-fun contains!8416 (ListLongMap!20501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5279 (array!87602 array!87604 (_ BitVec 32) (_ BitVec 32) V!52179 V!52179 (_ BitVec 32) Int) ListLongMap!20501)

(assert (=> b!1310713 (= lt!585384 (contains!8416 (getCurrentListMap!5279 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!870160 () Bool)

(assert (=> start!110742 (=> (not res!870160) (not e!747692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110742 (= res!870160 (validMask!0 mask!2040))))

(assert (=> start!110742 e!747692))

(assert (=> start!110742 tp!104052))

(declare-fun array_inv!31951 (array!87602) Bool)

(assert (=> start!110742 (array_inv!31951 _keys!1628)))

(assert (=> start!110742 true))

(declare-fun tp_is_empty!35307 () Bool)

(assert (=> start!110742 tp_is_empty!35307))

(declare-fun e!747690 () Bool)

(declare-fun array_inv!31952 (array!87604) Bool)

(assert (=> start!110742 (and (array_inv!31952 _values!1354) e!747690)))

(declare-fun b!1310714 () Bool)

(declare-fun e!747689 () Bool)

(assert (=> b!1310714 (= e!747689 tp_is_empty!35307)))

(declare-fun mapNonEmpty!54589 () Bool)

(declare-fun tp!104053 () Bool)

(declare-fun e!747691 () Bool)

(assert (=> mapNonEmpty!54589 (= mapRes!54589 (and tp!104053 e!747691))))

(declare-fun mapKey!54589 () (_ BitVec 32))

(declare-fun mapRest!54589 () (Array (_ BitVec 32) ValueCell!16755))

(declare-fun mapValue!54589 () ValueCell!16755)

(assert (=> mapNonEmpty!54589 (= (arr!42282 _values!1354) (store mapRest!54589 mapKey!54589 mapValue!54589))))

(declare-fun b!1310715 () Bool)

(declare-fun res!870161 () Bool)

(assert (=> b!1310715 (=> (not res!870161) (not e!747692))))

(assert (=> b!1310715 (= res!870161 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42831 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310716 () Bool)

(assert (=> b!1310716 (= e!747690 (and e!747689 mapRes!54589))))

(declare-fun condMapEmpty!54589 () Bool)

(declare-fun mapDefault!54589 () ValueCell!16755)

(assert (=> b!1310716 (= condMapEmpty!54589 (= (arr!42282 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16755)) mapDefault!54589)))))

(declare-fun b!1310717 () Bool)

(declare-fun res!870162 () Bool)

(assert (=> b!1310717 (=> (not res!870162) (not e!747692))))

(declare-datatypes ((List!29984 0))(
  ( (Nil!29981) (Cons!29980 (h!31189 (_ BitVec 64)) (t!43590 List!29984)) )
))
(declare-fun arrayNoDuplicates!0 (array!87602 (_ BitVec 32) List!29984) Bool)

(assert (=> b!1310717 (= res!870162 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29981))))

(declare-fun b!1310718 () Bool)

(assert (=> b!1310718 (= e!747691 tp_is_empty!35307)))

(assert (= (and start!110742 res!870160) b!1310711))

(assert (= (and b!1310711 res!870159) b!1310712))

(assert (= (and b!1310712 res!870158) b!1310717))

(assert (= (and b!1310717 res!870162) b!1310715))

(assert (= (and b!1310715 res!870161) b!1310713))

(assert (= (and b!1310716 condMapEmpty!54589) mapIsEmpty!54589))

(assert (= (and b!1310716 (not condMapEmpty!54589)) mapNonEmpty!54589))

(get-info :version)

(assert (= (and mapNonEmpty!54589 ((_ is ValueCellFull!16755) mapValue!54589)) b!1310718))

(assert (= (and b!1310716 ((_ is ValueCellFull!16755) mapDefault!54589)) b!1310714))

(assert (= start!110742 b!1310716))

(declare-fun m!1200421 () Bool)

(assert (=> b!1310713 m!1200421))

(assert (=> b!1310713 m!1200421))

(declare-fun m!1200423 () Bool)

(assert (=> b!1310713 m!1200423))

(declare-fun m!1200425 () Bool)

(assert (=> b!1310712 m!1200425))

(declare-fun m!1200427 () Bool)

(assert (=> mapNonEmpty!54589 m!1200427))

(declare-fun m!1200429 () Bool)

(assert (=> start!110742 m!1200429))

(declare-fun m!1200431 () Bool)

(assert (=> start!110742 m!1200431))

(declare-fun m!1200433 () Bool)

(assert (=> start!110742 m!1200433))

(declare-fun m!1200435 () Bool)

(assert (=> b!1310717 m!1200435))

(check-sat (not mapNonEmpty!54589) (not b!1310713) (not b!1310712) (not b!1310717) tp_is_empty!35307 b_and!47785 (not b_next!29577) (not start!110742))
(check-sat b_and!47785 (not b_next!29577))
