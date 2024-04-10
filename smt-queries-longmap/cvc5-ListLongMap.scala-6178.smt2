; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79176 () Bool)

(assert start!79176)

(declare-fun b_free!17389 () Bool)

(declare-fun b_next!17389 () Bool)

(assert (=> start!79176 (= b_free!17389 (not b_next!17389))))

(declare-fun tp!60607 () Bool)

(declare-fun b_and!28455 () Bool)

(assert (=> start!79176 (= tp!60607 b_and!28455)))

(declare-fun b!929434 () Bool)

(declare-fun res!625880 () Bool)

(declare-fun e!521928 () Bool)

(assert (=> b!929434 (=> (not res!625880) (not e!521928))))

(declare-datatypes ((array!55748 0))(
  ( (array!55749 (arr!26819 (Array (_ BitVec 32) (_ BitVec 64))) (size!27278 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55748)

(declare-datatypes ((List!18866 0))(
  ( (Nil!18863) (Cons!18862 (h!20008 (_ BitVec 64)) (t!26923 List!18866)) )
))
(declare-fun arrayNoDuplicates!0 (array!55748 (_ BitVec 32) List!18866) Bool)

(assert (=> b!929434 (= res!625880 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18863))))

(declare-fun b!929435 () Bool)

(declare-fun res!625879 () Bool)

(assert (=> b!929435 (=> (not res!625879) (not e!521928))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31495 0))(
  ( (V!31496 (val!9999 Int)) )
))
(declare-datatypes ((ValueCell!9467 0))(
  ( (ValueCellFull!9467 (v!12517 V!31495)) (EmptyCell!9467) )
))
(declare-datatypes ((array!55750 0))(
  ( (array!55751 (arr!26820 (Array (_ BitVec 32) ValueCell!9467)) (size!27279 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55750)

(assert (=> b!929435 (= res!625879 (and (= (size!27279 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27278 _keys!1487) (size!27279 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929436 () Bool)

(declare-fun res!625885 () Bool)

(assert (=> b!929436 (=> (not res!625885) (not e!521928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55748 (_ BitVec 32)) Bool)

(assert (=> b!929436 (= res!625885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929437 () Bool)

(declare-fun res!625878 () Bool)

(declare-fun e!521924 () Bool)

(assert (=> b!929437 (=> (not res!625878) (not e!521924))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31495)

(declare-datatypes ((tuple2!13072 0))(
  ( (tuple2!13073 (_1!6547 (_ BitVec 64)) (_2!6547 V!31495)) )
))
(declare-datatypes ((List!18867 0))(
  ( (Nil!18864) (Cons!18863 (h!20009 tuple2!13072) (t!26924 List!18867)) )
))
(declare-datatypes ((ListLongMap!11769 0))(
  ( (ListLongMap!11770 (toList!5900 List!18867)) )
))
(declare-fun lt!419064 () ListLongMap!11769)

(declare-fun apply!726 (ListLongMap!11769 (_ BitVec 64)) V!31495)

(assert (=> b!929437 (= res!625878 (= (apply!726 lt!419064 k!1099) v!791))))

(declare-fun b!929438 () Bool)

(declare-fun e!521926 () Bool)

(declare-fun tp_is_empty!19897 () Bool)

(assert (=> b!929438 (= e!521926 tp_is_empty!19897)))

(declare-fun b!929439 () Bool)

(declare-fun res!625883 () Bool)

(assert (=> b!929439 (=> (not res!625883) (not e!521928))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929439 (= res!625883 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27278 _keys!1487))))))

(declare-fun mapNonEmpty!31602 () Bool)

(declare-fun mapRes!31602 () Bool)

(declare-fun tp!60608 () Bool)

(declare-fun e!521925 () Bool)

(assert (=> mapNonEmpty!31602 (= mapRes!31602 (and tp!60608 e!521925))))

(declare-fun mapValue!31602 () ValueCell!9467)

(declare-fun mapKey!31602 () (_ BitVec 32))

(declare-fun mapRest!31602 () (Array (_ BitVec 32) ValueCell!9467))

(assert (=> mapNonEmpty!31602 (= (arr!26820 _values!1231) (store mapRest!31602 mapKey!31602 mapValue!31602))))

(declare-fun b!929440 () Bool)

(assert (=> b!929440 (= e!521925 tp_is_empty!19897)))

(declare-fun b!929441 () Bool)

(assert (=> b!929441 (= e!521924 false)))

(declare-fun lt!419065 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31495)

(declare-fun minValue!1173 () V!31495)

(declare-fun contains!4953 (ListLongMap!11769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3144 (array!55748 array!55750 (_ BitVec 32) (_ BitVec 32) V!31495 V!31495 (_ BitVec 32) Int) ListLongMap!11769)

(assert (=> b!929441 (= lt!419065 (contains!4953 (getCurrentListMap!3144 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!929442 () Bool)

(declare-fun e!521927 () Bool)

(assert (=> b!929442 (= e!521927 (and e!521926 mapRes!31602))))

(declare-fun condMapEmpty!31602 () Bool)

(declare-fun mapDefault!31602 () ValueCell!9467)

