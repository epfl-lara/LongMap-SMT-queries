; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78710 () Bool)

(assert start!78710)

(declare-fun b_free!16923 () Bool)

(declare-fun b_next!16923 () Bool)

(assert (=> start!78710 (= b_free!16923 (not b_next!16923))))

(declare-fun tp!59209 () Bool)

(declare-fun b_and!27583 () Bool)

(assert (=> start!78710 (= tp!59209 b_and!27583)))

(declare-fun b!918001 () Bool)

(declare-fun res!618913 () Bool)

(declare-fun e!515353 () Bool)

(assert (=> b!918001 (=> (not res!618913) (not e!515353))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54846 0))(
  ( (array!54847 (arr!26368 (Array (_ BitVec 32) (_ BitVec 64))) (size!26827 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54846)

(assert (=> b!918001 (= res!618913 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26827 _keys!1487))))))

(declare-fun mapIsEmpty!30903 () Bool)

(declare-fun mapRes!30903 () Bool)

(assert (=> mapIsEmpty!30903 mapRes!30903))

(declare-fun b!918002 () Bool)

(declare-fun e!515354 () Bool)

(declare-fun tp_is_empty!19431 () Bool)

(assert (=> b!918002 (= e!515354 tp_is_empty!19431)))

(declare-fun b!918003 () Bool)

(declare-fun e!515352 () Bool)

(assert (=> b!918003 (= e!515352 (and e!515354 mapRes!30903))))

(declare-fun condMapEmpty!30903 () Bool)

