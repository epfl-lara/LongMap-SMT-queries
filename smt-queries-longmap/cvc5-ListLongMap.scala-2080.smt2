; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35648 () Bool)

(assert start!35648)

(declare-fun b_free!7903 () Bool)

(declare-fun b_next!7903 () Bool)

(assert (=> start!35648 (= b_free!7903 (not b_next!7903))))

(declare-fun tp!27692 () Bool)

(declare-fun b_and!15145 () Bool)

(assert (=> start!35648 (= tp!27692 b_and!15145)))

(declare-fun b!357935 () Bool)

(declare-fun e!219111 () Bool)

(declare-fun tp_is_empty!8101 () Bool)

(assert (=> b!357935 (= e!219111 tp_is_empty!8101)))

(declare-fun mapIsEmpty!13659 () Bool)

(declare-fun mapRes!13659 () Bool)

(assert (=> mapIsEmpty!13659 mapRes!13659))

(declare-fun b!357936 () Bool)

(declare-fun res!198886 () Bool)

(declare-fun e!219109 () Bool)

(assert (=> b!357936 (=> (not res!198886) (not e!219109))))

(declare-datatypes ((array!19769 0))(
  ( (array!19770 (arr!9378 (Array (_ BitVec 32) (_ BitVec 64))) (size!9730 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19769)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!357936 (= res!198886 (not (= (select (arr!9378 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357938 () Bool)

(declare-fun e!219112 () Bool)

(assert (=> b!357938 (= e!219112 true)))

(declare-datatypes ((V!11779 0))(
  ( (V!11780 (val!4095 Int)) )
))
(declare-fun minValue!1150 () V!11779)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11779)

(declare-datatypes ((ValueCell!3707 0))(
  ( (ValueCellFull!3707 (v!6289 V!11779)) (EmptyCell!3707) )
))
(declare-datatypes ((array!19771 0))(
  ( (array!19772 (arr!9379 (Array (_ BitVec 32) ValueCell!3707)) (size!9731 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19771)

(declare-datatypes ((tuple2!5718 0))(
  ( (tuple2!5719 (_1!2870 (_ BitVec 64)) (_2!2870 V!11779)) )
))
(declare-datatypes ((List!5412 0))(
  ( (Nil!5409) (Cons!5408 (h!6264 tuple2!5718) (t!10562 List!5412)) )
))
(declare-datatypes ((ListLongMap!4631 0))(
  ( (ListLongMap!4632 (toList!2331 List!5412)) )
))
(declare-fun contains!2411 (ListLongMap!4631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1852 (array!19769 array!19771 (_ BitVec 32) (_ BitVec 32) V!11779 V!11779 (_ BitVec 32) Int) ListLongMap!4631)

(assert (=> b!357938 (contains!2411 (getCurrentListMap!1852 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-datatypes ((Unit!11036 0))(
  ( (Unit!11037) )
))
(declare-fun lt!166124 () Unit!11036)

(declare-fun lemmaArrayContainsKeyThenInListMap!347 (array!19769 array!19771 (_ BitVec 32) (_ BitVec 32) V!11779 V!11779 (_ BitVec 64) (_ BitVec 32) Int) Unit!11036)

(assert (=> b!357938 (= lt!166124 (lemmaArrayContainsKeyThenInListMap!347 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357939 () Bool)

(declare-fun res!198884 () Bool)

(assert (=> b!357939 (=> (not res!198884) (not e!219109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357939 (= res!198884 (validKeyInArray!0 k!1077))))

(declare-fun b!357940 () Bool)

(declare-fun res!198889 () Bool)

(assert (=> b!357940 (=> (not res!198889) (not e!219109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19769 (_ BitVec 32)) Bool)

(assert (=> b!357940 (= res!198889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357941 () Bool)

(declare-fun e!219108 () Bool)

(assert (=> b!357941 (= e!219108 tp_is_empty!8101)))

(declare-fun b!357937 () Bool)

(declare-fun res!198890 () Bool)

(assert (=> b!357937 (=> (not res!198890) (not e!219109))))

(declare-datatypes ((List!5413 0))(
  ( (Nil!5410) (Cons!5409 (h!6265 (_ BitVec 64)) (t!10563 List!5413)) )
))
(declare-fun arrayNoDuplicates!0 (array!19769 (_ BitVec 32) List!5413) Bool)

(assert (=> b!357937 (= res!198890 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5410))))

(declare-fun res!198892 () Bool)

(assert (=> start!35648 (=> (not res!198892) (not e!219109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35648 (= res!198892 (validMask!0 mask!1842))))

(assert (=> start!35648 e!219109))

(assert (=> start!35648 tp_is_empty!8101))

(assert (=> start!35648 true))

(assert (=> start!35648 tp!27692))

(declare-fun array_inv!6892 (array!19769) Bool)

(assert (=> start!35648 (array_inv!6892 _keys!1456)))

(declare-fun e!219110 () Bool)

(declare-fun array_inv!6893 (array!19771) Bool)

(assert (=> start!35648 (and (array_inv!6893 _values!1208) e!219110)))

(declare-fun b!357942 () Bool)

(declare-fun res!198885 () Bool)

(assert (=> b!357942 (=> (not res!198885) (not e!219109))))

(declare-fun arrayContainsKey!0 (array!19769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357942 (= res!198885 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!357943 () Bool)

(declare-fun res!198887 () Bool)

(assert (=> b!357943 (=> (not res!198887) (not e!219109))))

(assert (=> b!357943 (= res!198887 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9730 _keys!1456))))))

(declare-fun mapNonEmpty!13659 () Bool)

(declare-fun tp!27693 () Bool)

(assert (=> mapNonEmpty!13659 (= mapRes!13659 (and tp!27693 e!219108))))

(declare-fun mapRest!13659 () (Array (_ BitVec 32) ValueCell!3707))

(declare-fun mapValue!13659 () ValueCell!3707)

(declare-fun mapKey!13659 () (_ BitVec 32))

(assert (=> mapNonEmpty!13659 (= (arr!9379 _values!1208) (store mapRest!13659 mapKey!13659 mapValue!13659))))

(declare-fun b!357944 () Bool)

(assert (=> b!357944 (= e!219110 (and e!219111 mapRes!13659))))

(declare-fun condMapEmpty!13659 () Bool)

(declare-fun mapDefault!13659 () ValueCell!3707)

