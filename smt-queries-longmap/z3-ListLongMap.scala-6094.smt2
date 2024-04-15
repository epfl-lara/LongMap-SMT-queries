; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78654 () Bool)

(assert start!78654)

(declare-fun b_free!16885 () Bool)

(declare-fun b_next!16885 () Bool)

(assert (=> start!78654 (= b_free!16885 (not b_next!16885))))

(declare-fun tp!59097 () Bool)

(declare-fun b_and!27481 () Bool)

(assert (=> start!78654 (= tp!59097 b_and!27481)))

(declare-fun b!916983 () Bool)

(declare-fun res!618237 () Bool)

(declare-fun e!514805 () Bool)

(assert (=> b!916983 (=> (not res!618237) (not e!514805))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30823 0))(
  ( (V!30824 (val!9747 Int)) )
))
(declare-fun v!791 () V!30823)

(declare-datatypes ((tuple2!12702 0))(
  ( (tuple2!12703 (_1!6362 (_ BitVec 64)) (_2!6362 V!30823)) )
))
(declare-datatypes ((List!18492 0))(
  ( (Nil!18489) (Cons!18488 (h!19634 tuple2!12702) (t!26098 List!18492)) )
))
(declare-datatypes ((ListLongMap!11389 0))(
  ( (ListLongMap!11390 (toList!5710 List!18492)) )
))
(declare-fun lt!411729 () ListLongMap!11389)

(declare-fun apply!550 (ListLongMap!11389 (_ BitVec 64)) V!30823)

(assert (=> b!916983 (= res!618237 (= (apply!550 lt!411729 k0!1099) v!791))))

(declare-fun b!916984 () Bool)

(declare-fun res!618230 () Bool)

(declare-fun e!514809 () Bool)

(assert (=> b!916984 (=> (not res!618230) (not e!514809))))

