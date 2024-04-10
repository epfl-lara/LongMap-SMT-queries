; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39916 () Bool)

(assert start!39916)

(declare-fun b_free!10183 () Bool)

(declare-fun b_next!10183 () Bool)

(assert (=> start!39916 (= b_free!10183 (not b_next!10183))))

(declare-fun tp!36077 () Bool)

(declare-fun b_and!18025 () Bool)

(assert (=> start!39916 (= tp!36077 b_and!18025)))

(declare-fun b!432874 () Bool)

(declare-fun e!256004 () Bool)

(assert (=> b!432874 (= e!256004 true)))

(declare-datatypes ((V!16219 0))(
  ( (V!16220 (val!5712 Int)) )
))
(declare-datatypes ((tuple2!7542 0))(
  ( (tuple2!7543 (_1!3782 (_ BitVec 64)) (_2!3782 V!16219)) )
))
(declare-datatypes ((List!7555 0))(
  ( (Nil!7552) (Cons!7551 (h!8407 tuple2!7542) (t!13187 List!7555)) )
))
(declare-datatypes ((ListLongMap!6455 0))(
  ( (ListLongMap!6456 (toList!3243 List!7555)) )
))
(declare-fun lt!198631 () ListLongMap!6455)

(declare-fun lt!198632 () tuple2!7542)

(declare-fun lt!198623 () ListLongMap!6455)

(declare-fun lt!198624 () tuple2!7542)

(declare-fun +!1391 (ListLongMap!6455 tuple2!7542) ListLongMap!6455)

(assert (=> b!432874 (= lt!198631 (+!1391 (+!1391 lt!198623 lt!198632) lt!198624))))

(declare-fun lt!198625 () V!16219)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16219)

(declare-datatypes ((Unit!12796 0))(
  ( (Unit!12797) )
))
(declare-fun lt!198629 () Unit!12796)

(declare-datatypes ((array!26503 0))(
  ( (array!26504 (arr!12701 (Array (_ BitVec 32) (_ BitVec 64))) (size!13053 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26503)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!380 (ListLongMap!6455 (_ BitVec 64) V!16219 (_ BitVec 64) V!16219) Unit!12796)

(assert (=> b!432874 (= lt!198629 (addCommutativeForDiffKeys!380 lt!198623 k!794 v!412 (select (arr!12701 _keys!709) from!863) lt!198625))))

(declare-fun b!432875 () Bool)

(declare-fun res!254689 () Bool)

(declare-fun e!256003 () Bool)

(assert (=> b!432875 (=> (not res!254689) (not e!256003))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432875 (= res!254689 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13053 _keys!709))))))

(declare-fun b!432876 () Bool)

(declare-fun res!254691 () Bool)

(declare-fun e!256002 () Bool)

(assert (=> b!432876 (=> (not res!254691) (not e!256002))))

(assert (=> b!432876 (= res!254691 (bvsle from!863 i!563))))

(declare-fun b!432877 () Bool)

(assert (=> b!432877 (= e!256003 e!256002)))

(declare-fun res!254690 () Bool)

(assert (=> b!432877 (=> (not res!254690) (not e!256002))))

(declare-fun lt!198622 () array!26503)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26503 (_ BitVec 32)) Bool)

(assert (=> b!432877 (= res!254690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198622 mask!1025))))

(assert (=> b!432877 (= lt!198622 (array!26504 (store (arr!12701 _keys!709) i!563 k!794) (size!13053 _keys!709)))))

(declare-fun b!432878 () Bool)

(declare-fun e!256007 () Unit!12796)

(declare-fun Unit!12798 () Unit!12796)

(assert (=> b!432878 (= e!256007 Unit!12798)))

(declare-fun b!432879 () Bool)

(declare-fun res!254696 () Bool)

(assert (=> b!432879 (=> (not res!254696) (not e!256003))))

(declare-fun arrayContainsKey!0 (array!26503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432879 (= res!254696 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18624 () Bool)

(declare-fun mapRes!18624 () Bool)

(assert (=> mapIsEmpty!18624 mapRes!18624))

(declare-fun res!254700 () Bool)

(assert (=> start!39916 (=> (not res!254700) (not e!256003))))

(assert (=> start!39916 (= res!254700 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13053 _keys!709))))))

(assert (=> start!39916 e!256003))

(declare-fun tp_is_empty!11335 () Bool)

(assert (=> start!39916 tp_is_empty!11335))

(assert (=> start!39916 tp!36077))

(assert (=> start!39916 true))

(declare-datatypes ((ValueCell!5324 0))(
  ( (ValueCellFull!5324 (v!7959 V!16219)) (EmptyCell!5324) )
))
(declare-datatypes ((array!26505 0))(
  ( (array!26506 (arr!12702 (Array (_ BitVec 32) ValueCell!5324)) (size!13054 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26505)

(declare-fun e!256006 () Bool)

(declare-fun array_inv!9240 (array!26505) Bool)

(assert (=> start!39916 (and (array_inv!9240 _values!549) e!256006)))

(declare-fun array_inv!9241 (array!26503) Bool)

(assert (=> start!39916 (array_inv!9241 _keys!709)))

(declare-fun b!432880 () Bool)

(declare-fun Unit!12799 () Unit!12796)

(assert (=> b!432880 (= e!256007 Unit!12799)))

(declare-fun lt!198635 () Unit!12796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12796)

(assert (=> b!432880 (= lt!198635 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432880 false))

(declare-fun mapNonEmpty!18624 () Bool)

(declare-fun tp!36078 () Bool)

(declare-fun e!256009 () Bool)

(assert (=> mapNonEmpty!18624 (= mapRes!18624 (and tp!36078 e!256009))))

(declare-fun mapKey!18624 () (_ BitVec 32))

(declare-fun mapRest!18624 () (Array (_ BitVec 32) ValueCell!5324))

(declare-fun mapValue!18624 () ValueCell!5324)

(assert (=> mapNonEmpty!18624 (= (arr!12702 _values!549) (store mapRest!18624 mapKey!18624 mapValue!18624))))

(declare-fun b!432881 () Bool)

(declare-fun e!256011 () Bool)

(assert (=> b!432881 (= e!256006 (and e!256011 mapRes!18624))))

(declare-fun condMapEmpty!18624 () Bool)

(declare-fun mapDefault!18624 () ValueCell!5324)

