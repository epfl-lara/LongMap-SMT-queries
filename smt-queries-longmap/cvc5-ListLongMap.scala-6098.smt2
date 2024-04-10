; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78696 () Bool)

(assert start!78696)

(declare-fun b_free!16909 () Bool)

(declare-fun b_next!16909 () Bool)

(assert (=> start!78696 (= b_free!16909 (not b_next!16909))))

(declare-fun tp!59168 () Bool)

(declare-fun b_and!27555 () Bool)

(assert (=> start!78696 (= tp!59168 b_and!27555)))

(declare-fun b!917714 () Bool)

(declare-fun e!515207 () Bool)

(assert (=> b!917714 (= e!515207 (not true))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!412073 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30855 0))(
  ( (V!30856 (val!9759 Int)) )
))
(declare-datatypes ((ValueCell!9227 0))(
  ( (ValueCellFull!9227 (v!12277 V!30855)) (EmptyCell!9227) )
))
(declare-datatypes ((array!54820 0))(
  ( (array!54821 (arr!26355 (Array (_ BitVec 32) ValueCell!9227)) (size!26814 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54820)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!54822 0))(
  ( (array!54823 (arr!26356 (Array (_ BitVec 32) (_ BitVec 64))) (size!26815 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54822)

(declare-fun zeroValue!1173 () V!30855)

(declare-fun minValue!1173 () V!30855)

(declare-datatypes ((tuple2!12676 0))(
  ( (tuple2!12677 (_1!6349 (_ BitVec 64)) (_2!6349 V!30855)) )
))
(declare-datatypes ((List!18485 0))(
  ( (Nil!18482) (Cons!18481 (h!19627 tuple2!12676) (t!26124 List!18485)) )
))
(declare-datatypes ((ListLongMap!11373 0))(
  ( (ListLongMap!11374 (toList!5702 List!18485)) )
))
(declare-fun getCurrentListMap!2960 (array!54822 array!54820 (_ BitVec 32) (_ BitVec 32) V!30855 V!30855 (_ BitVec 32) Int) ListLongMap!11373)

(declare-fun +!2617 (ListLongMap!11373 tuple2!12676) ListLongMap!11373)

(declare-fun get!13810 (ValueCell!9227 V!30855) V!30855)

(declare-fun dynLambda!1406 (Int (_ BitVec 64)) V!30855)

(assert (=> b!917714 (= (getCurrentListMap!2960 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2617 (getCurrentListMap!2960 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12677 lt!412073 (get!13810 (select (arr!26355 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1406 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30982 0))(
  ( (Unit!30983) )
))
(declare-fun lt!412074 () Unit!30982)

(declare-fun lemmaListMapRecursiveValidKeyArray!7 (array!54822 array!54820 (_ BitVec 32) (_ BitVec 32) V!30855 V!30855 (_ BitVec 32) Int) Unit!30982)

(assert (=> b!917714 (= lt!412074 (lemmaListMapRecursiveValidKeyArray!7 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917715 () Bool)

(declare-fun e!515203 () Bool)

(declare-fun tp_is_empty!19417 () Bool)

(assert (=> b!917715 (= e!515203 tp_is_empty!19417)))

(declare-fun b!917716 () Bool)

(declare-fun res!618705 () Bool)

(declare-fun e!515206 () Bool)

(assert (=> b!917716 (=> (not res!618705) (not e!515206))))

(declare-datatypes ((List!18486 0))(
  ( (Nil!18483) (Cons!18482 (h!19628 (_ BitVec 64)) (t!26125 List!18486)) )
))
(declare-fun arrayNoDuplicates!0 (array!54822 (_ BitVec 32) List!18486) Bool)

(assert (=> b!917716 (= res!618705 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18483))))

(declare-fun b!917717 () Bool)

(declare-fun e!515209 () Bool)

(assert (=> b!917717 (= e!515206 e!515209)))

(declare-fun res!618703 () Bool)

(assert (=> b!917717 (=> (not res!618703) (not e!515209))))

(declare-fun lt!412075 () ListLongMap!11373)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4753 (ListLongMap!11373 (_ BitVec 64)) Bool)

(assert (=> b!917717 (= res!618703 (contains!4753 lt!412075 k!1099))))

(assert (=> b!917717 (= lt!412075 (getCurrentListMap!2960 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917718 () Bool)

(declare-fun e!515208 () Bool)

(assert (=> b!917718 (= e!515208 tp_is_empty!19417)))

(declare-fun b!917719 () Bool)

(declare-fun res!618704 () Bool)

(assert (=> b!917719 (=> (not res!618704) (not e!515209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917719 (= res!618704 (validKeyInArray!0 k!1099))))

(declare-fun b!917720 () Bool)

(declare-fun res!618701 () Bool)

(assert (=> b!917720 (=> (not res!618701) (not e!515206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54822 (_ BitVec 32)) Bool)

(assert (=> b!917720 (= res!618701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917721 () Bool)

(assert (=> b!917721 (= e!515209 e!515207)))

(declare-fun res!618708 () Bool)

(assert (=> b!917721 (=> (not res!618708) (not e!515207))))

(assert (=> b!917721 (= res!618708 (validKeyInArray!0 lt!412073))))

(assert (=> b!917721 (= lt!412073 (select (arr!26356 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917722 () Bool)

(declare-fun res!618709 () Bool)

(assert (=> b!917722 (=> (not res!618709) (not e!515206))))

(assert (=> b!917722 (= res!618709 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26815 _keys!1487))))))

(declare-fun res!618700 () Bool)

(assert (=> start!78696 (=> (not res!618700) (not e!515206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78696 (= res!618700 (validMask!0 mask!1881))))

(assert (=> start!78696 e!515206))

(assert (=> start!78696 true))

(assert (=> start!78696 tp_is_empty!19417))

(declare-fun e!515205 () Bool)

(declare-fun array_inv!20552 (array!54820) Bool)

(assert (=> start!78696 (and (array_inv!20552 _values!1231) e!515205)))

(assert (=> start!78696 tp!59168))

(declare-fun array_inv!20553 (array!54822) Bool)

(assert (=> start!78696 (array_inv!20553 _keys!1487)))

(declare-fun mapIsEmpty!30882 () Bool)

(declare-fun mapRes!30882 () Bool)

(assert (=> mapIsEmpty!30882 mapRes!30882))

(declare-fun b!917723 () Bool)

(declare-fun res!618706 () Bool)

(assert (=> b!917723 (=> (not res!618706) (not e!515206))))

(assert (=> b!917723 (= res!618706 (and (= (size!26814 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26815 _keys!1487) (size!26814 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917724 () Bool)

(declare-fun res!618702 () Bool)

(assert (=> b!917724 (=> (not res!618702) (not e!515209))))

(declare-fun v!791 () V!30855)

(declare-fun apply!554 (ListLongMap!11373 (_ BitVec 64)) V!30855)

(assert (=> b!917724 (= res!618702 (= (apply!554 lt!412075 k!1099) v!791))))

(declare-fun mapNonEmpty!30882 () Bool)

(declare-fun tp!59167 () Bool)

(assert (=> mapNonEmpty!30882 (= mapRes!30882 (and tp!59167 e!515203))))

(declare-fun mapKey!30882 () (_ BitVec 32))

(declare-fun mapRest!30882 () (Array (_ BitVec 32) ValueCell!9227))

(declare-fun mapValue!30882 () ValueCell!9227)

(assert (=> mapNonEmpty!30882 (= (arr!26355 _values!1231) (store mapRest!30882 mapKey!30882 mapValue!30882))))

(declare-fun b!917725 () Bool)

(assert (=> b!917725 (= e!515205 (and e!515208 mapRes!30882))))

(declare-fun condMapEmpty!30882 () Bool)

(declare-fun mapDefault!30882 () ValueCell!9227)