(declare-datatypes ((array!54761 0))(
  ( (array!54762 (arr!26326 (Array (_ BitVec 32) (_ BitVec 64))) (size!26787 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54761)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9215 0))(
  ( (ValueCellFull!9215 (v!12264 V!30823)) (EmptyCell!9215) )
))
(declare-datatypes ((array!54763 0))(
  ( (array!54764 (arr!26327 (Array (_ BitVec 32) ValueCell!9215)) (size!26788 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54763)

(assert (=> b!916984 (= res!618230 (and (= (size!26788 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26787 _keys!1487) (size!26788 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916985 () Bool)

(declare-fun e!514803 () Bool)

(declare-fun tp_is_empty!19393 () Bool)

(assert (=> b!916985 (= e!514803 tp_is_empty!19393)))

(declare-fun b!916986 () Bool)

(declare-fun e!514804 () Bool)

(assert (=> b!916986 (= e!514804 (not true))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!411730 () (_ BitVec 64))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30823)

(declare-fun minValue!1173 () V!30823)

(declare-fun getCurrentListMap!2904 (array!54761 array!54763 (_ BitVec 32) (_ BitVec 32) V!30823 V!30823 (_ BitVec 32) Int) ListLongMap!11389)

(declare-fun +!2637 (ListLongMap!11389 tuple2!12702) ListLongMap!11389)

(declare-fun get!13794 (ValueCell!9215 V!30823) V!30823)

(declare-fun dynLambda!1393 (Int (_ BitVec 64)) V!30823)

(assert (=> b!916986 (= (getCurrentListMap!2904 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2637 (getCurrentListMap!2904 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12703 lt!411730 (get!13794 (select (arr!26327 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1393 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30886 0))(
  ( (Unit!30887) )
))
(declare-fun lt!411731 () Unit!30886)

(declare-fun lemmaListMapRecursiveValidKeyArray!1 (array!54761 array!54763 (_ BitVec 32) (_ BitVec 32) V!30823 V!30823 (_ BitVec 32) Int) Unit!30886)

(assert (=> b!916986 (= lt!411731 (lemmaListMapRecursiveValidKeyArray!1 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!30846 () Bool)

(declare-fun mapRes!30846 () Bool)

(assert (=> mapIsEmpty!30846 mapRes!30846))

(declare-fun b!916987 () Bool)

(declare-fun res!618232 () Bool)

(assert (=> b!916987 (=> (not res!618232) (not e!514809))))

(declare-datatypes ((List!18493 0))(
  ( (Nil!18490) (Cons!18489 (h!19635 (_ BitVec 64)) (t!26099 List!18493)) )
))
(declare-fun arrayNoDuplicates!0 (array!54761 (_ BitVec 32) List!18493) Bool)

(assert (=> b!916987 (= res!618232 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18490))))

(declare-fun b!916988 () Bool)

(declare-fun res!618239 () Bool)

(assert (=> b!916988 (=> (not res!618239) (not e!514805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!916988 (= res!618239 (validKeyInArray!0 k0!1099))))

(declare-fun b!916989 () Bool)

(declare-fun e!514807 () Bool)

(assert (=> b!916989 (= e!514807 tp_is_empty!19393)))

(declare-fun b!916990 () Bool)

(declare-fun res!618231 () Bool)

(assert (=> b!916990 (=> (not res!618231) (not e!514805))))

(assert (=> b!916990 (= res!618231 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!618234 () Bool)

(assert (=> start!78654 (=> (not res!618234) (not e!514809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78654 (= res!618234 (validMask!0 mask!1881))))

(assert (=> start!78654 e!514809))

(assert (=> start!78654 true))

(assert (=> start!78654 tp_is_empty!19393))

(declare-fun e!514806 () Bool)

(declare-fun array_inv!20610 (array!54763) Bool)

(assert (=> start!78654 (and (array_inv!20610 _values!1231) e!514806)))

(assert (=> start!78654 tp!59097))

(declare-fun array_inv!20611 (array!54761) Bool)

(assert (=> start!78654 (array_inv!20611 _keys!1487)))

(declare-fun b!916991 () Bool)

(assert (=> b!916991 (= e!514809 e!514805)))

(declare-fun res!618236 () Bool)

(assert (=> b!916991 (=> (not res!618236) (not e!514805))))

(declare-fun contains!4715 (ListLongMap!11389 (_ BitVec 64)) Bool)

(assert (=> b!916991 (= res!618236 (contains!4715 lt!411729 k0!1099))))

(assert (=> b!916991 (= lt!411729 (getCurrentListMap!2904 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916992 () Bool)

(assert (=> b!916992 (= e!514805 e!514804)))

(declare-fun res!618233 () Bool)

(assert (=> b!916992 (=> (not res!618233) (not e!514804))))

(assert (=> b!916992 (= res!618233 (validKeyInArray!0 lt!411730))))

(assert (=> b!916992 (= lt!411730 (select (arr!26326 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!916993 () Bool)

(declare-fun res!618238 () Bool)

(assert (=> b!916993 (=> (not res!618238) (not e!514809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54761 (_ BitVec 32)) Bool)

(assert (=> b!916993 (= res!618238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30846 () Bool)

(declare-fun tp!59096 () Bool)

(assert (=> mapNonEmpty!30846 (= mapRes!30846 (and tp!59096 e!514803))))

(declare-fun mapKey!30846 () (_ BitVec 32))

(declare-fun mapRest!30846 () (Array (_ BitVec 32) ValueCell!9215))

(declare-fun mapValue!30846 () ValueCell!9215)

(assert (=> mapNonEmpty!30846 (= (arr!26327 _values!1231) (store mapRest!30846 mapKey!30846 mapValue!30846))))

(declare-fun b!916994 () Bool)

(declare-fun res!618235 () Bool)

(assert (=> b!916994 (=> (not res!618235) (not e!514809))))

(assert (=> b!916994 (= res!618235 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26787 _keys!1487))))))

(declare-fun b!916995 () Bool)

(assert (=> b!916995 (= e!514806 (and e!514807 mapRes!30846))))

(declare-fun condMapEmpty!30846 () Bool)

(declare-fun mapDefault!30846 () ValueCell!9215)

(assert (=> b!916995 (= condMapEmpty!30846 (= (arr!26327 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9215)) mapDefault!30846)))))

(assert (= (and start!78654 res!618234) b!916984))

(assert (= (and b!916984 res!618230) b!916993))

(assert (= (and b!916993 res!618238) b!916987))

(assert (= (and b!916987 res!618232) b!916994))

(assert (= (and b!916994 res!618235) b!916991))

(assert (= (and b!916991 res!618236) b!916983))

(assert (= (and b!916983 res!618237) b!916990))

(assert (= (and b!916990 res!618231) b!916988))

(assert (= (and b!916988 res!618239) b!916992))

(assert (= (and b!916992 res!618233) b!916986))

(assert (= (and b!916995 condMapEmpty!30846) mapIsEmpty!30846))

(assert (= (and b!916995 (not condMapEmpty!30846)) mapNonEmpty!30846))

(get-info :version)

(assert (= (and mapNonEmpty!30846 ((_ is ValueCellFull!9215) mapValue!30846)) b!916985))

(assert (= (and b!916995 ((_ is ValueCellFull!9215) mapDefault!30846)) b!916989))

(assert (= start!78654 b!916995))

(declare-fun b_lambda!13369 () Bool)

(assert (=> (not b_lambda!13369) (not b!916986)))

(declare-fun t!26097 () Bool)

(declare-fun tb!5457 () Bool)

(assert (=> (and start!78654 (= defaultEntry!1235 defaultEntry!1235) t!26097) tb!5457))

(declare-fun result!10745 () Bool)

(assert (=> tb!5457 (= result!10745 tp_is_empty!19393)))

(assert (=> b!916986 t!26097))

(declare-fun b_and!27483 () Bool)

(assert (= b_and!27481 (and (=> t!26097 result!10745) b_and!27483)))

(declare-fun m!850225 () Bool)

(assert (=> b!916993 m!850225))

(declare-fun m!850227 () Bool)

(assert (=> b!916991 m!850227))

(declare-fun m!850229 () Bool)

(assert (=> b!916991 m!850229))

(declare-fun m!850231 () Bool)

(assert (=> b!916992 m!850231))

(declare-fun m!850233 () Bool)

(assert (=> b!916992 m!850233))

(declare-fun m!850235 () Bool)

(assert (=> b!916983 m!850235))

(declare-fun m!850237 () Bool)

(assert (=> mapNonEmpty!30846 m!850237))

(declare-fun m!850239 () Bool)

(assert (=> b!916987 m!850239))

(declare-fun m!850241 () Bool)

(assert (=> start!78654 m!850241))

(declare-fun m!850243 () Bool)

(assert (=> start!78654 m!850243))

(declare-fun m!850245 () Bool)

(assert (=> start!78654 m!850245))

(declare-fun m!850247 () Bool)

(assert (=> b!916986 m!850247))

(declare-fun m!850249 () Bool)

(assert (=> b!916986 m!850249))

(assert (=> b!916986 m!850247))

(assert (=> b!916986 m!850249))

(declare-fun m!850251 () Bool)

(assert (=> b!916986 m!850251))

(declare-fun m!850253 () Bool)

(assert (=> b!916986 m!850253))

(declare-fun m!850255 () Bool)

(assert (=> b!916986 m!850255))

(assert (=> b!916986 m!850253))

(declare-fun m!850257 () Bool)

(assert (=> b!916986 m!850257))

(declare-fun m!850259 () Bool)

(assert (=> b!916986 m!850259))

(declare-fun m!850261 () Bool)

(assert (=> b!916988 m!850261))

(check-sat (not b!916986) (not b!916991) (not b!916992) (not b!916993) tp_is_empty!19393 (not start!78654) (not mapNonEmpty!30846) (not b!916983) b_and!27483 (not b!916988) (not b_next!16885) (not b_lambda!13369) (not b!916987))
(check-sat b_and!27483 (not b_next!16885))
