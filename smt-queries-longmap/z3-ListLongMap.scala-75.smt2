; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1026 () Bool)

(assert start!1026)

(declare-fun b_free!355 () Bool)

(declare-fun b_next!355 () Bool)

(assert (=> start!1026 (= b_free!355 (not b_next!355))))

(declare-fun tp!1304 () Bool)

(declare-fun b_and!507 () Bool)

(assert (=> start!1026 (= tp!1304 b_and!507)))

(declare-fun b!8907 () Bool)

(declare-fun e!5080 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8907 (= e!5080 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!629 () Bool)

(declare-fun mapRes!629 () Bool)

(assert (=> mapIsEmpty!629 mapRes!629))

(declare-fun b!8908 () Bool)

(declare-fun e!5082 () Bool)

(declare-datatypes ((array!781 0))(
  ( (array!782 (arr!376 (Array (_ BitVec 32) (_ BitVec 64))) (size!438 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!781)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!8908 (= e!5082 (= (size!438 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))

(declare-fun lt!1924 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!781 (_ BitVec 32)) Bool)

(assert (=> b!8908 (arrayForallSeekEntryOrOpenFound!0 lt!1924 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!181 0))(
  ( (Unit!182) )
))
(declare-fun lt!1926 () Unit!181)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!181)

(assert (=> b!8908 (= lt!1926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1924))))

(declare-fun arrayScanForKey!0 (array!781 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8908 (= lt!1924 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8909 () Bool)

(declare-fun res!8209 () Bool)

(declare-fun e!5081 () Bool)

(assert (=> b!8909 (=> (not res!8209) (not e!5081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8909 (= res!8209 (validKeyInArray!0 k0!1278))))

(declare-fun res!8211 () Bool)

(assert (=> start!1026 (=> (not res!8211) (not e!5081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1026 (= res!8211 (validMask!0 mask!2250))))

(assert (=> start!1026 e!5081))

(assert (=> start!1026 tp!1304))

(assert (=> start!1026 true))

(declare-datatypes ((V!755 0))(
  ( (V!756 (val!222 Int)) )
))
(declare-datatypes ((ValueCell!200 0))(
  ( (ValueCellFull!200 (v!1316 V!755)) (EmptyCell!200) )
))
(declare-datatypes ((array!783 0))(
  ( (array!784 (arr!377 (Array (_ BitVec 32) ValueCell!200)) (size!439 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!783)

(declare-fun e!5083 () Bool)

(declare-fun array_inv!281 (array!783) Bool)

(assert (=> start!1026 (and (array_inv!281 _values!1492) e!5083)))

(declare-fun tp_is_empty!433 () Bool)

(assert (=> start!1026 tp_is_empty!433))

(declare-fun array_inv!282 (array!781) Bool)

(assert (=> start!1026 (array_inv!282 _keys!1806)))

(declare-fun b!8910 () Bool)

(declare-fun arrayContainsKey!0 (array!781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8910 (= e!5080 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8911 () Bool)

(declare-fun res!8210 () Bool)

(assert (=> b!8911 (=> (not res!8210) (not e!5081))))

(assert (=> b!8911 (= res!8210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8912 () Bool)

(declare-fun e!5079 () Bool)

(assert (=> b!8912 (= e!5079 tp_is_empty!433)))

(declare-fun b!8913 () Bool)

(declare-fun e!5078 () Bool)

(assert (=> b!8913 (= e!5083 (and e!5078 mapRes!629))))

(declare-fun condMapEmpty!629 () Bool)

(declare-fun mapDefault!629 () ValueCell!200)

(assert (=> b!8913 (= condMapEmpty!629 (= (arr!377 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!200)) mapDefault!629)))))

(declare-fun b!8914 () Bool)

(assert (=> b!8914 (= e!5081 (not e!5082))))

(declare-fun res!8215 () Bool)

(assert (=> b!8914 (=> res!8215 e!5082)))

(assert (=> b!8914 (= res!8215 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8914 e!5080))

(declare-fun c!680 () Bool)

(assert (=> b!8914 (= c!680 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1925 () Unit!181)

(declare-fun minValue!1434 () V!755)

(declare-fun zeroValue!1434 () V!755)

(declare-fun lemmaKeyInListMapIsInArray!70 (array!781 array!783 (_ BitVec 32) (_ BitVec 32) V!755 V!755 (_ BitVec 64) Int) Unit!181)

(assert (=> b!8914 (= lt!1925 (lemmaKeyInListMapIsInArray!70 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8915 () Bool)

(declare-fun res!8212 () Bool)

(assert (=> b!8915 (=> (not res!8212) (not e!5081))))

(assert (=> b!8915 (= res!8212 (and (= (size!439 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!438 _keys!1806) (size!439 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8916 () Bool)

(declare-fun res!8214 () Bool)

(assert (=> b!8916 (=> (not res!8214) (not e!5081))))

(declare-datatypes ((List!262 0))(
  ( (Nil!259) (Cons!258 (h!824 (_ BitVec 64)) (t!2403 List!262)) )
))
(declare-fun arrayNoDuplicates!0 (array!781 (_ BitVec 32) List!262) Bool)

(assert (=> b!8916 (= res!8214 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!259))))

(declare-fun b!8917 () Bool)

(declare-fun res!8213 () Bool)

(assert (=> b!8917 (=> (not res!8213) (not e!5081))))

(declare-datatypes ((tuple2!250 0))(
  ( (tuple2!251 (_1!125 (_ BitVec 64)) (_2!125 V!755)) )
))
(declare-datatypes ((List!263 0))(
  ( (Nil!260) (Cons!259 (h!825 tuple2!250) (t!2404 List!263)) )
))
(declare-datatypes ((ListLongMap!255 0))(
  ( (ListLongMap!256 (toList!143 List!263)) )
))
(declare-fun contains!120 (ListLongMap!255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!102 (array!781 array!783 (_ BitVec 32) (_ BitVec 32) V!755 V!755 (_ BitVec 32) Int) ListLongMap!255)

(assert (=> b!8917 (= res!8213 (contains!120 (getCurrentListMap!102 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapNonEmpty!629 () Bool)

(declare-fun tp!1303 () Bool)

(assert (=> mapNonEmpty!629 (= mapRes!629 (and tp!1303 e!5079))))

(declare-fun mapValue!629 () ValueCell!200)

(declare-fun mapRest!629 () (Array (_ BitVec 32) ValueCell!200))

(declare-fun mapKey!629 () (_ BitVec 32))

(assert (=> mapNonEmpty!629 (= (arr!377 _values!1492) (store mapRest!629 mapKey!629 mapValue!629))))

(declare-fun b!8918 () Bool)

(assert (=> b!8918 (= e!5078 tp_is_empty!433)))

(assert (= (and start!1026 res!8211) b!8915))

(assert (= (and b!8915 res!8212) b!8911))

(assert (= (and b!8911 res!8210) b!8916))

(assert (= (and b!8916 res!8214) b!8917))

(assert (= (and b!8917 res!8213) b!8909))

(assert (= (and b!8909 res!8209) b!8914))

(assert (= (and b!8914 c!680) b!8910))

(assert (= (and b!8914 (not c!680)) b!8907))

(assert (= (and b!8914 (not res!8215)) b!8908))

(assert (= (and b!8913 condMapEmpty!629) mapIsEmpty!629))

(assert (= (and b!8913 (not condMapEmpty!629)) mapNonEmpty!629))

(get-info :version)

(assert (= (and mapNonEmpty!629 ((_ is ValueCellFull!200) mapValue!629)) b!8912))

(assert (= (and b!8913 ((_ is ValueCellFull!200) mapDefault!629)) b!8918))

(assert (= start!1026 b!8913))

(declare-fun m!5521 () Bool)

(assert (=> mapNonEmpty!629 m!5521))

(declare-fun m!5523 () Bool)

(assert (=> b!8911 m!5523))

(declare-fun m!5525 () Bool)

(assert (=> start!1026 m!5525))

(declare-fun m!5527 () Bool)

(assert (=> start!1026 m!5527))

(declare-fun m!5529 () Bool)

(assert (=> start!1026 m!5529))

(declare-fun m!5531 () Bool)

(assert (=> b!8908 m!5531))

(declare-fun m!5533 () Bool)

(assert (=> b!8908 m!5533))

(declare-fun m!5535 () Bool)

(assert (=> b!8908 m!5535))

(declare-fun m!5537 () Bool)

(assert (=> b!8910 m!5537))

(declare-fun m!5539 () Bool)

(assert (=> b!8909 m!5539))

(declare-fun m!5541 () Bool)

(assert (=> b!8916 m!5541))

(declare-fun m!5543 () Bool)

(assert (=> b!8917 m!5543))

(assert (=> b!8917 m!5543))

(declare-fun m!5545 () Bool)

(assert (=> b!8917 m!5545))

(assert (=> b!8914 m!5537))

(declare-fun m!5547 () Bool)

(assert (=> b!8914 m!5547))

(check-sat (not b!8910) (not b!8911) (not b!8914) tp_is_empty!433 (not b_next!355) (not b!8908) (not start!1026) (not b!8909) b_and!507 (not mapNonEmpty!629) (not b!8917) (not b!8916))
(check-sat b_and!507 (not b_next!355))
