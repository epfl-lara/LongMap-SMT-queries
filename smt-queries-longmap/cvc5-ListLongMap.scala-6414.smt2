; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82280 () Bool)

(assert start!82280)

(declare-fun b_free!18553 () Bool)

(declare-fun b_next!18553 () Bool)

(assert (=> start!82280 (= b_free!18553 (not b_next!18553))))

(declare-fun tp!64620 () Bool)

(declare-fun b_and!30041 () Bool)

(assert (=> start!82280 (= tp!64620 b_and!30041)))

(declare-fun res!642058 () Bool)

(declare-fun e!540716 () Bool)

(assert (=> start!82280 (=> (not res!642058) (not e!540716))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82280 (= res!642058 (validMask!0 mask!2088))))

(assert (=> start!82280 e!540716))

(assert (=> start!82280 true))

(declare-fun tp_is_empty!21259 () Bool)

(assert (=> start!82280 tp_is_empty!21259))

(declare-datatypes ((array!58615 0))(
  ( (array!58616 (arr!28181 (Array (_ BitVec 32) (_ BitVec 64))) (size!28660 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58615)

(declare-fun array_inv!21847 (array!58615) Bool)

(assert (=> start!82280 (array_inv!21847 _keys!1668)))

(declare-datatypes ((V!33329 0))(
  ( (V!33330 (val!10680 Int)) )
))
(declare-datatypes ((ValueCell!10148 0))(
  ( (ValueCellFull!10148 (v!13237 V!33329)) (EmptyCell!10148) )
))
(declare-datatypes ((array!58617 0))(
  ( (array!58618 (arr!28182 (Array (_ BitVec 32) ValueCell!10148)) (size!28661 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58617)

(declare-fun e!540720 () Bool)

(declare-fun array_inv!21848 (array!58617) Bool)

(assert (=> start!82280 (and (array_inv!21848 _values!1386) e!540720)))

(assert (=> start!82280 tp!64620))

(declare-fun b!959182 () Bool)

(declare-fun res!642054 () Bool)

(assert (=> b!959182 (=> (not res!642054) (not e!540716))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!959182 (= res!642054 (and (= (size!28661 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28660 _keys!1668) (size!28661 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959183 () Bool)

(declare-fun res!642053 () Bool)

(assert (=> b!959183 (=> (not res!642053) (not e!540716))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959183 (= res!642053 (validKeyInArray!0 (select (arr!28181 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33868 () Bool)

(declare-fun mapRes!33868 () Bool)

(declare-fun tp!64619 () Bool)

(declare-fun e!540718 () Bool)

(assert (=> mapNonEmpty!33868 (= mapRes!33868 (and tp!64619 e!540718))))

(declare-fun mapValue!33868 () ValueCell!10148)

(declare-fun mapRest!33868 () (Array (_ BitVec 32) ValueCell!10148))

(declare-fun mapKey!33868 () (_ BitVec 32))

(assert (=> mapNonEmpty!33868 (= (arr!28182 _values!1386) (store mapRest!33868 mapKey!33868 mapValue!33868))))

(declare-fun b!959184 () Bool)

(declare-fun res!642057 () Bool)

(assert (=> b!959184 (=> (not res!642057) (not e!540716))))

(declare-fun minValue!1328 () V!33329)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33329)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13776 0))(
  ( (tuple2!13777 (_1!6899 (_ BitVec 64)) (_2!6899 V!33329)) )
))
(declare-datatypes ((List!19595 0))(
  ( (Nil!19592) (Cons!19591 (h!20753 tuple2!13776) (t!27958 List!19595)) )
))
(declare-datatypes ((ListLongMap!12473 0))(
  ( (ListLongMap!12474 (toList!6252 List!19595)) )
))
(declare-fun contains!5353 (ListLongMap!12473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3485 (array!58615 array!58617 (_ BitVec 32) (_ BitVec 32) V!33329 V!33329 (_ BitVec 32) Int) ListLongMap!12473)

(assert (=> b!959184 (= res!642057 (contains!5353 (getCurrentListMap!3485 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28181 _keys!1668) i!793)))))

(declare-fun b!959185 () Bool)

(declare-fun res!642059 () Bool)

(assert (=> b!959185 (=> (not res!642059) (not e!540716))))

(assert (=> b!959185 (= res!642059 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28660 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28660 _keys!1668))))))

(declare-fun b!959186 () Bool)

(assert (=> b!959186 (= e!540716 (not true))))

(assert (=> b!959186 (contains!5353 (getCurrentListMap!3485 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28181 _keys!1668) i!793))))

(declare-datatypes ((Unit!32179 0))(
  ( (Unit!32180) )
))
(declare-fun lt!430521 () Unit!32179)

(declare-fun lemmaInListMapFromThenInFromSmaller!11 (array!58615 array!58617 (_ BitVec 32) (_ BitVec 32) V!33329 V!33329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32179)

(assert (=> b!959186 (= lt!430521 (lemmaInListMapFromThenInFromSmaller!11 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959187 () Bool)

(assert (=> b!959187 (= e!540718 tp_is_empty!21259)))

(declare-fun mapIsEmpty!33868 () Bool)

(assert (=> mapIsEmpty!33868 mapRes!33868))

(declare-fun b!959188 () Bool)

(declare-fun e!540719 () Bool)

(assert (=> b!959188 (= e!540719 tp_is_empty!21259)))

(declare-fun b!959189 () Bool)

(declare-fun res!642055 () Bool)

(assert (=> b!959189 (=> (not res!642055) (not e!540716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58615 (_ BitVec 32)) Bool)

(assert (=> b!959189 (= res!642055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959190 () Bool)

(assert (=> b!959190 (= e!540720 (and e!540719 mapRes!33868))))

(declare-fun condMapEmpty!33868 () Bool)

(declare-fun mapDefault!33868 () ValueCell!10148)

