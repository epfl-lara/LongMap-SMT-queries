; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82260 () Bool)

(assert start!82260)

(declare-fun b_free!18533 () Bool)

(declare-fun b_next!18533 () Bool)

(assert (=> start!82260 (= b_free!18533 (not b_next!18533))))

(declare-fun tp!64560 () Bool)

(declare-fun b_and!30021 () Bool)

(assert (=> start!82260 (= tp!64560 b_and!30021)))

(declare-fun b!958882 () Bool)

(declare-fun res!641845 () Bool)

(declare-fun e!540568 () Bool)

(assert (=> b!958882 (=> (not res!641845) (not e!540568))))

(declare-datatypes ((array!58577 0))(
  ( (array!58578 (arr!28162 (Array (_ BitVec 32) (_ BitVec 64))) (size!28641 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58577)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958882 (= res!641845 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28641 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28641 _keys!1668))))))

(declare-fun res!641848 () Bool)

(assert (=> start!82260 (=> (not res!641848) (not e!540568))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82260 (= res!641848 (validMask!0 mask!2088))))

(assert (=> start!82260 e!540568))

(assert (=> start!82260 true))

(declare-fun tp_is_empty!21239 () Bool)

(assert (=> start!82260 tp_is_empty!21239))

(declare-fun array_inv!21835 (array!58577) Bool)

(assert (=> start!82260 (array_inv!21835 _keys!1668)))

(declare-datatypes ((V!33301 0))(
  ( (V!33302 (val!10670 Int)) )
))
(declare-datatypes ((ValueCell!10138 0))(
  ( (ValueCellFull!10138 (v!13227 V!33301)) (EmptyCell!10138) )
))
(declare-datatypes ((array!58579 0))(
  ( (array!58580 (arr!28163 (Array (_ BitVec 32) ValueCell!10138)) (size!28642 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58579)

(declare-fun e!540566 () Bool)

(declare-fun array_inv!21836 (array!58579) Bool)

(assert (=> start!82260 (and (array_inv!21836 _values!1386) e!540566)))

(assert (=> start!82260 tp!64560))

(declare-fun b!958883 () Bool)

(assert (=> b!958883 (= e!540568 (not true))))

(declare-fun minValue!1328 () V!33301)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33301)

(declare-datatypes ((tuple2!13758 0))(
  ( (tuple2!13759 (_1!6890 (_ BitVec 64)) (_2!6890 V!33301)) )
))
(declare-datatypes ((List!19578 0))(
  ( (Nil!19575) (Cons!19574 (h!20736 tuple2!13758) (t!27941 List!19578)) )
))
(declare-datatypes ((ListLongMap!12455 0))(
  ( (ListLongMap!12456 (toList!6243 List!19578)) )
))
(declare-fun contains!5344 (ListLongMap!12455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3476 (array!58577 array!58579 (_ BitVec 32) (_ BitVec 32) V!33301 V!33301 (_ BitVec 32) Int) ListLongMap!12455)

(assert (=> b!958883 (contains!5344 (getCurrentListMap!3476 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28162 _keys!1668) i!793))))

(declare-datatypes ((Unit!32161 0))(
  ( (Unit!32162) )
))
(declare-fun lt!430491 () Unit!32161)

(declare-fun lemmaInListMapFromThenInFromSmaller!2 (array!58577 array!58579 (_ BitVec 32) (_ BitVec 32) V!33301 V!33301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32161)

(assert (=> b!958883 (= lt!430491 (lemmaInListMapFromThenInFromSmaller!2 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!958884 () Bool)

(declare-fun e!540569 () Bool)

(assert (=> b!958884 (= e!540569 tp_is_empty!21239)))

(declare-fun mapNonEmpty!33838 () Bool)

(declare-fun mapRes!33838 () Bool)

(declare-fun tp!64559 () Bool)

(assert (=> mapNonEmpty!33838 (= mapRes!33838 (and tp!64559 e!540569))))

(declare-fun mapKey!33838 () (_ BitVec 32))

(declare-fun mapRest!33838 () (Array (_ BitVec 32) ValueCell!10138))

(declare-fun mapValue!33838 () ValueCell!10138)

(assert (=> mapNonEmpty!33838 (= (arr!28163 _values!1386) (store mapRest!33838 mapKey!33838 mapValue!33838))))

(declare-fun mapIsEmpty!33838 () Bool)

(assert (=> mapIsEmpty!33838 mapRes!33838))

(declare-fun b!958885 () Bool)

(declare-fun e!540567 () Bool)

(assert (=> b!958885 (= e!540566 (and e!540567 mapRes!33838))))

(declare-fun condMapEmpty!33838 () Bool)

(declare-fun mapDefault!33838 () ValueCell!10138)

