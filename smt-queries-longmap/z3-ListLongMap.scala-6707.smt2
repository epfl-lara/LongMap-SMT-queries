; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84196 () Bool)

(assert start!84196)

(declare-fun b_free!19915 () Bool)

(declare-fun b_next!19915 () Bool)

(assert (=> start!84196 (= b_free!19915 (not b_next!19915))))

(declare-fun tp!69350 () Bool)

(declare-fun b_and!31881 () Bool)

(assert (=> start!84196 (= tp!69350 b_and!31881)))

(declare-fun b!984813 () Bool)

(declare-fun res!659046 () Bool)

(declare-fun e!555130 () Bool)

(assert (=> b!984813 (=> (not res!659046) (not e!555130))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61940 0))(
  ( (array!61941 (arr!29828 (Array (_ BitVec 32) (_ BitVec 64))) (size!30309 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61940)

(assert (=> b!984813 (= res!659046 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30309 _keys!1544))))))

(declare-fun b!984814 () Bool)

(declare-fun e!555129 () Bool)

(declare-fun tp_is_empty!23017 () Bool)

(assert (=> b!984814 (= e!555129 tp_is_empty!23017)))

(declare-fun b!984815 () Bool)

(declare-fun res!659044 () Bool)

(assert (=> b!984815 (=> (not res!659044) (not e!555130))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35673 0))(
  ( (V!35674 (val!11559 Int)) )
))
(declare-datatypes ((ValueCell!11027 0))(
  ( (ValueCellFull!11027 (v!14120 V!35673)) (EmptyCell!11027) )
))
(declare-datatypes ((array!61942 0))(
  ( (array!61943 (arr!29829 (Array (_ BitVec 32) ValueCell!11027)) (size!30310 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61942)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984815 (= res!659044 (and (= (size!30310 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30309 _keys!1544) (size!30310 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36554 () Bool)

(declare-fun mapRes!36554 () Bool)

(assert (=> mapIsEmpty!36554 mapRes!36554))

(declare-fun b!984816 () Bool)

(declare-fun e!555132 () Bool)

(assert (=> b!984816 (= e!555132 (not true))))

(declare-datatypes ((tuple2!14868 0))(
  ( (tuple2!14869 (_1!7445 (_ BitVec 64)) (_2!7445 V!35673)) )
))
(declare-datatypes ((List!20718 0))(
  ( (Nil!20715) (Cons!20714 (h!21876 tuple2!14868) (t!29568 List!20718)) )
))
(declare-datatypes ((ListLongMap!13555 0))(
  ( (ListLongMap!13556 (toList!6793 List!20718)) )
))
(declare-fun lt!436842 () ListLongMap!13555)

(declare-fun lt!436841 () tuple2!14868)

(declare-fun lt!436845 () tuple2!14868)

(declare-fun +!3071 (ListLongMap!13555 tuple2!14868) ListLongMap!13555)

(assert (=> b!984816 (= (+!3071 (+!3071 lt!436842 lt!436841) lt!436845) (+!3071 (+!3071 lt!436842 lt!436845) lt!436841))))

(declare-fun lt!436844 () V!35673)

(assert (=> b!984816 (= lt!436845 (tuple2!14869 (select (arr!29828 _keys!1544) from!1932) lt!436844))))

(declare-fun minValue!1220 () V!35673)

(assert (=> b!984816 (= lt!436841 (tuple2!14869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32608 0))(
  ( (Unit!32609) )
))
(declare-fun lt!436843 () Unit!32608)

(declare-fun addCommutativeForDiffKeys!675 (ListLongMap!13555 (_ BitVec 64) V!35673 (_ BitVec 64) V!35673) Unit!32608)

(assert (=> b!984816 (= lt!436843 (addCommutativeForDiffKeys!675 lt!436842 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29828 _keys!1544) from!1932) lt!436844))))

(declare-fun b!984817 () Bool)

(declare-fun res!659049 () Bool)

(assert (=> b!984817 (=> (not res!659049) (not e!555130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984817 (= res!659049 (validKeyInArray!0 (select (arr!29828 _keys!1544) from!1932)))))

(declare-fun b!984818 () Bool)

(assert (=> b!984818 (= e!555130 e!555132)))

(declare-fun res!659047 () Bool)

(assert (=> b!984818 (=> (not res!659047) (not e!555132))))

(assert (=> b!984818 (= res!659047 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29828 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15498 (ValueCell!11027 V!35673) V!35673)

(declare-fun dynLambda!1826 (Int (_ BitVec 64)) V!35673)

(assert (=> b!984818 (= lt!436844 (get!15498 (select (arr!29829 _values!1278) from!1932) (dynLambda!1826 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35673)

(declare-fun getCurrentListMapNoExtraKeys!3498 (array!61940 array!61942 (_ BitVec 32) (_ BitVec 32) V!35673 V!35673 (_ BitVec 32) Int) ListLongMap!13555)

(assert (=> b!984818 (= lt!436842 (getCurrentListMapNoExtraKeys!3498 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984819 () Bool)

(declare-fun res!659043 () Bool)

(assert (=> b!984819 (=> (not res!659043) (not e!555130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61940 (_ BitVec 32)) Bool)

(assert (=> b!984819 (= res!659043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!659042 () Bool)

(assert (=> start!84196 (=> (not res!659042) (not e!555130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84196 (= res!659042 (validMask!0 mask!1948))))

(assert (=> start!84196 e!555130))

(assert (=> start!84196 true))

(assert (=> start!84196 tp_is_empty!23017))

(declare-fun e!555133 () Bool)

(declare-fun array_inv!23061 (array!61942) Bool)

(assert (=> start!84196 (and (array_inv!23061 _values!1278) e!555133)))

(assert (=> start!84196 tp!69350))

(declare-fun array_inv!23062 (array!61940) Bool)

(assert (=> start!84196 (array_inv!23062 _keys!1544)))

(declare-fun b!984820 () Bool)

(declare-fun res!659045 () Bool)

(assert (=> b!984820 (=> (not res!659045) (not e!555130))))

(declare-datatypes ((List!20719 0))(
  ( (Nil!20716) (Cons!20715 (h!21877 (_ BitVec 64)) (t!29569 List!20719)) )
))
(declare-fun arrayNoDuplicates!0 (array!61940 (_ BitVec 32) List!20719) Bool)

(assert (=> b!984820 (= res!659045 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20716))))

(declare-fun b!984821 () Bool)

(assert (=> b!984821 (= e!555133 (and e!555129 mapRes!36554))))

(declare-fun condMapEmpty!36554 () Bool)

(declare-fun mapDefault!36554 () ValueCell!11027)

(assert (=> b!984821 (= condMapEmpty!36554 (= (arr!29829 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11027)) mapDefault!36554)))))

(declare-fun b!984822 () Bool)

(declare-fun e!555134 () Bool)

(assert (=> b!984822 (= e!555134 tp_is_empty!23017)))

(declare-fun mapNonEmpty!36554 () Bool)

(declare-fun tp!69349 () Bool)

(assert (=> mapNonEmpty!36554 (= mapRes!36554 (and tp!69349 e!555134))))

(declare-fun mapKey!36554 () (_ BitVec 32))

(declare-fun mapValue!36554 () ValueCell!11027)

(declare-fun mapRest!36554 () (Array (_ BitVec 32) ValueCell!11027))

(assert (=> mapNonEmpty!36554 (= (arr!29829 _values!1278) (store mapRest!36554 mapKey!36554 mapValue!36554))))

(declare-fun b!984823 () Bool)

(declare-fun res!659048 () Bool)

(assert (=> b!984823 (=> (not res!659048) (not e!555130))))

(assert (=> b!984823 (= res!659048 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!84196 res!659042) b!984815))

(assert (= (and b!984815 res!659044) b!984819))

(assert (= (and b!984819 res!659043) b!984820))

(assert (= (and b!984820 res!659045) b!984813))

(assert (= (and b!984813 res!659046) b!984817))

(assert (= (and b!984817 res!659049) b!984823))

(assert (= (and b!984823 res!659048) b!984818))

(assert (= (and b!984818 res!659047) b!984816))

(assert (= (and b!984821 condMapEmpty!36554) mapIsEmpty!36554))

(assert (= (and b!984821 (not condMapEmpty!36554)) mapNonEmpty!36554))

(get-info :version)

(assert (= (and mapNonEmpty!36554 ((_ is ValueCellFull!11027) mapValue!36554)) b!984822))

(assert (= (and b!984821 ((_ is ValueCellFull!11027) mapDefault!36554)) b!984814))

(assert (= start!84196 b!984821))

(declare-fun b_lambda!14929 () Bool)

(assert (=> (not b_lambda!14929) (not b!984818)))

(declare-fun t!29567 () Bool)

(declare-fun tb!6701 () Bool)

(assert (=> (and start!84196 (= defaultEntry!1281 defaultEntry!1281) t!29567) tb!6701))

(declare-fun result!13399 () Bool)

(assert (=> tb!6701 (= result!13399 tp_is_empty!23017)))

(assert (=> b!984818 t!29567))

(declare-fun b_and!31883 () Bool)

(assert (= b_and!31881 (and (=> t!29567 result!13399) b_and!31883)))

(declare-fun m!911363 () Bool)

(assert (=> mapNonEmpty!36554 m!911363))

(declare-fun m!911365 () Bool)

(assert (=> b!984817 m!911365))

(assert (=> b!984817 m!911365))

(declare-fun m!911367 () Bool)

(assert (=> b!984817 m!911367))

(declare-fun m!911369 () Bool)

(assert (=> b!984816 m!911369))

(declare-fun m!911371 () Bool)

(assert (=> b!984816 m!911371))

(assert (=> b!984816 m!911365))

(assert (=> b!984816 m!911369))

(declare-fun m!911373 () Bool)

(assert (=> b!984816 m!911373))

(assert (=> b!984816 m!911373))

(declare-fun m!911375 () Bool)

(assert (=> b!984816 m!911375))

(assert (=> b!984816 m!911365))

(declare-fun m!911377 () Bool)

(assert (=> b!984816 m!911377))

(assert (=> b!984818 m!911365))

(declare-fun m!911379 () Bool)

(assert (=> b!984818 m!911379))

(declare-fun m!911381 () Bool)

(assert (=> b!984818 m!911381))

(declare-fun m!911383 () Bool)

(assert (=> b!984818 m!911383))

(assert (=> b!984818 m!911379))

(assert (=> b!984818 m!911383))

(declare-fun m!911385 () Bool)

(assert (=> b!984818 m!911385))

(declare-fun m!911387 () Bool)

(assert (=> b!984820 m!911387))

(declare-fun m!911389 () Bool)

(assert (=> b!984819 m!911389))

(declare-fun m!911391 () Bool)

(assert (=> start!84196 m!911391))

(declare-fun m!911393 () Bool)

(assert (=> start!84196 m!911393))

(declare-fun m!911395 () Bool)

(assert (=> start!84196 m!911395))

(check-sat (not start!84196) b_and!31883 (not b!984818) (not b!984819) (not b!984816) (not b!984820) (not b!984817) (not mapNonEmpty!36554) tp_is_empty!23017 (not b_next!19915) (not b_lambda!14929))
(check-sat b_and!31883 (not b_next!19915))
