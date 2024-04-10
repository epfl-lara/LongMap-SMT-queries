; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82278 () Bool)

(assert start!82278)

(declare-fun b_free!18551 () Bool)

(declare-fun b_next!18551 () Bool)

(assert (=> start!82278 (= b_free!18551 (not b_next!18551))))

(declare-fun tp!64614 () Bool)

(declare-fun b_and!30039 () Bool)

(assert (=> start!82278 (= tp!64614 b_and!30039)))

(declare-fun b!959152 () Bool)

(declare-fun res!642032 () Bool)

(declare-fun e!540705 () Bool)

(assert (=> b!959152 (=> (not res!642032) (not e!540705))))

(declare-datatypes ((array!58611 0))(
  ( (array!58612 (arr!28179 (Array (_ BitVec 32) (_ BitVec 64))) (size!28658 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58611)

(declare-datatypes ((List!19593 0))(
  ( (Nil!19590) (Cons!19589 (h!20751 (_ BitVec 64)) (t!27956 List!19593)) )
))
(declare-fun arrayNoDuplicates!0 (array!58611 (_ BitVec 32) List!19593) Bool)

(assert (=> b!959152 (= res!642032 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19590))))

(declare-fun b!959153 () Bool)

(declare-fun res!642037 () Bool)

(assert (=> b!959153 (=> (not res!642037) (not e!540705))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959153 (= res!642037 (validKeyInArray!0 (select (arr!28179 _keys!1668) i!793)))))

(declare-fun b!959154 () Bool)

(declare-fun e!540703 () Bool)

(declare-fun tp_is_empty!21257 () Bool)

(assert (=> b!959154 (= e!540703 tp_is_empty!21257)))

(declare-fun b!959155 () Bool)

(declare-fun res!642034 () Bool)

(assert (=> b!959155 (=> (not res!642034) (not e!540705))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959155 (= res!642034 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28658 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28658 _keys!1668))))))

(declare-fun b!959156 () Bool)

(declare-fun res!642033 () Bool)

(assert (=> b!959156 (=> (not res!642033) (not e!540705))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33325 0))(
  ( (V!33326 (val!10679 Int)) )
))
(declare-datatypes ((ValueCell!10147 0))(
  ( (ValueCellFull!10147 (v!13236 V!33325)) (EmptyCell!10147) )
))
(declare-datatypes ((array!58613 0))(
  ( (array!58614 (arr!28180 (Array (_ BitVec 32) ValueCell!10147)) (size!28659 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58613)

(assert (=> b!959156 (= res!642033 (and (= (size!28659 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28658 _keys!1668) (size!28659 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33865 () Bool)

(declare-fun mapRes!33865 () Bool)

(assert (=> mapIsEmpty!33865 mapRes!33865))

(declare-fun b!959157 () Bool)

(declare-fun e!540701 () Bool)

(assert (=> b!959157 (= e!540701 tp_is_empty!21257)))

(declare-fun res!642036 () Bool)

(assert (=> start!82278 (=> (not res!642036) (not e!540705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82278 (= res!642036 (validMask!0 mask!2088))))

(assert (=> start!82278 e!540705))

(assert (=> start!82278 true))

(assert (=> start!82278 tp_is_empty!21257))

(declare-fun array_inv!21845 (array!58611) Bool)

(assert (=> start!82278 (array_inv!21845 _keys!1668)))

(declare-fun e!540704 () Bool)

(declare-fun array_inv!21846 (array!58613) Bool)

(assert (=> start!82278 (and (array_inv!21846 _values!1386) e!540704)))

(assert (=> start!82278 tp!64614))

(declare-fun b!959158 () Bool)

(assert (=> b!959158 (= e!540705 (not true))))

(declare-fun minValue!1328 () V!33325)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33325)

(declare-datatypes ((tuple2!13774 0))(
  ( (tuple2!13775 (_1!6898 (_ BitVec 64)) (_2!6898 V!33325)) )
))
(declare-datatypes ((List!19594 0))(
  ( (Nil!19591) (Cons!19590 (h!20752 tuple2!13774) (t!27957 List!19594)) )
))
(declare-datatypes ((ListLongMap!12471 0))(
  ( (ListLongMap!12472 (toList!6251 List!19594)) )
))
(declare-fun contains!5352 (ListLongMap!12471 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3484 (array!58611 array!58613 (_ BitVec 32) (_ BitVec 32) V!33325 V!33325 (_ BitVec 32) Int) ListLongMap!12471)

(assert (=> b!959158 (contains!5352 (getCurrentListMap!3484 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28179 _keys!1668) i!793))))

(declare-datatypes ((Unit!32177 0))(
  ( (Unit!32178) )
))
(declare-fun lt!430518 () Unit!32177)

(declare-fun lemmaInListMapFromThenInFromSmaller!10 (array!58611 array!58613 (_ BitVec 32) (_ BitVec 32) V!33325 V!33325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32177)

(assert (=> b!959158 (= lt!430518 (lemmaInListMapFromThenInFromSmaller!10 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun mapNonEmpty!33865 () Bool)

(declare-fun tp!64613 () Bool)

(assert (=> mapNonEmpty!33865 (= mapRes!33865 (and tp!64613 e!540701))))

(declare-fun mapKey!33865 () (_ BitVec 32))

(declare-fun mapRest!33865 () (Array (_ BitVec 32) ValueCell!10147))

(declare-fun mapValue!33865 () ValueCell!10147)

(assert (=> mapNonEmpty!33865 (= (arr!28180 _values!1386) (store mapRest!33865 mapKey!33865 mapValue!33865))))

(declare-fun b!959159 () Bool)

(declare-fun res!642035 () Bool)

(assert (=> b!959159 (=> (not res!642035) (not e!540705))))

(assert (=> b!959159 (= res!642035 (contains!5352 (getCurrentListMap!3484 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28179 _keys!1668) i!793)))))

(declare-fun b!959160 () Bool)

(assert (=> b!959160 (= e!540704 (and e!540703 mapRes!33865))))

(declare-fun condMapEmpty!33865 () Bool)

(declare-fun mapDefault!33865 () ValueCell!10147)

