; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84022 () Bool)

(assert start!84022)

(declare-fun b_free!19795 () Bool)

(declare-fun b_next!19795 () Bool)

(assert (=> start!84022 (= b_free!19795 (not b_next!19795))))

(declare-fun tp!68909 () Bool)

(declare-fun b_and!31647 () Bool)

(assert (=> start!84022 (= tp!68909 b_and!31647)))

(declare-fun b!982215 () Bool)

(declare-fun res!657341 () Bool)

(declare-fun e!553654 () Bool)

(assert (=> b!982215 (=> (not res!657341) (not e!553654))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982215 (= res!657341 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36293 () Bool)

(declare-fun mapRes!36293 () Bool)

(assert (=> mapIsEmpty!36293 mapRes!36293))

(declare-fun b!982216 () Bool)

(declare-fun res!657343 () Bool)

(assert (=> b!982216 (=> (not res!657343) (not e!553654))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61610 0))(
  ( (array!61611 (arr!29663 (Array (_ BitVec 32) (_ BitVec 64))) (size!30144 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61610)

(assert (=> b!982216 (= res!657343 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30144 _keys!1544))))))

(declare-fun mapNonEmpty!36293 () Bool)

(declare-fun tp!68908 () Bool)

(declare-fun e!553657 () Bool)

(assert (=> mapNonEmpty!36293 (= mapRes!36293 (and tp!68908 e!553657))))

(declare-datatypes ((V!35441 0))(
  ( (V!35442 (val!11472 Int)) )
))
(declare-datatypes ((ValueCell!10940 0))(
  ( (ValueCellFull!10940 (v!14033 V!35441)) (EmptyCell!10940) )
))
(declare-datatypes ((array!61612 0))(
  ( (array!61613 (arr!29664 (Array (_ BitVec 32) ValueCell!10940)) (size!30145 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61612)

(declare-fun mapKey!36293 () (_ BitVec 32))

(declare-fun mapRest!36293 () (Array (_ BitVec 32) ValueCell!10940))

(declare-fun mapValue!36293 () ValueCell!10940)

(assert (=> mapNonEmpty!36293 (= (arr!29664 _values!1278) (store mapRest!36293 mapKey!36293 mapValue!36293))))

(declare-fun res!657344 () Bool)

(assert (=> start!84022 (=> (not res!657344) (not e!553654))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84022 (= res!657344 (validMask!0 mask!1948))))

(assert (=> start!84022 e!553654))

(assert (=> start!84022 true))

(declare-fun tp_is_empty!22843 () Bool)

(assert (=> start!84022 tp_is_empty!22843))

(declare-fun e!553658 () Bool)

(declare-fun array_inv!22949 (array!61612) Bool)

(assert (=> start!84022 (and (array_inv!22949 _values!1278) e!553658)))

(assert (=> start!84022 tp!68909))

(declare-fun array_inv!22950 (array!61610) Bool)

(assert (=> start!84022 (array_inv!22950 _keys!1544)))

(declare-fun b!982217 () Bool)

(declare-fun e!553656 () Bool)

(assert (=> b!982217 (= e!553656 (not true))))

(declare-datatypes ((tuple2!14766 0))(
  ( (tuple2!14767 (_1!7394 (_ BitVec 64)) (_2!7394 V!35441)) )
))
(declare-datatypes ((List!20606 0))(
  ( (Nil!20603) (Cons!20602 (h!21764 tuple2!14766) (t!29342 List!20606)) )
))
(declare-datatypes ((ListLongMap!13453 0))(
  ( (ListLongMap!13454 (toList!6742 List!20606)) )
))
(declare-fun lt!435906 () ListLongMap!13453)

(declare-fun lt!435907 () tuple2!14766)

(declare-fun lt!435909 () tuple2!14766)

(declare-fun +!3034 (ListLongMap!13453 tuple2!14766) ListLongMap!13453)

(assert (=> b!982217 (= (+!3034 (+!3034 lt!435906 lt!435907) lt!435909) (+!3034 (+!3034 lt!435906 lt!435909) lt!435907))))

(declare-fun lt!435908 () V!35441)

(assert (=> b!982217 (= lt!435909 (tuple2!14767 (select (arr!29663 _keys!1544) from!1932) lt!435908))))

(declare-fun zeroValue!1220 () V!35441)

(assert (=> b!982217 (= lt!435907 (tuple2!14767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32534 0))(
  ( (Unit!32535) )
))
(declare-fun lt!435905 () Unit!32534)

(declare-fun addCommutativeForDiffKeys!638 (ListLongMap!13453 (_ BitVec 64) V!35441 (_ BitVec 64) V!35441) Unit!32534)

(assert (=> b!982217 (= lt!435905 (addCommutativeForDiffKeys!638 lt!435906 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29663 _keys!1544) from!1932) lt!435908))))

(declare-fun b!982218 () Bool)

(declare-fun res!657348 () Bool)

(assert (=> b!982218 (=> (not res!657348) (not e!553654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982218 (= res!657348 (validKeyInArray!0 (select (arr!29663 _keys!1544) from!1932)))))

(declare-fun b!982219 () Bool)

(declare-fun res!657345 () Bool)

(assert (=> b!982219 (=> (not res!657345) (not e!553654))))

(assert (=> b!982219 (= res!657345 (and (= (size!30145 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30144 _keys!1544) (size!30145 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982220 () Bool)

(declare-fun e!553655 () Bool)

(assert (=> b!982220 (= e!553655 tp_is_empty!22843)))

(declare-fun b!982221 () Bool)

(assert (=> b!982221 (= e!553654 e!553656)))

(declare-fun res!657346 () Bool)

(assert (=> b!982221 (=> (not res!657346) (not e!553656))))

(assert (=> b!982221 (= res!657346 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29663 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15397 (ValueCell!10940 V!35441) V!35441)

(declare-fun dynLambda!1783 (Int (_ BitVec 64)) V!35441)

(assert (=> b!982221 (= lt!435908 (get!15397 (select (arr!29664 _values!1278) from!1932) (dynLambda!1783 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35441)

(declare-fun getCurrentListMapNoExtraKeys!3453 (array!61610 array!61612 (_ BitVec 32) (_ BitVec 32) V!35441 V!35441 (_ BitVec 32) Int) ListLongMap!13453)

(assert (=> b!982221 (= lt!435906 (getCurrentListMapNoExtraKeys!3453 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982222 () Bool)

(declare-fun res!657342 () Bool)

(assert (=> b!982222 (=> (not res!657342) (not e!553654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61610 (_ BitVec 32)) Bool)

(assert (=> b!982222 (= res!657342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982223 () Bool)

(assert (=> b!982223 (= e!553657 tp_is_empty!22843)))

(declare-fun b!982224 () Bool)

(assert (=> b!982224 (= e!553658 (and e!553655 mapRes!36293))))

(declare-fun condMapEmpty!36293 () Bool)

(declare-fun mapDefault!36293 () ValueCell!10940)

(assert (=> b!982224 (= condMapEmpty!36293 (= (arr!29664 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10940)) mapDefault!36293)))))

(declare-fun b!982225 () Bool)

(declare-fun res!657347 () Bool)

(assert (=> b!982225 (=> (not res!657347) (not e!553654))))

(declare-datatypes ((List!20607 0))(
  ( (Nil!20604) (Cons!20603 (h!21765 (_ BitVec 64)) (t!29343 List!20607)) )
))
(declare-fun arrayNoDuplicates!0 (array!61610 (_ BitVec 32) List!20607) Bool)

(assert (=> b!982225 (= res!657347 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20604))))

(assert (= (and start!84022 res!657344) b!982219))

(assert (= (and b!982219 res!657345) b!982222))

(assert (= (and b!982222 res!657342) b!982225))

(assert (= (and b!982225 res!657347) b!982216))

(assert (= (and b!982216 res!657343) b!982218))

(assert (= (and b!982218 res!657348) b!982215))

(assert (= (and b!982215 res!657341) b!982221))

(assert (= (and b!982221 res!657346) b!982217))

(assert (= (and b!982224 condMapEmpty!36293) mapIsEmpty!36293))

(assert (= (and b!982224 (not condMapEmpty!36293)) mapNonEmpty!36293))

(get-info :version)

(assert (= (and mapNonEmpty!36293 ((_ is ValueCellFull!10940) mapValue!36293)) b!982223))

(assert (= (and b!982224 ((_ is ValueCellFull!10940) mapDefault!36293)) b!982220))

(assert (= start!84022 b!982224))

(declare-fun b_lambda!14815 () Bool)

(assert (=> (not b_lambda!14815) (not b!982221)))

(declare-fun t!29341 () Bool)

(declare-fun tb!6587 () Bool)

(assert (=> (and start!84022 (= defaultEntry!1281 defaultEntry!1281) t!29341) tb!6587))

(declare-fun result!13171 () Bool)

(assert (=> tb!6587 (= result!13171 tp_is_empty!22843)))

(assert (=> b!982221 t!29341))

(declare-fun b_and!31649 () Bool)

(assert (= b_and!31647 (and (=> t!29341 result!13171) b_and!31649)))

(declare-fun m!909035 () Bool)

(assert (=> b!982222 m!909035))

(declare-fun m!909037 () Bool)

(assert (=> start!84022 m!909037))

(declare-fun m!909039 () Bool)

(assert (=> start!84022 m!909039))

(declare-fun m!909041 () Bool)

(assert (=> start!84022 m!909041))

(declare-fun m!909043 () Bool)

(assert (=> b!982225 m!909043))

(declare-fun m!909045 () Bool)

(assert (=> b!982218 m!909045))

(assert (=> b!982218 m!909045))

(declare-fun m!909047 () Bool)

(assert (=> b!982218 m!909047))

(assert (=> b!982217 m!909045))

(declare-fun m!909049 () Bool)

(assert (=> b!982217 m!909049))

(assert (=> b!982217 m!909045))

(declare-fun m!909051 () Bool)

(assert (=> b!982217 m!909051))

(declare-fun m!909053 () Bool)

(assert (=> b!982217 m!909053))

(declare-fun m!909055 () Bool)

(assert (=> b!982217 m!909055))

(declare-fun m!909057 () Bool)

(assert (=> b!982217 m!909057))

(assert (=> b!982217 m!909055))

(assert (=> b!982217 m!909051))

(assert (=> b!982221 m!909045))

(declare-fun m!909059 () Bool)

(assert (=> b!982221 m!909059))

(declare-fun m!909061 () Bool)

(assert (=> b!982221 m!909061))

(declare-fun m!909063 () Bool)

(assert (=> b!982221 m!909063))

(assert (=> b!982221 m!909059))

(assert (=> b!982221 m!909063))

(declare-fun m!909065 () Bool)

(assert (=> b!982221 m!909065))

(declare-fun m!909067 () Bool)

(assert (=> mapNonEmpty!36293 m!909067))

(check-sat (not mapNonEmpty!36293) b_and!31649 (not start!84022) (not b_next!19795) tp_is_empty!22843 (not b!982218) (not b!982217) (not b!982222) (not b!982221) (not b!982225) (not b_lambda!14815))
(check-sat b_and!31649 (not b_next!19795))
