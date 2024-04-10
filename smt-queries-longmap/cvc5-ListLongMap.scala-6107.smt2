; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78750 () Bool)

(assert start!78750)

(declare-fun b_free!16963 () Bool)

(declare-fun b_next!16963 () Bool)

(assert (=> start!78750 (= b_free!16963 (not b_next!16963))))

(declare-fun tp!59330 () Bool)

(declare-fun b_and!27663 () Bool)

(assert (=> start!78750 (= tp!59330 b_and!27663)))

(declare-fun b!918821 () Bool)

(declare-fun res!619516 () Bool)

(declare-fun e!515774 () Bool)

(assert (=> b!918821 (=> (not res!619516) (not e!515774))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!30927 0))(
  ( (V!30928 (val!9786 Int)) )
))
(declare-fun v!791 () V!30927)

(declare-datatypes ((tuple2!12718 0))(
  ( (tuple2!12719 (_1!6370 (_ BitVec 64)) (_2!6370 V!30927)) )
))
(declare-datatypes ((List!18523 0))(
  ( (Nil!18520) (Cons!18519 (h!19665 tuple2!12718) (t!26216 List!18523)) )
))
(declare-datatypes ((ListLongMap!11415 0))(
  ( (ListLongMap!11416 (toList!5723 List!18523)) )
))
(declare-fun lt!412407 () ListLongMap!11415)

(declare-fun apply!569 (ListLongMap!11415 (_ BitVec 64)) V!30927)

(assert (=> b!918821 (= res!619516 (= (apply!569 lt!412407 k!1099) v!791))))

(declare-fun b!918822 () Bool)

(declare-fun e!515776 () Bool)

(assert (=> b!918822 (= e!515776 e!515774)))

(declare-fun res!619517 () Bool)

(assert (=> b!918822 (=> (not res!619517) (not e!515774))))

(declare-fun contains!4769 (ListLongMap!11415 (_ BitVec 64)) Bool)

(assert (=> b!918822 (= res!619517 (contains!4769 lt!412407 k!1099))))

(declare-datatypes ((array!54926 0))(
  ( (array!54927 (arr!26408 (Array (_ BitVec 32) (_ BitVec 64))) (size!26867 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54926)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9254 0))(
  ( (ValueCellFull!9254 (v!12304 V!30927)) (EmptyCell!9254) )
))
(declare-datatypes ((array!54928 0))(
  ( (array!54929 (arr!26409 (Array (_ BitVec 32) ValueCell!9254)) (size!26868 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54928)

(declare-fun zeroValue!1173 () V!30927)

(declare-fun minValue!1173 () V!30927)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2979 (array!54926 array!54928 (_ BitVec 32) (_ BitVec 32) V!30927 V!30927 (_ BitVec 32) Int) ListLongMap!11415)

(assert (=> b!918822 (= lt!412407 (getCurrentListMap!2979 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30963 () Bool)

(declare-fun mapRes!30963 () Bool)

(declare-fun tp!59329 () Bool)

(declare-fun e!515775 () Bool)

(assert (=> mapNonEmpty!30963 (= mapRes!30963 (and tp!59329 e!515775))))

(declare-fun mapValue!30963 () ValueCell!9254)

(declare-fun mapRest!30963 () (Array (_ BitVec 32) ValueCell!9254))

(declare-fun mapKey!30963 () (_ BitVec 32))

(assert (=> mapNonEmpty!30963 (= (arr!26409 _values!1231) (store mapRest!30963 mapKey!30963 mapValue!30963))))

(declare-fun b!918823 () Bool)

(declare-fun res!619513 () Bool)

(assert (=> b!918823 (=> (not res!619513) (not e!515776))))

(assert (=> b!918823 (= res!619513 (and (= (size!26868 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26867 _keys!1487) (size!26868 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918824 () Bool)

(declare-fun e!515771 () Bool)

(assert (=> b!918824 (= e!515774 e!515771)))

(declare-fun res!619511 () Bool)

(assert (=> b!918824 (=> (not res!619511) (not e!515771))))

(declare-fun lt!412408 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918824 (= res!619511 (validKeyInArray!0 lt!412408))))

(assert (=> b!918824 (= lt!412408 (select (arr!26408 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918825 () Bool)

(declare-fun res!619512 () Bool)

(assert (=> b!918825 (=> (not res!619512) (not e!515776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54926 (_ BitVec 32)) Bool)

(assert (=> b!918825 (= res!619512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918826 () Bool)

(declare-fun e!515770 () Bool)

(declare-fun e!515773 () Bool)

(assert (=> b!918826 (= e!515770 (and e!515773 mapRes!30963))))

(declare-fun condMapEmpty!30963 () Bool)

(declare-fun mapDefault!30963 () ValueCell!9254)