(declare-datatypes ((V!30873 0))(
  ( (V!30874 (val!9766 Int)) )
))
(declare-datatypes ((ValueCell!9234 0))(
  ( (ValueCellFull!9234 (v!12284 V!30873)) (EmptyCell!9234) )
))
(declare-datatypes ((array!54848 0))(
  ( (array!54849 (arr!26369 (Array (_ BitVec 32) ValueCell!9234)) (size!26828 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54848)

(declare-fun mapDefault!30903 () ValueCell!9234)

(assert (=> b!918003 (= condMapEmpty!30903 (= (arr!26369 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9234)) mapDefault!30903)))))

(declare-fun b!918004 () Bool)

(declare-fun res!618915 () Bool)

(declare-fun e!515355 () Bool)

(assert (=> b!918004 (=> (not res!618915) (not e!515355))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30873)

(declare-datatypes ((tuple2!12686 0))(
  ( (tuple2!12687 (_1!6354 (_ BitVec 64)) (_2!6354 V!30873)) )
))
(declare-datatypes ((List!18493 0))(
  ( (Nil!18490) (Cons!18489 (h!19635 tuple2!12686) (t!26146 List!18493)) )
))
(declare-datatypes ((ListLongMap!11383 0))(
  ( (ListLongMap!11384 (toList!5707 List!18493)) )
))
(declare-fun lt!412138 () ListLongMap!11383)

(declare-fun apply!557 (ListLongMap!11383 (_ BitVec 64)) V!30873)

(assert (=> b!918004 (= res!618915 (= (apply!557 lt!412138 k0!1099) v!791))))

(declare-fun res!618916 () Bool)

(assert (=> start!78710 (=> (not res!618916) (not e!515353))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78710 (= res!618916 (validMask!0 mask!1881))))

(assert (=> start!78710 e!515353))

(assert (=> start!78710 true))

(assert (=> start!78710 tp_is_empty!19431))

(declare-fun array_inv!20560 (array!54848) Bool)

(assert (=> start!78710 (and (array_inv!20560 _values!1231) e!515352)))

(assert (=> start!78710 tp!59209))

(declare-fun array_inv!20561 (array!54846) Bool)

(assert (=> start!78710 (array_inv!20561 _keys!1487)))

(declare-fun b!918005 () Bool)

(declare-fun res!618911 () Bool)

(assert (=> b!918005 (=> (not res!618911) (not e!515355))))

(assert (=> b!918005 (= res!618911 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918006 () Bool)

(declare-fun e!515351 () Bool)

(assert (=> b!918006 (= e!515351 (not true))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!412136 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30873)

(declare-fun minValue!1173 () V!30873)

(declare-fun getCurrentListMap!2965 (array!54846 array!54848 (_ BitVec 32) (_ BitVec 32) V!30873 V!30873 (_ BitVec 32) Int) ListLongMap!11383)

(declare-fun +!2621 (ListLongMap!11383 tuple2!12686) ListLongMap!11383)

(declare-fun get!13818 (ValueCell!9234 V!30873) V!30873)

(declare-fun dynLambda!1410 (Int (_ BitVec 64)) V!30873)

(assert (=> b!918006 (= (getCurrentListMap!2965 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2621 (getCurrentListMap!2965 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12687 lt!412136 (get!13818 (select (arr!26369 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1410 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30990 0))(
  ( (Unit!30991) )
))
(declare-fun lt!412137 () Unit!30990)

(declare-fun lemmaListMapRecursiveValidKeyArray!11 (array!54846 array!54848 (_ BitVec 32) (_ BitVec 32) V!30873 V!30873 (_ BitVec 32) Int) Unit!30990)

(assert (=> b!918006 (= lt!412137 (lemmaListMapRecursiveValidKeyArray!11 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918007 () Bool)

(assert (=> b!918007 (= e!515355 e!515351)))

(declare-fun res!618918 () Bool)

(assert (=> b!918007 (=> (not res!618918) (not e!515351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918007 (= res!618918 (validKeyInArray!0 lt!412136))))

(assert (=> b!918007 (= lt!412136 (select (arr!26368 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918008 () Bool)

(declare-fun e!515350 () Bool)

(assert (=> b!918008 (= e!515350 tp_is_empty!19431)))

(declare-fun mapNonEmpty!30903 () Bool)

(declare-fun tp!59210 () Bool)

(assert (=> mapNonEmpty!30903 (= mapRes!30903 (and tp!59210 e!515350))))

(declare-fun mapRest!30903 () (Array (_ BitVec 32) ValueCell!9234))

(declare-fun mapValue!30903 () ValueCell!9234)

(declare-fun mapKey!30903 () (_ BitVec 32))

(assert (=> mapNonEmpty!30903 (= (arr!26369 _values!1231) (store mapRest!30903 mapKey!30903 mapValue!30903))))

(declare-fun b!918009 () Bool)

(declare-fun res!618917 () Bool)

(assert (=> b!918009 (=> (not res!618917) (not e!515353))))

(assert (=> b!918009 (= res!618917 (and (= (size!26828 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26827 _keys!1487) (size!26828 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918010 () Bool)

(declare-fun res!618919 () Bool)

(assert (=> b!918010 (=> (not res!618919) (not e!515353))))

(declare-datatypes ((List!18494 0))(
  ( (Nil!18491) (Cons!18490 (h!19636 (_ BitVec 64)) (t!26147 List!18494)) )
))
(declare-fun arrayNoDuplicates!0 (array!54846 (_ BitVec 32) List!18494) Bool)

(assert (=> b!918010 (= res!618919 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18491))))

(declare-fun b!918011 () Bool)

(assert (=> b!918011 (= e!515353 e!515355)))

(declare-fun res!618910 () Bool)

(assert (=> b!918011 (=> (not res!618910) (not e!515355))))

(declare-fun contains!4757 (ListLongMap!11383 (_ BitVec 64)) Bool)

(assert (=> b!918011 (= res!618910 (contains!4757 lt!412138 k0!1099))))

(assert (=> b!918011 (= lt!412138 (getCurrentListMap!2965 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918012 () Bool)

(declare-fun res!618912 () Bool)

(assert (=> b!918012 (=> (not res!618912) (not e!515355))))

(assert (=> b!918012 (= res!618912 (validKeyInArray!0 k0!1099))))

(declare-fun b!918013 () Bool)

(declare-fun res!618914 () Bool)

(assert (=> b!918013 (=> (not res!618914) (not e!515353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54846 (_ BitVec 32)) Bool)

(assert (=> b!918013 (= res!618914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78710 res!618916) b!918009))

(assert (= (and b!918009 res!618917) b!918013))

(assert (= (and b!918013 res!618914) b!918010))

(assert (= (and b!918010 res!618919) b!918001))

(assert (= (and b!918001 res!618913) b!918011))

(assert (= (and b!918011 res!618910) b!918004))

(assert (= (and b!918004 res!618915) b!918005))

(assert (= (and b!918005 res!618911) b!918012))

(assert (= (and b!918012 res!618912) b!918007))

(assert (= (and b!918007 res!618918) b!918006))

(assert (= (and b!918003 condMapEmpty!30903) mapIsEmpty!30903))

(assert (= (and b!918003 (not condMapEmpty!30903)) mapNonEmpty!30903))

(get-info :version)

(assert (= (and mapNonEmpty!30903 ((_ is ValueCellFull!9234) mapValue!30903)) b!918008))

(assert (= (and b!918003 ((_ is ValueCellFull!9234) mapDefault!30903)) b!918002))

(assert (= start!78710 b!918003))

(declare-fun b_lambda!13425 () Bool)

(assert (=> (not b_lambda!13425) (not b!918006)))

(declare-fun t!26145 () Bool)

(declare-fun tb!5503 () Bool)

(assert (=> (and start!78710 (= defaultEntry!1235 defaultEntry!1235) t!26145) tb!5503))

(declare-fun result!10829 () Bool)

(assert (=> tb!5503 (= result!10829 tp_is_empty!19431)))

(assert (=> b!918006 t!26145))

(declare-fun b_and!27585 () Bool)

(assert (= b_and!27583 (and (=> t!26145 result!10829) b_and!27585)))

(declare-fun m!851705 () Bool)

(assert (=> mapNonEmpty!30903 m!851705))

(declare-fun m!851707 () Bool)

(assert (=> b!918010 m!851707))

(declare-fun m!851709 () Bool)

(assert (=> b!918007 m!851709))

(declare-fun m!851711 () Bool)

(assert (=> b!918007 m!851711))

(declare-fun m!851713 () Bool)

(assert (=> b!918013 m!851713))

(declare-fun m!851715 () Bool)

(assert (=> b!918006 m!851715))

(assert (=> b!918006 m!851715))

(declare-fun m!851717 () Bool)

(assert (=> b!918006 m!851717))

(declare-fun m!851719 () Bool)

(assert (=> b!918006 m!851719))

(declare-fun m!851721 () Bool)

(assert (=> b!918006 m!851721))

(declare-fun m!851723 () Bool)

(assert (=> b!918006 m!851723))

(declare-fun m!851725 () Bool)

(assert (=> b!918006 m!851725))

(assert (=> b!918006 m!851717))

(assert (=> b!918006 m!851723))

(declare-fun m!851727 () Bool)

(assert (=> b!918006 m!851727))

(declare-fun m!851729 () Bool)

(assert (=> b!918004 m!851729))

(declare-fun m!851731 () Bool)

(assert (=> b!918012 m!851731))

(declare-fun m!851733 () Bool)

(assert (=> start!78710 m!851733))

(declare-fun m!851735 () Bool)

(assert (=> start!78710 m!851735))

(declare-fun m!851737 () Bool)

(assert (=> start!78710 m!851737))

(declare-fun m!851739 () Bool)

(assert (=> b!918011 m!851739))

(declare-fun m!851741 () Bool)

(assert (=> b!918011 m!851741))

(check-sat (not b!918004) (not b_next!16923) (not b!918010) (not start!78710) (not b!918006) (not b!918013) (not mapNonEmpty!30903) (not b!918012) tp_is_empty!19431 b_and!27585 (not b_lambda!13425) (not b!918011) (not b!918007))
(check-sat b_and!27585 (not b_next!16923))
