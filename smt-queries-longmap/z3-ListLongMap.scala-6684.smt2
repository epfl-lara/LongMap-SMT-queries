; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84078 () Bool)

(assert start!84078)

(declare-fun b_free!19833 () Bool)

(declare-fun b_next!19833 () Bool)

(assert (=> start!84078 (= b_free!19833 (not b_next!19833))))

(declare-fun tp!69021 () Bool)

(declare-fun b_and!31749 () Bool)

(assert (=> start!84078 (= tp!69021 b_and!31749)))

(declare-fun b!983119 () Bool)

(declare-fun res!657907 () Bool)

(declare-fun e!554148 () Bool)

(assert (=> b!983119 (=> (not res!657907) (not e!554148))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61751 0))(
  ( (array!61752 (arr!29733 (Array (_ BitVec 32) (_ BitVec 64))) (size!30212 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61751)

(assert (=> b!983119 (= res!657907 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30212 _keys!1544))))))

(declare-fun b!983120 () Bool)

(declare-fun e!554143 () Bool)

(declare-fun e!554147 () Bool)

(declare-fun mapRes!36350 () Bool)

(assert (=> b!983120 (= e!554143 (and e!554147 mapRes!36350))))

(declare-fun condMapEmpty!36350 () Bool)

(declare-datatypes ((V!35491 0))(
  ( (V!35492 (val!11491 Int)) )
))
(declare-datatypes ((ValueCell!10959 0))(
  ( (ValueCellFull!10959 (v!14053 V!35491)) (EmptyCell!10959) )
))
(declare-datatypes ((array!61753 0))(
  ( (array!61754 (arr!29734 (Array (_ BitVec 32) ValueCell!10959)) (size!30213 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61753)

(declare-fun mapDefault!36350 () ValueCell!10959)

(assert (=> b!983120 (= condMapEmpty!36350 (= (arr!29734 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10959)) mapDefault!36350)))))

(declare-fun mapNonEmpty!36350 () Bool)

(declare-fun tp!69022 () Bool)

(declare-fun e!554145 () Bool)

(assert (=> mapNonEmpty!36350 (= mapRes!36350 (and tp!69022 e!554145))))

(declare-fun mapRest!36350 () (Array (_ BitVec 32) ValueCell!10959))

(declare-fun mapKey!36350 () (_ BitVec 32))

(declare-fun mapValue!36350 () ValueCell!10959)

(assert (=> mapNonEmpty!36350 (= (arr!29734 _values!1278) (store mapRest!36350 mapKey!36350 mapValue!36350))))

(declare-fun b!983121 () Bool)

(declare-fun res!657911 () Bool)

(assert (=> b!983121 (=> (not res!657911) (not e!554148))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61751 (_ BitVec 32)) Bool)

(assert (=> b!983121 (= res!657911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983122 () Bool)

(declare-fun res!657913 () Bool)

(assert (=> b!983122 (=> (not res!657913) (not e!554148))))

(declare-datatypes ((List!20601 0))(
  ( (Nil!20598) (Cons!20597 (h!21759 (_ BitVec 64)) (t!29384 List!20601)) )
))
(declare-fun arrayNoDuplicates!0 (array!61751 (_ BitVec 32) List!20601) Bool)

(assert (=> b!983122 (= res!657913 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20598))))

(declare-fun b!983123 () Bool)

(declare-fun e!554144 () Bool)

(assert (=> b!983123 (= e!554144 (not true))))

(declare-datatypes ((tuple2!14724 0))(
  ( (tuple2!14725 (_1!7373 (_ BitVec 64)) (_2!7373 V!35491)) )
))
(declare-datatypes ((List!20602 0))(
  ( (Nil!20599) (Cons!20598 (h!21760 tuple2!14724) (t!29385 List!20602)) )
))
(declare-datatypes ((ListLongMap!13421 0))(
  ( (ListLongMap!13422 (toList!6726 List!20602)) )
))
(declare-fun lt!436428 () ListLongMap!13421)

(declare-fun lt!436426 () tuple2!14724)

(declare-fun lt!436429 () tuple2!14724)

(declare-fun +!3023 (ListLongMap!13421 tuple2!14724) ListLongMap!13421)

(assert (=> b!983123 (= (+!3023 (+!3023 lt!436428 lt!436426) lt!436429) (+!3023 (+!3023 lt!436428 lt!436429) lt!436426))))

(declare-fun lt!436430 () V!35491)

(assert (=> b!983123 (= lt!436429 (tuple2!14725 (select (arr!29733 _keys!1544) from!1932) lt!436430))))

(declare-fun zeroValue!1220 () V!35491)

(assert (=> b!983123 (= lt!436426 (tuple2!14725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32685 0))(
  ( (Unit!32686) )
))
(declare-fun lt!436427 () Unit!32685)

(declare-fun addCommutativeForDiffKeys!651 (ListLongMap!13421 (_ BitVec 64) V!35491 (_ BitVec 64) V!35491) Unit!32685)

(assert (=> b!983123 (= lt!436427 (addCommutativeForDiffKeys!651 lt!436428 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29733 _keys!1544) from!1932) lt!436430))))

(declare-fun b!983124 () Bool)

(declare-fun tp_is_empty!22881 () Bool)

(assert (=> b!983124 (= e!554147 tp_is_empty!22881)))

(declare-fun b!983125 () Bool)

(declare-fun res!657914 () Bool)

(assert (=> b!983125 (=> (not res!657914) (not e!554148))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983125 (= res!657914 (and (= (size!30213 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30212 _keys!1544) (size!30213 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!657912 () Bool)

(assert (=> start!84078 (=> (not res!657912) (not e!554148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84078 (= res!657912 (validMask!0 mask!1948))))

(assert (=> start!84078 e!554148))

(assert (=> start!84078 true))

(assert (=> start!84078 tp_is_empty!22881))

(declare-fun array_inv!22995 (array!61753) Bool)

(assert (=> start!84078 (and (array_inv!22995 _values!1278) e!554143)))

(assert (=> start!84078 tp!69021))

(declare-fun array_inv!22996 (array!61751) Bool)

(assert (=> start!84078 (array_inv!22996 _keys!1544)))

(declare-fun mapIsEmpty!36350 () Bool)

(assert (=> mapIsEmpty!36350 mapRes!36350))

(declare-fun b!983126 () Bool)

(assert (=> b!983126 (= e!554145 tp_is_empty!22881)))

(declare-fun b!983127 () Bool)

(declare-fun res!657909 () Bool)

(assert (=> b!983127 (=> (not res!657909) (not e!554148))))

(assert (=> b!983127 (= res!657909 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983128 () Bool)

(assert (=> b!983128 (= e!554148 e!554144)))

(declare-fun res!657910 () Bool)

(assert (=> b!983128 (=> (not res!657910) (not e!554144))))

(assert (=> b!983128 (= res!657910 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29733 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15426 (ValueCell!10959 V!35491) V!35491)

(declare-fun dynLambda!1805 (Int (_ BitVec 64)) V!35491)

(assert (=> b!983128 (= lt!436430 (get!15426 (select (arr!29734 _values!1278) from!1932) (dynLambda!1805 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35491)

(declare-fun getCurrentListMapNoExtraKeys!3422 (array!61751 array!61753 (_ BitVec 32) (_ BitVec 32) V!35491 V!35491 (_ BitVec 32) Int) ListLongMap!13421)

(assert (=> b!983128 (= lt!436428 (getCurrentListMapNoExtraKeys!3422 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983129 () Bool)

(declare-fun res!657908 () Bool)

(assert (=> b!983129 (=> (not res!657908) (not e!554148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983129 (= res!657908 (validKeyInArray!0 (select (arr!29733 _keys!1544) from!1932)))))

(assert (= (and start!84078 res!657912) b!983125))

(assert (= (and b!983125 res!657914) b!983121))

(assert (= (and b!983121 res!657911) b!983122))

(assert (= (and b!983122 res!657913) b!983119))

(assert (= (and b!983119 res!657907) b!983129))

(assert (= (and b!983129 res!657908) b!983127))

(assert (= (and b!983127 res!657909) b!983128))

(assert (= (and b!983128 res!657910) b!983123))

(assert (= (and b!983120 condMapEmpty!36350) mapIsEmpty!36350))

(assert (= (and b!983120 (not condMapEmpty!36350)) mapNonEmpty!36350))

(get-info :version)

(assert (= (and mapNonEmpty!36350 ((_ is ValueCellFull!10959) mapValue!36350)) b!983126))

(assert (= (and b!983120 ((_ is ValueCellFull!10959) mapDefault!36350)) b!983124))

(assert (= start!84078 b!983120))

(declare-fun b_lambda!14871 () Bool)

(assert (=> (not b_lambda!14871) (not b!983128)))

(declare-fun t!29383 () Bool)

(declare-fun tb!6633 () Bool)

(assert (=> (and start!84078 (= defaultEntry!1281 defaultEntry!1281) t!29383) tb!6633))

(declare-fun result!13255 () Bool)

(assert (=> tb!6633 (= result!13255 tp_is_empty!22881)))

(assert (=> b!983128 t!29383))

(declare-fun b_and!31751 () Bool)

(assert (= b_and!31749 (and (=> t!29383 result!13255) b_and!31751)))

(declare-fun m!910439 () Bool)

(assert (=> b!983128 m!910439))

(declare-fun m!910441 () Bool)

(assert (=> b!983128 m!910441))

(declare-fun m!910443 () Bool)

(assert (=> b!983128 m!910443))

(declare-fun m!910445 () Bool)

(assert (=> b!983128 m!910445))

(assert (=> b!983128 m!910441))

(assert (=> b!983128 m!910445))

(declare-fun m!910447 () Bool)

(assert (=> b!983128 m!910447))

(declare-fun m!910449 () Bool)

(assert (=> mapNonEmpty!36350 m!910449))

(declare-fun m!910451 () Bool)

(assert (=> b!983122 m!910451))

(assert (=> b!983129 m!910439))

(assert (=> b!983129 m!910439))

(declare-fun m!910453 () Bool)

(assert (=> b!983129 m!910453))

(declare-fun m!910455 () Bool)

(assert (=> b!983123 m!910455))

(declare-fun m!910457 () Bool)

(assert (=> b!983123 m!910457))

(declare-fun m!910459 () Bool)

(assert (=> b!983123 m!910459))

(assert (=> b!983123 m!910439))

(assert (=> b!983123 m!910455))

(assert (=> b!983123 m!910459))

(declare-fun m!910461 () Bool)

(assert (=> b!983123 m!910461))

(assert (=> b!983123 m!910439))

(declare-fun m!910463 () Bool)

(assert (=> b!983123 m!910463))

(declare-fun m!910465 () Bool)

(assert (=> start!84078 m!910465))

(declare-fun m!910467 () Bool)

(assert (=> start!84078 m!910467))

(declare-fun m!910469 () Bool)

(assert (=> start!84078 m!910469))

(declare-fun m!910471 () Bool)

(assert (=> b!983121 m!910471))

(check-sat (not b_lambda!14871) (not start!84078) b_and!31751 (not b!983122) (not b!983123) tp_is_empty!22881 (not b!983121) (not mapNonEmpty!36350) (not b!983128) (not b!983129) (not b_next!19833))
(check-sat b_and!31751 (not b_next!19833))
