; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79254 () Bool)

(assert start!79254)

(declare-fun b_free!17467 () Bool)

(declare-fun b_next!17467 () Bool)

(assert (=> start!79254 (= b_free!17467 (not b_next!17467))))

(declare-fun tp!60842 () Bool)

(declare-fun b_and!28533 () Bool)

(assert (=> start!79254 (= tp!60842 b_and!28533)))

(declare-fun b!930681 () Bool)

(declare-fun e!522630 () Bool)

(assert (=> b!930681 (= e!522630 false)))

(declare-datatypes ((V!31599 0))(
  ( (V!31600 (val!10038 Int)) )
))
(declare-fun lt!419281 () V!31599)

(declare-datatypes ((tuple2!13138 0))(
  ( (tuple2!13139 (_1!6580 (_ BitVec 64)) (_2!6580 V!31599)) )
))
(declare-datatypes ((List!18928 0))(
  ( (Nil!18925) (Cons!18924 (h!20070 tuple2!13138) (t!26985 List!18928)) )
))
(declare-datatypes ((ListLongMap!11835 0))(
  ( (ListLongMap!11836 (toList!5933 List!18928)) )
))
(declare-fun lt!419280 () ListLongMap!11835)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!755 (ListLongMap!11835 (_ BitVec 64)) V!31599)

(assert (=> b!930681 (= lt!419281 (apply!755 lt!419280 k!1099))))

(declare-fun b!930682 () Bool)

(declare-fun e!522626 () Bool)

(declare-fun tp_is_empty!19975 () Bool)

(assert (=> b!930682 (= e!522626 tp_is_empty!19975)))

(declare-fun mapNonEmpty!31719 () Bool)

(declare-fun mapRes!31719 () Bool)

(declare-fun tp!60841 () Bool)

(assert (=> mapNonEmpty!31719 (= mapRes!31719 (and tp!60841 e!522626))))

(declare-datatypes ((ValueCell!9506 0))(
  ( (ValueCellFull!9506 (v!12556 V!31599)) (EmptyCell!9506) )
))
(declare-fun mapValue!31719 () ValueCell!9506)

(declare-datatypes ((array!55894 0))(
  ( (array!55895 (arr!26892 (Array (_ BitVec 32) ValueCell!9506)) (size!27351 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55894)

(declare-fun mapRest!31719 () (Array (_ BitVec 32) ValueCell!9506))

(declare-fun mapKey!31719 () (_ BitVec 32))

(assert (=> mapNonEmpty!31719 (= (arr!26892 _values!1231) (store mapRest!31719 mapKey!31719 mapValue!31719))))

(declare-fun res!626777 () Bool)

(declare-fun e!522627 () Bool)

(assert (=> start!79254 (=> (not res!626777) (not e!522627))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79254 (= res!626777 (validMask!0 mask!1881))))

(assert (=> start!79254 e!522627))

(assert (=> start!79254 true))

(declare-fun e!522631 () Bool)

(declare-fun array_inv!20930 (array!55894) Bool)

(assert (=> start!79254 (and (array_inv!20930 _values!1231) e!522631)))

(assert (=> start!79254 tp!60842))

(declare-datatypes ((array!55896 0))(
  ( (array!55897 (arr!26893 (Array (_ BitVec 32) (_ BitVec 64))) (size!27352 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55896)

(declare-fun array_inv!20931 (array!55896) Bool)

(assert (=> start!79254 (array_inv!20931 _keys!1487)))

(assert (=> start!79254 tp_is_empty!19975))

(declare-fun b!930683 () Bool)

(declare-fun res!626776 () Bool)

(assert (=> b!930683 (=> (not res!626776) (not e!522627))))

(declare-datatypes ((List!18929 0))(
  ( (Nil!18926) (Cons!18925 (h!20071 (_ BitVec 64)) (t!26986 List!18929)) )
))
(declare-fun arrayNoDuplicates!0 (array!55896 (_ BitVec 32) List!18929) Bool)

(assert (=> b!930683 (= res!626776 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18926))))

(declare-fun b!930684 () Bool)

(declare-fun res!626774 () Bool)

(assert (=> b!930684 (=> (not res!626774) (not e!522627))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930684 (= res!626774 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27352 _keys!1487))))))

(declare-fun b!930685 () Bool)

(declare-fun e!522629 () Bool)

(assert (=> b!930685 (= e!522629 tp_is_empty!19975)))

(declare-fun mapIsEmpty!31719 () Bool)

(assert (=> mapIsEmpty!31719 mapRes!31719))

(declare-fun b!930686 () Bool)

(declare-fun res!626779 () Bool)

(assert (=> b!930686 (=> (not res!626779) (not e!522627))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930686 (= res!626779 (and (= (size!27351 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27352 _keys!1487) (size!27351 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930687 () Bool)

(declare-fun res!626775 () Bool)

(assert (=> b!930687 (=> (not res!626775) (not e!522627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55896 (_ BitVec 32)) Bool)

(assert (=> b!930687 (= res!626775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930688 () Bool)

(assert (=> b!930688 (= e!522631 (and e!522629 mapRes!31719))))

(declare-fun condMapEmpty!31719 () Bool)

(declare-fun mapDefault!31719 () ValueCell!9506)

