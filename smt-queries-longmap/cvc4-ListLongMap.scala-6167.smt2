; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79114 () Bool)

(assert start!79114)

(declare-fun b_free!17327 () Bool)

(declare-fun b_next!17327 () Bool)

(assert (=> start!79114 (= b_free!17327 (not b_next!17327))))

(declare-fun tp!60422 () Bool)

(declare-fun b_and!28391 () Bool)

(assert (=> start!79114 (= tp!60422 b_and!28391)))

(declare-fun b!928553 () Bool)

(declare-fun e!521369 () Bool)

(declare-fun e!521363 () Bool)

(assert (=> b!928553 (= e!521369 e!521363)))

(declare-fun res!625294 () Bool)

(assert (=> b!928553 (=> (not res!625294) (not e!521363))))

(declare-datatypes ((V!31411 0))(
  ( (V!31412 (val!9968 Int)) )
))
(declare-datatypes ((tuple2!13024 0))(
  ( (tuple2!13025 (_1!6523 (_ BitVec 64)) (_2!6523 V!31411)) )
))
(declare-datatypes ((List!18822 0))(
  ( (Nil!18819) (Cons!18818 (h!19964 tuple2!13024) (t!26879 List!18822)) )
))
(declare-datatypes ((ListLongMap!11721 0))(
  ( (ListLongMap!11722 (toList!5876 List!18822)) )
))
(declare-fun lt!418879 () ListLongMap!11721)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4933 (ListLongMap!11721 (_ BitVec 64)) Bool)

(assert (=> b!928553 (= res!625294 (contains!4933 lt!418879 k!1099))))

(declare-datatypes ((array!55630 0))(
  ( (array!55631 (arr!26760 (Array (_ BitVec 32) (_ BitVec 64))) (size!27219 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55630)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9436 0))(
  ( (ValueCellFull!9436 (v!12486 V!31411)) (EmptyCell!9436) )
))
(declare-datatypes ((array!55632 0))(
  ( (array!55633 (arr!26761 (Array (_ BitVec 32) ValueCell!9436)) (size!27220 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55632)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31411)

(declare-fun minValue!1173 () V!31411)

(declare-fun getCurrentListMap!3124 (array!55630 array!55632 (_ BitVec 32) (_ BitVec 32) V!31411 V!31411 (_ BitVec 32) Int) ListLongMap!11721)

(assert (=> b!928553 (= lt!418879 (getCurrentListMap!3124 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928555 () Bool)

(declare-fun res!625285 () Bool)

(declare-fun e!521361 () Bool)

(assert (=> b!928555 (=> (not res!625285) (not e!521361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55630 (_ BitVec 32)) Bool)

(assert (=> b!928555 (= res!625285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928556 () Bool)

(declare-fun res!625291 () Bool)

(assert (=> b!928556 (=> (not res!625291) (not e!521363))))

(declare-fun v!791 () V!31411)

(declare-fun apply!706 (ListLongMap!11721 (_ BitVec 64)) V!31411)

(assert (=> b!928556 (= res!625291 (= (apply!706 lt!418879 k!1099) v!791))))

(declare-fun b!928557 () Bool)

(declare-fun e!521359 () Bool)

(assert (=> b!928557 (= e!521361 e!521359)))

(declare-fun res!625288 () Bool)

(assert (=> b!928557 (=> (not res!625288) (not e!521359))))

(declare-fun lt!418873 () ListLongMap!11721)

(assert (=> b!928557 (= res!625288 (contains!4933 lt!418873 k!1099))))

(assert (=> b!928557 (= lt!418873 (getCurrentListMap!3124 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928558 () Bool)

(assert (=> b!928558 (= e!521363 (not true))))

(declare-fun e!521360 () Bool)

(assert (=> b!928558 e!521360))

(declare-fun res!625292 () Bool)

(assert (=> b!928558 (=> (not res!625292) (not e!521360))))

(declare-fun lt!418881 () ListLongMap!11721)

(assert (=> b!928558 (= res!625292 (contains!4933 lt!418881 k!1099))))

(assert (=> b!928558 (= lt!418881 (getCurrentListMap!3124 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-datatypes ((Unit!31429 0))(
  ( (Unit!31430) )
))
(declare-fun lt!418876 () Unit!31429)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!103 (array!55630 array!55632 (_ BitVec 32) (_ BitVec 32) V!31411 V!31411 (_ BitVec 64) V!31411 (_ BitVec 32) Int) Unit!31429)

(assert (=> b!928558 (= lt!418876 (lemmaListMapApplyFromThenApplyFromZero!103 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928559 () Bool)

(declare-fun res!625287 () Bool)

(assert (=> b!928559 (=> (not res!625287) (not e!521361))))

(declare-datatypes ((List!18823 0))(
  ( (Nil!18820) (Cons!18819 (h!19965 (_ BitVec 64)) (t!26880 List!18823)) )
))
(declare-fun arrayNoDuplicates!0 (array!55630 (_ BitVec 32) List!18823) Bool)

(assert (=> b!928559 (= res!625287 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18820))))

(declare-fun b!928560 () Bool)

(declare-fun e!521371 () Bool)

(declare-fun arrayContainsKey!0 (array!55630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928560 (= e!521371 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun mapNonEmpty!31509 () Bool)

(declare-fun mapRes!31509 () Bool)

(declare-fun tp!60421 () Bool)

(declare-fun e!521368 () Bool)

(assert (=> mapNonEmpty!31509 (= mapRes!31509 (and tp!60421 e!521368))))

(declare-fun mapKey!31509 () (_ BitVec 32))

(declare-fun mapValue!31509 () ValueCell!9436)

(declare-fun mapRest!31509 () (Array (_ BitVec 32) ValueCell!9436))

(assert (=> mapNonEmpty!31509 (= (arr!26761 _values!1231) (store mapRest!31509 mapKey!31509 mapValue!31509))))

(declare-fun b!928561 () Bool)

(declare-fun res!625293 () Bool)

(assert (=> b!928561 (=> (not res!625293) (not e!521361))))

(assert (=> b!928561 (= res!625293 (and (= (size!27220 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27219 _keys!1487) (size!27220 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928562 () Bool)

(declare-fun e!521362 () Unit!31429)

(declare-fun Unit!31431 () Unit!31429)

(assert (=> b!928562 (= e!521362 Unit!31431)))

(declare-fun b!928563 () Bool)

(declare-fun e!521370 () Bool)

(declare-fun e!521364 () Bool)

(assert (=> b!928563 (= e!521370 (and e!521364 mapRes!31509))))

(declare-fun condMapEmpty!31509 () Bool)

(declare-fun mapDefault!31509 () ValueCell!9436)

