; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78778 () Bool)

(assert start!78778)

(declare-fun b_free!16991 () Bool)

(declare-fun b_next!16991 () Bool)

(assert (=> start!78778 (= b_free!16991 (not b_next!16991))))

(declare-fun tp!59413 () Bool)

(declare-fun b_and!27719 () Bool)

(assert (=> start!78778 (= tp!59413 b_and!27719)))

(declare-fun b!919395 () Bool)

(declare-fun e!516068 () Bool)

(declare-fun e!516069 () Bool)

(assert (=> b!919395 (= e!516068 e!516069)))

(declare-fun res!619933 () Bool)

(assert (=> b!919395 (=> (not res!619933) (not e!516069))))

(declare-fun lt!412685 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919395 (= res!619933 (validKeyInArray!0 lt!412685))))

(declare-datatypes ((array!54982 0))(
  ( (array!54983 (arr!26436 (Array (_ BitVec 32) (_ BitVec 64))) (size!26895 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54982)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919395 (= lt!412685 (select (arr!26436 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31005 () Bool)

(declare-fun mapRes!31005 () Bool)

(declare-fun tp!59414 () Bool)

(declare-fun e!516067 () Bool)

(assert (=> mapNonEmpty!31005 (= mapRes!31005 (and tp!59414 e!516067))))

(declare-datatypes ((V!30963 0))(
  ( (V!30964 (val!9800 Int)) )
))
(declare-datatypes ((ValueCell!9268 0))(
  ( (ValueCellFull!9268 (v!12318 V!30963)) (EmptyCell!9268) )
))
(declare-fun mapValue!31005 () ValueCell!9268)

(declare-fun mapKey!31005 () (_ BitVec 32))

(declare-fun mapRest!31005 () (Array (_ BitVec 32) ValueCell!9268))

(declare-datatypes ((array!54984 0))(
  ( (array!54985 (arr!26437 (Array (_ BitVec 32) ValueCell!9268)) (size!26896 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54984)

(assert (=> mapNonEmpty!31005 (= (arr!26437 _values!1231) (store mapRest!31005 mapKey!31005 mapValue!31005))))

(declare-fun res!619931 () Bool)

(declare-fun e!516066 () Bool)

(assert (=> start!78778 (=> (not res!619931) (not e!516066))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78778 (= res!619931 (validMask!0 mask!1881))))

(assert (=> start!78778 e!516066))

(assert (=> start!78778 true))

(declare-fun tp_is_empty!19499 () Bool)

(assert (=> start!78778 tp_is_empty!19499))

(declare-fun e!516064 () Bool)

(declare-fun array_inv!20604 (array!54984) Bool)

(assert (=> start!78778 (and (array_inv!20604 _values!1231) e!516064)))

(assert (=> start!78778 tp!59413))

(declare-fun array_inv!20605 (array!54982) Bool)

(assert (=> start!78778 (array_inv!20605 _keys!1487)))

(declare-fun b!919396 () Bool)

(declare-fun res!619930 () Bool)

(assert (=> b!919396 (=> (not res!619930) (not e!516068))))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!919396 (= res!619930 (validKeyInArray!0 k!1099))))

(declare-fun b!919397 () Bool)

(assert (=> b!919397 (= e!516069 (not true))))

(declare-datatypes ((List!18542 0))(
  ( (Nil!18539) (Cons!18538 (h!19684 (_ BitVec 64)) (t!26263 List!18542)) )
))
(declare-fun arrayNoDuplicates!0 (array!54982 (_ BitVec 32) List!18542) Bool)

(assert (=> b!919397 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18539)))

(declare-datatypes ((Unit!31036 0))(
  ( (Unit!31037) )
))
(declare-fun lt!412686 () Unit!31036)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54982 (_ BitVec 32) (_ BitVec 32)) Unit!31036)

(assert (=> b!919397 (= lt!412686 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12738 0))(
  ( (tuple2!12739 (_1!6380 (_ BitVec 64)) (_2!6380 V!30963)) )
))
(declare-datatypes ((List!18543 0))(
  ( (Nil!18540) (Cons!18539 (h!19685 tuple2!12738) (t!26264 List!18543)) )
))
(declare-datatypes ((ListLongMap!11435 0))(
  ( (ListLongMap!11436 (toList!5733 List!18543)) )
))
(declare-fun lt!412684 () ListLongMap!11435)

(declare-fun lt!412681 () tuple2!12738)

(declare-fun contains!4779 (ListLongMap!11435 (_ BitVec 64)) Bool)

(declare-fun +!2644 (ListLongMap!11435 tuple2!12738) ListLongMap!11435)

(assert (=> b!919397 (contains!4779 (+!2644 lt!412684 lt!412681) k!1099)))

(declare-fun lt!412682 () Unit!31036)

(declare-fun lt!412687 () V!30963)

(declare-fun addStillContains!368 (ListLongMap!11435 (_ BitVec 64) V!30963 (_ BitVec 64)) Unit!31036)

(assert (=> b!919397 (= lt!412682 (addStillContains!368 lt!412684 lt!412685 lt!412687 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30963)

(declare-fun minValue!1173 () V!30963)

(declare-fun getCurrentListMap!2989 (array!54982 array!54984 (_ BitVec 32) (_ BitVec 32) V!30963 V!30963 (_ BitVec 32) Int) ListLongMap!11435)

(assert (=> b!919397 (= (getCurrentListMap!2989 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2644 (getCurrentListMap!2989 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412681))))

(assert (=> b!919397 (= lt!412681 (tuple2!12739 lt!412685 lt!412687))))

(declare-fun get!13863 (ValueCell!9268 V!30963) V!30963)

(declare-fun dynLambda!1433 (Int (_ BitVec 64)) V!30963)

(assert (=> b!919397 (= lt!412687 (get!13863 (select (arr!26437 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1433 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412683 () Unit!31036)

(declare-fun lemmaListMapRecursiveValidKeyArray!34 (array!54982 array!54984 (_ BitVec 32) (_ BitVec 32) V!30963 V!30963 (_ BitVec 32) Int) Unit!31036)

(assert (=> b!919397 (= lt!412683 (lemmaListMapRecursiveValidKeyArray!34 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919398 () Bool)

(declare-fun res!619935 () Bool)

(assert (=> b!919398 (=> (not res!619935) (not e!516066))))

(assert (=> b!919398 (= res!619935 (and (= (size!26896 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26895 _keys!1487) (size!26896 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919399 () Bool)

(declare-fun res!619938 () Bool)

(assert (=> b!919399 (=> (not res!619938) (not e!516066))))

(assert (=> b!919399 (= res!619938 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26895 _keys!1487))))))

(declare-fun b!919400 () Bool)

(assert (=> b!919400 (= e!516067 tp_is_empty!19499)))

(declare-fun b!919401 () Bool)

(declare-fun res!619937 () Bool)

(assert (=> b!919401 (=> (not res!619937) (not e!516066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54982 (_ BitVec 32)) Bool)

(assert (=> b!919401 (= res!619937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919402 () Bool)

(declare-fun res!619932 () Bool)

(assert (=> b!919402 (=> (not res!619932) (not e!516068))))

(assert (=> b!919402 (= res!619932 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31005 () Bool)

(assert (=> mapIsEmpty!31005 mapRes!31005))

(declare-fun b!919403 () Bool)

(declare-fun e!516065 () Bool)

(assert (=> b!919403 (= e!516064 (and e!516065 mapRes!31005))))

(declare-fun condMapEmpty!31005 () Bool)

(declare-fun mapDefault!31005 () ValueCell!9268)

