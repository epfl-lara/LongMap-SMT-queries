; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78952 () Bool)

(assert start!78952)

(declare-fun b_free!17165 () Bool)

(declare-fun b_next!17165 () Bool)

(assert (=> start!78952 (= b_free!17165 (not b_next!17165))))

(declare-fun tp!59935 () Bool)

(declare-fun b_and!28067 () Bool)

(assert (=> start!78952 (= tp!59935 b_and!28067)))

(declare-fun mapNonEmpty!31266 () Bool)

(declare-fun mapRes!31266 () Bool)

(declare-fun tp!59936 () Bool)

(declare-fun e!518284 () Bool)

(assert (=> mapNonEmpty!31266 (= mapRes!31266 (and tp!59936 e!518284))))

(declare-datatypes ((V!31195 0))(
  ( (V!31196 (val!9887 Int)) )
))
(declare-datatypes ((ValueCell!9355 0))(
  ( (ValueCellFull!9355 (v!12405 V!31195)) (EmptyCell!9355) )
))
(declare-fun mapRest!31266 () (Array (_ BitVec 32) ValueCell!9355))

(declare-fun mapValue!31266 () ValueCell!9355)

(declare-datatypes ((array!55320 0))(
  ( (array!55321 (arr!26605 (Array (_ BitVec 32) ValueCell!9355)) (size!27064 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55320)

(declare-fun mapKey!31266 () (_ BitVec 32))

(assert (=> mapNonEmpty!31266 (= (arr!26605 _values!1231) (store mapRest!31266 mapKey!31266 mapValue!31266))))

(declare-fun b!923677 () Bool)

(declare-fun e!518275 () Bool)

(declare-fun e!518274 () Bool)

(assert (=> b!923677 (= e!518275 e!518274)))

(declare-fun res!622764 () Bool)

(assert (=> b!923677 (=> (not res!622764) (not e!518274))))

(declare-datatypes ((tuple2!12874 0))(
  ( (tuple2!12875 (_1!6448 (_ BitVec 64)) (_2!6448 V!31195)) )
))
(declare-datatypes ((List!18678 0))(
  ( (Nil!18675) (Cons!18674 (h!19820 tuple2!12874) (t!26573 List!18678)) )
))
(declare-datatypes ((ListLongMap!11571 0))(
  ( (ListLongMap!11572 (toList!5801 List!18678)) )
))
(declare-fun lt!415071 () ListLongMap!11571)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4863 (ListLongMap!11571 (_ BitVec 64)) Bool)

(assert (=> b!923677 (= res!622764 (contains!4863 lt!415071 k!1099))))

(declare-datatypes ((array!55322 0))(
  ( (array!55323 (arr!26606 (Array (_ BitVec 32) (_ BitVec 64))) (size!27065 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55322)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31195)

(declare-fun minValue!1173 () V!31195)

(declare-fun getCurrentListMap!3054 (array!55322 array!55320 (_ BitVec 32) (_ BitVec 32) V!31195 V!31195 (_ BitVec 32) Int) ListLongMap!11571)

(assert (=> b!923677 (= lt!415071 (getCurrentListMap!3054 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923678 () Bool)

(declare-fun res!622757 () Bool)

(declare-fun e!518276 () Bool)

(assert (=> b!923678 (=> (not res!622757) (not e!518276))))

(assert (=> b!923678 (= res!622757 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27065 _keys!1487))))))

(declare-fun b!923679 () Bool)

(declare-fun res!622761 () Bool)

(assert (=> b!923679 (=> (not res!622761) (not e!518276))))

(declare-datatypes ((List!18679 0))(
  ( (Nil!18676) (Cons!18675 (h!19821 (_ BitVec 64)) (t!26574 List!18679)) )
))
(declare-fun arrayNoDuplicates!0 (array!55322 (_ BitVec 32) List!18679) Bool)

(assert (=> b!923679 (= res!622761 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18676))))

(declare-fun b!923680 () Bool)

(declare-fun e!518282 () Bool)

(assert (=> b!923680 (= e!518282 e!518275)))

(declare-fun res!622758 () Bool)

(assert (=> b!923680 (=> (not res!622758) (not e!518275))))

(assert (=> b!923680 (= res!622758 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27065 _keys!1487)))))

(declare-datatypes ((Unit!31169 0))(
  ( (Unit!31170) )
))
(declare-fun lt!415061 () Unit!31169)

(declare-fun e!518281 () Unit!31169)

(assert (=> b!923680 (= lt!415061 e!518281)))

(declare-fun c!96302 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923680 (= c!96302 (validKeyInArray!0 k!1099))))

(declare-fun res!622763 () Bool)

(assert (=> start!78952 (=> (not res!622763) (not e!518276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78952 (= res!622763 (validMask!0 mask!1881))))

(assert (=> start!78952 e!518276))

(assert (=> start!78952 true))

(declare-fun tp_is_empty!19673 () Bool)

(assert (=> start!78952 tp_is_empty!19673))

(declare-fun e!518283 () Bool)

(declare-fun array_inv!20720 (array!55320) Bool)

(assert (=> start!78952 (and (array_inv!20720 _values!1231) e!518283)))

(assert (=> start!78952 tp!59935))

(declare-fun array_inv!20721 (array!55322) Bool)

(assert (=> start!78952 (array_inv!20721 _keys!1487)))

(declare-fun mapIsEmpty!31266 () Bool)

(assert (=> mapIsEmpty!31266 mapRes!31266))

(declare-fun b!923681 () Bool)

(declare-fun e!518279 () Bool)

(assert (=> b!923681 (= e!518279 e!518282)))

(declare-fun res!622760 () Bool)

(assert (=> b!923681 (=> (not res!622760) (not e!518282))))

(declare-fun lt!415063 () V!31195)

(declare-fun v!791 () V!31195)

(assert (=> b!923681 (= res!622760 (and (= lt!415063 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!415062 () ListLongMap!11571)

(declare-fun apply!631 (ListLongMap!11571 (_ BitVec 64)) V!31195)

(assert (=> b!923681 (= lt!415063 (apply!631 lt!415062 k!1099))))

(declare-fun b!923682 () Bool)

(declare-fun e!518280 () Unit!31169)

(assert (=> b!923682 (= e!518281 e!518280)))

(declare-fun lt!415059 () (_ BitVec 64))

(assert (=> b!923682 (= lt!415059 (select (arr!26606 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96303 () Bool)

(assert (=> b!923682 (= c!96303 (validKeyInArray!0 lt!415059))))

(declare-fun b!923683 () Bool)

(assert (=> b!923683 (= e!518274 false)))

(declare-fun lt!415064 () V!31195)

(assert (=> b!923683 (= lt!415064 (apply!631 lt!415071 k!1099))))

(declare-fun b!923684 () Bool)

(declare-fun e!518277 () Bool)

(assert (=> b!923684 (= e!518277 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923685 () Bool)

(declare-fun Unit!31171 () Unit!31169)

(assert (=> b!923685 (= e!518281 Unit!31171)))

(declare-fun b!923686 () Bool)

(declare-fun e!518273 () Bool)

(assert (=> b!923686 (= e!518283 (and e!518273 mapRes!31266))))

(declare-fun condMapEmpty!31266 () Bool)

(declare-fun mapDefault!31266 () ValueCell!9355)

