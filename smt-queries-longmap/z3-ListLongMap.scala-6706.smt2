; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84210 () Bool)

(assert start!84210)

(declare-fun b_free!19911 () Bool)

(declare-fun b_next!19911 () Bool)

(assert (=> start!84210 (= b_free!19911 (not b_next!19911))))

(declare-fun tp!69336 () Bool)

(declare-fun b_and!31899 () Bool)

(assert (=> start!84210 (= tp!69336 b_and!31899)))

(declare-fun b!984982 () Bool)

(declare-fun e!555242 () Bool)

(assert (=> b!984982 (= e!555242 (not true))))

(declare-datatypes ((V!35667 0))(
  ( (V!35668 (val!11557 Int)) )
))
(declare-datatypes ((tuple2!14786 0))(
  ( (tuple2!14787 (_1!7404 (_ BitVec 64)) (_2!7404 V!35667)) )
))
(declare-datatypes ((List!20678 0))(
  ( (Nil!20675) (Cons!20674 (h!21836 tuple2!14786) (t!29533 List!20678)) )
))
(declare-datatypes ((ListLongMap!13483 0))(
  ( (ListLongMap!13484 (toList!6757 List!20678)) )
))
(declare-fun lt!437050 () ListLongMap!13483)

(declare-fun lt!437047 () tuple2!14786)

(declare-fun lt!437049 () tuple2!14786)

(declare-fun +!3048 (ListLongMap!13483 tuple2!14786) ListLongMap!13483)

(assert (=> b!984982 (= (+!3048 (+!3048 lt!437050 lt!437047) lt!437049) (+!3048 (+!3048 lt!437050 lt!437049) lt!437047))))

