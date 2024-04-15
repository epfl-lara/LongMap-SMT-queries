; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78696 () Bool)

(assert start!78696)

(declare-fun b_free!16927 () Bool)

(declare-fun b_next!16927 () Bool)

(assert (=> start!78696 (= b_free!16927 (not b_next!16927))))

(declare-fun tp!59222 () Bool)

(declare-fun b_and!27565 () Bool)

(assert (=> start!78696 (= tp!59222 b_and!27565)))

(declare-fun mapNonEmpty!30909 () Bool)

(declare-fun mapRes!30909 () Bool)

(declare-fun tp!59223 () Bool)

(declare-fun e!515246 () Bool)

(assert (=> mapNonEmpty!30909 (= mapRes!30909 (and tp!59223 e!515246))))

(declare-datatypes ((V!30879 0))(
  ( (V!30880 (val!9768 Int)) )
))
(declare-datatypes ((ValueCell!9236 0))(
  ( (ValueCellFull!9236 (v!12285 V!30879)) (EmptyCell!9236) )
))
(declare-datatypes ((array!54839 0))(
  ( (array!54840 (arr!26365 (Array (_ BitVec 32) ValueCell!9236)) (size!26826 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54839)

(declare-fun mapKey!30909 () (_ BitVec 32))

(declare-fun mapValue!30909 () ValueCell!9236)

(declare-fun mapRest!30909 () (Array (_ BitVec 32) ValueCell!9236))

(assert (=> mapNonEmpty!30909 (= (arr!26365 _values!1231) (store mapRest!30909 mapKey!30909 mapValue!30909))))

(declare-fun b!917844 () Bool)

(declare-fun e!515249 () Bool)

(declare-fun e!515247 () Bool)

(assert (=> b!917844 (= e!515249 (and e!515247 mapRes!30909))))

(declare-fun condMapEmpty!30909 () Bool)

(declare-fun mapDefault!30909 () ValueCell!9236)

(assert (=> b!917844 (= condMapEmpty!30909 (= (arr!26365 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9236)) mapDefault!30909)))))

(declare-fun b!917845 () Bool)

(declare-fun e!515248 () Bool)

(declare-fun e!515244 () Bool)

(assert (=> b!917845 (= e!515248 e!515244)))

(declare-fun res!618863 () Bool)

(assert (=> b!917845 (=> (not res!618863) (not e!515244))))

(declare-datatypes ((tuple2!12734 0))(
  ( (tuple2!12735 (_1!6378 (_ BitVec 64)) (_2!6378 V!30879)) )
))
(declare-datatypes ((List!18523 0))(
  ( (Nil!18520) (Cons!18519 (h!19665 tuple2!12734) (t!26171 List!18523)) )
))
(declare-datatypes ((ListLongMap!11421 0))(
  ( (ListLongMap!11422 (toList!5726 List!18523)) )
))
(declare-fun lt!411920 () ListLongMap!11421)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4727 (ListLongMap!11421 (_ BitVec 64)) Bool)

(assert (=> b!917845 (= res!618863 (contains!4727 lt!411920 k0!1099))))

(declare-datatypes ((array!54841 0))(
  ( (array!54842 (arr!26366 (Array (_ BitVec 32) (_ BitVec 64))) (size!26827 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54841)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30879)

(declare-fun minValue!1173 () V!30879)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2919 (array!54841 array!54839 (_ BitVec 32) (_ BitVec 32) V!30879 V!30879 (_ BitVec 32) Int) ListLongMap!11421)

(assert (=> b!917845 (= lt!411920 (getCurrentListMap!2919 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917846 () Bool)

(declare-fun res!618861 () Bool)

(assert (=> b!917846 (=> (not res!618861) (not e!515248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54841 (_ BitVec 32)) Bool)

(assert (=> b!917846 (= res!618861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917847 () Bool)

(declare-fun res!618866 () Bool)

(assert (=> b!917847 (=> (not res!618866) (not e!515248))))

(assert (=> b!917847 (= res!618866 (and (= (size!26826 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26827 _keys!1487) (size!26826 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917848 () Bool)

(declare-fun e!515245 () Bool)

(assert (=> b!917848 (= e!515244 e!515245)))

(declare-fun res!618868 () Bool)

(assert (=> b!917848 (=> (not res!618868) (not e!515245))))

(declare-fun lt!411918 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917848 (= res!618868 (validKeyInArray!0 lt!411918))))

(assert (=> b!917848 (= lt!411918 (select (arr!26366 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!618862 () Bool)

(assert (=> start!78696 (=> (not res!618862) (not e!515248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78696 (= res!618862 (validMask!0 mask!1881))))

(assert (=> start!78696 e!515248))

(assert (=> start!78696 true))

(declare-fun tp_is_empty!19435 () Bool)

(assert (=> start!78696 tp_is_empty!19435))

(declare-fun array_inv!20634 (array!54839) Bool)

(assert (=> start!78696 (and (array_inv!20634 _values!1231) e!515249)))

(assert (=> start!78696 tp!59222))

(declare-fun array_inv!20635 (array!54841) Bool)

(assert (=> start!78696 (array_inv!20635 _keys!1487)))

(declare-fun b!917849 () Bool)

(assert (=> b!917849 (= e!515247 tp_is_empty!19435)))

(declare-fun b!917850 () Bool)

(declare-fun res!618864 () Bool)

(assert (=> b!917850 (=> (not res!618864) (not e!515248))))

(declare-datatypes ((List!18524 0))(
  ( (Nil!18521) (Cons!18520 (h!19666 (_ BitVec 64)) (t!26172 List!18524)) )
))
(declare-fun arrayNoDuplicates!0 (array!54841 (_ BitVec 32) List!18524) Bool)

(assert (=> b!917850 (= res!618864 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18521))))

(declare-fun b!917851 () Bool)

(assert (=> b!917851 (= e!515246 tp_is_empty!19435)))

(declare-fun b!917852 () Bool)

(declare-fun res!618869 () Bool)

(assert (=> b!917852 (=> (not res!618869) (not e!515244))))

(declare-fun v!791 () V!30879)

(declare-fun apply!562 (ListLongMap!11421 (_ BitVec 64)) V!30879)

(assert (=> b!917852 (= res!618869 (= (apply!562 lt!411920 k0!1099) v!791))))

(declare-fun b!917853 () Bool)

(declare-fun res!618867 () Bool)

(assert (=> b!917853 (=> (not res!618867) (not e!515248))))

(assert (=> b!917853 (= res!618867 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26827 _keys!1487))))))

(declare-fun b!917854 () Bool)

(declare-fun res!618860 () Bool)

(assert (=> b!917854 (=> (not res!618860) (not e!515244))))

(assert (=> b!917854 (= res!618860 (validKeyInArray!0 k0!1099))))

(declare-fun b!917855 () Bool)

(declare-fun res!618865 () Bool)

(assert (=> b!917855 (=> (not res!618865) (not e!515244))))

(assert (=> b!917855 (= res!618865 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!30909 () Bool)

(assert (=> mapIsEmpty!30909 mapRes!30909))

(declare-fun b!917856 () Bool)

(assert (=> b!917856 (= e!515245 (not true))))

(declare-fun +!2650 (ListLongMap!11421 tuple2!12734) ListLongMap!11421)

(declare-fun get!13821 (ValueCell!9236 V!30879) V!30879)

(declare-fun dynLambda!1406 (Int (_ BitVec 64)) V!30879)

(assert (=> b!917856 (= (getCurrentListMap!2919 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2650 (getCurrentListMap!2919 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12735 lt!411918 (get!13821 (select (arr!26365 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1406 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30912 0))(
  ( (Unit!30913) )
))
(declare-fun lt!411919 () Unit!30912)

(declare-fun lemmaListMapRecursiveValidKeyArray!14 (array!54841 array!54839 (_ BitVec 32) (_ BitVec 32) V!30879 V!30879 (_ BitVec 32) Int) Unit!30912)

(assert (=> b!917856 (= lt!411919 (lemmaListMapRecursiveValidKeyArray!14 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78696 res!618862) b!917847))

(assert (= (and b!917847 res!618866) b!917846))

(assert (= (and b!917846 res!618861) b!917850))

(assert (= (and b!917850 res!618864) b!917853))

(assert (= (and b!917853 res!618867) b!917845))

(assert (= (and b!917845 res!618863) b!917852))

(assert (= (and b!917852 res!618869) b!917855))

(assert (= (and b!917855 res!618865) b!917854))

(assert (= (and b!917854 res!618860) b!917848))

(assert (= (and b!917848 res!618868) b!917856))

(assert (= (and b!917844 condMapEmpty!30909) mapIsEmpty!30909))

(assert (= (and b!917844 (not condMapEmpty!30909)) mapNonEmpty!30909))

(get-info :version)

(assert (= (and mapNonEmpty!30909 ((_ is ValueCellFull!9236) mapValue!30909)) b!917851))

(assert (= (and b!917844 ((_ is ValueCellFull!9236) mapDefault!30909)) b!917849))

(assert (= start!78696 b!917844))

(declare-fun b_lambda!13411 () Bool)

(assert (=> (not b_lambda!13411) (not b!917856)))

(declare-fun t!26170 () Bool)

(declare-fun tb!5499 () Bool)

(assert (=> (and start!78696 (= defaultEntry!1235 defaultEntry!1235) t!26170) tb!5499))

(declare-fun result!10829 () Bool)

(assert (=> tb!5499 (= result!10829 tp_is_empty!19435)))

(assert (=> b!917856 t!26170))

(declare-fun b_and!27567 () Bool)

(assert (= b_and!27565 (and (=> t!26170 result!10829) b_and!27567)))

(declare-fun m!851023 () Bool)

(assert (=> mapNonEmpty!30909 m!851023))

(declare-fun m!851025 () Bool)

(assert (=> b!917846 m!851025))

(declare-fun m!851027 () Bool)

(assert (=> b!917854 m!851027))

(declare-fun m!851029 () Bool)

(assert (=> b!917850 m!851029))

(declare-fun m!851031 () Bool)

(assert (=> b!917845 m!851031))

(declare-fun m!851033 () Bool)

(assert (=> b!917845 m!851033))

(declare-fun m!851035 () Bool)

(assert (=> b!917856 m!851035))

(assert (=> b!917856 m!851035))

(declare-fun m!851037 () Bool)

(assert (=> b!917856 m!851037))

(declare-fun m!851039 () Bool)

(assert (=> b!917856 m!851039))

(declare-fun m!851041 () Bool)

(assert (=> b!917856 m!851041))

(declare-fun m!851043 () Bool)

(assert (=> b!917856 m!851043))

(declare-fun m!851045 () Bool)

(assert (=> b!917856 m!851045))

(assert (=> b!917856 m!851037))

(assert (=> b!917856 m!851043))

(declare-fun m!851047 () Bool)

(assert (=> b!917856 m!851047))

(declare-fun m!851049 () Bool)

(assert (=> b!917852 m!851049))

(declare-fun m!851051 () Bool)

(assert (=> start!78696 m!851051))

(declare-fun m!851053 () Bool)

(assert (=> start!78696 m!851053))

(declare-fun m!851055 () Bool)

(assert (=> start!78696 m!851055))

(declare-fun m!851057 () Bool)

(assert (=> b!917848 m!851057))

(declare-fun m!851059 () Bool)

(assert (=> b!917848 m!851059))

(check-sat (not b_lambda!13411) (not b!917854) (not b!917848) (not b!917852) (not mapNonEmpty!30909) (not b!917845) tp_is_empty!19435 (not b_next!16927) (not start!78696) (not b!917850) (not b!917856) (not b!917846) b_and!27567)
(check-sat b_and!27567 (not b_next!16927))
