; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79292 () Bool)

(assert start!79292)

(declare-fun b_free!17505 () Bool)

(declare-fun b_next!17505 () Bool)

(assert (=> start!79292 (= b_free!17505 (not b_next!17505))))

(declare-fun tp!60956 () Bool)

(declare-fun b_and!28571 () Bool)

(assert (=> start!79292 (= tp!60956 b_and!28571)))

(declare-fun b!931214 () Bool)

(declare-fun e!522969 () Bool)

(declare-fun e!522972 () Bool)

(declare-fun mapRes!31776 () Bool)

(assert (=> b!931214 (= e!522969 (and e!522972 mapRes!31776))))

(declare-fun condMapEmpty!31776 () Bool)

(declare-datatypes ((V!31649 0))(
  ( (V!31650 (val!10057 Int)) )
))
(declare-datatypes ((ValueCell!9525 0))(
  ( (ValueCellFull!9525 (v!12575 V!31649)) (EmptyCell!9525) )
))
(declare-datatypes ((array!55966 0))(
  ( (array!55967 (arr!26928 (Array (_ BitVec 32) ValueCell!9525)) (size!27387 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55966)

(declare-fun mapDefault!31776 () ValueCell!9525)

(assert (=> b!931214 (= condMapEmpty!31776 (= (arr!26928 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9525)) mapDefault!31776)))))

(declare-fun mapNonEmpty!31776 () Bool)

(declare-fun tp!60955 () Bool)

(declare-fun e!522970 () Bool)

(assert (=> mapNonEmpty!31776 (= mapRes!31776 (and tp!60955 e!522970))))

(declare-fun mapValue!31776 () ValueCell!9525)

(declare-fun mapRest!31776 () (Array (_ BitVec 32) ValueCell!9525))

(declare-fun mapKey!31776 () (_ BitVec 32))

(assert (=> mapNonEmpty!31776 (= (arr!26928 _values!1231) (store mapRest!31776 mapKey!31776 mapValue!31776))))

(declare-fun res!627143 () Bool)

(declare-fun e!522973 () Bool)

(assert (=> start!79292 (=> (not res!627143) (not e!522973))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79292 (= res!627143 (validMask!0 mask!1881))))

(assert (=> start!79292 e!522973))

(assert (=> start!79292 true))

(declare-fun tp_is_empty!20013 () Bool)

(assert (=> start!79292 tp_is_empty!20013))

(declare-fun array_inv!20960 (array!55966) Bool)

(assert (=> start!79292 (and (array_inv!20960 _values!1231) e!522969)))

(assert (=> start!79292 tp!60956))

(declare-datatypes ((array!55968 0))(
  ( (array!55969 (arr!26929 (Array (_ BitVec 32) (_ BitVec 64))) (size!27388 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55968)

(declare-fun array_inv!20961 (array!55968) Bool)

(assert (=> start!79292 (array_inv!20961 _keys!1487)))

(declare-fun b!931215 () Bool)

(declare-fun e!522968 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931215 (= e!522968 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27388 _keys!1487)))))

(declare-fun b!931216 () Bool)

(assert (=> b!931216 (= e!522970 tp_is_empty!20013)))

(declare-fun b!931217 () Bool)

(assert (=> b!931217 (= e!522972 tp_is_empty!20013)))

(declare-fun b!931218 () Bool)

(assert (=> b!931218 (= e!522973 e!522968)))

(declare-fun res!627136 () Bool)

(assert (=> b!931218 (=> (not res!627136) (not e!522968))))

(declare-datatypes ((tuple2!13172 0))(
  ( (tuple2!13173 (_1!6597 (_ BitVec 64)) (_2!6597 V!31649)) )
))
(declare-datatypes ((List!18957 0))(
  ( (Nil!18954) (Cons!18953 (h!20099 tuple2!13172) (t!27014 List!18957)) )
))
(declare-datatypes ((ListLongMap!11869 0))(
  ( (ListLongMap!11870 (toList!5950 List!18957)) )
))
(declare-fun lt!419389 () ListLongMap!11869)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4997 (ListLongMap!11869 (_ BitVec 64)) Bool)

(assert (=> b!931218 (= res!627136 (contains!4997 lt!419389 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31649)

(declare-fun minValue!1173 () V!31649)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3188 (array!55968 array!55966 (_ BitVec 32) (_ BitVec 32) V!31649 V!31649 (_ BitVec 32) Int) ListLongMap!11869)

(assert (=> b!931218 (= lt!419389 (getCurrentListMap!3188 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931219 () Bool)

(declare-fun res!627137 () Bool)

(assert (=> b!931219 (=> (not res!627137) (not e!522973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55968 (_ BitVec 32)) Bool)

(assert (=> b!931219 (= res!627137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931220 () Bool)

(declare-fun res!627142 () Bool)

(assert (=> b!931220 (=> (not res!627142) (not e!522968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931220 (= res!627142 (validKeyInArray!0 (select (arr!26929 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!931221 () Bool)

(declare-fun res!627139 () Bool)

(assert (=> b!931221 (=> (not res!627139) (not e!522973))))

(declare-datatypes ((List!18958 0))(
  ( (Nil!18955) (Cons!18954 (h!20100 (_ BitVec 64)) (t!27015 List!18958)) )
))
(declare-fun arrayNoDuplicates!0 (array!55968 (_ BitVec 32) List!18958) Bool)

(assert (=> b!931221 (= res!627139 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18955))))

(declare-fun b!931222 () Bool)

(declare-fun res!627141 () Bool)

(assert (=> b!931222 (=> (not res!627141) (not e!522968))))

(assert (=> b!931222 (= res!627141 (validKeyInArray!0 k0!1099))))

(declare-fun b!931223 () Bool)

(declare-fun res!627140 () Bool)

(assert (=> b!931223 (=> (not res!627140) (not e!522968))))

(declare-fun v!791 () V!31649)

(declare-fun apply!770 (ListLongMap!11869 (_ BitVec 64)) V!31649)

(assert (=> b!931223 (= res!627140 (= (apply!770 lt!419389 k0!1099) v!791))))

(declare-fun mapIsEmpty!31776 () Bool)

(assert (=> mapIsEmpty!31776 mapRes!31776))

(declare-fun b!931224 () Bool)

(declare-fun res!627145 () Bool)

(assert (=> b!931224 (=> (not res!627145) (not e!522973))))

(assert (=> b!931224 (= res!627145 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27388 _keys!1487))))))

(declare-fun b!931225 () Bool)

(declare-fun res!627144 () Bool)

(assert (=> b!931225 (=> (not res!627144) (not e!522973))))

(assert (=> b!931225 (= res!627144 (and (= (size!27387 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27388 _keys!1487) (size!27387 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931226 () Bool)

(declare-fun res!627138 () Bool)

(assert (=> b!931226 (=> (not res!627138) (not e!522968))))

(assert (=> b!931226 (= res!627138 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!79292 res!627143) b!931225))

(assert (= (and b!931225 res!627144) b!931219))

(assert (= (and b!931219 res!627137) b!931221))

(assert (= (and b!931221 res!627139) b!931224))

(assert (= (and b!931224 res!627145) b!931218))

(assert (= (and b!931218 res!627136) b!931223))

(assert (= (and b!931223 res!627140) b!931226))

(assert (= (and b!931226 res!627138) b!931222))

(assert (= (and b!931222 res!627141) b!931220))

(assert (= (and b!931220 res!627142) b!931215))

(assert (= (and b!931214 condMapEmpty!31776) mapIsEmpty!31776))

(assert (= (and b!931214 (not condMapEmpty!31776)) mapNonEmpty!31776))

(get-info :version)

(assert (= (and mapNonEmpty!31776 ((_ is ValueCellFull!9525) mapValue!31776)) b!931216))

(assert (= (and b!931214 ((_ is ValueCellFull!9525) mapDefault!31776)) b!931217))

(assert (= start!79292 b!931214))

(declare-fun m!865161 () Bool)

(assert (=> mapNonEmpty!31776 m!865161))

(declare-fun m!865163 () Bool)

(assert (=> b!931219 m!865163))

(declare-fun m!865165 () Bool)

(assert (=> start!79292 m!865165))

(declare-fun m!865167 () Bool)

(assert (=> start!79292 m!865167))

(declare-fun m!865169 () Bool)

(assert (=> start!79292 m!865169))

(declare-fun m!865171 () Bool)

(assert (=> b!931218 m!865171))

(declare-fun m!865173 () Bool)

(assert (=> b!931218 m!865173))

(declare-fun m!865175 () Bool)

(assert (=> b!931222 m!865175))

(declare-fun m!865177 () Bool)

(assert (=> b!931223 m!865177))

(declare-fun m!865179 () Bool)

(assert (=> b!931220 m!865179))

(assert (=> b!931220 m!865179))

(declare-fun m!865181 () Bool)

(assert (=> b!931220 m!865181))

(declare-fun m!865183 () Bool)

(assert (=> b!931221 m!865183))

(check-sat (not b!931218) (not mapNonEmpty!31776) (not b!931220) (not b!931223) (not b!931222) tp_is_empty!20013 (not start!79292) (not b!931221) (not b_next!17505) (not b!931219) b_and!28571)
(check-sat b_and!28571 (not b_next!17505))
