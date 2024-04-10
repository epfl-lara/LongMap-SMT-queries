; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79202 () Bool)

(assert start!79202)

(declare-fun b_free!17415 () Bool)

(declare-fun b_next!17415 () Bool)

(assert (=> start!79202 (= b_free!17415 (not b_next!17415))))

(declare-fun tp!60686 () Bool)

(declare-fun b_and!28481 () Bool)

(assert (=> start!79202 (= tp!60686 b_and!28481)))

(declare-fun b!929863 () Bool)

(declare-fun res!626191 () Bool)

(declare-fun e!522160 () Bool)

(assert (=> b!929863 (=> (not res!626191) (not e!522160))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31529 0))(
  ( (V!31530 (val!10012 Int)) )
))
(declare-fun v!791 () V!31529)

(declare-datatypes ((tuple2!13094 0))(
  ( (tuple2!13095 (_1!6558 (_ BitVec 64)) (_2!6558 V!31529)) )
))
(declare-datatypes ((List!18887 0))(
  ( (Nil!18884) (Cons!18883 (h!20029 tuple2!13094) (t!26944 List!18887)) )
))
(declare-datatypes ((ListLongMap!11791 0))(
  ( (ListLongMap!11792 (toList!5911 List!18887)) )
))
(declare-fun lt!419142 () ListLongMap!11791)

(declare-fun apply!734 (ListLongMap!11791 (_ BitVec 64)) V!31529)

(assert (=> b!929863 (= res!626191 (= (apply!734 lt!419142 k0!1099) v!791))))

(declare-fun b!929864 () Bool)

(declare-fun res!626196 () Bool)