(declare-fun lt!437051 () V!35667)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62005 0))(
  ( (array!62006 (arr!29860 (Array (_ BitVec 32) (_ BitVec 64))) (size!30339 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62005)

(assert (=> b!984982 (= lt!437049 (tuple2!14787 (select (arr!29860 _keys!1544) from!1932) lt!437051))))

(declare-fun minValue!1220 () V!35667)

(assert (=> b!984982 (= lt!437047 (tuple2!14787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32735 0))(
  ( (Unit!32736) )
))
(declare-fun lt!437048 () Unit!32735)

(declare-fun addCommutativeForDiffKeys!676 (ListLongMap!13483 (_ BitVec 64) V!35667 (_ BitVec 64) V!35667) Unit!32735)

(assert (=> b!984982 (= lt!437048 (addCommutativeForDiffKeys!676 lt!437050 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29860 _keys!1544) from!1932) lt!437051))))

(declare-fun b!984984 () Bool)

(declare-fun e!555245 () Bool)

(declare-fun tp_is_empty!23013 () Bool)

(assert (=> b!984984 (= e!555245 tp_is_empty!23013)))

(declare-fun b!984985 () Bool)

(declare-fun res!659110 () Bool)

(declare-fun e!555243 () Bool)

(assert (=> b!984985 (=> (not res!659110) (not e!555243))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62005 (_ BitVec 32)) Bool)

(assert (=> b!984985 (= res!659110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984986 () Bool)

(declare-fun res!659104 () Bool)

(assert (=> b!984986 (=> (not res!659104) (not e!555243))))

(declare-datatypes ((List!20679 0))(
  ( (Nil!20676) (Cons!20675 (h!21837 (_ BitVec 64)) (t!29534 List!20679)) )
))
(declare-fun arrayNoDuplicates!0 (array!62005 (_ BitVec 32) List!20679) Bool)

(assert (=> b!984986 (= res!659104 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20676))))

(declare-fun b!984987 () Bool)

(declare-fun res!659109 () Bool)

(assert (=> b!984987 (=> (not res!659109) (not e!555243))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984987 (= res!659109 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984988 () Bool)

(declare-fun res!659111 () Bool)

(assert (=> b!984988 (=> (not res!659111) (not e!555243))))

(assert (=> b!984988 (= res!659111 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30339 _keys!1544))))))

(declare-fun mapNonEmpty!36548 () Bool)

(declare-fun mapRes!36548 () Bool)

(declare-fun tp!69337 () Bool)

(assert (=> mapNonEmpty!36548 (= mapRes!36548 (and tp!69337 e!555245))))

(declare-datatypes ((ValueCell!11025 0))(
  ( (ValueCellFull!11025 (v!14119 V!35667)) (EmptyCell!11025) )
))
(declare-fun mapRest!36548 () (Array (_ BitVec 32) ValueCell!11025))

(declare-fun mapValue!36548 () ValueCell!11025)

(declare-datatypes ((array!62007 0))(
  ( (array!62008 (arr!29861 (Array (_ BitVec 32) ValueCell!11025)) (size!30340 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62007)

(declare-fun mapKey!36548 () (_ BitVec 32))

(assert (=> mapNonEmpty!36548 (= (arr!29861 _values!1278) (store mapRest!36548 mapKey!36548 mapValue!36548))))

(declare-fun mapIsEmpty!36548 () Bool)

(assert (=> mapIsEmpty!36548 mapRes!36548))

(declare-fun b!984989 () Bool)

(declare-fun e!555241 () Bool)

(assert (=> b!984989 (= e!555241 tp_is_empty!23013)))

(declare-fun b!984990 () Bool)

(declare-fun res!659108 () Bool)

(assert (=> b!984990 (=> (not res!659108) (not e!555243))))

(assert (=> b!984990 (= res!659108 (and (= (size!30340 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30339 _keys!1544) (size!30340 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!659105 () Bool)

(assert (=> start!84210 (=> (not res!659105) (not e!555243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84210 (= res!659105 (validMask!0 mask!1948))))

(assert (=> start!84210 e!555243))

(assert (=> start!84210 true))

(assert (=> start!84210 tp_is_empty!23013))

(declare-fun e!555244 () Bool)

(declare-fun array_inv!23085 (array!62007) Bool)

(assert (=> start!84210 (and (array_inv!23085 _values!1278) e!555244)))

(assert (=> start!84210 tp!69336))

(declare-fun array_inv!23086 (array!62005) Bool)

(assert (=> start!84210 (array_inv!23086 _keys!1544)))

(declare-fun b!984983 () Bool)

(assert (=> b!984983 (= e!555243 e!555242)))

(declare-fun res!659106 () Bool)

(assert (=> b!984983 (=> (not res!659106) (not e!555242))))

(assert (=> b!984983 (= res!659106 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29860 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15494 (ValueCell!11025 V!35667) V!35667)

(declare-fun dynLambda!1829 (Int (_ BitVec 64)) V!35667)

(assert (=> b!984983 (= lt!437051 (get!15494 (select (arr!29861 _values!1278) from!1932) (dynLambda!1829 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35667)

(declare-fun getCurrentListMapNoExtraKeys!3449 (array!62005 array!62007 (_ BitVec 32) (_ BitVec 32) V!35667 V!35667 (_ BitVec 32) Int) ListLongMap!13483)

(assert (=> b!984983 (= lt!437050 (getCurrentListMapNoExtraKeys!3449 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984991 () Bool)

(declare-fun res!659107 () Bool)

(assert (=> b!984991 (=> (not res!659107) (not e!555243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984991 (= res!659107 (validKeyInArray!0 (select (arr!29860 _keys!1544) from!1932)))))

(declare-fun b!984992 () Bool)

(assert (=> b!984992 (= e!555244 (and e!555241 mapRes!36548))))

(declare-fun condMapEmpty!36548 () Bool)

(declare-fun mapDefault!36548 () ValueCell!11025)

(assert (=> b!984992 (= condMapEmpty!36548 (= (arr!29861 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11025)) mapDefault!36548)))))

(assert (= (and start!84210 res!659105) b!984990))

(assert (= (and b!984990 res!659108) b!984985))

(assert (= (and b!984985 res!659110) b!984986))

(assert (= (and b!984986 res!659104) b!984988))

(assert (= (and b!984988 res!659111) b!984991))

(assert (= (and b!984991 res!659107) b!984987))

(assert (= (and b!984987 res!659109) b!984983))

(assert (= (and b!984983 res!659106) b!984982))

(assert (= (and b!984992 condMapEmpty!36548) mapIsEmpty!36548))

(assert (= (and b!984992 (not condMapEmpty!36548)) mapNonEmpty!36548))

(get-info :version)

(assert (= (and mapNonEmpty!36548 ((_ is ValueCellFull!11025) mapValue!36548)) b!984984))

(assert (= (and b!984992 ((_ is ValueCellFull!11025) mapDefault!36548)) b!984989))

(assert (= start!84210 b!984992))

(declare-fun b_lambda!14943 () Bool)

(assert (=> (not b_lambda!14943) (not b!984983)))

(declare-fun t!29532 () Bool)

(declare-fun tb!6705 () Bool)

(assert (=> (and start!84210 (= defaultEntry!1281 defaultEntry!1281) t!29532) tb!6705))

(declare-fun result!13399 () Bool)

(assert (=> tb!6705 (= result!13399 tp_is_empty!23013)))

(assert (=> b!984983 t!29532))

(declare-fun b_and!31901 () Bool)

(assert (= b_and!31899 (and (=> t!29532 result!13399) b_and!31901)))

(declare-fun m!912053 () Bool)

(assert (=> start!84210 m!912053))

(declare-fun m!912055 () Bool)

(assert (=> start!84210 m!912055))

(declare-fun m!912057 () Bool)

(assert (=> start!84210 m!912057))

(declare-fun m!912059 () Bool)

(assert (=> mapNonEmpty!36548 m!912059))

(declare-fun m!912061 () Bool)

(assert (=> b!984986 m!912061))

(declare-fun m!912063 () Bool)

(assert (=> b!984985 m!912063))

(declare-fun m!912065 () Bool)

(assert (=> b!984983 m!912065))

(declare-fun m!912067 () Bool)

(assert (=> b!984983 m!912067))

(declare-fun m!912069 () Bool)

(assert (=> b!984983 m!912069))

(declare-fun m!912071 () Bool)

(assert (=> b!984983 m!912071))

(assert (=> b!984983 m!912067))

(assert (=> b!984983 m!912071))

(declare-fun m!912073 () Bool)

(assert (=> b!984983 m!912073))

(declare-fun m!912075 () Bool)

(assert (=> b!984982 m!912075))

(declare-fun m!912077 () Bool)

(assert (=> b!984982 m!912077))

(assert (=> b!984982 m!912065))

(declare-fun m!912079 () Bool)

(assert (=> b!984982 m!912079))

(assert (=> b!984982 m!912075))

(declare-fun m!912081 () Bool)

(assert (=> b!984982 m!912081))

(declare-fun m!912083 () Bool)

(assert (=> b!984982 m!912083))

(assert (=> b!984982 m!912081))

(assert (=> b!984982 m!912065))

(assert (=> b!984991 m!912065))

(assert (=> b!984991 m!912065))

(declare-fun m!912085 () Bool)

(assert (=> b!984991 m!912085))

(check-sat (not b!984982) tp_is_empty!23013 (not b!984983) (not b_lambda!14943) (not start!84210) (not b!984986) b_and!31901 (not b!984991) (not b!984985) (not b_next!19911) (not mapNonEmpty!36548))
(check-sat b_and!31901 (not b_next!19911))
