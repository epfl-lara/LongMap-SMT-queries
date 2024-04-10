; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78948 () Bool)

(assert start!78948)

(declare-fun b_free!17161 () Bool)

(declare-fun b_next!17161 () Bool)

(assert (=> start!78948 (= b_free!17161 (not b_next!17161))))

(declare-fun tp!59923 () Bool)

(declare-fun b_and!28059 () Bool)

(assert (=> start!78948 (= tp!59923 b_and!28059)))

(declare-fun b!923566 () Bool)

(declare-fun e!518209 () Bool)

(assert (=> b!923566 (= e!518209 false)))

(declare-datatypes ((V!31191 0))(
  ( (V!31192 (val!9885 Int)) )
))
(declare-fun lt!414975 () V!31191)

(declare-datatypes ((tuple2!12870 0))(
  ( (tuple2!12871 (_1!6446 (_ BitVec 64)) (_2!6446 V!31191)) )
))
(declare-datatypes ((List!18674 0))(
  ( (Nil!18671) (Cons!18670 (h!19816 tuple2!12870) (t!26565 List!18674)) )
))
(declare-datatypes ((ListLongMap!11567 0))(
  ( (ListLongMap!11568 (toList!5799 List!18674)) )
))
(declare-fun lt!414979 () ListLongMap!11567)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!629 (ListLongMap!11567 (_ BitVec 64)) V!31191)

(assert (=> b!923566 (= lt!414975 (apply!629 lt!414979 k!1099))))

(declare-fun b!923567 () Bool)

(declare-datatypes ((Unit!31163 0))(
  ( (Unit!31164) )
))
(declare-fun e!518202 () Unit!31163)

(declare-fun e!518204 () Unit!31163)

(assert (=> b!923567 (= e!518202 e!518204)))

(declare-fun lt!414968 () (_ BitVec 64))

(declare-datatypes ((array!55312 0))(
  ( (array!55313 (arr!26601 (Array (_ BitVec 32) (_ BitVec 64))) (size!27060 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55312)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923567 (= lt!414968 (select (arr!26601 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96285 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923567 (= c!96285 (validKeyInArray!0 lt!414968))))

(declare-fun b!923568 () Bool)

(declare-fun e!518212 () Bool)

(declare-fun e!518201 () Bool)

(assert (=> b!923568 (= e!518212 e!518201)))

(declare-fun res!622711 () Bool)

(assert (=> b!923568 (=> (not res!622711) (not e!518201))))

(assert (=> b!923568 (= res!622711 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27060 _keys!1487)))))

(declare-fun lt!414980 () Unit!31163)

(assert (=> b!923568 (= lt!414980 e!518202)))

(declare-fun c!96284 () Bool)

(assert (=> b!923568 (= c!96284 (validKeyInArray!0 k!1099))))

(declare-fun mapIsEmpty!31260 () Bool)

(declare-fun mapRes!31260 () Bool)

(assert (=> mapIsEmpty!31260 mapRes!31260))

(declare-fun b!923569 () Bool)

(declare-fun res!622705 () Bool)

(declare-fun e!518206 () Bool)

(assert (=> b!923569 (=> (not res!622705) (not e!518206))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55312 (_ BitVec 32)) Bool)

(assert (=> b!923569 (= res!622705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923570 () Bool)

(declare-fun res!622704 () Bool)

(assert (=> b!923570 (=> (not res!622704) (not e!518206))))

(declare-datatypes ((List!18675 0))(
  ( (Nil!18672) (Cons!18671 (h!19817 (_ BitVec 64)) (t!26566 List!18675)) )
))
(declare-fun arrayNoDuplicates!0 (array!55312 (_ BitVec 32) List!18675) Bool)

(assert (=> b!923570 (= res!622704 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18672))))

(declare-fun b!923571 () Bool)

(declare-fun e!518210 () Bool)

(declare-fun arrayContainsKey!0 (array!55312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923571 (= e!518210 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!923572 () Bool)

(assert (=> b!923572 (= e!518201 e!518209)))

(declare-fun res!622703 () Bool)

(assert (=> b!923572 (=> (not res!622703) (not e!518209))))

(declare-fun contains!4861 (ListLongMap!11567 (_ BitVec 64)) Bool)

(assert (=> b!923572 (= res!622703 (contains!4861 lt!414979 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9353 0))(
  ( (ValueCellFull!9353 (v!12403 V!31191)) (EmptyCell!9353) )
))
(declare-datatypes ((array!55314 0))(
  ( (array!55315 (arr!26602 (Array (_ BitVec 32) ValueCell!9353)) (size!27061 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55314)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31191)

(declare-fun minValue!1173 () V!31191)

(declare-fun getCurrentListMap!3052 (array!55312 array!55314 (_ BitVec 32) (_ BitVec 32) V!31191 V!31191 (_ BitVec 32) Int) ListLongMap!11567)

(assert (=> b!923572 (= lt!414979 (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923573 () Bool)

(declare-fun e!518203 () Bool)

(declare-fun tp_is_empty!19669 () Bool)

(assert (=> b!923573 (= e!518203 tp_is_empty!19669)))

(declare-fun b!923574 () Bool)

(declare-fun res!622708 () Bool)

(assert (=> b!923574 (=> (not res!622708) (not e!518206))))

(assert (=> b!923574 (= res!622708 (and (= (size!27061 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27060 _keys!1487) (size!27061 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923575 () Bool)

(declare-fun e!518208 () Bool)

(assert (=> b!923575 (= e!518208 (and e!518203 mapRes!31260))))

(declare-fun condMapEmpty!31260 () Bool)

(declare-fun mapDefault!31260 () ValueCell!9353)

