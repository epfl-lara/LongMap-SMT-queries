; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84130 () Bool)

(assert start!84130)

(declare-fun b_free!19849 () Bool)

(declare-fun b_next!19849 () Bool)

(assert (=> start!84130 (= b_free!19849 (not b_next!19849))))

(declare-fun tp!69151 () Bool)

(declare-fun b_and!31749 () Bool)

(assert (=> start!84130 (= tp!69151 b_and!31749)))

(declare-fun b!983658 () Bool)

(declare-fun res!658250 () Bool)

(declare-fun e!554538 () Bool)

(assert (=> b!983658 (=> (not res!658250) (not e!554538))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61812 0))(
  ( (array!61813 (arr!29764 (Array (_ BitVec 32) (_ BitVec 64))) (size!30245 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61812)

(assert (=> b!983658 (= res!658250 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30245 _keys!1544))))))

(declare-fun b!983659 () Bool)

(declare-fun res!658257 () Bool)

(assert (=> b!983659 (=> (not res!658257) (not e!554538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983659 (= res!658257 (validKeyInArray!0 (select (arr!29764 _keys!1544) from!1932)))))

(declare-fun b!983660 () Bool)

(declare-fun res!658254 () Bool)

(assert (=> b!983660 (=> (not res!658254) (not e!554538))))

(declare-datatypes ((List!20667 0))(
  ( (Nil!20664) (Cons!20663 (h!21825 (_ BitVec 64)) (t!29451 List!20667)) )
))
(declare-fun arrayNoDuplicates!0 (array!61812 (_ BitVec 32) List!20667) Bool)

(assert (=> b!983660 (= res!658254 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20664))))

(declare-fun b!983661 () Bool)

(declare-fun e!554536 () Bool)

(assert (=> b!983661 (= e!554536 (not true))))

(declare-datatypes ((V!35585 0))(
  ( (V!35586 (val!11526 Int)) )
))
(declare-datatypes ((tuple2!14812 0))(
  ( (tuple2!14813 (_1!7417 (_ BitVec 64)) (_2!7417 V!35585)) )
))
(declare-datatypes ((List!20668 0))(
  ( (Nil!20665) (Cons!20664 (h!21826 tuple2!14812) (t!29452 List!20668)) )
))
(declare-datatypes ((ListLongMap!13499 0))(
  ( (ListLongMap!13500 (toList!6765 List!20668)) )
))
(declare-fun lt!436350 () ListLongMap!13499)

(declare-fun lt!436347 () tuple2!14812)

(declare-fun lt!436348 () tuple2!14812)

(declare-fun +!3049 (ListLongMap!13499 tuple2!14812) ListLongMap!13499)

(assert (=> b!983661 (= (+!3049 (+!3049 lt!436350 lt!436347) lt!436348) (+!3049 (+!3049 lt!436350 lt!436348) lt!436347))))

(declare-fun lt!436346 () V!35585)

(assert (=> b!983661 (= lt!436348 (tuple2!14813 (select (arr!29764 _keys!1544) from!1932) lt!436346))))

(declare-fun minValue!1220 () V!35585)

(assert (=> b!983661 (= lt!436347 (tuple2!14813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32564 0))(
  ( (Unit!32565) )
))
(declare-fun lt!436349 () Unit!32564)

(declare-fun addCommutativeForDiffKeys!653 (ListLongMap!13499 (_ BitVec 64) V!35585 (_ BitVec 64) V!35585) Unit!32564)

(assert (=> b!983661 (= lt!436349 (addCommutativeForDiffKeys!653 lt!436350 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29764 _keys!1544) from!1932) lt!436346))))

(declare-fun b!983662 () Bool)

(declare-fun e!554535 () Bool)

(declare-fun tp_is_empty!22951 () Bool)

(assert (=> b!983662 (= e!554535 tp_is_empty!22951)))

(declare-fun b!983663 () Bool)

(declare-fun e!554540 () Bool)

(declare-fun e!554539 () Bool)

(declare-fun mapRes!36455 () Bool)

(assert (=> b!983663 (= e!554540 (and e!554539 mapRes!36455))))

(declare-fun condMapEmpty!36455 () Bool)

