; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79110 () Bool)

(assert start!79110)

(declare-fun b_free!17323 () Bool)

(declare-fun b_next!17323 () Bool)

(assert (=> start!79110 (= b_free!17323 (not b_next!17323))))

(declare-fun tp!60409 () Bool)

(declare-fun b_and!28383 () Bool)

(assert (=> start!79110 (= tp!60409 b_and!28383)))

(declare-fun b!928429 () Bool)

(declare-fun res!625228 () Bool)

(declare-fun e!521290 () Bool)

(assert (=> b!928429 (=> (not res!625228) (not e!521290))))

(declare-datatypes ((array!55622 0))(
  ( (array!55623 (arr!26756 (Array (_ BitVec 32) (_ BitVec 64))) (size!27215 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55622)

(declare-datatypes ((List!18818 0))(
  ( (Nil!18815) (Cons!18814 (h!19960 (_ BitVec 64)) (t!26871 List!18818)) )
))
(declare-fun arrayNoDuplicates!0 (array!55622 (_ BitVec 32) List!18818) Bool)

(assert (=> b!928429 (= res!625228 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18815))))

(declare-fun b!928430 () Bool)

(declare-fun e!521282 () Bool)

(declare-fun tp_is_empty!19831 () Bool)

(assert (=> b!928430 (= e!521282 tp_is_empty!19831)))

(declare-fun b!928431 () Bool)

(declare-fun e!521293 () Bool)

(assert (=> b!928431 (= e!521293 tp_is_empty!19831)))

(declare-fun b!928432 () Bool)

(declare-fun res!625220 () Bool)

(assert (=> b!928432 (=> (not res!625220) (not e!521290))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928432 (= res!625220 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27215 _keys!1487))))))

(declare-fun b!928433 () Bool)

(declare-fun res!625226 () Bool)

(assert (=> b!928433 (=> (not res!625226) (not e!521290))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31407 0))(
  ( (V!31408 (val!9966 Int)) )
))
(declare-datatypes ((ValueCell!9434 0))(
  ( (ValueCellFull!9434 (v!12484 V!31407)) (EmptyCell!9434) )
))
(declare-datatypes ((array!55624 0))(
  ( (array!55625 (arr!26757 (Array (_ BitVec 32) ValueCell!9434)) (size!27216 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55624)

(assert (=> b!928433 (= res!625226 (and (= (size!27216 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27215 _keys!1487) (size!27216 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31407)

(declare-datatypes ((tuple2!13020 0))(
  ( (tuple2!13021 (_1!6521 (_ BitVec 64)) (_2!6521 V!31407)) )
))
(declare-datatypes ((List!18819 0))(
  ( (Nil!18816) (Cons!18815 (h!19961 tuple2!13020) (t!26872 List!18819)) )
))
(declare-datatypes ((ListLongMap!11717 0))(
  ( (ListLongMap!11718 (toList!5874 List!18819)) )
))
(declare-fun lt!418780 () ListLongMap!11717)

(declare-fun e!521287 () Bool)

(declare-fun b!928434 () Bool)

(declare-fun apply!704 (ListLongMap!11717 (_ BitVec 64)) V!31407)

(assert (=> b!928434 (= e!521287 (= (apply!704 lt!418780 k!1099) v!791))))

(declare-fun b!928435 () Bool)

(declare-fun e!521292 () Bool)

(declare-fun e!521285 () Bool)

(assert (=> b!928435 (= e!521292 e!521285)))

(declare-fun res!625227 () Bool)

(assert (=> b!928435 (=> (not res!625227) (not e!521285))))

(assert (=> b!928435 (= res!625227 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27215 _keys!1487)))))

(declare-datatypes ((Unit!31423 0))(
  ( (Unit!31424) )
))
(declare-fun lt!418782 () Unit!31423)

(declare-fun e!521284 () Unit!31423)

(assert (=> b!928435 (= lt!418782 e!521284)))

(declare-fun c!97014 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928435 (= c!97014 (validKeyInArray!0 k!1099))))

(declare-fun b!928436 () Bool)

(declare-fun e!521286 () Bool)

(assert (=> b!928436 (= e!521286 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928437 () Bool)

(declare-fun res!625222 () Bool)

(assert (=> b!928437 (=> (not res!625222) (not e!521290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55622 (_ BitVec 32)) Bool)

(assert (=> b!928437 (= res!625222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928438 () Bool)

(declare-fun res!625221 () Bool)

(declare-fun e!521288 () Bool)

(assert (=> b!928438 (=> (not res!625221) (not e!521288))))

(declare-fun lt!418790 () ListLongMap!11717)

(assert (=> b!928438 (= res!625221 (= (apply!704 lt!418790 k!1099) v!791))))

(declare-fun b!928439 () Bool)

(assert (=> b!928439 (= e!521288 (not true))))

(assert (=> b!928439 e!521287))

(declare-fun res!625225 () Bool)

(assert (=> b!928439 (=> (not res!625225) (not e!521287))))

(declare-fun contains!4931 (ListLongMap!11717 (_ BitVec 64)) Bool)

(assert (=> b!928439 (= res!625225 (contains!4931 lt!418780 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31407)

(declare-fun minValue!1173 () V!31407)

(declare-fun getCurrentListMap!3122 (array!55622 array!55624 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 32) Int) ListLongMap!11717)

(assert (=> b!928439 (= lt!418780 (getCurrentListMap!3122 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418781 () Unit!31423)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!101 (array!55622 array!55624 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 64) V!31407 (_ BitVec 32) Int) Unit!31423)

(assert (=> b!928439 (= lt!418781 (lemmaListMapApplyFromThenApplyFromZero!101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928440 () Bool)

(declare-fun e!521289 () Bool)

(assert (=> b!928440 (= e!521290 e!521289)))

(declare-fun res!625224 () Bool)

(assert (=> b!928440 (=> (not res!625224) (not e!521289))))

(declare-fun lt!418785 () ListLongMap!11717)

(assert (=> b!928440 (= res!625224 (contains!4931 lt!418785 k!1099))))

(assert (=> b!928440 (= lt!418785 (getCurrentListMap!3122 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928441 () Bool)

(declare-fun e!521291 () Bool)

(declare-fun mapRes!31503 () Bool)

(assert (=> b!928441 (= e!521291 (and e!521282 mapRes!31503))))

(declare-fun condMapEmpty!31503 () Bool)

(declare-fun mapDefault!31503 () ValueCell!9434)

