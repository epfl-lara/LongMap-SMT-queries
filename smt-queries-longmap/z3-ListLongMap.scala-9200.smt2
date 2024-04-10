; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110550 () Bool)

(assert start!110550)

(declare-fun b_free!29385 () Bool)

(declare-fun b_next!29385 () Bool)

(assert (=> start!110550 (= b_free!29385 (not b_next!29385))))

(declare-fun tp!103477 () Bool)

(declare-fun b_and!47593 () Bool)

(assert (=> start!110550 (= tp!103477 b_and!47593)))

(declare-fun b!1307759 () Bool)

(declare-fun e!746251 () Bool)

(assert (=> b!1307759 (= e!746251 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87230 0))(
  ( (array!87231 (arr!42095 (Array (_ BitVec 32) (_ BitVec 64))) (size!42645 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87230)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585096 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51923 0))(
  ( (V!51924 (val!17632 Int)) )
))
(declare-fun minValue!1296 () V!51923)

(declare-datatypes ((ValueCell!16659 0))(
  ( (ValueCellFull!16659 (v!20259 V!51923)) (EmptyCell!16659) )
))
(declare-datatypes ((array!87232 0))(
  ( (array!87233 (arr!42096 (Array (_ BitVec 32) ValueCell!16659)) (size!42646 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87232)

(declare-fun zeroValue!1296 () V!51923)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22698 0))(
  ( (tuple2!22699 (_1!11360 (_ BitVec 64)) (_2!11360 V!51923)) )
))
(declare-datatypes ((List!29840 0))(
  ( (Nil!29837) (Cons!29836 (h!31045 tuple2!22698) (t!43446 List!29840)) )
))
(declare-datatypes ((ListLongMap!20355 0))(
  ( (ListLongMap!20356 (toList!10193 List!29840)) )
))
(declare-fun contains!8343 (ListLongMap!20355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5206 (array!87230 array!87232 (_ BitVec 32) (_ BitVec 32) V!51923 V!51923 (_ BitVec 32) Int) ListLongMap!20355)

(assert (=> b!1307759 (= lt!585096 (contains!8343 (getCurrentListMap!5206 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307760 () Bool)

(declare-fun e!746249 () Bool)

(declare-fun e!746250 () Bool)

(declare-fun mapRes!54301 () Bool)

(assert (=> b!1307760 (= e!746249 (and e!746250 mapRes!54301))))

(declare-fun condMapEmpty!54301 () Bool)

(declare-fun mapDefault!54301 () ValueCell!16659)

(assert (=> b!1307760 (= condMapEmpty!54301 (= (arr!42096 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16659)) mapDefault!54301)))))

(declare-fun b!1307761 () Bool)

(declare-fun tp_is_empty!35115 () Bool)

(assert (=> b!1307761 (= e!746250 tp_is_empty!35115)))

(declare-fun res!868071 () Bool)

(assert (=> start!110550 (=> (not res!868071) (not e!746251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110550 (= res!868071 (validMask!0 mask!2040))))

(assert (=> start!110550 e!746251))

(assert (=> start!110550 tp!103477))

(declare-fun array_inv!31815 (array!87230) Bool)

(assert (=> start!110550 (array_inv!31815 _keys!1628)))

(assert (=> start!110550 true))

(assert (=> start!110550 tp_is_empty!35115))

(declare-fun array_inv!31816 (array!87232) Bool)

(assert (=> start!110550 (and (array_inv!31816 _values!1354) e!746249)))

(declare-fun b!1307762 () Bool)

(declare-fun res!868070 () Bool)

(assert (=> b!1307762 (=> (not res!868070) (not e!746251))))

(assert (=> b!1307762 (= res!868070 (and (= (size!42646 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42645 _keys!1628) (size!42646 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307763 () Bool)

(declare-fun res!868072 () Bool)

(assert (=> b!1307763 (=> (not res!868072) (not e!746251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87230 (_ BitVec 32)) Bool)

(assert (=> b!1307763 (= res!868072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307764 () Bool)

(declare-fun res!868073 () Bool)

(assert (=> b!1307764 (=> (not res!868073) (not e!746251))))

(assert (=> b!1307764 (= res!868073 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42645 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54301 () Bool)

(declare-fun tp!103476 () Bool)

(declare-fun e!746248 () Bool)

(assert (=> mapNonEmpty!54301 (= mapRes!54301 (and tp!103476 e!746248))))

(declare-fun mapRest!54301 () (Array (_ BitVec 32) ValueCell!16659))

(declare-fun mapKey!54301 () (_ BitVec 32))

(declare-fun mapValue!54301 () ValueCell!16659)

(assert (=> mapNonEmpty!54301 (= (arr!42096 _values!1354) (store mapRest!54301 mapKey!54301 mapValue!54301))))

(declare-fun mapIsEmpty!54301 () Bool)

(assert (=> mapIsEmpty!54301 mapRes!54301))

(declare-fun b!1307765 () Bool)

(declare-fun res!868074 () Bool)

(assert (=> b!1307765 (=> (not res!868074) (not e!746251))))

(declare-datatypes ((List!29841 0))(
  ( (Nil!29838) (Cons!29837 (h!31046 (_ BitVec 64)) (t!43447 List!29841)) )
))
(declare-fun arrayNoDuplicates!0 (array!87230 (_ BitVec 32) List!29841) Bool)

(assert (=> b!1307765 (= res!868074 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29838))))

(declare-fun b!1307766 () Bool)

(assert (=> b!1307766 (= e!746248 tp_is_empty!35115)))

(assert (= (and start!110550 res!868071) b!1307762))

(assert (= (and b!1307762 res!868070) b!1307763))

(assert (= (and b!1307763 res!868072) b!1307765))

(assert (= (and b!1307765 res!868074) b!1307764))

(assert (= (and b!1307764 res!868073) b!1307759))

(assert (= (and b!1307760 condMapEmpty!54301) mapIsEmpty!54301))

(assert (= (and b!1307760 (not condMapEmpty!54301)) mapNonEmpty!54301))

(get-info :version)

(assert (= (and mapNonEmpty!54301 ((_ is ValueCellFull!16659) mapValue!54301)) b!1307766))

(assert (= (and b!1307760 ((_ is ValueCellFull!16659) mapDefault!54301)) b!1307761))

(assert (= start!110550 b!1307760))

(declare-fun m!1198345 () Bool)

(assert (=> b!1307763 m!1198345))

(declare-fun m!1198347 () Bool)

(assert (=> mapNonEmpty!54301 m!1198347))

(declare-fun m!1198349 () Bool)

(assert (=> b!1307765 m!1198349))

(declare-fun m!1198351 () Bool)

(assert (=> b!1307759 m!1198351))

(assert (=> b!1307759 m!1198351))

(declare-fun m!1198353 () Bool)

(assert (=> b!1307759 m!1198353))

(declare-fun m!1198355 () Bool)

(assert (=> start!110550 m!1198355))

(declare-fun m!1198357 () Bool)

(assert (=> start!110550 m!1198357))

(declare-fun m!1198359 () Bool)

(assert (=> start!110550 m!1198359))

(check-sat (not start!110550) (not b!1307763) b_and!47593 (not mapNonEmpty!54301) (not b!1307765) tp_is_empty!35115 (not b!1307759) (not b_next!29385))
(check-sat b_and!47593 (not b_next!29385))