(declare-datatypes ((ValueCell!10994 0))(
  ( (ValueCellFull!10994 (v!14087 V!35585)) (EmptyCell!10994) )
))
(declare-datatypes ((array!61814 0))(
  ( (array!61815 (arr!29765 (Array (_ BitVec 32) ValueCell!10994)) (size!30246 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61814)

(declare-fun mapDefault!36455 () ValueCell!10994)

(assert (=> b!983663 (= condMapEmpty!36455 (= (arr!29765 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10994)) mapDefault!36455)))))

(declare-fun b!983664 () Bool)

(assert (=> b!983664 (= e!554539 tp_is_empty!22951)))

(declare-fun b!983665 () Bool)

(assert (=> b!983665 (= e!554538 e!554536)))

(declare-fun res!658255 () Bool)

(assert (=> b!983665 (=> (not res!658255) (not e!554536))))

(assert (=> b!983665 (= res!658255 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29764 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15452 (ValueCell!10994 V!35585) V!35585)

(declare-fun dynLambda!1802 (Int (_ BitVec 64)) V!35585)

(assert (=> b!983665 (= lt!436346 (get!15452 (select (arr!29765 _values!1278) from!1932) (dynLambda!1802 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35585)

(declare-fun getCurrentListMapNoExtraKeys!3474 (array!61812 array!61814 (_ BitVec 32) (_ BitVec 32) V!35585 V!35585 (_ BitVec 32) Int) ListLongMap!13499)

(assert (=> b!983665 (= lt!436350 (getCurrentListMapNoExtraKeys!3474 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983666 () Bool)

(declare-fun res!658252 () Bool)

(assert (=> b!983666 (=> (not res!658252) (not e!554538))))

(assert (=> b!983666 (= res!658252 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36455 () Bool)

(assert (=> mapIsEmpty!36455 mapRes!36455))

(declare-fun res!658256 () Bool)

(assert (=> start!84130 (=> (not res!658256) (not e!554538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84130 (= res!658256 (validMask!0 mask!1948))))

(assert (=> start!84130 e!554538))

(assert (=> start!84130 true))

(assert (=> start!84130 tp_is_empty!22951))

(declare-fun array_inv!23021 (array!61814) Bool)

(assert (=> start!84130 (and (array_inv!23021 _values!1278) e!554540)))

(assert (=> start!84130 tp!69151))

(declare-fun array_inv!23022 (array!61812) Bool)

(assert (=> start!84130 (array_inv!23022 _keys!1544)))

(declare-fun b!983667 () Bool)

(declare-fun res!658253 () Bool)

(assert (=> b!983667 (=> (not res!658253) (not e!554538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61812 (_ BitVec 32)) Bool)

(assert (=> b!983667 (= res!658253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983668 () Bool)

(declare-fun res!658251 () Bool)

(assert (=> b!983668 (=> (not res!658251) (not e!554538))))

(assert (=> b!983668 (= res!658251 (and (= (size!30246 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30245 _keys!1544) (size!30246 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36455 () Bool)

(declare-fun tp!69152 () Bool)

(assert (=> mapNonEmpty!36455 (= mapRes!36455 (and tp!69152 e!554535))))

(declare-fun mapKey!36455 () (_ BitVec 32))

(declare-fun mapValue!36455 () ValueCell!10994)

(declare-fun mapRest!36455 () (Array (_ BitVec 32) ValueCell!10994))

(assert (=> mapNonEmpty!36455 (= (arr!29765 _values!1278) (store mapRest!36455 mapKey!36455 mapValue!36455))))

(assert (= (and start!84130 res!658256) b!983668))

(assert (= (and b!983668 res!658251) b!983667))

(assert (= (and b!983667 res!658253) b!983660))

(assert (= (and b!983660 res!658254) b!983658))

(assert (= (and b!983658 res!658250) b!983659))

(assert (= (and b!983659 res!658257) b!983666))

(assert (= (and b!983666 res!658252) b!983665))

(assert (= (and b!983665 res!658255) b!983661))

(assert (= (and b!983663 condMapEmpty!36455) mapIsEmpty!36455))

(assert (= (and b!983663 (not condMapEmpty!36455)) mapNonEmpty!36455))

(get-info :version)

(assert (= (and mapNonEmpty!36455 ((_ is ValueCellFull!10994) mapValue!36455)) b!983662))

(assert (= (and b!983663 ((_ is ValueCellFull!10994) mapDefault!36455)) b!983664))

(assert (= start!84130 b!983663))

(declare-fun b_lambda!14863 () Bool)

(assert (=> (not b_lambda!14863) (not b!983665)))

(declare-fun t!29450 () Bool)

(declare-fun tb!6635 () Bool)

(assert (=> (and start!84130 (= defaultEntry!1281 defaultEntry!1281) t!29450) tb!6635))

(declare-fun result!13267 () Bool)

(assert (=> tb!6635 (= result!13267 tp_is_empty!22951)))

(assert (=> b!983665 t!29450))

(declare-fun b_and!31751 () Bool)

(assert (= b_and!31749 (and (=> t!29450 result!13267) b_and!31751)))

(declare-fun m!910241 () Bool)

(assert (=> b!983660 m!910241))

(declare-fun m!910243 () Bool)

(assert (=> mapNonEmpty!36455 m!910243))

(declare-fun m!910245 () Bool)

(assert (=> b!983665 m!910245))

(declare-fun m!910247 () Bool)

(assert (=> b!983665 m!910247))

(declare-fun m!910249 () Bool)

(assert (=> b!983665 m!910249))

(declare-fun m!910251 () Bool)

(assert (=> b!983665 m!910251))

(assert (=> b!983665 m!910247))

(assert (=> b!983665 m!910251))

(declare-fun m!910253 () Bool)

(assert (=> b!983665 m!910253))

(assert (=> b!983659 m!910245))

(assert (=> b!983659 m!910245))

(declare-fun m!910255 () Bool)

(assert (=> b!983659 m!910255))

(declare-fun m!910257 () Bool)

(assert (=> start!84130 m!910257))

(declare-fun m!910259 () Bool)

(assert (=> start!84130 m!910259))

(declare-fun m!910261 () Bool)

(assert (=> start!84130 m!910261))

(declare-fun m!910263 () Bool)

(assert (=> b!983661 m!910263))

(declare-fun m!910265 () Bool)

(assert (=> b!983661 m!910265))

(assert (=> b!983661 m!910245))

(assert (=> b!983661 m!910263))

(assert (=> b!983661 m!910245))

(declare-fun m!910267 () Bool)

(assert (=> b!983661 m!910267))

(declare-fun m!910269 () Bool)

(assert (=> b!983661 m!910269))

(assert (=> b!983661 m!910269))

(declare-fun m!910271 () Bool)

(assert (=> b!983661 m!910271))

(declare-fun m!910273 () Bool)

(assert (=> b!983667 m!910273))

(check-sat (not b_lambda!14863) (not b!983661) (not b!983659) (not b!983660) (not mapNonEmpty!36455) b_and!31751 (not start!84130) (not b!983665) (not b!983667) (not b_next!19849) tp_is_empty!22951)
(check-sat b_and!31751 (not b_next!19849))
