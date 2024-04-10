; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82368 () Bool)

(assert start!82368)

(declare-fun b_free!18635 () Bool)

(declare-fun b_next!18635 () Bool)

(assert (=> start!82368 (= b_free!18635 (not b_next!18635))))

(declare-fun tp!64875 () Bool)

(declare-fun b_and!30123 () Bool)

(assert (=> start!82368 (= tp!64875 b_and!30123)))

(declare-fun b!960395 () Bool)

(declare-fun res!642872 () Bool)

(declare-fun e!541380 () Bool)

(assert (=> b!960395 (=> (not res!642872) (not e!541380))))

(declare-datatypes ((array!58785 0))(
  ( (array!58786 (arr!28266 (Array (_ BitVec 32) (_ BitVec 64))) (size!28745 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58785)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960395 (= res!642872 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28745 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28745 _keys!1668))))))

(declare-fun b!960396 () Bool)

(assert (=> b!960396 (= e!541380 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33445 0))(
  ( (V!33446 (val!10724 Int)) )
))
(declare-fun minValue!1328 () V!33445)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10192 0))(
  ( (ValueCellFull!10192 (v!13281 V!33445)) (EmptyCell!10192) )
))
(declare-datatypes ((array!58787 0))(
  ( (array!58788 (arr!28267 (Array (_ BitVec 32) ValueCell!10192)) (size!28746 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58787)

(declare-fun lt!430644 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33445)

(declare-datatypes ((tuple2!13836 0))(
  ( (tuple2!13837 (_1!6929 (_ BitVec 64)) (_2!6929 V!33445)) )
))
(declare-datatypes ((List!19656 0))(
  ( (Nil!19653) (Cons!19652 (h!20814 tuple2!13836) (t!28019 List!19656)) )
))
(declare-datatypes ((ListLongMap!12533 0))(
  ( (ListLongMap!12534 (toList!6282 List!19656)) )
))
(declare-fun contains!5381 (ListLongMap!12533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3515 (array!58785 array!58787 (_ BitVec 32) (_ BitVec 32) V!33445 V!33445 (_ BitVec 32) Int) ListLongMap!12533)

(assert (=> b!960396 (= lt!430644 (contains!5381 (getCurrentListMap!3515 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28266 _keys!1668) i!793)))))

(declare-fun b!960397 () Bool)

(declare-fun e!541377 () Bool)

(declare-fun tp_is_empty!21347 () Bool)

(assert (=> b!960397 (= e!541377 tp_is_empty!21347)))

(declare-fun res!642870 () Bool)

(assert (=> start!82368 (=> (not res!642870) (not e!541380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82368 (= res!642870 (validMask!0 mask!2088))))

(assert (=> start!82368 e!541380))

(assert (=> start!82368 true))

(assert (=> start!82368 tp_is_empty!21347))

(declare-fun array_inv!21903 (array!58785) Bool)

(assert (=> start!82368 (array_inv!21903 _keys!1668)))

(declare-fun e!541379 () Bool)

(declare-fun array_inv!21904 (array!58787) Bool)

(assert (=> start!82368 (and (array_inv!21904 _values!1386) e!541379)))

(assert (=> start!82368 tp!64875))

(declare-fun b!960398 () Bool)

(declare-fun res!642871 () Bool)

(assert (=> b!960398 (=> (not res!642871) (not e!541380))))

(declare-datatypes ((List!19657 0))(
  ( (Nil!19654) (Cons!19653 (h!20815 (_ BitVec 64)) (t!28020 List!19657)) )
))
(declare-fun arrayNoDuplicates!0 (array!58785 (_ BitVec 32) List!19657) Bool)

(assert (=> b!960398 (= res!642871 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19654))))

(declare-fun b!960399 () Bool)

(declare-fun e!541376 () Bool)

(assert (=> b!960399 (= e!541376 tp_is_empty!21347)))

(declare-fun mapNonEmpty!34000 () Bool)

(declare-fun mapRes!34000 () Bool)

(declare-fun tp!64874 () Bool)

(assert (=> mapNonEmpty!34000 (= mapRes!34000 (and tp!64874 e!541376))))

(declare-fun mapValue!34000 () ValueCell!10192)

(declare-fun mapRest!34000 () (Array (_ BitVec 32) ValueCell!10192))

(declare-fun mapKey!34000 () (_ BitVec 32))

(assert (=> mapNonEmpty!34000 (= (arr!28267 _values!1386) (store mapRest!34000 mapKey!34000 mapValue!34000))))

(declare-fun b!960400 () Bool)

(assert (=> b!960400 (= e!541379 (and e!541377 mapRes!34000))))

(declare-fun condMapEmpty!34000 () Bool)

(declare-fun mapDefault!34000 () ValueCell!10192)