(assert (=> b!929864 (=> (not res!626196) (not e!522160))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929864 (= res!626196 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929865 () Bool)

(declare-fun e!522158 () Bool)

(declare-fun tp_is_empty!19923 () Bool)

(assert (=> b!929865 (= e!522158 tp_is_empty!19923)))

(declare-fun b!929866 () Bool)

(declare-fun res!626193 () Bool)

(declare-fun e!522162 () Bool)

(assert (=> b!929866 (=> (not res!626193) (not e!522162))))

(declare-datatypes ((array!55796 0))(
  ( (array!55797 (arr!26843 (Array (_ BitVec 32) (_ BitVec 64))) (size!27302 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55796)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9480 0))(
  ( (ValueCellFull!9480 (v!12530 V!31529)) (EmptyCell!9480) )
))
(declare-datatypes ((array!55798 0))(
  ( (array!55799 (arr!26844 (Array (_ BitVec 32) ValueCell!9480)) (size!27303 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55798)

(assert (=> b!929866 (= res!626193 (and (= (size!27303 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27302 _keys!1487) (size!27303 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929867 () Bool)

(declare-fun res!626192 () Bool)

(assert (=> b!929867 (=> (not res!626192) (not e!522162))))

(assert (=> b!929867 (= res!626192 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27302 _keys!1487))))))

(declare-fun b!929868 () Bool)

(declare-fun e!522161 () Bool)

(assert (=> b!929868 (= e!522161 tp_is_empty!19923)))

(declare-fun b!929869 () Bool)

(declare-fun res!626195 () Bool)

(assert (=> b!929869 (=> (not res!626195) (not e!522162))))

(declare-datatypes ((List!18888 0))(
  ( (Nil!18885) (Cons!18884 (h!20030 (_ BitVec 64)) (t!26945 List!18888)) )
))
(declare-fun arrayNoDuplicates!0 (array!55796 (_ BitVec 32) List!18888) Bool)

(assert (=> b!929869 (= res!626195 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18885))))

(declare-fun b!929870 () Bool)

(assert (=> b!929870 (= e!522160 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!419143 () Bool)

(declare-fun zeroValue!1173 () V!31529)

(declare-fun minValue!1173 () V!31529)

(declare-fun contains!4963 (ListLongMap!11791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3154 (array!55796 array!55798 (_ BitVec 32) (_ BitVec 32) V!31529 V!31529 (_ BitVec 32) Int) ListLongMap!11791)

(assert (=> b!929870 (= lt!419143 (contains!4963 (getCurrentListMap!3154 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929871 () Bool)

(declare-fun e!522159 () Bool)

(declare-fun mapRes!31641 () Bool)

(assert (=> b!929871 (= e!522159 (and e!522158 mapRes!31641))))

(declare-fun condMapEmpty!31641 () Bool)

(declare-fun mapDefault!31641 () ValueCell!9480)

(assert (=> b!929871 (= condMapEmpty!31641 (= (arr!26844 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9480)) mapDefault!31641)))))

(declare-fun b!929872 () Bool)

(declare-fun res!626194 () Bool)

(assert (=> b!929872 (=> (not res!626194) (not e!522162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55796 (_ BitVec 32)) Bool)

(assert (=> b!929872 (= res!626194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31641 () Bool)

(declare-fun tp!60685 () Bool)

(assert (=> mapNonEmpty!31641 (= mapRes!31641 (and tp!60685 e!522161))))

(declare-fun mapRest!31641 () (Array (_ BitVec 32) ValueCell!9480))

(declare-fun mapValue!31641 () ValueCell!9480)

(declare-fun mapKey!31641 () (_ BitVec 32))

(assert (=> mapNonEmpty!31641 (= (arr!26844 _values!1231) (store mapRest!31641 mapKey!31641 mapValue!31641))))

(declare-fun b!929873 () Bool)

(assert (=> b!929873 (= e!522162 e!522160)))

(declare-fun res!626190 () Bool)

(assert (=> b!929873 (=> (not res!626190) (not e!522160))))

(assert (=> b!929873 (= res!626190 (contains!4963 lt!419142 k0!1099))))

(assert (=> b!929873 (= lt!419142 (getCurrentListMap!3154 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31641 () Bool)

(assert (=> mapIsEmpty!31641 mapRes!31641))

(declare-fun res!626197 () Bool)

(assert (=> start!79202 (=> (not res!626197) (not e!522162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79202 (= res!626197 (validMask!0 mask!1881))))

(assert (=> start!79202 e!522162))

(assert (=> start!79202 true))

(assert (=> start!79202 tp_is_empty!19923))

(declare-fun array_inv!20886 (array!55798) Bool)

(assert (=> start!79202 (and (array_inv!20886 _values!1231) e!522159)))

(assert (=> start!79202 tp!60686))

(declare-fun array_inv!20887 (array!55796) Bool)

(assert (=> start!79202 (array_inv!20887 _keys!1487)))

(assert (= (and start!79202 res!626197) b!929866))

(assert (= (and b!929866 res!626193) b!929872))

(assert (= (and b!929872 res!626194) b!929869))

(assert (= (and b!929869 res!626195) b!929867))

(assert (= (and b!929867 res!626192) b!929873))

(assert (= (and b!929873 res!626190) b!929863))

(assert (= (and b!929863 res!626191) b!929864))

(assert (= (and b!929864 res!626196) b!929870))

(assert (= (and b!929871 condMapEmpty!31641) mapIsEmpty!31641))

(assert (= (and b!929871 (not condMapEmpty!31641)) mapNonEmpty!31641))

(get-info :version)

(assert (= (and mapNonEmpty!31641 ((_ is ValueCellFull!9480) mapValue!31641)) b!929868))

(assert (= (and b!929871 ((_ is ValueCellFull!9480) mapDefault!31641)) b!929865))

(assert (= start!79202 b!929871))

(declare-fun m!864283 () Bool)

(assert (=> b!929872 m!864283))

(declare-fun m!864285 () Bool)

(assert (=> b!929863 m!864285))

(declare-fun m!864287 () Bool)

(assert (=> b!929873 m!864287))

(declare-fun m!864289 () Bool)

(assert (=> b!929873 m!864289))

(declare-fun m!864291 () Bool)

(assert (=> b!929870 m!864291))

(assert (=> b!929870 m!864291))

(declare-fun m!864293 () Bool)

(assert (=> b!929870 m!864293))

(declare-fun m!864295 () Bool)

(assert (=> mapNonEmpty!31641 m!864295))

(declare-fun m!864297 () Bool)

(assert (=> b!929869 m!864297))

(declare-fun m!864299 () Bool)

(assert (=> start!79202 m!864299))

(declare-fun m!864301 () Bool)

(assert (=> start!79202 m!864301))

(declare-fun m!864303 () Bool)

(assert (=> start!79202 m!864303))

(check-sat tp_is_empty!19923 (not b!929863) (not b_next!17415) (not b!929872) (not b!929870) (not mapNonEmpty!31641) b_and!28481 (not b!929873) (not b!929869) (not start!79202))
(check-sat b_and!28481 (not b_next!17415))
