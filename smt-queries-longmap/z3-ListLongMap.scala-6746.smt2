; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84722 () Bool)

(assert start!84722)

(declare-fun b_free!20035 () Bool)

(declare-fun b_next!20035 () Bool)

(assert (=> start!84722 (= b_free!20035 (not b_next!20035))))

(declare-fun tp!69894 () Bool)

(declare-fun b_and!32149 () Bool)

(assert (=> start!84722 (= tp!69894 b_and!32149)))

(declare-fun b!989845 () Bool)

(declare-fun res!661774 () Bool)

(declare-fun e!558223 () Bool)

(assert (=> b!989845 (=> (not res!661774) (not e!558223))))

(declare-datatypes ((array!62506 0))(
  ( (array!62507 (arr!30102 (Array (_ BitVec 32) (_ BitVec 64))) (size!30582 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62506)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62506 (_ BitVec 32)) Bool)

(assert (=> b!989845 (= res!661774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989846 () Bool)

(declare-fun res!661773 () Bool)

(assert (=> b!989846 (=> (not res!661773) (not e!558223))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!989846 (= res!661773 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30582 _keys!1544))))))

(declare-fun b!989847 () Bool)

(declare-fun e!558226 () Bool)

(declare-datatypes ((V!35985 0))(
  ( (V!35986 (val!11676 Int)) )
))
(declare-datatypes ((ValueCell!11144 0))(
  ( (ValueCellFull!11144 (v!14240 V!35985)) (EmptyCell!11144) )
))
(declare-datatypes ((array!62508 0))(
  ( (array!62509 (arr!30103 (Array (_ BitVec 32) ValueCell!11144)) (size!30583 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62508)

(assert (=> b!989847 (= e!558226 (not (bvslt from!1932 (size!30583 _values!1278))))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35985)

(declare-fun defaultEntry!1281 () Int)

(declare-fun minValue!1220 () V!35985)

(declare-datatypes ((tuple2!14904 0))(
  ( (tuple2!14905 (_1!7463 (_ BitVec 64)) (_2!7463 V!35985)) )
))
(declare-datatypes ((List!20809 0))(
  ( (Nil!20806) (Cons!20805 (h!21973 tuple2!14904) (t!29748 List!20809)) )
))
(declare-datatypes ((ListLongMap!13603 0))(
  ( (ListLongMap!13604 (toList!6817 List!20809)) )
))
(declare-fun lt!439007 () ListLongMap!13603)

(declare-fun getCurrentListMap!3870 (array!62506 array!62508 (_ BitVec 32) (_ BitVec 32) V!35985 V!35985 (_ BitVec 32) Int) ListLongMap!13603)

(assert (=> b!989847 (= lt!439007 (getCurrentListMap!3870 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439010 () ListLongMap!13603)

(declare-fun lt!439009 () tuple2!14904)

(declare-fun lt!439005 () tuple2!14904)

(declare-fun +!3110 (ListLongMap!13603 tuple2!14904) ListLongMap!13603)

(assert (=> b!989847 (= (+!3110 (+!3110 lt!439010 lt!439009) lt!439005) (+!3110 (+!3110 lt!439010 lt!439005) lt!439009))))

(declare-fun lt!439006 () V!35985)

(assert (=> b!989847 (= lt!439005 (tuple2!14905 (select (arr!30102 _keys!1544) from!1932) lt!439006))))

(assert (=> b!989847 (= lt!439009 (tuple2!14905 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32816 0))(
  ( (Unit!32817) )
))
(declare-fun lt!439008 () Unit!32816)

(declare-fun addCommutativeForDiffKeys!712 (ListLongMap!13603 (_ BitVec 64) V!35985 (_ BitVec 64) V!35985) Unit!32816)

(assert (=> b!989847 (= lt!439008 (addCommutativeForDiffKeys!712 lt!439010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30102 _keys!1544) from!1932) lt!439006))))

(declare-fun b!989848 () Bool)

(assert (=> b!989848 (= e!558223 e!558226)))

(declare-fun res!661769 () Bool)

(assert (=> b!989848 (=> (not res!661769) (not e!558226))))

(assert (=> b!989848 (= res!661769 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30102 _keys!1544) from!1932))))))

(declare-fun get!15647 (ValueCell!11144 V!35985) V!35985)

(declare-fun dynLambda!1893 (Int (_ BitVec 64)) V!35985)

(assert (=> b!989848 (= lt!439006 (get!15647 (select (arr!30103 _values!1278) from!1932) (dynLambda!1893 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3545 (array!62506 array!62508 (_ BitVec 32) (_ BitVec 32) V!35985 V!35985 (_ BitVec 32) Int) ListLongMap!13603)

(assert (=> b!989848 (= lt!439010 (getCurrentListMapNoExtraKeys!3545 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989849 () Bool)

(declare-fun res!661772 () Bool)

(assert (=> b!989849 (=> (not res!661772) (not e!558223))))

(assert (=> b!989849 (= res!661772 (and (= (size!30583 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30582 _keys!1544) (size!30583 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36918 () Bool)

(declare-fun mapRes!36918 () Bool)

(assert (=> mapIsEmpty!36918 mapRes!36918))

(declare-fun b!989850 () Bool)

(declare-fun res!661768 () Bool)

(assert (=> b!989850 (=> (not res!661768) (not e!558223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989850 (= res!661768 (validKeyInArray!0 (select (arr!30102 _keys!1544) from!1932)))))

(declare-fun b!989851 () Bool)

(declare-fun e!558224 () Bool)

(declare-fun tp_is_empty!23251 () Bool)

(assert (=> b!989851 (= e!558224 tp_is_empty!23251)))

(declare-fun b!989852 () Bool)

(declare-fun e!558222 () Bool)

(assert (=> b!989852 (= e!558222 tp_is_empty!23251)))

(declare-fun res!661771 () Bool)

(assert (=> start!84722 (=> (not res!661771) (not e!558223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84722 (= res!661771 (validMask!0 mask!1948))))

(assert (=> start!84722 e!558223))

(assert (=> start!84722 true))

(assert (=> start!84722 tp_is_empty!23251))

(declare-fun e!558225 () Bool)

(declare-fun array_inv!23281 (array!62508) Bool)

(assert (=> start!84722 (and (array_inv!23281 _values!1278) e!558225)))

(assert (=> start!84722 tp!69894))

(declare-fun array_inv!23282 (array!62506) Bool)

(assert (=> start!84722 (array_inv!23282 _keys!1544)))

(declare-fun mapNonEmpty!36918 () Bool)

(declare-fun tp!69893 () Bool)

(assert (=> mapNonEmpty!36918 (= mapRes!36918 (and tp!69893 e!558222))))

(declare-fun mapRest!36918 () (Array (_ BitVec 32) ValueCell!11144))

(declare-fun mapValue!36918 () ValueCell!11144)

(declare-fun mapKey!36918 () (_ BitVec 32))

(assert (=> mapNonEmpty!36918 (= (arr!30103 _values!1278) (store mapRest!36918 mapKey!36918 mapValue!36918))))

(declare-fun b!989853 () Bool)

(declare-fun res!661770 () Bool)

(assert (=> b!989853 (=> (not res!661770) (not e!558223))))

(declare-datatypes ((List!20810 0))(
  ( (Nil!20807) (Cons!20806 (h!21974 (_ BitVec 64)) (t!29749 List!20810)) )
))
(declare-fun arrayNoDuplicates!0 (array!62506 (_ BitVec 32) List!20810) Bool)

(assert (=> b!989853 (= res!661770 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20807))))

(declare-fun b!989854 () Bool)

(assert (=> b!989854 (= e!558225 (and e!558224 mapRes!36918))))

(declare-fun condMapEmpty!36918 () Bool)

(declare-fun mapDefault!36918 () ValueCell!11144)

(assert (=> b!989854 (= condMapEmpty!36918 (= (arr!30103 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11144)) mapDefault!36918)))))

(declare-fun b!989855 () Bool)

(declare-fun res!661775 () Bool)

(assert (=> b!989855 (=> (not res!661775) (not e!558223))))

(assert (=> b!989855 (= res!661775 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!84722 res!661771) b!989849))

(assert (= (and b!989849 res!661772) b!989845))

(assert (= (and b!989845 res!661774) b!989853))

(assert (= (and b!989853 res!661770) b!989846))

(assert (= (and b!989846 res!661773) b!989850))

(assert (= (and b!989850 res!661768) b!989855))

(assert (= (and b!989855 res!661775) b!989848))

(assert (= (and b!989848 res!661769) b!989847))

(assert (= (and b!989854 condMapEmpty!36918) mapIsEmpty!36918))

(assert (= (and b!989854 (not condMapEmpty!36918)) mapNonEmpty!36918))

(get-info :version)

(assert (= (and mapNonEmpty!36918 ((_ is ValueCellFull!11144) mapValue!36918)) b!989852))

(assert (= (and b!989854 ((_ is ValueCellFull!11144) mapDefault!36918)) b!989851))

(assert (= start!84722 b!989854))

(declare-fun b_lambda!15105 () Bool)

(assert (=> (not b_lambda!15105) (not b!989848)))

(declare-fun t!29747 () Bool)

(declare-fun tb!6789 () Bool)

(assert (=> (and start!84722 (= defaultEntry!1281 defaultEntry!1281) t!29747) tb!6789))

(declare-fun result!13583 () Bool)

(assert (=> tb!6789 (= result!13583 tp_is_empty!23251)))

(assert (=> b!989848 t!29747))

(declare-fun b_and!32151 () Bool)

(assert (= b_and!32149 (and (=> t!29747 result!13583) b_and!32151)))

(declare-fun m!917345 () Bool)

(assert (=> start!84722 m!917345))

(declare-fun m!917347 () Bool)

(assert (=> start!84722 m!917347))

(declare-fun m!917349 () Bool)

(assert (=> start!84722 m!917349))

(declare-fun m!917351 () Bool)

(assert (=> b!989850 m!917351))

(assert (=> b!989850 m!917351))

(declare-fun m!917353 () Bool)

(assert (=> b!989850 m!917353))

(declare-fun m!917355 () Bool)

(assert (=> b!989853 m!917355))

(declare-fun m!917357 () Bool)

(assert (=> b!989845 m!917357))

(assert (=> b!989848 m!917351))

(declare-fun m!917359 () Bool)

(assert (=> b!989848 m!917359))

(declare-fun m!917361 () Bool)

(assert (=> b!989848 m!917361))

(declare-fun m!917363 () Bool)

(assert (=> b!989848 m!917363))

(assert (=> b!989848 m!917359))

(assert (=> b!989848 m!917363))

(declare-fun m!917365 () Bool)

(assert (=> b!989848 m!917365))

(declare-fun m!917367 () Bool)

(assert (=> mapNonEmpty!36918 m!917367))

(declare-fun m!917369 () Bool)

(assert (=> b!989847 m!917369))

(assert (=> b!989847 m!917351))

(assert (=> b!989847 m!917351))

(declare-fun m!917371 () Bool)

(assert (=> b!989847 m!917371))

(declare-fun m!917373 () Bool)

(assert (=> b!989847 m!917373))

(declare-fun m!917375 () Bool)

(assert (=> b!989847 m!917375))

(assert (=> b!989847 m!917369))

(declare-fun m!917377 () Bool)

(assert (=> b!989847 m!917377))

(assert (=> b!989847 m!917375))

(declare-fun m!917379 () Bool)

(assert (=> b!989847 m!917379))

(check-sat (not b!989850) (not b_lambda!15105) (not b!989845) (not mapNonEmpty!36918) (not start!84722) (not b!989853) tp_is_empty!23251 b_and!32151 (not b_next!20035) (not b!989847) (not b!989848))
(check-sat b_and!32151 (not b_next!20035))
