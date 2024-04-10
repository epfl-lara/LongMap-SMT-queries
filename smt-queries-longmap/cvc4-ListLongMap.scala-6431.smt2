; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82386 () Bool)

(assert start!82386)

(declare-fun b_free!18653 () Bool)

(declare-fun b_next!18653 () Bool)

(assert (=> start!82386 (= b_free!18653 (not b_next!18653))))

(declare-fun tp!64929 () Bool)

(declare-fun b_and!30141 () Bool)

(assert (=> start!82386 (= tp!64929 b_and!30141)))

(declare-fun b!960638 () Bool)

(declare-fun e!541515 () Bool)

(declare-fun tp_is_empty!21365 () Bool)

(assert (=> b!960638 (= e!541515 tp_is_empty!21365)))

(declare-fun b!960639 () Bool)

(declare-fun res!643037 () Bool)

(declare-fun e!541514 () Bool)

(assert (=> b!960639 (=> (not res!643037) (not e!541514))))

(declare-datatypes ((array!58819 0))(
  ( (array!58820 (arr!28283 (Array (_ BitVec 32) (_ BitVec 64))) (size!28762 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58819)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960639 (= res!643037 (validKeyInArray!0 (select (arr!28283 _keys!1668) i!793)))))

(declare-fun b!960640 () Bool)

(declare-fun res!643034 () Bool)

(assert (=> b!960640 (=> (not res!643034) (not e!541514))))

(declare-datatypes ((List!19666 0))(
  ( (Nil!19663) (Cons!19662 (h!20824 (_ BitVec 64)) (t!28029 List!19666)) )
))
(declare-fun arrayNoDuplicates!0 (array!58819 (_ BitVec 32) List!19666) Bool)

(assert (=> b!960640 (= res!643034 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19663))))

(declare-fun b!960641 () Bool)

(declare-fun e!541512 () Bool)

(assert (=> b!960641 (= e!541512 tp_is_empty!21365)))

(declare-fun b!960642 () Bool)

(declare-fun res!643035 () Bool)

(assert (=> b!960642 (=> (not res!643035) (not e!541514))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960642 (= res!643035 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28762 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28762 _keys!1668))))))

(declare-fun mapNonEmpty!34027 () Bool)

(declare-fun mapRes!34027 () Bool)

(declare-fun tp!64928 () Bool)

(assert (=> mapNonEmpty!34027 (= mapRes!34027 (and tp!64928 e!541515))))

(declare-datatypes ((V!33469 0))(
  ( (V!33470 (val!10733 Int)) )
))
(declare-datatypes ((ValueCell!10201 0))(
  ( (ValueCellFull!10201 (v!13290 V!33469)) (EmptyCell!10201) )
))
(declare-fun mapValue!34027 () ValueCell!10201)

(declare-fun mapKey!34027 () (_ BitVec 32))

(declare-fun mapRest!34027 () (Array (_ BitVec 32) ValueCell!10201))

(declare-datatypes ((array!58821 0))(
  ( (array!58822 (arr!28284 (Array (_ BitVec 32) ValueCell!10201)) (size!28763 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58821)

(assert (=> mapNonEmpty!34027 (= (arr!28284 _values!1386) (store mapRest!34027 mapKey!34027 mapValue!34027))))

(declare-fun res!643032 () Bool)

(assert (=> start!82386 (=> (not res!643032) (not e!541514))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82386 (= res!643032 (validMask!0 mask!2088))))

(assert (=> start!82386 e!541514))

(assert (=> start!82386 true))

(assert (=> start!82386 tp_is_empty!21365))

(declare-fun array_inv!21917 (array!58819) Bool)

(assert (=> start!82386 (array_inv!21917 _keys!1668)))

(declare-fun e!541513 () Bool)

(declare-fun array_inv!21918 (array!58821) Bool)

(assert (=> start!82386 (and (array_inv!21918 _values!1386) e!541513)))

(assert (=> start!82386 tp!64929))

(declare-fun b!960643 () Bool)

(assert (=> b!960643 (= e!541514 false)))

(declare-fun minValue!1328 () V!33469)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430671 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33469)

(declare-datatypes ((tuple2!13844 0))(
  ( (tuple2!13845 (_1!6933 (_ BitVec 64)) (_2!6933 V!33469)) )
))
(declare-datatypes ((List!19667 0))(
  ( (Nil!19664) (Cons!19663 (h!20825 tuple2!13844) (t!28030 List!19667)) )
))
(declare-datatypes ((ListLongMap!12541 0))(
  ( (ListLongMap!12542 (toList!6286 List!19667)) )
))
(declare-fun contains!5385 (ListLongMap!12541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3519 (array!58819 array!58821 (_ BitVec 32) (_ BitVec 32) V!33469 V!33469 (_ BitVec 32) Int) ListLongMap!12541)

(assert (=> b!960643 (= lt!430671 (contains!5385 (getCurrentListMap!3519 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28283 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!34027 () Bool)

(assert (=> mapIsEmpty!34027 mapRes!34027))

(declare-fun b!960644 () Bool)

(declare-fun res!643033 () Bool)

(assert (=> b!960644 (=> (not res!643033) (not e!541514))))

(assert (=> b!960644 (= res!643033 (and (= (size!28763 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28762 _keys!1668) (size!28763 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960645 () Bool)

(declare-fun res!643036 () Bool)

(assert (=> b!960645 (=> (not res!643036) (not e!541514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58819 (_ BitVec 32)) Bool)

(assert (=> b!960645 (= res!643036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960646 () Bool)

(assert (=> b!960646 (= e!541513 (and e!541512 mapRes!34027))))

(declare-fun condMapEmpty!34027 () Bool)

(declare-fun mapDefault!34027 () ValueCell!10201)

